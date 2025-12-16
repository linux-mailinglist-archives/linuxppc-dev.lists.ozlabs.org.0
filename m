Return-Path: <linuxppc-dev+bounces-14804-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A5DCC1FFA
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 11:43:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVtnx0nXtz2yDY;
	Tue, 16 Dec 2025 21:43:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765881828;
	cv=none; b=LC48Xly6IA+mxUpWE5KL8vGTuxEU4UHK+GYwby7ZOskqsSK70v3wVpsi4cEVWjHlAvvLOJvi+bgw2h8riwdKKq7X5QB3bV5MuhIowvgy2AoJpzieLrxmcYbQaC46ManaYrkzKQQMX3iogQ+nHVCkAldE2uzx9Y145bdSRW+OWcjIorp5eotCDld9d5jq3R/Pr4jVNRrmoUWAM/fRetXfGZSBP0u1NTj7JZPpTKu7rziaoxJ8XTJnReRp74sffrKD6hrx5kqC/1fKMEeQ/ZH0dXMcrSfRah+gHMhRXSy4HJ6YdCdhNF7QiamFcc9yJ4CnGmmhFbIZ420DVvQlolUb9g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765881828; c=relaxed/relaxed;
	bh=Ha765uVj1LK5ccxQvGmaTTxfI4x8tmijUZ7V6aU8478=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=I+7wxxvexfnnHA1jw1U+dOXL1bNGBsrrrgO0OZchbPgzOfGxv8HTXo3yQM488DN6gYOMuF4DwtZg3Z43O9SUJ/aBaXetmupqEgP9QlGPJnEXD8wnxx2vDerYXnYE52Nxn/Zac4c/dQT8KdupbqscInAgiKYc6V55ABYXbNttxtjkYv50vcpfPDaPp8EuGvCjzsbGSzhmEP7khuHj98Azq10yaHKIPtLEIzkbv/og2R4zo1FhqFR4lAqePMLhOmllWvbtI2HULeFOM1f7m5Wlr/iwEhpL6VQggflB2Bp9n0vrZx909G8reHOWcN57SOCc10PUyoi/353g6xq8ylOMVA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kKV43/7i; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kKV43/7i;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVtnw0cllz2xqf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 21:43:48 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9399743CBE;
	Tue, 16 Dec 2025 10:43:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1ABAAC4CEF1;
	Tue, 16 Dec 2025 10:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765881795;
	bh=eRzo0nGpPZV7pKWhWM8sw/iza/GTpTdjz4hBzUhMixA=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=kKV43/7iYWeXCKaTRxkUzSAj8vub8vCzU7I34embwR3mIUll3RmWculudc514nOz+
	 H/oDntPe8vUyWOK/IawRh/wF6OawJ4oYyKg9EnSNH3Rbq/slc2Tu3tEwKepn7ulsIl
	 nm4tJgeQiEc9fs09BmXwuKGvZ6gWR4YlhCXI8UKM96UkiQrGW5OZLupjruhw32QSch
	 RewDXH9Lm7sjgx0JH7XYQCnJ179aKdqzj24NhfbY6O2HSd/8zsbiOJKFQxwxEw/Hi/
	 CWl807rhFET955Nlq047ydPJw5PbBrKuxgvOHb1DzDxMPE/QMDdPgc7l5zyLzmXcX2
	 9q0NrixO8QDDQ==
Message-ID: <3de95000-19ce-499e-b6b6-7e207c02c73c@kernel.org>
Date: Tue, 16 Dec 2025 11:43:02 +0100
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
Subject: Re: [PATCH v2 7/8] powerpc: Enable IRQ generic entry/exit path.
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
 <20251214130245.43664-8-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-8-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Enable the generic IRQ entry/exit infrastructure on PowerPC by selecting
> GENERIC_IRQ_ENTRY and integrating the architecture-specific interrupt
> handlers with the generic entry/exit APIs.
> 
> This change replaces PowerPC’s local interrupt entry/exit handling with
> calls to the generic irqentry_* helpers, aligning the architecture with
> the common kernel entry model. The macros that define interrupt, async,
> and NMI handlers are updated to use irqentry_enter()/irqentry_exit()
> and irqentry_nmi_enter()/irqentry_nmi_exit() where applicable.
> 
> Key updates include:
>   - Select GENERIC_IRQ_ENTRY in Kconfig.
>   - Replace interrupt_enter/exit_prepare() with arch_interrupt_* helpers.
>   - Integrate irqentry_enter()/exit() in standard and async interrupt paths.
>   - Integrate irqentry_nmi_enter()/exit() in NMI handlers.
>   - Remove redundant irq_enter()/irq_exit() calls now handled generically.
>   - Use irqentry_exit_cond_resched() for preemption checks.
> 
> This change establishes the necessary wiring for PowerPC to use the
> generic IRQ entry/exit framework while maintaining existing semantics.

Did you look into resulting code ?

do_IRQ() is bigger and calls irqentry_enter() which is bigger than 
irq_enter().

And irq_enter_rcu() was tail-called from irq_enter(), now is it called 
after irqentry_enter().

> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig                    |   1 +
>   arch/powerpc/include/asm/entry-common.h |  66 +---
>   arch/powerpc/include/asm/interrupt.h    | 499 +++---------------------
>   arch/powerpc/kernel/interrupt.c         |  13 +-
>   4 files changed, 74 insertions(+), 505 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index e24f4d88885a..b0c602c3bbe1 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -206,6 +206,7 @@ config PPC
>   	select GENERIC_GETTIMEOFDAY
>   	select GENERIC_IDLE_POLL_SETUP
>   	select GENERIC_IOREMAP
> +	select GENERIC_IRQ_ENTRY
>   	select GENERIC_IRQ_SHOW
>   	select GENERIC_IRQ_SHOW_LEVEL
>   	select GENERIC_PCI_IOMAP		if PCI
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index e8bde4c67eaf..e2ae7416dee1 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -257,6 +257,17 @@ static inline void arch_interrupt_enter_prepare(struct pt_regs *regs)
>    */
>   static inline void arch_interrupt_exit_prepare(struct pt_regs *regs)
>   {
> +	if (user_mode(regs)) {
> +		BUG_ON(regs_is_unrecoverable(regs));
> +		BUG_ON(regs_irqs_disabled(regs));
> +		/*
> +		 * We don't need to restore AMR on the way back to userspace for KUAP.
> +		 * AMR can only have been unlocked if we interrupted the kernel.
> +		 */
> +		kuap_assert_locked();
> +
> +		local_irq_disable();
> +	}
>   }
>   
>   static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
> @@ -275,7 +286,6 @@ static inline void arch_interrupt_async_enter_prepare(struct pt_regs *regs)
>   	    !test_thread_local_flags(_TLF_RUNLATCH))
>   		__ppc64_runlatch_on();
>   #endif
> -	irq_enter();
>   }
>   
>   static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
> @@ -288,7 +298,6 @@ static inline void arch_interrupt_async_exit_prepare(struct pt_regs *regs)
>   	 */
>   	nap_adjust_return(regs);
>   
> -	irq_exit();
>   	arch_interrupt_exit_prepare(regs);
>   }
>   
> @@ -354,59 +363,11 @@ static inline void arch_interrupt_nmi_enter_prepare(struct pt_regs *regs,
>   		this_cpu_set_ftrace_enabled(0);
>   	}
>   #endif
> -
> -	/* If data relocations are enabled, it's safe to use nmi_enter() */
> -	if (mfmsr() & MSR_DR) {
> -		nmi_enter();
> -		return;
> -	}
> -
> -	/*
> -	 * But do not use nmi_enter() for pseries hash guest taking a real-mode
> -	 * NMI because not everything it touches is within the RMA limit.
> -	 */
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> -	    firmware_has_feature(FW_FEATURE_LPAR) &&
> -	    !radix_enabled())
> -		return;
> -
> -	/*
> -	 * Likewise, don't use it if we have some form of instrumentation (like
> -	 * KASAN shadow) that is not safe to access in real mode (even on radix)
> -	 */
> -	if (IS_ENABLED(CONFIG_KASAN))
> -		return;
> -
> -	/*
> -	 * Likewise, do not use it in real mode if percpu first chunk is not
> -	 * embedded. With CONFIG_NEED_PER_CPU_PAGE_FIRST_CHUNK enabled there
> -	 * are chances where percpu allocation can come from vmalloc area.
> -	 */
> -	if (percpu_first_chunk_is_paged)
> -		return;
> -
> -	/* Otherwise, it should be safe to call it */
> -	nmi_enter();
>   }
>   
>   static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
>   					      struct interrupt_nmi_state *state)
>   {
> -	if (mfmsr() & MSR_DR) {
> -		// nmi_exit if relocations are on
> -		nmi_exit();
> -	} else if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) &&
> -		   firmware_has_feature(FW_FEATURE_LPAR) &&
> -		   !radix_enabled()) {
> -		// no nmi_exit for a pseries hash guest taking a real mode exception
> -	} else if (IS_ENABLED(CONFIG_KASAN)) {
> -		// no nmi_exit for KASAN in real mode
> -	} else if (percpu_first_chunk_is_paged) {
> -		// no nmi_exit if percpu first chunk is not embedded
> -	} else {
> -		nmi_exit();
> -	}
> -
>   	/*
>   	 * nmi does not call nap_adjust_return because nmi should not create
>   	 * new work to do (must use irq_work for that).
> @@ -435,6 +396,8 @@ static inline void arch_interrupt_nmi_exit_prepare(struct pt_regs *regs,
>   
>   static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>   {
> +	kuap_lock();
> +

A reason why this change comes now and not in the patch that added 
arch_enter_from_user_mode() ?

>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>   		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
>   
> @@ -467,11 +430,8 @@ static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
>   	} else
>   #endif
>   		kuap_assert_locked();
> -
>   	booke_restore_dbcr0();
> -

This is cosmetic, should have been done when adding 
arch_enter_from_user_mode()

>   	account_cpu_user_entry();
> -
>   	account_stolen_time();
>   
>   	/*


Christophe

