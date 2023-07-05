Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 612357485D9
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 16:18:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW9d+1HM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qx1wg25drz3brp
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 00:18:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lW9d+1HM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.120; helo=mga04.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qx1vk14hNz30K6
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 00:17:35 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688566659; x=1720102659;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=dxaLcFyIX6B15hyemUTtg4E+16m6duFMnhi44AUxrxk=;
  b=lW9d+1HMoEgSiZGQUGLt0hv5bqTlbIpXJRD1qgn25KX7ROhAod7igBwc
   w0vXhVjSD/afcXCrR6OgM2hTj+m/ZQg6oUOZaJdViICNjvrY4McrkXuKA
   enVZJp4t1rYulMSIotuQdDr1Mrom74LFKOF4DtIRkzDawlAuE/jo/NF4f
   iomcqLdjxdakao+QMcKh7YvKX2zaGib/jI8V3j2kGi5oAm/WOrw98elRh
   qPcTLQZIdEElnGjlYbCR5miOj3DNFaR+beiXdGdFE8JXJKbcnIunBhNTu
   yDpVU2e1haUzV8cMnOovbFb4NSTQ4nF1NAj90qb9poG4QGWLMeIECkyP+
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="362218771"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="362218771"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:17:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="965848045"
X-IronPort-AV: E=Sophos;i="6.01,183,1684825200"; 
   d="scan'208";a="965848045"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 07:17:27 -0700
Date: Wed, 5 Jul 2023 22:17:42 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230705141741.xqvjddsoo5qgax63@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
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

> > @@ -883,7 +884,7 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> >   */
> >  static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
> >  {
> > -	bool host_writable;
> > +	bool host_writable, is_refcounted;
> >  	gpa_t first_pte_gpa;
> >  	u64 *sptep, spte;
> >  	struct kvm_memory_slot *slot;
> > @@ -940,10 +941,12 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
> >  	sptep = &sp->spt[i];
> >  	spte = *sptep;
> >  	host_writable = spte & shadow_host_writable_mask;
> > +	// TODO: is this correct?
> > +	is_refcounted = spte & SPTE_MMU_PAGE_REFCOUNTED;
> >  	slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
> >  	make_spte(vcpu, sp, slot, pte_access, gfn,
> >  		  spte_to_pfn(spte), spte, true, false,
> > -		  host_writable, &spte);
> > +		  host_writable, is_refcounted, &spte);
> 
> Could we restrict that a non-refcounted page shall not be used as shadow page?

Oh, sorry. It's not about shadow page. It's about guest page being
mapped as not refcounted. Silly me...

B.R.
Yu
