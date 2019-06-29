Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 128645A978
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 09:41:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45bQYY43tNzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2019 17:41:21 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45bQVT3qZhzDqwl
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 17:38:41 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5T7b8Ef003281
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 03:38:38 -0400
Received: from e16.ny.us.ibm.com (e16.ny.us.ibm.com [129.33.205.206])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2te3a70jnv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 29 Jun 2019 03:38:38 -0400
Received: from localhost
 by e16.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@lists.ozlabs.org> from <aneesh.kumar@linux.ibm.com>;
 Sat, 29 Jun 2019 08:38:37 +0100
Received: from b01cxnp22035.gho.pok.ibm.com (9.57.198.25)
 by e16.ny.us.ibm.com (146.89.104.203) with IBM ESMTP SMTP Gateway: Authorized
 Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Sat, 29 Jun 2019 08:38:34 +0100
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com
 [9.57.199.111])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5T7cX3q54067496
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 29 Jun 2019 07:38:33 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7DF5AC060;
 Sat, 29 Jun 2019 07:38:33 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 9703EAC05E;
 Sat, 29 Jun 2019 07:38:31 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.87.55])
 by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
 Sat, 29 Jun 2019 07:38:31 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: npiggin@gmail.com, paulus@samba.org, mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm/radix: Use the right page size for vmemmap mapping
Date: Sat, 29 Jun 2019 13:08:29 +0530
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062907-0072-0000-0000-000004427BCB
X-IBM-SpamModules-Scores: 
X-IBM-SpamModules-Versions: BY=3.00011350; HX=3.00000242; KW=3.00000007;
 PH=3.00000004; SC=3.00000286; SDB=6.01224844; UDB=6.00644699; IPR=6.01006045; 
 MB=3.00027519; MTD=3.00000008; XFM=3.00000015; UTC=2019-06-29 07:38:36
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062907-0073-0000-0000-00004CB2AD96
Message-Id: <20190629073829.13095-1-aneesh.kumar@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-29_05:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906290095
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

Also on hash with 4K PAGE_SIZE make sure we use 4K page size for
vmemmap.

Fixes: 2bfd65e45e87 ("powerpc/mm/radix: Add radix callbacks for early init routines")
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/hash_utils.c    |  4 +---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 16 +++++++---------
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
index 49f8c8940bd9..54013bbc60aa 100644
--- a/arch/powerpc/mm/book3s64/hash_utils.c
+++ b/arch/powerpc/mm/book3s64/hash_utils.c
@@ -686,10 +686,8 @@ static void __init htab_init_page_sizes(void)
 	if (mmu_psize_defs[MMU_PAGE_16M].shift &&
 	    memblock_phys_mem_size() >= 0x40000000)
 		mmu_vmemmap_psize = MMU_PAGE_16M;
-	else if (mmu_psize_defs[MMU_PAGE_64K].shift)
-		mmu_vmemmap_psize = MMU_PAGE_64K;
 	else
-		mmu_vmemmap_psize = MMU_PAGE_4K;
+		mmu_vmemmap_psize = mmu_virtual_psize;
 #endif /* CONFIG_SPARSEMEM_VMEMMAP */
 
 	printk(KERN_DEBUG "Page orders: linear mapping = %d, "
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 60d97fab4de2..03d804a0dc8c 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -529,14 +529,6 @@ void __init radix__early_init_devtree(void)
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
 
@@ -601,7 +593,13 @@ void __init radix__early_init_mmu(void)
 
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

