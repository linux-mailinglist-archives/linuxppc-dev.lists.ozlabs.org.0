Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A6188F6F2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 06:03:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOCPv27W;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4rz728zSz3vyQ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 16:03:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=sOCPv27W;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4rsJ27x6z3vfv
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 15:58:28 +1100 (AEDT)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42S4SM3i013956;
	Thu, 28 Mar 2024 04:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=xcL/IQIOv2OUkgf1WCRrE88EaCpc0gUXU0bMezHPnrw=;
 b=sOCPv27WjKaOnrb/zKhXw1nndgf0+yCsThhQlUG4ClDwe7jE8/TmGBkr+Ti/P6fPwvQc
 IYzOoqr+9VzKSPvqeFlt43rmPYptZrT5RkEcuqy0WU/Sunx2cQrU1j0+yV+OHGyzTINI
 awadIKRJemZ8z1I6y021+CR7mL1cIqRZkLm0rrQX1ZMuK7w7T18IdNH1WMy5gpavhzLB
 qP5PDg9MXZyx6uM+2PfVbq6Gk0P2H4bm7uf7HDVhmv+ee1v3H/ovSYcUP+EgE6RM2yw9
 p1KdRw/78QbhTL+Gn0SVkz9KPrT/cYy9rDkTz1xyqSoEprIMTGyHIjbLfyxGzAqHiS+l Wg== 
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3x51hj020c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 04:57:29 +0000
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42S3ktYS016605;
	Thu, 28 Mar 2024 04:57:28 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 3x29dubp74-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 04:57:28 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42S4vPD542271138
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 28 Mar 2024 04:57:27 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 26F572004E;
	Thu, 28 Mar 2024 04:57:25 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 474D420043;
	Thu, 28 Mar 2024 04:57:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 28 Mar 2024 04:57:24 +0000 (GMT)
