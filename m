Return-Path: <linuxppc-dev+bounces-14802-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8BCC1E52
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:58:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsng5fx2z2yDY;
	Tue, 16 Dec 2025 20:58:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765879111;
	cv=none; b=QzrN0+TQ5upSPvyeT838MfM/siz4aZaOD+BRGcGdl6s1TXB2vzKTt7nxdNIwBj9n6ezVoNgEIjXuSNMgJ+vqktV/kSwp05+zS64fpIDDVj8jqq9uKMniBx+WKyL1akjkijzfgk1d7MmppCFRzr9zqS9SA29uh4ND2QxtpV6ReyS3XQV0XstamTuECdfObNjeRtjvMKLgTGWQqPR72CiZJ4Va+uWSjPoKlzRfge5/1Ltm8gQ5WB3L6u/Y9E7l22hqIj7ztL+b5wsO1/I00JGp0HPEnpGlZj0nJkyRRMaQpt8zGk0ifMz4CTsT+Zzvi6s3E1vhnpp/r1cgxhKnTqm2ag==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765879111; c=relaxed/relaxed;
	bh=xli6gYZQ5n048Jai9ofwJNwzViG2jXMo9ylsmZAnsoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=a5znbCMNtNDHqi6Xfnvt2Zx8moUV+h7uqUZHYd63xn+oN0muGpeKqn6wsy2/qkyfHdhiatscFVHJpwwHrTQFKUM0l/wCdIH8fQYRnuIWhaFwjnWTZS9PgEVnk9IEcV0hqiwjBmX2wgv/v9ggPlgLy6sTkVuEkcRqA0WWJBMs68g5XZ5FvYCzUIEf1RsW2tJNOcct6L8namwLGICtsirKqAZDtsNe2fpFS5zWJH7YbJq8CvzYNt0PssneeIPaSZfhxtMKsgD3kuX4MGHQ+NO7kX9pZpeZFQCnx6P2CjvrrQ31tn5BFpMKVPXnl6Mmp4gJmINiWUaFLJzTyVWFBNP4CA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJ50Y+c6; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=BJ50Y+c6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsnf4yZZz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:58:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 977A8600CB;
	Tue, 16 Dec 2025 09:58:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF6AC16AAE;
	Tue, 16 Dec 2025 09:58:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765879108;
	bh=VnOI+ehkEn9YbbJB5m47yyrP0+a5Mt7EKdeJIQS427U=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=BJ50Y+c6pUqXrTeBzQ0ioIL5wwT1KKP9BBMP3rcjrF6g26xUltQvpwQbfEs5M1MxQ
	 q/zqukFxIbwBDJ5pcpEHIqNuH8N/epog7WODGZl4WrrbZmA7ZtRkZIvaeOhSsrL9/8
	 05ZZh14CPpg/EQaVgQqQJ81T/7GTWL+hQ8fJHYkRqg/Tvve2TV/Ov5btub5m5v6K5k
	 6FDqngFFtIHZcj9ILpQJds5zyf/zeuSvBf508btaJBSFnjfLtJ+AeANVgQ50Z+IWP/
	 OkPFzkb0JH9G/eXYoIGFLhOBQNbYxSi9bkCRGaCe3KdtO1+qpkQ1YnwVAubnXZ+9mf
	 rEhdL0txHIyhw==
Message-ID: <91d280af-fb41-4c05-8b96-113717ecd64a@kernel.org>
Date: Tue, 16 Dec 2025 10:58:16 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] powerpc: Prepare for IRQ entry exit
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, oleg@redhat.com, kees@kernel.org,
 luto@amacapital.net, wad@chromium.org, mchauras@linux.ibm.com,
 thuth@redhat.com, sshegde@linux.ibm.com, charlie@rivosinc.com,
 macro@orcam.me.uk, akpm@linux-foundation.org, ldv@strace.io, deller@gmx.de,
 ankur.a.arora@oracle.com, segher@kernel.crashing.org, tglx@linutronix.de,
 thomas.weissschuh@linutronix.de, peterz@infradead.org,
 menglong8.dong@gmail.com, bigeasy@linutronix.de, namcao@linutronix.de,
 kan.liang@linux.intel.com, mingo@kernel.org, atrajeev@linux.vnet.ibm.com,
 mark.barnett@arm.com, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org
