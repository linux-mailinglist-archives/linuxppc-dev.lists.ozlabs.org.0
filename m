Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C607571C7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 04:32:50 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IqK5FyRQ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R4jfS3ZV9z3cY0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 Jul 2023 12:32:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=IqK5FyRQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5; helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R4jbf1MKGz2yFD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 Jul 2023 12:30:21 +1000 (AEST)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36I2ESuW015890;
	Tue, 18 Jul 2023 02:29:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=QxjcXRv1fQMvFNVdZ9MFoGPD7S1Rb0nLc3CTIZnRZsg=;
 b=IqK5FyRQv0d9ho4sRNZHxqMvnPSZWN8rgbdnK0RbGYhfwas1IJwhiOm1+90u/fHDoyfh
 qF01sEIGtKQtsiKblmXhy52EiYk/kzyS/6bSmcSjq2NKQzW2e1Zt/af+pi5J6pQBt+ym
 lkTf898XQYOdLgtSOZVYACgkwjrimYrc6M43tYaU6Rq54SzLDKb7HBl9RDKx/UsTB7J8
 Rxs6eICSZ0hrCqbXy+705kIztwEpkdUGKUMcPlwEEokl/JXnv9JXHGYaTO9XkztXFry+
 wC3KAYlNt7kcbia9fpXAxOdVj5lAZ7sPaahGuVy+JPnKkNbON3q90L3zhyDciUpr3NYP vw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhs8099c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:57 +0000
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 36I2Tenf027234;
	Tue, 18 Jul 2023 02:29:57 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3rwhs8098w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:57 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 36I0Ne8a004149;
	Tue, 18 Jul 2023 02:29:56 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3rv8g0vhx5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Jul 2023 02:29:56 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com [10.241.53.100])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 36I2TtXb1049096
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Jul 2023 02:29:55 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6AA4B5805D;
	Tue, 18 Jul 2023 02:29:55 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6469958059;
	Tue, 18 Jul 2023 02:29:50 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.62.199])
	by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 18 Jul 2023 02:29:50 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v5 02/13] mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
Date: Tue, 18 Jul 2023 07:59:22 +0530
Message-ID: <20230718022934.90447-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
References: <20230718022934.90447-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 5ifii3AwpzuaO1aERGO2t-Q0GrPHFgwa
X-Proofpoint-GUID: SuuBkltwrA3I4oGQemggP_yqzcxRiuHX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_15,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 impostorscore=0 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2307180017
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Muchun Song <muchun.song@linux.dev>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, Dan Williams <dan.j.williams@intel.com>, Oscar Salvador <osalvador@suse.de>, Will Deacon <will@kernel.org>, Joao Martins <joao.m.martins@oracle.com>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We will use this in a later patch to do tlb flush when clearing pud entries
on powerpc. This is similar to commit 93a98695f2f9 ("mm: change
pmdp_huge_get_and_clear_full take vm_area_struct as arg")

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/pgtable.h | 4 ++--
 mm/debug_vm_pgtable.c   | 2 +-
 mm/huge_memory.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index cf13f8d938a8..6fd9b2831338 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -450,11 +450,11 @@ static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 #endif
 
 #ifndef __HAVE_ARCH_PUDP_HUGE_GET_AND_CLEAR_FULL
-static inline pud_t pudp_huge_get_and_clear_full(struct mm_struct *mm,
+static inline pud_t pudp_huge_get_and_clear_full(struct vm_area_struct *vma,
 					    unsigned long address, pud_t *pudp,
 					    int full)
 {
-	return pudp_huge_get_and_clear(mm, address, pudp);
+	return pudp_huge_get_and_clear(vma->vm_mm, address, pudp);
 }
 #endif
 #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index ee119e33fef1..ee2c4c1dcfc8 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -385,7 +385,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
 	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	pudp_huge_get_and_clear_full(args->mm, vaddr, args->pudp, 1);
+	pudp_huge_get_and_clear_full(args->vma, vaddr, args->pudp, 1);
 	pud = READ_ONCE(*args->pudp);
 	WARN_ON(!pud_none(pud));
 #endif /* __PAGETABLE_PMD_FOLDED */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index eb3678360b97..ba20cef681a4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1981,7 +1981,7 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	pudp_huge_get_and_clear_full(tlb->mm, addr, pud, tlb->fullmm);
+	pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
 	if (vma_is_special_huge(vma)) {
 		spin_unlock(ptl);
-- 
2.41.0

