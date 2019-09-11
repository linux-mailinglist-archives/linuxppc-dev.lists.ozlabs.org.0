Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BB183B0101
	for <lists+linuxppc-dev@lfdr.de>; Wed, 11 Sep 2019 18:10:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46T6MJ1N9nzF3XZ
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Sep 2019 02:10:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46T4jK3FyPzF3Df
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:21 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linux.ibm.com
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 46T4jK1rsWz8sjs
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Sep 2019 00:56:21 +1000 (AEST)
Received: by ozlabs.org (Postfix)
 id 46T4jK09VFz9sP6; Thu, 12 Sep 2019 00:56:21 +1000 (AEST)
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
 by ozlabs.org (Postfix) with ESMTPS id 46T4jJ0nX2z9sNx
 for <linuxppc-dev@ozlabs.org>; Thu, 12 Sep 2019 00:56:18 +1000 (AEST)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
 x8BEgf9D188268
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:16 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2uy2ew9n9u-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <linuxppc-dev@ozlabs.org>; Wed, 11 Sep 2019 10:56:13 -0400
Received: from localhost
 by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <linuxppc-dev@ozlabs.org> from <hbathini@linux.ibm.com>;
 Wed, 11 Sep 2019 15:56:12 +0100
Received: from b06avi18878370.portsmouth.uk.ibm.com (9.149.26.194)
 by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Wed, 11 Sep 2019 15:56:08 +0100
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06avi18878370.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP
 id x8BEu6bv46006622
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Sep 2019 14:56:06 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B2CA5A4054;
 Wed, 11 Sep 2019 14:56:06 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id A45ECA405B;
 Wed, 11 Sep 2019 14:56:04 +0000 (GMT)
Received: from hbathini.in.ibm.com (unknown [9.102.24.71])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Wed, 11 Sep 2019 14:56:04 +0000 (GMT)
Subject: [PATCH v6 29/36] powernv/fadump: add support to preserve crash data
 on FADUMP disabled kernel
From: Hari Bathini <hbathini@linux.ibm.com>
To: linuxppc-dev <linuxppc-dev@ozlabs.org>
Date: Wed, 11 Sep 2019 20:26:03 +0530
In-Reply-To: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
References: <156821308145.5656.2233728784001623843.stgit@hbathini.in.ibm.com>
User-Agent: StGit/0.17.1-dirty
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19091114-0020-0000-0000-0000036B0E3A
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19091114-0021-0000-0000-000021C09B7E
Message-Id: <156821375751.5656.11459483669542541602.stgit@hbathini.in.ibm.com>
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

Add a new kernel config option, CONFIG_PRESERVE_FA_DUMP that ensures
that crash data, from previously crash'ed kernel, is preserved. This
helps in cases where FADump is not enabled but the subsequent memory
preserving kernel boot is likely to process this crash data. One
typical usecase for this config option is petitboot kernel.

As OPAL allows registering address with it in the first kernel and
retrieving it after MPIPL, use it to store the top of boot memory.
A kernel that intends to preserve crash data retrieves it and avoids
using memory beyond this address.

Move arch_reserved_kernel_pages() function as it is needed for both
FA_DUMP and PRESERVE_FA_DUMP configurations.

Signed-off-by: Hari Bathini <hbathini@linux.ibm.com>
---

