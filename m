Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 380391E9F36
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 09:27:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49b6Fm5HpSzDqT8
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jun 2020 17:27:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49b6D56wvBzDq9d
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jun 2020 17:26:08 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49b6Cm45Yyz9v6by;
 Mon,  1 Jun 2020 09:25:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E9SZ1vd2xmBG; Mon,  1 Jun 2020 09:25:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49b6Cm3G3hz9v6bx;
 Mon,  1 Jun 2020 09:25:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 962078B7E5;
 Mon,  1 Jun 2020 09:26:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Jg1AWcYZRYSe; Mon,  1 Jun 2020 09:26:02 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 918388B7E1;
 Mon,  1 Jun 2020 09:26:01 +0200 (CEST)
Subject: Re: [PATCH v5] powerpc/irq: inline call_do_irq() and
 call_do_softirq() on PPC32
To: Michael Ellerman <mpe@ellerman.id.au>
References: <72a6cd86137b2a7ab835213cf5c74df6ed2f6ea7.1575739197.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <dc53f6b9-7e49-08ed-c9ff-4be1f809c65a@csgroup.eu>
Date: Mon, 1 Jun 2020 09:26:00 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <72a6cd86137b2a7ab835213cf5c74df6ed2f6ea7.1575739197.git.christophe.leroy@c-s.fr>
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
Cc: Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Michael,

Le 07/12/2019 à 18:20, Christophe Leroy a écrit :
> call_do_irq() and call_do_softirq() are simple enough to be
> worth inlining.
> 
> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack.
> It also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
> 
> This is inspired from S390 arch. Several other arches do more or
> less the same. The way sparc arch does seems odd thought.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
> Reviewed-by: Segher Boessenkool <segher@kernel.crashing.org>

Anything more I need to do for this patch to get merged ?

Thanks
Christophe


> 
> ---
> v2: no change.
> v3: no change.
> v4:
> - comment reminding the purpose of the inline asm block.
> - added r2 as clobbered reg
> v5:
> - Limiting the change to PPC32 for now.
> - removed r2 from the clobbered regs list (on PPC32 r2 points to current all the time)
> - Removed patch 1 and merged ksp_limit handling in here.
> ---
>   arch/powerpc/include/asm/irq.h |  2 ++
>   arch/powerpc/kernel/irq.c      | 48 ++++++++++++++++++++++++++++++++++++++++++
>   arch/powerpc/kernel/misc_32.S  | 39 ----------------------------------
>   3 files changed, 50 insertions(+), 39 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
> index 814dfab7e392..e4a92f0b4ad4 100644
> --- a/arch/powerpc/include/asm/irq.h
> +++ b/arch/powerpc/include/asm/irq.h
> @@ -56,8 +56,10 @@ extern void *mcheckirq_ctx[NR_CPUS];
>   extern void *hardirq_ctx[NR_CPUS];
>   extern void *softirq_ctx[NR_CPUS];
>   
> +#ifdef CONFIG_PPC64
>   void call_do_softirq(void *sp);
>   void call_do_irq(struct pt_regs *regs, void *sp);
> +#endif
>   extern void do_IRQ(struct pt_regs *regs);
>   extern void __init init_IRQ(void);
>   extern void __do_irq(struct pt_regs *regs);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 5645bc9cbc09..240eca12c71d 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -611,6 +611,54 @@ static inline void check_stack_overflow(void)
>   #endif
>   }
>   
> +#ifdef CONFIG_PPC32
> +static inline void call_do_softirq(const void *sp)
> +{
> +	register unsigned long ret asm("r3");
> +	unsigned long limit = current->thread.ksp_limit;
> +
> +	/* Adjust the stack limit */
> +	current->thread.ksp_limit = (unsigned long)sp;
> +
> +	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
> +	asm volatile(
> +		"	"PPC_STLU"	1, %2(%1);\n"
> +		"	mr		1, %1;\n"
> +		"	bl		%3;\n"
> +		"	"PPC_LL"	1, 0(1);\n" :
> +		"=r"(ret) :
> +		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_softirq) :
> +		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
> +		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
> +
> +	/* Restore stack limit */
> +	current->thread.ksp_limit = limit;
> +}
> +
> +static inline void call_do_irq(struct pt_regs *regs, void *sp)
> +{
> +	register unsigned long r3 asm("r3") = (unsigned long)regs;
> +	unsigned long limit = current->thread.ksp_limit;
> +
> +	/* Adjust the stack limit */
> +	current->thread.ksp_limit = (unsigned long)sp;
> +
> +	/* Temporarily switch r1 to sp, call __do_irq() then restore r1 */
> +	asm volatile(
> +		"	"PPC_STLU"	1, %2(%1);\n"
> +		"	mr		1, %1;\n"
> +		"	bl		%3;\n"
> +		"	"PPC_LL"	1, 0(1);\n" :
> +		"+r"(r3) :
> +		"b"(sp), "i"(THREAD_SIZE - STACK_FRAME_OVERHEAD), "i"(__do_irq) :
> +		"lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6", "cr7",
> +		"r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10", "r11", "r12");
> +
> +	/* Restore stack limit */
> +	current->thread.ksp_limit = limit;
> +}
> +#endif
> +
>   void __do_irq(struct pt_regs *regs)
>   {
>   	unsigned int irq;
> diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
> index d80212be8698..341a3cd199cb 100644
> --- a/arch/powerpc/kernel/misc_32.S
> +++ b/arch/powerpc/kernel/misc_32.S
> @@ -28,45 +28,6 @@
>   	.text
>   
>   /*
> - * We store the saved ksp_limit in the unused part
> - * of the STACK_FRAME_OVERHEAD
> - */
> -_GLOBAL(call_do_softirq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	lwz	r10,THREAD+KSP_LIMIT(r2)
> -	stw	r3, THREAD+KSP_LIMIT(r2)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
> -	mr	r1,r3
> -	stw	r10,8(r1)
> -	bl	__do_softirq
> -	lwz	r10,8(r1)
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	stw	r10,THREAD+KSP_LIMIT(r2)
> -	mtlr	r0
> -	blr
> -
> -/*
> - * void call_do_irq(struct pt_regs *regs, void *sp);
> - */
> -_GLOBAL(call_do_irq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	lwz	r10,THREAD+KSP_LIMIT(r2)
> -	stw	r4, THREAD+KSP_LIMIT(r2)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
> -	mr	r1,r4
> -	stw	r10,8(r1)
> -	bl	__do_irq
> -	lwz	r10,8(r1)
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	stw	r10,THREAD+KSP_LIMIT(r2)
> -	mtlr	r0
> -	blr
> -
> -/*
>    * This returns the high 64 bits of the product of two 64-bit numbers.
>    */
>   _GLOBAL(mulhdu)
> 
