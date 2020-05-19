Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC231D9028
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 08:36:20 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49R5kT6v8jzDql6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 May 2020 16:36:17 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 49R4h56JfNzDqR6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 19 May 2020 15:49:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 49R4h16gK1z9txm0;
 Tue, 19 May 2020 07:49:05 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 5WgodmLcCIFP; Tue, 19 May 2020 07:49:05 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 49R4h14xfKz9txlx;
 Tue, 19 May 2020 07:49:05 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id CF2278B7A7;
 Tue, 19 May 2020 07:49:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id dI0oMjzhTzYu; Tue, 19 May 2020 07:49:06 +0200 (CEST)
Received: from pc16570vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8D40A8B767;
 Tue, 19 May 2020 07:49:06 +0200 (CEST)
Received: by pc16570vm.idsi0.si.c-s.fr (Postfix, from userid 0)
 id 6C77C65A4A; Tue, 19 May 2020 05:49:06 +0000 (UTC)
Message-Id: <43050d1a0c2d6e1541cab9c1126fc80bc7015ebd.1589866984.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1589866984.git.christophe.leroy@csgroup.eu>
References: <cover.1589866984.git.christophe.leroy@csgroup.eu>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: [PATCH v4 23/45] powerpc/mm: Reduce hugepd size for 8M hugepages on
 8xx
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
Date: Tue, 19 May 2020 05:49:06 +0000 (UTC)
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

Commit 55c8fc3f4930 ("powerpc/8xx: reintroduce 16K pages with HW
assistance") redefined pte_t as a struct of 4 pte_basic_t, because
in 16K pages mode there are four identical entries in the page table.
But hugepd entries for 8M pages require only one entry of size
pte_basic_t. So there is no point in creating a cache for 4 entries
page tables.

Calculate PTE_T_ORDER using the size of pte_basic_t instead of pte_t.

Define specific huge_pte helpers (set_huge_pte_at(), huge_pte_clear(),
huge_ptep_set_wrprotect()) to write the pte in a single entry instead
of using set_pte_at() which writes 4 identical entries in 16k pages
mode. Also make sure that __ptep_set_access_flags() properly handle
the huge_pte case.

Define set_pte_filter() inline otherwise GCC doesn't inline it anymore
because it is now used twice, and that gives a pretty suboptimal code
because of pte_t being a struct of 4 entries.

Those functions are also used for 512k pages which only require one
entry as well allthough replicating it four times was harmless as 512k
pages entries are spread every 128 bytes in the table.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 .../include/asm/nohash/32/hugetlb-8xx.h       | 20 ++++++++++++++
 arch/powerpc/include/asm/nohash/32/pgtable.h  |  3 ++-
 arch/powerpc/mm/hugetlbpage.c                 |  3 ++-
 arch/powerpc/mm/pgtable.c                     | 26 ++++++++++++++++---
 4 files changed, 46 insertions(+), 6 deletions(-)

diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
index a46616937d20..785437323576 100644
--- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
@@ -41,4 +41,24 @@ static inline int check_and_get_huge_psize(int shift)
 	return shift_to_mmu_psize(shift);
 }
 
+#define __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte);
+
+#define __HAVE_ARCH_HUGE_PTE_CLEAR
+static inline void huge_pte_clear(struct mm_struct *mm, unsigned long addr,
+				  pte_t *ptep, unsigned long sz)
+{
+	pte_update(mm, addr, ptep, ~0UL, 0, 1);
+}
+
+#define __HAVE_ARCH_HUGE_PTEP_SET_WRPROTECT
+static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
+					   unsigned long addr, pte_t *ptep)
+{
+	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
+	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
+
+	pte_update(mm, addr, ptep, clr, set, 1);
+}
+
 #endif /* _ASM_POWERPC_NOHASH_32_HUGETLB_8XX_H */
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 5fb3f6798e22..ff78bf25f832 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -314,8 +314,9 @@ static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
 	pte_t pte_clr = pte_mkyoung(pte_mkdirty(pte_mkwrite(pte_mkexec(__pte(~0)))));
 	unsigned long set = pte_val(entry) & pte_val(pte_set);
 	unsigned long clr = ~pte_val(entry) & ~pte_val(pte_clr);
+	int huge = psize > mmu_virtual_psize ? 1 : 0;
 
-	pte_update(vma->vm_mm, address, ptep, clr, set, 0);
+	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
 
 	flush_tlb_page(vma, address);
 }
diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
index d06efb946c7d..521929a371af 100644
--- a/arch/powerpc/mm/hugetlbpage.c
+++ b/arch/powerpc/mm/hugetlbpage.c
@@ -30,7 +30,8 @@ bool hugetlb_disabled = false;
 
 #define hugepd_none(hpd)	(hpd_val(hpd) == 0)
 
-#define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_t)) - __builtin_ffs(sizeof(void *)))
+#define PTE_T_ORDER	(__builtin_ffs(sizeof(pte_basic_t)) - \
+			 __builtin_ffs(sizeof(void *)))
 
 pte_t *huge_pte_offset(struct mm_struct *mm, unsigned long addr, unsigned long sz)
 {
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index e3759b69f81b..214a5f4beb6c 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -100,7 +100,7 @@ static pte_t set_pte_filter_hash(pte_t pte) { return pte; }
  * as we don't have two bits to spare for _PAGE_EXEC and _PAGE_HWEXEC so
  * instead we "filter out" the exec permission for non clean pages.
  */
-static pte_t set_pte_filter(pte_t pte)
+static inline pte_t set_pte_filter(pte_t pte)
 {
 	struct page *pg;
 
@@ -249,16 +249,34 @@ int huge_ptep_set_access_flags(struct vm_area_struct *vma,
 
 #else
 		/*
-		 * Not used on non book3s64 platforms. But 8xx
-		 * can possibly use tsize derived from hstate.
+		 * Not used on non book3s64 platforms.
+		 * 8xx compares it with mmu_virtual_psize to
+		 * know if it is a huge page or not.
 		 */
-		psize = 0;
+		psize = MMU_PAGE_COUNT;
 #endif
 		__ptep_set_access_flags(vma, ptep, pte, addr, psize);
 	}
 	return changed;
 #endif
 }
+
+#if defined(CONFIG_PPC_8xx)
+void set_huge_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep, pte_t pte)
+{
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	pte = pte_mkpte(pte);
+
+	pte = set_pte_filter(pte);
+
+	ptep->pte = pte_val(pte);
+}
+#endif
 #endif /* CONFIG_HUGETLB_PAGE */
 
 #ifdef CONFIG_DEBUG_VM
-- 
2.25.0

