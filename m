Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9567A709E20
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:30:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDQ53YfYz3fPN
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:30:37 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CX33eL4G;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=CX33eL4G;
	dkim-atps=neutral
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDCF2PBBz3fFX
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:13 +1000 (AEST)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1ae3a5dfa42so25728185ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516871; x=1687108871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=;
        b=CX33eL4GdlRvEhb7MRrK0HcpGqL14uaialqiwAf8d9nqYwj101HteFwTQXh3a2ruOf
         lhf5cbylszXdV2cL38Sy9TAJNoiBIz9POYMeDG2sKqgFReGRdJWhtFAIAZWTFwMsot5m
         qhaAjIgBIvHfv42zEE37qt4WUUod5wAV5uRIY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516871; x=1687108871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IuTIR6+6K+hxxUnbYOqT244lVUkQITd3O6ucqubZZl4=;
        b=E4vFX885gLlnY6JzxUOK9ehfjh8g833GKHvH2ubd9gmaxY2iG+VZAsh5scHLY1PxXh
         Y+w6Si/6b+qwLqkEY4ttpZSpInsaguTogYjWcNg6ZxCK0/jRkrP8nFURybzcP34IovYS
         ChO0vDsaJbjOkFaKP+Da27p/YBDYAkwFuEhMu+d2OnSFzDBP46EnzDKtRF3Zf3p4zdAB
         j+9DilZVPrcwhydI0wClk3eODYWCt5HQSN7O4OrKGJldjKkpqDvtbfJKGrS/vGklQRLx
         m+uOYZR3FBJ1O8MH76v0mBBhVIU+BA2sZVwFKWO9xJriYqooBQXOF9MlOTH4bXHGzfql
         m9Gw==
X-Gm-Message-State: AC+VfDyRYihGSne9qoQ4gEKH7n6wgzndeLfSNmSkhJuCv832mp9407bD
	TuLkiJJthW3prKOpVLOdvWywHA==
X-Google-Smtp-Source: ACHHUZ6ZU/Zv+5uWQsHIPpE4gUjVmcZg9+Jv3yXZssM4t7jGD7GgABZwIzSWfBu1QwcX6vPL39vSYQ==
X-Received: by 2002:a17:902:c945:b0:1a9:546c:1593 with SMTP id i5-20020a170902c94500b001a9546c1593mr4356324pla.14.1684516871096;
        Fri, 19 May 2023 10:21:11 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:10 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 11/18] watchdog/hardlockup: Move perf hardlockup watchdog petting to watchdog.c
Date: Fri, 19 May 2023 10:18:35 -0700
Message-ID: <20230519101840.v5.11.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, Douglas Anderson <dianders@chromium.org>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linuxppc-dev@lists.ozla
 bs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

In preparation for the buddy hardlockup detector, which wants the same
petting logic as the current perf hardlockup detector, move the code
to watchdog.c. While doing this, rename the global variable to match
others nearby. As part of this change we have to change the code to
account for the fact that the CPU we're running on might be different
than the one we're checking.

Currently the code in watchdog.c is guarded by
CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
silly. However, a future patch will change this.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Fixed wrong __this_cpu to per_cpu (oops).
- Move side effect (timestamp check ordering) to its own patch.
- watchdog_hardlockup_touch => watchdog_hardlockup_touched.

Changes in v4:
- ("Move perf hardlockup watchdog petting to watchdog.c") new for v4.

 include/linux/nmi.h    |  5 +++--
 kernel/watchdog.c      | 19 +++++++++++++++++++
 kernel/watchdog_perf.c | 19 -------------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 92aa568c0c42..e286a2a1902d 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -88,7 +88,10 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
+void arch_touch_nmi_watchdog(void);
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
+#elif !defined(CONFIG_HAVE_NMI_WATCHDOG)
+static inline void arch_touch_nmi_watchdog(void) { }
 #endif
 
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
@@ -98,7 +101,6 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-extern void arch_touch_nmi_watchdog(void);
 extern void hardlockup_detector_perf_stop(void);
 extern void hardlockup_detector_perf_restart(void);
 extern void hardlockup_detector_perf_disable(void);
@@ -113,7 +115,6 @@ static inline void hardlockup_detector_perf_enable(void) { }
 static inline void hardlockup_detector_perf_cleanup(void) { }
 # if !defined(CONFIG_HAVE_NMI_WATCHDOG)
 static inline int hardlockup_detector_perf_init(void) { return -ENODEV; }
-static inline void arch_touch_nmi_watchdog(void) {}
 # else
 static inline int hardlockup_detector_perf_init(void) { return 0; }
 # endif
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 2552e224f76a..64d7d2a0a7df 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -90,8 +90,22 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
 static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_touched);
 static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
+notrace void arch_touch_nmi_watchdog(void)
+{
+	/*
+	 * Using __raw here because some code paths have
+	 * preemption enabled.  If preemption is enabled
+	 * then interrupts should be enabled too, in which
+	 * case we shouldn't have to worry about the watchdog
+	 * going off.
+	 */
+	raw_cpu_write(watchdog_hardlockup_touched, true);
+}
+EXPORT_SYMBOL(arch_touch_nmi_watchdog);
+
 static bool is_hardlockup(unsigned int cpu)
 {
 	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
@@ -116,6 +130,11 @@ static void watchdog_hardlockup_kick(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
+		per_cpu(watchdog_hardlockup_touched, cpu) = false;
+		return;
+	}
+
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
 	 * interrupt is incrementing. The timer interrupt should have
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 4e60e8023515..547917ebd5d3 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -20,26 +20,12 @@
 #include <asm/irq_regs.h>
 #include <linux/perf_event.h>
 
-static DEFINE_PER_CPU(bool, watchdog_nmi_touch);
 static DEFINE_PER_CPU(struct perf_event *, watchdog_ev);
 static DEFINE_PER_CPU(struct perf_event *, dead_event);
 static struct cpumask dead_events_mask;
 
 static atomic_t watchdog_cpus = ATOMIC_INIT(0);
 
-notrace void arch_touch_nmi_watchdog(void)
-{
-	/*
-	 * Using __raw here because some code paths have
-	 * preemption enabled.  If preemption is enabled
-	 * then interrupts should be enabled too, in which
-	 * case we shouldn't have to worry about the watchdog
-	 * going off.
-	 */
-	raw_cpu_write(watchdog_nmi_touch, true);
-}
-EXPORT_SYMBOL(arch_touch_nmi_watchdog);
-
 #ifdef CONFIG_HARDLOCKUP_CHECK_TIMESTAMP
 static DEFINE_PER_CPU(ktime_t, last_timestamp);
 static DEFINE_PER_CPU(unsigned int, nmi_rearmed);
@@ -115,11 +101,6 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	if (!watchdog_check_timestamp())
 		return;
 
-	if (__this_cpu_read(watchdog_nmi_touch) == true) {
-		__this_cpu_write(watchdog_nmi_touch, false);
-		return;
-	}
-
 	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
-- 
2.40.1.698.g37aff9b760-goog

