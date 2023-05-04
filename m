Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB896F7912
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:24:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7f66Wn7z3fcv
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:24:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fdqp591+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::434; helo=mail-pf1-x434.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=Fdqp591+;
	dkim-atps=neutral
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com [IPv6:2607:f8b0:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7RT5YSjz3cjK
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:15:17 +1000 (AEST)
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-64389a44895so999919b3a.1
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:15:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238515; x=1685830515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=;
        b=Fdqp591+Bc0n5LUOuZ+jw9voBFFuPd7of8525iR+iiRO9Xj3fHv6nKNTGTpP5EaqDU
         EzdXgrpZWBW3vYibWNS6iTCW6bJ2XbAL2UppoxvxeWowhQLXgcQ4I+FoXqCP9LO8Znal
         rLiqN5QqWtizpZvWHG6Tqu3Wto5zDTHGStQnw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238515; x=1685830515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TUknF6ajnI+moT8P8i/ZCNk2tv65O4bG3/LdBCmIAIk=;
        b=h2oPGjlnpsy/tuSbIOJhLRaTmGU7sByfJCEWAe1TwXflI132MXBUi0DDmIH1acmNCU
         IazIg97tNKXS5nhmOFQdnSO0dam+WmlhP+xslcyZI1b8omXuOVkR9Tv6Qxyb25Cqj1YV
         RcT8tsmNjJkFKnSOtX1N88jnwECn0pV3z0+ITgvCfndKPH70BXZNVGKk/aYdTyyLd2CI
         3OLU6i1oqMMDTz293b6R9ayQHqIclHTuSfe+j2ELlWw/LLUSc/dHVqdtFdmgmYRDGYcN
         AZShMnbiF7aCF2AllRn2EvswNYpKhtsWvUEXV/Ezo7UX4wQ7ZvoKiWxysH1lzrve2c7B
         PPUw==
X-Gm-Message-State: AC+VfDz5BSXtA829btWoy2CHT2cdnb9yh8UV6Z25B6ATr+Ksn7Y3suFA
	PnppiP41gTHswPqI2+jVvD2COA==
X-Google-Smtp-Source: ACHHUZ74QoZiaoJdwRc3XVsG97oTLnm9/4CdtL0i/W46ZYWiOKXfp/f5jJlYmEEJ5QQG/1COaksDoQ==
X-Received: by 2002:a05:6a00:1954:b0:63b:7ae0:fde9 with SMTP id s20-20020a056a00195400b0063b7ae0fde9mr4369313pfk.20.1683238515243;
        Thu, 04 May 2023 15:15:15 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:15:14 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 10/17] watchdog/hardlockup: Move perf hardlockup watchdog petting to watchdog.c
Date: Thu,  4 May 2023 15:13:42 -0700
Message-ID: <20230504151100.v4.10.I00dfd6386ee00da25bf26d140559a41339b53e57@changeid>
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

In preparation for the buddy hardlockup detector, which wants the same
petting logic as the current perf hardlockup detector, move the code
to watchdog.c. While doing this, rename the global variable to match
others nearby. The arch_touch_nmi_watchdog() function is not renamed
since that is exported with "EXPORT_SYMBOL" and is thus ABI.

Currently the code in watchdog.c is guarded by
CONFIG_HARDLOCKUP_DETECTOR_PERF, which makes this change seem
silly. However, a future patch will change this.

NOTE: there is a slight side effect to this change, though from code
analysis I believe it to be a beneficial one. Specifically the perf
hardlockup detector will now do check the "timestamp" before clearing
any watchdog pets. Previously the order was reversed. With the old
order if the watchdog perf event was firing super fast then it would
also be clearing existing watchdog pets super fast. The new behavior
of handling super-fast perf before clearing watchdog pets seems
better.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Move perf hardlockup watchdog petting to watchdog.c") new for v4.

 include/linux/nmi.h    |  5 +++--
 kernel/watchdog.c      | 19 +++++++++++++++++++
 kernel/watchdog_perf.c | 19 -------------------
 3 files changed, 22 insertions(+), 21 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 2c9ea1ba285c..94ff84e1c8ec 100644
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
index 367bea0167a5..9c17090611f2 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -90,8 +90,22 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
 static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
+static DEFINE_PER_CPU(bool, watchdog_hardlockup_touch);
 static unsigned long watchdog_hardlockup_dumped_stacks;
 
+notrace void arch_touch_nmi_watchdog(void)
+{
+	/*
+	 * Using __raw here because some code paths have
+	 * preemption enabled.  If preemption is enabled
+	 * then interrupts should be enabled too, in which
+	 * case we shouldn't have to worry about the watchdog
+	 * going off.
+	 */
+	raw_cpu_write(watchdog_hardlockup_touch, true);
+}
+EXPORT_SYMBOL(arch_touch_nmi_watchdog);
+
 static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
 {
 	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);
@@ -111,6 +125,11 @@ static void watchdog_hardlockup_interrupt_count(void)
 
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
+	if (__this_cpu_read(watchdog_hardlockup_touch)) {
+		__this_cpu_write(watchdog_hardlockup_touch, false);
+		return;
+	}
+
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
 	 * interrupt is incrementing. The timer interrupt should have
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 9be90b2a2ea7..547917ebd5d3 100644
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
@@ -112,11 +98,6 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	/* Ensure the watchdog never gets throttled */
 	event->hw.interrupts = 0;
 
-	if (__this_cpu_read(watchdog_nmi_touch) == true) {
-		__this_cpu_write(watchdog_nmi_touch, false);
-		return;
-	}
-
 	if (!watchdog_check_timestamp())
 		return;
 
-- 
2.40.1.521.gf1e218fcd8-goog

