Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C8E25ED32
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 09:33:55 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bkjp84LmKzDqby
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Sep 2020 17:33:52 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BkjmT1qnszDqMN
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  6 Sep 2020 17:32:22 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BkjmH2MpVz9tyLg;
 Sun,  6 Sep 2020 09:32:15 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YDeGc-GnqhgL; Sun,  6 Sep 2020 09:32:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BkjmH1JF4z9tyLf;
 Sun,  6 Sep 2020 09:32:15 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F83B8B770;
 Sun,  6 Sep 2020 09:32:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kmp4yXd2fRrH; Sun,  6 Sep 2020 09:32:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CE52D8B75B;
 Sun,  6 Sep 2020 09:32:17 +0200 (CEST)
Subject: Re: [RFC PATCH 12/12] powerpc/64s: power4 nap fixup in C
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-13-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <53f5fa9b-03d4-150e-199b-7ffa75d91666@csgroup.eu>
Date: Sun, 6 Sep 2020 09:32:06 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200905174335.3161229-13-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 05/09/2020 à 19:43, Nicholas Piggin a écrit :
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h   | 14 ++++++++
>   arch/powerpc/include/asm/processor.h   |  1 +
>   arch/powerpc/include/asm/thread_info.h |  6 ++++
>   arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>   arch/powerpc/kernel/idle_book3s.S      |  4 +++
>   5 files changed, 25 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 3ae3d2f93b61..acfcc7d5779b 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -8,6 +8,16 @@
>   #include <asm/ftrace.h>
>   #include <asm/runlatch.h>
>   
> +static inline void nap_adjust_return(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC_970_NAP

Avoid #ifdef, you can use IS_ENABLED(CONFIG_PPC_970_NAP) in the 'if' below

> +	if (test_thread_local_flags(_TLF_NAPPING)) {
> +		clear_thread_local_flags(_TLF_NAPPING);
> +		regs->nip = (unsigned long)power4_idle_nap_return;
> +	}
> +#endif
> +}
> +
>   #ifdef CONFIG_PPC_BOOK3S_64
>   static inline void interrupt_enter_prepare(struct pt_regs *regs)
>   {
> @@ -33,6 +43,8 @@ static inline void interrupt_async_enter_prepare(struct pt_regs *regs)
>   	if (cpu_has_feature(CPU_FTR_CTRL) &&
>   	    !test_thread_local_flags(_TLF_RUNLATCH))
>   		__ppc64_runlatch_on();
> +
> +	nap_adjust_return(regs);
>   }
>   
>   #else /* CONFIG_PPC_BOOK3S_64 */
> @@ -72,6 +84,8 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>   
>   	this_cpu_set_ftrace_enabled(0);
>   
> +	nap_adjust_return(regs);
> +
>   	nmi_enter();
>   }
>   
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index ed0d633ab5aa..3da1dba91386 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -424,6 +424,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
>   extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
>   #ifdef CONFIG_PPC_970_NAP
>   extern void power4_idle_nap(void);
> +extern void power4_idle_nap_return(void);

Please please please, 'extern' keyword is pointless and deprecated for 
function prototypes. Don't add new ones.

Also, put it outside the #ifdef, so that you can use IS_ENABLED() 
instead of #ifdef when using it.

