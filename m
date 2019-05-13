Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2A41B110
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 09:18:16 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 452XGY6sLWzDqJq
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 May 2019 17:18:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 452XFN2V9GzDq9M
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 May 2019 17:17:12 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=neuling.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=neuling.org header.i=@neuling.org header.b="NVpCqjJ9"; 
 dkim-atps=neutral
Received: from neuling.org (localhost [127.0.0.1])
 by ozlabs.org (Postfix) with ESMTP id 452XFN0Jrdz9s4V;
 Mon, 13 May 2019 17:17:12 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=neuling.org;
 s=201811; t=1557731832;
 bh=XwGL+RmUIv+mqW7gKRbYorTsln5gd3mZF9jujoLOANY=;
 h=From:To:Cc:Subject:Date:From;
 b=NVpCqjJ9vdSW9UN/L1Ei0/9bKw32pfQBCfS3MDo/I0mSc7LIE1uOzaOKqEK0PERIP
 sMKMAEBmBXBydAIIdPrEcsX0u041lxQ9gqaNpRrTCLAAoo1lcg7wIrZjYj+ZPgC0s6
 QUiu2YzmT2TBIMEKqdnFiTBxB9kjY8bJInkQbPLym07P/xpLwkMOU/WzjQg5M6GrMH
 dSkE11b+N2I7LA3XuCZS+ZRub84i1aHxUILNwJ24qwQ5oEuptYbIshCSlRUUV1bZfo
 Rbep2Jpq1tvzyQ7h4l+eTLwohGW5/8CWcZEAQViJVCude6cCACaABaPMVGfuTQXnuH
 EIGL/uWy4Pz8A==
Received: by neuling.org (Postfix, from userid 1000)
 id 00E4A2A0390; Mon, 13 May 2019 17:17:11 +1000 (AEST)
