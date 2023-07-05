Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5603D748397
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 13:57:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PFsnflyl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwyp81jJJz3bmQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 21:57:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PFsnflyl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwynG0Knyz2yyg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 21:56:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688558210; x=1720094210;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ynw6AXf7dszPcSqeI9Ih/R2B7n1Okp1K4vyVoT0Ge+c=;
  b=PFsnflylPDd6FtabQ+ehW3b61h8xpD6RC8hAM4m1oX/AtRVmSO+h6i4O
   ulMgppkV7ChmQjAjDFOggdLW++Sg4316iw4qD0SwqfGQe773vMSbB9f8e
   1tnoLhCMeWLnaIzWt7+XVfHqqE5CZNMRldNelMFVLY02AtfqCjqnVCNMz
   uHwgUKe3+LKNCmNcNMYu+C6MwEtiNVQir9dRz0ofjS/NB+1+13icMvPYV
   rJ251uH769eHAV48yYmE1S8zp6NzpqW3uuSLx4Q06AXL1q9pZ6IsGry3k
   CBiM/uA3CsWk3KHOQpEcd5OSKqQY4pzzWxVQS69Y3g885/Ci6WGX0opIy
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343651497"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="343651497"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 04:56:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="1049670901"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="1049670901"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 04:56:41 -0700
Date: Wed, 5 Jul 2023 19:56:53 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
Message-ID: <20230705115653.5whvhvcvmflqmcse@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-4-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-4-stevensd@google.com>
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

On Tue, Jul 04, 2023 at 04:50:48PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Make it so that __kvm_follow_pfn does not imply FOLL_GET. This allows
> callers to resolve a gfn when the associated pfn has a valid struct page
> that isn't being actively refcounted (e.g. tail pages of non-compound
> higher order pages). For a caller to safely omit FOLL_GET, all usages of
> the returned pfn must be guarded by a mmu notifier.
> 
> This also adds a is_refcounted_page out parameter to kvm_follow_pfn that
> is set when the returned pfn has an associated struct page with a valid
> refcount. Callers that don't pass FOLL_GET should remember this value
> and use it to avoid places like kvm_is_ad_tracked_page that assume a
> non-zero refcount.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  include/linux/kvm_host.h | 10 ++++++
>  virt/kvm/kvm_main.c      | 67 +++++++++++++++++++++-------------------
>  virt/kvm/pfncache.c      |  2 +-
>  3 files changed, 47 insertions(+), 32 deletions(-)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index ef2763c2b12e..a45308c7d2d9 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1157,6 +1157,9 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_memory_slot *slot, gfn_t gfn,
>  void kvm_release_page_clean(struct page *page);
>  void kvm_release_page_dirty(struct page *page);
>  
> +void kvm_set_page_accessed(struct page *page);
> +void kvm_set_page_dirty(struct page *page);
> +
>  struct kvm_follow_pfn {
>  	const struct kvm_memory_slot *slot;
>  	gfn_t gfn;
> @@ -1164,10 +1167,17 @@ struct kvm_follow_pfn {
>  	bool atomic;
>  	/* Allow a read fault to create a writeable mapping. */
>  	bool allow_write_mapping;
> +	/*
> +	 * Usage of the returned pfn will be guared by a mmu notifier. Must
> +	 * be true if FOLL_GET is not set.
> +	 */
> +	bool guarded_by_mmu_notifier;

And how? Any place to check the invalidate seq?

B.R.
Yu
