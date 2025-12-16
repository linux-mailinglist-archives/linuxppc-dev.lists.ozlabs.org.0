Return-Path: <linuxppc-dev+bounces-14805-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40995CC210B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 12:03:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVvDm5C1Dz2yDY;
	Tue, 16 Dec 2025 22:03:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765883016;
	cv=none; b=E8DyLJDOgElk0Fgv+iljjjo11Taqs7wEG1pLjDe08Ry55ZcRRrcgvKsaqgvqeNzxcLyHjrVWvPHhlsh8AyhG84xG4b9OSAvC0WNURZnMBRYpOiJcKd+hMcqIRmHbozog0xcRn2UbSihuAPlHRIwadGwDyB4O/Dd6cGxGV1teiihMNwJGM2a6a9LxMAUiRkP9J28Uo2kwsSx9p6cQ8Adw0UtOdiHL1kRi1wYwAw1UaSB9GH+dN1YtkUmLKOGBSzod8HqqFbI5YBeuLHxEcn5QBujf+7T5AbpYmi457Z/kQ0wO2RA1ZsA/5esefj1J2Q3/sd/r11hwsO31zDX5cjPSOA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765883016; c=relaxed/relaxed;
	bh=OPzPnGS3GsW6mi6nY5sUI5t9bNXbIsp+4huu2DfFPjw=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=cG1FFUh9nMMmgI7wiJHByDID04T7RZzpxcfb+dZJz+yFuSOb5WibC4hxnES4cSbEexS4NX4Y17zbwYqa66tMkS6SQJC6fStT7gUnND/AX8mYWPWvtGqiEa62PRlHFG5vb+32D5H4XgGHqioEaGS56GhZdLuCHch+53b4mm2o9PLmejLMgrwLZwDhue6Gs4K6c8JIGbpnXMVU6ru97icMdajIRbOuJn9D1PUR/cR3/Ie8DGlbV6hiSKoB6l51NPto1RlW3LI7GraXrktxQ7/+gl2nyx/2ksc/xMLrAGVvJ5gT5netaapZTvCPS+ot/6/CgM5eyuKpdigAZqqUI5zFRQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYe6LV4i; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=FYe6LV4i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVvDl5jN4z2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 22:03:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1B4DC60173;
	Tue, 16 Dec 2025 11:03:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B30A0C4CEF1;
	Tue, 16 Dec 2025 11:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765882982;
	bh=yE5rzQKOx+YBMpFhZUUJ2COKTHdW2FGFQ1fAh9vTFPw=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=FYe6LV4iLkxSAmGDwoX4HedJ/Fpv9/EyKgD/CmEk5N3j9B+0Hgoj6NxTAi5pPnWBD
	 zwl4cxBkH5/TtuGPDY1k4h02nRW8UPfQ9xYEoAdIG7fYBLrQa7tgFiZPuTWDLJ6pTh
	 S7BJ6gJkV8zWjywbYImaFZAPneTzG1M6jBfB1M0L02CvH4Miw7xYI3FcAj6abSqQI9
	 LGfq+1hDPYI+94zL80hupo9pi5RuBww0o6/uY1yYPBkNJra3IO0/FM6F+nMMsSt09w
	 P2t4sOdWn45dNQRPe88aYQG95gU5Ygb8Vgq3e6Ed914nXk+frAHXK1ZFBtMZK2pxuT
	 SV06tK1Zn2a3g==
Message-ID: <a406618d-641e-4e8c-afc5-7c4f0db42b1f@kernel.org>
Date: Tue, 16 Dec 2025 12:01:32 +0100
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
Subject: Re: [PATCH v2 8/8] powerpc: Enable Generic Entry/Exit for syscalls.
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
 <20251214130245.43664-9-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-9-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Convert the PowerPC syscall entry and exit paths to use the generic
