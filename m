Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B857F8BBB9D
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 14:50:40 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZoVR9kdJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VWnb20SQnz3gBT
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 May 2024 22:50:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=ZoVR9kdJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=npiggin@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VWn893THLz3cbt
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 May 2024 22:30:49 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6f447976de7so457251b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Sat, 04 May 2024 05:30:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714825847; x=1715430647; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+qJzK9x4g2HNU4FIHdEW1W0hvBZCghz5m03Ne8RAv4=;
        b=ZoVR9kdJBrfTMjUbN/Eq0JS7fJGVj+mApHPSL7BzA64L8wGyQ1l418VAoOxkNh+VI+
         GiC4Xg1W+rl+zezzGy8+lmNdM2iTEVpKgPMr8U739Z98stXWVfha31+5gAU/2qZUSTcg
         ZycXyoUvI7fJsGFR4JqJOmAvDE1LFDAeIqdw0W92sZCKWMWUcXK5gINsfzQX1rCSwQV3
         dbHGhbmAbHno/sNkztqY9dk4JczWjuAGY3TvSjaDH4bvX2vs7SVsbWV+dvbFpcCT+6qk
         BBjzWlG9pK2iZHL3NE8X+3UScBkC0YOHJOtVwDVoUmYJrfTExYYuB2sxg0zMk8ei94WC
         z3QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714825847; x=1715430647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X+qJzK9x4g2HNU4FIHdEW1W0hvBZCghz5m03Ne8RAv4=;
        b=gZFOSd4660r/cIifSFGEdN6CswPd2CiOwBbCuRHnl863lV71bssqlT4BOnujw6JTew
         38yFWwF5TrNtHMZSKX/FM0EZxjLr1alWoQ8G8aLAi5v3hSXpxQ+CQACTjWETlI8OrWsB
         y6sB/6MyrtglwDk6ipCmYd0L0FOP1q+Y4QrVFRQM+YGETiT0ikAXiTMfHhKnbwXylvuV
         sWuJWHNeHMe2aQdm4fiLv8i5+bqif0IK+wikrj3Tc6NftUEm/AQrqWPH+hD5Yhl++tIM
         cAC4BRjq3wbVCZi0sdBNnd/0crqFAaGKnANlrtKSrdEp5ACAExRvKfDV05QE3vAzrrfR
         Q9eA==
X-Forwarded-Encrypted: i=1; AJvYcCXh9DTVtkBJx7bR+st4+H2x0g8O+TS5n5xU8gWQ80cQeiTAa2LD7AsX4Pi+rb40SHAnvMhbOM/sVdPfr/5y92F0TyCDPh/p2GdKZHHrWw==
X-Gm-Message-State: AOJu0YwJKdoNnjBXGmbouaP0CdBMYMAbhmkcd/MFwRW2d7iAUbiD3N21
	jq80R6b9gl7qFmEl/nR0EY0vBlJqll2XZ346ERYOt5oxe50YNqOF
X-Google-Smtp-Source: AGHT+IHEtBsHCn1R5mKaNUjYdiJyjlu2QlQBKkCFbulBsGZiM7KWx2eBMFrLR4i5dy7lCQJq71P8eQ==
X-Received: by 2002:a05:6a00:804:b0:6f3:ee60:54bd with SMTP id m4-20020a056a00080400b006f3ee6054bdmr6023976pfk.8.1714825846390;
        Sat, 04 May 2024 05:30:46 -0700 (PDT)
Received: from wheely.local0.net (220-245-239-57.tpgi.com.au. [220.245.239.57])
        by smtp.gmail.com with ESMTPSA id b16-20020a056a000a9000b006f4473daa38sm3480068pfl.128.2024.05.04.05.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 May 2024 05:30:46 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: Thomas Huth <thuth@redhat.com>
Subject: [kvm-unit-tests PATCH v9 29/31] powerpc: Remove remnants of ppc64 directory and build structure
Date: Sat,  4 May 2024 22:28:35 +1000
Message-ID: <20240504122841.1177683-30-npiggin@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240504122841.1177683-1-npiggin@gmail.com>
References: <20240504122841.1177683-1-npiggin@gmail.com>
MIME-Version: 1.0
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

This moves merges ppc64 directories and files into powerpc, and
merges the 3 makefiles into one.

