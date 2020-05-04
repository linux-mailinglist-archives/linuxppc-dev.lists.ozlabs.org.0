Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D50D91C3257
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 07:42:37 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49FsFR055XzDqVL
	for <lists+linuxppc-dev@lfdr.de>; Mon,  4 May 2020 15:42:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49FsCm1FsszDqT2
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  4 May 2020 15:41:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=popple.id.au
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 49FsCk70PZz9sSc;
 Mon,  4 May 2020 15:41:06 +1000 (AEST)
From: Alistair Popple <alistair@popple.id.au>
To: Jordan Niethe <jniethe5@gmail.com>
Subject: Re: [PATCH v7 02/28] powerpc/xmon: Move breakpoint instructions to
 own array
Date: Mon, 04 May 2020 15:41:03 +1000
Message-ID: <2060873.nxaIYQu1l1@townsend>
In-Reply-To: <20200501034220.8982-3-jniethe5@gmail.com>
References: <20200501034220.8982-1-jniethe5@gmail.com>
 <20200501034220.8982-3-jniethe5@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: npiggin@gmail.com, bala24@linux.ibm.com, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Friday, 1 May 2020 1:41:54 PM AEST Jordan Niethe wrote:
> To execute an instruction out of line after a breakpoint, the NIP is set
> to the address of struct bpt::instr. Here a copy of the instruction that
> was replaced with a breakpoint is kept, along with a trap so normal flow
> can be resumed after XOLing. The struct bpt's are located within the
> data section. This is problematic as the data section may be marked as
> no execute.
> 
> Instead of each struct bpt holding the instructions to be XOL'd, make a
> new array, bpt_table[], with enough space to hold instructions for the
> number of supported breakpoints. A later patch will move this to the
> text section.
> Make struct bpt::instr a pointer to the instructions in bpt_table[]
> associated with that breakpoint. This association is a simple mapping:
> bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> the copied instruction followed by a trap, so 2 words per breakpoint.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v5: - Do not use __section(), use a .space directive in .S file
>     - Simplify in_breakpoint_table() calculation
>     - Define BPT_SIZE
> v6: - Seperate moving to text section
> ---
>  arch/powerpc/xmon/xmon.c | 21 ++++++++++++---------
>  1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index f91ae2c9adbe..6ba7f66c1dd0 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -98,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
>  /* Breakpoint stuff */
>  struct bpt {
>  	unsigned long	address;
> -	unsigned int	instr[2];
> +	unsigned int	*instr;
>  	atomic_t	ref_count;
>  	int		enabled;
>  	unsigned long	pad;
> @@ -117,6 +117,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
> 
>  #define BP_NUM(bp)	((bp) - bpts + 1)
> 
> +#define BPT_SIZE       (sizeof(unsigned int) * 2)
> +#define BPT_WORDS      (BPT_SIZE / sizeof(unsigned int))

Minor nit-pick but IMHO this would be more logical if you defined BPT_WORDS 
first like so:

#define BPT_WORDS      (2)
#define BPT_SIZE       (sizeof(unsigned int) * BPT_WORDS)

Otherwise this looks good and I think the offset calculations below are correct 
so:

Reviewed-by: Alistair Popple <alistair@popple.id.au>

> +static unsigned int bpt_table[NBPTS * BPT_WORDS];
> +
>  /* Prototypes */
>  static int cmds(struct pt_regs *);
>  static int mread(unsigned long, void *, int);
> @@ -854,15 +858,13 @@ static struct bpt *in_breakpoint_table(unsigned long
> nip, unsigned long *offp) {
>  	unsigned long off;
> 
> -	off = nip - (unsigned long) bpts;
> -	if (off >= sizeof(bpts))
> +	off = nip - (unsigned long) bpt_table;
> +	if (off >= sizeof(bpt_table))
>  		return NULL;
> -	off %= sizeof(struct bpt);
> -	if (off != offsetof(struct bpt, instr[0])
> -	    && off != offsetof(struct bpt, instr[1]))
> +	*offp = off % BPT_SIZE;
> +	if (*offp != 0 && *offp != 4)
>  		return NULL;
> -	*offp = off - offsetof(struct bpt, instr[0]);
> -	return (struct bpt *) (nip - off);
> +	return bpts + (off / BPT_SIZE);
>  }
> 
>  static struct bpt *new_breakpoint(unsigned long a)
> @@ -877,7 +879,8 @@ static struct bpt *new_breakpoint(unsigned long a)
>  	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
>  		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
>  			bp->address = a;
> -			patch_instruction(&bp->instr[1], bpinstr);
> +			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> +			patch_instruction(bp->instr + 1, bpinstr);
>  			return bp;
>  		}
>  	}




