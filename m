Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C817472369D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:08:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZz5W46J3z3f07
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:08:31 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tmyLDTj0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=tmyLDTj0;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZysP11fvz3fBs
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:58:00 +1000 (AEST)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564NQRi001405;
	Tue, 6 Jun 2023 04:57:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=KG3B1zhzRmYjQDSDHU7M5nO+GeFfHYvYxM5nqhJYc5k=;
 b=tmyLDTj0NkjrjiOJIQsu1cCB66pfAsiVkzHokIAnDvsa3uidWdKdmmNpTtUf9p1Ik98C
 xA3a3skanFfPRFxYBjBFoS8ObmQPd3R+amrFlCH13WBcFETcEtvZ+0UvZ6ou3AYfjY2l
 oD0OFot4aD6rh2YQfd1EoDhXi7RzVzBM5rkLy6Kb1gnIvI48P3Xy8VE1q5iVzzTAFQXQ
 kXKFu+pu21fHeNZZ39V4NukajwHZI3mlmtNC0jJhEIZBxNXKyhP4utx5WmUjKUank817
 rw1XHB1mYfTB5+R5ePlUYweFd7Ms0VfFLnB599zWUE00f4cKdyg4uMRdG201OW2fn148 UQ== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1wqxgffn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:42 +0000
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564c5uu001669;
	Tue, 6 Jun 2023 04:57:42 GMT
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com [169.63.214.131])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1wqxgffe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:42 +0000
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
	by ppma01dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35644dl1019544;
	Tue, 6 Jun 2023 04:57:41 GMT
Received: from smtprelay07.wdc07v.mail.ibm.com ([9.208.129.116])
	by ppma01dal.us.ibm.com (PPS) with ESMTPS id 3qyxj3vbk2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:41 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay07.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564vdmg60883246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:57:39 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9327858059;
	Tue,  6 Jun 2023 04:57:39 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 57B4B58055;
	Tue,  6 Jun 2023 04:57:34 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:57:34 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 13/16] powerpc/book3s64/mm: Enable transparent pud hugepage
Date: Tue,  6 Jun 2023 10:26:05 +0530
Message-Id: <20230606045608.55127-14-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UTEK3RMng6P6I0WD2qkLyHvRyrntOvBE
X-Proofpoint-GUID: LzXnENrlPqUH9Kwo7-BrbvKTgHh_vcBf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 spamscore=0
 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2306060040
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
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Catalin Marinas <catalin.marinas@arm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, linuxppc-dev@lists.ozlabs.org, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is enabled only with radix translation and 1G hugepage size. This will be
used with devdax device memory with a namespace alignment of 1G.

Anon transparent hugepage is not supported even though we do have helpers
checking pud_trans_huge(). We should never find that return true. The only
expected pte bit combination is _PAGE_PTE | _PAGE_DEVMAP.

Some of the helpers are never expected to get called on hash translation and
hence is marked to call BUG() in such a case.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/pgtable.h  | 156 ++++++++++++++++--
 arch/powerpc/include/asm/book3s/64/radix.h    |  37 +++++
 .../include/asm/book3s/64/tlbflush-radix.h    |   2 +
 arch/powerpc/include/asm/book3s/64/tlbflush.h |   8 +
 arch/powerpc/mm/book3s64/pgtable.c            |  78 +++++++++
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  28 ++++
 arch/powerpc/mm/book3s64/radix_tlb.c          |   7 +
 arch/powerpc/platforms/Kconfig.cputype        |   1 +
 include/trace/events/thp.h                    |  17 ++
 9 files changed, 323 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 4acc9690f599..9a05de007956 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -921,8 +921,29 @@ static inline pud_t pte_pud(pte_t pte)
 {
 	return __pud_raw(pte_raw(pte));
 }
+
+static inline pte_t *pudp_ptep(pud_t *pud)
+{
+	return (pte_t *)pud;
+}
+
+#define pud_pfn(pud)		pte_pfn(pud_pte(pud))
+#define pud_dirty(pud)		pte_dirty(pud_pte(pud))
+#define pud_young(pud)		pte_young(pud_pte(pud))
+#define pud_mkold(pud)		pte_pud(pte_mkold(pud_pte(pud)))
+#define pud_wrprotect(pud)	pte_pud(pte_wrprotect(pud_pte(pud)))
+#define pud_mkdirty(pud)	pte_pud(pte_mkdirty(pud_pte(pud)))
+#define pud_mkclean(pud)	pte_pud(pte_mkclean(pud_pte(pud)))
+#define pud_mkyoung(pud)	pte_pud(pte_mkyoung(pud_pte(pud)))
+#define pud_mkwrite(pud)	pte_pud(pte_mkwrite(pud_pte(pud)))
 #define pud_write(pud)		pte_write(pud_pte(pud))
 
