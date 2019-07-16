Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B5B6A882
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 14:15:05 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45nzqV03M5zDqG9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jul 2019 22:15:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45nywf5l0YzDqX2
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45nywf4KwMz8sxT
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jul 2019 21:34:26 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45nywf48Hzz9sN4; Tue, 16 Jul 2019 21:34:26 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45nywf1K4Nz9s8m
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 21:34:25 +1000 (AEST)
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x6GBMrWY029897
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:24 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tsagt0w0t-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 16 Jul 2019 07:34:24 -0400
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 16 Jul 2019 12:34:21 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 16 Jul 2019 12:34:20 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x6GBYI1u30670982
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 Jul 2019 11:34:18 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 6B3A3A4054;
 Tue, 16 Jul 2019 11:34:18 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BB9FAA4060;
 Tue, 16 Jul 2019 11:34:16 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.184.183.117])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 16 Jul 2019 11:34:16 +0000 (GMT)
Subject: [PATCH v4 19/25] powernv/fadump: add support to preserve crash data
 on FADUMP disabled kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Tue, 16 Jul 2019 17:04:16 +0530
In-Reply-To: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
References: <156327668777.27462.5297279227799429100.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19071611-0008-0000-0000-000002FDA6D0
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19071611-0009-0000-0000-0000226B1C69
Message-Id: <156327685595.27462.18212106248170156950.stgit@hbathini.in.ibm.com>
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

Add a new kernel config option, CONFIG_PRESERVE_FA_DUMP that ensures
that crash data, from previously crash'ed kernel, is preserved. This
helps in cases where FADump is not enabled but the subsequent memory
preserving kernel boot is likely to process this crash data. One
typical usecase for this config option is petitboot kernel.

As OPAL allows registering address with it in the first kernel and
retrieving it after MPIPL, use it to store the top of boot memory.
A kernel that intends to preserve crash data retrieves it and avoids
using memory beyond this address.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/Kconfig                         |    9 ++
 arch/powerpc/include/asm/fadump.h            |    9 +-
 arch/powerpc/kernel/Makefile                 |    6 +
 arch/powerpc/kernel/fadump-common.h          |   13 ++-
 arch/powerpc/kernel/fadump.c                 |  128 ++++++++++++++++----------
 arch/powerpc/kernel/prom.c                   |    4 -
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-fadump.c |   59 ++++++++++++
 arch/powerpc/platforms/powernv/opal-fadump.h |    3 +
 9 files changed, 176 insertions(+), 56 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 0ce0a80..7c44a8b 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -580,6 +580,15 @@ config FA_DUMP
 	  If unsure, say "y". Only special kernels like petitboot may
 	  need to say "N" here.
 
+config PRESERVE_FA_DUMP
+	bool "Preserve Firmware-assisted dump"
+	depends on PPC64 && PPC_POWERNV && !FA_DUMP
+	help
+	  On a kernel with FA_DUMP disabled, this option helps to preserve
+	  crash data from a previously crash'ed kernel. Useful when the next
+	  memory preserving kernel boot would process this crash data.
+	  Petitboot kernel is the typical usecase for this option.
+
 config IRQ_ALL_CPUS
 	bool "Distribute interrupts on all CPUs by default"
 	depends on SMP
diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index e608d34..fd990d8 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -14,9 +14,6 @@
 extern int crashing_cpu;
 
 extern int is_fadump_memory_area(u64 addr, ulong size);
-extern int early_init_dt_scan_fw_dump(unsigned long node,
-		const char *uname, int depth, void *data);
-extern int fadump_reserve_mem(void);
 extern int setup_fadump(void);
 extern int is_fadump_active(void);
 extern int should_fadump_crash(void);
@@ -29,4 +26,10 @@ static inline int should_fadump_crash(void) { return 0; }
 static inline void crash_fadump(struct pt_regs *regs, const char *str) { }
 static inline void fadump_cleanup(void) { }
 #endif /* !CONFIG_FA_DUMP */
