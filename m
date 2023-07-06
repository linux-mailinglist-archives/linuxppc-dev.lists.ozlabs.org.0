Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD30B749561
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 08:10:24 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mb8mQeOD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QxR324g4yz30hY
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jul 2023 16:10:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Mb8mQeOD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com; envelope-from=stevensd@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QxR265bfJz30hF
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jul 2023 16:09:32 +1000 (AEST)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2b69923a715so3645721fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 05 Jul 2023 23:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688623769; x=1691215769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nnXCFXxOhLyq4lCoBGcKBYyF+4vukIbIpcnG55iOM5c=;
        b=Mb8mQeODhASdfKj+hHmylndEuVUiM/b1apoiBK04bLwBY4ajtvROBk8GMW7aZY/V0i
         W1Z+4ltSxdNVbESwxHXe2Nto30vwXM0F3QS91jS46XmSmaIFT07lHu3Fjhw9FLn8BQ2Y
         YvMVdpKSmiU70sMHWlcr+gv3eHgbBItZzvHwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688623769; x=1691215769;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nnXCFXxOhLyq4lCoBGcKBYyF+4vukIbIpcnG55iOM5c=;
        b=c7cR+pIpiQKfYACYOpTptdCh56ma303ITeX9F5OAV/5ktfQaYvQbhvU4+u3CsuVCPQ
         PopyxbtYfa2o/x+st865gyj4dgTEg1KwM9jOq4xFg4CiKxAqnmjZ1eaRtE3qmRKJoYLZ
         mbDhI56k+EJNud5zzLcipsSA9ZUAQsouDh9zecbkhF742a/9IlLPTN6gBW0O1kkaJUnc
         ULGZOOPEgm8wv4YPHm9j9l1i4Ff4DJOYludbSyeK7xlDaupdL6WnnV6zcydKKzDC0HuB
         sihphc8zMjIFHF2AbEdMLtqxR7mdo38nqtyS4akZtInzuk/Z3dTKmaagw6k1y2RgcLvl
         aVxA==
X-Gm-Message-State: ABy/qLYzWXSQWKztj6KmltSf5ZZtUvvdbktbhLn5VSYU3f6gVHBsPTRU
	3B0+keIa3wQ/y0Ro9/VhlpVQn/6D/Jl4guwzT2QHsw==
X-Google-Smtp-Source: APBJJlFQB6JQNb0dZ8JFG6eZYjbcpaXMlqxVbVKudZNWo1HIe+n1zgkzENdCl4UX7JHIJWm/W9286vJy7CQ1VvEz4L0=
X-Received: by 2002:a2e:9c46:0:b0:2b7:857:7cb5 with SMTP id
 t6-20020a2e9c46000000b002b708577cb5mr58264ljj.24.1688623768867; Wed, 05 Jul
 2023 23:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-4-stevensd@google.com>
 <20230705115653.5whvhvcvmflqmcse@linux.intel.com>
In-Reply-To: <20230705115653.5whvhvcvmflqmcse@linux.intel.com>
From: David Stevens <stevensd@chromium.org>
Date: Thu, 6 Jul 2023 15:09:17 +0900
Message-ID: <CAD=HUj4E84MxZn8=U3wkBtx-VYdeD1mqOH9BUYpG=Y2POvY6sg@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] KVM: Make __kvm_follow_pfn not imply FOLL_GET
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

On Wed, Jul 5, 2023 at 8:56=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.intel.com=
> wrote:
>
> On Tue, Jul 04, 2023 at 04:50:48PM +0900, David Stevens wrote:
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
> > +      * be true if FOLL_GET is not set.
> > +      */
> > +     bool guarded_by_mmu_notifier;
>
> And how? Any place to check the invalidate seq?

kvm_follow_pfn can't meaningfully validate the seq number, since the
mmu notifier locking is handled by the caller. This is more of a
sanity check that the API is being used properly, as proposed here
[1]. I did deviate from the proposal with a bool instead of some type
of integer, since the exact value of mmu_seq wouldn't be useful.

[1] https://lore.kernel.org/all/ZGvUsf7lMkrNDHuE@google.com/#t

-David
