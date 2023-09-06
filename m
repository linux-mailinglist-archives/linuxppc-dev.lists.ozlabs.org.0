Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BEE79341C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 05:25:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YYYGmugU;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RgSRr0rKzz3c5T
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Sep 2023 13:25:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YYYGmugU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RgSQx1VYfz2yKy
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Sep 2023 13:24:22 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2b962c226ceso52764111fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 05 Sep 2023 20:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1693970653; x=1694575453; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wmE8wbgp7/QOlIvwHT/FgwjU8cYsXeBtzWV3ElQoLw=;
        b=YYYGmugUO9WJEQJ4h6bfdI8COs5xggGxekMGGu+QgOPcR18LgJg8XCAuA1HCDtAYVe
         EpuUaDc+icWQAN7AOLZ87dDDO7cZzatLK71cmz0FtBCB1j1t7s5FIp1ORpd5B1m6egeK
         75ZH31cQOf2ki5kjDzu/bLdNDqTWKF0iqY0A4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693970653; x=1694575453;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wmE8wbgp7/QOlIvwHT/FgwjU8cYsXeBtzWV3ElQoLw=;
        b=Bm8QoHWsefbBO6ZV+cht/2gbCtk90qR5r4bUKU3RbUrSQdNWJ5AGZiiH7Cpsfr1rKx
         3dIJw9N2GQhcHDffVoSgT3N6nKQySVWry+eXkk/LWUjzgSKsusEfRnxtMzRnqNmBAdoM
         f6i4YhAvGlmItUtKrcNEQXbbq87xY9CMa1sRfKjxeKyuDIz3XMLu9IA9jGlxgeogVewG
         dzWu/ct3z5ukL5g1hbpmBxNVSdeTdOJCw7vSj46DcIRy1H/ffIMtynnW/Umi4Y49gwsT
         dyMnDuAj5Ng8SatAo0ngexWcXCXiznv9Ymgqb01PKYrHJvMmgAj7oeV4vZxKD9oBUpJ0
         hnaQ==
X-Gm-Message-State: AOJu0YwrPjWnzppHAUu3eOTAVQ2mpCe5wixk97M+bincC4Hs4cZwVJwD
	06aj33tvijQKQc0jMnTVSWSTjc5PP22nsvoHRm/6RA==
X-Google-Smtp-Source: AGHT+IFIqz9sY6doupMHIx90lUVuiy33PnMwlqInijBiQEoNPRggDmrV8lalf3ySzga8iU+82w2g3AQNKlFjp+co1tk=
X-Received: by 2002:a2e:8781:0:b0:2bb:78ad:56cb with SMTP id
 n1-20020a2e8781000000b002bb78ad56cbmr1034016lji.37.1693970652777; Tue, 05 Sep
 2023 20:24:12 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-4-stevensd@google.com>
 <20230705161914.00004070.zhi.wang.linux@gmail.com> <CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
 <20230711203348.00000fb8.zhi.wang.linux@gmail.com> <ZK3Q34WNLjGVQQw+@google.com>
 <CAD=HUj6SoKHhA02oNpCt--ofE_n1wjdY1ddBURXDiS5Rwu=Q-g@mail.gmail.com> <ZPfLjnG8b9LJV4p7@google.com>
In-Reply-To: <ZPfLjnG8b9LJV4p7@google.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 6 Sep 2023 12:24:01 +0900
Message-ID: <CAD=HUj4W4PF3O9oLZx-3Rd_W51x1z30hQ36m_fcWUpw=mxUpSA@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
To: Sean Christopherson <seanjc@google.com>
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
Cc: Zhi Wang <zhi.wang.linux@gmail.com>, kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Sep 6, 2023 at 9:45=E2=80=AFAM Sean Christopherson <seanjc@google.c=
om> wrote:
>
> On Tue, Sep 05, 2023, David Stevens wrote:
> > On Wed, Jul 12, 2023 at 7:00=E2=80=AFAM Sean Christopherson <seanjc@goo=
gle.com> wrote:
> > >
> > > On Tue, Jul 11, 2023, Zhi Wang wrote:
> > > > On Thu, 6 Jul 2023 15:49:39 +0900
> > > > David Stevens <stevensd@chromium.org> wrote:
> > > >
> > > > > On Wed, Jul 5, 2023 at 10:19___PM Zhi Wang <zhi.wang.linux@gmail.=
com> wrote:
> > > > > >
> > > > > > On Tue,  4 Jul 2023 16:50:48 +0900
> > > > > > David Stevens <stevensd@chromium.org> wrote:
> > > > > > If yes, do we have to use FOLL_GET to resolve GFN associated wi=
th a tail page?
> > > > > > It seems gup can tolerate gup_flags without FOLL_GET, but it is=
 more like a
