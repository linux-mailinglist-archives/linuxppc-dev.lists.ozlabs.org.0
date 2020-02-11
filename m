Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 42820158A05
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 07:34:17 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48GtKL18mQzDqK3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2020 17:34:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=dg2bR0ue; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48GtHJ3R25zDqJc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2020 17:32:28 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48GtHD30zSz9v4jp;
 Tue, 11 Feb 2020 07:32:24 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dg2bR0ue; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QePTjZDkWsrB; Tue, 11 Feb 2020 07:32:24 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48GtHD1ZYjz9v4jn;
 Tue, 11 Feb 2020 07:32:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1581402744; bh=Zvca1jzB8Zc9JhG1c0PiI2rn411/q6ojWIo2+S+Xv5o=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dg2bR0ueFDuFZM2j/cKOykG1kQM0yN4NCZ0poHlTcFLau96HajJCBINdXwSRl0GTA
 T+UMPdIgcUVWhEEUaf5L5NCO50uzMOwlInuW0iWc1HrXpB02EUeH3dWfwTRu6RoErj
 aKzpWZmzbUrbDsPiBbjoGuE0kyXCQoVSK/Kzgh0w=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 093D78B78A;
 Tue, 11 Feb 2020 07:32:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nqbFOEWH__Ql; Tue, 11 Feb 2020 07:32:24 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A2518B776;
 Tue, 11 Feb 2020 07:32:24 +0100 (CET)
Subject: Re: [PATCH v2 08/13] powerpc/xmon: Add initial support for prefixed
 instructions
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200211053355.21574-1-jniethe5@gmail.com>
 <20200211053355.21574-9-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <26ce79f5-2003-350d-283a-bfb9ae18b075@c-s.fr>
Date: Tue, 11 Feb 2020 07:32:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200211053355.21574-9-jniethe5@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
Content-Transfer-Encoding: 8bit
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, mpe@ellerman.id.a,
 dja@axtens.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 11/02/2020 à 06:33, Jordan Niethe a écrit :
