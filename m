Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 477B9697410
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 03:05:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGhH80tgcz3cgm
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 13:05:08 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ef+5i5FW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ef+5i5FW;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGhG942jJz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Feb 2023 13:04:17 +1100 (AEDT)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31F1BgVc006785;
	Wed, 15 Feb 2023 02:04:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=iFELsq+SKwb5Ml2NgIGS2eHOzFHwy8luz7gbXV4RgzM=;
 b=ef+5i5FWwEzcJvQoWi+hU6PpMTCDNhqp1yT7+bLm1AY1QIrjixZeDAVX6m+kJeZELDel
 ocd8kxiHa+VipH7SzEvsA0aVZBIMh0MNKHNmxEqPlhZ3+TEAda1RmrjzcepQ9Nk8iCNg
 FJekTcSHnWzzpDIlBbTfQ15JLWOqvbn1rMwFVQszCyqGSv0/BeQMqzL6jatnUeklpweq
 yF/b6XHDiENWRLD2zRVq1zQ5Jx+l5GM6qJrm3LVuQGpjXiIRn0/7/gBNQFSVKGJf/wg8
 Im/nmp7V9E43uvIJjluiGsAqyJn0bLRTI4VAmfuWSXP8i4/Wb2+IhJMikreuUYxDciu1 IQ== 
Received: from ppma06ams.nl.ibm.com (66.31.33a9.ip4.static.sl-reverse.com [169.51.49.102])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nrngv95b3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:09 +0000
Received: from pps.filterd (ppma06ams.nl.ibm.com [127.0.0.1])
	by ppma06ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31EJ0Lxj029878;
	Wed, 15 Feb 2023 02:04:07 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma06ams.nl.ibm.com (PPS) with ESMTPS id 3np29fmsn1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Feb 2023 02:04:07 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31F244k642336748
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 15 Feb 2023 02:04:05 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D335A20043;
	Wed, 15 Feb 2023 02:04:04 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id CA4B220040;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 15 Feb 2023 02:04:03 +0000 (GMT)
Received: from civic.. (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 9716160217;
	Wed, 15 Feb 2023 13:04:01 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v7 3/7] powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
Date: Wed, 15 Feb 2023 13:01:51 +1100
Message-Id: <20230215020155.1969194-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230215020155.1969194-1-rmclure@linux.ibm.com>
References: <20230215020155.1969194-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: rr0fUIIgf0C5zgbQsEUbQnELZu76nOhe
X-Proofpoint-GUID: rr0fUIIgf0C5zgbQsEUbQnELZu76nOhe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_17,2023-02-14_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 bulkscore=0 suspectscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2302150017
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

Replace occurrences of p{u,m,4}d_is_leaf with p{u,m,4}_leaf, as the
latter is the name given to checking that a higher-level entry in
multi-level paging contains a page translation entry (pte) throughout
all other archs.

