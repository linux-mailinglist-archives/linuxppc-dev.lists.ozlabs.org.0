Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE746A781B
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 00:54:56 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRrgy0xjKz3fFM
	for <lists+linuxppc-dev@lfdr.de>; Thu,  2 Mar 2023 10:54:54 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BVVTtGMu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.55.52.43; helo=mga05.intel.com; envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=BVVTtGMu;
	dkim-atps=neutral
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PRrJc3Pzhz3cMk
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  2 Mar 2023 10:38:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677713888; x=1709249888;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=8QIuyN0QEY4OfKB2VbUhtM2hIu//OC14YEF4m3K65og=;
  b=BVVTtGMuyDzf1Dak8IbTGthLAf5gSqKGuL0KOVhuSvwzTaLsvTDE+Zdu
   no3vDY8C2LFYbBS0j+O3XJZeJtR4xyS5mJNT9scGW7+hEHeBtHpM4+oja
   ZwLcSJkUZ2R5ulBugrzby7TJIjh5SqYXQejy4GMEqF06ZwLMkyMlNxR9d
   n+HHRoW8o18t+pNlRM4y1vRsa4FUnSYMZAEGXwdF1TcRVYhvtPunqeUkA
   pM0kArgys2DWN2nvBzlh9SwtSzm79P6WiStjhz2kv5ECA3A4OkTff3a8V
   95b9V/ruoTbI6Q0eyU/4WAXbkjeHMOjihNx8LQFhPkJKqBldoiLVFKtH7
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420818781"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="420818781"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 15:38:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="738826860"
X-IronPort-AV: E=Sophos;i="5.98,225,1673942400"; 
   d="scan'208";a="738826860"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
  by fmsmga008.fm.intel.com with ESMTP; 01 Mar 2023 15:37:59 -0800
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Tony Luck <tony.luck@intel.com>,
	Dave Hansen <dave.hansen@intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Len Brown <len.brown@intel.com>
Subject: [PATCH v7 19/24] x86/watchdog/hardlockup: Add an HPET-based hardlockup detector
Date: Wed,  1 Mar 2023 15:47:48 -0800
Message-Id: <20230301234753.28582-20-ricardo.neri-calderon@linux.intel.com>
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

Implement a hardlockup detector that uses an HPET channel as the source
of the non-maskable interrupt. Implement the basic functionality to
start, stop, and configure the timer.

Designate as the handling CPU one of the CPUs that the detector monitors.
Use it to service the NMI from the HPET channel. When servicing the HPET
NMI, issue an inter-processor interrupt to the rest of the monitored CPUs
to look for hardlockups. Only enable the detector if IPI shorthands are
enabled in the system.

During operation, the HPET registers are only accessed to kick the timer.
This operation can be avoided if the detector gets a periodic HPET
channel.

Since we use IPI shorthands, all CPUs get the IPI NMI. This would disturb
the isolated CPUs specified in the nohz_full command-line parameter. In
such case, do not enable this hardlockup detector implementation.

The detector is not functional at this stage. A subsequent changeset will
invoke the interfaces implemented in this changeset to operate the
detector. Another subsequent changeset implements logic to determine if
the HPET timer caused the NMI. For now, implement a stub function.

Cc: Andi Kleen <ak@linux.intel.com>
Cc: Stephane Eranian <eranian@google.com>
Cc: iommu@lists.linux-foundation.org
Cc: linuxppc-dev@lists.ozlabs.org
Reviewed-by: Tony Luck <tony.luck@intel.com>
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v6:
 * Added missing header asm/nmi.h. linux/nmi.h #includes it only if
   CONFIG_HAVE_NMI_WATCHDOG selected. Such option is not selected for
   ARCH=x86.
 * Removed IRQF_NOBALANCING from request_irq(). The NMI vector already
   is configured to prevent balancing.
 * Added check to not use the detector when the nohz_full= command-line
   parameter is present.
 * Since I dropped the patch that added a new NMI_WATCHDOG list of
   handlers, now I added my handler to the NMI_LOCAL list. This makes
   sense since now the watchdog NMIs are now delivered via IPIs. The
   only exception is the HPET NMI, but that interrupt can only be handled
   by the monitoring CPU.

