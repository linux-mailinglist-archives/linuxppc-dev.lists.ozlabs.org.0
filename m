Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F255795E2A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:15:57 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVBL6K6kzDqfk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:15:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTxY1jzLzDqx5
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:04:49 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTxY0tKMz8tSM
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:04:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTxY0KJ6z9sBF; Tue, 20 Aug 2019 22:04:49 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CTxX4LTQz9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:04:48 +1000 (AEST)
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC27YC046660
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:04:46 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uggcf8kgv-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:04:46 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:04:42 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:04:39 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC4bwY53018664
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:04:37 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6A161A4062;
 Tue, 20 Aug 2019 12:04:37 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BCBD2A4054;
 Tue, 20 Aug 2019 12:04:35 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 20 Aug 2019 12:04:35 +0000 (GMT)
Subject: [PATCH v5 04/31] pseries/fadump: move rtas specific definitions to
 platform code
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:34:34 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0008-0000-0000-0000030B084D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0009-0000-0000-00004A292F61
Message-Id: <156630267483.8896.941814108333012813.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1908200128
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
 Nicholas Piggin <npiggin@gmail.com>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Currently, FADump is only supported on pSeries but that is going to
change soon with FADump support being added on PowerNV platform. So,
move rtas specific definitions to platform code to allow FADump
to have multiple platforms support.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h            |  112 --------------------------
 arch/powerpc/kernel/fadump-common.h          |   20 ++++-
 arch/powerpc/kernel/fadump.c                 |   90 +++++++++++----------
 arch/powerpc/platforms/pseries/rtas-fadump.h |  103 ++++++++++++++++++++++++
 4 files changed, 170 insertions(+), 155 deletions(-)
 create mode 100644 arch/powerpc/platforms/pseries/rtas-fadump.h

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index 75179497..e608d34 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -11,116 +11,8 @@
 
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
-#define FADUMP_CPU_ID_MASK	((1UL << 32) - 1)
-
-#define CPU_UNKNOWN		(~((u32)0))
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
-/*
- * Copy the ascii values for first 8 characters from a string into u64
- * variable at their respective indexes.
- * e.g.
- *  The string "FADMPINF" will be converted into 0x4641444d50494e46
- */
-static inline u64 str_to_u64(const char *str)
-{
-	u64 val = 0;
-	int i;
-
-	for (i = 0; i < sizeof(val); i++)
-		val = (*str) ? (val << 8) | *str++ : val << 8;
-	return val;
-}
-#define STR_TO_HEX(x)	str_to_u64(x)
-#define REG_ID(x)	str_to_u64(x)
-
-#define REGSAVE_AREA_MAGIC		STR_TO_HEX("REGSAVE")
-
-/* The firmware-assisted dump format.
- *
- * The register save area is an area in the partition's memory used to preserve
- * the register contents (CPU state data) for the active CPUs during a firmware
- * assisted dump. The dump format contains register save area header followed
- * by register entries. Each list of registers for a CPU starts with
- * "CPUSTRT" and ends with "CPUEND".
- */
-
-/* Register save area header. */
-struct fadump_reg_save_area_header {
-	__be64		magic_number;
-	__be32		version;
-	__be32		num_cpu_offset;
-};
-
-/* Register entry. */
-struct fadump_reg_entry {
-	__be64		reg_id;
-	__be64		reg_value;
-};
-
 extern int is_fadump_memory_area(u64 addr, ulong size);
 extern int early_init_dt_scan_fw_dump(unsigned long node,
 		const char *uname, int depth, void *data);
@@ -136,5 +28,5 @@ static inline int is_fadump_active(void) { return 0; }
 static inline int should_fadump_crash(void) { return 0; }
 static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
 static inline void fadump_cleanup(void) { }
-#endif
-#endif
+#endif /* !CONFIG_FA_DUMP */
+#endif /* __PPC64_FA_DUMP_H__ */
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 54328ef..93bc471 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -46,7 +46,25 @@
 #define FADUMP_UNREGISTER		2
 #define FADUMP_INVALIDATE		3
 
