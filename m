Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC29B0034
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 17:37:16 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T5cS205tzF3Qs
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 01:37:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4b15vcdzF3Cb
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4b14kF1z8wJy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4b12ZL9z9s4Y; Thu, 12 Sep 2019 00:50:53 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4b05dhzz9sDB
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:50:52 +1000 (AEST)
Received: from pps.filterd (m0098417.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEis8d140121
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:50 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2uy0caxj8b-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:50:50 -0400
Received: from localhost
 by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:50:48 +0100
Received: from b06cxnps3074.portsmouth.uk.ibm.com (9.149.109.194)
 by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:50:31 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
 [9.149.105.61])
 by b06cxnps3074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x8BEoTdA11862120
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:50:29 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8F65011C04A;
 Wed, 11 Sep 2019 14:50:29 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A347811C04C;
 Wed, 11 Sep 2019 14:50:27 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:50:27 +0000 (GMT)
Subject: [PATCH v6 14/36] powernv/fadump: add fadump support on powernv
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:20:26 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-4275-0000-0000-000003648187
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-4276-0000-0000-00003876D980
Message-Id: <156821342072.5656.4346362203141486452.stgit@hbathini.in.ibm.com>
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

Add basic callback functions for FADump on PowerNV platform.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Drop using unnecessary return type for platform specific DT scan function.


 arch/powerpc/Kconfig                         |    5 +
 arch/powerpc/include/asm/fadump-internal.h   |    7 ++
 arch/powerpc/kernel/fadump.c                 |   15 +++-
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-fadump.c |   92 ++++++++++++++++++++++++++
 5 files changed, 115 insertions(+), 5 deletions(-)
 create mode 100644 arch/powerpc/platforms/powernv/opal-fadump.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index d8dcd88..fc4ecfe 100644
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
diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 8c0eb0f..8046fe0 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -135,4 +135,11 @@ static inline void
 rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node) { }
 #endif
 
+#ifdef CONFIG_PPC_POWERNV
+extern void opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node);
+#else
+static inline void
+opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node) { }
+#endif
+
 #endif /* _ASM_POWERPC_FADUMP_INTERNAL_H */
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 9d9f7c3..b17673d 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -107,11 +107,20 @@ static int __init fadump_cma_init(void) { return 1; }
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 				      int depth, void *data)
 {
-	if (depth != 1 || strcmp(uname, "rtas") != 0)
+	if (depth != 1)
 		return 0;
 
-	rtas_fadump_dt_scan(&fw_dump, node);
-	return 1;
+	if (strcmp(uname, "rtas") == 0) {
+		rtas_fadump_dt_scan(&fw_dump, node);
+		return 1;
+	}
+
+	if (strcmp(uname, "ibm,opal") == 0) {
+		opal_fadump_dt_scan(&fw_dump, node);
+		return 1;
+	}
+
+	return 0;
 }
 
 /*
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
index 0000000..bbc5356
--- /dev/null
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Firmware-Assisted Dump support on POWER platform (OPAL).
+ *
+ * Copyright 2019, Hari Bathini, IBM Corporation.
+ */
+
+#define pr_fmt(fmt) "opal fadump: " fmt
+
+#include <linux/string.h>
+#include <linux/seq_file.h>
+#include <linux/of_fdt.h>
+#include <linux/libfdt.h>
+
+#include <asm/opal.h>
+#include <asm/fadump-internal.h>
+
+static u64 opal_fadump_init_mem_struct(struct fw_dump *fadump_conf)
+{
+	return fadump_conf->reserve_dump_area_start;
+}
+
+static int opal_fadump_register(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int opal_fadump_unregister(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int opal_fadump_invalidate(struct fw_dump *fadump_conf)
+{
+	return -EIO;
+}
+
+static int __init opal_fadump_process(struct fw_dump *fadump_conf)
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
+	.fadump_init_mem_struct		= opal_fadump_init_mem_struct,
+	.fadump_register		= opal_fadump_register,
+	.fadump_unregister		= opal_fadump_unregister,
+	.fadump_invalidate		= opal_fadump_invalidate,
+	.fadump_process			= opal_fadump_process,
+	.fadump_region_show		= opal_fadump_region_show,
+	.fadump_trigger			= opal_fadump_trigger,
+};
+
+void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
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
+		return;
+	}
+
+	if (!of_flat_dt_is_compatible(dn, "ibm,opal-dump")) {
+		pr_err("Support missing for this f/w version!\n");
+		return;
+	}
+
+	fadump_conf->ops		= &opal_fadump_ops;
+	fadump_conf->fadump_supported	= 1;
+}