+#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
+#define pud_soft_dirty(pmd)    pte_soft_dirty(pud_pte(pud))
+#define pud_mksoft_dirty(pmd)  pte_pud(pte_mksoft_dirty(pud_pte(pud)))
+#define pud_clear_soft_dirty(pmd) pte_pud(pte_clear_soft_dirty(pud_pte(pud)))
+#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
+
 static inline int pud_bad(pud_t pud)
 {
 	if (radix_enabled())
@@ -1115,15 +1136,24 @@ static inline bool pmd_access_permitted(pmd_t pmd, bool write)
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
+extern pud_t pfn_pud(unsigned long pfn, pgprot_t pgprot);
 extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
 extern pmd_t pmd_modify(pmd_t pmd, pgprot_t newprot);
 extern void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 		       pmd_t *pmdp, pmd_t pmd);
+extern void set_pud_at(struct mm_struct *mm, unsigned long addr,
+		       pud_t *pudp, pud_t pud);
+
 static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
 					unsigned long addr, pmd_t *pmd)
 {
 }
 
+static inline void update_mmu_cache_pud(struct vm_area_struct *vma,
+					unsigned long addr, pud_t *pud)
+{
+}
+
 extern int hash__has_transparent_hugepage(void);
 static inline int has_transparent_hugepage(void)
 {
@@ -1133,6 +1163,14 @@ static inline int has_transparent_hugepage(void)
 }
 #define has_transparent_hugepage has_transparent_hugepage
 
+static inline int has_transparent_pud_hugepage(void)
+{
+	if (radix_enabled())
+		return radix__has_transparent_pud_hugepage();
+	return 0;
+}
+#define has_transparent_pud_hugepage has_transparent_pud_hugepage
+
 static inline unsigned long
 pmd_hugepage_update(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp,
 		    unsigned long clr, unsigned long set)
@@ -1142,6 +1180,16 @@ pmd_hugepage_update(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp,
 	return hash__pmd_hugepage_update(mm, addr, pmdp, clr, set);
 }
 
+static inline unsigned long
+pud_hugepage_update(struct mm_struct *mm, unsigned long addr, pud_t *pudp,
+		    unsigned long clr, unsigned long set)
+{
+	if (radix_enabled())
+		return radix__pud_hugepage_update(mm, addr, pudp, clr, set);
+	BUG();
+	return pud_val(*pudp);
+}
+
 /*
  * returns true for pmd migration entries, THP, devmap, hugetlb
  * But compile time dependent on THP config
@@ -1151,6 +1199,11 @@ static inline int pmd_large(pmd_t pmd)
 	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
 }
 
+static inline int pud_large(pud_t pud)
+{
+	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
+}
+
 /*
  * For radix we should always find H_PAGE_HASHPTE zero. Hence
  * the below will work for radix too
@@ -1166,6 +1219,17 @@ static inline int __pmdp_test_and_clear_young(struct mm_struct *mm,
 	return ((old & _PAGE_ACCESSED) != 0);
 }
 
+static inline int __pudp_test_and_clear_young(struct mm_struct *mm,
+					      unsigned long addr, pud_t *pudp)
+{
+	unsigned long old;
+
+	if ((pud_raw(*pudp) & cpu_to_be64(_PAGE_ACCESSED | H_PAGE_HASHPTE)) == 0)
+		return 0;
+	old = pud_hugepage_update(mm, addr, pudp, _PAGE_ACCESSED, 0);
+	return ((old & _PAGE_ACCESSED) != 0);
+}
+
 #define __HAVE_ARCH_PMDP_SET_WRPROTECT
 static inline void pmdp_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 				      pmd_t *pmdp)
@@ -1174,6 +1238,14 @@ static inline void pmdp_set_wrprotect(struct mm_struct *mm, unsigned long addr,
 		pmd_hugepage_update(mm, addr, pmdp, _PAGE_WRITE, 0);
 }
 
+#define __HAVE_ARCH_PUDP_SET_WRPROTECT
+static inline void pudp_set_wrprotect(struct mm_struct *mm, unsigned long addr,
+				      pud_t *pudp)
+{
+	if (pud_write(*pudp))
+		pud_hugepage_update(mm, addr, pudp, _PAGE_WRITE, 0);
+}
+
 /*
  * Only returns true for a THP. False for pmd migration entry.
  * We also need to return true when we come across a pte that
@@ -1195,6 +1267,17 @@ static inline int pmd_trans_huge(pmd_t pmd)
 	return hash__pmd_trans_huge(pmd);
 }
 
+static inline int pud_trans_huge(pud_t pud)
+{
+	if (!pud_present(pud))
+		return false;
+
+	if (radix_enabled())
+		return radix__pud_trans_huge(pud);
+	return 0;
+}
+
+
 #define __HAVE_ARCH_PMD_SAME
 static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
 {
@@ -1203,6 +1286,16 @@ static inline int pmd_same(pmd_t pmd_a, pmd_t pmd_b)
 	return hash__pmd_same(pmd_a, pmd_b);
 }
 
+#define __HAVE_ARCH_PUD_SAME
+static inline int pud_same(pud_t pud_a, pud_t pud_b)
+{
+	if (radix_enabled())
+		return radix__pud_same(pud_a, pud_b);
+	BUG();
+	return 0;
+}
+
+
 static inline pmd_t __pmd_mkhuge(pmd_t pmd)
 {
 	if (radix_enabled())
@@ -1210,6 +1303,14 @@ static inline pmd_t __pmd_mkhuge(pmd_t pmd)
 	return hash__pmd_mkhuge(pmd);
 }
 
+static inline pud_t __pud_mkhuge(pud_t pud)
+{
+	if (radix_enabled())
+		return radix__pud_mkhuge(pud);
+	BUG();
+	return pud;
+}
+
 /*
  * pfn_pmd return a pmd_t that can be used as pmd pte entry.
  */
