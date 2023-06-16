Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8562732F9E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 13:16:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mzyfGpFm;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QjGmy5JqTz3cVt
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jun 2023 21:16:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=mzyfGpFm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QjGdm46f2z3bpN
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Jun 2023 21:09:48 +1000 (AEST)
Received: from pps.filterd (m0353727.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35GAkmQD025344;
	Fri, 16 Jun 2023 11:09:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=IgFHfZ1KySuiFsDTbSIBfgisCKdqais3tV9iLIh71Vs=;
 b=mzyfGpFmT1Pch2wcBqn6wqSFt4rvnmNvEziRTRlvBlf2gSK1UwSCeZIOjLH56a88vOnk
 cofmx54awuupmgO0NKJsL3Lzi/XUmd19wMBjQaMvo/lYsMhgKhLaYnpnSLxKrSqzit7e
 B7Lfdj/r2SDOTyd+46luR5tz+hJLiiOoRUXi/zvxyXjmSSZBI2VitgnQiW3yan2Dry6b
 PKKyKVLUNtuo2LNzePPcP9FVoNcUwEMPfQP5bD1MTZlH1o7t1vD3qKcDJ92bON7HUPIv
 MoPanUKPAY/Og9ypeL6Ir022AkcvlAYPDdoG0jYd1usn9TPccSUlRoZUADM/4fZHPtEP lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9nggks-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:31 +0000
Received: from m0353727.ppops.net (m0353727.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 35GAmUQC028781;
	Fri, 16 Jun 2023 11:09:31 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.11])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3r8p9nggka-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:31 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
	by ppma03dal.us.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 35G8oUp8030230;
	Fri, 16 Jun 2023 11:09:30 GMT
Received: from smtprelay05.dal12v.mail.ibm.com ([9.208.130.101])
	by ppma03dal.us.ibm.com (PPS) with ESMTPS id 3r4gt529c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 16 Jun 2023 11:09:30 +0000
Received: from smtpav02.wdc07v.mail.ibm.com (smtpav02.wdc07v.mail.ibm.com [10.39.53.229])
	by smtprelay05.dal12v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 35GB9SY764028950
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 16 Jun 2023 11:09:29 GMT
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9BF7358058;
	Fri, 16 Jun 2023 11:09:28 +0000 (GMT)
Received: from smtpav02.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 69F6258059;
	Fri, 16 Jun 2023 11:09:23 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.52.24])
	by smtpav02.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 16 Jun 2023 11:09:23 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org, mpe@ellerman.id.au,
        linuxppc-dev@lists.ozlabs.org, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v2 07/16] mm: Change pudp_huge_get_and_clear_full take vm_area_struct as arg
Date: Fri, 16 Jun 2023 16:38:17 +0530
Message-Id: <20230616110826.344417-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
References: <20230616110826.344417-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: GMvt6BQvPqImc8Zg_D1LAzg79RDphZh5
X-Proofpoint-ORIG-GUID: dG-IK40REO7GSnDV6A5S9Cqi2Ldrs4gE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-16_07,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 clxscore=1015
 bulkscore=0 mlxlogscore=999 priorityscore=1501 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306160099
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

