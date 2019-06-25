Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D1355961
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 22:49:52 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJF91gwZzDqSd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 06:49:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJ8l1w7RzDqW2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:45:59 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJ8k5qDbz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:45:58 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJ8k4rPCz9s5c; Wed, 26 Jun 2019 06:45:58 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJ8k0s49z9s3l
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:45:57 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKgVmA040625
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:45:55 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tbqvjqq0g-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:45:55 -0400
Received: from localhost
 by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:45:53 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
 by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:45:52 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKjoHT43057230
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:45:50 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 88E34A4040;
 Tue, 25 Jun 2019 20:45:50 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E95FAA404D;
 Tue, 25 Jun 2019 20:45:47 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:45:47 +0000 (GMT)
Subject: [PATCH v3 01/16] powerpc/fadump: move internal fadump code to a new
 file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:15:46 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0028-0000-0000-0000037D86EB
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0029-0000-0000-0000243DA9D4
Message-Id: <156149554689.9094.13274886908174068943.stgit@hbathini.in.ibm.com>
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

Refactoring fadump code means internal fadump code is referenced from
different places. For ease, move internal code to a new file.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/include/asm/fadump.h   |  112 --------------------
 arch/powerpc/kernel/Makefile        |    2 
 arch/powerpc/kernel/fadump-common.c |  184 +++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/fadump-common.h |  126 +++++++++++++++++++++++
 arch/powerpc/kernel/fadump.c        |  194 ++---------------------------------
 5 files changed, 324 insertions(+), 294 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.c
 create mode 100644 arch/powerpc/kernel/fadump-common.h

diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index 17d9b6a..a2d2533 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -11,34 +11,6 @@
 
 #ifdef CONFIG_FA_DUMP
 
-/*
- * The RMA region will be saved for later dumping when kernel crashes.
- * RMA is Real Mode Area, the first block of logical memory address owned
- * by logical partition, containing the storage that may be accessed with
- * translate off.
- */
-#define RMA_START	0x0
-#define RMA_END		(ppc64_rma_size)
-
-/*
- * On some Power systems where RMO is 128MB, it still requires minimum of
- * 256MB for kernel to boot successfully. When kdump infrastructure is
- * configured to save vmcore over network, we run into OOM issue while
- * loading modules related to network setup. Hence we need aditional 64M
- * of memory to avoid OOM issue.
- */
-#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
-			+ (0x1UL << 26))
-
-/* The upper limit percentage for user specified boot memory size (25%) */
-#define MAX_BOOT_MEM_RATIO			4
-
-#define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
-
-/* Alignement per CMA requirement. */
-#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
-			max_t(unsigned long, MAX_ORDER - 1, pageblock_order))
-
 /* Firmware provided dump sections */
 #define FADUMP_CPU_STATE_DATA	0x0001
 #define FADUMP_HPTE_REGION	0x0002
@@ -47,18 +19,9 @@
 /* Dump request flag */
 #define FADUMP_REQUEST_FLAG	0x00000001
 
-/* FAD commands */
-#define FADUMP_REGISTER		1
-#define FADUMP_UNREGISTER	2
-#define FADUMP_INVALIDATE	3
-
 /* Dump status flag */
 #define FADUMP_ERROR_FLAG	0x2000
 
