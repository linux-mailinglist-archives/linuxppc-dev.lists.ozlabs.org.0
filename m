Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2536A788
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:37:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nz0f6qD9zDqWm
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:37:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nytD01pbzDqZj
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nytC4Z7Yz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:32:19 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nytC3T1dz9sNC; Tue, 16 Jul 2019 21:32:19 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nytB6R6fz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:32:18 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMFjJ065817
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsdhr8nyw-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:32:16 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:32:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:32:12 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBWAKx33554632
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:32:10 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E76A52052;
 Tue, 16 Jul 2019 11:32:10 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0AE575205F;
 Tue, 16 Jul 2019 11:32:08 +0000 (GMT)
Subject: [PATCH v4 02/25] powerpc/fadump: move internal code to a new file
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:02:08 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0020-0000-0000-000003540511
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0021-0000-0000-000021A7D0F2
Message-Id: <156327672830.27462.5366949310401900027.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1907160145
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

Make way for refactoring platform specific FADump code by moving code
that could be referenced from multiple places to fadump-common.c file.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/Makefile        |    2 
 arch/powerpc/kernel/fadump-common.c |  144 +++++++++++++++++++++++++++++++++++
 arch/powerpc/kernel/fadump-common.h |    8 ++
 arch/powerpc/kernel/fadump.c        |  146 ++---------------------------------
 4 files changed, 162 insertions(+), 138 deletions(-)
 create mode 100644 arch/powerpc/kernel/fadump-common.c

diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 56dfa7a..439d548 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -78,7 +78,7 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
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
index 0000000..76c1233
--- /dev/null
+++ b/arch/powerpc/kernel/fadump-common.c
@@ -0,0 +1,144 @@
+/*
+ * Firmware-Assisted Dump internal code.
+ *
+ * Copyright 2011, IBM Corporation
+ * Author: Mahesh Salgaonkar <mahesh@linux.ibm.com>
+ *
+ * Copyright 2019, IBM Corp.
+ * Author: Hari Bathini <hbathini@linux.ibm.com>
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License
+ * as published by the Free Software Foundation; either version
+ * 2 of the License, or (at your option) any later version.
+ */
+
+#undef DEBUG
+#define pr_fmt(fmt) "fadump: " fmt
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
+static int is_fadump_memory_area_contiguous(unsigned long d_start,
+					    unsigned long d_end)
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
+int is_fadump_boot_mem_contiguous(struct fw_dump *fadump_conf)
+{
+	unsigned long d_start = RMA_START;
+	unsigned long d_end   = RMA_START + fadump_conf->boot_memory_size;
+
+	return is_fadump_memory_area_contiguous(d_start, d_end);
+}
+
+/*
+ * Returns 1, if there are no holes in reserved memory area,
+ * 0 otherwise.
+ */
+int is_fadump_reserved_mem_contiguous(struct fw_dump *fadump_conf)
+{
+	unsigned long d_start = fadump_conf->reserve_dump_area_start;
+	unsigned long d_end   = d_start + fadump_conf->reserve_dump_area_size;
+
+	return is_fadump_memory_area_contiguous(d_start, d_end);
+}
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index ba65e69..6c1e310 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -90,4 +90,12 @@ struct fw_dump {
 	unsigned long	nocma:1;
 };
 
+/* Helper functions */
+void *fadump_cpu_notes_buf_alloc(unsigned long size);
+void fadump_cpu_notes_buf_free(unsigned long vaddr, unsigned long size);
+u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
+void fadump_update_elfcore_header(struct fw_dump *fadump_config, char *bufp);
+int is_fadump_boot_mem_contiguous(struct fw_dump *fadump_conf);
+int is_fadump_reserved_mem_contiguous(struct fw_dump *fadump_conf);
+
 #endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 4c3b874..48db521 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -37,9 +37,6 @@
 static struct fw_dump fw_dump;
 static struct fadump_mem_struct fdm;
 static const struct fadump_mem_struct *fdm_active;
-#ifdef CONFIG_CMA
-static struct cma *fadump_cma;
-#endif
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fad_crash_memory_ranges *crash_memory_ranges;
@@ -48,6 +45,8 @@ int crash_mem_ranges;
 int max_crash_mem_ranges;
 
 #ifdef CONFIG_CMA
+static struct cma *fadump_cma;
+
 /*
  * fadump_cma_init() - Initialize CMA area from a fadump reserved memory
  *
@@ -109,8 +108,8 @@ static int __init fadump_cma_init(void) { return 1; }
 #endif /* CONFIG_CMA */
 
 /* Scan the Firmware Assisted dump configuration details. */
-int __init early_init_dt_scan_fw_dump(unsigned long node,
-			const char *uname, int depth, void *data)
+int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data)
 {
 	const __be32 *sections;
 	int i, num_sections;
@@ -201,67 +200,6 @@ int is_fadump_active(void)
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
@@ -611,9 +549,9 @@ static int register_fw_dump(struct fadump_mem_struct *fdm)
 			" dump. Hardware Error(%d).\n", rc);
 		break;
 	case -3:
-		if (!is_boot_memory_area_contiguous())
+		if (!is_fadump_boot_mem_contiguous(&fw_dump))
 			pr_err("Can't have holes in boot memory area while registering fadump\n");
-		else if (!is_reserved_memory_area_contiguous())
+		else if (!is_fadump_reserved_mem_contiguous(&fw_dump))
 			pr_err("Can't have holes in reserved memory area while"
 			       " registering fadump\n");
 
@@ -743,72 +681,6 @@ fadump_read_registers(struct fadump_reg_entry *reg_entry, struct pt_regs *regs)
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
@@ -898,9 +770,9 @@ static int __init fadump_build_cpu_notes(const struct fadump_mem_struct *fdm)
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
 

