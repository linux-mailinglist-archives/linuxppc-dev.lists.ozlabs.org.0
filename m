Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5EA25AAF1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 14:14:43 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhND06BWCzDqwH
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 22:14:40 +1000 (AEST)
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
 header.s=pp1 header.b=SU3joZb8; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhMbS6htYzDqsH
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 21:46:28 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 082BVaMj075811; Wed, 2 Sep 2020 07:46:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=en0XsHWuI6UOt6cyyh+V7Jw5iVGs31evTM1mBp9AH6o=;
 b=SU3joZb8KgpNwPRd5vU0BILr01ceEQ3zyW7+d9c7sKuoXewVopVWPcZPp8E3wWxBnKge
 4njjpAkhcGlMB/YVNccIgNy0l6RECgd0JVyqKhm+4BYIixwkUwhTqitLCyGiow5AUdl/
 ojJf1AaQZShnKoUJpqgFVZ874b0yQEv7VhIPM2618NBCZFDIOHTobvPAysdWkj2aPu7x
 ImE/tns8Mf0UOdyn7M9fi14kGd3Nh6D5mGlTTLcYPw0idK1qMrm0GdoEuzVSpcEZOKhU
 xZOtQZmgE/xKTu1Qe4fZQOoI2bv8RtjZW6K8lVRB9HwddTWRXVPj6ziSh8F31N+ZWdo4 UQ== 
Received: from ppma04dal.us.ibm.com (7a.29.35a9.ip4.static.sl-reverse.com
 [169.53.41.122])
 by mx0a-001b2d01.pphosted.com with ESMTP id 33aaae0w1j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 07:46:20 -0400
Received: from pps.filterd (ppma04dal.us.ibm.com [127.0.0.1])
 by ppma04dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 082BfxJi002678;
 Wed, 2 Sep 2020 11:46:19 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma04dal.us.ibm.com with ESMTP id 339tmuy79s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 02 Sep 2020 11:46:19 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 082BkEOD24314262
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 2 Sep 2020 11:46:14 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BFE256E04C;
 Wed,  2 Sep 2020 11:46:17 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 34AD36E059;
 Wed,  2 Sep 2020 11:46:15 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.61.124])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed,  2 Sep 2020 11:46:14 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v4 13/13] mm/debug_vm_pgtable: Avoid none pte in pte_clear_test
Date: Wed,  2 Sep 2020 17:16:01 +0530
Message-Id: <20200902114601.183715-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-09-02_03:2020-09-02,
 2020-09-02 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 mlxlogscore=871 mlxscore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009020105
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

pte_clear_tests operate on an existing pte entry. Make sure that
is not a none pte entry.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 9afa1354326b..c36530c69e33 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -542,9 +542,10 @@ static void __init pgd_populate_tests(struct mm_struct *mm, pgd_t *pgdp,
 #endif /* PAGETABLE_P4D_FOLDED */
 
 static void __init pte_clear_tests(struct mm_struct *mm, pte_t *ptep,
-				   unsigned long vaddr)
+				   unsigned long pfn, unsigned long vaddr,
+				   pgprot_t prot)
 {
-	pte_t pte = ptep_get(ptep);
+	pte_t pte = pfn_pte(pfn, prot);
 
 	pr_debug("Validating PTE clear\n");
 	pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
@@ -1049,7 +1050,7 @@ static int __init debug_vm_pgtable(void)
 
 	ptl = pte_lockptr(mm, pmdp);
 	spin_lock(ptl);
-	pte_clear_tests(mm, ptep, vaddr);
+	pte_clear_tests(mm, ptep, pte_aligned, vaddr, prot);
 	pte_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
 	pte_unmap_unlock(ptep, ptl);
 
-- 
2.26.2

