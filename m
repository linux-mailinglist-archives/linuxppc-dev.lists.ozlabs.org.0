Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3FE5BE8E
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 16:42:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45cqpq56xlzDqXl
	for <lists+linuxppc-dev@lfdr.de>; Tue,  2 Jul 2019 00:42:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45cqf06zrgzDqSK
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  2 Jul 2019 00:35:04 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x61ERV1x057817
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 1 Jul 2019 10:35:01 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tfjqddaq7-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 01 Jul 2019 10:35:01 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Mon, 1 Jul 2019 15:35:00 +0100
Received: from b01cxnp22033.gho.pok.ibm.com (9.57.198.23)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Mon, 1 Jul 2019 15:34:57 +0100
Received: from b01ledav005.gho.pok.ibm.com (b01ledav005.gho.pok.ibm.com
 [9.57.199.110])
 by b01cxnp22033.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x61EYuj839453010
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 1 Jul 2019 14:34:56 GMT
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 25D18AE06F;
 Mon,  1 Jul 2019 14:34:56 +0000 (GMT)
Received: from b01ledav005.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0F50EAE066;
 Mon,  1 Jul 2019 14:34:54 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.81.231])
 by b01ledav005.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  1 Jul 2019 14:34:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH v2 2/2] powerpc/mm/radix: Use the right page size for vmemmap
 mapping
Date: Mon,  1 Jul 2019 20:04:42 +0530
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190701143442.17174-1-aneesh.kumar@linux.ibm.com>
References: <20190701143442.17174-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19070114-0072-0000-0000-00000443149B
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011360; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01225931; UDB=6.00645358; IPR=6.01007144; 
 MB=3.00027534; MTD=3.00000008; XFM=3.00000015; UTC=2019-07-01 14:34:58
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19070114-0073-0000-0000-00004CB34B71
Message-Id: <20190701143442.17174-2-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-01_09:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=994 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907010179
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
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

We use mmu_vmemmap_psize to find the page size for mapping the vmmemap area.
With radix translation, we are suboptimally setting this value to PAGE_SIZE.

We do check for 2M page size support and update mmu_vmemap_psize to use
hugepage size but we suboptimally reset the value to PAGE_SIZE in
radix__early_init_mmu(). This resulted in always mapping vmemmap area with
64K page size.

Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early init routines")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 273ae66a9a45..8deb432c2975 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -515,14 +515,6 @@ void __init radix__early_init_devtree(void)
 	mmu_psize_defs[MMU_PAGE_64K].shift = 16;
 	mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
 found:
-#ifdef CONFIG_SPARSEMEM_VMEMMAP
-	if (mmu_psize_defs[MMU_PAGE_2M].shift) {
-		/*
-		 * map vmemmap using 2M if available
-		 */
-		mmu_vmemmap_psize = MMU_PAGE_2M;
-	}
-#endif /* CONFIG_SPARSEMEM_VMEMMAP */
 	return;
 }
 
@@ -587,7 +579,13 @@ void __init radix__early_init_mmu(void)
 
 #ifdef CONFIG_SPARSEMEM_VMEMMAP
 	/* vmemmap mapping */
-	mmu_vmemmap_psize = mmu_virtual_psize;
+	if (mmu_psize_defs[MMU_PAGE_2M].shift) {
+		/*
+		 * map vmemmap using 2M if available
+		 */
+		mmu_vmemmap_psize = MMU_PAGE_2M;
+	} else
+		mmu_vmemmap_psize = mmu_virtual_psize;
 #endif
 	/*
 	 * initialize page table size
-- 
2.21.0

