Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 38CDF55970
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:54:08 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJL55RNBzDqWL
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 06:54:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJ994gCdzDqTm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJ985Yf2z8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:46:20 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJ9836Ctz9sBb; Wed, 26 Jun 2019 06:46:20 +1000 (AEST)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=linux.ibm.com
 (client-ip=148.163.158.5; helo=mx0a-001b2d01.pphosted.com;
 envelope-from=hbathini@linux.ibm.com; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 45YJ971gQgz9s5c
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:46:17 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKgPhj143832
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:15 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbsj736rv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:46:14 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:46:13 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:46:10 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x5PKjxRr21954928
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:45:59 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0E80B11C050;
 Tue, 25 Jun 2019 20:46:09 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A284211C04A;
 Tue, 25 Jun 2019 20:46:05 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:46:05 +0000 (GMT)
Subject: [PATCH v3 03/16] pseries/fadump: move out platform specific support
 from generic code
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:16:04 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0020-0000-0000-0000034D5790
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0021-0000-0000-000021A0C8F1
Message-Id: <156149556436.9094.15834897273683011518.stgit@hbathini.in.ibm.com>
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

Introduce callbacks for platform specific operations like register,
unregister, invalidate & such, and move pseries specific code into
platform code.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h            |   75 ----
 arch/powerpc/kernel/fadump-common.h          |   38 ++
 arch/powerpc/kernel/fadump.c                 |  500 ++-----------------------
 arch/powerpc/platforms/pseries/Makefile      |    1 
 arch/powerpc/platforms/pseries/rtas-fadump.c |  529 ++++++++++++++++++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.h |   96 +++++
 6 files changed, 700 insertions(+), 539 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.c
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index a2d2533..9a7652c 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -11,79 +11,8 @@
 
 #ifdef CONFIG_FA_DUMP
 
-/* Firmware provided dump sections */
-#define FADUMP_CPU_STATE_DATA	0x0001
-#define FADUMP_HPTE_REGION	0x0002
-#define FADUMP_REAL_MODE_REGION	0x0011
-
-/* Dump request flag */
-#define FADUMP_REQUEST_FLAG	0x00000001
-
-/* Dump status flag */
-#define FADUMP_ERROR_FLAG	0x2000
-
-/* Utility macros */
-#define SKIP_TO_NEXT_CPU(reg_entry)					\
-({									\
-	while (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUEND"))	\
-		reg_entry++;						\
-	reg_entry++;							\
-})
-
 extern int crashing_cpu;
 
-/* Kernel Dump section info */
-struct fadump_section {
-	__be32	request_flag;
-	__be16	source_data_type;
-	__be16	error_flags;
-	__be64	source_address;
-	__be64	source_len;
-	__be64	bytes_dumped;
-	__be64	destination_address;
-};
-
-/* ibm,configure-kernel-dump header. */
-struct fadump_section_header {
-	__be32	dump_format_version;
-	__be16	dump_num_sections;
-	__be16	dump_status_flag;
-	__be32	offset_first_dump_section;
-
-	/* Fields for disk dump option. */
-	__be32	dd_block_size;
-	__be64	dd_block_offset;
-	__be64	dd_num_blocks;
-	__be32	dd_offset_disk_path;
-
-	/* Maximum time allowed to prevent an automatic dump-reboot. */
-	__be32	max_time_auto;
-};
-
-/*
- * Firmware Assisted dump memory structure. This structure is required for
- * registering future kernel dump with power firmware through rtas call.
- *
- * No disk dump option. Hence disk dump path string section is not included.
- */
-struct fadump_mem_struct {
-	struct fadump_section_header	header;
-
-	/* Kernel dump sections */
-	struct fadump_section		cpu_state_data;
-	struct fadump_section		hpte_region;
-	struct fadump_section		rmr_region;
-};
-
-#define REGSAVE_AREA_MAGIC		STR_TO_HEX("REGSAVE")
-
-/* Register save area header. */
-struct fadump_reg_save_area_header {
-	__be64		magic_number;
-	__be32		version;
-	__be32		num_cpu_offset;
-};
-
 extern int is_fadump_memory_area(u64 addr, ulong size);
 extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data);
@@ -99,5 +28,5 @@ static inline int is_fadump_active(void) { return 0; }
 static inline int should_fadump_crash(void) { return 0; }
 static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
 static inline void fadump_cleanup(void) { }
-#endif
-#endif
+#endif /* !CONFIG_FA_DUMP */
+#endif /* __PPC64_FA_DUMP_H__ */
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 8ccd96d..1eb1397 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -47,6 +47,12 @@
 #define FADUMP_UNREGISTER		2
 #define FADUMP_INVALIDATE		3
 
+/* Firmware-Assited Dump platforms */
+enum fadump_platform_type {
+	FADUMP_PLATFORM_UNKNOWN = 0,
+	FADUMP_PLATFORM_PSERIES,
+};
+
 #define FADUMP_CPU_ID_MASK		((1UL << 32) - 1)
 
 #define CPU_UNKNOWN			(~((u32)0))
@@ -91,6 +97,9 @@ struct fad_crash_memory_ranges {
 	unsigned long long	size;
 };
 
+/* Platform specific callback functions */
+struct fadump_ops;
+
 /* Firmware-assisted dump configuration details. */
 struct fw_dump {
 	unsigned long	cpu_state_data_size;
@@ -98,6 +107,7 @@ struct fw_dump {
 	unsigned long	boot_memory_size;
 	unsigned long	reserve_dump_area_start;
 	unsigned long	reserve_dump_area_size;
+	unsigned long	preserv_area_start;
 	/* cmd line option during boot */
 	unsigned long	reserve_bootvar;
 
@@ -105,6 +115,9 @@ struct fw_dump {
 	unsigned long	cpu_notes_buf;
 	unsigned long	cpu_notes_buf_size;
 
+	unsigned long	rmr_source_len;
+	unsigned long	rmr_destination_addr;
+
 	int		ibm_configure_kernel_dump;
 
 	unsigned long	fadump_enabled:1;
@@ -112,6 +125,21 @@ struct fw_dump {
 	unsigned long	dump_active:1;
 	unsigned long	dump_registered:1;
 	unsigned long	nocma:1;
+
+	enum fadump_platform_type	fadump_platform;
+	struct fadump_ops		*ops;
+};
+
+struct fadump_ops {
+	ulong	(*init_fadump_mem_struct)(struct fw_dump *fadump_config);
+	int	(*register_fadump)(struct fw_dump *fadump_config);
+	int	(*unregister_fadump)(struct fw_dump *fadump_config);
+	int	(*invalidate_fadump)(struct fw_dump *fadump_config);
+	int	(*process_fadump)(struct fw_dump *fadump_config);
+	void	(*fadump_region_show)(struct fw_dump *fadump_config,
+				      struct seq_file *m);
+	void	(*crash_fadump)(struct fadump_crash_info_header *fdh,
+				const char *msg);
 };
 
 /* Helper functions */
@@ -123,4 +151,14 @@ void fadump_update_elfcore_header(struct fw_dump *fadump_config, char *bufp);
 int is_boot_memory_area_contiguous(struct fw_dump *fadump_conf);
 int is_reserved_memory_area_contiguous(struct fw_dump *fadump_conf);
 
+#ifdef CONFIG_PPC_PSERIES
+extern int pseries_dt_scan_fadump(struct fw_dump *fadump_config, ulong node);
+#else
+static inline int
+pseries_dt_scan_fadump(struct fw_dump *fadump_config, ulong node)
+{
+	return 1;
+}
+#endif
+
 #endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index c564d58..c04121f 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -28,15 +28,12 @@
 #include <asm/debugfs.h>
 #include <asm/page.h>
 #include <asm/prom.h>
-#include <asm/rtas.h>
 #include <asm/fadump.h>
 #include <asm/setup.h>
 
 #include "fadump-common.h"
 
 static struct fw_dump fw_dump;
-static struct fadump_mem_struct fdm;
-static const struct fadump_mem_struct *fdm_active;
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fad_crash_memory_ranges *crash_memory_ranges;
@@ -111,63 +108,13 @@ static int __init fadump_cma_init(void) { return 1; }
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	const __be32 *sections;
-	int i, num_sections;
-	int size;
-	const __be32 *token;
-
-	if (depth != 1 || strcmp(uname, "rtas") != 0)
+	if (depth != 1)
 		return 0;
 
-	/*
-	 * Check if Firmware Assisted dump is supported. if yes, check
-	 * if dump has been initiated on last reboot.
-	 */
-	token = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump", NULL);
-	if (!token)
-		return 1;
-
-	fw_dump.fadump_supported = 1;
-	fw_dump.ibm_configure_kernel_dump = be32_to_cpu(*token);
-
-	/*
-	 * The 'ibm,kernel-dump' rtas node is present only if there is
-	 * dump data waiting for us.
-	 */
-	fdm_active = of_get_flat_dt_prop(node, "ibm,kernel-dump", NULL);
-	if (fdm_active)
-		fw_dump.dump_active = 1;
-
-	/* Get the sizes required to store dump data for the firmware provided
-	 * dump sections.
-	 * For each dump section type supported, a 32bit cell which defines
-	 * the ID of a supported section followed by two 32 bit cells which
-	 * gives teh size of the section in bytes.
-	 */
-	sections = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump-sizes",
-					&size);
-
-	if (!sections)
-		return 1;
-
-	num_sections = size / (3 * sizeof(u32));
+	if (strcmp(uname, "rtas") == 0)
+		return pseries_dt_scan_fadump(&fw_dump, node);
 
-	for (i = 0; i < num_sections; i++, sections += 3) {
-		u32 type = (u32)of_read_number(sections, 1);
-
-		switch (type) {
-		case FADUMP_CPU_STATE_DATA:
-			fw_dump.cpu_state_data_size =
-					of_read_ulong(&sections[1], 2);
-			break;
-		case FADUMP_HPTE_REGION:
-			fw_dump.hpte_region_size =
-					of_read_ulong(&sections[1], 2);
-			break;
-		}
-	}
-
-	return 1;
+	return 0;
 }
 
 /*
@@ -219,61 +166,6 @@ static void fadump_show_config(void)
 	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
 }
 
-static unsigned long init_fadump_mem_struct(struct fadump_mem_struct *fdm,
-				unsigned long addr)
-{
-	if (!fdm)
-		return 0;
-
-	memset(fdm, 0, sizeof(struct fadump_mem_struct));
-	addr = addr & PAGE_MASK;
-
-	fdm->header.dump_format_version = cpu_to_be32(0x00000001);
-	fdm->header.dump_num_sections = cpu_to_be16(3);
-	fdm->header.dump_status_flag = 0;
-	fdm->header.offset_first_dump_section =
-		cpu_to_be32((u32)offsetof(struct fadump_mem_struct, cpu_state_data));
-
-	/*
-	 * Fields for disk dump option.
-	 * We are not using disk dump option, hence set these fields to 0.
-	 */
-	fdm->header.dd_block_size = 0;
-	fdm->header.dd_block_offset = 0;
-	fdm->header.dd_num_blocks = 0;
-	fdm->header.dd_offset_disk_path = 0;
-
-	/* set 0 to disable an automatic dump-reboot. */
-	fdm->header.max_time_auto = 0;
-
-	/* Kernel dump sections */
-	/* cpu state data section. */
-	fdm->cpu_state_data.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->cpu_state_data.source_data_type = cpu_to_be16(FADUMP_CPU_STATE_DATA);
-	fdm->cpu_state_data.source_address = 0;
-	fdm->cpu_state_data.source_len = cpu_to_be64(fw_dump.cpu_state_data_size);
-	fdm->cpu_state_data.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.cpu_state_data_size;
-
-	/* hpte region section */
-	fdm->hpte_region.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->hpte_region.source_data_type = cpu_to_be16(FADUMP_HPTE_REGION);
-	fdm->hpte_region.source_address = 0;
-	fdm->hpte_region.source_len = cpu_to_be64(fw_dump.hpte_region_size);
-	fdm->hpte_region.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.hpte_region_size;
-
-	/* RMA region section */
-	fdm->rmr_region.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->rmr_region.source_data_type = cpu_to_be16(FADUMP_REAL_MODE_REGION);
-	fdm->rmr_region.source_address = cpu_to_be64(RMA_START);
-	fdm->rmr_region.source_len = cpu_to_be64(fw_dump.boot_memory_size);
-	fdm->rmr_region.destination_address = cpu_to_be64(addr);
-	addr += fw_dump.boot_memory_size;
-
-	return addr;
-}
-
 /**
  * fadump_calculate_reserve_size(): reserve variable boot area 5% of System RAM
  *
@@ -404,8 +296,8 @@ int __init fadump_reserve_mem(void)
 	 * If dump is active then we have already calculated the size during
 	 * first kernel.
 	 */
-	if (fdm_active)
-		fw_dump.boot_memory_size = be64_to_cpu(fdm_active->rmr_region.source_len);
+	if (fw_dump.dump_active)
+		fw_dump.boot_memory_size = fw_dump.rmr_source_len;
 	else {
 		fw_dump.boot_memory_size = fadump_calculate_reserve_size();
 #ifdef CONFIG_CMA
@@ -414,8 +306,11 @@ int __init fadump_reserve_mem(void)
 				ALIGN(fw_dump.boot_memory_size,
 							FADUMP_CMA_ALIGNMENT);
 #endif
+		fw_dump.rmr_source_len = fw_dump.boot_memory_size;
 	}
 
+	size = get_fadump_area_size();
+
 	/*
 	 * Calculate the memory boundary.
 	 * If memory_limit is less than actual memory boundary then reserve
@@ -424,13 +319,11 @@ int __init fadump_reserve_mem(void)
 	 * specified memory_limit.
 	 */
 	if (memory_limit && memory_limit < memblock_end_of_DRAM()) {
-		size = get_fadump_area_size();
 		if ((memory_limit + size) < memblock_end_of_DRAM())
 			memory_limit += size;
 		else
 			memory_limit = memblock_end_of_DRAM();
-		printk(KERN_INFO "Adjusted memory_limit for firmware-assisted"
-				" dump, now %#016llx\n", memory_limit);
+		pr_info("memory_limit adjusted to %#016llx\n", memory_limit);
 	}
 	if (memory_limit)
 		memory_boundary = memory_limit;
@@ -438,8 +331,6 @@ int __init fadump_reserve_mem(void)
 		memory_boundary = memblock_end_of_DRAM();
 
 	if (fw_dump.dump_active) {
-		pr_info("Firmware-assisted dump is active.\n");
-
 #ifdef CONFIG_HUGETLB_PAGE
 		/*
 		 * FADump capture kernel doesn't care much about hugepages.
@@ -458,15 +349,10 @@ int __init fadump_reserve_mem(void)
 		size = memory_boundary - base;
 		fadump_reserve_crash_area(base, size);
 
-		fw_dump.fadumphdr_addr =
-				be64_to_cpu(fdm_active->rmr_region.destination_address) +
-				be64_to_cpu(fdm_active->rmr_region.source_len);
-		pr_debug("fadumphdr_addr = %pa\n", &fw_dump.fadumphdr_addr);
+		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		fw_dump.reserve_dump_area_start = base;
 		fw_dump.reserve_dump_area_size = size;
 	} else {
-		size = get_fadump_area_size();
-
 		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
 		 * minimize the impact of memory hot-remove operation. We can't
@@ -536,61 +422,6 @@ static int __init early_fadump_reserve_mem(char *p)
 }
 early_param("fadump_reserve_mem", early_fadump_reserve_mem);
 
-static int register_fw_dump(struct fadump_mem_struct *fdm)
-{
-	int rc, err;
-	unsigned int wait_time;
-
-	pr_debug("Registering for firmware-assisted kernel dump...\n");
-
-	/* TODO: Add upper time limit for the delay */
-	do {
-		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
-			FADUMP_REGISTER, fdm,
-			sizeof(struct fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-
-	} while (wait_time);
-
-	err = -EIO;
-	switch (rc) {
-	default:
-		pr_err("Failed to register. Unknown Error(%d).\n", rc);
-		break;
-	case -1:
-		printk(KERN_ERR "Failed to register firmware-assisted kernel"
-			" dump. Hardware Error(%d).\n", rc);
-		break;
-	case -3:
-		if (!is_boot_memory_area_contiguous(&fw_dump))
-			pr_err("Can't have holes in boot memory area while registering fadump\n");
-		else if (!is_reserved_memory_area_contiguous(&fw_dump))
-			pr_err("Can't have holes in reserved memory area while"
-			       " registering fadump\n");
-
-		printk(KERN_ERR "Failed to register firmware-assisted kernel"
-			" dump. Parameter Error(%d).\n", rc);
-		err = -EINVAL;
-		break;
-	case -9:
-		printk(KERN_ERR "firmware-assisted kernel dump is already "
-			" registered.");
-		fw_dump.dump_registered = 1;
-		err = -EEXIST;
-		break;
-	case 0:
-		printk(KERN_INFO "firmware-assisted kernel dump registration"
-			" is successful\n");
-		fw_dump.dump_registered = 1;
-		err = 0;
-		break;
-	}
-	return err;
-}
-
 void crash_fadump(struct pt_regs *regs, const char *str)
 {
 	struct fadump_crash_info_header *fdh = NULL;
@@ -633,173 +464,7 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 
 	fdh->online_mask = *cpu_online_mask;
 
-	/* Call ibm,os-term rtas call to trigger firmware assisted dump */
-	rtas_os_term((char *)str);
-}
-
-static struct fadump_reg_entry*
-fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
-{
-	memset(regs, 0, sizeof(struct pt_regs));
-
-	while (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUEND")) {
-		fadump_set_regval(regs, be64_to_cpu(reg_entry->reg_id),
-					be64_to_cpu(reg_entry->reg_value));
-		reg_entry++;
-	}
-	reg_entry++;
-	return reg_entry;
-}
-
-/*
- * Read CPU state dump data and convert it into ELF notes.
- * The CPU dump starts with magic number "REGSAVE". NumCpusOffset should be
- * used to access the data to allow for additional fields to be added without
- * affecting compatibility. Each list of registers for a CPU starts with
- * "CPUSTRT" and ends with "CPUEND". Each register entry is of 16 bytes,
- * 8 Byte ASCII identifier and 8 Byte register value. The register entry
- * with identifier "CPUSTRT" and "CPUEND" contains 4 byte cpu id as part
- * of register value. For more details refer to PAPR document.
- *
- * Only for the crashing cpu we ignore the CPU dump data and get exact
- * state from fadump crash info structure populated by first kernel at the
- * time of crash.
- */
-static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
-{
-	struct fadump_reg_save_area_header *reg_header;
-	struct fadump_reg_entry *reg_entry;
-	struct fadump_crash_info_header *fdh = NULL;
-	void *vaddr;
-	unsigned long addr;
-	u32 num_cpus, *note_buf;
-	struct pt_regs regs;
-	int i, rc = 0, cpu = 0;
-
-	if (!fdm->cpu_state_data.bytes_dumped)
-		return -EINVAL;
-
-	addr = be64_to_cpu(fdm->cpu_state_data.destination_address);
-	vaddr = __va(addr);
-
-	reg_header = vaddr;
-	if (be64_to_cpu(reg_header->magic_number) != REGSAVE_AREA_MAGIC) {
-		printk(KERN_ERR "Unable to read register save area.\n");
-		return -ENOENT;
-	}
-	pr_debug("--------CPU State Data------------\n");
-	pr_debug("Magic Number: %llx\n", be64_to_cpu(reg_header->magic_number));
-	pr_debug("NumCpuOffset: %x\n", be32_to_cpu(reg_header->num_cpu_offset));
-
-	vaddr += be32_to_cpu(reg_header->num_cpu_offset);
-	num_cpus = be32_to_cpu(*((__be32 *)(vaddr)));
-	pr_debug("NumCpus     : %u\n", num_cpus);
-	vaddr += sizeof(u32);
-	reg_entry = (struct fadump_reg_entry *)vaddr;
-
-	/* Allocate buffer to hold cpu crash notes. */
-	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
-	fw_dump.cpu_notes_buf_size = PAGE_ALIGN(fw_dump.cpu_notes_buf_size);
-	note_buf = fadump_cpu_notes_buf_alloc(fw_dump.cpu_notes_buf_size);
-	if (!note_buf) {
-		printk(KERN_ERR "Failed to allocate 0x%lx bytes for "
-			"cpu notes buffer\n", fw_dump.cpu_notes_buf_size);
-		return -ENOMEM;
-	}
-	fw_dump.cpu_notes_buf = __pa(note_buf);
-
-	pr_debug("Allocated buffer for cpu notes of size %ld at %p\n",
-			(num_cpus * sizeof(note_buf_t)), note_buf);
-
-	if (fw_dump.fadumphdr_addr)
-		fdh = __va(fw_dump.fadumphdr_addr);
-
-	for (i = 0; i < num_cpus; i++) {
-		if (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUSTRT")) {
-			printk(KERN_ERR "Unable to read CPU state data\n");
-			rc = -ENOENT;
-			goto error_out;
-		}
-		/* Lower 4 bytes of reg_value contains logical cpu id */
-		cpu = be64_to_cpu(reg_entry->reg_value) & FADUMP_CPU_ID_MASK;
-		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
-			SKIP_TO_NEXT_CPU(reg_entry);
-			continue;
-		}
-		pr_debug("Reading register data for cpu %d...\n", cpu);
-		if (fdh && fdh->crashing_cpu == cpu) {
-			regs = fdh->regs;
-			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
-			SKIP_TO_NEXT_CPU(reg_entry);
-		} else {
-			reg_entry++;
-			reg_entry = fadump_read_registers(reg_entry, &regs);
-			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
-		}
-	}
-	final_note(note_buf);
-
-	if (fdh) {
-		addr = fdh->elfcorehdr_addr;
-		pr_debug("Updating elfcore header(%lx) with cpu notes\n", addr);
-		fadump_update_elfcore_header(&fw_dump, (char *)__va(addr));
-	}
-	return 0;
-
-error_out:
-	fadump_cpu_notes_buf_free((unsigned long)__va(fw_dump.cpu_notes_buf),
-					fw_dump.cpu_notes_buf_size);
-	fw_dump.cpu_notes_buf = 0;
-	fw_dump.cpu_notes_buf_size = 0;
-	return rc;
-
-}
-
-/*
- * Validate and process the dump data stored by firmware before exporting
- * it through '/proc/vmcore'.
- */
-static int __init process_fadump(const struct fadump_mem_struct *fdm_active)
-{
-	struct fadump_crash_info_header *fdh;
-	int rc = 0;
-
-	if (!fdm_active || !fw_dump.fadumphdr_addr)
-		return -EINVAL;
-
-	/* Check if the dump data is valid. */
-	if ((be16_to_cpu(fdm_active->header.dump_status_flag) == FADUMP_ERROR_FLAG) ||
-			(fdm_active->cpu_state_data.error_flags != 0) ||
-			(fdm_active->rmr_region.error_flags != 0)) {
-		printk(KERN_ERR "Dump taken by platform is not valid\n");
-		return -EINVAL;
-	}
-	if ((fdm_active->rmr_region.bytes_dumped !=
-			fdm_active->rmr_region.source_len) ||
-			!fdm_active->cpu_state_data.bytes_dumped) {
-		printk(KERN_ERR "Dump taken by platform is incomplete\n");
-		return -EINVAL;
-	}
-
-	/* Validate the fadump crash info header */
-	fdh = __va(fw_dump.fadumphdr_addr);
-	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
-		printk(KERN_ERR "Crash info header is not valid.\n");
-		return -EINVAL;
-	}
-
-	rc = fadump_build_cpu_notes(fdm_active);
-	if (rc)
-		return rc;
-
-	/*
-	 * We are done validating dump info and elfcore header is now ready
-	 * to be exported. set elfcorehdr_addr so that vmcore module will
-	 * export the elfcore header through '/proc/vmcore'.
-	 */
-	elfcorehdr_addr = fdh->elfcorehdr_addr;
-
-	return 0;
+	fw_dump.ops->crash_fadump(fdh, str);
 }
 
 static void free_crash_memory_ranges(void)
@@ -996,7 +661,7 @@ static int fadump_setup_crash_memory_ranges(void)
 static inline unsigned long fadump_relocate(unsigned long paddr)
 {
 	if (paddr > RMA_START && paddr < fw_dump.boot_memory_size)
-		return be64_to_cpu(fdm.rmr_region.destination_address) + paddr;
+		return fw_dump.rmr_destination_addr + paddr;
 	else
 		return paddr;
 }
@@ -1069,7 +734,7 @@ static int fadump_create_elfcore_headers(char *bufp)
 			 * to the specified destination_address. Hence set
 			 * the correct offset.
 			 */
-			phdr->p_offset = be64_to_cpu(fdm.rmr_region.destination_address);
+			phdr->p_offset = fw_dump.rmr_destination_addr;
 		}
 
 		phdr->p_paddr = mbase;
@@ -1121,7 +786,8 @@ static int register_fadump(void)
 	if (ret)
 		return ret;
 
-	addr = be64_to_cpu(fdm.rmr_region.destination_address) + be64_to_cpu(fdm.rmr_region.source_len);
+	addr = fw_dump.fadumphdr_addr;
+
 	/* Initialize fadump crash info header. */
 	addr = init_fadump_header(addr);
 	vaddr = __va(addr);
@@ -1130,72 +796,19 @@ static int register_fadump(void)
 	fadump_create_elfcore_headers(vaddr);
 
 	/* register the future kernel dump with firmware. */
-	return register_fw_dump(&fdm);
-}
-
-static int fadump_unregister_dump(struct fadump_mem_struct *fdm)
-{
-	int rc = 0;
-	unsigned int wait_time;
-
-	pr_debug("Un-register firmware-assisted dump\n");
-
-	/* TODO: Add upper time limit for the delay */
-	do {
-		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
-			FADUMP_UNREGISTER, fdm,
-			sizeof(struct fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-	} while (wait_time);
-
-	if (rc) {
-		printk(KERN_ERR "Failed to un-register firmware-assisted dump."
-			" unexpected error(%d).\n", rc);
-		return rc;
-	}
-	fw_dump.dump_registered = 0;
-	return 0;
-}
-
-static int fadump_invalidate_dump(const struct fadump_mem_struct *fdm)
-{
-	int rc = 0;
-	unsigned int wait_time;
-
-	pr_debug("Invalidating firmware-assisted dump registration\n");
-
-	/* TODO: Add upper time limit for the delay */
-	do {
-		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
-			FADUMP_INVALIDATE, fdm,
-			sizeof(struct fadump_mem_struct));
-
-		wait_time = rtas_busy_delay_time(rc);
-		if (wait_time)
-			mdelay(wait_time);
-	} while (wait_time);
-
-	if (rc) {
-		pr_err("Failed to invalidate firmware-assisted dump registration. Unexpected error (%d).\n", rc);
-		return rc;
-	}
-	fw_dump.dump_active = 0;
-	fdm_active = NULL;
-	return 0;
+	pr_debug("Registering for firmware-assisted kernel dump...\n");
+	return fw_dump.ops->register_fadump(&fw_dump);
 }
 
 void fadump_cleanup(void)
 {
 	/* Invalidate the registration only if dump is active. */
 	if (fw_dump.dump_active) {
-		/* pass the same memory dump structure provided by platform */
-		fadump_invalidate_dump(fdm_active);
+		pr_debug("Invalidating firmware-assisted dump registration\n");
+		fw_dump.ops->invalidate_fadump(&fw_dump);
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
-		fadump_unregister_dump(&fdm);
+		fw_dump.ops->unregister_fadump(&fw_dump);
 		free_crash_memory_ranges();
 	}
 }
