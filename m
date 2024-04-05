Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9809D8997F1
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 10:36:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F053+bWM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V9sKH37sYz3vbs
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Apr 2024 19:36:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=F053+bWM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::134; helo=mail-il1-x134.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V9sJX6G4Xz3cGc
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Apr 2024 19:35:55 +1100 (AEDT)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-369acec1740so4076445ab.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 05 Apr 2024 01:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712306150; x=1712910950; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YPqlqkuTn2pg1WJojCL23EOqBn84OOPX41FJDSVyTbM=;
        b=F053+bWMMEEQ+gfRAsVLkstiMLrBvPtmvin4m5iGwQHsgcGS3XUHrR+IpceHStafxc
         6Q/4QEUoOs2OViPGDLFO4a1tyny3dM7hnO7UowAbWB4YFvB6c5rkjWZiBN5NumHLdQ3v
         1TovWI7rqQrlqVa1zJDwP9zvob64V5vD65WzmXz3Hwz6GZpuvzSYwB5wJzudgGM/ewh6
         EUei3WsgoXgNh017uzcCzC1uutTAInLNcappLRAtBQ2xN5+g9zGREyeCP0V0gytvPgTj
         slM4xmF9nZAPIA0iM92kb2aSZAztdzhZyB1sdrvxr3d1GfNvFC1KmaJQttjVBYKAg7UH
         mMjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712306150; x=1712910950;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YPqlqkuTn2pg1WJojCL23EOqBn84OOPX41FJDSVyTbM=;
        b=g/B2y7zPxYdNU+Spkl1zgI1h2lNewVAnO3nQbXI4lRDVxhwZ1SpKmJ/51mrsV0Nxk7
         rDyfj9yRbdjepMNAqrTLlj8ab5pZZasW+j4OaSNYFg2MS7X+t5t9CLL2cqF2VCowjLrs
         noPp/nW8NXxd4+Rn7WmDJfVJ2ZibTCaAttlwtaEIVsPrEp7GHO/9lIm0Qdun18ePgt8L
         VJC7VA26ZdpcVBTj6bpcvzGM4NDsswP0NgZnj5jnSibT+z4kGSChTCqtXVRNL5LxnTwI
         kjroudYuatMWZWZ9hpaDDHY+CWHrIMfSbx/sIMl00Dbb2cdFwW7PPIXblVma0WmcolY6
         uBgw==
X-Forwarded-Encrypted: i=1; AJvYcCX45kUGXt760NYg+97wfGrb8CbPCbAo8Mkuym68D6xlqeTjG7mQsjrA4rmolvzadzuBe4dtqSm8cX86CmlA4kf14yxQFTw9EV1z2J0axw==
X-Gm-Message-State: AOJu0Yx55dPeovthb8C0aEHxJKGebPW4d2Hh6e2zVEYZosALQFbzFBj1
	mTRkZovH74ldoa1L2P/thGKlxKjkHtQXQM1ZwUQe+IIF0sHymlx0
X-Google-Smtp-Source: AGHT+IGu9g2hoAix0lmz2rgzHldnXWlhNxMvhMOMaFNnMTBrql/WlGlpqQ8pWhRscBmfK5NRh4BuGA==
X-Received: by 2002:a05:6e02:3f81:b0:368:a261:5275 with SMTP id ds1-20020a056e023f8100b00368a2615275mr864843ilb.1.1712306150363;
        Fri, 05 Apr 2024 01:35:50 -0700 (PDT)
Received: from wheely.local0.net (124-169-104-130.tpgi.com.au. [124.169.104.130])
        by smtp.gmail.com with ESMTPSA id y7-20020a63de47000000b005e838b99c96sm808638pgi.80.2024.04.05.01.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 01:35:50 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v8 00/35] migration, powerpc improvements
Date: Fri,  5 Apr 2024 18:35:01 +1000
Message-ID: <20240405083539.374995-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tree here
https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc?ref_type=heads

