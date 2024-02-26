Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A9C31867033
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 11:13:18 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hNu+yNXA;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TjxJr3QK5z3cPk
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Feb 2024 21:13:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=hNu+yNXA;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TjxJ548fKz3bT8
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 21:12:36 +1100 (AEDT)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e53f19f407so11972b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 26 Feb 2024 02:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708942353; x=1709547153; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ie2Etjd7dE2vfu3S+YH57fBhtjZAbWZwCY8cyQZx5Zo=;
        b=hNu+yNXAbuKeRQYxbWT0z5Lidv1yrmHxTWdHbIb/vfRL6det3+bgUgNo95wy2AeVHH
         4VNbDtX9Q4Z9ldbwsQgPZ+ec/iIUK0gOBQNwpbYYr9DL9wE+t1sMdTUxtaSgJjTRHbZ2
         l8SNq901r1M7oaXVQ4OKs2ynOYuzvTUkMG6uHo9Jj4um5ITywBXLK9ZqVyF8zcszvBtj
         mO3Fh1T05uzTmYT9jvOJPbRaPF9S7UvsUMSFirCMl0wHKrriQk4p82JTTfcmyNqwQXiw
         M/9G9NNAyIkIrVl7iWSMMrtHGJyhDvbKlaBPeC3BJ5pPcCXnz0XPpFXbIF2+0LA9HLs/
         tElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708942353; x=1709547153;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ie2Etjd7dE2vfu3S+YH57fBhtjZAbWZwCY8cyQZx5Zo=;
        b=QG7YCONbgr3HMwJeLbb66ya4Nz5CHIc3y1g51RgCeUkQPYgBSKwjDBSW/GaN9lfoMx
         vZibRVsm3XpQD+JZObktqj8ZmQdSf8GhoKwq3AJnBjxpYFNqNfdfPn5QXadS9Zm8cuHq
         qXOXxOwVAXloCQKG/72Go6aqg0ThwYScsCjkTKDIV7MhafoCWx6ysB+lLjbPFTG5SE5x
         r6w2P482o9U6srLVgiOeP/bq+CgG1FMM/51fs5NKmX6pICDju8XlxohtBRo0VgBcxoy3
         U1Yb6b8j/iJaArmGoecoYvYtZeWh2tnNlnGAMfhrLF4rcgDpvkDr0+jq5mwMtEvE94C6
         XIvw==
X-Forwarded-Encrypted: i=1; AJvYcCXKmeCrb8rITQQoMx1fTvenJwBFOWUP0iYuDdcwRCsLYCDfJDiVQQudTowL/NPMqh8JZmESf80x4dq9gbzRoZWoXXD2l9j16GdYvmpRlw==
X-Gm-Message-State: AOJu0YyZdPYIJLOT/uc4Nx+Y9k7FCLwcB9YxLM7tYsJxoAQhygQfk53L
	DfkNXNtcWwQn6Sy0Z6cCxqszg1oEMyxon5n+wGVa4aYi2I09OK4S
X-Google-Smtp-Source: AGHT+IE2nREndiF3/AYSv1IZTEefq/2XruzcQuQCiLQzYauQkoJx/7rtnZR4InanWf5JypfNBA8n1Q==
X-Received: by 2002:a05:6a00:320b:b0:6e4:f12c:c43e with SMTP id bm11-20020a056a00320b00b006e4f12cc43emr5102422pfb.24.1708942352959;
        Mon, 26 Feb 2024 02:12:32 -0800 (PST)
Received: from wheely.local0.net (220-235-194-103.tpgi.com.au. [220.235.194.103])
        by smtp.gmail.com with ESMTPSA id x24-20020aa784d8000000b006e463414493sm3626693pfn.105.2024.02.26.02.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 02:12:32 -0800 (PST)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH 00/32] powerpc improvements
Date: Mon, 26 Feb 2024 20:11:46 +1000
Message-ID: <20240226101218.1472843-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is the same familiar set of powerpc patches, it's taken a
while to get them merged. And unfortunately they keep growing
with fixes and new tests.

This goes on top of the previous migration and other core
patches. Full tree can be found here.

https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc?ref_type=heads

I have tried to test all combinations of KVM and TCG for P8/9/10
and powernv. There are a small number of failures, some due to
bugs in TCG, QEMU, and KVM. I don't want to drop such test cases
but xfail doesn't quite work because it will start failing if we
fix implementation to now work AFAIKS. If there is concern about
that, then maybe we could add a known-failure type of report that
can document the reason and not fail the entire group of tests.

