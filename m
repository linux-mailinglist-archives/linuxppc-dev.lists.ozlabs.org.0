Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CC14876A805
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 06:49:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZF0PMXO6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RFN1g59Pbz3dH6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Aug 2023 14:49:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=ZF0PMXO6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.ibm.com (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com; envelope-from=aneesh.kumar@linux.ibm.com; receiver=lists.ozlabs.org)
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RFMwd5thRz303l
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Aug 2023 14:45:05 +1000 (AEST)
Received: from pps.filterd (m0353728.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3714cNpc027240;
	Tue, 1 Aug 2023 04:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-transfer-encoding; s=pp1;
 bh=nr0VIsa+mo7jDtNq70UYPHN+oXHQonjpeSqrskH7Sjw=;
 b=ZF0PMXO6DhjAhG1EBEPc2GZtOvEiX1IlCDsYXOxOuttl1BBUm2OBkdyMN5ZzmcEunJIc
 wLLU1KGuABLn6dt5EZzj49hDHiF/IL750hs/NnhxnU6k1uYRNF8iqJ7bg+9t2/EcK/A3
 gkPMk4SaJC1dUE8TDPMF9AEk9jhJy823lx8DW0wDQDmlH5ZcFjEXZ7JvbzzkbMZrl9l6
 DgpjDEEoZqYnwTdKtoz//K91Rxccjg1McvIhBMBfJb3aPQrMOst9g5YgIXJp/eP7Gjc6
 sMMBvbg//rz2g+Xe5fQJoYSk1nUPG4YPp1q5xMkjCc7raKLgC4DaZVlDirySEEntcHYd lw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6u1a8d45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:44:58 +0000
Received: from m0353728.ppops.net (m0353728.ppops.net [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3714cXKl029046;
	Tue, 1 Aug 2023 04:44:58 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3s6u1a8d3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:44:58 +0000
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 3713Mw8e017023;
	Tue, 1 Aug 2023 04:44:56 GMT
Received: from smtprelay06.wdc07v.mail.ibm.com ([172.16.1.73])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3s5dfy14yp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Aug 2023 04:44:56 +0000
Received: from smtpav01.wdc07v.mail.ibm.com (smtpav01.wdc07v.mail.ibm.com [10.39.53.228])
	by smtprelay06.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 3714iueh64487716
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 1 Aug 2023 04:44:56 GMT
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4B495804B;
	Tue,  1 Aug 2023 04:44:55 +0000 (GMT)
Received: from smtpav01.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5424E58055;
	Tue,  1 Aug 2023 04:44:53 +0000 (GMT)
Received: from skywalker.in.ibm.com (unknown [9.109.212.144])
	by smtpav01.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Tue,  1 Aug 2023 04:44:53 +0000 (GMT)
From: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu
Subject: [PATCH v4 1/2] powerpc/mm: Cleanup memory block size probing
Date: Tue,  1 Aug 2023 10:14:46 +0530
Message-ID: <20230801044447.11275-1-aneesh.kumar@linux.ibm.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: QLgPWxHI_bxzRral9XkJ8RFCTgcEAUbi
X-Proofpoint-GUID: umHXjpO71wb5cuucGBXvl2SGdj_k77bO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-08-01_02,2023-07-31_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxscore=0 malwarescore=0 impostorscore=0 clxscore=1015 adultscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308010041
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, foraker1@llnl.gov, Reza Arbab <arbab@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Parse the device tree in early init to find the memory block size to be
used by the kernel. Consolidate the memory block size device tree parsing
to one helper and use that on both powernv and pseries. We still want to
use machine-specific callback because on all machine types other than
powernv and pseries we continue to return MIN_MEMORY_BLOCK_SIZE.

pseries_memory_block_size used to look for the second memory
block (memory@x) to determine the memory_block_size value. This patch
changed that to look at all memory blocks and make sure we can map them all
correctly using the computed memory block size value.

Add workaround to force 256MB memory block size if device driver managed
memory such as GPU memory is present. This helps to add GPU memory
that is not aligned to 1G.

Co-developed-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Reza Arbab <arbab@linux.ibm.com>
Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
---
Changes from v3:
* Update workaround for GPU memory

 arch/powerpc/include/asm/book3s/64/mmu.h      |   5 +-
 arch/powerpc/mm/book3s64/radix_pgtable.c      |  65 +---------
 arch/powerpc/mm/init_64.c                     | 112 ++++++++++++++++++
 arch/powerpc/platforms/powernv/setup.c        |  10 +-
 .../platforms/pseries/hotplug-memory.c        |  60 +---------
 arch/powerpc/platforms/pseries/pseries.h      |   2 -
 arch/powerpc/platforms/pseries/setup.c        |   7 ++
 7 files changed, 126 insertions(+), 135 deletions(-)

diff --git a/arch/powerpc/include/asm/book3s/64/mmu.h b/arch/powerpc/include/asm/book3s/64/mmu.h
index 570a4960cf17..28033fd5403c 100644
--- a/arch/powerpc/include/asm/book3s/64/mmu.h
+++ b/arch/powerpc/include/asm/book3s/64/mmu.h
@@ -71,10 +71,7 @@ extern unsigned int mmu_pid_bits;
 /* Base PID to allocate from */
 extern unsigned int mmu_base_pid;
 
-/*
- * memory block size used with radix translation.
- */
-extern unsigned long __ro_after_init radix_mem_block_size;
+extern unsigned long __ro_after_init memory_block_size;
 
 #define PRTB_SIZE_SHIFT	(mmu_pid_bits + 4)
 #define PRTB_ENTRIES	(1ul << mmu_pid_bits)
diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index e7ea492ac510..b5102491b50f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -37,7 +37,6 @@
 #include <mm/mmu_decl.h>
 
 unsigned int mmu_base_pid;
-unsigned long radix_mem_block_size __ro_after_init;
 
 static __ref void *early_alloc_pgtable(unsigned long size, int nid,
 			unsigned long region_start, unsigned long region_end)
@@ -300,7 +299,7 @@ static int __meminit create_physical_mapping(unsigned long start,
 	bool prev_exec, exec = false;
 	pgprot_t prot;
 	int psize;
-	unsigned long max_mapping_size = radix_mem_block_size;
+	unsigned long max_mapping_size = memory_block_size;
 
 	if (debug_pagealloc_enabled_or_kfence())
 		max_mapping_size = PAGE_SIZE;
@@ -502,58 +501,6 @@ static int __init radix_dt_scan_page_sizes(unsigned long node,
 	return 1;
 }
 
-#ifdef CONFIG_MEMORY_HOTPLUG
-static int __init probe_memory_block_size(unsigned long node, const char *uname, int
-					  depth, void *data)
-{
-	unsigned long *mem_block_size = (unsigned long *)data;
-	const __be32 *prop;
-	int len;
-
-	if (depth != 1)
-		return 0;
-
-	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory"))
-		return 0;
-
-	prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &len);
-
-	if (!prop || len < dt_root_size_cells * sizeof(__be32))
-		/*
-		 * Nothing in the device tree
-		 */
-		*mem_block_size = MIN_MEMORY_BLOCK_SIZE;
-	else
-		*mem_block_size = of_read_number(prop, dt_root_size_cells);
-	return 1;
-}
-
-static unsigned long __init radix_memory_block_size(void)
-{
-	unsigned long mem_block_size = MIN_MEMORY_BLOCK_SIZE;
-
-	/*
-	 * OPAL firmware feature is set by now. Hence we are ok
-	 * to test OPAL feature.
-	 */
-	if (firmware_has_feature(FW_FEATURE_OPAL))
-		mem_block_size = 1UL * 1024 * 1024 * 1024;
-	else
-		of_scan_flat_dt(probe_memory_block_size, &mem_block_size);
-
-	return mem_block_size;
-}
-
-#else   /* CONFIG_MEMORY_HOTPLUG */
-
-static unsigned long __init radix_memory_block_size(void)
-{
-	return 1UL * 1024 * 1024 * 1024;
-}
-
-#endif /* CONFIG_MEMORY_HOTPLUG */
-
-
 void __init radix__early_init_devtree(void)
 {
 	int rc;
@@ -577,16 +524,6 @@ void __init radix__early_init_devtree(void)
 		mmu_psize_defs[MMU_PAGE_64K].h_rpt_pgsize =
 			psize_to_rpti_pgsize(MMU_PAGE_64K);
 	}
-
-	/*
-	 * Max mapping size used when mapping pages. We don't use
-	 * ppc_md.memory_block_size() here because this get called
-	 * early and we don't have machine probe called yet. Also
-	 * the pseries implementation only check for ibm,lmb-size.
-	 * All hypervisor supporting radix do expose that device
-	 * tree node.
-	 */
-	radix_mem_block_size = radix_memory_block_size();
 	return;
 }
 
diff --git a/arch/powerpc/mm/init_64.c b/arch/powerpc/mm/init_64.c
index fe1b83020e0d..d74d4a441616 100644
--- a/arch/powerpc/mm/init_64.c
+++ b/arch/powerpc/mm/init_64.c
@@ -40,6 +40,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/memremap.h>
+#include <linux/memory.h>
 
 #include <asm/pgalloc.h>
 #include <asm/page.h>
@@ -471,6 +472,115 @@ static int __init dt_scan_mmu_pid_width(unsigned long node,
 	return 1;
 }
 
+static void update_memory_block_size(unsigned long *block_size, unsigned long mem_size)
+{
+	unsigned long section_size = 1UL << SECTION_SIZE_BITS;
+
+	for (; *block_size > section_size; *block_size >>= 2) {
+
+		if ((mem_size & *block_size) == 0)
+			break;
+	}
+}
+
+static int __init probe_memory_block_size(unsigned long node, const char *uname, int
+					  depth, void *data)
+{
+	const char *type;
+	unsigned long *block_size = (unsigned long *)data;
+	const __be32 *reg, *endp;
+	int l;
+
+	if (depth != 1)
+		return 0;
+	/*
+	 * If we have dynamic-reconfiguration-memory node, use the
+	 * lmb value.
+	 */
+	if (strcmp(uname, "ibm,dynamic-reconfiguration-memory") == 0) {
+
+		const __be32 *prop;
+
+		prop = of_get_flat_dt_prop(node, "ibm,lmb-size", &l);
+
+		if (!prop || l < dt_root_size_cells * sizeof(__be32))
+			/*
+			 * Nothing in the device tree
+			 */
+			*block_size = MIN_MEMORY_BLOCK_SIZE;
+		else
+			*block_size = of_read_number(prop, dt_root_size_cells);
+		/*
+		 * We have found the final value. Don't probe further.
+		 */
+		return 1;
+	}
+	/*
+	 * Find all the device tree nodes of memory type and make sure
+	 * the area can be mapped using the memory block size value
+	 * we end up using. We start with 1G value and keep reducing
+	 * it such that we can map the entire area using memory_block_size.
+	 * This will be used on powernv and older pseries that don't
+	 * have ibm,lmb-size node.
+	 * For ex: with P5 we can end up with
+	 * memory@0 -> 128MB
+	 * memory@128M -> 64M
+	 * This will end up using 64MB  memory block size value.
+	 */
+	type = of_get_flat_dt_prop(node, "device_type", NULL);
+	if (type == NULL || strcmp(type, "memory") != 0)
+		return 0;
+
+	reg = of_get_flat_dt_prop(node, "linux,usable-memory", &l);
+	if (!reg)
+		reg = of_get_flat_dt_prop(node, "reg", &l);
+	if (!reg)
+		return 0;
+
+	endp = reg + (l / sizeof(__be32));
+	while ((endp - reg) >= (dt_root_addr_cells + dt_root_size_cells)) {
+		const char *compatible;
+		u64 size;
+
+		dt_mem_next_cell(dt_root_addr_cells, &reg);
+		size = dt_mem_next_cell(dt_root_size_cells, &reg);
+
+		if (size) {
+			update_memory_block_size(block_size, size);
+			continue;
+		}
+		/*
+		 * ibm,coherent-device-memory with linux,usable-memory = 0
+		 * Force 256MiB block size. Work around for GPUs on P9 PowerNV
+		 * linux,usable-memory == 0 implies driver managed memory and
+		 * we can't use large memory block size due to hotplug/unplug
+		 * limitations.
+		 */
+		compatible = of_get_flat_dt_prop(node, "compatible", NULL);
+		if (compatible && !strcmp(compatible, "ibm,coherent-device-memory")) {
+			*block_size = SZ_256M;
+			return 1;
+		}
+	}
+	/* continue looking for other memory device types */
+	return 0;
+}
+
+/*
+ * start with 1G memory block size. Early init will
+ * fix this with correct value.
+ */
+unsigned long memory_block_size __ro_after_init = 1UL << 30;
+static void __init early_init_memory_block_size(void)
+{
+	/*
+	 * We need to do memory_block_size probe early so that
+	 * radix__early_init_mmu() can use this as limit for
+	 * mapping page size.
+	 */
+	of_scan_flat_dt(probe_memory_block_size, &memory_block_size);
+}
+
 void __init mmu_early_init_devtree(void)
 {
 	bool hvmode = !!(mfmsr() & MSR_HV);
@@ -504,6 +614,8 @@ void __init mmu_early_init_devtree(void)
 	if (!hvmode)
 		early_check_vec5();
 
+	early_init_memory_block_size();
+
 	if (early_radix_enabled()) {
 		radix__early_init_devtree();
 
diff --git a/arch/powerpc/platforms/powernv/setup.c b/arch/powerpc/platforms/powernv/setup.c
index 5e9c6b55809f..4dbb47ddbdcc 100644
--- a/arch/powerpc/platforms/powernv/setup.c
+++ b/arch/powerpc/platforms/powernv/setup.c
@@ -482,15 +482,7 @@ static void pnv_kexec_cpu_down(int crash_shutdown, int secondary)
 #ifdef CONFIG_MEMORY_HOTPLUG
 static unsigned long pnv_memory_block_size(void)
 {
-	/*
-	 * We map the kernel linear region with 1GB large pages on radix. For
-	 * memory hot unplug to work our memory block size must be at least
-	 * this size.
-	 */
-	if (radix_enabled())
-		return radix_mem_block_size;
-	else
-		return 256UL * 1024 * 1024;
+	return memory_block_size;
 }
 #endif
 
diff --git a/arch/powerpc/platforms/pseries/hotplug-memory.c b/arch/powerpc/platforms/pseries/hotplug-memory.c
index 9c62c2c3b3d0..1333d9ab7621 100644
--- a/arch/powerpc/platforms/pseries/hotplug-memory.c
+++ b/arch/powerpc/platforms/pseries/hotplug-memory.c
@@ -21,54 +21,6 @@
 #include <asm/drmem.h>
 #include "pseries.h"
 
-unsigned long pseries_memory_block_size(void)
-{
-	struct device_node *np;
-	u64 memblock_size = MIN_MEMORY_BLOCK_SIZE;
-	struct resource r;
-
-	np = of_find_node_by_path("/ibm,dynamic-reconfiguration-memory");
-	if (np) {
-		int len;
-		int size_cells;
-		const __be32 *prop;
-
-		size_cells = of_n_size_cells(np);
-
-		prop = of_get_property(np, "ibm,lmb-size", &len);
-		if (prop && len >= size_cells * sizeof(__be32))
-			memblock_size = of_read_number(prop, size_cells);
-		of_node_put(np);
-
-	} else  if (machine_is(pseries)) {
-		/* This fallback really only applies to pseries */
-		unsigned int memzero_size = 0;
-
-		np = of_find_node_by_path("/memory@0");
-		if (np) {
-			if (!of_address_to_resource(np, 0, &r))
-				memzero_size = resource_size(&r);
-			of_node_put(np);
-		}
-
-		if (memzero_size) {
-			/* We now know the size of memory@0, use this to find
-			 * the first memoryblock and get its size.
-			 */
-			char buf[64];
-
-			sprintf(buf, "/memory@%x", memzero_size);
-			np = of_find_node_by_path(buf);
-			if (np) {
-				if (!of_address_to_resource(np, 0, &r))
-					memblock_size = resource_size(&r);
-				of_node_put(np);
-			}
-		}
-	}
-	return memblock_size;
-}
-
 static void dlpar_free_property(struct property *prop)
 {
 	kfree(prop->name);
@@ -283,7 +235,7 @@ static int dlpar_offline_lmb(struct drmem_lmb *lmb)
 
 static int pseries_remove_memblock(unsigned long base, unsigned long memblock_size)
 {
-	unsigned long block_sz, start_pfn;
+	unsigned long start_pfn;
 	int sections_per_block;
 	int i;
 
@@ -294,8 +246,7 @@ static int pseries_remove_memblock(unsigned long base, unsigned long memblock_si
 	if (!pfn_valid(start_pfn))
 		goto out;
 
-	block_sz = pseries_memory_block_size();
-	sections_per_block = block_sz / MIN_MEMORY_BLOCK_SIZE;
+	sections_per_block = memory_block_size / MIN_MEMORY_BLOCK_SIZE;
 
 	for (i = 0; i < sections_per_block; i++) {
 		__remove_memory(base, MIN_MEMORY_BLOCK_SIZE);
@@ -354,7 +305,6 @@ static int dlpar_add_lmb(struct drmem_lmb *);
 static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 {
 	struct memory_block *mem_block;
-	unsigned long block_sz;
 	int rc;
 
 	if (!lmb_is_removable(lmb))
@@ -370,13 +320,11 @@ static int dlpar_remove_lmb(struct drmem_lmb *lmb)
 		return rc;
 	}
 
-	block_sz = pseries_memory_block_size();
-
-	__remove_memory(lmb->base_addr, block_sz);
+	__remove_memory(lmb->base_addr, memory_block_size);
 	put_device(&mem_block->dev);
 
 	/* Update memory regions for memory remove */
-	memblock_remove(lmb->base_addr, block_sz);
+	memblock_remove(lmb->base_addr, memory_block_size);
 
 	invalidate_lmb_associativity_index(lmb);
 	lmb->flags &= ~DRCONF_MEM_ASSIGNED;
diff --git a/arch/powerpc/platforms/pseries/pseries.h b/arch/powerpc/platforms/pseries/pseries.h
index f8bce40ebd0c..02c012976b19 100644
--- a/arch/powerpc/platforms/pseries/pseries.h
+++ b/arch/powerpc/platforms/pseries/pseries.h
@@ -90,8 +90,6 @@ extern struct pci_controller_ops pseries_pci_controller_ops;
 int pseries_msi_allocate_domains(struct pci_controller *phb);
 void pseries_msi_free_domains(struct pci_controller *phb);
 
-unsigned long pseries_memory_block_size(void);
-
 extern int CMO_PrPSP;
 extern int CMO_SecPSP;
 extern unsigned long CMO_PageSize;
diff --git a/arch/powerpc/platforms/pseries/setup.c b/arch/powerpc/platforms/pseries/setup.c
index e2a57cfa6c83..6683debe283e 100644
--- a/arch/powerpc/platforms/pseries/setup.c
+++ b/arch/powerpc/platforms/pseries/setup.c
@@ -1116,6 +1116,13 @@ static int pSeries_pci_probe_mode(struct pci_bus *bus)
 	return PCI_PROBE_NORMAL;
 }
 
+#ifdef CONFIG_MEMORY_HOTPLUG
+static unsigned long pseries_memory_block_size(void)
+{
+	return memory_block_size;
+}
+#endif
+
 struct pci_controller_ops pseries_pci_controller_ops = {
 	.probe_mode		= pSeries_pci_probe_mode,
 #ifdef CONFIG_SPAPR_TCE_IOMMU
-- 
2.41.0

