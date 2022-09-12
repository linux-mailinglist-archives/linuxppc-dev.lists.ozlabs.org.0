Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9869A5B5299
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 03:49:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MQqKD3rXhz3cdV
	for <lists+linuxppc-dev@lfdr.de>; Mon, 12 Sep 2022 11:49:36 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okilQMrY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=okilQMrY;
	dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MQqH55zs3z2yKD
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 12 Sep 2022 11:47:45 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 28C1bKwp004399;
	Mon, 12 Sep 2022 01:47:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=yltZLnzt6lswBzuRu3IKjWzuBtZYygU5N7MZX73/FjM=;
 b=okilQMrYPZRqnK+VahnTo+4Ckst/P+/NFiWQoKnxCAXiZRv0xFWjIKL2ecT0mGjVX4zs
 IdrXvyFGpIrPUlB4MyaKsnRgLDzX6uD/tYSEmUujTN2RgZGw11AlFHZYWvcgA/t4bzh2
 +3r+5KM3dx2G2+4/25yC2loA5kA0820nl2zpdrNyF/XBkIWqFh5BsxcKWt17aKpE742c
 +vJmDhJQNTgPliU1asORo2NigNiwoRAYvvf9/J56g0qZ+Lc4GJUg9g6L2lg8j4wi8xZm
 Evt0/TAcyEJK+GUPukz2jtnStUomUfb9B18ix90r0U2BdSDr6JYRDbKbC/WpCnREDq8E mg== 
Received: from ppma01fra.de.ibm.com (46.49.7a9f.ip4.static.sl-reverse.com [159.122.73.70])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3jh7cwcewr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 01:47:39 +0000
Received: from pps.filterd (ppma01fra.de.ibm.com [127.0.0.1])
	by ppma01fra.de.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 28C1bs9Y025026;
	Mon, 12 Sep 2022 01:47:38 GMT
Received: from b06avi18626390.portsmouth.uk.ibm.com (b06avi18626390.portsmouth.uk.ibm.com [9.149.26.192])
	by ppma01fra.de.ibm.com with ESMTP id 3jgj78s7ue-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 Sep 2022 01:47:37 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com [9.149.105.59])
	by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 28C1hsON19464456
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 Sep 2022 01:43:54 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2D613A404D;
	Mon, 12 Sep 2022 01:47:35 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8450CA4040;
	Mon, 12 Sep 2022 01:47:34 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Mon, 12 Sep 2022 01:47:34 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 5ACAA60129;
	Mon, 12 Sep 2022 11:47:33 +1000 (AEST)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 3/3] powerpc: mm: support page table check
Date: Mon, 12 Sep 2022 11:47:03 +1000
Message-Id: <20220912014703.185471-3-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220912014703.185471-1-rmclure@linux.ibm.com>
References: <20220912014703.185471-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Hut-ndRizbNx3VMP5KS-M_wQm6b_DCv9
X-Proofpoint-ORIG-GUID: Hut-ndRizbNx3VMP5KS-M_wQm6b_DCv9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.528,FMLib:17.11.122.1
 definitions=2022-09-11_14,2022-09-09_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 phishscore=0 mlxlogscore=703 bulkscore=0 impostorscore=0 malwarescore=0
 adultscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2207270000
 definitions=main-2209120004
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

