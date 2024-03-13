Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B41787A252
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 05:31:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B4kPAuRc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tvcyl3B0dz3vrj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Mar 2024 15:31:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=B4kPAuRc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TvcsM50zLz3fQH
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Mar 2024 15:26:31 +1100 (AEDT)
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 42D4QD0v014552;
	Wed, 13 Mar 2024 04:26:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=4ucWYR3/dYhDERz9KF3bg4YIgVSdFedN3fFsg+Q6VOc=;
 b=B4kPAuRcZZzwnUHY3vvFaz3riZ+/K0RbZuq8C6iFr2lQpREOwyfTPEhlUJf/2dxM1At9
 7ArqAgD2RL28Gj2sQW4mFtjnuaEysSIbXuF6+f/ky/EvbTbiWPm1MwUC29LEO3qwxFhI
 uQFBOnb1pEO1B+Q+vVkLm1h9sm7sGrBbSNv1ZBTFdE/AjeaewSrVi4UyhFsd/wYh45gC
 kvoyBfvIFSmsaALtPxZ5PKRRlsm9n3vSeNw3XUO4lS9/RLNNdr5yI/tPJXW6oVzXGDXe
 dGZEmVveUzYzXYqCi5X5woFpCEeEUkEa3r+rxIAjz7LyvxSIegwB+qrwrGhqOLR64JkO gQ== 
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3wu3vrrpq9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:26:15 +0000
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 42D1OJUI013484;
	Wed, 13 Mar 2024 04:21:35 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 3ws4akb5aa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Mar 2024 04:21:35 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 42D4LW1M28443316
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Mar 2024 04:21:34 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E48E2004D;
	Wed, 13 Mar 2024 04:21:32 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 292FF20049;
	Wed, 13 Mar 2024 04:21:31 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 13 Mar 2024 04:21:31 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 197AB603C2;
	Wed, 13 Mar 2024 15:21:26 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v10 07/12] mm: Provide address parameter to p{te,md,ud}_user_accessible_page()
Date: Wed, 13 Mar 2024 15:21:12 +1100
Message-ID: <20240313042118.230397-8-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240313042118.230397-1-rmclure@linux.ibm.com>
References: <20240313042118.230397-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: BD_cpW47-R6ywWA9qpijkWMcV33pxlfP
X-Proofpoint-ORIG-GUID: BD_cpW47-R6ywWA9qpijkWMcV33pxlfP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-13_04,2024-03-12_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=997
 lowpriorityscore=0 phishscore=0 impostorscore=0 priorityscore=1501
 suspectscore=0 malwarescore=0 mlxscore=0 bulkscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2403130031
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

On several powerpc platforms, a page table entry may not imply whether
the relevant mapping is for userspace or kernelspace. Instead, such
platforms infer this by the address which is being accessed.

Add an additional address argument to each of these routines in order to
provide support for page table check on powerpc.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
 arch/arm64/include/asm/pgtable.h |  6 +++---
 arch/riscv/include/asm/pgtable.h |  6 +++---
 arch/x86/include/asm/pgtable.h   |  6 +++---
 mm/page_table_check.c            | 12 ++++++------
 4 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 74bb81744df2..8ea22deff9a3 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -874,17 +874,17 @@ static inline int pgd_devmap(pgd_t pgd)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && (pte_user(pte) || pte_user_exec(pte));
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && !pmd_present_invalid(pmd) && (pmd_user(pmd) || pmd_user_exec(pmd));
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_user(pud) || pud_user_exec(pud));
 }
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 2fa6625f591a..f5c937007590 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -722,17 +722,17 @@ static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
 }
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return pte_present(pte) && pte_user(pte);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && pmd_user(pmd);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && pud_user(pud);
 }
diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
index e8fd625de280..514374a27124 100644
--- a/arch/x86/include/asm/pgtable.h
+++ b/arch/x86/include/asm/pgtable.h
@@ -1695,17 +1695,17 @@ static inline bool arch_has_hw_nonleaf_pmd_young(void)
 #endif
 
 #ifdef CONFIG_PAGE_TABLE_CHECK
-static inline bool pte_user_accessible_page(pte_t pte)
+static inline bool pte_user_accessible_page(pte_t pte, unsigned long addr)
 {
 	return (pte_val(pte) & _PAGE_PRESENT) && (pte_val(pte) & _PAGE_USER);
 }
 
-static inline bool pmd_user_accessible_page(pmd_t pmd)
+static inline bool pmd_user_accessible_page(pmd_t pmd, unsigned long addr)
 {
 	return pmd_leaf(pmd) && (pmd_val(pmd) & _PAGE_PRESENT) && (pmd_val(pmd) & _PAGE_USER);
 }
 
-static inline bool pud_user_accessible_page(pud_t pud)
+static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
 {
 	return pud_leaf(pud) && (pud_val(pud) & _PAGE_PRESENT) && (pud_val(pud) & _PAGE_USER);
 }
diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 98cccee74b02..aa5e16c8328e 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -155,7 +155,7 @@ void __page_table_check_pte_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pte_user_accessible_page(pte)) {
+	if (pte_user_accessible_page(pte, addr)) {
 		page_table_check_clear(pte_pfn(pte), PAGE_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -167,7 +167,7 @@ void __page_table_check_pmd_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_clear(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -179,7 +179,7 @@ void __page_table_check_pud_clear(struct mm_struct *mm, unsigned long addr,
 	if (&init_mm == mm)
 		return;
 
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_clear(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT);
 	}
 }
@@ -195,7 +195,7 @@ void __page_table_check_ptes_set(struct mm_struct *mm, unsigned long addr,
 
 	for (i = 0; i < nr; i++)
 		__page_table_check_pte_clear(mm, addr, ptep_get(ptep + i));
-	if (pte_user_accessible_page(pte))
+	if (pte_user_accessible_page(pte, addr))
 		page_table_check_set(pte_pfn(pte), nr, pte_write(pte));
 }
 EXPORT_SYMBOL(__page_table_check_ptes_set);
@@ -207,7 +207,7 @@ void __page_table_check_pmd_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	__page_table_check_pmd_clear(mm, addr, *pmdp);
-	if (pmd_user_accessible_page(pmd)) {
+	if (pmd_user_accessible_page(pmd, addr)) {
 		page_table_check_set(pmd_pfn(pmd), PMD_SIZE >> PAGE_SHIFT,
 				     pmd_write(pmd));
 	}
@@ -221,7 +221,7 @@ void __page_table_check_pud_set(struct mm_struct *mm, unsigned long addr,
 		return;
 
 	__page_table_check_pud_clear(mm, addr, *pudp);
-	if (pud_user_accessible_page(pud)) {
+	if (pud_user_accessible_page(pud, addr)) {
 		page_table_check_set(pud_pfn(pud), PUD_SIZE >> PAGE_SHIFT,
 				     pud_write(pud));
 	}
-- 
2.44.0