>   #endif
>   
>   extern unsigned long cpuidle_disable;
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index ca6c97025704..9b15f7edb0cb 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -156,6 +156,12 @@ void arch_setup_new_exec(void);
>   
>   #ifndef __ASSEMBLY__
>   
> +static inline void clear_thread_local_flags(unsigned int flags)
> +{
> +	struct thread_info *ti = current_thread_info();
> +	ti->local_flags &= ~flags;
> +}
> +
>   static inline bool test_thread_local_flags(unsigned int flags)
>   {
>   	struct thread_info *ti = current_thread_info();
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 227bad3a586d..1db6b3438c88 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -692,25 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>   	ld	r1,GPR1(r1)
>   .endm
>   
> -/*
> - * When the idle code in power4_idle puts the CPU into NAP mode,
> - * it has to do so in a loop, and relies on the external interrupt
> - * and decrementer interrupt entry code to get it out of the loop.
> - * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
> - * to signal that it is in the loop and needs help to get out.
> - */
> -#ifdef CONFIG_PPC_970_NAP
> -#define FINISH_NAP				\
> -BEGIN_FTR_SECTION				\
> -	ld	r11, PACA_THREAD_INFO(r13);	\
> -	ld	r9,TI_LOCAL_FLAGS(r11);		\
> -	andi.	r10,r9,_TLF_NAPPING;		\
> -	bnel	power4_fixup_nap;		\
> -END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
> -#else
> -#define FINISH_NAP
> -#endif
> -
>   /*
>    * There are a few constraints to be concerned with.
>    * - Real mode exceptions code/data must be located at their physical location.
> @@ -1250,7 +1231,6 @@ EXC_COMMON_BEGIN(machine_check_common)
>   	 */
>   	GEN_COMMON machine_check
>   
> -	FINISH_NAP
>   	/* Enable MSR_RI when finished with PACA_EXMC */
>   	li	r10,MSR_RI
>   	mtmsrd 	r10,1
> @@ -1572,7 +1552,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
>   EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
>   EXC_COMMON_BEGIN(hardware_interrupt_common)
>   	GEN_COMMON hardware_interrupt
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_IRQ
>   	b	interrupt_return
> @@ -1757,7 +1736,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
>   EXC_VIRT_END(decrementer, 0x4900, 0x80)
>   EXC_COMMON_BEGIN(decrementer_common)
>   	GEN_COMMON decrementer
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	timer_interrupt
>   	b	interrupt_return
> @@ -1842,7 +1820,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
>   EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
>   EXC_COMMON_BEGIN(doorbell_super_common)
>   	GEN_COMMON doorbell_super
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   #ifdef CONFIG_PPC_DOORBELL
>   	bl	doorbell_exception
> @@ -2196,7 +2173,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
>   
>   EXC_COMMON_BEGIN(hmi_exception_common)
>   	GEN_COMMON hmi_exception
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	handle_hmi_exception
>   	b	interrupt_return
> @@ -2225,7 +2201,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
>   EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
>   EXC_COMMON_BEGIN(h_doorbell_common)
>   	GEN_COMMON h_doorbell
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   #ifdef CONFIG_PPC_DOORBELL
>   	bl	doorbell_exception
> @@ -2258,7 +2233,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
>   EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
>   EXC_COMMON_BEGIN(h_virt_irq_common)
>   	GEN_COMMON h_virt_irq
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_IRQ
>   	b	interrupt_return
> @@ -2304,7 +2278,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
>   EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
>   EXC_COMMON_BEGIN(performance_monitor_common)
>   	GEN_COMMON performance_monitor
> -	FINISH_NAP
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	performance_monitor_exception
>   	b	interrupt_return
> @@ -3032,24 +3005,6 @@ USE_FIXED_SECTION(virt_trampolines)
>   __end_interrupts:
>   DEFINE_FIXED_SYMBOL(__end_interrupts)
>   
> -#ifdef CONFIG_PPC_970_NAP
> -	/*
> -	 * Called by exception entry code if _TLF_NAPPING was set, this clears
> -	 * the NAPPING flag, and redirects the exception exit to
> -	 * power4_fixup_nap_return.
> -	 */
> -	.globl power4_fixup_nap
> -EXC_COMMON_BEGIN(power4_fixup_nap)
> -	andc	r9,r9,r10
> -	std	r9,TI_LOCAL_FLAGS(r11)
> -	LOAD_REG_ADDR(r10, power4_idle_nap_return)
> -	std	r10,_NIP(r1)
> -	blr
> -
> -power4_idle_nap_return:
> -	blr
> -#endif
> -
>   CLOSE_FIXED_SECTION(real_vectors);
>   CLOSE_FIXED_SECTION(real_trampolines);
>   CLOSE_FIXED_SECTION(virt_vectors);
> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
> index 22f249b6f58d..27d2e6a72ec9 100644
> --- a/arch/powerpc/kernel/idle_book3s.S
> +++ b/arch/powerpc/kernel/idle_book3s.S
> @@ -201,4 +201,8 @@ _GLOBAL(power4_idle_nap)
>   	mtmsrd	r7
>   	isync
>   	b	1b
> +
> +	.globl power4_idle_nap_return
> +power4_idle_nap_return:
> +	blr

Can't this be written in C somewhere ?

>   #endif
> 

Christophe
