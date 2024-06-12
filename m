Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA7DB904ACD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 07:24:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODKNqhQV;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VzYqw4k3zz3fq0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jun 2024 15:24:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ODKNqhQV;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VzYq90vjBz3cTS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jun 2024 15:23:32 +1000 (AEST)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1f32a3b9491so47687525ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 11 Jun 2024 22:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1718169810; x=1718774610; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uklboiDlNq1iAwrNweEzsuHAT7xa1yfgd/xlZey1tHA=;
        b=ODKNqhQVQL1IjmfWundxi9C9svdXxdsR83xjNiRUurXBS/FtjCzv4lnfSbzBYMy6GC
         FZxjlLOPY+lQrKCtYwOZuareNzFPkeW8MUXB5lg4Z+jcb4wWytFUu80tDrMVWGN7MgB5
         ZSshyQdArc14PS53lL++vCEdUlT4QzAHopIxLrTMJYdIqHYAGkJGn75rVxYytc1jCvFY
         TS0o31r4GxCjbnOF5NwjHmodISG3e+7BvcEFhRIT3btPwuO/74kPnvfDMvQZxe//mHK9
         AbCxrk4jmkugiJH7aqtHuO3UHzeUS4O0y+n9Dlv6dUp1h5EkYXSeivtOzOkpOJtqcm7G
         8ePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718169810; x=1718774610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uklboiDlNq1iAwrNweEzsuHAT7xa1yfgd/xlZey1tHA=;
        b=Z2FkorZ1RaM8tjojNYL8zOj9Vxjbr2To82HAIF0U3OxtLNieWV91RmemEGW+DWjQIy
         EjevzsuWZFiQhBWyXjlOFOvGkdpo/1LOFuCo1Ss8d35JwZVbrZjMQ1zlaKiQ1ak9+3We
         8nJqQ1HBYLU0XDQHx9vnZpU8gdhQt8PiMLnqknFE3UfYcWNEMc7DynaTinddV7Pur4MH
         Gv4IDrnzMge2HX0UEa7AsD5OyiUCE0dY0bgCDP157do+nzI+haMjdQzfd3vhHxkegwRW
         aapwSzq1nPpe6QbYUeGB0Hu2i6sSNqUm1OEWDB2svK+v8Oz3aefxJAJSv9XyzOYHAwS2
         hsTw==
X-Forwarded-Encrypted: i=1; AJvYcCWKI89vuk9wydr+X6vQQHZVRSdSTjKNw4j0VmoKl3MUDKnSehNf5yE40w6JFsJWSLQddCjl3/g4ciNGTyb3f8KMYHrQI8urxZnc7SvpMw==
X-Gm-Message-State: AOJu0YyMmoaT0CK/ghwMQ5Jau9aqJR94ZGZHiFNo0wdmnzHRDhM5nxts
	7e0XCYV/1/8H9oUI2FuEVT+ee5WGcSxbOI9LeesczuQv+yFqc4y6Z9gCOA==
X-Google-Smtp-Source: AGHT+IE4vm1HhOzouG/uIh/DRBNze8adNK7qarnodBymmGDRMyM7awIkvEKZM90J4HFguoStJlqvwA==
X-Received: by 2002:a17:902:dac7:b0:1f8:3d1d:b398 with SMTP id d9443c01a7336-1f83d1db6b3mr7146505ad.19.1718169810320;
        Tue, 11 Jun 2024 22:23:30 -0700 (PDT)
Received: from wheely.local0.net (220-235-199-47.tpgi.com.au. [220.235.199.47])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd75f711sm112170705ad.11.2024.06.11.22.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Jun 2024 22:23:30 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v10 00/15] powerpc improvements
Date: Wed, 12 Jun 2024 15:23:05 +1000
Message-ID: <20240612052322.218726-1-npiggin@gmail.com>
X-Mailer: git-send-email 2.45.1
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

Since v9:
- Rebase after a good chunk of patches were merged.
- Review from Thomas:
  - TCG/KVM host query is moved to the start of the series.
  - Changelog for atomics test.
  - Dropped spinlock patch change for now.
  - Fixed tlbie assembly long lines in mmu patch.
  - Use fdt64 accessor for 64-bit dt value.
  - Upgrade powerpc gitlab CI to Fedora 40 and enable more tests
  - Several other improvements.
- Reduced some long lines.
- Fixed some SPDX headers.
- New patch for adding a panic test. s390x is the only other panic
  test user but it requires KVM so I couldn't see if run_tests.sh
  looks sane there, but the harness needed a fix to work on powerpc.

Thanks,
Nick

