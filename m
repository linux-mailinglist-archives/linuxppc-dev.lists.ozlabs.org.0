Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F0AB74A1AB
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 17:59:02 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eom9rNUv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Qxh6D15NWz3c1g
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 01:59:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=eom9rNUv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com; envelope-from=isaku.yamahata@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com [IPv6:2607:f8b0:4864:20::332])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Qxh5L4B1bz30P0
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 01:58:13 +1000 (AEST)
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6b5d7e60015so828607a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 08:58:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688659088; x=1691251088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ELX9uuKAjfgek1/p+NwumoGO6BxLWYptg064O9OiHBc=;
        b=eom9rNUvY8PSvEiS2yEy5jzWdJZzDvOogRDYqmeCMmwnH49PDRAlb6A64DC/BsFdvw
         8sB/gBTWnJUy3Vf5sxBQdnzN798+8M5al/Six8srqG7vFuN2j7eIGkCoIn1jGVbxOdlQ
         k0TJlPB+p1leNL2pQtt57MxN0BJjUABkoTMJ7K06jyI0oSeTnDNIW3BFtD36isceJnhC
         Ov1RKDxVv9ttVhyc/ajzhjVYQ408TrEBueG0oqMFX09h5Wm5fiw3CBKSJWuZpbbW9mDl
         fzgNaq6H/z5+MW47FmpSbb1giv9UrEZWmHwC2aEaPtVkw0QUhiZaco32bqgO4JpuPB+3
         c8qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688659088; x=1691251088;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ELX9uuKAjfgek1/p+NwumoGO6BxLWYptg064O9OiHBc=;
        b=YG9Y9Zed+mnMdKyZo9Xv8rdDC4X8YIMSdouYisxFQu1pj6VN9x1PsCNfZG28UIfcWb
         fMwjvp8Px5liarNP+iqGpNjRGNQ7TWkKYb609vEu+xJhunanWEwHcVqFPz6bDEoIZggL
         1iZyesm1KotDII722p3BBGVE9/8RCXX8R1uKm/7w0HiDPbL6Z4m5UrFRqbn3E27Cqx+b
         yMushLKaxdoZHPndHx42+IdabeMi70yMZZKsbRrfydTVvILESFsXfSb/o1Zb3w29UWGv
         cSHs7h6v9IXkvDN0Nfd/fnl2iNBy1641P+L1NIJL6M+cYtrq+Of/Sd5knigoz07cRvXC
         FH3A==
X-Gm-Message-State: ABy/qLaFYRmTZy8BWxwjSBpisgHM1cOjJChlK9OZiiADhsQfqzI6IqMC
	RQlp9pY4w6FPi53RMe3zO+Q=
X-Google-Smtp-Source: APBJJlFDnf5rOYi7hzzNB1UrOiVyacVt/Eu6Y2AcAbTzk9CE0nP6/LyCfIuOIjrJ9jJQIFHGu3ZFYg==
X-Received: by 2002:a05:6830:1e42:b0:6b7:4e97:343 with SMTP id e2-20020a0568301e4200b006b74e970343mr2928881otj.27.1688659088029;
        Thu, 06 Jul 2023 08:58:08 -0700 (PDT)
Received: from localhost ([192.55.54.50])
        by smtp.gmail.com with ESMTPSA id q17-20020a656a91000000b005533c53f550sm1366282pgu.45.2023.07.06.08.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jul 2023 08:58:07 -0700 (PDT)
Date: Thu, 6 Jul 2023 08:58:05 -0700
From: Isaku Yamahata <isaku.yamahata@gmail.com>
To: David Stevens <stevensd@chromium.org>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to
 __kvm_follow_pfn
Message-ID: <20230706155805.GD3894444@ls.amr.corp.intel.com>
References: <20230704075054.3344915-1-stevensd@google.com>
 <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
 <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, isaku.yamahata@gmail.com, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 06, 2023 at 01:52:08PM +0900,
David Stevens <stevensd@chromium.org> wrote:

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
> 
> > >
> > > The bulk of this change is tracking the is_refcounted_page flag so that
> > > non-refcounted pages don't trigger page_count() == 0 warnings. This is
> > > done by storing the flag in an unused bit in the sptes.
> >
> > Also, maybe we should mention this only works on x86-64.
> >
> > >
> > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > ---
> > >  arch/x86/kvm/mmu/mmu.c          | 44 +++++++++++++++++++++------------
> > >  arch/x86/kvm/mmu/mmu_internal.h |  1 +
> > >  arch/x86/kvm/mmu/paging_tmpl.h  |  9 ++++---
> > >  arch/x86/kvm/mmu/spte.c         |  4 ++-
> > >  arch/x86/kvm/mmu/spte.h         | 12 ++++++++-
> > >  arch/x86/kvm/mmu/tdp_mmu.c      | 22 ++++++++++-------
> > >  6 files changed, 62 insertions(+), 30 deletions(-)
> > >
> > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > index e44ab512c3a1..b1607e314497 100644
> > > --- a/arch/x86/kvm/mmu/mmu.c
> > > +++ b/arch/x86/kvm/mmu/mmu.c
> >
> > ...
> >
> > > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, struct kvm_memory_slot *slot,
> > >       bool host_writable = !fault || fault->map_writable;
> > >       bool prefetch = !fault || fault->prefetch;
> > >       bool write_fault = fault && fault->write;
> > > +     bool is_refcounted = !fault || fault->is_refcounted_page;
> >
> > Just wonder, what if a non-refcounted page is prefetched?  Or is it possible in
> > practice?
> 
> Prefetching is still done via gfn_to_page_many_atomic, which sets
> FOLL_GET. That's fixable, but it's not something this series currently
> does.

So if we prefetch a page, REFCOUNTED bit is cleared unconditionally with this
hunk.  kvm_set_page_{dirty, accessed} won't be called as expected for prefetched
spte.  If I read the patch correctly, REFCOUNTED bit in SPTE should represent
whether the corresponding page is ref-countable or not, right?

Because direct_pte_prefetch_many() is for legacy KVM MMU and FNAME(prefetch_pte)
is shadow paging, we need to test it with legacy KVM MMU or shadow paging to hit
the issue, though.

Thanks,
-- 
Isaku Yamahata <isaku.yamahata@gmail.com>
