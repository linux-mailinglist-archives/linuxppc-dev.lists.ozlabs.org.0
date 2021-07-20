Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 513663CF9B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 14:36:56 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GTdWV2Fmcz3bWs
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Jul 2021 22:36:54 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=SNFULBFn;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=SNFULBFn; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GTdVC2ZMCz2yP4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Jul 2021 22:35:47 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E88561208;
 Tue, 20 Jul 2021 12:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1626784545;
 bh=GwfGyRUEV46aABYr56ARFGrKLvcz5cJwUqbzXNrCfU4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SNFULBFnBBsoQZHf3uR8j5jS4Oan/It40bN3jPeuE1c4CoxSyECi6FnI8p2zzSfUx
 2DXJN2GQoG9pUBbAodh3nbqSutzkTKpdDDWobN1con2cOJ/kPoxkefwsaGgRydEHih
 H6t/+FrDA7TCHw6aJC7SaMMEOcmp5bDjoIrSoBRTSgMYambXQoJhfGBOPCafJnX9i5
 G4lgUUtTZ7kSjcDppqp0IEoKZ2QvE6WUFF6tnT6eEQraL6rJZVshLpZEQ3h9J4LWdn
 ozRHgtziZ2Kg4QcpvWpniYjiO4uJgJNUtYroViktmRiKrQ5amMGy9ImJtMgFsPlz8i
 zHDm4p556oOgw==
From: Will Deacon <will@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] Revert "mm/pgtable: add stubs for
 {pmd/pub}_{set/clear}_huge"
Date: Tue, 20 Jul 2021 13:35:12 +0100
Message-Id: <20210720123512.8740-3-will@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210720123512.8740-1-will@kernel.org>
References: <20210720123512.8740-1-will@kernel.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Marek <jonathan@marek.ca>,
 linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-arm-kernel@lists.infradead.org,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Mike Rapoport <rppt@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Jonathan Marek <jonathan@marek.ca>

This reverts commit c742199a014de23ee92055c2473d91fe5561ffdf.

c742199a014d ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge")
breaks arm64 in at least two ways for configurations where PUD or PMD
folding occur:

  1. We no longer install huge-vmap mappings and silently fall back to
     page-granular entries, despite being able to install block entries
     at what is effectively the PGD level.

  2. If the linear map is backed with block mappings, these will now
     silently fail to be created in alloc_init_pud(), causing a panic
     early during boot.

The pgtable selftests caught this, although a fix has not been
forthcoming and Christophe is AWOL at the moment, so just revert the
change for now to get a working -rc3 on which we can queue patches for
5.15.

Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/linux-arm-kernel/CAMuHMdXShORDox-xxaeUfDW3wx2PeggFSqhVSHVZNKCGK-y_vQ@mail.gmail.com/
Link: https://lore.kernel.org/r/20210717160118.9855-1-jonathan@marek.ca
Fixes: c742199a014d ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/mm/mmu.c     | 20 ++++++++------------
 arch/x86/mm/pgtable.c   | 34 +++++++++++++++-------------------
 include/linux/pgtable.h | 26 +-------------------------
 3 files changed, 24 insertions(+), 56 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index d74586508448..9ff0de1b2b93 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1339,7 +1339,6 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
 	return dt_virt;
 }
 
-#if CONFIG_PGTABLE_LEVELS > 3
 int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
 {
 	pud_t new_pud = pfn_pud(__phys_to_pfn(phys), mk_pud_sect_prot(prot));
@@ -1354,16 +1353,6 @@ int pud_set_huge(pud_t *pudp, phys_addr_t phys, pgprot_t prot)
 	return 1;
 }
 
