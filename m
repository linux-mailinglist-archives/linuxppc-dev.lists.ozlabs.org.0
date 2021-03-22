Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E7834492C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Mar 2021 16:25:59 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F3yxx5kw2z3bcN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Mar 2021 02:25:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F3yxN37mhz30Cy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Mar 2021 02:25:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F3yx93j9Tz9tyQm;
 Mon, 22 Mar 2021 16:25:17 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id C6Gl5N5PG0H7; Mon, 22 Mar 2021 16:25:17 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F3yx92ctLz9tyQR;
 Mon, 22 Mar 2021 16:25:17 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DCAF38B7A5;
 Mon, 22 Mar 2021 16:25:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pG7t4HJR04sX; Mon, 22 Mar 2021 16:25:22 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 774118B79C;
 Mon, 22 Mar 2021 16:25:22 +0100 (CET)
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210320122227.345427-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <d2217b4e-718b-674d-c6a0-2cb69e3fd81c@csgroup.eu>
Date: Mon, 22 Mar 2021 16:25:16 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210320122227.345427-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/03/2021 à 13:22, Michael Ellerman a écrit :
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> call_do_irq() and call_do_softirq() are simple enough to be
> worth inlining.
> 
> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
> also allows GCC to keep the saved ksp_limit in an nonvolatile reg.

We don't have the ksp_limit anymore, I forgot to remove the above text.

> 
> This is inspired from S390 arch. Several other arches do more or
> less the same. The way sparc arch does seems odd thought.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> 
> v2: no change.
> v3: no change.
> v4:
> - comment reminding the purpose of the inline asm block.
> - added r2 as clobbered reg
> v5:
> - Limiting the change to PPC32 for now.
> - removed r2 from the clobbered regs list (on PPC32 r2 points to current all the time)
> - Removed patch 1 and merged ksp_limit handling in here.
> v6:
> - Rebase on top of merge-test (ca6e327fefb2).
> - Remove the ksp_limit stuff as it's doesn't exist anymore.
> 
> v7:
> mpe:
> - Enable for 64-bit too. This all in-kernel code calling in-kernel
>    code, and must use the kernel TOC.

Great.

> - Use named parameters for the inline asm.

Hmm. It is the first time we use named parameters in powerpc assembly, isn't it ?
I saw when investigating userspace access that x86 is using named parameters widely.

Wondering, how would the below look like with named parameters (from __put_user_asm2_goto) ?

	stw%X1 %L0, %L1

> - Reformat inline asm.
> - Mark as always_inline.
> - Drop unused ret from call_do_softirq(), add r3 as clobbered.
> ---
>   arch/powerpc/include/asm/irq.h |  2 --
>   arch/powerpc/kernel/irq.c      | 41 ++++++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/misc_32.S  | 25 ---------------------
>   arch/powerpc/kernel/misc_64.S  | 22 ------------------
>   4 files changed, 41 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
> index f3f264e441a7..b2bd58830430 100644
> --- a/arch/powerpc/include/asm/irq.h
> +++ b/arch/powerpc/include/asm/irq.h
> @@ -53,8 +53,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
>   extern void *hardirq_ctx[NR_CPUS];
>   extern void *softirq_ctx[NR_CPUS];
>   
> -void call_do_softirq(void *sp);
> -void call_do_irq(struct pt_regs *regs, void *sp);
>   extern void do_IRQ(struct pt_regs *regs);
>   extern void __init init_IRQ(void);
>   extern void __do_irq(struct pt_regs *regs);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 5b72abbff96c..260effc0a435 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -667,6 +667,47 @@ static inline void check_stack_overflow(void)
>   	}
>   }
>   
> +static __always_inline void call_do_softirq(const void *sp)
> +{
> +	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
> +	asm volatile (
> +		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
> +		"mr		%%r1, %[sp]		;"
> +		"bl		%[callee]		;"
> +		 PPC_LL "	%%r1, 0(%%r1)		;"
> +		 : // Outputs
> +		 : // Inputs
> +		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
> +		   [callee] "i" (__do_softirq)
> +		 : // Clobbers
> +		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
> +		   "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +		   "r11", "r12"
> +	);
> +}
> +
> +static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
> +{
> +	register unsigned long r3 asm("r3") = (unsigned long)regs;
> +
> +	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
> +	asm volatile (
> +		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
> +		"mr		%%r1, %[sp]		;"
> +		"bl		%[callee]		;"
> +		 PPC_LL "	%%r1, 0(%%r1)		;"
> +		 : // Outputs
> +		   "+r" (r3)
> +		 : // Inputs
> +		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
> +		   [callee] "i" (__do_irq)
> +		 : // Clobbers
> +		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
> +		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +		   "r11", "r12"
> +	);
> +}
> +
>   void __do_irq(struct pt_regs *regs)
>   {
>   	unsigned int irq;
> diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
> index acc410043b96..6a076bef2932 100644
> --- a/arch/powerpc/kernel/misc_32.S
> +++ b/arch/powerpc/kernel/misc_32.S
> @@ -27,31 +27,6 @@
>   
>   	.text
>   
> -_GLOBAL(call_do_softirq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
> -	mr	r1,r3
> -	bl	__do_softirq
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	mtlr	r0
> -	blr
> -
> -/*
> - * void call_do_irq(struct pt_regs *regs, void *sp);
> - */
> -_GLOBAL(call_do_irq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
> -	mr	r1,r4
> -	bl	__do_irq
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	mtlr	r0
> -	blr
> -
>   /*
>    * This returns the high 64 bits of the product of two 64-bit numbers.
>    */
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 070465825c21..4b761a18a74d 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -27,28 +27,6 @@
>   
>   	.text
>   
> -_GLOBAL(call_do_softirq)
> -	mflr	r0
> -	std	r0,16(r1)
> -	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
> -	mr	r1,r3
> -	bl	__do_softirq
> -	ld	r1,0(r1)
> -	ld	r0,16(r1)
> -	mtlr	r0
> -	blr
> -
> -_GLOBAL(call_do_irq)
> -	mflr	r0
> -	std	r0,16(r1)
> -	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
> -	mr	r1,r4
> -	bl	__do_irq
> -	ld	r1,0(r1)
> -	ld	r0,16(r1)
> -	mtlr	r0
> -	blr
> -
>   _GLOBAL(__bswapdi2)
>   EXPORT_SYMBOL(__bswapdi2)
>   	srdi	r8,r3,32
> 
