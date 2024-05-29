Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTP id 6552E8D41A6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 01:06:48 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NzfKHTcz;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VqPvF58Z1z79xZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 May 2024 08:58:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=NzfKHTcz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::1149; helo=mail-yw1-x1149.google.com; envelope-from=3_ljxzgykdpktfbokdhpphmf.dpnmjovyqqd-efwmjtut.p0mbct.psh@flex--seanjc.bounces.google.com; receiver=lists.ozlabs.org)
Received: from mail-yw1-x1149.google.com (mail-yw1-x1149.google.com [IPv6:2607:f8b0:4864:20::1149])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VqPtR6rM7z79Ll
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 May 2024 08:58:06 +1000 (AEST)
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-62a0825e365so4039717b3.1
        for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 May 2024 15:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1717023484; x=1717628284; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXQ4aAmXpFR+Rnn+LVSp/P9w+zocv3IAjl6jcVlXHAQ=;
        b=NzfKHTczE266gqQ/xVfeAnGfcOg4r3SFetpnZiEm6VBpFmPpluvu+XOKg5LYVIqCnX
         5Vb1YU/KNkuWUqCu0+GES7kdj3yuv1hifd6ARy/4dB7Cxo4FiPO2Eu53tmRydpHPpFe0
         tMYz0oKkETlH8tP2TINCNmohbZ/dParBzrtn43uVJo219irATiDharAHAvXJacYOPZJu
         8ObKtM/r5zhP0KmpWqIfRuObu/9RQNh3gBkWDYQq8lhmc9Z5/miwwBj6o7XAqT9qls+9
         pHGr29gg5D+RzFtaEbksf//BAm4PBKXCpuJEu4y+ejDkPH1R3Lw/cld92Ajagv5fywiK
         lTXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717023484; x=1717628284;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lXQ4aAmXpFR+Rnn+LVSp/P9w+zocv3IAjl6jcVlXHAQ=;
        b=srEtc5IOG/t1H16cjyu9EjkHtfQJukP77/AOwMShrywL1KVTCLtKI+kzLKEO9+9Rsc
         6GERHQHLMFbd7yE1CDXxo+TnJaGZ5V/vlejH3JK3Ld3n7P/r8D5YRGMf+emlID6oynpi
         7cbt7oyoBgHyJU8FBxLrDIw8XojP1bEFEeeo5A1qLvhAiFsap79WQEDJJ+iPPLb8XyPt
         lcy2GtAtb6BMnm0rkQyhAhxaeHLJAIw46erL6OLCmsR09fmjc4lLu0Vp848GHKNadqqP
         jxIHx6VR+1C55ru066eKpxM0uV3Dv1Wv0rqFHKKNZZuFB5KqUqtYpaHbOmk4d/uLOo2P
         +IWw==
X-Forwarded-Encrypted: i=1; AJvYcCXhXmHqR9h4sYym1PZJVn87VTg4FITVSHb9XRUrwJH0/+yA9UN+PUpj1zzCfK2U5LM1BP/hoaX1FuoI2STsfymhdJ92ttaDmw/fnkzXEA==
X-Gm-Message-State: AOJu0YxWWsry9/QHslzLLrH0YlteTo4Iuib2g6z13bWdnaquUMvSKhfG
	CXuY3dln82GGFWrMbuKDSsdZa96t2kfwpRdcMQL2fKnEcm3sGG1NsBYa3QPjX1D1Vk6+y/EcT+d
	u3A==
X-Google-Smtp-Source: AGHT+IEcoxWAWGQljmQC1ObvPASoASZSWeSUzQr2Szq7dgxCnuAYyloQCwOCyj3B7twEp9K1BnNOHbqA4OU=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1007:b0:dfa:5838:b919 with SMTP id
 3f1490d57ef6-dfa5a68828dmr142777276.10.1717023484293; Wed, 29 May 2024
 15:58:04 -0700 (PDT)
Date: Wed, 29 May 2024 15:58:02 -0700
In-Reply-To: <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Mime-Version: 1.0
References: <20240529180510.2295118-1-jthoughton@google.com>
 <20240529180510.2295118-3-jthoughton@google.com> <CAOUHufYFHKLwt1PWp2uS6g174GZYRZURWJAmdUWs5eaKmhEeyQ@mail.gmail.com>
 <ZlelW93_T6P-ZuSZ@google.com> <CAOUHufZdEpY6ra73SMHA33DegKxKaUM=Os7A7aDBFND6NkbUmQ@mail.gmail.com>