@@ -1278,7 +891,7 @@ static void fadump_invalidate_release_mem(void)
 		return;
 	}
 
-	destination_address = be64_to_cpu(fdm_active->cpu_state_data.destination_address);
+	destination_address = fw_dump.preserv_area_start;
 	fadump_cleanup();
 	mutex_unlock(&fadump_mutex);
 
@@ -1304,8 +917,9 @@ static void fadump_invalidate_release_mem(void)
 		fw_dump.cpu_notes_buf = 0;
 		fw_dump.cpu_notes_buf_size = 0;
 	}
+
 	/* Initialize the kernel dump memory structure for FAD registration. */
-	init_fadump_mem_struct(&fdm, fw_dump.reserve_dump_area_start);
+	fw_dump.ops->init_fadump_mem_struct(&fw_dump);
 }
 
 static ssize_t fadump_release_memory_store(struct kobject *kobj,
@@ -1356,7 +970,7 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 	int ret = 0;
 	int input = -1;
 
-	if (!fw_dump.fadump_enabled || fdm_active)
+	if (!fw_dump.fadump_enabled || fw_dump.dump_active)
 		return -EPERM;
 
 	if (kstrtoint(buf, 0, &input))
@@ -1369,13 +983,15 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 		if (fw_dump.dump_registered == 0) {
 			goto unlock_out;
 		}
+
 		/* Un-register Firmware-assisted dump */
-		fadump_unregister_dump(&fdm);
+		pr_debug("Un-register firmware-assisted dump\n");
+		fw_dump.ops->unregister_fadump(&fw_dump);
 		break;
 	case 1:
 		if (fw_dump.dump_registered == 1) {
 			/* Un-register Firmware-assisted dump */
-			fadump_unregister_dump(&fdm);
+			fw_dump.ops->unregister_fadump(&fw_dump);
 		}
 		/* Register Firmware-assisted dump */
 		ret = register_fadump();
@@ -1392,62 +1008,13 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 
 static int fadump_region_show(struct seq_file *m, void *private)
 {
-	const struct fadump_mem_struct *fdm_ptr;
-
 	if (!fw_dump.fadump_enabled)
 		return 0;
 
 	mutex_lock(&fadump_mutex);
-	if (fdm_active)
-		fdm_ptr = fdm_active;
-	else {
-		mutex_unlock(&fadump_mutex);
-		fdm_ptr = &fdm;
-	}
+	fw_dump.ops->fadump_region_show(&fw_dump, m);
+	mutex_unlock(&fadump_mutex);
 
-	seq_printf(m,
-			"CPU : [%#016llx-%#016llx] %#llx bytes, "
-			"Dumped: %#llx\n",
-			be64_to_cpu(fdm_ptr->cpu_state_data.destination_address),
-			be64_to_cpu(fdm_ptr->cpu_state_data.destination_address) +
-			be64_to_cpu(fdm_ptr->cpu_state_data.source_len) - 1,
-			be64_to_cpu(fdm_ptr->cpu_state_data.source_len),
-			be64_to_cpu(fdm_ptr->cpu_state_data.bytes_dumped));
-	seq_printf(m,
-			"HPTE: [%#016llx-%#016llx] %#llx bytes, "
-			"Dumped: %#llx\n",
-			be64_to_cpu(fdm_ptr->hpte_region.destination_address),
-			be64_to_cpu(fdm_ptr->hpte_region.destination_address) +
-			be64_to_cpu(fdm_ptr->hpte_region.source_len) - 1,
-			be64_to_cpu(fdm_ptr->hpte_region.source_len),
-			be64_to_cpu(fdm_ptr->hpte_region.bytes_dumped));
-	seq_printf(m,
-			"DUMP: [%#016llx-%#016llx] %#llx bytes, "
-			"Dumped: %#llx\n",
-			be64_to_cpu(fdm_ptr->rmr_region.destination_address),
-			be64_to_cpu(fdm_ptr->rmr_region.destination_address) +
-			be64_to_cpu(fdm_ptr->rmr_region.source_len) - 1,
-			be64_to_cpu(fdm_ptr->rmr_region.source_len),
-			be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
-
-	if (!fdm_active ||
-		(fw_dump.reserve_dump_area_start ==
-		be64_to_cpu(fdm_ptr->cpu_state_data.destination_address)))
-		goto out;
-
-	/* Dump is active. Show reserved memory region. */
-	seq_printf(m,
-			"    : [%#016llx-%#016llx] %#llx bytes, "
-			"Dumped: %#llx\n",
-			(unsigned long long)fw_dump.reserve_dump_area_start,
-			be64_to_cpu(fdm_ptr->cpu_state_data.destination_address) - 1,
-			be64_to_cpu(fdm_ptr->cpu_state_data.destination_address) -
-			fw_dump.reserve_dump_area_start,
-			be64_to_cpu(fdm_ptr->cpu_state_data.destination_address) -
-			fw_dump.reserve_dump_area_start);
-out:
-	if (fdm_active)
-		mutex_unlock(&fadump_mutex);
 	return 0;
 }
 
@@ -1518,12 +1085,13 @@ int __init setup_fadump(void)
 		 * if dump process fails then invalidate the registration
 		 * and release memory before proceeding for re-registration.
 		 */
-		if (process_fadump(fdm_active) < 0)
+		if (fw_dump.ops->process_fadump(&fw_dump) < 0)
 			fadump_invalidate_release_mem();
 	}
 	/* Initialize the kernel dump memory structure for FAD registration. */
 	else if (fw_dump.reserve_dump_area_size)
-		init_fadump_mem_struct(&fdm, fw_dump.reserve_dump_area_start);
+		fw_dump.ops->init_fadump_mem_struct(&fw_dump);
+
 	fadump_init_files();
 
 	return 1;
diff --git a/arch/powerpc/platforms/pseries/Makefile b/arch/powerpc/platforms/pseries/Makefile
index a43ec84..d48f2c8 100644
--- a/arch/powerpc/platforms/pseries/Makefile
+++ b/arch/powerpc/platforms/pseries/Makefile
@@ -25,6 +25,7 @@ obj-$(CONFIG_LPARCFG)		+= lparcfg.o
 obj-$(CONFIG_IBMVIO)		+= vio.o
 obj-$(CONFIG_IBMEBUS)		+= ibmebus.o
 obj-$(CONFIG_PAPR_SCM)		+= papr_scm.o
+obj-$(CONFIG_FA_DUMP)		+= rtas-fadump.o
 
 ifdef CONFIG_PPC_PSERIES
 obj-$(CONFIG_SUSPEND)		+= suspend.o
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
new file mode 100644
index 0000000..3076c68
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -0,0 +1,529 @@
+/*
+ * Firmware-Assisted Dump support on POWERVM platform.
+ *
+ * Copyright 2011, IBM Corporation
+ * Author: Mahesh Salgaonkar <mahesh@linux.vnet.ibm.com>
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
+#define pr_fmt(fmt) "pseries fadump: " fmt
+
+#include <linux/string.h>
+#include <linux/memblock.h>
+#include <linux/delay.h>
+#include <linux/seq_file.h>
+#include <linux/crash_dump.h>
+
+#include <asm/page.h>
+#include <asm/prom.h>
+#include <asm/rtas.h>
+#include <asm/fadump.h>
+
+#include "../../kernel/fadump-common.h"
+#include "rtas-fadump.h"
+
+static struct pseries_fadump_mem_struct fdm;
+static const struct pseries_fadump_mem_struct *fdm_active;
+
+static void pseries_set_preserv_area_start(struct fw_dump *fadump_conf)
+{
+	const struct pseries_fadump_mem_struct *fdm_ptr;
+
+	if (fdm_active)
+		fdm_ptr = fdm_active;
+	else
+		fdm_ptr = &fdm;
+
+	fadump_conf->preserv_area_start =
+		be64_to_cpu(fdm_ptr->cpu_state_data.destination_address);
+
+	pr_debug("Preserve area start address: 0x%lx\n",
+		 fadump_conf->preserv_area_start);
+}
+
+static void update_fadump_config(struct fw_dump *fadump_conf,
+				 const struct pseries_fadump_mem_struct *fdm)
+{
+	fadump_conf->rmr_destination_addr =
+		be64_to_cpu(fdm->rmr_region.destination_address);
+
+	if (fadump_conf->dump_active) {
+		fadump_conf->rmr_source_len =
+			be64_to_cpu(fdm->rmr_region.source_len);
+	}
+
+	fadump_conf->fadumphdr_addr = (fadump_conf->rmr_destination_addr +
+				       fadump_conf->rmr_source_len);
+	pseries_set_preserv_area_start(fadump_conf);
+}
+
+static ulong pseries_init_fadump_mem_struct(struct fw_dump *fadump_conf)
+{
+	ulong addr = fadump_conf->reserve_dump_area_start;
+
+	memset(&fdm, 0, sizeof(struct pseries_fadump_mem_struct));
+	addr = addr & PAGE_MASK;
+
+	fdm.header.dump_format_version = cpu_to_be32(0x00000001);
+	fdm.header.dump_num_sections = cpu_to_be16(3);
+	fdm.header.dump_status_flag = 0;
+	fdm.header.offset_first_dump_section =
+		cpu_to_be32((u32)offsetof(struct pseries_fadump_mem_struct,
+					  cpu_state_data));
+
+	/*
+	 * Fields for disk dump option.
+	 * We are not using disk dump option, hence set these fields to 0.
+	 */
+	fdm.header.dd_block_size = 0;
+	fdm.header.dd_block_offset = 0;
+	fdm.header.dd_num_blocks = 0;
+	fdm.header.dd_offset_disk_path = 0;
+
+	/* set 0 to disable an automatic dump-reboot. */
+	fdm.header.max_time_auto = 0;
+
+	/* Kernel dump sections */
+	/* cpu state data section. */
+	fdm.cpu_state_data.request_flag =
+		cpu_to_be32(PSERIES_FADUMP_REQUEST_FLAG);
+	fdm.cpu_state_data.source_data_type =
+		cpu_to_be16(PSERIES_FADUMP_CPU_STATE_DATA);
+	fdm.cpu_state_data.source_address = 0;
+	fdm.cpu_state_data.source_len =
+		cpu_to_be64(fadump_conf->cpu_state_data_size);
+	fdm.cpu_state_data.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->cpu_state_data_size;
+
+	/* hpte region section */
+	fdm.hpte_region.request_flag = cpu_to_be32(PSERIES_FADUMP_REQUEST_FLAG);
+	fdm.hpte_region.source_data_type =
+		cpu_to_be16(PSERIES_FADUMP_HPTE_REGION);
+	fdm.hpte_region.source_address = 0;
+	fdm.hpte_region.source_len =
+		cpu_to_be64(fadump_conf->hpte_region_size);
+	fdm.hpte_region.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->hpte_region_size;
+
+	/* RMA region section */
+	fdm.rmr_region.request_flag = cpu_to_be32(PSERIES_FADUMP_REQUEST_FLAG);
+	fdm.rmr_region.source_data_type =
+		cpu_to_be16(PSERIES_FADUMP_REAL_MODE_REGION);
+	fdm.rmr_region.source_address = cpu_to_be64(RMA_START);
+	fdm.rmr_region.source_len =
+		cpu_to_be64(fadump_conf->boot_memory_size);
+	fdm.rmr_region.destination_address = cpu_to_be64(addr);
+	addr += fadump_conf->boot_memory_size;
+
+	update_fadump_config(fadump_conf, &fdm);
+
+	return addr;
+}
+
+static int pseries_register_fadump(struct fw_dump *fadump_conf)
+{
+	int rc, err;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc = rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+			NULL, FADUMP_REGISTER, &fdm,
+			sizeof(struct pseries_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+
+	} while (wait_time);
+
+	err = -EIO;
+	switch (rc) {
+	case 0:
+		pr_info("Registration is successful!\n");
+		fadump_conf->dump_registered = 1;
+		err = 0;
+		break;
+	case -1:
+		pr_err("Failed to register. Hardware Error(%d).\n", rc);
+		break;
+	case -3:
+		if (!is_boot_memory_area_contiguous(fadump_conf))
+			pr_err("Can't hot-remove boot memory area.\n");
+		else if (!is_reserved_memory_area_contiguous(fadump_conf))
+			pr_err("Can't hot-remove reserved memory area.\n");
+
+		pr_err("Failed to register. Parameter Error(%d).\n", rc);
+		err = -EINVAL;
+		break;
+	case -9:
+		pr_err("Already registered!\n");
+		fadump_conf->dump_registered = 1;
+		err = -EEXIST;
+		break;
+	default:
+		pr_err("Failed to register. Unknown Error(%d).\n", rc);
+		break;
+	}
+
+	return err;
+}
+
+static int pseries_unregister_fadump(struct fw_dump *fadump_conf)
+{
+	int rc = 0;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc = rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+			NULL, FADUMP_UNREGISTER, &fdm,
+			sizeof(struct pseries_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+	} while (wait_time);
+
+	if (rc) {
+		pr_err("Failed to un-register - unexpected error(%d).\n", rc);
+		return rc;
+	}
+
+	fadump_conf->dump_registered = 0;
+	return 0;
+}
+
+static int pseries_invalidate_fadump(struct fw_dump *fadump_conf)
+{
+	int rc = 0;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc = rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+			NULL, FADUMP_INVALIDATE, fdm_active,
+			sizeof(struct pseries_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+	} while (wait_time);
+
+	if (rc) {
+		pr_err("Failed to invalidate - unexpected error (%d).\n", rc);
+		return rc;
+	}
+
+	fadump_conf->dump_active = 0;
+	fdm_active = NULL;
+	return 0;
+}
+
+static struct fadump_reg_entry*
+fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
+{
+	memset(regs, 0, sizeof(struct pt_regs));
+
+	while (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUEND")) {
+		fadump_set_regval(regs, be64_to_cpu(reg_entry->reg_id),
+				  be64_to_cpu(reg_entry->reg_value));
+		reg_entry++;
+	}
+	reg_entry++;
+	return reg_entry;
+}
+
+/*
+ * Read CPU state dump data and convert it into ELF notes.
+ * The CPU dump starts with magic number "REGSAVE". NumCpusOffset should be
+ * used to access the data to allow for additional fields to be added without
+ * affecting compatibility. Each list of registers for a CPU starts with
+ * "CPUSTRT" and ends with "CPUEND". Each register entry is of 16 bytes,
+ * 8 Byte ASCII identifier and 8 Byte register value. The register entry
+ * with identifier "CPUSTRT" and "CPUEND" contains 4 byte cpu id as part
+ * of register value. For more details refer to PAPR document.
+ *
+ * Only for the crashing cpu we ignore the CPU dump data and get exact
+ * state from fadump crash info structure populated by first kernel at the
+ * time of crash.
+ */
+static int __init fadump_build_cpu_notes(struct fw_dump *fadump_conf)
+{
+	struct fadump_reg_save_area_header *reg_header;
+	struct fadump_reg_entry *reg_entry;
+	struct fadump_crash_info_header *fdh = NULL;
+	void *vaddr;
+	unsigned long addr;
+	u32 num_cpus, *note_buf;
+	struct pt_regs regs;
+	int i, rc = 0, cpu = 0;
+
+	addr = be64_to_cpu(fdm_active->cpu_state_data.destination_address);
+	vaddr = __va(addr);
+
+	reg_header = vaddr;
+	if (be64_to_cpu(reg_header->magic_number) != REGSAVE_AREA_MAGIC) {
+		pr_err("Unable to read register save area.\n");
+		return -ENOENT;
+	}
+
+	pr_debug("--------CPU State Data------------\n");
+	pr_debug("Magic Number: %llx\n", be64_to_cpu(reg_header->magic_number));
+	pr_debug("NumCpuOffset: %x\n", be32_to_cpu(reg_header->num_cpu_offset));
+
+	vaddr += be32_to_cpu(reg_header->num_cpu_offset);
+	num_cpus = be32_to_cpu(*((__be32 *)(vaddr)));
+	pr_debug("NumCpus     : %u\n", num_cpus);
+	vaddr += sizeof(u32);
+	reg_entry = (struct fadump_reg_entry *)vaddr;
+
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
+			(num_cpus * sizeof(note_buf_t)), note_buf);
+
+	if (fadump_conf->fadumphdr_addr)
+		fdh = __va(fadump_conf->fadumphdr_addr);
+
+	for (i = 0; i < num_cpus; i++) {
+		if (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUSTRT")) {
+			pr_err("Unable to read CPU state data\n");
+			rc = -ENOENT;
+			goto error_out;
+		}
+		/* Lower 4 bytes of reg_value contains logical cpu id */
+		cpu = be64_to_cpu(reg_entry->reg_value) & FADUMP_CPU_ID_MASK;
+		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
+			SKIP_TO_NEXT_CPU(reg_entry);
+			continue;
+		}
+		pr_debug("Reading register data for cpu %d...\n", cpu);
+		if (fdh && fdh->crashing_cpu == cpu) {
+			regs = fdh->regs;
+			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+			SKIP_TO_NEXT_CPU(reg_entry);
+		} else {
+			reg_entry++;
+			reg_entry = fadump_read_registers(reg_entry, &regs);
+			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+		}
+	}
+	final_note(note_buf);
+
+	if (fdh) {
+		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
+			 fdh->elfcorehdr_addr);
+		fadump_update_elfcore_header(fadump_conf,
+					     __va(fdh->elfcorehdr_addr));
+	}
+	return 0;
+
+error_out:
+	fadump_cpu_notes_buf_free((ulong)__va(fadump_conf->cpu_notes_buf),
+				  fadump_conf->cpu_notes_buf_size);
+	fadump_conf->cpu_notes_buf = 0;
+	fadump_conf->cpu_notes_buf_size = 0;
+	return rc;
+
+}
+
+/*
+ * Validate and process the dump data stored by firmware before exporting
+ * it through '/proc/vmcore'.
+ */
+static int __init pseries_process_fadump(struct fw_dump *fadump_conf)
+{
+	struct fadump_crash_info_header *fdh;
+	int rc = 0;
+
+	if (!fdm_active || !fadump_conf->fadumphdr_addr)
+		return -EINVAL;
+
+	/* Check if the dump data is valid. */
+	if ((be16_to_cpu(fdm_active->header.dump_status_flag) ==
+			PSERIES_FADUMP_ERROR_FLAG) ||
+			(fdm_active->cpu_state_data.error_flags != 0) ||
+			(fdm_active->rmr_region.error_flags != 0)) {
+		pr_err("Dump taken by platform is not valid\n");
+		return -EINVAL;
+	}
+	if ((fdm_active->rmr_region.bytes_dumped !=
+			fdm_active->rmr_region.source_len) ||
+			!fdm_active->cpu_state_data.bytes_dumped) {
+		pr_err("Dump taken by platform is incomplete\n");
+		return -EINVAL;
+	}
+
+	/* Validate the fadump crash info header */
+	fdh = __va(fadump_conf->fadumphdr_addr);
+	if (fdh->magic_number != FADUMP_CRASH_INFO_MAGIC) {
+		pr_err("Crash info header is not valid.\n");
+		return -EINVAL;
+	}
+
+	if (!fdm_active->cpu_state_data.bytes_dumped)
+		return -EINVAL;
+
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
+	return 0;
+}
+
+static void pseries_fadump_region_show(struct fw_dump *fadump_conf,
+				       struct seq_file *m)
+{
+	const struct pseries_fadump_mem_struct *fdm_ptr;
+	const struct pseries_fadump_section *cpu_data_section;
+
+	if (fdm_active)
+		fdm_ptr = fdm_active;
+	else
+		fdm_ptr = &fdm;
+
+	cpu_data_section = &(fdm_ptr->cpu_state_data);
+	seq_printf(m,
+			"CPU :[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+			be64_to_cpu(cpu_data_section->destination_address),
+			be64_to_cpu(cpu_data_section->destination_address) +
+			be64_to_cpu(cpu_data_section->source_len) - 1,
+			be64_to_cpu(cpu_data_section->source_len),
+			be64_to_cpu(cpu_data_section->bytes_dumped));
+	seq_printf(m,
+			"HPTE:[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+			be64_to_cpu(fdm_ptr->hpte_region.destination_address),
+			be64_to_cpu(fdm_ptr->hpte_region.destination_address) +
+			be64_to_cpu(fdm_ptr->hpte_region.source_len) - 1,
+			be64_to_cpu(fdm_ptr->hpte_region.source_len),
+			be64_to_cpu(fdm_ptr->hpte_region.bytes_dumped));
+	seq_printf(m,
+			"DUMP:[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+			be64_to_cpu(fdm_ptr->rmr_region.destination_address),
+			be64_to_cpu(fdm_ptr->rmr_region.destination_address) +
+			be64_to_cpu(fdm_ptr->rmr_region.source_len) - 1,
+			be64_to_cpu(fdm_ptr->rmr_region.source_len),
+			be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
+
+	if (!fdm_active ||
+		(fadump_conf->reserve_dump_area_start ==
+		be64_to_cpu(cpu_data_section->destination_address)))
+		return;
+
+	/* Dump is active. Show reserved memory region. */
+	seq_printf(m,
+			"    :[%#016lx-%#016llx] %#llx bytes, Dumped: %#llx\n",
+			fadump_conf->reserve_dump_area_start,
+			be64_to_cpu(cpu_data_section->destination_address) - 1,
+			be64_to_cpu(cpu_data_section->destination_address) -
+			fadump_conf->reserve_dump_area_start,
+			be64_to_cpu(cpu_data_section->destination_address) -
+			fadump_conf->reserve_dump_area_start);
+}
+
+static void pseries_crash_fadump(struct fadump_crash_info_header *fdh,
+				 const char *msg)
+{
+	/* Call ibm,os-term rtas call to trigger firmware assisted dump */
+	rtas_os_term((char *)msg);
+}
+
+
+static struct fadump_ops pseries_fadump_ops = {
+	.init_fadump_mem_struct	= pseries_init_fadump_mem_struct,
+	.register_fadump	= pseries_register_fadump,
+	.unregister_fadump	= pseries_unregister_fadump,
+	.invalidate_fadump	= pseries_invalidate_fadump,
+	.process_fadump		= pseries_process_fadump,
+	.fadump_region_show	= pseries_fadump_region_show,
+	.crash_fadump		= pseries_crash_fadump,
+};
+
+int __init pseries_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
+{
+	const __be32 *sections;
+	int i, num_sections;
+	int size;
+	const __be32 *token;
+
+	/*
+	 * Check if Firmware Assisted dump is supported. if yes, check
+	 * if dump has been initiated on last reboot.
+	 */
+	token = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump", NULL);
+	if (!token)
+		return 1;
+
+	fadump_conf->ibm_configure_kernel_dump = be32_to_cpu(*token);
+	fadump_conf->ops		= &pseries_fadump_ops;
+	fadump_conf->fadump_platform	= FADUMP_PLATFORM_PSERIES;
+	fadump_conf->fadump_supported	= 1;
+
+	/*
+	 * The 'ibm,kernel-dump' rtas node is present only if there is
+	 * dump data waiting for us.
+	 */
+	fdm_active = of_get_flat_dt_prop(node, "ibm,kernel-dump", NULL);
+	if (fdm_active) {
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+		update_fadump_config(fadump_conf, fdm_active);
+	}
+
+	/* Get the sizes required to store dump data for the firmware provided
+	 * dump sections.
+	 * For each dump section type supported, a 32bit cell which defines
+	 * the ID of a supported section followed by two 32 bit cells which
+	 * gives the size of the section in bytes.
+	 */
+	sections = of_get_flat_dt_prop(node, "ibm,configure-kernel-dump-sizes",
+					&size);
+
+	if (!sections)
+		return 1;
+
+	num_sections = size / (3 * sizeof(u32));
+
+	for (i = 0; i < num_sections; i++, sections += 3) {
+		u32 type = (u32)of_read_number(sections, 1);
+
+		switch (type) {
+		case PSERIES_FADUMP_CPU_STATE_DATA:
+			fadump_conf->cpu_state_data_size =
+					of_read_ulong(&sections[1], 2);
+			break;
+		case PSERIES_FADUMP_HPTE_REGION:
+			fadump_conf->hpte_region_size =
+					of_read_ulong(&sections[1], 2);
+			break;
+		}
+	}
+
+	return 1;
+}
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
new file mode 100644
index 0000000..d61e5d9
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -0,0 +1,96 @@
+/*
+ * Firmware-Assisted Dump support on POWERVM platform.
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
+#ifndef __PPC64_PSERIES_FA_DUMP_H__
+#define __PPC64_PSERIES_FA_DUMP_H__
+
+/* Firmware provided dump sections */
+#define PSERIES_FADUMP_CPU_STATE_DATA	0x0001
+#define PSERIES_FADUMP_HPTE_REGION	0x0002
+#define PSERIES_FADUMP_REAL_MODE_REGION	0x0011
+
+/* Dump request flag */
+#define PSERIES_FADUMP_REQUEST_FLAG	0x00000001
+
+/* Dump status flag */
+#define PSERIES_FADUMP_ERROR_FLAG	0x2000
+
+/* Utility macros */
+#define SKIP_TO_NEXT_CPU(reg_entry)					\
+({									\
+	while (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUEND"))	\
+		reg_entry++;						\
+	reg_entry++;							\
+})
+
+/* Kernel Dump section info */
+struct pseries_fadump_section {
+	__be32	request_flag;
+	__be16	source_data_type;
+	__be16	error_flags;
+	__be64	source_address;
+	__be64	source_len;
+	__be64	bytes_dumped;
+	__be64	destination_address;
+};
+
+/* ibm,configure-kernel-dump header. */
+struct pseries_fadump_section_header {
+	__be32	dump_format_version;
+	__be16	dump_num_sections;
+	__be16	dump_status_flag;
+	__be32	offset_first_dump_section;
+
+	/* Fields for disk dump option. */
+	__be32	dd_block_size;
+	__be64	dd_block_offset;
+	__be64	dd_num_blocks;
+	__be32	dd_offset_disk_path;
+
+	/* Maximum time allowed to prevent an automatic dump-reboot. */
+	__be32	max_time_auto;
+};
+
+/*
+ * Firmware Assisted dump memory structure. This structure is required for
+ * registering future kernel dump with power firmware through rtas call.
+ *
+ * No disk dump option. Hence disk dump path string section is not included.
+ */
+struct pseries_fadump_mem_struct {
+	struct pseries_fadump_section_header	header;
+
+	/* Kernel dump sections */
+	struct pseries_fadump_section		cpu_state_data;
+	struct pseries_fadump_section		hpte_region;
+	struct pseries_fadump_section		rmr_region;
+};
+
+#define REGSAVE_AREA_MAGIC		STR_TO_HEX("REGSAVE")
+
+/* The firmware-assisted dump format.
+ *
+ * The register save area is an area in the partition's memory used to preserve
+ * the register contents (CPU state data) for the active CPUs during a firmware
+ * assisted dump. The dump format contains register save area header followed
+ * by register entries. On pseries, each list of registers for a CPU starts with
+ * "CPUSTRT" and ends with "CPUEND".
+ */
+
+/* Register save area header. */
+struct fadump_reg_save_area_header {
+	__be64		magic_number;
+	__be32		version;
+	__be32		num_cpu_offset;
+};
+
+#endif /* __PPC64_PSERIES_FA_DUMP_H__ */