Received: from socotra.ibm.com (unknown [9.66.88.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D67A760112;
	Thu, 28 Mar 2024 15:57:18 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v11 11/11] powerpc: mm: Support page table check
Date: Thu, 28 Mar 2024 15:55:31 +1100
Message-ID: <20240328045535.194800-14-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240328045535.194800-3-rmclure@linux.ibm.com>
References: <20240328045535.194800-3-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: ZoK1JV8bt85Eo4bOTNwkAuPLxaU6rIo-
X-Proofpoint-ORIG-GUID: ZoK1JV8bt85Eo4bOTNwkAuPLxaU6rIo-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_04,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 mlxlogscore=764 bulkscore=0 impostorscore=0 mlxscore=0 clxscore=1015
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2403210000 definitions=main-2403280028
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
Cc: x86@kernel.org, linux-mm@kvack.org, Rohan McLure <rmclure@linux.ibm.com>, linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On creation and clearing of a page table mapping, instrument such calls
by invoking page_table_check_pte_set and page_table_check_pte_clear
respectively. These calls serve as a sanity check against illegal
mappings.

Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all platforms.

See also:

riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
arm64 in commit 42b2547137f5 ("arm64/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
check")

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v9: Updated for new API. Instrument pmdp_collapse_flush's two
constituent calls to avoid header hell
v10: Cause p{u,m}dp_huge_get_and_clear() to resemble one another
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  7 ++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 45 +++++++++++++++-----
 arch/powerpc/mm/book3s64/hash_pgtable.c      |  4 ++
 arch/powerpc/mm/book3s64/pgtable.c           | 11 +++--
 arch/powerpc/mm/book3s64/radix_pgtable.c     |  3 ++
 arch/powerpc/mm/pgtable.c                    |  4 ++
 7 files changed, 61 insertions(+), 14 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index a68b9e637eda..66a72f9078f5 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -166,6 +166,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 83f7b98ef49f..703deb5749e6 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -201,6 +201,7 @@ void unmap_kernel_page(unsigned long va);
 #ifndef __ASSEMBLY__
 #include <linux/sched.h>
 #include <linux/threads.h>
+#include <linux/page_table_check.h>
 
 /* Bits to mask out from a PGD to get to the PUD page */
 #define PGD_MASKED_BITS		0
@@ -314,7 +315,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index d8640ddbcad1..6199d2b4bded 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -145,6 +145,8 @@
 #define PAGE_KERNEL_ROX	__pgprot(_PAGE_BASE | _PAGE_KERNEL_ROX)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
+
 /*
  * page table defines
  */
@@ -415,8 +417,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
 {
-	unsigned long old = pte_update(mm, addr, ptep, ~0UL, 0, 0);
-	return __pte(old);
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0UL, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_GET_AND_CLEAR_FULL
@@ -425,11 +430,16 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 					    pte_t *ptep, int full)
 {
 	if (full && radix_enabled()) {
+		pte_t old_pte;
+
 		/*
 		 * We know that this is a full mm pte clear and
 		 * hence can be sure there is no parallel set_pte.
 		 */
-		return radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		old_pte = radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		page_table_check_pte_clear(mm, addr, old_pte);
+
+		return old_pte;
 	}
 	return ptep_get_and_clear(mm, addr, ptep);
 }
@@ -1306,19 +1316,34 @@ extern int pudp_test_and_clear_young(struct vm_area_struct *vma,
 static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pmd_t *pmdp)
 {
-	if (radix_enabled())
-		return radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
-	return hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	pmd_t old_pmd;
+
+	if (radix_enabled()) {
+		old_pmd = radix__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	} else {
+		old_pmd = hash__pmdp_huge_get_and_clear(mm, addr, pmdp);
+	}
+
+	page_table_check_pmd_clear(mm, addr, old_pmd);
+
+	return old_pmd;
 }
 
 #define __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR
 static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 					    unsigned long addr, pud_t *pudp)
 {
-	if (radix_enabled())
-		return radix__pudp_huge_get_and_clear(mm, addr, pudp);
-	BUG();
-	return *pudp;
+	pud_t old_pud;
+
+	if (radix_enabled()) {
+		old_pud = radix__pudp_huge_get_and_clear(mm, addr, pudp);
+	} else {
+		BUG();
+	}
+
+	page_table_check_pud_clear(mm, addr, old_pud);
+
+	return old_pud;
 }
 
 static inline pmd_t pmdp_collapse_flush(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/hash_pgtable.c b/arch/powerpc/mm/book3s64/hash_pgtable.c
index 871472f99a01..f200d55c35d8 100644
--- a/arch/powerpc/mm/book3s64/hash_pgtable.c
+++ b/arch/powerpc/mm/book3s64/hash_pgtable.c
@@ -8,6 +8,7 @@
 #include <linux/sched.h>
 #include <linux/mm_types.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/stop_machine.h>
 
 #include <asm/sections.h>
@@ -231,6 +232,9 @@ pmd_t hash__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addres
 
 	pmd = *pmdp;
 	pmd_clear(pmdp);
+
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	/*
 	 * Wait for all pending hash_page to finish. This is needed
 	 * in case of subpage collapse. When we collapse normal pages
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index f7be5fa058e8..171e20e69441 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -10,6 +10,7 @@
 #include <linux/pkeys.h>
 #include <linux/debugfs.h>
 #include <linux/proc_fs.h>
+#include <linux/page_table_check.h>
 #include <misc/cxl-base.h>
 
 #include <asm/pgalloc.h>
@@ -116,6 +117,7 @@ void set_pmd_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pmd_leaf(pmd)));
 #endif
 	trace_hugepage_set_pmd(addr, pmd_val(pmd));
+	page_table_check_pmd_set(mm, addr, pmdp, pmd);
 	return set_pte_at_unchecked(mm, addr, pmdp_ptep(pmdp), pmd_pte(pmd));
 }
 
@@ -133,6 +135,7 @@ void set_pud_at(struct mm_struct *mm, unsigned long addr,
 	WARN_ON(!(pud_leaf(pud)));
 #endif
 	trace_hugepage_set_pud(addr, pud_val(pud));
+	page_table_check_pud_set(mm, addr, pudp, pud);
 	return set_pte_at_unchecked(mm, addr, pudp_ptep(pudp), pud_pte(pud));
 }
 
@@ -168,11 +171,13 @@ void serialize_against_pte_lookup(struct mm_struct *mm)
 pmd_t pmdp_invalidate(struct vm_area_struct *vma, unsigned long address,
 		     pmd_t *pmdp)
 {
-	unsigned long old_pmd;
+	pmd_t old_pmd;
 
-	old_pmd = pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID);
+	old_pmd = __pmd(pmd_hugepage_update(vma->vm_mm, address, pmdp, _PAGE_PRESENT, _PAGE_INVALID));
 	flush_pmd_tlb_range(vma, address, address + HPAGE_PMD_SIZE);
-	return __pmd(old_pmd);
+	page_table_check_pmd_clear(vma->vm_mm, address, old_pmd);
+
+	return old_pmd;
 }
 
 pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e8da30536bd5..5e777a462a96 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -14,6 +14,7 @@
 #include <linux/of.h>
 #include <linux/of_fdt.h>
 #include <linux/mm.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
@@ -1390,6 +1391,8 @@ pmd_t radix__pmdp_collapse_flush(struct vm_area_struct *vma, unsigned long addre
 	pmd = *pmdp;
 	pmd_clear(pmdp);
 
+	page_table_check_pmd_clear(vma->vm_mm, address, pmd);
+
 	radix__flush_tlb_collapsed_pmd(vma->vm_mm, address);
 
 	return pmd;
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index 1e3bd1861b71..1a5c18bd8508 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -22,6 +22,7 @@
 #include <linux/mm.h>
 #include <linux/percpu.h>
 #include <linux/hardirq.h>
+#include <linux/page_table_check.h>
 #include <linux/hugetlb.h>
 #include <asm/tlbflush.h>
 #include <asm/tlb.h>
@@ -206,6 +207,9 @@ void set_ptes(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 	 * and not hw_valid ptes. Hence there is no translation cache flush
 	 * involved that need to be batched.
 	 */
+
+	page_table_check_ptes_set(mm, addr, ptep, pte, nr);
+
 	for (;;) {
 
 		/*
-- 
2.44.0

