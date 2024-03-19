Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1EE87F8A2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 09:00:22 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RbR7nSoD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzPKH6b6Zz3dVj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 19:00:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=RbR7nSoD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::436; helo=mail-pf1-x436.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzPJY5Q3Kz3cCr
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 18:59:40 +1100 (AEDT)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-6e46dcd8feaso3054061b3a.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 Mar 2024 00:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710835175; x=1711439975; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/fQl+aBLc/vpQz7SyONYn8N3lgkZT1awNMICSaZyEFc=;
        b=RbR7nSoDGi4qQTlncnbAMmnP7mynp7ZWa0AJ39aH6WgiooOHRP9Dhby5epWOEam1Py
         QtoDAiiRyiDGlZOKpwX+em7KOClpymFmu+wiiK7Fuh9XtTvuwQOTt5pWlRImfw3zhaRs
         7sPqs8ZEYaS5iuk8TDRl1WfX7uyxT20JvG8895RCaZTBX/YcDiXWcmvDIOx3HG5GGlEl
         ZpARy8/cvEB58QxLskLpc+LwvmvX3fUQgkKPujNhoZ4Sc64cLABFouRAYWgu7NV91dLW
         ZpnhSDygUHMwnG5OWdlmDIQCPvANz1Hz0R3U0chmEYlsEYkgvV5mdIsVh7G6oR2Q4vhZ
         jLug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710835175; x=1711439975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/fQl+aBLc/vpQz7SyONYn8N3lgkZT1awNMICSaZyEFc=;
        b=CEZZG7cQ/m2LOAoMvlKB2Aa0gMt7Fky4zKcrShUsgj8r8SYgDQwRHNZ1XQUYnFJZHl
         zn22PWKp0ofKFb41ANH0nFTxSKljMKKSQN8JMfWz+d/MgLjRDuNuYATMFRI2XBILIvoW
         f6ZvE8Z5HlkjkoqANd3UPHtdNNy3JA9mbjZw54Icmm8yYmeEkxHDhYgfxSwNvUNUXb5v
         oGpVIBjNGG1i98eu/6UH5iUt9S53ei+xnNRztsJyP6f4QdH7PEUj99ZGrWeIq6eUtMRY
         +pVC6VKTDZhBFXtPhxGd3NF9Z9WzXCsfnLx8vemUbb4feh2fQ1jIqhcLuSik6Zg1rYX1
         1rVw==
X-Forwarded-Encrypted: i=1; AJvYcCV3jdYoL3D8OpXMPYDgVm8llbO6Ah7DDGt85p28/oMLj4b2uSswiLicbxzaq3jG07WSBm3XmXp4XWuFne4bxUf7iBD8MW6ZvjucyNu3/Q==
X-Gm-Message-State: AOJu0Yz1ETC6rS2IElFSmzegFYXMkLDJsG84QDeYg6rFAHRUHEHcLANR
	xrU2w62xOuO95imu5ZkZPPhjrfX9SXR+yrsZmxF1ljyi/9tCt02h
X-Google-Smtp-Source: AGHT+IEXcaZ+nCpbskQUwrx6BQ/MLiJbPCS2B1Ghxjxr9Qzo0j0OmbjqEbdMoyNbFA/iW3gLzs4tgg==
X-Received: by 2002:a05:6a00:1a88:b0:6e6:ce9e:fed0 with SMTP id e8-20020a056a001a8800b006e6ce9efed0mr2243761pfv.27.1710835175445;
        Tue, 19 Mar 2024 00:59:35 -0700 (PDT)
Received: from wheely.local0.net (193-116-208-39.tpgi.com.au. [193.116.208.39])
        by smtp.gmail.com with ESMTPSA id q23-20020a62ae17000000b006e5c464c0a9sm9121283pff.23.2024.03.19.00.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 00:59:35 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v7 00/35] migration, powerpc improvements
Date: Tue, 19 Mar 2024 17:58:51 +1000
Message-ID: <20240319075926.2422707-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>, Paolo Bonzini <pbonzini@redhat.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tree here
https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc?ref_type=heads

Sorry I lost the v6 tag on the previous series. Since then,
I merged the series with the migration ones since they touch
the same things.

Addressed almost all comments since the last post, I think just
one case where a "elif kvm" branch was kept in the powerpc/run
script because I find it convenient to add KVM specific things
there if needed.

Main changes since v6 (thanks to reviewers):
- Rebased on new stack backtrace patches, and cherry picks
  from v6.
- Move new files to SPDX headers.
- Improve comments on and simplify interrupt stack frame and
  backtracing.
- Add a docs/ directory with unittests.cfg documentation
  deduplicated from arch code and moved there, and document
  new machine= option. Not exactly 1:1 move of comments, so
  suggestions and improvements welcome there.
- Made new shell script a bit more consistent with style. I
  do have shellcheck working and some patches started, btw.,
  will look at submitting that after this series.
- Fix up a few unittests and gitlab CI to avoid failing on the
  QEMU TCG migration bug. Reduced runtime of some of the new
  migration tests.

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
 common/memory-verify.c                   |  67 +++
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
 lib/powerpc/mmu.c                        | 274 ++++++++++
 lib/powerpc/opal-calls.S                 |  50 ++
 lib/powerpc/opal.c                       |  76 +++
 lib/powerpc/processor.c                  |  91 +++-
 lib/powerpc/rtas.c                       |  81 ++-
 lib/powerpc/setup.c                      | 159 +++++-
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
 powerpc/pmu.c                            | 336 ++++++++++++
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
 99 files changed, 4729 insertions(+), 657 deletions(-)
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
2.42.0