@@ -1225,14 +1326,34 @@ static inline pmd_t pmd_mkhuge(pmd_t pmd)
 	return pmd;
 }
 
+static inline pud_t pud_mkhuge(pud_t pud)
+{
+#ifdef CONFIG_DEBUG_VM
+	if (radix_enabled())
+		WARN_ON((pud_raw(pud) & cpu_to_be64(_PAGE_PTE)) == 0);
+	else
+		WARN_ON(1);
+#endif
+	return pud;
+}
+
+
 #define __HAVE_ARCH_PMDP_SET_ACCESS_FLAGS
 extern int pmdp_set_access_flags(struct vm_area_struct *vma,
 				 unsigned long address, pmd_t *pmdp,
 				 pmd_t entry, int dirty);
+#define __HAVE_ARCH_PUDP_SET_ACCESS_FLAGS
+extern int pudp_set_access_flags(struct vm_area_struct *vma,
+				 unsigned long address, pud_t *pudp,
+				 pud_t entry, int dirty);
 
 #define __HAVE_ARCH_PMDP_TEST_AND_CLEAR_YOUNG
 extern int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 				     unsigned long address, pmd_t *pmdp);
+#define __HAVE_ARCH_PUDP_TEST_AND_CLEAR_YOUNG
+extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
+				     unsigned long address, pud_t *pudp);
+
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
@@ -1243,6 +1364,16 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
 }
 
+#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
+static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
+					    unsigned long addr, pud_t *pudp)
+{
+	if (radix_enabled())
+		return radix__pudp_huge_get_and_clear(mm, addr, pudp);
+	BUG();
+	return *pudp;
+}
+
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
 					unsigned long address, pmd_t *pmdp)
 {
@@ -1257,6 +1388,11 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 				   unsigned long addr,
 				   pmd_t *pmdp, int full);
 
+#define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
+pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
+				   unsigned long addr,
+				   pud_t *pudp, int full);
+
 #define __HAVE_ARCH_PGTABLE_DEPOSIT
 static inline void pgtable_trans_huge_deposit(struct mm_struct *mm,
 					      pmd_t *pmdp, pgtable_t pgtable)
@@ -1305,6 +1441,14 @@ static inline pmd_t pmd_mkdevmap(pmd_t pmd)
 	return hash__pmd_mkdevmap(pmd);
 }
 
