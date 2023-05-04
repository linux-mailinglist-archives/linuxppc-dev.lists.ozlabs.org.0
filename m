Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2822D6F7928
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:30:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7my0PvGz3ffG
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:30:26 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GrXsJ9B6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=GrXsJ9B6;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7Rv0yVBz3bck
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:15:39 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6436e004954so1216409b3a.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238537; x=1685830537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rx1vfeyE3TRvVHLtc8wjeQXsVXDN6U5WvEYHnvnsZiQ=;
        b=GrXsJ9B6lpVddvHVF4LE//sAxHKEwPqS+Lrmy5FZm5C+BBxcMf/KBnQ2Kz0ToqXupC
         stkOTuW3TG4O8WK+889znwTdd4mpmXVLRAtVy4QbnUMBEfL9e2VkXE8ZF2uB8RqfGrwM
         V5WHNLrECfzPUJD69+fwMyXpFWfAfGK902akM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238537; x=1685830537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Rx1vfeyE3TRvVHLtc8wjeQXsVXDN6U5WvEYHnvnsZiQ=;
        b=CXfbqHj01QD2SBHOG/TGvqzCPcXi/1uqScM5Vqgw9HgL4wrUBPEu6vgljttSQIOlbu
         NY7/aqHnlZcpFTvr1R/Jko5fF7dZHZApFwgBDVzZt9lpWUgK072tOdxOpEmCP9TfISKX
         Zkiv45+GJcnJqjimBNLQMd1VUJ/jm+wD6EBENGTt0RTGY2muE7aHG3VZXItV7XUNwR9G
         VX251cVLti60TbKglLOBekkolXtcBUVoZF+5LsFQ3nC5myFyTbVS2Yp96JJ7Mi1jLR1d
         oZuC4bSN1tQlWxppVyqlLYpofEsVB6AzuCaumxWsrKSgXY260mZWQu/ebFwFmjz2i9ug
         ccAw==
X-Gm-Message-State: AC+VfDyr95dv79ZLwTyh2KVhIG+u6xtIJjxXKxaHsQEoY7EjRM80+kC2
	2LN4PGeNz+HPcwjCSRSSxZVoGw==
X-Google-Smtp-Source: ACHHUZ5OyqHQkkk5eV4OQnbvYXBWIDTEw9i7oDzC+q4tZkWV0tXI752A7bILgADyxN7Wq0liTZgOEg==
X-Received: by 2002:a05:6a00:23d0:b0:639:9089:798e with SMTP id g16-20020a056a0023d000b006399089798emr4377726pfc.19.1683238537495;
        Thu, 04 May 2023 15:15:37 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:15:36 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 17/17] arm64: Enable perf events based hard lockup detector
Date: Thu,  4 May 2023 15:13:49 -0700
Message-ID: <20230504151100.v4.17.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
X-Mailer: git-send-email 2.40.1.521.gf1e218fcd8-goog
In-Reply-To: <20230504221349.1535669-1-dianders@chromium.org>
References: <20230504221349.1535669-1-dianders@chromium.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, Douglas Anderson <dianders@chromium.org>, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

With the recent feature added to enable perf events to use pseudo NMIs
as interrupts on platforms which support GICv3 or later, its now been
possible to enable hard lockup detector (or NMI watchdog) on arm64
platforms. So enable corresponding support.

One thing to note here is that normally lockup detector is initialized
just after the early initcalls but PMU on arm64 comes up much later as
device_initcall(). To cope with that, override
arch_perf_nmi_is_available() to let the watchdog framework know PMU
not ready, and inform the framework to re-initialize lockup detection
once PMU has been initialized.

Co-developed-by: Sumit Garg <sumit.garg@linaro.org>
Signed-off-by: Sumit Garg <sumit.garg@linaro.org>
Co-developed-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Pingfan Liu <kernelfans@gmail.com>
Signed-off-by: Lecopzer Chen <lecopzer.chen@mediatek.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
I yanked this patch from the mailing lists [1] into my series just to
make it easier to avoid conflicts between my series and the one adding
the arm64 perf hardlockup detector, in case someone wanted to test
them both together.

