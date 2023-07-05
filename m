Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C82597480BE
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 11:24:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UjRgjsVB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QwvP05H5Bz3brC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Jul 2023 19:24:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=UjRgjsVB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22f; helo=mail-lj1-x22f.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QwvN52xRXz30PC
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Jul 2023 19:23:14 +1000 (AEST)
Received: by mail-lj1-x22f.google.com with SMTP id 38308e7fff4ca-2b6ff1ada5dso6827931fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 02:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688548990; x=1691140990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hevL1MlnabH6U4eIyVNZqX1Q6T1jS/bGfgvHOxnvxFk=;
        b=UjRgjsVBiY8D2AXveR2isxaEiF6+iOKVwJC0ezqlGCKd5u2QVdG+ntqDaxNfYIhHYh
         7tH2XGdL93OCAOdZMYBp4jJVQHAKzpFSXh4XiPwkMuh2gMxkUrjGMC/CYge/PDTC6reF
         FsTwGWH8uIYJu0RFz24ORez/tyH0bQ20ps1Vc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688548990; x=1691140990;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hevL1MlnabH6U4eIyVNZqX1Q6T1jS/bGfgvHOxnvxFk=;
        b=hH31iAYvFEuW5vyPedDlvnVy1M1Ovp8shRDdKFom7m3GCffYhHST4vNjKrzE4txNPe
         3xd05ulNXXvdeKrTPoJkp0X+udvRR3td3tB0VDgXdfImau1hKN97woSJHy68Oq789d4g
         LMqGOGpIDAwGp3G9w1+w1QNHtqFjk0Z2fuwk+WxgUGJAdjvUie1JZGo9bNYDcKbP/bwV
         ZebKzGSHlae+TY+/Z6O+J185ADXZ1Q4ZVn1JqOyBYt7pRI1rk/J6DawsOnvGcO8ffOIZ
         X3ZOKwoYPVXrOlTxJeIYgQ/Ye78tOllWwXmPAeJBbR5fqM+4mm8UXynrM1U+WKagrf6q
         q5ew==
X-Gm-Message-State: ABy/qLZFBuCEujt+0SVyus+MMKLExotV7i8T17QBTZfj/XDThifI/FbZ
	dDveSfQL+OtGZZAzRVlaqfFqQSXiGfFBv0CAuANaEA==
X-Google-Smtp-Source: APBJJlHALNKpgop8uXo+YA22FSE0sRA/ZaoE9VV+TBwKPxNA104VYZCTQrddq5ETUv0WC+BnXxDNFCP/AZDkp5bMkgw=
X-Received: by 2002:a05:651c:8e:b0:2b6:e283:32cb with SMTP id
 14-20020a05651c008e00b002b6e28332cbmr6846475ljq.23.1688548990474; Wed, 05 Jul
 2023 02:23:10 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
 <20230705031002.xrxk42hli6oavtlt@linux.intel.com>
In-Reply-To: <20230705031002.xrxk42hli6oavtlt@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Wed, 5 Jul 2023 18:22:59 +0900
Message-ID: <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
Subject: Re: [PATCH v7 2/8] KVM: Introduce __kvm_follow_pfn function
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

On Wed, Jul 5, 2023 at 12:10=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.co=
m> wrote:
>
> > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long addr,=
 bool write_fault,
> >   * The slow path to get the pfn of the specified host virtual address,
> >   * 1 indicates success, -errno is returned if error is detected.
> >   */
> > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool write=
_fault,
> > -                        bool interruptible, bool *writable, kvm_pfn_t =
*pfn)
> > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t *pfn=
)
> >  {
> > -     unsigned int flags =3D FOLL_HWPOISON;
> > +     unsigned int flags =3D FOLL_HWPOISON | FOLL_GET | foll->flags;
> >       struct page *page;
> >       int npages;
> >
> >       might_sleep();
> >
> > -     if (writable)
> > -             *writable =3D write_fault;
> > -
> > -     if (write_fault)
> > -             flags |=3D FOLL_WRITE;
> > -     if (async)
> > -             flags |=3D FOLL_NOWAIT;
> > -     if (interruptible)
> > -             flags |=3D FOLL_INTERRUPTIBLE;
> > -
> > -     npages =3D get_user_pages_unlocked(addr, 1, &page, flags);
> > +     npages =3D get_user_pages_unlocked(foll->hva, 1, &page, flags);
> >       if (npages !=3D 1)
> >               return npages;
> >
> > +     foll->writable =3D (foll->flags & FOLL_WRITE) && foll->allow_writ=
e_mapping;
> > +
> >       /* map read fault as writable if possible */
> > -     if (unlikely(!write_fault) && writable) {
> > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
>
> I guess !foll->writable should be !(foll->flags & FOLL_WRITE) here.

The two statements are logically equivalent, although I guess using
!(foll->flags & FOLL_WRITE) may be a little clearer, if a little more
verbose.

> >               struct page *wpage;
> >
> > -             if (get_user_page_fast_only(addr, FOLL_WRITE, &wpage)) {
> > -                     *writable =3D true;
> > +             if (get_user_page_fast_only(foll->hva, FOLL_WRITE, &wpage=
)) {
> > +                     foll->writable =3D true;
> >                       put_page(page);
> >                       page =3D wpage;
> >               }
> > @@ -2572,23 +2561,23 @@ static int kvm_try_get_pfn(kvm_pfn_t pfn)
> >       return get_page_unless_zero(page);
> >  }
> >
> ...
>
> > +kvm_pfn_t __gfn_to_pfn_memslot(const struct kvm_memory_slot *slot, gfn=
_t gfn,
> > +                            bool atomic, bool interruptible, bool *asy=
nc,
> > +                            bool write_fault, bool *writable, hva_t *h=
va)
> > +{
> > +     kvm_pfn_t pfn;
> > +     struct kvm_follow_pfn foll =3D {
> > +             .slot =3D slot,
> > +             .gfn =3D gfn,
> > +             .flags =3D 0,
> > +             .atomic =3D atomic,
> > +             .allow_write_mapping =3D !!writable,
> > +     };
> > +
> > +     if (write_fault)
> > +             foll.flags |=3D FOLL_WRITE;
> > +     if (async)
> > +             foll.flags |=3D FOLL_NOWAIT;
> > +     if (interruptible)
> > +             foll.flags |=3D FOLL_INTERRUPTIBLE;
> > +
> > +     pfn =3D __kvm_follow_pfn(&foll);
> > +     if (pfn =3D=3D KVM_PFN_ERR_NEEDS_IO) {
>
> Could we just use KVM_PFN_ERR_FAULT and foll.flags here? I.e.,
>         if (pfn =3D=3D KVM_PFN_ERR_FAULT && (foll.flags & FOLL_NOWAIT))?
> Setting pfn to KVM_PFN_ERR_NEEDS_IO just to indicate an async fault
> seems unnecessary.

There are the cases where the fault does not fall within a vma or when
the target vma's flags don't support the fault's access permissions.
In those cases, continuing to try to resolve the fault won't cause
problems per-se, but it's wasteful and a bit confusing. Having
hva_to_pfn detect whether or not it may be possible to resolve the
fault asynchronously and return KVM_PFN_ERR_NEEDS_IO if so seems like
a good idea. It also matches what the existing code does.

-David