Since last posting, this adds several fixes to the start of the
series, fixes a bunch of bugs in the SPRs and other tests that
Joel and Thomas raised.  Tidied up the new new SMP support and
fixed a couple of issues there. Added MMU, usermode support,
add atomics, timebase, PMU tests, and removes the ppc64
subdirectories.

Thanks,
Nick

Nicholas Piggin (32):
  powerpc: Fix KVM caps on POWER9 hosts
  powerpc: Fix pseries getchar return value
  powerpc: Fix stack backtrace termination
  powerpc: interrupt stack backtracing
  powerpc: Cleanup SPR and MSR definitions
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/sprs: Don't fail changed SPRs that are used by the test
    harness
  powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
  scripts: allow machine option to be specified in unittests.cfg
  scripts: Accommodate powerpc powernv machine differences
  powerpc: Support powernv machine with QEMU TCG
  powerpc: Fix emulator illegal instruction test for powernv
  powerpc/sprs: Test hypervisor registers on powernv machine
  powerpc: general interrupt tests
  powerpc: Add rtas stop-self support
  powerpc: Remove broken SMP exception stack setup
  arch-run: Fix handling multiple exit status messages
  powerpc: add SMP and IPI support
  powerpc: Permit ACCEL=tcg,thread=single
  powerpc: Avoid using larx/stcx. in spinlocks when only one CPU is
    running
  powerpc: Add atomics tests
  powerpc: Add timebase tests
  powerpc: Add MMU support
  common/sieve: Use vmalloc.h for setup_mmu definition
  common/sieve: Support machines without MMU
  powerpc: Add sieve.c common test
  powerpc: add usermode support
  powerpc: add pmu tests
  configure: Fail on unknown arch
  configure: Make arch_libdir a first-class entity
  powerpc: Remove remnants of ppc64 directory and build structure
  powerpc: gitlab CI update

 .gitlab-ci.yml                           |  16 +-
 MAINTAINERS                              |   1 -
 Makefile                                 |   2 +-
 common/sieve.c                           |  15 +-
 configure                                |  69 ++-
 lib/libcflat.h                           |   2 -
 lib/{ppc64 => powerpc}/asm-offsets.c     |   7 +
 lib/{ppc64 => powerpc}/asm/asm-offsets.h |   0
 lib/powerpc/asm/atomic.h                 |   6 +
 lib/powerpc/asm/barrier.h                |  12 +
 lib/{ppc64 => powerpc}/asm/bitops.h      |   4 +-
 lib/powerpc/asm/hcall.h                  |   6 +
 lib/{ppc64 => powerpc}/asm/io.h          |   4 +-
 lib/powerpc/asm/mmu.h                    |  10 +
 lib/powerpc/asm/opal.h                   |  22 +
 lib/powerpc/asm/page.h                   |  66 +++
 lib/powerpc/asm/pgtable-hwdef.h          |  67 +++
 lib/powerpc/asm/pgtable.h                | 126 +++++
 lib/powerpc/asm/ppc_asm.h                |   8 +-
 lib/powerpc/asm/processor.h              |  68 ++-
 lib/{ppc64 => powerpc}/asm/ptrace.h      |  22 +-
 lib/powerpc/asm/reg.h                    |  72 +++
 lib/powerpc/asm/rtas.h                   |   2 +
 lib/powerpc/asm/setup.h                  |   3 +-
 lib/powerpc/asm/smp.h                    |  50 +-
 lib/powerpc/asm/spinlock.h               |  11 +
 lib/powerpc/asm/stack.h                  |   3 +
 lib/powerpc/asm/time.h                   |   1 +
 lib/{ppc64 => powerpc}/asm/vpa.h         |   0
 lib/powerpc/hcall.c                      |   6 +-
 lib/powerpc/io.c                         |  41 +-
 lib/powerpc/io.h                         |   6 +
 lib/powerpc/mmu.c                        | 275 +++++++++
 lib/powerpc/opal-calls.S                 |  50 ++
 lib/powerpc/opal.c                       |  76 +++
 lib/powerpc/processor.c                  |  91 ++-
 lib/powerpc/rtas.c                       |  81 ++-
 lib/powerpc/setup.c                      | 159 +++++-
 lib/powerpc/smp.c                        | 287 ++++++++--
 lib/powerpc/spinlock.c                   |  32 ++
 lib/powerpc/stack.c                      |  55 ++
 lib/ppc64/.gitignore                     |   1 -
 lib/ppc64/asm/barrier.h                  |   9 -
 lib/ppc64/asm/handlers.h                 |   1 -
 lib/ppc64/asm/hcall.h                    |   1 -
 lib/ppc64/asm/memory_areas.h             |   6 -
 lib/ppc64/asm/page.h                     |   1 -
 lib/ppc64/asm/ppc_asm.h                  |   1 -
 lib/ppc64/asm/processor.h                |   1 -
 lib/ppc64/asm/rtas.h                     |   1 -
 lib/ppc64/asm/setup.h                    |   1 -
 lib/ppc64/asm/smp.h                      |   1 -
 lib/ppc64/asm/spinlock.h                 |   6 -
 lib/ppc64/asm/stack.h                    |   8 -
 lib/s390x/io.c                           |   1 +
 lib/s390x/uv.h                           |   1 +
 lib/vmalloc.c                            |   7 +
 lib/vmalloc.h                            |   2 +
 lib/x86/vm.h                             |   1 +
 powerpc/Makefile                         | 111 +++-
 powerpc/Makefile.common                  |  86 ---
 powerpc/Makefile.ppc64                   |  27 -
 powerpc/atomics.c                        | 373 +++++++++++++
 powerpc/cstart64.S                       |  78 ++-
 powerpc/emulator.c                       |  21 +-
 powerpc/interrupts.c                     | 517 +++++++++++++++++
 powerpc/pmu.c                            | 337 +++++++++++
 powerpc/run                              |  42 +-
 powerpc/selftest.c                       |   4 +-
 powerpc/sieve.c                          |   1 +
 powerpc/smp.c                            | 349 ++++++++++++
 powerpc/sprs.c                           | 678 ++++++++++++++++-------
 powerpc/timebase.c                       | 330 +++++++++++
 powerpc/tm.c                             |   4 +-
 powerpc/unittests.cfg                    |  63 ++-
 s390x/mvpg.c                             |   1 +
 s390x/selftest.c                         |   1 +
 scripts/arch-run.bash                    |   2 +-
 scripts/common.bash                      |   8 +-
 scripts/runtime.bash                     |  20 +-
 x86/pmu.c                                |   1 +
 x86/pmu_lbr.c                            |   1 +
 x86/vmexit.c                             |   1 +
 x86/vmware_backdoors.c                   |   1 +
 84 files changed, 4400 insertions(+), 541 deletions(-)
 rename lib/{ppc64 => powerpc}/asm-offsets.c (94%)
 rename lib/{ppc64 => powerpc}/asm/asm-offsets.h (100%)
 create mode 100644 lib/powerpc/asm/atomic.h
 create mode 100644 lib/powerpc/asm/barrier.h
 rename lib/{ppc64 => powerpc}/asm/bitops.h (69%)
 rename lib/{ppc64 => powerpc}/asm/io.h (50%)
 create mode 100644 lib/powerpc/asm/mmu.h
 create mode 100644 lib/powerpc/asm/opal.h
 create mode 100644 lib/powerpc/asm/page.h
 create mode 100644 lib/powerpc/asm/pgtable-hwdef.h
 create mode 100644 lib/powerpc/asm/pgtable.h
 rename lib/{ppc64 => powerpc}/asm/ptrace.h (59%)
 create mode 100644 lib/powerpc/asm/reg.h
 create mode 100644 lib/powerpc/asm/spinlock.h
 rename lib/{ppc64 => powerpc}/asm/vpa.h (100%)
 create mode 100644 lib/powerpc/mmu.c
 create mode 100644 lib/powerpc/opal-calls.S
 create mode 100644 lib/powerpc/opal.c
 create mode 100644 lib/powerpc/spinlock.c
 create mode 100644 lib/powerpc/stack.c
 delete mode 100644 lib/ppc64/.gitignore
 delete mode 100644 lib/ppc64/asm/barrier.h
 delete mode 100644 lib/ppc64/asm/handlers.h
 delete mode 100644 lib/ppc64/asm/hcall.h
 delete mode 100644 lib/ppc64/asm/memory_areas.h
 delete mode 100644 lib/ppc64/asm/page.h
 delete mode 100644 lib/ppc64/asm/ppc_asm.h
 delete mode 100644 lib/ppc64/asm/processor.h
 delete mode 100644 lib/ppc64/asm/rtas.h
 delete mode 100644 lib/ppc64/asm/setup.h
 delete mode 100644 lib/ppc64/asm/smp.h
 delete mode 100644 lib/ppc64/asm/spinlock.h
 delete mode 100644 lib/ppc64/asm/stack.h
 delete mode 100644 powerpc/Makefile.common
 delete mode 100644 powerpc/Makefile.ppc64
 create mode 100644 powerpc/atomics.c
 create mode 100644 powerpc/interrupts.c
 create mode 100644 powerpc/pmu.c
 create mode 120000 powerpc/sieve.c
 create mode 100644 powerpc/smp.c
 create mode 100644 powerpc/timebase.c

-- 
2.42.0

