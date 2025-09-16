Return-Path: <linuxppc-dev+bounces-12292-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DDAC5B59C80
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Sep 2025 17:51:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cR5wT4LgSz30FR;
	Wed, 17 Sep 2025 01:51:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::432"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758037865;
	cv=none; b=eh1f4OiB5kzUEtqfcGZXPzHXEzh9KsrYdSzDqwUWACc4wJuFkoH3F1mXGurF9iCDgKJUmZs4bDB80sByKygZbEUGY9L7lursAa1N7fVBGsEs6WyZP28P+3NKHRnj9NtP+NDihOHDTXdGI8YrjBJohlPXa+trsLuRklGEn4Bq4bClQERDSMSFnLflU4qsrY8prlloDcZYQUJSlGBgupSK/5PR95+GL8ftVWok1UkjanM3LRVHwDgh4MDnlz51DusVwvE4j1i0UMfvRQlHAF2E7w3pHZ2wadrva3YZJ1xHMMcJzmC7He1jorcyIk81G4yA9jowl+YmAoLMMEQ7OXsekg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758037865; c=relaxed/relaxed;
	bh=XlfGJ0myBd1CUShqRIzs6Qf3uvtdbW25i4uOaLilOdg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oxNEkz5d1f+A+dtSRyfuCyuhaktFZZ6AGgDKNAACHyXFYQwRzXchFL+dW9kM5mBeLOBzts/84T7PqeAKAENKG/JElAaEeOxnl47dr2nS4NJ33CDZE/oEGRupuwJ4O0A2F4s0rpL4o5mMXL1z+5EuP6oEAObNoy4cxyHdqPJ6Ugy6aIgNXe8uxXmr4IEGHasY1vrMLjgKzdg91K3Z7253iPoOXLK27B+L/P2q+7Xqvg4tVJnMV7zztxKw/FIpw63WSpUycBYf8iMdf5KY2j/4T7Cg7hhKJRoRnKvJHW1+M/l2eXy+ObqEHez9JISYuI2rU8D+X7NdiXLEhXdu+KvxNQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org; dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hB3dPBAv; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org) smtp.mailfrom=chromium.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=hB3dPBAv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::432; helo=mail-pf1-x432.google.com; envelope-from=dianders@chromium.org; receiver=lists.ozlabs.org)
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cR5wN6gW8z2yVP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Sep 2025 01:50:59 +1000 (AEST)
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso4961362b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 08:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758037857; x=1758642657; darn=lists.ozlabs.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XlfGJ0myBd1CUShqRIzs6Qf3uvtdbW25i4uOaLilOdg=;
        b=hB3dPBAv5Wa++AywXQi4KUZGG1RXsWXgVbDy2FGxgjta6YLB7m7hZZVnGPFzrTRdl2
         Y3/jEVtrr6y625X19Ya4JIA71SMgDuHWOl294INpaXbqYCZbiyced5QWjdjiLlOgSM14
         rT7ycoh9YyvHJujX5kjZkHuvOycgrTKy0r9Jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758037857; x=1758642657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XlfGJ0myBd1CUShqRIzs6Qf3uvtdbW25i4uOaLilOdg=;
        b=mO2JIqxz5KIfBRwnOqG2rFf2hwmtn8tPVoXQ8gk1jgfPdmb+jIMlq9SfQ5xlPh4knc
         vXb8xzw3jvo0q0Kqg6KVa7XjpnbGtgKEK1TUPH6XYxKuQqWbqBPq/4A4FCdsI1ffYaLm
         DUuGIIMvQfH3pos2pSQjlFgNxLn68HbytIS4lAe3mTK/i7PJoLspBnDmoJr7tFF+8tO2
         APF7VBGbpjKe0jqw5aeYXyJOvcSc2VCmsBNsvb33LDQs0/pL1M/ZaLf4XUqqLr/ld67U
         vs/wMrKaPfP3I0BUL4BWGEOeSZsWfbp1KaUpfocvzHWY7CSZpC2QpPT26ABNzmuXcexh
         cAOQ==