-#define FADUMP_CPU_ID_MASK	((1UL << 32) - 1)
-
-#define CPU_UNKNOWN		(~((u32)0))
-
 /* Utility macros */
 #define SKIP_TO_NEXT_CPU(reg_entry)					\
 ({									\
@@ -112,59 +75,8 @@ struct fadump_mem_struct {
 	struct fadump_section		rmr_region;
 };
 
-/* Firmware-assisted dump configuration details. */
-struct fw_dump {
-	unsigned long	cpu_state_data_size;
-	unsigned long	hpte_region_size;
-	unsigned long	boot_memory_size;
-	unsigned long	reserve_dump_area_start;
-	unsigned long	reserve_dump_area_size;
-	/* cmd line option during boot */
-	unsigned long	reserve_bootvar;
-
-	unsigned long	fadumphdr_addr;
-	unsigned long	cpu_notes_buf;
-	unsigned long	cpu_notes_buf_size;
-
-	int		ibm_configure_kernel_dump;
-
-	unsigned long	fadump_enabled:1;
-	unsigned long	fadump_supported:1;
-	unsigned long	dump_active:1;
-	unsigned long	dump_registered:1;
-	unsigned long	nocma:1;
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
-#define FADUMP_CRASH_INFO_MAGIC		STR_TO_HEX("FADMPINF")
 #define REGSAVE_AREA_MAGIC		STR_TO_HEX("REGSAVE")
 
-/* The firmware-assisted dump format.
- *
- * The register save area is an area in the partition's memory used to preserve
- * the register contents (CPU state data) for the active CPUs during a firmware
- * assisted dump. The dump format contains register save area header followed
- * by register entries. Each list of registers for a CPU starts with
- * "CPUSTRT" and ends with "CPUEND".
- */
-
 /* Register save area header. */
 struct fadump_reg_save_area_header {
 	__be64		magic_number;
@@ -172,29 +84,9 @@ struct fadump_reg_save_area_header {
 	__be32		num_cpu_offset;
 };
 
-/* Register entry. */
-struct fadump_reg_entry {
-	__be64		reg_id;
-	__be64		reg_value;
-};
-
-/* fadump crash info structure */
-struct fadump_crash_info_header {
-	u64		magic_number;
-	u64		elfcorehdr_addr;
-	u32		crashing_cpu;
-	struct pt_regs	regs;
-	struct cpumask	online_mask;
-};
-
-struct fad_crash_memory_ranges {
-	unsigned long long	base;
-	unsigned long long	size;
-};
-
 extern int is_fadump_memory_area(u64 addr, ulong size);
-extern int early_init_dt_scan_fw_dump(unsigned long node,
-		const char *uname, int depth, void *data);
+extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data);
 extern int fadump_reserve_mem(void);
 extern int setup_fadump(void);
 extern int is_fadump_active(void);
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4a..23372e3 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -77,7 +77,7 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
 				  eeh_driver.o eeh_event.o eeh_sysfs.o
 obj-$(CONFIG_GENERIC_TBSYNC)	+= smp-tbsync.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
-obj-$(CONFIG_FA_DUMP)		+= fadump.o
+obj-$(CONFIG_FA_DUMP)		+= fadump.o fadump-common.o
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
 endif
diff --git a/arch/powerpc/kernel/fadump-common.c b/arch/powerpc/kernel/fadump-common.c
new file mode 100644
index 0000000..0182886
--- /dev/null
+++ b/arch/powerpc/kernel/fadump-common.c
@@ -0,0 +1,184 @@
+/*
+ * Firmware-Assisted Dump internal code.
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
+#include <linux/memblock.h>
+#include <linux/elf.h>
+#include <linux/mm.h>
+#include <linux/crash_core.h>
+
+#include "fadump-common.h"
+
+void *fadump_cpu_notes_buf_alloc(unsigned long size)
+{
+	void *vaddr;
+	struct page *page;
+	unsigned long order, count, i;
+
+	order = get_order(size);
+	vaddr = (void *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, order);
+	if (!vaddr)
+		return NULL;
+
+	count = 1 << order;
+	page = virt_to_page(vaddr);
+	for (i = 0; i < count; i++)
+		SetPageReserved(page + i);
+	return vaddr;
+}
+
+void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size)
+{
+	struct page *page;
+	unsigned long order, count, i;
+
+	order = get_order(size);
+	count = 1 << order;
+	page = virt_to_page(vaddr);
+	for (i = 0; i < count; i++)
+		ClearPageReserved(page + i);
+	__free_pages(page, order);
+}
+
+#define GPR_MASK	0xffffff0000000000
+static inline int fadump_gpr_index(u64 id)
+{
+	int i = -1;
+	char str[3];
+
+	if ((id & GPR_MASK) == REG_ID("GPR")) {
+		/* get the digits at the end */
+		id &= ~GPR_MASK;
+		id >>= 24;
+		str[2] = '\0';
+		str[1] = id & 0xff;
+		str[0] = (id >> 8) & 0xff;
+		if (kstrtoint(str, 10, &i))
+			i = -EINVAL;
+		if (i > 31)
+			i = -1;
+	}
+	return i;
+}
+
+void fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val)
+{
+	int i;
+
+	i = fadump_gpr_index(reg_id);
+	if (i >= 0)
+		regs->gpr[i] = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("NIA"))
+		regs->nip = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("MSR"))
+		regs->msr = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("CTR"))
+		regs->ctr = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("LR"))
+		regs->link = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("XER"))
+		regs->xer = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("CR"))
+		regs->ccr = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("DAR"))
+		regs->dar = (unsigned long)reg_val;
+	else if (reg_id == REG_ID("DSISR"))
+		regs->dsisr = (unsigned long)reg_val;
+}
+
+u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
+{
+	struct elf_prstatus prstatus;
+
+	memset(&prstatus, 0, sizeof(prstatus));
+	/*
+	 * FIXME: How do i get PID? Do I really need it?
+	 * prstatus.pr_pid = ????
+	 */
+	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
+	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
+			      &prstatus, sizeof(prstatus));
+	return buf;
+}
+
+void fadump_update_elfcore_header(struct fw_dump *fadump_conf, char *bufp)
+{
+	struct elfhdr *elf;
+	struct elf_phdr *phdr;
+
+	elf = (struct elfhdr *)bufp;
+	bufp += sizeof(struct elfhdr);
+
+	/* First note is a place holder for cpu notes info. */
+	phdr = (struct elf_phdr *)bufp;
+
+	if (phdr->p_type == PT_NOTE) {
+		phdr->p_paddr  = fadump_conf->cpu_notes_buf;
+		phdr->p_offset = phdr->p_paddr;
+		phdr->p_memsz  = fadump_conf->cpu_notes_buf_size;
+		phdr->p_filesz = phdr->p_memsz;
+	}
+}
+
+/*
+ * Returns 1, if there are no holes in memory area between d_start to d_end,
+ * 0 otherwise.
+ */
+static int is_memory_area_contiguous(unsigned long d_start,
+				     unsigned long d_end)
+{
+	struct memblock_region *reg;
+	unsigned long start, end;
+	int ret = 0;
+
+	for_each_memblock(memory, reg) {
+		start = max_t(unsigned long, d_start, reg->base);
+		end = min_t(unsigned long, d_end, (reg->base + reg->size));
+		if (d_start < end) {
+			/* Memory hole from d_start to start */
+			if (start > d_start)
+				break;
+
+			if (end == d_end) {
+				ret = 1;
+				break;
+			}
+
+			d_start = end + 1;
+		}
+	}
+
+	return ret;
+}
+
+/*
+ * Returns 1, if there are no holes in boot memory area,
+ * 0 otherwise.
+ */
+int is_boot_memory_area_contiguous(struct fw_dump *fadump_conf)
+{
+	unsigned long d_start = RMA_START;
+	unsigned long d_end   = RMA_START + fadump_conf->boot_memory_size;
+
+	return is_memory_area_contiguous(d_start, d_end);
+}
+
+/*
+ * Returns 1, if there are no holes in reserved memory area,
+ * 0 otherwise.
+ */
+int is_reserved_memory_area_contiguous(struct fw_dump *fadump_conf)
+{
+	unsigned long d_start = fadump_conf->reserve_dump_area_start;
+	unsigned long d_end   = d_start + fadump_conf->reserve_dump_area_size;
+
+	return is_memory_area_contiguous(d_start, d_end);
+}
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
new file mode 100644
index 0000000..8ccd96d
--- /dev/null
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -0,0 +1,126 @@
+/*
+ * Firmware-Assisted Dump internal code.
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
+#ifndef __PPC64_FA_DUMP_INTERNAL_H__
+#define __PPC64_FA_DUMP_INTERNAL_H__
+
+/*
+ * The RMA region will be saved for later dumping when kernel crashes.
+ * RMA is Real Mode Area, the first block of logical memory address owned
+ * by logical partition, containing the storage that may be accessed with
+ * translate off.
+ */
+#define RMA_START	0x0
+#define RMA_END		(ppc64_rma_size)
+
+/*
+ * On some Power systems where RMO is 128MB, it still requires minimum of
+ * 256MB for kernel to boot successfully. When kdump infrastructure is
+ * configured to save vmcore over network, we run into OOM issue while
+ * loading modules related to network setup. Hence we need additional 64M
+ * of memory to avoid OOM issue.
+ */
+#define MIN_BOOT_MEM	(((RMA_END < (0x1UL << 28)) ? (0x1UL << 28) : RMA_END) \
+			+ (0x1UL << 26))
+
+/* The upper limit percentage for user specified boot memory size (25%) */
+#define MAX_BOOT_MEM_RATIO			4
+
+#define memblock_num_regions(memblock_type)	(memblock.memblock_type.cnt)
+
+/* Alignment per CMA requirement. */
+#define FADUMP_CMA_ALIGNMENT	(PAGE_SIZE <<				\
+				 max_t(unsigned long, MAX_ORDER - 1,	\
+				 pageblock_order))
+
+/* FAD commands */
+#define FADUMP_REGISTER			1
+#define FADUMP_UNREGISTER		2
+#define FADUMP_INVALIDATE		3
+
+#define FADUMP_CPU_ID_MASK		((1UL << 32) - 1)
+
+#define CPU_UNKNOWN			(~((u32)0))
+
+/*
+ * Copy the ascii values for first 8 characters from a string into u64
+ * variable at their respective indexes.
+ * e.g.
+ *  The string "FADMPINF" will be converted into 0x4641444d50494e46
+ */
+static inline u64 str_to_u64(const char *str)
+{
+	u64 val = 0;
+	int i;
+
+	for (i = 0; i < sizeof(val); i++)
+		val = (*str) ? (val << 8) | *str++ : val << 8;
+	return val;
+}
+#define STR_TO_HEX(x)	str_to_u64(x)
+#define REG_ID(x)	str_to_u64(x)
+
+/* Register entry. */
+struct fadump_reg_entry {
+	__be64		reg_id;
+	__be64		reg_value;
+};
+
+#define FADUMP_CRASH_INFO_MAGIC		STR_TO_HEX("FADMPINF")
+
+/* fadump crash info structure */
+struct fadump_crash_info_header {
+	u64		magic_number;
+	u64		elfcorehdr_addr;
+	u32		crashing_cpu;
+	struct pt_regs	regs;
+	struct cpumask	online_mask;
+};
+
+struct fad_crash_memory_ranges {
+	unsigned long long	base;
+	unsigned long long	size;
+};
+
+/* Firmware-assisted dump configuration details. */
+struct fw_dump {
+	unsigned long	cpu_state_data_size;
+	unsigned long	hpte_region_size;
+	unsigned long	boot_memory_size;
+	unsigned long	reserve_dump_area_start;
+	unsigned long	reserve_dump_area_size;
+	/* cmd line option during boot */
+	unsigned long	reserve_bootvar;
+
+	unsigned long	fadumphdr_addr;
+	unsigned long	cpu_notes_buf;
+	unsigned long	cpu_notes_buf_size;
+
+	int		ibm_configure_kernel_dump;
+
+	unsigned long	fadump_enabled:1;
+	unsigned long	fadump_supported:1;
+	unsigned long	dump_active:1;
+	unsigned long	dump_registered:1;
+	unsigned long	nocma:1;
+};
+
+/* Helper functions */
+void *fadump_cpu_notes_buf_alloc(unsigned long size);
+void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size);
+void fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val);
+u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
+void fadump_update_elfcore_header(struct fw_dump *fadump_config, char *bufp);
+int is_boot_memory_area_contiguous(struct fw_dump *fadump_conf);
+int is_reserved_memory_area_contiguous(struct fw_dump *fadump_conf);
+
+#endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4eab972..c564d58 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -32,12 +32,11 @@
 #include <asm/fadump.h>
 #include <asm/setup.h>
 
