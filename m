Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D60CE1C7878
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 May 2020 19:45:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49HPBb0GBrzDqwn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 May 2020 03:45:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49HMwy34TCzDqhC
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 May 2020 02:48:34 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49HMws4RYtz9v4kJ;
 Wed,  6 May 2020 18:48:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id nXVKFghiAyqD; Wed,  6 May 2020 18:48:29 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49HMws3hqxz9v4kD;
 Wed,  6 May 2020 18:48:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 5BD168B7C6;
 Wed,  6 May 2020 18:48:31 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PJ2Z2TAv4evS; Wed,  6 May 2020 18:48:31 +0200 (CEST)
Received: from localhost.localdomain (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 0241B8B7C5;
 Wed,  6 May 2020 18:48:31 +0200 (CEST)
Received: by localhost.localdomain (Postfix, from userid 0)
 id C497F65911; Wed,  6 May 2020 16:48:30 +0000 (UTC)
Message-Id: <371a89670713061c06b47ca9f5170fed89c5d141.1588783498.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1588783498.git.christophe.leroy@csgroup.eu>
References: <cover.1588783498.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v2 25/45] powerpc/8xx: Prepare handlers for _PAGE_HUGE for
 512k pages.
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Wed,  6 May 2020 16:48:30 +0000 (UTC)
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Prepare ITLB handler to handle _PAGE_HUGE when CONFIG_HUGETLBFS
is enabled. This means that the L1 entry has to be kept in r11
until L2 entry is read, in order to insert _PAGE_HUGE into it.

Also move pgd_offset helpers before pte_update() as they
will be needed there in next patch.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/pgtable.h | 13 ++++++-------
 arch/powerpc/kernel/head_8xx.S               | 15 +++++++++------
 2 files changed, 15 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index dd5835354e33..1a86d20b58f3 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -206,6 +206,12 @@ static inline void pmd_clear(pmd_t *pmdp)
 }
 
 
+/* to find an entry in a kernel page-table-directory */
+#define pgd_offset_k(address) pgd_offset(&init_mm, address)
+
+/* to find an entry in a page-table-directory */
+#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
+#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
 
 /*
  * PTE updates. This function is called whenever an existing
@@ -348,13 +354,6 @@ static inline int pte_young(pte_t pte)
 	pfn_to_page((__pa(pmd_val(pmd)) >> PAGE_SHIFT))
 #endif
 
-/* to find an entry in a kernel page-table-directory */
-#define pgd_offset_k(address) pgd_offset(&init_mm, address)
-
-/* to find an entry in a page-table-directory */
-#define pgd_index(address)	 ((address) >> PGDIR_SHIFT)
-#define pgd_offset(mm, address)	 ((mm)->pgd + pgd_index(address))
-
 /* Find an entry in the third-level page table.. */
 #define pte_index(address)		\
 	(((address) >> PAGE_SHIFT) & (PTRS_PER_PTE - 1))
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 905205c79a25..adad8baadcf5 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -196,7 +196,7 @@ SystemCall:
 
 InstructionTLBMiss:
 	mtspr	SPRN_SPRG_SCRATCH0, r10
-#if defined(ITLB_MISS_KERNEL) || defined(CONFIG_SWAP)
+#if defined(ITLB_MISS_KERNEL) || defined(CONFIG_SWAP) || defined(CONFIG_HUGETLBFS)
 	mtspr	SPRN_SPRG_SCRATCH1, r11
 #endif
 
@@ -235,16 +235,19 @@ InstructionTLBMiss:
 	rlwinm	r10, r10, 0, 20, 31
 	oris	r10, r10, (swapper_pg_dir - PAGE_OFFSET)@ha
 3:
+	mtcr	r11
 #endif
+#ifdef CONFIG_HUGETLBFS
+	lwz	r11, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
+	mtspr	SPRN_MI_TWC, r11	/* Set segment attributes */
+	mtspr	SPRN_MD_TWC, r11
+#else
 	lwz	r10, (swapper_pg_dir-PAGE_OFFSET)@l(r10)	/* Get level 1 entry */
 	mtspr	SPRN_MI_TWC, r10	/* Set segment attributes */
-
 	mtspr	SPRN_MD_TWC, r10
+#endif
 	mfspr	r10, SPRN_MD_TWC
 	lwz	r10, 0(r10)	/* Get the pte */
-#ifdef ITLB_MISS_KERNEL
-	mtcr	r11
-#endif
 #ifdef CONFIG_SWAP
 	rlwinm	r11, r10, 32-5, _PAGE_PRESENT
 	and	r11, r11, r10
@@ -263,7 +266,7 @@ InstructionTLBMiss:
 
 	/* Restore registers */
 0:	mfspr	r10, SPRN_SPRG_SCRATCH0
-#if defined(ITLB_MISS_KERNEL) || defined(CONFIG_SWAP)
+#if defined(ITLB_MISS_KERNEL) || defined(CONFIG_SWAP) || defined(CONFIG_HUGETLBFS)
 	mfspr	r11, SPRN_SPRG_SCRATCH1
 #endif
 	rfi
-- 
2.25.0

