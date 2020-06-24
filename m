Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6932A207E30
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jun 2020 23:12:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49sbSF60KMzDqkk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 07:11:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::b4a; helo=mail-yb1-xb4a.google.com;
 envelope-from=3yl7zxg4kakkkanwmjwqrpprwbpxxpun.lxv@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=igHQvbvp; dkim-atps=neutral
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com
 [IPv6:2607:f8b0:4864:20::b4a])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49sb8X3YGczDqVx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 06:58:13 +1000 (AEST)
Received: by mail-yb1-xb4a.google.com with SMTP id s90so3576716ybi.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jun 2020 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=z9RsMjfeXSae3iGDejA5AkwFlm1N1ZEabjVKLWLCH5k=;
 b=igHQvbvp05csXRFVNMsKy1ZebRhTuY3NP+zZ2HjV0T+/gI+jb+eKqCp93ukxeHPtVx
 vKexLly0v1uOT9X2cqIVd+g6jyd+7RTziC3rFr14BBMqIOg5QQKxu00/Rn339E+lmS/5
 2xB33r447ROtLvWtq74Kg2n1OtxOnNYLbuojY+vL3V53NhRkZBTuGh6xp0FRtIwngav9
 4hjWt/Vw8CwOzsDdviIQKbzX77bVV+KJXcjugw+Qa7sObPC9NZF7GUxIUSRc4G/re9eu
 nUorVxhww/S4gHa/YjkivVv2X0BStXm8mnwiQDOR/mq56sH+aMHCVSs/MvxaO0a+pOAO
 pr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=z9RsMjfeXSae3iGDejA5AkwFlm1N1ZEabjVKLWLCH5k=;
 b=f3RmQ/UO0cMT1w+1EBFNWV0fytX9+GRUP4Wp/kO0qOVlegMIpQGPODp9bkt3OTcGkw
 4WwEavm0o4CtjCdJd3nm+p33zwef8P9F+AhuXPL2s+/H7ocVN9jAO59+c7nKYbWTnh0F
 kbtJkptMeEkGkfopLPsjNxo9H0+NBtQ01yYW1sENi1E120K6c3v3uN/g2GprthFl6C4k
 TPJ8fFcc1DGsThP92vUcjGqN8imGJ2SkErYpCXdnuBfkKoeTmLexMqpXbMkmJkqn4GG/
 mgBpAYV35Iy0MYNhgQsuCK9t3vlmI95TPVSt531wEwdtATQmz5oP7zsxgPY64a9n0FLS
 gMhQ==
X-Gm-Message-State: AOAM531IIkO9vjO9yGKMaYCRujUgclv0QVqc4kIe7I2hkPeowF9D7LYM
 HjqiEKHPV0dh7bsrD8VFC6rVnZuEVJ+xRT+CHjo1eg==
X-Google-Smtp-Source: ABdhPJwbCCxlHAdc2b6DVi9T8MLEsrJ1Mw0re6va2SY63A6gZs31gniWqbvj3OZKwy9TJdgHL9Ts4hghLYRC1CcMQOZgFg==
X-Received: by 2002:a25:9345:: with SMTP id g5mr46614006ybo.485.1593032288632; 
 Wed, 24 Jun 2020 13:58:08 -0700 (PDT)
Date: Wed, 24 Jun 2020 13:55:39 -0700
Message-Id: <20200624205550.215599-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v4 00/11] kunit: create a centralized executor to dispatch all
 KUnit tests
From: Brendan Higgins <brendanhiggins@google.com>
To: jdike@addtoit.com, richard@nod.at, anton.ivanov@cambridgegreys.com, 
 arnd@arndb.de, keescook@chromium.org, skhan@linuxfoundation.org, 
 alan.maguire@oracle.com, yzaikin@google.com, davidgow@google.com, 
 akpm@linux-foundation.org, rppt@linux.ibm.com, frowand.list@gmail.com, 
 catalin.marinas@arm.com, will@kernel.org, monstr@monstr.eu, 
 mpe@ellerman.id.au, benh@kernel.crashing.org, paulus@samba.org, 
 chris@zankel.net, jcmvbkbc@gmail.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 25 Jun 2020 07:08:14 +1000
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
Cc: linux-arch@vger.kernel.org, linux-xtensa@linux-xtensa.org,
 linux-doc@vger.kernel.org, sboyd@kernel.org, gregkh@linuxfoundation.org,
 linuxppc-dev@lists.ozlabs.org, linux-um@lists.infradead.org,
 linux-kernel@vger.kernel.org, Brendan Higgins <brendanhiggins@google.com>,
 mcgrof@kernel.org, linux-kselftest@vger.kernel.org, logang@deltatee.com,
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

## TL;DR

This patchset adds a centralized executor to dispatch tests rather than
relying on late_initcall to schedule each test suite separately along
with a couple of new features that depend on it.

