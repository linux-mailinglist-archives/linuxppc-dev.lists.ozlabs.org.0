Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA5E38E7D0
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 15:39:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fpdbj38w9z3bsp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 23:39:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R4jtBeSu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R4jtBeSu; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fpdb90hT8z2yWs
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 23:38:44 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14ODXRlD139448; Mon, 24 May 2021 09:38:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-transfer-encoding
 : mime-version; s=pp1; bh=ugsgz2obaKuedwBCRj91TY4HhC5/482f7ENXtAmnK2w=;
 b=R4jtBeSuRIGk2AgJ5b4MLAZS+fM/K5vPVrazz6Qx8jg5gAjHOMcDT6NK3vypoVP1fMAw
 xHXsaKoNLNtUDuRSS+K08N79lnhCRR9g0HDgO5nx565XeSasDqiNV/DSP1sTUDrY6ICs
 bxNqBFsI8rgS9KgyJGjC/6XKYoe/sk1eYNK0JHBH8Ui4wV09aqEwuse45mFUEqzXuPaO
 skvlWto3ThzRysADy2+4BUpRqfjlqYr8E6PwOFGd7THOcaid/uGYI06JoUFMNdJetB8+
 4WlUIDzgpL9P/3EW7vbwrXz4HYWlXn/hIb8RE9FJrKcOgomGsTr97WCjt8hwiT1TG+6A MQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rcgu987a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 09:38:30 -0400
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14ODXY3N140320;
 Mon, 24 May 2021 09:38:29 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38rcgu986u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 09:38:29 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14ODN3wt027501;
 Mon, 24 May 2021 13:38:28 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma04dal.us.ibm.com with ESMTP id 38psk8u13r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 13:38:28 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14ODcRMR28180984
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 13:38:27 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B279178060;
 Mon, 24 May 2021 13:38:27 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2F3E47805F;
 Mon, 24 May 2021 13:38:24 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.240])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 13:38:23 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v6 updated 9/11] mm/mremap: Fix race between mremap and pageout
Date: Mon, 24 May 2021 19:08:18 +0530
Message-Id: <20210524133818.84955-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <id:20210524090114.63446-10-aneesh.kumar@linux.ibm.com>
References: <id:20210524090114.63446-10-aneesh.kumar@linux.ibm.com>
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: PHdm73f7Ll78QZq8PX7nQF9KrDZwJMRx
X-Proofpoint-GUID: EpkhFge_ZHvrEaO4GT1IaS0u3OgTILMb
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_07:2021-05-24,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0
 adultscore=0 mlxscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240086
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
 kaleshsingh@google.com, joel@joelfernandes.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

CPU 1				CPU 2					CPU 3

mremap(old_addr, new_addr)      page_shrinker/try_to_unmap_one

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
				ptep_get_and_clear()
				flush_tlb_range(old_addr)

				old pfn is free.
									Stale TLB entry

Avoid the above race with MOVE_PMD by holding pte ptl in mremap and waiting for
parallel pagetable walk to finish operating on pte before updating new_pmd

With MOVE_PUD only enable MOVE_PUD only if USE_SPLIT_PTE_PTLOCKS is disabled.
In this case both pte ptl and pud ptl points to mm->page_table_lock.

Fixes: c49dd3401802 ("mm: speedup mremap on 1GB or larger regions")
Fixes: 2c91bd4a4e2e ("mm: speed up mremap by 20x on large regions")
Link: https://lore.kernel.org/linux-mm/CAHk-=wgXVR04eBNtxQfevontWnP6FDm+oj5vauQXP3S-huwbPw@mail.gmail.com
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Change:
* Check for split PTL before taking pte ptl lock.

 mm/mremap.c | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/mm/mremap.c b/mm/mremap.c
index 8967a3707332..2fa3e0cb6176 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -224,7 +224,7 @@ static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
 {
-	spinlock_t *old_ptl, *new_ptl;
+	spinlock_t *pte_ptl, *old_ptl, *new_ptl;
 	struct mm_struct *mm = vma->vm_mm;
 	pmd_t pmd;
 
@@ -254,6 +254,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	if (WARN_ON_ONCE(!pmd_none(*new_pmd)))
 		return false;
 
+
 	/*
 	 * We don't have to worry about the ordering of src and dst
 	 * ptlocks because exclusive mmap_lock prevents deadlock.
@@ -263,6 +264,10 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	if (new_ptl != old_ptl)
 		spin_lock_nested(new_ptl, SINGLE_DEPTH_NESTING);
 
+	if (pmd_none(*old_pmd))
+		goto unlock_out;
+
+	pte_ptl = pte_lockptr(mm, old_pmd);
 	/* Clear the pmd */
 	pmd = *old_pmd;
 	pmd_clear(old_pmd);
@@ -270,9 +275,20 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	 * flush the TLB before we move the page table entries.
 	 */
 	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
+
+	/*
+	 * Take the ptl here so that we wait for parallel page table walk
+	 * and operations (eg: pageout)using old addr to finish.
+	 */
+	if (USE_SPLIT_PTE_PTLOCKS)
+		spin_lock(pte_ptl);
+
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
+	if (USE_SPLIT_PTE_PTLOCKS)
+		spin_unlock(pte_ptl);
 
+unlock_out:
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
@@ -296,6 +312,14 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	struct mm_struct *mm = vma->vm_mm;
 	pud_t pud;
 
+	/*
+	 * Disable MOVE_PUD until we get the pageout done with all
+	 * higher level page table locks held. With SPLIT_PTE_PTLOCKS
+	 * we use mm->page_table_lock for both pte ptl and pud ptl
+	 */
+	if (USE_SPLIT_PTE_PTLOCKS)
+		return false;
+
 	/*
 	 * The destination pud shouldn't be established, free_pgtables()
 	 * should have released it.
-- 
2.31.1