> entry/exit framework by selecting GENERIC_ENTRY and integrating with
> the common syscall handling routines.
> 
> This change transitions PowerPC away from its custom syscall entry and
> exit code to use the generic helpers such as:
>   - syscall_enter_from_user_mode()
>   - syscall_exit_to_user_mode()
> 
> As part of this migration:
>   - The architecture now selects GENERIC_ENTRY in Kconfig.
>   - Old tracing, seccomp, and audit handling in ptrace.c is removed in
>     favor of generic entry infrastructure.
>   - interrupt.c and syscall.c are simplified to delegate context
>     management and user exit handling to the generic entry path.
>   - The new pt_regs field `exit_flags` introduced earlier is now used
>     to carry per-syscall exit state flags (e.g. _TIF_RESTOREALL).
> 
> This aligns PowerPC with the common entry code used by other
> architectures and reduces duplicated logic around syscall tracing,
> context tracking, and signal handling.
> 
> The performance benchmarks from perf bench basic syscall are below:
> 
> perf bench syscall usec/op
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid usec/op | 0.207795   | 0.210373      | -1.22%   |
> | getpgid usec/op | 0.206282   | 0.211676      | -2.55%   |
> | fork usec/op    | 833.986    | 814.809       | +2.35%   |
> | execve usec/op  | 360.939    | 365.168       | -1.16%   |
> 
> perf bench syscall ops/sec
> 
> | Test            | With Patch | Without Patch | % Change |
> | --------------- | ---------- | ------------- | -------- |
> | getppid ops/sec | 48,12,433  | 47,53,459     | +1.24%   |
> | getpgid ops/sec | 48,47,744  | 47,24,192     | +2.61%   |
> | fork ops/sec    | 1,199      | 1,227         | -2.28%   |
> | execve ops/sec  | 2,770      | 2,738         | +1.16%   |
> 
> IPI latency benchmark
> 
> | Metric                  | With Patch       | Without Patch    | % Change |
> | ----------------------- | ---------------- | ---------------- | -------- |
> | Dry-run (ns)            | 206,675.81       | 206,719.36       | -0.02%   |
> | Self-IPI avg (ns)       | 1,939,991.00     | 1,976,116.15     | -1.83%   |
> | Self-IPI max (ns)       | 3,533,718.93     | 3,582,650.33     | -1.37%   |
> | Normal IPI avg (ns)     | 111,110,034.23   | 110,513,373.51   | +0.54%   |
> | Normal IPI max (ns)     | 150,393,442.64   | 149,669,477.89   | +0.48%   |
> | Broadcast IPI max (ns)  | 3,978,231,022.96 | 4,359,916,859.46 | -8.73%   |
> | Broadcast lock max (ns) | 4,025,425,714.49 | 4,384,956,730.83 | -8.20%   |
> 
> Thats very close to performance earlier with arch specific handling.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                    |   1 +
>   arch/powerpc/include/asm/entry-common.h |   5 +-
>   arch/powerpc/kernel/interrupt.c         | 139 +++++++----------------
>   arch/powerpc/kernel/ptrace/ptrace.c     | 141 ------------------------
>   arch/powerpc/kernel/signal.c            |  10 +-
>   arch/powerpc/kernel/syscall.c           | 119 +-------------------
>   6 files changed, 49 insertions(+), 366 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index b0c602c3bbe1..a4330775b254 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -203,6 +203,7 @@ config PPC
>   	select GENERIC_CPU_AUTOPROBE
>   	select GENERIC_CPU_VULNERABILITIES	if PPC_BARRIER_NOSPEC
>   	select GENERIC_EARLY_IOREMAP
> +	select GENERIC_ENTRY
>   	select GENERIC_GETTIMEOFDAY
>   	select GENERIC_IDLE_POLL_SETUP
>   	select GENERIC_IOREMAP
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index e2ae7416dee1..77129174f882 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -3,7 +3,7 @@
>   #ifndef _ASM_PPC_ENTRY_COMMON_H
>   #define _ASM_PPC_ENTRY_COMMON_H
>   
> -#ifdef CONFIG_GENERIC_IRQ_ENTRY
> +#ifdef CONFIG_GENERIC_ENTRY

Powerpc now selected this inconditionaly. Why is this #ifdef needed ?