The configure --arch=powerpc option is aliased to ppc64 for
good measure.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 MAINTAINERS                                |   1 -
 configure                                  |   3 +-
 lib/{ppc64 => powerpc}/asm-offsets.c       |   0
 lib/{ppc64 => powerpc}/asm/asm-offsets.h   |   0
 lib/{ppc64 => powerpc}/asm/atomic.h        |   0
 lib/{ppc64 => powerpc}/asm/barrier.h       |   4 +-
 lib/{ppc64 => powerpc}/asm/bitops.h        |   4 +-
 lib/{ppc64 => powerpc}/asm/io.h            |   4 +-
 lib/{ppc64 => powerpc}/asm/mmu.h           |   0
 lib/{ppc64 => powerpc}/asm/opal.h          |   4 +-
 lib/{ppc64 => powerpc}/asm/page.h          |   6 +-
 lib/{ppc64 => powerpc}/asm/pgtable-hwdef.h |   6 +-
 lib/{ppc64 => powerpc}/asm/pgtable.h       |   2 +-
 lib/{ppc64 => powerpc}/asm/ptrace.h        |   6 +-
 lib/{ppc64 => powerpc}/asm/spinlock.h      |   6 +-
 lib/powerpc/asm/stack.h                    |   3 +
 lib/{ppc64 => powerpc}/asm/vpa.h           |   0
 lib/{ppc64 => powerpc}/mmu.c               |   0
 lib/{ppc64 => powerpc}/opal-calls.S        |   0
 lib/{ppc64 => powerpc}/opal.c              |   0
 lib/{ppc64 => powerpc}/stack.c             |   0
 lib/ppc64/.gitignore                       |   1 -
 lib/ppc64/asm/handlers.h                   |   1 -
 lib/ppc64/asm/hcall.h                      |   1 -
 lib/ppc64/asm/memory_areas.h               |   6 --
 lib/ppc64/asm/ppc_asm.h                    |   1 -
 lib/ppc64/asm/processor.h                  |   1 -
 lib/ppc64/asm/reg.h                        |   1 -
 lib/ppc64/asm/rtas.h                       |   1 -
 lib/ppc64/asm/setup.h                      |   1 -
 lib/ppc64/asm/smp.h                        |   1 -
 lib/ppc64/asm/stack.h                      |  11 --
 powerpc/Makefile                           | 112 ++++++++++++++++++++-
 powerpc/Makefile.common                    |  96 ------------------
 powerpc/Makefile.ppc64                     |  31 ------
 35 files changed, 137 insertions(+), 177 deletions(-)
 rename lib/{ppc64 => powerpc}/asm-offsets.c (100%)
 rename lib/{ppc64 => powerpc}/asm/asm-offsets.h (100%)
 rename lib/{ppc64 => powerpc}/asm/atomic.h (100%)
 rename lib/{ppc64 => powerpc}/asm/barrier.h (83%)
 rename lib/{ppc64 => powerpc}/asm/bitops.h (69%)
 rename lib/{ppc64 => powerpc}/asm/io.h (50%)
 rename lib/{ppc64 => powerpc}/asm/mmu.h (100%)
 rename lib/{ppc64 => powerpc}/asm/opal.h (90%)
 rename lib/{ppc64 => powerpc}/asm/page.h (94%)
 rename lib/{ppc64 => powerpc}/asm/pgtable-hwdef.h (93%)
 rename lib/{ppc64 => powerpc}/asm/pgtable.h (99%)
 rename lib/{ppc64 => powerpc}/asm/ptrace.h (89%)
 rename lib/{ppc64 => powerpc}/asm/spinlock.h (54%)
 rename lib/{ppc64 => powerpc}/asm/vpa.h (100%)
 rename lib/{ppc64 => powerpc}/mmu.c (100%)
 rename lib/{ppc64 => powerpc}/opal-calls.S (100%)
 rename lib/{ppc64 => powerpc}/opal.c (100%)
 rename lib/{ppc64 => powerpc}/stack.c (100%)
 delete mode 100644 lib/ppc64/.gitignore
 delete mode 100644 lib/ppc64/asm/handlers.h
 delete mode 100644 lib/ppc64/asm/hcall.h
 delete mode 100644 lib/ppc64/asm/memory_areas.h
 delete mode 100644 lib/ppc64/asm/ppc_asm.h
 delete mode 100644 lib/ppc64/asm/processor.h
 delete mode 100644 lib/ppc64/asm/reg.h
 delete mode 100644 lib/ppc64/asm/rtas.h
 delete mode 100644 lib/ppc64/asm/setup.h
 delete mode 100644 lib/ppc64/asm/smp.h
 delete mode 100644 lib/ppc64/asm/stack.h
 delete mode 100644 powerpc/Makefile.common
 delete mode 100644 powerpc/Makefile.ppc64

