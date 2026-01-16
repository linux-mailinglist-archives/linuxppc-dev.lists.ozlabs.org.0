Return-Path: <linuxppc-dev+bounces-15905-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 91608D32E55
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2sh31SJz3bfG;
	Sat, 17 Jan 2026 01:53:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575208;
	cv=none; b=llefhi9ZOC5px7UBE9RgV2LPB+uqo2bkOwwS4DfSUdC8L2fLjkMRwAqM0299w+XCwbHBETqR/MhOxj4UwlBbS9G1uJGk8/w99y3Viore5CFJll3nhEoI/6lPpdF8FjEZ28bpVlpRtEZhcM7ct9IgeO1xdu/R35KoFuQ0O6GSzHdxjOZqRbD2hLEC+9h6OEMnUlQw6kpzSTDLKCHhWsB36L2vL7mcFh/tJ9J68ut/2fbO7kF9LUmqc/e1/el/tnGEPdw2c3pSR4r/U2QJWz0kOEfY9NUU2I6oSVNHgV/3177AcimPruijf6QwEd3Tn/BjwMj+/7XJoIHP0CQdV21+yg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575208; c=relaxed/relaxed;
	bh=c3iJU1YBApq3L6uOW35xqKMarD5ZnQT0vvPjoOv0b/c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jaNtqYVmkEdKKvKoTr6fhQPnBVwUBRy5kJQFN2/EYBlAApTw+yc7Ygc+oGhXByMp59U45OHA104807jmrSRWJH58FSt4EjkcUY+ULI7mVNtk7TEIrLkUnsNMSxTBu74eurJgVsaXelPvn2/YgN3SaEoKwhdU4AXBBkQV68QMajMnHhmg1cUHl1JY3vc4rJKak6R+9g40Sn9J5Z2ySBnspCZJDfM+LEWAymqCHROF4UrpnNobXgRFrmK0ZJgffldenisb6IYRZj4+0bJz+1wYEm9FOEOyUjeG6oze8u6lF0BR7HpaCZuLEIikBeTjy/Eg5dR7rw62HjsYJZa6c4vGGg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV8YITrN; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qV8YITrN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2sg4NpXz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:27 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F033343D48;
	Fri, 16 Jan 2026 14:53:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3D0AC19423;
	Fri, 16 Jan 2026 14:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575205;
	bh=Q7B1RTOaC9Z34bM1w/cMiGiolpdcg9oH38EWCVtHmKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qV8YITrNeHN1vzLsOndn+0+dbQjazVhfx2VbJ8jT7YriJsx2nx46iWEwW2gVt8yJH
	 tlcV7Nvibp89UbiZf4+uzqei2NDTs6Av3wRVIUZ0ChSuzQA4P8i70E9QdxjGp/sDV4
	 sPPaH8XUHZdUeGTLdfuHY25+SaecJH1HVmYWOfWeUmtH1c3Fzcr27NkNcjOElxtvyI
	 /UekxTAhDLERlBhNC1Jqi8ZOKR4x8emiNSm3/+jh596LRKlBluOsrpDbZMoN/v4HvB
	 CrZEXv9NEpsuIt0BGc55kRrn1tQHgKiOUYtcDq+YTfG12iRAWDEV4ffM7ZKfPYjSyk
	 QTckhtBL1OPvw==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>,
	linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 09/15] tick/sched: Move dyntick-idle cputime accounting to cputime code
Date: Fri, 16 Jan 2026 15:52:02 +0100
Message-ID: <20260116145208.87445-10-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260116145208.87445-1-frederic@kernel.org>
References: <20260116145208.87445-1-frederic@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Although the dynticks-idle cputime accounting is necessarily tied to
the tick subsystem, the actual related accounting code has no business
residing there and should be part of the scheduler cputime code.