X-Forwarded-Encrypted: i=1; AJvYcCXVRuio4qH++P7mwVTIsMcGWO//wZlUyhOFu4TrdQuW+qEE8UIBmVxzMPp5dD+kDmMwU8E+p1fhJ9aiVeo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0Ywj83q08DoxtypM3bJXo7/87m7ZqSYjYUsT+TSu1kcAWNkUWzMZ
	cA5IADS85BBdAK0GiWN3yEPF7uRZm5TGgAQRFrN80tGSy8cnLZqnRyrAHY6oaY2611QHiZrJAZN
	gaAQ=
X-Gm-Gg: ASbGnctJE7UTPS0E7saFWyVqOtCaHCQetj0G6lKORw44N1HA653Ks4R7lrMYDY/kvir
	fWlH2/NsflMmIzm78TOvtbrhOtvZxdkJX7JaGgn9tB52rPHKW4Galy6wa+75Z9bmyAs1uRmwWNT
	wcIhrrMNnXSZFxSxuRvunbidGv6+XoRbpgq7nSKaEJRv89E1ZPzVfHyMayhmxz54vFM/Ds4rEtX
	3hCe1kf42GoVYgfM+YePXMa6P/CW5I2M8KxhcKxqvksEKx18akwoGwbtNn5P0hsJtgkEL9SooZt
	LHVqgTeIHMx911IuF8W17ale4r7GUMPCTZunTQNwSpHoEwujo6ng2JDwEhKVqj5SVKkabryqhz0
	hAYj+rwvfAcBf9wbqf4pZ+tQqy3J8SGvsJJTupG/De2ijm51779wf2VIM7MD1XQaAyw==
X-Google-Smtp-Source: AGHT+IEcS/awrFTpv7UZ31JQG2LbL9WXfMdpr7d1j9c52G0jeVOjqs7SSLsOGhrangxHXo2RrvCIfw==
X-Received: by 2002:a05:6a00:a96:b0:772:260f:d7b1 with SMTP id d2e1a72fcca58-77612161c93mr16454396b3a.16.1758037857593;
        Tue, 16 Sep 2025 08:50:57 -0700 (PDT)
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com. [209.85.210.179])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77607a4746dsm16590884b3a.29.2025.09.16.08.50.57
        for <linuxppc-dev@lists.ozlabs.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Sep 2025 08:50:57 -0700 (PDT)
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7704f3c46ceso4961340b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Sep 2025 08:50:57 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWZb3nEWBqlP9uxBFX4cgwneeX+8ztTwTQKt//O4eHkbDAXF6pd7czKflB3UqZ4WIRqqMVm3xqv64faH9o=@lists.ozlabs.org
X-Received: by 2002:a17:903:2ec6:b0:25c:982e:2b22 with SMTP id
 d9443c01a7336-25d27134267mr159143535ad.61.1758037856437; Tue, 16 Sep 2025
 08:50:56 -0700 (PDT)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
References: <20250915035355.10846-1-cuiyunhui@bytedance.com>
 <aMfpwYPX6_i6ROOY@willie-the-truck> <20250915103506.GA3245006@noisy.programming.kicks-ass.net>
 <CAD=FV=Vr67+uRK2bYu34MDXRJN4w_VH_EO7OW4eVLJ3wqUUBog@mail.gmail.com> <20250916074217.GF3245006@noisy.programming.kicks-ass.net>