diff --git a/MAINTAINERS b/MAINTAINERS
index a2fa437da..1309863f2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -92,7 +92,6 @@ S: Maintained
 L: linuxppc-dev@lists.ozlabs.org
 F: powerpc/
 F: lib/powerpc/
-F: lib/ppc64/
 
 RISCV
 M: Andrew Jones <andrew.jones@linux.dev>
diff --git a/configure b/configure
index 2b788d0c8..77a0230fa 100755
--- a/configure
+++ b/configure
@@ -215,6 +215,7 @@ fi
 
 arch_name=$arch
 [ "$arch" = "aarch64" ] && arch="arm64"
+[ "$arch" = "powerpc" ] && arch="ppc64"
 [ "$arch_name" = "arm64" ] && arch_name="aarch64"
 
 if [ "$arch" = "riscv" ]; then
@@ -335,7 +336,7 @@ elif [ "$arch" = "arm" ] || [ "$arch" = "arm64" ]; then
     fi
 elif [ "$arch" = "ppc64" ]; then
     testdir=powerpc
-    arch_libdir=ppc64
+    arch_libdir=powerpc
     firmware="$testdir/boot_rom.bin"
     if [ "$endian" != "little" ] && [ "$endian" != "big" ]; then
         echo "You must provide endianness (big or little)!"
diff --git a/lib/ppc64/asm-offsets.c b/lib/powerpc/asm-offsets.c
similarity index 100%
rename from lib/ppc64/asm-offsets.c
rename to lib/powerpc/asm-offsets.c
diff --git a/lib/ppc64/asm/asm-offsets.h b/lib/powerpc/asm/asm-offsets.h
similarity index 100%
rename from lib/ppc64/asm/asm-offsets.h
rename to lib/powerpc/asm/asm-offsets.h
diff --git a/lib/ppc64/asm/atomic.h b/lib/powerpc/asm/atomic.h
similarity index 100%
rename from lib/ppc64/asm/atomic.h
rename to lib/powerpc/asm/atomic.h
diff --git a/lib/ppc64/asm/barrier.h b/lib/powerpc/asm/barrier.h
similarity index 83%
rename from lib/ppc64/asm/barrier.h
rename to lib/powerpc/asm/barrier.h
index 475434b6a..22349d691 100644
--- a/lib/ppc64/asm/barrier.h
+++ b/lib/powerpc/asm/barrier.h
@@ -1,5 +1,5 @@
-#ifndef _ASMPPC64_BARRIER_H_
-#define _ASMPPC64_BARRIER_H_
+#ifndef _ASMPOWERPC_BARRIER_H_
+#define _ASMPOWERPC_BARRIER_H_
 
 #define cpu_relax() asm volatile("or 1,1,1 ; or 2,2,2" ::: "memory")
 #define pause_short() asm volatile(".long 0x7c40003c" ::: "memory")
diff --git a/lib/ppc64/asm/bitops.h b/lib/powerpc/asm/bitops.h
similarity index 69%
rename from lib/ppc64/asm/bitops.h
rename to lib/powerpc/asm/bitops.h
index c93d64bb9..dc1b8cd3f 100644
--- a/lib/ppc64/asm/bitops.h
+++ b/lib/powerpc/asm/bitops.h
@@ -1,5 +1,5 @@
-#ifndef _ASMPPC64_BITOPS_H_
-#define _ASMPPC64_BITOPS_H_
+#ifndef _ASMPOWERPC_BITOPS_H_
+#define _ASMPOWERPC_BITOPS_H_
 
 #ifndef _BITOPS_H_
 #error only <bitops.h> can be included directly
diff --git a/lib/ppc64/asm/io.h b/lib/powerpc/asm/io.h
similarity index 50%
rename from lib/ppc64/asm/io.h
rename to lib/powerpc/asm/io.h
index 08d7297c3..cfe099f01 100644
--- a/lib/ppc64/asm/io.h
+++ b/lib/powerpc/asm/io.h
@@ -1,5 +1,5 @@
-#ifndef _ASMPPC64_IO_H_
-#define _ASMPPC64_IO_H_
+#ifndef _ASMPOWERPC_IO_H_
+#define _ASMPOWERPC_IO_H_
 
 #define __iomem
 