Move away the relevant pieces and state machine to where they belong.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/kernel_stat.h |  14 +++-
 kernel/sched/cputime.c      | 145 ++++++++++++++++++++++++++++++--
 kernel/time/tick-sched.c    | 161 +++++++-----------------------------
 3 files changed, 180 insertions(+), 140 deletions(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index ba65aad308a1..a906492eb680 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -35,9 +35,12 @@ enum cpu_usage_stat {
 
 struct kernel_cpustat {
 #ifdef CONFIG_NO_HZ_COMMON
-	int idle_dyntick;
+	bool		idle_dyntick;
+	bool		idle_elapse;
+	seqcount_t	idle_sleeptime_seq;
+	ktime_t		idle_entrytime;
 #endif
-	u64 cpustat[NR_STATS];
+	u64		cpustat[NR_STATS];
 };
 
 struct kernel_stat {
@@ -103,8 +106,11 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
 }
 
 #ifdef CONFIG_NO_HZ_COMMON
-extern void kcpustat_dyntick_start(void);
-extern void kcpustat_dyntick_stop(void);
+extern void kcpustat_dyntick_start(ktime_t now);
+extern void kcpustat_dyntick_stop(ktime_t now);
+extern void kcpustat_irq_enter(ktime_t now);
+extern void kcpustat_irq_exit(ktime_t now);
+
 static inline bool kcpustat_idle_dyntick(void)
 {
 	return __this_cpu_read(kernel_cpustat.idle_dyntick);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index c10fcc3d65b3..16d6730efe6d 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -406,22 +406,153 @@ static inline void irqtime_account_process_tick(struct task_struct *p, int user_
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
 #ifdef CONFIG_NO_HZ_COMMON
-void kcpustat_dyntick_start(void)
+static void kcpustat_idle_stop(struct kernel_cpustat *kc, ktime_t now)
 {
-	if (!vtime_generic_enabled_this_cpu()) {
-		vtime_dyntick_start();
-		__this_cpu_write(kernel_cpustat.idle_dyntick, 1);
-	}
+	u64 *cpustat = kc->cpustat;
+	ktime_t delta;
+
+	if (!kc->idle_elapse)
+		return;
+
+	delta = ktime_sub(now, kc->idle_entrytime);
+
+	write_seqcount_begin(&kc->idle_sleeptime_seq);
+	if (nr_iowait_cpu(smp_processor_id()) > 0)
+		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
+	else
+		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
+
+	kc->idle_entrytime = now;
+	kc->idle_elapse = false;
+	write_seqcount_end(&kc->idle_sleeptime_seq);
 }
 
-void kcpustat_dyntick_stop(void)
+static void kcpustat_idle_start(struct kernel_cpustat *kc, ktime_t now)
 {
+	write_seqcount_begin(&kc->idle_sleeptime_seq);
+	kc->idle_entrytime = now;
+	kc->idle_elapse = true;
+	write_seqcount_end(&kc->idle_sleeptime_seq);
+}
+
+void kcpustat_dyntick_stop(ktime_t now)
+{
+	struct kernel_cpustat *kc = kcpustat_this_cpu;
+
 	if (!vtime_generic_enabled_this_cpu()) {
-		__this_cpu_write(kernel_cpustat.idle_dyntick, 0);
+		WARN_ON_ONCE(!kc->idle_dyntick);
+		kcpustat_idle_stop(kc, now);
+		kc->idle_dyntick = false;
 		vtime_dyntick_stop();
 		steal_account_process_time(ULONG_MAX);
 	}
 }
+
+void kcpustat_dyntick_start(ktime_t now)
+{
+	struct kernel_cpustat *kc = kcpustat_this_cpu;
+
+	if (!vtime_generic_enabled_this_cpu()) {
+		vtime_dyntick_start();
+		kc->idle_dyntick = true;
+		kcpustat_idle_start(kc, now);
+	}
+}
+
+void kcpustat_irq_enter(ktime_t now)
+{
+	struct kernel_cpustat *kc = kcpustat_this_cpu;
+
+	if (!vtime_generic_enabled_this_cpu())
+		kcpustat_idle_stop(kc, now);
+}
+
+void kcpustat_irq_exit(ktime_t now)
+{
+	struct kernel_cpustat *kc = kcpustat_this_cpu;
+
+	if (!vtime_generic_enabled_this_cpu())
+		kcpustat_idle_start(kc, now);
+}
+
+static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
+				 bool compute_delta, u64 *last_update_time)
+{
+	struct kernel_cpustat *kc = &kcpustat_cpu(cpu);
+	u64 *cpustat = kc->cpustat;
+	ktime_t now, idle;
+	unsigned int seq;
+
+	if (vtime_generic_enabled_cpu(cpu))
+		return -1;
+
+	now = ktime_get();
+	if (last_update_time)
+		*last_update_time = ktime_to_us(now);
+
+	do {
+		seq = read_seqcount_begin(&kc->idle_sleeptime_seq);
+
+		if (kc->idle_elapse && compute_delta) {
+			ktime_t delta = ktime_sub(now, kc->idle_entrytime);
+
+			idle = ktime_add(cpustat[idx], delta);
+		} else {
+			idle = cpustat[idx];
+		}
+	} while (read_seqcount_retry(&kc->idle_sleeptime_seq, seq));
+
+	return ktime_to_us(idle);
+}
+
+/**
+ * get_cpu_idle_time_us - get the total idle time of a CPU
+ * @cpu: CPU number to query
+ * @last_update_time: variable to store update time in. Do not update
+ * counters if NULL.
+ *
+ * Return the cumulative idle time (since boot) for a given
+ * CPU, in microseconds. Note that this is partially broken due to
+ * the counter of iowait tasks that can be remotely updated without
+ * any synchronization. Therefore it is possible to observe backward
+ * values within two consecutive reads.
+ *
+ * This time is measured via accounting rather than sampling,
+ * and is as accurate as ktime_get() is.
+ *
+ * Return: -1 if generic vtime is enabled, else total idle time of the @cpu
+ */
+u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
+{
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE,
+				     !nr_iowait_cpu(cpu), last_update_time);
+}
+EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
+
+/**
+ * get_cpu_iowait_time_us - get the total iowait time of a CPU
+ * @cpu: CPU number to query
+ * @last_update_time: variable to store update time in. Do not update
+ * counters if NULL.
+ *
+ * Return the cumulative iowait time (since boot) for a given
+ * CPU, in microseconds. Note this is partially broken due to
+ * the counter of iowait tasks that can be remotely updated without
+ * any synchronization. Therefore it is possible to observe backward
+ * values within two consecutive reads.
+ *
+ * This time is measured via accounting rather than sampling,
+ * and is as accurate as ktime_get() is.
+ *
+ * Return: -1 if generic vtime is enabled, else total iowait time of @cpu
+ */
+u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
+{
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT,
+				     nr_iowait_cpu(cpu), last_update_time);
+}
+EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
+
 #endif /* CONFIG_NO_HZ_COMMON */
 
 /*
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index f0b79e876997..cbd645fb8df6 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -740,123 +740,6 @@ static void tick_nohz_update_jiffies(ktime_t now)
 	touch_softlockup_watchdog_sched();
 }
 
-static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
-{
-	u64 *cpustat = kcpustat_this_cpu->cpustat;
-	ktime_t delta;
-
-	if (vtime_generic_enabled_this_cpu())
-		return;
-
-	if (WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)))
-		return;
-
-	delta = ktime_sub(now, ts->idle_entrytime);
-
-	write_seqcount_begin(&ts->idle_sleeptime_seq);
-	if (nr_iowait_cpu(smp_processor_id()) > 0)
-		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
-	else
-		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
-
-	ts->idle_entrytime = now;
-	tick_sched_flag_clear(ts, TS_FLAG_IDLE_ACTIVE);
-	write_seqcount_end(&ts->idle_sleeptime_seq);
-
-	sched_clock_idle_wakeup_event();
-}
-
-static void tick_nohz_start_idle(struct tick_sched *ts)
-{
-	if (vtime_generic_enabled_this_cpu())
-		return;
-
-	write_seqcount_begin(&ts->idle_sleeptime_seq);
-	ts->idle_entrytime = ktime_get();
-	tick_sched_flag_set(ts, TS_FLAG_IDLE_ACTIVE);
-	write_seqcount_end(&ts->idle_sleeptime_seq);
-	sched_clock_idle_sleep_event();
-}
-
-static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
-				 bool compute_delta, u64 *last_update_time)
-{
-	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-	u64 *cpustat = kcpustat_cpu(cpu).cpustat;
-	ktime_t now, idle;
-	unsigned int seq;
-
-	if (vtime_generic_enabled_cpu(cpu))
-		return -1;
-
-	now = ktime_get();
-	if (last_update_time)
-		*last_update_time = ktime_to_us(now);
-
-	do {
-		seq = read_seqcount_begin(&ts->idle_sleeptime_seq);
-
-		if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE) && compute_delta) {
-			ktime_t delta = ktime_sub(now, ts->idle_entrytime);
-
-			idle = ktime_add(cpustat[idx], delta);
-		} else {
-			idle = cpustat[idx];
-		}
-	} while (read_seqcount_retry(&ts->idle_sleeptime_seq, seq));
-
-	return ktime_to_us(idle);
-
-}
-
-/**
- * get_cpu_idle_time_us - get the total idle time of a CPU
- * @cpu: CPU number to query
- * @last_update_time: variable to store update time in. Do not update
- * counters if NULL.
- *
- * Return the cumulative idle time (since boot) for a given
- * CPU, in microseconds. Note that this is partially broken due to
- * the counter of iowait tasks that can be remotely updated without
- * any synchronization. Therefore it is possible to observe backward
- * values within two consecutive reads.
- *
- * This time is measured via accounting rather than sampling,
- * and is as accurate as ktime_get() is.
- *
- * Return: -1 if generic vtime is enabled, else total idle time of the @cpu
- */
-u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
-{
-	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE,
-				     !nr_iowait_cpu(cpu), last_update_time);
-}
-EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
-
-/**
- * get_cpu_iowait_time_us - get the total iowait time of a CPU
- * @cpu: CPU number to query
- * @last_update_time: variable to store update time in. Do not update
- * counters if NULL.
- *
- * Return the cumulative iowait time (since boot) for a given
- * CPU, in microseconds. Note this is partially broken due to
- * the counter of iowait tasks that can be remotely updated without
- * any synchronization. Therefore it is possible to observe backward
- * values within two consecutive reads.
- *
- * This time is measured via accounting rather than sampling,
- * and is as accurate as ktime_get() is.
- *
- * Return: -1 if generic vtime is enabled, else total iowait time of @cpu
- */
-u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
-{
-	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT,
-				     nr_iowait_cpu(cpu), last_update_time);
-}
-EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
-
 static void tick_nohz_restart(struct tick_sched *ts, ktime_t now)
 {
 	hrtimer_cancel(&ts->sched_timer);
@@ -1264,6 +1147,20 @@ void tick_nohz_idle_retain_tick(void)
 	tick_nohz_retain_tick(this_cpu_ptr(&tick_cpu_sched));
 }
 
