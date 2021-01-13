Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BC99F2F4E3C
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 16:15:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9xC1DrXzDrgG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 02:15:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9vH57ZyzDrdW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 02:13:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9v33XsNz9twtf;
 Wed, 13 Jan 2021 16:13:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 1GM2zlbxh-4O; Wed, 13 Jan 2021 16:13:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9v31ztWz9twtd;
 Wed, 13 Jan 2021 16:13:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 91B9D8B7E3;
 Wed, 13 Jan 2021 16:13:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Kp8pTsnC3BlZ; Wed, 13 Jan 2021 16:13:36 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 636E78B772;
 Wed, 13 Jan 2021 16:13:36 +0100 (CET)
Subject: Re: [PATCH v5 18/21] powerpc: move NMI entry/exit code into wrapper
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-19-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <b8006c6e-0828-66b7-067f-cbfd0ddf99a1@csgroup.eu>
Date: Wed, 13 Jan 2021 16:13:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-19-npiggin@gmail.com>
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
> This moves the common NMI entry and exit code into the interrupt handler
> wrappers.
> 
> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
> them.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 24 ++++++++++++++++
>   arch/powerpc/kernel/mce.c            | 11 --------
>   arch/powerpc/kernel/traps.c          | 42 +++++-----------------------
>   arch/powerpc/kernel/watchdog.c       | 10 +++----
>   4 files changed, 35 insertions(+), 52 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index e278dffe7657..01192e213f9a 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -95,14 +95,38 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
>   }
>   
>   struct interrupt_nmi_state {
> +#ifdef CONFIG_PPC64
> +	u8 ftrace_enabled;
> +#endif
>   };
>   
>   static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
>   {
> +#ifdef CONFIG_PPC64
> +	state->ftrace_enabled = this_cpu_get_ftrace_enabled();
> +	this_cpu_set_ftrace_enabled(0);
> +#endif
> +
> +	/*
> +	 * Do not use nmi_enter() for pseries hash guest taking a real-mode
> +	 * NMI because not everything it touches is within the RMA limit.
> +	 */
> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
> +			!firmware_has_feature(FW_FEATURE_LPAR) ||
> +			radix_enabled() || (mfmsr() & MSR_DR))
> +		nmi_enter();
>   }
>   
>   static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
>   {
> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) ||
> +			!firmware_has_feature(FW_FEATURE_LPAR) ||
> +			radix_enabled() || (mfmsr() & MSR_DR))
> +		nmi_exit();
> +
> +#ifdef CONFIG_PPC64
> +	this_cpu_set_ftrace_enabled(state->ftrace_enabled);
> +#endif
>   }
>   
>   /**
> diff --git a/arch/powerpc/kernel/mce.c b/arch/powerpc/kernel/mce.c
> index 54269947113d..51456217ec40 100644
> --- a/arch/powerpc/kernel/mce.c
> +++ b/arch/powerpc/kernel/mce.c
> @@ -592,12 +592,6 @@ EXPORT_SYMBOL_GPL(machine_check_print_event_info);
>   DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
>   {
>   	long handled = 0;
> -	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
> -
> -	this_cpu_set_ftrace_enabled(0);
> -	/* Do not use nmi_enter/exit for pseries hpte guest */
> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
> -		nmi_enter();
>   
>   	hv_nmi_check_nonrecoverable(regs);
>   
> @@ -607,11 +601,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_early)
>   	if (ppc_md.machine_check_early)
>   		handled = ppc_md.machine_check_early(regs);
>   
> -	if (radix_enabled() || !firmware_has_feature(FW_FEATURE_LPAR))
> -		nmi_exit();
> -
> -	this_cpu_set_ftrace_enabled(ftrace_enabled);
> -
>   	return handled;
>   }
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index b4f23e871a68..43d23232ef5c 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -435,11 +435,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
>   {
>   	unsigned long hsrr0, hsrr1;
>   	bool saved_hsrrs = false;
> -	u8 ftrace_enabled = this_cpu_get_ftrace_enabled();
> -
> -	this_cpu_set_ftrace_enabled(0);
> -
> -	nmi_enter();
>   
>   	/*
>   	 * System reset can interrupt code where HSRRs are live and MSR[RI]=1.
> @@ -511,10 +506,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(system_reset_exception)
>   		mtspr(SPRN_HSRR1, hsrr1);
>   	}
>   
> -	nmi_exit();
> -
> -	this_cpu_set_ftrace_enabled(ftrace_enabled);
> -
>   	/* What should we do here? We could issue a shutdown or hard reset. */
>   
>   	return 0;
> @@ -792,6 +783,12 @@ int machine_check_generic(struct pt_regs *regs)
>   #endif /* everything else */
>   
>   
> +/*
> + * BOOK3S_64 does not call this handler as a non-maskable interrupt
> + * (it uses its own early real-mode handler to handle the MCE proper
> + * and then raises irq_work to call this handler when interrupts are
> + * enabled).
> + */
>   #ifdef CONFIG_PPC_BOOK3S_64
>   DEFINE_INTERRUPT_HANDLER_ASYNC(machine_check_exception)
>   #else
> @@ -800,20 +797,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
>   {
>   	int recover = 0;
>   
> -	/*
> -	 * BOOK3S_64 does not call this handler as a non-maskable interrupt
> -	 * (it uses its own early real-mode handler to handle the MCE proper
> -	 * and then raises irq_work to call this handler when interrupts are
> -	 * enabled).
> -	 *
> -	 * This is silly. The BOOK3S_64 should just call a different function
> -	 * rather than expecting semantics to magically change. Something
> -	 * like 'non_nmi_machine_check_exception()', perhaps?
> -	 */
> -	const bool nmi = !IS_ENABLED(CONFIG_PPC_BOOK3S_64);
> -
> -	if (nmi) nmi_enter();
> -
>   	__this_cpu_inc(irq_stat.mce_exceptions);
>   
>   	add_taint(TAINT_MACHINE_CHECK, LOCKDEP_NOW_UNRELIABLE);
> @@ -838,24 +821,17 @@ DEFINE_INTERRUPT_HANDLER_NMI(machine_check_exception)
>   	if (check_io_access(regs))
>   		goto bail;
>   
> -	if (nmi) nmi_exit();
> -

IIRC, not doing the nmi_exit() before the die() is problematic.

See 
https://github.com/linuxppc/linux/commit/daf00ae71dad8aa05965713c62558aeebf2df48e#diff-70077148c383252ca949063eaf1b0250620e4607b43f4ef3fd2d8f448a83ab0a

>   	die("Machine check", regs, SIGBUS);
>   
>   	/* Must die if the interrupt is not recoverable */
>   	if (!(regs->msr & MSR_RI))
>   		die("Unrecoverable Machine check", regs, SIGBUS);
>   
> -#ifdef CONFIG_PPC_BOOK3S_64
>   bail:
> +#ifdef CONFIG_PPC_BOOK3S_64
>   	return;
>   #else
>   	return 0;
> -
> -bail:
> -	if (nmi) nmi_exit();
> -
> -	return 0;
>   #endif
>   }
>   NOKPROBE_SYMBOL(machine_check_exception);
> @@ -1873,14 +1849,10 @@ DEFINE_INTERRUPT_HANDLER(vsx_unavailable_tm)
>   #ifdef CONFIG_PPC64
>   DEFINE_INTERRUPT_HANDLER_NMI(performance_monitor_exception_nmi)
>   {
> -	nmi_enter();
> -
>   	__this_cpu_inc(irq_stat.pmu_irqs);
>   
>   	perf_irq(regs);
>   
> -	nmi_exit();
> -
>   	return 0;
>   }
>   #endif
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 824b9376ac35..dc39534836a3 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -254,11 +254,12 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   	int cpu = raw_smp_processor_id();
>   	u64 tb;
>   
> +	/* should only arrive from kernel, with irqs disabled */
> +	WARN_ON_ONCE(!arch_irq_disabled_regs(regs));
> +
>   	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
>   		return 0;
>   
> -	nmi_enter();
> -
>   	__this_cpu_inc(irq_stat.soft_nmi_irqs);
>   
>   	tb = get_tb();
> @@ -266,7 +267,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   		wd_smp_lock(&flags);
>   		if (cpumask_test_cpu(cpu, &wd_smp_cpus_stuck)) {
>   			wd_smp_unlock(&flags);
> -			goto out;
> +			return 0;
>   		}
>   		set_cpu_stuck(cpu, tb);
>   
> @@ -290,9 +291,6 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>   	if (wd_panic_timeout_tb < 0x7fffffff)
>   		mtspr(SPRN_DEC, wd_panic_timeout_tb);
>   
> -out:
> -	nmi_exit();
> -
>   	return 0;
>   }
>   
> 
