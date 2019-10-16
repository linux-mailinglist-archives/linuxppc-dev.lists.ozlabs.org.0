Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id B6111D8842
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 07:53:12 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46tM0Q15H4zDqpy
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Oct 2019 16:53:10 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 46tLyn3SL7zDqj4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Oct 2019 16:51:45 +1100 (AEDT)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x9G5lMvM020750; Wed, 16 Oct 2019 01:51:36 -0400
Received: from ppma01wdc.us.ibm.com (fd.55.37a9.ip4.static.sl-reverse.com
 [169.55.85.253])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2vnugpb9er-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 01:51:36 -0400
Received: from pps.filterd (ppma01wdc.us.ibm.com [127.0.0.1])
 by ppma01wdc.us.ibm.com (8.16.0.27/8.16.0.27) with SMTP id x9G5jNoV011750;
 Wed, 16 Oct 2019 05:51:37 GMT
Received: from b01cxnp22034.gho.pok.ibm.com (b01cxnp22034.gho.pok.ibm.com
 [9.57.198.24]) by ppma01wdc.us.ibm.com with ESMTP id 2vk6f6ssub-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 16 Oct 2019 05:51:37 +0000
Received: from b01ledav004.gho.pok.ibm.com (b01ledav004.gho.pok.ibm.com
 [9.57.199.109])
 by b01cxnp22034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x9G5pYXq40173844
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 16 Oct 2019 05:51:34 GMT
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 828E2112063;
 Wed, 16 Oct 2019 05:51:34 +0000 (GMT)
Received: from b01ledav004.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 3DB76112064;
 Wed, 16 Oct 2019 05:51:33 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.124.35.116])
 by b01ledav004.gho.pok.ibm.com (Postfix) with ESMTP;
 Wed, 16 Oct 2019 05:51:32 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: mpe@ellerman.id.au
Subject: [PATCH] powerpc/mm/book3s64/hash: Update 4k PAGE_SIZE kernel mapping
Date: Wed, 16 Oct 2019 11:21:30 +0530
Message-Id: <20191016055130.10533-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-10-16_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=3 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1908290000 definitions=main-1910160054
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
Cc: Cameron Berkenpas <cam@neo-zeon.de>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With commit: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel
regions in the same 0xc range"), kernel now split the 64TB address range
into 4 contexts each of 16TB. That implies we can do only 16TB linear
mapping. This results in boot failure on some P9 systems.

Fix this by redoing the hash 4k mapping as below.

 vmalloc start     = 0xd000000000000000
 IO start          = 0xd000380000000000
 vmemmap start     = 0xf000000000000000

Vmalloc area is now 56TB in size and IO remap 8TB. We need to keep them in the
same top nibble address because we map both of them in the Linux page table and they
share the init_mm page table. We need a large vmalloc space because we use
percpu embedded first chunk allocator.

Both linear and vmemmap range is of 64TB size each and is mapped respectively
using 0xc and 0xf top nibble.

Fixes: 0034d395f89d ("powerpc/mm/hash64: Map all the kernel regions in the same 0xc range")
Reported-by: Cameron Berkenpas <cam@neo-zeon.de>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/hash-4k.h  | 54 ++++++++++--
 arch/powerpc/include/asm/book3s/64/hash-64k.h | 73 ++++++++++++++++-
 arch/powerpc/include/asm/book3s/64/hash.h     | 82 ++-----------------
 3 files changed, 123 insertions(+), 86 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
index 8fd8599c9395..4cbb9fe22d76 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
@@ -12,23 +12,59 @@
  * Hence also limit max EA bits to 64TB.
  */
 #define MAX_EA_BITS_PER_CONTEXT		46
-
-#define REGION_SHIFT		(MAX_EA_BITS_PER_CONTEXT - 2)
+/*
+ * For 4k hash, considering we restricted by a page table sizing that
+ * limit our address range to 64TB, keep the kernel virtual
+ * mapping in 0xd region.
+ */
+#define H_KERN_VIRT_START	ASM_CONST(0xd000000000000000)
 
 /*
- * Our page table limit us to 64TB. Hence for the kernel mapping,
- * each MAP area is limited to 16 TB.
- * The four map areas are:  linear mapping, vmap, IO and vmemmap
+ * Top 4 bits are ignored in page table walk.
  */
-#define H_KERN_MAP_SIZE		(ASM_CONST(1) << REGION_SHIFT)
+#define EA_MASK			(~(0xfUL << 60))
 
 /*
- * Define the address range of the kernel non-linear virtual area
- * 16TB
+ * Place vmalloc and IO in the 64TB range because we map them via linux page
+ * table and table size is limited to 64TB.
+ */
+#define H_VMALLOC_START		H_KERN_VIRT_START
+/*
+ * 56TB vmalloc size. We require large vmalloc space for percpu mapping.
  */
