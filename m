Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3C373065
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 May 2021 21:09:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FZTsS4Shpz309k
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 May 2021 05:09:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linux.intel.com
 (client-ip=192.55.52.43; helo=mga05.intel.com;
 envelope-from=ricardo.neri-calderon@linux.intel.com; receiver=<UNKNOWN>)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FZTrm1x0Mz2yjP
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 May 2021 05:08:24 +1000 (AEST)
IronPort-SDR: MaCYvGzeq/bQUgMNJ3KqCJ0YmvFiflIDnTTfE0+bTFwZ6tS+Ea1fvrK/JXYOgUvABTnwMr4Lgk
 nO0MWtI1GRDg==
X-IronPort-AV: E=McAfee;i="6200,9189,9974"; a="283467378"
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="283467378"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2021 12:07:16 -0700
IronPort-SDR: gNJsucldsOQ2FPUAF1UlzuvVilb3EetqnfNfL/+zfyMHuqz399nCDE/jo0CcN3X8V77JBHZs6y
 A4TsAhzyouUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,272,1613462400"; d="scan'208";a="618591729"
Received: from ranerica-svr.sc.intel.com ([172.25.110.23])
 by fmsmga006.fm.intel.com with ESMTP; 04 May 2021 12:07:16 -0700
From: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@suse.de>
Subject: [RFC PATCH v5 05/16] watchdog/hardlockup: Decouple the hardlockup
 detector from perf
Date: Tue,  4 May 2021 12:05:15 -0700
Message-Id: <20210504190526.22347-6-ricardo.neri-calderon@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com>
References: <20210504190526.22347-1-ricardo.neri-calderon@linux.intel.com>
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
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>,
 Tony Luck <tony.luck@intel.com>, Ashok Raj <ashok.raj@intel.com>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Ricardo Neri <ricardo.neri-calderon@linux.intel.com>, x86@kernel.org,
 Ricardo Neri <ricardo.neri@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
 linux-kernel@vger.kernel.org, Andi Kleen <ak@linux.intel.com>,
 Stephane Eranian <eranian@google.com>,
 Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Andi Kleen <andi.kleen@intel.com>,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The current default implementation of the hardlockup detector assumes that
it is implemented using perf events. However, the hardlockup detector can
be driven by other sources of non-maskable interrupts (e.g., a properly
configured timer).

Group and wrap in #ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF all the code
specific to perf: create and manage perf events, stop and start the perf-
based detector.

The generic portion of the detector (monitor the timers' thresholds, check
timestamps and detect hardlockups as well as the implementation of
arch_touch_nmi_watchdog()) is now selected with the new intermediate config
symbol CONFIG_HARDLOCKUP_DETECTOR_CORE.

The perf-based implementation of the detector selects the new intermediate
symbol. Other implementations should do the same.

Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ashok Raj <ashok.raj@intel.com>
Cc: Andi Kleen <andi.kleen@intel.com>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Nicholas Piggin <npiggin@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Stephane Eranian <eranian@google.com>
Cc: Suravee Suthikulpanit <Suravee.Suthikulpanit@amd.com>
Cc: "Ravi V. Shankar" <ravi.v.shankar@intel.com>
Cc: x86@kernel.org
Cc: linuxppc-dev@lists.ozlabs.org
Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
---
Changes since v4:
 * None

Changes since v3:
 * Squashed into this patch a previous patch to make
   arch_touch_nmi_watchdog() part of the core detector code.

Changes since v2:
 * Undid split of the generic hardlockup detector into a separate file.
   (Thomas Gleixner)
 * Added a new intermediate symbol CONFIG_HARDLOCKUP_DETECTOR_CORE to
   select generic parts of the detector (Paul E. McKenney,
   Thomas Gleixner).

Changes since v1:
 * Make the generic detector code with CONFIG_HARDLOCKUP_DETECTOR.
