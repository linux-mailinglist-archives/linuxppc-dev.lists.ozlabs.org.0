Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 775E172368D
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 07:03:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QZyzp1s0yz3ff1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Jun 2023 15:03:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9X51AtU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=I9X51AtU;
	dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QZyrm5gFTz3f5p
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  6 Jun 2023 14:57:28 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3564pIAP026619;
	Tue, 6 Jun 2023 04:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=1aw77EutqfnLZOGfGtdgB5xpbtvhlriZ/GwDSP8Y0AU=;
 b=I9X51AtUcJ2MPYjuAV+Hv8y1/uvdOA6a3JGiEyAYt9nZL9wkRpUle3T/h3FRwOTxdQca
 KwxTP45nilNiD1oSrpjVdSk4AQCDlM6dgHHWJ26kogTViVmtDuFuN8DamwpfP9zDhQUr
 I3TKUm0nfUIvbO5CKHp0YdH2LV+Zq5BISX+eMcDKgl7EvOtYxOqdmdb51VHRC+bBh2nE
 I5PCDkN/WB7qe/snEFussdjJSlxoAIL1zmcE7Fp3q7Fke0bTxnuwAwhC4KMLQkklxTXz
 zBhc1ba4C5OWO0zheGlfUBY3MgaETt1uLQFovS88dBYnXEUf6Uqxfkwg2CDO1XQWnF9V cw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x50r322-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:08 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3564pK4K026690;
	Tue, 6 Jun 2023 04:57:08 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r1x50r31q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:08 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3564XjRw028582;
	Tue, 6 Jun 2023 04:57:07 GMT
Received: from smtprelay06.dal12v.mail.ibm.com ([9.208.130.100])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3qyxmx4gr4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 06 Jun 2023 04:57:07 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3564v5Rd8192710
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 6 Jun 2023 04:57:06 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id AD0B958059;
	Tue,  6 Jun 2023 04:57:05 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 09F545804B;
	Tue,  6 Jun 2023 04:57:01 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.204.255])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  6 Jun 2023 04:57:00 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH 07/16] mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
Date: Tue,  6 Jun 2023 10:25:59 +0530
Message-Id: <20230606045608.55127-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
References: <20230606045608.55127-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: bJOPbTDXoDy2L4IiEQPscUEA0vWzn5AX
X-Proofpoint-ORIG-GUID: yaAhNUQoI4i0StTEWnq7lwdLg369Ho1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-06_02,2023-06-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 spamscore=0 bulkscore=0 impostorscore=0
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

We will use this in a later patch to do tlb flush when clearing pud entries on
powerpc. This is similar to
commit 93a98695f2f9 ("mm: change pmdp_huge_get_and_clear_full take vm_area_struct as arg")

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/pgtable.h | 4 ++--
 mm/debug_vm_pgtable.c   | 2 +-
 mm/huge_memory.c        | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index b3f4dd0240f5..2fe19720075e 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -442,11 +442,11 @@ static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
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
index c54177aabebd..c2bf25d5e5cd 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -382,7 +382,7 @@ static void __init pud_advanced_tests(struct pgtable_debug_args *args)
 	WARN_ON(!(pud_write(pud) && pud_dirty(pud)));
 
 #ifndef __PAGETABLE_PMD_FOLDED
-	pudp_huge_get_and_clear_full(args->mm, vaddr, args->pudp, 1);
+	pudp_huge_get_and_clear_full(args->vma, vaddr, args->pudp, 1);
 	pud = READ_ONCE(*args->pudp);
 	WARN_ON(!pud_none(pud));
 #endif /* __PAGETABLE_PMD_FOLDED */
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 624671aaa60d..8774b4751a84 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1980,7 +1980,7 @@ int zap_huge_pud(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	if (!ptl)
 		return 0;
 
-	pudp_huge_get_and_clear_full(tlb->mm, addr, pud, tlb->fullmm);
+	pudp_huge_get_and_clear_full(vma, addr, pud, tlb->fullmm);
 	tlb_remove_pud_tlb_entry(tlb, pud, addr);
 	if (vma_is_special_huge(vma)) {
 		spin_unlock(ptl);
-- 
2.40.1

