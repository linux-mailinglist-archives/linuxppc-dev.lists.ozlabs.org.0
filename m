Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF8C749FED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 16:53:51 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fz5KTzif;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxfg128Hrz3c2C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 00:53:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fz5KTzif;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.88; helo=mga01.intel.com; envelope-from=yu.c.zhang@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxff45rLjz30hM
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 00:52:58 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688655181; x=1720191181;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=7TWDTrZhqpzH7WQViyzB8gJRad/lUc15Zt3pA8KbCZI=;
  b=fz5KTzifnXLrcUUo7MxVYDK+dUwtceTO86PQaICrrfAtIjS7OGovsF5G
   AIjDFToxr/lqWuQmsxAvADBJJxrPtlfSP0Om5tAIGSIh6cK8H/tg8ffWz
   SfJoURpgVBu5eZ7vF7af0z6S+d8AqnhhFxzXWR1RB/iQip1dQO7FByoN5
   eZfVW/Hm4zjtCgirg+qopMBlf7j1CODuTTrrpdSFgDCFifH6dWWTvkcwK
   qUp33rljyPduwaHMNQo/qqiY1bgqz+hHVyRC2mHhH6GQ0lron4qo8Tw2C
   63dOc2zMDDDy6Ro7+ffXA+bi05ZsDjwAliFGL8eM3S3jsE63sS4Aac2xV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="394380263"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="394380263"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 07:52:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10763"; a="669777985"
X-IronPort-AV: E=Sophos;i="6.01,185,1684825200"; 
   d="scan'208";a="669777985"
Received: from hegang-mobl.ccr.corp.intel.com (HELO localhost) ([10.255.31.139])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2023 07:52:50 -0700
Date: Thu, 6 Jul 2023 22:52:47 +0800
From: Yu Zhang <yu.c.zhang@linux.intel.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
Message-ID: <20230706145247.ddjqsvmfdeimzva6@linux.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-3-stevensd@google.com>
 <20230705031002.xrxk42hli6oavtlt@linux.intel.com>
 <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
 <20230705105343.iounmlflfued7lco@linux.intel.com>
 <CAD=HUj5ezWt7rLAv2qOpFsMHyFU87Hqtw_p8pWNF5+oxbLhxDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=HUj5ezWt7rLAv2qOpFsMHyFU87Hqtw_p8pWNF5+oxbLhxDg@mail.gmail.com>
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

On Thu, Jul 06, 2023 at 02:29:24PM +0900, David Stevens wrote:
> On Wed, Jul 5, 2023 at 7:53 PM Yu Zhang <yu.c.zhang@linux.intel.com> wrote:
> >
> > On Wed, Jul 05, 2023 at 06:22:59PM +0900, David Stevens wrote:
> > > On Wed, Jul 5, 2023 at 12:10 PM Yu Zhang <yu.c.zhang@linux.intel.com> wrote:
> > > >
> > > > > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr, bool write_fault,
> > > > >   * The slow path to get the pfn of the specified host virtual address,
> > > > >   * 1 indicates success, -errno is returned if error is detected.
> > > > >   */
> > > > > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write_fault,
> > > > > -                        bool interruptible, bool *writable, kvm_pfn_t *pfn)
> > > > > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn)
> > > > >  {
> > > > > -     unsigned int flags = FOLL_HWPOISON;
> > > > > +     unsigned int flags = FOLL_HWPOISON | FOLL_GET | foll->flags;
> > > > >       struct page *page;
> > > > >       int npages;
> > > > >
> > > > >       might_sleep();
> > > > >
> > > > > -     if (writable)
> > > > > -             *writable = write_fault;
> > > > > -
> > > > > -     if (write_fault)
> > > > > -             flags |= FOLL_WRITE;
> > > > > -     if (async)
> > > > > -             flags |= FOLL_NOWAIT;
> > > > > -     if (interruptible)
> > > > > -             flags |= FOLL_INTERRUPTIBLE;
> > > > > -
> > > > > -     npages = get_user_pages_unlocked(addr, 1, &page, flags);
> > > > > +     npages = get_user_pages_unlocked(foll->hva, 1, &page, flags);
> > > > >       if (npages != 1)
> > > > >               return npages;
> > > > >
> > > > > +     foll->writable = (foll->flags & FOLL_WRITE) && foll->allow_write_mapping;
> > > > > +
> > > > >       /* map read fault as writable if possible */
> > > > > -     if (unlikely(!write_fault) && writable) {
> > > > > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> > > >
> > > > I guess !foll->writable should be !(foll->flags & FOLL_WRITE) here.
> > >
> > > The two statements are logically equivalent, although I guess using
> > > !(foll->flags & FOLL_WRITE) may be a little clearer, if a little more
> > > verbose.
> >
> > Well, as the comment says, we wanna try to map the read fault as writable
> > whenever possible. And __gfn_to_pfn_memslot() will only set the FOLL_WRITE
> > for write faults. So I guess using !foll->writable will not allow this.
> > Did I miss anything?
> 
> We just set the foll->writable out parameter to be equal to
> ((foll->flags & FOLL_WRITE) && foll->allow_write_mapping). Taking a =
> foll->flags & FOLL_WRITE and b = foll->allow_write_mapping, we have
> !(a && b) && b -> (!a || !b) && b -> (!a && b) || (!b && b) -> !a &&
> b.

Ouch, my bad again... I typed "!foll->writable", but missed the "!" in
my head while calculating... Thanks! :)

B.R.
Yu
