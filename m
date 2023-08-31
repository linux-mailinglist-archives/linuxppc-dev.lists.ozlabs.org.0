Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D76EF78F46C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 31 Aug 2023 23:19:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JzGqkXud;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RcDYm5NVRz3c33
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Sep 2023 07:19:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20221208 header.b=JzGqkXud;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::114a; helo=mail-yw1-x114a.google.com; envelope-from=3napxzaykdjuh3zc815dd5a3.1dba7cjmee1-23ka7hih.doaz0h.dg5@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RcDXw4qt3z2yN3
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Sep 2023 07:18:23 +1000 (AEST)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-59224c40275so15177027b3.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 31 Aug 2023 14:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1693516700; x=1694121500; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YO6r55IA8eElX5w/+X8zOZmT73jh5i8DqE52ZxJWYQc=;
        b=JzGqkXud6vvFFXyzF6NaJI5WoTcqJ3+2JtjtqAp4HFfxtcI+aQPeHvu2OT3WnkOHTj
         LlsLVuOuFLMvyVL1tAFOw6ata93DlvFoRQSRdew6MowjprfalJcLi1bqW8zu9gDAOz5N
         +PTo1tfAZVzluKO9rI8yN0MEKH/ZRzOq4dSGycSDDJbCjAYDs0pPYHrxMbi9fEYCbtbg
         T8Vz6/7GUPb3nXfNUjEArlavTx+6EtVPDfjqvfBxJoCA1vf4NLWhlwtUPAuXqdgs3Hmo
         niib22MWvsvZICfrk0KH+uZyuyY0cAkmmRKVOGen2gKYyzinw7DgexpAiT+CqhdSMEkZ
         5b0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693516700; x=1694121500;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YO6r55IA8eElX5w/+X8zOZmT73jh5i8DqE52ZxJWYQc=;
        b=EF7Mfq1NpAeMW5jCX7pl7BPYEZSBzcwf8oY/nqM8c2PpL7G7cSnKnp0ZenlKXpG4j0
         Ycq3Vzjn+8w0xZw4FUWdlc0fmiY8CwufXgjvXcoUIT8wxdWjnHALueyup3xLIHESNeax
         BKCmPBWya8BnFB7FdoSR38q2hW9NcQpXH7h+eF6e6m5uISzKyWVfyvAO6MpHCCkR2uG5
         OcfkE3c9Y5G5St3KwWV58XpeYbshOQuKoF+zUpU/sp5OyoQ7bpQH8Op7H8qbvlqdLkH5
         pEw5vLpsRxWBcWgcUZ68Jo8sQn5f0lRIUaxNpwPSQbkIW0LgwzIjBfadJSjcFZrQVc0I
         SGsQ==
X-Gm-Message-State: AOJu0Yy7rEvQYNvhCDrkMmlV4757MR56Uoeo8GowU8q+8Dh4c22/AuKx
	zVk8lHLTaRd3Bzk1FMM82+prk7+K0eo=
X-Google-Smtp-Source: AGHT+IEZwzQUuTI7C6FFX7BSq8V52BjhaRfu7MbpFPM/CoSsWVx5jFl7L8T8aMfs6TbWHc+jUHpp1k/u52U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:690c:721:b0:586:5d03:67c8 with SMTP id
 bt1-20020a05690c072100b005865d0367c8mr16211ywb.3.1693516700041; Thu, 31 Aug
 2023 14:18:20 -0700 (PDT)
Date: Thu, 31 Aug 2023 14:18:18 -0700
In-Reply-To: <CAD=HUj6XYKGgRLb2VWBnYEEH9YQUMROBf2YBXaTOvWZS5ejhmg@mail.gmail.com>
Mime-Version: 1.0
References: <20230704075054.3344915-1-stevensd@google.com> <20230704075054.3344915-6-stevensd@google.com>
 <20230705102547.hr2zxkdkecdxp5tf@linux.intel.com> <CAD=HUj7F6CUNt_9txEu0upB=PBwJzkL5dBhNs_BVHX1cicqBgw@mail.gmail.com>
 <ZOd0IMeKSkBwGIer@google.com> <CAD=HUj6XYKGgRLb2VWBnYEEH9YQUMROBf2YBXaTOvWZS5ejhmg@mail.gmail.com>
