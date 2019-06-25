Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E6E55993
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:58:45 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJRR0bHBzDqRK
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 06:58:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJ9T1sChzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJ9T0KHdz8vt7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:37 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJ9S6hZhz9s5c; Wed, 26 Jun 2019 06:46:36 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.156.1; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
 [148.163.156.1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45YJ9S1MR5z9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:46:36 +1000 (AEST)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKhmHO043700
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:34 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbr806r96-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:33 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:46:31 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:46:29 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKkRwA52756638
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:46:27 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 91AD6A4053;
 Tue, 25 Jun 2019 20:46:27 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 61235A404D;
 Tue, 25 Jun 2019 20:46:24 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:46:24 +0000 (GMT)
Subject: [PATCH v3 05/16] powerpc/fadump: enable fadump support on OPAL
 based POWER platform
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:16:23 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-4275-0000-0000-000003463662
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-4276-0000-0000-0000385638ED
Message-Id: <156149558325.9094.498713861797398098.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250157
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
Cc: Ananth N Mavinakayanahalli <ananth@linux.ibm.com>,
 Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
 Vasant Hegde <hegdevasant@linux.ibm.com>, Oliver <oohall@gmail.com>,
 Nicholas Piggin <npiggin@gmail.com>, Stewart Smith <stewart@linux.ibm.com>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Hari Bathini <hbathini@linux.vnet.ibm.com>

Firmware-assisted dump support is enabled for OPAL based POWER platforms
in P9 firmware. Make the corresponding updates in kernel to enable fadump
support for such platforms.

Signed-off-by: Hari Bathini <hbathini@linux.vnet.ibm.com>
---
 arch/powerpc/Kconfig                         |    5 
 arch/powerpc/include/asm/opal-api.h          |   58 +++
 arch/powerpc/include/asm/opal.h              |    4 
 arch/powerpc/kernel/fadump-common.c          |   18 +
 arch/powerpc/kernel/fadump-common.h          |   46 ++-
 arch/powerpc/kernel/fadump.c                 |  277 ++++++++++++----
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-call.c   |    2 
 arch/powerpc/platforms/powernv/opal-fadump.c |  443 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |   34 ++
 arch/powerpc/platforms/pseries/rtas-fadump.c |   38 ++
 11 files changed, 837 insertions(+), 89 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 8c1c636..f124a9b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -557,7 +557,7 @@ config CRASH_DUMP
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-	depends on PPC64 && PPC_RTAS
+	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
 	select CRASH_CORE
 	select CRASH_DUMP
 	help
@@ -568,7 +568,8 @@ config FA_DUMP
 	  is meant to be a kdump replacement offering robustness and
 	  speed not possible without system firmware assistance.
 
-	  If unsure, say "N"
+	  If unsure, say "y". Only special kernels like petitboot may
+	  need to say "N" here.
 
 config IRQ_ALL_CPUS
 	bool "Distribute interrupts on all CPUs by default"
diff --git a/arch/powerpc/include/asm/opal-api.h b/arch/powerpc/include/asm/opal-api.h
index 09a8553..1762b1e 100644
--- a/arch/powerpc/include/asm/opal-api.h
+++ b/arch/powerpc/include/asm/opal-api.h
@@ -208,7 +208,9 @@
 #define OPAL_HANDLE_HMI2			166
 #define	OPAL_NX_COPROC_INIT			167
 #define OPAL_XIVE_GET_VP_STATE			170
-#define OPAL_LAST				170
+#define OPAL_MPIPL_UPDATE			173
+#define OPAL_MPIPL_QUERY_TAG			174
+#define OPAL_LAST				174
 
 #define QUIESCE_HOLD			1 /* Spin all calls at entry */
 #define QUIESCE_REJECT			2 /* Fail all calls with OPAL_BUSY */
@@ -979,6 +981,59 @@ struct opal_sg_list {
 };
 
 /*
+ * Firmware-Assisted Dump (FADump)
+ */
+
+/* The maximum number of dump sections supported by OPAL */
+#define OPAL_FADUMP_NR_SECTIONS			64
+
+/* Kernel Dump region info */
+struct opal_fadump_region {
+	__be64	src;
+	__be64	dest;
+	__be64	size;
+} __attribute__((packed));
+
+/* FADump structure format version */
+#define MPIPL_FADUMP_VERSION			0x01
+
+/*
+ * Metadata type. Kernel uses this field to identify the
+ * type of data
+ */
+#define MPIPL_FADUMP_TYPE_CPU			0x00
+/* OPAL : 0x01 – 0x39 */
+#define MPIPL_FADUMP_TYPE_OPAL			0x01
+/* Firmware/SMF : 0x40 – 0x79 */
+#define MPIPL_FADUMP_TYPE_FW			0x40
+/* Kernel memory region : 0x80 – 0xb9 */
+#define MPIPL_FADUMP_TYPE_KERNEL		0x80
+/* Reserved for future use : 0xc0 – 0xff */
+#define MPIPL_FADUMP_TYPE_RESERVED		0xc0
+
+/* OPAL MPIPL FADump metadata */
+struct opal_mpipl_fadump {
+	u8	type;
+	u8	version;
+	u8	reserved[6];
+	__be32	crashing_pir;
+	__be32	cpu_data_version;
+	__be32	cpu_data_size;
+	__be32	region_cnt;
+
+	struct opal_fadump_region	region[OPAL_FADUMP_NR_SECTIONS];
+} __attribute__((packed));
+
+/* MPIPL update operations */
+enum mpipl_ops {
+	OPAL_MPIPL_REGISTER_TAG			= 0,
+	OPAL_MPIPL_ADD_RANGE			= 1,
+	OPAL_MPIPL_REMOVE_RANGE			= 2,
+	OPAL_MPIPL_REMOVE_ALL			= 3,
+	OPAL_MPIPL_FREE_PRESERVED_MEMORY	= 4,
+};
+
+/*
  * Dump region ID range usable by the OS
  */
 #define OPAL_DUMP_REGION_HOST_START		0x80
@@ -1058,6 +1113,7 @@ enum {
 	OPAL_REBOOT_NORMAL		= 0,
 	OPAL_REBOOT_PLATFORM_ERROR	= 1,
 	OPAL_REBOOT_FULL_IPL		= 2,
+	OPAL_REBOOT_OS_ERROR		= 3,
 };
 
 /* Argument to OPAL_PCI_TCE_KILL */
diff --git a/arch/powerpc/include/asm/opal.h b/arch/powerpc/include/asm/opal.h
index 4ed5d57..4c99421 100644
--- a/arch/powerpc/include/asm/opal.h
+++ b/arch/powerpc/include/asm/opal.h
@@ -39,6 +39,10 @@ int64_t opal_npu_spa_clear_cache(uint64_t phb_id, uint32_t bdfn,
 				uint64_t PE_handle);
 int64_t opal_npu_tl_set(uint64_t phb_id, uint32_t bdfn, long cap,
 			uint64_t rate_phys, uint32_t size);
+
+int64_t opal_mpipl_update(enum mpipl_ops ops,  u64 src, u64 dest, u64 size);
+int64_t opal_mpipl_query_tag(uint32_t idx, uint64_t *tag);
+
 int64_t opal_console_write(int64_t term_number, __be64 *length,
 			   const uint8_t *buffer);
 int64_t opal_console_read(int64_t term_number, __be64 *length,
diff --git a/arch/powerpc/kernel/fadump-common.c b/arch/powerpc/kernel/fadump-common.c
index 0182886..65cc178 100644
--- a/arch/powerpc/kernel/fadump-common.c
+++ b/arch/powerpc/kernel/fadump-common.c
@@ -10,6 +10,9 @@
  * 2 of the License, or (at your option) any later version.
  */
 
+#undef DEBUG
+#define pr_fmt(fmt) "fadump: " fmt
+
 #include <linux/memblock.h>
 #include <linux/elf.h>
 #include <linux/mm.h>
@@ -165,10 +168,19 @@ static int is_memory_area_contiguous(unsigned long d_start,
  */
 int is_boot_memory_area_contiguous(struct fw_dump *fadump_conf)
 {
-	unsigned long d_start = RMA_START;
-	unsigned long d_end   = RMA_START + fadump_conf->boot_memory_size;
+	int i, ret = 0;
+	unsigned long d_start, d_end;
 
-	return is_memory_area_contiguous(d_start, d_end);
+	for (i = 0; i < fadump_conf->rmr_regions_cnt; i++) {
+		d_start = fadump_conf->rmr_src_addr[i];
+		d_end   = d_start + fadump_conf->rmr_src_size[i];
+
+		ret = is_memory_area_contiguous(d_start, d_end);
+		if (!ret)
+			break;
+	}
+
+	return ret;
 }
 
 /*
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 1eb1397..36f4d71 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -47,12 +47,6 @@
 #define FADUMP_UNREGISTER		2
 #define FADUMP_INVALIDATE		3
 
-/* Firmware-Assited Dump platforms */
-enum fadump_platform_type {
-	FADUMP_PLATFORM_UNKNOWN = 0,
-	FADUMP_PLATFORM_PSERIES,
-};
-
 #define FADUMP_CPU_ID_MASK		((1UL << 32) - 1)
 
 #define CPU_UNKNOWN			(~((u32)0))
@@ -92,13 +86,23 @@ struct fadump_crash_info_header {
 	struct cpumask	online_mask;
 };
 
-struct fad_crash_memory_ranges {
+/* Platform specific callback functions */
+struct fadump_ops;
+
+/* Firmware-Assited Dump platforms */
+enum fadump_platform_type {
+	FADUMP_PLATFORM_UNKNOWN = 0,
+	FADUMP_PLATFORM_PSERIES,
+	FADUMP_PLATFORM_POWERNV,
+};
+
+struct fadump_memory_range {
 	unsigned long long	base;
 	unsigned long long	size;
 };
 
-/* Platform specific callback functions */
-struct fadump_ops;
+/* Maximum no. of real memory regions supported by the kernel */
+#define MAX_REAL_MEM_REGIONS		8
 
 /* Firmware-assisted dump configuration details. */
 struct fw_dump {
@@ -118,6 +122,18 @@ struct fw_dump {
 	unsigned long	rmr_source_len;
 	unsigned long	rmr_destination_addr;
 
+	unsigned long	boot_memory_hole_size;
+	unsigned long	rmr_regions_cnt;
+	unsigned long	rmr_src_addr[MAX_REAL_MEM_REGIONS];
+	unsigned long	rmr_src_size[MAX_REAL_MEM_REGIONS];
+
+	/*
+	 * Maximum size supported by firmware to copy from source to
+	 * destination address per entry.
+	 */
+	unsigned long	max_copy_size;
+	u64		kernel_metadata;
+
 	int		ibm_configure_kernel_dump;
 
 	unsigned long	fadump_enabled:1;
@@ -132,6 +148,8 @@ struct fw_dump {
 
 struct fadump_ops {
 	ulong	(*init_fadump_mem_struct)(struct fw_dump *fadump_config);
+	ulong	(*get_kernel_metadata_size)(void);
+	int	(*setup_kernel_metadata)(struct fw_dump *fadump_config);
 	int	(*register_fadump)(struct fw_dump *fadump_config);
 	int	(*unregister_fadump)(struct fw_dump *fadump_config);
 	int	(*invalidate_fadump)(struct fw_dump *fadump_config);
@@ -161,4 +179,14 @@ pseries_dt_scan_fadump(struct fw_dump *fadump_config, ulong node)
 }
 #endif
 
+#ifdef CONFIG_PPC_POWERNV
+extern int opal_dt_scan_fadump(struct fw_dump *fadump_config, ulong node);
+#else
+static inline int
+opal_dt_scan_fadump(struct fw_dump *fadump_config, ulong node)
+{
+	return 1;
+}
+#endif
+
 #endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index c04121f..f2c2d4a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,7 +36,7 @@
 static struct fw_dump fw_dump;
 
 static DEFINE_MUTEX(fadump_mutex);
-struct fad_crash_memory_ranges *crash_memory_ranges;
+struct fadump_memory_range *crash_memory_ranges;
 int crash_memory_ranges_size;
 int crash_mem_ranges;
 int max_crash_mem_ranges;
@@ -114,6 +114,9 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 	if (strcmp(uname, "rtas") == 0)
 		return pseries_dt_scan_fadump(&fw_dump, node);
 
+	if (strcmp(uname, "ibm,opal") == 0)
+		return opal_dt_scan_fadump(&fw_dump, node);
+
 	return 0;
 }
 
@@ -125,6 +128,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 {
 	u64 d_start = fw_dump.reserve_dump_area_start;
 	u64 d_end = d_start + fw_dump.reserve_dump_area_size;
+	u64 b_end = fw_dump.boot_memory_size + fw_dump.boot_memory_hole_size;
 
 	if (!fw_dump.dump_registered)
 		return 0;
@@ -132,7 +136,7 @@ int is_fadump_memory_area(u64 addr, ulong size)
 	if (((addr + size) > d_start) && (addr <= d_end))
 		return 1;
 
-	return (addr + size) > RMA_START && addr <= fw_dump.boot_memory_size;
+	return (((addr + size) > RMA_START) && (addr <= b_end));
 }
 
 int should_fadump_crash(void)
@@ -150,6 +154,8 @@ int is_fadump_active(void)
 /* Print firmware assisted dump configurations for debugging purpose. */
 static void fadump_show_config(void)
 {
+	int i;
+
 	pr_debug("Support for firmware-assisted dump (fadump): %s\n",
 			(fw_dump.fadump_supported ? "present" : "no support"));
 
@@ -164,6 +170,13 @@ static void fadump_show_config(void)
 	pr_debug("    CPU state data size: %lx\n", fw_dump.cpu_state_data_size);
 	pr_debug("    HPTE region size   : %lx\n", fw_dump.hpte_region_size);
 	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
+	pr_debug("Real memory region hole size  : %lx\n",
+		 fw_dump.boot_memory_hole_size);
+	pr_debug("Real meory regions count : %lx\n", fw_dump.rmr_regions_cnt);
+	for (i = 0; i < fw_dump.rmr_regions_cnt; i++) {
+		pr_debug("%d. RMR base = %lx, size = %lx\n", (i+1),
+			 fw_dump.rmr_src_addr[i], fw_dump.rmr_src_size[i]);
+	}
 }
 
 /**
@@ -255,42 +268,128 @@ static unsigned long get_fadump_area_size(void)
 	size += sizeof(struct elf_phdr) * (memblock_num_regions(memory) + 2);
 
 	size = PAGE_ALIGN(size);
+
+	/* This is to hold kernel metadata on platforms that support it */
+	size += fw_dump.ops->get_kernel_metadata_size();
 	return size;
 }
 
-static void __init fadump_reserve_crash_area(unsigned long base,
-					     unsigned long size)
+static int __init add_rmr_region(unsigned long rmr_start,
+				 unsigned long rmr_size)
+{
+	int i = fw_dump.rmr_regions_cnt++;
+
+	if (fw_dump.rmr_regions_cnt > MAX_REAL_MEM_REGIONS)
+		return 0;
+
+	pr_debug("Added real memory range[%d] [%#016lx-%#016lx)\n",
+		 i, rmr_start, (rmr_start + rmr_size));
+	fw_dump.rmr_src_addr[i] = rmr_start;
+	fw_dump.rmr_src_size[i] = rmr_size;
+	return 1;
+}
+
+/*
+ * Platforms like PowerNV have an upper limit on the size.
+ * If 'rmr_size' is bigger than that limit, split this memory range
+ * into multiple entries.
+ */
+static int __init add_rmr_regions(unsigned long rmr_start,
+				  unsigned long rmr_size)
+{
+	unsigned long rstart, rsize, max_size;
+	int ret = 1;
+
+	rstart = rmr_start;
+	max_size = fw_dump.max_copy_size ? fw_dump.max_copy_size : rmr_size;
+	while (rmr_size) {
+		if (rmr_size > max_size)
+			rsize = max_size;
+		else
+			rsize = rmr_size;
+
+		ret = add_rmr_region(rstart, rsize);
+		if (!ret)
+			break;
+
+		rmr_size -= rsize;
+		rstart += rsize;
+	}
+
+	return ret;
+}
+
+static int __init fadump_get_rmr_regions(void)
+{
+	int ret = 1;
+	struct memblock_region *reg;
+	unsigned long base, size, cur_size, last_end;
+	unsigned long mem_size = fw_dump.boot_memory_size;
+
+	fw_dump.rmr_regions_cnt = 0;
+	fw_dump.boot_memory_hole_size = 0;
+
+	last_end = 0;
+	cur_size = 0;
+	for_each_memblock(memory, reg) {
+		base = reg->base;
+		size = reg->size;
+		fw_dump.boot_memory_hole_size += (base - last_end);
+
+		if ((cur_size + size) >= mem_size) {
+			size = (mem_size - cur_size);
+			ret = add_rmr_regions(base, size);
+			break;
+		}
+
+		mem_size -= size;
+		cur_size += size;
+		ret = add_rmr_regions(base, size);
+		if (!ret)
+			break;
+
+		last_end = base + size;
+	}
+
+	return ret;
+}
+
+/* Preserve everything above the base address */
+static void __init fadump_reserve_crash_area(unsigned long base)
 {
 	struct memblock_region *reg;
-	unsigned long mstart, mend, msize;
+	unsigned long mstart, msize;
 
 	for_each_memblock(memory, reg) {
-		mstart = max_t(unsigned long, base, reg->base);
-		mend = reg->base + reg->size;
-		mend = min(base + size, mend);
-
-		if (mstart < mend) {
-			msize = mend - mstart;
-			memblock_reserve(mstart, msize);
-			pr_info("Reserved %ldMB of memory at %#016lx for saving crash dump\n",
-				(msize >> 20), mstart);
+		mstart = reg->base;
+		msize  = reg->size;
+
+		if ((mstart + msize) < base)
+			continue;
+
+		if (mstart < base) {
+			msize -= (base - mstart);
+			mstart = base;
 		}
+		pr_info("Reserving %luMB of memory at %#016lx for saving crash dump",
+			(msize >> 20), mstart);
+		memblock_reserve(mstart, msize);
 	}
 }
 
 int __init fadump_reserve_mem(void)
 {
+	int ret = 1;
 	unsigned long base, size, memory_boundary;
 
 	if (!fw_dump.fadump_enabled)
 		return 0;
 
 	if (!fw_dump.fadump_supported) {
-		printk(KERN_INFO "Firmware-assisted dump is not supported on"
-				" this hardware\n");
-		fw_dump.fadump_enabled = 0;
-		return 0;
+		pr_info("Firmware-Assisted Dump is not supported on this hardware\n");
+		goto error_out;
 	}
+
 	/*
 	 * Initialize boot memory size
 	 * If dump is active then we have already calculated the size during
@@ -307,9 +406,14 @@ int __init fadump_reserve_mem(void)
 							FADUMP_CMA_ALIGNMENT);
 #endif
 		fw_dump.rmr_source_len = fw_dump.boot_memory_size;
+		if (!fadump_get_rmr_regions()) {
+			pr_err("Too many holes in boot memory area to enable fadump\n");
+			goto error_out;
+		}
 	}
 
 	size = get_fadump_area_size();
+	fw_dump.reserve_dump_area_size = size;
 
 	/*
 	 * Calculate the memory boundary.
@@ -330,6 +434,8 @@ int __init fadump_reserve_mem(void)
 	else
 		memory_boundary = memblock_end_of_DRAM();
 
+	base = fw_dump.boot_memory_size + fw_dump.boot_memory_hole_size;
+	base = PAGE_ALIGN(base);
 	if (fw_dump.dump_active) {
 #ifdef CONFIG_HUGETLB_PAGE
 		/*
@@ -341,17 +447,14 @@ int __init fadump_reserve_mem(void)
 #endif
 		/*
 		 * If last boot has crashed then reserve all the memory
-		 * above boot_memory_size so that we don't touch it until
+		 * above boot memory size so that we don't touch it until
 		 * dump is written to disk by userspace tool. This memory
-		 * will be released for general use once the dump is saved.
+		 * can be released for general use by invalidating fadump.
 		 */
-		base = fw_dump.boot_memory_size;
-		size = memory_boundary - base;
-		fadump_reserve_crash_area(base, size);
+		fadump_reserve_crash_area(base);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
 	} else {
 		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
@@ -359,30 +462,43 @@ int __init fadump_reserve_mem(void)
 		 * use memblock_find_in_range() here since it doesn't allocate
 		 * from bottom to top.
 		 */
-		for (base = fw_dump.boot_memory_size;
-		     base <= (memory_boundary - size);
-		     base += size) {
+		while (base <= (memory_boundary - size)) {
 			if (memblock_is_region_memory(base, size) &&
 			    !memblock_is_region_reserved(base, size))
 				break;
+
+			base += size;
+		}
+
+		if (base > (memory_boundary - size)) {
+			pr_err("Failed to find memory chunk for reservation\n");
+			goto error_out;
 		}
-		if ((base > (memory_boundary - size)) ||
-		    memblock_reserve(base, size)) {
+
+		/*
+		 * Calculate the kernel metadata address and register it with
+		 * f/w if the platform supports.
+		 */
+		if (fw_dump.ops->setup_kernel_metadata(&fw_dump) < 0)
+			goto error_out;
+
+		if (memblock_reserve(base, size)) {
 			pr_err("Failed to reserve memory\n");
-			return 0;
+			goto error_out;
 		}
 
-		pr_info("Reserved %ldMB of memory at %ldMB for firmware-"
-			"assisted dump (System RAM: %ldMB)\n",
-			(unsigned long)(size >> 20),
-			(unsigned long)(base >> 20),
+		pr_info("Reserved %ldMB of memory at %#016lx (System RAM: %ldMB)\n",
+			(unsigned long)(size >> 20), base,
 			(unsigned long)(memblock_phys_mem_size() >> 20));
 
 		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
-		return fadump_cma_init();
+		ret = fadump_cma_init();
 	}
-	return 1;
+
+	return ret;
+error_out:
+	fw_dump.fadump_enabled = 0;
+	return 0;
 }
 
 unsigned long __init arch_reserved_kernel_pages(void)
@@ -481,7 +597,7 @@ static void free_crash_memory_ranges(void)
  */
 static int allocate_crash_memory_ranges(void)
 {
-	struct fad_crash_memory_ranges *new_array;
+	struct fadump_memory_range *new_array;
 	u64 new_size;
 
 	new_size = crash_memory_ranges_size + PAGE_SIZE;
@@ -498,7 +614,7 @@ static int allocate_crash_memory_ranges(void)
 	crash_memory_ranges = new_array;
 	crash_memory_ranges_size = new_size;
 	max_crash_mem_ranges = (new_size /
-				sizeof(struct fad_crash_memory_ranges));
+				sizeof(struct fadump_memory_range));
 	return 0;
 }
 
@@ -610,36 +726,40 @@ static int fadump_init_elfcore_header(char *bufp)
 static int fadump_setup_crash_memory_ranges(void)
 {
 	struct memblock_region *reg;
-	unsigned long long start, end;
-	int ret;
+	unsigned long long start, end, offset;
+	int i, ret;
 
 	pr_debug("Setup crash memory ranges.\n");
 	crash_mem_ranges = 0;
+	offset = fw_dump.boot_memory_size + fw_dump.boot_memory_hole_size;
 
 	/*
-	 * add the first memory chunk (RMA_START through boot_memory_size) as
-	 * a separate memory chunk. The reason is, at the time crash firmware
-	 * will move the content of this memory chunk to different location
-	 * specified during fadump registration. We need to create a separate
-	 * program header for this chunk with the correct offset.
+	 * Add real memory region(s) whose content is going to be moved to
+	 * a different location, specified during fadump registration, by
+	 * firmware at the time of crash. We need to create separate program
+	 * header(s) for this memory chunk with the correct offset.
 	 */
-	ret = fadump_add_crash_memory(RMA_START, fw_dump.boot_memory_size);
-	if (ret)
-		return ret;
+	for (i = 0; i < fw_dump.rmr_regions_cnt; i++) {
+		start = fw_dump.rmr_src_addr[i];
+		end = start + fw_dump.rmr_src_size[i];
+		ret = fadump_add_crash_memory(start, end);
+		if (ret)
+			return ret;
+	}
 
 	for_each_memblock(memory, reg) {
 		start = (unsigned long long)reg->base;
 		end = start + (unsigned long long)reg->size;
 
 		/*
-		 * skip the first memory chunk that is already added (RMA_START
+		 * Skip the first memory chunk that is already added (RMA_START
 		 * through boot_memory_size). This logic needs a relook if and
 		 * when RMA_START changes to a non-zero value.
 		 */
 		BUILD_BUG_ON(RMA_START != 0);
-		if (start < fw_dump.boot_memory_size) {
-			if (end > fw_dump.boot_memory_size)
-				start = fw_dump.boot_memory_size;
+		if (start < offset) {
+			if (end > offset)
+				start = offset;
 			else
 				continue;
 		}
@@ -660,17 +780,35 @@ static int fadump_setup_crash_memory_ranges(void)
  */
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
-	if (paddr > RMA_START && paddr < fw_dump.boot_memory_size)
-		return fw_dump.rmr_destination_addr + paddr;
-	else
-		return paddr;
+	unsigned long raddr, rstart, rend, rlast, hole_size;
+	int i;
+
+	hole_size = 0;
+	rlast = 0;
+	raddr = paddr;
+	for (i = 0; i < fw_dump.rmr_regions_cnt; i++) {
+		rstart = fw_dump.rmr_src_addr[i];
+		rend = rstart + fw_dump.rmr_src_size[i];
+		hole_size += (rstart - rlast);
+
+		if (paddr >= rstart && paddr < rend) {
+			raddr += fw_dump.rmr_destination_addr - hole_size;
+			break;
+		}
+
+		rlast = rend;
+	}
+
+	pr_debug("vmcoreinfo: paddr = 0x%lx, raddr = 0x%lx\n", paddr, raddr);
+	return raddr;
 }
 
 static int fadump_create_elfcore_headers(char *bufp)
 {
 	struct elfhdr *elf;
 	struct elf_phdr *phdr;
-	int i;
+	unsigned long long raddr, offset;
+	int i, j;
 
 	fadump_init_elfcore_header(bufp);
 	elf = (struct elfhdr *)bufp;
@@ -713,9 +851,12 @@ static int fadump_create_elfcore_headers(char *bufp)
 	(elf->e_phnum)++;
 
 	/* setup PT_LOAD sections. */
-
+	j = 0;
+	offset = 0;
+	raddr = fw_dump.rmr_src_addr[0];
 	for (i = 0; i < crash_mem_ranges; i++) {
 		unsigned long long mbase, msize;
+
 		mbase = crash_memory_ranges[i].base;
 		msize = crash_memory_ranges[i].size;
 
@@ -728,13 +869,17 @@ static int fadump_create_elfcore_headers(char *bufp)
 		phdr->p_flags	= PF_R|PF_W|PF_X;
 		phdr->p_offset	= mbase;
 
-		if (mbase == RMA_START) {
+		if (mbase == raddr) {
 			/*
 			 * The entire RMA region will be moved by firmware
 			 * to the specified destination_address. Hence set
 			 * the correct offset.
 			 */
-			phdr->p_offset = fw_dump.rmr_destination_addr;
+			phdr->p_offset = fw_dump.rmr_destination_addr + offset;
+			if (j < (fw_dump.rmr_regions_cnt - 1)) {
+				offset += fw_dump.rmr_src_size[j];
+				raddr = fw_dump.rmr_src_addr[++j];
+			}
 		}
 
 		phdr->p_paddr = mbase;
@@ -900,14 +1045,14 @@ static void fadump_invalidate_release_mem(void)
 	 * later for releasing the memory for general use.
 	 */
 	reserved_area_start = fw_dump.reserve_dump_area_start;
-	reserved_area_end = reserved_area_start +
-			fw_dump.reserve_dump_area_size;
+	reserved_area_end =
+		memory_limit ? memory_limit : memblock_end_of_DRAM();
+
 	/*
-	 * Setup reserve_dump_area_start and its size so that we can
-	 * reuse this reserved memory for Re-registration.
+	 * Setup reserve_dump_area_start so that we can reuse this
+	 * reserved memory for Re-registration.
 	 */
 	fw_dump.reserve_dump_area_start = destination_address;
-	fw_dump.reserve_dump_area_size = get_fadump_area_size();
 
 	fadump_release_memory(reserved_area_start, reserved_area_end);
 	if (fw_dump.cpu_notes_buf) {
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index da2e99e..43a6e1c 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -6,6 +6,7 @@ obj-y			+= opal-msglog.o opal-hmi.o opal-power.o opal-irqchip.o
 obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
 
 obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
+obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
 obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
 obj-$(CONFIG_EEH)	+= eeh-powernv.o
diff --git a/arch/powerpc/platforms/powernv/opal-call.c b/arch/powerpc/platforms/powernv/opal-call.c
index 36c8fa3..66ecc64 100644
--- a/arch/powerpc/platforms/powernv/opal-call.c
+++ b/arch/powerpc/platforms/powernv/opal-call.c
@@ -288,3 +288,5 @@ OPAL_CALL(opal_pci_set_pbcq_tunnel_bar,		OPAL_PCI_SET_PBCQ_TUNNEL_BAR);
 OPAL_CALL(opal_sensor_read_u64,			OPAL_SENSOR_READ_U64);
 OPAL_CALL(opal_sensor_group_enable,		OPAL_SENSOR_GROUP_ENABLE);
 OPAL_CALL(opal_nx_coproc_init,			OPAL_NX_COPROC_INIT);
+OPAL_CALL(opal_mpipl_update,			OPAL_MPIPL_UPDATE);
+OPAL_CALL(opal_mpipl_query_tag,			OPAL_MPIPL_QUERY_TAG);
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
new file mode 100644
index 0000000..7e6c46a
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -0,0 +1,443 @@
+/*
+ * Firmware-Assisted Dump support on POWER platform (OPAL).
+ *
+ * Copyright 2018-2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.vnet.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#undef DEBUG
+#define pr_fmt(fmt) "opal fadump: " fmt
+
+#include <linux/string.h>
+#include <linux/memblock.h>
+#include <linux/bug.h>
+#include <linux/seq_file.h>
+#include <linux/crash_dump.h>
+#include <linux/libfdt.h>
+
+#include <asm/page.h>
+#include <asm/prom.h>
+#include <asm/opal.h>
+#include <asm/fadump.h>
+
+#include "../../kernel/fadump-common.h"
+#include "opal-fadump.h"
+
+static const struct opal_fadump_mem_struct *opal_fdm_active;
+static struct opal_fadump_mem_struct *opal_fdm;
+
+static void opal_set_preserv_area_start(struct fw_dump *fadump_conf)
+{
+	fadump_conf->preserv_area_start = fadump_conf->rmr_destination_addr;
+
+	pr_debug("Preserve area start address: 0x%lx\n",
+		 fadump_conf->preserv_area_start);
+}
+
+static void update_fadump_config(struct fw_dump *fadump_conf,
+				 const struct opal_fadump_mem_struct *fdm)
+{
+	unsigned long base, size, last_end, hole_size;
+	int i, j;
+
+	pr_debug("regions count: %d\n", fdm->region_cnt);
+
+	/*
+	 * The first real memory region entry is the real memory
+	 * regions destination address.
+	 */
+	fadump_conf->rmr_destination_addr = fdm->rgn[0].dest;
+	pr_debug("Destination address of real memory regions: %#016lx\n",
+		 fadump_conf->rmr_destination_addr);
+
+	if (fadump_conf->dump_active) {
+		j = 0;
+		last_end = 0;
+		fadump_conf->rmr_source_len = 0;
+		fadump_conf->boot_memory_hole_size = 0;
+		for (i = 0; i < fdm->region_cnt; i++) {
+			base = fdm->rgn[i].src;
+			size = fdm->rgn[i].size;
+			pr_debug("%d. RMR base: 0x%lx, size: 0x%lx\n",
+				 (i + 1), base, size);
+
+			fadump_conf->rmr_src_addr[j] = base;
+			fadump_conf->rmr_src_size[j] = size;
+			fadump_conf->rmr_source_len += size;
+
+			hole_size = 0;
+			if (base > last_end)
+				hole_size = (base - last_end);
+
+			fadump_conf->boot_memory_hole_size += hole_size;
+			last_end = base + size;
+			j++;
+		}
+
+		fadump_conf->rmr_regions_cnt = j;
+		pr_debug("Real memory regions count: %lu\n",
+			 fadump_conf->rmr_regions_cnt);
+	}
+
+	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
+	opal_set_preserv_area_start(fadump_conf);
+}
+
+static ulong opal_init_fadump_mem_struct(struct fw_dump *fadump_conf)
+{
+	ulong addr = fadump_conf->reserve_dump_area_start;
+	int i;
+
+	opal_fdm = __va(fadump_conf->kernel_metadata);
+	opal_fdm->type = MPIPL_FADUMP_TYPE_KERNEL;
+	opal_fdm->version = FADUMP_VERSION;
+	opal_fdm->region_cnt = 0;
+
+	/* RMA regions */
+	for (i = 0; i < fadump_conf->rmr_regions_cnt; i++) {
+		opal_fdm->rgn[i].src	= fadump_conf->rmr_src_addr[i];
+		opal_fdm->rgn[i].dest	= addr;
+		opal_fdm->rgn[i].size	= fadump_conf->rmr_src_size[i];
+
+		opal_fdm->region_cnt++;
+		addr += fadump_conf->rmr_src_size[i];
+	}
+
+	/*
+	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
+	 * So, use it to save fadump header address instead of calculating it.
+	 */
+	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
+				    fadump_conf->rmr_source_len);
+
+	update_fadump_config(fadump_conf, opal_fdm);
+
+	return addr;
+}
+
+static ulong opal_get_kernel_metadata_size(void)
+{
+	ulong size = sizeof(struct opal_fadump_mem_struct);
+
+	size = PAGE_ALIGN(size);
+	return size;
+}
+
+static int opal_setup_kernel_metadata(struct fw_dump *fadump_conf)
+{
+	int err = 0;
+	s64 ret;
+
+	/*
+	 * Use the last page(s) in FADump memory reservation for
+	 * kernel metadata.
+	 */
+	fadump_conf->kernel_metadata = (fadump_conf->reserve_dump_area_start +
+					fadump_conf->reserve_dump_area_size -
+					opal_get_kernel_metadata_size());
+	pr_info("Kernel metadata addr: %llx\n", fadump_conf->kernel_metadata);
+
+	/*
+	 * Register metadata address with f/w. Can be retrieved in
+	 * the capture kernel.
+	 */
+	ret = opal_mpipl_update(OPAL_MPIPL_REGISTER_TAG,
+				fadump_conf->kernel_metadata, 0, 0);
+	if (ret != OPAL_SUCCESS) {
+		pr_err("Failed to set kernel metadata tag!\n");
+		err = -EPERM;
+	}
+
+	return err;
+}
+
+static int opal_register_fadump(struct fw_dump *fadump_conf)
+{
+	int i, err = -EIO;
+	s64 rc;
+
+	for (i = 0; i < opal_fdm->region_cnt; i++) {
+		rc = opal_mpipl_update(OPAL_MPIPL_ADD_RANGE,
+				       opal_fdm->rgn[i].src,
+				       opal_fdm->rgn[i].dest,
+				       opal_fdm->rgn[i].size);
+		if (rc != OPAL_SUCCESS)
+			break;
+	}
+
+	switch (rc) {
+	case OPAL_SUCCESS:
+		pr_info("Registration is successful!\n");
+		fadump_conf->dump_registered = 1;
+		err = 0;
+		break;
+	case OPAL_UNSUPPORTED:
+		pr_err("Support not available.\n");
+		fadump_conf->fadump_supported = 0;
+		fadump_conf->fadump_enabled = 0;
+		break;
+	case OPAL_INTERNAL_ERROR:
+		pr_err("Failed to register. Hardware Error(%lld).\n", rc);
+		break;
+	case OPAL_PARAMETER:
+		pr_err("Failed to register. Parameter Error(%lld).\n", rc);
+		break;
+	case OPAL_PERMISSION:
+		pr_err("Already registered!\n");
+		fadump_conf->dump_registered = 1;
+		err = -EEXIST;
+		break;
+	default:
+		pr_err("Failed to register. Unknown Error(%lld).\n", rc);
+		break;
+	}
+
+	return err;
+}
+
+static int opal_unregister_fadump(struct fw_dump *fadump_conf)
+{
+	s64 rc;
+
+	rc = opal_mpipl_update(OPAL_MPIPL_REMOVE_ALL, 0, 0, 0);
+	if (rc) {
+		pr_err("Failed to un-register - unexpected Error(%lld).\n", rc);
+		return -EIO;
+	}
+
+	fadump_conf->dump_registered = 0;
+	return 0;
+}
+
+static int opal_invalidate_fadump(struct fw_dump *fadump_conf)
+{
+	s64 rc;
+
+	rc = opal_mpipl_update(OPAL_MPIPL_FREE_PRESERVED_MEMORY, 0, 0, 0);
+	if (rc) {
+		pr_err("Failed to invalidate - unexpected Error(%lld).\n", rc);
+		return -EIO;
+	}
+
+	fadump_conf->dump_active = 0;
+	opal_fdm_active = NULL;
+	return 0;
+}
+
+/*
+ * Read CPU state dump data and convert it into ELF notes.
+ *
+ * Each register entry is of 16 bytes, A numerical identifier along with
+ * a GPR/SPR flag in the first 8 bytes and the register value in the next
+ * 8 bytes. For more details refer to F/W documentation.
+ */
+static int __init fadump_build_cpu_notes(struct fw_dump *fadump_conf)
+{
+	u32 num_cpus, *note_buf;
+	struct fadump_crash_info_header *fdh = NULL;
+
+	num_cpus = 1;
+	/* Allocate buffer to hold cpu crash notes. */
+	fadump_conf->cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
+	fadump_conf->cpu_notes_buf_size =
+		PAGE_ALIGN(fadump_conf->cpu_notes_buf_size);
+	note_buf = fadump_cpu_notes_buf_alloc(fadump_conf->cpu_notes_buf_size);
+	if (!note_buf) {
+		pr_err("Failed to allocate 0x%lx bytes for cpu notes buffer\n",
+		       fadump_conf->cpu_notes_buf_size);
+		return -ENOMEM;
+	}
+	fadump_conf->cpu_notes_buf = __pa(note_buf);
+
+	pr_debug("Allocated buffer for cpu notes of size %ld at %p\n",
+		 (num_cpus * sizeof(note_buf_t)), note_buf);
+
+	if (fadump_conf->fadumphdr_addr)
+		fdh = __va(fadump_conf->fadumphdr_addr);
+
+	if (fdh && (fdh->crashing_cpu != CPU_UNKNOWN)) {
+		note_buf = fadump_regs_to_elf_notes(note_buf, &(fdh->regs));
+		final_note(note_buf);
+
+		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
+			 fdh->elfcorehdr_addr);
+		fadump_update_elfcore_header(fadump_conf,
+					     __va(fdh->elfcorehdr_addr));
+	}
+
+	return 0;
+}
+
+static int __init opal_process_fadump(struct fw_dump *fadump_conf)
+{
+	struct fadump_crash_info_header *fdh;
+	int rc = 0;
+
+	if (!opal_fdm_active || !fadump_conf->fadumphdr_addr)
+		return -EINVAL;
+
+	/* Validate the fadump crash info header */
+	fdh = __va(fadump_conf->fadumphdr_addr);
+	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
+		pr_err("Crash info header is not valid.\n");
+		return -EINVAL;
+	}
+
+	/*
+	 * TODO: To build cpu notes, find a way to map PIR to logical id.
+	 *       Also, we may need different method for pseries and powernv.
+	 *       The currently booted kernel could have a different PIR to
+	 *       logical id mapping. So, try saving info of previous kernel's
+	 *       paca to get the right PIR to logical id mapping.
+	 */
+	rc = fadump_build_cpu_notes(fadump_conf);
+	if (rc)
+		return rc;
+
+	/*
+	 * We are done validating dump info and elfcore header is now ready
+	 * to be exported. set elfcorehdr_addr so that vmcore module will
+	 * export the elfcore header through '/proc/vmcore'.
+	 */
+	elfcorehdr_addr = fdh->elfcorehdr_addr;
+
+	return rc;
+}
+
+static void opal_fadump_region_show(struct fw_dump *fadump_conf,
+				    struct seq_file *m)
+{
+	int i;
+	const struct opal_fadump_mem_struct *fdm_ptr;
+
+	if (opal_fdm_active)
+		fdm_ptr = opal_fdm_active;
+	else
+		fdm_ptr = opal_fdm;
+
+	seq_puts(m, "---------------------------------------");
+	seq_puts(m, "-------------------\n");
+	seq_puts(m, "|   Source Addr    | Destination Addr |");
+	seq_puts(m, "      Size        |\n");
+	seq_puts(m, "---------------------------------------");
+	seq_puts(m, "-------------------\n");
+
+	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+		seq_printf(m, "| %016llx | %016llx | %016llx |\n",
+			      fdm_ptr->rgn[i].src,
+			      fdm_ptr->rgn[i].dest,
+			      fdm_ptr->rgn[i].size);
+		seq_puts(m, "---------------------------------------");
+		seq_puts(m, "-------------------\n");
+	}
+
+}
+
+static void opal_crash_fadump(struct fadump_crash_info_header *fdh,
+			      const char *msg)
+{
+	int rc;
+
+	rc = opal_cec_reboot2(OPAL_REBOOT_OS_ERROR, msg);
+	if (rc == OPAL_UNSUPPORTED) {
+		pr_emerg("Reboot type %d not supported.\n",
+			 OPAL_REBOOT_OS_ERROR);
+	} else if (rc == OPAL_HARDWARE)
+		pr_emerg("No backend support for MPIPL!\n");
+}
+
+static struct fadump_ops opal_fadump_ops = {
+	.init_fadump_mem_struct		= opal_init_fadump_mem_struct,
+	.get_kernel_metadata_size	= opal_get_kernel_metadata_size,
+	.setup_kernel_metadata		= opal_setup_kernel_metadata,
+	.register_fadump		= opal_register_fadump,
+	.unregister_fadump		= opal_unregister_fadump,
+	.invalidate_fadump		= opal_invalidate_fadump,
+	.process_fadump			= opal_process_fadump,
+	.fadump_region_show		= opal_fadump_region_show,
+	.crash_fadump			= opal_crash_fadump,
+};
+
+int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
+{
+	unsigned long dn;
+	const __be32 *prop;
+
+	/*
+	 * Check if Firmware-Assisted Dump is supported. if yes, check
+	 * if dump has been initiated on last reboot.
+	 */
+	dn = of_get_flat_dt_subnode_by_name(node, "dump");
+	if (dn == -FDT_ERR_NOTFOUND) {
+		pr_debug("FADump support is missing!\n");
+		return 1;
+	}
+
+	if (!of_flat_dt_is_compatible(dn, "ibm,opal-dump")) {
+		pr_err("Support missing for this f/w version!\n");
+		return 1;
+	}
+
+	fadump_conf->ops		= &opal_fadump_ops;
+	fadump_conf->fadump_platform	= FADUMP_PLATFORM_POWERNV;
+	fadump_conf->fadump_supported	= 1;
+
+	/*
+	 * Firmware currently supports only 32-bit value for size,
+	 * align it to 1MB size.
+	 */
+	fadump_conf->max_copy_size = _ALIGN_DOWN(0xFFFFFFFF, (1 << 20));
+
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
+	if (prop) {
+		u8 type;
+		u32 idx = 0;
+		u64 addr = 0;
+		s64 ret;
+		const struct opal_fadump_mem_struct *r_opal_fdm_active;
+
+		do {
+			ret = opal_mpipl_query_tag(idx, &addr);
+			if (ret != OPAL_SUCCESS)
+				break;
+
+			addr = be64_to_cpu(addr);
+			type = *((u8 *)addr);
+			switch (type) {
+			case MPIPL_FADUMP_TYPE_KERNEL:
+				opal_fdm_active = __va(addr);
+				break;
+			}
+
+			pr_debug("idx: %d, addr: %llx, type: %x\n",
+				 idx, addr, type);
+			idx++;
+		} while (ret == OPAL_SUCCESS);
+
+		if (opal_fdm_active == NULL) {
+			pr_err("kernel metadata not found!\n");
+			return 1;
+		}
+
+		r_opal_fdm_active = (void *)__pa(opal_fdm_active);
+		if (r_opal_fdm_active->version != FADUMP_VERSION) {
+			pr_err("FADump active but version (%u) unsupported!\n",
+			       opal_fdm_active->version);
+			return 1;
+		}
+
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+		update_fadump_config(fadump_conf, r_opal_fdm_active);
+	}
+
+	return 1;
+}
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
new file mode 100644
index 0000000..a0ffad5
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -0,0 +1,34 @@
+/*
+ * Firmware-Assisted Dump support on POWER platform (OPAL).
+ *
+ * Copyright 2018-2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.vnet.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#ifndef __PPC64_OPAL_FA_DUMP_H__
+#define __PPC64_OPAL_FA_DUMP_H__
+
+/* FADump structure format version */
+#define FADUMP_VERSION				0x1
+
+/*
+ * FADump memory structure for registering dump support with
+ * POWER f/w through opal call.
+ */
+struct opal_fadump_mem_struct {
+
+	u8	type;
+	u8	version;
+	u8	reserved[6];
+	u16	region_cnt;		/* number of regions */
+	u64	fadumphdr_addr;
+
+	struct opal_fadump_region	rgn[MAX_REAL_MEM_REGIONS];
+};
+
+#endif /* __PPC64_OPAL_FA_DUMP_H__ */
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 3076c68..bc53a38 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -56,8 +56,13 @@ static void update_fadump_config(struct fw_dump *fadump_conf,
 		be64_to_cpu(fdm->rmr_region.destination_address);
 
 	if (fadump_conf->dump_active) {
-		fadump_conf->rmr_source_len =
+		fadump_conf->rmr_src_addr[0] =
+			be64_to_cpu(fdm->rmr_region.source_address);
+		fadump_conf->rmr_src_size[0] =
 			be64_to_cpu(fdm->rmr_region.source_len);
+		fadump_conf->rmr_regions_cnt = 1;
+		fadump_conf->rmr_source_len = fadump_conf->rmr_src_size[0];
+		fadump_conf->boot_memory_hole_size = 0;
 	}
 
 	fadump_conf->fadumphdr_addr = (fadump_conf->rmr_destination_addr +
@@ -128,6 +133,21 @@ static ulong pseries_init_fadump_mem_struct(struct fw_dump *fadump_conf)
 	return addr;
 }
 
+/*
+ * On this platform, the metadata struture is passed while registering
+ * for FADump and the same is returned by f/w in capture kernel.
+ * No additional provision to setup metadata separately.
+ */
+static ulong pseries_get_kernel_metadata_size(void)
+{
+	return 0;
+}
+
+static int pseries_setup_kernel_metadata(struct fw_dump *fadump_conf)
+{
+	return 0;
+}
+
 static int pseries_register_fadump(struct fw_dump *fadump_conf)
 {
 	int rc, err;
@@ -456,13 +476,15 @@ static void pseries_crash_fadump(struct fadump_crash_info_header *fdh,
 
 
 static struct fadump_ops pseries_fadump_ops = {
-	.init_fadump_mem_struct	= pseries_init_fadump_mem_struct,
-	.register_fadump	= pseries_register_fadump,
-	.unregister_fadump	= pseries_unregister_fadump,
-	.invalidate_fadump	= pseries_invalidate_fadump,
-	.process_fadump		= pseries_process_fadump,
-	.fadump_region_show	= pseries_fadump_region_show,
-	.crash_fadump		= pseries_crash_fadump,
+	.init_fadump_mem_struct		= pseries_init_fadump_mem_struct,
+	.get_kernel_metadata_size	= pseries_get_kernel_metadata_size,
+	.setup_kernel_metadata		= pseries_setup_kernel_metadata,
+	.register_fadump		= pseries_register_fadump,
+	.unregister_fadump		= pseries_unregister_fadump,
+	.invalidate_fadump		= pseries_invalidate_fadump,
+	.process_fadump			= pseries_process_fadump,
+	.fadump_region_show		= pseries_fadump_region_show,
+	.crash_fadump			= pseries_crash_fadump,
 };
 
 int __init pseries_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)