+static inline pud_t pud_mkdevmap(pud_t pud)
+{
+	if (radix_enabled())
+		return radix__pud_mkdevmap(pud);
+	BUG();
+	return pud;
+}
+
 static inline int pmd_devmap(pmd_t pmd)
 {
 	return pte_devmap(pmd_pte(pmd));
@@ -1312,7 +1456,7 @@ static inline int pmd_devmap(pmd_t pmd)
 
 static inline int pud_devmap(pud_t pud)
 {
-	return 0;
+	return pte_devmap(pud_pte(pud));
 }
 
 static inline int pgd_devmap(pgd_t pgd)
@@ -1321,16 +1465,6 @@ static inline int pgd_devmap(pgd_t pgd)
 }
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
-static inline int pud_pfn(pud_t pud)
-{
-	/*
-	 * Currently all calls to pud_pfn() are gated around a pud_devmap()
-	 * check so this should never be used. If it grows another user we
-	 * want to know about it.
-	 */
-	BUILD_BUG();
-	return 0;
-}
 #define __HAVE_ARCH_PTEP_MODIFY_PROT_TRANSACTION
 pte_t ptep_modify_prot_start(struct vm_area_struct *, unsigned long, pte_t *);
 void ptep_modify_prot_commit(struct vm_area_struct *, unsigned long,
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 686001eda936..8cdff5a05011 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -250,6 +250,10 @@ static inline int radix__pud_bad(pud_t pud)
 	return !!(pud_val(pud) & RADIX_PUD_BAD_BITS);
 }
 
+static inline int radix__pud_same(pud_t pud_a, pud_t pud_b)
+{
+	return ((pud_raw(pud_a) ^ pud_raw(pud_b)) == 0);
+}
 
 static inline int radix__p4d_bad(p4d_t p4d)
 {
@@ -268,9 +272,22 @@ static inline pmd_t radix__pmd_mkhuge(pmd_t pmd)
 	return __pmd(pmd_val(pmd) | _PAGE_PTE);
 }
 
+static inline int radix__pud_trans_huge(pud_t pud)
+{
+	return (pud_val(pud) & (_PAGE_PTE | _PAGE_DEVMAP)) == _PAGE_PTE;
+}
+
+static inline pud_t radix__pud_mkhuge(pud_t pud)
+{
+	return __pud(pud_val(pud) | _PAGE_PTE);
+}
+
 extern unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long addr,
 					  pmd_t *pmdp, unsigned long clr,
 					  unsigned long set);
+extern unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long addr,
+						pud_t *pudp, unsigned long clr,
+						unsigned long set);
 extern pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma,
 				  unsigned long address, pmd_t *pmdp);
 extern void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
@@ -278,6 +295,9 @@ extern void radix__pgtable_trans_huge_deposit(struct mm_struct *mm, pmd_t *pmdp,
 extern pgtable_t radix__pgtable_trans_huge_withdraw(struct mm_struct *mm, pmd_t *pmdp);
 extern pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 				      unsigned long addr, pmd_t *pmdp);
+pud_t radix__pudp_huge_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pud_t *pudp);
+
 static inline int radix__has_transparent_hugepage(void)
 {
 	/* For radix 2M at PMD level means thp */
@@ -285,6 +305,14 @@ static inline int radix__has_transparent_hugepage(void)
 		return 1;
 	return 0;
 }
+
+static inline int radix__has_transparent_pud_hugepage(void)
+{
+	/* For radix 1G at PUD level means pud hugepage support */
+	if (mmu_psize_defs[MMU_PAGE_1G].shift == PUD_SHIFT)
+		return 1;
+	return 0;
+}
 #endif
 
 static inline pmd_t radix__pmd_mkdevmap(pmd_t pmd)
@@ -292,9 +320,18 @@ static inline pmd_t radix__pmd_mkdevmap(pmd_t pmd)
 	return __pmd(pmd_val(pmd) | (_PAGE_PTE | _PAGE_DEVMAP));
 }
 
+static inline pud_t radix__pud_mkdevmap(pud_t pud)
+{
+	return __pud(pud_val(pud) | (_PAGE_PTE | _PAGE_DEVMAP));
+}
+
+struct vmem_altmap;
+struct dev_pagemap;
 extern int __meminit radix__vmemmap_create_mapping(unsigned long start,
 					     unsigned long page_size,
 					     unsigned long phys);
+int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end,
+				      int node, struct vmem_altmap *altmap);
 extern void radix__vmemmap_remove_mapping(unsigned long start,
 				    unsigned long page_size);
 
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
index 77797a2a82eb..a38542259fab 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush-radix.h
@@ -68,6 +68,8 @@ void radix__flush_tlb_pwc_range_psize(struct mm_struct *mm, unsigned long start,
 				      unsigned long end, int psize);
 extern void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
 				       unsigned long start, unsigned long end);
