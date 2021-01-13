Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C9D942F4D7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:47:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9Jm2ffSzDrfM
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 01:47:20 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9Gj3wx3zDrYf
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:45:26 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9GT3yXFzB09ZN;
 Wed, 13 Jan 2021 15:45:21 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id qRsCqX_KtuT7; Wed, 13 Jan 2021 15:45:21 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9GT1Ylbz9v087;
 Wed, 13 Jan 2021 15:45:21 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B2DB98B7E3;
 Wed, 13 Jan 2021 15:45:22 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bEgbrFCM7DeS; Wed, 13 Jan 2021 15:45:22 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 69B328B772;
 Wed, 13 Jan 2021 15:45:22 +0100 (CET)
Subject: Re: [PATCH v5 06/21] powerpc: interrupt handler wrapper functions
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-7-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b9710efb-5790-0206-237f-fd184015c811@csgroup.eu>
Date: Wed, 13 Jan 2021 15:45:17 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-7-npiggin@gmail.com>
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
> Add wrapper functions (derived from x86 macros) for interrupt handler
> functions. This allows interrupt entry code to be written in C.

Looks like you are doing more than just that is this patch. WOuld be worth splitting in several 
patches I think,

I'd suggest:
- Other patches for unrelated changes, see below for details
- One patch that brings the wrapper macros
- One patch that uses those macros

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h     |  29 ---
>   arch/powerpc/include/asm/book3s/64/mmu-hash.h |   1 -
>   arch/powerpc/include/asm/hw_irq.h             |   9 -
>   arch/powerpc/include/asm/interrupt.h          | 218 ++++++++++++++++++
>   arch/powerpc/include/asm/time.h               |   2 +
>   arch/powerpc/kernel/dbell.c                   |  12 +-
>   arch/powerpc/kernel/exceptions-64s.S          |   7 +-
>   arch/powerpc/kernel/head_book3s_32.S          |   6 +-
>   arch/powerpc/kernel/irq.c                     |   3 +-
>   arch/powerpc/kernel/mce.c                     |   5 +-
>   arch/powerpc/kernel/syscall_64.c              |   1 +
>   arch/powerpc/kernel/tau_6xx.c                 |   2 +-
>   arch/powerpc/kernel/time.c                    |   3 +-
>   arch/powerpc/kernel/traps.c                   |  90 +++++---
>   arch/powerpc/kernel/watchdog.c                |   7 +-
>   arch/powerpc/kvm/book3s_hv.c                  |   1 +
>   arch/powerpc/kvm/book3s_hv_builtin.c          |   1 +
>   arch/powerpc/kvm/booke.c                      |   1 +
>   arch/powerpc/mm/book3s64/hash_utils.c         |  57 +++--
>   arch/powerpc/mm/book3s64/slb.c                |  29 +--
>   arch/powerpc/mm/fault.c                       |  15 +-
>   arch/powerpc/platforms/powernv/idle.c         |   1 +
>   22 files changed, 374 insertions(+), 126 deletions(-)
>   create mode 100644 arch/powerpc/include/asm/interrupt.h
> 

...

> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> new file mode 100644
> index 000000000000..60363e5eeffa
> --- /dev/null
> +++ b/arch/powerpc/include/asm/interrupt.h

...

