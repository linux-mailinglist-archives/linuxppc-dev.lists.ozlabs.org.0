Return-Path: <linuxppc-dev+bounces-2146-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C36A99B294
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Oct 2024 11:36:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XQdf71s4Hz2yMv;
	Sat, 12 Oct 2024 20:35:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728725759;
	cv=none; b=A8r7YIa8R1oCHMdnvTsNARMdpoPGwSC8vVbDHVB42JXhm1Z5S0kVxO/5Mf9FZAACak1brqYS2isWMmgFDQ/jHh6bNOKVyb5X8ywKc6fNjEg3HH7Qcl7FJ9Wk3swWRniNaU0xamCJB/ZjIpFU6IDdPbYr41ccfbyoPD4h9WIEsnZNJSK5pn7LykmQB8j9Wlo9XF3fkoIANE594hNv8vUpACVNp702jm+o+gkyf/KQexEAH9EoKjkY9+loA14lcdDYotW5PHycBBo2yRhbUx76yUkMvKJioTBeZjJxH/O/0vca/1kAXzmEMiQhj9ukJ9O9Pzm+HQn5RswlXMxQsWyXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728725759; c=relaxed/relaxed;
	bh=O9TKp7wUJEP7GfPAG22xUGV/6JE5IDdvoMKZE7wghbY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aGkaqyXFn0/3UTbNM+eW+OmA7YCSHNdHc89F8849nzKQW0wSDl8UGDbeeNJQxGjd2nc6F/6Ce1M9Z4hjNNLClIAZ+c9HlZBYxE95/xYn66yNKToacRZMIZGuxUIRhzsMZkAKHn1l5y990xjPBNIT+BcE2VFw8c17HaG2tksOPL8+EMuOxPOch6qQ1GMIfC8dakO0HgcVVVyUCwgb8sOQBs//0pRSoMNMBcQgTGZKs3giDEHFf1ajW2q0wJn9jEcSCWpjhAdijQWPYwgIb8lqVENjHNsesmgA1GXk9fTR+S4LhQODois75+zH/W2Gh4Eex3JVlcPxRrxgMwb9CUcpwg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XQdf60Y2xz2yLT
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Oct 2024 20:35:57 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XQdf305Y5z9sPd;
	Sat, 12 Oct 2024 11:35:55 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r27Z1httjJ5w; Sat, 12 Oct 2024 11:35:54 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XQdf26HGhz9rvV;
	Sat, 12 Oct 2024 11:35:54 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C54EF8B765;
	Sat, 12 Oct 2024 11:35:54 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id gZs3AGf8cAno; Sat, 12 Oct 2024 11:35:54 +0200 (CEST)
Received: from [192.168.232.206] (unknown [192.168.232.206])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1B9DC8B764;
	Sat, 12 Oct 2024 11:35:54 +0200 (CEST)
Message-ID: <d2040f5b-008b-4c45-9cbc-9ea5c25c9149@csgroup.eu>
Date: Sat, 12 Oct 2024 11:35:53 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] powerpc/entry: add irqentry_state and generic entry
 support
To: Luming Yu <luming.yu@shingroup.cn>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, mpe@ellerman.id.au, npiggin@gmail.com,
 jialong.yang@shingroup.cn, luming.yu@gmail.com
References: <20241012035621.1245-3-luming.yu@shingroup.cn>
 <5ADB50C5F6678977+20241012035621.1245-7-luming.yu@shingroup.cn>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <5ADB50C5F6678977+20241012035621.1245-7-luming.yu@shingroup.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 12/10/2024 à 05:56, Luming Yu a écrit :
> generic irq entry support via generic irqentry is added for powerpc.
> There may be duplciate calls and missing callbacks requires further
> work.
> 
> Signed-off-by: Luming Yu <luming.yu@shingroup.cn>

This patch doesn't apply.

Applying: powerpc/entry: add irqentry_state and generic entry support
error: patch failed: arch/powerpc/kernel/interrupt.c:3
error: arch/powerpc/kernel/interrupt.c: patch does not apply
Patch failed at 0005 powerpc/entry: add irqentry_state and generic entry 
support

I tried on v6.11, v6.12-rc2 and next-20241011

