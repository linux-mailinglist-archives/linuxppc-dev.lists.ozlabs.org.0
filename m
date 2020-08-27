Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28B4B254110
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 10:41:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BcbmL2XZNzDqbh
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Aug 2020 18:41:06 +1000 (AEST)
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
 header.s=pp1 header.b=X9QRgmg7; dkim-atps=neutral
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Bcb0K6K1czDqfj
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Aug 2020 18:06:25 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 07R81vrg135802; Thu, 27 Aug 2020 04:05:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=2gZZdbXClohbbaJCVaGBpk7u7Wib3nlBXvGsEOSxe7k=;
 b=X9QRgmg7E+2K3RkiPTGVduiNJKNVah4psQEC2qO678IJBQO9ojNoqRvehAZuRNF0t3dM
 QIuv2cUMG3qGulAwe1qPAxZtXCTbtLhF4CO768e+IeTMWcSA2SJhKs7rNd//+otttA4s
 utd8OztRf0YbdI9gWd4OvG/bXHQeh69c+AV/FYTIugQ4/hOaA8ibXHu32Db4Xo/Gj6Ss
 jlO7Z0LGocNWMfqkk7o6hRmlQJNz2f7e6VC2YY/8yOur9HwRObYnL81ueJUY7Y9DdxW/
 7qomOxiZSyxWsEOisGBOR1jf/chCMNc2J4WSoiOlwWNstz0Skup1Lod2QWwQM8wPVIlS Zg== 
Received: from ppma03dal.us.ibm.com (b.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.11])
 by mx0b-001b2d01.pphosted.com with ESMTP id 33669amv8t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 04:05:55 -0400
Received: from pps.filterd (ppma03dal.us.ibm.com [127.0.0.1])
 by ppma03dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07R81ipo015848;
 Thu, 27 Aug 2020 08:05:55 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma03dal.us.ibm.com with ESMTP id 332utu2bx0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 27 Aug 2020 08:05:55 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 07R85rbp45810088
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 27 Aug 2020 08:05:53 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2EC597805C;
 Thu, 27 Aug 2020 08:05:53 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9E1117805E;
 Thu, 27 Aug 2020 08:05:48 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.102.17.9])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 27 Aug 2020 08:05:48 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linux-mm@kvack.org, akpm@linux-foundation.org
Subject: [PATCH v3 12/13] mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
Date: Thu, 27 Aug 2020 13:34:37 +0530
Message-Id: <20200827080438.315345-13-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
References: <20200827080438.315345-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-08-27_02:2020-08-27,
 2020-08-27 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0
 spamscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 mlxlogscore=660 malwarescore=0 adultscore=0 bulkscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2008270057
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>, Qian Cai <cai@lca.pw>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>,
 Christophe Leroy <christophe.leroy@c-s.fr>, Vineet Gupta <vgupta@synopsys.com>,
 linux-snps-arc@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
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
 mm/debug_vm_pgtable.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index a188b6e4e37e..21329c7d672f 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -813,6 +813,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 }
 
+#ifndef CONFIG_PPC_BOOK3S_64
 static void __init hugetlb_advanced_tests(struct mm_struct *mm,
 					  struct vm_area_struct *vma,
 					  pte_t *ptep, unsigned long pfn,
@@ -855,6 +856,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
 	pte = huge_ptep_get(ptep);
 	WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
 }
+#endif
 #else  /* !CONFIG_HUGETLB_PAGE */
 static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
 static void __init hugetlb_advanced_tests(struct mm_struct *mm,
@@ -1065,7 +1067,9 @@ static int __init debug_vm_pgtable(void)
 	pud_populate_tests(mm, pudp, saved_pmdp);
 	spin_unlock(ptl);
 
+#ifndef CONFIG_PPC_BOOK3S_64
 	hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
+#endif
 
 	spin_lock(&mm->page_table_lock);
 	p4d_clear_tests(mm, p4dp);
-- 
2.26.2