From: Michael Neuling <mikey@neuling.org>
To: mpe@ellerman.id.au
Subject: [PATCH v2] powerpc: Fix compile issue with force DAWR
Date: Mon, 13 May 2019 17:17:03 +1000
Message-Id: <20190513071703.25243-1-mikey@neuling.org>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: mikey@neuling.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If you compile with KVM but without CONFIG_HAVE_HW_BREAKPOINT you fail
at linking with:
  arch/powerpc/kvm/book3s_hv_rmhandlers.o:(.text+0x708): undefined reference to `dawr_force_enable'

This was caused by commit c1fe190c0672 ("powerpc: Add force enable of
DAWR on P9 option").

This puts more of the dawr infrastructure in a new file.

Signed-off-by: Michael Neuling <mikey@neuling.org>
--
v2:
  Fixes based on Christophe Leroy's comments:
  - Fix commit message formatting
  - Move more DAWR code into dawr.c
---
 arch/powerpc/Kconfig                     |  5 ++
 arch/powerpc/include/asm/hw_breakpoint.h | 20 ++++---
 arch/powerpc/kernel/Makefile             |  1 +
 arch/powerpc/kernel/dawr.c               | 75 ++++++++++++++++++++++++
 arch/powerpc/kernel/hw_breakpoint.c      | 56 ------------------
 arch/powerpc/kvm/Kconfig                 |  1 +
 6 files changed, 94 insertions(+), 64 deletions(-)
 create mode 100644 arch/powerpc/kernel/dawr.c

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 2711aac246..f4b19e48cc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -242,6 +242,7 @@ config PPC
 	select SYSCTL_EXCEPTION_TRACE
 	select THREAD_INFO_IN_TASK
 	select VIRT_TO_BUS			if !PPC64
+	select PPC_DAWR_FORCE_ENABLE		if PPC64 || PERF
 	#
 	# Please keep this list sorted alphabetically.
 	#
@@ -369,6 +370,10 @@ config PPC_ADV_DEBUG_DAC_RANGE
 	depends on PPC_ADV_DEBUG_REGS && 44x
 	default y
 
+config PPC_DAWR_FORCE_ENABLE
+	bool
+	default y
+
 config ZONE_DMA
 	bool
 	default y if PPC_BOOK3E_64
diff --git a/arch/powerpc/include/asm/hw_breakpoint.h b/arch/powerpc/include/asm/hw_breakpoint.h
index 0fe8c1e46b..ffbc8eab41 100644
--- a/arch/powerpc/include/asm/hw_breakpoint.h
+++ b/arch/powerpc/include/asm/hw_breakpoint.h
@@ -47,6 +47,8 @@ struct arch_hw_breakpoint {
 #define HW_BRK_TYPE_PRIV_ALL	(HW_BRK_TYPE_USER | HW_BRK_TYPE_KERNEL | \
 				 HW_BRK_TYPE_HYP)
 
+extern int set_dawr(struct arch_hw_breakpoint *brk);
+
 #ifdef CONFIG_HAVE_HW_BREAKPOINT
 #include <linux/kdebug.h>
 #include <asm/reg.h>
@@ -90,18 +92,20 @@ static inline void hw_breakpoint_disable(void)
 extern void thread_change_pc(struct task_struct *tsk, struct pt_regs *regs);
 int hw_breakpoint_handler(struct die_args *args);
 
-extern int set_dawr(struct arch_hw_breakpoint *brk);
-extern bool dawr_force_enable;
-static inline bool dawr_enabled(void)
-{
-	return dawr_force_enable;
-}
-
 #else	/* CONFIG_HAVE_HW_BREAKPOINT */
 static inline void hw_breakpoint_disable(void) { }
 static inline void thread_change_pc(struct task_struct *tsk,
 					struct pt_regs *regs) { }
-static inline bool dawr_enabled(void) { return false; }
+
 #endif	/* CONFIG_HAVE_HW_BREAKPOINT */
+
+extern bool dawr_force_enable;
+
+#ifdef CONFIG_PPC_DAWR_FORCE_ENABLE
+extern bool dawr_enabled(void);
+#else
+#define dawr_enabled() true
+#endif
+
 #endif	/* __KERNEL__ */
 #endif	/* _PPC_BOOK3S_64_HW_BREAKPOINT_H */
diff --git a/arch/powerpc/kernel/Makefile b/arch/powerpc/kernel/Makefile
index 0ea6c4aa3a..a9c497c34f 100644
--- a/arch/powerpc/kernel/Makefile
+++ b/arch/powerpc/kernel/Makefile
@@ -56,6 +56,7 @@ obj-$(CONFIG_PPC64)		+= setup_64.o sys_ppc32.o \
 obj-$(CONFIG_VDSO32)		+= vdso32/
 obj-$(CONFIG_PPC_WATCHDOG)	+= watchdog.o
 obj-$(CONFIG_HAVE_HW_BREAKPOINT)	+= hw_breakpoint.o
+obj-$(CONFIG_PPC_DAWR_FORCE_ENABLE)	+= dawr.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_ppc970.o cpu_setup_pa6t.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= cpu_setup_power.o
 obj-$(CONFIG_PPC_BOOK3S_64)	+= mce.o mce_power.o
diff --git a/arch/powerpc/kernel/dawr.c b/arch/powerpc/kernel/dawr.c
new file mode 100644
index 0000000000..cf1d02fe1e
--- /dev/null
+++ b/arch/powerpc/kernel/dawr.c
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: GPL-2.0+
+//
+// DAWR infrastructure
+//
+// Copyright 2019, Michael Neuling, IBM Corporation.
+
+#include <linux/types.h>
+#include <linux/export.h>
+#include <linux/fs.h>
+#include <linux/debugfs.h>
+#include <asm/debugfs.h>
+#include <asm/machdep.h>
+#include <asm/hvcall.h>
+
+bool dawr_force_enable;
+EXPORT_SYMBOL_GPL(dawr_force_enable);
+
+extern bool dawr_enabled(void)
+{
+	return dawr_force_enable;
+}
+EXPORT_SYMBOL_GPL(dawr_enabled);
+
+static ssize_t dawr_write_file_bool(struct file *file,
+				    const char __user *user_buf,
+				    size_t count, loff_t *ppos)
+{
+	struct arch_hw_breakpoint null_brk = {0, 0, 0};
+	size_t rc;
+
+	/* Send error to user if they hypervisor won't allow us to write DAWR */
+	if ((!dawr_force_enable) &&
+	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
+	    (set_dawr(&null_brk) != H_SUCCESS))
+		return -1;
+
+	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
+	if (rc)
+		return rc;
+
+	/* If we are clearing, make sure all CPUs have the DAWR cleared */
+	if (!dawr_force_enable)
+		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
+
+	return rc;
+}
+
+static const struct file_operations dawr_enable_fops = {
+	.read =		debugfs_read_file_bool,
+	.write =	dawr_write_file_bool,
+	.open =		simple_open,
+	.llseek =	default_llseek,
+};
+
+static int __init dawr_force_setup(void)
+{
+	dawr_force_enable = false;
+
+	if (cpu_has_feature(CPU_FTR_DAWR)) {
+		/* Don't setup sysfs file for user control on P8 */
+		dawr_force_enable = true;
+		return 0;
+	}
+
+	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
+		/* Turn DAWR off by default, but allow admin to turn it on */
+		dawr_force_enable = false;
+		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
+					   powerpc_debugfs_root,
+					   &dawr_force_enable,
+					   &dawr_enable_fops);
+	}
+	return 0;
+}
+arch_initcall(dawr_force_setup);
diff --git a/arch/powerpc/kernel/hw_breakpoint.c b/arch/powerpc/kernel/hw_breakpoint.c
index da307dd93e..95605a9c9a 100644
--- a/arch/powerpc/kernel/hw_breakpoint.c
+++ b/arch/powerpc/kernel/hw_breakpoint.c
@@ -380,59 +380,3 @@ void hw_breakpoint_pmu_read(struct perf_event *bp)
 {
 	/* TODO */
 }
-
-bool dawr_force_enable;
-EXPORT_SYMBOL_GPL(dawr_force_enable);
-
-static ssize_t dawr_write_file_bool(struct file *file,
-				    const char __user *user_buf,
-				    size_t count, loff_t *ppos)
-{
-	struct arch_hw_breakpoint null_brk = {0, 0, 0};
-	size_t rc;
-
-	/* Send error to user if they hypervisor won't allow us to write DAWR */
-	if ((!dawr_force_enable) &&
-	    (firmware_has_feature(FW_FEATURE_LPAR)) &&
-	    (set_dawr(&null_brk) != H_SUCCESS))
-		return -1;
-
-	rc = debugfs_write_file_bool(file, user_buf, count, ppos);
-	if (rc)
-		return rc;
-
-	/* If we are clearing, make sure all CPUs have the DAWR cleared */
-	if (!dawr_force_enable)
-		smp_call_function((smp_call_func_t)set_dawr, &null_brk, 0);
-
-	return rc;
-}
-
-static const struct file_operations dawr_enable_fops = {
-	.read =		debugfs_read_file_bool,
-	.write =	dawr_write_file_bool,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
-static int __init dawr_force_setup(void)
-{
-	dawr_force_enable = false;
-
-	if (cpu_has_feature(CPU_FTR_DAWR)) {
-		/* Don't setup sysfs file for user control on P8 */
-		dawr_force_enable = true;
-		return 0;
-	}
-
-	if (PVR_VER(mfspr(SPRN_PVR)) == PVR_POWER9) {
-		/* Turn DAWR off by default, but allow admin to turn it on */
-		dawr_force_enable = false;
-		debugfs_create_file_unsafe("dawr_enable_dangerous", 0600,
-					   powerpc_debugfs_root,
-					   &dawr_force_enable,
-					   &dawr_enable_fops);
-	}
-	return 0;
-}
-arch_initcall(dawr_force_setup);
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index bfdde04e49..9c0d315108 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -39,6 +39,7 @@ config KVM_BOOK3S_32_HANDLER
 config KVM_BOOK3S_64_HANDLER
 	bool
 	select KVM_BOOK3S_HANDLER
+	select PPC_DAWR_FORCE_ENABLE
 
 config KVM_BOOK3S_PR_POSSIBLE
 	bool
-- 
2.21.0

