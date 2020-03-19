Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F36618AFF4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 10:21:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jhH35PDbzDr2h
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 20:21:19 +1100 (AEDT)
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
 header.s=mail header.b=gIKoOO8+; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jhCm624mzDqw6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 20:18:27 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48jhCZ3l2Kz9tyTf;
 Thu, 19 Mar 2020 10:18:18 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=gIKoOO8+; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5xnCEm5R4y8h; Thu, 19 Mar 2020 10:18:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48jhCZ2f30z9tyTc;
 Thu, 19 Mar 2020 10:18:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584609498; bh=kXfna76I8xNdCFtBCNxMqhLlUJCY1RFZBf9QIgVmrsI=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=gIKoOO8+XdutMF3CNqojNKYfc4/yPVoVz2agqWPO+oCC1/CKY8qJO/KHCd5/LlZJG
 Sd2OeQWC2SMUhwajxev4CVAqv/MVrLVl5v8sHXssTSvS4wWy9kgTvQzWdbLb/U/Op/
 Ph/uR6tnOGr32GpzOLwQMMWv2WVESQY0cIRKAgEY=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 577828B84C;
 Thu, 19 Mar 2020 10:18:19 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id KXEhvet0x3dw; Thu, 19 Mar 2020 10:18:19 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 976078B849;
 Thu, 19 Mar 2020 10:18:18 +0100 (CET)
Subject: Re: [PATCH v3 25/32] powerpc/64: system call implement entry/exit
 logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-26-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b64d5395-1280-e997-fc56-aaaaba7bffad@c-s.fr>
