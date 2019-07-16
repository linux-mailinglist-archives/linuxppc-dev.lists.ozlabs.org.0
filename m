Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 413106A7B6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:53:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzLv6VZzzDqLW
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:53:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvW3lZrzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvW0XB1z8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:27 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvV5YWMz9s7T; Tue, 16 Jul 2019 21:33:26 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyvT6kSNz9sNC
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:25 +1000 (AEST)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMH52015254
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:23 -0400
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2tscttjjy1-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:23 -0400
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:21 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:19 +0100
Received: from d06av24.portsmouth.uk.ibm.com (mk.ibm.com [9.149.105.60])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x6GBXHdn37683602
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:18 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6D554204B;
 Tue, 16 Jul 2019 11:33:17 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6E32542047;
 Tue, 16 Jul 2019 11:33:16 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:16 +0000 (GMT)
Subject: [PATCH v4 11/25] powernv/fadump: register kernel metadata address
 with opal
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:15 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0016-0000-0000-00000292FE7C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0017-0000-0000-000032F0CED4
Message-Id: <156327679568.27462.14864917663459855788.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-07-16_03:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
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

OPAL allows registering address with it in the first kernel and
retrieving it after MPIPL. Setup kernel metadata and register its
address with OPAL to use it for processing the crash dump.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/kernel/fadump-common.h          |    4 +
 arch/powerpc/kernel/fadump.c                 |   65 ++++++++++++++---------
 arch/powerpc/platforms/powernv/opal-fadump.c |   73 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |   37 +++++++++++++
 arch/powerpc/platforms/pseries/rtas-fadump.c |   32 +++++++++--
 5 files changed, 177 insertions(+), 34 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h

diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 928d364..89b8916 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -117,6 +117,8 @@ struct fw_dump {
 
 	unsigned long	boot_mem_dest_addr;
 
+	u64		kernel_metadata;
+
 	int		ibm_configure_kernel_dump;
 
 	unsigned long	fadump_enabled:1;
@@ -131,6 +133,8 @@ struct fw_dump {
 
 struct fadump_ops {
 	ulong	(*init_fadump_mem_struct)(struct fw_dump *fadump_config);
+	ulong	(*get_kernel_metadata_size)(void);
+	int	(*setup_kernel_metadata)(struct fw_dump *fadump_config);
 	int	(*register_fadump)(struct fw_dump *fadump_config);
 	int	(*unregister_fadump)(struct fw_dump *fadump_config);
 	int	(*invalidate_fadump)(struct fw_dump *fadump_config);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 517a40b..4dd8037 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -258,6 +258,9 @@ static unsigned long get_fadump_area_size(void)
 	size += sizeof(struct elf_phdr) * (memblock_num_regions(memory) + 2);
 
 	size = PAGE_ALIGN(size);
+
+	/* This is to hold kernel metadata on platforms that support it */
+	size += fw_dump.ops->get_kernel_metadata_size();
 	return size;
 }
 
@@ -283,17 +286,17 @@ static void __init fadump_reserve_crash_area(unsigned long base,
 
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
@@ -310,11 +313,13 @@ int __init fadump_reserve_mem(void)
 	}
 
 	size = get_fadump_area_size();
+	fw_dump.reserve_dump_area_size = size;
 	if (memory_limit)
 		memory_boundary = memory_limit;
 	else
 		memory_boundary = memblock_end_of_DRAM();
 
+	base = fw_dump.boot_memory_size;
 	if (fw_dump.dump_active) {
 		pr_info("Firmware-assisted dump is active.\n");
 
@@ -332,13 +337,11 @@ int __init fadump_reserve_mem(void)
 		 * dump is written to disk by userspace tool. This memory
 		 * will be released for general use once the dump is saved.
 		 */
-		base = fw_dump.boot_memory_size;
 		size = memory_boundary - base;
 		fadump_reserve_crash_area(base, size);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
 	} else {
 		/*
 		 * Reserve memory at an offset closer to bottom of the RAM to
@@ -346,30 +349,42 @@ int __init fadump_reserve_mem(void)
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
 		}
-		if ((base > (memory_boundary - size)) ||
-		    memblock_reserve(base, size)) {
+
+		if (base > (memory_boundary - size)) {
+			pr_err("Failed to find memory chunk for reservation\n");
+			goto error_out;
+		}
+		fw_dump.reserve_dump_area_start = base;
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
 
-		fw_dump.reserve_dump_area_start = base;
-		fw_dump.reserve_dump_area_size = size;
-		return fadump_cma_init();
+		ret = fadump_cma_init();
 	}
-	return 1;
+	return ret;
+error_out:
+	fw_dump.fadump_enabled = 0;
+	return 0;
 }
 
 unsigned long __init arch_reserved_kernel_pages(void)
@@ -886,14 +901,14 @@ static void fadump_invalidate_release_mem(void)
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
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index d8ee836..4b8504e 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -17,14 +17,73 @@
 #include <linux/seq_file.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/mm.h>
 
+#include <asm/page.h>
 #include <asm/opal.h>
 
 #include "../../kernel/fadump-common.h"
+#include "opal-fadump.h"
+
+static struct opal_fadump_mem_struct *opal_fdm;
 
 static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	return fadump_conf->reserve_dump_area_start;
+	ulong addr = fadump_conf->reserve_dump_area_start;
+
+	opal_fdm = __va(fadump_conf->kernel_metadata);
+	opal_fdm->version = OPAL_FADUMP_VERSION;
+	opal_fdm->region_cnt = 1;
+	opal_fdm->registered_regions = 0;
+	opal_fdm->rgn[0].src	= RMA_START;
+	opal_fdm->rgn[0].dest	= addr;
+	opal_fdm->rgn[0].size	= fadump_conf->boot_memory_size;
+	addr += fadump_conf->boot_memory_size;
+
+	/*
+	 * Kernel metadata is passed to f/w and retrieved in capture kerenl.
+	 * So, use it to save fadump header address instead of calculating it.
+	 */
+	opal_fdm->fadumphdr_addr = (opal_fdm->rgn[0].dest +
+				    fadump_conf->boot_memory_size);
+
+	return addr;
+}
+
+static ulong opal_fadump_get_kernel_metadata_size(void)
+{
+	ulong size = sizeof(struct opal_fadump_mem_struct);
+
+	size = PAGE_ALIGN(size);
+	return size;
+}
+
+static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
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
+					opal_fadump_get_kernel_metadata_size());
+	pr_info("Kernel metadata addr: %llx\n", fadump_conf->kernel_metadata);
+
+	/*
+	 * Register metadata address with f/w. Can be retrieved in
+	 * the capture kernel.
+	 */
+	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_KERNEL,
+				      fadump_conf->kernel_metadata);
+	if (ret != OPAL_SUCCESS) {
+		pr_err("Failed to set kernel metadata tag!\n");
+		err = -EPERM;
+	}
+
+	return err;
 }
 
 static int opal_fadump_register_fadump(struct fw_dump *fadump_conf)
