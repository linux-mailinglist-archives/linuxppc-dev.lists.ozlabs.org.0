Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D99C0748218
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 12:26:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPR14ChB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwwn25VfBz3031
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:26:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RPR14ChB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mga12.intel.com (client-ip=192.55.52.136; helo=mga12.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwwmB21wYz30fn
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 20:25:44 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688552746; x=1720088746;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=y8+es5GU/s3CDdhqqc9dbSKcYl4fiYpoYuR8e98/2/o=;
  b=RPR14ChBVgc0ZcR7oUQKzE6Zv7nkmh6LcRReAWPXIiiFaMcr7g+NmlNy
   HEmj+fOAr8uRqksusrsG6/b+KJwC/s+muANuE2vwV/ACdLvoRcCTwdR3y
   SPv8gd9c9dfiG3XQ/61Moou2tbFGF/+uWq2nCw1OljAZvEmmNwxW+Gi7V
   GIY15tFlEgIDTqJv/cpOmL+5L3NrOMpoiHFGViiWJuKIPi5YpKCgXCNx5
   9ps0B7oRroSVjFYXApw4qkCzNrVFpz3LKxRP86w8dah/ZHi8iPxtZYT8d
   MDcH2M502RUfPqg8QR6b5DP/xp06Q2jcfqV+gWnJSjuAYCB30AV2vvLoU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="342894970"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="342894970"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:25:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="719171428"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="719171428"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:25:38 -0700
Date: Wed, 5 Jul 2023 18:25:47 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230705102547.hr2zxkdkecdxp5tf@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-6-stevensd@google.com>
User-Agent: NeoMutt/20171215
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to map
> memory into the guest that is backed by un-refcounted struct pages - for
> example, higher order non-compound pages allocated by the amdgpu driver
> via ttm_pool_alloc_page.
> 
> The bulk of this change is tracking the is_refcounted_page flag so that
> non-refcounted pages don't trigger page_count() == 0 warnings. This is
> done by storing the flag in an unused bit in the sptes.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  arch/x86/kvm/mmu/mmu.c          | 44 +++++++++++++++++++++------------
>  arch/x86/kvm/mmu/mmu_internal.h |  1 +
>  arch/x86/kvm/mmu/paging_tmpl.h  |  9 ++++---
>  arch/x86/kvm/mmu/spte.c         |  4 ++-
>  arch/x86/kvm/mmu/spte.h         | 12 ++++++++-
>  arch/x86/kvm/mmu/tdp_mmu.c      | 22 ++++++++++-------
>  6 files changed, 62 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index e44ab512c3a1..b1607e314497 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -553,12 +553,14 @@ static bool mmu_spte_update(u64 *sptep, u64 new_spte)
>  
>  	if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
>  		flush = true;
> -		kvm_set_pfn_accessed(spte_to_pfn(old_spte));
> +		if (is_refcounted_page_pte(old_spte))
> +			kvm_set_page_accessed(pfn_to_page(spte_to_pfn(old_spte)));
>  	}
>  
>  	if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte)) {
>  		flush = true;
> -		kvm_set_pfn_dirty(spte_to_pfn(old_spte));
> +		if (is_refcounted_page_pte(old_spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(old_spte)));
>  	}
>  
>  	return flush;
> @@ -596,14 +598,18 @@ static u64 mmu_spte_clear_track_bits(struct kvm *kvm, u64 *sptep)
>  	 * before they are reclaimed.  Sanity check that, if the pfn is backed
>  	 * by a refcounted page, the refcount is elevated.
>  	 */
> -	page = kvm_pfn_to_refcounted_page(pfn);
> -	WARN_ON(page && !page_count(page));
> +	if (is_refcounted_page_pte(old_spte)) {
> +		page = kvm_pfn_to_refcounted_page(pfn);
> +		WARN_ON(!page || !page_count(page));
> +	}
>  
> -	if (is_accessed_spte(old_spte))
> -		kvm_set_pfn_accessed(pfn);
> +	if (is_refcounted_page_pte(old_spte)) {
> +		if (is_accessed_spte(old_spte))
> +			kvm_set_page_accessed(pfn_to_page(pfn));
>  
> -	if (is_dirty_spte(old_spte))
> -		kvm_set_pfn_dirty(pfn);
> +		if (is_dirty_spte(old_spte))
> +			kvm_set_page_dirty(pfn_to_page(pfn));
> +	}
>  
>  	return old_spte;
>  }
> @@ -639,8 +645,8 @@ static bool mmu_spte_age(u64 *sptep)
>  		 * Capture the dirty status of the page, so that it doesn't get
>  		 * lost when the SPTE is marked for access tracking.
>  		 */
> -		if (is_writable_pte(spte))
> -			kvm_set_pfn_dirty(spte_to_pfn(spte));
> +		if (is_writable_pte(spte) && is_refcounted_page_pte(spte))
> +			kvm_set_page_dirty(pfn_to_page(spte_to_pfn(spte)));
>  
>  		spte = mark_spte_for_access_track(spte);
>  		mmu_spte_update_no_track(sptep, spte);
> @@ -1278,8 +1284,8 @@ static bool spte_wrprot_for_clear_dirty(u64 *sptep)
>  {
>  	bool was_writable = test_and_clear_bit(PT_WRITABLE_SHIFT,
>  					       (unsigned long *)sptep);
> -	if (was_writable && !spte_ad_enabled(*sptep))
> -		kvm_set_pfn_dirty(spte_to_pfn(*sptep));
> +	if (was_writable && !spte_ad_enabled(*sptep) && is_refcounted_page_pte(*sptep))
> +		kvm_set_page_dirty(pfn_to_page(spte_to_pfn(*sptep)));
>  
>  	return was_writable;
>  }
> @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>  	bool host_writable = !fault || fault->map_writable;
>  	bool prefetch = !fault || fault->prefetch;
>  	bool write_fault = fault && fault->write;
> +	bool is_refcounted = !fault || fault->is_refcounted_page;
>  
>  	pgprintk("%s: spte %llx write_fault %d gfn %llx\n", __func__,
>  		 *sptep, write_fault, gfn);
> @@ -2969,7 +2976,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>  	}
>  
>  	wrprot = make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep, prefetch,
> -			   true, host_writable, &spte);
> +			   true, host_writable, is_refcounted, &spte);
>  
>  	if (*sptep == spte) {
>  		ret = RET_PF_SPURIOUS;
> @@ -4299,8 +4306,9 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  	struct kvm_follow_pfn foll = {
>  		.slot = slot,
>  		.gfn = fault->gfn,
> -		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> +		.flags = fault->write ? FOLL_WRITE : 0,
>  		.allow_write_mapping = true,
> +		.guarded_by_mmu_notifier = true,
>  	};
>  
>  	/*
> @@ -4317,6 +4325,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  			fault->slot = NULL;
>  			fault->pfn = KVM_PFN_NOSLOT;
>  			fault->map_writable = false;
> +			fault->is_refcounted_page = false;
>  			return RET_PF_CONTINUE;
>  		}
>  		/*
> @@ -4366,6 +4375,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  success:
>  	fault->hva = foll.hva;
>  	fault->map_writable = foll.writable;
> +	fault->is_refcounted_page = foll.is_refcounted_page;
>  	return RET_PF_CONTINUE;
>  }
>  
> @@ -4451,7 +4461,8 @@ static int direct_page_fault(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  
>  out_unlock:
>  	write_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);
> +	if (fault->is_refcounted_page)
> +		kvm_set_page_accessed(pfn_to_page(fault->pfn));
>  	return r;
>  }
>  
> @@ -4529,7 +4540,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu *vcpu,
>  
>  out_unlock:
>  	read_unlock(&vcpu->kvm->mmu_lock);
> -	kvm_release_pfn_clean(fault->pfn);

Yet kvm_release_pfn() can still be triggered for the kvm_vcpu_maped gfns.
What if guest uses a non-referenced page(e.g., as a vmcs12)? Although I
believe this is not gonna happen in real world... 

B.R.
Yu
