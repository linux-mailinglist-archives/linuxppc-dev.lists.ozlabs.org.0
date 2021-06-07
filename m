Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A7A439D480
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:53:32 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2bt5p9lz3c4r
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:53:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nA6m3L9W;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nA6m3L9W; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2ZR3G6vz2yXW
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:14 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575Y8qG001654; Mon, 7 Jun 2021 01:52:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=1CZV2oWhvddTbDHFXWMDZlBJJyfSVlv//BAQO+GCgpg=;
 b=nA6m3L9WiY4Vk8q4SvVYh9A/aAofzL4B8WPN3CcabqRoJ/fLoPVMp8NKd9wWhujEfFT4
 McC+QiWNz2B4oms1pXauH9gYN4lQGMk6LC4uByirxDvKk3JXWzLJpJjtiGFGt89bqGX8
 0cPaf89UVC+hWaRWn/5WeIOBt6QYV/N9LpqhITWEd6v8c3x3hVHnWxHPCNbus1b+qi+u
 uLIWkzaKSqJHjux+UIE3LWIg0NSK+G4HjiZN2H5spXPpaSFfxHhIK4w0EtuM7nBpqtIe
 oyw7+SDXI5F2J5aWmjnObnZ6wLR0gNAoP1b0Pn7wHnWDo0DOg3/O0zUaZGCUGHCAsUlZ aw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391d4x8nca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:01 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575ZP7h005906;
 Mon, 7 Jun 2021 01:52:00 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391d4x8nc2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:00 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575h8WP009755;
 Mon, 7 Jun 2021 05:51:59 GMT
Received: from b01cxnp22033.gho.pok.ibm.com (b01cxnp22033.gho.pok.ibm.com
 [9.57.198.23]) by ppma03dal.us.ibm.com with ESMTP id 3900w97sxs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:51:59 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575pw4M30998846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:51:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A0FEB28064;
 Mon,  7 Jun 2021 05:51:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4677728059;
 Mon,  7 Jun 2021 05:51:55 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:51:55 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 01/11] mm/mremap: Fix race between MOVE_PMD mremap and
 pageout
Date: Mon,  7 Jun 2021 11:21:21 +0530
Message-Id: <20210607055131.156184-2-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: XDuNCV7rHnpx8ZQoguQZ2lxv2SZR7jqN
X-Proofpoint-ORIG-GUID: WuevRslu-nAW6NOb1Y8dZuEznV5FZiIQ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501
 malwarescore=0 impostorscore=0 suspectscore=0 bulkscore=0 mlxlogscore=999
 spamscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2106070042
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
 Linus Torvalds <torvalds@linux-foundation.org>, npiggin@gmail.com,
 kaleshsingh@google.com, joel@joelfernandes.org,
 "Kirill A . Shutemov" <kirill@shutemov.name>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU 1				CPU 2					CPU 3

mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one

mmap_write_lock_killable()

				addr = old_addr
				lock(pte_ptl)
lock(pmd_ptl)
pmd = *old_pmd
pmd_clear(old_pmd)
flush_tlb_range(old_addr)

*new_pmd = pmd
									*new_addr = 10; and fills
									TLB with new addr
									and old pfn

unlock(pmd_ptl)
				ptep_clear_flush()
				old pfn is free.
									Stale TLB entry

Fix this race by holding pmd lock in pageout. This still doesn't handle the race
between MOVE_PUD and pageout.

Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/rmap.h |  9 ++++++---
 mm/page_vma_mapped.c | 36 ++++++++++++++++++------------------
 2 files changed, 24 insertions(+), 21 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index def5c62c93b3..272ab0c2b60b 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -207,7 +207,8 @@ struct page_vma_mapped_walk {
 	unsigned long address;
 	pmd_t *pmd;
 	pte_t *pte;
-	spinlock_t *ptl;
+	spinlock_t *pte_ptl;
+	spinlock_t *pmd_ptl;
 	unsigned int flags;
 };
 
