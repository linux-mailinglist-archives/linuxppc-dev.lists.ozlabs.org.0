Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 03D77257574
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 10:32:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Bg3NW1kYRzDqFw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 31 Aug 2020 18:32:27 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bg3Ld0q8DzDqQk
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 31 Aug 2020 18:30:48 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4Bg3LS3VFFz9v478;
 Mon, 31 Aug 2020 10:30:40 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id xUqf6y9tCXfm; Mon, 31 Aug 2020 10:30:40 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4Bg3LS2Y5bz9v470;
 Mon, 31 Aug 2020 10:30:40 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4E2628B799;
 Mon, 31 Aug 2020 10:30:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id PouFLmaQOdgA; Mon, 31 Aug 2020 10:30:45 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.104])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 101108B7BB;
 Mon, 31 Aug 2020 10:30:45 +0200 (CEST)
Received: by po17688vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 83FC065D48; Mon, 31 Aug 2020 08:30:44 +0000 (UTC)
Message-Id: <a518abc29266a708dfbccc8fce9ae6694fe4c2c6.1598862623.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f6ea2483c2c389567b007945948f704d18cfaeea.1598862623.git.christophe.leroy@csgroup.eu>
References: <f6ea2483c2c389567b007945948f704d18cfaeea.1598862623.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH 2/2] powerpc/8xx: Support 16k hugepages with 4k pages
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 31 Aug 2020 08:30:44 +0000 (UTC)
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

The 8xx has 4 page sizes: 4k, 16k, 512k and 8M

4k and 16k can be selected at build time as standard page sizes,
and 512k and 8M are hugepages.

When 4k standard pages are selected, 16k pages are not available.

Allow 16k pages as hugepages when 4k pages are used.

To allow that, implement arch_make_huge_pte() which receives
the necessary arguments to allow setting the PTE in accordance
with the page size:
- 512 k pages must have _PAGE_HUGE and _PAGE_SPS. They are set
by pte_mkhuge(). arch_make_huge_pte() does nothing.
- 16 k pages must have only _PAGE_SPS. arch_make_huge_pte() clears
_PAGE_HUGE.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h | 14 ++++++++++++++
 arch/powerpc/include/asm/nohash/32/pgtable.h     |  2 ++
 arch/powerpc/mm/hugetlbpage.c                    |  2 +-
 arch/powerpc/mm/nohash/tlb.c                     |  4 ----
 arch/powerpc/mm/ptdump/8xx.c                     |  5 +++++
 include/uapi/asm-generic/hugetlb_encode.h        |  1 +
 include/uapi/linux/mman.h                        |  1 +
 7 files changed, 24 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index e752a5807a59..39be9aea86db 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -65,4 +65,18 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 	pte_update(mm, addr, ptep, clr, set, 1);
 }
 
+#ifdef CONFIG_PPC_4K_PAGES
+static inline pte_t arch_make_huge_pte(pte_t entry, struct vm_area_struct *vma,
+				       struct page *page, int writable)
+{
+	size_t size = huge_page_size(hstate_vma(vma));
+
+	if (size == SZ_16K)
+		return __pte(pte_val(entry) & ~_PAGE_HUGE);
+	else
+		return entry;
+}
+#define arch_make_huge_pte arch_make_huge_pte
+#endif
+
 #endif /* _ASM_POWERPC_NOHASH_32_HUGETLB_8XX_H */
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 80bbc21b87f0..ee2243ba96cf 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -235,6 +235,8 @@ static int number_of_cells_per_pte(pmd_t *pmd, pte_basic_t val, int huge)
 		return PAGE_SIZE / SZ_4K;
 	else if (hugepd_ok(*((hugepd_t *)pmd)))
 		return 1;
