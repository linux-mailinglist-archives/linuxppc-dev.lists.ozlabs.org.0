Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B100C748293
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 12:54:32 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khcTuNNK;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwxPL4fYWz3bch
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 20:54:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=khcTuNNK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwxNP6kzjz3031
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 20:53:40 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688554422; x=1720090422;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=IBLKigB688l4z6znm/BvrWmSXP37deMHsQcHbbqjCj4=;
  b=khcTuNNKVThjmc9/ty8p2K//Z8NNDLTTEb1ZAniOk06lHfKTYoawpMIe
   dguCbWN4t2wHdwi30EfwD9JpTZHhDE/NpTzqbHDWxuuXlnPATMJSwQlgT
   qZKcMGTOtkAk1kkszS0lQX5QutpgaG0xBCqIGqVFhbhmEzpHHKZ55JJ+S
   tAvhdfGMwfxzKVs4tArcF1jd0cKW0k+FUQxnV1YUx9TRYCpIhu4LodpS2
   a8QQoq2282+0XISzWWXgdFArjFdgEq9Y9cUCFUnfotnIWAK2QiCk50l7z
   jAFYp6o/rQttqwUIRJzaN4xoNac2fzusL8iiMBgsZT3cKbrX0dzBi91dn
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="394063294"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="394063294"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:53:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="809217086"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="809217086"
Received: from jialinji-mobl4.ccr.corp.intel.com (HELO localhost) ([10.255.30.200])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:53:33 -0700
Date: Wed, 5 Jul 2023 18:53:43 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
Message-ID: <20230705105343.iounmlflfued7lco@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-3-stevensd@google.com>
 <20230705031002.xrxk42hli6oavtlt@linux.intel.com>
 <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
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

On Wed, Jul 05, 2023 at 06:22:59PM +0900, David Stevens wrote:
> On Wed, Jul 5, 2023 at 12:10 PM Yu Zhang <yu.c.zhang@linux.intel.com> wrote:
> >
> > > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> > >   * The slow path to get the pfn of the specified host virtual address,
> > >   * 1 indicates success, -errno is returned if error is detected.
> > >   */
> > > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
> > > -                        bool interruptible, bool *writable, kvm_pfn_t *pfn)
> > > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
> > >  {
> > > -     unsigned int flags = FOLL_HWPOISON;
> > > +     unsigned int flags = FOLL_HWPOISON | FOLL_GET | foll->flags;
> > >       struct page *page;
> > >       int npages;
> > >
> > >       might_sleep();
> > >
> > > -     if (writable)
> > > -             *writable = write_fault;
> > > -
> > > -     if (write_fault)
> > > -             flags |= FOLL_WRITE;
> > > -     if (async)
> > > -             flags |= FOLL_NOWAIT;
> > > -     if (interruptible)
> > > -             flags |= FOLL_INTERRUPTIBLE;
> > > -
> > > -     npages = get_user_pages_unlocked(addr, 1, &page, flags);
> > > +     npages = get_user_pages_unlocked(foll->hva, 1, &page, flags);
> > >       if (npages != 1)
> > >               return npages;
> > >
> > > +     foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
> > > +
> > >       /* map read fault as writable if possible */
> > > -     if (unlikely(!write_fault) && writable) {
> > > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> >
> > I guess !foll->writable should be !(foll->flags & FOLL_WRITE) here.
> 
> The two statements are logically equivalent, although I guess using
> !(foll->flags & FOLL_WRITE) may be a little clearer, if a little more
> verbose.

Well, as the comment says, we wanna try to map the read fault as writable
whenever possible. And __gfn_to_pfn_memslot() will only set the FOLL_WRITE
for write faults. So I guess using !foll->writable will not allow this.
Did I miss anything?

> > > +kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn_t gfn,
> > > +                            bool atomic, bool interruptible, bool *async,
> > > +                            bool write_fault, bool *writable, hva_t *hva)
> > > +{
> > > +     kvm_pfn_t pfn;
> > > +     struct kvm_follow_pfn foll = {
> > > +             .slot = slot,
> > > +             .gfn = gfn,
> > > +             .flags = 0,
> > > +             .atomic = atomic,
> > > +             .allow_write_mapping = !!writable,
> > > +     };
> > > +
> > > +     if (write_fault)
> > > +             foll.flags |= FOLL_WRITE;
> > > +     if (async)
> > > +             foll.flags |= FOLL_NOWAIT;
> > > +     if (interruptible)
> > > +             foll.flags |= FOLL_INTERRUPTIBLE;
> > > +
> > > +     pfn = __kvm_follow_pfn(&foll);
> > > +     if (pfn == KVM_PFN_ERR_NEEDS_IO) {
> >
> > Could we just use KVM_PFN_ERR_FAULT and foll.flags here? I.e.,
> >         if (pfn == KVM_PFN_ERR_FAULT && (foll.flags & FOLL_NOWAIT))?
> > Setting pfn to KVM_PFN_ERR_NEEDS_IO just to indicate an async fault
> > seems unnecessary.
> 
> There are the cases where the fault does not fall within a vma or when
> the target vma's flags don't support the fault's access permissions.
> In those cases, continuing to try to resolve the fault won't cause
> problems per-se, but it's wasteful and a bit confusing. Having
> hva_to_pfn detect whether or not it may be possible to resolve the
> fault asynchronously and return KVM_PFN_ERR_NEEDS_IO if so seems like
> a good idea. It also matches what the existing code does.

Got it. Sounds reasonable. And thanks! :)

B.R.
Yu