Date: Thu, 19 Mar 2020 10:18:12 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200225173541.1549955-26-npiggin@gmail.com>
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 25/02/2020 à 18:35, Nicholas Piggin a écrit :
> System call entry and particularly exit code is beyond the limit of what
> is reasonable to implement in asm.
> 
> This conversion moves all conditional branches out of the asm code,
> except for the case that all GPRs should be restored at exit.
> 
> Null syscall test is about 5% faster after this patch, because the exit
> work is handled under local_irq_disable, and the hard mask and pending
> interrupt replay is handled after that, which avoids games with MSR.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Michal Suchanek <msuchanek@suse.de>
> ---
> 
> v2,rebase (from Michal):
> - Add endian conversion for dtl_idx (ms)
> - Fix sparse warning about missing declaration (ms)
> - Add unistd.h to fix some defconfigs, add SPDX, minor formatting (mpe)
> 
> v3: Fixes thanks to reports from mpe and selftests errors:
> - Several soft-mask debug and unsafe smp_processor_id() warnings due to
>    tracing and other false positives due to checks in "unreconciled" code.
> - Fix a bug with syscall tracing functions that set registers (e.g.,
>    PTRACE_SETREG) not setting GPRs properly.
> - Fix silly tabort_syscall bug that causes kernel crashes when making system
>    calls in transactional state.
> 
>   arch/powerpc/include/asm/asm-prototypes.h     |  17 +-
>   .../powerpc/include/asm/book3s/64/kup-radix.h |  14 +-
>   arch/powerpc/include/asm/cputime.h            |  29 ++
>   arch/powerpc/include/asm/hw_irq.h             |   4 +
>   arch/powerpc/include/asm/ptrace.h             |   3 +
>   arch/powerpc/include/asm/signal.h             |   3 +
>   arch/powerpc/include/asm/switch_to.h          |   5 +
>   arch/powerpc/include/asm/time.h               |   3 +
>   arch/powerpc/kernel/Makefile                  |   3 +-
>   arch/powerpc/kernel/entry_64.S                | 338 +++---------------
>   arch/powerpc/kernel/signal.h                  |   2 -
>   arch/powerpc/kernel/syscall_64.c              | 213 +++++++++++
>   arch/powerpc/kernel/systbl.S                  |   9 +-
>   13 files changed, 328 insertions(+), 315 deletions(-)
>   create mode 100644 arch/powerpc/kernel/syscall_64.c
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index 983c0084fb3f..4b3609554e76 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -97,6 +97,12 @@ ppc_select(int n, fd_set __user *inp, fd_set __user *outp, fd_set __user *exp,
>   unsigned long __init early_init(unsigned long dt_ptr);
>   void __init machine_init(u64 dt_ptr);
>   #endif
> +#ifdef CONFIG_PPC64

This ifdef is not necessary as it has no pending #else.
Having function declaration without definition is not an issue.
Keeping in mind that we are aiming at generalising this to PPC32.

> +long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs);
> +notrace unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs);
> +notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr);
> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr);
> +#endif
>   
>   long ppc_fadvise64_64(int fd, int advice, u32 offset_high, u32 offset_low,
>   		      u32 len_high, u32 len_low);
> @@ -104,14 +110,6 @@ long sys_switch_endian(void);
>   notrace unsigned int __check_irq_replay(void);
>   void notrace restore_interrupts(void);
>   
> -/* ptrace */
> -long do_syscall_trace_enter(struct pt_regs *regs);
> -void do_syscall_trace_leave(struct pt_regs *regs);
> -
> -/* process */
> -void restore_math(struct pt_regs *regs);
> -void restore_tm_state(struct pt_regs *regs);
> -
>   /* prom_init (OpenFirmware) */
>   unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>   			       unsigned long pp,
> @@ -122,9 +120,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>   void __init early_setup(unsigned long dt_ptr);
>   void early_setup_secondary(void);
>   
> -/* time */
> -void accumulate_stolen_time(void);
> -
>   /* misc runtime */
>   extern u64 __bswapdi2(u64);
>   extern s64 __lshrdi3(s64, int);
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index 90dd3a3fc8c7..71081d90f999 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -3,6 +3,7 @@
>   #define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
>   
>   #include <linux/const.h>
> +#include <asm/reg.h>
>   
>   #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
>   #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
> @@ -56,7 +57,14 @@
>   
>   #ifdef CONFIG_PPC_KUAP
>   
> -#include <asm/reg.h>
> +#include <asm/mmu.h>
> +#include <asm/ptrace.h>
> +
> +static inline void kuap_check_amr(void)
> +{
> +	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
> +}
>   
>   /*
>    * We support individually allowing read or write, but we don't support nesting
> @@ -127,6 +135,10 @@ bad_kuap_fault(struct pt_regs *regs, unsigned long address, bool is_write)
>   		    (regs->kuap & (is_write ? AMR_KUAP_BLOCK_WRITE : AMR_KUAP_BLOCK_READ)),
>   		    "Bug: %s fault blocked by AMR!", is_write ? "Write" : "Read");
>   }
> +#else /* CONFIG_PPC_KUAP */
> +static inline void kuap_check_amr(void)
> +{
> +}
>   #endif /* CONFIG_PPC_KUAP */
>   
>   #endif /* __ASSEMBLY__ */
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index 2431b4ada2fa..6639a6847cc0 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -44,6 +44,28 @@ static inline unsigned long cputime_to_usecs(const cputime_t ct)
>   #ifdef CONFIG_PPC64
>   #define get_accounting(tsk)	(&get_paca()->accounting)
>   static inline void arch_vtime_task_switch(struct task_struct *tsk) { }

Could we have the below additions sit outside of this PPC64 ifdef, to be 
reused on PPC32 ?