@@ -50,6 +109,16 @@ static int __init opal_fadump_process_fadump(struct fw_dump *fadump_conf)
 static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
+	int i;
+	const struct opal_fadump_mem_struct *fdm_ptr = opal_fdm;
+	u64 dumped_bytes = 0;
+
+	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+		seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
+			   fdm_ptr->rgn[i].src, fdm_ptr->rgn[i].dest);
+		seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
+			   fdm_ptr->rgn[i].size, dumped_bytes);
+	}
 }
 
 static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
@@ -67,6 +136,8 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
 
 static struct fadump_ops opal_fadump_ops = {
 	.init_fadump_mem_struct		= opal_fadump_init_mem_struct,
+	.get_kernel_metadata_size	= opal_fadump_get_kernel_metadata_size,
+	.setup_kernel_metadata		= opal_fadump_setup_kernel_metadata,
 	.register_fadump		= opal_fadump_register_fadump,
 	.unregister_fadump		= opal_fadump_unregister_fadump,
 	.invalidate_fadump		= opal_fadump_invalidate_fadump,
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
new file mode 100644
index 0000000..7e5a579
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -0,0 +1,37 @@
+/*
+ * Firmware-Assisted Dump support on POWER platform (OPAL).
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
+#ifndef __PPC64_OPAL_FA_DUMP_H__
+#define __PPC64_OPAL_FA_DUMP_H__
+
+/* OPAL FADump structure format version */
+#define OPAL_FADUMP_VERSION			0x1
+
+/* Maximum number of memory regions kernel supports */
+#define OPAL_FADUMP_MAX_MEM_REGS		128
+
+/*
+ * FADump memory structure for storing kernel metadata needed to
+ * register-for/process crash dump. The address of this structure will
+ * be registered with f/w for retrieving during crash dump.
+ */
+struct opal_fadump_mem_struct {
+
+	u8	version;
+	u8	reserved[3];
+	u16	region_cnt;		/* number of regions */
+	u16	registered_regions;	/* Regions registered for MPIPL */
+	u64	fadumphdr_addr;
+	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
+} __attribute__((packed));
+
+#endif /* __PPC64_OPAL_FA_DUMP_H__ */
diff --git a/arch/powerpc/platforms/pseries/rtas-fadump.c b/arch/powerpc/platforms/pseries/rtas-fadump.c
index 7ce84f8..f2bcb1d 100644
--- a/arch/powerpc/platforms/pseries/rtas-fadump.c
+++ b/arch/powerpc/platforms/pseries/rtas-fadump.c
@@ -123,6 +123,21 @@ static ulong rtas_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 	return addr;
 }
 
+/*
+ * On this platform, the metadata struture is passed while registering
+ * for FADump and the same is returned by f/w in capture kernel.
+ * No additional provision to setup metadata separately.
+ */
+static ulong rtas_fadump_get_kernel_metadata_size(void)
+{
+	return 0;
+}
+
+static int rtas_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
+{
+	return 0;
+}
+
 static int rtas_fadump_register_fadump(struct fw_dump *fadump_conf)
 {
 	int rc, err = -EIO;
@@ -488,15 +503,16 @@ static void rtas_fadump_trigger(struct fadump_crash_info_header *fdh,
 	rtas_os_term((char *)msg);
 }
 
-
 static struct fadump_ops rtas_fadump_ops = {
-	.init_fadump_mem_struct	= rtas_fadump_init_mem_struct,
-	.register_fadump	= rtas_fadump_register_fadump,
-	.unregister_fadump	= rtas_fadump_unregister_fadump,
-	.invalidate_fadump	= rtas_fadump_invalidate_fadump,
-	.process_fadump		= rtas_fadump_process_fadump,
-	.fadump_region_show	= rtas_fadump_region_show,
-	.fadump_trigger		= rtas_fadump_trigger,
+	.init_fadump_mem_struct		= rtas_fadump_init_mem_struct,
+	.get_kernel_metadata_size	= rtas_fadump_get_kernel_metadata_size,
+	.setup_kernel_metadata		= rtas_fadump_setup_kernel_metadata,
+	.register_fadump		= rtas_fadump_register_fadump,
+	.unregister_fadump		= rtas_fadump_unregister_fadump,
+	.invalidate_fadump		= rtas_fadump_invalidate_fadump,
+	.process_fadump			= rtas_fadump_process_fadump,
+	.fadump_region_show		= rtas_fadump_region_show,
+	.fadump_trigger			= rtas_fadump_trigger,
 };
 
 int __init rtas_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)

