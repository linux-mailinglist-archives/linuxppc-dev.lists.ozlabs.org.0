Return-Path: <linuxppc-dev+bounces-15340-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E4B6CF9C89
	for <lists+linuxppc-dev@lfdr.de>; Tue, 06 Jan 2026 18:43:06 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dlz5z6JX9z2xjb;
	Wed, 07 Jan 2026 04:43:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767721383;
	cv=none; b=EHR0NYDwu7zv+ValT/x5NhM2cnnn+MMYiBxDe+NzhoyYdPeX/elvkoSXDPi4lVkaWArcbQCc7pZi/mlT5hLgLZxLnj3cUC3hC6vwSUNCNtfe7qOsJNHoWLL8ZY2myrOOheZA2BHiwcIiTi9u7wwGqKXW96Ur2RqY3eFMMVOvQAAwi65qswEQdH+osneuhGv8Nv7TWBgqeRkpUSPsFvKEN9Ar3Tz2qlUo6vY8xlKCwYJtAtDICBP4Nibk59da+r89ohh9pmuGkMu2LRqH6e/SdssGEnplUPYb4/K5F38hYzGpjAWTxbSwrf/j06RZbXw44Dqcc7nVyT53uXSczGZsbg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767721383; c=relaxed/relaxed;
	bh=btqj5s3RwXZ+ykRcneBs40bT/CH/diivMei4HNp6zi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PzIQB+3k7IkohKXC6nVaI+lU8wTuQBrYLiAzaK4SpCwv6jeCBjbVGKBBVIsW59e3ytFtlf9OpdQuz6dg8e8WiQqQvRaQ0SkJEtKMvDk7uSHTiNB1uPbxKvwk1mXK4/HQWwbLjrLpH8cGAiOFEbRrbsYMppzRJudWbIm49YHNhA2o78GuYFP4SWv/LtiTOBap68BN7gyhpEcWSWyqngr+nNeHfhlVVTLb7QjY0Lsd014qVyymi1BqtcrDarxd2GhZDiWWkTSVsBZpVPwwye0ejGuMFn4i+k8bR7vOTqL6INR0btVeZ8WkLg3QIoAiBk06skD3+P+ENxUVfgF/9r3yow==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJxaSYjy; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cJxaSYjy;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=chleroy@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dlz5y4PrMz2xGY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 07 Jan 2026 04:43:02 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F0A0843425;
	Tue,  6 Jan 2026 17:42:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1003C19423;
	Tue,  6 Jan 2026 17:42:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767721348;
	bh=PGryFCKmulgdFO29UgDF6OG2BZYbGg3Rh3yem2fewh8=;
	h=From:To:Cc:Subject:Date:From;
	b=cJxaSYjyQ3x6X8zZVBKJfFkjnp33Tvx3nyh2WSwt3hnRE4QTD5XIJOCS9y6nN/699
	 Sz5uNvU0q3+wOEDE0eRq3sWpfKot9q3X81jafFFWyzV6E3YqGZQIv5Tn1h6HD93g4l
	 ZdYOp5oCyGAoSI/RA/9WV4iiDHxbJb/JTcWqtWBGYr+sTxE5Tz3yw7VeDlsSAbc20u
	 X6W5Byt1I4XzC448NFLQjGtY1B6umeUx5L4m0ID/gWX8BobxphiF3JnYFAruMG/pBM
	 s05xXbgU6IrYaMVCm+S9QRFYy5whPh+n0jQRyFrh36qQzOrfZQwG7UM8GINS3FMtgo
	 LlbXphVod05IQ==
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc/e500: Always use 64 bits PTE
Date: Tue,  6 Jan 2026 18:40:19 +0100
Message-ID: <04a658209ea78dcc0f3dbde6b2c29cf1939adfe9.1767721208.git.chleroy@kernel.org>
X-Mailer: git-send-email 2.49.0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=9338; i=chleroy@kernel.org; h=from:subject:message-id; bh=80bF3pcvCRtm03UZMrXs4LU+hbl+Vula5niCDKhoSAA=; b=owGbwMvMwCV2d0KB2p7V54MZT6slMWTGejKfDm6LFFAS3bLy23XPs7J3jJ7klR28Iiv37pzaj r9u8tNNOkpZGMS4GGTFFFmO/+feNaPrS2r+1F36MHNYmUCGMHBxCsBElh1jZJhn9fqxgyZPke0t x5nNBUFnow3DZAuqbrLGbzwS0Hag0pPhf9Kn+7d5raVrHq2sZgmf4Fe2jNnRdfXGqzfvbD7z+uT tBGYA
X-Developer-Key: i=chleroy@kernel.org; a=openpgp; fpr=10FFE6F8B390DE17ACC2632368A92FEB01B8DD78
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