> +
> +/*
> + * account_cpu_user_entry/exit runs "unreconciled", so can't trace,
> + * can't use use get_paca()
> + */
> +static notrace inline void account_cpu_user_entry(void)
> +{
> +	unsigned long tb = mftb();
> +	struct cpu_accounting_data *acct = &local_paca->accounting;

In the spirit of reusing that code on PPC32, can we use get_accounting() 
? Or an alternate version of get_accounting(), eg 
get_accounting_notrace() to be defined ?

> +
> +	acct->utime += (tb - acct->starttime_user);
> +	acct->starttime = tb;
> +}
> +static notrace inline void account_cpu_user_exit(void)
> +{
> +	unsigned long tb = mftb();
> +	struct cpu_accounting_data *acct = &local_paca->accounting;
> +
> +	acct->stime += (tb - acct->starttime);
> +	acct->starttime_user = tb;
> +}
> +
>   #else
>   #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
>   /*
> @@ -61,5 +83,12 @@ static inline void arch_vtime_task_switch(struct task_struct *prev)
>   #endif
>   
>   #endif /* __KERNEL__ */
> +#else /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> +static inline void account_cpu_user_entry(void)
> +{
> +}
> +static inline void account_cpu_user_exit(void)
> +{
> +}
>   #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>   #endif /* __POWERPC_CPUTIME_H */
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index e3a905e3d573..310583e62bd9 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -228,9 +228,13 @@ static inline bool arch_irqs_disabled(void)
>   #ifdef CONFIG_PPC_BOOK3E
>   #define __hard_irq_enable()	wrtee(MSR_EE)
>   #define __hard_irq_disable()	wrtee(0)
> +#define __hard_EE_RI_disable()	wrtee(0)
> +#define __hard_RI_enable()	do { } while (0)
>   #else
>   #define __hard_irq_enable()	__mtmsrd(MSR_EE|MSR_RI, 1)
>   #define __hard_irq_disable()	__mtmsrd(MSR_RI, 1)
> +#define __hard_EE_RI_disable()	__mtmsrd(0, 1)
> +#define __hard_RI_enable()	__mtmsrd(MSR_RI, 1)
>   #endif
>   
>   #define hard_irq_disable()	do {					\
> diff --git a/arch/powerpc/include/asm/ptrace.h b/arch/powerpc/include/asm/ptrace.h
> index ee3ada66deb5..082a40153b94 100644
> --- a/arch/powerpc/include/asm/ptrace.h
> +++ b/arch/powerpc/include/asm/ptrace.h
> @@ -138,6 +138,9 @@ extern unsigned long profile_pc(struct pt_regs *regs);
>   #define profile_pc(regs) instruction_pointer(regs)
>   #endif
>   
> +long do_syscall_trace_enter(struct pt_regs *regs);
> +void do_syscall_trace_leave(struct pt_regs *regs);
> +
>   #define kernel_stack_pointer(regs) ((regs)->gpr[1])
>   static inline int is_syscall_success(struct pt_regs *regs)
>   {
> diff --git a/arch/powerpc/include/asm/signal.h b/arch/powerpc/include/asm/signal.h
> index 0803ca8b9149..99e1c6de27bc 100644
> --- a/arch/powerpc/include/asm/signal.h
> +++ b/arch/powerpc/include/asm/signal.h
> @@ -6,4 +6,7 @@
>   #include <uapi/asm/signal.h>
>   #include <uapi/asm/ptrace.h>
>   
> +struct pt_regs;
> +void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
> +
>   #endif /* _ASM_POWERPC_SIGNAL_H */
> diff --git a/arch/powerpc/include/asm/switch_to.h b/arch/powerpc/include/asm/switch_to.h
> index 5b03d8a82409..476008bc3d08 100644
> --- a/arch/powerpc/include/asm/switch_to.h
> +++ b/arch/powerpc/include/asm/switch_to.h
> @@ -5,6 +5,7 @@
>   #ifndef _ASM_POWERPC_SWITCH_TO_H
>   #define _ASM_POWERPC_SWITCH_TO_H
>   
> +#include <linux/sched.h>
>   #include <asm/reg.h>
>   
>   struct thread_struct;
> @@ -22,6 +23,10 @@ extern void switch_booke_debug_regs(struct debug_reg *new_debug);
>   
>   extern int emulate_altivec(struct pt_regs *);
>   
> +void restore_math(struct pt_regs *regs);
> +
> +void restore_tm_state(struct pt_regs *regs);
> +
>   extern void flush_all_to_thread(struct task_struct *);
>   extern void giveup_all(struct task_struct *);
>   
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index e0107495c4de..39ce95016a3a 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -194,5 +194,8 @@ DECLARE_PER_CPU(u64, decrementers_next_tb);
>   /* Convert timebase ticks to nanoseconds */
>   unsigned long long tb_to_ns(unsigned long long tb_ticks);
>   
> +/* SPLPAR */
> +void accumulate_stolen_time(void);
> +
>   #endif /* __KERNEL__ */
>   #endif /* __POWERPC_TIME_H */
> diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
> index 78a1b22d4fd8..5700231a8988 100644
> --- a/arch/powerpc/kernel/Makefile
> +++ b/arch/powerpc/kernel/Makefile
> @@ -50,7 +50,8 @@ obj-y				:= cputable.o ptrace.o syscalls.o \
>   				   of_platform.o prom_parse.o
>   obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
>   				   signal_64.o ptrace32.o \
> -				   paca.o nvram_64.o firmware.o note.o
> +				   paca.o nvram_64.o firmware.o note.o \
> +				   syscall_64.o
>   obj-$(CONFIG_VDSO32)		+= vdso32/
>   obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
>   obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o

[snip]

> diff --git a/arch/powerpc/kernel/signal.h b/arch/powerpc/kernel/signal.h
> index 800433685888..d396efca4068 100644
> --- a/arch/powerpc/kernel/signal.h
> +++ b/arch/powerpc/kernel/signal.h
> @@ -10,8 +10,6 @@
>   #ifndef _POWERPC_ARCH_SIGNAL_H
>   #define _POWERPC_ARCH_SIGNAL_H
>   
> -extern void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags);
> -
>   extern void __user *get_sigframe(struct ksignal *ksig, unsigned long sp,
>   				  size_t frame_size, int is_32);
>   
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c

