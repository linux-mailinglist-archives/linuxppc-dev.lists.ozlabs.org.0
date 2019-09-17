Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 35295B5109
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Sep 2019 17:08:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46Xmh71vhRzDqTn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Sep 2019 01:08:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=aneesh.kumar@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46XmRr5sq9zF3p8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Sep 2019 00:57:28 +1000 (AEST)
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8HEuOL7085133; Tue, 17 Sep 2019 10:57:21 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2v315ha3r9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 10:57:20 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x8HEjIm4009504;
 Tue, 17 Sep 2019 14:57:20 GMT
Received: from b03cxnp08026.gho.boulder.ibm.com
 (b03cxnp08026.gho.boulder.ibm.com [9.17.130.18])
 by ppma03wdc.us.ibm.com with ESMTP id 2v0t3d9g5d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 17 Sep 2019 14:57:20 +0000
Received: from b03ledav001.gho.boulder.ibm.com
 (b03ledav001.gho.boulder.ibm.com [9.17.130.232])
 by b03cxnp08026.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8HEvIk415401308
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Sep 2019 14:57:18 GMT
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BA73D6E052;
 Tue, 17 Sep 2019 14:57:18 +0000 (GMT)
Received: from b03ledav001.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3F3186E050;
 Tue, 17 Sep 2019 14:57:17 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.41.201])
 by b03ledav001.gho.boulder.ibm.com (Postfix) with ESMTP;
 Tue, 17 Sep 2019 14:57:16 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH 3/3] powerpc/book3s64/hash/4K: Update the kernel mapping with
 4K page size config.
Date: Tue, 17 Sep 2019 20:27:02 +0530
Message-Id: <20190917145702.9214-3-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
References: <20190917145702.9214-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-17_07:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=1 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1909170144
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

This patch updates the kernel mapping such that we now start supporting upto
61TB of memory with 4K. The kernel mapping now looks like below:

vmalloc start     = 0xc0003d0000000000
IO start          = 0xc0003e0000000000
vmemmap start     = 0xc0003f0000000000

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h | 13 ++++++-------
 arch/powerpc/include/asm/book3s/64/mmu.h     |  8 ++------
 2 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 8fd8599c9395..d56a2a2ae14a 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -13,20 +13,19 @@
  */
 #define MAX_EA_BITS_PER_CONTEXT		46
 
-#define REGION_SHIFT		(MAX_EA_BITS_PER_CONTEXT - 2)
 
 /*
- * Our page table limit us to 64TB. Hence for the kernel mapping,
- * each MAP area is limited to 16 TB.
- * The four map areas are:  linear mapping, vmap, IO and vmemmap
+ * Our page table limit us to 64TB. For 64TB physical memory, we only need 64GB
+ * of vmemmap space. To better support sparse memory layout, we use 61TB
+ * linear map range, 1TB of vmalloc, 1TB of I/O and 1TB of vmememmap.
  */
+#define REGION_SHIFT		(40)
 #define H_KERN_MAP_SIZE		(ASM_CONST(1) << REGION_SHIFT)
 
 /*
- * Define the address range of the kernel non-linear virtual area
- * 16TB
+ * Define the address range of the kernel non-linear virtual area (61TB)
  */
-#define H_KERN_VIRT_START	ASM_CONST(0xc000100000000000)
+#define H_KERN_VIRT_START	ASM_CONST(0xc0003d0000000000)
 
 #ifndef __ASSEMBLY__
 #define H_PTE_TABLE_SIZE	(sizeof(pte_t) << H_PTE_INDEX_SIZE)
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 86cce8189240..bb3deb76c951 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -35,16 +35,12 @@ extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
  * memory requirements with large number of sections.
  * 51 bits is the max physical real address on POWER9
  */
-
-#if defined(CONFIG_PPC_64K_PAGES)
-#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)
+#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME) &&  \
+	defined(CONFIG_PPC_64K_PAGES)
 #define MAX_PHYSMEM_BITS 51
 #else
 #define MAX_PHYSMEM_BITS 46
 #endif
-#else /* CONFIG_PPC_64K_PAGES */
-#define MAX_PHYSMEM_BITS 44
-#endif
 
 /* 64-bit classic hash table MMU */
 #include <asm/book3s/64/mmu-hash.h>
-- 
2.21.0

