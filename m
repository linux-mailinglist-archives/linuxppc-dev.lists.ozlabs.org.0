Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92AED2425AC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 08:56:58 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRL935TfFzDqXX
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 16:56:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=i+KfGCNE; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKgp4VfkzDqSL
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:35:02 +1000 (AEST)
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6W7p6022384; Wed, 12 Aug 2020 02:34:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=cJKoBBeoeWgFe0pKzemrKhEmtIMXsehzlPaHAlaxBbA=;
 b=i+KfGCNEJl7XSJt0jSWn5wwUYw3NmQephvuK54W8RBmEynYva0wR9klbeJ2nCUfLgDo0
 jhIEgzZvR1IgZOnP5Soo0+25dwTehSv6VsurDzcd53hRgyI5gwY+1bgHQXKLKhQCDcQy
 SkXbaoFHcNynhJzHWHTHU4qaS/5u5R5OTQzZqqGOa9t5x9wArsiAE0MEDDq9k3cAbgLP
 96A1ZoqoGyKj1/5AbyHL0U1HVir4SD1AoWky5xoo3MIMbOKnMUaYlO4GUs9+kMP9AcwZ
 vDtmQrBRdKU98XBItLUOdCH4kENsG8BhqHSfq22zK3aG1QrhhOnu37w6BpGNLo4xT9FW 9A== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32v7uyvah2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:34:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6FtWF023219;
 Wed, 12 Aug 2020 06:34:52 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02wdc.us.ibm.com with ESMTP id 32skp97cf0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:34:52 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6Ylo364553322
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:34:47 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61039136053;
 Wed, 12 Aug 2020 06:34:51 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 28A0C136055;
 Wed, 12 Aug 2020 06:34:49 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.109])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:34:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 12/16] debug_vm_pgtable/locks: Take correct page table lock
Date: Wed, 12 Aug 2020 12:03:54 +0530
Message-Id: <20200812063358.369514-12-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-11_19:2020-08-11,
 2020-08-11 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 suspectscore=2 mlxscore=0
 impostorscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 phishscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008120044
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
Cc: linuxppc-dev@lists.ozlabs.org,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Make sure we call pte accessors with correct lock held.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 34 ++++++++++++++++++++--------------
 1 file changed, 20 insertions(+), 14 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 90e9c2d3a092..061c19bba7f0 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -1027,33 +1027,39 @@ static int __init debug_vm_pgtable(void)
 	pmd_thp_tests(pmd_aligned, prot);
 	pud_thp_tests(pud_aligned, prot);
 
+	hugetlb_basic_tests(pte_aligned, prot);
+
 	/*
 	 * Page table modifying tests
 	 */
-	pte_clear_tests(mm, ptep, vaddr);
-	pmd_clear_tests(mm, pmdp);
-	pud_clear_tests(mm, pudp);
-	p4d_clear_tests(mm, p4dp);
-	pgd_clear_tests(mm, pgdp);
 
 	ptep = pte_alloc_map_lock(mm, pmdp, vaddr, &ptl);
+	pte_clear_tests(mm, ptep, vaddr);
 	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
-	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
-	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
-	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
-
+	pte_unmap_unlock(ptep, ptl);
 
+	ptl = pmd_lock(mm, pmdp);
+	pmd_clear_tests(mm, pmdp);
+	pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
 	pmd_huge_tests(pmdp, pmd_aligned, prot);
+	pmd_populate_tests(mm, pmdp, saved_ptep);
+	spin_unlock(ptl);
+
+	ptl = pud_lock(mm, pudp);
+	pud_clear_tests(mm, pudp);
+	pud_advanced_tests(mm, vma, pudp, pud_aligned, vaddr, prot);
 	pud_huge_tests(pudp, pud_aligned, prot);
+	pud_populate_tests(mm, pudp, saved_pmdp);
+	spin_unlock(ptl);
 
-	pte_unmap_unlock(ptep, ptl);
+	//hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
 
-	pmd_populate_tests(mm, pmdp, saved_ptep);
-	pud_populate_tests(mm, pudp, saved_pmdp);
+	spin_lock(&mm->page_table_lock);
+	p4d_clear_tests(mm, p4dp);
+	pgd_clear_tests(mm, pgdp);
 	p4d_populate_tests(mm, p4dp, saved_pudp);
 	pgd_populate_tests(mm, pgdp, saved_p4dp);
-
-	hugetlb_basic_tests(pte_aligned, prot);
+	spin_unlock(&mm->page_table_lock);
 
 	p4d_free(mm, saved_p4dp);
 	pud_free(mm, saved_pudp);
-- 
2.26.2

