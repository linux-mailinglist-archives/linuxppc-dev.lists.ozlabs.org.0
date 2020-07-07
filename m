Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A2BD216626
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 08:04:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B1Bj84R4qzDqW6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Jul 2020 16:04:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B1BgS67sqzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Jul 2020 16:03:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=LPNcA6N4; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4B1BgS49vxz9sRK;
 Tue,  7 Jul 2020 16:03:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1594101780;
 bh=QrWrYVgYa6g2YypBfv/Bu7EVXUobhl9H1qywtuJPCq8=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=LPNcA6N49XUNnsqlxoVSwNSfK24RlwmLDJIiVjCIXMwl0iGFLODYOCtYcaZbyZvMC
 Wnyqshl6DG+BUyzJO1VqjHoIHBE1jZAKgKUbyMymaNzioFIlNz8TQOoTXsgqIjYqFV
 HywyGRz1IOt070vUcVvuCce7rXwAQF7J1mtYbAuCUOr7zzuBpc6ZRD4SKmWUCniNMb
 37QtgVlmgz/lJQETUb1SQlhVDnFEVvUGtu10HQk36G+U0gw1SEd+V4DsoDuHNASU3r
 ts119N7Y8p7qHNCvEs2fdwg7OYk2HGdcqBwtv0HwdyjM1Pe5TeXB2qgliogGzGpf5+
 6hU9RauOpZkXg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v5 23/26] powerpc/book3s64/kuap: Move UAMOR setup to key
 init function
In-Reply-To: <20200619135850.47155-24-aneesh.kumar@linux.ibm.com>
References: <20200619135850.47155-1-aneesh.kumar@linux.ibm.com>
 <20200619135850.47155-24-aneesh.kumar@linux.ibm.com>
Date: Tue, 07 Jul 2020 16:05:15 +1000
Message-ID: <87fta35084.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxram@us.ibm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

"Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
> UAMOR values are not application-specific.

It used to be, that's worth mentioning.

