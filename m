Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DC213709E0E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 May 2023 19:29:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QNDP15ZtDz3fwf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 May 2023 03:29:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YFzuFJ4e;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=chromium.org (client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com; envelope-from=dianders@chromium.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=YFzuFJ4e;
	dkim-atps=neutral
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QNDCB0fsMz3fJv
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 May 2023 03:21:09 +1000 (AEST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ae615d5018so20416265ad.1
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 19 May 2023 10:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1684516868; x=1687108868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=;
        b=YFzuFJ4eWMAMLZhwqw3DBL6QSzTZYYa5+5StBECaLdL4G4pigB8ofT1gcUdimpiEex
         TUDIfFVtwz5+KlRL7JQHT2da3WMxmdqENRL5ms2CGY+2q3hdCV2Nt79wd9AtATEzbUlN
         2n+bREyXkWhUEo1Yo+8a9WsEEPMByfDapf0rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684516868; x=1687108868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ie3WjW8dWxj5WOSXB5283RQPy/3pGkianoLx2tVNmSE=;
        b=I5hXFGGwqRYpTxWvU3aGJGhlWDwBhQWbgeICbh9VGg4bnwlHsPIVlHjalSrXGxP80r
         Yf3z+It1wOROpTUK5DuHDMH9xcX9dAu0F0UTENrheJ8mipDbJCATu4F7pP7Ew8YspRHr
         +mr+av7LlDta5dOm8BU5WjNicjO+7YnUxcvzTZdyHCE39fos2VwQ36KF1NhgX/Wv0DQi
         SWUMM3KrrsBNnS1CWk13lKDdJgT07COBEsP7ebOVPBEbQUZUtSfmmZM42itp+6TtzEB7
         vkATWasd3NseE1r3i4nA9zHyWcb6514PSiKcSEExlVlo2hbrUG4L3dTAVovRiMWEBQqj
         uVnA==
X-Gm-Message-State: AC+VfDwo+RBrcc3rHmYtzTGADATGWTqOKChlVloqhabTCKR44uuYekgN
	drcbUrEAHJ2aDCaY630osW5Q5A==
X-Google-Smtp-Source: ACHHUZ7ATOZ4rrYyAkhTlLlxcJ+5wIJmhvaJz9egSunvv+DUCDA9ft5dxcoQbbZfEUNE16sB4U4I0A==
X-Received: by 2002:a17:903:2343:b0:1ae:bf5:7a7 with SMTP id c3-20020a170903234300b001ae0bf507a7mr3990597plh.35.1684516867869;
        Fri, 19 May 2023 10:21:07 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:9d:2:9b89:2dd0:d160:429d])
        by smtp.gmail.com with ESMTPSA id gj19-20020a17090b109300b0024e4f169931sm1763835pjb.2.2023.05.19.10.21.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 10:21:07 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Petr Mladek <pmladek@suse.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 10/18] watchdog/hardlockup: Add a "cpu" param to watchdog_hardlockup_check()
Date: Fri, 19 May 2023 10:18:34 -0700
Message-ID: <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
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

In preparation for the buddy hardlockup detector where the CPU
checking for lockup might not be the currently running CPU, add a
"cpu" parameter to watchdog_hardlockup_check().

As part of this change, make hrtimer_interrupts an atomic_t since now
the CPU incrementing the value and the CPU reading the value might be
different. Technially this could also be done with just READ_ONCE and
WRITE_ONCE, but atomic_t feels a little cleaner in this case.

While hrtimer_interrupts is made atomic_t, we change
hrtimer_interrupts_saved from "unsigned long" to "int". The "int" is
needed to match the data type backing atomic_t for hrtimer_interrupts.
Even if this changes us from 64-bits to 32-bits (which I don't think
is true for most compilers), it doesn't really matter. All we ever do
is increment it every few seconds and compare it to an old value so
32-bits is fine (even 16-bits would be). The "signed" vs "unsigned"
also doesn't matter for simple equality comparisons.