> +/* Interrupt handlers */
> +DECLARE_INTERRUPT_HANDLER_NMI(machine_check_early);
> +DECLARE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode);
> +DECLARE_INTERRUPT_HANDLER(SMIException);
> +DECLARE_INTERRUPT_HANDLER(handle_hmi_exception);
> +DECLARE_INTERRUPT_HANDLER(instruction_breakpoint_exception);
> +DECLARE_INTERRUPT_HANDLER(RunModeException);
> +DECLARE_INTERRUPT_HANDLER(single_step_exception);
> +DECLARE_INTERRUPT_HANDLER(program_check_exception);
> +DECLARE_INTERRUPT_HANDLER(alignment_exception);
> +DECLARE_INTERRUPT_HANDLER(StackOverflow);
> +DECLARE_INTERRUPT_HANDLER(stack_overflow_exception);
> +DECLARE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception);
> +DECLARE_INTERRUPT_HANDLER(altivec_unavailable_exception);
> +DECLARE_INTERRUPT_HANDLER(vsx_unavailable_exception);
> +DECLARE_INTERRUPT_HANDLER(fp_unavailable_tm);
> +DECLARE_INTERRUPT_HANDLER(altivec_unavailable_tm);
> +DECLARE_INTERRUPT_HANDLER(vsx_unavailable_tm);
> +DECLARE_INTERRUPT_HANDLER(facility_unavailable_exception);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(TAUException);
> +DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
> +DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
> +DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
> +DECLARE_INTERRUPT_HANDLER_NMI(system_reset_exception);
> +#ifdef CONFIG_PPC_BOOK3S_64
> +DECLARE_INTERRUPT_HANDLER_ASYNC(machine_check_exception);
> +#else
> +DECLARE_INTERRUPT_HANDLER_NMI(machine_check_exception);
> +#endif
> +DECLARE_INTERRUPT_HANDLER(emulation_assist_interrupt);
> +DECLARE_INTERRUPT_HANDLER_RAW(do_slb_fault);
> +DECLARE_INTERRUPT_HANDLER(do_bad_slb_fault);
> +DECLARE_INTERRUPT_HANDLER_RAW(do_hash_fault);
> +DECLARE_INTERRUPT_HANDLER_RET(do_page_fault);
> +DECLARE_INTERRUPT_HANDLER(__do_bad_page_fault);
> +DECLARE_INTERRUPT_HANDLER(do_bad_page_fault);

Missing DECLARE_INTERRUPT_HANDLER(do_break)

> +
> +DECLARE_INTERRUPT_HANDLER_ASYNC(timer_interrupt);
> +DECLARE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async);
> +DECLARE_INTERRUPT_HANDLER_RAW(performance_monitor_exception);
> +DECLARE_INTERRUPT_HANDLER(WatchdogException);
> +DECLARE_INTERRUPT_HANDLER(unknown_exception);
> +DECLARE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception);
> +
> +void replay_system_reset(void);
> +void replay_soft_interrupts(void);
> +
> +#endif /* _ASM_POWERPC_INTERRUPT_H */
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 8f789b597bae..8dd3cdb25338 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -102,6 +102,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
>   /* Convert timebase ticks to nanoseconds */
>   unsigned long long tb_to_ns(unsigned long long tb_ticks);
>   
> +void timer_broadcast_interrupt(void);

This seems unrelated. I think a separate patch woud be better for moving prototypes without making 
them wrappers.

> +
>   /* SPLPAR */
>   void accumulate_stolen_time(void);
>   
> diff --git a/arch/powerpc/kernel/dbell.c b/arch/powerpc/kernel/dbell.c
> index 52680cf07c9d..c0f99f8ffa7d 100644
> --- a/arch/powerpc/kernel/dbell.c
> +++ b/arch/powerpc/kernel/dbell.c
> @@ -12,14 +12,14 @@
>   #include <linux/hardirq.h>
>   
>   #include <asm/dbell.h>
> +#include <asm/interrupt.h>
>   #include <asm/irq_regs.h>
>   #include <asm/kvm_ppc.h>
>   #include <asm/trace.h>
>   
> -#ifdef CONFIG_SMP
> -

This seems unrelated, is that needed ? What's the problem with having to full versions of 
doorbell_exception() ?

> -void doorbell_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(doorbell_exception)
>   {
> +#ifdef CONFIG_SMP
>   	struct pt_regs *old_regs = set_irq_regs(regs);
>   
>   	irq_enter();
> @@ -37,11 +37,7 @@ void doorbell_exception(struct pt_regs *regs)
>   	trace_doorbell_exit(regs);
>   	irq_exit();
>   	set_irq_regs(old_regs);
> -}
>   #else /* CONFIG_SMP */
> -void doorbell_exception(struct pt_regs *regs)
> -{
>   	printk(KERN_WARNING "Received doorbell on non-smp system\n");
> -}
>   #endif /* CONFIG_SMP */
> -
> +}
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 36dea2020ec5..8b0db807974c 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1923,7 +1923,7 @@ EXC_COMMON_BEGIN(doorbell_super_common)
>   #ifdef CONFIG_PPC_DOORBELL
>   	bl	doorbell_exception
>   #else
> -	bl	unknown_exception
> +	bl	unknown_async_exception

