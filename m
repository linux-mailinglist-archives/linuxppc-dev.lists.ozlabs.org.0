Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F3733D0957
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 09:02:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GV63S1w7Lz3bWH
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Jul 2021 17:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=dHDgP3pL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=ellerman.id.au (client-ip=203.11.71.1; helo=ozlabs.org;
 envelope-from=mpe@ellerman.id.au; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=dHDgP3pL; 
 dkim-atps=neutral
Received: from ozlabs.org (ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GV6301DXsz2xZS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Jul 2021 17:02:19 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GV62w2YVgz9sX1;
 Wed, 21 Jul 2021 17:02:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1626850939;
 bh=yJhjT2FDu3UB8nSglmZ3gbSnFsIXkP+zQ7M5BtWj7Pk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=dHDgP3pLI3+s7uEkJ8IBAg8bl7v9nFoRYyfUvYTb33iok877v9y3b+AcWL6eXbAe8
 3AVxLlKBLBekk/5nXVHAS6LQRaTBCaEi0umtTRJuFh6/w9bieCsTEzv74XWQmi1BOe
 ex1f/gb2Hl/5W0tiXY4lwumBIYxWeGdslSmZBN2vAd/OmWeTQFznjea4sQhAxrmytt
 vBO/7rFIRSPktXV1rMnpbTIzG4C4fv99vAPUozpHPBgN0oxkB9KB9pIWVfSUHgTomd
 WndpQL/WVkignS3ZQ270Kg2HeTy3CRUKvj6ls5Co0oc4f3P5a/ziboca6jNkCJ15uS
 kWi0lkouHabfw==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Will Deacon
 <will@kernel.org>
Subject: [PATCH v2] Revert "mm/pgtable: add stubs for
 {pmd/pub}_{set/clear}_huge"
In-Reply-To: <20210720202627.Horde.vlszNhxkKrLIg0-3Sn2ucw5@messagerie.c-s.fr>
References: <20210720202627.Horde.vlszNhxkKrLIg0-3Sn2ucw5@messagerie.c-s.fr>
Date: Wed, 21 Jul 2021 17:02:13 +1000
Message-ID: <87r1fs1762.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Mark Rutland <mark.rutland@arm.com>, Jonathan Marek <jonathan@marek.ca>,
 Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Nicholas Piggin <npiggin@gmail.com>, Ard Biesheuvel <ardb@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Paul Mackerras <paulus@samba.org>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Thomas Gleixner <tglx@linutronix.de>, Mike Rapoport <rppt@kernel.org>
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

A simple revert breaks the build for 32-bit PowerPC 8xx machines, which
rely on the default function definitions when the corresponding
page-table levels are folded, since commit a6a8f7c4aa7e ("powerpc/8xx:
add support for huge pages on VMAP and VMALLOC"), eg:

  powerpc64-linux-ld: mm/vmalloc.o: in function `vunmap_pud_range':
  linux/mm/vmalloc.c:362: undefined reference to `pud_clear_huge'

To avoid that, add stubs for pud_clear_huge() and pmd_clear_huge() in
arch/powerpc/mm/nohash/8xx.c as suggested by Christophe.

Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Fixes: c742199a014d ("mm/pgtable: add stubs for {pmd/pub}_{set/clear}_huge")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Signed-off-by: Will Deacon <will@kernel.org>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Acked-by: Marc Zyngier <maz@kernel.org>
[mpe: Fold in 8xx.c changes from Christophe and mention in change log]
Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
Link: https://lore.kernel.org/linux-arm-kernel/CAMuHMdXShORDox-xxaeUfDW3wx2PeggFSqhVSHVZNKCGK-y_vQ@mail.gmail.com/
Link: https://lore.kernel.org/r/20210717160118.9855-1-jonathan@marek.ca
---
 arch/arm64/mm/mmu.c          | 20 ++++++++------------
 arch/powerpc/mm/nohash/8xx.c | 10 ++++++++++
 arch/x86/mm/pgtable.c        | 34 +++++++++++++++-------------------
 include/linux/pgtable.h      | 26 +-------------------------
 4 files changed, 34 insertions(+), 56 deletions(-)

v2: Fold in suggestion from Christophe to add stubs for 8xx.

I kept the reviewed-by/acked-by tags from arm64 folks as the patch is
unchanged as far as arm64 is concerned.

Please take this via the arm64 tree.

cheers


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
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index 60780e089118..0df9fe29dd56 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -240,3 +240,13 @@ void __init setup_kuap(bool disabled)
 	mtspr(SPRN_MD_AP, MD_APG_KUAP);
 }
 #endif
+
+int pud_clear_huge(pud_t *pud)
+{
+	 return 0;
+}
+
+int pmd_clear_huge(pmd_t *pmd)
+{
+	 return 0;
+}
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
2.25.1