---
 include/linux/nmi.h   |  5 ++++-
 kernel/Makefile       |  2 +-
 kernel/watchdog_hld.c | 32 ++++++++++++++++++++------------
 lib/Kconfig.debug     |  4 ++++
 4 files changed, 29 insertions(+), 14 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 1b68f48ad440..cf12380e51b3 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -94,8 +94,11 @@ static inline void hardlockup_detector_disable(void) {}
 # define NMI_WATCHDOG_SYSCTL_PERM	0444
 #endif
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_CORE)
 extern void arch_touch_nmi_watchdog(void);
+#endif
+
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_detector_perf_disable(void);
diff --git a/kernel/Makefile b/kernel/Makefile
index e8a6715f38dc..03ac041abfff 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
-obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_hld.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_CORE) += watchdog_hld.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
 obj-$(CONFIG_SYSCTL) += utsname_sysctl.o
diff --git a/kernel/watchdog_hld.c b/kernel/watchdog_hld.c
index b352e507b17f..bb6435978c46 100644
--- a/kernel/watchdog_hld.c
+++ b/kernel/watchdog_hld.c
@@ -22,12 +22,8 @@
 
 static DEFINE_PER_CPU(bool, hard_watchdog_warn);
 static DEFINE_PER_CPU(bool, watchdog_nmi_touch);
-static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
-static DEFINE_PER_CPU(struct perf_event *, dead_event);
-static struct cpumask dead_events_mask;
 
 static unsigned long hardlockup_allcpu_dumped;
-static atomic_t watchdog_cpus = ATOMIC_INIT(0);
 
 notrace void arch_touch_nmi_watchdog(void)
 {
@@ -98,14 +94,6 @@ static inline bool watchdog_check_timestamp(void)
 }
 #endif
 
-static struct perf_event_attr wd_hw_attr = {
-	.type		= PERF_TYPE_HARDWARE,
-	.config		= PERF_COUNT_HW_CPU_CYCLES,
-	.size		= sizeof(struct perf_event_attr),
-	.pinned		= 1,
-	.disabled	= 1,
-};
-
 void inspect_for_hardlockups(struct pt_regs *regs)
 {
 	if (__this_cpu_read(watchdog_nmi_touch) == true) {
@@ -157,6 +145,24 @@ void inspect_for_hardlockups(struct pt_regs *regs)
 	return;
 }
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_PERF
+#undef pr_fmt
+#define pr_fmt(fmt) "NMI perf watchdog: " fmt
+
+static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
+static DEFINE_PER_CPU(struct perf_event *, dead_event);
+static struct cpumask dead_events_mask;
+
+static atomic_t watchdog_cpus = ATOMIC_INIT(0);
+
+static struct perf_event_attr wd_hw_attr = {
+	.type		= PERF_TYPE_HARDWARE,
+	.config		= PERF_COUNT_HW_CPU_CYCLES,
+	.size		= sizeof(struct perf_event_attr),
+	.pinned		= 1,
+	.disabled	= 1,
+};
+
 /* Callback function for perf event subsystem */
 static void watchdog_overflow_callback(struct perf_event *event,
 				       struct perf_sample_data *data,
@@ -298,3 +304,5 @@ int __init hardlockup_detector_perf_init(void)
 	}
 	return ret;
 }
+
+#endif /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 5918e1686736..08332b5ad4fe 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1021,9 +1021,13 @@ config BOOTPARAM_SOFTLOCKUP_PANIC_VALUE
 	default 0 if !BOOTPARAM_SOFTLOCKUP_PANIC
 	default 1 if BOOTPARAM_SOFTLOCKUP_PANIC
 
+config HARDLOCKUP_DETECTOR_CORE
+	bool
+
 config HARDLOCKUP_DETECTOR_PERF
 	bool
 	select SOFTLOCKUP_DETECTOR
+	select HARDLOCKUP_DETECTOR_CORE
 
 #
 # Enables a timestamp based low pass filter to compensate for perf based
-- 
2.17.1