Nicholas Piggin (15):
  powerpc: Add facility to query TCG or KVM host
  powerpc: Add atomics tests
  powerpc: Add timebase tests
  powerpc: Add MMU support
  common/sieve: Support machines without MMU
  powerpc: Add sieve.c common test
  powerpc: add usermode support
  powerpc: add pmu tests
  configure: Make arch_libdir a first-class entity
  powerpc: Remove remnants of ppc64 directory and build structure
  powerpc: gitlab CI update
  scripts/arch-run.bash: Fix run_panic() success exit status
  powerpc: Add a panic test
  powerpc/gitlab-ci: Upgrade powerpc to Fedora 40
  powerpc/gitlab-ci: Enable more tests with Fedora 40

 .gitlab-ci.yml                           |  36 +-
 MAINTAINERS                              |   1 -
 Makefile                                 |   2 +-
 common/sieve.c                           |  14 +-
 configure                                |  63 ++-
 lib/{ppc64 => powerpc}/asm-offsets.c     |   0
 lib/{ppc64 => powerpc}/asm/asm-offsets.h |   0
 lib/{ppc64 => powerpc}/asm/atomic.h      |   0
 lib/{ppc64 => powerpc}/asm/barrier.h     |   4 +-
 lib/{ppc64 => powerpc}/asm/bitops.h      |   4 +-
 lib/powerpc/asm/hcall.h                  |   6 +
 lib/{ppc64 => powerpc}/asm/io.h          |   4 +-
 lib/powerpc/asm/mmu.h                    |  86 ++++
 lib/{ppc64 => powerpc}/asm/opal.h        |   4 +-
 lib/powerpc/asm/page.h                   |  65 +++
 lib/powerpc/asm/pgtable-hwdef.h          |  66 +++
 lib/powerpc/asm/pgtable.h                | 125 +++++
 lib/powerpc/asm/processor.h              |  15 +
 lib/{ppc64 => powerpc}/asm/ptrace.h      |   6 +-
 lib/powerpc/asm/reg.h                    |  14 +
 lib/powerpc/asm/rtas.h                   |   1 +
 lib/powerpc/asm/setup.h                  |   1 +
 lib/powerpc/asm/smp.h                    |   3 +
 lib/powerpc/asm/spinlock.h               |   6 +
 lib/powerpc/asm/stack.h                  |   3 +
 lib/{ppc64 => powerpc}/asm/vpa.h         |   0
 lib/powerpc/io.c                         |   7 +
 lib/powerpc/mmu.c                        | 260 +++++++++++
 lib/{ppc64 => powerpc}/opal-calls.S      |   4 +-
 lib/{ppc64 => powerpc}/opal.c            |   0
 lib/powerpc/processor.c                  |  47 ++
 lib/powerpc/rtas.c                       |  19 +
 lib/powerpc/setup.c                      |  61 ++-
 lib/{ppc64 => powerpc}/stack.c           |   0
 lib/ppc64/.gitignore                     |   1 -
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
 lib/vmalloc.c                            |   7 +
 lib/vmalloc.h                            |   2 +
 powerpc/Makefile                         | 111 ++++-
 powerpc/Makefile.common                  |  89 ----
 powerpc/Makefile.ppc64                   |  30 --
 powerpc/atomics.c                        | 386 ++++++++++++++++
 powerpc/interrupts.c                     | 129 +++++-
 powerpc/mmu.c                            | 225 +++++++++
 powerpc/pmu.c                            | 562 +++++++++++++++++++++++
 powerpc/run                              |   2 +-
 powerpc/selftest.c                       |  18 +-
 powerpc/sieve.c                          |   1 +
 powerpc/sprs.c                           |   2 +-
 powerpc/timebase.c                       | 350 ++++++++++++++
 powerpc/tm.c                             |   2 +-
 powerpc/unittests.cfg                    |  64 ++-
 scripts/arch-run.bash                    |   1 +
 64 files changed, 2696 insertions(+), 245 deletions(-)
 rename lib/{ppc64 => powerpc}/asm-offsets.c (100%)
 rename lib/{ppc64 => powerpc}/asm/asm-offsets.h (100%)
 rename lib/{ppc64 => powerpc}/asm/atomic.h (100%)
 rename lib/{ppc64 => powerpc}/asm/barrier.h (83%)
 rename lib/{ppc64 => powerpc}/asm/bitops.h (69%)
 rename lib/{ppc64 => powerpc}/asm/io.h (50%)
 create mode 100644 lib/powerpc/asm/mmu.h
 rename lib/{ppc64 => powerpc}/asm/opal.h (90%)
 create mode 100644 lib/powerpc/asm/page.h
 create mode 100644 lib/powerpc/asm/pgtable-hwdef.h
 create mode 100644 lib/powerpc/asm/pgtable.h
 rename lib/{ppc64 => powerpc}/asm/ptrace.h (89%)
 create mode 100644 lib/powerpc/asm/spinlock.h
 rename lib/{ppc64 => powerpc}/asm/vpa.h (100%)
 create mode 100644 lib/powerpc/mmu.c
 rename lib/{ppc64 => powerpc}/opal-calls.S (88%)
 rename lib/{ppc64 => powerpc}/opal.c (100%)
 rename lib/{ppc64 => powerpc}/stack.c (100%)
 delete mode 100644 lib/ppc64/.gitignore
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
 create mode 100644 powerpc/mmu.c
 create mode 100644 powerpc/pmu.c
 create mode 120000 powerpc/sieve.c
 create mode 100644 powerpc/timebase.c

-- 
2.45.1