-#define H_KERN_VIRT_START	ASM_CONST(0xc000100000000000)
+#define H_VMALLOC_SIZE		(56UL << 40)
+#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
+
+#define H_KERN_IO_START		H_VMALLOC_END
+#define H_KERN_IO_SIZE		(8UL << 40)
+#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
+
+#define H_VMEMMAP_START		ASM_CONST(0xf000000000000000)
+#define H_VMEMMAP_SIZE		(1UL << MAX_EA_BITS_PER_CONTEXT)
+#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
 
 #ifndef __ASSEMBLY__
+static inline int get_region_id(unsigned long ea)
+{
+	int id = (ea >> 60UL);
+
+	switch (id) {
+	case 0x0:
+		return USER_REGION_ID;
+	case 0xc:
+		return LINEAR_MAP_REGION_ID;
+	case 0xd:
+		if (ea < H_KERN_IO_START)
+			return VMALLOC_REGION_ID;
+		else
+			return IO_REGION_ID;
+	case 0xf:
+		return VMEMMAP_REGION_ID;
+	default:
+		return INVALID_REGION_ID;
+	}
+}
+
 #define H_PTE_TABLE_SIZE	(sizeof(pte_t) << H_PTE_INDEX_SIZE)
 #define H_PMD_TABLE_SIZE	(sizeof(pmd_t) << H_PMD_INDEX_SIZE)
 #define H_PUD_TABLE_SIZE	(sizeof(pud_t) << H_PUD_INDEX_SIZE)
diff --git a/arch/powerpc/include/asm/book3s/64/hash-64k.h b/arch/powerpc/include/asm/book3s/64/hash-64k.h
index d1d9177d9ebd..fc44bc590ac8 100644
--- a/arch/powerpc/include/asm/book3s/64/hash-64k.h
+++ b/arch/powerpc/include/asm/book3s/64/hash-64k.h
@@ -13,18 +13,61 @@
  * is handled in the hotpath.
  */
 #define MAX_EA_BITS_PER_CONTEXT		49
-#define REGION_SHIFT		MAX_EA_BITS_PER_CONTEXT
+
+/*
+ * Define the address range of the kernel non-linear virtual area
+ * 2PB
+ */
+#define H_KERN_VIRT_START	ASM_CONST(0xc008000000000000)
 
 /*
  * We use one context for each MAP area.
  */
+#define REGION_SHIFT		MAX_EA_BITS_PER_CONTEXT
 #define H_KERN_MAP_SIZE		(1UL << MAX_EA_BITS_PER_CONTEXT)
 
 /*
- * Define the address range of the kernel non-linear virtual area
- * 2PB
+ * Top 2 bits are ignored in page table walk.
  */
-#define H_KERN_VIRT_START	ASM_CONST(0xc008000000000000)
+#define EA_MASK			(~(0xcUL << 60))
+
+/*
+ * +------------------------------+
+ * |                              |
+ * |                              |
+ * |                              |
+ * +------------------------------+  Kernel virtual map end (0xc00e000000000000)
+ * |                              |
+ * |                              |
+ * |      512TB/16TB of vmemmap   |
+ * |                              |
+ * |                              |
+ * +------------------------------+  Kernel vmemmap  start
+ * |                              |
+ * |      512TB/16TB of IO map    |
+ * |                              |
+ * +------------------------------+  Kernel IO map start
+ * |                              |
+ * |      512TB/16TB of vmap      |
+ * |                              |
+ * +------------------------------+  Kernel virt start (0xc008000000000000)
+ * |                              |
+ * |                              |
+ * |                              |
+ * +------------------------------+  Kernel linear (0xc.....)
+ */
+
+#define H_VMALLOC_START		H_KERN_VIRT_START
+#define H_VMALLOC_SIZE		H_KERN_MAP_SIZE
+#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
+
+#define H_KERN_IO_START		H_VMALLOC_END
+#define H_KERN_IO_SIZE		H_KERN_MAP_SIZE
+#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
+
+#define H_VMEMMAP_START		H_KERN_IO_END
+#define H_VMEMMAP_SIZE		H_KERN_MAP_SIZE
+#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
 
 /*
  * 64k aligned address free up few of the lower bits of RPN for us
@@ -69,6 +112,28 @@
 #ifndef __ASSEMBLY__
 #include <asm/errno.h>
 
+#define NON_LINEAR_REGION_ID(ea)	((((unsigned long)(ea) - H_KERN_VIRT_START) >> REGION_SHIFT) + 2)
+
+static inline int get_region_id(unsigned long ea)
+{
+	int region_id;
+	int id = (ea >> 60UL);
+
+	if (id == 0)
+		return USER_REGION_ID;
+
+	if (id != (PAGE_OFFSET >> 60))
+		return INVALID_REGION_ID;
+
+	if (ea < H_KERN_VIRT_START)
+		return LINEAR_MAP_REGION_ID;
+
+	BUILD_BUG_ON(NON_LINEAR_REGION_ID(H_VMALLOC_START) != 2);
+
+	region_id = NON_LINEAR_REGION_ID(ea);
+	return region_id;
+}
+
 /*
  * With 64K pages on hash table, we have a special PTE format that
  * uses a second "half" of the page table to encode sub-page information
diff --git a/arch/powerpc/include/asm/book3s/64/hash.h b/arch/powerpc/include/asm/book3s/64/hash.h
index 2781ebf6add4..e279224629a2 100644
--- a/arch/powerpc/include/asm/book3s/64/hash.h
+++ b/arch/powerpc/include/asm/book3s/64/hash.h
@@ -11,6 +11,15 @@
  *
  */
 #define H_PTE_NONE_MASK		_PAGE_HPTEFLAGS