> ---
>   arch/powerpc/include/asm/entry-common.h | 32 ++++++++++++++++
>   arch/powerpc/kernel/interrupt.c         | 51 +++++--------------------
>   arch/powerpc/kernel/signal.c            |  7 ++++
>   arch/powerpc/kernel/syscall.c           |  2 -
>   4 files changed, 49 insertions(+), 43 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index 51f1eb767696..faa829e15b5d 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -3,6 +3,7 @@
>   #define ARCH_POWERPC_ENTRY_COMMON_H
>   
>   #include <linux/user-return-notifier.h>
> +#include <asm/switch_to.h>
>   
>   static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>   						  unsigned long ti_work)
> @@ -13,4 +14,35 @@ static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
>   
>   #define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
>   
> +static inline void arch_exit_to_user_mode_work(struct pt_regs *regs,
> +						unsigned long ti_work)
> +{
> +
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
> +		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +				unlikely((ti_work & _TIF_RESTORE_TM))) {
> +			restore_tm_state(regs);
> +		} else {
> +			unsigned long mathflags = MSR_FP;
> +
> +			if (cpu_has_feature(CPU_FTR_VSX))
> +				mathflags |= MSR_VEC | MSR_VSX;
> +			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
> +				mathflags |= MSR_VEC;
> +
> +			/*
> +			 * If userspace MSR has all available FP bits set,
> +			 * then they are live and no need to restore. If not,
> +			 * it means the regs were given up and restore_math
> +			 * may decide to restore them (to avoid taking an FP
> +			 * fault).
> +			 */
> +			if ((regs->msr & mathflags) != mathflags)
> +				restore_math(regs);
> +		}
> +	}
> +}
> +
> +#define arch_exit_to_user_mode_work arch_exit_to_user_mode_work
> +
>   #endif
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 609ba48034de..42af9217136d 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -3,6 +3,7 @@
>   #include <linux/context_tracking.h>
>   #include <linux/err.h>
>   #include <linux/compat.h>
> +#include <linux/entry-common.h>
>   #include <linux/sched/debug.h> /* for show_regs */
>   
>   #include <asm/kup.h>
> @@ -183,47 +184,11 @@ interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>   
>   again:
>   	ti_flags = read_thread_flags();
> -	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
> -		local_irq_enable();
> -		if (ti_flags & _TIF_NEED_RESCHED) {
> -			schedule();
> -		} else {
> -			/*
> -			 * SIGPENDING must restore signal handler function
> -			 * argument GPRs, and some non-volatiles (e.g., r1).
> -			 * Restore all for now. This could be made lighter.
> -			 */
> -			if (ti_flags & _TIF_SIGPENDING)
> -				ret |= _TIF_RESTOREALL;
> -			do_notify_resume(regs, ti_flags);
> -		}
> -		local_irq_disable();
> -		ti_flags = read_thread_flags();
> -	}
>   
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
> -		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> -				unlikely((ti_flags & _TIF_RESTORE_TM))) {
> -			restore_tm_state(regs);
> -		} else {
> -			unsigned long mathflags = MSR_FP;
> -
> -			if (cpu_has_feature(CPU_FTR_VSX))
> -				mathflags |= MSR_VEC | MSR_VSX;
> -			else if (cpu_has_feature(CPU_FTR_ALTIVEC))
> -				mathflags |= MSR_VEC;
> -
> -			/*
> -			 * If userspace MSR has all available FP bits set,
> -			 * then they are live and no need to restore. If not,
> -			 * it means the regs were given up and restore_math
> -			 * may decide to restore them (to avoid taking an FP
> -			 * fault).
> -			 */
> -			if ((regs->msr & mathflags) != mathflags)
> -				restore_math(regs);
> -		}
> -	}
> +	if (ti_flags & _TIF_SIGPENDING)
> +		ret |= _TIF_RESTOREALL;
> +	if (unlikely(ti_flags & EXIT_TO_USER_MODE_WORK))
> +		ti_flags = exit_to_user_mode_loop(regs, ti_flags);
>   
>   	check_return_regs_valid(regs);
>   
> @@ -297,11 +262,15 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	}
>   
>   	local_irq_disable();
> -	ret = interrupt_exit_user_prepare_main(ret, regs);
> +	if (ti_flags & _TIF_RESTOREALL)
> +		ret |= _TIF_RESTOREALL;
>   
> +	if (ti_flags & _TIF_SIGPENDING)
> +		ret |= _TIF_RESTOREALL;
>   #ifdef CONFIG_PPC64
>   	regs->exit_result = ret;
>   #endif
> +	syscall_exit_to_user_mode(regs);
>   
>   	return ret;
>   }
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index aa17e62f3754..da21e7fef46a 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -11,6 +11,7 @@
>   #include <linux/uprobes.h>
>   #include <linux/key.h>
>   #include <linux/context_tracking.h>
> +#include <linux/entry-common.h>
>   #include <linux/livepatch.h>
>   #include <linux/syscalls.h>
>   #include <asm/hw_breakpoint.h>
> @@ -368,3 +369,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
>   		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
>   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
>   }
> +
> +void arch_do_signal_or_restart(struct pt_regs *regs)
> +{
> +	BUG_ON(regs != current->thread.regs);
> +	do_signal(current);
> +}
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index e0338bd8d383..97f158d13944 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -185,8 +185,6 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>   	 * So the resulting 6 or 7 bits of entropy is seen in SP[9:4] or SP[9:3].
>   	 */
>   	choose_random_kstack_offset(mftb());
> -	/*common entry*/
> -	syscall_exit_to_user_mode(regs);
>   
>   	return ret;
>   }