Changes since v5:
 * Squashed a previously separate patch to support interrupt remapping into
   this patch. There is no need to handle interrupt remapping separately.
   All the necessary plumbing is done in the interrupt subsystem. Now it
   uses request_irq().
 * Use IPI shorthands to send an NMI to the CPUs being monitored. (Thomas)
 * Added extra check to only use the HPET hardlockup detector if the IPI
   shorthands are enabled. (Thomas)
 * Relocated flushing of outstanding interrupts from enable_timer() to
   disable_timer(). On some systems, making any change in the
   configuration of the HPET channel causes it to issue an interrupt.
 * Added a new cpumask to function as a per-cpu test bit to determine if
   a CPU should check for hardlockups.
 * Dropped pointless X86_64 || X86_32 check in Kconfig. (Tony)
 * Dropped pointless dependency on CONFIG_HPET.
 * Added dependency on CONFIG_GENERIC_MSI_IRQ, needed to build the [|IR]-
   HPET-MSI irq_chip.
 * Added hardlockup_detector_hpet_start() to be used when tsc_khz is
   recalibrated.
 * Reworked the periodic setting the HPET channel. Rather than changing it
   every time the channel is disabled or enabled, do it only once. While
   at here, wrap the code in an initial setup function.
 * Implemented hardlockup_detector_hpet_start() to be called when tsc_khz
   is refined.
 * Enhanced inline comments for clarity.
 * Added missing #include files.
 * Relocated function declarations to not depend on CONFIG_HPET_TIMER.

Changes since v4:
 * Dropped hpet_hld_data.enabled_cpus and instead use cpumask_weight().
 * Renamed hpet_hld_data.cpu_monitored_mask to
   hld_data_data.cpu_monitored_mask and converted it to cpumask_var_t.
 * Flushed out any outstanding interrupt before enabling the HPET channel.
 * Removed unnecessary MSI_DATA_LEVEL_ASSERT from the MSI message.
 * Added comments in hardlockup_detector_nmi_handler() to explain how
   CPUs are targeted for an IPI.
 * Updated code to only issue an IPI when needed (i.e., there are monitored
   CPUs to be inspected via an IPI).
 * Reworked hardlockup_detector_hpet_init() for readability.
 * Now reserve the cpumasks in the hardlockup detector code and not in the
   generic HPET code.
 * Handled the case of watchdog_thresh = 0 when disabling the detector.
 * Made this detector available to i386.
 * Reworked logic to kick the timer to remove a local variable. (Andi)
 * Added a comment on what type of timer channel will be assigned to the
   detector. (Andi)
 * Reworded prompt comment in Kconfig. (Andi)
 * Removed unneeded switch to level interrupt mode when disabling the
   timer. (Andi)
 * Disabled the HPET timer to avoid a race between an incoming interrupt
   and an update of the MSI destination ID. (Ashok)
 * Corrected a typo in an inline comment. (Tony)
 * Made the HPET hardlockup detector depend on HARDLOCKUP_DETECTOR instead
   of selecting it.

Changes since v3:
 * Fixed typo in Kconfig.debug. (Randy Dunlap)
 * Added missing slab.h to include the definition of kfree to fix a build
   break.

Changes since v2:
 * Removed use of struct cpumask in favor of a variable length array in
   conjunction with kzalloc. (Peter Zijlstra)
 * Removed redundant documentation of functions. (Thomas Gleixner)
 * Added CPU as argument hardlockup_detector_hpet_enable()/disable().
   (Thomas Gleixner).

Changes since v1:
 * Do not target CPUs in a round-robin manner. Instead, the HPET timer
   always targets the same CPU; other CPUs are monitored via an
   interprocessor interrupt.
 * Dropped support for IO APIC interrupts and instead use only MSI
   interrupts.
 * Removed use of generic irq code to set interrupt affinity and NMI
   delivery. Instead, configure the interrupt directly in HPET registers.
   (Thomas Gleixner)
 * Fixed unconditional return NMI_HANDLED when the HPET timer is
   programmed for FSB/MSI delivery. (Peter Zijlstra)
---
 arch/x86/Kconfig.debug              |   8 +
 arch/x86/include/asm/hpet.h         |  21 ++
 arch/x86/kernel/Makefile            |   1 +
 arch/x86/kernel/watchdog_hld_hpet.c | 380 ++++++++++++++++++++++++++++
 4 files changed, 410 insertions(+)
 create mode 100644 arch/x86/kernel/watchdog_hld_hpet.c

