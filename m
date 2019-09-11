Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88885B0059
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:40:02 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5gg33RHzF349
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:39:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4bN3Mr7zF3CQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4bM5llpz8swG
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:51:11 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4bM4X3Lz9sNF; Thu, 12 Sep 2019 00:51:11 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4bL6f9wz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:51:10 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgfth188204
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:08 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy2ew9fv0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:51:08 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:51:06 +0100
Received: from b06avi18626390.portsmouth.uk.ibm.com (9.149.26.192)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:51:03 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06avi18626390.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BEoaUZ31261060
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:50:36 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 197E511C05C;
 Wed, 11 Sep 2019 14:51:01 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2250C11C05B;
 Wed, 11 Sep 2019 14:50:59 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:50:58 +0000 (GMT)
Subject: [PATCH v6 16/36] powernv/fadump: register kernel metadata address
 with opal
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:20:57 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0008-0000-0000-000003146BD2
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0009-0000-0000-00004A32D801
Message-Id: <156821345011.5656.13567765019032928471.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-09-11_08:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1906280000 definitions=main-1909110138
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

OPAL allows registering address with it in the first kernel and
retrieving it after MPIPL. Setup kernel metadata and register its
address with OPAL to use it for processing the crash dump.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Use kernel types instead of ulong and such
  * Drop shallow callbacks. Instead, check before making those calls.


 arch/powerpc/include/asm/fadump-internal.h   |    4 +
 arch/powerpc/kernel/fadump.c                 |   23 ++++++-
 arch/powerpc/platforms/powernv/opal-fadump.c |   84 ++++++++++++++++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |   39 ++++++++++++
 4 files changed, 146 insertions(+), 4 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.h

diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 8046fe0..5262c76 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -97,6 +97,8 @@ struct fw_dump {
 	unsigned long	cpu_notes_buf_vaddr;
 	unsigned long	cpu_notes_buf_size;
 
+	u64		kernel_metadata;
+
 	int		ibm_configure_kernel_dump;
 
 	unsigned long	fadump_enabled:1;
@@ -110,6 +112,8 @@ struct fw_dump {
 
 struct fadump_ops {
 	u64	(*fadump_init_mem_struct)(struct fw_dump *fadump_conf);
+	u64	(*fadump_get_metadata_size)(void);
+	int	(*fadump_setup_metadata)(struct fw_dump *fadump_conf);
 	int	(*fadump_register)(struct fw_dump *fadump_conf);
 	int	(*fadump_unregister)(struct fw_dump *fadump_conf);
 	int	(*fadump_invalidate)(struct fw_dump *fadump_conf);
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 7d47d4bb..7e70563 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -313,6 +313,10 @@ static unsigned long get_fadump_area_size(void)
 	size += sizeof(struct elf_phdr) * (memblock_num_regions(memory) + 2);
 
 	size = PAGE_ALIGN(size);
+
+	/* This is to hold kernel metadata on platforms that support it */
+	size += (fw_dump.ops->fadump_get_metadata_size ?
+		 fw_dump.ops->fadump_get_metadata_size() : 0);
 	return size;
 }
 
@@ -348,6 +352,7 @@ int __init fadump_reserve_mem(void)
 		pr_info("Firmware-Assisted Dump is not supported on this hardware\n");
 		goto error_out;
 	}
+
 	/*
 	 * Initialize boot memory size
 	 * If dump is active then we have already calculated the size during
@@ -426,8 +431,21 @@ int __init fadump_reserve_mem(void)
 			base += size;
 		}
 
-		if ((base > (mem_boundary - size)) ||
-		    memblock_reserve(base, size)) {
+		if (base > (mem_boundary - size)) {
+			pr_err("Failed to find memory chunk for reservation!\n");
+			goto error_out;
+		}
+		fw_dump.reserve_dump_area_start = base;
+
+		/*
+		 * Calculate the kernel metadata address and register it with
+		 * f/w if the platform supports.
+		 */
+		if (fw_dump.ops->fadump_setup_metadata &&
+		    (fw_dump.ops->fadump_setup_metadata(&fw_dump) < 0))
+			goto error_out;
+
+		if (memblock_reserve(base, size)) {
 			pr_err("Failed to reserve memory!\n");
 			goto error_out;
 		}
@@ -435,7 +453,6 @@ int __init fadump_reserve_mem(void)
 		pr_info("Reserved %lldMB of memory at %#016llx (System RAM: %lldMB)\n",
 			(size >> 20), base, (memblock_phys_mem_size() >> 20));
 
-		fw_dump.reserve_dump_area_start = base;
 		ret = fadump_cma_init();
 	}
 
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index bbc5356..21de832 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -11,13 +11,83 @@
 #include <linux/seq_file.h>
 #include <linux/of_fdt.h>
 #include <linux/libfdt.h>
