Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 69BB833AC83
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 08:51:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzTBF30Jwz2ym4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 18:51:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzT9v2vZqz2yR4
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 18:50:39 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzT9c5mXDz9tyDG;
 Mon, 15 Mar 2021 08:50:28 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vKpD-afCYxgp; Mon, 15 Mar 2021 08:50:28 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzT9c4fTyz9tyDF;
 Mon, 15 Mar 2021 08:50:28 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 3FDD38B774;
 Mon, 15 Mar 2021 08:50:33 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xTEm8cbGe9WR; Mon, 15 Mar 2021 08:50:33 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0E25E8B773;
 Mon, 15 Mar 2021 08:50:33 +0100 (CET)
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <186d3513-d7ab-a658-cdb2-6fe5146c1fc4@csgroup.eu>
Date: Mon, 15 Mar 2021 08:50:28 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315031716.3940350-4-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 04:17, Nicholas Piggin a écrit :
> Update the new C and asm interrupt return code to account for 64e
> specifics, switch over to use it.
> 
> The now-unused old ret_from_except code, that was moved to 64e after the
> 64s conversion, is removed.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>   arch/powerpc/kernel/entry_64.S            |   9 +-
>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>   arch/powerpc/kernel/interrupt.c           |  27 +-
>   arch/powerpc/kernel/irq.c                 |  76 -----
>   5 files changed, 56 insertions(+), 379 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index 939f3c94c8f3..1c7b75834e04 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -77,8 +77,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>   long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
>   		      u32 len_high, u32 len_low);
>   long sys_switch_endian(void);
> -notrace unsigned int __check_irq_replay(void);
> -void notrace restore_interrupts(void);
>   
>   /* prom_init (OpenFirmware) */
>   unsigned long __init prom_init(unsigned long r3, unsigned long r4,
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 853534b2ae2e..555b3d0a3f38 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -632,7 +632,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_ARCH_207S)
>   	addi	r1,r1,SWITCH_FRAME_SIZE
>   	blr
>   
> -#ifdef CONFIG_PPC_BOOK3S
>   	/*
>   	 * If MSR EE/RI was never enabled, IRQs not reconciled, NVGPRs not
>   	 * touched, no exit work created, then this can be used.
> @@ -644,6 +643,7 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>   	kuap_check_amr r3, r4
>   	ld	r5,_MSR(r1)
>   	andi.	r0,r5,MSR_PR
> +#ifdef CONFIG_PPC_BOOK3S
>   	bne	.Lfast_user_interrupt_return_amr
>   	kuap_kernel_restore r3, r4
>   	andi.	r0,r5,MSR_RI
> @@ -652,6 +652,10 @@ _ASM_NOKPROBE_SYMBOL(fast_interrupt_return)
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	unrecoverable_exception
>   	b	. /* should not get here */
> +#else
> +	bne	.Lfast_user_interrupt_return
> +	b	.Lfast_kernel_interrupt_return
> +#endif
>   
>   	.balign IFETCH_ALIGN_BYTES
>   	.globl interrupt_return
> @@ -665,8 +669,10 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
>   	cmpdi	r3,0
>   	bne-	.Lrestore_nvgprs
>   
> +#ifdef CONFIG_PPC_BOOK3S
>   .Lfast_user_interrupt_return_amr:
>   	kuap_user_restore r3, r4
> +#endif
>   .Lfast_user_interrupt_return:
>   	ld	r11,_NIP(r1)
>   	ld	r12,_MSR(r1)
> @@ -775,7 +781,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>   
>   	RFI_TO_KERNEL
>   	b	.	/* prevent speculative execution */
> -#endif /* CONFIG_PPC_BOOK3S */
>   
>   #ifdef CONFIG_PPC_RTAS
>   /*
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index da78eb6ab92f..1bb4e9b37748 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -139,7 +139,8 @@ ret_from_level_except:
>   	ld	r3,_MSR(r1)
>   	andi.	r3,r3,MSR_PR
>   	beq	1f
> -	b	ret_from_except
> +	REST_NVGPRS(r1)

Could this be in a separate preceding patch (only the adding of REST_NVGPRS(), the call to 
ret_from_except can remain as is by removing the REST_NVGPRS() which is there to make 
ret_from_except and ret_from_except_lite identical).

Or maybe you can also do the name change to interrupt_return in that preceeding patch, so than the 
"use new interrupt return" patch only contains the interesting parts.

> +	b	interrupt_return
>   1:
>   
>   	LOAD_REG_ADDR(r11,extlb_level_exc)
> @@ -208,7 +209,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_EMB_HV)
>   	/*
>   	 * Restore PACAIRQHAPPENED rather than setting it based on
>   	 * the return MSR[EE], since we could have interrupted
> -	 * __check_irq_replay() or other inconsistent transitory
> +	 * interrupt replay or other inconsistent transitory
>   	 * states that must remain that way.
>   	 */
>   	SPECIAL_EXC_LOAD(r10,IRQHAPPENED)
> @@ -511,7 +512,7 @@ exc_##n##_bad_stack:							    \
>   	CHECK_NAPPING();						\
>   	addi	r3,r1,STACK_FRAME_OVERHEAD;				\
>   	bl	hdlr;							\
> -	b	ret_from_except_lite;
> +	b	interrupt_return
>   
>   /* This value is used to mark exception frames on the stack. */
>   	.section	".toc","aw"
> @@ -623,7 +624,8 @@ __end_interrupts:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	ld	r14,PACA_EXGEN+EX_R14(r13)
>   	bl	program_check_exception
> -	b	ret_from_except
> +	REST_NVGPRS(r1)
> +	b	interrupt_return
>   
>   /* Floating Point Unavailable Interrupt */
>   	START_EXCEPTION(fp_unavailable);
> @@ -635,11 +637,11 @@ __end_interrupts:
>   	andi.	r0,r12,MSR_PR;
>   	beq-	1f
>   	bl	load_up_fpu
> -	b	fast_exception_return
> +	b	fast_interrupt_return
>   1:	INTS_DISABLE
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	kernel_fp_unavailable_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* Altivec Unavailable Interrupt */
>   	START_EXCEPTION(altivec_unavailable);
> @@ -653,14 +655,14 @@ BEGIN_FTR_SECTION
>   	andi.	r0,r12,MSR_PR;
>   	beq-	1f
>   	bl	load_up_altivec
> -	b	fast_exception_return
> +	b	fast_interrupt_return
>   1:
>   END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   #endif
>   	INTS_DISABLE
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	altivec_unavailable_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* AltiVec Assist */
>   	START_EXCEPTION(altivec_assist);
> @@ -674,10 +676,11 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   BEGIN_FTR_SECTION
>   	bl	altivec_assist_exception
>   END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
> +	REST_NVGPRS(r1)
>   #else
>   	bl	unknown_exception
>   #endif
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   
>   /* Decrementer Interrupt */
> @@ -719,7 +722,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   	INTS_DISABLE
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	unknown_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* Debug exception as a critical interrupt*/
>   	START_EXCEPTION(debug_crit);
> @@ -786,7 +789,8 @@ END_FTR_SECTION_IFSET(CPU_FTR_ALTIVEC)
>   	ld	r14,PACA_EXCRIT+EX_R14(r13)
>   	ld	r15,PACA_EXCRIT+EX_R15(r13)
>   	bl	DebugException
> -	b	ret_from_except
> +	REST_NVGPRS(r1)
> +	b	interrupt_return
>   
>   kernel_dbg_exc:
>   	b	.	/* NYI */
> @@ -857,7 +861,8 @@ kernel_dbg_exc:
>   	ld	r14,PACA_EXDBG+EX_R14(r13)
>   	ld	r15,PACA_EXDBG+EX_R15(r13)
>   	bl	DebugException
> -	b	ret_from_except
> +	REST_NVGPRS(r1)
> +	b	interrupt_return
>   
>   	START_EXCEPTION(perfmon);
>   	NORMAL_EXCEPTION_PROLOG(0x260, BOOKE_INTERRUPT_PERFORMANCE_MONITOR,
> @@ -867,7 +872,7 @@ kernel_dbg_exc:
>   	CHECK_NAPPING()
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	performance_monitor_exception
> -	b	ret_from_except_lite
> +	b	interrupt_return
>   
>   /* Doorbell interrupt */
>   	MASKABLE_EXCEPTION(0x280, BOOKE_INTERRUPT_DOORBELL,
> @@ -895,7 +900,7 @@ kernel_dbg_exc:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	INTS_RESTORE_HARD
>   	bl	unknown_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* Guest Doorbell critical Interrupt */
>   	START_EXCEPTION(guest_doorbell_crit);
> @@ -916,7 +921,7 @@ kernel_dbg_exc:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	INTS_RESTORE_HARD
>   	bl	unknown_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* Embedded Hypervisor priviledged  */
>   	START_EXCEPTION(ehpriv);
> @@ -926,7 +931,7 @@ kernel_dbg_exc:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	INTS_RESTORE_HARD
>   	bl	unknown_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /* LRAT Error interrupt */
>   	START_EXCEPTION(lrat_error);
> @@ -936,7 +941,7 @@ kernel_dbg_exc:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	INTS_RESTORE_HARD
>   	bl	unknown_exception
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /*
>    * An interrupt came in while soft-disabled; We mark paca->irq_happened
> @@ -998,11 +1003,11 @@ storage_fault_common:
>   	bl	do_page_fault
>   	cmpdi	r3,0
>   	bne-	1f
> -	b	ret_from_except_lite
> +	b	interrupt_return
>   	mr	r4,r3
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	__bad_page_fault
> -	b	ret_from_except
> +	b	interrupt_return
>   
>   /*
>    * Alignment exception doesn't fit entirely in the 0x100 bytes so it
> @@ -1016,284 +1021,8 @@ alignment_more:

...

> -fast_exception_return:
> -	wrteei	0
> -1:	mr	r0,r13
> -	ld	r10,_MSR(r1)
> -	REST_4GPRS(2, r1)
> -	andi.	r6,r10,MSR_PR
> -	REST_2GPRS(6, r1)
> -	beq	1f
> -	ACCOUNT_CPU_USER_EXIT(r13, r10, r11)

Then ACCOUNT_CPU_USER_EXIT can be removed from asm/ppc_asm.h

...

> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index fbabb49888d3..ae7b058b2970 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
>   #endif
>   }
>   
> +/* temporary hack for context tracking, removed in later patch */
> +#include <linux/sched/debug.h>
> +asmlinkage __visible void __sched schedule_user(void);
> +
>   /*
>    * This should be called after a syscall returns, with r3 the return value
>    * from the syscall. If this function returns non-zero, the system call
> @@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
>   		local_irq_enable();
>   		if (ti_flags & _TIF_NEED_RESCHED) {
> +#ifdef CONFIG_PPC_BOOK3E_64
> +			schedule_user();
> +#else
>   			schedule();
> +#endif
>   		} else {
>   			/*
>   			 * SIGPENDING must restore signal handler function
> @@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	return ret;
>   }
>   
> -#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>   notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
>   {
>   	unsigned long ti_flags;
> @@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   	BUG_ON(!(regs->msr & MSR_PR));
>   	BUG_ON(!FULL_REGS(regs));
>   	BUG_ON(arch_irq_disabled_regs(regs));
> +#ifdef CONFIG_PPC_BOOK3S_64
>   	CT_WARN_ON(ct_state() == CONTEXT_USER);
> +#endif
>   
>   	/*
>   	 * We don't need to restore AMR on the way back to userspace for KUAP.
> @@ -387,7 +396,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
>   		local_irq_enable(); /* returning to user: may enable */
>   		if (ti_flags & _TIF_NEED_RESCHED) {
> +#ifdef CONFIG_PPC_BOOK3E_64
> +			schedule_user();
> +#else
>   			schedule();
> +#endif
>   		} else {
>   			if (ti_flags & _TIF_SIGPENDING)
>   				ret |= _TIF_RESTOREALL;
> @@ -435,7 +448,10 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   	/*
>   	 * We do this at the end so that we do context switch with KERNEL AMR
>   	 */
> +#ifndef CONFIG_PPC_BOOK3E_64
>   	kuap_user_restore(regs);

Why do you need to ifdef this out ?
Only PPC_8xx, PPC_BOOK3S_32 and PPC_RADIX_MMU select PPC_HAVE_KUAP.
When PPC_KUAP is not selected, kuap_user_restore() is a static inline {} defined in asm/kup.h

> +#endif
> +
>   	return ret;
>   }
>   
> @@ -445,7 +461,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>   {
>   	unsigned long flags;
>   	unsigned long ret = 0;
> +#ifndef CONFIG_PPC_BOOK3E_64
>   	unsigned long kuap;
> +#endif
>   
>   	if (!IS_ENABLED(CONFIG_BOOKE) && !IS_ENABLED(CONFIG_40x) &&
>   	    unlikely(!(regs->msr & MSR_RI)))
> @@ -456,10 +474,12 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>   	 * CT_WARN_ON comes here via program_check_exception,
>   	 * so avoid recursion.
>   	 */
> -	if (TRAP(regs) != 0x700)
> +	if (IS_ENABLED(CONFIG_BOOKS) && TRAP(regs) != 0x700)
>   		CT_WARN_ON(ct_state() == CONTEXT_USER);
>   
> +#ifndef CONFIG_PPC_BOOK3E_64
>   	kuap = kuap_get_and_assert_locked();

Same, kuap_get_and_assert_locked() always exists, no need to ifdef it.

> +#endif
>   
>   	if (unlikely(current_thread_info()->flags & _TIF_EMULATE_STACK_STORE)) {
>   		clear_bits(_TIF_EMULATE_STACK_STORE, &current_thread_info()->flags);
> @@ -501,8 +521,9 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsign
>   	 * which would cause Read-After-Write stalls. Hence, we take the AMR
>   	 * value from the check above.
>   	 */
> +#ifndef CONFIG_PPC_BOOK3E_64
>   	kuap_kernel_restore(regs, kuap);

Same

> +#endif
>   
>   	return ret;
>   }
> -#endif
