Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB077FE778
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 03:59:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k06R8v5K;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Sggrn6cFZz3vk0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Nov 2023 13:59:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=k06R8v5K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=rmclure@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SggmK1mMYz3cQ7
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Nov 2023 13:55:28 +1100 (AEDT)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU2javl031927;
	Thu, 30 Nov 2023 02:55:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=eriIvFmbwL0mPvrE/W1UXLBsN9IDuVy4v7MMBZ3llwA=;
 b=k06R8v5KWiP1WmZdM1NWT+tMZOFyK3/D54bhvlkV/LV1Qc96rCriGFbD6hYI2qor0y/q
 SXdo7FZvGMLZ7d8/Zez/Q9CviJGwlHnud1N61VpVGo8tQ0BkQSLV55XaJ0cpT9uLugcL
 vp1eYnXdv2dqF/3NcbAvlBe/Aecv0l21mArsTcrzVG9cFJOrf2+dyXJ2AhB9bO3thLBO
 7tAuARDjTQynXJvjKFGOCSap6HCyRgCVVLxDpRnb+C9+8Z7mWsYjRvMZk8Mj19u8yylo
 wln+xui1phGRC3ANnh2euhod6+MYQsxmsHgcuKAa4YRP9XXdScDXhGVh4dHAK/xU4VEs SQ== 
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3uphg40waf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:18 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3AU0XxPR014111;
	Thu, 30 Nov 2023 02:55:17 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3ukv8nuhht-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Nov 2023 02:55:17 +0000
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3AU2tFb241550140
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Nov 2023 02:55:16 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D48D920043;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0ABC620040;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from ozlabs.au.ibm.com (unknown [9.192.253.14])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 30 Nov 2023 02:55:15 +0000 (GMT)
Received: from socotra.ozlabs.ibm.com (haven.au.ibm.com [9.192.254.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ozlabs.au.ibm.com (Postfix) with ESMTPSA id 98C5A6030C;
	Thu, 30 Nov 2023 13:55:13 +1100 (AEDT)
From: Rohan McLure <rmclure@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v9 1/7] powerpc: mm: Replace p{u,m,4}d_is_leaf with p{u,m,4}_leaf
Date: Thu, 30 Nov 2023 13:53:54 +1100
Message-ID: <20231130025404.37179-4-rmclure@linux.ibm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20231130025404.37179-2-rmclure@linux.ibm.com>
References: <20231130025404.37179-2-rmclure@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 67x1UBv3Gi6fb2UeYVLZFXbQhsF0XduO
X-Proofpoint-ORIG-GUID: 67x1UBv3Gi6fb2UeYVLZFXbQhsF0XduO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_21,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=921 mlxscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0
 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311300020
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

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Rohan McLure <rmclure@linux.ibm.com>
---
v9: No longer required in order to implement page table check, just a
refactor.
---
 arch/powerpc/kvm/book3s_64_mmu_radix.c   | 12 ++++++------
 arch/powerpc/mm/book3s64/radix_pgtable.c | 14 +++++++-------
 arch/powerpc/mm/pgtable.c                |  6 +++---
 arch/powerpc/mm/pgtable_64.c             |  6 +++---
 arch/powerpc/xmon/xmon.c                 |  6 +++---
 5 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/kvm/book3s_64_mmu_radix.c b/arch/powerpc/kvm/book3s_64_mmu_radix.c
index 175a8eb2681f..fdb178fe754c 100644
--- a/arch/powerpc/kvm/book3s_64_mmu_radix.c
+++ b/arch/powerpc/kvm/book3s_64_mmu_radix.c
@@ -498,7 +498,7 @@ static void kvmppc_unmap_free_pmd(struct kvm *kvm, pmd_t *pmd, bool full,
 	for (im = 0; im < PTRS_PER_PMD; ++im, ++p) {
 		if (!pmd_present(*p))
 			continue;
-		if (pmd_is_leaf(*p)) {
+		if (pmd_leaf(*p)) {
 			if (full) {
 				pmd_clear(p);
 			} else {
@@ -527,7 +527,7 @@ static void kvmppc_unmap_free_pud(struct kvm *kvm, pud_t *pud,
 	for (iu = 0; iu < PTRS_PER_PUD; ++iu, ++p) {
 		if (!pud_present(*p))
 			continue;
-		if (pud_is_leaf(*p)) {
+		if (pud_leaf(*p)) {
 			pud_clear(p);
 		} else {
 			pmd_t *pmd;
@@ -630,12 +630,12 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
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
@@ -653,7 +653,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pud = NULL;
 	}
 	pud = pud_offset(p4d, gpa);
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		unsigned long hgpa = gpa & PUD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
@@ -704,7 +704,7 @@ int kvmppc_create_pte(struct kvm *kvm, pgd_t *pgtable, pte_t pte,
 		new_pmd = NULL;
 	}
 	pmd = pmd_offset(pud, gpa);
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		unsigned long lgpa = gpa & PMD_MASK;
 
 		/* Check if we raced and someone else has set the same thing */
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index c6a4ac766b2b..1f8db10693e3 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -204,14 +204,14 @@ static void radix__change_memory_range(unsigned long start, unsigned long end,
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
@@ -767,7 +767,7 @@ static void __meminit remove_pmd_table(pmd_t *pmd_start, unsigned long addr,
 		if (!pmd_present(*pmd))
 			continue;
 
-		if (pmd_is_leaf(*pmd)) {
+		if (pmd_leaf(*pmd)) {
 			if (IS_ALIGNED(addr, PMD_SIZE) &&
 			    IS_ALIGNED(next, PMD_SIZE)) {
 				if (!direct)
@@ -807,7 +807,7 @@ static void __meminit remove_pud_table(pud_t *pud_start, unsigned long addr,
 		if (!pud_present(*pud))
 			continue;
 
-		if (pud_is_leaf(*pud)) {
+		if (pud_leaf(*pud)) {
 			if (!IS_ALIGNED(addr, PUD_SIZE) ||
 			    !IS_ALIGNED(next, PUD_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -845,7 +845,7 @@ remove_pagetable(unsigned long start, unsigned long end, bool direct,
 		if (!p4d_present(*p4d))
 			continue;
 
-		if (p4d_is_leaf(*p4d)) {
+		if (p4d_leaf(*p4d)) {
 			if (!IS_ALIGNED(addr, P4D_SIZE) ||
 			    !IS_ALIGNED(next, P4D_SIZE)) {
 				WARN_ONCE(1, "%s: unaligned range\n", __func__);
@@ -1554,7 +1554,7 @@ int pud_set_huge(pud_t *pud, phys_addr_t addr, pgprot_t prot)
 
 int pud_clear_huge(pud_t *pud)
 {
-	if (pud_is_leaf(*pud)) {
+	if (pud_leaf(*pud)) {
 		pud_clear(pud);
 		return 1;
 	}
@@ -1601,7 +1601,7 @@ int pmd_set_huge(pmd_t *pmd, phys_addr_t addr, pgprot_t prot)
 
 int pmd_clear_huge(pmd_t *pmd)
 {
-	if (pmd_is_leaf(*pmd)) {
+	if (pmd_leaf(*pmd)) {
 		pmd_clear(pmd);
 		return 1;
 	}
diff --git a/arch/powerpc/mm/pgtable.c b/arch/powerpc/mm/pgtable.c
index a04ae4449a02..e8e0289d7ab0 100644
--- a/arch/powerpc/mm/pgtable.c
+++ b/arch/powerpc/mm/pgtable.c
@@ -413,7 +413,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (p4d_none(p4d))
 		return NULL;
 
-	if (p4d_is_leaf(p4d)) {
+	if (p4d_leaf(p4d)) {
 		ret_pte = (pte_t *)p4dp;
 		goto out;
 	}
@@ -435,7 +435,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
 	if (pud_none(pud))
 		return NULL;
 
-	if (pud_is_leaf(pud)) {
+	if (pud_leaf(pud)) {
 		ret_pte = (pte_t *)pudp;
 		goto out;
 	}
@@ -474,7 +474,7 @@ pte_t *__find_linux_pte(pgd_t *pgdir, unsigned long ea,
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
index b3b94cd37713..9669c9925225 100644
--- a/arch/powerpc/xmon/xmon.c
+++ b/arch/powerpc/xmon/xmon.c
@@ -3342,7 +3342,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (p4d_is_leaf(*p4dp)) {
+	if (p4d_leaf(*p4dp)) {
 		format_pte(p4dp, p4d_val(*p4dp));
 		return;
 	}
@@ -3356,7 +3356,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pud_is_leaf(*pudp)) {
+	if (pud_leaf(*pudp)) {
 		format_pte(pudp, pud_val(*pudp));
 		return;
 	}
@@ -3370,7 +3370,7 @@ static void show_pte(unsigned long addr)
 		return;
 	}
 
-	if (pmd_is_leaf(*pmdp)) {
+	if (pmd_leaf(*pmdp)) {
 		format_pte(pmdp, pmd_val(*pmdp));
 		return;
 	}
-- 
2.43.0

