Return-Path: <linuxppc-dev+bounces-14796-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 192E6CC1D49
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Dec 2025 10:39:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dVsMJ4VrKz2yDY;
	Tue, 16 Dec 2025 20:39:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1765877948;
	cv=none; b=FDfwOf1GQ2Y+tVqmBX79Nz+haKeitaE7suwmGHPvE9a8UVgwzvZZLVT7XQ7CzWpBn71g7qg0uAW6Nj6XO1vS8RYGxMJQpLGwoSsnXt3CVpU42IuD8ZRRlXhVNItVbgnyCXXeimU5q1Cy855InigqujpT/kCNNWmLd3f+i6ffs5oNunmmNy5R9YRQcZGHbX0g//mDym3Z3uC6IUSAduTLy8BK/RKyfUXICqRbHhhI1n3vlQhyGIRrVrJyMXdAonOnkNOz0k8L0/Nw2ULbx/Etl+LSt8leRBQfcpFI6EziJJP34sjBRMp8bde7PUr9wZroIVBoPXNSrPVOxdDuiJzXuw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1765877948; c=relaxed/relaxed;
	bh=GD4Y/wH9oFMnqqtMuc0HroB4bbFIPPtpg9xHRtKuhCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SmJC53PHysbWPwQbBJO10qeG7TQCJZTWbmmv0hQIjcrFO4gzl7HPeNCPxg7O62AmSKGPadcK8tTQCNtjwgL5/Umx+Q0wck+QgbSOo7MdVtCb+xflPpqiRbQBGf/rLJafCubE4wQWaeTCubRj9snxqhoG4kWKpJiZMGzMIy7Moza5UNZkiIGk1epbdWlxLDdZcoIE4qsFj69tNUEPQc99uoVTjoNzLBwnDbBpEC76R8ObBACryW802/I5sYNHvTjIk+HqphLyN8nu1lbifg+GNXO10Lr+cGshTHK4f6qy92kHsG6WCqPEK9jVzb2KhXA3w8I1xdbprMTnZsGEOQrvUQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nEEOZ8Qs; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nEEOZ8Qs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dVsMH36pBz2x99
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Dec 2025 20:39:07 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C31660010;
	Tue, 16 Dec 2025 09:39:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25660C4CEF1;
	Tue, 16 Dec 2025 09:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765877944;
	bh=q1Hcf1k/kvvCx6xLg+3dCNq6247Sbheq11HzrNtB3OY=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=nEEOZ8QslSTo4sx9NG7KR57gpJdugpII2VRi54oudi+rSrJf2dsrIWbvBwPvAMFEr
	 5a+chhEa8U0S+KX1UsUlftFQsw1lazn9DnNH7/Gb1w3K/hdnAlTWy7eeAd3d1NVLvt
	 5uSXL4hka0mSB2HvQJYKP3gpwY9jXy8gmh4tDBrVqQb/Z51J+RYR98wGZqFaSGJADh
	 c9BjOeH7Lpd81c701iYUvQ8JfopcC8gveFktOKLyaZv9lwtYQV+jYKOQP0tpAX8XeD
	 BOcsy4LwgYM+2FRy04ZPb74kFfamLXwY0h0ZZ+E4Q3AbwRVrM0Bcy4LWU9ewYjcF0q
	 5/VIzmxjDv7Hg==
Message-ID: <30d26b5c-7a5d-403e-a10b-381d09cae3b9@kernel.org>
Date: Tue, 16 Dec 2025 10:38:50 +0100
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
Subject: Re: [PATCH v2 3/8] powerpc: introduce arch_enter_from_user_mode
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
 <20251214130245.43664-4-mkchauras@linux.ibm.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <20251214130245.43664-4-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 14/12/2025 à 14:02, Mukesh Kumar Chaurasiya a écrit :
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Implement the arch_enter_from_user_mode() hook required by the generic
> entry/exit framework. This helper prepares the CPU state when entering
> the kernel from userspace, ensuring correct handling of KUAP/KUEP,
> transactional memory, and debug register state.
> 
> As part of this change, move booke_load_dbcr0() from interrupt.c to
> interrupt.h so it can be used by the new helper without introducing
> cross-file dependencies.
> 
> This patch contains no functional changes, it is purely preparatory for
> enabling the generic syscall and interrupt entry path on PowerPC.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> ---
>   arch/powerpc/include/asm/entry-common.h | 97 +++++++++++++++++++++++++
>   arch/powerpc/include/asm/interrupt.h    | 22 ++++++
>   arch/powerpc/kernel/interrupt.c         | 22 ------
>   3 files changed, 119 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/entry-common.h b/arch/powerpc/include/asm/entry-common.h
> index 3af16d821d07..093ece06ef79 100644
> --- a/arch/powerpc/include/asm/entry-common.h
> +++ b/arch/powerpc/include/asm/entry-common.h
> @@ -5,7 +5,104 @@
>   
>   #ifdef CONFIG_GENERIC_IRQ_ENTRY

This #ifdef is still unnecessary it seems.

