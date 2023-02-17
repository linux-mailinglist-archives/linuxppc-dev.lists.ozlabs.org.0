Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5311A69A830
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 10:34:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PJ6981DkVz3f5Z
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Feb 2023 20:34:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LqTvLkKM;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.dev (client-ip=91.218.175.73; helo=out-73.mta0.migadu.com; envelope-from=oliver.upton@linux.dev; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=LqTvLkKM;
	dkim-atps=neutral
X-Greylist: delayed 398 seconds by postgrey-1.36 at boromir; Fri, 17 Feb 2023 20:16:35 AEDT
Received: from out-73.mta0.migadu.com (out-73.mta0.migadu.com [91.218.175.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PJ5m353Lpz2xT9
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Feb 2023 20:16:35 +1100 (AEDT)
Date: Fri, 17 Feb 2023 09:09:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1676624982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=jEON53HopKt5AEJM7v2ACA7ESAHW6jokOAvOWSVy+nM=;
	b=LqTvLkKM/ypuS79r4nGR9lPM3xij+PoUOG8Cq+CwhQzKfpvSRoBz+12/eQv+MqzQSY4gPt
	bsGLqK0lh5RDWPJZAUZIlBVWTYZ5dJiWplOYTfL0IdvfDYI5HN5yE6yOLkV0YOt71qj3es
	zF3iJw1pVDYu+QGb6BIC2AY51dx314s=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH mm-unstable v1 3/5] kvm/arm64: add
 kvm_arch_test_clear_young()
Message-ID: <Y+9EUeUIS/ZUe2vw@linux.dev>
References: <20230217041230.2417228-1-yuzhao@google.com>
 <20230217041230.2417228-4-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230217041230.2417228-4-yuzhao@google.com>
X-Migadu-Flow: FLOW_OUT
X-Mailman-Approved-At: Fri, 17 Feb 2023 20:34:04 +1100
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Yu,

scripts/get_maintainers.pl is your friend for getting the right set of
emails for a series :) Don't know about others, but generally I would
prefer to be Cc'ed on an entire series (to gather context) than just an
individual patch.

On Thu, Feb 16, 2023 at 09:12:28PM -0700, Yu Zhao wrote:
> This patch adds kvm_arch_test_clear_young() for the vast majority of
> VMs that are not pKVM and run on hardware that sets the accessed bit
> in KVM page tables.
> 
> It relies on two techniques, RCU and cmpxchg, to safely test and clear
> the accessed bit without taking the MMU lock. The former protects KVM
> page tables from being freed while the latter clears the accessed bit
> atomically against both the hardware and other software page table
> walkers.
> 
> Signed-off-by: Yu Zhao <yuzhao@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h       |  7 +++
>  arch/arm64/include/asm/kvm_pgtable.h    |  8 +++
>  arch/arm64/include/asm/stage2_pgtable.h | 43 ++++++++++++++
>  arch/arm64/kvm/arm.c                    |  1 +
>  arch/arm64/kvm/hyp/pgtable.c            | 51 ++--------------
>  arch/arm64/kvm/mmu.c                    | 77 ++++++++++++++++++++++++-
>  6 files changed, 141 insertions(+), 46 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 35a159d131b5..572bcd321586 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1031,4 +1031,11 @@ static inline void kvm_hyp_reserve(void) { }
>  void kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu);
>  bool kvm_arm_vcpu_stopped(struct kvm_vcpu *vcpu);
>  
> +/* see the comments on the generic kvm_arch_has_test_clear_young() */
> +#define kvm_arch_has_test_clear_young kvm_arch_has_test_clear_young
> +static inline bool kvm_arch_has_test_clear_young(void)
> +{
> +	return IS_ENABLED(CONFIG_KVM) && cpu_has_hw_af() && !is_protected_kvm_enabled();
> +}

Why does the lack of FEAT_HAFDBS preclude the use of the test-and-clear
notifier?

On implementations without FEAT_HAFDBS, hardware will generate a data
abort for software to set the access flag. Regardless of whether
software or hardware is responsible for updating the PTE that
information is available in the page tables.

Also, I'm at a loss for why we'd need to test if CONFIG_KVM is enabled.
My expectation is that we should provide an implementation that returns
false if !CONFIG_KVM, avoiding the need to repeat that bit in every
single implementation of the function.

