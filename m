Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF491A2F10
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 08:13:31 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yW6Z4TFJzDrB0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 16:13:26 +1000 (AEST)
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
 header.s=mail header.b=dEeGbWHx; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48yW4r4fM9zDr7F
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 16:11:55 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48yW4k22n6z9tyRt;
 Thu,  9 Apr 2020 08:11:50 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=dEeGbWHx; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Uf0iU3TC68E1; Thu,  9 Apr 2020 08:11:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48yW4k0vZsz9tyRs;
 Thu,  9 Apr 2020 08:11:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1586412710; bh=eEVWh0w/xzPF6e8vsa1O1hmb8YBKVYPGwGCLX+aJdJA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=dEeGbWHxq1cBxb/dvHP3aOQJnYr7ElqZ2UYIH2HDK82q+y3oSqbE8PDF7haLEkS+l
 6fyqo/T8RiQ4z798HdIQd1Sk2VNsdMonDxYaDGXj0+D2K0fFBN7jz6DRYQxMpy/RX1
 fFSvZiX5b8iBDp2ZlZR9fQl1OhejIvVKswQsh6ck=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0DD1C8B77F;
 Thu,  9 Apr 2020 08:11:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id S1x7Tphfied7; Thu,  9 Apr 2020 08:11:50 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F3CE68B75B;
 Thu,  9 Apr 2020 08:11:49 +0200 (CEST)
Subject: Re: [PATCH v5 02/21] powerpc/xmon: Move out-of-line instructions to
 text section
To: Jordan Niethe <jniethe5@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200406080936.7180-1-jniethe5@gmail.com>
 <20200406080936.7180-3-jniethe5@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <a6adbfc6-a715-99aa-25ac-7a36b3804b82@c-s.fr>
Date: Thu, 9 Apr 2020 08:11:28 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200406080936.7180-3-jniethe5@gmail.com>
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
Cc: bala24@linux.ibm.com, alistair@popple.id.au, dja@axtens.net,
 npiggin@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 06/04/2020 à 10:09, Jordan Niethe a écrit :
> To execute an instruction out of line after a breakpoint, the NIP is set
> to the address of struct bpt::instr. Here a copy of the instruction that
> was replaced with a breakpoint is kept, along with a trap so normal flow
> can be resumed after XOLing. The struct bpt's are located within the
> data section. This is problematic as the data section may be marked as
> no execute.
> 
> Instead of each struct bpt holding the instructions to be XOL'd, make a
> new array, bpt_table[], with enough space to hold instructions for the
> number of supported breakpoints. Place this array in the text section.
> Make struct bpt::instr a pointer to the instructions in bpt_table[]
> associated with that breakpoint. This association is a simple mapping:
> bpts[n] -> bpt_table[n * words per breakpoint]. Currently we only need
> the copied instruction followed by a trap, so 2 words per breakpoint.
> 
> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
> ---
> v4: New to series
> v5: - Do not use __section(), use a .space directive in .S file

I was going to comment to use __section() instead of creating a 
dedicated .S file.

Why did you change that in v5 ?

