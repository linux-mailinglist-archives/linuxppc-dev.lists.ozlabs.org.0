Return-Path: <linuxppc-dev+bounces-14997-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 133EECDC1B5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 12:21:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbqFl3Hz6z2yYq;
	Wed, 24 Dec 2025 22:21:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766575291;
	cv=none; b=JlvvcMGkugLy7r6lJIiDnCzrlSHSiDMnKSt3OkEsCVw+ST10u/G3KiADoVGQcOxSkrdI9FLLC4TMITRKYH0jrjb5ATc844qU/GEEr15KFjoA2snDLpiPAd4yE71SjNEKwaYePOI7fPb2Uj5Ka3ih5cZNRRbQ3t6MOuYDf+UoKS99GfceLZZJr/xzy7t4IFgS2+ADZBGvT+UyJf094NXsKqdmu8osOaPMApzTjaa8g2NDqUn3544rx0WI7+cDn/FX9x9hZMBlkxHNUp0nhjDXLFdtJhEIx+9PMXXPEcW/oy6h+hUah5a5JqcTsc/XCFpGLvTZfU0r6hYLTHNHUZ0OhA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766575291; c=relaxed/relaxed;
	bh=qaC/orMm3SJXkkBZ2ukDlztDciZD3ly4UwR0RsuHBC0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NT3zkI4uT5DBTSlcCS6SsBP3mDn40SQ7E1kUgXOtRRJkYQYvryGHVI5oV9II5utND5laAT5BVmTBqQfYIOdellz4UQsYBYdXkst81Eg/VCNorKROUvdeHF/gcLkkFKEhYiOnY9KD7aAHxriwERo0OOZA+Qo/z87g3g4PvMWdnQ/nviG+OG4n3ecPUilQKo/Bc9CGWpxU8H+LzIASc3Y/WNp03apXT+AFyZSbvMlu6vXdxdovl05K/wJdGLoOAQKNo9E+AXueLgfM4ItBqNofBcpz1vCQjpA1aI84JngJ6w3L6A1Rrq+xpO1gXKehg7FfpBkNHf/tbZtOLkpT0Hg1wA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWPeDBA8; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iWPeDBA8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbqFk4JmXz2yYK
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 22:21:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F135143A1D;
	Wed, 24 Dec 2025 11:21:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04B32C16AAE;
	Wed, 24 Dec 2025 11:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766575288;
	bh=wKTECL+uhV2GewMTUnLeAs+N2tpCOWuQ3qmRO31AzZU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iWPeDBA8oLNW9eDp4PsxIG5ToDSE+K5B19Dz2tJYX9VEH8JjPH+TI2pohxIIc5kbm
	 AqF9Vu/NaSMUZXvsMUUqzNM8HRHvocup8CUVTaYJ0cgtY8cz/s6/B0+67wDcRFE5HM
	 6wpguaQzAWUd1CMY6S43aBsW7lsFFtEc5KwFpuTvMEug/OnNVHQS7YGXhC+dI65pr5
	 jC6Mhrx7zRi93oWBKyLxFQ492l1i0RrmuAOurXYUgXn5+5pig4gUHQBRnaIykNjOtA
	 u64SNV+s0cPd1Hx+hCMIm/4s5NgYBhbcs3u+qKhXWq5HwrWPMRvGxrDwrYvUWHUmkw
	 dPN81g3JcMNOg==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 6/7] powerpc/32: Automatically adapt TASK_SIZE based on constraints
Date: Wed, 24 Dec 2025 12:20:54 +0100
Message-ID: <6a2575420770d075cd090b5a316730a2ffafdee4.1766574657.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1766574657.git.chleroy@kernel.org>
References: <cover.1766574657.git.chleroy@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6156; i=chleroy@kernel.org; h=from:subject:message-id; bh=9s+oMFBAX9h3xrMQNyahO4dDCw3Exg61uapF1kwcX3o=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWR6n5mj+b055mGMtUj/A/4S78f7Be3XHpMsCbjFHD3lK MuflRNXdJSyMIhxMciKKbIc/8+9a0bXl9T8qbv0YeawMoEMYeDiFICJKExl+GedeoltpqxiZg8D x/fJDt+tUnaxb+udzcm0dpP8f54b2y4yMrTrdOkvfvfGN8YkapY7j/px1hqHVy6sP555tx/ninp bww4A
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

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

Then TASK_SIZE is guaranteed to be correct so remove related
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
index 9537a61ebae0..b8d36a261009 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -1293,9 +1293,8 @@ config TASK_SIZE_BOOL
 	  Say N here unless you know what you are doing.
 
 config TASK_SIZE
-	hex "Size of user task space" if TASK_SIZE_BOOL
+	hex "Size of maximum user task space" if TASK_SIZE_BOOL
 	default "0x80000000" if PPC_8xx
-	default "0xb0000000" if PPC_BOOK3S_32 && EXECMEM
 	default "0xc0000000"
 
 config MODULES_SIZE_BOOL
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 87dcca962be7..41ae404d0b7a 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -195,10 +195,6 @@ void unmap_kernel_page(unsigned long va);
 #define VMALLOC_END	ioremap_bot
 #endif
 
-#define MODULES_END	ALIGN_DOWN(PAGE_OFFSET, SZ_256M)
-#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
-#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
-
 #ifndef __ASSEMBLER__
 #include <linux/sched.h>
 #include <linux/threads.h>
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
index f19115db8072..74ad32e1588c 100644
--- a/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/mmu-8xx.h
@@ -170,10 +170,6 @@
 
 #define mmu_linear_psize	MMU_PAGE_8M
 
-#define MODULES_END	PAGE_OFFSET
-#define MODULES_SIZE	(CONFIG_MODULES_SIZE * SZ_1M)
-#define MODULES_VADDR	(MODULES_END - MODULES_SIZE)
-
 #ifndef __ASSEMBLER__
 
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
index 37eefc6786a7..07660e8badbd 100644
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


