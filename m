Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E33B21A0EF
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 15:32:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B2cY70RhyzDqV4
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jul 2020 23:32:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1;
 helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B2cGb0St5zDr7G
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jul 2020 23:19:50 +1000 (AEST)
Received: from pps.filterd (m0098396.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 069D5FXk133384; Thu, 9 Jul 2020 09:19:47 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com
 [169.47.144.26])
 by mx0a-001b2d01.pphosted.com with ESMTP id 325k3rkerg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 09:19:46 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
 by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 069DEX1s021846;
 Thu, 9 Jul 2020 13:19:45 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com
 (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
 by ppma04wdc.us.ibm.com with ESMTP id 325k246dvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 09 Jul 2020 13:19:45 +0000
Received: from b03ledav002.gho.boulder.ibm.com
 (b03ledav002.gho.boulder.ibm.com [9.17.130.233])
 by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 069DJix516187720
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 9 Jul 2020 13:19:44 GMT
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 49EF913605D;
 Thu,  9 Jul 2020 13:19:44 +0000 (GMT)
Received: from b03ledav002.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B278A13604F;
 Thu,  9 Jul 2020 13:19:42 +0000 (GMT)
Received: from skywalker.ibmuc.com (unknown [9.199.62.107])
 by b03ledav002.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu,  9 Jul 2020 13:19:42 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au
Subject: [PATCH v3 4/4] powerpc/mm/radix: Create separate mappings for
 hot-plugged memory
Date: Thu,  9 Jul 2020 18:49:25 +0530
Message-Id: <20200709131925.922266-5-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
References: <20200709131925.922266-1-aneesh.kumar@linux.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235, 18.0.687
 definitions=2020-07-09_07:2020-07-09,
 2020-07-09 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0
 priorityscore=1501 mlxscore=0 lowpriorityscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2007090100
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

Pseries systems supports max LMB size of 256MB. Hence on pseries,
we now end up mapping memory with 2M page size instead of 1G. To improve
that we want hypervisor to hint the kernel about the hotplug
memory range. That was added that as part of

commit b6eca183e23e ("powerpc/kernel: Enables memory
hot-remove after reboot on pseries guests")

But PowerVM doesn't provide that hint yet. Once we get PowerVM
updated, we can then force the 2M mapping only to hot-pluggable
memory region using memblock_is_hotpluggable(). Till then
let's depend on LMB size for finding the mapping page size
for linear range.

With this change KVM guest will also be doing linear mapping with
2M page size.

The actual TLB benefit of mapping guest page table entries with
hugepage size can only be materialized if the partition scoped
entries are also using the same or higher page size. A guest using
1G hugetlbfs backing guest memory can have a performance impact with
the above change.

Signed-off-by: Bharata B Rao <bharata@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
 arch/powerpc/include/asm/book3s/64/mmu.h |  5 ++
 arch/powerpc/mm/book3s64/radix_pgtable.c | 81 ++++++++++++++++++++----
 arch/powerpc/platforms/powernv/setup.c   | 10 ++-
 3 files changed, 84 insertions(+), 12 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 5393a535240c..15aae924f41c 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -82,6 +82,11 @@ extern unsigned int mmu_pid_bits;
 /* Base PID to allocate from */
 extern unsigned int mmu_base_pid;
 
+/*
+ * memory block size used with radix translation.
+ */
+extern unsigned int __ro_after_init radix_mem_block_size;
+
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
 
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index d5a01b9aadc9..bba45fc0b7b2 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -15,6 +15,7 @@
 #include <linux/mm.h>
 #include <linux/hugetlb.h>
 #include <linux/string_helpers.h>
+#include <linux/memory.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -33,6 +34,7 @@
 
 unsigned int mmu_pid_bits;
 unsigned int mmu_base_pid;
+unsigned int radix_mem_block_size __ro_after_init;
 
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
@@ -265,6 +267,7 @@ static unsigned long next_boundary(unsigned long addr, unsigned long end)
 
 static int __meminit create_physical_mapping(unsigned long start,
 					     unsigned long end,
+					     unsigned long max_mapping_size,
 					     int nid, pgprot_t _prot)
 {
 	unsigned long vaddr, addr, mapping_size = 0;
@@ -278,6 +281,8 @@ static int __meminit create_physical_mapping(unsigned long start,
 		int rc;
 
 		gap = next_boundary(addr, end) - addr;
+		if (gap > max_mapping_size)
+			gap = max_mapping_size;
 		previous_size = mapping_size;
 		prev_exec = exec;
 
@@ -328,8 +333,9 @@ static void __init radix_init_pgtable(void)
 
 	/* We don't support slb for radix */
 	mmu_slb_size = 0;
+
 	/*
-	 * Create the linear mapping, using standard page size for now
+	 * Create the linear mapping
 	 */
 	for_each_memblock(memory, reg) {
 		/*
@@ -345,6 +351,7 @@ static void __init radix_init_pgtable(void)
 
 		WARN_ON(create_physical_mapping(reg->base,
 						reg->base + reg->size,
+						radix_mem_block_size,
 						-1, PAGE_KERNEL));
 	}
 
@@ -485,6 +492,47 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	return 1;
 }
 
+static int __init probe_memory_block_size(unsigned long node, const char *uname, int
+					  depth, void *data)
+{
+	unsigned long *mem_block_size = (unsigned long *)data;
+	const __be64 *prop;
+	int len;
+
+	if (depth != 1)
+		return 0;
+
+	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory"))
+		return 0;
+
+	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
+	if (!prop || len < sizeof(__be64))
+		/*
+		 * Nothing in the device tree
+		 */
+		*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
+	else
+		*mem_block_size = be64_to_cpup(prop);
+	return 1;
+}
+
+static unsigned long radix_memory_block_size(void)
+{
+	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
+
+	/*
+	 * OPAL firmware feature is set by now. Hence we are ok
+	 * to test OPAL feature.
+	 */
+	if (firmware_has_feature(FW_FEATURE_OPAL))
+		mem_block_size = 1UL * 1024 * 1024 * 1024;
+	else
+		of_scan_flat_dt(probe_memory_block_size, &mem_block_size);
+
+	return mem_block_size;
+}
+
+
 void __init radix__early_init_devtree(void)
 {
 	int rc;
@@ -493,17 +541,27 @@ void __init radix__early_init_devtree(void)
 	 * Try to find the available page sizes in the device-tree
 	 */
 	rc = of_scan_flat_dt(radix_dt_scan_page_sizes, NULL);
-	if (rc != 0)  /* Found */
-		goto found;
+	if (!rc) {
+		/*
+		 * No page size details found in device tree.
+		 * Let's assume we have page 4k and 64k support
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
 
@@ -855,7 +913,8 @@ int __meminit radix__create_section_mapping(unsigned long start,
 		return -1;
 	}
 
-	return create_physical_mapping(__pa(start), __pa(end), nid, prot);
+	return create_physical_mapping(__pa(start), __pa(end),
+				       radix_mem_block_size, nid, prot);
 }
 
 int __meminit radix__remove_section_mapping(unsigned long start, unsigned long end)
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 3bc188da82ba..7fcb88623081 100644
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
+		return radix_mem_block_size;
+	else
+		return 256UL * 1024 * 1024;
 }
 #endif
 
-- 
2.26.2

