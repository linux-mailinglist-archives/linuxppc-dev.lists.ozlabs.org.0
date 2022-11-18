Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5F962EA35
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 01:26:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCyHw6Y6kz3dv8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Nov 2022 11:26:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cfjenM1Z;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=cfjenM1Z;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NCyCv50Dyz3bnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Nov 2022 11:22:35 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2AI0M2G4013646;
	Fri, 18 Nov 2022 00:22:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x+hewcgWvvf/+cnKVjpnzJP6s30F6+Yn7YLHv6+aq/o=;
 b=cfjenM1ZvK7E/8hIz1FO747mTlBHtcn6FRxC5pjRRg9nuICXVtBLOf+k7HLQsn6eSMBX
 bMoBCtsXd1q4MqYbdNZGsmYTK+BbUgP+QTGqxK29CQRz6cLh46Jy1PwDkfwli9RJcApz
 yIhV12O1bHcL1wTzIkyrqwaqxFCgbKVsuxe2k6q8uxfqbtqWmIOeYpbPkghUeeJPXwuG
 Q2xH705WVsELL9cwEEapsYc3RvRj9j8cu8Dn/ZR5RbNdAvpR64ITQd3yAVaYg0Sgs8v6
 EJMbJZnI4nMx+Q283h+87YVAbQ9//fN+dNDJU0bDYE/Qea+2U2hDItdU/Npmibmpnyb9 Pw== 
Received: from ppma02fra.de.ibm.com (47.49.7a9f.ip4.static.sl-reverse.com [159.122.73.71])
	by mx0b-001b2d01.pphosted.com (PPS) with ESMTPS id 3kwyes00ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:28 +0000
Received: from pps.filterd (ppma02fra.de.ibm.com [127.0.0.1])
	by ppma02fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 2AI0L6aE008870;
	Fri, 18 Nov 2022 00:22:27 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma02fra.de.ibm.com with ESMTP id 3kwppt0d36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Nov 2022 00:22:27 +0000
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com [9.149.105.62])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 2AI0GLml24051972
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Nov 2022 00:16:21 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BA6EEAE045;
	Fri, 18 Nov 2022 00:22:24 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1C742AE057;
	Fri, 18 Nov 2022 00:22:24 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 18 Nov 2022 00:22:24 +0000 (GMT)
Received: from civic.. (unknown [9.177.64.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 46A1B60129;
	Fri, 18 Nov 2022 11:22:19 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v5 5/5] powerpc: mm: support page table check
Date: Fri, 18 Nov 2022 00:21:46 +0000
Message-Id: <20221118002146.25979-5-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118002146.25979-1-rmclure@linux.ibm.com>
References: <20221118002146.25979-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: a4Iz0TnfMzqmWlgy-CdVVsFryTILqSDv
X-Proofpoint-GUID: a4Iz0TnfMzqmWlgy-CdVVsFryTILqSDv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-17_06,2022-11-17_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 mlxlogscore=598
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2210170000 definitions=main-2211170170
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

Reviewed-by: Russell Currey <ruscur@russell.cc>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
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
index b2fdd3cc81de..44703c8c590c 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -53,6 +53,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/page_table_check.h>
+
 static inline bool pte_user(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_USER;
@@ -337,7 +339,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
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
@@ -529,6 +535,7 @@ static inline bool pmd_user(pmd_t pmd)
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 #if defined(CONFIG_SMP) && !defined(CONFIG_PTE_64BIT)
 	/* First case is 32-bit Hash MMU in SMP mode with 32-bit PTEs. We use the
 	 * helper pte_update() which does an atomic update. We need to do that
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index e04e3cd378a6..436632d04304 100644
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
index 94b2a53f73d5..b3b8a843a1bd 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -166,6 +166,7 @@ void unmap_kernel_page(unsigned long va);
 #define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 
 #define pte_clear(mm, addr, ptep) \
 	do { pte_update(mm, addr, ptep, ~0, 0, 0); } while (0)
@@ -310,7 +311,11 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
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
index 69304159aafc..2488da8f0deb 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -83,6 +83,7 @@
 #define H_PAGE_4K_PFN 0
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 /* pte_clear moved to later in this file */
 
 static inline pte_t pte_mkwrite(pte_t pte)
@@ -258,8 +259,11 @@ static inline void huge_ptep_set_wrprotect(struct mm_struct *mm,
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
index 455ae13822ee..0454ed762d39 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -170,6 +170,7 @@ extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 	/* Second case is 32-bit with 64-bit PTE.  In this case, we
 	 * can just store as long as we do the two halves in the right order
 	 * with a barrier in between.
-- 
2.37.2

