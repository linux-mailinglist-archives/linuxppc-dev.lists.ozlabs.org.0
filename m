Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E4DC1C4FE2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 10:08:49 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49GXRf5H0jzDqs1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  5 May 2020 18:08:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49GWKz6jy5zDqVT
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  5 May 2020 17:18:47 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0456XQFm125717; Tue, 5 May 2020 03:18:42 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30twhwrpf2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:41 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 04570AIO103720;
 Tue, 5 May 2020 03:18:41 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 30twhwrpee-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 03:18:41 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 0457FJ46001280;
 Tue, 5 May 2020 07:18:40 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma02wdc.us.ibm.com with ESMTP id 30s0g6etvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 05 May 2020 07:18:40 +0000
Received: from b03ledav005.gho.boulder.ibm.com
 (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0457Idq840239458
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 5 May 2020 07:18:39 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 735E0BE058;
 Tue,  5 May 2020 07:18:39 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 92EDBBE054;
 Tue,  5 May 2020 07:18:36 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.70])
 by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue,  5 May 2020 07:18:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v4 21/22] mm: change pmdp_huge_get_and_clear_full take
 vm_area_struct as arg
Date: Tue,  5 May 2020 12:47:28 +0530
Message-Id: <20200505071729.54912-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
References: <20200505071729.54912-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.676
 definitions=2020-05-05_02:2020-05-04,
 2020-05-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0
 malwarescore=0 impostorscore=0 suspectscore=0 mlxscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2005050053
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, akpm@linux-foundation.org,
 npiggin@gmail.com, kirill@shutemov.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We will use this in later patch to do tlb flush when clearing pmd entries.

Cc: kirill@shutemov.name
Cc: akpm@linux-foundation.org
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/s390/include/asm/pgtable.h | 4 ++--
 include/asm-generic/pgtable.h   | 4 ++--
 mm/huge_memory.c                | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 6076c8c912d2..e2528e057980 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1560,7 +1560,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
-static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
+static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 						 unsigned long addr,
 						 pmd_t *pmdp, int full)
 {
@@ -1569,7 +1569,7 @@ static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
 		*pmdp = __pmd(_SEGMENT_ENTRY_EMPTY);
 		return pmd;
 	}
-	return pmdp_xchg_lazy(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	return pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index 329b8c8ca703..d10be362eafa 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -159,11 +159,11 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #ifndef __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
-static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
+static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 					    unsigned long address, pmd_t *pmdp,
 					    int full)
 {
-	return pmdp_huge_get_and_clear(mm, address, pmdp);
+	return pmdp_huge_get_and_clear(vma->vm_mm, address, pmdp);
 }
 #endif
 
diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 6ecd1045113b..16f2bd6f1549 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1852,8 +1852,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	 * pgtable_trans_huge_withdraw after finishing pmdp related
 	 * operations.
 	 */
-	orig_pmd = pmdp_huge_get_and_clear_full(tlb->mm, addr, pmd,
-			tlb->fullmm);
+	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
+						tlb->fullmm);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 	if (vma_is_special_huge(vma)) {
 		if (arch_needs_pgtable_deposit())
-- 
2.26.2

