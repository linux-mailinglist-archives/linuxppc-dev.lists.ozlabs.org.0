Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DA14F7494C8
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 06:53:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UqUAH1NZ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxPL15bvlz3br6
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 14:53:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UqUAH1NZ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::231; helo=mail-lj1-x231.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxPK62cqFz30hb
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 14:52:23 +1000 (AEST)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b6afc1ceffso3166041fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 21:52:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688619140; x=1691211140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QwRjjzsaRyNYdKi/jrCTglo/MDQC7ke81mJ6ahjJPYc=;
        b=UqUAH1NZ/gQh4yQRPq/oi7meCjDjvhAuIb9s8k6WygD9wkGEDov7tiGjEArq7MC+vv
         8wgiZUBCtnhAy8z+2oyaKRXJGjVma9nOV9IobiKBf6zUWloDzXQmFWkZc056B/l33r4A
         U9P2agugWFQJe4X2TqOoJOqr3SyDUx5EQkTiE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688619140; x=1691211140;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QwRjjzsaRyNYdKi/jrCTglo/MDQC7ke81mJ6ahjJPYc=;
        b=QIwtyVvfurH2qC5d1EryQEHxyLrXC3Ej/X6MdhqjwPhhbHo1gT1BCO9XGwGAnC3hA2
         +/T50a2ff5W4QUDAJULqgsRDMSDmwp6ElKS9NFuq8oUD4Hr56N3hevfUS/jYnGXCafh8
         jQADKzwlnkcKhfVuLevipbimoUm1pNHCRU2mePW+DBBTWwiDhS56ojmoxaSRLrchdfNp
         /KNVyPML4EVLaYkW1/BoxbI7aU22d3uVySIooiCaio03C/uEbSPEU+os8W0k8rEfQW7M
         eCkItPw9TaJc75XoR05w7155ah22mK/WBKXUIJEvaIe5tYv9NvxdXORqP25wUAtMCA6K
         1Weg==
X-Gm-Message-State: ABy/qLa6gVWvhVYzWm8//J6Z5LwZ9QFXKRdrj3qIO0aWlfbRSA7kqc/B
	/dmXiOp5SFhs4ZwJ5s0JOneHcRfREFYF6F6Kp07E/w==
X-Google-Smtp-Source: APBJJlHQrJdoiiNz49lPTVOLd0RgP3a+MjJFWouX2dt0nDJM8HM8LVPtUWKWnEK+E8nSDpBgWxdf7yqgzIbxjxpaD0c=
X-Received: by 2002:a2e:b0e8:0:b0:2b6:fd90:3f28 with SMTP id
 h8-20020a2eb0e8000000b002b6fd903f28mr487010ljl.21.1688619139622; Wed, 05 Jul
 2023 21:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
In-Reply-To: <20230705101800.ut4c6topn6ylwczs@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 13:52:08 +0900
Message-ID: <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
To: Yu Zhang <yu.c.zhang@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Wed, Jul 5, 2023 at 7:17=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.com=
> wrote:
>
> On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > From: David Stevens <stevensd@chromium.org>
> >
> > Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to map
> > memory into the guest that is backed by un-refcounted struct pages - fo=
r
> > example, higher order non-compound pages allocated by the amdgpu driver
> > via ttm_pool_alloc_page.
>
> I guess you mean the tail pages of the higher order non-compound pages?
> And as to the head page, it is said to be set to one coincidentally[*],
> and shall not be considered as refcounted.  IIUC, refcount of this head
> page will be increased and decreased soon in hva_to_pfn_remapped(), so
> this may not be a problem(?). But treating this head page differently,
> as a refcounted one(e.g., to set the A/D flags), is weired.
>
> Or maybe I missed some context, e.g., can the head page be allocted to
> guest at all?

Yes, this is to allow mapping the tail pages of higher order
non-compound pages - I should have been more precise in my wording.
The head pages can already be mapped into the guest.

Treating the head and tail pages would require changing how KVM
behaves in a situation it supports today (rather than just adding
support for an unsupported situation). Currently, without this series,
KVM can map VM_PFNMAP|VM_IO memory backed by refcounted pages into the
guest. When that happens, KVM sets the A/D flags. I'm not sure whether
that's actually valid behavior, nor do I know whether anyone actually
cares about it. But it's what KVM does today, and I would shy away
from modifying that behavior without good reason.

> >
> > The bulk of this change is tracking the is_refcounted_page flag so that
> > non-refcounted pages don't trigger page_count() =3D=3D 0 warnings. This=
 is
> > done by storing the flag in an unused bit in the sptes.
>
> Also, maybe we should mention this only works on x86-64.
>
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  arch/x86/kvm/mmu/mmu.c          | 44 +++++++++++++++++++++------------
> >  arch/x86/kvm/mmu/mmu_internal.h |  1 +
> >  arch/x86/kvm/mmu/paging_tmpl.h  |  9 ++++---
> >  arch/x86/kvm/mmu/spte.c         |  4 ++-
> >  arch/x86/kvm/mmu/spte.h         | 12 ++++++++-
> >  arch/x86/kvm/mmu/tdp_mmu.c      | 22 ++++++++++-------
> >  6 files changed, 62 insertions(+), 30 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index e44ab512c3a1..b1607e314497 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
>
> ...
>
> > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, st=
ruct kvm_memory_slot *slot,
> >       bool host_writable =3D !fault || fault->map_writable;
> >       bool prefetch =3D !fault || fault->prefetch;
> >       bool write_fault =3D fault && fault->write;
> > +     bool is_refcounted =3D !fault || fault->is_refcounted_page;
>
> Just wonder, what if a non-refcounted page is prefetched?  Or is it possi=
ble in
> practice?

Prefetching is still done via gfn_to_page_many_atomic, which sets
FOLL_GET. That's fixable, but it's not something this series currently
does.

> ...
> >
> > @@ -883,7 +884,7 @@ static gpa_t FNAME(gva_to_gpa)(struct kvm_vcpu *vcp=
u, struct kvm_mmu *mmu,
> >   */
> >  static int FNAME(sync_spte)(struct kvm_vcpu *vcpu, struct kvm_mmu_page=
 *sp, int i)
> >  {
> > -     bool host_writable;
> > +     bool host_writable, is_refcounted;
> >       gpa_t first_pte_gpa;
> >       u64 *sptep, spte;
> >       struct kvm_memory_slot *slot;
> > @@ -940,10 +941,12 @@ static int FNAME(sync_spte)(struct kvm_vcpu *vcpu=
, struct kvm_mmu_page *sp, int
> >       sptep =3D &sp->spt[i];
> >       spte =3D *sptep;
> >       host_writable =3D spte & shadow_host_writable_mask;
> > +     // TODO: is this correct?
> > +     is_refcounted =3D spte & SPTE_MMU_PAGE_REFCOUNTED;
> >       slot =3D kvm_vcpu_gfn_to_memslot(vcpu, gfn);
> >       make_spte(vcpu, sp, slot, pte_access, gfn,
> >                 spte_to_pfn(spte), spte, true, false,
> > -               host_writable, &spte);
> > +               host_writable, is_refcounted, &spte);
>
> Could we restrict that a non-refcounted page shall not be used as shadow =
page?

I'm not very familiar with the shadow mmu, so my response might not
make sense. But do you mean not allowing non-refcoutned pages as the
guest page tables shadowed by a kvm_mmu_page? It would probably be
possible to do that, and I doubt anyone would care about the
restriction. But as far as I can tell, the guest page table is only
accessed via kvm_vcpu_read_guest_atomic, which handles non-refcounted
pages just fine.

-David
