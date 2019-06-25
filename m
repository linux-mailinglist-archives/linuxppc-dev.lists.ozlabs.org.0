Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C5C0559B7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 25 Jun 2019 23:11:30 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45YJk76m6DzDq8v
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Jun 2019 07:11:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45YJBN3wrMzDqSd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:24 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 45YJBM0YGjz8t9D
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Jun 2019 06:47:22 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 45YJBL5LR6z9s5c; Wed, 26 Jun 2019 06:47:22 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 45YJBL1Hkjz9s4Y
 for <linuxppc-dev@ozlabs.org>; Wed, 26 Jun 2019 06:47:21 +1000 (AEST)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x5PKl2bi083403
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:20 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2tbrybcgxy-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Tue, 25 Jun 2019 16:47:20 -0400
Received: from localhost
 by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Tue, 25 Jun 2019 21:47:17 +0100
Received: from b06cxnps4076.portsmouth.uk.ibm.com (9.149.109.198)
 by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 25 Jun 2019 21:47:13 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 x5PKlBPK45678644
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 25 Jun 2019 20:47:11 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7A5E2A4062;
 Tue, 25 Jun 2019 20:47:11 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8A3DA405B;
 Tue, 25 Jun 2019 20:47:08 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.0.234])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue, 25 Jun 2019 20:47:08 +0000 (GMT)
Subject: [PATCH v3 10/16] powernv/fadump: add support to preserve crash data
 on FADUMP disabled kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 26 Jun 2019 02:17:07 +0530
In-Reply-To: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
References: <156149548694.9094.3211954809582123798.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19062520-0012-0000-0000-0000032C5C0A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19062520-0013-0000-0000-0000216592FF
Message-Id: <156149562758.9094.5395065020111442197.stgit@hbathini.in.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
 definitions=2019-06-25_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.0.1-1810050000 definitions=main-1906250158
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

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---
 arch/powerpc/Kconfig                         |    9 ++++
 arch/powerpc/include/asm/fadump.h            |    9 +++-
 arch/powerpc/kernel/Makefile                 |    6 ++-
 arch/powerpc/kernel/fadump-common.h          |    8 +++-
 arch/powerpc/kernel/fadump.c                 |   47 ++++++++++++++++++---
 arch/powerpc/kernel/prom.c                   |    4 +-
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-fadump.c |   59 ++++++++++++++++++++++++++
 8 files changed, 130 insertions(+), 13 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index f124a9b..9b05d15 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -571,6 +571,15 @@ config FA_DUMP
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
index 9a7652c..fd990d8 100644
--- a/arch/powerpc/include/asm/fadump.h
+++ b/arch/powerpc/include/asm/fadump.h
@@ -14,9 +14,6 @@
 extern int crashing_cpu;
 
 extern int is_fadump_memory_area(u64 addr, ulong size);
-extern int early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
-				      int depth, void *data);
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
index 23372e3..4c90314 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -77,7 +77,11 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
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
index ebebe4d..fea6872 100644
--- a/arch/powerpc/kernel/fadump-common.h
+++ b/arch/powerpc/kernel/fadump-common.h
@@ -13,6 +13,7 @@
 #ifndef __PPC64_FA_DUMP_INTERNAL_H__
 #define __PPC64_FA_DUMP_INTERNAL_H__
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 /*
  * The RMA region will be saved for later dumping when kernel crashes.
  * RMA is Real Mode Area, the first block of logical memory address owned
@@ -88,6 +89,7 @@ struct fadump_crash_info_header {
 
 /* Platform specific callback functions */
 struct fadump_ops;
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
 
 /* Firmware-Assited Dump platforms */
 enum fadump_platform_type {
@@ -157,9 +159,12 @@ struct fw_dump {
 	unsigned long	nocma:1;
 
 	enum fadump_platform_type	fadump_platform;
+#ifndef CONFIG_PRESERVE_FA_DUMP
 	struct fadump_ops		*ops;
+#endif
 };
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 struct fadump_ops {
 	ulong	(*init_fadump_mem_struct)(struct fw_dump *fadump_config);
 	ulong	(*get_kernel_metadata_size)(void);
@@ -182,8 +187,9 @@ u32 *fadump_regs_to_elf_notes(u32 *buf, struct pt_regs *regs);
 void fadump_update_elfcore_header(struct fw_dump *fadump_config, char *bufp);
 int is_boot_memory_area_contiguous(struct fw_dump *fadump_conf);
 int is_reserved_memory_area_contiguous(struct fw_dump *fadump_conf);
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
 
-#ifdef CONFIG_PPC_PSERIES
+#if !defined(CONFIG_PRESERVE_FA_DUMP) && defined(CONFIG_PPC_PSERIES)
 extern int pseries_dt_scan_fadump(struct fw_dump *fadump_config, ulong node);
 #else
 static inline int
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index ce8c0bf..569221a 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -35,6 +35,7 @@
 
 static struct fw_dump fw_dump;
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_memory_range *crash_memory_ranges;
 int crash_memory_ranges_size;
@@ -205,6 +206,9 @@ static void __init early_init_dt_scan_reserved_ranges(unsigned long node)
 		}
 	}
 }
