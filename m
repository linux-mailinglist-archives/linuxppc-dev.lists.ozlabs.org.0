Return-Path: <linuxppc-dev+bounces-14800-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1E1CC1DA3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:46:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsX526Lzz2yDY;
	Tue, 16 Dec 2025 20:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765878405;
	cv=none; b=H9i+iwnhisH11t4OtRWk85doKBYbRvAhChRP9E0M2Uy6EDJOZAb601wt7xrF7QpaX3oy1GEvO7GxjqCRDpYvB21VaTYukq9ys2kid657+n5Gur+pmo3W++UOz5LR/x8qK3MkIwJ/shy4wkXyCvVQgSZRNdP3pjRw8sEpcuPNiAj1taa7FCjpGMFfudDUZYqTmsSRvj/xvdDSZGAE+hGJftzluoqK4uNn0mkviuAMUj53DOOHPpsmSEhBs9FD/cyCV58bSylnL59WlLVj+LJHobWOySScLvFnCpx5HmGNZDzTrORFkiimCEdEjncZOlw86ayb//aH06Ys2iV1GLgbUw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765878405; c=relaxed/relaxed;
	bh=Y/1CNEgqX7qAjRMXR6jEVf/ncNdzCJLnfsRRirvBhX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=P+7GqXwv5CfU3Uzb/N8QHdipfwxqC+BAgyrAZGbg/qq0ZkT7Klzco/mNfgioXrItw5lOI7lC1AAUpPumjQLSm4KIdt0GYCNZr7ShcGl+kDyh2yy5cO2UMeG+zx5NdZGRcMStRCIYQR/YMHcnTC0T5nNWa/os6IMi9yDP6jc2dMYHmLNy0cZK6CI9kcnLYKgrcjOEh0xKW/QW8cR9EUH3mpO0DGzDfgVJyuLg5r9uo3+etETE4nJHR/54XYPWmFeaiXYmf4NSRBCPDxvsLh66QHDXEM+KCfaoYLM2fVAFEChlxqYBIelIu2hEX+MkaeJQ0FfwT0al/NzWXkYej25ZzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mw4FdrAC; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Mw4FdrAC;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsX42H2bz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:46:44 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EA6EE60010;
	Tue, 16 Dec 2025 09:46:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E678AC4CEF1;
	Tue, 16 Dec 2025 09:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765878401;
	bh=TGMHFK24tNRBpxQq8qH9ZxIW046JIxdiOpQ7jMhz834=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Mw4FdrACFB7nfJhg3cjGSayy90XjQRbOmF7jVQS308YtKNWtsAD7I6aYZqQf5fdQL
	 J3fgfMIl7e8LnX0dok+AVjy5j5ByKFVd5Lk+cVVwXLo1J+22mY3k1O8VADmE1nPq6s
	 obL+YF05RkQM0z/rQpldfguH3pvFqeGgDfH74F9VxoKQPcFMtG5NR1OFAiEhYRy4/d
	 pKNUDmDGUiwoaEFgf1in2B4ItJoIV1LRmHrvOsFCC8YhhtqqVgcdvZstUklr0s6g47
	 zCTs4SgRQmkC5bkr12iX9dgBYb2rgkhCdkuWH1o9eTwBKir+vHH7lpYyVCwINhnBo1
	 VBxZTE8VZM8OQ==
Message-ID: <89a25fd0-2d49-4062-a194-55f21350e5a8@kernel.org>
Date: Tue, 16 Dec 2025 10:46:28 +0100
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
Subject: Re: [PATCH v2 4/8] powerpc: Introduce syscall exit arch functions
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
 <20251214130245.43664-5-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-5-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Add PowerPC-specific implementations of the generic syscall exit hooks
> used by the generic entry/exit framework:
> 
>   - arch_exit_to_user_mode_work_prepare()
>   - arch_exit_to_user_mode_work()
> 
> These helpers handle user state restoration when returning from the
> kernel to userspace, including FPU/VMX/VSX state, transactional memory,
> KUAP restore, and per-CPU accounting.
> 
> Additionally, move check_return_regs_valid() from interrupt.c to
> interrupt.h so it can be shared by the new entry/exit logic, and add
> arch_do_signal_or_restart() for use with the generic entry flow.
> 
> No functional change is intended with this patch.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/entry-common.h | 49 +++++++++++++++
>   arch/powerpc/include/asm/interrupt.h    | 82 +++++++++++++++++++++++++
>   arch/powerpc/kernel/interrupt.c         | 81 ------------------------
>   arch/powerpc/kernel/signal.c            | 14 +++++
>   4 files changed, 145 insertions(+), 81 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index 093ece06ef79..e8ebd42a4e6d 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -8,6 +8,7 @@
>   #include <asm/cputime.h>
>   #include <asm/interrupt.h>
>   #include <asm/stacktrace.h>
> +#include <asm/switch_to.h>
>   #include <asm/tm.h>
>   
>   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> @@ -104,5 +105,53 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>   
>   #define arch_enter_from_user_mode arch_enter_from_user_mode
>   
> +static inline void arch_exit_to_user_mode_prepare(struct pt_regs *regs,
> +						  unsigned long ti_work)
> +{
> +	unsigned long mathflags;
> +
> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && IS_ENABLED(CONFIG_PPC_FPU)) {
> +		if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +		    unlikely((ti_work & _TIF_RESTORE_TM))) {
> +			restore_tm_state(regs);
> +		} else {
> +			mathflags = MSR_FP;
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
> +
> +	check_return_regs_valid(regs);
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	local_paca->tm_scratch = regs->msr;
> +#endif
> +	/* Restore user access locks last */
> +	kuap_user_restore(regs);
> +}
> +
> +#define arch_exit_to_user_mode_prepare arch_exit_to_user_mode_prepare
> +
> +static __always_inline void arch_exit_to_user_mode(void)
> +{
> +	booke_load_dbcr0();
> +
> +	account_cpu_user_exit();
> +}
> +
> +#define arch_exit_to_user_mode arch_exit_to_user_mode
> +
>   #endif /* CONFIG_GENERIC_IRQ_ENTRY */
>   #endif /* _ASM_PPC_ENTRY_COMMON_H */
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index ca8a2cda9400..77ff8e33f8cd 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -68,6 +68,8 @@
>   
>   #include <linux/context_tracking.h>
>   #include <linux/hardirq.h>
> +#include <linux/sched/debug.h> /* for show_regs */
> +
>   #include <asm/cputime.h>
>   #include <asm/firmware.h>
>   #include <asm/ftrace.h>
> @@ -172,6 +174,86 @@ static inline void booke_restore_dbcr0(void)
>   #endif
>   }
>   
> +static inline void check_return_regs_valid(struct pt_regs *regs)

