Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 413CD9149E4
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 14:31:38 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E7JhlrqW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W76lV5T5gz3ccf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Jun 2024 22:31:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=E7JhlrqW;
	dkim-atps=neutral
Received: from mail.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W76fl4B3rz3cGS
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Jun 2024 22:27:27 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1719232048;
	bh=QrXVB0qstcAEvZNpTSQv8E8gubof+wP3t+bM5wMausM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=E7JhlrqWMoyhzs+5AHqFerVhYYm8X6x3Z2oAIurOgc0EeeplU3h/FqG5nG0kvre1n
	 slml6y13iZaOPBrSIBEKAP/BHwCIkQmi7L00LtDpS6fiQGpeLiDE3ModFHgO99OpLG
	 mWejL4MaT1S5Kk/KGqdEGjhAEraSaQCwxmBpaWvSboACCz6r9P5lsgXU8BkRu2pf0E
	 2uQqkP0xZytVmcg74RvUd+37F64uDh0oe/D/SykaWM75U4KwllSxH5sTVrxUnwTa97
	 Qm4w86dN1pUpaRwKGuE84Iu6x8xue2rPRLdxmtKsAQL59mpNwVSKUYCsV+SCGWXks5
	 NJUHUztfR41lw==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4W76fm3J86z4wny;
	Mon, 24 Jun 2024 22:27:28 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: <linuxppc-dev@lists.ozlabs.org>
Subject: [PATCH v2 4/7] powerpc: Remove core support for 40x
Date: Mon, 24 Jun 2024 22:27:20 +1000
Message-ID: <20240624122723.134292-4-mpe@ellerman.id.au>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240624122723.134292-1-mpe@ellerman.id.au>
References: <20240624122723.134292-1-mpe@ellerman.id.au>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Now that 40x platforms have gone, remove support
for 40x in the core of powerpc arch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
---
 arch/powerpc/include/asm/cputable.h          |   7 -
 arch/powerpc/include/asm/mmu.h               |   7 -
 arch/powerpc/include/asm/nohash/32/mmu-40x.h |  68 --
 arch/powerpc/include/asm/nohash/32/pgtable.h |   4 +-
 arch/powerpc/include/asm/nohash/32/pte-40x.h |  73 --
 arch/powerpc/include/asm/nohash/mmu.h        |   5 +-
 arch/powerpc/include/asm/reg.h               |  25 +-
 arch/powerpc/include/asm/reg_booke.h         | 113 +--
 arch/powerpc/include/asm/time.h              |   7 +-
 arch/powerpc/include/asm/udbg.h              |   1 -
 arch/powerpc/kernel/Makefile                 |   1 -
 arch/powerpc/kernel/cpu_specs.h              |   4 -
 arch/powerpc/kernel/cpu_specs_40x.h          | 280 -------
 arch/powerpc/kernel/entry_32.S               |  40 -
 arch/powerpc/kernel/head_32.h                |  12 +-
 arch/powerpc/kernel/head_40x.S               | 721 -------------------
 arch/powerpc/kernel/head_booke.h             |   3 +-
 arch/powerpc/kernel/misc_32.S                |  40 -
 arch/powerpc/kernel/traps.c                  |   2 +-
 arch/powerpc/kernel/udbg.c                   |   3 -
 arch/powerpc/kernel/udbg_16550.c             |  23 -
 arch/powerpc/mm/mmu_decl.h                   |   8 +-
 arch/powerpc/mm/nohash/40x.c                 | 161 -----
 arch/powerpc/mm/nohash/Makefile              |   1 -
 arch/powerpc/mm/nohash/kup.c                 |   2 -
 arch/powerpc/mm/nohash/mmu_context.c         |   3 -
 arch/powerpc/mm/nohash/tlb_low.S             |  27 +-
 arch/powerpc/platforms/4xx/pci.c             | 100 ---
 scripts/head-object-list.txt                 |   1 -
 29 files changed, 14 insertions(+), 1728 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/nohash/32/mmu-40x.h
 delete mode 100644 arch/powerpc/include/asm/nohash/32/pte-40x.h
 delete mode 100644 arch/powerpc/kernel/cpu_specs_40x.h
 delete mode 100644 arch/powerpc/kernel/head_40x.S
 delete mode 100644 arch/powerpc/mm/nohash/40x.c

v2: Rebase only.

diff --git a/arch/powerpc/include/asm/cputable.h b/arch/powerpc/include/asm/cputable.h
index 07a204d21034..201218faed61 100644
--- a/arch/powerpc/include/asm/cputable.h
+++ b/arch/powerpc/include/asm/cputable.h
@@ -353,7 +353,6 @@ static inline void cpu_feature_keys_init(void) { }
 	    CPU_FTR_COMMON | CPU_FTR_FPU_UNAVAILABLE  | CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_CLASSIC32	(CPU_FTR_COMMON)
 #define CPU_FTRS_8XX	(CPU_FTR_NOEXECUTE)
-#define CPU_FTRS_40X	(CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_44X	(CPU_FTR_NOEXECUTE)
 #define CPU_FTRS_440x6	(CPU_FTR_NOEXECUTE | \
 	    CPU_FTR_INDEXED_DCR)
@@ -507,9 +506,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX |
 #endif
-#ifdef CONFIG_40x
-	    CPU_FTRS_40X |
-#endif
 #ifdef CONFIG_PPC_47x
 	    CPU_FTRS_47X | CPU_FTR_476_DD2 |
 #elif defined(CONFIG_44x)
@@ -582,9 +578,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 	    CPU_FTRS_8XX &
 #endif
-#ifdef CONFIG_40x
-	    CPU_FTRS_40X &
-#endif
 #ifdef CONFIG_PPC_47x
 	    CPU_FTRS_47X &
 #elif defined(CONFIG_44x)
diff --git a/arch/powerpc/include/asm/mmu.h b/arch/powerpc/include/asm/mmu.h
index 8a27b046c6a2..009c45044a5a 100644
--- a/arch/powerpc/include/asm/mmu.h
+++ b/arch/powerpc/include/asm/mmu.h
@@ -16,7 +16,6 @@
  */
 #define MMU_FTR_HPTE_TABLE		ASM_CONST(0x00000001)
 #define MMU_FTR_TYPE_8xx		ASM_CONST(0x00000002)
-#define MMU_FTR_TYPE_40x		ASM_CONST(0x00000004)
 #define MMU_FTR_TYPE_44x		ASM_CONST(0x00000008)
 #define MMU_FTR_TYPE_FSL_E		ASM_CONST(0x00000010)
 #define MMU_FTR_TYPE_47x		ASM_CONST(0x00000020)
@@ -153,9 +152,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 		MMU_FTR_TYPE_8xx |
 #endif
-#ifdef CONFIG_40x
-		MMU_FTR_TYPE_40x |
-#endif
 #ifdef CONFIG_PPC_47x
 		MMU_FTR_TYPE_47x | MMU_FTR_USE_TLBIVAX_BCAST | MMU_FTR_LOCK_BCAST_INVAL |
 #elif defined(CONFIG_44x)
