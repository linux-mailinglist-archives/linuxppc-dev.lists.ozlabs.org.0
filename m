Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 317FA815970
	for <lists+linuxppc-dev@lfdr.de>; Sat, 16 Dec 2023 14:44:12 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxH3AgDs;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SsnPP6YzTz3cWZ
	for <lists+linuxppc-dev@lfdr.de>; Sun, 17 Dec 2023 00:44:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=LxH3AgDs;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SsnNY6H1Tz2ykC
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 17 Dec 2023 00:43:24 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6ce72730548so1521197b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 16 Dec 2023 05:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702734199; x=1703338999; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B+7l4pOYsT3CaviTaqKN9x/Myq8yxFLM9fmkQeR06OU=;
        b=LxH3AgDsr2gimFjOKXsLmgO7CjimatK/wPQkJ1/7b179VB9mXUoiMJ+SdtQM/bpop0
         Uc5D0XKdJaXZBhrN7CzfOhqA4DPRcJUV/YU4EYdjXcBYRT0+aZSi/+V/p4aXUSE//3Nh
         /1k5QVxvA4h5rjlF82G5AUY1l6V03c1UDm+QJl12FYX951kpsvRVOYMeJ3b/WP4bchn7
         rmDvJAIG5pP2h6hU6brySJJbcw6QReVkLWHsRg4jN+cLAz1GI6ptXbiTTyMJT/xTRRov
         llNpCkGbwd5DlAaNJWPlqCCgKMA4iOl9guWjxRw3eyT2KCSPhanGeV8kt/DBaIdZLjLa
         nmVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702734199; x=1703338999;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B+7l4pOYsT3CaviTaqKN9x/Myq8yxFLM9fmkQeR06OU=;
        b=ISPo6AloX1C86lP/f6yBJQzwzFm9Qubi1NK5TKFNJhAmYfU1EZppjLy2A1aeNZ3SzZ
         PndHqYPdhAFAXK0D6gCljCz+TJlW/keP8RevWP+n40/RtrFM8wt6pqoidM2bpVn2MYsO
         3lkF/HYtmRvTGsrJXYTrlXvYCT+QYVuRDZcBvt9xBr5hq4Ap+4VE/cU/Z65qYnmJZnzS
         +cUjBoVtMcrZl7U71I4sLvSTjFGkkRhWXXVSbj2VzBcFyxpEAYGvoHwd29SIll65bdOL
         SXafzWYFUrlivA3mJza62alGxbebm+6dbYUMv+79pgpGhfvEg2JkkD4PtidH17ns1DrT
         yx6g==
X-Gm-Message-State: AOJu0Yw9S9c9JczVLlBcRv8cN//AL1cKgGUcMi3kEeVuu+akqDJK8Ead
	1yEFewgVyt8eJTDPvwOiQsc=
X-Google-Smtp-Source: AGHT+IFImnuuEZM7gUszelAmMNRJPwf8qvl5oixScMR+P/AjXJJp1B60/5PKOvLofHshAeJQxpUrqg==
X-Received: by 2002:aa7:8390:0:b0:6d2:7294:96e7 with SMTP id u16-20020aa78390000000b006d2729496e7mr3378119pfm.62.1702734198831;
        Sat, 16 Dec 2023 05:43:18 -0800 (PST)
Received: from wheely.local0.net (203-221-42-190.tpgi.com.au. [203.221.42.190])
        by smtp.gmail.com with ESMTPSA id w2-20020a654102000000b005c65ed23b65sm12663631pgp.94.2023.12.16.05.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Dec 2023 05:43:18 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: kvm@vger.kernel.org
Subject: [kvm-unit-tests PATCH v5 00/29] powerpc: updates, P10, PNV support
Date: Sat, 16 Dec 2023 23:42:27 +1000
Message-ID: <20231216134257.1743345-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>, Nico Boehr <nrb@linux.ibm.com>, Shaoqin Huang <shahuang@redhat.com>, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This has taken quite a while to get right, but I think is getting
much better now.

There are several semi-related things here: multi-migration support,
bugfixing, adding powernv machine, expanding and adding test cases.
But I found it easiest to leave it as one series. Multi-migration I
added when testing and debugging time migration issues in QEMU, and
that has grown to quite a size, I can try to split that out if
preferred.

Since v4:
- Multi migration now seems quite solid, I haven't broken it. Arm64
  migration regression reported by Shaoqin is fixed, it was due to an exit
  status getting lost.
- Several other small migration fixes and cleanups that poppedup in
  testing.
