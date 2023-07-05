Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E89C2747E33
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 09:25:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcfli2Ct;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwrmB6JzKz30fm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 17:25:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fcfli2Ct;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.24; helo=mga09.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 65 seconds by postgrey-1.37 at boromir; Wed, 05 Jul 2023 17:24:43 AEST
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwrlH0zNYz3020
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 17:24:42 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688541883; x=1720077883;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NS28w+WymzMKhKs2KK3bH5xOvIImsi/4GcjzUcK6qWc=;
  b=fcfli2CthmL7S0Xc3mXOl8wp8ag0APn/gpMp0iPorY1Hq/o7XQDrTJvS
   S7WiwRIRMCb4AmdPRtFXxPWdbnEZB8BOdJ0u8/Cn/3tT1eIw2fMys08RF
   HGDJNnM1QryjvXsEveBNToBSeDQsDgtQN9uoGE+ADkIEn4yMnNlu1SySh
   KOwNLhCAsnyDBToH7zZ2z+SYm8UJQfuw0KU0OvIX3GLRocmJCdvjnZXgN
   90lNtUWSUd6rsWY05fsL378FCIf1PteO/9/qfJ7vRCIelJgi4yaHVPH5j
   2YbmXFE8sIQR0NdungNLxKe0GbuY0Qz2U6cJIrCxagc+il0LLvTTHBuiy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="365838935"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="365838935"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 00:23:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="789062435"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="789062435"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 00:23:29 -0700
Date: Wed, 5 Jul 2023 15:23:35 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
Message-ID: <20230705072335.xfest7csh27f67v3@linux.intel.com>
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

>  
> +void kvm_set_page_accessed(struct page *page);
> +void kvm_set_page_dirty(struct page *page);
> +
No one calls these 2 routines in this patch. How about move this change to
[PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn ?

...

> @@ -2930,17 +2933,19 @@ static bool kvm_is_ad_tracked_page(struct page *page)
>  	return !PageReserved(page);
>  }
>  
> -static void kvm_set_page_dirty(struct page *page)
> +void kvm_set_page_dirty(struct page *page)
>  {
>  	if (kvm_is_ad_tracked_page(page))
>  		SetPageDirty(page);
>  }
> +EXPORT_SYMBOL_GPL(kvm_set_page_dirty);
>  
> -static void kvm_set_page_accessed(struct page *page)
> +void kvm_set_page_accessed(struct page *page)
>  {
>  	if (kvm_is_ad_tracked_page(page))
>  		mark_page_accessed(page);
>  }
> +EXPORT_SYMBOL_GPL(kvm_set_page_accessed);

Same here.

B.R.
Yu
