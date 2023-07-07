Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00B7174A881
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 03:36:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hJRjPgcT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxwwB6fDhz3c3P
	for <lists+linuxppc-dev@lfdr.de>; Fri,  7 Jul 2023 11:36:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hJRjPgcT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::12d; helo=mail-lf1-x12d.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxwvG6QsPz3bnB
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Jul 2023 11:35:21 +1000 (AEST)
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so2007171e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 06 Jul 2023 18:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688693713; x=1691285713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jHzMQLp6cC/kLBC/6EOoqJ2QCFHXCMXxzGNBM9QacjY=;
        b=hJRjPgcTCc7q6itd2xbffCg48LKO/Qm/YiojcslhQVKO2e+xGuKwenYHZjO6sm/Nd4
         j+Q+arjaIozLu+vV0ToUrNaQE3iqbHFkEbzw62omnPFzlS5rZwkuqhAb6kqwNak5ba03
         v7eBCW1S9UdFdykuZWhw1cVpSMPjbwNVEnVDg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688693713; x=1691285713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jHzMQLp6cC/kLBC/6EOoqJ2QCFHXCMXxzGNBM9QacjY=;
        b=ZF+oMtk4m/kMrbgPzkqZJFFj0dBDfWb2vXLVJjcmB9wtqoVwXc6DAgZ3V/38hkoDDV
         /mmjSo2iGUSZWMYham4uqfIECSCauZW0aQgiOlkWq4LGWeJM6mcwmvcJkSrBfsvgPOVn
         OxiQKYTHfqleKHC0hA/1ZQbyavfpZ8jBjOxQ6FozjNnKlyD4wOnT8mdWIOZg/8m8Kwru
         KC9/lpCJc/DNIptqJE8J4+yp5qxpCiIApFUvvse5wRT2xl0TE7Ri1UlWLhfzfrn+LMxX
         WuZGJZSf4OHxvOCjHsUFzmRLMwFDIzFmMF0aeBWOp8OkvyCLSyoxQg9PmdhEQJxwoD9O
         uWaw==
X-Gm-Message-State: ABy/qLbjeDBudEumJknMdZd5Kl69mFv/cjh1HBIB2/tioDs1Sbt98B0c
	i0XLg+V/SGjtp54vsuDZizd6gX/fZe/CTBCtN9BtnQ==
X-Google-Smtp-Source: APBJJlE5Z1LKZjv+Su0EOT2WrS/jSlDd30OmLqLSEJNttXtFFbijFLtL5Sn7PdB1lMgsRBKF7D8wQuyk1Ic2XROTdJ4=
X-Received: by 2002:a05:6512:3e0c:b0:4fb:bc46:7c09 with SMTP id
 i12-20020a0565123e0c00b004fbbc467c09mr3594815lfv.6.1688693713232; Thu, 06 Jul
 2023 18:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705101800.ut4c6topn6ylwczs@linux.intel.com> <CAD=HUj41PAKC0x+c3zWAr-aCm59K7hs2zRh1uWs9778_Mai4UA@mail.gmail.com>
 <20230706155805.GD3894444@ls.amr.corp.intel.com>