Also, sorry for the extreme delay in getting this out. Part of the delay
came from finding that there were actually several architectures that
the previous revision of this patchset didn't work on, so I went through
and attempted to test this patchset on every architecture - more on that
later.

## What am I trying to do?

Conceptually, I am trying to provide a mechanism by which test suites
can be grouped together so that they can be reasoned about collectively.
The last two of three patches in this series add features which depend
on this:

PATCH 8/11 Prints out a test plan[1] right before KUnit tests are run;
           this is valuable because it makes it possible for a test
           harness to detect whether the number of tests run matches the
           number of tests expected to be run, ensuring that no tests
           silently failed. The test plan includes a count of tests that
           will run. With the centralized executor, the tests are
           located in a single data structure and thus can be counted.

PATCH 9/11 Add a new kernel command-line option which allows the user to
           specify that the kernel poweroff, halt, or reboot after
           completing all KUnit tests; this is very handy for running
           KUnit tests on UML or a VM so that the UML/VM process exits
           cleanly immediately after running all tests without needing a
           special initramfs. The centralized executor provides a
           definitive point when all tests have completed and the
           poweroff, halt, or reboot could occur.

In addition, by dispatching tests from a single location, we can
guarantee that all KUnit tests run after late_init is complete, which
was a concern during the initial KUnit patchset review (this has not
been a problem in practice, but resolving with certainty is nevertheless
desirable).

Other use cases for this exist, but the above features should provide an
idea of the value that this could provide.

## Changes since last revision:
 - On the last revision I got some messages from 0day that showed that
   this patchset didn't work on several architectures, one issue that
   this patchset addresses is that we were aligning both memory segments
   as well as structures in the segments to specific byte boundaries
   which was incorrect.
 - The issue mentioned above also caused me to test on additional
   architectures which revealed that some architectures other than UML
   do not use the default init linker section macro that most
   architectures use. There are now several new patches (2, 3, 4, and
   6).
 - Fixed a formatting consistency issue in the kernel params
   documentation patch (9/9).
 - Add a brief blurb on how and when the kunit_test_suite macro works.

## Remaining work to be done:

The only architecture for which I was able to get a compiler, but was
apparently unable to get KUnit into a section that the executor to see
was m68k - not sure why.

Alan Maguire (1):
  kunit: test: create a single centralized executor for all tests

Brendan Higgins (10):
  vmlinux.lds.h: add linker section for KUnit test suites
  arch: arm64: add linker section for KUnit test suites
  arch: microblaze: add linker section for KUnit test suites
  arch: powerpc: add linker section for KUnit test suites
  arch: um: add linker section for KUnit test suites
  arch: xtensa: add linker section for KUnit test suites
  init: main: add KUnit to kernel init
  kunit: test: add test plan to KUnit TAP format
  Documentation: Add kunit_shutdown to kernel-parameters.txt
  Documentation: kunit: add a brief blurb about kunit_test_suite

 .../admin-guide/kernel-parameters.txt         |   8 ++
 Documentation/dev-tools/kunit/usage.rst       |   5 ++
 arch/arm64/kernel/vmlinux.lds.S               |   3 +
 arch/microblaze/kernel/vmlinux.lds.S          |   4 +
 arch/powerpc/kernel/vmlinux.lds.S             |   4 +
 arch/um/include/asm/common.lds.S              |   4 +
 arch/xtensa/kernel/vmlinux.lds.S              |   4 +
 include/asm-generic/vmlinux.lds.h             |   8 ++
 include/kunit/test.h                          |  73 ++++++++++++-----
 init/main.c                                   |   4 +
 lib/kunit/Makefile                            |   3 +-
 lib/kunit/executor.c                          |  63 +++++++++++++++
 lib/kunit/test.c                              |  13 +--
 tools/testing/kunit/kunit_kernel.py           |   2 +-
 tools/testing/kunit/kunit_parser.py           |  74 +++++++++++++++---
 .../test_is_test_passed-all_passed.log        | Bin 1562 -> 1567 bytes
 .../test_data/test_is_test_passed-crash.log   | Bin 3016 -> 3021 bytes
 .../test_data/test_is_test_passed-failure.log | Bin 1700 -> 1705 bytes
 18 files changed, 226 insertions(+), 46 deletions(-)
 create mode 100644 lib/kunit/executor.c


base-commit: 4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
prerequisite-patch-id: 2d4b5aa9fa8ada9ae04c8584b47c299a822b9455
prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0

These patches are available for download with dependencies here:

https://kunit-review.googlesource.com/c/linux/+/3829

[1] https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14-specification.md#the-plan
[2] https://patchwork.kernel.org/patch/11383635/

-- 
2.27.0.212.ge8ba1cc988-goog