- More complete SMP support including IPI for pseries and powernv.
- Made powernv a first-class citizen that can do run_tests.sh unit
  tests (with machine option).
- More polished, quiet warnings, skip unsupported tests, etc.
- Fix several powerpc bugs that got exposed (.got, stack backtrace,
  stack alignment).
- Added a bunch more tests I've been accumulating, atomics, smp,
  timebase, interrupts.

Note the arm64 psci cpu-on test is flakey with/without this series.

Thanks,
Nick


Nicholas Piggin (29):
  arch-run: Clean up temporary files properly
  arch-run: Clean up initrd cleanup
  migration: use a more robust way to wait for background job
  migration: Support multiple migrations
  arch-run: rename migration variables
  powerpc: Quiet QEMU TCG pseries capability warnings
  powerpc: Add a migration stress tester
  powerpc: Require KVM for the TM test
  powerpc: Fix interrupt stack alignment
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/sprs: Don't fail changed SPRs that are used by the test
    harness
  powerpc/sprs: Avoid taking async interrupts caused by register fuzzing
  powerpc: Make interrupt handler error more readable
  powerpc: Expand exception handler vector granularity
  powerpc: Add support for more interrupts including HV interrupts
  powerpc: Set .got section alignment to 256 bytes
  powerpc: Discover runtime load address dynamically
  powerpc: Fix stack backtrace termination
  scripts: allow machine option to be specified in unittests.cfg
  scripts: Accommodate powerpc powernv machine differences
  powerpc: Support powernv machine with QEMU TCG
  powerpc: Fix emulator illegal instruction test for powernv
  powerpc/sprs: Test hypervisor registers on powernv machine
  powerpc: interrupt tests
  powerpc: Add rtas stop-self support
  powerpc: add SMP and IPI support
  powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is
    running
  powerpc: Add atomics tests
  powerpc: Add timebase tests

 lib/migrate.c               |   8 +-
 lib/migrate.h               |   1 +
 lib/powerpc/asm/ppc_asm.h   |  25 ++
 lib/powerpc/asm/processor.h |  41 +++
 lib/powerpc/asm/rtas.h      |   2 +
 lib/powerpc/asm/setup.h     |   3 +-
 lib/powerpc/asm/smp.h       |  24 +-
 lib/powerpc/hcall.c         |   4 +-
 lib/powerpc/io.c            |  27 +-
 lib/powerpc/io.h            |   6 +
 lib/powerpc/processor.c     |  55 ++-
 lib/powerpc/rtas.c          |  78 ++++-
 lib/powerpc/setup.c         |  50 ++-
 lib/powerpc/smp.c           | 270 +++++++++++++--
 lib/powerpc/spinlock.c      |  28 ++
 lib/ppc64/asm/atomic.h      |   6 +
 lib/ppc64/asm/opal.h        |  20 ++
 lib/ppc64/asm/ptrace.h      |   1 +
 lib/ppc64/asm/spinlock.h    |   7 +-
 lib/ppc64/opal-calls.S      |  46 +++
 lib/ppc64/opal.c            |  76 +++++
 powerpc/Makefile.common     |   8 +-
 powerpc/Makefile.ppc64      |   2 +
 powerpc/atomics.c           | 190 +++++++++++
 powerpc/cstart64.S          | 163 +++++++--
 powerpc/emulator.c          |  19 +-
 powerpc/flat.lds            |   3 +-
 powerpc/interrupts.c        | 412 +++++++++++++++++++++++
 powerpc/migrate.c           |  64 ++++
 powerpc/run                 |  39 ++-
 powerpc/smp.c               | 199 +++++++++++
 powerpc/sprs.c              | 642 +++++++++++++++++++++++++-----------
 powerpc/timebase.c          | 328 ++++++++++++++++++
 powerpc/tm.c                |   2 +-
 powerpc/unittests.cfg       |  37 +++
 scripts/arch-run.bash       | 181 +++++++---
 scripts/common.bash         |   8 +-
 scripts/runtime.bash        |  20 +-
 38 files changed, 2736 insertions(+), 359 deletions(-)
 create mode 100644 lib/powerpc/spinlock.c
 create mode 100644 lib/ppc64/asm/atomic.h
 create mode 100644 lib/ppc64/asm/opal.h
 create mode 100644 lib/ppc64/opal-calls.S
 create mode 100644 lib/ppc64/opal.c
 create mode 100644 powerpc/atomics.c
 create mode 100644 powerpc/interrupts.c
 create mode 100644 powerpc/migrate.c
 create mode 100644 powerpc/smp.c
 create mode 100644 powerpc/timebase.c

-- 
2.42.0

