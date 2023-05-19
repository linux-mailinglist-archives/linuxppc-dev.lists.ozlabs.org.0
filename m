Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AF4709E32
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:33:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDT20h7Cz3fWM
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:33:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E49O1uKG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::529; helo=mail-pg1-x529.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=E49O1uKG;
	dkim-atps=neutral
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDCQ5XrQz3fLv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:22 +1000 (AEST)
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-53487355877so900801a12.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516881; x=1687108881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hpnag6YnpSGLwy0bb7G0uY/iCTH+Q9cc41aTIxHCk28=;
        b=E49O1uKGpuLyETIliABY3+LO9EDYfuBAIsyrzovLCiFncI58+zXjWgjdrSdSPzwvZb
         eRKdCFZ9R4lGuPSKon8K4D2PUTyX4hMCu+F1uK7cvNjFd48Htp/w55iHcMHgI6A69XpQ
         XL4uks+h4rCw1buzIIvzVwDO2n9G98eVvotXI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516881; x=1687108881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hpnag6YnpSGLwy0bb7G0uY/iCTH+Q9cc41aTIxHCk28=;
        b=bDj6Z5qFyzZENJteuZ0cD6psP2bQmXnFjRk8wJip/2Xp3txRKkddZN7xDWDQHR/SMD
         0HKjhTBux2mchIr21NjLSXQ7RPMilgW3unhPVDATpqSL3cGMGNfSWuRceMgpxu5oQL5F
         +XsXHiX5v3zE6mrtw49HI7nhp/E9sMG8NXoBz/fw/BAoNYNpMD+o50Vn20TMM4Pe5tnz
         V+ZEkmZkYSs4GT7mTinbkMQrQ66JGbEMkz67YyCdG4uOtKOjtry/4TF6JNJ0OOKOSpF9
         4i4gsnPt0IOUbt5Eg7r2Vq1G6LiuYLPBwzs1jWthS7Rpz7WCHgXSgZV6OSzNUpbC0kb7
         ldeg==
X-Gm-Message-State: AC+VfDzKuDrs7HiCFwXIRbSqRF6Z1BqwiHrO0HftlrrCBdVf9Zt6Aleg
	LaOQSbUkcapdnH6ZslHC9MVTjQ==
X-Google-Smtp-Source: ACHHUZ5CKXvFwn+jE1jHDx6ehyciZhxVDO+Ozlwr5VRGUX1fBjcgOvLOKyQcApVcizpxdrATYmHPSQ==
X-Received: by 2002:a17:90b:164a:b0:246:8497:37c5 with SMTP id il10-20020a17090b164a00b00246849737c5mr2770211pjb.46.1684516881015;
        Fri, 19 May 2023 10:21:21 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:20 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 14/18] watchdog/hardlockup: detect hard lockups using secondary (buddy) CPUs
Date: Fri, 19 May 2023 10:18:38 -0700
Message-ID: <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
X-Mailer: git-send-email 2.40.1.698.g37aff9b760-goog
In-Reply-To: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.k
 ernel.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Implement a hardlockup detector that doesn't doesn't need any extra
arch-specific support code to detect lockups. Instead of using
something arch-specific we will use the buddy system, where each CPU
watches out for another one. Specifically, each CPU will use its
softlockup hrtimer to check that the next CPU is processing hrtimer
interrupts by verifying that a counter is increasing.

NOTE: unlike the other hard lockup detectors, the buddy one can't
easily show what's happening on the CPU that locked up just by doing a
simple backtrace. It relies on some other mechanism in the system to
get information about the locked up CPUs. This could be support for
NMI backtraces like [1], it could be a mechanism for printing the PC
of locked CPUs at panic time like [2] / [3], or it could be something
else. Even though that means we still rely on arch-specific code, this
arch-specific code seems to often be implemented even on architectures
that don't have a hardlockup detector.

This style of hardlockup detector originated in some downstream
Android trees and has been rebased on / carried in ChromeOS trees for
quite a long time for use on arm and arm64 boards. Historically on
these boards we've leveraged mechanism [2] / [3] to get information
about hung CPUs, but we could move to [1].