diff --git a/arch/x86/Kconfig.debug b/arch/x86/Kconfig.debug
index bdfe08f1a930..b4dced142116 100644
--- a/arch/x86/Kconfig.debug
+++ b/arch/x86/Kconfig.debug
@@ -110,6 +110,14 @@ config IOMMU_LEAK
 config HAVE_MMIOTRACE_SUPPORT
 	def_bool y
 
+config X86_HARDLOCKUP_DETECTOR_HPET
+	bool "HPET-based hardlockup detector"
+	select HARDLOCKUP_DETECTOR_CORE
+	depends on HARDLOCKUP_DETECTOR && HPET_TIMER && GENERIC_MSI_IRQ
+	help
+	  Say y to drive the hardlockup detector using the High-Precision Event
+	  Timer instead of performance counters.
+
 config X86_DECODER_SELFTEST
 	bool "x86 instruction decoder selftest"
 	depends on DEBUG_KERNEL && INSTRUCTION_DECODER
diff --git a/arch/x86/include/asm/hpet.h b/arch/x86/include/asm/hpet.h
index 5762bd0169a1..c88901744848 100644
--- a/arch/x86/include/asm/hpet.h
+++ b/arch/x86/include/asm/hpet.h
@@ -105,6 +105,8 @@ static inline int is_hpet_enabled(void) { return 0; }
 #endif
 
 #ifdef CONFIG_X86_HARDLOCKUP_DETECTOR_HPET