@@ -202,9 +198,6 @@ enum {
 #ifdef CONFIG_PPC_8xx
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_8xx
 #endif
-#ifdef CONFIG_40x
-#define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_40x
-#endif
 #ifdef CONFIG_PPC_47x
 #define MMU_FTRS_ALWAYS		MMU_FTR_TYPE_47x
 #elif defined(CONFIG_44x)
diff --git a/arch/powerpc/include/asm/nohash/32/mmu-40x.h b/arch/powerpc/include/asm/nohash/32/mmu-40x.h
deleted file mode 100644
index 8a8f13a22cf4..000000000000
--- a/arch/powerpc/include/asm/nohash/32/mmu-40x.h
+++ /dev/null
@@ -1,68 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_MMU_40X_H_
-#define _ASM_POWERPC_MMU_40X_H_
-
-/*
- * PPC40x support
- */
-
-#define PPC40X_TLB_SIZE 64
-
-/*
- * TLB entries are defined by a "high" tag portion and a "low" data
- * portion.  On all architectures, the data portion is 32-bits.
- *
- * TLB entries are managed entirely under software control by reading,
- * writing, and searchoing using the 4xx-specific tlbre, tlbwr, and tlbsx
- * instructions.
- */
-
-#define	TLB_LO          1
-#define	TLB_HI          0
-
-#define	TLB_DATA        TLB_LO
-#define	TLB_TAG         TLB_HI
-
-/* Tag portion */
-
-#define TLB_EPN_MASK    0xFFFFFC00      /* Effective Page Number */
-#define TLB_PAGESZ_MASK 0x00000380
-#define TLB_PAGESZ(x)   (((x) & 0x7) << 7)
-#define   PAGESZ_1K		0
-#define   PAGESZ_4K             1
-#define   PAGESZ_16K            2
-#define   PAGESZ_64K            3
-#define   PAGESZ_256K           4
-#define   PAGESZ_1M             5
-#define   PAGESZ_4M             6
-#define   PAGESZ_16M            7
-#define TLB_VALID       0x00000040      /* Entry is valid */
-
-/* Data portion */
-
-#define TLB_RPN_MASK    0xFFFFFC00      /* Real Page Number */
-#define TLB_PERM_MASK   0x00000300
-#define TLB_EX          0x00000200      /* Instruction execution allowed */
-#define TLB_WR          0x00000100      /* Writes permitted */
-#define TLB_ZSEL_MASK   0x000000F0
-#define TLB_ZSEL(x)     (((x) & 0xF) << 4)
-#define TLB_ATTR_MASK   0x0000000F
-#define TLB_W           0x00000008      /* Caching is write-through */
-#define TLB_I           0x00000004      /* Caching is inhibited */
-#define TLB_M           0x00000002      /* Memory is coherent */
-#define TLB_G           0x00000001      /* Memory is guarded from prefetch */
-
-#ifndef __ASSEMBLY__
-
-typedef struct {
-	unsigned int	id;
-	unsigned int	active;
-	void __user	*vdso;
-} mm_context_t;
-
-#endif /* !__ASSEMBLY__ */
-
-#define mmu_virtual_psize	MMU_PAGE_4K
-#define mmu_linear_psize	MMU_PAGE_256M
-
-#endif /* _ASM_POWERPC_MMU_40X_H_ */
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9164a9e41b02..9508399dd036 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -118,9 +118,7 @@
  * (hardware-defined) PowerPC PTE as closely as possible.
  */
 
-#if defined(CONFIG_40x)
-#include <asm/nohash/32/pte-40x.h>
-#elif defined(CONFIG_44x)
+#if defined(CONFIG_44x)
 #include <asm/nohash/32/pte-44x.h>
 #elif defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
 #include <asm/nohash/pte-e500.h>
diff --git a/arch/powerpc/include/asm/nohash/32/pte-40x.h b/arch/powerpc/include/asm/nohash/32/pte-40x.h
deleted file mode 100644
index d759cfd74754..000000000000
--- a/arch/powerpc/include/asm/nohash/32/pte-40x.h
+++ /dev/null
@@ -1,73 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_NOHASH_32_PTE_40x_H
-#define _ASM_POWERPC_NOHASH_32_PTE_40x_H
-#ifdef __KERNEL__
-
-/*
- * At present, all PowerPC 400-class processors share a similar TLB
- * architecture. The instruction and data sides share a unified,
- * 64-entry, fully-associative TLB which is maintained totally under
- * software control. In addition, the instruction side has a
- * hardware-managed, 4-entry, fully-associative TLB which serves as a
- * first level to the shared TLB. These two TLBs are known as the UTLB
- * and ITLB, respectively (see "mmu.h" for definitions).
- *
- * There are several potential gotchas here.  The 40x hardware TLBLO
- * field looks like this:
- *
- * 0  1  2  3  4  ... 18 19 20 21 22 23 24 25 26 27 28 29 30 31
- * RPN.....................  0  0 EX WR ZSEL.......  W  I  M  G
- *
- * Where possible we make the Linux PTE bits match up with this
- *
- * - bits 20 and 21 must be cleared, because we use 4k pages (40x can
- *   support down to 1k pages), this is done in the TLBMiss exception
- *   handler.
- * - We use only zones 0 (for kernel pages) and 1 (for user pages)
- *   of the 16 available.  Bit 24-26 of the TLB are cleared in the TLB
- *   miss handler.  Bit 27 is PAGE_USER, thus selecting the correct
- *   zone.
- * - PRESENT *must* be in the bottom two bits because swap PTEs
- *   use the top 30 bits.  Because 40x doesn't support SMP anyway, M is
- *   irrelevant so we borrow it for PAGE_PRESENT.  Bit 30
- *   is cleared in the TLB miss handler before the TLB entry is loaded.
- * - All other bits of the PTE are loaded into TLBLO without
- *   modification, leaving us only the bits 20, 21, 24, 25, 26, 30 for
- *   software PTE bits.  We actually use bits 21, 24, 25, and
- *   30 respectively for the software bits: ACCESSED, DIRTY, RW, and
- *   PRESENT.
- */
-
-#define	_PAGE_GUARDED	0x001	/* G: page is guarded from prefetch */
-#define _PAGE_PRESENT	0x002	/* software: PTE contains a translation */
-#define	_PAGE_NO_CACHE	0x004	/* I: caching is inhibited */
-#define	_PAGE_WRITETHRU	0x008	/* W: caching is write-through */
-#define	_PAGE_READ	0x010	/* software: read permission */
-#define	_PAGE_SPECIAL	0x020	/* software: Special page */
-#define	_PAGE_DIRTY	0x080	/* software: dirty page */
-#define _PAGE_WRITE	0x100	/* hardware: WR, anded with dirty in exception */
-#define _PAGE_EXEC	0x200	/* hardware: EX permission */
-#define _PAGE_ACCESSED	0x400	/* software: R: page referenced */
-
-/* No page size encoding in the linux PTE */
-#define _PAGE_PSIZE		0
-
-/* cache related flags non existing on 40x */
-#define _PAGE_COHERENT	0
-
-#define _PMD_PRESENT	0x400	/* PMD points to page of PTEs */
-#define _PMD_PRESENT_MASK	_PMD_PRESENT
-#define _PMD_BAD	0x802
-#define _PMD_SIZE_4M	0x0c0
-#define _PMD_SIZE_16M	0x0e0
-#define _PMD_USER	0
-
-#define _PTE_NONE_MASK	0
-
-#define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
-#define _PAGE_BASE	(_PAGE_BASE_NC)
-
-#include <asm/pgtable-masks.h>
-
-#endif /* __KERNEL__ */
-#endif /*  _ASM_POWERPC_NOHASH_32_PTE_40x_H */
diff --git a/arch/powerpc/include/asm/nohash/mmu.h b/arch/powerpc/include/asm/nohash/mmu.h
index e264be219fdb..4cc795044103 100644
--- a/arch/powerpc/include/asm/nohash/mmu.h
+++ b/arch/powerpc/include/asm/nohash/mmu.h
@@ -2,10 +2,7 @@
 #ifndef _ASM_POWERPC_NOHASH_MMU_H_
 #define _ASM_POWERPC_NOHASH_MMU_H_
 
-#if defined(CONFIG_40x)
-/* 40x-style software loaded TLB */
-#include <asm/nohash/32/mmu-40x.h>
-#elif defined(CONFIG_44x)
+#if defined(CONFIG_44x)
 /* 44x-style software loaded TLB */
 #include <asm/nohash/32/mmu-44x.h>
 #elif defined(CONFIG_PPC_E500)
diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
index eed33cb916d0..76c1490f5c97 100644
--- a/arch/powerpc/include/asm/reg.h
+++ b/arch/powerpc/include/asm/reg.h
@@ -233,14 +233,10 @@
 
 /* Special Purpose Registers (SPRNs)*/
 
-#ifdef CONFIG_40x
-#define SPRN_PID	0x3B1	/* Process ID */
-#else
 #define SPRN_PID	0x030	/* Process ID */
 #ifdef CONFIG_BOOKE
 #define SPRN_PID0	SPRN_PID/* Process ID Register 0 */
 #endif
-#endif
 
 #define SPRN_CTR	0x009	/* Count Register */
 #define SPRN_DSCR	0x11
@@ -527,7 +523,7 @@
 #define SPRN_TSCR	0x399	/* Thread Switch Control Register */
 
 #define SPRN_DEC	0x016		/* Decrement Register */
-#define SPRN_PIT	0x3DB		/* Programmable Interval Timer (40x/BOOKE) */
+#define SPRN_PIT	0x3DB		/* Programmable Interval Timer (BOOKE) */
 
 #define SPRN_DER	0x095		/* Debug Enable Register */
 #define DER_RSTE	0x40000000	/* Reset Interrupt */
@@ -1116,15 +1112,6 @@
  *	- SPRG2 indicator that we are in RTAS
  *	- SPRG4 (603 only) pseudo TLB LRU data
  *
- * 32-bit 40x:
- *	- SPRG0 scratch for exception vectors
- *	- SPRG1 scratch for exception vectors
- *	- SPRG2 scratch for exception vectors
- *	- SPRG4 scratch for exception vectors (not 403)
- *	- SPRG5 scratch for exception vectors (not 403)
- *	- SPRG6 scratch for exception vectors (not 403)
- *	- SPRG7 scratch for exception vectors (not 403)
- *
  * 32-bit 440 and FSL BookE:
  *	- SPRG0 scratch for exception vectors
  *	- SPRG1 scratch for exception vectors (*)
@@ -1216,16 +1203,6 @@
 #define SPRN_SPRG_603_LRU	SPRN_SPRG4
 #endif
 
-#ifdef CONFIG_40x
-#define SPRN_SPRG_SCRATCH0	SPRN_SPRG0
-#define SPRN_SPRG_SCRATCH1	SPRN_SPRG1
-#define SPRN_SPRG_SCRATCH2	SPRN_SPRG2
-#define SPRN_SPRG_SCRATCH3	SPRN_SPRG4
-#define SPRN_SPRG_SCRATCH4	SPRN_SPRG5
-#define SPRN_SPRG_SCRATCH5	SPRN_SPRG6
-#define SPRN_SPRG_SCRATCH6	SPRN_SPRG7
-#endif
-
 #ifdef CONFIG_BOOKE
 #define SPRN_SPRG_RSCRATCH0	SPRN_SPRG0
 #define SPRN_SPRG_WSCRATCH0	SPRN_SPRG0
diff --git a/arch/powerpc/include/asm/reg_booke.h b/arch/powerpc/include/asm/reg_booke.h
index af56980b6cdb..656bfaf91526 100644
--- a/arch/powerpc/include/asm/reg_booke.h
+++ b/arch/powerpc/include/asm/reg_booke.h
@@ -1,10 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
  * Contains register definitions common to the Book E PowerPC
- * specification.  Notice that while the IBM-40x series of CPUs
- * are not true Book E PowerPCs, they borrowed a number of features
- * before Book E was finalized, and are included here as well.  Unfortunately,
- * they sometimes used different locations than true Book E CPUs did.
+ * specification.
  *
  * Copyright 2009-2010 Freescale Semiconductor, Inc.
  */
@@ -42,9 +39,6 @@
 #define MSR_KERNEL	(MSR_ | MSR_64BIT)
 #define MSR_USER32	(MSR_ | MSR_PR | MSR_EE)
 #define MSR_USER64	(MSR_USER32 | MSR_64BIT)
-#elif defined (CONFIG_40x)
-#define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_IR|MSR_DR|MSR_CE)
-#define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
 #else
 #define MSR_KERNEL	(MSR_ME|MSR_RI|MSR_CE)
 #define MSR_USER	(MSR_KERNEL|MSR_PR|MSR_EE)
@@ -157,7 +151,6 @@
 #define SPRN_TLB3CFG	0x2B3	/* TLB 3 Config Register */
 #define SPRN_EPR	0x2BE	/* External Proxy Register */
 #define SPRN_CCR1	0x378	/* Core Configuration Register 1 */
-#define SPRN_ZPR	0x3B0	/* Zone Protection Register (40x) */
 #define SPRN_MAS7	0x3B0	/* MMU Assist Register 7 */
 #define SPRN_MMUCR	0x3B2	/* MMU Control Register */
 #define SPRN_CCR0	0x3B3	/* Core Configuration Register 0 */
@@ -166,7 +159,6 @@
 #define SPRN_SGR	0x3B9	/* Storage Guarded Register */
 #define SPRN_DCWR	0x3BA	/* Data Cache Write-thru Register */
 #define SPRN_SLER	0x3BB	/* Little-endian real mode */
-#define SPRN_SU0R	0x3BC	/* "User 0" real mode (40x) */
 #define SPRN_DCMP	0x3D1	/* Data TLB Compare Register */
 #define SPRN_ICDBDR	0x3D3	/* Instruction Cache Debug Data Register */
 #define SPRN_EVPR	0x3D6	/* Exception Vector Prefix Register */
@@ -183,10 +175,8 @@
 #define SPRN_SVR	0x3FF	/* System Version Register */
 
 /*
- * SPRs which have conflicting definitions on true Book E versus classic,
- * or IBM 40x.
+ * SPRs which have conflicting definitions on true Book E versus classic.
  */
-#ifdef CONFIG_BOOKE
 #define SPRN_CSRR0	0x03A	/* Critical Save and Restore Register 0 */
 #define SPRN_CSRR1	0x03B	/* Critical Save and Restore Register 1 */
 #define SPRN_DEAR	0x03D	/* Data Error Address Register */
@@ -201,22 +191,6 @@
 #define SPRN_DAC2	0x13D	/* Data Address Compare 2 */
 #define SPRN_TSR	0x150	/* Timer Status Register */
 #define SPRN_TCR	0x154	/* Timer Control Register */
-#endif /* Book E */
-#ifdef CONFIG_40x
-#define SPRN_DBCR1	0x3BD	/* Debug Control Register 1 */		
-#define SPRN_ESR	0x3D4	/* Exception Syndrome Register */
-#define SPRN_DEAR	0x3D5	/* Data Error Address Register */
-#define SPRN_TSR	0x3D8	/* Timer Status Register */
-#define SPRN_TCR	0x3DA	/* Timer Control Register */
-#define SPRN_SRR2	0x3DE	/* Save/Restore Register 2 */
-#define SPRN_SRR3	0x3DF	/* Save/Restore Register 3 */
-#define SPRN_DBSR	0x3F0	/* Debug Status Register */		
-#define SPRN_DBCR0	0x3F2	/* Debug Control Register 0 */
-#define SPRN_DAC1	0x3F6	/* Data Address Compare 1 */
-#define SPRN_DAC2	0x3F7	/* Data Address Compare 2 */
-#define SPRN_CSRR0	SPRN_SRR2 /* Critical Save and Restore Register 0 */
-#define SPRN_CSRR1	SPRN_SRR3 /* Critical Save and Restore Register 1 */
-#endif
 #define SPRN_HACOP	0x15F	/* Hypervisor Available Coprocessor Register */
 
 /* Bit definitions for CCR1. */
@@ -296,10 +270,6 @@
 #endif
 
 /* Bit definitions for the DBSR. */
-/*
- * DBSR bits which have conflicting definitions on true Book E versus IBM 40x.
- */
-#ifdef CONFIG_BOOKE
 #define DBSR_IDE	0x80000000	/* Imprecise Debug Event */
 #define DBSR_MRR	0x30000000	/* Most Recent Reset */
 #define DBSR_IC		0x08000000	/* Instruction Completion */
@@ -319,21 +289,6 @@
 #define DBSR_CRET	0x00000020	/* Critical Return Debug Event */
 #define DBSR_IAC12ATS	0x00000002	/* Instr Address Compare 1/2 Toggle */
 #define DBSR_IAC34ATS	0x00000001	/* Instr Address Compare 3/4 Toggle */
-#endif
-#ifdef CONFIG_40x
-#define DBSR_IC		0x80000000	/* Instruction Completion */
-#define DBSR_BT		0x40000000	/* Branch taken */
-#define DBSR_IRPT	0x20000000	/* Exception Debug Event */
-#define DBSR_TIE	0x10000000	/* Trap Instruction debug Event */
-#define DBSR_IAC1	0x04000000	/* Instruction Address Compare 1 Event */
-#define DBSR_IAC2	0x02000000	/* Instruction Address Compare 2 Event */
-#define DBSR_IAC3	0x00080000	/* Instruction Address Compare 3 Event */
-#define DBSR_IAC4	0x00040000	/* Instruction Address Compare 4 Event */
-#define DBSR_DAC1R	0x01000000	/* Data Address Compare 1 Read Event */
-#define DBSR_DAC1W	0x00800000	/* Data Address Compare 1 Write Event */
-#define DBSR_DAC2R	0x00400000	/* Data Address Compare 2 Read Event */
-#define DBSR_DAC2W	0x00200000	/* Data Address Compare 2 Write Event */
-#endif
 
 /* Bit definitions related to the ESR. */
 #define ESR_MCI		0x80000000	/* Machine Check - Instruction */
@@ -355,69 +310,6 @@
 #define ESR_SPV		0x00000080	/* Signal Processing operation */
 
 /* Bit definitions related to the DBCR0. */
-#if defined(CONFIG_40x)
-#define DBCR0_EDM	0x80000000	/* External Debug Mode */
-#define DBCR0_IDM	0x40000000	/* Internal Debug Mode */
-#define DBCR0_RST	0x30000000	/* all the bits in the RST field */
-#define DBCR0_RST_SYSTEM 0x30000000	/* System Reset */
-#define DBCR0_RST_CHIP	0x20000000	/* Chip Reset */
-#define DBCR0_RST_CORE	0x10000000	/* Core Reset */
-#define DBCR0_RST_NONE	0x00000000	/* No Reset */
-#define DBCR0_IC	0x08000000	/* Instruction Completion */
-#define DBCR0_ICMP	DBCR0_IC
-#define DBCR0_BT	0x04000000	/* Branch Taken */
-#define DBCR0_BRT	DBCR0_BT
-#define DBCR0_EDE	0x02000000	/* Exception Debug Event */
-#define DBCR0_IRPT	DBCR0_EDE
-#define DBCR0_TDE	0x01000000	/* TRAP Debug Event */
-#define DBCR0_IA1	0x00800000	/* Instr Addr compare 1 enable */
-#define DBCR0_IAC1	DBCR0_IA1
-#define DBCR0_IA2	0x00400000	/* Instr Addr compare 2 enable */
-#define DBCR0_IAC2	DBCR0_IA2
-#define DBCR0_IA12	0x00200000	/* Instr Addr 1-2 range enable */
-#define DBCR0_IA12X	0x00100000	/* Instr Addr 1-2 range eXclusive */
-#define DBCR0_IA3	0x00080000	/* Instr Addr compare 3 enable */
-#define DBCR0_IAC3	DBCR0_IA3
-#define DBCR0_IA4	0x00040000	/* Instr Addr compare 4 enable */
-#define DBCR0_IAC4	DBCR0_IA4
-#define DBCR0_IA34	0x00020000	/* Instr Addr 3-4 range Enable */
-#define DBCR0_IA34X	0x00010000	/* Instr Addr 3-4 range eXclusive */
-#define DBCR0_IA12T	0x00008000	/* Instr Addr 1-2 range Toggle */
-#define DBCR0_IA34T	0x00004000	/* Instr Addr 3-4 range Toggle */
-#define DBCR0_FT	0x00000001	/* Freeze Timers on debug event */
-
-#define dbcr_iac_range(task)	((task)->thread.debug.dbcr0)
-#define DBCR_IAC12I	DBCR0_IA12			/* Range Inclusive */
-#define DBCR_IAC12X	(DBCR0_IA12 | DBCR0_IA12X)	/* Range Exclusive */
-#define DBCR_IAC12MODE	(DBCR0_IA12 | DBCR0_IA12X)	/* IAC 1-2 Mode Bits */
-#define DBCR_IAC34I	DBCR0_IA34			/* Range Inclusive */
-#define DBCR_IAC34X	(DBCR0_IA34 | DBCR0_IA34X)	/* Range Exclusive */
-#define DBCR_IAC34MODE	(DBCR0_IA34 | DBCR0_IA34X)	/* IAC 3-4 Mode Bits */
-
-/* Bit definitions related to the DBCR1. */
-#define DBCR1_DAC1R	0x80000000	/* DAC1 Read Debug Event */
-#define DBCR1_DAC2R	0x40000000	/* DAC2 Read Debug Event */
-#define DBCR1_DAC1W	0x20000000	/* DAC1 Write Debug Event */
-#define DBCR1_DAC2W	0x10000000	/* DAC2 Write Debug Event */
-
-#define dbcr_dac(task)	((task)->thread.debug.dbcr1)
-#define DBCR_DAC1R	DBCR1_DAC1R
-#define DBCR_DAC1W	DBCR1_DAC1W
-#define DBCR_DAC2R	DBCR1_DAC2R
-#define DBCR_DAC2W	DBCR1_DAC2W
-
-/*
- * Are there any active Debug Events represented in the
- * Debug Control Registers?
- */
-#define DBCR0_ACTIVE_EVENTS	(DBCR0_ICMP | DBCR0_IAC1 | DBCR0_IAC2 | \
-				 DBCR0_IAC3 | DBCR0_IAC4)
-#define DBCR1_ACTIVE_EVENTS	(DBCR1_DAC1R | DBCR1_DAC2R | \
-				 DBCR1_DAC1W | DBCR1_DAC2W)
-#define DBCR_ACTIVE_EVENTS(dbcr0, dbcr1)  (((dbcr0) & DBCR0_ACTIVE_EVENTS) || \
-					   ((dbcr1) & DBCR1_ACTIVE_EVENTS))
-
-#elif defined(CONFIG_BOOKE)
 #define DBCR0_EDM	0x80000000	/* External Debug Mode */
 #define DBCR0_IDM	0x40000000	/* Internal Debug Mode */
 #define DBCR0_RST	0x30000000	/* all the bits in the RST field */
