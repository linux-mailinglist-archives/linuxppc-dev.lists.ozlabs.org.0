Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5AA39DA53
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 12:56:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz9Kw0yf4z3byr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 20:56:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz9KF5Tmkz2y6C
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 20:56:17 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4Fz9K20hFdzB9Wn;
 Mon,  7 Jun 2021 12:56:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wGDb3VSoOu_9; Mon,  7 Jun 2021 12:56:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Fz9K16xFxzB9Tv;
 Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E451B8B78F;
 Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id OSKDVphRLRht; Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
Received: from po15610vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B600B8B78D;
 Mon,  7 Jun 2021 12:56:05 +0200 (CEST)
Received: by po15610vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id A930C64C69; Mon,  7 Jun 2021 10:56:05 +0000 (UTC)
Message-Id: <5e3f1b8a4695c33ccc80aa3870e016bef32b85e1.1623063174.git.christophe.leroy@csgroup.eu>
In-Reply-To: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
References: <5838caffa269e0957c5a50cc85477876220298b0.1623063174.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/3] powerpc: Define swapper_pg_dir[] in C
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon,  7 Jun 2021 10:56:05 +0000 (UTC)
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

Don't duplicate swapper_pg_dir[] in each platform's head.S

Define it in mm/pgtable.c

Define MAX_PTRS_PER_PGD because on book3s/64 PTRS_PER_PGD is
not a constant.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h |  3 +++
 arch/powerpc/include/asm/pgtable.h           |  4 ++++
 arch/powerpc/kernel/asm-offsets.c            |  5 -----
 arch/powerpc/kernel/head_40x.S               | 11 -----------
 arch/powerpc/kernel/head_44x.S               | 17 +----------------
 arch/powerpc/kernel/head_64.S                | 15 ---------------
 arch/powerpc/kernel/head_8xx.S               | 12 ------------
 arch/powerpc/kernel/head_book3s_32.S         | 11 -----------
 arch/powerpc/kernel/head_fsl_booke.S         | 12 ------------
 arch/powerpc/mm/pgtable.c                    |  2 ++
 10 files changed, 10 insertions(+), 82 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index a666d561b44d..4d9941b2fe51 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -232,6 +232,9 @@ extern unsigned long __pmd_frag_size_shift;
 #define PTRS_PER_PUD	(1 << PUD_INDEX_SIZE)
 #define PTRS_PER_PGD	(1 << PGD_INDEX_SIZE)
 
+#define MAX_PTRS_PER_PGD	(1 << (H_PGD_INDEX_SIZE > RADIX_PGD_INDEX_SIZE ? \
+				       H_PGD_INDEX_SIZE : RADIX_PGD_INDEX_SIZE))
+
 /* PMD_SHIFT determines what a second-level page table entry can map */
 #define PMD_SHIFT	(PAGE_SHIFT + PTE_INDEX_SIZE)
 #define PMD_SIZE	(1UL << PMD_SHIFT)
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index c6a676714f04..b9c8641654f4 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -41,6 +41,10 @@ struct mm_struct;
 
 #ifndef __ASSEMBLY__
 
+#ifndef MAX_PTRS_PER_PGD
+#define MAX_PTRS_PER_PGD PTRS_PER_PGD
+#endif
+
 /* Keep these as a macros to avoid include dependency mess */
 #define pte_page(x)		pfn_to_page(pte_pfn(x))
 #define mk_pte(page, pgprot)	pfn_pte(page_to_pfn(page), (pgprot))
diff --git a/arch/powerpc/kernel/asm-offsets.c b/arch/powerpc/kernel/asm-offsets.c
index 0480f4006e0c..f1b6ff14c8a0 100644
--- a/arch/powerpc/kernel/asm-offsets.c
+++ b/arch/powerpc/kernel/asm-offsets.c
@@ -361,11 +361,6 @@ int main(void)
 	DEFINE(BUG_ENTRY_SIZE, sizeof(struct bug_entry));
 #endif
 
-#ifdef CONFIG_PPC_BOOK3S_64
-	DEFINE(PGD_TABLE_SIZE, (sizeof(pgd_t) << max(RADIX_PGD_INDEX_SIZE, H_PGD_INDEX_SIZE)));
-#else
-	DEFINE(PGD_TABLE_SIZE, PGD_TABLE_SIZE);
-#endif
 	DEFINE(PTE_SIZE, sizeof(pte_t));
 
 #ifdef CONFIG_KVM