>   
>   #include <asm/cputime.h>
>   #include <asm/interrupt.h>
> @@ -217,9 +217,6 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
>   
>   	if (user_mode(regs)) {
>   		kuap_lock();
> -		CT_WARN_ON(ct_state() != CT_STATE_USER);
> -		user_exit_irqoff();
> -
>   		account_cpu_user_entry();
>   		account_stolen_time();
>   	} else {
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 7f67f0b9d627..7d5cd4b5a610 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-or-later
>   
>   #include <linux/context_tracking.h>
> +#include <linux/entry-common.h>
>   #include <linux/err.h>
>   #include <linux/compat.h>
>   #include <linux/rseq.h>
> @@ -73,79 +74,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
>   	return true;
>   }
>   
> -static notrace unsigned long
> -interrupt_exit_user_prepare_main(unsigned long ret, struct pt_regs *regs)
> -{
> -	unsigned long ti_flags;
> -
> -again:
> -	ti_flags = read_thread_flags();
> -	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
> -		local_irq_enable();
> -		if (ti_flags & (_TIF_NEED_RESCHED | _TIF_NEED_RESCHED_LAZY)) {
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

do_notify_resume() has no caller anymore, should be removed from 
arch/powerpc/include/asm/signal.h and arch/powerpc/kernel/signal.c



> -		}
> -		local_irq_disable();
> -		ti_flags = read_thread_flags();
> -	}
> -
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
> -
> -	check_return_regs_valid(regs);
> -
> -	user_enter_irqoff();
> -	if (!prep_irq_for_enabled_exit(true)) {
> -		user_exit_irqoff();
> -		local_irq_enable();
> -		local_irq_disable();
> -		goto again;
> -	}
> -
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -	local_paca->tm_scratch = regs->msr;
> -#endif
> -
> -	booke_load_dbcr0();
> -
> -	account_cpu_user_exit();
> -
> -	/* Restore user access locks last */
> -	kuap_user_restore(regs);
> -
> -	return ret;
> -}
> -
>   /*
>    * This should be called after a syscall returns, with r3 the return value
>    * from the syscall. If this function returns non-zero, the system call
> @@ -160,17 +88,12 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   					   long scv)
>   {
>   	unsigned long ti_flags;
> -	unsigned long ret = 0;
>   	bool is_not_scv = !IS_ENABLED(CONFIG_PPC_BOOK3S_64) || !scv;
>   
> -	CT_WARN_ON(ct_state() == CT_STATE_USER);
> -
>   	kuap_assert_locked();
>   
>   	regs->result = r3;
> -
> -	/* Check whether the syscall is issued inside a restartable sequence */
> -	rseq_syscall(regs);
> +	regs->exit_flags = 0;
>   
>   	ti_flags = read_thread_flags();
>   
> @@ -183,7 +106,7 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   
>   	if (unlikely(ti_flags & _TIF_PERSYSCALL_MASK)) {
>   		if (ti_flags & _TIF_RESTOREALL)
> -			ret = _TIF_RESTOREALL;
> +			regs->exit_flags = _TIF_RESTOREALL;
>   		else
>   			regs->gpr[3] = r3;
>   		clear_bits(_TIF_PERSYSCALL_MASK, &current_thread_info()->flags);
> @@ -192,18 +115,28 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	}
>   
>   	if (unlikely(ti_flags & _TIF_SYSCALL_DOTRACE)) {
> -		do_syscall_trace_leave(regs);
> -		ret |= _TIF_RESTOREALL;
> +		regs->exit_flags |= _TIF_RESTOREALL;
>   	}
>   
> -	local_irq_disable();
> -	ret = interrupt_exit_user_prepare_main(ret, regs);
> +	syscall_exit_to_user_mode(regs);
> +
> +again:
> +	user_enter_irqoff();
> +	if (!prep_irq_for_enabled_exit(true)) {
> +		user_exit_irqoff();
> +		local_irq_enable();
> +		local_irq_disable();
> +		goto again;
> +	}
> +
> +	/* Restore user access locks last */
> +	kuap_user_restore(regs);
>   
>   #ifdef CONFIG_PPC64
> -	regs->exit_result = ret;
> +	regs->exit_result = regs->exit_flags;
>   #endif
>   
> -	return ret;
> +	return regs->exit_flags;
>   }
>   
>   #ifdef CONFIG_PPC64
> @@ -223,13 +156,16 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
>   	set_kuap(AMR_KUAP_BLOCKED);
>   #endif
>   
> -	trace_hardirqs_off();
> -	user_exit_irqoff();
> -	account_cpu_user_entry();
> -
> -	BUG_ON(!user_mode(regs));
> +again:
> +	user_enter_irqoff();
> +	if (!prep_irq_for_enabled_exit(true)) {
> +		user_exit_irqoff();
> +		local_irq_enable();
> +		local_irq_disable();
> +		goto again;
> +	}
>   
> -	regs->exit_result = interrupt_exit_user_prepare_main(regs->exit_result, regs);
> +	regs->exit_result |= regs->exit_flags;
>   
>   	return regs->exit_result;
>   }
> @@ -241,7 +177,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>   
>   	BUG_ON(regs_is_unrecoverable(regs));
>   	BUG_ON(regs_irqs_disabled(regs));
> -	CT_WARN_ON(ct_state() == CT_STATE_USER);
>   
>   	/*
>   	 * We don't need to restore AMR on the way back to userspace for KUAP.
> @@ -250,8 +185,21 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>   	kuap_assert_locked();
>   
>   	local_irq_disable();
> +	regs->exit_flags = 0;
> +again:
> +	check_return_regs_valid(regs);
> +	user_enter_irqoff();
> +	if (!prep_irq_for_enabled_exit(true)) {
> +		user_exit_irqoff();
> +		local_irq_enable();
> +		local_irq_disable();
> +		goto again;
> +	}
> +
> +	/* Restore user access locks last */
> +	kuap_user_restore(regs);
>   
> -	ret = interrupt_exit_user_prepare_main(0, regs);
> +	ret = regs->exit_flags;
>   
>   #ifdef CONFIG_PPC64
>   	regs->exit_result = ret;
> @@ -293,8 +241,6 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   		/* Returning to a kernel context with local irqs enabled. */
>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>   again:
> -		if (need_irq_preemption())
> -			irqentry_exit_cond_resched();
>   
>   		check_return_regs_valid(regs);
>   
> @@ -364,7 +310,6 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
>   #endif
>   
>   	trace_hardirqs_off();
> -	user_exit_irqoff();
>   	account_cpu_user_entry();
>   
>   	BUG_ON(!user_mode(regs));
> diff --git a/arch/powerpc/kernel/ptrace/ptrace.c b/arch/powerpc/kernel/ptrace/ptrace.c
> index 2134b6d155ff..316d4f5ead8e 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace.c
> @@ -21,9 +21,6 @@
>   #include <asm/switch_to.h>
>   #include <asm/debug.h>
>   
> -#define CREATE_TRACE_POINTS
> -#include <trace/events/syscalls.h>
> -
>   #include "ptrace-decl.h"
>   
>   /*
> @@ -195,144 +192,6 @@ long arch_ptrace(struct task_struct *child, long request,
>   	return ret;
>   }
>   
> -#ifdef CONFIG_SECCOMP
> -static int do_seccomp(struct pt_regs *regs)
> -{
> -	if (!test_thread_flag(TIF_SECCOMP))
> -		return 0;
> -
> -	/*
> -	 * The ABI we present to seccomp tracers is that r3 contains
> -	 * the syscall return value and orig_gpr3 contains the first
> -	 * syscall parameter. This is different to the ptrace ABI where
> -	 * both r3 and orig_gpr3 contain the first syscall parameter.
> -	 */
> -	regs->gpr[3] = -ENOSYS;
> -
> -	/*
> -	 * We use the __ version here because we have already checked
> -	 * TIF_SECCOMP. If this fails, there is nothing left to do, we
> -	 * have already loaded -ENOSYS into r3, or seccomp has put
> -	 * something else in r3 (via SECCOMP_RET_ERRNO/TRACE).
> -	 */
> -	if (__secure_computing())
> -		return -1;
> -
> -	/*
> -	 * The syscall was allowed by seccomp, restore the register
> -	 * state to what audit expects.
> -	 * Note that we use orig_gpr3, which means a seccomp tracer can
> -	 * modify the first syscall parameter (in orig_gpr3) and also
> -	 * allow the syscall to proceed.
> -	 */
> -	regs->gpr[3] = regs->orig_gpr3;
> -
> -	return 0;
> -}
> -#else
> -static inline int do_seccomp(struct pt_regs *regs) { return 0; }
> -#endif /* CONFIG_SECCOMP */
> -
> -/**
> - * do_syscall_trace_enter() - Do syscall tracing on kernel entry.
> - * @regs: the pt_regs of the task to trace (current)
> - *
> - * Performs various types of tracing on syscall entry. This includes seccomp,
> - * ptrace, syscall tracepoints and audit.
> - *
> - * The pt_regs are potentially visible to userspace via ptrace, so their
> - * contents is ABI.
> - *
> - * One or more of the tracers may modify the contents of pt_regs, in particular
> - * to modify arguments or even the syscall number itself.
> - *
> - * It's also possible that a tracer can choose to reject the system call. In
> - * that case this function will return an illegal syscall number, and will put
> - * an appropriate return value in regs->r3.
> - *
> - * Return: the (possibly changed) syscall number.
> - */
> -long do_syscall_trace_enter(struct pt_regs *regs)

