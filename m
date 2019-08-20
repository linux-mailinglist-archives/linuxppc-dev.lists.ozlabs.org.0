Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9575495E63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 14:26:03 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46CVQ10swqzDqdn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2019 22:26:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46CTy85GhRzDqwL
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46CTy64T2yz8wHQ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2019 22:05:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46CTy61hKcz9sBF; Tue, 20 Aug 2019 22:05:18 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46CTy54DpDz9s3Z
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 22:05:17 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x7KC2GNf041807
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:15 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2ugeaepc0h-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 20 Aug 2019 08:05:15 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 20 Aug 2019 13:05:13 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 20 Aug 2019 13:05:09 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
 [9.149.105.232])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x7KC58A955312502
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 20 Aug 2019 12:05:08 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id E597452059;
 Tue, 20 Aug 2019 12:05:07 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 328055204F;
 Tue, 20 Aug 2019 12:05:06 +0000 (GMT)
Subject: [PATCH v5 08/31] pseries/fadump: move out platform specific support
 from generic code
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 20 Aug 2019 17:35:05 +0530
In-Reply-To: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
References: <156630261682.8896.3418665808003586786.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19082012-0016-0000-0000-000002A0AFC0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19082012-0017-0000-0000-00003300DED3
Message-Id: <156630270532.8896.17377278172096772751.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-08-20_04:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0
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

Move code that supports processing the crash'ed kernel's memory
preserved by firmware to platform specific callback functions.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump.c                 |  343 +-------------------------
 arch/powerpc/platforms/pseries/rtas-fadump.c |  280 +++++++++++++++++++++
 2 files changed, 294 insertions(+), 329 deletions(-)

diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index f26ab58..f7c8073 100644
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
-#include "../platforms/pseries/rtas-fadump.h"
 
 static struct fw_dump fw_dump;
-static const struct rtas_fadump_mem_struct *fdm_active;
 
 static DEFINE_MUTEX(fadump_mutex);
 struct fad_crash_memory_ranges *crash_memory_ranges;
@@ -111,22 +108,13 @@ static int __init fadump_cma_init(void) { return 1; }
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	int ret;
-
-	if (depth != 1 || strcmp(uname, "rtas") != 0)
+	if (depth != 1)
 		return 0;
 
-	ret = rtas_fadump_dt_scan(&fw_dump, node);
+	if (strcmp(uname, "rtas") == 0)
+		return rtas_fadump_dt_scan(&fw_dump, node);
 
-	/*
-	 * The 'ibm,kernel-dump' rtas node is present only if there is
-	 * dump data waiting for us.
-	 */
-	fdm_active = of_get_flat_dt_prop(node, "ibm,kernel-dump", NULL);
-	if (fdm_active)
-		fw_dump.dump_active = 1;
-
-	return ret;
+	return 0;
 }
 
 /*
@@ -308,9 +296,7 @@ int __init fadump_reserve_mem(void)
 	 * If dump is active then we have already calculated the size during
 	 * first kernel.
 	 */