diff --git a/arch/powerpc/kernel/head_40x.S b/arch/powerpc/kernel/head_40x.S
index 92b6c7356161..7d72ee5ab387 100644
--- a/arch/powerpc/kernel/head_40x.S
+++ b/arch/powerpc/kernel/head_40x.S
@@ -701,14 +701,3 @@ _GLOBAL(abort)
         mfspr   r13,SPRN_DBCR0
         oris    r13,r13,DBCR0_RST_SYSTEM@h
         mtspr   SPRN_DBCR0,r13
-
-/* We put a few things here that have to be page-aligned. This stuff
- * goes at the beginning of the data segment, which is page-aligned.
- */
-	.data
-	.align	12
-	.globl	sdata
-sdata:
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_44x.S b/arch/powerpc/kernel/head_44x.S
index e037eb615757..ddc978a2d381 100644
--- a/arch/powerpc/kernel/head_44x.S
+++ b/arch/powerpc/kernel/head_44x.S
@@ -1233,23 +1233,8 @@ head_start_common:
 	isync
 	blr
 
-/*
- * We put a few things here that have to be page-aligned. This stuff
- * goes at the beginning of the data segment, which is page-aligned.
- */
-	.data
-	.align	PAGE_SHIFT
-	.globl	sdata
-sdata:
-
-/*
- * To support >32-bit physical addresses, we use an 8KB pgdir.
- */
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
-
 #ifdef CONFIG_SMP
+	.data
 	.align	12
 temp_boot_stack:
 	.space	1024
diff --git a/arch/powerpc/kernel/head_64.S b/arch/powerpc/kernel/head_64.S
index 730838c7ca39..79f2d1e61abd 100644
--- a/arch/powerpc/kernel/head_64.S
+++ b/arch/powerpc/kernel/head_64.S
@@ -997,18 +997,3 @@ start_here_common:
 0:	trap
 	EMIT_BUG_ENTRY 0b, __FILE__, __LINE__, 0
 	.previous
-
-/*
- * We put a few things here that have to be page-aligned.
- * This stuff goes at the beginning of the bss, which is page-aligned.
- */
-	.section ".bss"
-/*
- * pgd dir should be aligned to PGD_TABLE_SIZE which is 64K.
- * We will need to find a better way to fix this
- */
-	.align	16
-
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
index 5ce42dfac061..9bdb95f5694f 100644
--- a/arch/powerpc/kernel/head_8xx.S
+++ b/arch/powerpc/kernel/head_8xx.S
@@ -786,15 +786,3 @@ _GLOBAL(mmu_pin_tlb)
 	mtspr	SPRN_SRR1, r10
 	mtspr	SPRN_SRR0, r11
 	rfi
-
-/*
- * We put a few things here that have to be page-aligned.
- * This stuff goes at the beginning of the data segment,
- * which is page-aligned.
- */
-	.data
-	.globl	sdata
-sdata:
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
index 79c744afc6b6..689c9d37f193 100644
--- a/arch/powerpc/kernel/head_book3s_32.S
+++ b/arch/powerpc/kernel/head_book3s_32.S
@@ -1266,18 +1266,7 @@ setup_usbgecko_bat:
 	blr
 #endif
 
-/*
- * We put a few things here that have to be page-aligned.
- * This stuff goes at the beginning of the data segment,
- * which is page-aligned.
- */
 	.data
-	.globl	sdata
-sdata:
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
-
 /* Room for two PTE pointers, usually the kernel and current user pointers
  * to their respective root page table.
  */
diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
index f33bc5a8e73e..0f9642f36b49 100644
--- a/arch/powerpc/kernel/head_fsl_booke.S
+++ b/arch/powerpc/kernel/head_fsl_booke.S
@@ -1212,15 +1212,3 @@ _GLOBAL(restore_to_as0)
 	*/
 3:	mr	r3,r5
 	bl	_start
-
-/*
- * We put a few things here that have to be page-aligned. This stuff
- * goes at the beginning of the data segment, which is page-aligned.
- */
-	.data
-	.align	12
-	.globl	sdata
-sdata:
-	.globl	swapper_pg_dir
-swapper_pg_dir:
-	.space	PGD_TABLE_SIZE
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 354611940118..1707ab580ee2 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -28,6 +28,8 @@
 #include <asm/hugetlb.h>
 #include <asm/pte-walk.h>
 
+pgd_t swapper_pg_dir[MAX_PTRS_PER_PGD] __page_aligned_bss;
+
 static inline int is_exec_fault(void)
 {
 	return current->thread.regs && TRAP(current->thread.regs) == 0x400;
-- 
2.25.0