References: <20251214130245.43664-1-mkchauras@linux.ibm.com>
 <20251214130245.43664-7-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-7-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Move interrupt entry and exit helper routines from interrupt.h into the
> PowerPC-specific entry-common.h header as a preparatory step for enabling
> the generic entry/exit framework.
> 
> This consolidation places all PowerPC interrupt entry/exit handling in a
> single common header, aligning with the generic entry infrastructure.
> The helpers provide architecture-specific handling for interrupt and NMI
> entry/exit sequences, including:
> 
>   - arch_interrupt_enter/exit_prepare()
>   - arch_interrupt_async_enter/exit_prepare()
>   - arch_interrupt_nmi_enter/exit_prepare()
>   - Supporting helpers such as nap_adjust_return(), check_return_regs_valid(),
>     debug register maintenance, and soft mask handling.
> 
> The functions are copied verbatim from interrupt.h to avoid functional
> changes at this stage. Subsequent patches will integrate these routines
> into the generic entry/exit flow.

Can we move them instead of duplicating them ?

> 
> No functional change intended.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/entry-common.h | 422 ++++++++++++++++++++++++
>   1 file changed, 422 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index e8ebd42a4e6d..e8bde4c67eaf 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -7,10 +7,432 @@
>   
>   #include <asm/cputime.h>
>   #include <asm/interrupt.h>
> +#include <asm/runlatch.h>
>   #include <asm/stacktrace.h>
>   #include <asm/switch_to.h>
>   #include <asm/tm.h>
>   
> +#ifdef CONFIG_PPC_IRQ_SOFT_MASK_DEBUG
> +/*
> + * WARN/BUG is handled with a program interrupt so minimise checks here to
> + * avoid recursion and maximise the chance of getting the first oops handled.
> + */
> +#define INT_SOFT_MASK_BUG_ON(regs, cond)				\
> +do {									\
> +	if ((user_mode(regs) || (TRAP(regs) != INTERRUPT_PROGRAM)))	\
> +		BUG_ON(cond);						\
> +} while (0)
> +#else
> +#define INT_SOFT_MASK_BUG_ON(regs, cond)
> +#endif
> +
> +#ifdef CONFIG_PPC_BOOK3S_64
> +extern char __end_soft_masked[];
> +bool search_kernel_soft_mask_table(unsigned long addr);
> +unsigned long search_kernel_restart_table(unsigned long addr);
> +
> +DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
> +
> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
> +{
> +	if (user_mode(regs))
> +		return false;
> +
> +	if (regs->nip >= (unsigned long)__end_soft_masked)
> +		return false;
> +
> +	return search_kernel_soft_mask_table(regs->nip);
> +}
> +
> +static inline void srr_regs_clobbered(void)
> +{
> +	local_paca->srr_valid = 0;
> +	local_paca->hsrr_valid = 0;
> +}
> +#else
> +static inline unsigned long search_kernel_restart_table(unsigned long addr)
> +{
> +	return 0;
> +}
> +
> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
> +{
> +	return false;
> +}
> +
> +static inline void srr_regs_clobbered(void)
> +{
> +}
> +#endif
> +
> +static inline void nap_adjust_return(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC_970_NAP
> +	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
> +		/* Can avoid a test-and-clear because NMIs do not call this */
> +		clear_thread_local_flags(_TLF_NAPPING);
> +		regs_set_return_ip(regs, (unsigned long)power4_idle_nap_return);
> +	}
> +#endif
> +}
> +
> +static inline void booke_load_dbcr0(void)
> +{
> +#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> +	unsigned long dbcr0 = current->thread.debug.dbcr0;
> +
> +	if (likely(!(dbcr0 & DBCR0_IDM)))
> +		return;
> +
> +	/*
> +	 * Check to see if the dbcr0 register is set up to debug.
> +	 * Use the internal debug mode bit to do this.
> +	 */
> +	mtmsr(mfmsr() & ~MSR_DE);
> +	if (IS_ENABLED(CONFIG_PPC32)) {
> +		isync();
> +		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
> +	}
> +	mtspr(SPRN_DBCR0, dbcr0);
> +	mtspr(SPRN_DBSR, -1);
> +#endif
> +}
> +
> +static inline void booke_restore_dbcr0(void)
> +{
> +#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> +	unsigned long dbcr0 = current->thread.debug.dbcr0;
> +
> +	if (IS_ENABLED(CONFIG_PPC32) && unlikely(dbcr0 & DBCR0_IDM)) {
> +		mtspr(SPRN_DBSR, -1);
> +		mtspr(SPRN_DBCR0, global_dbcr0[smp_processor_id()]);
> +	}
> +#endif
> +}
> +
> +static inline void check_return_regs_valid(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	unsigned long trap, srr0, srr1;
> +	static bool warned;
> +	u8 *validp;
> +	char *h;
> +
> +	if (trap_is_scv(regs))
> +		return;
> +
> +	trap = TRAP(regs);
> +	// EE in HV mode sets HSRRs like 0xea0
> +	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
> +		trap = 0xea0;
> +
> +	switch (trap) {
> +	case 0x980:
> +	case INTERRUPT_H_DATA_STORAGE:
> +	case 0xe20:
> +	case 0xe40:
> +	case INTERRUPT_HMI:
> +	case 0xe80:
> +	case 0xea0:
> +	case INTERRUPT_H_FAC_UNAVAIL:
> +	case 0x1200:
> +	case 0x1500:
> +	case 0x1600:
> +	case 0x1800:
> +		validp = &local_paca->hsrr_valid;
> +		if (!READ_ONCE(*validp))
> +			return;
> +
> +		srr0 = mfspr(SPRN_HSRR0);
> +		srr1 = mfspr(SPRN_HSRR1);
> +		h = "H";
> +
> +		break;
> +	default:
> +		validp = &local_paca->srr_valid;
> +		if (!READ_ONCE(*validp))
> +			return;
> +
> +		srr0 = mfspr(SPRN_SRR0);
> +		srr1 = mfspr(SPRN_SRR1);
> +		h = "";
> +		break;
> +	}
> +
> +	if (srr0 == regs->nip && srr1 == regs->msr)
> +		return;
> +
> +	/*
> +	 * A NMI / soft-NMI interrupt may have come in after we found
> +	 * srr_valid and before the SRRs are loaded. The interrupt then
> +	 * comes in and clobbers SRRs and clears srr_valid. Then we load
> +	 * the SRRs here and test them above and find they don't match.
> +	 *
> +	 * Test validity again after that, to catch such false positives.
> +	 *
> +	 * This test in general will have some window for false negatives
> +	 * and may not catch and fix all such cases if an NMI comes in
> +	 * later and clobbers SRRs without clearing srr_valid, but hopefully
> +	 * such things will get caught most of the time, statistically
> +	 * enough to be able to get a warning out.
> +	 */
> +	if (!READ_ONCE(*validp))
> +		return;
> +
> +	if (!data_race(warned)) {
> +		data_race(warned = true);
> +		pr_warn("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
> +		pr_warn("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
> +		show_regs(regs);
> +	}
> +
> +	WRITE_ONCE(*validp, 0); /* fixup */
> +#endif
> +}
> +
> +static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC64
> +	irq_soft_mask_set(IRQS_ALL_DISABLED);
> +
> +	/*
> +	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
> +	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
> +	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
> +	 * soft-masked. The interrupt handler may later call
> +	 * interrupt_cond_local_irq_enable() to achieve a regular process
> +	 * context.
> +	 */
> +	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
> +		INT_SOFT_MASK_BUG_ON(regs, !(regs->msr & MSR_EE));
> +		__hard_irq_enable();
> +	} else {
> +		__hard_RI_enable();
> +	}
> +	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
> +#endif
> +
> +	if (!regs_irqs_disabled(regs))
> +		trace_hardirqs_off();
> +
> +	if (user_mode(regs)) {
> +		kuap_lock();
> +		CT_WARN_ON(ct_state() != CT_STATE_USER);
> +		user_exit_irqoff();
> +
> +		account_cpu_user_entry();
> +		account_stolen_time();
> +	} else {
> +		kuap_save_and_lock(regs);
> +		/*
> +		 * CT_WARN_ON comes here via program_check_exception,
> +		 * so avoid recursion.
> +		 */
> +		if (TRAP(regs) != INTERRUPT_PROGRAM)
> +			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
> +				   ct_state() != CT_STATE_IDLE);
> +		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
> +		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
> +				     search_kernel_restart_table(regs->nip));
> +	}
> +	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
> +			     !(regs->msr & MSR_EE));
> +
> +	booke_restore_dbcr0();
> +}
> +
> +/*
> + * Care should be taken to note that arch_interrupt_exit_prepare and
> + * arch_interrupt_async_exit_prepare do not necessarily return immediately to
> + * regs context (e.g., if regs is usermode, we don't necessarily return to
> + * user mode). Other interrupts might be taken between here and return,
> + * context switch / preemption may occur in the exit path after this, or a
> + * signal may be delivered, etc.
> + *
> + * The real interrupt exit code is platform specific, e.g.,
> + * interrupt_exit_user_prepare / interrupt_exit_kernel_prepare for 64s.
> + *
> + * However arch_interrupt_nmi_exit_prepare does return directly to regs, because
> + * NMIs do not do "exit work" or replay soft-masked interrupts.
> + */
> +static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
> +{
> +}
> +
> +static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC64
> +	/* Ensure arch_interrupt_enter_prepare does not enable MSR[EE] */
> +	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +#endif
> +	arch_interrupt_enter_prepare(regs);
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	/*
> +	 * RI=1 is set by arch_interrupt_enter_prepare, so this thread flags access
> +	 * has to come afterward (it can cause SLB faults).
> +	 */
> +	if (cpu_has_feature(CPU_FTR_CTRL) &&
> +	    !test_thread_local_flags(_TLF_RUNLATCH))
> +		__ppc64_runlatch_on();
> +#endif
> +	irq_enter();
> +}
> +
> +static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
> +{
> +	/*
> +	 * Adjust at exit so the main handler sees the true NIA. This must
> +	 * come before irq_exit() because irq_exit can enable interrupts, and
> +	 * if another interrupt is taken before nap_adjust_return has run
> +	 * here, then that interrupt would return directly to idle nap return.
> +	 */
> +	nap_adjust_return(regs);
> +
> +	irq_exit();
> +	arch_interrupt_exit_prepare(regs);
> +}
> +
> +struct interrupt_nmi_state {
> +#ifdef CONFIG_PPC64
> +	u8 irq_soft_mask;
> +	u8 irq_happened;
> +	u8 ftrace_enabled;
> +	u64 softe;
> +#endif
> +};
> +
> +static inline bool nmi_disables_ftrace(struct pt_regs *regs)
> +{
> +	/* Allow DEC and PMI to be traced when they are soft-NMI */
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64)) {
> +		if (TRAP(regs) == INTERRUPT_DECREMENTER)
> +			return false;
> +		if (TRAP(regs) == INTERRUPT_PERFMON)
> +			return false;
> +	}
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3E_64)) {
> +		if (TRAP(regs) == INTERRUPT_PERFMON)
> +			return false;
> +	}
> +
> +	return true;
> +}
> +
> +static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
> +					       struct interrupt_nmi_state *state)

