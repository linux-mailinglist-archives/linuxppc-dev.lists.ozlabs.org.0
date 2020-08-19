Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A86FB249F5F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 15:17:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BWpH45D29zDqwM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Aug 2020 23:17:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256
 header.s=pp1 header.b=UwtZYc1l; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BWnxb1q6SzDqts
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Aug 2020 23:02:26 +1000 (AEST)
Received: from pps.filterd (m0187473.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07JD1o4v060349; Wed, 19 Aug 2020 09:02:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=sBD/drs5dO/E6PFIS8TLGmuHo3QrgKGSpE0KjhYcQ9c=;
 b=UwtZYc1le0iqQmJM/SvKpT7QFR+1FI9xasGhMl/L0l1OMxAlLtz6565yJfC+325neauF
 c+e3T8F8533LlxnVkbwIUdNY5sBRZcdbWobOHJOuGSlavdXO0/2hv4rCNzj0vof2zsCo
 9CyUqxsyRmP1891blDNpghGfGlKf0ve5dZ5f6Efh70mu8BSiWoDXbSCLlvafxNSWIf+Y
 LWHxMJzHdLw/IjMc6gzoRFeLaCDywEHiaSKins0OBk/8QwUkEPQink87KfUtpe52/VJi
 JhnbbTcLoeutgqJVkJ4Jv7/Zg6GmMMuaL0wbg9P5lYyERWj1nqORCt01nNM5/zJuVQ7r 2w== 
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3304ru9ack-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 09:02:03 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JCuHcd006310;
 Wed, 19 Aug 2020 13:01:50 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27]) by ppma02wdc.us.ibm.com with ESMTP id 3304scv01y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 19 Aug 2020 13:01:50 +0000
Received: from b01ledav003.gho.pok.ibm.com (b01ledav003.gho.pok.ibm.com
 [9.57.199.108])
 by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07JD1nUH51052872
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 19 Aug 2020 13:01:49 GMT
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 94141B206B;
 Wed, 19 Aug 2020 13:01:49 +0000 (GMT)
Received: from b01ledav003.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7B94B205F;
 Wed, 19 Aug 2020 13:01:47 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.3.58])
 by b01ledav003.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 19 Aug 2020 13:01:47 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v2 10/13] mm/debug_vm_pgtable/locks: Take correct page table
 lock
Date: Wed, 19 Aug 2020 18:31:04 +0530
Message-Id: <20200819130107.478414-11-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-19_04:2020-08-19,
 2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 suspectscore=2 phishscore=0 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190110
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
index 69fe3cd8126c..8f7a8ccb5a54 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -1024,33 +1024,39 @@ static int __init debug_vm_pgtable(void)
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