From: Christophe Leroy <christophe.leroy@csgroup.eu>

Today there are two PTE formats for e500:
- The 64 bits format, used
 - On 64 bits kernel
 - On 32 bits kernel with 64 bits physical addresses
 - On 32 bits kernel with support of huge pages
- The 32 bits format, used in other cases

Maintaining two PTE formats means unnecessary maintenance burden
because every change needs to be implemented and tested for both
formats.

Remove the 32 bits PTE format. The memory usage increase due to
larger PTEs is minimal (approx. 0,1% of memory).

This also means that from now on huge pages are supported also
with 32 bits physical addresses.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  4 +-
 arch/powerpc/include/asm/nohash/32/pte-85xx.h | 59 -------------------
 arch/powerpc/include/asm/pgtable-types.h      |  2 +-
 arch/powerpc/kernel/head_85xx.S               | 46 +--------------
 arch/powerpc/platforms/Kconfig.cputype        |  4 +-
 5 files changed, 5 insertions(+), 110 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/nohash/32/pte-85xx.h

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 2d71e4b7cd09c..496ecc65ac255 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -120,10 +120,8 @@
 
 #if defined(CONFIG_44x)
 #include <asm/nohash/32/pte-44x.h>
-#elif defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
-#include <asm/nohash/pte-e500.h>
 #elif defined(CONFIG_PPC_85xx)
-#include <asm/nohash/32/pte-85xx.h>
+#include <asm/nohash/pte-e500.h>
 #elif defined(CONFIG_PPC_8xx)
 #include <asm/nohash/32/pte-8xx.h>
 #endif
diff --git a/arch/powerpc/include/asm/nohash/32/pte-85xx.h b/arch/powerpc/include/asm/nohash/32/pte-85xx.h
deleted file mode 100644
index 14d64b4f3f14a..0000000000000
--- a/arch/powerpc/include/asm/nohash/32/pte-85xx.h
+++ /dev/null
@@ -1,59 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#ifndef _ASM_POWERPC_NOHASH_32_PTE_85xx_H
-#define _ASM_POWERPC_NOHASH_32_PTE_85xx_H
-#ifdef __KERNEL__
-
-/* PTE bit definitions for Freescale BookE SW loaded TLB MMU based
- * processors
- *
-   MMU Assist Register 3:
-
-   32 33 34 35 36  ... 50 51 52 53 54 55 56 57 58 59 60 61 62 63
-   RPN......................  0  0 U0 U1 U2 U3 UX SX UW SW UR SR
-
-   - PRESENT *must* be in the bottom two bits because swap PTEs use
-     the top 30 bits.
-
-*/
-
-/* Definitions for FSL Book-E Cores */
-#define _PAGE_READ	0x00001	/* H: Read permission (SR) */
-#define _PAGE_PRESENT	0x00002	/* S: PTE contains a translation */
-#define _PAGE_WRITE	0x00004	/* S: Write permission (SW) */
-#define _PAGE_DIRTY	0x00008	/* S: Page dirty */
-#define _PAGE_EXEC	0x00010	/* H: SX permission */
-#define _PAGE_ACCESSED	0x00020	/* S: Page referenced */
-
-#define _PAGE_ENDIAN	0x00040	/* H: E bit */
-#define _PAGE_GUARDED	0x00080	/* H: G bit */
-#define _PAGE_COHERENT	0x00100	/* H: M bit */
-#define _PAGE_NO_CACHE	0x00200	/* H: I bit */
-#define _PAGE_WRITETHRU	0x00400	/* H: W bit */
-#define _PAGE_SPECIAL	0x00800 /* S: Special page */
-
-#define _PMD_PRESENT	0
-#define _PMD_PRESENT_MASK (PAGE_MASK)
-#define _PMD_BAD	(~PAGE_MASK)
-#define _PMD_USER	0
-
-#define _PTE_NONE_MASK	0
-
-#define PTE_WIMGE_SHIFT (6)
-
-/*
- * We define 2 sets of base prot bits, one for basic pages (ie,
- * cacheable kernel and user pages) and one for non cacheable
- * pages. We always set _PAGE_COHERENT when SMP is enabled or
- * the processor might need it for DMA coherency.
- */
-#define _PAGE_BASE_NC	(_PAGE_PRESENT | _PAGE_ACCESSED)
-#if defined(CONFIG_SMP) || defined(CONFIG_PPC_E500MC)
-#define _PAGE_BASE	(_PAGE_BASE_NC | _PAGE_COHERENT)
-#else
-#define _PAGE_BASE	(_PAGE_BASE_NC)
-#endif
-
-#include <asm/pgtable-masks.h>
-
-#endif /* __KERNEL__ */
-#endif /*  _ASM_POWERPC_NOHASH_32_PTE_FSL_85xx_H */
diff --git a/arch/powerpc/include/asm/pgtable-types.h b/arch/powerpc/include/asm/pgtable-types.h
index f3086e39e7d2c..e8dec885b6e47 100644
--- a/arch/powerpc/include/asm/pgtable-types.h
+++ b/arch/powerpc/include/asm/pgtable-types.h
@@ -49,7 +49,7 @@ static inline unsigned long pud_val(pud_t x)
 #endif /* CONFIG_PPC64 */
 
 /* PGD level */
