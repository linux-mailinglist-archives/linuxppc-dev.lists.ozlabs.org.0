Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 523F87495ED
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:50:46 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ja4IOO3x;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxRxc1VZ9z3bsS
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 16:50:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ja4IOO3x;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::230; helo=mail-lj1-x230.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxRwk3Nymz30MJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 16:49:55 +1000 (AEST)
Received: by mail-lj1-x230.google.com with SMTP id 38308e7fff4ca-2b703caf344so4031861fa.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 23:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688626190; x=1691218190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5eWkSj4KC5nS3P+RLvcZXPptH23EBW7FjX/9bZ4xeY=;
        b=ja4IOO3xVZ6/Tc75u/mIiFFibtnYxJ3DyQJiezKFRO1BT/i/tInsQdPBwqV1K6c8OB
         NzrTW0CCdwtJDcyKr+K7eaRAfl7gSY3EPoTgo/V1gOdfqehluk6JZK6F4LvwA1z4DQCk
         aCMPhrABaGhAhTIgENGDgkn/PB5cEiYnULzWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688626190; x=1691218190;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r5eWkSj4KC5nS3P+RLvcZXPptH23EBW7FjX/9bZ4xeY=;
        b=NwTZMJZc4GW1NTWbFtCd7+7Bnd8MvJ0GU/XuGxCwnCgToqiaq0QA+vLhl/j75uT5rw
         nGH1vlWq+M5gWPvX7lhXPJnwaZkvWvBqkwn0zkZmE0oGDNfFK4eTJvVGpLRTelEiggNx
         UVI5/UHVByV50bWkdTq+omm4Alf++COLj5ojlLgU39VO1sEWg3YyVvVksTjx9jpG2iY4
         U6/W4U69uOHSzISOZuXvfWUr14iFt91X9O+a0KGpfXeiHqoY2ok8gEFFEAlShRkLViVG
         Fh7FcTtmXYqREQkGOkapsmLN1hfvmFZFzQrwV302EshlzCFAFmofGQ12y2EzGOe0IKN8
         hRZQ==
X-Gm-Message-State: ABy/qLb1pDH5WS3aS/EXmJkgVecSkHcDr0WTaHt/zJJ/1cjCh7JXn5gT
	UR13Uj8LqvZGjNhxSPGTKN6pIBvSpeAyNmbKIsghqQ==
X-Google-Smtp-Source: APBJJlF7htU9Rd6ty5mPrsHjdKtTcK7sc+s+47FH3YkpHGjHXvbMbW6eRVcyDM6GyWvtGpLRUG3fOJ+jUV4yvf2Vv+s=
X-Received: by 2002:a2e:b60d:0:b0:2b6:bb08:91c4 with SMTP id
 r13-20020a2eb60d000000b002b6bb0891c4mr609674ljn.42.1688626190310; Wed, 05 Jul
 2023 23:49:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-4-stevensd@google.com>
 <20230705161914.00004070.zhi.wang.linux@gmail.com>
In-Reply-To: <20230705161914.00004070.zhi.wang.linux@gmail.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 15:49:39 +0900
Message-ID: <CAD=HUj5cbzjrc0KD7xcibtRMRCzoJRJAzt7jTHSXUSpzyAYbdg@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
To: Zhi Wang <zhi.wang.linux@gmail.com>
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

On Wed, Jul 5, 2023 at 10:19=E2=80=AFPM Zhi Wang <zhi.wang.linux@gmail.com>=
 wrote:
>
> On Tue,  4 Jul 2023 16:50:48 +0900
> David Stevens <stevensd@chromium.org> wrote:
>
> > From: David Stevens <stevensd@chromium.org>
> >
> > Make it so that __kvm_follow_pfn does not imply FOLL_GET. This allows
> > callers to resolve a gfn when the associated pfn has a valid struct pag=
e
> > that isn't being actively refcounted (e.g. tail pages of non-compound
> > higher order pages). For a caller to safely omit FOLL_GET, all usages o=
f
> > the returned pfn must be guarded by a mmu notifier.
> >
> > This also adds a is_refcounted_page out parameter to kvm_follow_pfn tha=
t
> > is set when the returned pfn has an associated struct page with a valid
> > refcount. Callers that don't pass FOLL_GET should remember this value
> > and use it to avoid places like kvm_is_ad_tracked_page that assume a
> > non-zero refcount.
> >
> > Signed-off-by: David Stevens <stevensd@chromium.org>
> > ---
> >  include/linux/kvm_host.h | 10 ++++++
> >  virt/kvm/kvm_main.c      | 67 +++++++++++++++++++++-------------------
> >  virt/kvm/pfncache.c      |  2 +-
> >  3 files changed, 47 insertions(+), 32 deletions(-)
> >
> > diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> > index ef2763c2b12e..a45308c7d2d9 100644
> > --- a/include/linux/kvm_host.h
> > +++ b/include/linux/kvm_host.h
> > @@ -1157,6 +1157,9 @@ unsigned long gfn_to_hva_memslot_prot(struct kvm_=
memory_slot *slot, gfn_t gfn,
> >  void kvm_release_page_clean(struct page *page);
> >  void kvm_release_page_dirty(struct page *page);
> >
> > +void kvm_set_page_accessed(struct page *page);
> > +void kvm_set_page_dirty(struct page *page);
> > +
> >  struct kvm_follow_pfn {
> >       const struct kvm_memory_slot *slot;
> >       gfn_t gfn;
> > @@ -1164,10 +1167,17 @@ struct kvm_follow_pfn {
> >       bool atomic;
> >       /* Allow a read fault to create a writeable mapping. */
> >       bool allow_write_mapping;
> > +     /*
> > +      * Usage of the returned pfn will be guared by a mmu notifier. Mu=
st
>                                               ^guarded
> > +      * be true if FOLL_GET is not set.
> > +      */
> > +     bool guarded_by_mmu_notifier;
> >
> It seems no one sets the guraded_by_mmu_notifier in this patch. Is
> guarded_by_mmu_notifier always equal to !foll->FOLL_GET and set by the
> caller of __kvm_follow_pfn()?

Yes, this is the case.

> If yes, do we have to use FOLL_GET to resolve GFN associated with a tail =
page?
> It seems gup can tolerate gup_flags without FOLL_GET, but it is more like=
 a
> temporary solution. I don't think it is a good idea to play tricks with
> a temporary solution, more like we are abusing the toleration.

I'm not sure I understand what you're getting at. This series never
calls gup without FOLL_GET.

This series aims to provide kvm_follow_pfn as a unified API on top of
gup+follow_pte. Since one of the major clients of this API uses an mmu
notifier, it makes sense to support returning a pfn without taking a
reference. And we indeed need to do that for certain types of memory.

> Is a flag like guarded_by_mmu_notifier (perhaps a better name) enough to
> indicate a tail page?

What do you mean by to indicate a tail page? Do you mean to indicate
that the returned pfn refers to non-refcounted page? That's specified
by is_refcounted_page.

-David
