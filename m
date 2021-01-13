Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B11772F4DFB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:56:43 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9WX65nhzDrdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 01:56:40 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9TQ6ZqpzDqLM
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:54:50 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9TK4831z9twtM;
 Wed, 13 Jan 2021 15:54:45 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 3-uNlTmaIsY3; Wed, 13 Jan 2021 15:54:45 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9TK2R3sz9twtL;
 Wed, 13 Jan 2021 15:54:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B45228B7DF;
 Wed, 13 Jan 2021 15:54:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id smYOMey7kQLH; Wed, 13 Jan 2021 15:54:46 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 875868B772;
 Wed, 13 Jan 2021 15:54:46 +0100 (CET)
Subject: Re: [PATCH v5 15/21] powerpc/64s: reconcile interrupts in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-16-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c035e8cc-642b-819a-343e-f7d0b0307315@csgroup.eu>
Date: Wed, 13 Jan 2021 15:54:45 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-16-npiggin@gmail.com>
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



Le 13/01/2021 à 08:32, Nicholas Piggin a écrit :
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 15 +++++++++++----
>   arch/powerpc/kernel/exceptions-64s.S | 26 --------------------------
>   2 files changed, 11 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 34d7cca2cb2e..6eba7c489753 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -14,11 +14,14 @@ struct interrupt_state {
>   
>   static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
>   {
> -#ifdef CONFIG_PPC_BOOK3E_64
> -	state->ctx_state = exception_enter();
> -#endif
> -

Can't the above stay on top of the function ?

> +	/*
> +	 * Book3E reconciles irq soft mask in asm
> +	 */
>   #ifdef CONFIG_PPC_BOOK3S_64
> +	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
> +		trace_hardirqs_off();
> +	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +
>   	if (user_mode(regs)) {
>   		CT_WARN_ON(ct_state() != CONTEXT_USER);
>   		user_exit_irqoff();
> @@ -31,6 +34,10 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
>   	}
>   #endif
> +
> +#ifdef CONFIG_PPC_BOOK3E_64
> +	state->ctx_state = exception_enter();
> +#endif
>   }
>   
>   /*
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 8b0db807974c..df4ee073386b 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -139,7 +139,6 @@ name:
>   #define IKVM_VIRT	.L_IKVM_VIRT_\name\()	/* Virt entry tests KVM */
>   #define ISTACK		.L_ISTACK_\name\()	/* Set regular kernel stack */
>   #define __ISTACK(name)	.L_ISTACK_ ## name
> -#define IRECONCILE	.L_IRECONCILE_\name\()	/* Do RECONCILE_IRQ_STATE */
>   #define IKUAP		.L_IKUAP_\name\()	/* Do KUAP lock */
>   
>   #define INT_DEFINE_BEGIN(n)						\
> @@ -203,9 +202,6 @@ do_define_int n
>   	.ifndef ISTACK
>   		ISTACK=1
>   	.endif
> -	.ifndef IRECONCILE
> -		IRECONCILE=1
> -	.endif
>   	.ifndef IKUAP
>   		IKUAP=1
>   	.endif
> @@ -653,10 +649,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>   	.if ISTACK
>   	ACCOUNT_STOLEN_TIME
>   	.endif
> -
> -	.if IRECONCILE
> -	RECONCILE_IRQ_STATE(r10, r11)
> -	.endif
>   .endm
>   
>   /*
> @@ -935,7 +927,6 @@ INT_DEFINE_BEGIN(system_reset)
>   	 */
>   	ISET_RI=0
>   	ISTACK=0
> -	IRECONCILE=0
>   	IKVM_REAL=1
>   INT_DEFINE_END(system_reset)
>   
> @@ -1123,7 +1114,6 @@ INT_DEFINE_BEGIN(machine_check_early)
>   	ISTACK=0
>   	IDAR=1
>   	IDSISR=1
> -	IRECONCILE=0
>   	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
>   INT_DEFINE_END(machine_check_early)
>   
> @@ -1476,7 +1466,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   INT_DEFINE_BEGIN(data_access_slb)
>   	IVEC=0x380
>   	IAREA=PACA_EXSLB
> -	IRECONCILE=0
>   	IDAR=1
>   	IKVM_SKIP=1
>   	IKVM_REAL=1
> @@ -1503,7 +1492,6 @@ MMU_FTR_SECTION_ELSE
>   	li	r3,-EFAULT
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	std	r3,RESULT(r1)
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
> @@ -1565,7 +1553,6 @@ ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   INT_DEFINE_BEGIN(instruction_access_slb)
>   	IVEC=0x480
>   	IAREA=PACA_EXSLB
> -	IRECONCILE=0
>   	IISIDE=1
>   	IDAR=1
>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
> @@ -1594,7 +1581,6 @@ MMU_FTR_SECTION_ELSE
>   	li	r3,-EFAULT
>   ALT_MMU_FTR_SECTION_END_IFCLR(MMU_FTR_TYPE_RADIX)
>   	std	r3,RESULT(r1)
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_bad_slb_fault
>   	b	interrupt_return
> @@ -1754,7 +1740,6 @@ EXC_COMMON_BEGIN(program_check_common)
>    */
>   INT_DEFINE_BEGIN(fp_unavailable)
>   	IVEC=0x800
> -	IRECONCILE=0
>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>   	IKVM_REAL=1
>   #endif
> @@ -1769,7 +1754,6 @@ EXC_VIRT_END(fp_unavailable, 0x4800, 0x100)
>   EXC_COMMON_BEGIN(fp_unavailable_common)
>   	GEN_COMMON fp_unavailable
>   	bne	1f			/* if from user, just load it up */
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	kernel_fp_unavailable_exception
>   0:	trap
> @@ -1788,7 +1772,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>   	b	fast_interrupt_return
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   2:	/* User process was in a transaction */
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	fp_unavailable_tm
>   	b	interrupt_return
> @@ -1853,7 +1836,6 @@ INT_DEFINE_BEGIN(hdecrementer)
>   	IVEC=0x980
>   	IHSRR=1
>   	ISTACK=0
> -	IRECONCILE=0
>   	IKVM_REAL=1
>   	IKVM_VIRT=1
>   INT_DEFINE_END(hdecrementer)
> @@ -2227,7 +2209,6 @@ INT_DEFINE_BEGIN(hmi_exception_early)
>   	IHSRR=1
>   	IREALMODE_COMMON=1
>   	ISTACK=0
> -	IRECONCILE=0
>   	IKUAP=0 /* We don't touch AMR here, we never go to virtual mode */
>   	IKVM_REAL=1
>   INT_DEFINE_END(hmi_exception_early)
> @@ -2401,7 +2382,6 @@ EXC_COMMON_BEGIN(performance_monitor_common)
>    */
>   INT_DEFINE_BEGIN(altivec_unavailable)
>   	IVEC=0xf20
> -	IRECONCILE=0
>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>   	IKVM_REAL=1
>   #endif
> @@ -2431,7 +2411,6 @@ BEGIN_FTR_SECTION
>   	b	fast_interrupt_return
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   2:	/* User process was in a transaction */
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	altivec_unavailable_tm
>   	b	interrupt_return
> @@ -2439,7 +2418,6 @@ BEGIN_FTR_SECTION
>   1:
>   END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   #endif
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	altivec_unavailable_exception
>   	b	interrupt_return
> @@ -2455,7 +2433,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>    */
>   INT_DEFINE_BEGIN(vsx_unavailable)
>   	IVEC=0xf40
> -	IRECONCILE=0
>   #ifdef CONFIG_KVM_BOOK3S_PR_POSSIBLE
>   	IKVM_REAL=1
>   #endif
> @@ -2484,7 +2461,6 @@ BEGIN_FTR_SECTION
>   	b	load_up_vsx
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   2:	/* User process was in a transaction */
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	vsx_unavailable_tm
>   	b	interrupt_return
> @@ -2492,7 +2468,6 @@ BEGIN_FTR_SECTION
>   1:
>   END_FTR_SECTION_IFSET(CPU_FTR_VSX)
>   #endif
> -	RECONCILE_IRQ_STATE(r10, r11)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	vsx_unavailable_exception
>   	b	interrupt_return
> @@ -2827,7 +2802,6 @@ EXC_VIRT_NONE(0x5800, 0x100)
>   INT_DEFINE_BEGIN(soft_nmi)
>   	IVEC=0x900
>   	ISTACK=0
> -	IRECONCILE=0	/* Soft-NMI may fire under local_irq_disable */
>   INT_DEFINE_END(soft_nmi)
>   
>   /*
> 
