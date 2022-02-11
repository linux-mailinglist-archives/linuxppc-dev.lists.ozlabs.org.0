Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D1EC4B1E90
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 07:33:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Jw3hy1BcRz3cQ8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Feb 2022 17:33:22 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=R/8sIOE3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=R/8sIOE3; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jw3hF36vhz2xF9
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 11 Feb 2022 17:32:44 +1100 (AEDT)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 21B3MEjK000415; 
 Fri, 11 Feb 2022 06:32:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=jXKheFElz2tshFDk5RL8mCXwO8Jt4F7/tSt2PA8b5s4=;
 b=R/8sIOE3QknCiNC9lY3Q7Qx+6gHrd0SD9tzWJJzPzEVD8trU0Hee58z88XFofvl6BW0S
 qciis18E1onHs/4dBgxBE9yZdP2IEx6ud/nVwFIIeLP/PjbNkLM9MlXSKR7EEN/gD5hX
 9FS4HQocqbJ1MKT778XlO3U8WY5ERtqXc9qMMXn/BtfSlgHcBshZMOXykqoOf3L8Dkc3
 /VbSBbjz+qOMjGHLhL8Rbra9995BcW90MCx+CcuHyyz3S1lAYJ8Txxe7Q84P+NDeKohb
 JokSsOZaOAeumQz20ks/FpdxB7eeruEmLAbdZ7nlyZz5Y8ihd1BKUcFc04FwABQ83Tk0 TA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e5ekfkmpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:32:35 +0000
Received: from m0098420.ppops.net (m0098420.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 21B6SkQB017507;
 Fri, 11 Feb 2022 06:32:34 GMT
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3e5ekfkmpr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:32:34 +0000
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 21B6WH8Y014906;
 Fri, 11 Feb 2022 06:32:33 GMT
Received: from b03cxnp07027.gho.boulder.ibm.com
 (b03cxnp07027.gho.boulder.ibm.com [9.17.130.14])
 by ppma03dal.us.ibm.com with ESMTP id 3e1gvd3ubw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 11 Feb 2022 06:32:33 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp07027.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 21B6WWS930671210
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 11 Feb 2022 06:32:32 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C530BC605D;
 Fri, 11 Feb 2022 06:32:32 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E6004C6059;
 Fri, 11 Feb 2022 06:32:29 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.43.41.36])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Fri, 11 Feb 2022 06:32:29 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2] mm/hugetlb: Fix kernel crash with hugetlb mremap
Date: Fri, 11 Feb 2022 12:02:21 +0530
Message-Id: <20220211063221.99293-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: M1yUpzTDts4qnUh1Jw9q69F_vffwFjPG
X-Proofpoint-GUID: os46sPutW89i6yH1VFuTiTong4Yq63rq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-02-11_02,2022-02-09_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1011 priorityscore=1501 lowpriorityscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2202110036
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
Cc: Mina Almasry <almasrymina@google.com>, stable@vger.kernel.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
 Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This fixes the below crash:

kernel BUG at include/linux/mm.h:2373!
cpu 0x5d: Vector: 700 (Program Check) at [c00000003c6e76e0]
    pc: c000000000581a54: pmd_to_page+0x54/0x80
    lr: c00000000058d184: move_hugetlb_page_tables+0x4e4/0x5b0
    sp: c00000003c6e7980
   msr: 9000000000029033
  current = 0xc00000003bd8d980
  paca    = 0xc000200fff610100   irqmask: 0x03   irq_happened: 0x01
    pid   = 9349, comm = hugepage-mremap
kernel BUG at include/linux/mm.h:2373!
[link register   ] c00000000058d184 move_hugetlb_page_tables+0x4e4/0x5b0
[c00000003c6e7980] c00000000058cecc move_hugetlb_page_tables+0x22c/0x5b0 (unreliable)
[c00000003c6e7a90] c00000000053b78c move_page_tables+0xdbc/0x1010
[c00000003c6e7bd0] c00000000053bc34 move_vma+0x254/0x5f0
[c00000003c6e7c90] c00000000053c790 sys_mremap+0x7c0/0x900
[c00000003c6e7db0] c00000000002c450 system_call_exception+0x160/0x2c0

the kernel can't use huge_pte_offset before it set the pte entry because a page table
lookup check for huge PTE bit in the page table to differentiate between a
huge pte entry and a pointer to pte page. A huge_pte_alloc won't mark the
page table entry huge and hence kernel should not use huge_pte_offset after
a huge_pte_alloc.

Fixes: 550a7d60bd5e ("mm, hugepages: add mremap() support for hugepage backed vma")

Cc: stable@vger.kernel.org
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
Reviewed-by: Mina Almasry <almasrymina@google.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/hugetlb.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

Changes from v1:
* Add Fixes: tag
* Add Reviewed-by: 

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 61895cc01d09..e57650a9404f 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -4851,14 +4851,13 @@ int copy_hugetlb_page_range(struct mm_struct *dst, struct mm_struct *src,
 }
 
 static void move_huge_pte(struct vm_area_struct *vma, unsigned long old_addr,
-			  unsigned long new_addr, pte_t *src_pte)
+			  unsigned long new_addr, pte_t *src_pte, pte_t *dst_pte)
 {
 	struct hstate *h = hstate_vma(vma);
 	struct mm_struct *mm = vma->vm_mm;
-	pte_t *dst_pte, pte;
 	spinlock_t *src_ptl, *dst_ptl;
+	pte_t pte;
 
-	dst_pte = huge_pte_offset(mm, new_addr, huge_page_size(h));
 	dst_ptl = huge_pte_lock(h, mm, dst_pte);
 	src_ptl = huge_pte_lockptr(h, mm, src_pte);
 
@@ -4917,7 +4916,7 @@ int move_hugetlb_page_tables(struct vm_area_struct *vma,
 		if (!dst_pte)
 			break;
 
-		move_huge_pte(vma, old_addr, new_addr, src_pte);
+		move_huge_pte(vma, old_addr, new_addr, src_pte, dst_pte);
 	}
 	flush_tlb_range(vma, old_end - len, old_end);
 	mmu_notifier_invalidate_range_end(&range);
-- 
2.34.1