+	else if (IS_ENABLED(CONFIG_PPC_4K_PAGES) && !(val & _PAGE_HUGE))
+		return SZ_16K / SZ_4K;
 	else
 		return SZ_512K / SZ_4K;
 }
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index e7ae2a2c4545..36c3800769fb 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -180,7 +180,7 @@ pte_t *huge_pte_alloc(struct mm_struct *mm, unsigned long addr, unsigned long sz
 	if (!hpdp)
 		return NULL;
 
-	if (IS_ENABLED(CONFIG_PPC_8xx) && sz == SZ_512K)
+	if (IS_ENABLED(CONFIG_PPC_8xx) && pshift < PMD_SHIFT)
 		return pte_alloc_map(mm, (pmd_t *)hpdp, addr);
 
 	BUG_ON(!hugepd_none(*hpdp) && !hugepd_ok(*hpdp));
diff --git a/arch/powerpc/mm/nohash/tlb.c b/arch/powerpc/mm/nohash/tlb.c
index 14514585db98..5872f69141d5 100644
--- a/arch/powerpc/mm/nohash/tlb.c
+++ b/arch/powerpc/mm/nohash/tlb.c
@@ -83,16 +83,12 @@ struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
 };
 #elif defined(CONFIG_PPC_8xx)
 struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT] = {
-	/* we only manage 4k and 16k pages as normal pages */
-#ifdef CONFIG_PPC_4K_PAGES
 	[MMU_PAGE_4K] = {
 		.shift	= 12,
 	},
-#else
 	[MMU_PAGE_16K] = {
 		.shift	= 14,
 	},
-#endif
 	[MMU_PAGE_512K] = {
 		.shift	= 19,
 	},
diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index 8a797dcbf475..86da2a669680 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -11,8 +11,13 @@
 
 static const struct flag_info flag_array[] = {
 	{
+#ifdef CONFIG_PPC_16K_PAGES
 		.mask	= _PAGE_HUGE,
 		.val	= _PAGE_HUGE,
+#else
+		.mask	= _PAGE_SPS,
+		.val	= _PAGE_SPS,
+#endif
 		.set	= "huge",
 		.clear	= "    ",
 	}, {
diff --git a/include/uapi/asm-generic/hugetlb_encode.h b/include/uapi/asm-generic/hugetlb_encode.h
index b0f8e87235bd..4f3d5aaa11f5 100644
--- a/include/uapi/asm-generic/hugetlb_encode.h
+++ b/include/uapi/asm-generic/hugetlb_encode.h
@@ -20,6 +20,7 @@
 #define HUGETLB_FLAG_ENCODE_SHIFT	26
 #define HUGETLB_FLAG_ENCODE_MASK	0x3f
 
+#define HUGETLB_FLAG_ENCODE_16KB	(14 << HUGETLB_FLAG_ENCODE_SHIFT)
 #define HUGETLB_FLAG_ENCODE_64KB	(16 << HUGETLB_FLAG_ENCODE_SHIFT)
 #define HUGETLB_FLAG_ENCODE_512KB	(19 << HUGETLB_FLAG_ENCODE_SHIFT)
 #define HUGETLB_FLAG_ENCODE_1MB		(20 << HUGETLB_FLAG_ENCODE_SHIFT)
diff --git a/include/uapi/linux/mman.h b/include/uapi/linux/mman.h
index 923cc162609c..f55bc680b5b0 100644
--- a/include/uapi/linux/mman.h
+++ b/include/uapi/linux/mman.h
@@ -27,6 +27,7 @@
 #define MAP_HUGE_SHIFT	HUGETLB_FLAG_ENCODE_SHIFT
 #define MAP_HUGE_MASK	HUGETLB_FLAG_ENCODE_MASK
 
+#define MAP_HUGE_16KB	HUGETLB_FLAG_ENCODE_16KB
 #define MAP_HUGE_64KB	HUGETLB_FLAG_ENCODE_64KB
 #define MAP_HUGE_512KB	HUGETLB_FLAG_ENCODE_512KB
 #define MAP_HUGE_1MB	HUGETLB_FLAG_ENCODE_1MB
-- 
2.25.0