Unrelated  to wrappers ?

>   #endif
>   	b	interrupt_return
>   
> @@ -2136,8 +2136,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
>   	GEN_COMMON h_data_storage
>   	addi    r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
> -	li	r4,SIGSEGV
> -	bl      bad_page_fault
> +	bl      do_bad_page_fault

Is this name change related ?

>   MMU_FTR_SECTION_ELSE
>   	bl      unknown_exception
>   ALT_MMU_FTR_SECTION_END_IFSET(MMU_FTR_TYPE_RADIX)
> @@ -2310,7 +2309,7 @@ EXC_COMMON_BEGIN(h_doorbell_common)
>   #ifdef CONFIG_PPC_DOORBELL
>   	bl	doorbell_exception
>   #else
> -	bl	unknown_exception
> +	bl	unknown_async_exception
>   #endif
>   	b	interrupt_return
>   
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 94ad1372c490..9b4d5432e2db 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -238,8 +238,8 @@ __secondary_hold_acknowledge:
>   
>   /* System reset */
>   /* core99 pmac starts the seconary here by changing the vector, and
> -   putting it back to what it was (unknown_exception) when done.  */
> -	EXCEPTION(0x100, Reset, unknown_exception, EXC_XFER_STD)
> +   putting it back to what it was (unknown_async_exception) when done.  */
> +	EXCEPTION(0x100, Reset, unknown_async_exception, EXC_XFER_STD)
>   
>   /* Machine check */
>   /*
> @@ -631,7 +631,7 @@ END_MMU_FTR_SECTION_IFSET(MMU_FTR_NEED_DTLB_SW_LRU)
>   #endif
>   
>   #ifndef CONFIG_TAU_INT
> -#define TAUException	unknown_exception
> +#define TAUException	unknown_async_exception
>   #endif
>   
>   	EXCEPTION(0x1300, Trap_13, instruction_breakpoint_exception, EXC_XFER_STD)
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 6b1eca53e36c..2055d204d08e 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -54,6 +54,7 @@
>   #include <linux/pgtable.h>
>   
>   #include <linux/uaccess.h>
> +#include <asm/interrupt.h>
>   #include <asm/io.h>
>   #include <asm/irq.h>
>   #include <asm/cache.h>
> @@ -665,7 +666,7 @@ void __do_irq(struct pt_regs *regs)
>   	irq_exit();
>   }
>   
> -void do_IRQ(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(do_IRQ)
>   {
>   	struct pt_regs *old_regs = set_irq_regs(regs);
>   	void *cursp, *irqsp, *sirqsp;
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 9f3e133b57b7..54269947113d 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -18,6 +18,7 @@
>   #include <linux/extable.h>
>   #include <linux/ftrace.h>
>   
> +#include <asm/interrupt.h>
>   #include <asm/machdep.h>
>   #include <asm/mce.h>
>   #include <asm/nmi.h>
> @@ -588,7 +589,7 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>    *
>    * regs->nip and regs->msr contains srr0 and ssr1.
>    */
> -long notrace machine_check_early(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
>   {
>   	long handled = 0;
>   	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
> @@ -722,7 +723,7 @@ long hmi_handle_debugtrig(struct pt_regs *regs)
>   /*
>    * Return values:
>    */
> -long hmi_exception_realmode(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_NMI(hmi_exception_realmode)
>   {	
>   	int ret;
>   
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index 7c85ed04a164..dd87b2118620 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -5,6 +5,7 @@
>   #include <asm/kup.h>
>   #include <asm/cputime.h>
>   #include <asm/hw_irq.h>
> +#include <asm/interrupt.h>
>   #include <asm/kprobes.h>
>   #include <asm/paca.h>
>   #include <asm/ptrace.h>
> diff --git a/arch/powerpc/kernel/tau_6xx.c b/arch/powerpc/kernel/tau_6xx.c
> index 0b4694b8d248..46b2e5de4ef5 100644
> --- a/arch/powerpc/kernel/tau_6xx.c
> +++ b/arch/powerpc/kernel/tau_6xx.c
> @@ -100,7 +100,7 @@ static void TAUupdate(int cpu)
>    * with interrupts disabled
>    */
>   
> -void TAUException(struct pt_regs * regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(TAUException)
>   {
>   	int cpu = smp_processor_id();
>   
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 67feb3524460..435a251247ed 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -56,6 +56,7 @@
>   #include <linux/processor.h>
>   #include <asm/trace.h>
>   
> +#include <asm/interrupt.h>
>   #include <asm/io.h>
>   #include <asm/nvram.h>
>   #include <asm/cache.h>
> @@ -570,7 +571,7 @@ void arch_irq_work_raise(void)
>    * timer_interrupt - gets called when the decrementer overflows,
>    * with interrupts disabled.
>    */
> -void timer_interrupt(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>   {
>   	struct clock_event_device *evt = this_cpu_ptr(&decrementers);
>   	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 9b5298c016c7..f4462b481248 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -41,6 +41,7 @@
>   #include <asm/emulated_ops.h>
>   #include <linux/uaccess.h>
>   #include <asm/debugfs.h>
> +#include <asm/interrupt.h>
>   #include <asm/io.h>
>   #include <asm/machdep.h>
>   #include <asm/rtas.h>
> @@ -430,8 +431,7 @@ void hv_nmi_check_nonrecoverable(struct pt_regs *regs)
>   	regs->msr &= ~MSR_RI;
>   #endif
>   }
> -
> -void system_reset_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
>   {
>   	unsigned long hsrr0, hsrr1;
>   	bool saved_hsrrs = false;
> @@ -516,7 +516,10 @@ void system_reset_exception(struct pt_regs *regs)
>   	this_cpu_set_ftrace_enabled(ftrace_enabled);
>   
>   	/* What should we do here? We could issue a shutdown or hard reset. */
> +
> +	return 0;
>   }
> +NOKPROBE_SYMBOL(system_reset_exception);

Is this NOKPROBE_SYMBOL() related to wrappers or just a bug fix ?

>   
>   /*
>    * I/O accesses can cause machine checks on powermacs.
> @@ -788,7 +791,12 @@ int machine_check_generic(struct pt_regs *regs)
>   }
>   #endif /* everything else */
>   
> -void machine_check_exception(struct pt_regs *regs)
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
> +#else
> +DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
> +#endif
>   {
>   	int recover = 0;
>   
> @@ -838,13 +846,21 @@ void machine_check_exception(struct pt_regs *regs)
>   	if (!(regs->msr & MSR_RI))
>   		die("Unrecoverable Machine check", regs, SIGBUS);
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +bail:
>   	return;
> +#else
> +	return 0;
>   
>   bail:
>   	if (nmi) nmi_exit();
> +
> +	return 0;
> +#endif

Looks fishy. Can't we have both returning either long or void ?

>   }
> +NOKPROBE_SYMBOL(machine_check_exception);

Is this NOKPROBE_SYMBOL() related to wrappers or just a bug fix ?

>   
> -void SMIException(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(SMIException) /* async? */
>   {
>   	die("System Management Interrupt", regs, SIGABRT);
>   }
> @@ -1030,7 +1046,7 @@ static void p9_hmi_special_emu(struct pt_regs *regs)
>   }
>   #endif /* CONFIG_VSX */
>   
> -void handle_hmi_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
>   {
>   	struct pt_regs *old_regs;
>   
> @@ -1059,7 +1075,7 @@ void handle_hmi_exception(struct pt_regs *regs)
>   	set_irq_regs(old_regs);
>   }
>   
> -void unknown_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(unknown_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1071,7 +1087,19 @@ void unknown_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void instruction_breakpoint_exception(struct pt_regs *regs)

shouldn't unknown_async_exception() be added in a preceeding patch ?

> +DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
> +{
> +	enum ctx_state prev_state = exception_enter();
> +
> +	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
> +	       regs->nip, regs->msr, regs->trap);
> +
> +	_exception(SIGTRAP, regs, TRAP_UNK, 0);
> +
> +	exception_exit(prev_state);
> +}
> +
> +DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1086,12 +1114,12 @@ void instruction_breakpoint_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void RunModeException(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(RunModeException)
>   {
>   	_exception(SIGTRAP, regs, TRAP_UNK, 0);
>   }
>   
> -void single_step_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(single_step_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1436,7 +1464,7 @@ static int emulate_math(struct pt_regs *regs)
>   static inline int emulate_math(struct pt_regs *regs) { return -1; }
>   #endif
>   
> -void program_check_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   	unsigned int reason = get_reason(regs);
> @@ -1561,14 +1589,14 @@ NOKPROBE_SYMBOL(program_check_exception);
>    * This occurs when running in hypervisor mode on POWER6 or later
>    * and an illegal instruction is encountered.
>    */
> -void emulation_assist_interrupt(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(emulation_assist_interrupt)
>   {
>   	regs->msr |= REASON_ILLEGAL;
>   	program_check_exception(regs);
>   }
>   NOKPROBE_SYMBOL(emulation_assist_interrupt);
>   
> -void alignment_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   	int sig, code, fixed = 0;
> @@ -1618,7 +1646,7 @@ void alignment_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void StackOverflow(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(StackOverflow)
>   {
>   	pr_crit("Kernel stack overflow in process %s[%d], r1=%lx\n",
>   		current->comm, task_pid_nr(current), regs->gpr[1]);
> @@ -1627,7 +1655,7 @@ void StackOverflow(struct pt_regs *regs)
>   	panic("kernel stack overflow");
>   }
>   
> -void stack_overflow_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1636,7 +1664,7 @@ void stack_overflow_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void kernel_fp_unavailable_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1647,7 +1675,7 @@ void kernel_fp_unavailable_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void altivec_unavailable_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   
> @@ -1666,7 +1694,7 @@ void altivec_unavailable_exception(struct pt_regs *regs)
>   	exception_exit(prev_state);
>   }
>   
> -void vsx_unavailable_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
>   {
>   	if (user_mode(regs)) {
>   		/* A user program has executed an vsx instruction,
> @@ -1697,7 +1725,7 @@ static void tm_unavailable(struct pt_regs *regs)
>   	die("Unrecoverable TM Unavailable Exception", regs, SIGABRT);
>   }
>   
> -void facility_unavailable_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(facility_unavailable_exception)
>   {
>   	static char *facility_strings[] = {
>   		[FSCR_FP_LG] = "FPU",
> @@ -1817,7 +1845,7 @@ void facility_unavailable_exception(struct pt_regs *regs)
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   
> -void fp_unavailable_tm(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(fp_unavailable_tm)
>   {
>   	/* Note:  This does not handle any kind of FP laziness. */
>   
> @@ -1850,7 +1878,7 @@ void fp_unavailable_tm(struct pt_regs *regs)
>   	tm_recheckpoint(&current->thread);
>   }
>   
> -void altivec_unavailable_tm(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(altivec_unavailable_tm)
>   {
>   	/* See the comments in fp_unavailable_tm().  This function operates
>   	 * the same way.
> @@ -1865,7 +1893,7 @@ void altivec_unavailable_tm(struct pt_regs *regs)
>   	current->thread.used_vr = 1;
>   }
>   
> -void vsx_unavailable_tm(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
>   {
>   	/* See the comments in fp_unavailable_tm().  This works similarly,
>   	 * though we're loading both FP and VEC registers in here.
> @@ -1890,7 +1918,8 @@ void vsx_unavailable_tm(struct pt_regs *regs)
>   }
>   #endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
>   
> -static void performance_monitor_exception_nmi(struct pt_regs *regs)
> +#ifdef CONFIG_PPC64
> +DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
>   {
>   	nmi_enter();
>   
> @@ -1899,9 +1928,12 @@ static void performance_monitor_exception_nmi(struct pt_regs *regs)
>   	perf_irq(regs);
>   
>   	nmi_exit();
> +
> +	return 0;
>   }
> +#endif
>   
> -static void performance_monitor_exception_async(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_ASYNC(performance_monitor_exception_async)
>   {
>   	irq_enter();
>   
> @@ -1912,7 +1944,7 @@ static void performance_monitor_exception_async(struct pt_regs *regs)
>   	irq_exit();
>   }
>   
> -void performance_monitor_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_RAW(performance_monitor_exception)
>   {
>   	/*
>   	 * On 64-bit, if perf interrupts hit in a local_irq_disable
> @@ -1924,6 +1956,8 @@ void performance_monitor_exception(struct pt_regs *regs)
>   		performance_monitor_exception_nmi(regs);
>   	else
>   		performance_monitor_exception_async(regs);
> +
> +	return 0;
>   }
>   
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> @@ -2057,7 +2091,7 @@ NOKPROBE_SYMBOL(DebugException);
>   #endif /* CONFIG_PPC_ADV_DEBUG_REGS */
>   
>   #ifdef CONFIG_ALTIVEC
> -void altivec_assist_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(altivec_assist_exception)
>   {
>   	int err;
>   
> @@ -2199,7 +2233,7 @@ void SPEFloatingPointRoundException(struct pt_regs *regs)
>    * in the MSR is 0.  This indicates that SRR0/1 are live, and that
>    * we therefore lost state by taking this exception.
>    */
> -void unrecoverable_exception(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
>   {
>   	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
>   		 regs->trap, regs->nip, regs->msr);
> @@ -2219,7 +2253,7 @@ void __attribute__ ((weak)) WatchdogHandler(struct pt_regs *regs)
>   	return;
>   }
>   
> -void WatchdogException(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(WatchdogException) /* XXX NMI? async? */
>   {
>   	printk (KERN_EMERG "PowerPC Book-E Watchdog Exception\n");
>   	WatchdogHandler(regs);
> @@ -2230,7 +2264,7 @@ void WatchdogException(struct pt_regs *regs)
>    * We enter here if we discover during exception entry that we are
>    * running in supervisor mode with a userspace value in the stack pointer.
>    */
> -void kernel_bad_stack(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(kernel_bad_stack)
>   {
>   	printk(KERN_EMERG "Bad kernel stack pointer %lx at %lx\n",
>   	       regs->gpr[1], regs->nip);
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index af3c15a1d41e..824b9376ac35 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -26,6 +26,7 @@
>   #include <linux/delay.h>
>   #include <linux/smp.h>
>   
> +#include <asm/interrupt.h>
>   #include <asm/paca.h>
>   
>   /*
> @@ -247,14 +248,14 @@ static void watchdog_timer_interrupt(int cpu)
>   		watchdog_smp_panic(cpu, tb);
>   }
>   
> -void soft_nmi_interrupt(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   {
>   	unsigned long flags;
>   	int cpu = raw_smp_processor_id();
>   	u64 tb;
>   
>   	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
> -		return;
> +		return 0;
>   
>   	nmi_enter();
>   
> @@ -291,6 +292,8 @@ void soft_nmi_interrupt(struct pt_regs *regs)
>   
>   out:
>   	nmi_exit();
> +
> +	return 0;
>   }
>   
>   static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6f612d240392..3f9a229f82a2 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -53,6 +53,7 @@
>   #include <asm/cputable.h>
>   #include <asm/cacheflush.h>
>   #include <linux/uaccess.h>
> +#include <asm/interrupt.h>
>   #include <asm/io.h>
>   #include <asm/kvm_ppc.h>
>   #include <asm/kvm_book3s.h>
> diff --git a/arch/powerpc/kvm/book3s_hv_builtin.c b/arch/powerpc/kvm/book3s_hv_builtin.c
> index 8053efdf7ea7..10fc274bea65 100644
> --- a/arch/powerpc/kvm/book3s_hv_builtin.c
> +++ b/arch/powerpc/kvm/book3s_hv_builtin.c
> @@ -17,6 +17,7 @@
>   
>   #include <asm/asm-prototypes.h>
>   #include <asm/cputable.h>
> +#include <asm/interrupt.h>
>   #include <asm/kvm_ppc.h>
>   #include <asm/kvm_book3s.h>
>   #include <asm/archrandom.h>
> diff --git a/arch/powerpc/kvm/booke.c b/arch/powerpc/kvm/booke.c
> index 288a9820ec01..bd2bb73021d8 100644
> --- a/arch/powerpc/kvm/booke.c
> +++ b/arch/powerpc/kvm/booke.c
> @@ -20,6 +20,7 @@
>   
>   #include <asm/cputable.h>
>   #include <linux/uaccess.h>
> +#include <asm/interrupt.h>
>   #include <asm/kvm_ppc.h>
>   #include <asm/cacheflush.h>
>   #include <asm/dbell.h>
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 77073a256cff..453afb9ae9b4 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -38,6 +38,7 @@
>   #include <linux/pgtable.h>
>   
>   #include <asm/debugfs.h>
> +#include <asm/interrupt.h>
>   #include <asm/processor.h>
>   #include <asm/mmu.h>
>   #include <asm/mmu_context.h>
> @@ -1512,7 +1513,7 @@ int hash_page(unsigned long ea, unsigned long access, unsigned long trap,
>   }
>   EXPORT_SYMBOL_GPL(hash_page);
>   
> -long do_hash_fault(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
>   {
>   	unsigned long ea = regs->dar;
>   	unsigned long dsisr = regs->dsisr;
> @@ -1522,27 +1523,6 @@ long do_hash_fault(struct pt_regs *regs)
>   	unsigned int region_id;
>   	long err;
>   
> -	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
> -		goto page_fault;
> -
> -	/*
> -	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
> -	 * don't call hash_page, just fail the fault. This is required to
> -	 * prevent re-entrancy problems in the hash code, namely perf
> -	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
> -	 * hash fault. See the comment in hash_preload().
> -	 *
> -	 * We come here as a result of a DSI at a point where we don't want
> -	 * to call hash_page, such as when we are accessing memory (possibly
> -	 * user memory) inside a PMU interrupt that occurred while interrupts
> -	 * were soft-disabled.  We want to invoke the exception handler for
> -	 * the access, or panic if there isn't a handler.
> -	 */
> -	if (unlikely(in_nmi())) {
> -		bad_page_fault(regs, SIGSEGV);
> -		return 0;
> -	}
> -
>   	region_id = get_region_id(ea);
>   	if ((region_id == VMALLOC_REGION_ID) || (region_id == IO_REGION_ID))
>   		mm = &init_mm;
> @@ -1583,13 +1563,44 @@ long do_hash_fault(struct pt_regs *regs)
>   		err = 0;
>   
>   	} else if (err) {
> -page_fault:
>   		err = do_page_fault(regs);
>   	}
>   
>   	return err;
>   }
>   
> +/*
> + * The _RAW interrupt entry checks for the in_nmi() case before
> + * running the full handler.
> + */
> +DEFINE_INTERRUPT_HANDLER_RAW(do_hash_fault)

Could we do that split into __do_hash_fault() / do_hash_fault() in a preceeding patch ?

> +{
> +	unsigned long dsisr = regs->dsisr;
> +
> +	if (unlikely(dsisr & (DSISR_BAD_FAULT_64S | DSISR_DABRMATCH | DSISR_KEYFAULT)))
> +		return do_page_fault(regs);
> +
> +	/*
> +	 * If we are in an "NMI" (e.g., an interrupt when soft-disabled), then
> +	 * don't call hash_page, just fail the fault. This is required to
> +	 * prevent re-entrancy problems in the hash code, namely perf
> +	 * interrupts hitting while something holds H_PAGE_BUSY, and taking a
> +	 * hash fault. See the comment in hash_preload().
> +	 *
> +	 * We come here as a result of a DSI at a point where we don't want
> +	 * to call hash_page, such as when we are accessing memory (possibly
> +	 * user memory) inside a PMU interrupt that occurred while interrupts
> +	 * were soft-disabled.  We want to invoke the exception handler for
> +	 * the access, or panic if there isn't a handler.
> +	 */
> +	if (unlikely(in_nmi())) {
> +		do_bad_page_fault(regs);
> +		return 0;
> +	}
> +
> +	return __do_hash_fault(regs);
> +}
> +
>   #ifdef CONFIG_PPC_MM_SLICES
>   static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
>   {
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index c581548b533f..0ae10adae203 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -10,6 +10,7 @@
>    */
>   
>   #include <asm/asm-prototypes.h>
> +#include <asm/interrupt.h>
>   #include <asm/mmu.h>
>   #include <asm/mmu_context.h>
>   #include <asm/paca.h>
> @@ -813,7 +814,7 @@ static long slb_allocate_user(struct mm_struct *mm, unsigned long ea)
>   	return slb_insert_entry(ea, context, flags, ssize, false);
>   }
>   
> -long do_slb_fault(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_RAW(do_slb_fault)
>   {
>   	unsigned long ea = regs->dar;
>   	unsigned long id = get_region_id(ea);
> @@ -827,17 +828,19 @@ long do_slb_fault(struct pt_regs *regs)
>   	/*
>   	 * SLB kernel faults must be very careful not to touch anything
>   	 * that is not bolted. E.g., PACA and global variables are okay,
> -	 * mm->context stuff is not.
> -	 *
> -	 * SLB user faults can access all of kernel memory, but must be
> -	 * careful not to touch things like IRQ state because it is not
> -	 * "reconciled" here. The difficulty is that we must use
> -	 * fast_exception_return to return from kernel SLB faults without
> -	 * looking at possible non-bolted memory. We could test user vs
> -	 * kernel faults in the interrupt handler asm and do a full fault,
> -	 * reconcile, ret_from_except for user faults which would make them
> -	 * first class kernel code. But for performance it's probably nicer
> -	 * if they go via fast_exception_return too.
> +	 * mm->context stuff is not. SLB user faults may access all of
> +	 * memory (and induce one recursive SLB kernel fault), so the
> +	 * kernel fault must not trample on the user fault state at those
> +	 * points.
> +	 */
> +
> +	/*
> +	 * This is a _RAW interrupt handler, so it must not touch local
> +	 * irq state, or schedule. We could test for usermode and upgrade
> +	 * to a normal process context (synchronous) interrupt for those,
> +	 * which would make them first-class kernel code and able to be
> +	 * traced and instrumented, although performance would suffer a
> +	 * bit, it would probably be a good tradeoff.

Is the comment change really related to the wrapper macros ?

>   	 */
>   	if (id >= LINEAR_MAP_REGION_ID) {
>   		long err;
> @@ -866,7 +869,7 @@ long do_slb_fault(struct pt_regs *regs)
>   	}
>   }
>   
> -void do_bad_slb_fault(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER(do_bad_slb_fault)
>   {
>   	int err = regs->result;
>   
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 36604ff8b3ec..9e1cd74ebb13 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -34,6 +34,7 @@
>   #include <linux/uaccess.h>
>   
>   #include <asm/firmware.h>
> +#include <asm/interrupt.h>
>   #include <asm/page.h>
>   #include <asm/mmu.h>
>   #include <asm/mmu_context.h>
> @@ -547,7 +548,7 @@ static int __do_page_fault(struct pt_regs *regs, unsigned long address,
>   }
>   NOKPROBE_SYMBOL(__do_page_fault);
>   
> -long do_page_fault(struct pt_regs *regs)
> +DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
>   {
>   	enum ctx_state prev_state = exception_enter();
>   	unsigned long address = regs->dar;
> @@ -641,3 +642,15 @@ void bad_page_fault(struct pt_regs *regs, int sig)
>   	else
>   		__bad_page_fault(regs, sig);
>   }
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +DEFINE_INTERRUPT_HANDLER(__do_bad_page_fault)
> +{
> +	__bad_page_fault(regs, SIGSEGV);
> +}
> +
> +DEFINE_INTERRUPT_HANDLER(do_bad_page_fault)
> +{
> +	bad_page_fault(regs, SIGSEGV);
> +}
> +#endif
> diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
> index e6f461812856..999997d9e9a9 100644
> --- a/arch/powerpc/platforms/powernv/idle.c
> +++ b/arch/powerpc/platforms/powernv/idle.c
> @@ -14,6 +14,7 @@
>   
>   #include <asm/asm-prototypes.h>
>   #include <asm/firmware.h>
> +#include <asm/interrupt.h>
>   #include <asm/machdep.h>
>   #include <asm/opal.h>
>   #include <asm/cputhreads.h>
> 
