Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436B38E2F5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 11:07:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FpWYv56jQz3dvp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 May 2021 19:07:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=dPrXW/dK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=dPrXW/dK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FpWVK3Qfcz3cTD
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 May 2021 19:04:09 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 14O8YV1T064126; Mon, 24 May 2021 05:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=OdNqMsOaiHdmo/+hRsPZcjc/Fe5oYpw5nSYSgnXGNG0=;
 b=dPrXW/dKgJ+J5qHGaCU2ij3rGQqeQ6cRDECyfseW4FtUjsYaUx09ViwcKxpkoP67VIcX
 yLVM5fsTHKBgAdaS2k5mA9E3zUVuqFfPnGIBGKkiyCvUjeU7GZJbTuhr9ZNwK3KhQ/mJ
 WfhafV0RHQWYO6p0JTJ9STEOx7KrzaiC7MUSRwmsbtjHH504soBQuJIn3qOdkTeoMlTr
 BJRrFbsjZA3oQk3GYa8MzQwCGzM0EWNV8GGR2JocSc6EA7A7DS/ML8scVLhXUhFFx8d3
 JAtReaXFWVQCRQ2sLqLB+MqqBkCqyeAs1mOhs3VbrFaGQrkiprG7CvQzagB/r/Rmq02g FQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r8rm8kgc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:54 -0400
Received: from m0098396.ppops.net (m0098396.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 14O8YnU2064634;
 Mon, 24 May 2021 05:01:53 -0400
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 38r8rm8kfj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 05:01:53 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.43/8.16.0.43) with SMTP id 14O8nECQ028763;
 Mon, 24 May 2021 09:01:52 GMT
Received: from b01cxnp23033.gho.pok.ibm.com (b01cxnp23033.gho.pok.ibm.com
 [9.57.198.28]) by ppma04dal.us.ibm.com with ESMTP id 38psk8s75m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 May 2021 09:01:52 +0000
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp23033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 14O91p4N38732170
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 May 2021 09:01:51 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4A952AE06A;
 Mon, 24 May 2021 09:01:51 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6DC50AE063;
 Mon, 24 May 2021 09:01:48 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.1.240])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 24 May 2021 09:01:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v6 07/11] mm/mremap: Use range flush that does TLB and page
 walk cache flush
Date: Mon, 24 May 2021 14:31:10 +0530
Message-Id: <20210524090114.63446-8-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
References: <20210524090114.63446-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 20QG0039HbcsWg3xkLQPMf2wYTZ_FVnq
X-Proofpoint-ORIG-GUID: KxHECBr11zs3Ij83GYfXfLmx1Mlh1Z_L
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391, 18.0.761
 definitions=2021-05-24_04:2021-05-20,
 2021-05-24 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0
 mlxlogscore=999 phishscore=0 lowpriorityscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104190000 definitions=main-2105240067
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

Some architectures do have the concept of page walk cache which need
to be flush when updating higher levels of page tables. A fast mremap
that involves moving page table pages instead of copying pte entries
should flush page walk cache since the old translation cache is no more
valid.

Add new helper flush_pte_tlb_pwc_range() which invalidates both TLB and
page walk cache where TLB entries are mapped with page size PAGE_SIZE.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/tlbflush.h | 10 ++++++++++
 mm/mremap.c                                   | 14 ++++++++++++--
 2 files changed, 22 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/tlbflush.h b/arch/powerpc/include/asm/book3s/64/tlbflush.h
index f9f8a3a264f7..e84fee9db106 100644
--- a/arch/powerpc/include/asm/book3s/64/tlbflush.h
+++ b/arch/powerpc/include/asm/book3s/64/tlbflush.h
@@ -80,6 +80,16 @@ static inline void flush_hugetlb_tlb_range(struct vm_area_struct *vma,
 	return flush_hugetlb_tlb_pwc_range(vma, start, end, false);
 }
 
+#define flush_pte_tlb_pwc_range flush_tlb_pwc_range
+static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start, unsigned long end)
+{
+	if (radix_enabled())
+		return radix__flush_tlb_pwc_range_psize(vma->vm_mm, start,
+							end, mmu_virtual_psize, true);
+	return hash__flush_tlb_range(vma, start, end);
+}
+
 static inline void flush_tlb_range(struct vm_area_struct *vma,
 				   unsigned long start, unsigned long end)
 {
diff --git a/mm/mremap.c b/mm/mremap.c
index 7372c8c0cf26..000a71917557 100644
--- a/mm/mremap.c
+++ b/mm/mremap.c
@@ -210,6 +210,16 @@ static void move_ptes(struct vm_area_struct *vma, pmd_t *old_pmd,
 		drop_rmap_locks(vma);
 }
 
+#ifndef flush_pte_tlb_pwc_range
+#define flush_pte_tlb_pwc_range flush_pte_tlb_pwc_range
+static inline void flush_pte_tlb_pwc_range(struct vm_area_struct *vma,
+					   unsigned long start,
+					   unsigned long end)
+{
+	return flush_tlb_range(vma, start, end);
+}
+#endif
+
 #ifdef CONFIG_HAVE_MOVE_PMD
 static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 		  unsigned long new_addr, pmd_t *old_pmd, pmd_t *new_pmd)
@@ -260,7 +270,7 @@ static bool move_normal_pmd(struct vm_area_struct *vma, unsigned long old_addr,
 	VM_BUG_ON(!pmd_none(*new_pmd));
 	pmd_populate(mm, new_pmd, pmd_pgtable(pmd));
 
-	flush_tlb_range(vma, old_addr, old_addr + PMD_SIZE);
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PMD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
@@ -307,7 +317,7 @@ static bool move_normal_pud(struct vm_area_struct *vma, unsigned long old_addr,
 	VM_BUG_ON(!pud_none(*new_pud));
 
 	pud_populate(mm, new_pud, (pmd_t *)pud_page_vaddr(pud));
-	flush_tlb_range(vma, old_addr, old_addr + PUD_SIZE);
+	flush_pte_tlb_pwc_range(vma, old_addr, old_addr + PUD_SIZE);
 	if (new_ptl != old_ptl)
 		spin_unlock(new_ptl);
 	spin_unlock(old_ptl);
-- 
2.31.1