This was previously a notrace function. Should it be marked 
__always_inline instead of just inline ?

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
>   static inline void interrupt_enter_prepare(struct pt_regs *regs)
>   {
>   #ifdef CONFIG_PPC64
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 2a09ac5dabd6..f53d432f6087 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -4,7 +4,6 @@
>   #include <linux/err.h>
>   #include <linux/compat.h>
>   #include <linux/rseq.h>
> -#include <linux/sched/debug.h> /* for show_regs */
>   
>   #include <asm/kup.h>
>   #include <asm/cputime.h>
> @@ -78,86 +77,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
>   	return true;
>   }
>   
> -static notrace void check_return_regs_valid(struct pt_regs *regs)
> -{
> -#ifdef CONFIG_PPC_BOOK3S_64
> -	unsigned long trap, srr0, srr1;
> -	static bool warned;
> -	u8 *validp;
> -	char *h;
> -
> -	if (trap_is_scv(regs))
> -		return;
> -
> -	trap = TRAP(regs);
> -	// EE in HV mode sets HSRRs like 0xea0
> -	if (cpu_has_feature(CPU_FTR_HVMODE) && trap == INTERRUPT_EXTERNAL)
> -		trap = 0xea0;
> -
> -	switch (trap) {
> -	case 0x980:
> -	case INTERRUPT_H_DATA_STORAGE:
> -	case 0xe20:
> -	case 0xe40:
> -	case INTERRUPT_HMI:
> -	case 0xe80:
> -	case 0xea0:
> -	case INTERRUPT_H_FAC_UNAVAIL:
> -	case 0x1200:
> -	case 0x1500:
> -	case 0x1600:
> -	case 0x1800:
> -		validp = &local_paca->hsrr_valid;
> -		if (!READ_ONCE(*validp))
> -			return;
> -
> -		srr0 = mfspr(SPRN_HSRR0);
> -		srr1 = mfspr(SPRN_HSRR1);
> -		h = "H";
> -
> -		break;
> -	default:
> -		validp = &local_paca->srr_valid;
> -		if (!READ_ONCE(*validp))
> -			return;
> -
> -		srr0 = mfspr(SPRN_SRR0);
> -		srr1 = mfspr(SPRN_SRR1);
> -		h = "";
> -		break;
> -	}
> -
> -	if (srr0 == regs->nip && srr1 == regs->msr)
> -		return;
> -
> -	/*
> -	 * A NMI / soft-NMI interrupt may have come in after we found
> -	 * srr_valid and before the SRRs are loaded. The interrupt then
> -	 * comes in and clobbers SRRs and clears srr_valid. Then we load
> -	 * the SRRs here and test them above and find they don't match.
> -	 *
> -	 * Test validity again after that, to catch such false positives.
> -	 *
> -	 * This test in general will have some window for false negatives
> -	 * and may not catch and fix all such cases if an NMI comes in
> -	 * later and clobbers SRRs without clearing srr_valid, but hopefully
> -	 * such things will get caught most of the time, statistically
> -	 * enough to be able to get a warning out.
> -	 */
> -	if (!READ_ONCE(*validp))
> -		return;
> -
> -	if (!data_race(warned)) {
> -		data_race(warned = true);
> -		printk("%sSRR0 was: %lx should be: %lx\n", h, srr0, regs->nip);
> -		printk("%sSRR1 was: %lx should be: %lx\n", h, srr1, regs->msr);
> -		show_regs(regs);
> -	}
> -
> -	WRITE_ONCE(*validp, 0); /* fixup */
> -#endif
> -}
> -
>   static notrace unsigned long
>   interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
>   {
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index aa17e62f3754..719930cf4ae1 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -22,6 +22,11 @@
>   
>   #include "signal.h"
>   
> +/* This will be removed */
> +#ifdef CONFIG_GENERIC_ENTRY

Is this #ifdef really needed ?

> +#include <linux/entry-common.h>
> +#endif /* CONFIG_GENERIC_ENTRY */
> +
>   #ifdef CONFIG_VSX
>   unsigned long copy_fpr_to_user(void __user *to,
>   			       struct task_struct *task)
> @@ -368,3 +373,12 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
>   		printk_ratelimited(regs->msr & MSR_64BIT ? fm64 : fm32, tsk->comm,
>   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
>   }
> +
> +#ifdef CONFIG_GENERIC_ENTRY

Why is this #ifdef needed ?

> +void arch_do_signal_or_restart(struct pt_regs *regs)
> +{
> +	BUG_ON(regs != current->thread.regs);

Is this BUG_ON() needed ? Can't we use something smoother ?

> +	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;
> +	do_signal(current);
> +}
> +#endif /* CONFIG_GENERIC_ENTRY */