> The kernel initializes its value based on different reserved keys.
> Remove the thread-specific UAMOR value and don't switch the UAMOR on
> context switch.
>
> Move UAMOR initialization to key initialization code. Now that
> KUAP/KUEP feature depends on PPC_MEM_KEYS, we can start to consolidate
> all register initialization to keys init.
>
> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/book3s/64/kup.h |  2 ++
>  arch/powerpc/include/asm/processor.h     |  1 -
>  arch/powerpc/kernel/ptrace/ptrace-view.c | 17 ++++++++----
>  arch/powerpc/kernel/smp.c                |  5 ++++
>  arch/powerpc/mm/book3s64/pkeys.c         | 35 ++++++++++++++----------
>  5 files changed, 39 insertions(+), 21 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/book3s/64/kup.h b/arch/powerpc/include/asm/book3s/64/kup.h
> index 3a0e138d2735..942594745dfa 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup.h
> @@ -67,6 +67,8 @@
>  #include <asm/mmu.h>
>  #include <asm/ptrace.h>
>  
> +extern u64 default_uamor;
> +
>  static inline void kuap_restore_amr(struct pt_regs *regs, unsigned long amr)
>  {
>  	if (mmu_has_feature(MMU_FTR_KUAP) && unlikely(regs->kuap != amr)) {
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index 52a67835057a..6ac12168f1fe 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -237,7 +237,6 @@ struct thread_struct {
>  #ifdef CONFIG_PPC_MEM_KEYS
>  	unsigned long	amr;
>  	unsigned long	iamr;
> -	unsigned long	uamor;
>  #endif
>  #ifdef CONFIG_KVM_BOOK3S_32_HANDLER
>  	void*		kvm_shadow_vcpu; /* KVM internal data */
> diff --git a/arch/powerpc/kernel/ptrace/ptrace-view.c b/arch/powerpc/kernel/ptrace/ptrace-view.c
> index caeb5822a8f4..689711eb018a 100644
> --- a/arch/powerpc/kernel/ptrace/ptrace-view.c
> +++ b/arch/powerpc/kernel/ptrace/ptrace-view.c
> @@ -488,14 +488,22 @@ static int pkey_active(struct task_struct *target, const struct user_regset *reg
>  static int pkey_get(struct task_struct *target, const struct user_regset *regset,
>  		    unsigned int pos, unsigned int count, void *kbuf, void __user *ubuf)
>  {
> +	int ret;
> +
>  	BUILD_BUG_ON(TSO(amr) + sizeof(unsigned long) != TSO(iamr));
> -	BUILD_BUG_ON(TSO(iamr) + sizeof(unsigned long) != TSO(uamor));
>  
>  	if (!arch_pkeys_enabled())
>  		return -ENODEV;
>  
> -	return user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.amr,
> -				   0, ELF_NPKEY * sizeof(unsigned long));
> +	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &target->thread.amr,
> +				  0, 2 * sizeof(unsigned long));
> +	if (ret)
> +		goto err_out;

Why not just return?

> +
> +	ret = user_regset_copyout(&pos, &count, &kbuf, &ubuf, &default_uamor,
> +				  2 * sizeof(unsigned long), 3 * sizeof(unsigned long));
> +err_out:
> +	return ret;
>  }
>  
>  static int pkey_set(struct task_struct *target, const struct user_regset *regset,
> @@ -518,8 +526,7 @@ static int pkey_set(struct task_struct *target, const struct user_regset *regset
>  		return ret;
>  
>  	/* UAMOR determines which bits of the AMR can be set from userspace. */
> -	target->thread.amr = (new_amr & target->thread.uamor) |
> -			     (target->thread.amr & ~target->thread.uamor);
> +	target->thread.amr = (new_amr & default_uamor) | (target->thread.amr & ~default_uamor);

That comment could explain better why we are bothering to mask with ~default_uamor.

>  	return 0;
>  }
> diff --git a/arch/powerpc/kernel/smp.c b/arch/powerpc/kernel/smp.c
> index c820c95162ff..eec40082599f 100644
> --- a/arch/powerpc/kernel/smp.c
> +++ b/arch/powerpc/kernel/smp.c
> @@ -59,6 +59,7 @@
>  #include <asm/asm-prototypes.h>
>  #include <asm/cpu_has_feature.h>
>  #include <asm/ftrace.h>
> +#include <asm/kup.h>
>  
>  #ifdef DEBUG
>  #include <asm/udbg.h>
> @@ -1256,6 +1257,10 @@ void start_secondary(void *unused)
>  	mmgrab(&init_mm);
>  	current->active_mm = &init_mm;
>  
> +#ifdef CONFIG_PPC_MEM_KEYS
> +	mtspr(SPRN_UAMOR, default_uamor);
> +#endif

That's 1) not very pretty and 2) risks blowing up on other CPUs.

It should at least go in early_init_mmu_secondary().

>  	smp_store_cpu_info(cpu);
>  	set_dec(tb_ticks_per_jiffy);
>  	preempt_disable();
> diff --git a/arch/powerpc/mm/book3s64/pkeys.c b/arch/powerpc/mm/book3s64/pkeys.c
> index aeecc8b8e11c..3f3593f85358 100644
> --- a/arch/powerpc/mm/book3s64/pkeys.c
> +++ b/arch/powerpc/mm/book3s64/pkeys.c
> @@ -24,7 +24,7 @@ static u32  initial_allocation_mask;   /* Bits set for the initially allocated k
>  static u64 default_amr;
>  static u64 default_iamr;
>  /* Allow all keys to be modified by default */
> -static u64 default_uamor = ~0x0UL;
> +u64 default_uamor = ~0x0UL;

__ro_after_init?

>  /*
>   * Key used to implement PROT_EXEC mmap. Denies READ/WRITE
>   * We pick key 2 because 0 is special key and 1 is reserved as per ISA.
> @@ -113,8 +113,16 @@ void __init pkey_early_init_devtree(void)
>  	/* scan the device tree for pkey feature */
>  	pkeys_total = scan_pkey_feature();
>  	if (!pkeys_total) {
> -		/* No support for pkey. Mark it disabled */
> -		return;
> +		/*
> +		 * No key support but on radix we can use key 0
> +		 * to implement kuap.
> +		 */
> +		if (early_radix_enabled())
> +			/*
> +			 * Make sure userspace can't change the AMR
> +			 */
> +			default_uamor = 0;
> +		goto err_out;

Would be cleaner if you inverted that. ie. initialise to 0 and then set
to ~0x0UL when you detect pkeys.

>  	}
>  
>  	cur_cpu_spec->mmu_features |= MMU_FTR_PKEY;
> @@ -197,6 +205,12 @@ void __init pkey_early_init_devtree(void)
>  	initial_allocation_mask |= reserved_allocation_mask;
>  
>  	pr_info("Enabling Memory keys with max key count %d", max_pkey);
> +err_out:

It's not "err" out if the OK path goes via here. That's just "out".

> +	/*
> +	 * Setup uamor on boot cpu
> +	 */
> +	mtspr(SPRN_UAMOR, default_uamor);
> +
>  	return;
>  }
>  
> @@ -232,8 +246,9 @@ void __init setup_kuap(bool disabled)
>  		cur_cpu_spec->mmu_features |= MMU_FTR_KUAP;
>  	}
>  
> -	/* Make sure userspace can't change the AMR */
> -	mtspr(SPRN_UAMOR, 0);

Why not just leave it there. It's extra insurance and it's good
documentation.

> +	/*
> +	 * Set the default kernel AMR values on all cpus.
> +	 */
>  	mtspr(SPRN_AMR, AMR_KUAP_BLOCKED);
>  	isync();
>  }
> @@ -278,11 +293,6 @@ static inline u64 read_uamor(void)
>  	return mfspr(SPRN_UAMOR);
>  }
>  
> -static inline void write_uamor(u64 value)
> -{
> -	mtspr(SPRN_UAMOR, value);
> -}
> -
>  static bool is_pkey_enabled(int pkey)
>  {
>  	u64 uamor = read_uamor();
> @@ -353,7 +363,6 @@ void thread_pkey_regs_save(struct thread_struct *thread)
>  	 */
>  	thread->amr = read_amr();
>  	thread->iamr = read_iamr();
> -	thread->uamor = read_uamor();
>  }
>  
>  void thread_pkey_regs_restore(struct thread_struct *new_thread,
> @@ -366,8 +375,6 @@ void thread_pkey_regs_restore(struct thread_struct *new_thread,
>  		write_amr(new_thread->amr);
>  	if (old_thread->iamr != new_thread->iamr)
>  		write_iamr(new_thread->iamr);
> -	if (old_thread->uamor != new_thread->uamor)
> -		write_uamor(new_thread->uamor);
>  }
>  
>  void thread_pkey_regs_init(struct thread_struct *thread)
> @@ -377,11 +384,9 @@ void thread_pkey_regs_init(struct thread_struct *thread)
>  
>  	thread->amr   = default_amr;
>  	thread->iamr  = default_iamr;
> -	thread->uamor = default_uamor;
>  
>  	write_amr(default_amr);
>  	write_iamr(default_iamr);
> -	write_uamor(default_uamor);
>  }
>  
>  int execute_only_pkey(struct mm_struct *mm)

cheers