Although the original motivation for the buddy system was for use on
systems without an arch-specific hardlockup detector, it can still be
useful to use even on systems that _do_ have an arch-specific
hardlockup detector. On x86, for instance, there is a 24-part patch
series [4] in progress switching the arch-specific hard lockup
detector from a scarce perf counter to a less-scarce hardware
resource. Potentially the buddy system could be a simpler alternative
to free up the perf counter but still get hard lockup detection.

Overall, pros (+) and cons (-) of the buddy system compared to an
arch-specific hardlockup detector (which might be implemented using
perf):
+ The buddy system is usable on systems that don't have an
  arch-specific hardlockup detector, like arm32 and arm64 (though it's
  being worked on for arm64 [5]).
+ The buddy system may free up scarce hardware resources.
+ If a CPU totally goes out to lunch (can't process NMIs) the buddy
  system could still detect the problem (though it would be unlikely
  to be able to get a stack trace).
+ The buddy system uses the same timer function to pet the hardlockup
  detector on the running CPU as it uses to detect hardlockups on
  other CPUs. Compared to other hardlockup detectors, this means it
  generates fewer interrupts and thus is likely better able to let
  CPUs stay idle longer.
- If all CPUs are hard locked up at the same time the buddy system
  can't detect it.
- If we don't have SMP we can't use the buddy system.
- The buddy system needs an arch-specific mechanism (possibly NMI
  backtrace) to get info about the locked up CPU.

[1] https://lore.kernel.org/r/20230419225604.21204-1-dianders@chromium.org
[2] https://issuetracker.google.com/172213129
[3] https://docs.kernel.org/trace/coresight/coresight-cpu-debug.html
[4] https://lore.kernel.org/lkml/20230301234753.28582-1-ricardo.neri-calderon@linux.intel.com/
[5] https://lore.kernel.org/linux-arm-kernel/20220903093415.15850-1-lecopzer.chen@mediatek.com/

Signed-off-by: Colin Cross <ccross@android.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Signed-off-by: Guenter Roeck <groeck@chromium.org>
Signed-off-by: Tzung-Bi Shih <tzungbi@chromium.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
This patch has been rebased in ChromeOS kernel trees many times, and
each time someone had to do work on it they added their
Signed-off-by. I've included those here. I've also left the author as
Colin Cross since the core code is still his, even if it's now been
reorganized a lot.

(no changes since v4)

Changes in v4:
- Reworked atop a whole pile of cleanups, as suggested by Petr.

Changes in v3:
- Added a note in commit message about the effect on idle.
- Cleaned up commit message pros/cons to be complete sentences.
- More cpu => CPU (in Kconfig and comments).
- No code changes other than comments.

Changes in v2:
- No code changes.
- Reworked description and Kconfig based on v1 discussion.
- cpu => CPU (in commit message).

 include/linux/nmi.h     |  9 +++-
 kernel/Makefile         |  1 +
 kernel/watchdog.c       | 29 +++++++++----
 kernel/watchdog_buddy.c | 93 +++++++++++++++++++++++++++++++++++++++++
 lib/Kconfig.debug       | 52 +++++++++++++++++++++--
 5 files changed, 173 insertions(+), 11 deletions(-)
 create mode 100644 kernel/watchdog_buddy.c

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index c216e8a1be1f..47db14e7da52 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -87,8 +87,9 @@ extern unsigned int hardlockup_panic;
 static inline void hardlockup_detector_disable(void) {}
 #endif
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 void arch_touch_nmi_watchdog(void);
+void watchdog_hardlockup_touch_cpu(unsigned int cpu);
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #elif !defined(CONFIG_HAVE_NMI_WATCHDOG)
 static inline void arch_touch_nmi_watchdog(void) { }
@@ -118,6 +119,12 @@ void watchdog_hardlockup_disable(unsigned int cpu);
 
 void lockup_detector_reconfigure(void);
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_BUDDY
+void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts);
+#else
+static inline void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts) {}
+#endif
+
 /**
  * touch_nmi_watchdog - manually pet the hardlockup watchdog.
  *
diff --git a/kernel/Makefile b/kernel/Makefile
index 7eb72033143c..f9e3fd9195d9 100644
--- a/kernel/Makefile
+++ b/kernel/Makefile
@@ -91,6 +91,7 @@ obj-$(CONFIG_FAIL_FUNCTION) += fail_function.o
 obj-$(CONFIG_KGDB) += debug/
 obj-$(CONFIG_DETECT_HUNG_TASK) += hung_task.o
 obj-$(CONFIG_LOCKUP_DETECTOR) += watchdog.o
+obj-$(CONFIG_HARDLOCKUP_DETECTOR_BUDDY) += watchdog_buddy.o
 obj-$(CONFIG_HARDLOCKUP_DETECTOR_PERF) += watchdog_perf.o
 obj-$(CONFIG_SECCOMP) += seccomp.o
 obj-$(CONFIG_RELAY) += relay.o
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 08ce046f636d..4110f7ca23a5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -85,7 +85,7 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 #endif /* CONFIG_HARDLOCKUP_DETECTOR */
 
