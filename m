Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C15039D47D
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 07:53:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Fz2bP2wn4z3076
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Jun 2021 15:53:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=C8A6hWkv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0b-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=C8A6hWkv; dkim-atps=neutral
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Fz2ZR1yyQz2yWT
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Jun 2021 15:52:14 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 1575WmkR167564; Mon, 7 Jun 2021 01:52:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=w0mfBBWi73Rm7IFACUNT0xGebGgWbrbze/KCG5JeYI8=;
 b=C8A6hWkvSA31uIKCo/rrvA1fE+nj9I1Ni32JcPqogPcvIa4KcanE2r98keutMJ/bPMEK
 bdPsSDi9jxqlCKtwwjJdu1dEejvm/6IUZiZr0IjWa8j/amij9EPkCOkYeB9+X5OQsWFl
 V7YKdoaNAdIy5Nj6tF/dibvSDNMRdELc7JfnjQlHxj+RG3YfURUFNd/wgv5kGbzmRRzY
 8iNK1NajQEH83rzmKA33U4FPpimuWlTCXwl3S+Jqsgb7tPGa35ZFcFAzdzghYsg4asLk
 VhPPOocbo0C/nsBsTwoUfRqUdRzF5CW9d8KDUXOtarKO9Jm+Phl05Ok9s+91OJTSH0Do vg== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391d4tgqge-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:04 -0400
Received: from m0098417.ppops.net (m0098417.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1575XTBN170518;
 Mon, 7 Jun 2021 01:52:04 -0400
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0a-001b2d01.pphosted.com with ESMTP id 391d4tgqg7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 01:52:04 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1575h3jt009714;
 Mon, 7 Jun 2021 05:52:03 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma03dal.us.ibm.com with ESMTP id 3900w97sxy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 07 Jun 2021 05:52:03 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1575q2pa14024980
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 7 Jun 2021 05:52:02 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D08F928059;
 Mon,  7 Jun 2021 05:52:02 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 40D4128058;
 Mon,  7 Jun 2021 05:51:59 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.32.129])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  7 Jun 2021 05:51:58 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v7 02/11] mm/mremap: Fix race between MOVE_PUD mremap and
 pageout
Date: Mon,  7 Jun 2021 11:21:22 +0530
Message-Id: <20210607055131.156184-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
References: <20210607055131.156184-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: GjBaUHTQW0YE-zmAX2GzH1sRgonk2sMT
X-Proofpoint-GUID: lFQXGx6Mbmmmn8pLpZKryU-NEWPRTjHW
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-06-07_03:2021-06-04,
 2021-06-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015 suspectscore=0
 adultscore=0 phishscore=0 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2106070042
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
lock(pud_ptl)
pud = *old_pud
pud_clear(old_pud)
flush_tlb_range(old_addr)

*new_pud = pud
									*new_addr = 10; and fills
									TLB with new addr
									and old pfn

unlock(pud_ptl)
				ptep_clear_flush()
				old pfn is free.
									Stale TLB entry
Fix this race by holding pud lock in pageout.

Fixes: c49dd3401802 ("mm: speedup mremap on 1GB or larger regions")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 include/linux/rmap.h |  4 ++++
 mm/page_vma_mapped.c | 13 ++++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/include/linux/rmap.h b/include/linux/rmap.h
index 272ab0c2b60b..491c65ce1d46 100644
--- a/include/linux/rmap.h
+++ b/include/linux/rmap.h
@@ -209,6 +209,7 @@ struct page_vma_mapped_walk {
 	pte_t *pte;
 	spinlock_t *pte_ptl;
 	spinlock_t *pmd_ptl;
+	spinlock_t *pud_ptl;
 	unsigned int flags;
 };
 
@@ -221,6 +222,9 @@ static inline void page_vma_mapped_walk_done(struct page_vma_mapped_walk *pvmw)
 		spin_unlock(pvmw->pte_ptl);
 	if (pvmw->pmd_ptl)
 		spin_unlock(pvmw->pmd_ptl);
+	if (pvmw->pud_ptl)
+		spin_unlock(pvmw->pud_ptl);
+
 }
 
 bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw);
diff --git a/mm/page_vma_mapped.c b/mm/page_vma_mapped.c
index 87a2c94c7e27..c913bc34b1d3 100644
--- a/mm/page_vma_mapped.c
+++ b/mm/page_vma_mapped.c
@@ -180,8 +180,11 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 	pud = pud_offset(p4d, pvmw->address);
 	if (!pud_present(*pud))
 		return false;
+
+	pvmw->pud_ptl = pud_lock(mm, pud);
 	pvmw->pmd = pmd_offset(pud, pvmw->address);
-	pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
+	if (USE_SPLIT_PMD_PTLOCKS)
+		pvmw->pmd_ptl = pmd_lock(mm, pvmw->pmd);
 	/*
 	 * Make sure the pmd value isn't cached in a register by the
 	 * compiler and used as a stale value after we've observed a
@@ -235,8 +238,12 @@ bool page_vma_mapped_walk(struct page_vma_mapped_walk *pvmw)
 					spin_unlock(pvmw->pte_ptl);
 					pvmw->pte_ptl = NULL;
 				}
-				spin_unlock(pvmw->pmd_ptl);
-				pvmw->pmd_ptl = NULL;
+				if (pvmw->pmd_ptl) {
+					spin_unlock(pvmw->pmd_ptl);
+					pvmw->pmd_ptl = NULL;
+				}
+				spin_unlock(pvmw->pud_ptl);
+				pvmw->pud_ptl = NULL;
 				goto restart;
 			} else {
 				pvmw->pte++;
-- 
2.31.1