@@ -518,7 +410,6 @@
 
 #define DBCR_ACTIVE_EVENTS(dbcr0, dbcr1)  (((dbcr0) & DBCR0_ACTIVE_EVENTS) || \
 					   ((dbcr1) & DBCR1_ACTIVE_EVENTS))
-#endif /* #elif defined(CONFIG_BOOKE) */
 
 /* Bit definitions related to the TCR. */
 #define TCR_WP(x)	(((x)&0x3)<<30)	/* WDT Period */
diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
index 9f50766c4623..221c8f8ff89b 100644
--- a/arch/powerpc/include/asm/time.h
+++ b/arch/powerpc/include/asm/time.h
@@ -58,9 +58,6 @@ static inline u64 get_vtb(void)
  */
 static inline u64 get_dec(void)
 {
-	if (IS_ENABLED(CONFIG_40x))
-		return mfspr(SPRN_PIT);
-
 	return mfspr(SPRN_DEC);
 }
 
@@ -71,9 +68,7 @@ static inline u64 get_dec(void)
  */
 static inline void set_dec(u64 val)
 {
-	if (IS_ENABLED(CONFIG_40x))
-		mtspr(SPRN_PIT, (u32)val);
-	else if (IS_ENABLED(CONFIG_BOOKE))
+	if (IS_ENABLED(CONFIG_BOOKE))
 		mtspr(SPRN_DEC, val);
 	else
 		mtspr(SPRN_DEC, val - 1);
diff --git a/arch/powerpc/include/asm/udbg.h b/arch/powerpc/include/asm/udbg.h
index b1f094728b35..289023f7a656 100644
--- a/arch/powerpc/include/asm/udbg.h
+++ b/arch/powerpc/include/asm/udbg.h
@@ -44,7 +44,6 @@ void __init udbg_init_rtas_panel(void);
 void __init udbg_init_rtas_console(void);
 void __init udbg_init_btext(void);
 void __init udbg_init_44x_as1(void);
-void __init udbg_init_40x_realmode(void);
 void __init udbg_init_cpm(void);
 void __init udbg_init_usbgecko(void);
 void __init udbg_init_memcons(void);
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 8585d03c02d3..1784b6a6ca1d 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -123,7 +123,6 @@ obj-$(CONFIG_JUMP_LABEL)	+= jump_label.o
 
 obj-$(CONFIG_PPC64)		+= head_64.o
 obj-$(CONFIG_PPC_BOOK3S_32)	+= head_book3s_32.o
-obj-$(CONFIG_40x)		+= head_40x.o
 obj-$(CONFIG_44x)		+= head_44x.o
 obj-$(CONFIG_PPC_8xx)		+= head_8xx.o
 obj-$(CONFIG_PPC_85xx)		+= head_85xx.o
diff --git a/arch/powerpc/kernel/cpu_specs.h b/arch/powerpc/kernel/cpu_specs.h
index 85ded3f77204..5ea14605bb41 100644
--- a/arch/powerpc/kernel/cpu_specs.h
+++ b/arch/powerpc/kernel/cpu_specs.h
@@ -1,9 +1,5 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
 
-#ifdef CONFIG_40x
-#include "cpu_specs_40x.h"
-#endif
-
 #ifdef CONFIG_PPC_47x
 #include "cpu_specs_47x.h"
 #elif defined(CONFIG_44x)
diff --git a/arch/powerpc/kernel/cpu_specs_40x.h b/arch/powerpc/kernel/cpu_specs_40x.h
deleted file mode 100644
index a1362a75b8c8..000000000000
--- a/arch/powerpc/kernel/cpu_specs_40x.h
+++ /dev/null
@@ -1,280 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *  Copyright (C) 2001 Ben. Herrenschmidt (benh@kernel.crashing.org)
- */
-
-static struct cpu_spec cpu_specs[] __initdata = {
-	{	/* STB 04xxx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41810000,
-		.cpu_name		= "STB04xxx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP405L */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41610000,
-		.cpu_name		= "NP405L",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* NP4GS3 */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x40B10000,
-		.cpu_name		= "NP4GS3",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* NP405H */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41410000,
-		.cpu_name		= "NP405H",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405GPr */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x50910000,
-		.cpu_name		= "405GPr",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{   /* STBx25xx */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51510000,
-		.cpu_name		= "STBx25xx",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405LP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41F10000,
-		.cpu_name		= "405LP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EP */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x51210000,
-		.cpu_name		= "405EP",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. A/B with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910007,
-		.cpu_name		= "405EX Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000d,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000f,
-		.cpu_name		= "405EX Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910003,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EX Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910005,
-		.cpu_name		= "405EX Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. A/B without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910001,
-		.cpu_name		= "405EXr Rev. A/B",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910009,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. C with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x1291000b,
-		.cpu_name		= "405EXr Rev. C",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D without Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910000,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* 405EXr Rev. D with Security */
-		.pvr_mask		= 0xffff000f,
-		.pvr_value		= 0x12910002,
-		.cpu_name		= "405EXr Rev. D",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{
-		/* 405EZ */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x41510000,
-		.cpu_name		= "405EZ",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* APM8018X */
-		.pvr_mask		= 0xffff0000,
-		.pvr_value		= 0x7ff11432,
-		.cpu_name		= "APM8018X",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	},
-	{	/* default match */
-		.pvr_mask		= 0x00000000,
-		.pvr_value		= 0x00000000,
-		.cpu_name		= "(generic 40x PPC)",
-		.cpu_features		= CPU_FTRS_40X,
-		.cpu_user_features	= PPC_FEATURE_32 | PPC_FEATURE_HAS_MMU |
-					  PPC_FEATURE_HAS_4xxMAC,
-		.mmu_features		= MMU_FTR_TYPE_40x,
-		.icache_bsize		= 32,
-		.dcache_bsize		= 32,
-		.machine_check		= machine_check_4xx,
-		.platform		= "ppc405",
-	}
-};
diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
index 7eda33a24bb4..070eab8b6a28 100644
--- a/arch/powerpc/kernel/entry_32.S
+++ b/arch/powerpc/kernel/entry_32.S
@@ -158,9 +158,6 @@ syscall_exit_finish:
 1:	REST_GPR(2, r1)
 	REST_GPR(1, r1)
 	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 
 3:	mtcr	r5
 	lwz	r4,_CTR(r1)
@@ -237,9 +234,6 @@ fast_exception_return:
 	REST_GPR(12, r11)
 	REST_GPR(11, r11)
 	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 _ASM_NOKPROBE_SYMBOL(fast_exception_return)
 
 /* aargh, a nonrecoverable interrupt, panic */
@@ -296,9 +290,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
 	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 
 .Lrestore_nvgprs:
 	REST_NVGPRS(r1)
@@ -346,9 +337,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	REST_GPR(0, r1)
 	REST_GPR(1, r1)
 	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 
 1:	/*
 	 * Emulate stack store with update. New r1 value was already calculated
@@ -375,9 +363,6 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
 	mfspr	r9, SPRN_SPRG_SCRATCH0
 #endif
 	rfi
-#ifdef CONFIG_40x
-	b .	/* Prevent prefetch past rfi */
-#endif
 _ASM_NOKPROBE_SYMBOL(interrupt_return)
 
 #if defined(CONFIG_4xx) || defined(CONFIG_BOOKE)
@@ -395,17 +380,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
  * time of the critical interrupt.
  *
  */
-#ifdef CONFIG_40x
-#define PPC_40x_TURN_OFF_MSR_DR						    \
-	/* avoid any possible TLB misses here by turning off MSR.DR, we	    \
-	 * assume the instructions here are mapped by a pinned TLB entry */ \
-	li	r10,MSR_IR;						    \
-	mtmsr	r10;							    \
-	isync;								    \
-	tophys(r1, r1);
-#else
-#define PPC_40x_TURN_OFF_MSR_DR
-#endif
 
 #define RET_FROM_EXC_LEVEL(exc_lvl_srr0, exc_lvl_srr1, exc_lvl_rfi)	\
 	REST_NVGPRS(r1);						\
@@ -423,7 +397,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 	mtlr	r11;							\
 	lwz	r10,_CCR(r1);						\
 	mtcrf	0xff,r10;						\
-	PPC_40x_TURN_OFF_MSR_DR;					\
 	lwz	r9,_DEAR(r1);						\
 	lwz	r10,_ESR(r1);						\
 	mtspr	SPRN_DEAR,r9;						\
@@ -471,19 +444,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return)
 #define RESTORE_MMU_REGS
 #endif
 
-#ifdef CONFIG_40x
-	.globl	ret_from_crit_exc
-ret_from_crit_exc:
-	lis	r9,crit_srr0@ha;
-	lwz	r9,crit_srr0@l(r9);
-	lis	r10,crit_srr1@ha;
-	lwz	r10,crit_srr1@l(r10);
-	mtspr	SPRN_SRR0,r9;
-	mtspr	SPRN_SRR1,r10;
-	RET_FROM_EXC_LEVEL(SPRN_CSRR0, SPRN_CSRR1, PPC_RFCI)
-_ASM_NOKPROBE_SYMBOL(ret_from_crit_exc)
-#endif /* CONFIG_40x */
-
 #ifdef CONFIG_BOOKE
 	.globl	ret_from_crit_exc
 ret_from_crit_exc:
diff --git a/arch/powerpc/kernel/head_32.h b/arch/powerpc/kernel/head_32.h
index f8e2911478a7..9cba7dbf58dd 100644
--- a/arch/powerpc/kernel/head_32.h
+++ b/arch/powerpc/kernel/head_32.h
@@ -21,17 +21,9 @@
 	mtspr	SPRN_SPRG_SCRATCH1,r11
 	mfspr	r10, SPRN_SPRG_THREAD
 	.if	\handle_dar_dsisr
-#ifdef CONFIG_40x
-	mfspr	r11, SPRN_DEAR
-#else
 	mfspr	r11, SPRN_DAR
-#endif
 	stw	r11, DAR(r10)
-#ifdef CONFIG_40x
-	mfspr	r11, SPRN_ESR
-#else
 	mfspr	r11, SPRN_DSISR
-#endif
 	stw	r11, DSISR(r10)
 	.endif
 	mfspr	r11, SPRN_SRR0
@@ -96,9 +88,7 @@
 	.endif
 	lwz	r9, SRR1(r12)
 	lwz	r12, SRR0(r12)
-#ifdef CONFIG_40x
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?) */
-#elif defined(CONFIG_PPC_8xx)
+#ifdef CONFIG_PPC_8xx
 	mtspr	SPRN_EID, r2		/* Set MSR_RI */
 #else
 	li	r10, MSR_KERNEL		/* can take exceptions */
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
deleted file mode 100644
index 9fc90410b385..000000000000
--- a/arch/powerpc/kernel/head_40x.S
+++ /dev/null
@@ -1,721 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-or-later */
-/*
- *    Copyright (c) 1995-1996 Gary Thomas <gdt@linuxppc.org>
- *      Initial PowerPC version.
- *    Copyright (c) 1996 Cort Dougan <cort@cs.nmt.edu>
- *      Rewritten for PReP
- *    Copyright (c) 1996 Paul Mackerras <paulus@cs.anu.edu.au>
- *      Low-level exception handers, MMU support, and rewrite.
- *    Copyright (c) 1997 Dan Malek <dmalek@jlc.net>
- *      PowerPC 8xx modifications.
- *    Copyright (c) 1998-1999 TiVo, Inc.
- *      PowerPC 403GCX modifications.
- *    Copyright (c) 1999 Grant Erickson <grant@lcse.umn.edu>
- *      PowerPC 403GCX/405GP modifications.
- *    Copyright 2000 MontaVista Software Inc.
- *	PPC405 modifications
- *      PowerPC 403GCX/405GP modifications.
- * 	Author: MontaVista Software, Inc.
- *         	frank_rowand@mvista.com or source@mvista.com
- * 	   	debbie_chu@mvista.com
- *
- *    Module name: head_4xx.S
- *
- *    Description:
- *      Kernel execution entry point code.
- */
-
-#include <linux/init.h>
-#include <linux/pgtable.h>
-#include <linux/sizes.h>
-#include <linux/linkage.h>
-
-#include <asm/processor.h>
-#include <asm/page.h>
-#include <asm/mmu.h>
-#include <asm/cputable.h>
-#include <asm/thread_info.h>
-#include <asm/ppc_asm.h>
-#include <asm/asm-offsets.h>
-#include <asm/ptrace.h>
-
-#include "head_32.h"
-
-/* As with the other PowerPC ports, it is expected that when code
- * execution begins here, the following registers contain valid, yet
- * optional, information:
- *
- *   r3 - Board info structure pointer (DRAM, frequency, MAC address, etc.)
- *   r4 - Starting address of the init RAM disk
- *   r5 - Ending address of the init RAM disk
- *   r6 - Start of kernel command line string (e.g. "mem=96m")
- *   r7 - End of kernel command line string
- *
- * This is all going to change RSN when we add bi_recs.......  -- Dan
- */
-	__HEAD
-_GLOBAL(_stext);
-_GLOBAL(_start);
-
-	mr	r31,r3			/* save device tree ptr */
-
-	/* We have to turn on the MMU right away so we get cache modes
-	 * set correctly.
-	 */
-	bl	initial_mmu
-
-/* We now have the lower 16 Meg mapped into TLB entries, and the caches
- * ready to work.
- */
-turn_on_mmu:
-	lis	r0,MSR_KERNEL@h
-	ori	r0,r0,MSR_KERNEL@l
-	mtspr	SPRN_SRR1,r0
-	lis	r0,start_here@h
-	ori	r0,r0,start_here@l
-	mtspr	SPRN_SRR0,r0
-	rfi				/* enables MMU */
-	b	.			/* prevent prefetch past rfi */
-
-/*
- * This area is used for temporarily saving registers during the
- * critical exception prolog.
- */
-	. = 0xc0
-crit_save:
-_GLOBAL(crit_r10)
-	.space	4
-_GLOBAL(crit_r11)
-	.space	4
-_GLOBAL(crit_srr0)
-	.space	4
-_GLOBAL(crit_srr1)
-	.space	4
-_GLOBAL(crit_r1)
-	.space	4
-_GLOBAL(crit_dear)
-	.space	4
-_GLOBAL(crit_esr)
-	.space	4
-
-/*
- * Exception prolog for critical exceptions.  This is a little different
- * from the normal exception prolog above since a critical exception
- * can potentially occur at any point during normal exception processing.
- * Thus we cannot use the same SPRG registers as the normal prolog above.
- * Instead we use a couple of words of memory at low physical addresses.
- * This is OK since we don't support SMP on these processors.
- */
-.macro CRITICAL_EXCEPTION_PROLOG trapno name
-	stw	r10,crit_r10@l(0)	/* save two registers to work with */
-	stw	r11,crit_r11@l(0)
-	mfspr	r10,SPRN_SRR0
-	mfspr	r11,SPRN_SRR1
-	stw	r10,crit_srr0@l(0)
-	stw	r11,crit_srr1@l(0)
-	mfspr	r10,SPRN_DEAR
-	mfspr	r11,SPRN_ESR
-	stw	r10,crit_dear@l(0)
-	stw	r11,crit_esr@l(0)
-	mfcr	r10			/* save CR in r10 for now	   */
-	mfspr	r11,SPRN_SRR3		/* check whether user or kernel    */
-	andi.	r11,r11,MSR_PR
-	lis	r11,(critirq_ctx-PAGE_OFFSET)@ha
-	lwz	r11,(critirq_ctx-PAGE_OFFSET)@l(r11)
-	beq	1f
-	/* COMING FROM USER MODE */
-	mfspr	r11,SPRN_SPRG_THREAD	/* if from user, start at top of   */
-	lwz	r11,TASK_STACK-THREAD(r11) /* this thread's kernel stack */
-1:	stw	r1,crit_r1@l(0)
-	addi	r1,r11,THREAD_SIZE-INT_FRAME_SIZE /* Alloc an excpt frm  */
-	LOAD_REG_IMMEDIATE(r11, MSR_KERNEL & ~(MSR_ME|MSR_DE|MSR_CE)) /* re-enable MMU */
-	mtspr	SPRN_SRR1, r11
-	lis	r11, 1f@h
-	ori	r11, r11, 1f@l
-	mtspr	SPRN_SRR0, r11
-	rfi
-
-	.text
-1:
-\name\()_virt:
-	lwz	r11,crit_r1@l(0)
-	stw	r11,GPR1(r1)
-	stw	r11,0(r1)
-	mr	r11,r1
-	stw	r10,_CCR(r11)		/* save various registers	   */
-	stw	r12,GPR12(r11)
-	stw	r9,GPR9(r11)
-	mflr	r10
-	stw	r10,_LINK(r11)
-	lis	r9,PAGE_OFFSET@ha
-	lwz	r10,crit_r10@l(r9)
-	lwz	r12,crit_r11@l(r9)
-	stw	r10,GPR10(r11)
-	stw	r12,GPR11(r11)
-	lwz	r12,crit_dear@l(r9)
-	lwz	r9,crit_esr@l(r9)
-	stw	r12,_DEAR(r11)		/* since they may have had stuff   */
-	stw	r9,_ESR(r11)		/* exception was taken		   */
-	mfspr	r12,SPRN_SRR2
-	mfspr	r9,SPRN_SRR3
-	rlwinm	r9,r9,0,14,12		/* clear MSR_WE (necessary?)	   */
-	COMMON_EXCEPTION_PROLOG_END \trapno + 2
-_ASM_NOKPROBE_SYMBOL(\name\()_virt)
-.endm
-
-	/*
-	 * State at this point:
-	 * r9 saved in stack frame, now saved SRR3 & ~MSR_WE
-	 * r10 saved in crit_r10 and in stack frame, trashed
-	 * r11 saved in crit_r11 and in stack frame,
-	 *	now phys stack/exception frame pointer
-	 * r12 saved in stack frame, now saved SRR2
-	 * CR saved in stack frame, CR0.EQ = !SRR3.PR
-	 * LR, DEAR, ESR in stack frame
-	 * r1 saved in stack frame, now virt stack/excframe pointer
-	 * r0, r3-r8 saved in stack frame
-	 */
-
-/*
- * Exception vectors.
- */
-#define CRITICAL_EXCEPTION(n, label, hdlr)			\
-	START_EXCEPTION(n, label);				\
-	CRITICAL_EXCEPTION_PROLOG n label;				\
-	prepare_transfer_to_handler;				\
-	bl	hdlr;						\
-	b	ret_from_crit_exc
-
-/*
- * 0x0100 - Critical Interrupt Exception
- */
-	CRITICAL_EXCEPTION(0x0100, CriticalInterrupt, unknown_exception)
-
-/*
- * 0x0200 - Machine Check Exception
- */
-	CRITICAL_EXCEPTION(0x0200, MachineCheck, machine_check_exception)
-
-/*
- * 0x0300 - Data Storage Exception
- * This happens for just a few reasons.  U0 set (but we don't do that),
- * or zone protection fault (user violation, write to protected page).
- * The other Data TLB exceptions bail out to this point
- * if they can't resolve the lightweight TLB fault.
- */
-	START_EXCEPTION(0x0300,	DataStorage)
-	EXCEPTION_PROLOG 0x300 DataStorage handle_dar_dsisr=1
-	prepare_transfer_to_handler
-	bl	do_page_fault
-	b	interrupt_return
-
-/*
- * 0x0400 - Instruction Storage Exception
- * This is caused by a fetch from non-execute or guarded pages.
- */
-	START_EXCEPTION(0x0400, InstructionAccess)
-	EXCEPTION_PROLOG 0x400 InstructionAccess
-	li	r5,0
-	stw	r5, _ESR(r11)		/* Zero ESR */
-	stw	r12, _DEAR(r11)		/* SRR0 as DEAR */
-	prepare_transfer_to_handler
-	bl	do_page_fault
-	b	interrupt_return
-
-/* 0x0500 - External Interrupt Exception */
-	EXCEPTION(0x0500, HardwareInterrupt, do_IRQ)
-
-/* 0x0600 - Alignment Exception */
-	START_EXCEPTION(0x0600, Alignment)
-	EXCEPTION_PROLOG 0x600 Alignment handle_dar_dsisr=1
-	prepare_transfer_to_handler
-	bl	alignment_exception
-	REST_NVGPRS(r1)
-	b	interrupt_return
-
-/* 0x0700 - Program Exception */
-	START_EXCEPTION(0x0700, ProgramCheck)
-	EXCEPTION_PROLOG 0x700 ProgramCheck handle_dar_dsisr=1
-	prepare_transfer_to_handler
-	bl	program_check_exception
-	REST_NVGPRS(r1)
-	b	interrupt_return
-
-	EXCEPTION(0x0800, Trap_08, unknown_exception)
-	EXCEPTION(0x0900, Trap_09, unknown_exception)
-	EXCEPTION(0x0A00, Trap_0A, unknown_exception)
-	EXCEPTION(0x0B00, Trap_0B, unknown_exception)
-
-/* 0x0C00 - System Call Exception */
-	START_EXCEPTION(0x0C00,	SystemCall)
-	SYSCALL_ENTRY	0xc00
-/*	Trap_0D is commented out to get more space for system call exception */
-
-/*	EXCEPTION(0x0D00, Trap_0D, unknown_exception) */
-	EXCEPTION(0x0E00, Trap_0E, unknown_exception)
-	EXCEPTION(0x0F00, Trap_0F, unknown_exception)
-
-/* 0x1000 - Programmable Interval Timer (PIT) Exception */
-	START_EXCEPTION(0x1000, DecrementerTrap)
-	b Decrementer
-
-/* 0x1010 - Fixed Interval Timer (FIT) Exception */
-	START_EXCEPTION(0x1010, FITExceptionTrap)
-	b FITException
-
-/* 0x1020 - Watchdog Timer (WDT) Exception */
-	START_EXCEPTION(0x1020, WDTExceptionTrap)
-	b WDTException
-
-/* 0x1100 - Data TLB Miss Exception
- * As the name implies, translation is not in the MMU, so search the
- * page tables and fix it.  The only purpose of this function is to
- * load TLB entries from the page table if they exist.
- */
-	START_EXCEPTION(0x1100,	DTLBMiss)
-	mtspr	SPRN_SPRG_SCRATCH5, r10 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r12
-	mfspr	r9, SPRN_PID
-	rlwimi	r12, r9, 0, 0xff
-	mfspr	r10, SPRN_DEAR		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-#ifdef CONFIG_PPC_KUAP
-	rlwinm.	r9, r9, 0, 0xff
-	beq	5f			/* Kuap fault */
-#endif
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r11, 0(r11)		/* Get L1 entry */
-	andi.	r9, r11, _PMD_PRESENT	/* Check if it points to a PTE page */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r11, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r11)		/* Get Linux PTE */
-	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_READ
-	andc.	r9, r9, r11		/* Check permission */
-	bne	5f
-
-	rlwinm	r9, r11, 1, _PAGE_WRITE	/* dirty => w */
-	and	r9, r9, r11		/* hwwrite = dirty & w */
-	rlwimi	r11, r9, 0, _PAGE_WRITE	/* replace w by hwwrite */
-
-	/* Create TLB tag.  This is the faulting address plus a static
-	 * set of bits.  These are size, valid, E, U0.
-	*/
-	li	r9, 0x00c0
-	rlwimi	r10, r9, 0, 20, 31
-
-	b	finish_tlb_load
-
-2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r11, 2, 22, 24
-	beq	5f
-
-	/* Create TLB tag.  This is the faulting address, plus a static
-	 * set of bits (valid, E, U0) plus the size from the PMD.
-	 */
-	ori	r9, r9, 0x40
-	rlwimi	r10, r9, 0, 20, 31
-
-	b	finish_tlb_load
-
-5:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-	mtspr	SPRN_PID, r12
-	mtcrf	0x80, r12
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mfspr	r10, SPRN_SPRG_SCRATCH5
-	b	DataStorage
-
-/* 0x1200 - Instruction TLB Miss Exception
- * Nearly the same as above, except we get our information from different
- * registers and bailout to a different point.
- */
-	START_EXCEPTION(0x1200,	ITLBMiss)
-	mtspr	SPRN_SPRG_SCRATCH5, r10	 /* Save some working registers */
-	mtspr	SPRN_SPRG_SCRATCH6, r11
-	mtspr	SPRN_SPRG_SCRATCH3, r12
-	mtspr	SPRN_SPRG_SCRATCH4, r9
-	mfcr	r12
-	mfspr	r9, SPRN_PID
-	rlwimi	r12, r9, 0, 0xff
-	mfspr	r10, SPRN_SRR0		/* Get faulting address */
-
-	/* If we are faulting a kernel address, we have to use the
-	 * kernel page tables.
-	 */
-	lis	r11, PAGE_OFFSET@h
-	cmplw	r10, r11
-	blt+	3f
-	lis	r11, swapper_pg_dir@h
-	ori	r11, r11, swapper_pg_dir@l
-	li	r9, 0
-	mtspr	SPRN_PID, r9		/* TLB will have 0 TID */
-	b	4f
-
-	/* Get the PGD for the current thread.
-	 */
-3:
-	mfspr	r11,SPRN_SPRG_THREAD
-	lwz	r11,PGDIR(r11)
-#ifdef CONFIG_PPC_KUAP
-	rlwinm.	r9, r9, 0, 0xff
-	beq	5f			/* Kuap fault */
-#endif
-4:
-	tophys(r11, r11)
-	rlwimi	r11, r10, 12, 20, 29	/* Create L1 (pgdir/pmd) address */
-	lwz	r11, 0(r11)		/* Get L1 entry */
-	andi.	r9, r11, _PMD_PRESENT	/* Check if it points to a PTE page */
-	beq	2f			/* Bail if no table */
-
-	rlwimi	r11, r10, 22, 20, 29	/* Compute PTE address */
-	lwz	r11, 0(r11)		/* Get Linux PTE */
-	li	r9, _PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
-	andc.	r9, r9, r11		/* Check permission */
-	bne	5f
-
-	rlwinm	r9, r11, 1, _PAGE_WRITE	/* dirty => w */
-	and	r9, r9, r11		/* hwwrite = dirty & w */
-	rlwimi	r11, r9, 0, _PAGE_WRITE	/* replace w by hwwrite */
-
-	/* Create TLB tag.  This is the faulting address plus a static
-	 * set of bits.  These are size, valid, E, U0.
-	*/
-	li	r9, 0x00c0
-	rlwimi	r10, r9, 0, 20, 31
-
-	b	finish_tlb_load
-
-2:	/* Check for possible large-page pmd entry */
-	rlwinm.	r9, r11, 2, 22, 24
-	beq	5f
-
-	/* Create TLB tag.  This is the faulting address, plus a static
-	 * set of bits (valid, E, U0) plus the size from the PMD.
-	 */
-	ori	r9, r9, 0x40
-	rlwimi	r10, r9, 0, 20, 31
-
-	b	finish_tlb_load
-
-5:
-	/* The bailout.  Restore registers to pre-exception conditions
-	 * and call the heavyweights to help us out.
-	 */
-	mtspr	SPRN_PID, r12
-	mtcrf	0x80, r12
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mfspr	r10, SPRN_SPRG_SCRATCH5
-	b	InstructionAccess
-
-	EXCEPTION(0x1300, Trap_13, unknown_exception)
-	EXCEPTION(0x1400, Trap_14, unknown_exception)
-	EXCEPTION(0x1500, Trap_15, unknown_exception)
-	EXCEPTION(0x1600, Trap_16, unknown_exception)
-	EXCEPTION(0x1700, Trap_17, unknown_exception)
-	EXCEPTION(0x1800, Trap_18, unknown_exception)
-	EXCEPTION(0x1900, Trap_19, unknown_exception)
-	EXCEPTION(0x1A00, Trap_1A, unknown_exception)
-	EXCEPTION(0x1B00, Trap_1B, unknown_exception)
-	EXCEPTION(0x1C00, Trap_1C, unknown_exception)
-	EXCEPTION(0x1D00, Trap_1D, unknown_exception)
-	EXCEPTION(0x1E00, Trap_1E, unknown_exception)
-	EXCEPTION(0x1F00, Trap_1F, unknown_exception)
-
-/* Check for a single step debug exception while in an exception
- * handler before state has been saved.  This is to catch the case
- * where an instruction that we are trying to single step causes
- * an exception (eg ITLB/DTLB miss) and thus the first instruction of
- * the exception handler generates a single step debug exception.
- *
- * If we get a debug trap on the first instruction of an exception handler,
- * we reset the MSR_DE in the _exception handler's_ MSR (the debug trap is
- * a critical exception, so we are using SPRN_CSRR1 to manipulate the MSR).
- * The exception handler was handling a non-critical interrupt, so it will
- * save (and later restore) the MSR via SPRN_SRR1, which will still have
- * the MSR_DE bit set.
- */
-	/* 0x2000 - Debug Exception */
-	START_EXCEPTION(0x2000, DebugTrap)
-	CRITICAL_EXCEPTION_PROLOG 0x2000 DebugTrap
-
-	/*
-	 * If this is a single step or branch-taken exception in an
-	 * exception entry sequence, it was probably meant to apply to
-	 * the code where the exception occurred (since exception entry
-	 * doesn't turn off DE automatically).  We simulate the effect
-	 * of turning off DE on entry to an exception handler by turning
-	 * off DE in the SRR3 value and clearing the debug status.
-	 */
-	mfspr	r10,SPRN_DBSR		/* check single-step/branch taken */
-	andis.	r10,r10,DBSR_IC@h
-	beq+	2f
-
-	andi.	r10,r9,MSR_IR|MSR_PR	/* check supervisor + MMU off */
-	beq	1f			/* branch and fix it up */
-
-	mfspr   r10,SPRN_SRR2		/* Faulting instruction address */
-	cmplwi  r10,0x2100
-	bgt+    2f			/* address above exception vectors */
-
-	/* here it looks like we got an inappropriate debug exception. */
-1:	rlwinm	r9,r9,0,~MSR_DE		/* clear DE in the SRR3 value */
-	lis	r10,DBSR_IC@h		/* clear the IC event */
-	mtspr	SPRN_DBSR,r10
-	/* restore state and get out */
-	lwz	r10,_CCR(r11)
-	lwz	r0,GPR0(r11)
-	lwz	r1,GPR1(r11)
-	mtcrf	0x80,r10
-	mtspr	SPRN_SRR2,r12
-	mtspr	SPRN_SRR3,r9
-	lwz	r9,GPR9(r11)
-	lwz	r12,GPR12(r11)
-	lwz	r10,crit_r10@l(0)
-	lwz	r11,crit_r11@l(0)
-	rfci
-	b	.
-
-	/* continue normal handling for a critical exception... */
-2:	mfspr	r4,SPRN_DBSR
-	stw	r4,_ESR(r11)		/* DebugException takes DBSR in _ESR */
-	prepare_transfer_to_handler
-	bl	DebugException
-	b	ret_from_crit_exc
-
-	/* Programmable Interval Timer (PIT) Exception. (from 0x1000) */
-	__HEAD
-Decrementer:
-	EXCEPTION_PROLOG 0x1000 Decrementer
-	lis	r0,TSR_PIS@h
-	mtspr	SPRN_TSR,r0		/* Clear the PIT exception */
-	prepare_transfer_to_handler
-	bl	timer_interrupt
-	b	interrupt_return
-
-	/* Fixed Interval Timer (FIT) Exception. (from 0x1010) */
-	__HEAD
-FITException:
-	EXCEPTION_PROLOG 0x1010 FITException
-	prepare_transfer_to_handler
-	bl	unknown_exception
-	b	interrupt_return
-
-	/* Watchdog Timer (WDT) Exception. (from 0x1020) */
-	__HEAD
-WDTException:
-	CRITICAL_EXCEPTION_PROLOG 0x1020 WDTException
-	prepare_transfer_to_handler
-	bl	WatchdogException
-	b	ret_from_crit_exc
-
-/* Other PowerPC processors, namely those derived from the 6xx-series
- * have vectors from 0x2100 through 0x2F00 defined, but marked as reserved.
- * However, for the 4xx-series processors these are neither defined nor
- * reserved.
- */
-
-	__HEAD
-	/* Damn, I came up one instruction too many to fit into the
-	 * exception space :-).  Both the instruction and data TLB
-	 * miss get to this point to load the TLB.
-	 * 	r10 - TLB_TAG value
-	 * 	r11 - Linux PTE
-	 *	r9 - available to use
-	 *	PID - loaded with proper value when we get here
-	 *	Upon exit, we reload everything and RFI.
-	 * Actually, it will fit now, but oh well.....a common place
-	 * to load the TLB.
-	 */
-tlb_4xx_index:
-	.long	0
-finish_tlb_load:
-	/*
-	 * Clear out the software-only bits in the PTE to generate the
-	 * TLB_DATA value.  These are the bottom 2 bits of the RPM, the
-	 * 4 bits of the zone field, and M.
-	 */
-	li	r9, 0x0cf2
-	andc	r11, r11, r9
-	rlwimi	r11, r10, 8, 24, 27	/* Copy 4 upper address bit into zone */
-
-	/* load the next available TLB index. */
-	lwz	r9, tlb_4xx_index@l(0)
-	addi	r9, r9, 1
-	andi.	r9, r9, PPC40X_TLB_SIZE - 1
-	stw	r9, tlb_4xx_index@l(0)
-
-	tlbwe	r11, r9, TLB_DATA		/* Load TLB LO */
-	tlbwe	r10, r9, TLB_TAG		/* Load TLB HI */
-
-	/* Done...restore registers and get out of here.
-	*/
-	mtspr	SPRN_PID, r12
-	mtcrf	0x80, r12
-	mfspr	r9, SPRN_SPRG_SCRATCH4
-	mfspr	r12, SPRN_SPRG_SCRATCH3
-	mfspr	r11, SPRN_SPRG_SCRATCH6
-	mfspr	r10, SPRN_SPRG_SCRATCH5
-	rfi			/* Should sync shadow TLBs */
-	b	.		/* prevent prefetch past rfi */
-
-/* This is where the main kernel code starts.
- */
-start_here:
-
-	/* ptr to current */
-	lis	r2,init_task@h
-	ori	r2,r2,init_task@l
-
-	/* ptr to phys current thread */
-	tophys(r4,r2)
-	addi	r4,r4,THREAD	/* init task's THREAD */
-	mtspr	SPRN_SPRG_THREAD,r4
-
-	/* stack */
-	lis	r1,init_thread_union@ha
-	addi	r1,r1,init_thread_union@l
-	li	r0,0
-	stwu	r0,THREAD_SIZE-STACK_FRAME_MIN_SIZE(r1)
-
-	bl	early_init	/* We have to do this with MMU on */
-
-/*
- * Decide what sort of machine this is and initialize the MMU.
- */
-#ifdef CONFIG_KASAN
-	bl	kasan_early_init
-#endif
-	li	r3,0
-	mr	r4,r31
-	bl	machine_init
-	bl	MMU_init
-
-/* Go back to running unmapped so we can load up new values
- * and change to using our exception vectors.
- * On the 4xx, all we have to do is invalidate the TLB to clear
- * the old 16M byte TLB mappings.
- */
-	lis	r4,2f@h
-	ori	r4,r4,2f@l
-	tophys(r4,r4)
-	lis	r3,(MSR_KERNEL & ~(MSR_IR|MSR_DR))@h
-	ori	r3,r3,(MSR_KERNEL & ~(MSR_IR|MSR_DR))@l
-	mtspr	SPRN_SRR0,r4
-	mtspr	SPRN_SRR1,r3
-	rfi
-	b	.		/* prevent prefetch past rfi */
-
-/* Load up the kernel context */
-2:
-	sync			/* Flush to memory before changing TLB */
-	tlbia
-	isync			/* Flush shadow TLBs */
-
-	/* set up the PTE pointers for the Abatron bdiGDB.
-	*/
-	lis	r6, swapper_pg_dir@h
-	ori	r6, r6, swapper_pg_dir@l
-	lis	r5, abatron_pteptrs@h
-	ori	r5, r5, abatron_pteptrs@l
-	stw	r5, 0xf0(0)	/* Must match your Abatron config file */
-	tophys(r5,r5)
-	stw	r6, 0(r5)
-
-/* Now turn on the MMU for real! */
-	lis	r4,MSR_KERNEL@h
-	ori	r4,r4,MSR_KERNEL@l
-	lis	r3,start_kernel@h
-	ori	r3,r3,start_kernel@l
-	mtspr	SPRN_SRR0,r3
-	mtspr	SPRN_SRR1,r4
-	rfi			/* enable MMU and jump to start_kernel */
-	b	.		/* prevent prefetch past rfi */
-
-/* Set up the initial MMU state so we can do the first level of
- * kernel initialization.  This maps the first 32 MBytes of memory 1:1
- * virtual to physical and more importantly sets the cache mode.
- */
-SYM_FUNC_START_LOCAL(initial_mmu)
-	tlbia			/* Invalidate all TLB entries */
-	isync
-
-	/* We should still be executing code at physical address 0x0000xxxx
-	 * at this point. However, start_here is at virtual address
-	 * 0xC000xxxx. So, set up a TLB mapping to cover this once
-	 * translation is enabled.
-	 */
-
-	lis	r3,KERNELBASE@h		/* Load the kernel virtual address */
-	ori	r3,r3,KERNELBASE@l
-	tophys(r4,r3)			/* Load the kernel physical address */
-
-	iccci	r0,r3			/* Invalidate the i-cache before use */
-
-	/* Load the kernel PID.
-	*/
-	li	r0,0
-	mtspr	SPRN_PID,r0
-	sync
-
-	/* Configure and load one entry into TLB slots 63 */
-	clrrwi	r4,r4,10		/* Mask off the real page number */
-	ori	r4,r4,(TLB_WR | TLB_EX)	/* Set the write and execute bits */
-
-	clrrwi	r3,r3,10		/* Mask off the effective page number */
-	ori	r3,r3,(TLB_VALID | TLB_PAGESZ(PAGESZ_16M))
-
-        li      r0,63                    /* TLB slot 63 */
-
-	tlbwe	r4,r0,TLB_DATA		/* Load the data portion of the entry */
-	tlbwe	r3,r0,TLB_TAG		/* Load the tag portion of the entry */
-
-	li	r0,62			/* TLB slot 62 */
-	addis	r4,r4,SZ_16M@h
-	addis	r3,r3,SZ_16M@h
-	tlbwe	r4,r0,TLB_DATA		/* Load the data portion of the entry */
-	tlbwe	r3,r0,TLB_TAG		/* Load the tag portion of the entry */
-
-	isync
-
-	/* Establish the exception vector base
-	*/
-	lis	r4,KERNELBASE@h		/* EVPR only uses the high 16-bits */
-	tophys(r0,r4)			/* Use the physical address */
-	mtspr	SPRN_EVPR,r0
-
-	blr
-SYM_FUNC_END(initial_mmu)
-
-_GLOBAL(abort)
-        mfspr   r13,SPRN_DBCR0
-        oris    r13,r13,DBCR0_RST_SYSTEM@h
-        mtspr   SPRN_DBCR0,r13
diff --git a/arch/powerpc/kernel/head_booke.h b/arch/powerpc/kernel/head_booke.h
index b6b5b01a173c..0b5c1993809e 100644
--- a/arch/powerpc/kernel/head_booke.h
+++ b/arch/powerpc/kernel/head_booke.h
@@ -145,10 +145,9 @@ ALT_FTR_SECTION_END_IFSET(CPU_FTR_EMB_HV)
 	b	transfer_to_syscall	/* jump to handler */
 .endm
 