+/*
+ * Region IDs
+ */
+#define USER_REGION_ID		0
+#define LINEAR_MAP_REGION_ID	1
+#define VMALLOC_REGION_ID	2
+#define IO_REGION_ID		3
+#define VMEMMAP_REGION_ID	4
+#define INVALID_REGION_ID	5
 
 #ifdef CONFIG_PPC_64K_PAGES
 #include <asm/book3s/64/hash-64k.h>
@@ -29,10 +38,6 @@
 #define H_PGTABLE_EADDR_SIZE	(H_PTE_INDEX_SIZE + H_PMD_INDEX_SIZE + \
 				 H_PUD_INDEX_SIZE + H_PGD_INDEX_SIZE + PAGE_SHIFT)
 #define H_PGTABLE_RANGE		(ASM_CONST(1) << H_PGTABLE_EADDR_SIZE)
-/*
- * Top 2 bits are ignored in page table walk.
- */
-#define EA_MASK			(~(0xcUL << 60))
 
 /*
  * We store the slot details in the second half of page table.
@@ -45,56 +50,6 @@
 #define H_PUD_CACHE_INDEX	(H_PUD_INDEX_SIZE)
 #endif
 
-/*
- * +------------------------------+
- * |                              |
- * |                              |
- * |                              |
- * +------------------------------+  Kernel virtual map end (0xc00e000000000000)
- * |                              |
- * |                              |
- * |      512TB/16TB of vmemmap   |
- * |                              |
- * |                              |
- * +------------------------------+  Kernel vmemmap  start
- * |                              |
- * |      512TB/16TB of IO map    |
- * |                              |
- * +------------------------------+  Kernel IO map start
- * |                              |
- * |      512TB/16TB of vmap      |
- * |                              |
- * +------------------------------+  Kernel virt start (0xc008000000000000)
- * |                              |
- * |                              |
- * |                              |
- * +------------------------------+  Kernel linear (0xc.....)
- */
-
-#define H_VMALLOC_START		H_KERN_VIRT_START
-#define H_VMALLOC_SIZE		H_KERN_MAP_SIZE
-#define H_VMALLOC_END		(H_VMALLOC_START + H_VMALLOC_SIZE)
-
-#define H_KERN_IO_START		H_VMALLOC_END
-#define H_KERN_IO_SIZE		H_KERN_MAP_SIZE
-#define H_KERN_IO_END		(H_KERN_IO_START + H_KERN_IO_SIZE)
-
-#define H_VMEMMAP_START		H_KERN_IO_END
-#define H_VMEMMAP_SIZE		H_KERN_MAP_SIZE
-#define H_VMEMMAP_END		(H_VMEMMAP_START + H_VMEMMAP_SIZE)
-
-#define NON_LINEAR_REGION_ID(ea)	((((unsigned long)ea - H_KERN_VIRT_START) >> REGION_SHIFT) + 2)
-
-/*
- * Region IDs
- */
-#define USER_REGION_ID		0
-#define LINEAR_MAP_REGION_ID	1
-#define VMALLOC_REGION_ID	NON_LINEAR_REGION_ID(H_VMALLOC_START)
-#define IO_REGION_ID		NON_LINEAR_REGION_ID(H_KERN_IO_START)
-#define VMEMMAP_REGION_ID	NON_LINEAR_REGION_ID(H_VMEMMAP_START)
-#define INVALID_REGION_ID	(VMEMMAP_REGION_ID + 1)
-
 /*
  * Defines the address of the vmemap area, in its own region on
  * hash table CPUs.
@@ -112,25 +67,6 @@
 #define H_PUD_BAD_BITS		(PMD_TABLE_SIZE-1)
 
 #ifndef __ASSEMBLY__
-static inline int get_region_id(unsigned long ea)
-{
-	int region_id;
-	int id = (ea >> 60UL);
-
-	if (id == 0)
-		return USER_REGION_ID;
-
-	if (id != (PAGE_OFFSET >> 60))
-		return INVALID_REGION_ID;
-
-	if (ea < H_KERN_VIRT_START)
-		return LINEAR_MAP_REGION_ID;
-
-	BUILD_BUG_ON(NON_LINEAR_REGION_ID(H_VMALLOC_START) != 2);
-
-	region_id = NON_LINEAR_REGION_ID(ea);
-	return region_id;
-}
 
 #define	hash__pmd_bad(pmd)		(pmd_val(pmd) & H_PMD_BAD_BITS)
 #define	hash__pud_bad(pud)		(pud_val(pud) & H_PUD_BAD_BITS)
-- 
2.21.0

