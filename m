Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4DF186E4D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 Mar 2020 16:08:21 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48h06n6vvJzDqKl
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Mar 2020 02:08:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=tguYwPwR; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48gwld3NZ4zDqM6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 16 Mar 2020 23:36:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48gwlS6TVbz9v02p;
 Mon, 16 Mar 2020 13:36:20 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=tguYwPwR; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id el2aDyDCT1nl; Mon, 16 Mar 2020 13:36:20 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48gwlS5QhBz9v02f;
 Mon, 16 Mar 2020 13:36:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1584362180; bh=fowxvl6eRylVpo4oE0OtBW9L6b35aPHgklyVWK5KDWE=;
 h=In-Reply-To:References:From:Subject:To:Cc:Date:From;
 b=tguYwPwR+SUJv3xF3DC8yW6Ts5M/1sE1/EgH0uKbnHTjO8W8Yq8GZuAQfQRw7RwoU
 hD7lWr0OOuh2/QDStks1JPmG+n/+p0JIJBzQve7JT8BiOUsFmfJPJ7m9DIvpMvJltK
 1P0CFNAQd+bXi9Z1WUlIcaPSbngAoQHpvSEJV21U=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9F9E18B7D0;
 Mon, 16 Mar 2020 13:36:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id JAazLaHLBEQM; Mon, 16 Mar 2020 13:36:25 +0100 (CET)
Received: from pc16570vm.idsi0.si.c-s.fr (po15451.idsi0.si.c-s.fr
 [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 51E228B7CB;
 Mon, 16 Mar 2020 13:36:25 +0100 (CET)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 4557265595; Mon, 16 Mar 2020 12:36:25 +0000 (UTC)
Message-Id: <abaf66aaebfd988d835dc9520bccedd546ee95c4.1584360344.git.christophe.leroy@c-s.fr>
In-Reply-To: <cover.1584360343.git.christophe.leroy@c-s.fr>
References: <cover.1584360343.git.christophe.leroy@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Subject: [PATCH v1 39/46] powerpc/8xx: Add a function to early map kernel via
 huge pages
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Mon, 16 Mar 2020 12:36:25 +0000 (UTC)
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

Add a function to early map kernel memory using huge pages.

For 512k pages, just use standard page table and map in using 512k
pages.

For 8M pages, create a hugepd table and populate the two PGD
entries with it.

This function can only be used to create page tables at startup. Once
the regular SLAB allocation functions replace memblock functions,
this function cannot allocate new pages anymore. However it can still
update existing mappings with new protections.

hugepd_none() macro is moved into asm/hugetlb.h to be usable outside
of mm/hugetlbpage.c

early_pte_alloc_kernel() is made visible.

_PAGE_HUGE flag is now displayed by ptdump.

Signed-off-by: Christophe Leroy <christophe.leroy@c-s.fr>
---
 arch/powerpc/include/asm/hugetlb.h            |  2 +
 .../include/asm/nohash/32/hugetlb-8xx.h       |  5 ++
 arch/powerpc/include/asm/pgtable.h            |  2 +
 arch/powerpc/mm/hugetlbpage.c                 |  2 -
 arch/powerpc/mm/nohash/8xx.c                  | 52 +++++++++++++++++++
 arch/powerpc/mm/pgtable_32.c                  |  2 +-
 arch/powerpc/mm/ptdump/8xx.c                  |  5 ++
 arch/powerpc/platforms/Kconfig.cputype        |  1 +
 8 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/include/asm/hugetlb.h b/arch/powerpc/include/asm/hugetlb.h
index e4276af034e9..0572c5cd12f2 100644
--- a/arch/powerpc/include/asm/hugetlb.h
+++ b/arch/powerpc/include/asm/hugetlb.h
@@ -13,6 +13,8 @@
 #include <asm/nohash/32/hugetlb-8xx.h>
 #endif /* CONFIG_PPC_BOOK3S_64 */
 
+#define hugepd_none(hpd)	(hpd_val(hpd) == 0)
+
 extern bool hugetlb_disabled;
 
 void hugetlbpage_init_default(void);
diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index 1c7d4693a78e..e752a5807a59 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -35,6 +35,11 @@ static inline void hugepd_populate(hugepd_t *hpdp, pte_t *new, unsigned int pshi
 	*hpdp = __hugepd(__pa(new) | _PMD_USER | _PMD_PRESENT | _PMD_PAGE_8M);
 }
 
+static inline void hugepd_populate_kernel(hugepd_t *hpdp, pte_t *new, unsigned int pshift)
+{
+	*hpdp = __hugepd(__pa(new) | _PMD_PRESENT | _PMD_PAGE_8M);
+}
+
 static inline int check_and_get_huge_psize(int shift)
 {
 	return shift_to_mmu_psize(shift);
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index b80bfd41828d..ffddb052068c 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -105,6 +105,8 @@ unsigned long vmalloc_to_phys(void *vmalloc_addr);
 
 void pgtable_cache_add(unsigned int shift);
 
+pte_t *early_pte_alloc_kernel(pmd_t *pmdp, unsigned long va);
+
 #if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_PPC32)
 void mark_initmem_nx(void);
 #else
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index 243e90db400c..30d2d05d681d 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -28,8 +28,6 @@
 
 bool hugetlb_disabled = false;
 
-#define hugepd_none(hpd)	(hpd_val(hpd) == 0)
-
 #define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_basic_t)) - \
 			 __builtin_ffs(sizeof(void *)))
 
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index d9f205d9a654..81ddcd9554e1 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -9,8 +9,10 @@
 
 #include <linux/memblock.h>
 #include <linux/mmu_context.h>
+#include <linux/hugetlb.h>
 #include <asm/fixmap.h>
 #include <asm/code-patching.h>
+#include <asm/pgalloc.h>
 
 #include <mm/mmu_decl.h>
 
@@ -54,6 +56,56 @@ unsigned long p_block_mapped(phys_addr_t pa)
 	return 0;
 }
 
+static pte_t __init *early_hugepd_alloc_kernel(hugepd_t *pmdp, unsigned long va)
+{
+	if (hugepd_none(*pmdp)) {
+		pte_t *ptep = memblock_alloc(sizeof(pte_basic_t), SZ_4K);
+
+		if (!ptep)
+			return NULL;
+
+		hugepd_populate_kernel((hugepd_t *)pmdp, ptep, PAGE_SHIFT_8M);
+		hugepd_populate_kernel((hugepd_t *)pmdp + 1, ptep, PAGE_SHIFT_8M);
+	}
+	return hugepte_offset(*(hugepd_t *)pmdp, va, PGDIR_SHIFT);
+}
+
+static int __ref __early_map_kernel_hugepage(unsigned long va, phys_addr_t pa,
+					     pgprot_t prot, int psize, bool new)
+{
+	pmd_t *pmdp = pmd_ptr_k(va);
+	pte_t *ptep;
+
+	if (WARN_ON(psize != MMU_PAGE_512K && psize != MMU_PAGE_8M))
+		return -EINVAL;
+
+	if (new) {
+		if (WARN_ON(slab_is_available()))
+			return -EINVAL;
+
+		if (psize == MMU_PAGE_512K)
+			ptep = early_pte_alloc_kernel(pmdp, va);
+		else
+			ptep = early_hugepd_alloc_kernel((hugepd_t *)pmdp, va);
+	} else {
+		if (psize == MMU_PAGE_512K)
+			ptep = pte_offset_kernel(pmdp, va);
+		else
+			ptep = hugepte_offset(*(hugepd_t *)pmdp, va, PGDIR_SHIFT);
+	}
+
+	if (WARN_ON(!ptep))
+		return -ENOMEM;
+
+	/* The PTE should never be already present */
+	if (new && WARN_ON(pte_present(*ptep) && pgprot_val(prot)))
+		return -EINVAL;
+
+	set_huge_pte_at(&init_mm, va, ptep, pte_mkhuge(pfn_pte(pa >> PAGE_SHIFT, prot)));
+
+	return 0;
+}
+
 /*
  * MMU_init_hw does the chip-specific initialization of the MMU hardware.
  */
diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
index bd0cb6e3573e..05902bbff8d6 100644
--- a/arch/powerpc/mm/pgtable_32.c
+++ b/arch/powerpc/mm/pgtable_32.c
@@ -61,7 +61,7 @@ static void __init *early_alloc_pgtable(unsigned long size)
 	return ptr;
 }
 