-/* To handle the additional exception priority levels on 40x and Book-E
+/* To handle the additional exception priority levels on Book-E
  * processors we allocate a stack per additional priority level.
  *
- * On 40x critical is the only additional level
  * On 44x/e500 we have critical and machine check
  *
  * Additionally we reserve a SPRG for each priority level so we can free up a
diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
index 2eabb15687a6..033cd00aa0fc 100644
--- a/arch/powerpc/kernel/misc_32.S
+++ b/arch/powerpc/kernel/misc_32.S
@@ -176,46 +176,6 @@ _GLOBAL(low_choose_7447a_dfs)
 
 #endif /* CONFIG_CPU_FREQ_PMAC && CONFIG_PPC_BOOK3S_32 */
 
-#ifdef CONFIG_40x
-
-/*
- * Do an IO access in real mode
- */
-_GLOBAL(real_readb)
-	mfmsr	r7
-	rlwinm	r0,r7,0,~MSR_DR
-	sync
-	mtmsr	r0
-	sync
-	isync
-	lbz	r3,0(r3)
-	sync
-	mtmsr	r7
-	sync
-	isync
-	blr
-_ASM_NOKPROBE_SYMBOL(real_readb)
-
-	/*
- * Do an IO access in real mode
- */
-_GLOBAL(real_writeb)
-	mfmsr	r7
-	rlwinm	r0,r7,0,~MSR_DR
-	sync
-	mtmsr	r0
-	sync
-	isync
-	stb	r3,0(r4)
-	sync
-	mtmsr	r7
-	sync
-	isync
-	blr
-_ASM_NOKPROBE_SYMBOL(real_writeb)
-
-#endif /* CONFIG_40x */
-
 /*
  * Copy a whole page.  We use the dcbz instruction on the destination
  * to reduce memory traffic (it eliminates the unnecessary reads of
diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
index f23430adb68a..28d6472c380a 100644
--- a/arch/powerpc/kernel/traps.c
+++ b/arch/powerpc/kernel/traps.c
@@ -2244,7 +2244,7 @@ void __noreturn unrecoverable_exception(struct pt_regs *regs)
 		;
 }
 
-#if defined(CONFIG_BOOKE_WDT) || defined(CONFIG_40x)
+#ifdef CONFIG_BOOKE_WDT
 DEFINE_INTERRUPT_HANDLER_NMI(WatchdogException)
 {
 	printk (KERN_EMERG "PowerPC Book-E Watchdog Exception\n");
diff --git a/arch/powerpc/kernel/udbg.c b/arch/powerpc/kernel/udbg.c
index 92b3fc258d11..4b99208f5adc 100644
--- a/arch/powerpc/kernel/udbg.c
+++ b/arch/powerpc/kernel/udbg.c
@@ -49,9 +49,6 @@ void __init udbg_early_init(void)
 #elif defined(CONFIG_PPC_EARLY_DEBUG_44x)
 	/* PPC44x debug */
 	udbg_init_44x_as1();