+
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
+extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data);
+extern int fadump_reserve_mem(void);
+#endif
 #endif /* __PPC64_FA_DUMP_H__ */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 439d548..6abaead 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -78,7 +78,11 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
 				  eeh_driver.o eeh_event.o eeh_sysfs.o
 obj-$(CONFIG_GENERIC_TBSYNC)	+= smp-tbsync.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
-obj-$(CONFIG_FA_DUMP)		+= fadump.o fadump-common.o
+ifeq ($(CONFIG_FA_DUMP),y)
+obj-y				+= fadump.o fadump-common.o
+else
+obj-$(CONFIG_PRESERVE_FA_DUMP)	+= fadump.o
+endif
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
 endif
diff --git a/arch/powerpc/kernel/fadump-common.h b/arch/powerpc/kernel/fadump-common.h
index 2dd0d9d..5dbcefc 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -16,6 +16,7 @@
 #ifndef __PPC64_FA_DUMP_INTERNAL_H__
 #define __PPC64_FA_DUMP_INTERNAL_H__
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 /*
  * The RMA region will be saved for later dumping when kernel crashes.
  * RMA is Real Mode Area, the first block of logical memory address owned
@@ -180,7 +181,17 @@ void fadump_update_elfcore_header(struct fw_dump *fadump_config, char *bufp);
 int is_fadump_boot_mem_contiguous(struct fw_dump *fadump_conf);
 int is_fadump_reserved_mem_contiguous(struct fw_dump *fadump_conf);
 
-#ifdef CONFIG_PPC_PSERIES
+#else /* !CONFIG_PRESERVE_FA_DUMP */
+
+/* Firmware-assisted dump configuration details. */
+struct fw_dump {
+	unsigned long	boot_mem_top;
+	unsigned long	dump_active;
+};
+
+#endif /* CONFIG_PRESERVE_FA_DUMP */
+
+#if !defined(CONFIG_PRESERVE_FA_DUMP) && defined(CONFIG_PPC_PSERIES)
 extern int rtas_fadump_dt_scan(struct fw_dump *fadump_config, ulong node);
 #else
 static inline int rtas_fadump_dt_scan(struct fw_dump *fadump_config, ulong node)
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 608eb1d..bb6a63c 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -35,6 +35,9 @@
 
 static struct fw_dump fw_dump;
 
+static void __init fadump_reserve_crash_area(unsigned long base);
+
+#ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_memory_range *crash_memory_ranges;
 int crash_memory_ranges_size;
@@ -206,26 +209,6 @@ static void __init early_init_dt_scan_reserved_ranges(unsigned long node)
 	}
 }
 
-/* Scan the Firmware Assisted dump configuration details. */
-int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
-				      int depth, void *data)
-{
-	if (depth != 1) {
-		if (depth == 0)
-			early_init_dt_scan_reserved_ranges(node);
-
-		return 0;
-	}
-
-	if (strcmp(uname, "rtas") == 0)
-		return rtas_fadump_dt_scan(&fw_dump, node);
-
-	if (strcmp(uname, "ibm,opal") == 0)
-		return opal_fadump_dt_scan(&fw_dump, node);
-
-	return 0;
-}
-
 /*
  * If fadump is registered, check if the memory provided
  * falls within boot memory area and reserved memory area.
@@ -481,26 +464,6 @@ static bool overlaps_with_reserved_ranges(ulong base, ulong end)
 	return ret;
 }
 
-static void __init fadump_reserve_crash_area(unsigned long base,
-					     unsigned long size)
-{
-	struct memblock_region *reg;
-	unsigned long mstart, mend, msize;
-
-	for_each_memblock(memory, reg) {
-		mstart = max_t(unsigned long, base, reg->base);
-		mend = reg->base + reg->size;
-		mend = min(base + size, mend);
-
-		if (mstart < mend) {
-			msize = mend - mstart;
-			memblock_reserve(mstart, msize);
-			pr_info("Reserved %ldMB of memory at %#016lx for saving crash dump\n",
-				(msize >> 20), mstart);
-		}
-	}
-}
-
 int __init fadump_reserve_mem(void)
 {
 	int ret = 1;
@@ -558,12 +521,11 @@ int __init fadump_reserve_mem(void)
 #endif
 		/*
 		 * If last boot has crashed then reserve all the memory
-		 * above boot_memory_size so that we don't touch it until
+		 * above boot memory size so that we don't touch it until
 		 * dump is written to disk by userspace tool. This memory
-		 * will be released for general use once the dump is saved.
+		 * can be released for general use by invalidating fadump.
 		 */