CHECK: Alignment should match open parenthesis
#354: FILE: arch/powerpc/include/asm/entry-common.h:322:
+static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
+					       struct interrupt_nmi_state *state)


> +{
> +#ifdef CONFIG_PPC64
> +	state->irq_soft_mask = local_paca->irq_soft_mask;
> +	state->irq_happened = local_paca->irq_happened;
> +	state->softe = regs->softe;
> +
> +	/*
> +	 * Set IRQS_ALL_DISABLED unconditionally so irqs_disabled() does
> +	 * the right thing, and set IRQ_HARD_DIS. We do not want to reconcile
> +	 * because that goes through irq tracing which we don't want in NMI.
> +	 */
> +	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
> +	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +
> +	if (!(regs->msr & MSR_EE) || is_implicit_soft_masked(regs)) {
> +		/*
> +		 * Adjust regs->softe to be soft-masked if it had not been
> +		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
> +		 * not yet set disabled), or if it was in an implicit soft
> +		 * masked state. This makes regs_irqs_disabled(regs)
> +		 * behave as expected.
> +		 */
> +		regs->softe = IRQS_ALL_DISABLED;
> +	}
> +
> +	__hard_RI_enable();
> +
> +	/* Don't do any per-CPU operations until interrupt state is fixed */
> +
> +	if (nmi_disables_ftrace(regs)) {
> +		state->ftrace_enabled = this_cpu_get_ftrace_enabled();
> +		this_cpu_set_ftrace_enabled(0);
> +	}
> +#endif
> +
> +	/* If data relocations are enabled, it's safe to use nmi_enter() */
> +	if (mfmsr() & MSR_DR) {
> +		nmi_enter();
> +		return;
> +	}
> +
> +	/*
> +	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
> +	 * NMI because not everything it touches is within the RMA limit.
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> +	    firmware_has_feature(FW_FEATURE_LPAR) &&
> +	    !radix_enabled())
> +		return;
> +
> +	/*
> +	 * Likewise, don't use it if we have some form of instrumentation (like
> +	 * KASAN shadow) that is not safe to access in real mode (even on radix)
> +	 */
> +	if (IS_ENABLED(CONFIG_KASAN))
> +		return;
> +
> +	/*
> +	 * Likewise, do not use it in real mode if percpu first chunk is not
> +	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> +	 * are chances where percpu allocation can come from vmalloc area.
> +	 */
> +	if (percpu_first_chunk_is_paged)
> +		return;
> +
> +	/* Otherwise, it should be safe to call it */
> +	nmi_enter();
> +}
> +
> +static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
> +					      struct interrupt_nmi_state *state)
> +{

CHECK: Alignment should match open parenthesis
#425: FILE: arch/powerpc/include/asm/entry-common.h:393:
+static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
+					      struct interrupt_nmi_state *state)