>   
> +#include <asm/cputime.h>
> +#include <asm/interrupt.h>
>   #include <asm/stacktrace.h>
> +#include <asm/tm.h>
> +
> +static __always_inline void arch_enter_from_user_mode(struct pt_regs *regs)
> +{
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
> +
> +	BUG_ON(regs_is_unrecoverable(regs));
> +	BUG_ON(!user_mode(regs));
> +	BUG_ON(regs_irqs_disabled(regs));
> +
> +#ifdef CONFIG_PPC_PKEY
> +	if (mmu_has_feature(MMU_FTR_PKEY) && trap_is_syscall(regs)) {
> +		unsigned long amr, iamr;
> +		bool flush_needed = false;
> +		/*
> +		 * When entering from userspace we mostly have the AMR/IAMR
> +		 * different from kernel default values. Hence don't compare.
> +		 */
> +		amr = mfspr(SPRN_AMR);
> +		iamr = mfspr(SPRN_IAMR);
> +		regs->amr  = amr;
> +		regs->iamr = iamr;
> +		if (mmu_has_feature(MMU_FTR_KUAP)) {
> +			mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
> +			flush_needed = true;
> +		}
> +		if (mmu_has_feature(MMU_FTR_BOOK3S_KUEP)) {
> +			mtspr(SPRN_IAMR, AMR_KUEP_BLOCKED);
> +			flush_needed = true;
> +		}
> +		if (flush_needed)
> +			isync();
> +	} else
> +#endif
> +		kuap_assert_locked();

This construct is odd, can you do something about it ?

> +
> +	booke_restore_dbcr0();
> +
> +	account_cpu_user_entry();
> +
> +	account_stolen_time();
> +
> +	/*
> +	 * This is not required for the syscall exit path, but makes the
> +	 * stack frame look nicer. If this was initialised in the first stack
> +	 * frame, or if the unwinder was taught the first stack frame always
> +	 * returns to user with IRQS_ENABLED, this store could be avoided!
> +	 */
> +	irq_soft_mask_regs_set_state(regs, IRQS_ENABLED);
> +
> +	/*
> +	 * If system call is called with TM active, set _TIF_RESTOREALL to
> +	 * prevent RFSCV being used to return to userspace, because POWER9
> +	 * TM implementation has problems with this instruction returning to
> +	 * transactional state. Final register values are not relevant because
> +	 * the transaction will be aborted upon return anyway. Or in the case
> +	 * of unsupported_scv SIGILL fault, the return state does not much
> +	 * matter because it's an edge case.
> +	 */
> +	if (IS_ENABLED(CONFIG_PPC_TRANSACTIONAL_MEM) &&
> +	    unlikely(MSR_TM_TRANSACTIONAL(regs->msr)))
> +		set_bits(_TIF_RESTOREALL, &current_thread_info()->flags);
> +
> +	/*
> +	 * If the system call was made with a transaction active, doom it and
> +	 * return without performing the system call. Unless it was an
> +	 * unsupported scv vector, in which case it's treated like an illegal
> +	 * instruction.
> +	 */
> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> +	if (unlikely(MSR_TM_TRANSACTIONAL(regs->msr)) &&
> +	    !trap_is_unsupported_scv(regs)) {
> +		/* Enable TM in the kernel, and disable EE (for scv) */
> +		hard_irq_disable();
> +		mtmsr(mfmsr() | MSR_TM);
> +
> +		/* tabort, this dooms the transaction, nothing else */
> +		asm volatile(".long 0x7c00071d | ((%0) << 16)"
> +			     :: "r"(TM_CAUSE_SYSCALL | TM_CAUSE_PERSISTENT));
> +
> +		/*
> +		 * Userspace will never see the return value. Execution will
> +		 * resume after the tbegin. of the aborted transaction with the
> +		 * checkpointed register state. A context switch could occur
> +		 * or signal delivered to the process before resuming the
> +		 * doomed transaction context, but that should all be handled
> +		 * as expected.
> +		 */
> +		return;
> +	}
> +#endif /* CONFIG_PPC_TRANSACTIONAL_MEM */
> +}
> +
> +#define arch_enter_from_user_mode arch_enter_from_user_mode
>   
>   #endif /* CONFIG_GENERIC_IRQ_ENTRY */
>   #endif /* _ASM_PPC_ENTRY_COMMON_H */
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 0e2cddf8bd21..ca8a2cda9400 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -138,6 +138,28 @@ static inline void nap_adjust_return(struct pt_regs *regs)
>   #endif
>   }
>   
> +static inline void booke_load_dbcr0(void)

It was a notrace function in interrupt.c
Should it be an __always_inline now ?

Christophe

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
>   static inline void booke_restore_dbcr0(void)
>   {
>   #ifdef CONFIG_PPC_ADV_DEBUG_REGS
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 0d8fd47049a1..2a09ac5dabd6 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -78,28 +78,6 @@ static notrace __always_inline bool prep_irq_for_enabled_exit(bool restartable)
>   	return true;
>   }
>   
> -static notrace void booke_load_dbcr0(void)
> -{
> -#ifdef CONFIG_PPC_ADV_DEBUG_REGS
> -	unsigned long dbcr0 = current->thread.debug.dbcr0;
> -
> -	if (likely(!(dbcr0 & DBCR0_IDM)))
> -		return;
> -
> -	/*
> -	 * Check to see if the dbcr0 register is set up to debug.
> -	 * Use the internal debug mode bit to do this.
> -	 */
> -	mtmsr(mfmsr() & ~MSR_DE);
> -	if (IS_ENABLED(CONFIG_PPC32)) {
> -		isync();
> -		global_dbcr0[smp_processor_id()] = mfspr(SPRN_DBCR0);
> -	}
> -	mtspr(SPRN_DBCR0, dbcr0);
> -	mtspr(SPRN_DBSR, -1);
> -#endif
> -}
> -
>   static notrace void check_return_regs_valid(struct pt_regs *regs)
>   {
>   #ifdef CONFIG_PPC_BOOK3S_64