-	if (fdm_active)
-		fw_dump.boot_memory_size = be64_to_cpu(fdm_active->rmr_region.source_len);
-	else {
+	if (!fw_dump.dump_active) {
 		fw_dump.boot_memory_size = fadump_calculate_reserve_size();
 #ifdef CONFIG_CMA
 		if (!fw_dump.nocma)
@@ -364,17 +350,9 @@ int __init fadump_reserve_mem(void)
 		size = memory_boundary - base;
 		fadump_reserve_crash_area(base, size);
 
-		fw_dump.fadumphdr_addr =
-				be64_to_cpu(fdm_active->rmr_region.destination_address) +
-				be64_to_cpu(fdm_active->rmr_region.source_len);
-		pr_debug("fadumphdr_addr = %pa\n", &fw_dump.fadumphdr_addr);
-
-		/*
-		 * Start address of reserve dump area (permanent reservation)
-		 * for re-registering FADump after dump capture.
-		 */
-		fw_dump.reserve_dump_area_start =
-			be64_to_cpu(fdm_active->cpu_state_data.destination_address);
+		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
+		pr_debug("Reserve dump area start address: 0x%lx\n",
+			 fw_dump.reserve_dump_area_start);
 	} else {
 		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
@@ -489,218 +467,6 @@ void crash_fadump(struct pt_regs *regs, const char *str)
 	fw_dump.ops->fadump_trigger(fdh, str);
 }
 
-#define GPR_MASK	0xffffff0000000000
-static inline int fadump_gpr_index(u64 id)
-{
-	int i = -1;
-	char str[3];
-
-	if ((id & GPR_MASK) == fadump_str_to_u64("GPR")) {
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
-	else if (reg_id == fadump_str_to_u64("NIA"))
-		regs->nip = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("MSR"))
-		regs->msr = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("CTR"))
-		regs->ctr = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("LR"))
-		regs->link = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("XER"))
-		regs->xer = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("CR"))
-		regs->ccr = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("DAR"))
-		regs->dar = (unsigned long)reg_val;
-	else if (reg_id == fadump_str_to_u64("DSISR"))
-		regs->dsisr = (unsigned long)reg_val;
-}
-
-static struct rtas_fadump_reg_entry*
-fadump_read_registers(struct rtas_fadump_reg_entry *reg_entry, struct pt_regs *regs)
-{
-	memset(regs, 0, sizeof(struct pt_regs));
-
-	while (be64_to_cpu(reg_entry->reg_id) != fadump_str_to_u64("CPUEND")) {
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
-static int __init fadump_build_cpu_notes(const struct rtas_fadump_mem_struct *fdm)
-{
-	struct rtas_fadump_reg_save_area_header *reg_header;
-	struct rtas_fadump_reg_entry *reg_entry;
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
-	if (be64_to_cpu(reg_header->magic_number) !=
-	    fadump_str_to_u64("REGSAVE")) {
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
-	reg_entry = (struct rtas_fadump_reg_entry *)vaddr;
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
-		if (be64_to_cpu(reg_entry->reg_id) != fadump_str_to_u64("CPUSTRT")) {
-			printk(KERN_ERR "Unable to read CPU state data\n");
-			rc = -ENOENT;
-			goto error_out;
-		}
-		/* Lower 4 bytes of reg_value contains logical cpu id */
-		cpu = be64_to_cpu(reg_entry->reg_value) & RTAS_FADUMP_CPU_ID_MASK;
-		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
-			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
-			continue;
-		}
-		pr_debug("Reading register data for cpu %d...\n", cpu);
-		if (fdh && fdh->crashing_cpu == cpu) {
-			regs = fdh->regs;
-			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
-			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
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
-static int __init process_fadump(const struct rtas_fadump_mem_struct *fdm_active)
-{
-	struct fadump_crash_info_header *fdh;
-	int rc = 0;
-
-	if (!fdm_active || !fw_dump.fadumphdr_addr)
-		return -EINVAL;
-
-	/* Check if the dump data is valid. */
-	if ((be16_to_cpu(fdm_active->header.dump_status_flag) == RTAS_FADUMP_ERROR_FLAG) ||
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
-}
-
 static void free_crash_memory_ranges(void)
 {
 	kfree(crash_memory_ranges);
@@ -990,7 +756,6 @@ static unsigned long init_fadump_header(unsigned long addr)
 	if (!addr)
 		return 0;
 
-	fw_dump.fadumphdr_addr = addr;
 	fdh = __va(addr);
 	addr += sizeof(struct fadump_crash_info_header);
 
@@ -1034,39 +799,12 @@ static int register_fadump(void)
 	return fw_dump.ops->fadump_register(&fw_dump);
 }
 
-static int fadump_invalidate_dump(const struct rtas_fadump_mem_struct *fdm)
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
-			sizeof(struct rtas_fadump_mem_struct));
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
-}
-
 void fadump_cleanup(void)
 {
 	/* Invalidate the registration only if dump is active. */
 	if (fw_dump.dump_active) {
-		/* pass the same memory dump structure provided by platform */
-		fadump_invalidate_dump(fdm_active);
+		pr_debug("Invalidating firmware-assisted dump registration\n");
+		fw_dump.ops->fadump_invalidate(&fw_dump);
 	} else if (fw_dump.dump_registered) {
 		/* Un-register Firmware-assisted dump if it was registered. */
 		fw_dump.ops->fadump_unregister(&fw_dump);
@@ -1160,6 +898,7 @@ static void fadump_invalidate_release_mem(void)
 		fw_dump.cpu_notes_buf = 0;
 		fw_dump.cpu_notes_buf_size = 0;
 	}
+
 	/* Initialize the kernel dump memory structure for FAD registration. */
 	fw_dump.ops->fadump_init_mem_struct(&fw_dump);
 }
@@ -1212,7 +951,7 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 	int ret = 0;
 	int input = -1;
 
-	if (!fw_dump.fadump_enabled || fdm_active)
+	if (!fw_dump.fadump_enabled || fw_dump.dump_active)
 		return -EPERM;
 
 	if (kstrtoint(buf, 0, &input))
@@ -1225,6 +964,7 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 		if (fw_dump.dump_registered == 0) {
 			goto unlock_out;
 		}
+
 		/* Un-register Firmware-assisted dump */
 		pr_debug("Un-register firmware-assisted dump\n");
 		fw_dump.ops->fadump_unregister(&fw_dump);
@@ -1249,63 +989,13 @@ static ssize_t fadump_register_store(struct kobject *kobj,
 
 static int fadump_region_show(struct seq_file *m, void *private)
 {
-	const struct rtas_fadump_mem_struct *fdm_ptr;
-
 	if (!fw_dump.fadump_enabled)
 		return 0;
 
 	mutex_lock(&fadump_mutex);
-	if (fdm_active)
-		fdm_ptr = fdm_active;
-	else {
-		mutex_unlock(&fadump_mutex);
-		fw_dump.ops->fadump_region_show(&fw_dump, m);
-		return 0;
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
 
@@ -1376,12 +1066,13 @@ int __init setup_fadump(void)
 		 * if dump process fails then invalidate the registration
 		 * and release memory before proceeding for re-registration.
 		 */
-		if (process_fadump(fdm_active) < 0)
+		if (fw_dump.ops->fadump_process(&fw_dump) < 0)
 			fadump_invalidate_release_mem();
 	}
 	/* Initialize the kernel dump memory structure for FAD registration. */
 	else if (fw_dump.reserve_dump_area_size)
 		fw_dump.ops->fadump_init_mem_struct(&fw_dump);
+
 	fadump_init_files();
 
 	return 1;
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 4cfac04..2b94392 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -27,6 +27,7 @@
 #include "rtas-fadump.h"
 
 static struct rtas_fadump_mem_struct fdm;
+static const struct rtas_fadump_mem_struct *fdm_active;
 
 static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
 				      const struct rtas_fadump_mem_struct *fdm)
@@ -38,6 +39,25 @@ static void rtas_fadump_update_config(struct fw_dump *fadump_conf,
 				       fadump_conf->boot_memory_size);
 }
 
+/*
+ * This function is called in the capture kernel to get configuration details
+ * setup in the first kernel and passed to the f/w.
+ */
+static void rtas_fadump_get_config(struct fw_dump *fadump_conf,
+				   const struct rtas_fadump_mem_struct *fdm)
+{
+	fadump_conf->boot_memory_size = be64_to_cpu(fdm->rmr_region.source_len);
+
+	/*
+	 * Start address of reserve dump area (permanent reservation) for
+	 * re-registering FADump after dump capture.
+	 */
+	fadump_conf->reserve_dump_area_start =
+		be64_to_cpu(fdm->cpu_state_data.destination_address);
+
+	rtas_fadump_update_config(fadump_conf, fdm);
+}
+
 static ulong rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
 	ulong addr = fadump_conf->reserve_dump_area_start;
@@ -176,7 +196,196 @@ static int rtas_fadump_unregister(struct fw_dump *fadump_conf)
 
 static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
 {
-	return -EIO;
+	int rc;
+	unsigned int wait_time;
+
+	/* TODO: Add upper time limit for the delay */
+	do {
+		rc =  rtas_call(fadump_conf->ibm_configure_kernel_dump, 3, 1,
+				NULL, FADUMP_INVALIDATE, fdm_active,
+				sizeof(struct rtas_fadump_mem_struct));
+
+		wait_time = rtas_busy_delay_time(rc);
+		if (wait_time)
+			mdelay(wait_time);
+	} while (wait_time);
+
+	if (rc) {
+		pr_err("Failed to invalidate - unexpected error (%d).\n", rc);
+		return -EIO;
+	}
+
+	fadump_conf->dump_active = 0;
+	fdm_active = NULL;
+	return 0;
+}
+
+#define RTAS_FADUMP_GPR_MASK			0xffffff0000000000
+static inline int rtas_fadump_gpr_index(u64 id)
+{
+	int i = -1;
+	char str[3];
+
+	if ((id & RTAS_FADUMP_GPR_MASK) == fadump_str_to_u64("GPR")) {
+		/* get the digits at the end */
+		id &= ~RTAS_FADUMP_GPR_MASK;
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
+void rtas_fadump_set_regval(struct pt_regs *regs, u64 reg_id, u64 reg_val)
+{
+	int i;
+
+	i = rtas_fadump_gpr_index(reg_id);
+	if (i >= 0)
+		regs->gpr[i] = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("NIA"))
+		regs->nip = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("MSR"))
+		regs->msr = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("CTR"))
+		regs->ctr = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("LR"))
+		regs->link = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("XER"))
+		regs->xer = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("CR"))
+		regs->ccr = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("DAR"))
+		regs->dar = (unsigned long)reg_val;
+	else if (reg_id == fadump_str_to_u64("DSISR"))
+		regs->dsisr = (unsigned long)reg_val;
+}
+
+static struct rtas_fadump_reg_entry*
+rtas_fadump_read_regs(struct rtas_fadump_reg_entry *reg_entry,
+		      struct pt_regs *regs)
+{
+	memset(regs, 0, sizeof(struct pt_regs));
+
+	while (be64_to_cpu(reg_entry->reg_id) != fadump_str_to_u64("CPUEND")) {
+		rtas_fadump_set_regval(regs, be64_to_cpu(reg_entry->reg_id),
+				       be64_to_cpu(reg_entry->reg_value));
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
+static int __init rtas_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
+{
+	struct rtas_fadump_reg_save_area_header *reg_header;
+	struct rtas_fadump_reg_entry *reg_entry;
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
+	if (be64_to_cpu(reg_header->magic_number) !=
+	    fadump_str_to_u64("REGSAVE")) {
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
+	reg_entry = (struct rtas_fadump_reg_entry *)vaddr;
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
+		if (be64_to_cpu(reg_entry->reg_id) !=
+		    fadump_str_to_u64("CPUSTRT")) {
+			pr_err("Unable to read CPU state data\n");
+			rc = -ENOENT;
+			goto error_out;
+		}
+		/* Lower 4 bytes of reg_value contains logical cpu id */
+		cpu = (be64_to_cpu(reg_entry->reg_value) &
+		       RTAS_FADUMP_CPU_ID_MASK);
+		if (fdh && !cpumask_test_cpu(cpu, &fdh->online_mask)) {
+			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
+			continue;
+		}
+		pr_debug("Reading register data for cpu %d...\n", cpu);
+		if (fdh && fdh->crashing_cpu == cpu) {
+			regs = fdh->regs;
+			note_buf = fadump_regs_to_elf_notes(note_buf, &regs);
+			RTAS_FADUMP_SKIP_TO_NEXT_CPU(reg_entry);
+		} else {
+			reg_entry++;
+			reg_entry = rtas_fadump_read_regs(reg_entry, &regs);
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
 }
 
 /*
@@ -185,15 +394,62 @@ static int rtas_fadump_invalidate(struct fw_dump *fadump_conf)
  */
 static int __init rtas_fadump_process(struct fw_dump *fadump_conf)
 {
-	return -EINVAL;
+	struct fadump_crash_info_header *fdh;
+	int rc = 0;
+
+	if (!fdm_active || !fadump_conf->fadumphdr_addr)
+		return -EINVAL;
+
+	/* Check if the dump data is valid. */
+	if ((be16_to_cpu(fdm_active->header.dump_status_flag) ==
+			RTAS_FADUMP_ERROR_FLAG) ||
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
+	rc = rtas_fadump_build_cpu_notes(fadump_conf);
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
 }
 
 static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
-	const struct rtas_fadump_mem_struct *fdm_ptr = &fdm;
+	const struct rtas_fadump_mem_struct *fdm_ptr;
 	const struct rtas_fadump_section *cpu_data_section;
 
+	if (fdm_active)
+		fdm_ptr = fdm_active;
+	else
+		fdm_ptr = &fdm;
+
 	cpu_data_section = &(fdm_ptr->cpu_state_data);
 	seq_printf(m, "CPU :[%#016llx-%#016llx] %#llx bytes, Dumped: %#llx\n",
 		   be64_to_cpu(cpu_data_section->destination_address),
@@ -215,6 +471,12 @@ static void rtas_fadump_region_show(struct fw_dump *fadump_conf,
 	seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
 		   be64_to_cpu(fdm_ptr->rmr_region.source_len),
 		   be64_to_cpu(fdm_ptr->rmr_region.bytes_dumped));
+
+	/* Dump is active. Show reserved area start address. */
+	if (fdm_active) {
+		seq_printf(m, "\nMemory above %#016lx is reserved for saving crash dump\n",
+			   fadump_conf->reserve_dump_area_start);
+	}
 }
 
 static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
@@ -224,6 +486,7 @@ static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
 	rtas_os_term((char *)msg);
 }
 
+
 static struct fadump_ops rtas_fadump_ops = {
 	.fadump_init_mem_struct		= rtas_fadump_init_mem_struct,
 	.fadump_register		= rtas_fadump_register,
@@ -253,6 +516,17 @@ int __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	fadump_conf->ops		= &rtas_fadump_ops;
 	fadump_conf->fadump_supported	= 1;
 
+	/*
+	 * The 'ibm,kernel-dump' rtas node is present only if there is
+	 * dump data waiting for us.
+	 */
+	fdm_active = of_get_flat_dt_prop(node, "ibm,kernel-dump", NULL);
+	if (fdm_active) {
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+		rtas_fadump_get_config(fadump_conf, (void *)__pa(fdm_active));
+	}
+
 	/* Get the sizes required to store dump data for the firmware provided
 	 * dump sections.
 	 * For each dump section type supported, a 32bit cell which defines

