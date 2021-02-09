Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B930631485D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 06:51:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DZX7m145bzDsdn
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 Feb 2021 16:51:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DZX5p6cyvzDsd6
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 Feb 2021 16:49:25 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DZX5W0Hy2z9vBLs;
 Tue,  9 Feb 2021 06:49:19 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id YqBdnpsQ-mUV; Tue,  9 Feb 2021 06:49:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DZX5V5XD0z9vBLq;
 Tue,  9 Feb 2021 06:49:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B146D8B7C7;
 Tue,  9 Feb 2021 06:49:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 2uFaGcB5QiT6; Tue,  9 Feb 2021 06:49:18 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B1C898B764;
 Tue,  9 Feb 2021 06:49:17 +0100 (CET)
Subject: Re: [PATCH v7 32/42] powerpc/64: context tracking move to interrupt
 wrappers
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210130130852.2952424-1-npiggin@gmail.com>
 <20210130130852.2952424-33-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3cb26edb-c9cc-4f21-0b6d-dcd4bbeed7b3@csgroup.eu>
Date: Tue, 9 Feb 2021 06:49:13 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210130130852.2952424-33-npiggin@gmail.com>
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
Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/01/2021 à 14:08, Nicholas Piggin a écrit :
> This moves exception_enter/exit calls to wrapper functions for
> synchronous interrupts. More interrupt handlers are covered by
> this than previously.

Why did you enclose everything in #ifdef CONFIG_PPC64 ? As far as I understand, before this patch 
exception_enter() and exception_exit() are called also on PPC32.

Christophe


> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h  |  9 ++++
>   arch/powerpc/kernel/traps.c           | 74 ++++++---------------------
>   arch/powerpc/mm/book3s64/hash_utils.c |  3 --
>   arch/powerpc/mm/fault.c               |  9 +---
>   4 files changed, 27 insertions(+), 68 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 488bdd5bd922..e65ce3e2b071 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -7,10 +7,16 @@
>   #include <asm/ftrace.h>
>   
>   struct interrupt_state {
> +#ifdef CONFIG_PPC64
> +	enum ctx_state ctx_state;
> +#endif
>   };
>   
>   static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
>   {
> +#ifdef CONFIG_PPC64
> +	state->ctx_state = exception_enter();
> +#endif
>   }
>   
>   /*
> @@ -29,6 +35,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>    */
>   static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt_state *state)
>   {
> +#ifdef CONFIG_PPC64
> +	exception_exit(state->ctx_state);
> +#endif
>   }
>   
>   static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index da488e62fb5f..21fd14828827 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1087,41 +1087,28 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(handle_hmi_exception)
>   
>   DEFINE_INTERRUPT_HANDLER(unknown_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
>   	       regs->nip, regs->msr, regs->trap);
>   
>   	_exception(SIGTRAP, regs, TRAP_UNK, 0);
> -
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER_ASYNC(unknown_async_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	printk("Bad trap at PC: %lx, SR: %lx, vector=%lx\n",
>   	       regs->nip, regs->msr, regs->trap);
>   
>   	_exception(SIGTRAP, regs, TRAP_UNK, 0);
> -
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(instruction_breakpoint_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	if (notify_die(DIE_IABR_MATCH, "iabr_match", regs, 5,
>   					5, SIGTRAP) == NOTIFY_STOP)
> -		goto bail;
> +		return;
>   	if (debugger_iabr_match(regs))
> -		goto bail;
> +		return;
>   	_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
> -
> -bail:
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(RunModeException)
> @@ -1131,8 +1118,6 @@ DEFINE_INTERRUPT_HANDLER(RunModeException)
>   
>   DEFINE_INTERRUPT_HANDLER(single_step_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	clear_single_step(regs);
>   	clear_br_trace(regs);
>   
> @@ -1141,14 +1126,11 @@ DEFINE_INTERRUPT_HANDLER(single_step_exception)
>   
>   	if (notify_die(DIE_SSTEP, "single_step", regs, 5,
>   					5, SIGTRAP) == NOTIFY_STOP)
> -		goto bail;
> +		return;
>   	if (debugger_sstep(regs))
> -		goto bail;
> +		return;
>   
>   	_exception(SIGTRAP, regs, TRAP_TRACE, regs->nip);
> -
> -bail:
> -	exception_exit(prev_state);
>   }
>   NOKPROBE_SYMBOL(single_step_exception);
>   
> @@ -1476,7 +1458,6 @@ static inline int emulate_math(struct pt_regs *regs) { return -1; }
>   
>   DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
>   	unsigned int reason = get_reason(regs);
>   
>   	/* We can now get here via a FP Unavailable exception if the core
> @@ -1485,22 +1466,22 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   	if (reason & REASON_FP) {
>   		/* IEEE FP exception */
>   		parse_fpe(regs);
> -		goto bail;
> +		return;
>   	}
>   	if (reason & REASON_TRAP) {
>   		unsigned long bugaddr;
>   		/* Debugger is first in line to stop recursive faults in
>   		 * rcu_lock, notify_die, or atomic_notifier_call_chain */
>   		if (debugger_bpt(regs))
> -			goto bail;
> +			return;
>   
>   		if (kprobe_handler(regs))
> -			goto bail;
> +			return;
>   
>   		/* trap exception */
>   		if (notify_die(DIE_BPT, "breakpoint", regs, 5, 5, SIGTRAP)
>   				== NOTIFY_STOP)
> -			goto bail;
> +			return;
>   
>   		bugaddr = regs->nip;
>   		/*
> @@ -1512,10 +1493,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   		if (!(regs->msr & MSR_PR) &&  /* not user-mode */
>   		    report_bug(bugaddr, regs) == BUG_TRAP_TYPE_WARN) {
>   			regs->nip += 4;
> -			goto bail;
> +			return;
>   		}
>   		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
> -		goto bail;
> +		return;
>   	}
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   	if (reason & REASON_TM) {
> @@ -1536,7 +1517,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   		 */
>   		if (user_mode(regs)) {
>   			_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
> -			goto bail;
> +			return;
>   		} else {
>   			printk(KERN_EMERG "Unexpected TM Bad Thing exception "
>   			       "at %lx (msr 0x%lx) tm_scratch=%llx\n",
> @@ -1567,7 +1548,7 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   	 * pattern to occurrences etc. -dgibson 31/Mar/2003
>   	 */
>   	if (!emulate_math(regs))
> -		goto bail;
> +		return;
>   
>   	/* Try to emulate it if we should. */
>   	if (reason & (REASON_ILLEGAL | REASON_PRIVILEGED)) {
> @@ -1575,10 +1556,10 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   		case 0:
>   			regs->nip += 4;
>   			emulate_single_step(regs);
> -			goto bail;
> +			return;
>   		case -EFAULT:
>   			_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
> -			goto bail;
> +			return;
>   		}
>   	}
>   
> @@ -1587,9 +1568,6 @@ DEFINE_INTERRUPT_HANDLER(program_check_exception)
>   		_exception(SIGILL, regs, ILL_PRVOPC, regs->nip);
>   	else
>   		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> -
> -bail:
> -	exception_exit(prev_state);
>   }
>   NOKPROBE_SYMBOL(program_check_exception);
>   
> @@ -1606,14 +1584,12 @@ NOKPROBE_SYMBOL(emulation_assist_interrupt);
>   
>   DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
>   	int sig, code, fixed = 0;
>   	unsigned long  reason;
>   
>   	interrupt_cond_local_irq_enable(regs);
>   
>   	reason = get_reason(regs);
> -
>   	if (reason & REASON_BOUNDARY) {
>   		sig = SIGBUS;
>   		code = BUS_ADRALN;
> @@ -1621,7 +1597,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   	}
>   
>   	if (tm_abort_check(regs, TM_CAUSE_ALIGNMENT | TM_CAUSE_PERSISTENT))
> -		goto bail;
> +		return;
>   
>   	/* we don't implement logging of alignment exceptions */
>   	if (!(current->thread.align_ctl & PR_UNALIGN_SIGBUS))
> @@ -1631,7 +1607,7 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   		/* skip over emulated instruction */
>   		regs->nip += inst_length(reason);
>   		emulate_single_step(regs);
> -		goto bail;
> +		return;
>   	}
>   
>   	/* Operand address was bad */
> @@ -1647,9 +1623,6 @@ DEFINE_INTERRUPT_HANDLER(alignment_exception)
>   		_exception(sig, regs, code, regs->dar);
>   	else
>   		bad_page_fault(regs, sig);
> -
> -bail:
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(StackOverflow)
> @@ -1663,41 +1636,28 @@ DEFINE_INTERRUPT_HANDLER(StackOverflow)
>   
>   DEFINE_INTERRUPT_HANDLER(stack_overflow_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	die("Kernel stack overflow", regs, SIGSEGV);
> -
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(kernel_fp_unavailable_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	printk(KERN_EMERG "Unrecoverable FP Unavailable Exception "
>   			  "%lx at %lx\n", regs->trap, regs->nip);
>   	die("Unrecoverable FP Unavailable Exception", regs, SIGABRT);
> -
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(altivec_unavailable_exception)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -
>   	if (user_mode(regs)) {
>   		/* A user program has executed an altivec instruction,
>   		   but this kernel doesn't support altivec. */
>   		_exception(SIGILL, regs, ILL_ILLOPC, regs->nip);
> -		goto bail;
> +		return;
>   	}
>   
>   	printk(KERN_EMERG "Unrecoverable VMX/Altivec Unavailable Exception "
>   			"%lx at %lx\n", regs->trap, regs->nip);
>   	die("Unrecoverable VMX/Altivec Unavailable Exception", regs, SIGABRT);
> -
> -bail:
> -	exception_exit(prev_state);
>   }
>   
>   DEFINE_INTERRUPT_HANDLER(vsx_unavailable_exception)
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index d681dc5a7b1c..fb7c10524bcd 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1514,7 +1514,6 @@ EXPORT_SYMBOL_GPL(hash_page);
>   DECLARE_INTERRUPT_HANDLER_RET(__do_hash_fault);
>   DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
>   {
> -	enum ctx_state prev_state = exception_enter();
>   	unsigned long ea = regs->dar;
>   	unsigned long dsisr = regs->dsisr;
>   	unsigned long access = _PAGE_PRESENT | _PAGE_READ;
> @@ -1563,8 +1562,6 @@ DEFINE_INTERRUPT_HANDLER_RET(__do_hash_fault)
>   		err = 0;
>   	}
>   
> -	exception_exit(prev_state);
> -
>   	return err;
>   }
>   
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 9c4220efc20f..b26a7643fc6e 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -564,14 +564,7 @@ NOKPROBE_SYMBOL(__do_page_fault);
>   
>   DEFINE_INTERRUPT_HANDLER_RET(do_page_fault)
>   {
> -	enum ctx_state prev_state = exception_enter();
> -	long err;
> -
> -	err = __do_page_fault(regs);
> -
> -	exception_exit(prev_state);
> -
> -	return err;
> +	return __do_page_fault(regs);
>   }
>   NOKPROBE_SYMBOL(do_page_fault);
>   
> 