Message-ID: <Zley-u_dOlZ-S-a6@google.com>
Subject: Re: [PATCH v4 2/7] mm: multi-gen LRU: Have secondary MMUs participate
 in aging
From: Sean Christopherson <seanjc@google.com>
To: Yu Zhao <yuzhao@google.com>
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
Cc: James Houghton <jthoughton@google.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, Raghavendra Rao Ananta <rananta@google.com>, linux-riscv@lists.infradead.org, Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Anup Patel <anup@brainfault.org>, Huacai Chen <chenhuacai@kernel.org>, David Rientjes <rientjes@google.com>, Zenghui Yu <yuzenghui@huawei.com>, Axel Rasmussen <axelrasmussen@google.com>, linux-mips@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>, Ryan Roberts <ryan.roberts@arm.com>, Will Deacon <will@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Bibo Mao <maobibo@loongson.cn>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, David Matlack <dmatlack@google.com>, Palmer Dabbelt <palmer@
 dabbelt.com>, linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, Ankit Agrawal <ankita@nvidia.com>, Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, kvm-riscv@lists.infradead.org, Marc Zyngier <maz@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, Tianrui Zhao <zhaotianrui@loongson.cn>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, May 29, 2024, Yu Zhao wrote:
> On Wed, May 29, 2024 at 3:59=E2=80=AFPM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > On Wed, May 29, 2024, Yu Zhao wrote:
> > > On Wed, May 29, 2024 at 12:05=E2=80=AFPM James Houghton <jthoughton@g=
oogle.com> wrote:
> > > >
> > > > Secondary MMUs are currently consulted for access/age information a=
t
> > > > eviction time, but before then, we don't get accurate age informati=
on.
> > > > That is, pages that are mostly accessed through a secondary MMU (li=
ke
> > > > guest memory, used by KVM) will always just proceed down to the old=
est
> > > > generation, and then at eviction time, if KVM reports the page to b=
e
> > > > young, the page will be activated/promoted back to the youngest
> > > > generation.
> > >
> > > Correct, and as I explained offline, this is the only reasonable
> > > behavior if we can't locklessly walk secondary MMUs.
> > >
> > > Just for the record, the (crude) analogy I used was:
> > > Imagine a large room with many bills ($1, $5, $10, ...) on the floor,
> > > but you are only allowed to pick up 10 of them (and put them in your
> > > pocket). A smart move would be to survey the room *first and then*
> > > pick up the largest ones. But if you are carrying a 500 lbs backpack,
> > > you would just want to pick up whichever that's in front of you rathe=
r
> > > than walk the entire room.
> > >
> > > MGLRU should only scan (or lookaround) secondary MMUs if it can be
> > > done lockless. Otherwise, it should just fall back to the existing
> > > approach, which existed in previous versions but is removed in this
> > > version.
> >
> > IIUC, by "existing approach" you mean completely ignore secondary MMUs =
that
> > don't implement a lockless walk?
>=20
> No, the existing approach only checks secondary MMUs for LRU folios,
> i.e., those at the end of the LRU list. It might not find the best
> candidates (the coldest ones) on the entire list, but it doesn't pay
> as much for the locking. MGLRU can *optionally* scan MMUs (secondary
> included) to find the best candidates, but it can only be a win if the
> scanning incurs a relatively low overhead, e.g., done locklessly for
> the secondary MMU. IOW, this is a balance between the cost of
> reclaiming not-so-cold (warm) folios and that of finding the coldest
> folios.

Gotcha.

I tend to agree with Yu, driving the behavior via a Kconfig may generate si=
mpler
_code_, but I think it increases the overall system complexity.  E.g. distr=
os
will likely enable the Kconfig, and in my experience people using KVM with =
a
distro kernel usually aren't kernel experts, i.e. likely won't know that th=
ere's
even a decision to be made, let alone be able to make an informed decision.

Having an mmu_notifier hook that is conditionally implemented doesn't seem =
overly
complex, e.g. even if there's a runtime aspect at play, it'd be easy enough=
 for
KVM to nullify its mmu_notifier hook during initialization.  The hardest pa=
rt is
likely going to be figuring out the threshold for how much overhead is too =
much.
