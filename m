Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E62618ABD2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 05:34:13 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jYvj6bJczDrT0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 15:34:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jY5r6RvpzDr6T
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 14:57:52 +1100 (AEDT)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 02J3Wgxm081667; Wed, 18 Mar 2020 23:57:44 -0400
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu98tyexs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:57:44 -0400
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 02J3XADm083674;
 Wed, 18 Mar 2020 23:57:44 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2yu98tyexf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 18 Mar 2020 23:57:44 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 02J3ut5d029362;
 Thu, 19 Mar 2020 03:57:43 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma04dal.us.ibm.com with ESMTP id 2yrpw6y6bc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 19 Mar 2020 03:57:43 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 02J3vg2a53608796
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 19 Mar 2020 03:57:42 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B3B02112067;
 Thu, 19 Mar 2020 03:57:42 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B5139112062;
 Thu, 19 Mar 2020 03:57:38 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.34.213])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 19 Mar 2020 03:57:38 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org
Subject: [PATCH v2 21/22] mm: change pmdp_huge_get_and_clear_full take
 vm_area_struct as arg
Date: Thu, 19 Mar 2020 09:26:08 +0530
Message-Id: <20200319035609.158654-22-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
References: <20200319035609.158654-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.645
 definitions=2020-03-18_10:2020-03-18,
 2020-03-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015
 adultscore=0 mlxlogscore=999 suspectscore=0 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2003020000 definitions=main-2003190013
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
Cc: leonardo@linux.ibm.com, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 npiggin@gmail.com, kirill@shutemov.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We will use this in later patch to do tlb flush when clearing pmd entries.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/s390/include/asm/pgtable.h | 4 ++--
 include/asm-generic/pgtable.h   | 4 ++--
 mm/huge_memory.c                | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/s390/include/asm/pgtable.h b/arch/s390/include/asm/pgtable.h
index 6d7c3b7e9281..4efee8025c97 100644
--- a/arch/s390/include/asm/pgtable.h
+++ b/arch/s390/include/asm/pgtable.h
@@ -1535,7 +1535,7 @@ static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR_FULL
-static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
+static inline pmd_t pmdp_huge_get_and_clear_full(struct vm_area_struct *vma,
 						 unsigned long addr,
 						 pmd_t *pmdp, int full)
 {
@@ -1544,7 +1544,7 @@ static inline pmd_t pmdp_huge_get_and_clear_full(struct mm_struct *mm,
 		*pmdp = __pmd(_SEGMENT_ENTRY_EMPTY);
 		return pmd;
 	}
-	return pmdp_xchg_lazy(mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
+	return pmdp_xchg_lazy(vma->vm_mm, addr, pmdp, __pmd(_SEGMENT_ENTRY_EMPTY));
 }
 
 #define __HAVE_ARCH_PMDP_HUGE_CLEAR_FLUSH
diff --git a/include/asm-generic/pgtable.h b/include/asm-generic/pgtable.h
index e2e2bef07dd2..bb0c7dc0a3d9 100644
--- a/include/asm-generic/pgtable.h
+++ b/include/asm-generic/pgtable.h
@@ -158,11 +158,11 @@ static inline pud_t pudp_huge_get_and_clear(struct mm_struct *mm,
 
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
index 24ad53b4dfc0..a5e0825cc00b 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -1799,8 +1799,8 @@ int zap_huge_pmd(struct mmu_gather *tlb, struct vm_area_struct *vma,
 	 * pgtable_trans_huge_withdraw after finishing pmdp related
 	 * operations.
 	 */
-	orig_pmd = pmdp_huge_get_and_clear_full(tlb->mm, addr, pmd,
-			tlb->fullmm);
+	orig_pmd = pmdp_huge_get_and_clear_full(vma, addr, pmd,
+						tlb->fullmm);
 	tlb_remove_pmd_tlb_entry(tlb, pmd, addr);
 	if (vma_is_dax(vma)) {
 		if (arch_needs_pgtable_deposit())
-- 
2.24.1

