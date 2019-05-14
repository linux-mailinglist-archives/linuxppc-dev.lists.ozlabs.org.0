Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C441C2B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 08:04:32 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4536b13k12zDqJP
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 May 2019 16:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4536Yg3RHtzDqHr
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 May 2019 16:03:19 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x4E62IGt091171; Tue, 14 May 2019 02:03:13 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2sfpq7arg0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2019 02:03:13 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x4E03Krs010953;
 Tue, 14 May 2019 00:07:33 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 2sdp14kus8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 14 May 2019 00:07:32 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x4E63A2r11927916
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 14 May 2019 06:03:10 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 32E43BE051;
 Tue, 14 May 2019 06:03:10 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3523FBE054;
 Tue, 14 May 2019 06:03:08 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.80.230.27])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 14 May 2019 06:03:07 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH 1/3] powerpc/book3s: Use config independent helpers for page
 table walk
Date: Tue, 14 May 2019 11:33:00 +0530
Message-Id: <20190514060302.21505-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-05-14_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1905140043
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Even when we have HugeTLB and THP disabled, kernel linear map can still be
mapped with hugepages. This is only an issue with radix translation because hash
MMU doesn't map kernel linear range in linux page table and other kernel
map areas are not mapped using hugepage.

Add config independent helpers and put WARN_ON() when we don't expect things
to be mapped via hugepages.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h | 21 +++++++++++++++
 arch/powerpc/include/asm/pgtable.h           | 24 +++++++++++++++++
 arch/powerpc/include/asm/pte-walk.h          | 28 ++++++++++++++++++--
 arch/powerpc/kvm/book3s_64_mmu_radix.c       | 12 +++------
 arch/powerpc/mm/book3s64/radix_pgtable.c     | 10 +++----
 arch/powerpc/mm/pgtable.c                    | 16 +++++------
 arch/powerpc/mm/pgtable_64.c                 | 12 ++++++---
 arch/powerpc/mm/ptdump/ptdump.c              |  6 ++---
 arch/powerpc/xmon/xmon.c                     |  6 ++---
 9 files changed, 102 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 7dede2e34b70..f402b2a96ef3 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -1313,5 +1313,26 @@ static inline bool is_pte_rw_upgrade(unsigned long old_val, unsigned long new_va
 	return false;
 }
 
+/*
+ * Like pmd_huge() and pmd_large(), but works regardless of config options
+ */
+#define pmd_is_leaf pmd_is_leaf
+static inline bool pmd_is_leaf(pmd_t pmd)
+{
+	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
+}
+
+#define pud_is_leaf pud_is_leaf
+static inline bool pud_is_leaf(pud_t pud)
+{
+	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
+}
+
+#define pgd_is_leaf pgd_is_leaf
+static inline bool pgd_is_leaf(pgd_t pgd)
+{
+	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
+}
+
 #endif /* __ASSEMBLY__ */
 #endif /* _ASM_POWERPC_BOOK3S_64_PGTABLE_H_ */
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 3f53be60fb01..bf7d771f342e 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -140,6 +140,30 @@ static inline void pte_frag_set(mm_context_t *ctx, void *p)
 }
 #endif
 