+extern void radix__flush_pud_tlb_range(struct vm_area_struct *vma,
+				       unsigned long start, unsigned long end);
 extern void radix__flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
 			    unsigned long end);
 extern void radix__flush_tlb_kernel_range(unsigned long start, unsigned long end);
diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index 0d0c1447ecf0..a01c20a8fbf7 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -50,6 +50,14 @@ static inline void flush_pmd_tlb_range(struct vm_area_struct *vma,
 		radix__flush_pmd_tlb_range(vma, start, end);
 }
 
+#define __HAVE_ARCH_FLUSH_PUD_TLB_RANGE
+static inline void flush_pud_tlb_range(struct vm_area_struct *vma,
+				       unsigned long start, unsigned long end)
+{
+	if (radix_enabled())
+		radix__flush_pud_tlb_range(vma, start, end);
+}
+
 #define __HAVE_ARCH_FLUSH_HUGETLB_TLB_RANGE
 static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 					   unsigned long start,
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 85c84e89e3ea..9e5f01a1738c 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -64,11 +64,39 @@ int pmdp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
 	return changed;
 }
 
+int pudp_set_access_flags(struct vm_area_struct *vma, unsigned long address,
+			  pud_t *pudp, pud_t entry, int dirty)
+{
+	int changed;
+#ifdef CONFIG_DEBUG_VM
+	WARN_ON(!pud_devmap(*pudp));
+	assert_spin_locked(pud_lockptr(vma->vm_mm, pudp));
+#endif
+	changed = !pud_same(*(pudp), entry);
+	if (changed) {
+		/*
+		 * We can use MMU_PAGE_2M here, because only radix
+		 * path look at the psize.
+		 */
+		__ptep_set_access_flags(vma, pudp_ptep(pudp),
+					pud_pte(entry), address, MMU_PAGE_1G);
+	}
+	return changed;
+}
+
+
 int pmdp_test_and_clear_young(struct vm_area_struct *vma,
 			      unsigned long address, pmd_t *pmdp)
 {
 	return __pmdp_test_and_clear_young(vma->vm_mm, address, pmdp);
 }
+
+int pudp_test_and_clear_young(struct vm_area_struct *vma,
+			      unsigned long address, pud_t *pudp)
+{
+	return __pudp_test_and_clear_young(vma->vm_mm, address, pudp);
+}
+
 /*
  * set a new huge pmd. We should not be called for updating
  * an existing pmd entry. That should go via pmd_hugepage_update.
@@ -90,6 +118,23 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	return set_pte_at(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
+void set_pud_at(struct mm_struct *mm, unsigned long addr,
+		pud_t *pudp, pud_t pud)
+{
+#ifdef CONFIG_DEBUG_VM
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+
+	WARN_ON(pte_hw_valid(pud_pte(*pudp)));
+	assert_spin_locked(pud_lockptr(mm, pudp));
+	WARN_ON(!(pud_large(pud)));
+#endif
+	trace_hugepage_set_pud(addr, pud_val(pud));
+	return set_pte_at(mm, addr, pudp_ptep(pudp), pud_pte(pud));
+}
+
 static void do_serialize(void *arg)
 {
 	/* We've taken the IPI, so try to trim the mask while here */
@@ -147,11 +192,35 @@ pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 	return pmd;
 }
 
+pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
+				   unsigned long addr, pud_t *pudp, int full)
+{
+	pud_t pud;
+
+	VM_BUG_ON(addr & ~HPAGE_PMD_MASK);
+	VM_BUG_ON((pud_present(*pudp) && !pud_devmap(*pudp)) ||
+		  !pud_present(*pudp));
+	pud = pudp_huge_get_and_clear(vma->vm_mm, addr, pudp);
+	/*
+	 * if it not a fullmm flush, then we can possibly end up converting
+	 * this PMD pte entry to a regular level 0 PTE by a parallel page fault.
+	 * Make sure we flush the tlb in this case.
+	 */
+	if (!full)
+		flush_pud_tlb_range(vma, addr, addr + HPAGE_PUD_SIZE);
+	return pud;
+}
+
 static pmd_t pmd_set_protbits(pmd_t pmd, pgprot_t pgprot)
 {
 	return __pmd(pmd_val(pmd) | pgprot_val(pgprot));
 }
 
