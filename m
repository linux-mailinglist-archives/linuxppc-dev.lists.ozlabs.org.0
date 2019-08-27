Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7439DE38
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:48:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Hfb21z1hzDqmF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:48:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="Co9xLSHr"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HfY60HPSzDqTP
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:46:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HfY14QlLz9tx4H;
 Tue, 27 Aug 2019 08:46:29 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Co9xLSHr; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id EYf7wy2ypYlB; Tue, 27 Aug 2019 08:46:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HfY13Kl8z9tx4D;
 Tue, 27 Aug 2019 08:46:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566888389; bh=DrwMBN9W8kwpcw7TK5rySKiow/O9EQoWViLCkNnPXWo=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=Co9xLSHrqvp553g+NYFMYgoaKAuMGXkPbkI3+tLhRbmjBGWeZvFPnFd6uvY+6Mifm
 9K8zJnzRmgTydaRsocKW0G30rMplEcpZ6dffHPOKuM94NzVtdIoMmY+p/SL7k6jXBl
 at5RFwFGbDczF2jLgrZ4egt/vTrerHD+9ET4HzNk=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 67BB38B74C;
 Tue, 27 Aug 2019 08:46:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id eWHY8ZVXYobq; Tue, 27 Aug 2019 08:46:30 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0B8AB8B797;
 Tue, 27 Aug 2019 08:46:30 +0200 (CEST)
Subject: Re: [PATCH 4/4] powerpc/64: system call implement the bulk of the
 logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-6-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3ebe3e11-f3d7-d714-50dc-334527dfee90@c-s.fr>
Date: Tue, 27 Aug 2019 08:46:29 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827033010.28090-6-npiggin@gmail.com>
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



Le 27/08/2019 à 05:30, Nicholas Piggin a écrit :
> System call entry and particularly exit code is beyond the limit of what
> is reasonable to implement in asm.
> 
> This conversion moves all conditional branches out of the asm code,
> except a relatively simple test to see whether all GPRs should be
> restored at exit time.
> 
> Null syscall test is about 5% faster after this patch, because the exit
> work is handled under local_irq_disable, and the hard mask and pending
> interrupt replay is handled after that, which avoids games with MSR.

Interesting optimisation.

> 
> The asm instruction scheduling has not really been analysed and
> optimised yet, as there are higher level features and improvements to
> add first.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |  11 -
>   arch/powerpc/include/asm/ptrace.h         |   3 +
>   arch/powerpc/include/asm/signal.h         |   2 +
>   arch/powerpc/include/asm/switch_to.h      |   4 +
>   arch/powerpc/include/asm/time.h           |   3 +
>   arch/powerpc/kernel/Makefile              |   3 +-
>   arch/powerpc/kernel/entry_64.S            | 343 ++++------------------
>   arch/powerpc/kernel/process.c             |   6 +-
>   arch/powerpc/kernel/signal.h              |   2 -
>   arch/powerpc/kernel/syscall_64.c          | 202 +++++++++++++
>   10 files changed, 271 insertions(+), 308 deletions(-)
>   create mode 100644 arch/powerpc/kernel/syscall_64.c
> 

[...]

> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index 24621e7e5033..f444525da9ce 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -1609,7 +1609,6 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>   	extern void ret_from_kernel_thread(void);
>   	void (*f)(void);
>   	unsigned long sp = (unsigned long)task_stack_page(p) + THREAD_SIZE;
> -	struct thread_info *ti = task_thread_info(p);
>   
>   	klp_init_thread_info(p);
>   
> @@ -1617,6 +1616,8 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>   	sp -= sizeof(struct pt_regs);
>   	childregs = (struct pt_regs *) sp;
>   	if (unlikely(p->flags & PF_KTHREAD)) {
> +		struct thread_info *ti = task_thread_info(p);
> +
>   		/* kernel thread */
>   		memset(childregs, 0, sizeof(struct pt_regs));
>   		childregs->gpr[1] = sp + sizeof(struct pt_regs);
> @@ -1634,12 +1635,13 @@ int copy_thread_tls(unsigned long clone_flags, unsigned long usp,
>   	} else {
>   		/* user thread */
>   		struct pt_regs *regs = current_pt_regs();
> +
>   		CHECK_FULL_REGS(regs);
>   		*childregs = *regs;
>   		if (usp)
>   			childregs->gpr[1] = usp;
>   		p->thread.regs = childregs;
> -		childregs->gpr[3] = 0;  /* Result from fork() */
> +		/* ret_from_fork sets fork() result to 0 */

Does PPC32 ret_from_fork() do it as well ?

>   		if (clone_flags & CLONE_SETTLS) {
>   #ifdef CONFIG_PPC64
>   			if (!is_32bit_task())
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
> new file mode 100644
> index 000000000000..98ed970796d5
> --- /dev/null
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -0,0 +1,202 @@
> +#include <linux/err.h>
> +#include <asm/hw_irq.h>
> +#include <asm/paca.h>
> +#include <asm/ptrace.h>
> +#include <asm/reg.h>
> +#include <asm/signal.h>
> +#include <asm/switch_to.h>
> +#include <asm/syscall.h>
> +#include <asm/time.h>
> +
> +extern void __noreturn tabort_syscall(void);
> +
> +#ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> +static inline void account_cpu_user_entry(void)
> +{
> +	unsigned long tb = mftb();
> +
> +	local_paca->accounting.utime += (tb - local_paca->accounting.starttime_user);
> +	local_paca->accounting.starttime = tb;
> +}
> +static inline void account_cpu_user_exit(void)
> +{
> +	unsigned long tb = mftb();
> +
> +	local_paca->accounting.stime += (tb - local_paca->accounting.starttime);
> +	local_paca->accounting.starttime_user = tb;
> +}
> +#else
> +static inline void account_cpu_user_entry(void)
> +{
> +}
> +static inline void account_cpu_user_exit(void)
> +{
> +}
> +#endif

I think this block should go in arch/powerpc/include/asm/cputime.h, we 
should limit #ifdefs as much as possible in C files.

And use get_accounting() instead of local_paca->accounting in order to 
be usable on PPC32 as well



> +
> +typedef long (*syscall_fn)(long, long, long, long, long, long);
> +
> +long system_call_exception(long r3, long r4, long r5, long r6, long r7, long r8, unsigned long r0, struct pt_regs *regs)
> +{
> +	unsigned long ti_flags;
> +	syscall_fn f;
> +
> +	BUG_ON(!(regs->msr & MSR_PR));
> +
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	if (unlikely(regs->msr & MSR_TS_T))
> +		tabort_syscall();
> +#endif

MSR_TS_T and tabort_syscall() are declared regardless of 
CONFIG_PPC_TRANSACTIONAL_MEM so IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) 
should be used instead of #ifdef

> +
> +	account_cpu_user_entry();
> +
> +#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
> +	if (firmware_has_feature(FW_FEATURE_SPLPAR)) {
> +		struct lppaca *lp = get_lppaca();
> +
> +		if (unlikely(local_paca->dtl_ridx != lp->dtl_idx))
> +			accumulate_stolen_time();
> +	}
> +#endif

Same here, I think everything is available so IS_ENABLED() should be 
used instead of #if

> +
> +#ifdef CONFIG_PPC_KUAP_DEBUG
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
> +#endif

This should go in a helper in one of the kup/kuap header files.

> +
> +	/*
> +	 * A syscall should always be called with interrupts enabled
> +	 * so we just unconditionally hard-enable here. When some kind
> +	 * of irq tracing is used, we additionally check that condition
> +	 * is correct
> +	 */
> +#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)
> +	WARN_ON(irq_soft_mask_return() != IRQS_ENABLED);
> +	WARN_ON(local_paca->irq_happened);
> +#endif

Can we use IS_ENABLED() here as well ?

> +
> +	__hard_irq_enable();
> +
> +	/*
> +	 * We do need to set SOFTE in the stack frame or the return
> +	 * from interrupt will be painful
> +	 */
> +	regs->softe = IRQS_ENABLED;
> +
> +	ti_flags = current_thread_info()->flags;
> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> +		/*
> +		 * We use the return value of do_syscall_trace_enter() as the
> +		 * syscall number. If the syscall was rejected for any reason
> +		 * do_syscall_trace_enter() returns an invalid syscall number
> +		 * and the test below against NR_syscalls will fail.
> +		 */
> +		r0 = do_syscall_trace_enter(regs);
> +	}
> +
> +	if (unlikely(r0 >= NR_syscalls))
> +		return -ENOSYS;
> +
> +	/* May be faster to do array_index_nospec? */
> +	barrier_nospec();
> +
> +	if (unlikely(ti_flags & _TIF_32BIT)) {
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
> +unsigned long syscall_exit_prepare(unsigned long r3, struct pt_regs *regs)
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
> +	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE))
> +		do_syscall_trace_leave(regs);
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
> +#ifdef CONFIG_ALTIVEC
> +	if ((regs->msr & (MSR_FP|MSR_VEC)) != (MSR_FP|MSR_VEC))
> +#else
> +	if ((regs->msr & MSR_FP) != MSR_FP)
> +#endif

Use 'if (IS_ENABLED(CONFIG_ALTIVEC)) / else' instead of an 
#ifdef/#else/#endif

> +		restore_math(regs);
> +
> +	/* This pattern matches prep_irq_for_idle */
> +	__mtmsrd(0, 1);	/* Disable MSR_EE and MSR_RI */
> +	if (unlikely(lazy_irq_pending())) {
> +		__mtmsrd(MSR_RI, 1);
> +		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +		local_irq_enable();
> +		/* Took an interrupt which may have more exit work to do. */
> +		goto again;
> +	}
> +	trace_hardirqs_on();
> +	local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
> +	irq_soft_mask_set(IRQS_ENABLED);
> +
> +	account_cpu_user_exit();
> +
> +#ifdef CONFIG_PPC_KUAP_DEBUG
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))
> +		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
> +#endif

Same, define a helper in the kuap header files to avoid the #ifdefs and 
platform specif stuff here.

> +
> +	return ret;
> +}
> +
> 

Christophe
