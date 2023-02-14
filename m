Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF06C69564F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 03:04:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PG4JJ45Ynz3cJY
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Feb 2023 13:04:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ktigdbci;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ktigdbci;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PG4DM5Qv8z3bgd
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Feb 2023 13:00:35 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 31E1J6Ii015496;
	Tue, 14 Feb 2023 02:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=0Et8pz2U6vD2uqGeOFaxwC0XpYbRLO9f3b7K1vy9eMc=;
 b=ktigdbciFrsZOnBDXIwkXG19NvVQMcPh5w8IR+EHJGHay6ImIG1p9irDU51ZAoGr7QjW
 z2w6Tcg4IXZ+8nDXRIBFhjA29zmjRDZvq/VaAmbODLsl93mna/0dU1IL0DZdHT5pgUfo
 fUAYE9hr3Vk63KxTk6VzTd545wQybTL8oaAM/GLJwtPDjAaUhZja++GaZXtoQNTFPheG
 OMRaKgHRtWV74oxgwp1iiE2oviexutpMOkV9+doFq24X8xrpjt9OxnOq48js8cuhIVp8
 5AgPbprYhSKInQhEDUf41EeZxRMtN3Ihbfu3ZAXwXyuaFTIAMy6+9P2hIuOELff/36mQ 8w== 
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com [169.51.49.99])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3nr0hhrus1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:28 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
	by ppma04ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 31DC3Jxg010698;
	Tue, 14 Feb 2023 02:00:26 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma04ams.nl.ibm.com (PPS) with ESMTPS id 3np2n6uc2b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Feb 2023 02:00:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 31E20NMW43712814
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Feb 2023 02:00:23 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 454062006A;
	Tue, 14 Feb 2023 02:00:23 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 415F32004D;
	Tue, 14 Feb 2023 02:00:22 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 14 Feb 2023 02:00:22 +0000 (GMT)
Received: from civic.. (unknown [9.177.28.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 6A8D7600D2;
	Tue, 14 Feb 2023 13:00:18 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v6 3/7] powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
Date: Tue, 14 Feb 2023 12:59:35 +1100
Message-Id: <20230214015939.1853438-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230214015939.1853438-1-rmclure@linux.ibm.com>
References: <20230214015939.1853438-1-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: UDUGlztY97AYVqpIIs8IDqZyuCP9yUnJ
X-Proofpoint-GUID: UDUGlztY97AYVqpIIs8IDqZyuCP9yUnJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.170.22
 definitions=2023-02-14_01,2023-02-13_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2212070000 definitions=main-2302140009
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
index e9a464e0d081..3de0a8184f87 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -387,7 +387,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		ret_pte = (pte_t *)p4dp;
 		goto out;
 	}
@@ -409,7 +409,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pud_none(pud))
 		return NULL;
 
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		ret_pte = (pte_t *)pudp;
 		goto out;
 	}
@@ -448,7 +448,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
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