> +	if (mfmsr() & MSR_DR) {
> +		// nmi_exit if relocations are on
> +		nmi_exit();
> +	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> +		   firmware_has_feature(FW_FEATURE_LPAR) &&
> +		   !radix_enabled()) {
> +		// no nmi_exit for a pseries hash guest taking a real mode exception
> +	} else if (IS_ENABLED(CONFIG_KASAN)) {
> +		// no nmi_exit for KASAN in real mode
> +	} else if (percpu_first_chunk_is_paged) {
> +		// no nmi_exit if percpu first chunk is not embedded
> +	} else {
> +		nmi_exit();
> +	}
> +
> +	/*
> +	 * nmi does not call nap_adjust_return because nmi should not create
> +	 * new work to do (must use irq_work for that).
> +	 */
> +
> +#ifdef CONFIG_PPC64
> +#ifdef CONFIG_PPC_BOOK3S
> +	if (regs_irqs_disabled(regs)) {
> +		unsigned long rst = search_kernel_restart_table(regs->nip);
> +
> +		if (rst)
> +			regs_set_return_ip(regs, rst);
> +	}
> +#endif
> +
> +	if (nmi_disables_ftrace(regs))
> +		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
> +
> +	/* Check we didn't change the pending interrupt mask. */
> +	WARN_ON_ONCE((state->irq_happened | PACA_IRQ_HARD_DIS) != local_paca->irq_happened);
> +	regs->softe = state->softe;
> +	local_paca->irq_happened = state->irq_happened;
> +	local_paca->irq_soft_mask = state->irq_soft_mask;
> +#endif
> +}
> +
>   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>   {
>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))


