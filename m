Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2995878694F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 10:04:21 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gxvA/c6f;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RWbFv0hCBz3cNK
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Aug 2023 18:04:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=gxvA/c6f;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22a; helo=mail-lj1-x22a.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RWbDz5WQLz3bvd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 18:03:29 +1000 (AEST)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b9b50be31aso98958851fa.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Aug 2023 01:03:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692864202; x=1693469002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FwL3iE/sigInGebDo7+XC2zrCJyIJXwWg9T7XgYdvUo=;
        b=gxvA/c6f/mD+SfAn3i79Fac49CIYCfuEAc0NJXFLYFB579Htuh0raSgmo5mwINjJKP
         6mZXPbJVoLaq/tx8bw95ips+dNfMElarUiEFePbfy6xKS2dz4ss1ZXXCCdNYMwI1jeLf
         17LTOViCbmKzZvWJJEazhuc9QUFLtiG02+szQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692864202; x=1693469002;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FwL3iE/sigInGebDo7+XC2zrCJyIJXwWg9T7XgYdvUo=;
        b=iVLTGzdckUxUZvT0HYJcRICtqoxC4d94cZgHXYwhQoUMwGxTXpBUV4X5OXmjYbXF1r
         sK1YP0v9JDjzoRNdcvWLLkSieCAz+23uDnb1cOyCDHyRC2dQSv8t7P9Lj4WEuVnPa3Sq
         v1VkiTwFbIy88OrcCm3nLzb+/NzHrBzZAJqHYEBGJhQXA+n94+r5J//Y9oMADbYxdHRJ
         oPOZWyEDOxAsDO0lfN7AesBXvnDWIkVONcLyby2i6MA1yW5mEuKy6AUFVBIWThJCUWEI
         L75mCYLqFTMEY6AVyhwszPBU8j5LmVEl5jdODnYNrnRx+lGazsp5ByWf/hNOpHtwkm2R
         552Q==
X-Gm-Message-State: AOJu0YwMcdocKiwI2uJmor3n2BhvCJ52eOZOLdknumnvcZL4LKdcaK3d
	miq+8ogWkr9D06HdUmomIQ39UUSC0t4MU83cQtHFqA==
X-Google-Smtp-Source: AGHT+IEJrvoCh3YeHUxATo9a8VY8kdH7uwNLYGWpcGp3BdwVjU+SPGgyEkpIPGghrgwO/hJ/muX8oz01uFd1YWIRnOA=
X-Received: by 2002:a2e:8e97:0:b0:2bb:aaab:b42f with SMTP id
 z23-20020a2e8e97000000b002bbaaabb42fmr10476719ljk.49.1692864202467; Thu, 24
 Aug 2023 01:03:22 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-5-stevensd@google.com>
 <20230706015449.GB3894444@ls.amr.corp.intel.com>
In-Reply-To: <20230706015449.GB3894444@ls.amr.corp.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 24 Aug 2023 17:03:11 +0900
Message-ID: <CAD=HUj43RG6M5_TEKBjv+Aioj8rZXKZFN_R8dinjhcpnN219hg@mail.gmail.com>
Subject: Re: [PATCH v7 4/8] KVM: x86/mmu: Migrate to __kvm_follow_pfn
To: Isaku Yamahata <isaku.yamahata@gmail.com>
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

On Thu, Jul 6, 2023 at 10:54=E2=80=AFAM Isaku Yamahata <isaku.yamahata@gmai=
l.com> wrote:
>
> On Tue, Jul 04, 2023 at 04:50:49PM +0900,
> David Stevens <stevensd@chromium.org> wrote:
>
> > From: David Stevens <stevensd@chromium.org>
> >
> > Migrate from __gfn_to_pfn_memslot to __kvm_follow_pfn.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  arch/x86/kvm/mmu/mmu.c | 35 +++++++++++++++++++++++++----------
> >  1 file changed, 25 insertions(+), 10 deletions(-)
> >
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index ec169f5c7dce..e44ab512c3a1 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -4296,7 +4296,12 @@ void kvm_arch_async_page_ready(struct kvm_vcpu *=
vcpu, struct kvm_async_pf *work)
> >  static int __kvm_faultin_pfn(struct kvm_vcpu *vcpu, struct kvm_page_fa=
ult *fault)
> >  {
> >       struct kvm_memory_slot *slot =3D fault->slot;
> > -     bool async;
> > +     struct kvm_follow_pfn foll =3D {
> > +             .slot =3D slot,
> > +             .gfn =3D fault->gfn,
> > +             .flags =3D FOLL_GET | (fault->write ? FOLL_WRITE : 0),
> > +             .allow_write_mapping =3D true,
> > +     };
> >
> >       /*
> >        * Retry the page fault if the gfn hit a memslot that is being de=
leted
> > @@ -4325,12 +4330,14 @@ static int __kvm_faultin_pfn(struct kvm_vcpu *v=
cpu, struct kvm_page_fault *fault
> >                       return RET_PF_EMULATE;
> >       }
> >
> > -     async =3D false;
> > -     fault->pfn =3D __gfn_to_pfn_memslot(slot, fault->gfn, false, fals=
e, &async,
> > -                                       fault->write, &fault->map_writa=
ble,
> > -                                       &fault->hva);
> > -     if (!async)
> > -             return RET_PF_CONTINUE; /* *pfn has correct page already =
*/
> > +     foll.flags |=3D FOLL_NOWAIT;
> > +     fault->pfn =3D __kvm_follow_pfn(&foll);
> > +
> > +     if (!is_error_noslot_pfn(fault->pfn))
>
> We have pfn in struct kvm_follow_pfn as output. Can we make __kvm_follow_=
pfn()
> return int instead of kvm_pfn_t?  KVM_PFN_* seems widely used, though.

Switching __kvm_follow_pfn to return an int isn't difficult, but doing
is cleanly would require reworking the kvm_pfn_t/KVM_PFN_ERR_* api,
which as you said is quite widely used. That's a bit larger scope than
I want to do in this patch series.

-David