+#include <linux/mm.h>
 
+#include <asm/page.h>
 #include <asm/opal.h>
 #include <asm/fadump-internal.h>
 
+#include "opal-fadump.h"
+
+static struct opal_fadump_mem_struct *opal_fdm;
+
+/* Initialize kernel metadata */
+static void opal_fadump_init_metadata(struct opal_fadump_mem_struct *fdm)
+{
+	fdm->version = OPAL_FADUMP_VERSION;
+	fdm->region_cnt = 0;
+	fdm->registered_regions = 0;
+	fdm->fadumphdr_addr = 0;
+}
+
 static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
 {
-	return fadump_conf->reserve_dump_area_start;
+	u64 addr = fadump_conf->reserve_dump_area_start;
+
+	opal_fdm = __va(fadump_conf->kernel_metadata);
+	opal_fadump_init_metadata(opal_fdm);
+
+	opal_fdm->region_cnt = 1;
+	opal_fdm->rgn[0].src	= 0;
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
+static u64 opal_fadump_get_metadata_size(void)
+{
+	return PAGE_ALIGN(sizeof(struct opal_fadump_mem_struct));
+}
+
+static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
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
+					opal_fadump_get_metadata_size());
+	pr_info("Kernel metadata addr: %llx\n", fadump_conf->kernel_metadata);
+
+	/* Initialize kernel metadata before registering the address with f/w */
+	opal_fdm = __va(fadump_conf->kernel_metadata);
+	opal_fadump_init_metadata(opal_fdm);
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
 
 static int opal_fadump_register(struct fw_dump *fadump_conf)
@@ -43,6 +113,16 @@ static int __init opal_fadump_process(struct fw_dump *fadump_conf)
 static void opal_fadump_region_show(struct fw_dump *fadump_conf,
 				    struct seq_file *m)
 {
+	const struct opal_fadump_mem_struct *fdm_ptr = opal_fdm;
+	u64 dumped_bytes = 0;
+	int i;
+
+	for (i = 0; i < fdm_ptr->region_cnt; i++) {
+		seq_printf(m, "DUMP: Src: %#016llx, Dest: %#016llx, ",
+			   fdm_ptr->rgn[i].src, fdm_ptr->rgn[i].dest);
+		seq_printf(m, "Size: %#llx, Dumped: %#llx bytes\n",
+			   fdm_ptr->rgn[i].size, dumped_bytes);
+	}
 }
 
 static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
@@ -60,6 +140,8 @@ static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
 
 static struct fadump_ops opal_fadump_ops = {
 	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
+	.fadump_get_metadata_size	= opal_fadump_get_metadata_size,
+	.fadump_setup_metadata		= opal_fadump_setup_metadata,
 	.fadump_register		= opal_fadump_register,
 	.fadump_unregister		= opal_fadump_unregister,
 	.fadump_invalidate		= opal_fadump_invalidate,
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
new file mode 100644
index 0000000..0b83d89
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -0,0 +1,39 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Firmware-Assisted Dump support on POWER platform (OPAL).
+ *
+ * Copyright 2019, Hari Bathini, IBM Corporation.
+ */
+
+#ifndef _POWERNV_OPAL_FADUMP_H
+#define _POWERNV_OPAL_FADUMP_H
+
+/*
+ * OPAL FADump metadata structure format version
+ *
+ * OPAL FADump kernel metadata structure stores kernel metadata needed to
+ * register-for/process crash dump. Format version is used to keep a tab on
+ * the changes in the structure format. The changes, if any, to the format
+ * are expected to be minimal and backward compatible.
+ */
+#define OPAL_FADUMP_VERSION			0x1
+
+/* Maximum number of memory regions kernel supports */
+#define OPAL_FADUMP_MAX_MEM_REGS		128
+
+/*
+ * OPAL FADump kernel metadata
+ *
+ * The address of this structure will be registered with f/w for retrieving
+ * and processing during crash dump.
+ */
+struct opal_fadump_mem_struct {
+	u8	version;
+	u8	reserved[3];
+	u16	region_cnt;		/* number of regions */
+	u16	registered_regions;	/* Regions registered for MPIPL */
+	u64	fadumphdr_addr;
+	struct opal_mpipl_region	rgn[OPAL_FADUMP_MAX_MEM_REGS];
+} __packed;
+
+#endif /* _POWERNV_OPAL_FADUMP_H */

