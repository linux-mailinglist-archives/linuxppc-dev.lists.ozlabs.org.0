Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C31D209A24
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 08:56:39 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49srQr4j08zDqjg
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jun 2020 16:56:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.158.5;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49srC63kJHzDqht
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jun 2020 16:46:26 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 05P6WFY5006732; Thu, 25 Jun 2020 02:46:21 -0400
Received: from ppma01dal.us.ibm.com (83.d6.3fa9.ip4.static.sl-reverse.com
 [169.63.214.131])
 by mx0b-001b2d01.pphosted.com with ESMTP id 31uwyfkd48-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 02:46:20 -0400
Received: from pps.filterd (ppma01dal.us.ibm.com [127.0.0.1])
 by ppma01dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 05P6e2TK023708;
 Thu, 25 Jun 2020 06:46:20 GMT
Received: from b03cxnp07029.gho.boulder.ibm.com
 (b03cxnp07029.gho.boulder.ibm.com [9.17.130.16])
 by ppma01dal.us.ibm.com with ESMTP id 31uurum9b8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Jun 2020 06:46:20 +0000
Received: from b03ledav004.gho.boulder.ibm.com
 (b03ledav004.gho.boulder.ibm.com [9.17.130.235])
 by b03cxnp07029.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 05P6kIgH58065360
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Jun 2020 06:46:18 GMT
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 56B3478060;
 Thu, 25 Jun 2020 06:46:18 +0000 (GMT)
Received: from b03ledav004.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 31BAB7805C;
 Thu, 25 Jun 2020 06:46:16 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.47.233])
 by b03ledav004.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 25 Jun 2020 06:46:15 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v2 4/4] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
Date: Thu, 25 Jun 2020 12:15:47 +0530
Message-Id: <20200625064547.228448-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
References: <20200625064547.228448-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.216, 18.0.687
 definitions=2020-06-25_02:2020-06-24,
 2020-06-25 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 cotscore=-2147483648 lowpriorityscore=0 bulkscore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2004280000 definitions=main-2006250035
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
 Bharata B Rao <bharata@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

To enable memory unplug without splitting kernel page table
mapping, we force the max mapping size to the LMB size. LMB
size is the unit in which hypervisor will do memory add/remove
operation.

This implies on pseries system, we now end up mapping
memory with 2M page size instead of 1G. To improve
that we want hypervisor to hint the kernel about the hotplug
memory range.  This was added that as part of

