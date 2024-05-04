Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ACD958BBB44
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:30:20 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IG3B/fMP;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWn7Z2947z3cDT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:30:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=IG3B/fMP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn620Dxzz30Kd
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:28:56 +1000 (AEST)
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6f28bb6d747so425098b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825732; x=1715430532; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xn4ezSDHOhf2aKKwmztM6YSNcy7Szv8mxSVuwHNvyBM=;
        b=IG3B/fMPB7iDJIaotaLm22E/ZYyEKlfV/6Ur09BZMmJatcEhHxoOmvHfhkgpUJKZHC
         iYycZgJUKaVyU6jEiOGOTCkSXsE87N4UCOpIvVKc6HUEzaK8ZlgzWPHBNYV3tLwe/N0T
         VfqWEPDlkZ9i98xZkNUFnASgqD2dPlu/ZQP/re6k9ggxj5tahwf9DJ7SdNby6iZMlvbU
         78xP09TuKGf916KBsOtTWEXfW3Uo/Tg5i0LNYDU28BBVdLN0jQyzgnLCV4gaSwtN44Mv
         LX1j9XesQ1/sNqFrsmm43CcCJU67m0HXa0fES69AaiaahgfaF/ibCyjx4K8SpzTx7TEu
         Bytw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825732; x=1715430532;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xn4ezSDHOhf2aKKwmztM6YSNcy7Szv8mxSVuwHNvyBM=;
        b=CWwovcfI2i9mIjhX9gURZSob2tqsS4eUhrrMe3CL9bc46JzcdXLZrPh9WcgkOlj2aH
         nPGF42UhqQDD7bUTfxzMmCs+DR6zTq5hVgWyfnnQFM3/uiUgyG0dA0vgfM6qKe+pqWuw
         3R+o2cfGc0D/xLEAZ8nEcgqjR21SoHGxG7Hz6fFTFrxCkXIHNa9X4Ob6FSiO1t0lkrvs
         ykT0cvLBvr9QONKBvWxPa1D2RIG+ZEVXEVXnYu/ieMXOYiSVpdRDiHJxB0J+FV0zI4Ql
         27vhumoEHs21gjB3rb0lc59XV6wtgO4M3qBCL3CGMMTsU8crD+ewpArOFXVG/aU8qo2K
         FOzg==
X-Forwarded-Encrypted: i=1; AJvYcCWpYjqsjMoTAdY29D9Jt4Uq4hWGtx/7zu48qA+B97H/mh614MELsxB84bbLA8stW0YYh4LiLaaGK5oD+eQVsg0/jpEtrP2Iet7WljJnJw==
X-Gm-Message-State: AOJu0YxDsJ9b3LvVMOHpx0K/sbGTLJbtdRwo5FqZrPAIfGwbjPyGSBOg
	RYaAvW8r84Lt7IudEpYwB8i7Ww6j64STZ0P90aJWVFSpbP2TzyAX
X-Google-Smtp-Source: AGHT+IHOGS20krAYeoChwowN/g0FbyyWv1HZoAqitITYc/rRqsePtmaLqQPRQrtNOSXgpxA1QWAijw==
X-Received: by 2002:a05:6a20:7f96:b0:1a9:b2ee:5f72 with SMTP id d22-20020a056a207f9600b001a9b2ee5f72mr6224148pzj.36.1714825731750;
        Sat, 04 May 2024 05:28:51 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.28.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:28:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 00/31] powerpc improvements
Date: Sat,  4 May 2024 22:28:06 +1000
Message-ID: <20240504122841.1177683-1-npiggin@gmail.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, Andrew Jones <andrew.jones@linux.dev>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Tree here
https://gitlab.com/npiggin/kvm-unit-tests/-/tree/powerpc

Since v8:
- Migration improvements merged and out of series.
- Rebased on upstream.
- Did some more splitting of patches to make review easier.
- Added a new kfail option for known failures because I add a bunch
  and I don't want to remove them but also don't want them to report
  as failing the test (at least until implementations can be improved).
- Added MMU tlb invalidation tests that trigger upstream QEMU bug.
- Added tcg/kvm host detection to help known-failure reporting.
- Fixed a few fails and marked a lot of known fails.

Thanks,
Nick

