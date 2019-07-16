Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 870F06A7E2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:59:58 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzV35xqBzDqY2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:59:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvy0PzZzDqWm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvx6ZC6z8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:49 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvx55FZz9s8m; Tue, 16 Jul 2019 21:33:49 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyvx0cyWz9s7T
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:48 +1000 (AEST)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBNAIE066501
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:47 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tscphayfx-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:46 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:45 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:42 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBXecl59965588
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:40 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7BACA11C052;
 Tue, 16 Jul 2019 11:33:40 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 09E3211C05B;
 Tue, 16 Jul 2019 11:33:39 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:38 +0000 (GMT)
Subject: [PATCH v4 14/25] powernv/fadump: process the crashdump by exporting
 it as /proc/vmcore
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:38 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0012-0000-0000-0000033309C1
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0013-0000-0000-0000216C8315
Message-Id: <156327681824.27462.1314030665685342118.stgit@hbathini.in.ibm.com>
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

Add support in the kernel to process the crash'ed kernel's memory
preserved during MPIPL and export it as /proc/vmcore file for the
userland scripts to filter and analyze it later.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/platforms/powernv/opal-fadump.c |  190 ++++++++++++++++++++++++++
 1 file changed, 187 insertions(+), 3 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 9c68c83..dffc0e7 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -18,6 +18,7 @@
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
 #include <linux/mm.h>
+#include <linux/crash_dump.h>
 
 #include <asm/page.h>
 #include <asm/opal.h>
@@ -25,6 +26,7 @@
 #include "../../kernel/fadump-common.h"
 #include "opal-fadump.h"
 
+static const struct opal_fadump_mem_struct *opal_fdm_active;
 static struct opal_fadump_mem_struct *opal_fdm;
 
 static void opal_fadump_update_config(struct fw_dump *fadump_conf,
@@ -41,6 +43,50 @@ static void opal_fadump_update_config(struct fw_dump *fadump_conf,
 		 fadump_conf->boot_mem_dest_addr);
 
 	fadump_conf->fadumphdr_addr = fdm->fadumphdr_addr;
+
+	/* Start address of preserve area (permanent reservation) */
+	fadump_conf->preserv_area_start = fadump_conf->boot_mem_dest_addr;
+	pr_debug("Preserve area start address: 0x%lx\n",
+		 fadump_conf->preserv_area_start);
+}
+
+/*
+ * This function is called in the capture kernel to get configuration details
+ * from metadata setup by the first kernel.
+ */
+static void opal_fadump_get_config(struct fw_dump *fadump_conf,
+				   const struct opal_fadump_mem_struct *fdm)
+{
+	unsigned long base, size, last_end, hole_size;
+	int i;
+
+	if (!fadump_conf->dump_active)
+		return;
+
+	last_end = 0;
+	hole_size = 0;
+	fadump_conf->boot_memory_size = 0;
+
+	if (fdm->region_cnt)
+		pr_debug("Boot memory regions:\n");
+
+	for (i = 0; i < fdm->region_cnt; i++) {
+		base = fdm->rgn[i].src;
+		size = fdm->rgn[i].size;
+		pr_debug("\t%d. base: 0x%lx, size: 0x%lx\n",
+			 (i + 1), base, size);
+
+		fadump_conf->boot_mem_addr[i] = base;
+		fadump_conf->boot_mem_size[i] = size;
+		fadump_conf->boot_memory_size += size;
+		hole_size += (base - last_end);
+
+		last_end = base + size;
+	}
+
+	fadump_conf->boot_mem_top = (fadump_conf->boot_memory_size + hole_size);
+	fadump_conf->boot_mem_regs_cnt = fdm->region_cnt;
+	opal_fadump_update_config(fadump_conf, fdm);
 }
 
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
@@ -174,27 +220,127 @@ static int opal_fadump_unregister_fadump(struct fw_dump *fadump_conf)
 
 static int opal_fadump_invalidate_fadump(struct fw_dump *fadump_conf)
 {
-	return -EIO;
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
+ * Convert CPU state data saved at the time of crash into ELF notes.
+ */
+static int __init opal_fadump_build_cpu_notes(struct fw_dump *fadump_conf)
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
+	if (fdh && (fdh->crashing_cpu != FADUMP_CPU_UNKNOWN)) {
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
 }
 
 static int __init opal_fadump_process_fadump(struct fw_dump *fadump_conf)
 {
-	return -EINVAL;
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
+	rc = opal_fadump_build_cpu_notes(fadump_conf);
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
 }
 
 static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
 	int i;
-	const struct opal_fadump_mem_struct *fdm_ptr = opal_fdm;
+	const struct opal_fadump_mem_struct *fdm_ptr;
 	u64 dumped_bytes = 0;
 
+	if (fadump_conf->dump_active)
+		fdm_ptr = opal_fdm_active;
+	else
+		fdm_ptr = opal_fdm;
+
 	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+		/*
+		 * Only regions that are registered for MPIPL
+		 * would have dump data.
+		 */
+		if ((fadump_conf->dump_active) &&
+		    (i < fdm_ptr->registered_regions))
+			dumped_bytes = fdm_ptr->rgn[i].size;
+
 		seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
 			   fdm_ptr->rgn[i].src, fdm_ptr->rgn[i].dest);
 		seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
 			   fdm_ptr->rgn[i].size, dumped_bytes);
 	}
+
+	/* Dump is active. Show reserved area start address. */
+	if (fadump_conf->dump_active) {
+		seq_printf(m, "\nMemory above %#016lx is reserved for saving crash dump\n",
+			   fadump_conf->reserve_dump_area_start);
+	}
 }
 
 static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
@@ -225,6 +371,7 @@ static struct fadump_ops opal_fadump_ops = {
 int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 {
 	unsigned long dn;
+	const __be32 *prop;
 
 	/*
 	 * Check if Firmware-Assisted Dump is supported. if yes, check
@@ -251,5 +398,42 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 	 */
 	fadump_conf->max_copy_size = _ALIGN_DOWN(U32_MAX, PAGE_SIZE);
 
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
+	if (prop) {
+		u64 addr = 0;
+		s64 ret;
+		const struct opal_fadump_mem_struct *r_opal_fdm_active;
+
+		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
+		if ((ret != OPAL_SUCCESS) || !addr) {
+			pr_err("Failed to get Kernel metadata (%lld)\n", ret);
+			return 1;
+		}
+
+		addr = be64_to_cpu(addr);
+		pr_debug("Kernel metadata addr: %llx\n", addr);
+
+		opal_fdm_active = __va(addr);
+		r_opal_fdm_active = (void *)addr;
+		if (r_opal_fdm_active->version != OPAL_FADUMP_VERSION) {
+			pr_err("FADump active but version (%u) unsupported!\n",
+			       r_opal_fdm_active->version);
+			return 1;
+		}
+
+		/* Kernel regions not registered with f/w  for MPIPL */
+		if (r_opal_fdm_active->registered_regions == 0) {
+			opal_fdm_active = NULL;
+			return 1;
+		}
+
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+		opal_fadump_get_config(fadump_conf, r_opal_fdm_active);
+	}
+
 	return 1;
 }