-#elif defined(CONFIG_PPC_EARLY_DEBUG_40x)
-	/* PPC40x debug */
-	udbg_init_40x_realmode();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_CPM)
 	udbg_init_cpm();
 #elif defined(CONFIG_PPC_EARLY_DEBUG_USBGECKO)
diff --git a/arch/powerpc/kernel/udbg_16550.c b/arch/powerpc/kernel/udbg_16550.c
index a0467e528b70..313802aff571 100644
--- a/arch/powerpc/kernel/udbg_16550.c
+++ b/arch/powerpc/kernel/udbg_16550.c
@@ -274,29 +274,6 @@ void __init udbg_init_44x_as1(void)
 
 #endif /* CONFIG_PPC_EARLY_DEBUG_44x */
 
-#ifdef CONFIG_PPC_EARLY_DEBUG_40x
-
-static u8 udbg_uart_in_40x(unsigned int reg)
-{
-	return real_readb((void __iomem *)CONFIG_PPC_EARLY_DEBUG_40x_PHYSADDR
-			  + reg);
-}
-
-static void udbg_uart_out_40x(unsigned int reg, u8 val)
-{
-	real_writeb(val, (void __iomem *)CONFIG_PPC_EARLY_DEBUG_40x_PHYSADDR
-		    + reg);
-}
-
-void __init udbg_init_40x_realmode(void)
-{
-	udbg_uart_in = udbg_uart_in_40x;
-	udbg_uart_out = udbg_uart_out_40x;
-	udbg_use_uart();
-}
-
-#endif /* CONFIG_PPC_EARLY_DEBUG_40x */
-
 #ifdef CONFIG_PPC_EARLY_DEBUG_16550
 
 static void __iomem *udbg_uart_early_addr;
diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
index 6949c2c937e7..b2d1eea09761 100644
--- a/arch/powerpc/mm/mmu_decl.h
+++ b/arch/powerpc/mm/mmu_decl.h
@@ -20,9 +20,9 @@
 #include <asm/trace.h>
 
 /*
- * On 40x and 8xx, we directly inline tlbia and tlbivax
+ * On 8xx, we directly inline tlbia
  */
-#if defined(CONFIG_40x) || defined(CONFIG_PPC_8xx)
+#ifdef CONFIG_PPC_8xx
 static inline void _tlbil_all(void)
 {
 	asm volatile ("sync; tlbia; isync" : : : "memory");
@@ -35,7 +35,7 @@ static inline void _tlbil_pid(unsigned int pid)
 }
 #define _tlbil_pid_noind(pid)	_tlbil_pid(pid)
 
-#else /* CONFIG_40x || CONFIG_PPC_8xx */
+#else /* CONFIG_PPC_8xx */
 extern void _tlbil_all(void);
 extern void _tlbil_pid(unsigned int pid);
 #ifdef CONFIG_PPC_BOOK3E_64
@@ -43,7 +43,7 @@ extern void _tlbil_pid_noind(unsigned int pid);
 #else
 #define _tlbil_pid_noind(pid)	_tlbil_pid(pid)
 #endif