As part of making this match with my series, I needed to resolve
conflicts with the patch ("watchdog/hardlockup: Have the perf
hardlockup use __weak functions more cleanly"). This makes ${SUBJECT}
patch now depend on the patch ("watchdog/perf: Add a weak function for
an arch to detect if perf can use NMIs"). As talked about in that
patch, there may be better alternatives to accomplish the same thing.

As mentioned in the cover letter, I'm not really expecting this patch
to land together with the patches for the buddy detector. I included
it with my series simply for convenience of testing both series
together.

NOTE: the previous patch posted by Lecopzer pointed to Sumit's
patch [2] in the commit text but provided no context. I moved it to
this "after the cut" note.

[1] https://lore.kernel.org/r/20220903093415.15850-7-lecopzer.chen@mediatek.com/
[2] http://lore.kernel.org/linux-arm-kernel/1610712101-14929-1-git-send-email-sumit.garg@linaro.org

Changes in v4:
- Pulled ("Enable perf events based hard ...") into my series for v4.

 arch/arm64/Kconfig               |  2 ++
 arch/arm64/kernel/perf_event.c   | 12 ++++++++++--
 arch/arm64/kernel/watchdog_hld.c | 12 ++++++++++++
 drivers/perf/arm_pmu.c           |  5 +++++
 include/linux/perf/arm_pmu.h     |  2 ++
 5 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 1023e896d46b..4ee9f3a7bc7a 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -197,12 +197,14 @@ config ARM64
 	select HAVE_FUNCTION_ERROR_INJECTION
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_GCC_PLUGINS
+	select HAVE_HARDLOCKUP_DETECTOR_PERF if PERF_EVENTS && HAVE_PERF_EVENTS_NMI
 	select HAVE_HW_BREAKPOINT if PERF_EVENTS
 	select HAVE_IOREMAP_PROT
 	select HAVE_IRQ_TIME_ACCOUNTING
 	select HAVE_KVM
 	select HAVE_NMI
 	select HAVE_PERF_EVENTS
+	select HAVE_PERF_EVENTS_NMI if ARM64_PSEUDO_NMI
 	select HAVE_PERF_REGS
 	select HAVE_PERF_USER_STACK_DUMP
 	select HAVE_PREEMPT_DYNAMIC_KEY
diff --git a/arch/arm64/kernel/perf_event.c b/arch/arm64/kernel/perf_event.c
index dde06c0f97f3..732bc5d76cb1 100644
--- a/arch/arm64/kernel/perf_event.c
+++ b/arch/arm64/kernel/perf_event.c
@@ -23,6 +23,7 @@
 #include <linux/platform_device.h>
 #include <linux/sched_clock.h>
 #include <linux/smp.h>
+#include <linux/nmi.h>
 
 /* ARMv8 Cortex-A53 specific event types. */
 #define ARMV8_A53_PERFCTR_PREF_LINEFILL				0xC2
@@ -1396,10 +1397,17 @@ static struct platform_driver armv8_pmu_driver = {
 
 static int __init armv8_pmu_driver_init(void)
 {
+	int ret;
+
 	if (acpi_disabled)
-		return platform_driver_register(&armv8_pmu_driver);
+		ret = platform_driver_register(&armv8_pmu_driver);
 	else
-		return arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+		ret = arm_pmu_acpi_probe(armv8_pmuv3_pmu_init);
+
+	if (!ret)
+		lockup_detector_retry_init();
+
+	return ret;
 }
 device_initcall(armv8_pmu_driver_init)
 
diff --git a/arch/arm64/kernel/watchdog_hld.c b/arch/arm64/kernel/watchdog_hld.c
index 2401eb1b7e55..dcd25322127c 100644
--- a/arch/arm64/kernel/watchdog_hld.c
+++ b/arch/arm64/kernel/watchdog_hld.c
@@ -1,5 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/nmi.h>
 #include <linux/cpufreq.h>
+#include <linux/perf/arm_pmu.h>
 
 /*
  * Safe maximum CPU frequency in case a particular platform doesn't implement
@@ -22,3 +24,13 @@ u64 hw_nmi_get_sample_period(int watchdog_thresh)
 
 	return (u64)max_cpu_freq * watchdog_thresh;
 }
+
+bool __init arch_perf_nmi_is_available(void)
+{
+	/*
+	 * hardlockup_detector_perf_init() will success even if Pseudo-NMI turns off,
+	 * however, the pmu interrupts will act like a normal interrupt instead of
+	 * NMI and the hardlockup detector would be broken.
+	 */
+	return arm_pmu_irq_is_nmi();
+}
diff --git a/drivers/perf/arm_pmu.c b/drivers/perf/arm_pmu.c
index 15bd1e34a88e..7b9caa502d33 100644
--- a/drivers/perf/arm_pmu.c
+++ b/drivers/perf/arm_pmu.c
@@ -687,6 +687,11 @@ static int armpmu_get_cpu_irq(struct arm_pmu *pmu, int cpu)
 	return per_cpu(hw_events->irq, cpu);
 }
 
+bool arm_pmu_irq_is_nmi(void)
+{
+	return has_nmi;
+}
+
 /*
  * PMU hardware loses all context when a CPU goes offline.
  * When a CPU is hotplugged back in, since some hardware registers are
diff --git a/include/linux/perf/arm_pmu.h b/include/linux/perf/arm_pmu.h
index 525b5d64e394..5b00f5cb4cf9 100644
--- a/include/linux/perf/arm_pmu.h
+++ b/include/linux/perf/arm_pmu.h
@@ -171,6 +171,8 @@ void kvm_host_pmu_init(struct arm_pmu *pmu);
 #define kvm_host_pmu_init(x)	do { } while(0)
 #endif
 
+bool arm_pmu_irq_is_nmi(void);
+
 /* Internal functions only for core arm_pmu code */
 struct arm_pmu *armpmu_alloc(void);
 void armpmu_free(struct arm_pmu *pmu);
-- 
2.40.1.521.gf1e218fcd8-goog