A future patch will implement p{u,m,4}_leaf stubs on all platforms so
that they may be referenced in generic code.

Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
V4: New patch
V5: Previously replaced stub definition for *_is_leaf with *_leaf. Do
that in a later patch
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c   | 12 ++++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 14 +++++++-------
 arch/powerpc/mm/pgtable.c                |  6 +++---
 arch/powerpc/mm/pgtable_64.c             |  6 +++---
 arch/powerpc/xmon/xmon.c                 |  6 +++---
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 9d3743ca16d5..0d24fd984d16 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -497,7 +497,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 	for (im = 0; im < PTRS_PER_PMD; ++im, ++p) {
 		if (!pmd_present(*p))
 			continue;
-		if (pmd_is_leaf(*p)) {
+		if (pmd_leaf(*p)) {
 			if (full) {
 				pmd_clear(p);
 			} else {
@@ -526,7 +526,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	for (iu = 0; iu < PTRS_PER_PUD; ++iu, ++p) {
 		if (!pud_present(*p))
 			continue;
-		if (pud_is_leaf(*p)) {
+		if (pud_leaf(*p)) {
 			pud_clear(p);
 		} else {
 			pmd_t *pmd;
@@ -629,12 +629,12 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = pud_alloc_one(kvm->mm, gpa);
 
 	pmd = NULL;
-	if (pud && pud_present(*pud) && !pud_is_leaf(*pud))
+	if (pud && pud_present(*pud) && !pud_leaf(*pud))
 		pmd = pmd_offset(pud, gpa);
 	else if (level <= 1)
 		new_pmd = kvmppc_pmd_alloc();
 
-	if (level == 0 && !(pmd && pmd_present(*pmd) && !pmd_is_leaf(*pmd)))
+	if (level == 0 && !(pmd && pmd_present(*pmd) && !pmd_leaf(*pmd)))
 		new_ptep = kvmppc_pte_alloc();
 
 	/* Check if we might have been invalidated; let the guest retry if so */
@@ -652,7 +652,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = NULL;
 	}
 	pud = pud_offset(p4d, gpa);
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		unsigned long hgpa = gpa & PUD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
@@ -703,7 +703,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pmd = NULL;
 	}
 	pmd = pmd_offset(pud, gpa);
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		unsigned long lgpa = gpa & PMD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 26245aaf12b8..4e46e001c3c3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -205,14 +205,14 @@ static void radix__change_memory_range(unsigned long start, unsigned long end,
 		pudp = pud_alloc(&init_mm, p4dp, idx);
 		if (!pudp)
 			continue;
-		if (pud_is_leaf(*pudp)) {
+		if (pud_leaf(*pudp)) {
 			ptep = (pte_t *)pudp;
 			goto update_the_pte;
 		}
 		pmdp = pmd_alloc(&init_mm, pudp, idx);
 		if (!pmdp)
 			continue;
-		if (pmd_is_leaf(*pmdp)) {
+		if (pmd_leaf(*pmdp)) {
 			ptep = pmdp_ptep(pmdp);
 			goto update_the_pte;
 		}
@@ -786,7 +786,7 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 		if (!pmd_present(*pmd))
 			continue;
 
-		if (pmd_is_leaf(*pmd)) {
+		if (pmd_leaf(*pmd)) {
 			if (!IS_ALIGNED(addr, PMD_SIZE) ||
 			    !IS_ALIGNED(next, PMD_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -816,7 +816,7 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 		if (!pud_present(*pud))
 			continue;
 
-		if (pud_is_leaf(*pud)) {
+		if (pud_leaf(*pud)) {
 			if (!IS_ALIGNED(addr, PUD_SIZE) ||
 			    !IS_ALIGNED(next, PUD_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -849,7 +849,7 @@ static void __meminit remove_pagetable(unsigned long start, unsigned long end)
 		if (!p4d_present(*p4d))
 			continue;
 
-		if (p4d_is_leaf(*p4d)) {
+		if (p4d_leaf(*p4d)) {
 			if (!IS_ALIGNED(addr, P4D_SIZE) ||
 			    !IS_ALIGNED(next, P4D_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -1112,7 +1112,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
@@ -1159,7 +1159,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index d7cce317cef8..00ffbf197a13 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -386,7 +386,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		ret_pte = (pte_t *)p4dp;
 		goto out;
 	}
@@ -408,7 +408,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pud_none(pud))
 		return NULL;
 
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		ret_pte = (pte_t *)pudp;
 		goto out;
 	}
@@ -447,7 +447,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 		goto out;
 	}
 
-	if (pmd_is_leaf(pmd)) {
+	if (pmd_leaf(pmd)) {
 		ret_pte = (pte_t *)pmdp;
 		goto out;
 	}
diff --git a/arch/powerpc/mm/pgtable_64.c b/arch/powerpc/mm/pgtable_64.c
index 5ac1fd30341b..0604c80dae66 100644
--- a/arch/powerpc/mm/pgtable_64.c
+++ b/arch/powerpc/mm/pgtable_64.c
@@ -100,7 +100,7 @@ EXPORT_SYMBOL(__pte_frag_size_shift);
 /* 4 level page table */
 struct page *p4d_page(p4d_t p4d)
 {
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
 			VM_WARN_ON(!p4d_huge(p4d));
 		return pte_page(p4d_pte(p4d));
@@ -111,7 +111,7 @@ struct page *p4d_page(p4d_t p4d)
 
 struct page *pud_page(pud_t pud)
 {
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
 			VM_WARN_ON(!pud_huge(pud));
 		return pte_page(pud_pte(pud));
@@ -125,7 +125,7 @@ struct page *pud_page(pud_t pud)
  */
 struct page *pmd_page(pmd_t pmd)
 {
-	if (pmd_is_leaf(pmd)) {
+	if (pmd_leaf(pmd)) {
 		/*
 		 * vmalloc_to_page may be called on any vmap address (not only
 		 * vmalloc), and it uses pmd_page() etc., when huge vmap is
diff --git a/arch/powerpc/xmon/xmon.c b/arch/powerpc/xmon/xmon.c
index 73c620c2a3a1..07346b10f972 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3339,7 +3339,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (p4d_is_leaf(*p4dp)) {
+	if (p4d_leaf(*p4dp)) {
 		format_pte(p4dp, p4d_val(*p4dp));
 		return;
 	}
@@ -3353,7 +3353,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pud_is_leaf(*pudp)) {
+	if (pud_leaf(*pudp)) {
 		format_pte(pudp, pud_val(*pudp));
 		return;
 	}
@@ -3367,7 +3367,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pmd_is_leaf(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		format_pte(pmdp, pmd_val(*pmdp));
 		return;
 	}
-- 
2.37.2