commit b6eca183e23e ("powerpc/kernel: Enables memory
hot-remove after reboot on pseries guests")

But we still don't do that on PowerVM. Once we get PowerVM
updated, we can then force the 2M mapping only to hot-pluggable
memory region using memblock_is_hotpluggable(). Till then
let's depend on LMB size for finding the mapping page size
for linear range.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 83 ++++++++++++++++++++----
 arch/powerpc/platforms/powernv/setup.c   | 10 ++-
 2 files changed, 81 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 78ad11812e0d..a4179e4da49d 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
+#include <linux/memory.h>
 
 #include <asm/pgtable.h>
 #include <asm/pgalloc.h>
@@ -34,6 +35,7 @@
 
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
+unsigned int radix_mem_block_size;
 
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
@@ -266,6 +268,7 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 
 static int __meminit create_physical_mapping(unsigned long start,
 					     unsigned long end,
+					     unsigned long max_mapping_size,
 					     int nid, pgprot_t _prot)
 {
 	unsigned long vaddr, addr, mapping_size = 0;
@@ -279,6 +282,8 @@ static int __meminit create_physical_mapping(unsigned long start,
 		int rc;
 
 		gap = next_boundary(addr, end) - addr;
+		if (gap > max_mapping_size)
+			gap = max_mapping_size;
 		previous_size = mapping_size;
 		prev_exec = exec;
 
@@ -329,8 +334,9 @@ static void __init radix_init_pgtable(void)
 
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
+
 	/*
-	 * Create the linear mapping, using standard page size for now
+	 * Create the linear mapping
 	 */
 	for_each_memblock(memory, reg) {
 		/*
@@ -346,6 +352,7 @@ static void __init radix_init_pgtable(void)
 
 		WARN_ON(create_physical_mapping(reg->base,
 						reg->base + reg->size,
+						radix_mem_block_size,
 						-1, PAGE_KERNEL));
 	}
 
@@ -486,6 +493,49 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	return 1;
 }
 
+static int __init probe_memory_block_size(unsigned long node, const char *uname, int
+					  depth, void *data)
+{
+	const __be32 *block_size;
+	int len;
+
+	if (depth != 1)
+		return 0;
+
+	if (!strcmp(uname, "ibm,dynamic-reconfiguration-memory")) {
+
+		block_size = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
+		if (!block_size || len < dt_root_size_cells * sizeof(__be32))
+			/*
+			 * Nothing in the device tree
+			 */
+			return MIN_MEMORY_BLOCK_SIZE;
+
+		return dt_mem_next_cell(dt_root_size_cells, &block_size);
+
+	}
+
+	return 0;
+}
+
+static unsigned long radix_memory_block_size(void)
+{
+	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
+
+	if (firmware_has_feature(FW_FEATURE_OPAL)) {
+
+		mem_block_size = 1UL * 1024 * 1024 * 1024;
+
+	} else if (firmware_has_feature(FW_FEATURE_LPAR)) {
+		mem_block_size = of_scan_flat_dt(probe_memory_block_size, NULL);
+		if (!mem_block_size)
+			mem_block_size = MIN_MEMORY_BLOCK_SIZE;
+	}
+
+	return mem_block_size;
+}
+
+
 void __init radix__early_init_devtree(void)
 {
 	int rc;
@@ -494,17 +544,27 @@ void __init radix__early_init_devtree(void)
 	 * Try to find the available page sizes in the device-tree
 	 */
 	rc = of_scan_flat_dt(radix_dt_scan_page_sizes, NULL);
-	if (rc != 0)  /* Found */
-		goto found;
+	if (rc == 0) {
+		/*
+		 * no page size details found in device tree
+		 * let's assume we have page 4k and 64k support
+		 */
+		mmu_psize_defs[MMU_PAGE_4K].shift = 12;
+		mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
+
+		mmu_psize_defs[MMU_PAGE_64K].shift = 16;
+		mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
+	}
+
 	/*
-	 * let's assume we have page 4k and 64k support
+	 * Max mapping size used when mapping pages. We don't use
+	 * ppc_md.memory_block_size() here because this get called
+	 * early and we don't have machine probe called yet. Also
+	 * the pseries implementation only check for ibm,lmb-size.
+	 * All hypervisor supporting radix do expose that device
+	 * tree node.
 	 */
-	mmu_psize_defs[MMU_PAGE_4K].shift = 12;
-	mmu_psize_defs[MMU_PAGE_4K].ap = 0x0;
-
-	mmu_psize_defs[MMU_PAGE_64K].shift = 16;
-	mmu_psize_defs[MMU_PAGE_64K].ap = 0x5;
-found:
+	radix_mem_block_size = radix_memory_block_size();
 	return;
 }
 
@@ -856,7 +916,8 @@ int __meminit radix__create_section_mapping(unsigned long start,
 		return -1;
 	}
 
-	return create_physical_mapping(__pa(start), __pa(end), nid, prot);
+	return create_physical_mapping(__pa(start), __pa(end),
+				       radix_mem_block_size, nid, prot);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 3bc188da82ba..6e2f614590a3 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -399,7 +399,15 @@ static void pnv_kexec_cpu_down(int crash_shutdown, int secondary)
 #ifdef CONFIG_MEMORY_HOTPLUG_SPARSE
 static unsigned long pnv_memory_block_size(void)
 {
-	return 256UL * 1024 * 1024;
+	/*
+	 * We map the kernel linear region with 1GB large pages on radix. For
+	 * memory hot unplug to work our memory block size must be at least
+	 * this size.
+	 */
+	if (radix_enabled())
+		return 1UL * 1024 * 1024 * 1024;
+	else
+		return 256UL * 1024 * 1024;
 }
 #endif
 
-- 
2.26.2