-static pte_t __init *early_pte_alloc_kernel(pmd_t *pmdp, unsigned long va)
+pte_t __init *early_pte_alloc_kernel(pmd_t *pmdp, unsigned long va)
 {
 	if (pmd_none(*pmdp)) {
 		pte_t *ptep = early_alloc_pgtable(PTE_FRAG_SIZE);
diff --git a/arch/powerpc/mm/ptdump/8xx.c b/arch/powerpc/mm/ptdump/8xx.c
index a3169677dced..b3185b32793d 100644
--- a/arch/powerpc/mm/ptdump/8xx.c
+++ b/arch/powerpc/mm/ptdump/8xx.c
@@ -11,6 +11,11 @@
 
 static const struct flag_info flag_array[] = {
 	{
+		.mask	= _PAGE_HUGE,
+		.val	= _PAGE_HUGE,
+		.set	= "h",
+		.clear	= " ",
+	}, {
 		.mask	= _PAGE_RO | _PAGE_NA,
 		.val	= 0,
 		.set	= "rw",
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 6a50392df7b5..f4dfaf43930f 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -56,6 +56,7 @@ config PPC_8xx
 	select PPC_HAVE_KUEP
 	select PPC_HAVE_KUAP
 	select HAVE_ARCH_VMAP_STACK
+	select HUGETLB_PAGE
 
 config 40x
 	bool "AMCC 40x"
-- 
2.25.0