-#define FADUMP_CRASH_INFO_MAGIC		str_to_u64("FADMPINF")
+/*
+ * Copy the ascii values for first 8 characters from a string into u64
+ * variable at their respective indexes.
+ * e.g.
+ *  The string "FADMPINF" will be converted into 0x4641444d50494e46
+ */
+static inline u64 fadump_str_to_u64(const char *str)
+{
+	u64 val = 0;
+	int i;
+
+	for (i = 0; i < sizeof(val); i++)
+		val = (*str) ? (val << 8) | *str++ : val << 8;
+	return val;
+}
+
+#define FADUMP_CPU_UNKNOWN		(~((u32)0))
+
+#define FADUMP_CRASH_INFO_MAGIC		fadump_str_to_u64("FADMPINF")
 
 /* fadump crash info structure */
 struct fadump_crash_info_header {
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 40e5e96..23c0ca0 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -33,10 +33,11 @@
 #include <asm/setup.h>
 
 #include "fadump-common.h"
+#include "../platforms/pseries/rtas-fadump.h"
 
 static struct fw_dump fw_dump;
-static struct fadump_mem_struct fdm;
-static const struct fadump_mem_struct *fdm_active;
+static struct rtas_fadump_mem_struct fdm;
+static const struct rtas_fadump_mem_struct *fdm_active;
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fad_crash_memory_ranges *crash_memory_ranges;
@@ -156,11 +157,11 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 		u32 type = (u32)of_read_number(sections, 1);
 
 		switch (type) {
-		case FADUMP_CPU_STATE_DATA:
+		case RTAS_FADUMP_CPU_STATE_DATA:
 			fw_dump.cpu_state_data_size =
 					of_read_ulong(&sections[1], 2);
 			break;
-		case FADUMP_HPTE_REGION:
+		case RTAS_FADUMP_HPTE_REGION:
 			fw_dump.hpte_region_size =
 					of_read_ulong(&sections[1], 2);
 			break;
@@ -219,20 +220,20 @@ static void fadump_show_config(void)
 	pr_debug("Boot memory size  : %lx\n", fw_dump.boot_memory_size);
 }
 
-static unsigned long init_fadump_mem_struct(struct fadump_mem_struct *fdm,
+static unsigned long init_fadump_mem_struct(struct rtas_fadump_mem_struct *fdm,
 				unsigned long addr)
 {
 	if (!fdm)
 		return 0;
 
-	memset(fdm, 0, sizeof(struct fadump_mem_struct));
+	memset(fdm, 0, sizeof(struct rtas_fadump_mem_struct));
 	addr = addr & PAGE_MASK;
 
 	fdm->header.dump_format_version = cpu_to_be32(0x00000001);
 	fdm->header.dump_num_sections = cpu_to_be16(3);
 	fdm->header.dump_status_flag = 0;
 	fdm->header.offset_first_dump_section =
-		cpu_to_be32((u32)offsetof(struct fadump_mem_struct, cpu_state_data));
+		cpu_to_be32((u32)offsetof(struct rtas_fadump_mem_struct, cpu_state_data));
 
 	/*
 	 * Fields for disk dump option.
@@ -248,24 +249,24 @@ static unsigned long init_fadump_mem_struct(struct fadump_mem_struct *fdm,
 
 	/* Kernel dump sections */
 	/* cpu state data section. */
-	fdm->cpu_state_data.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->cpu_state_data.source_data_type = cpu_to_be16(FADUMP_CPU_STATE_DATA);
+	fdm->cpu_state_data.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm->cpu_state_data.source_data_type = cpu_to_be16(RTAS_FADUMP_CPU_STATE_DATA);
 	fdm->cpu_state_data.source_address = 0;
 	fdm->cpu_state_data.source_len = cpu_to_be64(fw_dump.cpu_state_data_size);
 	fdm->cpu_state_data.destination_address = cpu_to_be64(addr);
 	addr += fw_dump.cpu_state_data_size;
 
 	/* hpte region section */
-	fdm->hpte_region.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->hpte_region.source_data_type = cpu_to_be16(FADUMP_HPTE_REGION);
+	fdm->hpte_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm->hpte_region.source_data_type = cpu_to_be16(RTAS_FADUMP_HPTE_REGION);
 	fdm->hpte_region.source_address = 0;
 	fdm->hpte_region.source_len = cpu_to_be64(fw_dump.hpte_region_size);
 	fdm->hpte_region.destination_address = cpu_to_be64(addr);
 	addr += fw_dump.hpte_region_size;
 
 	/* RMA region section */
-	fdm->rmr_region.request_flag = cpu_to_be32(FADUMP_REQUEST_FLAG);
-	fdm->rmr_region.source_data_type = cpu_to_be16(FADUMP_REAL_MODE_REGION);
+	fdm->rmr_region.request_flag = cpu_to_be32(RTAS_FADUMP_REQUEST_FLAG);
+	fdm->rmr_region.source_data_type = cpu_to_be16(RTAS_FADUMP_REAL_MODE_REGION);
 	fdm->rmr_region.source_address = cpu_to_be64(RMA_START);
 	fdm->rmr_region.source_len = cpu_to_be64(fw_dump.boot_memory_size);
 	fdm->rmr_region.destination_address = cpu_to_be64(addr);
@@ -536,7 +537,7 @@ static int __init early_fadump_reserve_mem(char *p)
 }
 early_param("fadump_reserve_mem", early_fadump_reserve_mem);
 
-static int register_fw_dump(struct fadump_mem_struct *fdm)
+static int register_fw_dump(struct rtas_fadump_mem_struct *fdm)
 {
 	int rc, err;
 	unsigned int wait_time;
@@ -547,7 +548,7 @@ static int register_fw_dump(struct fadump_mem_struct *fdm)
 	do {
 		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
 			FADUMP_REGISTER, fdm,
-			sizeof(struct fadump_mem_struct));
+			sizeof(struct rtas_fadump_mem_struct));
 
 		wait_time = rtas_busy_delay_time(rc);
 		if (wait_time)
@@ -643,7 +644,7 @@ static inline int fadump_gpr_index(u64 id)
 	int i = -1;
 	char str[3];
 
-	if ((id & GPR_MASK) == REG_ID("GPR")) {
+	if ((id & GPR_MASK) == fadump_str_to_u64("GPR")) {
 		/* get the digits at the end */
 		id &= ~GPR_MASK;
 		id >>= 24;
@@ -665,30 +666,30 @@ static inline void fadump_set_regval(struct pt_regs *regs, u64 reg_id,
 	i = fadump_gpr_index(reg_id);
 	if (i >= 0)
 		regs->gpr[i] = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("NIA"))
+	else if (reg_id == fadump_str_to_u64("NIA"))
 		regs->nip = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("MSR"))
+	else if (reg_id == fadump_str_to_u64("MSR"))
 		regs->msr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("CTR"))
+	else if (reg_id == fadump_str_to_u64("CTR"))
 		regs->ctr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("LR"))
+	else if (reg_id == fadump_str_to_u64("LR"))
 		regs->link = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("XER"))