> A prefixed instruction is composed of a word prefix and a word suffix.
> It does not make sense to be able to have a breakpoint on the suffix of
> a prefixed instruction, so make this impossible.
> 
> When leaving xmon_core() we check to see if we are currently at a
> breakpoint. If this is the case, the breakpoint needs to be proceeded
> from. Initially emulate_step() is tried, but if this fails then we need
> to execute the saved instruction out of line. The NIP is set to the
> address of bpt::instr[] for the current breakpoint.  bpt::instr[]
> contains the instruction replaced by the breakpoint, followed by a trap
> instruction.  After bpt::instr[0] is executed and we hit the trap we
> enter back into xmon_bpt(). We know that if we got here and the offset
> indicates we are at bpt::instr[1] then we have just executed out of line
> so we can put the NIP back to the instruction after the breakpoint
> location and continue on.
> 
> Adding prefixed instructions complicates this as the bpt::instr[1] needs
> to be used to hold the suffix. To deal with this make bpt::instr[] big
> enough for three word instructions.  bpt::instr[2] contains the trap,
> and in the case of word instructions pad bpt::instr[1] with a noop.
> 
> No support for disassembling prefixed instructions.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v2: Rename sufx to suffix
> ---
>   arch/powerpc/xmon/xmon.c | 82 ++++++++++++++++++++++++++++++++++------
>   1 file changed, 71 insertions(+), 11 deletions(-)
> 
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 897e512c6379..0b085642bbe7 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -97,7 +97,8 @@ static long *xmon_fault_jmp[NR_CPUS];
>   /* Breakpoint stuff */
>   struct bpt {
>   	unsigned long	address;
> -	unsigned int	instr[2];
> +	/* Prefixed instructions can not cross 64-byte boundaries */
> +	unsigned int	instr[3] __aligned(64);
>   	atomic_t	ref_count;
>   	int		enabled;
>   	unsigned long	pad;
> @@ -113,6 +114,7 @@ static struct bpt bpts[NBPTS];
>   static struct bpt dabr;
>   static struct bpt *iabr;
>   static unsigned bpinstr = 0x7fe00008;	/* trap */
> +static unsigned nopinstr = 0x60000000;	/* nop */

Use PPC_INST_NOP instead of 0x60000000

And this nopinstr variable will never change. Why not use directly 
PPC_INST_NOP  in the code ?

>   
>   #define BP_NUM(bp)	((bp) - bpts + 1)
>   
> @@ -120,6 +122,7 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
>   static int cmds(struct pt_regs *);
>   static int mread(unsigned long, void *, int);
>   static int mwrite(unsigned long, void *, int);
> +static int read_instr(unsigned long, unsigned int *, unsigned int *);
>   static int handle_fault(struct pt_regs *);
>   static void byterev(unsigned char *, int);
>   static void memex(void);
> @@ -706,7 +709,7 @@ static int xmon_core(struct pt_regs *regs, int fromipi)
>   		bp = at_breakpoint(regs->nip);
>   		if (bp != NULL) {
>   			int stepped = emulate_step(regs, bp->instr[0],
> -						   PPC_NO_SUFFIX);
> +						   bp->instr[1]);
>   			if (stepped == 0) {
>   				regs->nip = (unsigned long) &bp->instr[0];
>   				atomic_inc(&bp->ref_count);
> @@ -761,8 +764,8 @@ static int xmon_bpt(struct pt_regs *regs)
>   
>   	/* Are we at the trap at bp->instr[1] for some bp? */
>   	bp = in_breakpoint_table(regs->nip, &offset);
> -	if (bp != NULL && offset == 4) {
> -		regs->nip = bp->address + 4;
> +	if (bp != NULL && (offset == 4 || offset == 8)) {
> +		regs->nip = bp->address + offset;
>   		atomic_dec(&bp->ref_count);
>   		return 1;
>   	}
> @@ -864,7 +867,8 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
>   		return NULL;
>   	off %= sizeof(struct bpt);
>   	if (off != offsetof(struct bpt, instr[0])
> -	    && off != offsetof(struct bpt, instr[1]))
> +	    && off != offsetof(struct bpt, instr[1])
> +	    && off != offsetof(struct bpt, instr[2]))
>   		return NULL;
>   	*offp = off - offsetof(struct bpt, instr[0]);
>   	return (struct bpt *) (nip - off);
> @@ -881,9 +885,18 @@ static struct bpt *new_breakpoint(unsigned long a)
>   
>   	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
>   		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
> +			/*
> +			 * Prefixed instructions are two words, but regular
> +			 * instructions are only one. Use a nop to pad out the
> +			 * regular instructions so that we can place the trap
> +			 * at the same plac. For prefixed instructions the nop

plac ==> place

> +			 * will get overwritten during insert_bpts().
> +			 */
>   			bp->address = a;
> -			bp->instr[1] = bpinstr;
> +			bp->instr[1] = nopinstr;
>   			store_inst(&bp->instr[1]);
> +			bp->instr[2] = bpinstr;
> +			store_inst(&bp->instr[2]);
>   			return bp;

Not directly related to this patch, but shouldn't we use 
patch_instruction() instead ?

>   		}
>   	}
> @@ -895,13 +908,15 @@ static struct bpt *new_breakpoint(unsigned long a)
>   static void insert_bpts(void)
>   {
>   	int i;
> -	struct bpt *bp;
> +	unsigned int prefix;
> +	struct bpt *bp, *bp2;
>   
>   	bp = bpts;
>   	for (i = 0; i < NBPTS; ++i, ++bp) {
>   		if ((bp->enabled & (BP_TRAP|BP_CIABR)) == 0)
>   			continue;
> -		if (mread(bp->address, &bp->instr[0], 4) != 4) {
> +		if (!read_instr(bp->address, &bp->instr[0],
> +			       &bp->instr[1])) {
>   			printf("Couldn't read instruction at %lx, "
>   			       "disabling breakpoint there\n", bp->address);
>   			bp->enabled = 0;
> @@ -913,7 +928,34 @@ static void insert_bpts(void)
>   			bp->enabled = 0;
>   			continue;
>   		}
> +		/*
> +		 * Check the address is not a suffix by looking for a prefix in
> +		 * front of it.
> +		 */
> +		if ((mread(bp->address - 4, &prefix, 4) == 4) &&
> +		    IS_PREFIX(prefix)) {
> +			printf("Breakpoint at %lx is on the second word of a "
> +			       "prefixed instruction, disabling it\n",
> +			       bp->address);
> +			bp->enabled = 0;
> +			continue;
> +		}
> +		/*
> +		 * We might still be a suffix - if the prefix has already been
> +		 * replaced by a breakpoint we won't catch it with the above
> +		 * test.
> +		 */
> +		bp2 = at_breakpoint(bp->address - 4);
> +		if (bp2 && IS_PREFIX(bp2->instr[0])) {
> +			printf("Breakpoint at %lx is on the second word of a "
> +			       "prefixed instruction, disabling it\n",
> +			       bp->address);
> +			bp->enabled = 0;
> +			continue;
> +		}
>   		store_inst(&bp->instr[0]);
> +		if (IS_PREFIX(bp->instr[0]))
> +			store_inst(&bp->instr[1]);
>   		if (bp->enabled & BP_CIABR)
>   			continue;
>   		if (patch_instruction((unsigned int *)bp->address,
> @@ -1164,14 +1206,14 @@ static int do_step(struct pt_regs *regs)
>    */
>   static int do_step(struct pt_regs *regs)
>   {
> -	unsigned int instr;
> +	unsigned int instr, suffix;
>   	int stepped;
>   
>   	force_enable_xmon();
>   	/* check we are in 64-bit kernel mode, translation enabled */
>   	if ((regs->msr & (MSR_64BIT|MSR_PR|MSR_IR)) == (MSR_64BIT|MSR_IR)) {
> -		if (mread(regs->nip, &instr, 4) == 4) {
> -			stepped = emulate_step(regs, instr, PPC_NO_SUFFIX);
> +		if (read_instr(regs->nip, &instr, &suffix)) {
> +			stepped = emulate_step(regs, instr, suffix);
>   			if (stepped < 0) {
>   				printf("Couldn't single-step %s instruction\n",
>   				       (IS_RFID(instr)? "rfid": "mtmsrd"));
> @@ -2130,6 +2172,24 @@ mwrite(unsigned long adrs, void *buf, int size)
>   	return n;
>   }
>   
> +static int read_instr(unsigned long addr, unsigned int *instr,
> +		      unsigned int *suffix)
> +{

Don't know if it is worth it, but wouldn't it be better to define a 
mread_inst() based on mread() instead of doing something that chain 
calls to mread()

> +	int r;
> +
> +	r = mread(addr, instr, 4);
> +	if (r != 4)
> +		return 0;
> +	if (!IS_PREFIX(*instr))
> +		return 4;
> +	r = mread(addr + 4, suffix, 4);
> +	if (r != 4)
> +		return 0;
> +
> +	return 8;
> +}
> +
> +
>   static int fault_type;
>   static int fault_except;
>   static char *fault_chars[] = { "--", "**", "##" };
> 

Christophe