> > > > > > temporary solution. I don't think it is a good idea to play tri=
cks with
> > > > > > a temporary solution, more like we are abusing the toleration.
> > > > >
> > > > > I'm not sure I understand what you're getting at. This series nev=
er
> > > > > calls gup without FOLL_GET.
> > > > >
> > > > > This series aims to provide kvm_follow_pfn as a unified API on to=
p of
> > > > > gup+follow_pte. Since one of the major clients of this API uses a=
n mmu
> > > > > notifier, it makes sense to support returning a pfn without takin=
g a
> > > > > reference. And we indeed need to do that for certain types of mem=
ory.
> > > > >
> > > >
> > > > I am not having prob with taking a pfn without taking a ref. I am
> > > > questioning if using !FOLL_GET in struct kvm_follow_pfn to indicate=
 taking
> > > > a pfn without a ref is a good idea or not, while there is another f=
lag
> > > > actually showing it.
> > > >
> > > > I can understand that using FOLL_XXX in kvm_follow_pfn saves some
> > > > translation between struct kvm_follow_pfn.{write, async, xxxx} and =
GUP
> > > > flags. However FOLL_XXX is for GUP. Using FOLL_XXX for reflecting t=
he
> > > > requirements of GUP in the code path that going to call GUP is reas=
onable.
> > > >
> > > > But using FOLL_XXX with purposes that are not related to GUP call r=
eally
> > > > feels off.
> > >
> > > I agree, assuming you're talking specifically about the logic in hva_=
to_pfn_remapped()
> > > that handles non-refcounted pages, i.e. this
> > >
> > >         if (get_page_unless_zero(page)) {
> > >                 foll->is_refcounted_page =3D true;
> > >                 if (!(foll->flags & FOLL_GET))
> > >                         put_page(page);
> > >         } else if (foll->flags & FOLL_GET) {
> > >                 r =3D -EFAULT;
> > >         }
> > >
> > > should be
> > >
> > >         if (get_page_unless_zero(page)) {
> > >                 foll->is_refcounted_page =3D true;
> > >                 if (!(foll->flags & FOLL_GET))
> > >                         put_page(page);
> > >         else if (!foll->guarded_by_mmu_notifier)
> > >                 r =3D -EFAULT;
> > >
> > > because it's not the desire to grab a reference that makes getting no=
n-refcounted
> > > pfns "safe", it's whether or not the caller is plugged into the MMU n=
otifiers.
> > >
> > > Though that highlights that checking guarded_by_mmu_notifier should b=
e done for
> > > *all* non-refcounted pfns, not just non-refcounted struct page memory=
.
> >
> > I think things are getting confused here because there are multiple
> > things which "safe" refers to. There are three different definitions
> > that I think are relevant here:
> >
> > 1) "safe" in the sense that KVM doesn't corrupt page reference counts
> > 2) "safe" in the sense that KVM doesn't access pfns after they have bee=
n freed
> > 3) "safe" in the sense that KVM doesn't use stale hva -> pfn translatio=
ns
> >
> > For property 1, FOLL_GET is important. If the caller passes FOLL_GET,
> > then they expect to be able to pass the returned pfn to
> > kvm_release_pfn. This means that when FOLL_GET is set, if
> > kvm_pfn_to_refcounted_page returns a page, then hva_to_pfn_remapped
> > must take a reference count to avoid eventually corrupting the page
> > ref count. I guess replacing the FOLL_GET check with
> > !guarded_by_mmu_notifier is logically equivalent because
> > __kvm_follow_pfn requires that at least one of guarded_by_mmu_notifier
> > and FOLL_GET is set. But since we're concerned about a property of the
> > refcount, I think that checking FOLL_GET is clearer.
> >
> > For property 2, FOLL_GET is also important. If guarded_by_mmu_notifier
> > is set, then we're all good here. If guarded_by_mmu_notifier is not
> > set, then the check in __kvm_follow_pfn guarantees that FOLL_GET is
> > set. For struct page memory, we're safe because KVM will hold a
> > reference as long as it's still using the page. For non struct page
> > memory, we're not safe - this is where the breaking change of
> > allow_unsafe_mappings would go. Note that for non-refcounted struct
> > page, we can't use the allow_unsafe_mappings escape hatch. Since
> > FOLL_GET was requested, if we returned such a page, then the caller
> > would eventually corrupt the page refcount via kvm_release_pfn.
>
> Yes we can.  The caller simply needs to be made aware of is_refcounted_pa=
ge.   I
> didn't include that in the snippet below because I didn't want to write t=
he entire
> patch.  The whole point of adding is_refcounted_page is so that callers c=
an
> identify exactly what type of page was at the end of the trail that was f=
ollowed.