-		size = memory_boundary - base;
-		fadump_reserve_crash_area(base, size);
+		fadump_reserve_crash_area(base);
 
 		pr_debug("fadumphdr_addr = %#016lx\n", fw_dump.fadumphdr_addr);
 		fw_dump.reserve_dump_area_start = base;
@@ -613,11 +575,6 @@ int __init fadump_reserve_mem(void)
 	return 0;
 }
 
-unsigned long __init arch_reserved_kernel_pages(void)
-{
-	return memblock_reserved_size() / PAGE_SIZE;
-}
-
 /* Look for fadump= cmdline option. */
 static int __init early_fadump_param(char *p)
 {
@@ -1375,3 +1332,76 @@ int __init setup_fadump(void)
 	return 1;
 }
 subsys_initcall(setup_fadump);
+#else /* !CONFIG_PRESERVE_FA_DUMP */
+
+static inline void early_init_dt_scan_reserved_ranges(unsigned long node) { }
+
+/*
+ * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
+ * preserve crash data. The subsequent memory preserving kernel boot
+ * is likely to process this crash data.
+ */
+int __init fadump_reserve_mem(void)
+{
+	if (fw_dump.dump_active) {
+		/*
+		 * If last boot has crashed then reserve all the memory
+		 * above boot memory to preserve crash data.
+		 */
+		pr_info("Preserving crash data for processing in next boot.\n");
+		fadump_reserve_crash_area(PAGE_ALIGN(fw_dump.boot_mem_top));
+	} else
+		pr_debug("FADump-aware kernel..\n");
+
+	return 1;
+}
+#endif /* CONFIG_PRESERVE_FA_DUMP */
+
+/* Preserve everything above the base address */
+static void __init fadump_reserve_crash_area(unsigned long base)
+{
+	struct memblock_region *reg;
+	unsigned long mstart, msize;
+
+	for_each_memblock(memory, reg) {
+		mstart = reg->base;
+		msize  = reg->size;
+
+		if ((mstart + msize) < base)
+			continue;
+
+		if (mstart < base) {
+			msize -= (base - mstart);
+			mstart = base;
+		}
+
+		pr_info("Reserving %luMB of memory at %#016lx for preserving crash data",
+			(msize >> 20), mstart);
+		memblock_reserve(mstart, msize);
+	}
+}
+
+unsigned long __init arch_reserved_kernel_pages(void)
+{
+	return memblock_reserved_size() / PAGE_SIZE;
+}
+
+/* Scan the Firmware Assisted dump configuration details. */
+int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data)
+{
+	if (depth != 1) {
+		if (depth == 0)
+			early_init_dt_scan_reserved_ranges(node);
+
+		return 0;
+	}
+
+	if (strcmp(uname, "rtas") == 0)
+		return rtas_fadump_dt_scan(&fw_dump, node);
+
+	if (strcmp(uname, "ibm,opal") == 0)
+		return opal_fadump_dt_scan(&fw_dump, node);
+
+	return 0;
+}
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 454e19cf..7b6cdd9 100644
--- a/arch/powerpc/kernel/prom.c
+++ b/arch/powerpc/kernel/prom.c
@@ -704,7 +704,7 @@ void __init early_init_devtree(void *params)
 	of_scan_flat_dt(early_init_dt_scan_opal, NULL);
 #endif
 
-#ifdef CONFIG_FA_DUMP
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 	/* scan tree to see if dump is active during last boot */
 	of_scan_flat_dt(early_init_dt_scan_fw_dump, NULL);
 #endif
@@ -769,7 +769,7 @@ void __init early_init_devtree(void *params)
 #endif
 
 	mmu_early_init_devtree();