-#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
 
 static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
 static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
@@ -106,6 +106,14 @@ notrace void arch_touch_nmi_watchdog(void)
 }
 EXPORT_SYMBOL(arch_touch_nmi_watchdog);
 
+void watchdog_hardlockup_touch_cpu(unsigned int cpu)
+{
+	per_cpu(watchdog_hardlockup_touched, cpu) = true;
+
+	/* Match with smp_rmb() in watchdog_hardlockup_check() */
+	smp_wmb();
+}
+
 static bool is_hardlockup(unsigned int cpu)
 {
 	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
@@ -123,13 +131,16 @@ static bool is_hardlockup(unsigned int cpu)
 	return false;
 }
 
-static void watchdog_hardlockup_kick(void)
+static unsigned long watchdog_hardlockup_kick(void)
 {
-	atomic_inc(raw_cpu_ptr(&hrtimer_interrupts));
+	return atomic_inc_return(raw_cpu_ptr(&hrtimer_interrupts));
 }
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	/* Match with smp_wmb() in watchdog_hardlockup_touch_cpu() */
+	smp_rmb();
+
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
 		return;
@@ -180,11 +191,11 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	}
 }
 
-#else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
+#else /* CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
-static inline void watchdog_hardlockup_kick(void) { }
+static inline unsigned long watchdog_hardlockup_kick(void) { return 0; }
 
-#endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
+#endif /* !CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */
 
 /*
  * These functions can be overridden based on the configured hardlockdup detector.
@@ -443,11 +454,15 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
 	struct pt_regs *regs = get_irq_regs();
 	int duration;
 	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
+	unsigned long hrtimer_interrupts;
 
 	if (!watchdog_enabled)
 		return HRTIMER_NORESTART;
 
-	watchdog_hardlockup_kick();
+	hrtimer_interrupts = watchdog_hardlockup_kick();
+
+	/* test for hardlockups */
+	watchdog_buddy_check_hardlockup(hrtimer_interrupts);
 
 	/* kick the softlockup detector */
 	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