+static pud_t pud_set_protbits(pud_t pud, pgprot_t pgprot)
+{
+	return __pud(pud_val(pud) | pgprot_val(pgprot));
+}
+
 /*
  * At some point we should be able to get rid of
  * pmd_mkhuge() and mk_huge_pmd() when we update all the
@@ -166,6 +235,15 @@ pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
 	return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
 }
 
+pud_t pfn_pud(unsigned long pfn, pgprot_t pgprot)
+{
+	unsigned long pudv;
+
+	pudv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
+
+	return __pud_mkhuge(pud_set_protbits(__pud(pudv), pgprot));
+}
+
 pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
 {
 	return pfn_pmd(page_to_pfn(page), pgprot);
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 76f6a1f3b9d8..d7e2dd3d4add 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -965,6 +965,23 @@ unsigned long radix__pmd_hugepage_update(struct mm_struct *mm, unsigned long add
 	return old;
 }
 
+unsigned long radix__pud_hugepage_update(struct mm_struct *mm, unsigned long addr,
+					 pud_t *pudp, unsigned long clr,
+					 unsigned long set)
+{
+	unsigned long old;
+
+#ifdef CONFIG_DEBUG_VM
+	WARN_ON(!pud_devmap(*pudp));
+	assert_spin_locked(pud_lockptr(mm, pudp));
+#endif
+
+	old = radix__pte_update(mm, addr, pudp_ptep(pudp), clr, set, 1);
+	trace_hugepage_update(addr, old, clr, set);
+
+	return old;
+}
+
 pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long address,
 			pmd_t *pmdp)
 
@@ -1041,6 +1058,17 @@ pmd_t radix__pmdp_huge_get_and_clear(struct mm_struct *mm,
 	return old_pmd;
 }
 
+pud_t radix__pudp_huge_get_and_clear(struct mm_struct *mm,
+				     unsigned long addr, pud_t *pudp)
+{
+	pud_t old_pud;
+	unsigned long old;
+
+	old = radix__pud_hugepage_update(mm, addr, pudp, ~0UL, 0);
+	old_pud = __pud(old);
+	return old_pud;
+}
+
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
 
 void radix__ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
diff --git a/arch/powerpc/mm/book3s64/radix_tlb.c b/arch/powerpc/mm/book3s64/radix_tlb.c
index ce804b7bf84e..a18f7d2c9f63 100644
--- a/arch/powerpc/mm/book3s64/radix_tlb.c
+++ b/arch/powerpc/mm/book3s64/radix_tlb.c
@@ -1453,6 +1453,13 @@ void radix__flush_pmd_tlb_range(struct vm_area_struct *vma,
 }
 EXPORT_SYMBOL(radix__flush_pmd_tlb_range);
 
+void radix__flush_pud_tlb_range(struct vm_area_struct *vma,
+				unsigned long start, unsigned long end)
+{
+	radix__flush_tlb_range_psize(vma->vm_mm, start, end, MMU_PAGE_1G);
+}
+EXPORT_SYMBOL(radix__flush_pud_tlb_range);
+
 void radix__flush_tlb_all(void)
 {
 	unsigned long rb,prs,r,rs;
diff --git a/arch/powerpc/platforms/Kconfig.cputype b/arch/powerpc/platforms/Kconfig.cputype
index 45fd975ef521..340b86ef7284 100644
--- a/arch/powerpc/platforms/Kconfig.cputype
+++ b/arch/powerpc/platforms/Kconfig.cputype
@@ -94,6 +94,7 @@ config PPC_BOOK3S_64
 	select PPC_FPU
 	select PPC_HAVE_PMU_SUPPORT
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE
+	select HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
diff --git a/include/trace/events/thp.h b/include/trace/events/thp.h
index 202b3e3e67ff..a919d943d106 100644
--- a/include/trace/events/thp.h
+++ b/include/trace/events/thp.h
@@ -25,6 +25,23 @@ TRACE_EVENT(hugepage_set_pmd,
 	    TP_printk("Set pmd with 0x%lx with 0x%lx", __entry->addr, __entry->pmd)
 );
 
+TRACE_EVENT(hugepage_set_pud,
+
+	    TP_PROTO(unsigned long addr, unsigned long pud),
+	    TP_ARGS(addr, pud),
+	    TP_STRUCT__entry(
+		    __field(unsigned long, addr)
+		    __field(unsigned long, pud)
+			    ),
+
+	    TP_fast_assign(
+		    __entry->addr = addr;
+		    __entry->pud = pud;
+		    ),
+
+	    TP_printk("Set pud with 0x%lx with 0x%lx", __entry->addr, __entry->pud)
+	);
+
 
 TRACE_EVENT(hugepage_update,
 
-- 
2.40.1

