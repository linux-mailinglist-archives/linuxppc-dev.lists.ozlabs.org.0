Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 116707494FE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 07:30:31 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLDUHC7o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxQ906zjpz3bv0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 15:30:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=oLDUHC7o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::235; helo=mail-lj1-x235.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxQ862Crbz3bPV
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 15:29:39 +1000 (AEST)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b63e5f94f1so3378221fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 22:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688621375; x=1691213375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaztYOK3CeeSOgdOjNlGUDoiqmvgCpcAtf+Kjtl/Zxo=;
        b=oLDUHC7o8LLIpKQ47Bka4IhCDsnUOJ8PJa0mHtGy5+xmtH0ph+DN7fT2bOCyxUZ/OK
         voaasNoiVitwlvc6GdEXWSG+xw+zAyvNt5YIOkZ1Gv4N8GPo9GksM1sfnehNwooTJ6MC
         TIGRcSt6tw1MrfY6kMBuzzrrO3OFxrZGWrz+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688621375; x=1691213375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaztYOK3CeeSOgdOjNlGUDoiqmvgCpcAtf+Kjtl/Zxo=;
        b=bwfgV6m3IaqjBuCzACynQSPP0cW1fP9UJVZuiAooEpbxwRtJ+NTVVA3l/q6E7ykDnX
         czyRqqJl+/1wTfHdBTwmKE9JoRRS+9KvwTo/N22LjTflML1U3BNknN0CNwYWDH7NNIPu
         M1PqiSToAtXXsCDQm213vdS6TZVWCqG8esfQQ7udGQTsRZ4n+mJZwAzA9RGo6zUTj3Om
         GEZNWgLW4X7sgJuZR9BOsd6+g8xJRYTOMMWAb8WUz8EcoAAgctqiLP32TphvvOAITlX9
         1lu+ZzRlkOJ/8k++NRufVkDFS+IGuafUxy40OohYGdDVWxBdge3tY6nar3VNtROOoY7V
         hPRw==
X-Gm-Message-State: ABy/qLZQNlwtlvArBfb01oixWv7JwKa3cWZ90dKIM3V9Ytw1S7jZAQyL
	H1CaMNPQz4ViKwXCWm64z2gWngY9oa80TLBs8PZPWztTZ6iJW4WGia4=
X-Google-Smtp-Source: APBJJlFoQbGHquM/8F8vHFVN0DzDyQkinz8d9jngOAhWJR4+2GRUPIv/nW729Pai2dwCQYTiCsN6nZl/3HDPmf9AC/g=
X-Received: by 2002:a05:651c:107b:b0:2b6:d7d2:1a65 with SMTP id
 y27-20020a05651c107b00b002b6d7d21a65mr1632317ljm.18.1688621375279; Wed, 05
 Jul 2023 22:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-3-stevensd@google.com>
 <20230705031002.xrxk42hli6oavtlt@linux.intel.com> <CAD=HUj6-VbznOOtn5WJee7Of_nh33ygg7_ph2G=hgnvNk_Cbsw@mail.gmail.com>
 <20230705105343.iounmlflfued7lco@linux.intel.com>
In-Reply-To: <20230705105343.iounmlflfued7lco@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 14:29:24 +0900
Message-ID: <CAD=HUj5ezWt7rLAv2qOpFsMHyFU87Hqtw_p8pWNF5+oxbLhxDg@mail.gmail.com>
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

On Wed, Jul 5, 2023 at 7:53=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.com=
> wrote:
>
> On Wed, Jul 05, 2023 at 06:22:59PM +0900, David Stevens wrote:
> > On Wed, Jul 5, 2023 at 12:10=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.inte=
l.com> wrote:
> > >
> > > > @@ -2514,35 +2512,26 @@ static bool hva_to_pfn_fast(unsigned long a=
ddr, bool write_fault,
> > > >   * The slow path to get the pfn of the specified host virtual addr=
ess,
> > > >   * 1 indicates success, -errno is returned if error is detected.
> > > >   */
> > > > -static int hva_to_pfn_slow(unsigned long addr, bool *async, bool w=
rite_fault,
> > > > -                        bool interruptible, bool *writable, kvm_pf=
n_t *pfn)
> > > > +static int hva_to_pfn_slow(struct kvm_follow_pfn *foll, kvm_pfn_t =
*pfn)
> > > >  {
> > > > -     unsigned int flags =3D FOLL_HWPOISON;
> > > > +     unsigned int flags =3D FOLL_HWPOISON | FOLL_GET | foll->flags=
;
> > > >       struct page *page;
> > > >       int npages;
> > > >
> > > >       might_sleep();
> > > >
> > > > -     if (writable)
> > > > -             *writable =3D write_fault;
> > > > -
> > > > -     if (write_fault)
> > > > -             flags |=3D FOLL_WRITE;
> > > > -     if (async)
> > > > -             flags |=3D FOLL_NOWAIT;
> > > > -     if (interruptible)
> > > > -             flags |=3D FOLL_INTERRUPTIBLE;
> > > > -
> > > > -     npages =3D get_user_pages_unlocked(addr, 1, &page, flags);
> > > > +     npages =3D get_user_pages_unlocked(foll->hva, 1, &page, flags=
);
> > > >       if (npages !=3D 1)
> > > >               return npages;
> > > >
> > > > +     foll->writable =3D (foll->flags & FOLL_WRITE) && foll->allow_=
write_mapping;
> > > > +
> > > >       /* map read fault as writable if possible */
> > > > -     if (unlikely(!write_fault) && writable) {
> > > > +     if (unlikely(!foll->writable) && foll->allow_write_mapping) {
> > >
> > > I guess !foll->writable should be !(foll->flags & FOLL_WRITE) here.
> >
> > The two statements are logically equivalent, although I guess using
> > !(foll->flags & FOLL_WRITE) may be a little clearer, if a little more
> > verbose.
>
> Well, as the comment says, we wanna try to map the read fault as writable
> whenever possible. And __gfn_to_pfn_memslot() will only set the FOLL_WRIT=
E
> for write faults. So I guess using !foll->writable will not allow this.
> Did I miss anything?

We just set the foll->writable out parameter to be equal to
((foll->flags & FOLL_WRITE) && foll->allow_write_mapping). Taking a =3D
foll->flags & FOLL_WRITE and b =3D foll->allow_write_mapping, we have
!(a && b) && b -> (!a || !b) && b -> (!a && b) || (!b && b) -> !a &&
b.

-David