-#if defined(CONFIG_PPC_85xx) && defined(CONFIG_PTE_64BIT)
+#if defined(CONFIG_PPC_85xx)
 typedef struct { unsigned long long pgd; } pgd_t;
 
 static inline unsigned long long pgd_val(pgd_t x)
diff --git a/arch/powerpc/kernel/head_85xx.S b/arch/powerpc/kernel/head_85xx.S
index f9a73fae64641..8867596d35adc 100644
--- a/arch/powerpc/kernel/head_85xx.S
+++ b/arch/powerpc/kernel/head_85xx.S
@@ -305,7 +305,6 @@ set_ivor:
  *   r12 is pointer to the pte
  *   r10 is the pshift from the PGD, if we're a hugepage
  */
-#ifdef CONFIG_PTE_64BIT
 #ifdef CONFIG_HUGETLB_PAGE
 #define FIND_PTE	\
 	rlwinm	r12, r13, 14, 18, 28;	/* Compute pgdir/pmd offset */	\
@@ -329,15 +328,6 @@ set_ivor:
 	rlwimi	r12, r13, 23, 20, 28;	/* Compute pte address */	\
 	lwz	r11, 4(r12);		/* Get pte entry */
 #endif /* HUGEPAGE */
-#else /* !PTE_64BIT */
-#define FIND_PTE	\
-	rlwimi	r11, r13, 12, 20, 29;	/* Create L1 (pgdir/pmd) address */	\
-	lwz	r11, 0(r11);		/* Get L1 entry */			\
-	rlwinm.	r12, r11, 0, 0, 19;	/* Extract L2 (pte) base address */	\
-	beq	2f;			/* Bail if no table */			\
-	rlwimi	r12, r13, 22, 20, 29;	/* Compute PTE address */		\
-	lwz	r11, 0(r12);		/* Get Linux PTE */
-#endif
 
 /*
  * Interrupt vector entry code
@@ -473,21 +463,15 @@ END_BTB_FLUSH_SECTION
 4:
 	FIND_PTE
 
-#ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT|_PAGE_BAP_SR
 	oris	r13,r13,_PAGE_ACCESSED@h
-#else
-	li	r13,_PAGE_PRESENT|_PAGE_READ|_PAGE_ACCESSED
-#endif
 	andc.	r13,r13,r11		/* Check permission */
 
-#ifdef CONFIG_PTE_64BIT
 #ifdef CONFIG_SMP
 	subf	r13,r11,r12		/* create false data dep */
 	lwzx	r13,r11,r13		/* Get upper pte bits */
 #else
 	lwz	r13,0(r12)		/* Get upper pte bits */
-#endif
 #endif
 
 	bne	2f			/* Bail if permission/valid mismatch */
@@ -552,12 +536,8 @@ END_BTB_FLUSH_SECTION
 
 	FIND_PTE
 	/* Make up the required permissions for kernel code */
-#ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT | _PAGE_BAP_SX
 	oris	r13,r13,_PAGE_ACCESSED@h