Changes in v6:
  * Make mpipl-boot node processing code unindented & use kernel types
    where possible.


 arch/powerpc/Kconfig                         |    9 +++
 arch/powerpc/include/asm/fadump-internal.h   |   11 ++++
 arch/powerpc/include/asm/fadump.h            |    9 ++-
 arch/powerpc/kernel/Makefile                 |    4 +
 arch/powerpc/kernel/fadump.c                 |   44 ++++++++++++++--
 arch/powerpc/kernel/prom.c                   |    4 +
 arch/powerpc/platforms/powernv/Makefile      |    1 
 arch/powerpc/platforms/powernv/opal-fadump.c |   73 ++++++++++++++++++++++++++
 8 files changed, 144 insertions(+), 11 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index fc4ecfe..2be9b96 100644
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
diff --git a/arch/powerpc/include/asm/fadump-internal.h b/arch/powerpc/include/asm/fadump-internal.h
index 0f2ce85..6c2868d 100644
--- a/arch/powerpc/include/asm/fadump-internal.h
+++ b/arch/powerpc/include/asm/fadump-internal.h
@@ -9,6 +9,7 @@
 #ifndef _ASM_POWERPC_FADUMP_INTERNAL_H
 #define _ASM_POWERPC_FADUMP_INTERNAL_H
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 /*
  * The RMA region will be saved for later dumping when kernel crashes.
  * RMA is Real Mode Area, the first block of logical memory address owned
@@ -146,6 +147,16 @@ void fadump_update_elfcore_header(char *bufp);
 bool is_fadump_boot_mem_contiguous(void);
 bool is_fadump_reserved_mem_contiguous(void);
 
+#else /* !CONFIG_PRESERVE_FA_DUMP */
+
+/* Firmware-assisted dump configuration details. */
+struct fw_dump {
+	u64	boot_mem_top;
+	u64	dump_active;
+};
+
+#endif /* CONFIG_PRESERVE_FA_DUMP */
+
 #ifdef CONFIG_PPC_PSERIES
 extern void rtas_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node);
 #else
diff --git a/arch/powerpc/include/asm/fadump.h b/arch/powerpc/include/asm/fadump.h
index fd5002b..526a6a6 100644
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
 #endif /* _ASM_POWERPC_FADUMP_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 56dfa7a..ce70e77 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -78,7 +78,9 @@ obj-$(CONFIG_EEH)              += eeh.o eeh_pe.o eeh_dev.o eeh_cache.o \
 				  eeh_driver.o eeh_event.o eeh_sysfs.o
 obj-$(CONFIG_GENERIC_TBSYNC)	+= smp-tbsync.o
 obj-$(CONFIG_CRASH_DUMP)	+= crash_dump.o
-obj-$(CONFIG_FA_DUMP)		+= fadump.o
+ifneq ($(CONFIG_FA_DUMP)$(CONFIG_PRESERVE_FA_DUMP),)
+obj-y				+= fadump.o
+endif
 ifdef CONFIG_PPC32
 obj-$(CONFIG_E500)		+= idle_e500.o
 endif
diff --git a/arch/powerpc/kernel/fadump.c b/arch/powerpc/kernel/fadump.c
index 6f52a60..645d9d4 100644
--- a/arch/powerpc/kernel/fadump.c
+++ b/arch/powerpc/kernel/fadump.c
@@ -36,6 +36,7 @@ static struct fw_dump fw_dump;
 
 static void __init fadump_reserve_crash_area(u64 base);
 
+#ifndef CONFIG_PRESERVE_FA_DUMP
 static DEFINE_MUTEX(fadump_mutex);
 struct fadump_mrange_info crash_mrange_info = { "crash", NULL, 0, 0, 0 };
 struct fadump_mrange_info reserved_mrange_info = { "reserved", NULL, 0, 0, 0 };
@@ -439,11 +440,6 @@ int __init fadump_reserve_mem(void)
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
@@ -1358,6 +1354,39 @@ int __init setup_fadump(void)
 	return 1;
 }
 subsys_initcall(setup_fadump);
+#else /* !CONFIG_PRESERVE_FA_DUMP */
+
+/* Scan the Firmware Assisted dump configuration details. */
+int __init early_init_dt_scan_fw_dump(unsigned long node, const char *uname,
+				      int depth, void *data)
+{
+	if ((depth != 1) || (strcmp(uname, "ibm,opal") != 0))
+		return 0;
+
+	opal_fadump_dt_scan(&fw_dump, node);
+	return 1;
+}
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
+		fadump_reserve_crash_area(fw_dump.boot_mem_top);
+	} else
+		pr_debug("FADump-aware kernel..\n");
+
+	return 1;
+}
+#endif /* CONFIG_PRESERVE_FA_DUMP */
 
 /* Preserve everything above the base address */
 static void __init fadump_reserve_crash_area(u64 base)
