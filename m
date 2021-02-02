Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 108FD30D03F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 01:25:10 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DVjBB3YwwzDrQY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Feb 2021 11:25:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=LsnBnnrw; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DVJwM0RB9zDqLS
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Feb 2021 20:11:46 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 11292Gbc028873; Tue, 2 Feb 2021 04:11:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=Pr36thg1Hn0gsZexxZXZcL5GPtkl9LlFHSslf94bovU=;
 b=LsnBnnrwI/i1lBVoDCpMNaAqkjd75PQy0larIzI++1YIVxfZw+EZlgJy7PpCyarU1I6k
 O1w8/iHAj8CmNO8ynvT4vMW7vzf5ss9fIYg5UrWTFr1DHkk2WV6cIsdnX46Kl50RZ0tq
 8WSyCWLpgBXapgM/g1+pW+SgIyZdAG7vcauqjan9cWwJ4bfRui4Pc2doeXVqsY58WvHp
 F268ONciRkqVy0A8E9qPoQFjjhAPfYumWAQS9xAPC2+H3spMn4OqkSir29wmq+8pVtd2
 KkGTE03PZnqzCIgMSVJHg7EKx++nvWWQc4gAb2qqueddvK9RjW5U4VlAJrxGsGO/Da2f lA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3kc0h9u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:37 -0500
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 11294hSk040872;
 Tue, 2 Feb 2021 04:11:37 -0500
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0a-001b2d01.pphosted.com with ESMTP id 36f3kc0h9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 04:11:37 -0500
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 112987EY013612;
 Tue, 2 Feb 2021 09:11:36 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma01dal.us.ibm.com with ESMTP id 36eu8qbpmh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 02 Feb 2021 09:11:36 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1129BZAs30736846
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 2 Feb 2021 09:11:35 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 396C52805E;
 Tue,  2 Feb 2021 09:11:35 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 48BAF28058;
 Tue,  2 Feb 2021 09:11:32 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.35.92])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Tue,  2 Feb 2021 09:11:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [RFC PATCH 4/6] mm/mremap: Use mmu gather interface instead of
 flush_tlb_range
Date: Tue,  2 Feb 2021 14:41:14 +0530
Message-Id: <20210202091116.196134-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
References: <20210202091116.196134-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369, 18.0.737
 definitions=2021-02-02_04:2021-01-29,
 2021-02-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999
 malwarescore=0 adultscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 clxscore=1015 mlxscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2102020059
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
index 54fd2302b99d..14778d215011 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -217,6 +217,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 {
 	spinlock_t *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
+	struct mmu_gather tlb;
 	pmd_t pmd;
 
 	/*
@@ -245,11 +246,12 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
 		return false;
 
+	tlb_gather_mmu(&tlb, mm, old_addr, PMD_SIZE);
 	/*
 	 * We don't have to worry about the ordering of src and dst
 	 * ptlocks because exclusive mmap_lock prevents deadlock.
 	 */
-	old_ptl = pmd_lock(vma->vm_mm, old_pmd);
+	old_ptl = pmd_lock(mm, old_pmd);
 	new_ptl = pmd_lockptr(mm, new_pmd);
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
@@ -258,13 +260,23 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
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
+	tlb_finish_mmu(&tlb, old_addr, PMD_SIZE);
 
 	return true;
 }
@@ -283,6 +295,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 {
 	spinlock_t *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
+	struct mmu_gather tlb;
 	pud_t pud;
 
 	/*
@@ -292,11 +305,12 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	if (WARN_ON_ONCE(!pud_none(*new_pud)))
 		return false;
 
+	tlb_gather_mmu(&tlb, mm, old_addr, PUD_SIZE);
 	/*
 	 * We don't have to worry about the ordering of src and dst
 	 * ptlocks because exclusive mmap_lock prevents deadlock.
 	 */
-	old_ptl = pud_lock(vma->vm_mm, old_pud);
+	old_ptl = pud_lock(mm, old_pud);
 	new_ptl = pud_lockptr(mm, new_pud);
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
@@ -305,14 +319,25 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
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
+	tlb_finish_mmu(&tlb, old_addr, PUD_SIZE);
 	return true;
 }
 #else
-- 
2.29.2

