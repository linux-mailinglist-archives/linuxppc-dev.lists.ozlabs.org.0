Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53422749638
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 09:20:27 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFQRH+n2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxSbs1hVrz3bvW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:20:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AFQRH+n2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=134.134.136.65; helo=mga03.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxSZz0b4jz2y1b
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 17:19:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688627979; x=1720163979;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=2g1bfmb7JvyQO85ZXkV2EeVN1io1hktM1VBz/kom3ng=;
  b=AFQRH+n2ZKfrzhrDQAebVk8wVx3BgdnGrbIKY6Nv7wcoSCuAEjzD71Py
   83imbFO0EWJ1oTAn7UMS+xAUUsEhimKptW8SNYMyzhSEDh2xMgXcuOPjs
   +qc7xMyqrSi4xmTiixq5FR4kHYt0QhpfswNmW6AiwFC5z05puGoxFgh94
   lQ/hYcIMP0JuOC3hkFk+ALkRaEQd1J/9eUbtStmFIiFjIbjjnZ/YiJSgy
   ww1sxhh9ZAdh01nLkZIPzy44SUbKy8BFnfhuW6eFoqBsuVONh2v3NpUZa
   lEKnLEX0V689js8eK5AwUSKXa8+3LrYYs2cOJbErGe+ZprYtK47zZTNRG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="367015578"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="367015578"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 00:19:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="784818848"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="784818848"
Received: from hegang-mobl.ccr.corp.intel.com (HELO localhost) ([10.255.31.139])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 00:19:30 -0700
Date: Thu, 6 Jul 2023 15:19:28 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230706071927.o7gwmryonr3v3dpp@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
 <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
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

On Thu, Jul 06, 2023 at 01:52:08PM +0900, David Stevens wrote:
> On Wed, Jul 5, 2023 at 7:17 PM Yu Zhang <yu.c.zhang@linux.intel.com> wrote:
> >
> > On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > > From: David Stevens <stevensd@chromium.org>
> > >
> > > Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to map
> > > memory into the guest that is backed by un-refcounted struct pages - for
> > > example, higher order non-compound pages allocated by the amdgpu driver
> > > via ttm_pool_alloc_page.
> >
> > I guess you mean the tail pages of the higher order non-compound pages?
> > And as to the head page, it is said to be set to one coincidentally[*],
> > and shall not be considered as refcounted.  IIUC, refcount of this head
> > page will be increased and decreased soon in hva_to_pfn_remapped(), so
> > this may not be a problem(?). But treating this head page differently,
> > as a refcounted one(e.g., to set the A/D flags), is weired.
> >
> > Or maybe I missed some context, e.g., can the head page be allocted to
> > guest at all?
> 
> Yes, this is to allow mapping the tail pages of higher order
> non-compound pages - I should have been more precise in my wording.
> The head pages can already be mapped into the guest.
> 
> Treating the head and tail pages would require changing how KVM
> behaves in a situation it supports today (rather than just adding
> support for an unsupported situation). Currently, without this series,
> KVM can map VM_PFNMAP|VM_IO memory backed by refcounted pages into the
> guest. When that happens, KVM sets the A/D flags. I'm not sure whether
> that's actually valid behavior, nor do I know whether anyone actually
> cares about it. But it's what KVM does today, and I would shy away
> from modifying that behavior without good reason.

I know the A/D status of the refcounted, VM_PFNMAP|VM_IO backed pages
will be recorded. And I have no idea if this is a necessary requirement
either.

But it feels awkward to see the head and the tail ones of non-compound
pages be treated inconsistently. After all, the head page just happens
to have its refcount being 1, it is not a real refcounted page.

So I would suggest to mention such different behehavior in the commit
message at least. :)

> > >
> > > @@ -883,7 +884,7 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> > >   */
> > >  static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int i)
> > >  {
> > > -     bool host_writable;
> > > +     bool host_writable, is_refcounted;
> > >       gpa_t first_pte_gpa;
> > >       u64 *sptep, spte;
> > >       struct kvm_memory_slot *slot;
> > > @@ -940,10 +941,12 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page *sp, int
> > >       sptep = &sp->spt[i];
> > >       spte = *sptep;
> > >       host_writable = spte & shadow_host_writable_mask;
> > > +     // TODO: is this correct?
> > > +     is_refcounted = spte & SPTE_MMU_PAGE_REFCOUNTED;
> > >       slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn);
> > >       make_spte(vcpu, sp, slot, pte_access, gfn,
> > >                 spte_to_pfn(spte), spte, true, false,
> > > -               host_writable, &spte);
> > > +               host_writable, is_refcounted, &spte);
> >
> > Could we restrict that a non-refcounted page shall not be used as shadow page?
> 
> I'm not very familiar with the shadow mmu, so my response might not
> make sense. But do you mean not allowing non-refcoutned pages as the
> guest page tables shadowed by a kvm_mmu_page? It would probably be
> possible to do that, and I doubt anyone would care about the
> restriction. But as far as I can tell, the guest page table is only
> accessed via kvm_vcpu_read_guest_atomic, which handles non-refcounted
> pages just fine.

Sorry, my brain just got baked... Pls just ignore this question :)

B.R.
Yu