+#include "fadump-common.h"
+
 static struct fw_dump fw_dump;
 static struct fadump_mem_struct fdm;
 static const struct fadump_mem_struct *fdm_active;
-#ifdef CONFIG_CMA
-static struct cma *fadump_cma;
-#endif
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fad_crash_memory_ranges *crash_memory_ranges;
@@ -46,6 +45,8 @@ int crash_mem_ranges;
 int max_crash_mem_ranges;
 
 #ifdef CONFIG_CMA
+static struct cma *fadump_cma;
+
 /*
  * fadump_cma_init() - Initialize CMA area from a fadump reserved memory
  *
@@ -107,8 +108,8 @@ static int __init fadump_cma_init(void) { return 1; }
 #endif /* CONFIG_CMA */
 
 /* Scan the Firmware Assisted dump configuration details. */
-int __init early_init_dt_scan_fw_dump(unsigned long node,
-			const char *uname, int depth, void *data)
+int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data)
 {
 	const __be32 *sections;
 	int i, num_sections;
@@ -199,67 +200,6 @@ int is_fadump_active(void)
 	return fw_dump.dump_active;
 }
 
-/*
- * Returns 1, if there are no holes in boot memory area,
- * 0 otherwise.
- */
-static int is_boot_memory_area_contiguous(void)
-{
-	struct memblock_region *reg;
-	unsigned long tstart, tend;
-	unsigned long start_pfn = PHYS_PFN(RMA_START);
-	unsigned long end_pfn = PHYS_PFN(RMA_START + fw_dump.boot_memory_size);
-	unsigned int ret = 0;
-
-	for_each_memblock(memory, reg) {
-		tstart = max(start_pfn, memblock_region_memory_base_pfn(reg));
-		tend = min(end_pfn, memblock_region_memory_end_pfn(reg));
-		if (tstart < tend) {
-			/* Memory hole from start_pfn to tstart */
-			if (tstart > start_pfn)
-				break;
-
-			if (tend == end_pfn) {
-				ret = 1;
-				break;
-			}
-
-			start_pfn = tend + 1;
-		}
-	}
-
-	return ret;
-}
-
-/*
- * Returns true, if there are no holes in reserved memory area,
- * false otherwise.
- */
-static bool is_reserved_memory_area_contiguous(void)
-{
-	struct memblock_region *reg;
-	unsigned long start, end;
-	unsigned long d_start = fw_dump.reserve_dump_area_start;
-	unsigned long d_end = d_start + fw_dump.reserve_dump_area_size;
-
-	for_each_memblock(memory, reg) {
-		start = max(d_start, (unsigned long)reg->base);
-		end = min(d_end, (unsigned long)(reg->base + reg->size));
-		if (d_start < end) {
-			/* Memory hole from d_start to start */
-			if (start > d_start)
-				break;
-
-			if (end == d_end)
-				return true;
-
-			d_start = end + 1;
-		}
-	}
-
-	return false;
-}
-
 /* Print firmware assisted dump configurations for debugging purpose. */
 static void fadump_show_config(void)
 {
@@ -625,9 +565,9 @@ static int register_fw_dump(struct fadump_mem_struct *fdm)
 			" dump. Hardware Error(%d).\n", rc);
 		break;
 	case -3:
