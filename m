Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1C92098BC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 05:15:44 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49slWx4GCVzDqjl
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 13:15:41 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=google.com (client-ip=2a00:1450:4864:20::343;
 helo=mail-wm1-x343.google.com; envelope-from=davidgow@google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=MAvymusA; dkim-atps=neutral
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sjZ42XwdzDqk9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 11:47:16 +1000 (AEST)
Received: by mail-wm1-x343.google.com with SMTP id j18so4001362wmi.3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8GiKIX/vStI7SGvasVqVJsOyHpxs3Ttg4NMGSmUAEW0=;
 b=MAvymusAsOY95wvaDryEZpMdHEe5FdDHdKHQ5raIzb2e6+9FbnKYcuCCjrf7BvNJ2n
 5AOvVH0ZOPGhy6H0yawAJVwZasPeYzdEFcTpbTEnoDsHD32DilL1c5O4Cb3sndxeHkFt
 voPoH9kY09KsNjxAflA41VjCtIEU6zSBS3lwRzk9ktVl43LC8fTV9Tkl0KkheIcKEBbT
 1pT5thNszSg7g1M9X/u6RSPaFEmmr4G5C6sejp1pf3Cbv+gt66qshb13i6eYr/BBBKSa
 PzvB3l6ZYjRf6NP4gYAJvyLvc5FCOn+GKFXEu2WTvwq2kL0lMvXqLdKv+TribW4YaeHj
 XT1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8GiKIX/vStI7SGvasVqVJsOyHpxs3Ttg4NMGSmUAEW0=;
 b=WSCVQJx846UopshFeUPMuqmkTEax2ZT9lnMapF9Ib4VZL2rW3qWJ/g+misvHjaH+Qo
 rRLeM293X3XerJRzROCc0bKuy57SDLkTxjF+/hnbKIIDFXJnViHfo5VU+93Wor8hZic3
 N9Rp0TGgqXHY1EViqkqWEGDNrYPt8fOZMvBDCAcmF1JPNCBFlgDhXSDdCG2EpUxFfoA9
 x+eOkKBfpcQ5eJOPHBzANij/Hwf72cGRvOf5f5zHDymND/HcCNEX1KEcqSB38qXEuxKQ
 Kfa20Qiok1Qrx/tBGJHoAFvd/KSxemgJdYZU1d1zdOKkF0LHyzVztsDAS5fQVXhHal2s
 4Vpg==
X-Gm-Message-State: AOAM532f1/DNXutAi6tdJ+ABpdLkp2BVmRTVZWqKMUVzXj5RfzjPuyLT
 ptfygSCTm9kZxuIxhGQ/kceT9qnbz4yh75yIxbHMlw==
X-Google-Smtp-Source: ABdhPJw2DZIdWwUIMDdao2bLZhuUP65zl22/umR4onGlZwaR9GVdVFEuput6SazbqmKipdF5zt6jw51yyuhYLPbCGbo=
X-Received: by 2002:a1c:750e:: with SMTP id o14mr646775wmc.86.1593049632255;
 Wed, 24 Jun 2020 18:47:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200624205550.215599-1-brendanhiggins@google.com>
In-Reply-To: <20200624205550.215599-1-brendanhiggins@google.com>
From: David Gow <davidgow@google.com>
Date: Thu, 25 Jun 2020 09:47:00 +0800
Message-ID: <CABVgOSnkYfXZ1YELsXAjA0GzCQT9YWO8x+Tssw_+avkDdBB4aw@mail.gmail.com>
Subject: Re: [PATCH v4 00/11] kunit: create a centralized executor to dispatch
 all KUnit tests
To: Brendan Higgins <brendanhiggins@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Jun 2020 13:14:01 +1000
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
Cc: "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 catalin.marinas@arm.com, jcmvbkbc@gmail.com, will@kernel.org, paulus@samba.org,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, linux-arch@vger.kernel.org,
 Richard Weinberger <richard@nod.at>, rppt@linux.ibm.com,
 Iurii Zaikin <yzaikin@google.com>, linux-xtensa@linux-xtensa.org,
 Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>,
 Jeff Dike <jdike@addtoit.com>, linux-um <linux-um@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, Shuah Khan <skhan@linuxfoundation.org>,
 linux-arm-kernel@lists.infradead.org,
 KUnit Development <kunit-dev@googlegroups.com>, chris@zankel.net,
 monstr@monstr.eu, Stephen Boyd <sboyd@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Alan Maguire <alan.maguire@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Glad this is back out there: a couple of minor nitpicks below:

On Thu, Jun 25, 2020 at 4:58 AM Brendan Higgins
<brendanhiggins@google.com> wrote:
>
> ## TL;DR
>
> This patchset adds a centralized executor to dispatch tests rather than
> relying on late_initcall to schedule each test suite separately along
> with a couple of new features that depend on it.
>
> Also, sorry for the extreme delay in getting this out. Part of the delay
> came from finding that there were actually several architectures that
> the previous revision of this patchset didn't work on, so I went through
> and attempted to test this patchset on every architecture - more on that
> later.
>
> ## What am I trying to do?
>
> Conceptually, I am trying to provide a mechanism by which test suites
> can be grouped together so that they can be reasoned about collectively.
> The last two of three patches in this series add features which depend
> on this:
>
> PATCH 8/11 Prints out a test plan[1] right before KUnit tests are run;
>            this is valuable because it makes it possible for a test
>            harness to detect whether the number of tests run matches the
>            number of tests expected to be run, ensuring that no tests
>            silently failed. The test plan includes a count of tests that
>            will run. With the centralized executor, the tests are
>            located in a single data structure and thus can be counted.
>

This appears to actually be patch 9/11.

> PATCH 9/11 Add a new kernel command-line option which allows the user to
>            specify that the kernel poweroff, halt, or reboot after
>            completing all KUnit tests; this is very handy for running
>            KUnit tests on UML or a VM so that the UML/VM process exits
>            cleanly immediately after running all tests without needing a
>            special initramfs. The centralized executor provides a
>            definitive point when all tests have completed and the
>            poweroff, halt, or reboot could occur.

This seems to have been merged into the above patch (9/11).

> In addition, by dispatching tests from a single location, we can
> guarantee that all KUnit tests run after late_init is complete, which
> was a concern during the initial KUnit patchset review (this has not
> been a problem in practice, but resolving with certainty is nevertheless
> desirable).
>
> Other use cases for this exist, but the above features should provide an
> idea of the value that this could provide.
>
> ## Changes since last revision:
>  - On the last revision I got some messages from 0day that showed that
>    this patchset didn't work on several architectures, one issue that
>    this patchset addresses is that we were aligning both memory segments
>    as well as structures in the segments to specific byte boundaries
>    which was incorrect.
>  - The issue mentioned above also caused me to test on additional
>    architectures which revealed that some architectures other than UML
>    do not use the default init linker section macro that most
>    architectures use. There are now several new patches (2, 3, 4, and
>    6).
>  - Fixed a formatting consistency issue in the kernel params
>    documentation patch (9/9).
>  - Add a brief blurb on how and when the kunit_test_suite macro works.
>
> ## Remaining work to be done:
>
> The only architecture for which I was able to get a compiler, but was
> apparently unable to get KUnit into a section that the executor to see
> was m68k - not sure why.
>
> Alan Maguire (1):
>   kunit: test: create a single centralized executor for all tests
>
> Brendan Higgins (10):
>   vmlinux.lds.h: add linker section for KUnit test suites
>   arch: arm64: add linker section for KUnit test suites
>   arch: microblaze: add linker section for KUnit test suites
>   arch: powerpc: add linker section for KUnit test suites
>   arch: um: add linker section for KUnit test suites
>   arch: xtensa: add linker section for KUnit test suites
>   init: main: add KUnit to kernel init
>   kunit: test: add test plan to KUnit TAP format
>   Documentation: Add kunit_shutdown to kernel-parameters.txt
>   Documentation: kunit: add a brief blurb about kunit_test_suite
>
>  .../admin-guide/kernel-parameters.txt         |   8 ++
>  Documentation/dev-tools/kunit/usage.rst       |   5 ++
>  arch/arm64/kernel/vmlinux.lds.S               |   3 +
>  arch/microblaze/kernel/vmlinux.lds.S          |   4 +
>  arch/powerpc/kernel/vmlinux.lds.S             |   4 +
>  arch/um/include/asm/common.lds.S              |   4 +
>  arch/xtensa/kernel/vmlinux.lds.S              |   4 +
>  include/asm-generic/vmlinux.lds.h             |   8 ++
>  include/kunit/test.h                          |  73 ++++++++++++-----
>  init/main.c                                   |   4 +
>  lib/kunit/Makefile                            |   3 +-
>  lib/kunit/executor.c                          |  63 +++++++++++++++
>  lib/kunit/test.c                              |  13 +--
>  tools/testing/kunit/kunit_kernel.py           |   2 +-
>  tools/testing/kunit/kunit_parser.py           |  74 +++++++++++++++---
>  .../test_is_test_passed-all_passed.log        | Bin 1562 -> 1567 bytes
>  .../test_data/test_is_test_passed-crash.log   | Bin 3016 -> 3021 bytes
>  .../test_data/test_is_test_passed-failure.log | Bin 1700 -> 1705 bytes
>  18 files changed, 226 insertions(+), 46 deletions(-)
>  create mode 100644 lib/kunit/executor.c
>
>
> base-commit: 4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
> prerequisite-patch-id: 2d4b5aa9fa8ada9ae04c8584b47c299a822b9455
> prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
>
> These patches are available for download with dependencies here:
>
> https://kunit-review.googlesource.com/c/linux/+/3829
>
> [1] https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14-specification.md#the-plan
> [2] https://patchwork.kernel.org/patch/11383635/
>
> --
> 2.27.0.212.ge8ba1cc988-goog
>