@@ -216,8 +217,10 @@ static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
 	/* HugeTLB pte is set to the relevant page table entry without pte_mapped. */
 	if (pvmw->pte && !PageHuge(pvmw->page))
 		pte_unmap(pvmw->pte);
-	if (pvmw->ptl)
-		spin_unlock(pvmw->ptl);
+	if (pvmw->pte_ptl)
+		spin_unlock(pvmw->pte_ptl);
+	if (pvmw->pmd_ptl)
+		spin_unlock(pvmw->pmd_ptl);
 }
 
 bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 2cf01d933f13..87a2c94c7e27 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -47,8 +47,10 @@ static bool map_pte(struct page_vma_mapped_walk *pvmw)
 				return false;
 		}
 	}
-	pvmw->ptl = pte_lockptr(pvmw->vma->vm_mm, pvmw->pmd);
-	spin_lock(pvmw->ptl);
+	if (USE_SPLIT_PTE_PTLOCKS) {
+		pvmw->pte_ptl = pte_lockptr(pvmw->vma->vm_mm, pvmw->pmd);
+		spin_lock(pvmw->pte_ptl);
+	}
 	return true;
 }
 
@@ -162,8 +164,8 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 		if (!pvmw->pte)
 			return false;
 
-		pvmw->ptl = huge_pte_lockptr(page_hstate(page), mm, pvmw->pte);
-		spin_lock(pvmw->ptl);
+		pvmw->pte_ptl = huge_pte_lockptr(page_hstate(page), mm, pvmw->pte);
+		spin_lock(pvmw->pte_ptl);
 		if (!check_pte(pvmw))
 			return not_found(pvmw);
 		return true;
@@ -179,6 +181,7 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 	if (!pud_present(*pud))
 		return false;
 	pvmw->pmd = pmd_offset(pud, pvmw->address);
+	pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
 	/*
 	 * Make sure the pmd value isn't cached in a register by the
 	 * compiler and used as a stale value after we've observed a
@@ -186,7 +189,6 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 	 */
 	pmde = READ_ONCE(*pvmw->pmd);
 	if (pmd_trans_huge(pmde) || is_pmd_migration_entry(pmde)) {
-		pvmw->ptl = pmd_lock(mm, pvmw->pmd);
 		if (likely(pmd_trans_huge(*pvmw->pmd))) {
 			if (pvmw->flags & PVMW_MIGRATION)
 				return not_found(pvmw);
@@ -206,14 +208,10 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 				}
 			}
 			return not_found(pvmw);
-		} else {
-			/* THP pmd was split under us: handle on pte level */
-			spin_unlock(pvmw->ptl);
-			pvmw->ptl = NULL;
 		}
-	} else if (!pmd_present(pmde)) {
-		return false;
-	}
+	} else if (!pmd_present(pmde))
+		return not_found(pvmw);
+
 	if (!map_pte(pvmw))
 		goto next_pte;
 	while (1) {
@@ -233,19 +231,21 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 			/* Did we cross page table boundary? */
 			if (pvmw->address % PMD_SIZE == 0) {
 				pte_unmap(pvmw->pte);
-				if (pvmw->ptl) {
-					spin_unlock(pvmw->ptl);
-					pvmw->ptl = NULL;
+				if (pvmw->pte_ptl) {
+					spin_unlock(pvmw->pte_ptl);
+					pvmw->pte_ptl = NULL;
 				}
+				spin_unlock(pvmw->pmd_ptl);
+				pvmw->pmd_ptl = NULL;
 				goto restart;
 			} else {
 				pvmw->pte++;
 			}
 		} while (pte_none(*pvmw->pte));
 
-		if (!pvmw->ptl) {
-			pvmw->ptl = pte_lockptr(mm, pvmw->pmd);
-			spin_lock(pvmw->ptl);
+		if (USE_SPLIT_PTE_PTLOCKS && !pvmw->pte_ptl) {
+			pvmw->pte_ptl = pte_lockptr(mm, pvmw->pmd);
+			spin_lock(pvmw->pte_ptl);
 		}
 	}
 }
-- 
2.31.1

