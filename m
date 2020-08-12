Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CEA82425BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 09:00:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRLFC3fQzzDqXr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 17:00:31 +1000 (AEST)
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
 header.s=pp1 header.b=eIzAxETK; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BRKgx4dRwzDqTW
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 16:35:09 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07C6W9Ka192241; Wed, 12 Aug 2020 02:34:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=hxqRq4AhklRfi6JquNzN/5s6VlMNSeyU4S+2TsX6+/o=;
 b=eIzAxETKA2q/wEiD1SNSGTVb4jAiIFv2yQVTxfjnHFjhkfPXQa9D3mvl24iged7zurVG
 nsNg6vdweLLYbouY0V83xv5548lX2sG3L62YNbB1MLo+iE4Xi0h6vxcU9NzVzVVM6Jcn
 mt3bOaJXtg3ZLOywcF9Hh9LFLstDCOc67mrdCx1s+v+4LfvMIadpij4Tu5fHwNQkCIKp
 mm94gmoVUOkQ++oIooQM6flan8z2yp+ZKGHqceU+h/KuKkB9y3ljALv1lJ9dT3LHmEZQ
 gE29mzkgVtOmvGNZjqD6LbuBR9yl4JU1TBXPB5nJQhELme866uEFmZt8yba4Vfr1GCzh DA== 
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0b-001b2d01.pphosted.com with ESMTP id 32v7utv6sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 02:34:59 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07C6VFp8027950;
 Wed, 12 Aug 2020 06:34:58 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma02dal.us.ibm.com with ESMTP id 32skp9f8qh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 12 Aug 2020 06:34:58 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07C6Yr0o49938924
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 12 Aug 2020 06:34:53 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5799913604F;
 Wed, 12 Aug 2020 06:34:57 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E3DA1136053;
 Wed, 12 Aug 2020 06:34:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.71.109])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Wed, 12 Aug 2020 06:34:54 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
Date: Wed, 12 Aug 2020 12:03:56 +0530
Message-Id: <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
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
 priorityscore=1501
 suspectscore=0 malwarescore=0 adultscore=0 phishscore=0 impostorscore=0
 mlxlogscore=616 lowpriorityscore=0 clxscore=1015 mlxscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
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

The seems to be missing quite a lot of details w.r.t allocating
the correct pgtable_t page (huge_pte_alloc()), holding the right
lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.

ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
Hence disable the test on ppc64.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 mm/debug_vm_pgtable.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index 529892b9be2f..3e112d0ba1b2 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -800,6 +800,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 }
 
+#ifndef CONFIG_PPC_BOOK3S_64
 static void __init hugetlb_advanced_tests(struct mm_struct *mm,
 					  struct vm_area_struct *vma,
 					  pte_t *ptep, unsigned long pfn,
@@ -842,6 +843,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
 	pte = huge_ptep_get(ptep);
 	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
 }
+#endif
 #else  /* !CONFIG_HUGETLB_PAGE */
 static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
 static void __init hugetlb_advanced_tests(struct mm_struct *mm,
@@ -1053,7 +1055,9 @@ static int __init debug_vm_pgtable(void)
 	pud_populate_tests(mm, pudp, saved_pmdp);
 	spin_unlock(ptl);
 
-	//hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+#ifndef CONFIG_PPC_BOOK3S_64
+	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+#endif
 
 	spin_lock(&mm->page_table_lock);
 	p4d_clear_tests(mm, p4dp);
-- 
2.26.2