> +
>  #endif /* __ARM64_KVM_HOST_H__ */
> diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
> index 63f81b27a4e3..8c9a04388c88 100644
> --- a/arch/arm64/include/asm/kvm_pgtable.h
> +++ b/arch/arm64/include/asm/kvm_pgtable.h
> @@ -105,6 +105,7 @@ static inline bool kvm_level_supports_block_mapping(u32 level)
>   * @put_page:			Decrement the refcount on a page. When the
>   *				refcount reaches 0 the page is automatically
>   *				freed.
> + * @put_page_rcu:		RCU variant of put_page().
>   * @page_count:			Return the refcount of a page.
>   * @phys_to_virt:		Convert a physical address into a virtual
>   *				address	mapped in the current context.
> @@ -122,6 +123,7 @@ struct kvm_pgtable_mm_ops {
>  	void		(*free_removed_table)(void *addr, u32 level);
>  	void		(*get_page)(void *addr);
>  	void		(*put_page)(void *addr);
> +	void		(*put_page_rcu)(void *addr);

Why do we need this? We already defer dropping the last reference count
on a page to an RCU callback. Have you observed issues with the existing
implementation?

>  	int		(*page_count)(void *addr);
>  	void*		(*phys_to_virt)(phys_addr_t phys);
>  	phys_addr_t	(*virt_to_phys)(void *addr);
> @@ -188,6 +190,12 @@ typedef bool (*kvm_pgtable_force_pte_cb_t)(u64 addr, u64 end,
>   *					children.
>   * @KVM_PGTABLE_WALK_SHARED:		Indicates the page-tables may be shared
>   *					with other software walkers.
> + *
> + * kvm_arch_test_clear_young() is a special case. It relies on two
> + * techniques, RCU and cmpxchg, to safely test and clear the accessed
> + * bit without taking the MMU lock. The former protects KVM page tables
> + * from being freed while the latter clears the accessed bit atomically
> + * against both the hardware and other software page table walkers.
>   */
>  enum kvm_pgtable_walk_flags {
>  	KVM_PGTABLE_WALK_LEAF			= BIT(0),
> diff --git a/arch/arm64/include/asm/stage2_pgtable.h b/arch/arm64/include/asm/stage2_pgtable.h
> index c8dca8ae359c..350437661d4b 100644
> --- a/arch/arm64/include/asm/stage2_pgtable.h
> +++ b/arch/arm64/include/asm/stage2_pgtable.h
> @@ -30,4 +30,47 @@
>   */
>  #define kvm_mmu_cache_min_pages(kvm)	(kvm_stage2_levels(kvm) - 1)
>  
> +#define KVM_PTE_TYPE			BIT(1)
> +#define KVM_PTE_TYPE_BLOCK		0
> +#define KVM_PTE_TYPE_PAGE		1
> +#define KVM_PTE_TYPE_TABLE		1
> +
> +#define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
> +
> +#define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
> +#define KVM_PTE_LEAF_ATTR_LO_S1_AP	GENMASK(7, 6)
> +#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RO	3
> +#define KVM_PTE_LEAF_ATTR_LO_S1_AP_RW	1
> +#define KVM_PTE_LEAF_ATTR_LO_S1_SH	GENMASK(9, 8)
> +#define KVM_PTE_LEAF_ATTR_LO_S1_SH_IS	3
> +#define KVM_PTE_LEAF_ATTR_LO_S1_AF	BIT(10)
> +
> +#define KVM_PTE_LEAF_ATTR_LO_S2_MEMATTR	GENMASK(5, 2)
> +#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R	BIT(6)
> +#define KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W	BIT(7)
> +#define KVM_PTE_LEAF_ATTR_LO_S2_SH	GENMASK(9, 8)
> +#define KVM_PTE_LEAF_ATTR_LO_S2_SH_IS	3
> +#define KVM_PTE_LEAF_ATTR_LO_S2_AF	BIT(10)
> +
> +#define KVM_PTE_LEAF_ATTR_HI		GENMASK(63, 51)
> +
> +#define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
> +
> +#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
> +
> +#define KVM_PTE_LEAF_ATTR_HI_S2_XN	BIT(54)
> +
> +#define KVM_PTE_LEAF_ATTR_S2_PERMS	(KVM_PTE_LEAF_ATTR_LO_S2_S2AP_R | \
> +					 KVM_PTE_LEAF_ATTR_LO_S2_S2AP_W | \
> +					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
> +
> +#define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
> +#define KVM_MAX_OWNER_ID		1
> +
> +/*
> + * Used to indicate a pte for which a 'break-before-make' sequence is in
> + * progress.
> + */
> +#define KVM_INVALID_PTE_LOCKED		BIT(10)
> +

If there is a need to do these sort of moves, please do it in a separate
patch. It pollutes the context of the functional change you're making.

>  #endif	/* __ARM64_S2_PGTABLE_H_ */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 9c5573bc4614..6770bc47f5c9 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -191,6 +191,7 @@ vm_fault_t kvm_arch_vcpu_fault(struct kvm_vcpu *vcpu, struct vm_fault *vmf)
>   */
>  void kvm_arch_destroy_vm(struct kvm *kvm)
>  {
> +	kvm_free_stage2_pgd(&kvm->arch.mmu);
>
>  	bitmap_free(kvm->arch.pmu_filter);
>  	free_cpumask_var(kvm->arch.supported_cpus);
>  

[...]

> +struct test_clear_young_arg {
> +	struct kvm_gfn_range *range;
> +	gfn_t lsb_gfn;
> +	unsigned long *bitmap;
> +};
> +
> +static int stage2_test_clear_young(const struct kvm_pgtable_visit_ctx *ctx,
> +				   enum kvm_pgtable_walk_flags flags)
> +{
> +	struct test_clear_young_arg *arg = ctx->arg;
> +	gfn_t gfn = ctx->addr / PAGE_SIZE;
> +	kvm_pte_t new = ctx->old & ~KVM_PTE_LEAF_ATTR_LO_S2_AF;
> +
> +	VM_WARN_ON_ONCE(!page_count(virt_to_page(ctx->ptep)));
> +	VM_WARN_ON_ONCE(gfn < arg->range->start || gfn >= arg->range->end);

Do we really need to be _this_ pedantic about sanity checking?

> +	if (!kvm_pte_valid(new))
> +		return 0;
> +
> +	if (new == ctx->old)
> +		return 0;
> +
> +	/* see the comments on the generic kvm_arch_has_test_clear_young() */
> +	if (__test_and_change_bit(arg->lsb_gfn - gfn, arg->bitmap))
> +		cmpxchg64(ctx->ptep, ctx->old, new);

Why not use stage2_try_set_pte()? Not only is it idiomatic with the rest
of the stage-2 code, it also will 'do the right thing' according to the
locking scheme of the caller if we decide to change it at some point.

> +	return 0;
> +}
> +
> +bool kvm_arch_test_clear_young(struct kvm *kvm, struct kvm_gfn_range *range,
> +			       gfn_t lsb_gfn, unsigned long *bitmap)
> +{
> +	u64 start = range->start * PAGE_SIZE;
> +	u64 end = range->end * PAGE_SIZE;
> +	struct test_clear_young_arg arg = {
> +		.range		= range,
> +		.lsb_gfn	= lsb_gfn,
> +		.bitmap		= bitmap,
> +	};
> +	struct kvm_pgtable_walker walker = {
> +		.cb		= stage2_test_clear_young,
> +		.arg		= &arg,
> +		.flags		= KVM_PGTABLE_WALK_LEAF,
> +	};
> +
> +	BUILD_BUG_ON(is_hyp_code());

See prior comment about sanity checking.

> +	if (WARN_ON_ONCE(!kvm_arch_has_test_clear_young()))
> +		return false;

Same here...

> +	/* see the comments on kvm_pgtable_walk_flags */
> +	rcu_read_lock();
> +
> +	kvm_pgtable_walk(kvm->arch.mmu.pgt, start, end - start, &walker);
> +
> +	rcu_read_unlock();

The rcu_read_{lock,unlock}() is entirely superfluous.

Of course, it is somewhat hidden by the fact that we must use
abstractions to support host and EL2 use of the page table code, but we
already make use of RCU to protect the stage-2 of a 'regular' VM.

> +	return true;
> +}
> +
>  bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
>  {
>  	if (!kvm->arch.mmu.pgt)
> @@ -1848,7 +1924,6 @@ void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen)
>  
>  void kvm_arch_flush_shadow_all(struct kvm *kvm)
>  {
> -	kvm_free_stage2_pgd(&kvm->arch.mmu);
>  }

Doesn't this become a blatant correctness issue? This entirely fails to
uphold the exact expectations of the call.

-- 
Thanks,
Oliver