+#ifndef pmd_is_leaf
+#define pmd_is_leaf pmd_is_leaf
+static inline bool pmd_is_leaf(pmd_t pmd)
+{
+	return false;
+}
+#endif
+
+#ifndef pud_is_leaf
+#define pud_is_leaf pud_is_leaf
+static inline bool pud_is_leaf(pud_t pud)
+{
+	return false;
+}
+#endif
+
+#ifndef pgd_is_leaf
+#define pgd_is_leaf pgd_is_leaf
+static inline bool pgd_is_leaf(pgd_t pgd)
+{
+	return false;
+}
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_POWERPC_PGTABLE_H */
diff --git a/arch/powerpc/include/asm/pte-walk.h b/arch/powerpc/include/asm/pte-walk.h
index 2d633e9d686c..33fa5dd8ee6a 100644
--- a/arch/powerpc/include/asm/pte-walk.h
+++ b/arch/powerpc/include/asm/pte-walk.h
@@ -10,8 +10,20 @@ extern pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 static inline pte_t *find_linux_pte(pgd_t *pgdir, unsigned long ea,
 				    bool *is_thp, unsigned *hshift)
 {
+	pte_t *pte;
+
 	VM_WARN(!arch_irqs_disabled(), "%s called with irq enabled\n", __func__);
-	return __find_linux_pte(pgdir, ea, is_thp, hshift);
+	pte = __find_linux_pte(pgdir, ea, is_thp, hshift);
+
+#if defined(CONFIG_DEBUG_VM) &&						\
+	!(defined(CONFIG_HUGETLB_PAGE) || defined(CONFIG_TRANSPARENT_HUGEPAGE))
+	/*
+	 * We should not find huge page if these configs are not enabled.
+	 */
+	if (hshift)
+		WARN_ON(*hshift);
+#endif
+	return pte;
 }
 
 static inline pte_t *find_init_mm_pte(unsigned long ea, unsigned *hshift)
@@ -26,10 +38,22 @@ static inline pte_t *find_init_mm_pte(unsigned long ea, unsigned *hshift)
 static inline pte_t *find_current_mm_pte(pgd_t *pgdir, unsigned long ea,
 					 bool *is_thp, unsigned *hshift)
 {
+	pte_t *pte;
+
 	VM_WARN(!arch_irqs_disabled(), "%s called with irq enabled\n", __func__);
 	VM_WARN(pgdir != current->mm->pgd,
 		"%s lock less page table lookup called on wrong mm\n", __func__);
-	return __find_linux_pte(pgdir, ea, is_thp, hshift);
+	pte = __find_linux_pte(pgdir, ea, is_thp, hshift);
+
+#if defined(CONFIG_DEBUG_VM) &&						\
+	!(defined(CONFIG_HUGETLB_PAGE) || defined(CONFIG_TRANSPARENT_HUGEPAGE))
+	/*
+	 * We should not find huge page if these configs are not enabled.
+	 */
+	if (hshift)
+		WARN_ON(*hshift);
+#endif
+	return pte;
 }
 
 #endif /* _ASM_POWERPC_PTE_WALK_H */
diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index f55ef071883f..91efee7f0329 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -363,12 +363,6 @@ static void kvmppc_pte_free(pte_t *ptep)
 	kmem_cache_free(kvm_pte_cache, ptep);
 }
 