+#else /* !CONFIG_PRESERVE_FA_DUMP */
+static inline void early_init_dt_scan_reserved_ranges(unsigned long node) { }
+#endif /* CONFIG_PRESERVE_FA_DUMP */
 
 /* Scan the Firmware Assisted dump configuration details. */
 int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
@@ -226,6 +230,7 @@ int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
 	return 0;
 }
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 /*
  * If fadump is registered, check if the memory provided
  * falls within boot memory area and reserved memory area.
@@ -479,6 +484,7 @@ static bool overlaps_with_reserved_ranges(ulong base, ulong end)
 
 	return ret;
 }
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
 
 /* Preserve everything above the base address */
 static void __init fadump_reserve_crash_area(unsigned long base)
@@ -497,12 +503,45 @@ static void __init fadump_reserve_crash_area(unsigned long base)
 			msize -= (base - mstart);
 			mstart = base;
 		}
-		pr_info("Reserving %luMB of memory at %#016lx for saving crash dump",
+		pr_info("Reserving %luMB of memory at %#016lx for preserving crash data",
 			(msize >> 20), mstart);
 		memblock_reserve(mstart, msize);
 	}
 }
 
+unsigned long __init arch_reserved_kernel_pages(void)
+{
+	return memblock_reserved_size() / PAGE_SIZE;
+}
+
+#ifdef CONFIG_PRESERVE_FA_DUMP
+/*
+ * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
+ * preserve crash data. The subsequent memory preserving kernel boot
+ * is likely to process this crash data.
+ */
+int __init fadump_reserve_mem(void)
+{
+	if (fw_dump.dump_active) {
+		unsigned long base;
+
+		pr_info("Preserving crash data for processing in next boot.\n");
+		fw_dump.boot_memory_size = fw_dump.rmr_source_len;
+		base = fw_dump.boot_memory_size + fw_dump.boot_memory_hole_size;
+		base = PAGE_ALIGN(base);
+
+		/*
+		 * If last boot has crashed then reserve all the memory
+		 * above boot memory size to preserve crash data.
+		 */
+		fadump_reserve_crash_area(base);
+	} else
+		pr_debug("FADump-aware kernel..\n");
+
+	return 1;
+}
+#else /* CONFIG_PRESERVE_FA_DUMP */
+
 int __init fadump_reserve_mem(void)
 {
 	int ret = 1;
@@ -631,11 +670,6 @@ int __init fadump_reserve_mem(void)
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
@@ -1396,3 +1430,4 @@ int __init setup_fadump(void)
 	return 1;
 }
 subsys_initcall(setup_fadump);
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
index 7159e79..9c3861bd 100644
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
@@ -731,7 +731,7 @@ void __init early_init_devtree(void *params)
 	if (PHYSICAL_START > MEMORY_START)
 		memblock_reserve(MEMORY_START, 0x8000);
 	reserve_kdump_trampoline();
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
index ed3c35b..b0b2c3d 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -29,8 +29,10 @@
 #include "opal-fadump.h"
 
 static const struct opal_fadump_mem_struct *opal_fdm_active;
+#ifndef CONFIG_PRESERVE_FA_DUMP
 static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
+#endif /* !CONFIG_PRESERVE_FA_DUMP */
 
 static void opal_set_preserv_area_start(struct fw_dump *fadump_conf)
 {
@@ -89,6 +91,62 @@ static void update_fadump_config(struct fw_dump *fadump_conf,
 	opal_set_preserv_area_start(fadump_conf);
 }
 
+/*
+ * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
+ * ensure crash data is preserved in hope that the subsequent memory
+ * preserving kernel boot is going to process this crash data.
+ */
+#ifdef CONFIG_PRESERVE_FA_DUMP
+int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
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
+		u8 type;
+		u32 idx = 0;
+		u64 addr = 0;
+		s64 ret;
+
+		do {
+			ret = opal_mpipl_query_tag(idx, &addr);
+			if (ret != OPAL_SUCCESS)
+				break;
+
+			addr = be64_to_cpu(addr);
+			type = *((u8 *)addr);
+			switch (type) {
+			case MPIPL_FADUMP_TYPE_KERNEL:
+				opal_fdm_active = __va(addr);
+				break;
+			}
+
+			idx++;
+		} while (ret == OPAL_SUCCESS);
+
+		if (opal_fdm_active == NULL) {
+			pr_err("kernel metadata not found!\n");
+			return 1;
+		}
+
+		pr_info("Firmware-assisted dump is active.\n");
+		fadump_conf->dump_active = 1;
+		update_fadump_config(fadump_conf,
+				     (void *)__pa(opal_fdm_active));
+	}
+
+	return 1;
+}
+
+#else /* CONFIG_PRESERVE_FA_DUMP */
 static ulong opal_init_fadump_mem_struct(struct fw_dump *fadump_conf)
 {
 	ulong addr = fadump_conf->reserve_dump_area_start;
@@ -614,3 +672,4 @@ int __init opal_dt_scan_fadump(struct fw_dump *fadump_conf, ulong node)
 
 	return 1;
 }
+#endif /* !CONFIG_PRESERVE_FA_DUMP */