(That tree has some shellcheck patches at the end, not in this series)

Since v7, fixed a couple of Thomas' review comments. Also added
a test for PMC5 counting vs interrupts which is broken on upstream
TCG. And a small fix for SMP+MMU (secondary stack was being allocated
in discontiguous virtual memory if they were started when MMU is
enabled on the primary) discovered while I was making a test case
for TCG TLB races (not yet included in the series).
(https://lists.gnu.org/archive/html/qemu-ppc/2024-03/msg00567.html)

Thanks,
Nick

Nicholas Piggin (35):
  arch-run: Add functions to help handle migration directives from test
  arch-run: Keep infifo open
  migration: Add a migrate_skip command
  (arm|s390): Use migrate_skip in test cases
  arch-run: Add a "continuous" migration option for tests
  gitlab-ci: Run migration selftest on s390x and powerpc
  common: add memory dirtying vs migration test
  powerpc: Fix KVM caps on POWER9 hosts
  powerpc: Fix stack backtrace termination
  powerpc: interrupt stack backtracing
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
  doc: start documentation directory with unittests.cfg doc
  scripts: allow machine option to be specified in unittests.cfg
  scripts: Accommodate powerpc powernv machine differences
  powerpc: Support powernv machine with QEMU TCG
  powerpc: Fix emulator illegal instruction test for powernv
  powerpc/sprs: Test hypervisor registers on powernv machine
  powerpc: general interrupt tests
  powerpc: Add rtas stop-self support
  powerpc: Remove broken SMP exception stack setup
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
  configure: Make arch_libdir a first-class entity
  powerpc: Remove remnants of ppc64 directory and build structure
  powerpc: gitlab CI update

 .gitlab-ci.yml                           |  26 +-
 MAINTAINERS                              |   1 -
 Makefile                                 |   2 +-
 arm/gic.c                                |  21 +-
 arm/unittests.cfg                        |  26 +-
 common/memory-verify.c                   |  68 +++
 common/selftest-migration.c              |  26 +-
 common/sieve.c                           |  15 +-
 configure                                |  58 +-
 docs/unittests.txt                       |  95 ++++
 lib/libcflat.h                           |   2 -
 lib/migrate.c                            |  37 +-
 lib/migrate.h                            |   5 +
 lib/{ppc64 => powerpc}/asm-offsets.c     |   7 +
 lib/{ppc64 => powerpc}/asm/asm-offsets.h |   0
 lib/powerpc/asm/atomic.h                 |   6 +
 lib/powerpc/asm/barrier.h                |  12 +
 lib/{ppc64 => powerpc}/asm/bitops.h      |   4 +-
 lib/powerpc/asm/hcall.h                  |   6 +
 lib/{ppc64 => powerpc}/asm/io.h          |   4 +-
 lib/powerpc/asm/mmu.h                    |  10 +
 lib/powerpc/asm/opal.h                   |  22 +
 lib/powerpc/asm/page.h                   |  65 +++
 lib/powerpc/asm/pgtable-hwdef.h          |  66 +++
 lib/powerpc/asm/pgtable.h                | 125 +++++
 lib/powerpc/asm/processor.h              |  63 +++
 lib/{ppc64 => powerpc}/asm/ptrace.h      |  22 +-
 lib/powerpc/asm/reg.h                    |  42 ++
 lib/powerpc/asm/rtas.h                   |   2 +
 lib/powerpc/asm/setup.h                  |   3 +-
 lib/powerpc/asm/smp.h                    |  50 +-
 lib/powerpc/asm/spinlock.h               |  11 +
 lib/powerpc/asm/stack.h                  |   3 +
 lib/{ppc64 => powerpc}/asm/vpa.h         |   0
 lib/powerpc/hcall.c                      |   4 +-
 lib/powerpc/io.c                         |  41 +-
 lib/powerpc/io.h                         |   6 +
 lib/powerpc/mmu.c                        | 283 ++++++++++
 lib/powerpc/opal-calls.S                 |  50 ++
 lib/powerpc/opal.c                       |  76 +++
 lib/powerpc/processor.c                  |  91 +++-
 lib/powerpc/rtas.c                       |  81 ++-
 lib/powerpc/setup.c                      | 160 +++++-
 lib/powerpc/smp.c                        | 287 ++++++++--
 lib/powerpc/spinlock.c                   |  33 ++
 lib/powerpc/stack.c                      |  53 ++
 lib/ppc64/.gitignore                     |   1 -
 lib/ppc64/asm/barrier.h                  |   9 -
 lib/ppc64/asm/handlers.h                 |   1 -
 lib/ppc64/asm/hcall.h                    |   1 -
 lib/ppc64/asm/memory_areas.h             |   6 -
 lib/ppc64/asm/page.h                     |   1 -
 lib/ppc64/asm/ppc_asm.h                  |   1 -
 lib/ppc64/asm/processor.h                |   1 -
 lib/ppc64/asm/reg.h                      |   1 -
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
 powerpc/Makefile.common                  |  85 ---
 powerpc/Makefile.ppc64                   |  27 -
 powerpc/atomics.c                        | 374 +++++++++++++
 powerpc/cstart64.S                       |  66 ++-
 powerpc/emulator.c                       |  16 +
 powerpc/interrupts.c                     | 516 ++++++++++++++++++
 powerpc/memory-verify.c                  |   1 +
 powerpc/pmu.c                            | 405 ++++++++++++++
 powerpc/run                              |  42 +-
 powerpc/selftest.c                       |   4 +-
 powerpc/sieve.c                          |   1 +
 powerpc/smp.c                            | 348 ++++++++++++
 powerpc/sprs.c                           | 659 ++++++++++++++++-------
 powerpc/timebase.c                       | 329 +++++++++++
 powerpc/tm.c                             |   4 +-
 powerpc/unittests.cfg                    | 101 +++-
 riscv/unittests.cfg                      |  26 +-
 s390x/Makefile                           |   1 +
 s390x/memory-verify.c                    |   1 +
 s390x/migration-cmm.c                    |   8 +-
 s390x/migration-skey.c                   |   4 +-
 s390x/migration.c                        |   1 +
 s390x/mvpg.c                             |   1 +
 s390x/selftest.c                         |   1 +
 s390x/unittests.cfg                      |  37 +-
 scripts/arch-run.bash                    | 116 +++-
 scripts/common.bash                      |   8 +-
 scripts/runtime.bash                     |  22 +-
 x86/pmu.c                                |   1 +
 x86/pmu_lbr.c                            |   1 +
 x86/unittests.cfg                        |  26 +-
 x86/vmexit.c                             |   1 +
 x86/vmware_backdoors.c                   |   1 +
 99 files changed, 4809 insertions(+), 657 deletions(-)
 create mode 100644 common/memory-verify.c
 create mode 100644 docs/unittests.txt
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
 delete mode 100644 lib/ppc64/asm/reg.h
 delete mode 100644 lib/ppc64/asm/rtas.h
 delete mode 100644 lib/ppc64/asm/setup.h
 delete mode 100644 lib/ppc64/asm/smp.h
 delete mode 100644 lib/ppc64/asm/spinlock.h
 delete mode 100644 lib/ppc64/asm/stack.h
 delete mode 100644 powerpc/Makefile.common
 delete mode 100644 powerpc/Makefile.ppc64
 create mode 100644 powerpc/atomics.c
 create mode 100644 powerpc/interrupts.c
 create mode 120000 powerpc/memory-verify.c
 create mode 100644 powerpc/pmu.c
 create mode 120000 powerpc/sieve.c
 create mode 100644 powerpc/smp.c
 create mode 100644 powerpc/timebase.c
 create mode 120000 s390x/memory-verify.c

-- 
2.43.0

