Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D262319A5EE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 09:08:55 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48sckF0kzQzDqvh
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Apr 2020 18:08:53 +1100 (AEDT)
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
 header.s=mail header.b=Lgzddt8K; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48sccJ02bczDqTL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Apr 2020 18:03:43 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48sccB1z97z9v9vW;
 Wed,  1 Apr 2020 09:03:38 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=Lgzddt8K; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id uaM796s1ZBDF; Wed,  1 Apr 2020 09:03:38 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48sccB0BDRz9v9vV;
 Wed,  1 Apr 2020 09:03:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1585724618; bh=GwGauuNF6jU7UF4nqhrDnBSENxLXfKANmoFBxCjRZ34=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=Lgzddt8KiBjMPaVDocBUNyHbGQb3Ha8T/Oo5C/csiid7v7lu8qPlqXUP2ySyG8dU3
 466ohivcusq33ErHPwJIruZKUkVbm4IOh2mB4whliJ5CjF77vS2sM8FUnHo5JuE71f
 6bkiFN6xy0Tf18hYiog78wnN1iydOQWM1mXyxOgE=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EB6808B7B3;
 Wed,  1 Apr 2020 09:03:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sLJd8mg8ydh8; Wed,  1 Apr 2020 09:03:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BAADE8B778;
 Wed,  1 Apr 2020 09:03:34 +0200 (CEST)
Subject: Re: [PATCH v2 06/16] powerpc/watchpoint: Provide DAWR number to
 __set_breakpoint
To: Ravi Bangoria <ravi.bangoria@linux.ibm.com>, mpe@ellerman.id.au,
 mikey@neuling.org
References: <20200401061309.92442-1-ravi.bangoria@linux.ibm.com>
 <20200401061309.92442-7-ravi.bangoria@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <89f43001-0fa4-1394-4158-878fca4962e3@c-s.fr>
Date: Wed, 1 Apr 2020 09:03:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200401061309.92442-7-ravi.bangoria@linux.ibm.com>
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
Cc: apopple@linux.ibm.com, peterz@infradead.org, fweisbec@gmail.com,
 oleg@redhat.com, npiggin@gmail.com, linux-kernel@vger.kernel.org,
 paulus@samba.org, jolsa@kernel.org, naveen.n.rao@linux.vnet.ibm.com,
 linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 01/04/2020 à 08:12, Ravi Bangoria a écrit :
> Introduce new parameter 'nr' to __set_breakpoint() which indicates
> which DAWR should be programed. Also convert current_brk variable
> to an array.
> 
> Signed-off-by: Ravi Bangoria <ravi.bangoria@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/debug.h         |  2 +-
>   arch/powerpc/include/asm/hw_breakpoint.h |  2 +-
>   arch/powerpc/kernel/hw_breakpoint.c      |  8 ++++----
>   arch/powerpc/kernel/process.c            | 14 +++++++-------
>   arch/powerpc/kernel/signal.c             |  2 +-
>   arch/powerpc/xmon/xmon.c                 |  2 +-
>   6 files changed, 15 insertions(+), 15 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
> index 7756026b95ca..6228935a8b64 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -45,7 +45,7 @@ static inline int debugger_break_match(struct pt_regs *regs) { return 0; }
>   static inline int debugger_fault_handler(struct pt_regs *regs) { return 0; }
>   #endif
>   
> -void __set_breakpoint(struct arch_hw_breakpoint *brk);
> +void __set_breakpoint(struct arch_hw_breakpoint *brk, int nr);

Same, I think it would make more sense to have nr as first argument.

Christophe


