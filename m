Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DAA34CA03
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 10:35:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F85WQ2n0Jz30JS
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Mar 2021 19:35:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=permerror (SPF Permanent Error: Unknown mechanism
 found: ip:192.40.192.88/32) smtp.mailfrom=kernel.crashing.org
 (client-ip=63.228.1.57; helo=gate.crashing.org;
 envelope-from=benh@kernel.crashing.org; receiver=<UNKNOWN>)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by lists.ozlabs.org (Postfix) with ESMTP id 4F85W46Mlgz2yxF
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Mar 2021 19:35:27 +1100 (AEDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
 by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 12T8XKM1023340;
 Mon, 29 Mar 2021 03:33:21 -0500
Message-ID: <a01d923737cb1d4a603dc5046b67787233051c12.camel@kernel.crashing.org>
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Date: Mon, 29 Mar 2021 19:33:20 +1100
In-Reply-To: <20210312012044.3660743-1-npiggin@gmail.com>
References: <20210312012044.3660743-1-npiggin@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Fri, 2021-03-12 at 11:20 +1000, Nicholas Piggin wrote:
> 
> +static inline void nap_adjust_return(struct pt_regs *regs)
> 
> +{
> 
> +#ifdef CONFIG_PPC_970_NAP
> 
> +       if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
> +               /* Can avoid a test-and-clear because NMIs do not call this */
> +               clear_thread_local_flags(_TLF_NAPPING);
> +               regs->nip = (unsigned long)power4_idle_nap_return;
> +       }

Is this a pointer to a function descriptor or the actual code ?

Cheers,
Ben.

> +#endif
> 
> +}
> 
> +
> 
>  struct interrupt_state {
> 
>  #ifdef CONFIG_PPC_BOOK3E_64
> 
>         enum ctx_state ctx_state;
> 
> @@ -111,6 +122,9 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
> 
>  {
> 
>         irq_exit();
> 
>         interrupt_exit_prepare(regs, state);
> 
> +
> 
> +       /* Adjust at exit so the main handler sees the true NIA */
> 
> +       nap_adjust_return(regs);
> 
>  }
> 
>  
> 
>  struct interrupt_nmi_state {
> 
> @@ -164,6 +178,11 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
> 
>                         radix_enabled() || (mfmsr() & MSR_DR))
> 
>                 nmi_exit();
> 
>  
> 
> +       /*
> 
> +        * nmi does not call nap_adjust_return because nmi should not create
> 
> +        * new work to do (must use irq_work for that).
> 
> +        */
> 
> +
> 
>  #ifdef CONFIG_PPC64
> 
>         if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
> 
>                 this_cpu_set_ftrace_enabled(state->ftrace_enabled);
> 
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> 
> index 8acc3590c971..eedc3c775141 100644
> 
> --- a/arch/powerpc/include/asm/processor.h
> 
> +++ b/arch/powerpc/include/asm/processor.h
> 
> @@ -393,6 +393,7 @@ extern unsigned long isa300_idle_stop_mayloss(unsigned long psscr_val);
> 
>  extern unsigned long isa206_idle_insn_mayloss(unsigned long type);
> 
>  #ifdef CONFIG_PPC_970_NAP
> 
>  extern void power4_idle_nap(void);
> 
> +void power4_idle_nap_return(void);
> 
>  #endif
> 
>  
> 
>  extern unsigned long cpuidle_disable;
> 
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> 
> index 386d576673a1..bf137151100b 100644
> 
> --- a/arch/powerpc/include/asm/thread_info.h
> 
> +++ b/arch/powerpc/include/asm/thread_info.h
> 
> @@ -152,6 +152,12 @@ void arch_setup_new_exec(void);
> 
>  
> 
>  #ifndef __ASSEMBLY__
> 
>  
> 
> +static inline void clear_thread_local_flags(unsigned int flags)
> 
> +{
> 
> +       struct thread_info *ti = current_thread_info();
> 
> +       ti->local_flags &= ~flags;
> 
> +}
> 
> +
> 
>  static inline bool test_thread_local_flags(unsigned int flags)
> 
>  {
> 
>         struct thread_info *ti = current_thread_info();
> 
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> 
> index 60d3051a8bc8..ea7a443488d2 100644
> 
> --- a/arch/powerpc/kernel/exceptions-64s.S
> 
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> 
> @@ -692,25 +692,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
> 
>         ld      r1,GPR1(r1)
> 
>  .endm
> 
>  
> 
> -/*
> 
> - * When the idle code in power4_idle puts the CPU into NAP mode,
> 
> - * it has to do so in a loop, and relies on the external interrupt
> 
> - * and decrementer interrupt entry code to get it out of the loop.
> 
> - * It sets the _TLF_NAPPING bit in current_thread_info()->local_flags
> 
> - * to signal that it is in the loop and needs help to get out.
> 
> - */
> 
> -#ifdef CONFIG_PPC_970_NAP
> 
> -#define FINISH_NAP                             \
> 
> -BEGIN_FTR_SECTION                              \
> 
> -       ld      r11, PACA_THREAD_INFO(r13);     \
> 
> -       ld      r9,TI_LOCAL_FLAGS(r11);         \
> 
> -       andi.   r10,r9,_TLF_NAPPING;            \
> 
> -       bnel    power4_fixup_nap;               \
> 
> -END_FTR_SECTION_IFSET(CPU_FTR_CAN_NAP)
> 
> -#else
> 
> -#define FINISH_NAP
> 
> -#endif
> 
> -
> 
>  /*
> 
>   * There are a few constraints to be concerned with.
> 
>   * - Real mode exceptions code/data must be located at their physical location.
> 
> @@ -1248,7 +1229,6 @@ EXC_COMMON_BEGIN(machine_check_common)
> 
>          */
> 
>         GEN_COMMON machine_check
> 
>  
> 
> -       FINISH_NAP
> 
>         /* Enable MSR_RI when finished with PACA_EXMC */
> 
>         li      r10,MSR_RI
> 
>         mtmsrd  r10,1
> 
> @@ -1571,7 +1551,6 @@ EXC_VIRT_BEGIN(hardware_interrupt, 0x4500, 0x100)
> 
>  EXC_VIRT_END(hardware_interrupt, 0x4500, 0x100)
> 
>  EXC_COMMON_BEGIN(hardware_interrupt_common)
> 
>         GEN_COMMON hardware_interrupt
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>         bl      do_IRQ
> 
>         b       interrupt_return
> 
> @@ -1801,7 +1780,6 @@ EXC_VIRT_BEGIN(decrementer, 0x4900, 0x80)
> 
>  EXC_VIRT_END(decrementer, 0x4900, 0x80)
> 
>  EXC_COMMON_BEGIN(decrementer_common)
> 
>         GEN_COMMON decrementer
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>         bl      timer_interrupt
> 
>         b       interrupt_return
> 
> @@ -1886,7 +1864,6 @@ EXC_VIRT_BEGIN(doorbell_super, 0x4a00, 0x100)
> 
>  EXC_VIRT_END(doorbell_super, 0x4a00, 0x100)
> 
>  EXC_COMMON_BEGIN(doorbell_super_common)
> 
>         GEN_COMMON doorbell_super
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>  #ifdef CONFIG_PPC_DOORBELL
> 
>         bl      doorbell_exception
> 
> @@ -2237,7 +2214,6 @@ EXC_COMMON_BEGIN(hmi_exception_early_common)
> 
>  
> 
>  EXC_COMMON_BEGIN(hmi_exception_common)
> 
>         GEN_COMMON hmi_exception
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>         bl      handle_hmi_exception
> 
>         b       interrupt_return
> 
> @@ -2266,7 +2242,6 @@ EXC_VIRT_BEGIN(h_doorbell, 0x4e80, 0x20)
> 
>  EXC_VIRT_END(h_doorbell, 0x4e80, 0x20)
> 
>  EXC_COMMON_BEGIN(h_doorbell_common)
> 
>         GEN_COMMON h_doorbell
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>  #ifdef CONFIG_PPC_DOORBELL
> 
>         bl      doorbell_exception
> 
> @@ -2299,7 +2274,6 @@ EXC_VIRT_BEGIN(h_virt_irq, 0x4ea0, 0x20)
> 
>  EXC_VIRT_END(h_virt_irq, 0x4ea0, 0x20)
> 
>  EXC_COMMON_BEGIN(h_virt_irq_common)
> 
>         GEN_COMMON h_virt_irq
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>         bl      do_IRQ
> 
>         b       interrupt_return
> 
> @@ -2345,7 +2319,6 @@ EXC_VIRT_BEGIN(performance_monitor, 0x4f00, 0x20)
> 
>  EXC_VIRT_END(performance_monitor, 0x4f00, 0x20)
> 
>  EXC_COMMON_BEGIN(performance_monitor_common)
> 
>         GEN_COMMON performance_monitor
> 
> -       FINISH_NAP
> 
>         addi    r3,r1,STACK_FRAME_OVERHEAD
> 
>         bl      performance_monitor_exception
> 
>         b       interrupt_return
> 
> @@ -3096,24 +3069,6 @@ USE_FIXED_SECTION(virt_trampolines)
> 
>  __end_interrupts:
> 
>  DEFINE_FIXED_SYMBOL(__end_interrupts)
> 
>  
> 
> -#ifdef CONFIG_PPC_970_NAP
> 
> -       /*
> 
> -        * Called by exception entry code if _TLF_NAPPING was set, this clears
> 
> -        * the NAPPING flag, and redirects the exception exit to
> 
> -        * power4_fixup_nap_return.
> 
> -        */
> 
> -       .globl power4_fixup_nap
> 
> -EXC_COMMON_BEGIN(power4_fixup_nap)
> 
> -       andc    r9,r9,r10
> 
> -       std     r9,TI_LOCAL_FLAGS(r11)
> 
> -       LOAD_REG_ADDR(r10, power4_idle_nap_return)
> 
> -       std     r10,_NIP(r1)
> 
> -       blr
> 
> -
> 
> -power4_idle_nap_return:
> 
> -       blr
> 
> -#endif
> 
> -
> 
>  CLOSE_FIXED_SECTION(real_vectors);
> 
>  CLOSE_FIXED_SECTION(real_trampolines);
> 
>  CLOSE_FIXED_SECTION(virt_vectors);
> 
> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
> 
> index f9e6d83e6720..abb719b21cae 100644
> 
> --- a/arch/powerpc/kernel/idle_book3s.S
> 
> +++ b/arch/powerpc/kernel/idle_book3s.S
> 
> @@ -209,4 +209,8 @@ _GLOBAL(power4_idle_nap)
> 
>         mtmsrd  r7
> 
>         isync
> 
>         b       1b
> 
> +
> 
> +       .globl power4_idle_nap_return
> 
> +power4_idle_nap_return:
> 
> +       blr
> 
>  #endif
> 
> --
> 
> 2.23.0