+#include <linux/cpumask.h>
+
 /**
  * struct hpet_hld_data - Data needed to operate the detector
  * @has_periodic:		The HPET channel supports periodic mode
@@ -112,6 +114,10 @@ static inline int is_hpet_enabled(void) { return 0; }
  * @channe_priv:		Private data of the assigned channel
  * @ticks_per_second:		Frequency of the HPET timer
  * @irq:			IRQ number assigned to the HPET channel
+ * @handling_cpu:		CPU handling the HPET interrupt
+ * @monitored_cpumask:		CPUs monitored by the hardlockup detector
+ * @inspect_cpumask:		CPUs that will be inspected at a given time.
+ *				Each CPU clears itself upon inspection.
  */
 struct hpet_hld_data {
 	bool			has_periodic;
@@ -119,10 +125,25 @@ struct hpet_hld_data {
 	struct hpet_channel	*channel_priv;
 	u64			ticks_per_second;
 	int			irq;
+	u32			handling_cpu;
+	cpumask_var_t		monitored_cpumask;
+	cpumask_var_t		inspect_cpumask;
 };
 
 extern struct hpet_hld_data *hpet_hld_get_timer(void);
 extern void hpet_hld_free_timer(struct hpet_hld_data *hdata);
+int hardlockup_detector_hpet_init(void);
+void hardlockup_detector_hpet_start(void);
+void hardlockup_detector_hpet_stop(void);
+void hardlockup_detector_hpet_enable(unsigned int cpu);
+void hardlockup_detector_hpet_disable(unsigned int cpu);
+#else
+static inline int hardlockup_detector_hpet_init(void)
+{ return -ENODEV; }
+static inline void hardlockup_detector_hpet_start(void) {}
+static inline void hardlockup_detector_hpet_stop(void) {}
+static inline void hardlockup_detector_hpet_enable(unsigned int cpu) {}
+static inline void hardlockup_detector_hpet_disable(unsigned int cpu) {}
 #endif /* CONFIG_X86_HARDLOCKUP_DETECTOR_HPET */
 
 #endif /* _ASM_X86_HPET_H */
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index dd61752f4c96..58eb858f33ff 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -109,6 +109,7 @@ obj-$(CONFIG_VM86)		+= vm86_32.o
 obj-$(CONFIG_EARLY_PRINTK)	+= early_printk.o
 
 obj-$(CONFIG_HPET_TIMER) 	+= hpet.o
+obj-$(CONFIG_X86_HARDLOCKUP_DETECTOR_HPET) += watchdog_hld_hpet.o
 
 obj-$(CONFIG_AMD_NB)		+= amd_nb.o
 obj-$(CONFIG_DEBUG_NMI_SELFTEST) += nmi_selftest.o
diff --git a/arch/x86/kernel/watchdog_hld_hpet.c b/arch/x86/kernel/watchdog_hld_hpet.c
new file mode 100644
index 000000000000..b583d3180ae0
--- /dev/null
+++ b/arch/x86/kernel/watchdog_hld_hpet.c
@@ -0,0 +1,380 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * A hardlockup detector driven by an HPET channel.
+ *
+ * Copyright (C) Intel Corporation 2023
+ *
+ * An HPET channel is reserved for the detector. The channel issues an NMI to
+ * one of the CPUs in @watchdog_allowed_mask. This CPU monitors itself for
+ * hardlockups and sends an NMI IPI to the rest of the CPUs in the system.
+ *
+ * The detector uses IPI shorthands. Thus, all CPUs in the system get the NMI
+ * (offline CPUs also get the NMI but they "ignore" it). A cpumask is used to
+ * specify whether a CPU must check for hardlockups.
+ *
+ * The NMI also disturbs isolated CPUs. The detector fails to initialize if
+ * tick_nohz_full is enabled.
+ */
+
+#define pr_fmt(fmt) "NMI hpet watchdog: " fmt
+
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/jump_label.h>
+#include <linux/nmi.h>
+#include <linux/printk.h>
+#include <linux/slab.h>
+#include <linux/tick.h>
+
+#include <asm/apic.h>
+#include <asm/hpet.h>
+#include <asm/nmi.h>
+#include <asm/tsc.h>
+
+#include "apic/local.h"
+
+static struct hpet_hld_data *hld_data;
+
+static void __init setup_hpet_channel(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	if (hdata->has_periodic)
+		v |= HPET_TN_PERIODIC;
+	else
+		v &= ~HPET_TN_PERIODIC;
+
+	/*
+	 * Use 32-bit mode to limit the number of register accesses. If we are
+	 * here the HPET frequency is sufficiently low to accommodate this mode.
+	 */
+	v |= HPET_TN_32BIT;
+
+	/* If we are here, FSB mode is supported. */
+	v |= HPET_TN_FSB;
+
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+}
+
+/**
+ * kick_timer() - Reprogram timer to expire in the future
+ * @hdata:	A data structure describing the HPET channel
+ * @force:	Force reprogramming
+ *
+ * Reprogram the timer to expire in watchdog_thresh seconds in the future.
+ * If the timer supports periodic mode, it is not kicked unless @force is
+ * true.
+ */
+static void kick_timer(struct hpet_hld_data *hdata, bool force)
+{
+	u64 new_compare, count, period = 0;
+
+	/* Kick the timer only when needed. */
+	if (!force && hdata->has_periodic)
+		return;
+
+	/*
+	 * Update the comparator in increments of watch_thresh seconds relative
+	 * to the current count. Since watch_thresh is given in seconds, we can
+	 * safely update the comparator before the counter reaches such new
+	 * value.
+	 *
+	 * Let it wrap around if needed.
+	 */
+
+	count = hpet_readl(HPET_COUNTER);
+	new_compare = count + watchdog_thresh * hdata->ticks_per_second;
+
+	if (!hdata->has_periodic) {
+		hpet_writel(new_compare, HPET_Tn_CMP(hdata->channel));
+		return;
+	}
+
+	period = watchdog_thresh * hdata->ticks_per_second;
+	hpet_set_comparator_periodic(hdata->channel, (u32)new_compare,
+				     (u32)period);
+}
+
+static void disable_timer(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	v &= ~HPET_TN_ENABLE;
+
+	/*
+	 * Prepare to flush out any outstanding interrupt. This can only be
+	 * done in level-triggered mode.
+	 */
+	v |= HPET_TN_LEVEL;
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+
+	/*
+	 * Even though we use the HPET channel in edge-triggered mode, hardware
+	 * seems to keep an outstanding interrupt and posts an MSI message when
+	 * making any change to it (e.g., enabling or setting to FSB mode).
+	 * Flush out the interrupt status bit of our channel.
+	 */
+	hpet_writel(1 << hdata->channel, HPET_STATUS);
+}
+
+static void enable_timer(struct hpet_hld_data *hdata)
+{
+	u32 v;
+
+	v = hpet_readl(HPET_Tn_CFG(hdata->channel));
+	v &= ~HPET_TN_LEVEL;
+	v |= HPET_TN_ENABLE;
+	hpet_writel(v, HPET_Tn_CFG(hdata->channel));
+}
+
+/**
+ * is_hpet_hld_interrupt() - Check if the HPET channel caused the interrupt
+ * @hdata:	A data structure describing the HPET channel
+ *
+ * Returns:
+ * True if the HPET watchdog timer caused the interrupt. False otherwise.
+ */
+static bool is_hpet_hld_interrupt(struct hpet_hld_data *hdata)
+{
+	return false;
+}
+
+/**
+ * hardlockup_detector_nmi_handler() - NMI Interrupt handler
+ * @type:	Type of NMI handler; not used.
+ * @regs:	Register values as seen when the NMI was asserted
+ *
+ * Check if our HPET channel caused the NMI. If yes, inspect for lockups by
+ * issuing an IPI to the rest of the CPUs. Also, kick the timer if it is
+ * non-periodic.
+ *
+ * Returns:
+ * NMI_DONE if the HPET timer did not cause the interrupt. NMI_HANDLED
+ * otherwise.
+ */
+static int hardlockup_detector_nmi_handler(unsigned int type,
+					   struct pt_regs *regs)
+{
+	struct hpet_hld_data *hdata = hld_data;
+	int cpu;
+
+	/*
+	 * The CPU handling the HPET NMI will land here and trigger the
+	 * inspection of hardlockups in the rest of the monitored
+	 * CPUs.
+	 */
+	if (is_hpet_hld_interrupt(hdata)) {
+		/*
+		 * Kick the timer first. If the HPET channel is periodic, it
+		 * helps to reduce the delta between the expected TSC value and
+		 * its actual value the next time the HPET channel fires.
+		 */
+		kick_timer(hdata, !(hdata->has_periodic));
+
+		if (cpumask_weight(hld_data->monitored_cpumask) > 1) {
+			/*
+			 * Since we cannot know the source of an NMI, the best
+			 * we can do is to use a flag to indicate to all online
+			 * CPUs that they will get an NMI and that the source of
+			 * that NMI is the hardlockup detector. Offline CPUs
+			 * also receive the NMI but they ignore it.
+			 */
+			cpumask_copy(hld_data->inspect_cpumask,
+				     cpu_online_mask);
+
+			/* If we are here, IPI shorthands are enabled. */
+			apic->send_IPI_allbutself(NMI_VECTOR);
+		}
+
+		inspect_for_hardlockups(regs);
+		return NMI_HANDLED;
+	}
+
+	/* The rest of the CPUs will land here after receiving the IPI. */
+	cpu = smp_processor_id();
+	if (cpumask_test_and_clear_cpu(cpu, hld_data->inspect_cpumask)) {
+		if (cpumask_test_cpu(cpu, hld_data->monitored_cpumask))
+			inspect_for_hardlockups(regs);
+
+		return NMI_HANDLED;
+	}
+
+	return NMI_DONE;
+}
+
+/**
+ * setup_hpet_irq() - Install the interrupt handler of the detector
+ * @data:	Data associated with the instance of the HPET channel
+ *
+ * Returns:
+ * 0 success. An error code if setup was unsuccessful.
+ */
+static int setup_hpet_irq(struct hpet_hld_data *hdata)
+{
+	int ret;
+
+	/*
+	 * hld_data::irq was configured to deliver the interrupt as
+	 * NMI. Thus, there is no need for a regular interrupt handler.
+	 */
+	ret = request_irq(hld_data->irq, no_action, IRQF_TIMER,
+			  "hpet_hld", hld_data);
+	if (ret)
+		return ret;
+
+	ret = register_nmi_handler(NMI_LOCAL,
+				   hardlockup_detector_nmi_handler, 0,
+				   "hpet_hld");
+	if (ret)
+		free_irq(hld_data->irq, hld_data);
+
+	return ret;
+}
+
+/**
+ * hardlockup_detector_hpet_enable() - Enable the hardlockup detector
+ * @cpu:	CPU Index in which the watchdog will be enabled.
+ *
+ * Enable the hardlockup detector in @cpu. Also, start the detector if not done
+ * before.
+ */
+void hardlockup_detector_hpet_enable(unsigned int cpu)
+{
+	cpumask_set_cpu(cpu, hld_data->monitored_cpumask);
+
+	/*
+	 * If this is the first CPU on which the detector is enabled, designate
+	 * @cpu as the handling CPU and start everything. The HPET channel is
+	 * disabled at this point.
+	 */
+	if (cpumask_weight(hld_data->monitored_cpumask) == 1) {
+		hld_data->handling_cpu = cpu;
+
+		if (irq_set_affinity(hld_data->irq,
+				     cpumask_of(hld_data->handling_cpu))) {
+			pr_warn_once("Failed to set affinity. Hardlockdup detector not started");
+			return;
+		}
+
+		kick_timer(hld_data, true);
+		enable_timer(hld_data);
+	}
+}
+
+/**
+ * hardlockup_detector_hpet_disable() - Disable the hardlockup detector
+ * @cpu:	CPU index in which the watchdog will be disabled
+ *
+ * Disable the hardlockup detector in @cpu. If @cpu is also handling the NMI
+ * from the HPET channel, update the affinity of the interrupt.
+ */
+void hardlockup_detector_hpet_disable(unsigned int cpu)
+{
+	cpumask_clear_cpu(cpu, hld_data->monitored_cpumask);
+
+	if (hld_data->handling_cpu != cpu)
+		return;
+
+	disable_timer(hld_data);
+	if (!cpumask_weight(hld_data->monitored_cpumask))
+		return;
+
+	/*
+	 * If watchdog_thresh is zero, then the hardlockup detector is being
+	 * disabled.
+	 */
+	if (!watchdog_thresh)
+		return;
+
+	hld_data->handling_cpu = cpumask_any_but(hld_data->monitored_cpumask,
+						 cpu);
+	/*
+	 * Only update the affinity of the HPET channel interrupt when
+	 * disabled.
+	 */
+	if (irq_set_affinity(hld_data->irq,
+			     cpumask_of(hld_data->handling_cpu))) {
+		pr_warn_once("Failed to set affinity. Hardlockdup detector stopped");
+		return;
+	}
+
+	enable_timer(hld_data);
+}
+
+void hardlockup_detector_hpet_stop(void)
+{
+	disable_timer(hld_data);
+}
+
+void hardlockup_detector_hpet_start(void)
+{
+	kick_timer(hld_data, true);
+	enable_timer(hld_data);
+}
+
+static const char hpet_hld_init_failed[] = "Initialization failed:";
+
+/**
+ * hardlockup_detector_hpet_init() - Initialize the hardlockup detector
+ *
+ * Only initialize and configure the detector if an HPET is available on the
+ * system, the TSC is stable, IPI shorthands are enabled, and there are no
+ * isolated CPUs.
+ *
+ * Returns:
+ * 0 success. An error code if initialization was unsuccessful.
+ */
+int __init hardlockup_detector_hpet_init(void)
+{
+	int ret;
+
+	if (!is_hpet_enabled()) {
+		pr_info("%s HPET unavailable\n", hpet_hld_init_failed);
+		return -ENODEV;
+	}
+
+	if (tick_nohz_full_enabled()) {
+		pr_info("%s nohz_full in use\n", hpet_hld_init_failed);
+		return -EPERM;
+	}
+
+	if (!static_branch_likely(&apic_use_ipi_shorthand)) {
+		pr_info("%s APIC IPI shorthands disabled\n", hpet_hld_init_failed);
+		return -ENODEV;
+	}
+
+	if (check_tsc_unstable())
+		return -ENODEV;
+
+	hld_data = hpet_hld_get_timer();
+	if (!hld_data)
+		return -ENODEV;
+
+	disable_timer(hld_data);
+
+	setup_hpet_channel(hld_data);
+
+	ret = setup_hpet_irq(hld_data);
+	if (ret)
+		goto err_no_irq;
+
+	if (!zalloc_cpumask_var(&hld_data->monitored_cpumask, GFP_KERNEL))
+		goto err_no_monitored_cpumask;
+
+	if (!zalloc_cpumask_var(&hld_data->inspect_cpumask, GFP_KERNEL))
+		goto err_no_inspect_cpumask;
+
+	return 0;
+
+err_no_inspect_cpumask:
+	free_cpumask_var(hld_data->monitored_cpumask);
+err_no_monitored_cpumask:
+	ret = -ENOMEM;
+err_no_irq:
+	hpet_hld_free_timer(hld_data);
+	hld_data = NULL;
+
+	return ret;
+}
-- 
2.25.1

