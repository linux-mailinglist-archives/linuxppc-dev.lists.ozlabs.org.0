Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBCE61E71D
	for <lists+linuxppc-dev@lfdr.de>; Sun,  6 Nov 2022 23:53:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4N58m640x5z3chn
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Nov 2022 09:53:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bLsH3Sw+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=bLsH3Sw+;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4N58j74trNz30F7
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Nov 2022 09:50:51 +1100 (AEDT)
Received: from pps.filterd (m0098404.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A6Jv6Ds002322;
	Sun, 6 Nov 2022 22:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=D8/PrkcGSIqU2GFfyhybXOKCIqKCUoywIaLn9U1Oqm0=;
 b=bLsH3Sw+mQVwhXOi9nuAI4GhEeBQuUqkbU38vU2OdNNJ4P1IT1bKAiuNzMZ9yok1eRt+
 MF6Kzxyq9EtACHn4vdRpHIMIf6bIN770tFKs33xQkw99iTNBzi1+pwMEElhMniKJuX5+
 8zDZEuZGYeiN7hjfly87MZPkAnwwmiPpXTl7lsivBCq/PhMFx97hn2YvpFHdf7R6bCm/
 mUIRoq6syNiqhRXnl5pTSEY3CH1jJ+T+x0ZvIYmnXJf/2O9rj8eNawRR1AhQI+2iH2y0
 YDOS2NNUj1GZs052GVK5OBeSwQxfex0/j6ux2cBv5mc0w6AHTfZqOBfoIdzRvjgBrxRM FA== 
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com [169.51.49.98])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3kp15cxyjt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:50:44 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
	by ppma03ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2A6MaIFH006826;
	Sun, 6 Nov 2022 22:50:42 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
	by ppma03ams.nl.ibm.com with ESMTP id 3kngqg9rcx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 06 Nov 2022 22:50:42 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2A6Mod8552101382
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 6 Nov 2022 22:50:39 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6A9C0AE051;
	Sun,  6 Nov 2022 22:50:39 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BEEDDAE045;
	Sun,  6 Nov 2022 22:50:38 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Sun,  6 Nov 2022 22:50:38 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id D5FC96038E;
	Mon,  7 Nov 2022 09:50:34 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 4/4] powerpc: mm: support page table check
Date: Mon,  7 Nov 2022 09:49:58 +1100
Message-Id: <20221106224958.1320664-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221106224958.1320664-1-rmclure@linux.ibm.com>
References: <20221106224958.1320664-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: xnH7DDUzDAg_hSJhOY4LxsJwGxfpX1uq
X-Proofpoint-GUID: xnH7DDUzDAg_hSJhOY4LxsJwGxfpX1uq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-06_15,2022-11-03_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 mlxscore=0 suspectscore=0 bulkscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=653 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211060201
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
Cc: Rohan McLure <rmclure@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On creation and clearing of a page table mapping, instrument such calls
by invoking page_table_check_pte_set and page_table_check_pte_clear
respectively. These calls serve as a sanity check against illegal
mappings.

Enable ARCH_SUPPORTS_PAGE_TABLE_CHECK for all ppc64, and 32-bit
platforms implementing Book3S.

Change pud_pfn to be a runtime bug rather than a build bug as it is
consumed by page_table_check_pud_{clear,set} which are not called.

See also:

riscv support in commit 3fee229a8eb9 ("riscv/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
arm64 in commit 42b2547137f5 ("arm64/mm: enable
ARCH_SUPPORTS_PAGE_TABLE_CHECK")
x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
check")

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
Reviewed-by: Russell Currey <ruscur@russell.cc>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
V2: Update spacing and types assigned to pte_update calls.
V3: Update one last pte_update call to remove __pte invocation.
---
 arch/powerpc/Kconfig                         |  1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h |  9 ++++++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 18 +++++++++++++++---
 arch/powerpc/include/asm/nohash/32/pgtable.h |  7 ++++++-
 arch/powerpc/include/asm/nohash/64/pgtable.h |  8 ++++++--
 arch/powerpc/include/asm/nohash/pgtable.h    |  1 +
 6 files changed, 37 insertions(+), 7 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 699df27b0e2f..1d943a13a204 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -150,6 +150,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 06e89bc4418a..6614170b6c17 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -53,6 +53,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/page_table_check.h>
+
 static inline bool pte_user(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_USER;
@@ -333,7 +335,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
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
@@ -525,6 +531,7 @@ static inline bool pmd_user(pmd_t pmd)
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 #if defined(CONFIG_SMP) && !defined(CONFIG_PTE_64BIT)
 	/* First case is 32-bit Hash MMU in SMP mode with 32-bit PTEs. We use the
 	 * helper pte_update() which does an atomic update. We need to do that
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index acbb37e5f82f..f00aa2d203c2 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -162,6 +162,8 @@
 #define PAGE_KERNEL_ROX	__pgprot(_PAGE_BASE | _PAGE_KERNEL_ROX)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
+
 /*
  * page table defines
  */
@@ -465,8 +467,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
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
@@ -475,11 +480,16 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
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
@@ -865,6 +875,8 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	 */
 	pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
 
+	page_table_check_pte_set(mm, addr, ptep, pte);
+
 	if (radix_enabled())
 		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
 	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 1d3cf7fe60ec..2b23c5195d42 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -166,6 +166,7 @@ void unmap_kernel_page(unsigned long va);
 #define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 
 #define pte_clear(mm, addr, ptep) \
 	do { pte_update(mm, addr, ptep, ~0, 0, 0); } while (0)
@@ -311,7 +312,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
+	pte_t old_pte = __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
+
+	page_table_check_pte_clear(mm, addr, old_pte);
+
+	return old_pte;
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 2f6b5124e64c..2da5d5a36192 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -83,6 +83,7 @@
 #define H_PAGE_4K_PFN 0
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 /* pte_clear moved to later in this file */
 
 static inline pte_t pte_mkwrite(pte_t pte)
@@ -253,8 +254,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
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
 
 static inline void pte_clear(struct mm_struct *mm, unsigned long addr,
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index d9067dfc531c..57371b52d9cd 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -165,6 +165,7 @@ extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 	/* Second case is 32-bit with 64-bit PTE.  In this case, we
 	 * can just store as long as we do the two halves in the right order
 	 * with a barrier in between.
-- 
2.34.1