-		if (!is_boot_memory_area_contiguous())
+		if (!is_boot_memory_area_contiguous(&fw_dump))
 			pr_err("Can't have holes in boot memory area while registering fadump\n");
-		else if (!is_reserved_memory_area_contiguous())
+		else if (!is_reserved_memory_area_contiguous(&fw_dump))
 			pr_err("Can't have holes in reserved memory area while"
 			       " registering fadump\n");
 
@@ -697,52 +637,6 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	rtas_os_term((char *)str);
 }
 
-#define GPR_MASK	0xffffff0000000000
-static inline int fadump_gpr_index(u64 id)
-{
-	int i = -1;
-	char str[3];
-
-	if ((id & GPR_MASK) == REG_ID("GPR")) {
-		/* get the digits at the end */
-		id &= ~GPR_MASK;
-		id >>= 24;
-		str[2] = '\0';
-		str[1] = id & 0xff;
-		str[0] = (id >> 8) & 0xff;
-		sscanf(str, "%d", &i);
-		if (i > 31)
-			i = -1;
-	}
-	return i;
-}
-
-static inline void fadump_set_regval(struct pt_regs *regs, u64 reg_id,
-								u64 reg_val)
-{
-	int i;
-
-	i = fadump_gpr_index(reg_id);
-	if (i >= 0)
-		regs->gpr[i] = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("NIA"))
-		regs->nip = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("MSR"))
-		regs->msr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("CTR"))
-		regs->ctr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("LR"))
-		regs->link = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("XER"))
-		regs->xer = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("CR"))
-		regs->ccr = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("DAR"))
-		regs->dar = (unsigned long)reg_val;
-	else if (reg_id == REG_ID("DSISR"))
-		regs->dsisr = (unsigned long)reg_val;
-}
-
 static struct fadump_reg_entry*
 fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
 {
@@ -757,72 +651,6 @@ fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
 	return reg_entry;
 }
 
