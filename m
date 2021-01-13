Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A5072F4DC9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:53:21 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9Rd3tvLzDrdj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 01:53:17 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9Nt3gg4zDrYy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:50:52 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9Nk1cVFz9tynp;
 Wed, 13 Jan 2021 15:50:46 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id dp964X1eW0Uc; Wed, 13 Jan 2021 15:50:46 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9Nj6N9Vz9tynl;
 Wed, 13 Jan 2021 15:50:45 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BB70D8B7E3;
 Wed, 13 Jan 2021 15:50:46 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id H35OtRDPID38; Wed, 13 Jan 2021 15:50:46 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F4508B772;
 Wed, 13 Jan 2021 15:50:46 +0100 (CET)
Subject: Re: [PATCH v5 09/21] powerpc/64: context tracking remove _TIF_NOHZ
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-10-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6527f4ec-2011-75b3-1db2-ec6d9b120dd9@csgroup.eu>
Date: Wed, 13 Jan 2021 15:50:43 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-10-npiggin@gmail.com>
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
> Add context tracking to the system call handler explicitly, and remove
> _TIF_NOHZ.
> 
> This saves 35 cycles on gettid system call cost on POWER9 with a
> CONFIG_NOHZ_FULL kernel.

35 cycles among 100 cycles, or among 5000 cycles ? I meant what pourcentage to you win ?

Christophe

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/Kconfig                   |  1 -
>   arch/powerpc/include/asm/thread_info.h |  4 +---
>   arch/powerpc/kernel/ptrace/ptrace.c    |  4 ----
>   arch/powerpc/kernel/signal.c           |  4 ----
>   arch/powerpc/kernel/syscall_64.c       | 10 ++++++++++
>   5 files changed, 11 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 107bb4319e0e..28d5a1b1510f 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -196,7 +196,6 @@ config PPC
>   	select HAVE_STACKPROTECTOR		if PPC64 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r13)
>   	select HAVE_STACKPROTECTOR		if PPC32 && $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=r2)
>   	select HAVE_CONTEXT_TRACKING		if PPC64
> -	select HAVE_TIF_NOHZ			if PPC64
>   	select HAVE_DEBUG_KMEMLEAK
>   	select HAVE_DEBUG_STACKOVERFLOW
>   	select HAVE_DYNAMIC_FTRACE
> diff --git a/arch/powerpc/include/asm/thread_info.h b/arch/powerpc/include/asm/thread_info.h
> index 3d8a47af7a25..386d576673a1 100644
> --- a/arch/powerpc/include/asm/thread_info.h
> +++ b/arch/powerpc/include/asm/thread_info.h
> @@ -94,7 +94,6 @@ void arch_setup_new_exec(void);
>   #define TIF_PATCH_PENDING	6	/* pending live patching update */
>   #define TIF_SYSCALL_AUDIT	7	/* syscall auditing active */
>   #define TIF_SINGLESTEP		8	/* singlestepping active */
> -#define TIF_NOHZ		9	/* in adaptive nohz mode */
>   #define TIF_SECCOMP		10	/* secure computing */
>   #define TIF_RESTOREALL		11	/* Restore all regs (implies NOERROR) */
>   #define TIF_NOERROR		12	/* Force successful syscall return */
> @@ -128,11 +127,10 @@ void arch_setup_new_exec(void);
>   #define _TIF_UPROBE		(1<<TIF_UPROBE)
>   #define _TIF_SYSCALL_TRACEPOINT	(1<<TIF_SYSCALL_TRACEPOINT)
>   #define _TIF_EMULATE_STACK_STORE	(1<<TIF_EMULATE_STACK_STORE)
> -#define _TIF_NOHZ		(1<<TIF_NOHZ)
>   #define _TIF_SYSCALL_EMU	(1<<TIF_SYSCALL_EMU)
>   #define _TIF_SYSCALL_DOTRACE	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_AUDIT | \
>   				 _TIF_SECCOMP | _TIF_SYSCALL_TRACEPOINT | \
> -				 _TIF_NOHZ | _TIF_SYSCALL_EMU)
> +				 _TIF_SYSCALL_EMU)
>   
>   #define _TIF_USER_WORK_MASK	(_TIF_SIGPENDING | _TIF_NEED_RESCHED | \
>   				 _TIF_NOTIFY_RESUME | _TIF_UPROBE | \
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 3d44b73adb83..4f3d4ff3728c 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -262,8 +262,6 @@ long do_syscall_trace_enter(struct pt_regs *regs)
>   {
>   	u32 flags;
>   
> -	user_exit();
> -
>   	flags = READ_ONCE(current_thread_info()->flags) &
>   		(_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
>   
> @@ -340,8 +338,6 @@ void do_syscall_trace_leave(struct pt_regs *regs)
>   	step = test_thread_flag(TIF_SINGLESTEP);
>   	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
>   		tracehook_report_syscall_exit(regs, step);
> -
> -	user_enter();
>   }
>   
>   void __init pt_regs_check(void);
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 53782aa60ade..9ded046edb0e 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -282,8 +282,6 @@ static void do_signal(struct task_struct *tsk)
>   
>   void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
>   {
> -	user_exit();
> -
>   	if (thread_info_flags & _TIF_UPROBE)
>   		uprobe_notify_resume(regs);
>   
> @@ -299,8 +297,6 @@ void do_notify_resume(struct pt_regs *regs, unsigned long thread_info_flags)
>   		tracehook_notify_resume(regs);
>   		rseq_handle_notify_resume(NULL, regs);
>   	}
> -
> -	user_enter();
>   }
>   
>   static unsigned long get_tm_stackpointer(struct task_struct *tsk)
> diff --git a/arch/powerpc/kernel/syscall_64.c b/arch/powerpc/kernel/syscall_64.c
> index dd87b2118620..d7d256a7a41f 100644
> --- a/arch/powerpc/kernel/syscall_64.c
> +++ b/arch/powerpc/kernel/syscall_64.c
> @@ -1,9 +1,11 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   
> +#include <linux/context_tracking.h>
>   #include <linux/err.h>
>   #include <asm/asm-prototypes.h>
>   #include <asm/kup.h>
>   #include <asm/cputime.h>
> +#include <asm/interrupt.h>
>   #include <asm/hw_irq.h>
>   #include <asm/interrupt.h>
>   #include <asm/kprobes.h>
> @@ -28,6 +30,9 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>   		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
>   
> +	CT_WARN_ON(ct_state() == CONTEXT_KERNEL);
> +	user_exit_irqoff();
> +
>   	trace_hardirqs_off(); /* finish reconciling */
>   
>   	if (IS_ENABLED(CONFIG_PPC_BOOK3S))
> @@ -182,6 +187,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	unsigned long ti_flags;
>   	unsigned long ret = 0;
>   
> +	CT_WARN_ON(ct_state() == CONTEXT_USER);
> +
>   	kuap_check_amr();
>   
>   	regs->result = r3;
> @@ -258,8 +265,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   		}
>   	}
>   
> +	user_enter_irqoff();
> +
>   	/* scv need not set RI=0 because SRRs are not used */
>   	if (unlikely(!prep_irq_for_enabled_exit(!scv))) {
> +		user_exit_irqoff();
>   		local_irq_enable();
>   		goto again;
>   	}
> 