-#endif /* !(CONFIG_40x || CONFIG_PPC_8xx) */
+#endif /* !CONFIG_PPC_8xx */
 
 /*
  * On 8xx, we directly inline tlbie, on others, it's extern
diff --git a/arch/powerpc/mm/nohash/40x.c b/arch/powerpc/mm/nohash/40x.c
deleted file mode 100644
index e835e80c09db..000000000000
--- a/arch/powerpc/mm/nohash/40x.c
+++ /dev/null
@@ -1,161 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * This file contains the routines for initializing the MMU
- * on the 4xx series of chips.
- *  -- paulus
- *
- *  Derived from arch/ppc/mm/init.c:
- *    Copyright (C) 1995-1996 Gary Thomas (gdt@linuxppc.org)
- *
- *  Modifications by Paul Mackerras (PowerMac) (paulus@cs.anu.edu.au)
- *  and Cort Dougan (PReP) (cort@cs.nmt.edu)
- *    Copyright (C) 1996 Paul Mackerras
- *
- *  Derived from "arch/i386/mm/init.c"
- *    Copyright (C) 1991, 1992, 1993, 1994  Linus Torvalds
- */
-
-#include <linux/signal.h>
-#include <linux/sched.h>
-#include <linux/kernel.h>
-#include <linux/errno.h>
-#include <linux/string.h>
-#include <linux/types.h>
-#include <linux/ptrace.h>
-#include <linux/mman.h>
-#include <linux/mm.h>
-#include <linux/swap.h>
-#include <linux/stddef.h>
-#include <linux/vmalloc.h>
-#include <linux/init.h>
-#include <linux/delay.h>
-#include <linux/highmem.h>
-#include <linux/memblock.h>
-
-#include <asm/io.h>
-#include <asm/mmu_context.h>
-#include <asm/mmu.h>
-#include <linux/uaccess.h>
-#include <asm/smp.h>
-#include <asm/bootx.h>
-#include <asm/machdep.h>
-#include <asm/setup.h>
-
-#include <mm/mmu_decl.h>
-
-/*
- * MMU_init_hw does the chip-specific initialization of the MMU hardware.
- */
-void __init MMU_init_hw(void)
-{
-	int i;
-	unsigned long zpr;
-
-	/*
-	 * The Zone Protection Register (ZPR) defines how protection will
-	 * be applied to every page which is a member of a given zone.
-	 * The zone index bits (of ZSEL) in the PTE are used for software
-	 * indicators. We use the 4 upper bits of virtual address to select
-	 * the zone. We set all zones above TASK_SIZE to zero, allowing
-	 * only kernel access as indicated in the PTE. For zones below
-	 * TASK_SIZE, we set a 01 binary (a value of 10 will not work)
-	 * to allow user access as indicated in the PTE.  This also allows
-	 * kernel access as indicated in the PTE.
-	 */
-
-	for (i = 0, zpr = 0; i < TASK_SIZE >> 28; i++)
-		zpr |= 1 << (30 - i * 2);
-
-	mtspr(SPRN_ZPR, zpr);
-
-	flush_instruction_cache();
-
-	/*
-	 * Set up the real-mode cache parameters for the exception vector
-	 * handlers (which are run in real-mode).
-	 */
-
-        mtspr(SPRN_DCWR, 0x00000000);	/* All caching is write-back */
-
-        /*
-	 * Cache instruction and data space where the exception
-	 * vectors and the kernel live in real-mode.
-	 */
-
-        mtspr(SPRN_DCCR, 0xFFFF0000);	/* 2GByte of data space at 0x0. */
-        mtspr(SPRN_ICCR, 0xFFFF0000);	/* 2GByte of instr. space at 0x0. */
-}
-
-#define LARGE_PAGE_SIZE_16M	(1<<24)
-#define LARGE_PAGE_SIZE_4M	(1<<22)
-
-unsigned long __init mmu_mapin_ram(unsigned long base, unsigned long top)
-{
-	unsigned long v, s, mapped;
-	phys_addr_t p;
-
-	v = KERNELBASE;
-	p = 0;
-	s = total_lowmem;
-
-	if (IS_ENABLED(CONFIG_KFENCE))
-		return 0;
-
-	if (debug_pagealloc_enabled())
-		return 0;
-
-	if (strict_kernel_rwx_enabled())
-		return 0;
-
-	while (s >= LARGE_PAGE_SIZE_16M) {
-		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_16M | _PAGE_EXEC | _PAGE_RW;
-
-		pmdp = pmd_off_k(v);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-		*pmdp++ = __pmd(val);
-
-		v += LARGE_PAGE_SIZE_16M;
-		p += LARGE_PAGE_SIZE_16M;
-		s -= LARGE_PAGE_SIZE_16M;
-	}
-
-	while (s >= LARGE_PAGE_SIZE_4M) {
-		pmd_t *pmdp;
-		unsigned long val = p | _PMD_SIZE_4M | _PAGE_EXEC | _PAGE_RW;
-
-		pmdp = pmd_off_k(v);
-		*pmdp = __pmd(val);
-
-		v += LARGE_PAGE_SIZE_4M;
-		p += LARGE_PAGE_SIZE_4M;
-		s -= LARGE_PAGE_SIZE_4M;
-	}
-
-	mapped = total_lowmem - s;
-
-	/* If the size of RAM is not an exact power of two, we may not
-	 * have covered RAM in its entirety with 16 and 4 MiB
-	 * pages. Consequently, restrict the top end of RAM currently
-	 * allocable so that calls to the MEMBLOCK to allocate PTEs for "tail"
-	 * coverage with normal-sized pages (or other reasons) do not
-	 * attempt to allocate outside the allowed range.
-	 */
-	memblock_set_current_limit(mapped);
-
-	return mapped;
-}
-
-void setup_initial_memory_limit(phys_addr_t first_memblock_base,
-				phys_addr_t first_memblock_size)
-{
-	/* We don't currently support the first MEMBLOCK not mapping 0
-	 * physical on those processors
-	 */
-	BUG_ON(first_memblock_base != 0);
-
-	/* 40x can only access 16MB at the moment (see head_40x.S) */
-	memblock_set_current_limit(min_t(u64, first_memblock_size, 0x00800000));
-}
diff --git a/arch/powerpc/mm/nohash/Makefile b/arch/powerpc/mm/nohash/Makefile
index b3f0498dd42f..86d0fe434824 100644
--- a/arch/powerpc/mm/nohash/Makefile
+++ b/arch/powerpc/mm/nohash/Makefile
@@ -2,7 +2,6 @@
 
 obj-y				+= mmu_context.o tlb.o tlb_low.o kup.o
 obj-$(CONFIG_PPC_BOOK3E_64)  	+= tlb_low_64e.o book3e_pgtable.o