Could some part of it go in a syscall.c to be reused on PPC32 ?

> new file mode 100644
> index 000000000000..20f77cc19df8
> --- /dev/null
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -0,0 +1,213 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +
> +#include <linux/err.h>
> +#include <asm/asm-prototypes.h>
> +#include <asm/book3s/64/kup-radix.h>
> +#include <asm/cputime.h>
> +#include <asm/hw_irq.h>
> +#include <asm/kprobes.h>
> +#include <asm/paca.h>
> +#include <asm/ptrace.h>
> +#include <asm/reg.h>
> +#include <asm/signal.h>
> +#include <asm/switch_to.h>
> +#include <asm/syscall.h>
> +#include <asm/time.h>
> +#include <asm/unistd.h>
> +
> +extern void __noreturn tabort_syscall(unsigned long nip, unsigned long msr);
> +
> +typedef long (*syscall_fn)(long, long, long, long, long, long);
> +
> +/* Has to run notrace because it is entered "unreconciled" */
> +notrace long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8,
> +			   unsigned long r0, struct pt_regs *regs)
> +{
> +	unsigned long ti_flags;
> +	syscall_fn f;
> +
> +	BUG_ON(!(regs->msr & MSR_PR));
> +
> +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +	    unlikely(regs->msr & MSR_TS_T))
> +		tabort_syscall(regs->nip, regs->msr);
> +
> +	account_cpu_user_entry();
> +
> +#ifdef CONFIG_PPC_SPLPAR
> +	if (IS_ENABLED(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) &&
> +	    firmware_has_feature(FW_FEATURE_SPLPAR)) {
> +		struct lppaca *lp = local_paca->lppaca_ptr;
> +
> +		if (unlikely(local_paca->dtl_ridx != be64_to_cpu(lp->dtl_idx)))
> +			accumulate_stolen_time();
> +	}
> +#endif
> +
> +	kuap_check_amr();
> +
> +	/*
> +	 * A syscall should always be called with interrupts enabled
> +	 * so we just unconditionally hard-enable here. When some kind
> +	 * of irq tracing is used, we additionally check that condition
> +	 * is correct
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
> +		WARN_ON(irq_soft_mask_return() != IRQS_ENABLED);
> +		WARN_ON(local_paca->irq_happened);
> +	}
> +	/*
> +	 * This is not required for the syscall exit path, but makes the
> +	 * stack frame look nicer. If this was initialised in the first stack
> +	 * frame, or if the unwinder was taught the first stack frame always
> +	 * returns to user with IRQS_ENABLED, this store could be avoided!
> +	 */
> +	regs->softe = IRQS_ENABLED;