diff --git a/lib/ppc64/asm/mmu.h b/lib/powerpc/asm/mmu.h
similarity index 100%
rename from lib/ppc64/asm/mmu.h
rename to lib/powerpc/asm/mmu.h
diff --git a/lib/ppc64/asm/opal.h b/lib/powerpc/asm/opal.h
similarity index 90%
rename from lib/ppc64/asm/opal.h
rename to lib/powerpc/asm/opal.h
index 6c3e9ffe2..44e62d80d 100644
--- a/lib/ppc64/asm/opal.h
+++ b/lib/powerpc/asm/opal.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ASMPPC64_OPAL_H_
-#define _ASMPPC64_OPAL_H_
+#ifndef _ASMPOWERPC_OPAL_H_
+#define _ASMPOWERPC_OPAL_H_
 
 #include <stdint.h>
 
diff --git a/lib/ppc64/asm/page.h b/lib/powerpc/asm/page.h
similarity index 94%
rename from lib/ppc64/asm/page.h
rename to lib/powerpc/asm/page.h
index c497d86b9..19bf9c677 100644
--- a/lib/ppc64/asm/page.h
+++ b/lib/powerpc/asm/page.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASMPPC64_PAGE_H_
-#define _ASMPPC64_PAGE_H_
+#ifndef _ASMPOWERPC_PAGE_H_
+#define _ASMPOWERPC_PAGE_H_
 /*
  * Adapted from
  *   lib/arm64/asm/page.h and Linux kernel defines.
@@ -62,4 +62,4 @@ extern unsigned long __phys_to_virt(phys_addr_t addr);
 extern void *__ioremap(phys_addr_t phys_addr, size_t size);
 
 #endif /* !__ASSEMBLY__ */
-#endif /* _ASMPPC64_PAGE_H_ */
+#endif /* _ASMPOWERPC_PAGE_H_ */
diff --git a/lib/ppc64/asm/pgtable-hwdef.h b/lib/powerpc/asm/pgtable-hwdef.h
similarity index 93%
rename from lib/ppc64/asm/pgtable-hwdef.h
rename to lib/powerpc/asm/pgtable-hwdef.h
index 7cb2c7476..84618809d 100644
--- a/lib/ppc64/asm/pgtable-hwdef.h
+++ b/lib/powerpc/asm/pgtable-hwdef.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-#ifndef _ASMPPC64_PGTABLE_HWDEF_H_
-#define _ASMPPC64_PGTABLE_HWDEF_H_
+#ifndef _ASMPOWERPC_PGTABLE_HWDEF_H_
+#define _ASMPOWERPC_PGTABLE_HWDEF_H_
 /*
  * Copyright (C) 2024, IBM Inc, Nicholas Piggin <npiggin@gmail.com>
  *
@@ -63,4 +63,4 @@
 #define PHYS_MASK_SHIFT		(48)
 #define PHYS_MASK		((UL(1) << PHYS_MASK_SHIFT) - 1)
 
-#endif /* _ASMPPC64_PGTABLE_HWDEF_H_ */
+#endif /* _ASMPOWERPC_PGTABLE_HWDEF_H_ */
diff --git a/lib/ppc64/asm/pgtable.h b/lib/powerpc/asm/pgtable.h
similarity index 99%
rename from lib/ppc64/asm/pgtable.h
rename to lib/powerpc/asm/pgtable.h
index a6ee0d4cd..d4f2c826a 100644
--- a/lib/ppc64/asm/pgtable.h
+++ b/lib/powerpc/asm/pgtable.h
@@ -122,4 +122,4 @@ static inline pte_t *pte_alloc(pmd_t *pmd, unsigned long addr)
 	return pte_offset(pmd, addr);
 }
 
-#endif /* _ASMPPC64_PGTABLE_H_ */
+#endif /* _ASMPOWERPC_PGTABLE_H_ */
diff --git a/lib/ppc64/asm/ptrace.h b/lib/powerpc/asm/ptrace.h
similarity index 89%
rename from lib/ppc64/asm/ptrace.h
rename to lib/powerpc/asm/ptrace.h
index db263a59e..39ea950e7 100644
--- a/lib/ppc64/asm/ptrace.h
+++ b/lib/powerpc/asm/ptrace.h
@@ -1,5 +1,5 @@
-#ifndef _ASMPPC64_PTRACE_H_
-#define _ASMPPC64_PTRACE_H_
+#ifndef _ASMPOWERPC_PTRACE_H_
+#define _ASMPOWERPC_PTRACE_H_
 
 #define KERNEL_REDZONE_SIZE	288
 #define STACK_FRAME_OVERHEAD    112     /* size of minimum stack frame */
