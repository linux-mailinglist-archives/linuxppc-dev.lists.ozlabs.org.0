Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4105835F05D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 11:02:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FKxMH1H8kz3d6M
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Apr 2021 19:02:51 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=nLP3Bw3S;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=nLP3Bw3S; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FKxHr1RXRz3btv
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Apr 2021 18:59:52 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 13E8XrPP162033; Wed, 14 Apr 2021 04:59:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=9laDIapbIdWfXa9PibFliYJKHzFFqhJu+HBMQeNEc48=;
 b=nLP3Bw3SKyzySW3VML1/xG0G/Bjy9QfMaEB1g6issy/iAdM8c/rgsIl3K7Wre8FuXWKk
 VNJn0FJfPHb/W9j2IRmgRfgvU7B9TuWKnF+Oiy1H/PdBFmez7uzeKyvWzYR868vewsMn
 twxBdp6O10MKnFuB4eJWpfVg53AJ/UAMVgNx45PiTIdRqfLrlzLQOsrcf4U8viJRk/rl
 jrxqweY5K+6+Gr7ceBYFcF4H+33SfSlBw1ZExeVDAl+Z7ItqyB4wspP8prqnZcjFFysW
 qxGp3DXB2xn7j4j6seqVRfd89tbRZ1hsLRwCSN7V1fSsOQUTzDkTyK1nQFxWBT+Bibr7 QQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wpaut90k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 04:59:46 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 13E8Yjfg164415;
 Wed, 14 Apr 2021 04:59:46 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 37wpaut902-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 04:59:46 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 13E8qn2r002781;
 Wed, 14 Apr 2021 08:59:44 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma01wdc.us.ibm.com with ESMTP id 37u3n9fs67-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 14 Apr 2021 08:59:44 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 13E8xi5827525540
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 14 Apr 2021 08:59:44 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7D905AE05C;
 Wed, 14 Apr 2021 08:59:44 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EACA9AE063;
 Wed, 14 Apr 2021 08:59:41 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.77.205.193])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 14 Apr 2021 08:59:41 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 6/9] mm/mremap: Use range flush that does TLB and page walk
 cache flush
Date: Wed, 14 Apr 2021 14:29:12 +0530
Message-Id: <20210414085915.301189-7-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
References: <20210414085915.301189-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bhVOrPWsYVYyIifBxo4rool2Z8Abq2GP
X-Proofpoint-GUID: 8pOjb30t19vsRaMoBPV5HHIZMgHrcdFU
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-04-14_03:2021-04-14,
 2021-04-14 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 impostorscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140060
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
Cc: kaleshsingh@google.com, npiggin@gmail.com,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, joel@joelfernandes.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some architectures do have the concept of page walk cache which need
to be flush when updating higher levels of page tables. A fast mremap
that involves moving page table pages instead of copying pte entries
should flush page walk cache since the old translation cache is no more
valid.

Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
page walk cache where TLB entries are mapped with page size PAGE_SIZE.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 11 +++++++++++
 mm/mremap.c                                   | 15 +++++++++++++--
 2 files changed, 24 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index f9f8a3a264f7..c236b66f490b 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -80,6 +80,17 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
 }
 
+#define flush_pte_tlb_pwc_range flush_tlb_pwc_range
+static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start, unsigned long end,
+					   bool also_pwc)
+{
+	if (radix_enabled())
+		return radix__flush_tlb_pwc_range_psize(vma->vm_mm, start,
+							end, mmu_virtual_psize, also_pwc);
+	return hash__flush_tlb_range(vma, start, end);
+}
+
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 				   unsigned long start, unsigned long end)
 {
diff --git a/mm/mremap.c b/mm/mremap.c
index 574287f9bb39..0e7b11daafee 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -210,6 +210,17 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
+#ifndef flush_pte_tlb_pwc_range
+#define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
+static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end,
+					   bool also_pwc)
+{
+	return flush_tlb_range(vma, start, end);
+}
+#endif
+
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
@@ -260,7 +271,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, (pgtable_t)pmd_page_vaddr(pmd));
 
-	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE, true);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
@@ -307,7 +318,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	VM_BUG_ON(!pud_none(*new_pud));
 
 	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
-	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE, true);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
-- 
2.30.2