-/* Like pmd_huge() and pmd_large(), but works regardless of config options */
-static inline int pmd_is_leaf(pmd_t pmd)
-{
-	return !!(pmd_val(pmd) & _PAGE_PTE);
-}
-
 static pmd_t *kvmppc_pmd_alloc(void)
 {
 	return kmem_cache_alloc(kvm_pmd_cache, GFP_KERNEL);
@@ -489,7 +483,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	for (iu = 0; iu < PTRS_PER_PUD; ++iu, ++p) {
 		if (!pud_present(*p))
 			continue;
-		if (pud_huge(*p)) {
+		if (pud_is_leaf(*p)) {
 			pud_clear(p);
 		} else {
 			pmd_t *pmd;
@@ -588,7 +582,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = pud_alloc_one(kvm->mm, gpa);
 
 	pmd = NULL;
-	if (pud && pud_present(*pud) && !pud_huge(*pud))
+	if (pud && pud_present(*pud) && !pud_is_leaf(*pud))
 		pmd = pmd_offset(pud, gpa);
 	else if (level <= 1)
 		new_pmd = kvmppc_pmd_alloc();
@@ -611,7 +605,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = NULL;
 	}
 	pud = pud_offset(pgd, gpa);
-	if (pud_huge(*pud)) {
+	if (pud_is_leaf(*pud)) {
 		unsigned long hgpa = gpa & PUD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 247a38a3f3a6..b78f6fbdd307 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -202,14 +202,14 @@ void radix__change_memory_range(unsigned long start, unsigned long end,
 		pudp = pud_alloc(&init_mm, pgdp, idx);
 		if (!pudp)
 			continue;
-		if (pud_huge(*pudp)) {
+		if (pud_is_leaf(*pudp)) {
 			ptep = (pte_t *)pudp;
 			goto update_the_pte;
 		}
 		pmdp = pmd_alloc(&init_mm, pudp, idx);
 		if (!pmdp)
 			continue;
-		if (pmd_huge(*pmdp)) {
+		if (pmd_is_leaf(*pmdp)) {
 			ptep = pmdp_ptep(pmdp);
 			goto update_the_pte;
 		}
@@ -837,7 +837,7 @@ static void remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 		if (!pmd_present(*pmd))
 			continue;
 
-		if (pmd_huge(*pmd)) {
+		if (pmd_is_leaf(*pmd)) {
 			split_kernel_mapping(addr, end, PMD_SIZE, (pte_t *)pmd);
 			continue;
 		}
@@ -862,7 +862,7 @@ static void remove_pud_table(pud_t *pud_start, unsigned long addr,
 		if (!pud_present(*pud))
 			continue;
 
-		if (pud_huge(*pud)) {
+		if (pud_is_leaf(*pud)) {
 			split_kernel_mapping(addr, end, PUD_SIZE, (pte_t *)pud);
 			continue;
 		}
@@ -888,7 +888,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 		if (!pgd_present(*pgd))
 			continue;
 
-		if (pgd_huge(*pgd)) {
+		if (pgd_is_leaf(*pgd)) {
 			split_kernel_mapping(addr, end, PGDIR_SIZE, (pte_t *)pgd);
 			continue;
 			/* This should fall through? */
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index db4a6253df92..b97aee03924f 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -340,10 +340,11 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pgd_none(pgd))
 		return NULL;
 
-	if (pgd_huge(pgd)) {
+	if (pgd_is_leaf(pgd)) {
 		ret_pte = (pte_t *)pgdp;
 		goto out;
 	}
+
 	if (is_hugepd(__hugepd(pgd_val(pgd)))) {
 		hpdp = (hugepd_t *)&pgd;
 		goto out_huge;
@@ -361,14 +362,16 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pud_none(pud))
 		return NULL;
 
-	if (pud_huge(pud)) {
+	if (pud_is_leaf(pud)) {
 		ret_pte = (pte_t *)pudp;
 		goto out;
 	}
+
 	if (is_hugepd(__hugepd(pud_val(pud)))) {
 		hpdp = (hugepd_t *)&pud;
 		goto out_huge;
 	}
+
 	pdshift = PMD_SHIFT;
 	pmdp = pmd_offset(&pud, ea);
 	pmd  = READ_ONCE(*pmdp);
@@ -385,15 +388,12 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		ret_pte = (pte_t *)pmdp;
 		goto out;
 	}
-	/*
-	 * pmd_large check below will handle the swap pmd pte
-	 * we need to do both the check because they are config
-	 * dependent.
-	 */
-	if (pmd_huge(pmd) || pmd_large(pmd)) {
+
+	if (pmd_is_leaf(pmd)) {
 		ret_pte = (pte_t *)pmdp;
 		goto out;
 	}
+
 	if (is_hugepd(__hugepd(pmd_val(pmd)))) {
 		hpdp = (hugepd_t *)&pmd;
 		goto out_huge;
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index d2d976ff8a0e..bfb47b037a2f 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -296,16 +296,20 @@ EXPORT_SYMBOL(__iounmap_at);
 /* 4 level page table */
 struct page *pgd_page(pgd_t pgd)
 {
-	if (pgd_huge(pgd))
+	if (pgd_is_leaf(pgd)) {
+		VM_WARN_ON(!pgd_huge(pgd));
 		return pte_page(pgd_pte(pgd));
+	}
 	return virt_to_page(pgd_page_vaddr(pgd));
 }
 #endif
 
 struct page *pud_page(pud_t pud)
 {
-	if (pud_huge(pud))
+	if (pud_is_leaf(pud)) {
+		VM_WARN_ON(!pud_huge(pud));
 		return pte_page(pud_pte(pud));
+	}
 	return virt_to_page(pud_page_vaddr(pud));
 }
 
@@ -315,8 +319,10 @@ struct page *pud_page(pud_t pud)
  */
 struct page *pmd_page(pmd_t pmd)
 {
-	if (pmd_large(pmd) || pmd_huge(pmd) || pmd_devmap(pmd))
+	if (pmd_is_leaf(pmd)) {
+		VM_WARN_ON(!(pmd_large(pmd) || pmd_huge(pmd) || pmd_devmap(pmd)));
 		return pte_page(pmd_pte(pmd));
+	}
 	return virt_to_page(pmd_page_vaddr(pmd));
 }
 
diff --git a/arch/powerpc/mm/ptdump/ptdump.c b/arch/powerpc/mm/ptdump/ptdump.c
index 646876d9da64..abe60d25b4e6 100644
--- a/arch/powerpc/mm/ptdump/ptdump.c
+++ b/arch/powerpc/mm/ptdump/ptdump.c
@@ -277,7 +277,7 @@ static void walk_pmd(struct pg_state *st, pud_t *pud, unsigned long start)
 
 	for (i = 0; i < PTRS_PER_PMD; i++, pmd++) {
 		addr = start + i * PMD_SIZE;
-		if (!pmd_none(*pmd) && !pmd_huge(*pmd))
+		if (!pmd_none(*pmd) && !pmd_is_leaf(*pmd))
 			/* pmd exists */
 			walk_pte(st, pmd, addr);
 		else
@@ -293,7 +293,7 @@ static void walk_pud(struct pg_state *st, pgd_t *pgd, unsigned long start)
 
 	for (i = 0; i < PTRS_PER_PUD; i++, pud++) {
 		addr = start + i * PUD_SIZE;
-		if (!pud_none(*pud) && !pud_huge(*pud))
+		if (!pud_none(*pud) && !pud_is_leaf(*pud))
 			/* pud exists */
 			walk_pmd(st, pud, addr);
 		else
@@ -314,7 +314,7 @@ static void walk_pagetables(struct pg_state *st)
 	 * the hash pagetable.
 	 */
 	for (i = 0; i < PTRS_PER_PGD; i++, pgd++, addr += PGDIR_SIZE) {
-		if (!pgd_none(*pgd) && !pgd_huge(*pgd))
+		if (!pgd_none(*pgd) && !pgd_is_leaf(*pgd))
 			/* pgd exists */
 			walk_pud(st, pgd, addr);
 		else
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 1b0149b2bb6c..49353e01edfa 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3094,7 +3094,7 @@ static void show_pte(unsigned long addr)
 
 	printf("pgd  @ 0x%px\n", pgdir);
 
-	if (pgd_huge(*pgdp)) {
+	if (pgd_is_leaf(*pgdp)) {
 		format_pte(pgdp, pgd_val(*pgdp));
 		return;
 	}
@@ -3107,7 +3107,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pud_huge(*pudp)) {
+	if (pud_is_leaf(*pudp)) {
 		format_pte(pudp, pud_val(*pudp));
 		return;
 	}
@@ -3121,7 +3121,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pmd_huge(*pmdp)) {
+	if (pmd_is_leaf(*pmdp)) {
 		format_pte(pmdp, pmd_val(*pmdp));
 		return;
 	}
-- 
2.21.0