Remove prototype from arch/powerpc/include/asm/ptrace.h

> -{
> -	u32 flags;
> -
> -	flags = read_thread_flags() & (_TIF_SYSCALL_EMU | _TIF_SYSCALL_TRACE);
> -
> -	if (flags) {
> -		int rc = ptrace_report_syscall_entry(regs);
> -
> -		if (unlikely(flags & _TIF_SYSCALL_EMU)) {
> -			/*
> -			 * A nonzero return code from
> -			 * ptrace_report_syscall_entry() tells us to prevent
> -			 * the syscall execution, but we are not going to
> -			 * execute it anyway.
> -			 *
> -			 * Returning -1 will skip the syscall execution. We want
> -			 * to avoid clobbering any registers, so we don't goto
> -			 * the skip label below.
> -			 */
> -			return -1;
> -		}
> -
> -		if (rc) {
> -			/*
> -			 * The tracer decided to abort the syscall. Note that
> -			 * the tracer may also just change regs->gpr[0] to an
> -			 * invalid syscall number, that is handled below on the
> -			 * exit path.
> -			 */
> -			goto skip;
> -		}
> -	}
> -
> -	/* Run seccomp after ptrace; allow it to set gpr[3]. */
> -	if (do_seccomp(regs))
> -		return -1;
> -
> -	/* Avoid trace and audit when syscall is invalid. */
> -	if (regs->gpr[0] >= NR_syscalls)
> -		goto skip;
> -
> -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> -		trace_sys_enter(regs, regs->gpr[0]);
> -
> -	if (!is_32bit_task())
> -		audit_syscall_entry(regs->gpr[0], regs->gpr[3], regs->gpr[4],
> -				    regs->gpr[5], regs->gpr[6]);
> -	else
> -		audit_syscall_entry(regs->gpr[0],
> -				    regs->gpr[3] & 0xffffffff,
> -				    regs->gpr[4] & 0xffffffff,
> -				    regs->gpr[5] & 0xffffffff,
> -				    regs->gpr[6] & 0xffffffff);
> -
> -	/* Return the possibly modified but valid syscall number */
> -	return regs->gpr[0];
> -
> -skip:
> -	/*
> -	 * If we are aborting explicitly, or if the syscall number is
> -	 * now invalid, set the return value to -ENOSYS.
> -	 */
> -	regs->gpr[3] = -ENOSYS;
> -	return -1;
> -}
> -
> -void do_syscall_trace_leave(struct pt_regs *regs)
> -{
> -	int step;
> -
> -	audit_syscall_exit(regs);
> -
> -	if (unlikely(test_thread_flag(TIF_SYSCALL_TRACEPOINT)))
> -		trace_sys_exit(regs, regs->result);
> -
> -	step = test_thread_flag(TIF_SINGLESTEP);
> -	if (step || test_thread_flag(TIF_SYSCALL_TRACE))
> -		ptrace_report_syscall_exit(regs, step);
> -}
> -
>   void __init pt_regs_check(void);
>   
>   /*
> diff --git a/arch/powerpc/kernel/signal.c b/arch/powerpc/kernel/signal.c
> index 719930cf4ae1..9f1847b4742e 100644
> --- a/arch/powerpc/kernel/signal.c
> +++ b/arch/powerpc/kernel/signal.c
> @@ -6,6 +6,7 @@
>    *    Extracted from signal_32.c and signal_64.c
>    */
>   
> +#include <linux/entry-common.h>
>   #include <linux/resume_user_mode.h>
>   #include <linux/signal.h>
>   #include <linux/uprobes.h>
> @@ -22,11 +23,6 @@
>   
>   #include "signal.h"
>   
> -/* This will be removed */
> -#ifdef CONFIG_GENERIC_ENTRY
> -#include <linux/entry-common.h>
> -#endif /* CONFIG_GENERIC_ENTRY */
> -

Until now CONFIG_GENERIC_ENTRY was not defined.

Now that it is defined, we remove the entire block ?

Then why has it been added at all ?

>   #ifdef CONFIG_VSX
>   unsigned long copy_fpr_to_user(void __user *to,
>   			       struct task_struct *task)
> @@ -374,11 +370,9 @@ void signal_fault(struct task_struct *tsk, struct pt_regs *regs,
>   				   task_pid_nr(tsk), where, ptr, regs->nip, regs->link);
>   }
>   
> -#ifdef CONFIG_GENERIC_ENTRY
>   void arch_do_signal_or_restart(struct pt_regs *regs)
>   {
>   	BUG_ON(regs != current->thread.regs);
> -	local_paca->generic_fw_flags |= GFW_RESTORE_ALL;

Why was that there ? I thought it was preparatory, then you remove it 
before even using it ?

> +	regs->exit_flags |= _TIF_RESTOREALL;
>   	do_signal(current);
>   }
> -#endif /* CONFIG_GENERIC_ENTRY */