-obj-$(CONFIG_40x)		+= 40x.o
 obj-$(CONFIG_44x)		+= 44x.o
 obj-$(CONFIG_PPC_8xx)		+= 8xx.o
 obj-$(CONFIG_PPC_E500)		+= e500.o
diff --git a/arch/powerpc/mm/nohash/kup.c b/arch/powerpc/mm/nohash/kup.c
index e1f7de2e54ec..c20c4f357fbf 100644
--- a/arch/powerpc/mm/nohash/kup.c
+++ b/arch/powerpc/mm/nohash/kup.c
@@ -15,8 +15,6 @@
 void setup_kuap(bool disabled)
 {
 	if (disabled) {
-		if (IS_ENABLED(CONFIG_40x))
-			disable_kuep = true;
 		if (smp_processor_id() == boot_cpuid)
 			cur_cpu_spec->mmu_features &= ~MMU_FTR_KUAP;
 		return;
diff --git a/arch/powerpc/mm/nohash/mmu_context.c b/arch/powerpc/mm/nohash/mmu_context.c
index ccd5819b1bd9..92dc028aff1f 100644
--- a/arch/powerpc/mm/nohash/mmu_context.c
+++ b/arch/powerpc/mm/nohash/mmu_context.c
@@ -219,9 +219,6 @@ static void set_context(unsigned long id, pgd_t *pgd)
 		/* sync */
 		mb();
 	} else if (kuap_is_disabled()) {
-		if (IS_ENABLED(CONFIG_40x))
-			mb();	/* sync */
-
 		mtspr(SPRN_PID, id);
 		isync();
 	}
diff --git a/arch/powerpc/mm/nohash/tlb_low.S b/arch/powerpc/mm/nohash/tlb_low.S
index e1199608ff4d..c4d296e73731 100644
--- a/arch/powerpc/mm/nohash/tlb_low.S
+++ b/arch/powerpc/mm/nohash/tlb_low.S
@@ -32,32 +32,7 @@
 #include <asm/asm-compat.h>
 #include <asm/feature-fixups.h>
 
-#if defined(CONFIG_40x)
-
-/*
- * 40x implementation needs only tlbil_va
- */
-_GLOBAL(__tlbil_va)
-	/* We run the search with interrupts disabled because we have to change
-	 * the PID and I don't want to preempt when that happens.
-	 */
-	mfmsr	r5
-	mfspr	r6,SPRN_PID
-	wrteei	0
-	mtspr	SPRN_PID,r4
-	tlbsx.	r3, 0, r3
-	mtspr	SPRN_PID,r6
-	wrtee	r5
-	bne	1f
-	sync
-	/* There are only 64 TLB entries, so r3 < 64, which means bit 25 is
-	 * clear. Since 25 is the V bit in the TLB_TAG, loading this value
-	 * will invalidate the TLB entry. */
-	tlbwe	r3, r3, TLB_TAG
-	isync
-1:	blr
-
-#elif defined(CONFIG_PPC_8xx)
+#if defined(CONFIG_PPC_8xx)
 
 /*
  * Nothing to do for 8xx, everything is inline
diff --git a/arch/powerpc/platforms/4xx/pci.c b/arch/powerpc/platforms/4xx/pci.c
index 48626615b18b..db6d33ca753f 100644
--- a/arch/powerpc/platforms/4xx/pci.c
+++ b/arch/powerpc/platforms/4xx/pci.c
@@ -1263,102 +1263,6 @@ static struct ppc4xx_pciex_hwops ppc460sx_pcie_hwops __initdata = {
 
 #endif /* CONFIG_44x */
 
-#ifdef CONFIG_40x
-
-static int __init ppc405ex_pciex_core_init(struct device_node *np)
-{
-	/* Nothing to do, return 2 ports */
-	return 2;
-}
-
-static void __init ppc405ex_pcie_phy_reset(struct ppc4xx_pciex_port *port)
-{
-	/* Assert the PE0_PHY reset */
-	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01010000);
-	msleep(1);
-
-	/* deassert the PE0_hotreset */
-	if (port->endpoint)
-		mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01111000);
-	else
-		mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x01101000);
-
-	/* poll for phy !reset */
-	/* XXX FIXME add timeout */
-	while (!(mfdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSTA) & 0x00001000))
-		;
-
-	/* deassert the PE0_gpl_utl_reset */
-	mtdcri(SDR0, port->sdr_base + PESDRn_RCSSET, 0x00101000);
-}
-
-static int __init ppc405ex_pciex_init_port_hw(struct ppc4xx_pciex_port *port)
-{
-	u32 val;
-
-	if (port->endpoint)
-		val = PTYPE_LEGACY_ENDPOINT;
-	else
-		val = PTYPE_ROOT_PORT;
-
-	mtdcri(SDR0, port->sdr_base + PESDRn_DLPSET,
-	       1 << 24 | val << 20 | LNKW_X1 << 12);
-
-	mtdcri(SDR0, port->sdr_base + PESDRn_UTLSET1, 0x00000000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_UTLSET2, 0x01010000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSET1, 0x720F0000);
-	mtdcri(SDR0, port->sdr_base + PESDRn_405EX_PHYSET2, 0x70600003);
-
-	/*
-	 * Only reset the PHY when no link is currently established.
-	 * This is for the Atheros PCIe board which has problems to establish
-	 * the link (again) after this PHY reset. All other currently tested
-	 * PCIe boards don't show this problem.
-	 * This has to be re-tested and fixed in a later release!
-	 */
-	val = mfdcri(SDR0, port->sdr_base + PESDRn_LOOP);
-	if (!(val & 0x00001000))
-		ppc405ex_pcie_phy_reset(port);
-
-	dcr_write(port->dcrs, DCRO_PEGPL_CFG, 0x10000000);  /* guarded on */
-
-	port->has_ibpre = 1;
-
-	return ppc4xx_pciex_port_reset_sdr(port);
-}
-
-static int ppc405ex_pciex_init_utl(struct ppc4xx_pciex_port *port)
-{
-	dcr_write(port->dcrs, DCRO_PEGPL_SPECIAL, 0x0);
-
-	/*
-	 * Set buffer allocations and then assert VRB and TXE.
-	 */
-	out_be32(port->utl_base + PEUTL_OUTTR,   0x02000000);
-	out_be32(port->utl_base + PEUTL_INTR,    0x02000000);
-	out_be32(port->utl_base + PEUTL_OPDBSZ,  0x04000000);
-	out_be32(port->utl_base + PEUTL_PBBSZ,   0x21000000);
-	out_be32(port->utl_base + PEUTL_IPHBSZ,  0x02000000);
-	out_be32(port->utl_base + PEUTL_IPDBSZ,  0x04000000);
-	out_be32(port->utl_base + PEUTL_RCIRQEN, 0x00f00000);
-	out_be32(port->utl_base + PEUTL_PCTL,    0x80800066);
-
-	out_be32(port->utl_base + PEUTL_PBCTL,   0x08000000);
-
-	return 0;
-}
-
-static struct ppc4xx_pciex_hwops ppc405ex_pcie_hwops __initdata =
-{
-	.want_sdr	= true,
-	.core_init	= ppc405ex_pciex_core_init,
-	.port_init_hw	= ppc405ex_pciex_init_port_hw,
-	.setup_utl	= ppc405ex_pciex_init_utl,
-	.check_link	= ppc4xx_pciex_check_link_sdr,
-};
-
-#endif /* CONFIG_40x */
-
 #ifdef CONFIG_476FPE
 static int __init ppc_476fpe_pciex_core_init(struct device_node *np)
 {
@@ -1427,10 +1331,6 @@ static int __init ppc4xx_pciex_check_core_init(struct device_node *np)
 	if (of_device_is_compatible(np, "ibm,plb-pciex-apm821xx"))
 		ppc4xx_pciex_hwops = &apm821xx_pcie_hwops;
 #endif /* CONFIG_44x    */
-#ifdef CONFIG_40x
-	if (of_device_is_compatible(np, "ibm,plb-pciex-405ex"))
-		ppc4xx_pciex_hwops = &ppc405ex_pcie_hwops;
-#endif
 #ifdef CONFIG_476FPE
 	if (of_device_is_compatible(np, "ibm,plb-pciex-476fpe")
 		|| of_device_is_compatible(np, "ibm,plb-pciex-476gtr"))
diff --git a/scripts/head-object-list.txt b/scripts/head-object-list.txt
index 890f69005bab..fd5d00bac447 100644
--- a/scripts/head-object-list.txt
+++ b/scripts/head-object-list.txt
@@ -27,7 +27,6 @@ arch/mips/kernel/head.o
 arch/nios2/kernel/head.o
 arch/openrisc/kernel/head.o
 arch/parisc/kernel/head.o
-arch/powerpc/kernel/head_40x.o
 arch/powerpc/kernel/head_44x.o
 arch/powerpc/kernel/head_64.o
 arch/powerpc/kernel/head_8xx.o
-- 
2.45.2