Are you asking me to completely migrate every caller of any gfn_to_pfn
variant to __kvm_follow_pfn, so that they can respect
is_refcounted_page? That's the only way to make it safe for
allow_unsafe_mappings to apply to non-refcounted pages. That is
decidedly not simple. Or is kvm_vcpu_map the specific call site you
care about? At best, I can try to migrate x86, and then just add some
sort of compatibility shim for other architectures that rejects
non-refcounted pages.

> > Property 3 would be nice, but we've already concluded that guarding
> > all translations with mmu notifiers is infeasible. So maintaining
> > property 2 is the best we can hope for.
>
> No, #3 is just a variant of #2.  Unless you're talking about not making g=
uarantees
> about guest accesses being ordered with respect to VMA/memslot updates, b=
ut I
> don't think that's the case.

I'm talking about the fact that kvm_vcpu_map is busted with respect to
updates to VMA updates. It won't corrupt host memory because the
mapping keeps a reference to the page, but it will continue to use
stale translations. From [1], it sounds like you've granted that
fixing that is not feasible, so I just wanted to make sure that this
isn't the "unsafe" referred to by allow_unsafe_mappings.

[1] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/

> > > As for the other usage of FOLL_GET in this series (using it to condit=
ionally do
> > > put_page()), IMO that's very much related to the GUP call.  Invoking =
put_page()
> > > is a hack to workaround the fact that GUP doesn't provide a way to ge=
t the pfn
> > > without grabbing a reference to the page.  In an ideal world, KVM wou=
ld NOT pass
> > > FOLL_GET to the various GUP helpers, i.e. FOLL_GET would be passed as=
-is and KVM
> > > wouldn't "need" to kinda sorta overload FOLL_GET to manually drop the=
 reference.
> > >
> > > I do think it's worth providing a helper to consolidate and document =
that hacky
> > > code, e.g. add a kvm_follow_refcounted_pfn() helper.
> > >
> > > All in all, I think the below (completely untested) is what we want?
> > >
> > > David (and others), I am planning on doing a full review of this seri=
es "soon",
> > > but it will likely be a few weeks until that happens.  I jumped in on=
 this
> > > specific thread because this caught my eye and I really don't want to=
 throw out