@@ -38,4 +38,4 @@ static inline void regs_advance_insn(struct pt_regs *regs)
 
 #endif /* __ASSEMBLY__ */
 
-#endif /* _ASMPPC64_PTRACE_H_ */
+#endif /* _ASMPOWERPC_PTRACE_H_ */
diff --git a/lib/ppc64/asm/spinlock.h b/lib/powerpc/asm/spinlock.h
similarity index 54%
rename from lib/ppc64/asm/spinlock.h
rename to lib/powerpc/asm/spinlock.h
index b952386da..9dbe716fd 100644
--- a/lib/ppc64/asm/spinlock.h
+++ b/lib/powerpc/asm/spinlock.h
@@ -1,5 +1,5 @@
-#ifndef _ASMPPC64_SPINLOCK_H_
-#define _ASMPPC64_SPINLOCK_H_
+#ifndef _ASMPOWERPC_SPINLOCK_H_
+#define _ASMPOWERPC_SPINLOCK_H_
 
 struct spinlock {
 	unsigned int v;
@@ -8,4 +8,4 @@ struct spinlock {
 void spin_lock(struct spinlock *lock);
 void spin_unlock(struct spinlock *lock);
 
-#endif /* _ASMPPC64_SPINLOCK_H_ */
+#endif /* _ASMPOWERPC_SPINLOCK_H_ */
diff --git a/lib/powerpc/asm/stack.h b/lib/powerpc/asm/stack.h
index e1c46ee09..eea139a45 100644
--- a/lib/powerpc/asm/stack.h
+++ b/lib/powerpc/asm/stack.h
@@ -5,4 +5,7 @@
 #error Do not directly include <asm/stack.h>. Just use <stack.h>.
 #endif
 
+#define HAVE_ARCH_BACKTRACE
+#define HAVE_ARCH_BACKTRACE_FRAME
+
 #endif
diff --git a/lib/ppc64/asm/vpa.h b/lib/powerpc/asm/vpa.h
similarity index 100%
rename from lib/ppc64/asm/vpa.h
rename to lib/powerpc/asm/vpa.h
diff --git a/lib/ppc64/mmu.c b/lib/powerpc/mmu.c
similarity index 100%
rename from lib/ppc64/mmu.c
rename to lib/powerpc/mmu.c
diff --git a/lib/ppc64/opal-calls.S b/lib/powerpc/opal-calls.S
similarity index 100%
rename from lib/ppc64/opal-calls.S
rename to lib/powerpc/opal-calls.S
diff --git a/lib/ppc64/opal.c b/lib/powerpc/opal.c
similarity index 100%
rename from lib/ppc64/opal.c
rename to lib/powerpc/opal.c
diff --git a/lib/ppc64/stack.c b/lib/powerpc/stack.c
similarity index 100%
rename from lib/ppc64/stack.c
rename to lib/powerpc/stack.c
diff --git a/lib/ppc64/.gitignore b/lib/ppc64/.gitignore
deleted file mode 100644
index 84872bf19..000000000
--- a/lib/ppc64/.gitignore
+++ /dev/null
@@ -1 +0,0 @@
-asm-offsets.[hs]
diff --git a/lib/ppc64/asm/handlers.h b/lib/ppc64/asm/handlers.h
deleted file mode 100644
index 92e6fb247..000000000
--- a/lib/ppc64/asm/handlers.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/handlers.h"
diff --git a/lib/ppc64/asm/hcall.h b/lib/ppc64/asm/hcall.h
deleted file mode 100644
index daabaca51..000000000
--- a/lib/ppc64/asm/hcall.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/hcall.h"
diff --git a/lib/ppc64/asm/memory_areas.h b/lib/ppc64/asm/memory_areas.h
deleted file mode 100644
index b9fd46b9e..000000000
--- a/lib/ppc64/asm/memory_areas.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef _ASMPPC64_MEMORY_AREAS_H_
-#define _ASMPPC64_MEMORY_AREAS_H_
-
-#include <asm-generic/memory_areas.h>
-
-#endif
diff --git a/lib/ppc64/asm/ppc_asm.h b/lib/ppc64/asm/ppc_asm.h
deleted file mode 100644
index e3929eeee..000000000
--- a/lib/ppc64/asm/ppc_asm.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/ppc_asm.h"
diff --git a/lib/ppc64/asm/processor.h b/lib/ppc64/asm/processor.h
deleted file mode 100644
index 066a51a00..000000000
--- a/lib/ppc64/asm/processor.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/processor.h"
diff --git a/lib/ppc64/asm/reg.h b/lib/ppc64/asm/reg.h
deleted file mode 100644
index bc407b555..000000000
--- a/lib/ppc64/asm/reg.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/reg.h"
diff --git a/lib/ppc64/asm/rtas.h b/lib/ppc64/asm/rtas.h
deleted file mode 100644
index fe77f635c..000000000
--- a/lib/ppc64/asm/rtas.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/rtas.h"
diff --git a/lib/ppc64/asm/setup.h b/lib/ppc64/asm/setup.h
deleted file mode 100644
index 201929859..000000000
--- a/lib/ppc64/asm/setup.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/setup.h"
diff --git a/lib/ppc64/asm/smp.h b/lib/ppc64/asm/smp.h
deleted file mode 100644
index 67ced7567..000000000
--- a/lib/ppc64/asm/smp.h
+++ /dev/null
@@ -1 +0,0 @@
-#include "../../powerpc/asm/smp.h"
diff --git a/lib/ppc64/asm/stack.h b/lib/ppc64/asm/stack.h
deleted file mode 100644
index 94fd1021c..000000000
--- a/lib/ppc64/asm/stack.h
+++ /dev/null
@@ -1,11 +0,0 @@
-#ifndef _ASMPPC64_STACK_H_
-#define _ASMPPC64_STACK_H_
-
-#ifndef _STACK_H_
-#error Do not directly include <asm/stack.h>. Just use <stack.h>.
-#endif
-
-#define HAVE_ARCH_BACKTRACE
-#define HAVE_ARCH_BACKTRACE_FRAME
-
-#endif
diff --git a/powerpc/Makefile b/powerpc/Makefile
index 8a007ab54..e4b5312a2 100644
--- a/powerpc/Makefile
+++ b/powerpc/Makefile
@@ -1 +1,111 @@
-include $(SRCDIR)/$(TEST_DIR)/Makefile.$(ARCH)
+#
+# powerpc makefile
+#
+# Authors: Andrew Jones <drjones@redhat.com>
+#
+tests = \
+	$(TEST_DIR)/selftest.elf \
+	$(TEST_DIR)/selftest-migration.elf \
+	$(TEST_DIR)/memory-verify.elf \
+	$(TEST_DIR)/sieve.elf \
+	$(TEST_DIR)/spapr_vpa.elf \
+	$(TEST_DIR)/spapr_hcall.elf \
+	$(TEST_DIR)/rtas.elf \
+	$(TEST_DIR)/emulator.elf \
+	$(TEST_DIR)/atomics.elf \
+	$(TEST_DIR)/tm.elf \
+	$(TEST_DIR)/smp.elf \
+	$(TEST_DIR)/sprs.elf \
+	$(TEST_DIR)/timebase.elf \
+	$(TEST_DIR)/interrupts.elf \
+	$(TEST_DIR)/mmu.elf \
+	$(TEST_DIR)/pmu.elf
+
+all: directories $(TEST_DIR)/boot_rom.bin $(tests)
+
+cstart.o = $(TEST_DIR)/cstart64.o
+reloc.o  = $(TEST_DIR)/reloc64.o
+
+OBJDIRS += lib/powerpc
+cflatobjs += lib/powerpc/stack.o
+cflatobjs += lib/powerpc/mmu.o
+cflatobjs += lib/powerpc/opal.o
+cflatobjs += lib/powerpc/opal-calls.o
+cflatobjs += lib/util.o
+cflatobjs += lib/getchar.o
+cflatobjs += lib/alloc_phys.o
+cflatobjs += lib/alloc.o
+cflatobjs += lib/alloc_page.o
+cflatobjs += lib/vmalloc.o
+cflatobjs += lib/devicetree.o
+cflatobjs += lib/migrate.o
+cflatobjs += lib/powerpc/io.o
+cflatobjs += lib/powerpc/hcall.o
+cflatobjs += lib/powerpc/setup.o
+cflatobjs += lib/powerpc/rtas.o
+cflatobjs += lib/powerpc/processor.o
+cflatobjs += lib/powerpc/handlers.o
+cflatobjs += lib/powerpc/smp.o
+cflatobjs += lib/powerpc/spinlock.o
+
+##################################################################
+
+bits = 64
+
+ifeq ($(ENDIAN),little)
+    arch_CFLAGS = -mlittle-endian
+    arch_LDFLAGS = -EL
+else
+    arch_CFLAGS = -mbig-endian
+    arch_LDFLAGS = -EB
+endif
+
+mabi_no_altivec := $(call cc-option,-mabi=no-altivec,"")
+
+CFLAGS += -std=gnu99
+CFLAGS += -ffreestanding
+CFLAGS += -O2 -msoft-float -mno-altivec $(mabi_no_altivec)
+CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
+CFLAGS += -Wa,-mregnames
+
+# We want to keep intermediate files
+.PRECIOUS: %.o
+
+asm-offsets = lib/powerpc/asm-offsets.h
+include $(SRCDIR)/scripts/asm-offsets.mak
+
+%.aux.o: $(SRCDIR)/lib/auxinfo.c
+	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
+
+FLATLIBS = $(libcflat) $(LIBFDT_archive)
+%.elf: CFLAGS += $(arch_CFLAGS)
+%.elf: LDFLAGS += $(arch_LDFLAGS) -pie -n
+%.elf: %.o $(FLATLIBS) $(SRCDIR)/powerpc/flat.lds $(cstart.o) $(reloc.o) %.aux.o
+	$(LD) $(LDFLAGS) -o $@ \
+		-T $(SRCDIR)/powerpc/flat.lds --build-id=none \
+		$(filter %.o, $^) $(FLATLIBS)
+	@chmod a-x $@
+	@echo -n Checking $@ for unsupported reloc types...
+	@if $(OBJDUMP) -R $@ | grep R_ | grep -v R_PPC64_RELATIVE; then	\
+		false;							\
+	else								\
+		echo " looks good.";					\
+	fi
+
+$(TEST_DIR)/boot_rom.bin: $(TEST_DIR)/boot_rom.elf
+	dd if=/dev/zero of=$@ bs=256 count=1
+	$(OBJCOPY) -O binary $^ $@.tmp
+	cat $@.tmp >> $@
+	$(RM) $@.tmp
+
+$(TEST_DIR)/boot_rom.elf: CFLAGS = -mbig-endian
+$(TEST_DIR)/boot_rom.elf: $(TEST_DIR)/boot_rom.o
+	$(LD) -EB -nostdlib -Ttext=0x100 --entry=start --build-id=none -o $@ $<
+	@chmod a-x $@
+
+arch_clean: asm_offsets_clean
+	$(RM) $(TEST_DIR)/*.{o,elf} $(TEST_DIR)/boot_rom.bin \
+	      $(TEST_DIR)/.*.d lib/powerpc/.*.d
+
+generated-files = $(asm-offsets)
+$(tests:.elf=.o) $(cstart.o) $(cflatobjs): $(generated-files)
diff --git a/powerpc/Makefile.common b/powerpc/Makefile.common
deleted file mode 100644
index 0255ca9e4..000000000
--- a/powerpc/Makefile.common
+++ /dev/null
@@ -1,96 +0,0 @@
-#
-# powerpc common makefile
-#
-# Authors: Andrew Jones <drjones@redhat.com>
-#
-
-tests-common = \
-	$(TEST_DIR)/selftest.elf \
-	$(TEST_DIR)/selftest-migration.elf \
-	$(TEST_DIR)/memory-verify.elf \
-	$(TEST_DIR)/sieve.elf \
-	$(TEST_DIR)/spapr_hcall.elf \
-	$(TEST_DIR)/rtas.elf \
-	$(TEST_DIR)/emulator.elf \
-	$(TEST_DIR)/atomics.elf \
-	$(TEST_DIR)/tm.elf \
-	$(TEST_DIR)/smp.elf \
-	$(TEST_DIR)/sprs.elf \
-	$(TEST_DIR)/timebase.elf \
-	$(TEST_DIR)/interrupts.elf \
-	$(TEST_DIR)/mmu.elf \
-	$(TEST_DIR)/pmu.elf
-
-tests-all = $(tests-common) $(tests)
-all: directories $(TEST_DIR)/boot_rom.bin $(tests-all)
-
-##################################################################
-
-mabi_no_altivec := $(call cc-option,-mabi=no-altivec,"")
-
-CFLAGS += -std=gnu99
-CFLAGS += -ffreestanding
-CFLAGS += -O2 -msoft-float -mno-altivec $(mabi_no_altivec)
-CFLAGS += -I $(SRCDIR)/lib -I $(SRCDIR)/lib/libfdt -I lib
-CFLAGS += -Wa,-mregnames
-
-# We want to keep intermediate files
-.PRECIOUS: %.o
-
-asm-offsets = lib/$(ARCH)/asm-offsets.h
-include $(SRCDIR)/scripts/asm-offsets.mak
-
-cflatobjs += lib/util.o
-cflatobjs += lib/getchar.o
-cflatobjs += lib/alloc_phys.o
-cflatobjs += lib/alloc.o
-cflatobjs += lib/alloc_page.o
-cflatobjs += lib/vmalloc.o
-cflatobjs += lib/devicetree.o
-cflatobjs += lib/migrate.o
-cflatobjs += lib/powerpc/io.o
-cflatobjs += lib/powerpc/hcall.o
-cflatobjs += lib/powerpc/setup.o
-cflatobjs += lib/powerpc/rtas.o
-cflatobjs += lib/powerpc/processor.o
-cflatobjs += lib/powerpc/handlers.o
-cflatobjs += lib/powerpc/smp.o
-cflatobjs += lib/powerpc/spinlock.o
-
-OBJDIRS += lib/powerpc
-
-%.aux.o: $(SRCDIR)/lib/auxinfo.c
-	$(CC) $(CFLAGS) -c -o $@ $< -DPROGNAME=\"$(@:.aux.o=.elf)\"
-
-FLATLIBS = $(libcflat) $(LIBFDT_archive)
-%.elf: CFLAGS += $(arch_CFLAGS)
-%.elf: LDFLAGS += $(arch_LDFLAGS) -pie -n
-%.elf: %.o $(FLATLIBS) $(SRCDIR)/powerpc/flat.lds $(cstart.o) $(reloc.o) %.aux.o
-	$(LD) $(LDFLAGS) -o $@ \
-		-T $(SRCDIR)/powerpc/flat.lds --build-id=none \
-		$(filter %.o, $^) $(FLATLIBS)
-	@chmod a-x $@
-	@echo -n Checking $@ for unsupported reloc types...
-	@if $(OBJDUMP) -R $@ | grep R_ | grep -v R_PPC64_RELATIVE; then	\
-		false;							\
-	else								\
-		echo " looks good.";					\
-	fi
-
-$(TEST_DIR)/boot_rom.bin: $(TEST_DIR)/boot_rom.elf
-	dd if=/dev/zero of=$@ bs=256 count=1
-	$(OBJCOPY) -O binary $^ $@.tmp
-	cat $@.tmp >> $@
-	$(RM) $@.tmp
-
-$(TEST_DIR)/boot_rom.elf: CFLAGS = -mbig-endian
-$(TEST_DIR)/boot_rom.elf: $(TEST_DIR)/boot_rom.o
-	$(LD) -EB -nostdlib -Ttext=0x100 --entry=start --build-id=none -o $@ $<
-	@chmod a-x $@
-
-powerpc_clean: asm_offsets_clean
-	$(RM) $(TEST_DIR)/*.{o,elf} $(TEST_DIR)/boot_rom.bin \
-	      $(TEST_DIR)/.*.d lib/powerpc/.*.d
-
-generated-files = $(asm-offsets)
-$(tests-all:.elf=.o) $(cstart.o) $(cflatobjs): $(generated-files)
diff --git a/powerpc/Makefile.ppc64 b/powerpc/Makefile.ppc64
deleted file mode 100644
index 2466471f9..000000000
--- a/powerpc/Makefile.ppc64
+++ /dev/null
@@ -1,31 +0,0 @@
-#
-# ppc64 makefile
-#
-# Authors: Andrew Jones <drjones@redhat.com>
-#
-bits = 64
-
-ifeq ($(ENDIAN),little)
-    arch_CFLAGS = -mlittle-endian
-    arch_LDFLAGS = -EL
-else
-    arch_CFLAGS = -mbig-endian
-    arch_LDFLAGS = -EB
-endif
-
-cstart.o = $(TEST_DIR)/cstart64.o
-reloc.o  = $(TEST_DIR)/reloc64.o
-
-OBJDIRS += lib/ppc64
-cflatobjs += lib/ppc64/stack.o
-cflatobjs += lib/ppc64/mmu.o
-cflatobjs += lib/ppc64/opal.o
-cflatobjs += lib/ppc64/opal-calls.o
-
-# ppc64 specific tests
-tests = $(TEST_DIR)/spapr_vpa.elf
-
-include $(SRCDIR)/$(TEST_DIR)/Makefile.common
-
-arch_clean: powerpc_clean
-	$(RM) lib/ppc64/.*.d
-- 
2.43.0

