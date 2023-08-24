Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 034FD786957
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:05:19 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lhgftW+k;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbH05chKz3dF3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:05:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=lhgftW+k;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbFb2tdBz3c89
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:04:03 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2bce552508fso8316161fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:04:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864240; x=1693469040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Td1ijM0dx2iNRqr2N3eBQRfbFRu8kCUmxHSvTRGEgsw=;
        b=lhgftW+kUpJYgyukPTeMGEg46DSs1BtK5z/SjUu/e9VMVm5eN2eC2u/+blwQ54vuJI
         QzMbNLtSEMMFERz0K+7AT6ffq4Qi3z/IjFDT6xFIyWWXpCQzGPh8rnE/SorU6ZtJitOd
         jas03pjzHirqsUsRf4RDToow05j9J/8XlXbKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864240; x=1693469040;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Td1ijM0dx2iNRqr2N3eBQRfbFRu8kCUmxHSvTRGEgsw=;
        b=lwzZIk+GNVFw/FmNjusLkqLpVSTsXJ5DWKGQ/D5KSbnLUsTFcUQh1glISXxDnUN4w5
         AzUPCr4nB4WBEm+dQurendwP/+P+Dm78Cz6nNQ70OarL10nmMc4LV7Vc870HT3L8LWPf
         c57WWZy0w1ByhIKzjuFWzgEv9EQNT9OOUyOwpcCUlOdV4UGPTME02KjvoyU7uip5N9eh
         R1r7erD8zwWGJQT4U7oTAJIQi1WXR3mjBWxOd2UPIVqotu749A+F4QjMXkp69UaXYzho
         whA5Gq595V36Hhwi+wpwJhDQKIObpH/LNRX6MZqC3l8oyzkm6VY4vIkR1lcv1SCnxQmp
         xjMA==
X-Gm-Message-State: AOJu0YzvJoJ+F8Qy3psHcHyuCqGpzu/5loNsTh/bvDn363tRgEPMM31x
	mOL7toCuB2dBTAovRgjL8fqFFVW9imcPUwrtq15OyQ==
X-Google-Smtp-Source: AGHT+IHrh+7nk/e5kV9L3xlBi65IU/eMAhbsiTEPcc+GmOb5gP2KdijZWmZMUBZJY5xZHioTccxZZzWEqXrR9lrjuwM=
X-Received: by 2002:a2e:9ed1:0:b0:2b9:4b2e:5420 with SMTP id
 h17-20020a2e9ed1000000b002b94b2e5420mr10117680ljk.52.1692864239959; Thu, 24
 Aug 2023 01:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705102547.hr2zxkdkecdxp5tf@linux.intel.com>
In-Reply-To: <20230705102547.hr2zxkdkecdxp5tf@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 24 Aug 2023 17:03:48 +0900
Message-ID: <CAD=HUj7F6CUNt_9txEu0upB=PBwJzkL5dBhNs_BVHX1cicqBgw@mail.gmail.com>
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

On Wed, Jul 5, 2023 at 7:25=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.com=
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
> >
> > The bulk of this change is tracking the is_refcounted_page flag so that
> > non-refcounted pages don't trigger page_count() =3D=3D 0 warnings. This=
 is
