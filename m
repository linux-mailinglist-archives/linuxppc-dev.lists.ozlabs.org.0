Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E95E96A0F63
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 19:24:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PN1dx5cCDz3cgp
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 05:24:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bYsrefng;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flex--seanjc.bounces.google.com (client-ip=2607:f8b0:4864:20::104a; helo=mail-pj1-x104a.google.com; envelope-from=3pa_3ywykdkaseanjcgoogle.comlinuxppc-devlists.ozlabs.org@flex--seanjc.bounces.google.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20210112 header.b=bYsrefng;
	dkim-atps=neutral
Received: from mail-pj1-x104a.google.com (mail-pj1-x104a.google.com [IPv6:2607:f8b0:4864:20::104a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PN1cy6F6zz3cQ0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 05:24:00 +1100 (AEDT)
Received: by mail-pj1-x104a.google.com with SMTP id x63-20020a17090a6c4500b00237731465feso536471pjj.8
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Feb 2023 10:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cPNG5uIkry6SPqM4BN2SEB/cHBlElEpC9OaRo7SwP1M=;
        b=bYsrefngLcy0tfHlns6aMlsdH2oIXTPT7lCylB/IL5DVPx4RFU9eL+p5YVECAPtS2s
         usebFCow9QCqMP5Aq02575uRXKS0mk//xQRfDBsRpRdC2zmDEyg2ryuBNb/sp+DPWgwF
         VuLa1AcmuUwAE3iCUPltPHtYeTAZILzvYPi2vnJHhG0/8yhA2WDigL3Zx02Bro1ht/wk
         s8xh5/L//ScWeIcEScF2iwWK8oEw3PkhR9lUeMjlbwQX3a8MxONyGn4ttyjC8lyqJYZ/
         JY6qaBvtT0VySspOSF5NLPqjE3eDxO/SX5MhEIUMI9EksUAeRqergYUfiuOc1l/z/1f1
         4c7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=cPNG5uIkry6SPqM4BN2SEB/cHBlElEpC9OaRo7SwP1M=;
        b=F1vwLqfI5pryeOwZTKjAWvo+C9E7FkUrFm9Nocmquw5N0i5LqRL6+UOYvEyyuc0Pww
         k3q5tec225/Psr306mC7GAqslcHU4WrxCORbNSTvq/i7C25Zji0xkKgDy7fe1u4lsL6h
         7CNuh3HjYVWZP4JSixKpTUg/mUHVMRVkVYrlmHHJyO95+kIKJv2yFK/lGO28wWztm/0Z
         sP4E1luIFUE0FduHI8TaVbsbP774NDKjBFkB7rsoITnrEVBaA2TiBXsAKwwIW3/ZNObw
         nM73GscqziuD3/C7ntbCoMoa5eNM4EgZ9oXtRDsEaAs6onwa/JIBslXmWvEllz26qhiT
         6x2Q==
X-Gm-Message-State: AO0yUKWD3W6WV4zyup07chqlFUUErgVSNIWiy8I+GV9OZZQ1E5cv5Tyf
	xbewOXj3ihm8sIoAJd8kFYTjkvAh9us=
X-Google-Smtp-Source: AK7set/qgsnXlcUCBL6IPFbm1InDpYCFgJKykWmAkZmrH7WbhMO1WH0I80dbu7seLELSE2a0nC1NZ0yIDIg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:aa7:8a53:0:b0:593:dc61:2161 with SMTP id
 n19-20020aa78a53000000b00593dc612161mr1985673pfa.2.1677176637799; Thu, 23 Feb
 2023 10:23:57 -0800 (PST)
Date: Thu, 23 Feb 2023 10:23:56 -0800
In-Reply-To: <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
Mime-Version: 1.0
References: <20230217041230.2417228-1-yuzhao@google.com> <20230217041230.2417228-3-yuzhao@google.com>
 <Y++q/lglE6FJBdjt@google.com> <CAOUHufaK-BHdajDZJKjn_LU-gMkUTKa_9foMB8g-u9DyrVhPwg@mail.gmail.com>
 <Y/ed0XYAPx+7pukA@google.com> <CAOUHufYw9Mc-w1E-Jkqnt869bVJ0AxOB5_grSEMcdMdDODDdCw@mail.gmail.com>
Message-ID: <Y/evPJg9gvXxO1hs@google.com>
Subject: Re: [PATCH mm-unstable v1 2/5] kvm/x86: add kvm_arch_test_clear_young()
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
Cc: linux-mm@google.com, kvm@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michael Larabel <michael@michaellarabel.com>, x86@kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org, kvmarm@lists.linux.dev, Paolo Bonzini <pbonzini@redhat.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023, Yu Zhao wrote:
> On Thu, Feb 23, 2023 at 10:09=E2=80=AFAM Sean Christopherson <seanjc@goog=
le.com> wrote:
> > > I'll take a look at that series. clear_bit() probably won't cause any
> > > practical damage but is technically wrong because, for example, it ca=
n
> > > end up clearing the A-bit in a non-leaf PMD. (cmpxchg will just fail
> > > in this case, obviously.)
> >
> > Eh, not really.  By that argument, clearing an A-bit in a huge PTE is a=
lso technically
> > wrong because the target gfn may or may not have been accessed.
>=20
> Sorry, I don't understand. You mean clear_bit() on a huge PTE is
> technically wrong? Yes, that's what I mean. (cmpxchg() on a huge PTE
> is not.)
>=20
> > The only way for
> > KVM to clear a A-bit in a non-leaf entry is if the entry _was_ a huge P=
TE, but was
> > replaced between the "is leaf" and the clear_bit().
>=20
> I think there is a misunderstanding here. Let me be more specific:
> 1. Clearing the A-bit in a non-leaf entry is technically wrong because
> that's not our intention.
> 2. When we try to clear_bit() on a leaf PMD, it can at the same time
> become a non-leaf PMD, which causes 1) above, and therefore is
> technically wrong.
> 3. I don't think 2) could do any real harm, so no practically no problem.
> 4. cmpxchg() can avoid 2).
>=20
> Does this make sense?

