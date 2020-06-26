Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 627AD20BB36
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Jun 2020 23:12:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49tqMx630lzDqkS
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jun 2020 07:12:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=flex--brendanhiggins.bounces.google.com
 (client-ip=2607:f8b0:4864:20::549; helo=mail-pg1-x549.google.com;
 envelope-from=3a2t2xg4kakidtgpfcpjkiikpuiqqing.eqo@flex--brendanhiggins.bounces.google.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256
 header.s=20161025 header.b=lnctVzA6; dkim-atps=neutral
Received: from mail-pg1-x549.google.com (mail-pg1-x549.google.com
 [IPv6:2607:f8b0:4864:20::549])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49tqJV4zxwzDr0m
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Jun 2020 07:09:26 +1000 (AEST)
Received: by mail-pg1-x549.google.com with SMTP id v15so7492200pgi.3
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 Jun 2020 14:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=yoOABEWG1/6h2iOQDoaXra3teAZCdH+g3IIeVI61zqU=;
 b=lnctVzA6Jf/UU0td8ovSYbI8I4nDkekzGOb/PJTTsaZY6zqu5N5ZjWDd4YDayRX+Ov
 mjTvKPepzFqMBoF606g4y4X/150dujV+9wnwuvpZVFCMfwiXOdJp/tK7t1PRsv8gCr8y
 5SZtgb3I8tPyj2j3PXdYTUEHH9wNAX77svB/vS8vPnb5mMH0Z0CXiK81tdR4FdLoHv0f
 pJg1ZG9FQkUneT3PgQmDKjNHeIr2cIfameUdzQz90+lZLEl3KLRlZ8kh8zlnmst756zz
 LisdpllMi++KsnD4cFidh3dMP2W5bJ9jjhgS7+HvlBEP/fUGoTFg/tSAaGY8WT0mUfwL
 btUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=yoOABEWG1/6h2iOQDoaXra3teAZCdH+g3IIeVI61zqU=;
 b=NoFEmaorhiL0W7a/qlQhY07hBUiylIsILvD9QtEOhKyh0wgGh7/8Twfl3XOpm3i2vV
 7bT1ah5oBXgwjC1RJ+UWQvs7ug5yF1Ko87/L4rmZ/4dimKgWEC/cxxlRP2QkROyZNGY6
 luNUAOdIE9itMsX3AT9Cmy/vFG3Eq+lt3a8Ac+FXQGSKiX0rNDdUyw/aRRcXsQPwZUqC
 ay5rwPUi0QS+gW44AUi6npIIUt7vaeVLM5PJI4d6zLpIhEJ2KMMxPzvkls1Dq6VtMAS9
 rlxmfjc9d3N9KmjZPnsyI2QqjMJuGVGqK2NqyuNRChiZGfkkWN+/SJtLYNxDZWhD4jES
 a0rA==
X-Gm-Message-State: AOAM532K/Wle1njuR++Egkk1Zl3pj9Kme2f8/ufXiUOpxspv3kctYUCr
 NsjAFvqkQ6eTGqKlmx5pcMghylvuqSVkT+4199t3+A==
X-Google-Smtp-Source: ABdhPJzOkuCMJcWBTIQFtPbukWtzW86GMVGbL6qXJmvDDdcWRcAfYZDZf3JuQ+iDFThI6ZaHADTtDBKoYShd/uVlWE2ElA==
X-Received: by 2002:a62:196:: with SMTP id 144mr4487477pfb.316.1593205763212; 
 Fri, 26 Jun 2020 14:09:23 -0700 (PDT)
Date: Fri, 26 Jun 2020 14:09:05 -0700
Message-Id: <20200626210917.358969-1-brendanhiggins@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
Subject: [PATCH v5 00/12] kunit: create a centralized executor to dispatch all
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

## What am I trying to do?

Conceptually, I am trying to provide a mechanism by which test suites
can be grouped together so that they can be reasoned about collectively.
The last two of three patches in this series add features which depend
on this:

PATCH 09/12 Prints out a test plan[1] right before KUnit tests are run;
            this is valuable because it makes it possible for a test
            harness to detect whether the number of tests run matches
            the number of tests expected to be run, ensuring that no
            tests silently failed. The test plan includes a count of
            tests that will run. With the centralized executor, the
            tests are located in a single data structure and thus can be
            counted.

PATCH 10/12 Add a new kernel command-line option which allows the user
            to specify that the kernel poweroff, halt, or reboot after
            completing all KUnit tests; this is very handy for running
            KUnit tests on UML or a VM so that the UML/VM process exits
            cleanly immediately after running all tests without needing
            a special initramfs. The centralized executor provides a
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
 - Fixed a compilation error in the centralized executor patch (07/12).
   I had forgotten to test the patches when building as modules. I
   verified that works now.
 - I accidentally merged patches 09/12 and 10/12 in the previous
   revision (v4), and made them separate patches again.

## Changes since v3:
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
   documentation patch (11/12).
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

David Gow (1):
  kunit: Add 'kunit_shutdown' option

 .../admin-guide/kernel-parameters.txt         |   8 ++
 Documentation/dev-tools/kunit/usage.rst       |   5 ++
 arch/arm64/kernel/vmlinux.lds.S               |   3 +
 arch/microblaze/kernel/vmlinux.lds.S          |   4 +
 arch/powerpc/kernel/vmlinux.lds.S             |   4 +
 arch/um/include/asm/common.lds.S              |   4 +
 arch/xtensa/kernel/vmlinux.lds.S              |   4 +
 include/asm-generic/vmlinux.lds.h             |   8 ++
 include/kunit/test.h                          |  76 +++++++++++++-----
 init/main.c                                   |   4 +
 lib/kunit/Makefile                            |   3 +-
 lib/kunit/executor.c                          |  63 +++++++++++++++
 lib/kunit/test.c                              |  13 +--
 tools/testing/kunit/kunit_kernel.py           |   2 +-
 tools/testing/kunit/kunit_parser.py           |  74 ++++++++++++++---
 .../test_is_test_passed-all_passed.log        | Bin 1562 -> 1567 bytes
 .../test_data/test_is_test_passed-crash.log   | Bin 3016 -> 3021 bytes
 .../test_data/test_is_test_passed-failure.log | Bin 1700 -> 1705 bytes
 18 files changed, 227 insertions(+), 48 deletions(-)
 create mode 100644 lib/kunit/executor.c

These patches are available for download with dependencies here:

https://kunit-review.googlesource.com/c/linux/+/3829

[1] https://github.com/isaacs/testanything.github.io/blob/tap14/tap-version-14-specification.md#the-plan
[2] https://patchwork.kernel.org/patch/11383635/

base-commit: 4333a9b0b67bb4e8bcd91bdd80da80b0ec151162
prerequisite-patch-id: 2d4b5aa9fa8ada9ae04c8584b47c299a822b9455
prerequisite-patch-id: 582b6d9d28ce4b71628890ec832df6522ca68de0
-- 
2.27.0.212.ge8ba1cc988-goog