>   bool ppc_breakpoint_available(void);
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>   extern void do_send_trap(struct pt_regs *regs, unsigned long address,
> diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
> index 62549007c87a..4e4976c3248b 100644
> --- a/arch/powerpc/include/asm/hw_breakpoint.h
> +++ b/arch/powerpc/include/asm/hw_breakpoint.h
> @@ -85,7 +85,7 @@ static inline void hw_breakpoint_disable(void)
>   	brk.len = 0;
>   	brk.hw_len = 0;
>   	if (ppc_breakpoint_available())
> -		__set_breakpoint(&brk);
> +		__set_breakpoint(&brk, 0);
>   }
>   extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
>   int hw_breakpoint_handler(struct die_args *args);
> diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
> index 4120349e2abe..7562f9ceb77e 100644
> --- a/arch/powerpc/kernel/hw_breakpoint.c
> +++ b/arch/powerpc/kernel/hw_breakpoint.c
> @@ -63,7 +63,7 @@ int arch_install_hw_breakpoint(struct perf_event *bp)
>   	 * If so, DABR will be populated in single_step_dabr_instruction().
>   	 */
>   	if (current->thread.last_hit_ubp != bp)
> -		__set_breakpoint(info);
> +		__set_breakpoint(info, 0);
>   
>   	return 0;
>   }
> @@ -221,7 +221,7 @@ void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs)
>   
>   	info = counter_arch_bp(tsk->thread.last_hit_ubp);
>   	regs->msr &= ~MSR_SE;
> -	__set_breakpoint(info);
> +	__set_breakpoint(info, 0);
>   	tsk->thread.last_hit_ubp = NULL;
>   }
>   
> @@ -346,7 +346,7 @@ int hw_breakpoint_handler(struct die_args *args)
>   	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
>   		perf_bp_event(bp, regs);
>   
> -	__set_breakpoint(info);
> +	__set_breakpoint(info, 0);
>   out:
>   	rcu_read_unlock();
>   	return rc;
> @@ -379,7 +379,7 @@ static int single_step_dabr_instruction(struct die_args *args)
>   	if (!(info->type & HW_BRK_TYPE_EXTRANEOUS_IRQ))
>   		perf_bp_event(bp, regs);
>   
> -	__set_breakpoint(info);
> +	__set_breakpoint(info, 0);
>   	current->thread.last_hit_ubp = NULL;
>   
>   	/*
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index b548a584e465..e0275fcd0c55 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -630,7 +630,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
>   }
>   #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
>   
> -static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk);
> +static DEFINE_PER_CPU(struct arch_hw_breakpoint, current_brk[HBP_NUM_MAX]);
>   
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
>   /*
> @@ -707,7 +707,7 @@ EXPORT_SYMBOL_GPL(switch_booke_debug_regs);
>   static void set_breakpoint(struct arch_hw_breakpoint *brk)
>   {
>   	preempt_disable();
> -	__set_breakpoint(brk);
> +	__set_breakpoint(brk, 0);
>   	preempt_enable();
>   }
>   
> @@ -793,13 +793,13 @@ static inline int set_breakpoint_8xx(struct arch_hw_breakpoint *brk)
>   	return 0;
>   }
>   
> -void __set_breakpoint(struct arch_hw_breakpoint *brk)
> +void __set_breakpoint(struct arch_hw_breakpoint *brk, int nr)
>   {
> -	memcpy(this_cpu_ptr(&current_brk), brk, sizeof(*brk));
> +	memcpy(this_cpu_ptr(&current_brk[nr]), brk, sizeof(*brk));
>   
>   	if (dawr_enabled())
>   		// Power8 or later
> -		set_dawr(brk, 0);
> +		set_dawr(brk, nr);
>   	else if (IS_ENABLED(CONFIG_PPC_8xx))
>   		set_breakpoint_8xx(brk);
>   	else if (!cpu_has_feature(CPU_FTR_ARCH_207S))
> @@ -1167,8 +1167,8 @@ struct task_struct *__switch_to(struct task_struct *prev,
>    * schedule DABR
>    */
>   #ifndef CONFIG_HAVE_HW_BREAKPOINT
> -	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk), &new->thread.hw_brk)))
> -		__set_breakpoint(&new->thread.hw_brk);
> +	if (unlikely(!hw_brk_match(this_cpu_ptr(&current_brk[0]), &new->thread.hw_brk)))
> +		__set_breakpoint(&new->thread.hw_brk, 0);
>   #endif /* CONFIG_HAVE_HW_BREAKPOINT */
>   #endif
>   
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index d215f9554553..bbf237f072d4 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -129,7 +129,7 @@ static void do_signal(struct task_struct *tsk)
>   	 * triggered inside the kernel.
>   	 */
>   	if (tsk->thread.hw_brk.address && tsk->thread.hw_brk.type)
> -		__set_breakpoint(&tsk->thread.hw_brk);
> +		__set_breakpoint(&tsk->thread.hw_brk, 0);
>   #endif
>   	/* Re-enable the breakpoints for the signal stack */
>   	thread_change_pc(tsk, tsk->thread.regs);
> diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
> index 75ca41c04dd1..508d353e7f06 100644
> --- a/arch/powerpc/xmon/xmon.c
> +++ b/arch/powerpc/xmon/xmon.c
> @@ -935,7 +935,7 @@ static void insert_cpu_bpts(void)
>   		brk.address = dabr.address;
>   		brk.type = (dabr.enabled & HW_BRK_TYPE_DABR) | HW_BRK_TYPE_PRIV_ALL;
>   		brk.len = DABR_MAX_LEN;
> -		__set_breakpoint(&brk);
> +		__set_breakpoint(&brk, 0);
>   	}
>   
>   	if (iabr)
> 
