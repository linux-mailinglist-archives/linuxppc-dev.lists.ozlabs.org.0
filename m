Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C446F790E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 00:23:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QC7d216Swz3fhY
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 08:23:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YJROINNm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::431; helo=mail-pf1-x431.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YJROINNm;
	dkim-atps=neutral
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QC7RQ32KDz3c7Q
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 08:15:14 +1000 (AEST)
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-64388cf3263so856250b3a.3
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 15:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1683238512; x=1685830512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=;
        b=YJROINNmnTriLPHEMGRffEEU5u5jgOZI+OjH5ib5+xogbKCty4xGU/gxTjvwZlF0Wq
         Y41ByV3ME3y2zIqQvZlfm5TvuytZulDOsfyDEiZk5uPDq5w5r51Z0+JrQfSi+OMn98zN
         vTuEboyeGfy9khGK+oRTXwvq0syqveXf6UD30=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683238512; x=1685830512;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qs9dVqDn19dbFuBLpnSq6u/1X9XncQ7793Pg3nTbXSY=;
        b=ct+ja5LHBoWJdiCSPL0y97Rr3U0INwTqkBIrHAr0nNMQ2bZpD9PjZnmeeXYlloTnex
         1RpgvrH1Fc1mLWHihLhc7Npf9YgEFMeM9JK5cURosnGuz2zby/IzHlE9N981Mk5jGdpY
         9GwAN1ncBvYhO7THxhx/DIlO0KxyD4l3bC5yUTt69tjNhLR8Jyp6jqvVESDAmmhVXs2T
         yMWM2EBCBcQzJ0mXkQkmXyz8MBZKbSir/+Khh3KatQXzwItCsknibQfLOVwzILsRECe/
         NqcTQzUgTYfWYA5dF4QhLLEMCuvYGWafWtpFZJxSeh4w3MBeicbAKGl19AW5PQCQHv/i
         HTEQ==
X-Gm-Message-State: AC+VfDz18WyYcME2bAm3pgX/WxTpurNpwdPg81kd18PFealSnIwv1o6B
	7KiMTF5IGnS47S/g88ZJ8/zHXA==
X-Google-Smtp-Source: ACHHUZ4Ssrt4fd2DGpbw/dz7xZl+zekrUKqrX4nrV4w3MwOPjKkeowMi5feC+Af+mzM8p4SVwo3IHQ==
X-Received: by 2002:a05:6a00:2284:b0:643:9b40:103e with SMTP id f4-20020a056a00228400b006439b40103emr1621714pfe.30.1683238512076;
        Thu, 04 May 2023 15:15:12 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:edf0:7321:6b9e:d5e7])
        by smtp.gmail.com with ESMTPSA id g26-20020aa7819a000000b006437c0edf9csm169615pfi.16.2023.05.04.15.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 15:15:11 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v4 09/17] watchdog/hardlockup: Add a "cpu" param to watchdog_hardlockup_check()
Date: Thu,  4 May 2023 15:13:41 -0700
Message-ID: <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
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

In preparation for the buddy hardlockup detector where the CPU
checking for lockup might not be the currently running CPU, add a
"cpu" parameter to watchdog_hardlockup_check().

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- ("Add a "cpu" param to watchdog_hardlockup_check()") new for v4.

 include/linux/nmi.h    |  2 +-
 kernel/watchdog.c      | 47 ++++++++++++++++++++++++++++--------------
 kernel/watchdog_perf.c |  2 +-
 3 files changed, 33 insertions(+), 18 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index c6cb9bc5dc80..2c9ea1ba285c 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -88,7 +88,7 @@ static inline void hardlockup_detector_disable(void) {}
 #endif
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
-void watchdog_hardlockup_check(struct pt_regs *regs);
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs);
 #endif
 
 #if defined(CONFIG_HAVE_NMI_WATCHDOG) || defined(CONFIG_HARDLOCKUP_DETECTOR)
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index f46669c1671d..367bea0167a5 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -92,14 +92,14 @@ static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
 static unsigned long watchdog_hardlockup_dumped_stacks;
 
-static bool watchdog_hardlockup_is_lockedup(void)
+static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
 {
-	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
+	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);
 
-	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
+	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
 		return true;
 
-	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
 
 	return false;
 }
@@ -109,7 +109,7 @@ static void watchdog_hardlockup_interrupt_count(void)
 	__this_cpu_inc(hrtimer_interrupts);
 }
 
-void watchdog_hardlockup_check(struct pt_regs *regs)
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
@@ -117,35 +117,50 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
-	if (watchdog_hardlockup_is_lockedup()) {
+	if (watchdog_hardlockup_is_lockedup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
+		struct cpumask backtrace_mask = *cpu_online_mask;
 
 		/* Only handle hardlockups once. */
-		if (__this_cpu_read(watchdog_hardlockup_processed))
+		if (per_cpu(watchdog_hardlockup_processed, cpu))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
 		print_modules();
 		print_irqtrace_events(current);
-		if (regs)
+		if (regs) {
 			show_regs(regs);
-		else
-			dump_stack();
+			cpumask_clear_cpu(cpu, &backtrace_mask);
+		} else {
+			/*
+			 * If the locked up CPU is different than the CPU we're
+			 * running on then we'll try to backtrace the CPU that
+			 * locked up and then exclude it from later backtraces.
+			 * If that fails or if we're running on the locked up
+			 * CPU, just do a normal backtrace.
+			 */
+			if (cpu != this_cpu && trigger_single_cpu_backtrace(cpu)) {
+				cpumask_clear_cpu(cpu, &backtrace_mask);
+			} else {
+				dump_stack();
+				cpumask_clear_cpu(this_cpu, &backtrace_mask);
+			}
+		}
 
 		/*
-		 * Perform all-CPU dump only once to avoid multiple hardlockups
-		 * generating interleaving traces
+		 * Perform multi-CPU dump only once to avoid multiple
+		 * hardlockups generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
 		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
-			trigger_allbutself_cpu_backtrace();
+			trigger_cpumask_backtrace(&backtrace_mask);
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(watchdog_hardlockup_processed, true);
+		per_cpu(watchdog_hardlockup_processed, cpu) = true;
 	} else {
-		__this_cpu_write(watchdog_hardlockup_processed, false);
+		per_cpu(watchdog_hardlockup_processed, cpu) = false;
 	}
 }
 
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 5f3651b87ee7..9be90b2a2ea7 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -120,7 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 	if (!watchdog_check_timestamp())
 		return;
 
-	watchdog_hardlockup_check(regs);
+	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
 static int hardlockup_detector_event_create(void)
-- 
2.40.1.521.gf1e218fcd8-goog

