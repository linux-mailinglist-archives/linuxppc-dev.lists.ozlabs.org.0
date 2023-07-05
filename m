Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC01747F12
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 10:08:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzsxQxyJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qwsk459GXz3bnQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 18:08:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=KzsxQxyJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.151; helo=mga17.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwsjC1w5Sz2ynx
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 18:07:57 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688544479; x=1720080479;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Cn1WBv4JrMsrgoasE/lasO/n0SnRwlADo/SoWnSzf8M=;
  b=KzsxQxyJnhrixjauFw5DOS6Jqf3zeWi2daE3Rm+PlkujKOAJ41svLpml
   Hi7OIxpeKkFOUg4aJgxs+RxewC99gAZHkBJKp5yWgjojiWywsioRuMWD4
   TeNLvKw9ba/TgMZFouWgLDi10g7Tl6fmdeG2W0Cxu3YW2/UypnORb0yjk
   c9mTPIXdf09729Ufw3ZEERjcbRgKfgaul4pp7jQ/2oYRf3znN42N5icwX
   C0ffQhWLjJAxMrg+FqHdx5hBPb6tgIeV58bd6282RQfwNuNqB+SpviS2f
   u2NxJrdGak+MLo87NlbIyhikN9TzUczJIpG+2ImOaKh1MihpyW7oXG3PH
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="343610819"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="343610819"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 01:07:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="669323671"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="669323671"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 01:07:50 -0700
Date: Wed, 5 Jul 2023 16:07:56 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 4/8] KVM: x86/mmu: Migrate to __kvm_follow_pfn
Message-ID: <20230705080756.xv7fm3jxewipunvn@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-5-stevensd@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704075054.3344915-5-stevensd@google.com>
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

On Tue, Jul 04, 2023 at 04:50:49PM +0900, David Stevens wrote:
> From: David Stevens <stevensd@chromium.org>
> 
> Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn.
> 
> Signed-off-by: David Stevens <stevensd@chromium.org>
> ---
>  arch/x86/kvm/mmu/mmu.c | 35 +++++++++++++++++++++++++----------
>  1 file changed, 25 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index ec169f5c7dce..e44ab512c3a1 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -4296,7 +4296,12 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *vcpu, struct kvm_async_pf *work)
>  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault)
>  {
>  	struct kvm_memory_slot *slot = fault->slot;
> -	bool async;
> +	struct kvm_follow_pfn foll = {
> +		.slot = slot,
> +		.gfn = fault->gfn,
> +		.flags = FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> +		.allow_write_mapping = true,
> +	};
>  
>  	/*
>  	 * Retry the page fault if the gfn hit a memslot that is being deleted
> @@ -4325,12 +4330,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fault *fault
>  			return RET_PF_EMULATE;
>  	}
>  
> -	async = false;
> -	fault->pfn = __gfn_to_pfn_memslot(slot, fault->gfn, false, false, &async,
> -					  fault->write, &fault->map_writable,
> -					  &fault->hva);
> -	if (!async)
> -		return RET_PF_CONTINUE; /* *pfn has correct page already */
> +	foll.flags |= FOLL_NOWAIT;
> +	fault->pfn = __kvm_follow_pfn(&foll);
> +
> +	if (!is_error_noslot_pfn(fault->pfn))
> +		goto success;
> +
> +	if (fault->pfn != KVM_PFN_ERR_NEEDS_IO)
> +		return RET_PF_CONTINUE;

IIUC, FOLL_NOWAIT is set only when we wanna an async fault. So
KVM_PFN_ERR_NEEDS_IO may not be necessary? 

B.R.
Yu