+static void tick_nohz_clock_sleep(struct tick_sched *ts)
+{
+	tick_sched_flag_set(ts, TS_FLAG_IDLE_ACTIVE);
+	sched_clock_idle_sleep_event();
+}
+
+static void tick_nohz_clock_wakeup(struct tick_sched *ts)
+{
+	if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)) {
+		tick_sched_flag_clear(ts, TS_FLAG_IDLE_ACTIVE);
+		sched_clock_idle_wakeup_event();
+	}
+}
+
 /**
  * tick_nohz_idle_enter - prepare for entering idle on the current CPU
  *
@@ -1278,12 +1175,10 @@ void tick_nohz_idle_enter(void)
 	local_irq_disable();
 
 	ts = this_cpu_ptr(&tick_cpu_sched);
-
 	WARN_ON_ONCE(ts->timer_expires_base);
-
-	tick_sched_flag_set(ts, TS_FLAG_INIDLE);
-	kcpustat_dyntick_start();
-	tick_nohz_start_idle(ts);
+	ts->idle_entrytime = ktime_get();
+	kcpustat_dyntick_start(ts->idle_entrytime);
+	tick_nohz_clock_sleep(ts);
 
 	local_irq_enable();
 }
@@ -1311,10 +1206,13 @@ void tick_nohz_irq_exit(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
-	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE))
-		tick_nohz_start_idle(ts);
-	else
+	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE)) {
+		ts->idle_entrytime = ktime_get();
+		kcpustat_irq_exit(ts->idle_entrytime);
+		tick_nohz_clock_sleep(ts);
+	} else {
 		tick_nohz_full_update_tick(ts);
+	}
 }
 
 /**
@@ -1459,11 +1357,11 @@ void tick_nohz_idle_exit(void)
 		now = ktime_get();
 
 	if (idle_active)
-		tick_nohz_stop_idle(ts, now);
+		tick_nohz_clock_wakeup(ts);
 
 	if (tick_stopped)
 		tick_nohz_idle_update_tick(ts, now);
-	kcpustat_dyntick_stop();
+	kcpustat_dyntick_stop(now);
 
 	local_irq_enable();
 }
@@ -1519,9 +1417,14 @@ static inline void tick_nohz_irq_enter(void)
 
 	if (!tick_sched_flag_test(ts, TS_FLAG_STOPPED | TS_FLAG_IDLE_ACTIVE))
 		return;
+
 	now = ktime_get();
-	if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE))
-		tick_nohz_stop_idle(ts, now);
+
+	if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)) {
+		tick_nohz_clock_wakeup(ts);
+		kcpustat_irq_enter(now);
+	}
+
 	/*
 	 * If all CPUs are idle we may need to update a stale jiffies value.
 	 * Note nohz_full is a special case: a timekeeper is guaranteed to stay
-- 
2.51.1


