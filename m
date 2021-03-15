Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366D033B14A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 12:41:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DzZJ71jStz3brW
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 22:41:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=gANUbz6C;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=gANUbz6C; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzZGF1dzsz2yjR
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Mar 2021 22:39:48 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 12FBXdC1121652; Mon, 15 Mar 2021 07:38:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=x6zMMXNjm5KliJNMW8hrdDDZ8cE2VCpmbSMt3rxe/lo=;
 b=gANUbz6CbFtCh+E2I9ullvXu5M+s6pL5nEvoN24k3JlFa1wBf1y/XZIvP1L2NH20oYM9
 ml3UD8SF5gxdoUxj1ta3QvOrQt9TdOxxNysoPwjMcgzE42mvoB/KPJYnm3+/9dfgVMCw
 8ScP8P2FkitEczncVt6AxRcfJWjXSPdsE8rklBUMJzDpXS5hQG1d1O6S99BcVM9ZEgWj
 j8YH3e8vFsbSPv/m76X8y4xu5/Zol9xWVelhHH4Jxs12gnm999YdCk6Uz91jJKEAd9ir
 mfQYufOmP52KJsBERJTubJS8aGhWRGWKIaG9uxt1+P6IkArarVnUtxN97TUhO1Ji393j GQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379r4aaf6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:47 -0400
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 12FBXtCE122481;
 Mon, 15 Mar 2021 07:38:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0b-001b2d01.pphosted.com with ESMTP id 379r4aaf64-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 07:38:47 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 12FBXhtQ002381;
 Mon, 15 Mar 2021 11:38:46 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma04wdc.us.ibm.com with ESMTP id 378n18pt7t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 15 Mar 2021 11:38:46 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 12FBckks31129958
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 15 Mar 2021 11:38:46 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49F17AC05F;
 Mon, 15 Mar 2021 11:38:46 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7700AC060;
 Mon, 15 Mar 2021 11:38:43 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.36.236])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 15 Mar 2021 11:38:43 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 4/6] mm/mremap: Use mmu gather interface instead of
 flush_tlb_range
Date: Mon, 15 Mar 2021 17:08:22 +0530
Message-Id: <20210315113824.270796-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
References: <20210315113824.270796-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.761
 definitions=2021-03-15_03:2021-03-15,
 2021-03-15 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0
 mlxscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2103150081
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
Cc: peterz@infradead.org, kaleshsingh@google.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures do have the concept of page walk cache and only mmu gather
interface supports flushing them. A fast mremap that involves moving page
table pages instead of copying pte entries should flush page walk cache since
the old translation cache is no more valid. Hence switch to mm gather to flush
TLB and mark tlb.freed_tables = 1. No page table pages need to be freed here.
With this the tlb flush is done outside page table lock (ptl).

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/mremap.c | 33 +++++++++++++++++++++++++++++----
 1 file changed, 29 insertions(+), 4 deletions(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 574287f9bb39..fafa73b965d3 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -216,6 +216,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 {
 	spinlock_t *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
+	struct mmu_gather tlb;
 	pmd_t pmd;
 
 	/*
@@ -244,11 +245,12 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
 		return false;
 
+	tlb_gather_mmu(&tlb, mm);
 	/*
 	 * We don't have to worry about the ordering of src and dst
 	 * ptlocks because exclusive mmap_lock prevents deadlock.
 	 */
-	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
+	old_ptl = pmd_lock(mm, old_pmd);
 	new_ptl = pmd_lockptr(mm, new_pmd);
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
@@ -257,13 +259,23 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	pmd = *old_pmd;
 	pmd_clear(old_pmd);
 
+	/*
+	 * Mark the range. We are not freeing page table pages nor
+	 * regular pages. Hence we don't need to call tlb_remove_table()
+	 * or tlb_remove_page().
+	 */
+	tlb_flush_pte_range(&tlb, old_addr, PMD_SIZE);
+	tlb.freed_tables = 1;
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
 
-	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
+	/*
+	 * This will invalidate both the old TLB and page table walk caches.
+	 */
+	tlb_finish_mmu(&tlb);
 
 	return true;
 }
@@ -282,6 +294,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 {
 	spinlock_t *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
+	struct mmu_gather tlb;
 	pud_t pud;
 
 	/*
@@ -291,11 +304,12 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	if (WARN_ON_ONCE(!pud_none(*new_pud)))
 		return false;
 
+	tlb_gather_mmu(&tlb, mm);
 	/*
 	 * We don't have to worry about the ordering of src and dst
 	 * ptlocks because exclusive mmap_lock prevents deadlock.
 	 */
-	old_ptl = pud_lock(vma->vm_mm, old_pud);
+	old_ptl = pud_lock(mm, old_pud);
 	new_ptl = pud_lockptr(mm, new_pud);
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
@@ -304,14 +318,25 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	pud = *old_pud;
 	pud_clear(old_pud);
 
+	/*
+	 * Mark the range. We are not freeing page table pages nor
+	 * regular pages. Hence we don't need to call tlb_remove_table()
+	 * or tlb_remove_page().
+	 */
+	tlb_flush_pte_range(&tlb, old_addr, PUD_SIZE);
+	tlb.freed_tables = 1;
 	VM_BUG_ON(!pud_none(*new_pud));
 
 	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
-	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
+
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
 
+	/*
+	 * This will invalidate both the old TLB and page table walk caches.
+	 */
+	tlb_finish_mmu(&tlb);
 	return true;
 }
 #else
-- 
2.29.2