@@ -1382,3 +1411,8 @@ static void __init fadump_reserve_crash_area(u64 base)
 		memblock_reserve(mstart, msize);
 	}
 }
+
+unsigned long __init arch_reserved_kernel_pages(void)
+{
+	return memblock_reserved_size() / PAGE_SIZE;
+}
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
index ad4c18b..c66fa96 100644
--- a/arch/powerpc/platforms/powernv/opal-fadump.c
+++ b/arch/powerpc/platforms/powernv/opal-fadump.c
@@ -20,6 +20,67 @@
 
 #include "opal-fadump.h"
 
+
+#ifdef CONFIG_PRESERVE_FA_DUMP
+/*
+ * When dump is active but PRESERVE_FA_DUMP is enabled on the kernel,
+ * ensure crash data is preserved in hope that the subsequent memory
+ * preserving kernel boot is going to process this crash data.
+ */
+void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
+{
+	const struct opal_fadump_mem_struct *opal_fdm_active;
+	const __be32 *prop;
+	unsigned long dn;
+	u64 addr = 0;
+	s64 ret;
+
+	dn = of_get_flat_dt_subnode_by_name(node, "dump");
+	if (dn == -FDT_ERR_NOTFOUND)
+		return;
+
+	/*
+	 * Check if dump has been initiated on last reboot.
+	 */
+	prop = of_get_flat_dt_prop(dn, "mpipl-boot", NULL);
+	if (!prop)
+		return;
+
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_KERNEL, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_debug("Could not get Kernel metadata (%lld)\n", ret);
+		return;
+	}
+
+	/*
+	 * Preserve memory only if kernel memory regions are registered
+	 * with f/w for MPIPL.
+	 */
+	addr = be64_to_cpu(addr);
+	pr_debug("Kernel metadata addr: %llx\n", addr);
+	opal_fdm_active = (void *)addr;
+	if (opal_fdm_active->registered_regions == 0)
+		return;
+
+	ret = opal_mpipl_query_tag(OPAL_MPIPL_TAG_BOOT_MEM, &addr);
+	if ((ret != OPAL_SUCCESS) || !addr) {
+		pr_err("Failed to get boot memory tag (%lld)\n", ret);
+		return;
+	}
+
+	/*
+	 * Memory below this address can be used for booting a
+	 * capture kernel or petitboot kernel. Preserve everything
+	 * above this address for processing crashdump.
+	 */
+	fadump_conf->boot_mem_top = be64_to_cpu(addr);
+	pr_debug("Preserve everything above %llx\n", fadump_conf->boot_mem_top);
+
+	pr_info("Firmware-assisted dump is active.\n");
+	fadump_conf->dump_active = 1;
+}
+
+#else /* CONFIG_PRESERVE_FA_DUMP */
 static const struct opal_fadump_mem_struct *opal_fdm_active;
 static const struct opal_mpipl_fadump *opal_cpu_metadata;
 static struct opal_fadump_mem_struct *opal_fdm;
@@ -183,6 +244,17 @@ static int opal_fadump_setup_metadata(struct fw_dump *fadump_conf)
 		err = -EPERM;
 	}
 
+	/*
+	 * Register boot memory top address with f/w. Should be retrieved
+	 * by a kernel that intends to preserve crash'ed kernel's memory.
+	 */
+	ret = opal_mpipl_register_tag(OPAL_MPIPL_TAG_BOOT_MEM,
+				      fadump_conf->boot_memory_size);
+	if (ret != OPAL_SUCCESS) {
+		pr_err("Failed to set boot memory tag!\n");
+		err = -EPERM;
+	}
+
 	return err;
 }
 
@@ -649,3 +721,4 @@ void __init opal_fadump_dt_scan(struct fw_dump *fadump_conf, u64 node)
 	fadump_conf->dump_active = 1;
 	opal_fadump_get_config(fadump_conf, opal_fdm_active);
 }
+#endif /* !CONFIG_PRESERVE_FA_DUMP */

