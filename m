Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2802D171140
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 08:08:22 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48SkKH3jqFzDqxL
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:08:19 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Sk4H5wltzDqtt
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 17:57:03 +1100 (AEDT)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 01R6t51P119429; Thu, 27 Feb 2020 01:56:59 -0500
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnubnh8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:56:59 -0500
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 01R6tTZi120330;
 Thu, 27 Feb 2020 01:56:59 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2ydcnubngs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 01:56:59 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id 01R6ulvY025642;
 Thu, 27 Feb 2020 06:56:58 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01dal.us.ibm.com with ESMTP id 2ydcmkx46r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Feb 2020 06:56:57 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 01R6uvFY46989770
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Feb 2020 06:56:57 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 36D6F28058;
 Thu, 27 Feb 2020 06:56:57 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 46A462805C;
 Thu, 27 Feb 2020 06:56:55 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.204.201.20])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 27 Feb 2020 06:56:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au,
 kirill@shutemov.name
Subject: [RFC PATCH 05/21] powerpc/book3s64/hash: Use the pte_t address from
 the caller
Date: Thu, 27 Feb 2020 12:26:04 +0530
Message-Id: <20200227065620.50804-6-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
References: <20200227065620.50804-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-02-27_01:2020-02-26,
 2020-02-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 adultscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 malwarescore=0 spamscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 phishscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2001150001 definitions=main-2002270054
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Don't fetch the pte value using lockless page table walk. Instead use the value from the
caller. hash_preload is called with ptl lock held. So it is safe to use the
pte_t address directly.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index e2a7873c7760..81b4130ceb05 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -1545,14 +1545,11 @@ static bool should_hash_preload(struct mm_struct *mm, unsigned long ea)
 }
 #endif
 
-static void hash_preload(struct mm_struct *mm, unsigned long ea,
+static void hash_preload(struct mm_struct *mm, pte_t *ptep, unsigned long ea,
 			 bool is_exec, unsigned long trap)
 {
-	int hugepage_shift;
 	unsigned long vsid;
 	pgd_t *pgdir;
-	pte_t *ptep;
-	unsigned long flags;
 	int rc, ssize, update_flags = 0;
 	unsigned long access = _PAGE_PRESENT | _PAGE_READ | (is_exec ? _PAGE_EXEC : 0);
 
@@ -1574,30 +1571,18 @@ static void hash_preload(struct mm_struct *mm, unsigned long ea,
 	vsid = get_user_vsid(&mm->context, ea, ssize);
 	if (!vsid)
 		return;
-	/*
-	 * Hash doesn't like irqs. Walking linux page table with irq disabled
-	 * saves us from holding multiple locks.
-	 */
-	local_irq_save(flags);
 
-	/*
-	 * THP pages use update_mmu_cache_pmd. We don't do
-	 * hash preload there. Hence can ignore THP here
-	 */
-	ptep = find_current_mm_pte(pgdir, ea, NULL, &hugepage_shift);
-	if (!ptep)
-		goto out_exit;
-
-	WARN_ON(hugepage_shift);
 #ifdef CONFIG_PPC_64K_PAGES
 	/* If either H_PAGE_4K_PFN or cache inhibited is set (and we are on
 	 * a 64K kernel), then we don't preload, hash_page() will take
 	 * care of it once we actually try to access the page.
 	 * That way we don't have to duplicate all of the logic for segment
 	 * page size demotion here
+	 * Called with  PTL held, hence can be sure the value won't change in
+	 * between.
 	 */
 	if ((pte_val(*ptep) & H_PAGE_4K_PFN) || pte_ci(*ptep))
-		goto out_exit;
+		return;
 #endif /* CONFIG_PPC_64K_PAGES */
 
 	/* Is that local to this CPU ? */
@@ -1622,8 +1607,6 @@ static void hash_preload(struct mm_struct *mm, unsigned long ea,
 				   mm_ctx_user_psize(&mm->context),
 				   mm_ctx_user_psize(&mm->context),
 				   pte_val(*ptep));
-out_exit:
-	local_irq_restore(flags);
 }
 
 /*
@@ -1674,7 +1657,7 @@ void update_mmu_cache(struct vm_area_struct *vma, unsigned long address,
 		return;
 	}
 
-	hash_preload(vma->vm_mm, address, is_exec, trap);
+	hash_preload(vma->vm_mm, ptep, address, is_exec, trap);
 }
 
 #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
-- 
2.24.1

