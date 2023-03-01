Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B3926A7822
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:59:30 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrnC71fwz3fqq
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:59:27 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMPe86NR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NMPe86NR;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJd2gVWz3cMl
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713889; x=1709249889;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=E7eibuMdPGOmosuXsQch6hVs6NOJvXyAD7ZfCZZWJUQ=;
  b=NMPe86NRoMqDfEShtjZFZbjxmbk/1I6OUCgxJFbvGi7Mf9ngKynKUWwg
   G66U5QNar1svDU4hHcoyZ61btYUYxp9ZVh34H61VHBlGLLBZPKzwv6730
   xy7BCY20KogJdP6Qozgn7FPxxmSnI6aZhKsNQ8SIV7DARFpteccvIihbY
   MxcisEkiMGM85XA/WF1rQNnAsbBwfD47wZgmLYKKlLWgtxU3kl4IxH27r
   x3B+8Nj4xPgti8zKwIN3OzTDWiKQu3ER1iljaGmdFKbdYyj9Ap9byDroa
   nSsAWMytirG2KD0V5smHVhZVUmleSJLC5VvFC9dMPE3V9YzmTw7S42Hdl
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818796"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818796"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826871"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826871"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:38:00 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 22/24] x86/watchdog: Add a shim hardlockup detector
Date: Wed,  1 Mar 2023 15:47:51 -0800
Message-Id: <20230301234753.28582-23-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
References: <20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>, Andi Kleen <ak@linux.intel.com>, Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, Ricardo Neri <ricardo.neri@intel.com>, Stephane Eranian <eranian@google.com>, linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a shim hardlockup detector that allows to select between the perf- and
HPET-driven implementations available for x86.

Override the interfaces of the default hardlockup detector.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Suggested-by: Nicholas Piggin <npiggin@gmail.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * None

Changes since v5:
 * Added watchdog_nmi_start() to be used when the watchdog is
   reconfigured.
 * Always build the x86-specific hardlockup detector shim; not only
   when the HPET-based detector is selected.
 * Corrected a typo in comment in watchdog_nmi_probe() (Ani)
 * Removed useless local ret variable in watchdog_nmi_enable(). (Ani)

Changes since v4:
 * Use a switch to enable and disable the various available detectors.
   (Andi)

Changes since v3:
 * Fixed style in multi-line comment. (Randy Dunlap)

Changes since v2:
 * Pass cpu number as argument to hardlockup_detector_[enable|disable].
   (Thomas Gleixner)

Changes since v1:
 * Introduced this patch: Added an x86-specific shim hardlockup
   detector. (Nicholas Piggin)
---
 arch/x86/Kconfig.debug         |  3 ++
 arch/x86/kernel/Makefile       |  2 +
 arch/x86/kernel/watchdog_hld.c | 86 ++++++++++++++++++++++++++++++++++
 3 files changed, 91 insertions(+)
 create mode 100644 arch/x86/kernel/watchdog_hld.c

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index b4dced142116..41ae46314307 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -3,6 +3,9 @@
 config EARLY_PRINTK_USB
 	bool
 
+config X86_HARDLOCKUP_DETECTOR
+	def_bool y if HARDLOCKUP_DETECTOR_CORE
+
 config X86_VERBOSE_BOOTUP
 	bool "Enable verbose x86 bootup info messages"
 	default y
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 58eb858f33ff..706294fd5e46 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -108,6 +108,8 @@ obj-$(CONFIG_KGDB)		+= kgdb.o
 obj-$(CONFIG_VM86)		+= vm86_32.o
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
+obj-$(CONFIG_X86_HARDLOCKUP_DETECTOR) += watchdog_hld.o
+
 obj-$(CONFIG_HPET_TIMER) 	+= hpet.o
 obj-$(CONFIG_X86_HARDLOCKUP_DETECTOR_HPET) += watchdog_hld_hpet.o
 
diff --git a/arch/x86/kernel/watchdog_hld.c b/arch/x86/kernel/watchdog_hld.c
new file mode 100644
index 000000000000..33c22f6456a3
--- /dev/null
+++ b/arch/x86/kernel/watchdog_hld.c
@@ -0,0 +1,86 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A shim hardlockup detector for x86 to select between the perf- and HPET-
+ * driven implementations.
+ *
+ * Copyright (C) Intel Corporation 2023
+ */
+
+#include <linux/nmi.h>
+#include <asm/hpet.h>
+
+enum x86_hardlockup_detector {
+	X86_HARDLOCKUP_DETECTOR_PERF,
+	X86_HARDLOCKUP_DETECTOR_HPET,
+};
+
+static enum x86_hardlockup_detector detector_type __ro_after_init;
+
+int watchdog_nmi_enable(unsigned int cpu)
+{
+	switch (detector_type) {
+	case X86_HARDLOCKUP_DETECTOR_PERF:
+		hardlockup_detector_perf_enable();
+		break;
+	case X86_HARDLOCKUP_DETECTOR_HPET:
+		hardlockup_detector_hpet_enable(cpu);
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	return 0;
+}
+
+void watchdog_nmi_disable(unsigned int cpu)
+{
+	switch (detector_type) {
+	case X86_HARDLOCKUP_DETECTOR_PERF:
+		hardlockup_detector_perf_disable();
+		break;
+	case X86_HARDLOCKUP_DETECTOR_HPET:
+		hardlockup_detector_hpet_disable(cpu);
+		break;
+	}
+}
+
+int __init watchdog_nmi_probe(void)
+{
+	int ret;
+
+	/*
+	 * Try first with the HPET hardlockup detector. It will only succeed if
+	 * requested via the kernel command line. The perf-based detector is
+	 * used by default.
+	 */
+	ret = hardlockup_detector_hpet_init();
+	if (!ret) {
+		detector_type = X86_HARDLOCKUP_DETECTOR_HPET;
+		return ret;
+	}
+
+	ret = hardlockup_detector_perf_init();
+	if (!ret) {
+		detector_type = X86_HARDLOCKUP_DETECTOR_PERF;
+		return ret;
+	}
+
+	return 0;
+}
+
+void watchdog_nmi_stop(void)
+{
+	/* Only the HPET lockup detector defines a stop function. */
+	if (detector_type == X86_HARDLOCKUP_DETECTOR_HPET)
+		hardlockup_detector_hpet_stop();
+}
+
+void watchdog_nmi_start(void)
+{
+	if (!(watchdog_enabled & NMI_WATCHDOG_ENABLED))
+		return;
+
+	/* Only the HPET lockup detector defines a start function. */
+	if (detector_type == X86_HARDLOCKUP_DETECTOR_HPET)
+		hardlockup_detector_hpet_start();
+}
-- 
2.25.1