In-Reply-To: <20230706155805.GD3894444@ls.amr.corp.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Fri, 7 Jul 2023 10:35:02 +0900
Message-ID: <CAD=HUj6GiK3TSSe7UY8C2Jd+3tjZNBa-TLgk-UodyL=E+qKavg@mail.gmail.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
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
Cc: Marc Zyngier <maz@kernel.org>, kvm@vger.kernel.org, Sean Christopherson <seanjc@google.com>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jul 7, 2023 at 12:58=E2=80=AFAM Isaku Yamahata <isaku.yamahata@gmai=
l.com> wrote:
>
> On Thu, Jul 06, 2023 at 01:52:08PM +0900,
> David Stevens <stevensd@chromium.org> wrote:
>
> > On Wed, Jul 5, 2023 at 7:17=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel=
.com> wrote:
> > >
> > > On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > > > From: David Stevens <stevensd@chromium.org>
> > > >
> > > > Stop passing FOLL_GET to __kvm_follow_pfn. This allows the host to =
map
> > > > memory into the guest that is backed by un-refcounted struct pages =
- for
> > > > example, higher order non-compound pages allocated by the amdgpu dr=
iver
> > > > via ttm_pool_alloc_page.
> > >
> > > I guess you mean the tail pages of the higher order non-compound page=
s?
> > > And as to the head page, it is said to be set to one coincidentally[*=
],
> > > and shall not be considered as refcounted.  IIUC, refcount of this he=
ad
> > > page will be increased and decreased soon in hva_to_pfn_remapped(), s=
o
> > > this may not be a problem(?). But treating this head page differently=
,
> > > as a refcounted one(e.g., to set the A/D flags), is weired.
> > >
> > > Or maybe I missed some context, e.g., can the head page be allocted t=
o
> > > guest at all?
> >
> > Yes, this is to allow mapping the tail pages of higher order
> > non-compound pages - I should have been more precise in my wording.
> > The head pages can already be mapped into the guest.
> >
> > Treating the head and tail pages would require changing how KVM
> > behaves in a situation it supports today (rather than just adding
> > support for an unsupported situation). Currently, without this series,
> > KVM can map VM_PFNMAP|VM_IO memory backed by refcounted pages into the
> > guest. When that happens, KVM sets the A/D flags. I'm not sure whether
> > that's actually valid behavior, nor do I know whether anyone actually
> > cares about it. But it's what KVM does today, and I would shy away
> > from modifying that behavior without good reason.
> >
> > > >
> > > > The bulk of this change is tracking the is_refcounted_page flag so =
that
> > > > non-refcounted pages don't trigger page_count() =3D=3D 0 warnings. =
This is
> > > > done by storing the flag in an unused bit in the sptes.
> > >
> > > Also, maybe we should mention this only works on x86-64.
> > >
> > > >
> > > > Signed-off-by: David Stevens <stevensd@chromium.org>
> > > > ---
> > > >  arch/x86/kvm/mmu/mmu.c          | 44 +++++++++++++++++++++--------=
----
> > > >  arch/x86/kvm/mmu/mmu_internal.h |  1 +
> > > >  arch/x86/kvm/mmu/paging_tmpl.h  |  9 ++++---
> > > >  arch/x86/kvm/mmu/spte.c         |  4 ++-
> > > >  arch/x86/kvm/mmu/spte.h         | 12 ++++++++-
> > > >  arch/x86/kvm/mmu/tdp_mmu.c      | 22 ++++++++++-------
> > > >  6 files changed, 62 insertions(+), 30 deletions(-)
> > > >
> > > > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > > > index e44ab512c3a1..b1607e314497 100644
> > > > --- a/arch/x86/kvm/mmu/mmu.c
> > > > +++ b/arch/x86/kvm/mmu/mmu.c
> > >
> > > ...
> > >
> > > > @@ -2937,6 +2943,7 @@ static int mmu_set_spte(struct kvm_vcpu *vcpu=
, struct kvm_memory_slot *slot,
> > > >       bool host_writable =3D !fault || fault->map_writable;
> > > >       bool prefetch =3D !fault || fault->prefetch;
> > > >       bool write_fault =3D fault && fault->write;
> > > > +     bool is_refcounted =3D !fault || fault->is_refcounted_page;
> > >
> > > Just wonder, what if a non-refcounted page is prefetched?  Or is it p=
ossible in
> > > practice?
> >
> > Prefetching is still done via gfn_to_page_many_atomic, which sets
> > FOLL_GET. That's fixable, but it's not something this series currently
> > does.
>
> So if we prefetch a page, REFCOUNTED bit is cleared unconditionally with =
this
> hunk.  kvm_set_page_{dirty, accessed} won't be called as expected for pre=
fetched
> spte.  If I read the patch correctly, REFCOUNTED bit in SPTE should repre=
sent
> whether the corresponding page is ref-countable or not, right?
>
> Because direct_pte_prefetch_many() is for legacy KVM MMU and FNAME(prefet=
ch_pte)
> is shadow paging, we need to test it with legacy KVM MMU or shadow paging=
 to hit
> the issue, though.
>

direct_pte_prefetch_many and prefetch_gpte both pass NULL for the
fault parameter, so is_refcounted will evaluate to true. So the spte's
refcounted bit will get set in that case.

-David