-#else
-	li	r13,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
-#endif
 	b	4f
 
 	/* Get the PGD for the current thread */
@@ -573,23 +553,17 @@ END_BTB_FLUSH_SECTION
 
 	FIND_PTE
 	/* Make up the required permissions for user code */
-#ifdef CONFIG_PTE_64BIT
 	li	r13,_PAGE_PRESENT | _PAGE_BAP_UX
 	oris	r13,r13,_PAGE_ACCESSED@h
-#else
-	li	r13,_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_EXEC
-#endif
 
 4:
 	andc.	r13,r13,r11		/* Check permission */
 
-#ifdef CONFIG_PTE_64BIT
 #ifdef CONFIG_SMP
 	subf	r13,r11,r12		/* create false data dep */
 	lwzx	r13,r11,r13		/* Get upper pte bits */
 #else
 	lwz	r13,0(r12)		/* Get upper pte bits */
-#endif
 #endif
 
 	bne	2f			/* Bail if permission mismatch */
@@ -683,7 +657,7 @@ interrupt_end:
  *	r10 - tsize encoding (if HUGETLB_PAGE) or available to use
  *	r11 - TLB (info from Linux PTE)
  *	r12 - available to use
- *	r13 - upper bits of PTE (if PTE_64BIT) or available to use
+ *	r13 - upper bits of PTE
  *	CR5 - results of addr >= PAGE_OFFSET
  *	MAS0, MAS1 - loaded with proper value when we get here
  *	MAS2, MAS3 - will need additional info from Linux PTE
@@ -751,7 +725,6 @@ finish_tlb_load:
 	 * here we (properly should) assume have the appropriate value.
 	 */
 finish_tlb_load_cont:
-#ifdef CONFIG_PTE_64BIT
 	rlwinm	r12, r11, 32-2, 26, 31	/* Move in perm bits */
 	andi.	r10, r11, _PAGE_DIRTY
 	bne	1f
@@ -764,26 +737,9 @@ BEGIN_MMU_FTR_SECTION
 	srwi	r10, r13, 12		/* grab RPN[12:31] */
 	mtspr	SPRN_MAS7, r10
 END_MMU_FTR_SECTION_IFSET(MMU_FTR_BIG_PHYS)
-#else
-	li	r10, (_PAGE_EXEC | _PAGE_READ)
-	mr	r13, r11
-	rlwimi	r10, r11, 31, 29, 29	/* extract _PAGE_DIRTY into SW */
-	and	r12, r11, r10
-	mcrf	cr0, cr5		/* Test for user page */
-	slwi	r10, r12, 1
-	or	r10, r10, r12
-	rlwinm	r10, r10, 0, ~_PAGE_EXEC	/* Clear SX on user pages */
-	isellt	r12, r10, r12
-	rlwimi	r13, r12, 0, 20, 31	/* Get RPN from PTE, merge w/ perms */
-	mtspr	SPRN_MAS3, r13
-#endif
 
 	mfspr	r12, SPRN_MAS2
-#ifdef CONFIG_PTE_64BIT
 	rlwimi	r12, r11, 32-19, 27, 31	/* extract WIMGE from pte */
-#else
-	rlwimi	r12, r11, 26, 27, 31	/* extract WIMGE from pte */
-#endif
 #ifdef CONFIG_HUGETLB_PAGE
 	beq	6, 3f			/* don't mask if page isn't huge */
 	li	r13, 1
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 4c321a8ea8965..2d9b10b2ce8a2 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -275,7 +275,7 @@ config PPC_BOOK3S
 config PPC_E500
 	select FSL_EMB_PERFMON
 	bool
-	select ARCH_SUPPORTS_HUGETLBFS if PHYS_64BIT || PPC64
+	select ARCH_SUPPORTS_HUGETLBFS
 	select PPC_SMP_MUXED_IPI
 	select PPC_DOORBELL
 	select PPC_KUEP
@@ -336,7 +336,7 @@ config BOOKE
 config PTE_64BIT
 	bool
 	depends on 44x || PPC_E500 || PPC_86xx
-	default y if PHYS_64BIT
+	default y if PPC_E500 || PHYS_64BIT
 
 config PHYS_64BIT
 	bool 'Large physical address support' if PPC_E500 || PPC_86xx
-- 
2.49.0