Message-ID: <ZPEDmnloiOs/HNr+@google.com>
Subject: Re: [PATCH v7 5/8] KVM: x86/mmu: Don't pass FOLL_GET to __kvm_follow_pfn
From: Sean Christopherson <seanjc@google.com>
To: David Stevens <stevensd@chromium.org>
Content-Type: text/plain; charset="utf-8"
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
Cc: kvm@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org, Peter Xu <peterx@redhat.com>, Yu Zhang <yu.c.zhang@linux.intel.com>, kvmarm@lists.linux.dev, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Aug 25, 2023, David Stevens wrote:
> On Fri, Aug 25, 2023 at 12:15=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> >
> > On Thu, Aug 24, 2023, David Stevens wrote:
> > > On Wed, Jul 5, 2023 at 7:25=E2=80=AFPM Yu Zhang <yu.c.zhang@linux.int=
el.com> wrote:
> > > >
> > > > On Tue, Jul 04, 2023 at 04:50:50PM +0900, David Stevens wrote:
> > > > > @@ -4529,7 +4540,8 @@ static int kvm_tdp_mmu_page_fault(struct kv=
m_vcpu *vcpu,
> > > > >
> > > > >  out_unlock:
> > > > >       read_unlock(&vcpu->kvm->mmu_lock);
> > > > > -     kvm_release_pfn_clean(fault->pfn);
> > > >
> > > > Yet kvm_release_pfn() can still be triggered for the kvm_vcpu_maped=
 gfns.
> > > > What if guest uses a non-referenced page(e.g., as a vmcs12)? Althou=
gh I
> > > > believe this is not gonna happen in real world...
> > >
> > > kvm_vcpu_map still uses gfn_to_pfn, which eventually passes FOLL_GET
> > > to __kvm_follow_pfn. So if a guest tries to use a non-refcounted page
> > > like that, then kvm_vcpu_map will fail and the guest will probably
> > > crash. It won't trigger any bugs in the host, though.
> > >
> > > It is unfortunate that the guest will be able to use certain types of
> > > memory for some purposes but not for others. However, while it is
> > > theoretically fixable, it's an unreasonable amount of work for
> > > something that, as you say, nobody really cares about in practice [1]=
.
> > >
> > > [1] https://lore.kernel.org/all/ZBEEQtmtNPaEqU1i@google.com/
> >
> > There are use cases that care, which is why I suggested allow_unsafe_km=
ap.
> > Specifically, AWS manages their pool of guest memory in userspace and m=
aps it all
> > via /dev/mem.  Without that module param to let userspace opt-in, this =
series will
> > break such setups.  It still arguably is a breaking change since it req=
uires
> > userspace to opt-in, but allowing such behavior by default is simply no=
t a viable
> > option, and I don't have much sympathy since so much of this mess has i=
ts origins
> > in commit e45adf665a53 ("KVM: Introduce a new guest mapping API").
> >
> > The use cases that no one cares about (AFAIK) is allowing _untrusted_ u=
serspace
> > to back guest RAM with arbitrary memory.  In other words, I want KVM to=
 allow
> > (by default) mapping device memory into the guest for things like vGPUs=
, without
> > having to do the massive and invasive overhaul needed to safely allow b=
acking guest
> > RAM with completely arbitrary memory.
>=20
> Do you specifically want the allow_unsafe_kmap breaking change? v7 of
> this series should have supported everything that is currently
> supported by KVM, but you're right that the v8 version of
> hva_to_pfn_remapped doesn't support mapping
> !kvm_pfn_to_refcounted_page() pages. That could be supported
> explicitly with allow_unsafe_kmap as you suggested,

I think it needs to be explicit, i.e. needs the admin to opt-in to the unsa=
fe
behavior.