Nicholas Piggin (31):
  doc: update unittests doc
  report: Add known failure reporting option
  powerpc: Mark known failing tests as kfail
  powerpc: Update unittests for latest QEMU version
  powerpc/sprs: Specify SPRs with data rather than code
  powerpc/sprs: Avoid taking PMU interrupts caused by register fuzzing
  scripts: allow machine option to be specified in unittests.cfg
  scripts: Accommodate powerpc powernv machine differences
  powerpc: Support powernv machine with QEMU TCG
  powerpc: Fix emulator illegal instruction test for powernv
  powerpc/sprs: Test hypervisor registers on powernv machine
  powerpc: general interrupt tests
  powerpc: Add rtas stop-self support
  powerpc: Remove broken SMP exception stack setup
  powerpc: Enable page alloc operations
  powerpc: add SMP and IPI support
  powerpc: Add cpu_relax
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
  powerpc: Add facility to query TCG or KVM host
  powerpc: gitlab CI update

 .gitlab-ci.yml                           |  30 +-
 MAINTAINERS                              |   1 -
 Makefile                                 |   2 +-
 common/sieve.c                           |  15 +-
 configure                                |  58 +-
 docs/unittests.txt                       |  19 +-
 lib/libcflat.h                           |   4 +-
 lib/{ppc64 => powerpc}/asm-offsets.c     |   9 +
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
 lib/powerpc/asm/processor.h              |  66 +++
 lib/{ppc64 => powerpc}/asm/ptrace.h      |  22 +-
 lib/powerpc/asm/reg.h                    |  42 ++
 lib/powerpc/asm/rtas.h                   |   2 +
 lib/powerpc/asm/setup.h                  |   3 +-
 lib/powerpc/asm/smp.h                    |  48 +-
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
 lib/powerpc/setup.c                      | 192 ++++++-
 lib/powerpc/smp.c                        | 342 ++++++++++--
 lib/powerpc/spinlock.c                   |  33 ++
 lib/{ppc64 => powerpc}/stack.c           |   0
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
 lib/ppc64/asm/stack.h                    |  11 -
 lib/report.c                             |  33 +-
 lib/s390x/io.c                           |   1 +
 lib/s390x/uv.h                           |   1 +
 lib/vmalloc.c                            |   7 +
 lib/vmalloc.h                            |   2 +
 lib/x86/vm.h                             |   1 +
 powerpc/Makefile                         | 112 +++-
 powerpc/Makefile.common                  |  86 ---
 powerpc/Makefile.ppc64                   |  28 -
 powerpc/atomics.c                        | 375 +++++++++++++
 powerpc/cstart64.S                       |  57 +-
 powerpc/emulator.c                       |  16 +
 powerpc/interrupts.c                     | 518 ++++++++++++++++++
 powerpc/mmu.c                            | 283 ++++++++++
 powerpc/pmu.c                            | 403 ++++++++++++++
 powerpc/run                              |  44 +-
 powerpc/selftest.c                       |   4 +-
 powerpc/sieve.c                          |   1 +
 powerpc/smp.c                            | 348 ++++++++++++
 powerpc/spapr_vpa.c                      |   3 +-
 powerpc/sprs.c                           | 662 ++++++++++++++++-------
 powerpc/timebase.c                       | 331 ++++++++++++
 powerpc/tm.c                             |   6 +-
 powerpc/unittests.cfg                    |  88 ++-
 s390x/mvpg.c                             |   1 +
 s390x/selftest.c                         |   1 +
 scripts/common.bash                      |   8 +-
 scripts/runtime.bash                     |  22 +-
 x86/pmu.c                                |   1 +
 x86/pmu_lbr.c                            |   1 +
 x86/vmexit.c                             |   1 +
 x86/vmware_backdoors.c                   |   1 +
 86 files changed, 4798 insertions(+), 544 deletions(-)
 rename lib/{ppc64 => powerpc}/asm-offsets.c (91%)
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
 rename lib/{ppc64 => powerpc}/stack.c (100%)
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
 create mode 100644 powerpc/mmu.c
 create mode 100644 powerpc/pmu.c
 create mode 120000 powerpc/sieve.c
 create mode 100644 powerpc/smp.c
 create mode 100644 powerpc/timebase.c

-- 
2.43.0