>      - Simplify in_breakpoint_table() calculation
>      - Define BPT_SIZE
> ---
>   arch/powerpc/xmon/Makefile    |  2 +-
>   arch/powerpc/xmon/xmon.c      | 23 +++++++++++++----------
>   arch/powerpc/xmon/xmon_bpts.S |  8 ++++++++
>   arch/powerpc/xmon/xmon_bpts.h |  8 ++++++++
>   4 files changed, 30 insertions(+), 11 deletions(-)
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.S
>   create mode 100644 arch/powerpc/xmon/xmon_bpts.h
> 
> diff --git a/arch/powerpc/xmon/Makefile b/arch/powerpc/xmon/Makefile
> index c3842dbeb1b7..515a13ea6f28 100644
> --- a/arch/powerpc/xmon/Makefile
> +++ b/arch/powerpc/xmon/Makefile
> @@ -21,7 +21,7 @@ endif
>   
>   ccflags-$(CONFIG_PPC64) := $(NO_MINIMAL_TOC)
>   
> -obj-y			+= xmon.o nonstdio.o spr_access.o
> +obj-y			+= xmon.o nonstdio.o spr_access.o xmon_bpts.o
>   
>   ifdef CONFIG_XMON_DISASSEMBLY
>   obj-y			+= ppc-dis.o ppc-opc.o
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 02e3bd62cab4..049375206510 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -62,6 +62,7 @@
>   
>   #include "nonstdio.h"
>   #include "dis-asm.h"
> +#include "xmon_bpts.h"
>   
>   #ifdef CONFIG_SMP
>   static cpumask_t cpus_in_xmon = CPU_MASK_NONE;
> @@ -97,7 +98,7 @@ static long *xmon_fault_jmp[NR_CPUS];
>   /* Breakpoint stuff */
>   struct bpt {
>   	unsigned long	address;
> -	unsigned int	instr[2];
> +	unsigned int	*instr;
>   	atomic_t	ref_count;
>   	int		enabled;
>   	unsigned long	pad;
> @@ -108,7 +109,6 @@ struct bpt {
>   #define BP_TRAP		2
>   #define BP_DABR		4
>   
> -#define NBPTS	256
>   static struct bpt bpts[NBPTS];
>   static struct bpt dabr;
>   static struct bpt *iabr;
> @@ -116,6 +116,10 @@ static unsigned bpinstr = 0x7fe00008;	/* trap */
>   
>   #define BP_NUM(bp)	((bp) - bpts + 1)
>   
> +#define BPT_SIZE	(sizeof(unsigned int) * 2)
> +#define BPT_WORDS	(BPT_SIZE / sizeof(unsigned int))

Wouldn't it make more sense to do the following ? :

#define BPT_WORDS	2
#define BPT_SIZE 	(BPT_WORDS * sizeof(unsigned int))

> +extern unsigned int bpt_table[NBPTS * BPT_WORDS];

Should go in xmon_bpts.h if we keep the definition in xmon_bpts.S

> +
>   /* Prototypes */
>   static int cmds(struct pt_regs *);
>   static int mread(unsigned long, void *, int);
> @@ -853,15 +857,13 @@ static struct bpt *in_breakpoint_table(unsigned long nip, unsigned long *offp)
>   {
>   	unsigned long off;
>   
> -	off = nip - (unsigned long) bpts;
> -	if (off >= sizeof(bpts))
> +	off = nip - (unsigned long) bpt_table;
> +	if (off >= sizeof(bpt_table))
>   		return NULL;
> -	off %= sizeof(struct bpt);
> -	if (off != offsetof(struct bpt, instr[0])
> -	    && off != offsetof(struct bpt, instr[1]))
> +	*offp = off % BPT_SIZE;

Can we use logical operation instead ?

	*offp = off & (BPT_SIZE - 1);

> +	if (*offp != 0 && *offp != 4)

Could be:
	if (off & 3)

>   		return NULL;
> -	*offp = off - offsetof(struct bpt, instr[0]);
> -	return (struct bpt *) (nip - off);
> +	return bpts + (off / BPT_SIZE);
>   }
>   
>   static struct bpt *new_breakpoint(unsigned long a)
> @@ -876,7 +878,8 @@ static struct bpt *new_breakpoint(unsigned long a)
>   	for (bp = bpts; bp < &bpts[NBPTS]; ++bp) {
>   		if (!bp->enabled && atomic_read(&bp->ref_count) == 0) {
>   			bp->address = a;
> -			patch_instruction(&bp->instr[1], bpinstr);
> +			bp->instr = bpt_table + ((bp - bpts) * BPT_WORDS);
> +			patch_instruction(bp->instr + 1, bpinstr);
>   			return bp;
>   		}
>   	}
> diff --git a/arch/powerpc/xmon/xmon_bpts.S b/arch/powerpc/xmon/xmon_bpts.S
> new file mode 100644
> index 000000000000..ebb2dbc70ca8
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.S
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#include <asm/ppc_asm.h>
> +#include <asm/asm-compat.h>
> +#include "xmon_bpts.h"
> +
> +.global bpt_table
> +bpt_table:
> +	.space NBPTS * 8

Should use BPT_SIZE instead of raw coding 8.

> diff --git a/arch/powerpc/xmon/xmon_bpts.h b/arch/powerpc/xmon/xmon_bpts.h
> new file mode 100644
> index 000000000000..840e70be7945
> --- /dev/null
> +++ b/arch/powerpc/xmon/xmon_bpts.h
> @@ -0,0 +1,8 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef XMON_BPTS_H
> +#define XMON_BPTS_H
> +
> +#define NBPTS	256
> +
> +#endif /* XMON_BPTS_H */
> +
> 

I think it would be better to split this patch in two patches:
1/ First patch to move breakpoints out of struct bpt into a bpt_table.
2/ Second patch to move bpt_table into .text section.

Christophe