I understand what you're saying, but clearing an A-bit on a non-leaf PMD th=
at
_just_ got converted from a leaf PMD is "wrong" if and only if the intented
behavior is nonsensical.

Without an explicit granluarity from the caller, the intent is to either (a=
) reap
A-bit on leaf PTEs, or (b) reap A-bit at the highest possible granularity. =
 (a) is
nonsensical because because it provides zero guarantees to the caller as to=
 the
granularity of the information.  Leaf vs. non-leaf matters for the life cyc=
le of
page tables and guest accesses, e.g. KVM needs to zap _only_ leaf SPTEs whe=
n
handling an mmu_notifier invalidation, but when it comes to the granularity=
 of the
A-bit, leaf vs. non-leaf has no meaning.  On KVM x86, a PMD covers 2MiB of =
GPAs
regardless of whether it's a leaf or non-leaf PMD.

If the intent is (b), then clearing the A-bit on a PMD a few cycles after t=
he PMD
was converted from leaf to non-leaf is a pointless distinction, because it =
yields
the same end result as clearing the A-bit just a few cycles earlier, when t=
he PMD
was a leaf.

Actually, if I'm reading patch 5 correctly, this is all much ado about noth=
ing,
because the MGLRU code only kicks in only for non-huge PTEs, and KVM cannot=
 have
larger mappings than the primary MMU, i.e. should not encounter huge PTEs.

On that topic, if the assumption is that the bitmap is used only for non-hu=
ge PTEs,
then x86's kvm_arch_test_clear_young() needs to be hardened to process only=
 4KiB
PTEs, and probably to WARN if a huge PTE is encountered.  That assumption s=
hould
also be documented.

If that assumption is incorrect, then kvm_arch_test_clear_young() is broken=
 and/or
the expected behavior of the bitmap isn't fully defined.