riscv support in commit 3fee229a8eb9 ("riscv/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
arm64 in commit 42b2547137f5 ("arm64/mm: enable ARCH_SUPPORTS_PAGE_TABLE_CHECK")
x86_64 in commit d283d422c6c4 ("x86: mm: add x86_64 support for page table
    check")

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/powerpc/Kconfig                         | 1 +
 arch/powerpc/include/asm/book3s/32/pgtable.h | 7 ++++++-
 arch/powerpc/include/asm/book3s/64/pgtable.h | 9 ++++++++-
 arch/powerpc/include/asm/nohash/32/pgtable.h | 5 ++++-
 arch/powerpc/include/asm/nohash/64/pgtable.h | 2 ++
 arch/powerpc/include/asm/nohash/pgtable.h    | 1 +
 arch/powerpc/include/asm/pgtable.h           | 4 ++++
 7 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 4c466acdc70d..6c213ac46a92 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -149,6 +149,7 @@ config PPC
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC	if PPC_BOOK3S || PPC_8xx || 40x
+	select ARCH_SUPPORTS_PAGE_TABLE_CHECK
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_CMPXCHG_LOCKREF		if PPC64
 	select ARCH_USE_MEMTEST
diff --git a/arch/powerpc/include/asm/book3s/32/pgtable.h b/arch/powerpc/include/asm/book3s/32/pgtable.h
index 40041ac713d9..3d05c8fe4604 100644
--- a/arch/powerpc/include/asm/book3s/32/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/32/pgtable.h
@@ -53,6 +53,8 @@
 
 #ifndef __ASSEMBLY__
 
+#include <linux/page_table_check.h>
+
 static inline bool pte_user(pte_t pte)
 {
 	return pte_val(pte) & _PAGE_USER;
@@ -353,7 +355,9 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0));
+	unsigned long old = pte_update(mm, addr, ptep, ~_PAGE_HASHPTE, 0, 0);
+	page_table_check_pte_clear(mm, addr, __pte(old));
+	return __pte(old);
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
@@ -541,6 +545,7 @@ static inline pte_t pte_modify(pte_t pte, pgprot_t newprot)
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 #if defined(CONFIG_SMP) && !defined(CONFIG_PTE_64BIT)
 	/* First case is 32-bit Hash MMU in SMP mode with 32-bit PTEs. We use the
 	 * helper pte_update() which does an atomic update. We need to do that
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index 8874f2a3661d..cbb7bd99c897 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -179,6 +179,8 @@
 #define PAGE_AGP		(PAGE_KERNEL_NC)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
+
 /*
  * page table defines
  */
@@ -483,6 +485,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
 {
 	unsigned long old = pte_update(mm, addr, ptep, ~0UL, 0, 0);
+	page_table_check_pte_clear(mm, addr, __pte(old));
 	return __pte(old);
 }
 
@@ -491,12 +494,15 @@ static inline pte_t ptep_get_and_clear_full(struct mm_struct *mm,
 					    unsigned long addr,
 					    pte_t *ptep, int full)
 {
+	pte_t old_pte;
 	if (full && radix_enabled()) {
 		/*
 		 * We know that this is a full mm pte clear and
 		 * hence can be sure there is no parallel set_pte.
 		 */
-		return radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		old_pte = radix__ptep_get_and_clear_full(mm, addr, ptep, full);
+		page_table_check_pte_clear(mm, addr, old_pte);
+		return old_pte;
 	}
 	return ptep_get_and_clear(mm, addr, ptep);
 }
@@ -872,6 +878,7 @@ static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 	 */
 	pte = __pte_raw(pte_raw(pte) | cpu_to_be64(_PAGE_PTE));
 
+	page_table_check_pte_set(mm, addr, ptep, pte);
 	if (radix_enabled())
 		return radix__set_pte_at(mm, addr, ptep, pte, percpu);
 	return hash__set_pte_at(mm, addr, ptep, pte, percpu);
diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
index 9091e4904a6b..a3416cfb75d7 100644
--- a/arch/powerpc/include/asm/nohash/32/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
@@ -166,6 +166,7 @@ void unmap_kernel_page(unsigned long va);
 #define _PAGE_CHG_MASK	(PTE_RPN_MASK | _PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_SPECIAL)
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 
 #define pte_clear(mm, addr, ptep) \
 	do { pte_update(mm, addr, ptep, ~0, 0, 0); } while (0)
@@ -305,7 +306,9 @@ static inline int __ptep_test_and_clear_young(struct mm_struct *mm,
 static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
 				       pte_t *ptep)
 {
-	return __pte(pte_update(mm, addr, ptep, ~0, 0, 0));
+	unsigned long old = pte_update(mm, addr, ptep, ~0, 0, 0);
+	page_table_check_pte_clear(mm, addr, __pte(old));
+	return __pte(old);
 }
 
 #define __HAVE_ARCH_PTEP_SET_WRPROTECT
diff --git a/arch/powerpc/include/asm/nohash/64/pgtable.h b/arch/powerpc/include/asm/nohash/64/pgtable.h
index 599921cc257e..5f2e10842a0d 100644
--- a/arch/powerpc/include/asm/nohash/64/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/64/pgtable.h
@@ -83,6 +83,7 @@
 #define H_PAGE_4K_PFN 0
 
 #ifndef __ASSEMBLY__
+#include <linux/page_table_check.h>
 /* pte_clear moved to later in this file */
 
 static inline pte_t pte_mkwrite(pte_t pte)
@@ -244,6 +245,7 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
 				       unsigned long addr, pte_t *ptep)
 {
 	unsigned long old = pte_update(mm, addr, ptep, ~0UL, 0, 0);
+	page_table_check_pte_clear(mm, addr, __pte(old));
 	return __pte(old);
 }
 
diff --git a/arch/powerpc/include/asm/nohash/pgtable.h b/arch/powerpc/include/asm/nohash/pgtable.h
index b499da6c1a99..62b221b7cccf 100644
--- a/arch/powerpc/include/asm/nohash/pgtable.h
+++ b/arch/powerpc/include/asm/nohash/pgtable.h
@@ -185,6 +185,7 @@ extern void set_pte_at(struct mm_struct *mm, unsigned long addr, pte_t *ptep,
 static inline void __set_pte_at(struct mm_struct *mm, unsigned long addr,
 				pte_t *ptep, pte_t pte, int percpu)
 {
+	page_table_check_pte_set(mm, addr, ptep, pte);
 	/* Second case is 32-bit with 64-bit PTE.  In this case, we
 	 * can just store as long as we do the two halves in the right order
 	 * with a barrier in between.
diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
index 8c1f5feb9360..5e1032d12499 100644
--- a/arch/powerpc/include/asm/pgtable.h
+++ b/arch/powerpc/include/asm/pgtable.h
@@ -166,7 +166,11 @@ static inline int pud_pfn(pud_t pud)
 	 * check so this should never be used. If it grows another user we
 	 * want to know about it.
 	 */
+#ifndef CONFIG_PAGE_TABLE_CHECK
 	BUILD_BUG();
+#else
+	BUG();
+#endif
 	return 0;
 }
 
-- 
2.34.1

