Return-Path: <linuxppc-dev+bounces-6077-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AACEAA304E6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Feb 2025 08:52:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YsYZ30KBdz2yN2;
	Tue, 11 Feb 2025 18:52:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2607:f8b0:4864:20::f2b"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1739260330;
	cv=none; b=Gsbp2lVjV3reg34o3HzHhhxGEJ7w25UesD9FcXOta+STJDNdM+BwPmEXQmxeBoF6ZK1jOic4iKDRX4R478gsAz2lx5OGbCaI24/sxa7w09IMWCOnM2w6DU3Ze357ff+I7jrzWmdY5lK9IuUq69Onkv4QHPNz5QfeoFdLFSfzMEInWm16A1ERT9/3+h5Wo66Oy5f9NCSArbHrvX5ejAKKOKxL8eAhJ+QVh6ZFLNbZPeYajyjyjs5+yuPZHUlOClRS+x3XJ/b8y/1kW9PGgyQ1DUxjA+gjul77vA/O3SSoGxDhWGBaCasD2HONYK6nigD7V3VXt5zAnF82ARnTXg7ZGg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1739260330; c=relaxed/relaxed;
	bh=GGlY+bkOqi5PuH8Y5QlLfcyvBOm3ntepb1OfPBLEDLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kL3l0W90LSnAcwiujoybizaoooNlouVCVUZweugnEUf4rKo8Aok7nfbQCDSgazx2/kYzHfb3rzq+yhJbhlo+DZqf/isj7/G9DqRYIzejDUMx9yFS5WQny1fQ0N2aIO6ssum+n3Wq3zLI8X4WpOxErd33YAeHhj6GyfPmH2hTH6IHB7AVS0LRv72HxWLx2FwaJrJPzDenQG+bJXPpDahbuRvapEPnZL64+uFVTxPwSh49g8j/uCOYxP5XqgMYK22+Fc3ZF2d9IGStqAaGmZFPVEkNY13TpNEuRnRGRNxALur+m4Vqih5BYSloxYY8b8ZYyaWJk6fc+oVVfDizjkjm0Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com; dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rW6J2Qnx; dkim-atps=neutral; spf=pass (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org) smtp.mailfrom=google.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20230601 header.b=rW6J2Qnx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=google.com (client-ip=2607:f8b0:4864:20::f2b; helo=mail-qv1-xf2b.google.com; envelope-from=davidgow@google.com; receiver=lists.ozlabs.org)
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YsYZ15XMtz2yDD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Feb 2025 18:52:09 +1100 (AEDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-6e436c59113so48036976d6.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Feb 2025 23:52:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739260327; x=1739865127; darn=lists.ozlabs.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GGlY+bkOqi5PuH8Y5QlLfcyvBOm3ntepb1OfPBLEDLQ=;
        b=rW6J2QnxMiLDztc8Oog9Sfa6JWh4IO1wo0F76AxAYyKqyFns/OC3Qby7QvitpUv1E1
         6tNEtY6aaEkPY0s+eitDFk7rgYxGtuDDuAr5MlHdNJnxdN+gHIlcDaAwnSEN20dd4ynA
         oEI+dU4ssIvsyW92YGlCFjkxJAUNEXuAD3zPtDbAdZQMT+/SXx9wbEsxDGUzVMKPPm63
         rcXXMQ8WwrRrpRNu+quMSK3AeHRzEjQhDEVFBhiF/ZMPUXkE5tMv/7vAKCJM+KCm6Yg4
         2PBqqj/LuBsc18YxBw28HvB6YcNtgLJULH8q0rbVoP4lWjOMFpvEnlB6eA2Wik34Goh8
         4wUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739260327; x=1739865127;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GGlY+bkOqi5PuH8Y5QlLfcyvBOm3ntepb1OfPBLEDLQ=;
        b=f4t6XiU8NVdmjmP2AdEti6ya8bmLA+K+a2mkLUcPsTdivLxmoUo060wGz7w9QFKkoa
         Y/1hADy4kojzBi/ARQc7iOfoxHidJetE11I86KTrN35ea7ZxNJc3DU8A0LUHeFRadNCX
         ukaLhPrQO/4+9tEYhG/xIXn12+T/zQfBrBpHDtpjxO4nlK5LxN8e5kvlrX5cr3S+awmG
         ZiioT60dXyT/bdYXQOPI9ME31aZf6DAJz9fNbFet2HG7yFwuMXcBCdgvmVaPyXkBbTnL
         7jITc/MZDoDW7x1sKX8NRc8788y9EDNcQ9whnvQ3vrmzFnvUeZDM2/N7zHha6k/tpMH3
         ocFA==
X-Forwarded-Encrypted: i=1; AJvYcCUseAPeZPW5VF1N5KjspSEh/r4YDujjNm482Jyh1qz/E04rydDk1wtSxOT7Mb1n4cvBKwYT1620cDHlZME=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwHSumYAU3nKJNwMg780Vhu7v9W60kMhzoq9aKYymhJnmFu5tAF
	8f7/Le3eNqxaRJxpWZ1Zw8TC/XAuy9LLYbM3z7KGl4TXdUzUrNNHz9vcqFNR/eQw/cn67zuVvmC
	6oXY7XPUYmlBSvmP4ZYsfMlRqVdCGTcxVZcEG
X-Gm-Gg: ASbGncud7ZppQeiG4qL8yHlTZVmA+7s16g++lO6UCRRq8Z6mPJDe4m2ZIVnP9zYCw0L
	hQrJ7WO+9yuKCcKOSOWNHOxaEsmW25jbHbZhDBVNq+heCrjchaQLADI4YhIvjPqnAA2g24lmO+g
	==
X-Google-Smtp-Source: AGHT+IE+yl3wzsSo4TpLqGm9Gq/Dy5uTEQZDUK/aRLj2hBWjOAdHfNwEQlC5XSZs9d0yBjJfceuKCl3XGV5VgLhlK/8=
X-Received: by 2002:ad4:5c6e:0:b0:6e2:481b:7cd9 with SMTP id
 6a1803df08f44-6e467861abdmr47390546d6.25.1739260326988; Mon, 10 Feb 2025
 23:52:06 -0800 (PST)
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
MIME-Version: 1.0
References: <20250207-bitmap-kunit-convert-v1-0-c520675343b6@gmail.com>
 <Z6eaDuXnT_rjVSNS@thinkpad> <CAMuHMdUsq_39kgBa8oanXeTzv44HuhS1e5MK7K2jxkVXQ7uWdw@mail.gmail.com>
 <bd71c705-5f57-4067-b200-fd80b98ddbc9@nvidia.com> <Z6pfomw-3LuWoQQo@thinkpad>
In-Reply-To: <Z6pfomw-3LuWoQQo@thinkpad>
From: David Gow <davidgow@google.com>
Date: Tue, 11 Feb 2025 15:51:54 +0800
X-Gm-Features: AWEUYZn44yeG9ZBzJSy3v2t1KbtFDEG3Fr63XU8HKrdi1hGCI11-cYXsuiSVW6Q
Message-ID: <CABVgOS=KZrM2dWyp1HzVS0zh7vquLxmTY2T2Ti53DQADrW+sJg@mail.gmail.com>
Subject: Re: distro support for CONFIG_KUNIT: [PATCH 0/3] bitmap: convert
 self-test to KUnit
To: Yury Norov <yury.norov@gmail.com>
Cc: John Hubbard <jhubbard@nvidia.com>, Geert Uytterhoeven <geert@linux-m68k.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nicholas Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Naveen N Rao <naveen@kernel.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Shuah Khan <shuah@kernel.org>, Kees Cook <kees@kernel.org>, 
	Muhammad Usama Anjum <usama.anjum@collabora.com>, linux-kernel@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kselftest@vger.kernel.org, Brad Figg <bfigg@nvidia.com>, 
	David Hildenbrand <david@redhat.com>, Michal Hocko <mhocko@suse.com>, Jason Gunthorpe <jgg@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-15.7 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,
	RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, 11 Feb 2025 at 04:20, Yury Norov <yury.norov@gmail.com> wrote:
>
> On Mon, Feb 10, 2025 at 11:35:48AM -0800, John Hubbard wrote:
> > On 2/9/25 11:54 PM, Geert Uytterhoeven wrote:
> > > On Sat, 8 Feb 2025 at 18:53, Yury Norov <yury.norov@gmail.com> wrote:
> > > > On Fri, Feb 07, 2025 at 03:14:01PM -0500, Tamir Duberstein wrote:
> > > > > On 7/27/24 12:35 AM, Shuah Khan wrote:
> > ...
> > > > > The crux of the argument seems to be that the config help text is taken
> > > > > to describe the author's intent with the fragment "at boot". I think
> > >
> > > IMO, "at boot" is a misnomer, as most tests can be either builtin
> > > or modular.
> >
> > Right.
> >
> > >
> > > > KUNIT is disabled in defconfig, at least on x86_64. It is also disabled
> > > > on my Ubuntu 24.04 machine. If I take your patches, I'll be unable to
> >
> > OK so I just bought a shiny new test machine, and installed one of the
> > big name distros on it, hoping they've moved ahead and bought into the kunit
> > story...
> >
> > $ grep KUNIT /boot/config-6.8.0-52-generic
> > # CONFIG_KUNIT is not set
> >
> > ...gagghh! No such luck. One more data point, in support of Yuri's complaint. :)
> >
> > >
> > > I think distros should start setting CONFIG_KUNIT=m.
> >
> > Yes they should! kunit really does have important advantages for many use
> > cases, including bitmaps here, and "CONFIG_KUNIT is not set" is the main
> > obstacle.
>
> Hi John, Geert, Tamir,
>
> Can you please explain in details which advantages KUNIT brings to
> the test_bitmap.c, find_bit_benchmark.c and other low-level tests?
>

First, I'd agree with Tamir and others who've pointed out that KUnit
is not really intended for benchmarks, so I definitely don't want to
oversell it for find_bit_benchmark.c and others (though it has been
used for benchmarks in a few cases, it's not perfect).

The main advantages of KUnit are that:
- it's already used for a bunch of lib/ tests (so quite familiar to a
number of contributors/users),
- tests can be run at boot without needing any userspace at all (if built-in),
- KUnit tests are already being automatically run as regression tests,
and it's relatively easy to run "all tests" associated with a config
- there's a whole bunch of tooling which automates configuring,
building, and running a kernel with these tests, across several
architectures
  (e.g., passing --arch arm64 or --arch m68k to automatically build
and run the tests in QEMU for those architectures)
- there's tooling to nicely print, format, and summarise the results
of any number of suites.
- and, as a result of the above, it's very quick and easy to run a
test (or whole bunch of tests) in an isolated environment.

KUnit also has very few runtime dependencies from a developer
point-of-view (python, optionally QEMU).

It is, however, less focused on the "debug a running system" case,
hence the requirement for CONFIG_KUNIT to be enabled, and the tooling
largely being focused on the "run all of the tests in UML or a VM"
case.

> I'm not strongly against moving under KUNIT's hat, but I do:
>  - respect commitment of my contributors, so I don't want to wipe git
>    history for no serious reason;

It should be possible to preserve the git history during a port,
though it admittedly will have a bunch of porting changes which make
it more difficult to navigate with git blame. But it should at least
be better than a total wipe.

>  - respect time of my testers, so no extra dependencies;

I think KUnit is a bit of a mixed bag here. In many cases, KUnit tests
can be run pretty quickly, either because the tester's environment
already has CONFIG_KUNIT enabled, or possibly under some kind of
virtualization with the tooling (either QEMU, or on x86,
User-Mode-Linux). But, as mentioned above, I'd not consider it ideal
for performance testing.

I am very sympathetic to not wanting to add a dependency here. I think
KUnit is a pretty minimal dependency as far as they go (it selects
CONFIG_GLOB and nothing else, needs no userspace, and even the tooling
only really requires python on top of the basic toolchain), but it's
definitely a further dependency for the
'test-the-currently-running-kernel' use-case.

>  - respect time of reviewers.

This is an area where I think KUnit could be an advantage, as it'd be
easy for reviewers to simply run
./tools/testing/kunit/kunit.py run bitmap
as a spot check on the code. And if they want to test on other
architectures, the --arch option can be used to do so quickly.
(And, of course, it can still be loaded as a module (or even built-in)
on a physical system or other VM, albeit with the requirement for
CONFIG_KUNIT.)



As for distros enabling CONFIG_KUNIT by default, as mentioned, my
understanding is that the Fedora/Red Hat distros are doing it, as are
some branches of Android, but I doubt anyone else is. This makes
sense: enabling CONFIG_KUNIT isn't free (though the overhead should be
very low if no test is running, just a few static branches and an
extra check in the module loader), and there's always been some
reticence (which I've shared) in enabling test features on production
kernels. So it's definitely something I was recommending against a few
years ago.

However, we've definitely made sure that CONFIG_KUNIT is less
invasive, with things like hooks being kept behind static branches,
and made the decision to have _running_ a test taint the kernel, so it
should be relatively safe to just have the framework enabled (and even
safe to have it loaded), and pretty obvious when a test is run. We've
also got a bunch of extra options to disable running tests
automatically when they're built-in/loaded, both at runtime and
compile time.

So I'd definitely be happy with other distros choosing to enable
CONFIG_KUNIT by default now: I think it's much safer than it was, and
you won't be going against the grain. But equally, I'd understand
having it disabled in production: the cost, while very small, is
nonzero.

Cheers,
-- David

