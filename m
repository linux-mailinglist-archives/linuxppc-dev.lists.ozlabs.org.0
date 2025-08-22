Return-Path: <linuxppc-dev+bounces-11229-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD87B32799
	for <lists+linuxppc-dev@lfdr.de>; Sat, 23 Aug 2025 10:20:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c893p1x2Bz3dBq;
	Sat, 23 Aug 2025 18:20:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1755937238;
	cv=none; b=af9IKUP8ZWPOdms5Efg9L2pSYbZcUyOUiLo2s2DDEHRaRYcQFgIZPawIVoypFTmY1ZElF17yAK0Ugncb8x+BtXS3oUtIO7x3stpwblaL17Qd5rFwQOLDfboSqB80DhyH7cViIlFHm4PjUfke5hjGTOK3Yx5Uu0nIwLYFKCe8yylRRHYK7sPyLweMTnt0LWpewT2w5rKaQCT3Ib5ORQE0k9DJWJSv2L2O0K6CE50rDByX2o9WBxpdb4aoS0CERGqrbKYRNpJbOyE+sSEvkWsFq7LfGT0pekjHxcvlSk2Y4tJ3hbJkfMxQqzPhpokpkwRcecSo4LARS58l+5U07wMz2w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1755937238; c=relaxed/relaxed;
	bh=Y4zsBjDo9fIMyYiR+8SqYfExwkkNhX/eHry1jx9HH6I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P2yTG+KdIbOqvMQN8/IPakRnrVqMoTW4pLZY8iyfSVgv03FMoYvJierFYRg7JhWVg3wPW6Vv2irojMd9wrZrcJsEjijafdPawQ/leXyfRph7HdlBSf1cOURFxowO1n0tticqW77J7mDAS5z9Kb8iVNtZVNnTzV02ibBqcqpvTmxNzfYg4AFHmu6Zs9CoI9uQGKmy7JW0xHytdxHFiUIkKibQ/Xnbb4N9TG3o2kJxI8cWy63I2R3uvv1tLGRO68PNV1Z1+JRfkTBuBa+MARiaZYPZamzlJyWqroJwFckML0ywJuwBil2Ca58lO5bIHGhKhJFsfwC/VBmLrz8aR4ZVtQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4c893n2xMzz3d9H
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 23 Aug 2025 18:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4c7bGw3RnVz9sSj;
	Fri, 22 Aug 2025 11:58:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3D3ihdjAxI-2; Fri, 22 Aug 2025 11:58:16 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4c7bGw2QVbz9sSh;
	Fri, 22 Aug 2025 11:58:16 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3B1398B780;
	Fri, 22 Aug 2025 11:58:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id hP4XdQ8I1l6j; Fri, 22 Aug 2025 11:58:16 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id EBC088B775;
	Fri, 22 Aug 2025 11:58:14 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Darren Hart <dvhart@infradead.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	"Andre Almeida" <andrealmeid@igalia.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Laight <david.laight.linux@gmail.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Daniel Borkmann <daniel@iogearbox.net>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-block@vger.kernel.org
Subject: [PATCH v2 09/10] powerpc/32: Automatically adapt TASK_SIZE based on constraints
Date: Fri, 22 Aug 2025 11:58:05 +0200
Message-ID: <db7f9b12d731d88ac612a27e2caf4d99d76472d2.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1755854833.git.christophe.leroy@csgroup.eu>
References: <cover.1755854833.git.christophe.leroy@csgroup.eu>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755856679; l=6153; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=Q5VXVewln3Cq8QBQY4zJ1R5L8lrSpoSHODi0pVwUSDQ=; b=fwATo2R/7pzKngfXSvD28g8yFziaXfShMsvp2zyLAu3QXHJwRYR4qxsHgfcYjKtZtpPTf9q2K 4B3BCNI3uM2Bvj2QoVQMyxr0RNNIKNZvnyBRF5R1eOM7dpw+/XsqHoi
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

At the time being, TASK_SIZE can be customized by the user via Kconfig
but it is not possible to check all constraints in Kconfig. Impossible
setups are detected at compile time with BUILD_BUG() but that leads
to build failure when setting crazy values. It is not a problem on its
own because the user will usually either use the default value or set
a well thought value. However build robots generate crazy random
configs that lead to build failures, and build robots see it as a
regression every time a patch adds such a constraint.

So instead of failing the build when the custom TASK_SIZE is too
big, just adjust it to the maximum possible value matching the setup.

Several architectures already calculate TASK_SIZE based on other
parameters and options.

In order to do so, move MODULES_VADDR calculation into task_size_32.h
and ensure that:
- On book3s/32, userspace and module area have their own segments (256M)
- On 8xx, userspace has its own full PGDIR entries (4M)