new file mode 100644
index 000000000000..fee45af2e5bd
--- /dev/null
+++ b/kernel/watchdog_buddy.c
@@ -0,0 +1,93 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/kernel.h>
+#include <linux/nmi.h>
+#include <linux/percpu-defs.h>
+
+static cpumask_t __read_mostly watchdog_cpus;
+
+static unsigned int watchdog_next_cpu(unsigned int cpu)
+{
+	cpumask_t cpus = watchdog_cpus;
+	unsigned int next_cpu;
+
+	next_cpu = cpumask_next(cpu, &cpus);
+	if (next_cpu >= nr_cpu_ids)
+		next_cpu = cpumask_first(&cpus);
+
+	if (next_cpu == cpu)
+		return nr_cpu_ids;
+
+	return next_cpu;
+}
+
+int __init watchdog_hardlockup_probe(void)
+{
+	return 0;
+}
+
+void watchdog_hardlockup_enable(unsigned int cpu)
+{
+	unsigned int next_cpu;
+
+	/*
+	 * The new CPU will be marked online before the hrtimer interrupt
+	 * gets a chance to run on it. If another CPU tests for a
+	 * hardlockup on the new CPU before it has run its the hrtimer
+	 * interrupt, it will get a false positive. Touch the watchdog on
+	 * the new CPU to delay the check for at least 3 sampling periods
+	 * to guarantee one hrtimer has run on the new CPU.
+	 */
+	watchdog_hardlockup_touch_cpu(cpu);
+
+	/*
+	 * We are going to check the next CPU. Our watchdog_hrtimer
+	 * need not be zero if the CPU has already been online earlier.
+	 * Touch the watchdog on the next CPU to avoid false positive
+	 * if we try to check it in less then 3 interrupts.
+	 */
+	next_cpu = watchdog_next_cpu(cpu);
+	if (next_cpu < nr_cpu_ids)
+		watchdog_hardlockup_touch_cpu(next_cpu);
+
+	cpumask_set_cpu(cpu, &watchdog_cpus);
+}
+
+void watchdog_hardlockup_disable(unsigned int cpu)
+{
+	unsigned int next_cpu = watchdog_next_cpu(cpu);
+
+	/*
+	 * Offlining this CPU will cause the CPU before this one to start
+	 * checking the one after this one. If this CPU just finished checking
+	 * the next CPU and updating hrtimer_interrupts_saved, and then the
+	 * previous CPU checks it within one sample period, it will trigger a
+	 * false positive. Touch the watchdog on the next CPU to prevent it.
+	 */
+	if (next_cpu < nr_cpu_ids)
+		watchdog_hardlockup_touch_cpu(next_cpu);
+
+	cpumask_clear_cpu(cpu, &watchdog_cpus);
+}
+
+void watchdog_buddy_check_hardlockup(unsigned long hrtimer_interrupts)
+{
+	unsigned int next_cpu;
+
+	/*
+	 * Test for hardlockups every 3 samples. The sample period is
+	 *  watchdog_thresh * 2 / 5, so 3 samples gets us back to slightly over
+	 *  watchdog_thresh (over by 20%).
+	 */
+	if (hrtimer_interrupts % 3 != 0)
+		return;
+
+	/* check for a hardlockup on the next CPU */
+	next_cpu = watchdog_next_cpu(smp_processor_id());
+	if (next_cpu >= nr_cpu_ids)
+		return;
+
+	watchdog_hardlockup_check(next_cpu, NULL);
+}
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index ce51d4dc6803..abcad0513a32 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1035,10 +1035,55 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
 
 	  Say N if unsure.
 
-config HARDLOCKUP_DETECTOR_PERF
+# Both the "perf" and "buddy" hardlockup detectors count hrtimer
+# interrupts. This config enables functions managing this common code.
+config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
 	bool
 	select SOFTLOCKUP_DETECTOR
 
+config HARDLOCKUP_DETECTOR_PERF
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
+	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+
+config HARDLOCKUP_DETECTOR_BUDDY
+	bool
+	depends on SMP
+	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+
+# For hardlockup detectors you can have one directly provided by the arch
+# or use a "non-arch" one. If you're using a "non-arch" one that is
+# further divided the perf hardlockup detector (which, confusingly, needs
+# arch-provided perf support) and the buddy hardlockup detector (which just
+# needs SMP). In either case, using the "non-arch" code conflicts with
+# the NMI watchdog code (which is sometimes used directly and sometimes used
+# by the arch-provided hardlockup detector).
+config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	bool
+	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
+	default y
+
+config HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	bool "Prefer the buddy CPU hardlockup detector"
+	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP
+	help
+	  Say Y here to prefer the buddy hardlockup detector over the perf one.
+
+	  With the buddy detector, each CPU uses its softlockup hrtimer
+	  to check that the next CPU is processing hrtimer interrupts by
+	  verifying that a counter is increasing.
+
+	  This hardlockup detector is useful on systems that don't have
+	  an arch-specific hardlockup detector or if resources needed
+	  for the hardlockup detector are better used for other things.
+
+# This will select the appropriate non-arch hardlockdup detector
+config HARDLOCKUP_DETECTOR_NON_ARCH
+	bool
+	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
+	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
+
 #
 # Enables a timestamp based low pass filter to compensate for perf based
 # hard lockup detection which runs too fast due to turbo modes.
@@ -1053,9 +1098,10 @@ config HARDLOCKUP_CHECK_TIMESTAMP
 config HARDLOCKUP_DETECTOR
 	bool "Detect Hard Lockups"
 	depends on DEBUG_KERNEL && !S390
-	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
+	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
 	select LOCKUP_DETECTOR
-	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
+	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
+
 	help
 	  Say Y here to enable the kernel to act as a watchdog to detect
 	  hard lockups.
-- 
2.40.1.698.g37aff9b760-goog