-int pud_clear_huge(pud_t *pudp)
-{
-	if (!pud_sect(READ_ONCE(*pudp)))
-		return 0;
-	pud_clear(pudp);
-	return 1;
-}
-#endif
-
-#if CONFIG_PGTABLE_LEVELS > 2
 int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
 {
 	pmd_t new_pmd = pfn_pmd(__phys_to_pfn(phys), mk_pmd_sect_prot(prot));
@@ -1378,6 +1367,14 @@ int pmd_set_huge(pmd_t *pmdp, phys_addr_t phys, pgprot_t prot)
 	return 1;
 }
 
+int pud_clear_huge(pud_t *pudp)
+{
+	if (!pud_sect(READ_ONCE(*pudp)))
+		return 0;
+	pud_clear(pudp);
+	return 1;
+}
+
 int pmd_clear_huge(pmd_t *pmdp)
 {
 	if (!pmd_sect(READ_ONCE(*pmdp)))
@@ -1385,7 +1382,6 @@ int pmd_clear_huge(pmd_t *pmdp)
 	pmd_clear(pmdp);
 	return 1;
 }
-#endif
 
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
diff --git a/arch/x86/mm/pgtable.c b/arch/x86/mm/pgtable.c
index 3364fe62b903..3481b35cb4ec 100644
--- a/arch/x86/mm/pgtable.c
+++ b/arch/x86/mm/pgtable.c
@@ -682,7 +682,6 @@ int p4d_clear_huge(p4d_t *p4d)
 }
 #endif
 
-#if CONFIG_PGTABLE_LEVELS > 3
 /**
  * pud_set_huge - setup kernel PUD mapping
  *
@@ -721,23 +720,6 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 	return 1;
 }
 
-/**
- * pud_clear_huge - clear kernel PUD mapping when it is set
- *
- * Returns 1 on success and 0 on failure (no PUD map is found).
- */
-int pud_clear_huge(pud_t *pud)
-{
-	if (pud_large(*pud)) {
-		pud_clear(pud);
-		return 1;
-	}
-
-	return 0;
-}
-#endif
-
-#if CONFIG_PGTABLE_LEVELS > 2
 /**
  * pmd_set_huge - setup kernel PMD mapping
  *
@@ -768,6 +750,21 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 	return 1;
 }
 
+/**
+ * pud_clear_huge - clear kernel PUD mapping when it is set
+ *
+ * Returns 1 on success and 0 on failure (no PUD map is found).
+ */
+int pud_clear_huge(pud_t *pud)
+{
+	if (pud_large(*pud)) {
+		pud_clear(pud);
+		return 1;
+	}
+
+	return 0;
+}
+
 /**
  * pmd_clear_huge - clear kernel PMD mapping when it is set
  *
@@ -782,7 +779,6 @@ int pmd_clear_huge(pmd_t *pmd)
 
 	return 0;
 }
-#endif
 
 #ifdef CONFIG_X86_64
 /**
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index d147480cdefc..e24d2c992b11 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -1397,34 +1397,10 @@ static inline int p4d_clear_huge(p4d_t *p4d)
 }
 #endif /* !__PAGETABLE_P4D_FOLDED */
 
-#ifndef __PAGETABLE_PUD_FOLDED
 int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot);
-int pud_clear_huge(pud_t *pud);
-#else
-static inline int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
-{
-	return 0;
-}
-static inline int pud_clear_huge(pud_t *pud)
-{
-	return 0;
-}
-#endif /* !__PAGETABLE_PUD_FOLDED */
-
-#ifndef __PAGETABLE_PMD_FOLDED
 int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot);
+int pud_clear_huge(pud_t *pud);
 int pmd_clear_huge(pmd_t *pmd);
-#else
-static inline int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
-{
-	return 0;
-}
-static inline int pmd_clear_huge(pmd_t *pmd)
-{
-	return 0;
-}
-#endif /* !__PAGETABLE_PMD_FOLDED */
-
 int p4d_free_pud_page(p4d_t *p4d, unsigned long addr);
 int pud_free_pmd_page(pud_t *pud, unsigned long addr);
 int pmd_free_pte_page(pmd_t *pmd, unsigned long addr);
-- 
2.32.0.402.g57bb445576-goog

