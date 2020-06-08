Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5EE1F135F
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 09:15:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gPf42lTYzDqQF
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 17:15:08 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49gPWs27D4zDqTC
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 17:09:45 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05872G7n067703; Mon, 8 Jun 2020 03:09:41 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 31geq6kt7y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 03:09:40 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05875J7n018517;
 Mon, 8 Jun 2020 07:09:39 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 31gxfk3uk5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 08 Jun 2020 07:09:39 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05879dqx48693622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 8 Jun 2020 07:09:39 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1B5942805A;
 Mon,  8 Jun 2020 07:09:39 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 5093828059;
 Mon,  8 Jun 2020 07:09:37 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.85.88.17])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon,  8 Jun 2020 07:09:36 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 4/4] powerpc/mm/book3s: Split radix and hash MAX_PHYSMEM
 limit
Date: Mon,  8 Jun 2020 12:39:04 +0530
Message-Id: <20200608070904.387440-4-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
References: <20200608070904.387440-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-08_03:2020-06-08,
 2020-06-08 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 cotscore=-2147483648
 phishscore=0 priorityscore=1501 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2004280000 definitions=main-2006080049
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
Cc: cam@neo-zeon.de, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

MAX_PHYSMEM #define is used along with sparsemem to determine the SECTION_SHIFT
value. Powerpc also uses the same value to limit the max memory enabled on the
system. With 4K PAGE_SIZE and hash translation mode, we want to limit the max
memory enabled to 64TB due to page table size restrictions. However, with
radix translation, we don't have these restrictions. Hence split the radix
and hash MA_PHYSMEM limit and use different limit for each of them.

Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  |  5 +++++
 arch/powerpc/include/asm/book3s/64/hash-64k.h | 13 +++++++++++++
 arch/powerpc/include/asm/book3s/64/mmu-hash.h |  4 ++--
 arch/powerpc/include/asm/book3s/64/mmu.h      | 15 ---------------
 arch/powerpc/include/asm/book3s/64/pgtable.h  |  7 +++++++
 arch/powerpc/include/asm/book3s/64/radix.h    | 16 ++++++++++++++++
 arch/powerpc/kernel/prom.c                    |  5 +++++
 arch/powerpc/mm/book3s64/slb.c                |  4 ++--
 8 files changed, 50 insertions(+), 19 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 80c953414882..2e86d9b35766 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -22,6 +22,11 @@
 #define REGION_SHIFT		(40)
 #define H_KERN_MAP_SIZE		(ASM_CONST(1) << REGION_SHIFT)
 
+/*
+ * Limits the linear mapping range
+ */
+#define H_MAX_PHYSMEM_BITS	46
+
 /*
  * Define the address range of the kernel non-linear virtual area (61TB)
  */
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index 0729c034e56f..16c040d19a2b 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -7,6 +7,19 @@
 #define H_PUD_INDEX_SIZE  10  // size: 8B << 10 = 8KB, maps 2^10 x 16GB = 16TB
 #define H_PGD_INDEX_SIZE   8  // size: 8B <<  8 = 2KB, maps 2^8  x 16TB =  4PB
 
+/*
+ * If we store section details in page->flags we can't increase the MAX_PHYSMEM_BITS
+ * if we increase SECTIONS_WIDTH we will not store node details in page->flags and
+ * page_to_nid does a page->section->node lookup
+ * Hence only increase for VMEMMAP. Further depending on SPARSEMEM_EXTREME reduce
+ * memory requirements with large number of sections.
+ * 51 bits is the max physical real address on POWER9
+ */
+#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)
+#define H_MAX_PHYSMEM_BITS	51
+#else
+#define H_MAX_PHYSMEM_BITS	46
+#endif
 
 /*
  * Each context is 512TB size. SLB miss for first context/default context
diff --git a/arch/powerpc/include/asm/book3s/64/mmu-hash.h b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
index 3fa1b962dc27..84817466a3dd 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu-hash.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu-hash.h
@@ -577,8 +577,8 @@ extern void slb_set_size(u16 size);
  * For vmalloc and memmap, we use just one context with 512TB. With 64 byte
  * struct page size, we need ony 32 TB in memmap for 2PB (51 bits (MAX_PHYSMEM_BITS)).
  */
-#if (MAX_PHYSMEM_BITS > MAX_EA_BITS_PER_CONTEXT)
-#define MAX_KERNEL_CTX_CNT	(1UL << (MAX_PHYSMEM_BITS - MAX_EA_BITS_PER_CONTEXT))
+#if (H_MAX_PHYSMEM_BITS > MAX_EA_BITS_PER_CONTEXT)
+#define MAX_KERNEL_CTX_CNT	(1UL << (H_MAX_PHYSMEM_BITS - MAX_EA_BITS_PER_CONTEXT))
 #else
 #define MAX_KERNEL_CTX_CNT	1
 #endif
diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 5393a535240c..6202649e3e11 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -27,21 +27,6 @@ struct mmu_psize_def {
 extern struct mmu_psize_def mmu_psize_defs[MMU_PAGE_COUNT];
 #endif /* __ASSEMBLY__ */
 
-/*
- * If we store section details in page->flags we can't increase the MAX_PHYSMEM_BITS
- * if we increase SECTIONS_WIDTH we will not store node details in page->flags and
- * page_to_nid does a page->section->node lookup
- * Hence only increase for VMEMMAP. Further depending on SPARSEMEM_EXTREME reduce
- * memory requirements with large number of sections.
- * 51 bits is the max physical real address on POWER9
- */
-#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME) &&  \
-	defined(CONFIG_PPC_64K_PAGES)
-#define MAX_PHYSMEM_BITS 51
-#else
-#define MAX_PHYSMEM_BITS 46
-#endif
-
 /* 64-bit classic hash table MMU */
 #include <asm/book3s/64/mmu-hash.h>
 
diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
index f17442c3a092..4a6a0c51a733 100644
--- a/arch/powerpc/include/asm/book3s/64/pgtable.h
+++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
@@ -295,6 +295,13 @@ extern unsigned long pci_io_base;
 #include <asm/book3s/64/hash.h>
 #include <asm/book3s/64/radix.h>
 
+#if H_MAX_PHYSMEM_BITS > R_MAX_PHYSMEM_BITS
+#define  MAX_PHYSMEM_BITS	H_MAX_PHYSMEM_BITS
+#else
+#define  MAX_PHYSMEM_BITS	R_MAX_PHYSMEM_BITS
+#endif
+
+
 #ifdef CONFIG_PPC_64K_PAGES
 #include <asm/book3s/64/pgtable-64k.h>
 #else
diff --git a/arch/powerpc/include/asm/book3s/64/radix.h b/arch/powerpc/include/asm/book3s/64/radix.h
index 0cba794c4fb8..c7813dc628fc 100644
--- a/arch/powerpc/include/asm/book3s/64/radix.h
+++ b/arch/powerpc/include/asm/book3s/64/radix.h
@@ -91,6 +91,22 @@
  * +------------------------------+  Kernel linear (0xc.....)
  */
 
+
+/*
+ * If we store section details in page->flags we can't increase the MAX_PHYSMEM_BITS
+ * if we increase SECTIONS_WIDTH we will not store node details in page->flags and
+ * page_to_nid does a page->section->node lookup
+ * Hence only increase for VMEMMAP. Further depending on SPARSEMEM_EXTREME reduce
+ * memory requirements with large number of sections.
+ * 51 bits is the max physical real address on POWER9
+ */
+
+#if defined(CONFIG_SPARSEMEM_VMEMMAP) && defined(CONFIG_SPARSEMEM_EXTREME)
+#define R_MAX_PHYSMEM_BITS	51
+#else
+#define R_MAX_PHYSMEM_BITS	46
+#endif
+
 #define RADIX_KERN_VIRT_START	ASM_CONST(0xc008000000000000)
 /*
  * 49 =  MAX_EA_BITS_PER_CONTEXT (hash specific). To make sure we pick
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 6a3bac357e24..238349dd101a 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -771,6 +771,11 @@ void __init early_init_devtree(void *params)
 	limit = ALIGN(memory_limit ?: memblock_phys_mem_size(), PAGE_SIZE);
 	memblock_enforce_memory_limit(limit);
 
+#if defined(CONFIG_PPC_BOOK3S_64) && defined(CONFIG_PPC_4K_PAGES)
+	if (!early_radix_enabled())
+		memblock_cap_memory_range(0, 1UL << (H_MAX_PHYSMEM_BITS));
+#endif
+
 	memblock_allow_resize();
 	memblock_dump_all();
 
diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
index 8141e8b40ee5..11d65de400e1 100644
--- a/arch/powerpc/mm/book3s64/slb.c
+++ b/arch/powerpc/mm/book3s64/slb.c
@@ -765,8 +765,8 @@ static long slb_allocate_kernel(unsigned long ea, unsigned long id)
 
 	if (id == LINEAR_MAP_REGION_ID) {
 
-		/* We only support upto MAX_PHYSMEM_BITS */
-		if ((ea & EA_MASK) > (1UL << MAX_PHYSMEM_BITS))
+		/* We only support upto H_MAX_PHYSMEM_BITS */
+		if ((ea & EA_MASK) > (1UL << H_MAX_PHYSMEM_BITS))
 			return -EFAULT;
 
 		flags = SLB_VSID_KERNEL | mmu_psize_defs[mmu_linear_psize].sllp;
-- 
2.26.2