In-Reply-To: <20250916074217.GF3245006@noisy.programming.kicks-ass.net>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 16 Sep 2025 08:50:44 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com>
X-Gm-Features: AS18NWAxT21ffANYOVAuTiBZ-JCuPw16bE4J4Dn2ocVjGgCvD3aQkxhG7dvBAPs
Message-ID: <CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com>
Subject: Re: [PATCH] watchdog: remove HARDLOCKUP_DETECTOR_PERF
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Yunhui Cui <cuiyunhui@bytedance.com>, akpm@linux-foundation.org, 
	catalin.marinas@arm.com, maddy@linux.ibm.com, mpe@ellerman.id.au, 
	npiggin@gmail.com, christophe.leroy@csgroup.eu, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	acme@kernel.org, namhyung@kernel.org, mark.rutland@arm.com, 
	alexander.shishkin@linux.intel.com, jolsa@kernel.org, irogers@google.com, 
	adrian.hunter@intel.com, kan.liang@linux.intel.com, kees@kernel.org, 
	masahiroy@kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	thomas.weissschuh@linutronix.de, xur@google.com, ruanjinjie@huawei.com, 
	gshan@redhat.com, maz@kernel.org, suzuki.poulose@arm.com, 
	zhanjie9@hisilicon.com, yangyicong@hisilicon.com, gautam@linux.ibm.com, 
	arnd@arndb.de, zhao.xichao@vivo.com, rppt@kernel.org, lihuafei1@huawei.com, 
	coxu@redhat.com, jpoimboe@kernel.org, yaozhenguo1@gmail.com, 
	luogengkun@huaweicloud.com, max.kellermann@ionos.com, tj@kernel.org, 
	wangjinchao600@gmail.com, yury.norov@gmail.com, thorsten.blum@linux.dev, 
	x86@kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi,

On Tue, Sep 16, 2025 at 12:42=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> > > Yeah, this. I've run into this case waaay too many times to think it
> > > reasonable to remove the perf/NMI based lockup detector.
> >
> > I am a bit curious how this comes to be in cases where you've seen it.
> > What causes all CPUs to be stuck looping all with interrupts disabled
> > (but still able to execute NMIs)? Certainly one can come up with a
> > synthetic way to make that happen, but I would imagine it to be
> > exceedingly rare in real life. Maybe all CPUs are deadlocked waiting
> > on spinlocks or something? There shouldn't be a lot of other reasons
> > that all CPUs should be stuck indefinitely with interrupts disabled...
>
> The simplest one I often run into is rq->lock getting stuck and then all
> the other CPUs piling up on that in various ways.
>
> Getting stop_machine() stuck is also a fun one.
>
> I mean, it really isn't that hard. If, as a full time kernel dev, you
> don't get into this situation at least a few time a year, you're just
> not doing your job right ;-)

Wow, so I either suck at my job or I'm not a full time kernel dev? Ouch.


> > If that's what's happening, (just spitballing) I wonder if hooking
> > into the slowpath of spinlocks to look for lockups would help? Maybe
> > every 10000 failures to acquire the spinlock we check for a lockup?
> > Obviously you could still come up with synthetic ways to make a
> > non-caught watchdog, but hopefully in those types of cases we can at
> > least reset the device with a hardware watchdog?
>
> Now, why would I want to make the spinlock code worse if I have a
> perfectly functional NMI watchdog?

There's cost and tradeoffs everywhere. Using the perf-backed NMI
watchdog has real downsides in terms of resource and power costs.
Certainly touching the spinlock code would also have costs involved
but, at least to this poor kernel engineer it doesn't seem like a
forgone conclusion that one set of costs is better than the other.


> > Overall the issue is that it's really awkward to have both types of
> > lockup detectors, especially since you've got to pick at compile time.
>
> Well, then go fix that. Surely this isn't rocket science.

Looks like Jinchao has already sent a proposal for that.


> > The perf lockup detector has a pile of things that make it pretty
> > awkward and it seems like people have been toward the buddy detector
> > because of this...
>
> There's nothing awkward about the perf one, except that it takes one
> counter, and some people are just greedy and want all of them. At the
> same time, there are people posting patches that use the PMU for
> page-promotion like things, so these same greedy people are going to
> hate on that too.

The weird cpufreq stuff that the perf detector needs to handle is
awkward too. I suppose that plus the eating up of the perf counter
(which gets awkward when you try to virtualize) is not exactly a pile.
I think I was also remembering that people were trying to transition
away from the perf detector for power saving reasons to save the extra
wakeups/interrupts, but I guess that's not something *awkward* but
just a plain-old normal downside...


-Doug