> > > *all* of the FOLL_GET usage.
> > >
> > > diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> > > index 5b5afd70f239..90d424990e0a 100644
> > > --- a/virt/kvm/kvm_main.c
> > > +++ b/virt/kvm/kvm_main.c
> > > @@ -2481,6 +2481,25 @@ static inline int check_user_page_hwpoison(uns=
igned long addr)
> > >         return rc =3D=3D -EHWPOISON;
> > >  }
> > >
> > > +static kvm_pfn_t kvm_follow_refcounted_pfn(struct kvm_follow_pfn *fo=
ll,
> > > +                                          struct page *page)
> > > +{
> > > +       kvm_pfn_t pfn =3D page_to_pfn(page);
> > > +
> > > +       foll->is_refcounted_page =3D true;
> > > +
> > > +       /*
> > > +        * FIXME: Ideally, KVM wouldn't pass FOLL_GET to gup() when t=
he caller
> > > +        * doesn't want to grab a reference, but gup() doesn't suppor=
t getting
> > > +        * just the pfn, i.e. FOLL_GET is effectively mandatory.  If =
that ever
> > > +        * changes, drop this and simply don't pass FOLL_GET to gup()=
.
> > > +        */
> > > +       if (!(foll->flags & FOLL_GET))
> > > +               put_page(page);
> > > +
> > > +       return pfn;
> > > +}
> > > +
> > >  /*
> > >   * The fast path to get the writable pfn which will be stored in @pf=
n,
> > >   * true indicates success, otherwise false is returned.  It's also t=
he
> > > @@ -2500,11 +2519,9 @@ static bool hva_to_pfn_fast(struct kvm_follow_=
pfn *foll, kvm_pfn_t *pfn)
> > >                 return false;
> > >
> > >         if (get_user_page_fast_only(foll->hva, FOLL_WRITE, page)) {
> > > -               *pfn =3D page_to_pfn(page[0]);
> > >                 foll->writable =3D foll->allow_write_mapping;
> > > -               foll->is_refcounted_page =3D true;
> > > -               if (!(foll->flags & FOLL_GET))
> > > -                       put_page(page[0]);
> > > +
> > > +               *pfn =3D kvm_follow_refcounted_pfn(foll, page[0]);
> > >                 return true;
> > >         }
> > >
> > > @@ -2528,7 +2545,6 @@ static int hva_to_pfn_slow(struct kvm_follow_pf=
n *foll, kvm_pfn_t *pfn)
> > >                 return npages;
> > >
> > >         foll->writable =3D (foll->flags & FOLL_WRITE) && foll->allow_=
write_mapping;
> > > -       foll->is_refcounted_page =3D true;
> > >
> > >         /* map read fault as writable if possible */
> > >         if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> > > @@ -2540,9 +2556,8 @@ static int hva_to_pfn_slow(struct kvm_follow_pf=
n *foll, kvm_pfn_t *pfn)
> > >                         page =3D wpage;
> > >                 }
> > >         }
> > > -       *pfn =3D page_to_pfn(page);
> > > -       if (!(foll->flags & FOLL_GET))
> > > -               put_page(page);
> > > +
> > > +       *pfn =3D kvm_follow_refcounted_pfn(foll, page);
> > >         return npages;
> > >  }
> > >
> > > @@ -2610,17 +2625,16 @@ static int hva_to_pfn_remapped(struct vm_area=
_struct *vma, struct kvm_follow_pfn
> > >         if (!page)
> > >                 goto out;
> > >
> > > -       if (get_page_unless_zero(page)) {
> > > -               foll->is_refcounted_page =3D true;
> > > -               if (!(foll->flags & FOLL_GET))
> > > -                       put_page(page);
> > > -       } else if (foll->flags & FOLL_GET) {
> > > -               r =3D -EFAULT;
> > > -       }
> > > -
> > > +       if (get_page_unless_zero(page))
> > > +               WARN_ON_ONCE(kvm_follow_refcounted_pfn(foll, page) !=
=3D pfn);
> > >  out:
> > >         pte_unmap_unlock(ptep, ptl);
> > > -       *p_pfn =3D pfn;
> > > +
> > > +       if (!foll->is_refcounted_page && !foll->guarded_by_mmu_notifi=
er &&
> > > +           !allow_unsafe_mappings)
> > > +               r =3D -EFAULT;
> > > +       else
> > > +               *p_pfn =3D pfn;
> > >
> > >         return r;
> > >  }
> > >
> >
> > As I pointed out above, this suggestion is broken because a FOLL_GET
> > && !guarded_by_mmu_notifier request (e.g. kvm_vcpu_map) for a
> > non-refcounted page will result in the refcount eventually being
> > corrupted.
>
> I don't think so, unless I'm misunderstanding the concern.  It just wasn'=
t a
> complete patch, and wasn't intended to be.

I guess I misunderstood the scale of the changes you're suggesting.

-David
