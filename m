Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF01E7481E6
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 12:18:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZKUvR/+;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwwc66BTWz3blb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:18:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MZKUvR/+;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwwbD3lTbz2xpx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 20:17:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688552280; x=1720088280;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oLxACQJJ5+O8I5OycraL/46XHwuWjbLPz8/XoWWOHjg=;
  b=MZKUvR/+rjN9WF2mmIauYRIHmqGXtHynbtg1iRahWLSOU1oTLy7/EOut
   XlSkUrS1DXHb7kiyyKf5iMgqS01BCMq5smT2NzYgTevtiUdaYCDeR9mUh
   BGnG2LadCD/DxuNktPh2VsFuSMKIcN1WtTyQxIKFNhbcOFzJmSm9iOnDs
   X8eWnwc/leXJAeRYfDJcMEVKgCta0s8B2qiPJ7MWqKH1/izloQCPYdu3X
   p3+wvIdxnSatIHW2f2phgMy0YmIPwIxqICYo13jQMlOnmMtrYUUB/mF1e
   tNMh4e3vBdJtK6lxFwaKSpDOfKfCXTlSnZLU/+3LjAFA/2cO55r7TERRs
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365873177"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="365873177"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:17:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="965775138"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="965775138"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:17:51 -0700
Date: Wed, 5 Jul 2023 18:18:00 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
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

I guess you mean the tail pages of the higher order non-compound pages?
And as to the head page, it is said to be set to one coincidentally[*],
and shall not be considered as refcounted.  IIUC, refcount of this head
page will be increased and decreased soon in hva_to_pfn_remapped(), so
this may not be a problem(?). But treating this head page differently,
as a refcounted one(e.g., to set the A/D flags), is weired. 

Or maybe I missed some context, e.g., can the head page be allocted to
guest at all? 


> 
> The bulk of this change is tracking the is_refcounted_page flag so that
> non-refcounted pages don't trigger page_count() == 0 warnings. This is
> done by storing the flag in an unused bit in the sptes.

Also, maybe we should mention this only works on x86-64. 

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

...

> @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
>  	bool host_writable = !fault || fault->map_writable;
>  	bool prefetch = !fault || fault->prefetch;
>  	bool write_fault = fault && fault->write;
> +	bool is_refcounted = !fault || fault->is_refcounted_page;

Just wonder, what if a non-refcounted page is prefetched?  Or is it possible in
practice?

...
>  
> @@ -883,7 +884,7 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>   */
>  static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
>  {
> -	bool host_writable;
> +	bool host_writable, is_refcounted;
>  	gpa_t first_pte_gpa;
>  	u64 *sptep, spte;
>  	struct kvm_memory_slot *slot;
> @@ -940,10 +941,12 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
>  	sptep = &sp->spt[i];
>  	spte = *sptep;
>  	host_writable = spte & shadow_host_writable_mask;
> +	// TODO: is this correct?
> +	is_refcounted = spte & SPTE_MMU_PAGE_REFCOUNTED;
>  	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
>  	make_spte(vcpu, sp, slot, pte_access, gfn,
>  		  spte_to_pfn(spte), spte, true, false,
> -		  host_writable, &spte);
> +		  host_writable, is_refcounted, &spte);

Could we restrict that a non-refcounted page shall not be used as shadow page?

[*] https://lore.kernel.org/all/8caf3008-dcf3-985a-631e-e019b277c6f0@amd.com/

B.R.
Yu