+	else if (reg_id == fadump_str_to_u64("XER"))
 		regs->xer = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("CR"))
+	else if (reg_id == fadump_str_to_u64("CR"))
 		regs->ccr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("DAR"))
+	else if (reg_id == fadump_str_to_u64("DAR"))
 		regs->dar = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("DSISR"))
+	else if (reg_id == fadump_str_to_u64("DSISR"))
 		regs->dsisr = (unsigned long)reg_val;
 }
 
-static struct fadump_reg_entry*
-fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
+static struct rtas_fadump_reg_entry*
+fadump_read_registers(struct rtas_fadump_reg_entry *reg_entry, struct pt_regs *regs)
 {
 	memset(regs, 0, sizeof(struct pt_regs));
 
-	while (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUEND")) {
+	while (be64_to_cpu(reg_entry->reg_id) != fadump_str_to_u64("CPUEND")) {
 		fadump_set_regval(regs, be64_to_cpu(reg_entry->reg_id),
 					be64_to_cpu(reg_entry->reg_value));
 		reg_entry++;
@@ -711,10 +712,10 @@ fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
  * state from fadump crash info structure populated by first kernel at the
  * time of crash.
  */
-static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
+static int __init fadump_build_cpu_notes(const struct rtas_fadump_mem_struct *fdm)
 {
-	struct fadump_reg_save_area_header *reg_header;
-	struct fadump_reg_entry *reg_entry;
+	struct rtas_fadump_reg_save_area_header *reg_header;
+	struct rtas_fadump_reg_entry *reg_entry;
 	struct fadump_crash_info_header *fdh = NULL;
 	void *vaddr;
 	unsigned long addr;
@@ -729,7 +730,8 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 	vaddr = __va(addr);
 
 	reg_header = vaddr;
-	if (be64_to_cpu(reg_header->magic_number) != REGSAVE_AREA_MAGIC) {
+	if (be64_to_cpu(reg_header->magic_number) !=
+	    fadump_str_to_u64("REGSAVE")) {
 		printk(KERN_ERR "Unable to read register save area.\n");
 		return -ENOENT;
 	}
@@ -741,7 +743,7 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 	num_cpus = be32_to_cpu(*((__be32 *)(vaddr)));
 	pr_debug("NumCpus     : %u\n", num_cpus);
 	vaddr += sizeof(u32);
-	reg_entry = (struct fadump_reg_entry *)vaddr;
+	reg_entry = (struct rtas_fadump_reg_entry *)vaddr;
 
 	/* Allocate buffer to hold cpu crash notes. */
 	fw_dump.cpu_notes_buf_size = num_cpus * sizeof(note_buf_t);
@@ -761,22 +763,22 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 		fdh = __va(fw_dump.fadumphdr_addr);
 
 	for (i = 0; i < num_cpus; i++) {
-		if (be64_to_cpu(reg_entry->reg_id) != REG_ID("CPUSTRT")) {
+		if (be64_to_cpu(reg_entry->reg_id) != fadump_str_to_u64("CPUSTRT")) {
 			printk(KERN_ERR "Unable to read CPU state data\n");
 			rc = -ENOENT;
 			goto error_out;
 		}
 		/* Lower 4 bytes of reg_value contains logical cpu id */
-		cpu = be64_to_cpu(reg_entry->reg_value) & FADUMP_CPU_ID_MASK;
+		cpu = be64_to_cpu(reg_entry->reg_value) & RTAS_FADUMP_CPU_ID_MASK;
 		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
-			SKIP_TO_NEXT_CPU(reg_entry);
+			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
 			continue;
 		}
 		pr_debug("Reading register data for cpu %d...\n", cpu);
 		if (fdh && fdh->crashing_cpu == cpu) {
 			regs = fdh->regs;
 			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
-			SKIP_TO_NEXT_CPU(reg_entry);
+			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
 		} else {
 			reg_entry++;
 			reg_entry = fadump_read_registers(reg_entry, &regs);
@@ -805,7 +807,7 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
  * Validate and process the dump data stored by firmware before exporting
  * it through '/proc/vmcore'.
  */
-static int __init process_fadump(const struct fadump_mem_struct *fdm_active)
+static int __init process_fadump(const struct rtas_fadump_mem_struct *fdm_active)
 {
 	struct fadump_crash_info_header *fdh;
 	int rc = 0;
@@ -814,7 +816,7 @@ static int __init process_fadump(const struct fadump_mem_struct *fdm_active)
 		return -EINVAL;
 
 	/* Check if the dump data is valid. */
-	if ((be16_to_cpu(fdm_active->header.dump_status_flag) == FADUMP_ERROR_FLAG) ||
+	if ((be16_to_cpu(fdm_active->header.dump_status_flag) == RTAS_FADUMP_ERROR_FLAG) ||
 			(fdm_active->cpu_state_data.error_flags != 0) ||
 			(fdm_active->rmr_region.error_flags != 0)) {
 		printk(KERN_ERR "Dump taken by platform is not valid\n");
@@ -1145,7 +1147,7 @@ static unsigned long init_fadump_header(unsigned long addr)
 	fdh->magic_number = FADUMP_CRASH_INFO_MAGIC;
 	fdh->elfcorehdr_addr = addr;
 	/* We will set the crashing cpu id in crash_fadump() during crash. */
-	fdh->crashing_cpu = CPU_UNKNOWN;
+	fdh->crashing_cpu = FADUMP_CPU_UNKNOWN;
 
 	return addr;
 }
@@ -1179,7 +1181,7 @@ static int register_fadump(void)
 	return register_fw_dump(&fdm);
 }
 
-static int fadump_unregister_dump(struct fadump_mem_struct *fdm)
+static int fadump_unregister_dump(struct rtas_fadump_mem_struct *fdm)
 {
 	int rc = 0;
 	unsigned int wait_time;
@@ -1190,7 +1192,7 @@ static int fadump_unregister_dump(struct fadump_mem_struct *fdm)
 	do {
 		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
 			FADUMP_UNREGISTER, fdm,
-			sizeof(struct fadump_mem_struct));
+			sizeof(struct rtas_fadump_mem_struct));
 
 		wait_time = rtas_busy_delay_time(rc);
 		if (wait_time)
@@ -1206,7 +1208,7 @@ static int fadump_unregister_dump(struct fadump_mem_struct *fdm)
 	return 0;
 }
 
-static int fadump_invalidate_dump(const struct fadump_mem_struct *fdm)
+static int fadump_invalidate_dump(const struct rtas_fadump_mem_struct *fdm)
 {
 	int rc = 0;
 	unsigned int wait_time;
@@ -1217,7 +1219,7 @@ static int fadump_invalidate_dump(const struct fadump_mem_struct *fdm)
 	do {
 		rc = rtas_call(fw_dump.ibm_configure_kernel_dump, 3, 1, NULL,
 			FADUMP_INVALIDATE, fdm,
-			sizeof(struct fadump_mem_struct));
+			sizeof(struct rtas_fadump_mem_struct));
 
 		wait_time = rtas_busy_delay_time(rc);
 		if (wait_time)
@@ -1438,7 +1440,7 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 
 static int fadump_region_show(struct seq_file *m, void *private)
 {
-	const struct fadump_mem_struct *fdm_ptr;
+	const struct rtas_fadump_mem_struct *fdm_ptr;
 
 	if (!fw_dump.fadump_enabled)
 		return 0;
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.h b/arch/powerpc/platforms/pseries/rtas-fadump.h
new file mode 100644
index 0000000..a3a2918
--- /dev/null
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Firmware-Assisted Dump support on POWERVM platform.
+ *
+ * Copyright 2011, IBM Corporation
+ * Author: Mahesh Salgaonkar <mahesh@linux.ibm.com>
+ *
+ * Copyright 2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.ibm.com>
+ */
+
+#ifndef __PPC64_RTAS_FA_DUMP_H__
+#define __PPC64_RTAS_FA_DUMP_H__
+
+/* Firmware provided dump sections */
+#define RTAS_FADUMP_CPU_STATE_DATA	0x0001
+#define RTAS_FADUMP_HPTE_REGION		0x0002
+#define RTAS_FADUMP_REAL_MODE_REGION	0x0011
+
+/* Dump request flag */
+#define RTAS_FADUMP_REQUEST_FLAG	0x00000001
+
+/* Dump status flag */
+#define RTAS_FADUMP_ERROR_FLAG		0x2000
+
+/* Kernel Dump section info */
+struct rtas_fadump_section {
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
+struct rtas_fadump_section_header {
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
+struct rtas_fadump_mem_struct {
+	struct rtas_fadump_section_header	header;
+
+	/* Kernel dump sections */
+	struct rtas_fadump_section		cpu_state_data;
+	struct rtas_fadump_section		hpte_region;
+	struct rtas_fadump_section		rmr_region;
+};
+
+/*
+ * The firmware-assisted dump format.
+ *
+ * The register save area is an area in the partition's memory used to preserve
+ * the register contents (CPU state data) for the active CPUs during a firmware
+ * assisted dump. The dump format contains register save area header followed
+ * by register entries. Each list of registers for a CPU starts with "CPUSTRT"
+ * and ends with "CPUEND".
+ */
+
+/* Register save area header. */
+struct rtas_fadump_reg_save_area_header {
+	__be64		magic_number;
+	__be32		version;
+	__be32		num_cpu_offset;
+};
+
+/* Register entry. */
+struct rtas_fadump_reg_entry {
+	__be64		reg_id;
+	__be64		reg_value;
+};
+
+/* Utility macros */
+#define RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry)				\
+({									\
+	while (be64_to_cpu(reg_entry->reg_id) !=			\
+	       fadump_str_to_u64("CPUEND"))				\
+		reg_entry++;						\
+	reg_entry++;							\
+})
+
+#define RTAS_FADUMP_CPU_ID_MASK			((1UL << 32) - 1)
+
+#endif /* __PPC64_RTAS_FA_DUMP_H__ */