hrtimer_interrupts_saved is _not_ switched to atomic_t nor even
accessed with READ_ONCE / WRITE_ONCE. The hrtimer_interrupts_saved is
always consistently accessed with the same CPU. NOTE: with the
upcoming "buddy" detector there is one special case. When a CPU goes
offline/online then we can change which CPU is the one to consistently
access a given instance of hrtimer_interrupts_saved. We still can't
end up with a partially updated hrtimer_interrupts_saved, however,
because we end up petting all affected CPUs to make sure the new and
old CPU can't end up somehow read/write hrtimer_interrupts_saved at
the same time.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- Don't dump stack on the buddy CPU if we fail to backtrace the hung CPU.
- Use atomic_t for hrtimer_interrupts.

Changes in v4:
- ("Add a "cpu" param to watchdog_hardlockup_check()") new for v4.

 include/linux/nmi.h    |  2 +-
 kernel/watchdog.c      | 52 ++++++++++++++++++++++++++----------------
 kernel/watchdog_perf.c |  2 +-
 3 files changed, 34 insertions(+), 22 deletions(-)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index 0c62c1bf0a71..92aa568c0c42 100644
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
index 169e5dffbc00..2552e224f76a 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -87,29 +87,34 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
 
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
 
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
-static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
+static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
+static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
 static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
 static unsigned long watchdog_hardlockup_all_cpu_dumped;
 
-static bool is_hardlockup(void)
+static bool is_hardlockup(unsigned int cpu)
 {
-	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
+	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
 
-	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
+	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
 		return true;
 
-	__this_cpu_write(hrtimer_interrupts_saved, hrint);
+	/*
+	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
+	 * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
+	 * written/read by a single CPU.
+	 */
+	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
 
 	return false;
 }
 
 static void watchdog_hardlockup_kick(void)
 {
-	__this_cpu_inc(hrtimer_interrupts);
+	atomic_inc(raw_cpu_ptr(&hrtimer_interrupts));
 }
 
-void watchdog_hardlockup_check(struct pt_regs *regs)
+void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
 	/*
 	 * Check for a hardlockup by making sure the CPU's timer
@@ -117,35 +122,42 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
 	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
-	if (is_hardlockup()) {
+	if (is_hardlockup(cpu)) {
 		unsigned int this_cpu = smp_processor_id();
+		struct cpumask backtrace_mask = *cpu_online_mask;
 
 		/* Only print hardlockups once. */
-		if (__this_cpu_read(watchdog_hardlockup_warned))
+		if (per_cpu(watchdog_hardlockup_warned, cpu))
 			return;
 
-		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
+		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
 		print_modules();
 		print_irqtrace_events(current);
-		if (regs)
-			show_regs(regs);
-		else
-			dump_stack();
+		if (cpu == this_cpu) {
+			if (regs)
+				show_regs(regs);
+			else
+				dump_stack();
+			cpumask_clear_cpu(cpu, &backtrace_mask);
+		} else {
+			if (trigger_single_cpu_backtrace(cpu))
+				cpumask_clear_cpu(cpu, &backtrace_mask);
+		}
 
 		/*
-		 * Perform all-CPU dump only once to avoid multiple hardlockups
-		 * generating interleaving traces
+		 * Perform multi-CPU dump only once to avoid multiple
+		 * hardlockups generating interleaving traces
 		 */
 		if (sysctl_hardlockup_all_cpu_backtrace &&
 		    !test_and_set_bit(0, &watchdog_hardlockup_all_cpu_dumped))
-			trigger_allbutself_cpu_backtrace();
+			trigger_cpumask_backtrace(&backtrace_mask);
 
 		if (hardlockup_panic)
 			nmi_panic(regs, "Hard LOCKUP");
 
-		__this_cpu_write(watchdog_hardlockup_warned, true);
+		per_cpu(watchdog_hardlockup_warned, cpu) = true;
 	} else {
-		__this_cpu_write(watchdog_hardlockup_warned, false);
+		per_cpu(watchdog_hardlockup_warned, cpu) = false;
 	}
 }
 
diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
index 04415812d079..4e60e8023515 100644
--- a/kernel/watchdog_perf.c
+++ b/kernel/watchdog_perf.c
@@ -120,7 +120,7 @@ static void watchdog_overflow_callback(struct perf_event *event,
 		return;
 	}
 
-	watchdog_hardlockup_check(regs);
+	watchdog_hardlockup_check(smp_processor_id(), regs);
 }
 
 static int hardlockup_detector_event_create(void)
-- 
2.40.1.698.g37aff9b760-goog