Then TASK_SIZE is garantied to be correct so remove related
BUILD_BUG()s.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/Kconfig                         |  3 +--
 arch/powerpc/include/asm/book3s/32/pgtable.h |  4 ---
 arch/powerpc/include/asm/nohash/32/mmu-8xx.h |  4 ---
 arch/powerpc/include/asm/task_size_32.h      | 26 ++++++++++++++++++++
 arch/powerpc/mm/book3s32/mmu.c               |  2 --
 arch/powerpc/mm/mem.c                        |  2 --
 arch/powerpc/mm/nohash/8xx.c                 |  2 --
 7 files changed, 27 insertions(+), 16 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 93402a1d9c9f..74e514577ee5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1296,9 +1296,8 @@ config TASK_SIZE_BOOL
 	  Say N here unless you know what you are doing.
 
 config TASK_SIZE
-	hex "Size of user task space" if TASK_SIZE_BOOL
+	hex "Size of maximum user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
-	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
 	default "0xc0000000"
 
 config MODULES_SIZE_BOOL
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 92d21c6faf1e..d02d50ca0387 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -195,10 +195,6 @@ void unmap_kernel_page(unsigned long va);
 #define VMALLOC_END	ioremap_bot
 #endif
 
-#define MODULES_END	ALIGN_DOWN(PAGE_OFFSET, SZ_256M)
-#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
-#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
-
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
 #include <linux/threads.h>
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index 2986f9ba40b8..866574655ffe 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -170,10 +170,6 @@
 
 #define mmu_linear_psize	MMU_PAGE_8M
 
-#define MODULES_END	PAGE_OFFSET
-#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
-#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
-
 #ifndef __ASSEMBLY__
 
 #include <linux/mmdebug.h>
diff --git a/arch/powerpc/include/asm/task_size_32.h b/arch/powerpc/include/asm/task_size_32.h
index 30edc21f71fb..42a64bbd1964 100644
--- a/arch/powerpc/include/asm/task_size_32.h
+++ b/arch/powerpc/include/asm/task_size_32.h
@@ -2,11 +2,37 @@
 #ifndef _ASM_POWERPC_TASK_SIZE_32_H
 #define _ASM_POWERPC_TASK_SIZE_32_H
 
+#include <linux/sizes.h>
+
 #if CONFIG_TASK_SIZE > CONFIG_KERNEL_START
 #error User TASK_SIZE overlaps with KERNEL_START address
 #endif
 
+#ifdef CONFIG_PPC_8xx
+#define MODULES_END	ASM_CONST(CONFIG_PAGE_OFFSET)
+#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
+#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
+#define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_4M) - 1))
+#define USER_TOP	MODULES_BASE
+#endif
+
+#ifdef CONFIG_PPC_BOOK3S_32
+#define MODULES_END	(ASM_CONST(CONFIG_PAGE_OFFSET) & ~(UL(SZ_256M) - 1))
+#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
+#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
+#define MODULES_BASE	(MODULES_VADDR & ~(UL(SZ_256M) - 1))
+#define USER_TOP	MODULES_BASE
+#endif
+
+#ifndef USER_TOP
+#define USER_TOP	ASM_CONST(CONFIG_PAGE_OFFSET)
+#endif
+
+#if CONFIG_TASK_SIZE < USER_TOP
 #define TASK_SIZE ASM_CONST(CONFIG_TASK_SIZE)
+#else
+#define TASK_SIZE USER_TOP
+#endif
 
 /*
  * This decides where the kernel will search for a free chunk of vm space during
diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
index afc9b5cac5a6..35ef3a117d3f 100644
--- a/arch/powerpc/mm/book3s32/mmu.c
+++ b/arch/powerpc/mm/book3s32/mmu.c
@@ -223,8 +223,6 @@ int mmu_mark_initmem_nx(void)
 
 	update_bats();
 
-	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, SZ_256M) < TASK_SIZE);
-
 	for (i = ALIGN(TASK_SIZE, SZ_256M) >> 28; i < 16; i++) {
 		/* Do not set NX on VM space for modules */
 		if (is_module_segment(i << 28))
diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
index 3ddbfdbfa941..bc0f1a9eb0bc 100644
--- a/arch/powerpc/mm/mem.c
+++ b/arch/powerpc/mm/mem.c
@@ -401,8 +401,6 @@ struct execmem_info __init *execmem_arch_setup(void)
 #ifdef MODULES_VADDR
 	unsigned long limit = (unsigned long)_etext - SZ_32M;
 
-	BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
-
 	/* First try within 32M limit from _etext to avoid branch trampolines */
 	if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit) {
 		start = limit;
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index ab1505cf42bf..a9d3f4729ead 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -209,8 +209,6 @@ void __init setup_initial_memory_limit(phys_addr_t first_memblock_base,
 
 	/* 8xx can only access 32MB at the moment */
 	memblock_set_current_limit(min_t(u64, first_memblock_size, SZ_32M));
-
-	BUILD_BUG_ON(ALIGN_DOWN(MODULES_VADDR, PGDIR_SIZE) < TASK_SIZE);
 }
 
 int pud_clear_huge(pud_t *pud)
-- 
2.49.0