-static u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs)
-{
-	struct elf_prstatus prstatus;
-
-	memset(&prstatus, 0, sizeof(prstatus));
-	/*
-	 * FIXME: How do i get PID? Do I really need it?
-	 * prstatus.pr_pid = ????
-	 */
-	elf_core_copy_kernel_regs(&prstatus.pr_reg, regs);
-	buf = append_elf_note(buf, CRASH_CORE_NOTE_NAME, NT_PRSTATUS,
-			      &prstatus, sizeof(prstatus));
-	return buf;
-}
-
-static void fadump_update_elfcore_header(char *bufp)
-{
-	struct elfhdr *elf;
-	struct elf_phdr *phdr;
-
-	elf = (struct elfhdr *)bufp;
-	bufp += sizeof(struct elfhdr);
-
-	/* First note is a place holder for cpu notes info. */
-	phdr = (struct elf_phdr *)bufp;
-
-	if (phdr->p_type == PT_NOTE) {
-		phdr->p_paddr = fw_dump.cpu_notes_buf;
-		phdr->p_offset	= phdr->p_paddr;
-		phdr->p_filesz	= fw_dump.cpu_notes_buf_size;
-		phdr->p_memsz = fw_dump.cpu_notes_buf_size;
-	}
-	return;
-}
-
-static void *fadump_cpu_notes_buf_alloc(unsigned long size)
-{
-	void *vaddr;
-	struct page *page;
-	unsigned long order, count, i;
-
-	order = get_order(size);
-	vaddr = (void *)__get_free_pages(GFP_KERNEL|__GFP_ZERO, order);
-	if (!vaddr)
-		return NULL;
-
-	count = 1 << order;
-	page = virt_to_page(vaddr);
-	for (i = 0; i < count; i++)
-		SetPageReserved(page + i);
-	return vaddr;
-}
-
-static void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size)
-{
-	struct page *page;
-	unsigned long order, count, i;
-
-	order = get_order(size);
-	count = 1 << order;
-	page = virt_to_page(vaddr);
-	for (i = 0; i < count; i++)
-		ClearPageReserved(page + i);
-	__free_pages(page, order);
-}
-
 /*
  * Read CPU state dump data and convert it into ELF notes.
  * The CPU dump starts with magic number "REGSAVE". NumCpusOffset should be
@@ -912,9 +740,9 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
 	final_note(note_buf);
 
 	if (fdh) {
-		pr_debug("Updating elfcore header (%llx) with cpu notes\n",
-							fdh->elfcorehdr_addr);
-		fadump_update_elfcore_header((char *)__va(fdh->elfcorehdr_addr));
+		addr = fdh->elfcorehdr_addr;
+		pr_debug("Updating elfcore header(%lx) with cpu notes\n", addr);
+		fadump_update_elfcore_header(&fw_dump, (char *)__va(addr));
 	}
 	return 0;
 