> > done by storing the flag in an unused bit in the sptes.
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
> > @@ -553,12 +553,14 @@ static bool mmu_spte_update(u64 *sptep, u64 new_s=
pte)
> >
> >       if (is_accessed_spte(old_spte) && !is_accessed_spte(new_spte)) {
> >               flush =3D true;
> > -             kvm_set_pfn_accessed(spte_to_pfn(old_spte));
> > +             if (is_refcounted_page_pte(old_spte))
> > +                     kvm_set_page_accessed(pfn_to_page(spte_to_pfn(old=
_spte)));
> >       }
> >
> >       if (is_dirty_spte(old_spte) && !is_dirty_spte(new_spte)) {
> >               flush =3D true;
> > -             kvm_set_pfn_dirty(spte_to_pfn(old_spte));
> > +             if (is_refcounted_page_pte(old_spte))
> > +                     kvm_set_page_dirty(pfn_to_page(spte_to_pfn(old_sp=
te)));
> >       }
> >
> >       return flush;
> > @@ -596,14 +598,18 @@ static u64 mmu_spte_clear_track_bits(struct kvm *=
kvm, u64 *sptep)
> >        * before they are reclaimed.  Sanity check that, if the pfn is b=
acked
> >        * by a refcounted page, the refcount is elevated.
> >        */
> > -     page =3D kvm_pfn_to_refcounted_page(pfn);
> > -     WARN_ON(page && !page_count(page));
> > +     if (is_refcounted_page_pte(old_spte)) {
> > +             page =3D kvm_pfn_to_refcounted_page(pfn);
> > +             WARN_ON(!page || !page_count(page));
> > +     }
> >
> > -     if (is_accessed_spte(old_spte))
> > -             kvm_set_pfn_accessed(pfn);
> > +     if (is_refcounted_page_pte(old_spte)) {
> > +             if (is_accessed_spte(old_spte))
> > +                     kvm_set_page_accessed(pfn_to_page(pfn));
> >
> > -     if (is_dirty_spte(old_spte))
> > -             kvm_set_pfn_dirty(pfn);
> > +             if (is_dirty_spte(old_spte))
> > +                     kvm_set_page_dirty(pfn_to_page(pfn));
> > +     }
> >
> >       return old_spte;
> >  }
> > @@ -639,8 +645,8 @@ static bool mmu_spte_age(u64 *sptep)
> >                * Capture the dirty status of the page, so that it doesn=
't get
> >                * lost when the SPTE is marked for access tracking.
> >                */
> > -             if (is_writable_pte(spte))
> > -                     kvm_set_pfn_dirty(spte_to_pfn(spte));
> > +             if (is_writable_pte(spte) && is_refcounted_page_pte(spte)=
)
> > +                     kvm_set_page_dirty(pfn_to_page(spte_to_pfn(spte))=
);
> >
> >               spte =3D mark_spte_for_access_track(spte);
> >               mmu_spte_update_no_track(sptep, spte);
> > @@ -1278,8 +1284,8 @@ static bool spte_wrprot_for_clear_dirty(u64 *spte=
p)
> >  {
> >       bool was_writable =3D test_and_clear_bit(PT_WRITABLE_SHIFT,
> >                                              (unsigned long *)sptep);
> > -     if (was_writable && !spte_ad_enabled(*sptep))
> > -             kvm_set_pfn_dirty(spte_to_pfn(*sptep));
> > +     if (was_writable && !spte_ad_enabled(*sptep) && is_refcounted_pag=
e_pte(*sptep))
> > +             kvm_set_page_dirty(pfn_to_page(spte_to_pfn(*sptep)));
> >
> >       return was_writable;
> >  }
> > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, st=
ruct kvm_memory_slot *slot,
> >       bool host_writable =3D !fault || fault->map_writable;
> >       bool prefetch =3D !fault || fault->prefetch;
> >       bool write_fault =3D fault && fault->write;
> > +     bool is_refcounted =3D !fault || fault->is_refcounted_page;
> >
> >       pgprintk("%s: spte %llx write_fault %d gfn %llx\n", __func__,
> >                *sptep, write_fault, gfn);
> > @@ -2969,7 +2976,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu, st=
ruct kvm_memory_slot *slot,
> >       }
> >
> >       wrprot =3D make_spte(vcpu, sp, slot, pte_access, gfn, pfn, *sptep=
, prefetch,
> > -                        true, host_writable, &spte);
> > +                        true, host_writable, is_refcounted, &spte);
> >
> >       if (*sptep =3D=3D spte) {
> >               ret =3D RET_PF_SPURIOUS;
> > @@ -4299,8 +4306,9 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcp=
u, struct kvm_page_fault *fault
> >       struct kvm_follow_pfn foll =3D {
> >               .slot =3D slot,
> >               .gfn =3D fault->gfn,
> > -             .flags =3D FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> > +             .flags =3D fault->write ? FOLL_WRITE : 0,
> >               .allow_write_mapping =3D true,
> > +             .guarded_by_mmu_notifier =3D true,
> >       };
> >
> >       /*
> > @@ -4317,6 +4325,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcp=
u, struct kvm_page_fault *fault
> >                       fault->slot =3D NULL;
> >                       fault->pfn =3D KVM_PFN_NOSLOT;
> >                       fault->map_writable =3D false;
> > +                     fault->is_refcounted_page =3D false;
> >                       return RET_PF_CONTINUE;
> >               }
> >               /*
> > @@ -4366,6 +4375,7 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *vcp=
u, struct kvm_page_fault *fault
> >  success:
> >       fault->hva =3D foll.hva;
> >       fault->map_writable =3D foll.writable;
> > +     fault->is_refcounted_page =3D foll.is_refcounted_page;
> >       return RET_PF_CONTINUE;
> >  }
> >
> > @@ -4451,7 +4461,8 @@ static int direct_page_fault(struct kvm_vcpu *vcp=
u, struct kvm_page_fault *fault
> >
> >  out_unlock:
> >       write_unlock(&vcpu->kvm->mmu_lock);
> > -     kvm_release_pfn_clean(fault->pfn);
> > +     if (fault->is_refcounted_page)
> > +             kvm_set_page_accessed(pfn_to_page(fault->pfn));
> >       return r;
> >  }
> >
> > @@ -4529,7 +4540,8 @@ static int kvm_tdp_mmu_page_fault(struct kvm_vcpu=
 *vcpu,
> >
> >  out_unlock:
> >       read_unlock(&vcpu->kvm->mmu_lock);
> > -     kvm_release_pfn_clean(fault->pfn);
>
> Yet kvm_release_pfn() can still be triggered for the kvm_vcpu_maped gfns.
> What if guest uses a non-referenced page(e.g., as a vmcs12)? Although I
> believe this is not gonna happen in real world...

kvm_vcpu_map still uses gfn_to_pfn, which eventually passes FOLL_GET
to __kvm_follow_pfn. So if a guest tries to use a non-refcounted page
like that, then kvm_vcpu_map will fail and the guest will probably
crash. It won't trigger any bugs in the host, though.

It is unfortunate that the guest will be able to use certain types of
memory for some purposes but not for others. However, while it is
theoretically fixable, it's an unreasonable amount of work for
something that, as you say, nobody really cares about in practice [1].

[1] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

-David