softe doesn't exist on PPC32. Can we do that through a helper ?

> +
> +	__hard_irq_enable();

This doesn't exist on PPC32. Should we define __hard_irq_enable() as 
arch_local_irq_enable() on PPC32 ?

> +
> +	ti_flags = current_thread_info()->flags;
> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +		/*
> +		 * We use the return value of do_syscall_trace_enter() as the
> +		 * syscall number. If the syscall was rejected for any reason
> +		 * do_syscall_trace_enter() returns an invalid syscall number
> +		 * and the test against NR_syscalls will fail and the return
> +		 * value to be used is in regs->gpr[3].
> +		 */
> +		r0 = do_syscall_trace_enter(regs);
> +		if (unlikely(r0 >= NR_syscalls))
> +			return regs->gpr[3];
> +		r3 = regs->gpr[3];
> +		r4 = regs->gpr[4];
> +		r5 = regs->gpr[5];
> +		r6 = regs->gpr[6];
> +		r7 = regs->gpr[7];
> +		r8 = regs->gpr[8];
> +
> +	} else if (unlikely(r0 >= NR_syscalls)) {
> +		return -ENOSYS;
> +	}
> +
> +	/* May be faster to do array_index_nospec? */
> +	barrier_nospec();
> +
> +	if (unlikely(ti_flags & _TIF_32BIT)) {

Use is_compat_task() instead ?

> +		f = (void *)compat_sys_call_table[r0];
> +
> +		r3 &= 0x00000000ffffffffULL;
> +		r4 &= 0x00000000ffffffffULL;
> +		r5 &= 0x00000000ffffffffULL;
> +		r6 &= 0x00000000ffffffffULL;
> +		r7 &= 0x00000000ffffffffULL;
> +		r8 &= 0x00000000ffffffffULL;
> +
> +	} else {
> +		f = (void *)sys_call_table[r0];
> +	}
> +
> +	return f(r3, r4, r5, r6, r7, r8);
> +}
> +
> +/*
> + * This should be called after a syscall returns, with r3 the return value
> + * from the syscall. If this function returns non-zero, the system call
> + * exit assembly should additionally load all GPR registers and CTR and XER
> + * from the interrupt frame.
> + *
> + * The function graph tracer can not trace the return side of this function,
> + * because RI=0 and soft mask state is "unreconciled", so it is marked notrace.
> + */
> +notrace unsigned long syscall_exit_prepare(unsigned long r3,
> +					   struct pt_regs *regs)
> +{
> +	unsigned long *ti_flagsp = &current_thread_info()->flags;
> +	unsigned long ti_flags;
> +	unsigned long ret = 0;
> +
> +	regs->result = r3;
> +
> +	/* Check whether the syscall is issued inside a restartable sequence */
> +	rseq_syscall(regs);
> +
> +	ti_flags = *ti_flagsp;
> +
> +	if (unlikely(r3 >= (unsigned long)-MAX_ERRNO)) {
> +		if (likely(!(ti_flags & (_TIF_NOERROR | _TIF_RESTOREALL)))) {
> +			r3 = -r3;
> +			regs->ccr |= 0x10000000; /* Set SO bit in CR */
> +		}
> +	}
> +
> +	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
> +		if (ti_flags & _TIF_RESTOREALL)
> +			ret = _TIF_RESTOREALL;
> +		else
> +			regs->gpr[3] = r3;
> +		clear_bits(_TIF_PERSYSCALL_MASK, ti_flagsp);
> +	} else {
> +		regs->gpr[3] = r3;
> +	}
> +
> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +		do_syscall_trace_leave(regs);
> +		ret |= _TIF_RESTOREALL;
> +	}
> +
> +again:
> +	local_irq_disable();
> +	ti_flags = READ_ONCE(*ti_flagsp);
> +	while (unlikely(ti_flags & _TIF_USER_WORK_MASK)) {
> +		local_irq_enable();
> +		if (ti_flags & _TIF_NEED_RESCHED) {
> +			schedule();
> +		} else {
> +			/*
> +			 * SIGPENDING must restore signal handler function
> +			 * argument GPRs, and some non-volatiles (e.g., r1).
> +			 * Restore all for now. This could be made lighter.
> +			 */
> +			if (ti_flags & _TIF_SIGPENDING)
> +				ret |= _TIF_RESTOREALL;
> +			do_notify_resume(regs, ti_flags);
> +		}
> +		local_irq_disable();
> +		ti_flags = READ_ONCE(*ti_flagsp);
> +	}
> +
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && IS_ENABLED(CONFIG_PPC_FPU)) {
> +		unsigned long mathflags = MSR_FP;
> +
> +		if (IS_ENABLED(CONFIG_ALTIVEC))
> +			mathflags |= MSR_VEC;
> +
> +		if ((regs->msr & mathflags) != mathflags)
> +			restore_math(regs);
> +	}
> +
> +	/* This must be done with RI=1 because tracing may touch vmaps */
> +	trace_hardirqs_on();
> +
> +	/* This pattern matches prep_irq_for_idle */
> +	__hard_EE_RI_disable();
> +	if (unlikely(lazy_irq_pending())) {
> +		__hard_RI_enable();
> +		trace_hardirqs_off();
> +		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +		local_irq_enable();
> +		/* Took an interrupt which may have more exit work to do. */
> +		goto again;
> +	}
> +	local_paca->irq_happened = 0;
> +	irq_soft_mask_set(IRQS_ENABLED);
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	local_paca->tm_scratch = regs->msr;
> +#endif
> +
> +	kuap_check_amr();
> +
> +	account_cpu_user_exit();
> +
> +	return ret;
> +}
> diff --git a/arch/powerpc/kernel/systbl.S b/arch/powerpc/kernel/systbl.S
> index 5b905a2f4e4d..d34276f3c495 100644
> --- a/arch/powerpc/kernel/systbl.S
> +++ b/arch/powerpc/kernel/systbl.S
> @@ -16,25 +16,22 @@
>   
>   #ifdef CONFIG_PPC64
>   	.p2align	3
> +#define __SYSCALL(nr, entry)	.8byte entry
> +#else
> +#define __SYSCALL(nr, entry)	.long entry
>   #endif
>   
>   .globl sys_call_table
>   sys_call_table:
>   #ifdef CONFIG_PPC64
> -#define __SYSCALL(nr, entry)	.8byte DOTSYM(entry)
>   #include <asm/syscall_table_64.h>
> -#undef __SYSCALL
>   #else
> -#define __SYSCALL(nr, entry)	.long entry
>   #include <asm/syscall_table_32.h>
> -#undef __SYSCALL
>   #endif
>   
>   #ifdef CONFIG_COMPAT
>   .globl compat_sys_call_table
>   compat_sys_call_table:
>   #define compat_sys_sigsuspend	sys_sigsuspend
> -#define __SYSCALL(nr, entry)	.8byte DOTSYM(entry)
>   #include <asm/syscall_table_c32.h>
> -#undef __SYSCALL
>   #endif
> 

Christophe