-#ifdef CONFIG_FA_DUMP
+#if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
 	/*
 	 * If we fail to reserve memory for firmware-assisted dump then
 	 * fallback to kexec based kdump.
diff --git a/arch/powerpc/platforms/powernv/Makefile b/arch/powerpc/platforms/powernv/Makefile
index 43a6e1c..b4a8022 100644
--- a/arch/powerpc/platforms/powernv/Makefile
+++ b/arch/powerpc/platforms/powernv/Makefile
@@ -7,6 +7,7 @@ obj-y			+= opal-kmsg.o opal-powercap.o opal-psr.o opal-sensor-groups.o
 
 obj-$(CONFIG_SMP)	+= smp.o subcore.o subcore-asm.o
 obj-$(CONFIG_FA_DUMP)	+= opal-fadump.o
+obj-$(CONFIG_PRESERVE_FA_DUMP)	+= opal-fadump.o
 obj-$(CONFIG_PCI)	+= pci.o pci-ioda.o npu-dma.o pci-ioda-tce.o
 obj-$(CONFIG_CXL_BASE)	+= pci-cxl.o
 obj-$(CONFIG_EEH)	+= eeh-powernv.o
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.c b/arch/powerpc/platforms/powernv/opal-fadump.c
index 479967c..31dc7a5 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -26,6 +26,53 @@
 #include "../../kernel/fadump-common.h"
 #include "opal-fadump.h"
 
+
+#ifdef CONFIG_PRESERVE_FA_DUMP
+/*
+ * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
+ * ensure crash data is preserved in hope that the subsequent memory
+ * preserving kernel boot is going to process this crash data.
+ */
+int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
+{
+	unsigned long dn;
+	const __be32 *prop;
+
+	dn = of_get_flat_dt_subnode_by_name(node, "dump");
+	if (dn == -FDT_ERR_NOTFOUND)
+		return 1;
+
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
+	if (prop) {
+		u64 addr = 0;
+		s64 ret;
+
+		ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, &addr);
+		if ((ret != OPAL_SUCCESS) || !addr) {
+			pr_err("Failed to get boot memory tag (%lld)\n", ret);
+			return 1;
+		}
+
+		/*
+		 * Anything below this address can be used for booting a
+		 * capture kernel or petitboot kernel. Preserve everything
+		 * above this address for processing crashdump.
+		 */
+		fadump_conf->boot_mem_top = be64_to_cpu(addr);
+		pr_debug("Preserve everything above %lx\n",
+			 fadump_conf->boot_mem_top);
+
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+	}
+
+	return 1;
+}
+
+#else /* CONFIG_PRESERVE_FA_DUMP */
 static const struct opal_fadump_mem_struct *opal_fdm_active;
 static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
@@ -155,6 +202,17 @@ static int opal_fadump_setup_kernel_metadata(struct fw_dump *fadump_conf)
 		err = -EPERM;
 	}
 
+	/*
+	 * Register boot memory top address with f/w. Should be retrieved
+	 * by a kernel that intends to preserve crash'ed kernel's memory.
+	 */
+	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_BOOT_MEM,
+				      fadump_conf->boot_mem_top);
+	if (ret != OPAL_SUCCESS) {
+		pr_err("Failed to set boot memory tag!\n");
+		err = -EPERM;
+	}
+
 	return err;
 }
 
@@ -610,3 +668,4 @@ int __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, ulong node)
 
 	return 1;
 }
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
diff --git a/arch/powerpc/platforms/powernv/opal-fadump.h b/arch/powerpc/platforms/powernv/opal-fadump.h
index 7c44aba..ebe8ed1 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.h
+++ b/arch/powerpc/platforms/powernv/opal-fadump.h
@@ -13,6 +13,8 @@
 #ifndef __PPC64_OPAL_FA_DUMP_H__
 #define __PPC64_OPAL_FA_DUMP_H__
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
+
 /* OPAL FADump structure format version */
 #define OPAL_FADUMP_VERSION			0x1
 
@@ -30,6 +32,7 @@ struct opal_fadump_mem_struct {
 	u64	fadumphdr_addr;
 	struct opal_mpipl_region	rgn[FADUMP_MAX_MEM_REGS];
 } __attribute__((packed));
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
 
 /*
  * CPU state data is provided by f/w. Below are the definitions

