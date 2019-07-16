Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BFE06A7B1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 13:52:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzJy1X4HzDqWw
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 21:52:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nyvM4BPHzDqXJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nyvL5j4Jz8t9P
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:33:18 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nyvL4N2gz9sNC; Tue, 16 Jul 2019 21:33:18 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nyvL0bBfz9sN4
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:33:17 +1000 (AEST)
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMI1S112868
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:16 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsbmknvc0-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:33:16 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:33:14 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:33:12 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBXAbs60227688
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:33:10 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7E3E54C050;
 Tue, 16 Jul 2019 11:33:10 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 007724C05A;
 Tue, 16 Jul 2019 11:33:09 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:33:08 +0000 (GMT)
Subject: [PATCH v4 10/25] powernv/fadump: add fadump support on powernv
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:03:08 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0008-0000-0000-000002FDA6B4
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0009-0000-0000-0000226B1C4E
Message-Id: <156327678819.27462.14729688591714141623.stgit@hbathini.in.ibm.com>
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

Add basic callback functions for FADump on PowerNV platform.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/Kconfig                         |    5 +
 arch/powerpc/kernel/fadump-common.h          |   10 +++
 arch/powerpc/kernel/fadump.c                 |    3 +
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-fadump.c |  102 ++++++++++++++++++++++++++
 5 files changed, 119 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f516796..0ce0a80 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -566,7 +566,7 @@ config CRASH_DUMP
 
 config FA_DUMP
 	bool "Firmware-assisted dump"
-	depends on PPC64 && PPC_RTAS
+	depends on PPC64 && (PPC_RTAS || PPC_POWERNV)
 	select CRASH_CORE
 	select CRASH_DUMP
 	help
@@ -577,7 +577,8 @@ config FA_DUMP
 	  is meant to be a kdump replacement offering robustness and
 	  speed not possible without system firmware assistance.
 
-	  If unsure, say "N"
+	  If unsure, say "y". Only special kernels like petitboot may
+	  need to say "N" here.
 
 config IRQ_ALL_CPUS
 	bool "Distribute interrupts on all CPUs by default"
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 0231a0b..928d364 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -54,6 +54,7 @@
 enum fadump_platform_type {
 	FADUMP_PLATFORM_UNKNOWN = 0,
 	FADUMP_PLATFORM_PSERIES,
+	FADUMP_PLATFORM_POWERNV,
 };
 
 /*
@@ -157,4 +158,13 @@ static inline int rtas_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
 }
 #endif
 
+#ifdef CONFIG_PPC_POWERNV
+extern int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node);
+#else
+static inline int opal_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
+{
+	return 1;
+}
+#endif
+
 #endif /* __PPC64_FA_DUMP_INTERNAL_H__ */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index e995db1..517a40b 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -114,6 +114,9 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 	if (strcmp(uname, "rtas") == 0)
 		return rtas_fadump_dt_scan(&fw_dump, node);
 
+	if (strcmp(uname, "ibm,opal") == 0)
+		return opal_fadump_dt_scan(&fw_dump, node);
+
 	return 0;
 }
 
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
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
new file mode 100644
index 0000000..d8ee836
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -0,0 +1,102 @@
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
+#undef DEBUG
+#define pr_fmt(fmt) "opal fadump: " fmt
+
+#include <linux/string.h>
+#include <linux/seq_file.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+
+#include <asm/opal.h>
+
+#include "../../kernel/fadump-common.h"
+
+static ulong opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
+{
+	return fadump_conf->reserve_dump_area_start;
+}
+
+static int opal_fadump_register_fadump(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int opal_fadump_unregister_fadump(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int opal_fadump_invalidate_fadump(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int __init opal_fadump_process_fadump(struct fw_dump *fadump_conf)
+{
+	return -EINVAL;
+}
+
+static void opal_fadump_region_show(struct fw_dump *fadump_conf,
+				    struct seq_file *m)
+{
+}
+
+static void opal_fadump_trigger(struct fadump_crash_info_header *fdh,
+				const char *msg)
+{
+	int rc;
+
+	rc = opal_cec_reboot2(OPAL_REBOOT_MPIPL, msg);
+	if (rc == OPAL_UNSUPPORTED) {
+		pr_emerg("Reboot type %d not supported.\n",
+			 OPAL_REBOOT_MPIPL);
+	} else if (rc == OPAL_HARDWARE)
+		pr_emerg("No backend support for MPIPL!\n");
+}
+
+static struct fadump_ops opal_fadump_ops = {
+	.init_fadump_mem_struct		= opal_fadump_init_mem_struct,
+	.register_fadump		= opal_fadump_register_fadump,
+	.unregister_fadump		= opal_fadump_unregister_fadump,
+	.invalidate_fadump		= opal_fadump_invalidate_fadump,
+	.process_fadump			= opal_fadump_process_fadump,
+	.fadump_region_show		= opal_fadump_region_show,
+	.fadump_trigger			= opal_fadump_trigger,
+};
+
+int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
+{
+	unsigned long dn;
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
+	return 1;
+}

