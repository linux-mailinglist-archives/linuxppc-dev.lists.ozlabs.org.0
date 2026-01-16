Return-Path: <linuxppc-dev+bounces-15902-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB03D32E3D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2sH06zjz30T8;
	Sat, 17 Jan 2026 01:53:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575186;
	cv=none; b=DTVlI7+h0CdzqnWbnRAcTZMaXfU+7L+uIzYjbkm+WGvad6OFIzydAecGtik3E1FAeW0nJxZoiGDOlynY42M85i8mj7rBiOOFPx7lnyS5yq7QoJPecUVBwQQGgZ5j9PQDFNLzXpMZyfWMS761Lrpcf8nnkDJI1BXJCoR/cLWBnR85eCQg08wo3nmQnub7oCqshp0+lXkavq/g2xZRxjj107o7wigl+OowHS7xHnTxzDKyK2WQa8t1NqgpKHMvNbbEeBd1yWnftHXromWSm4s0PlX/0CSe8KvG6HDYYi2dRddicTfgadGHSwLykdGggkqdW9R+8ADA9ucfwUGfktN0Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575186; c=relaxed/relaxed;
	bh=PNcSwrAklb9NRC4BxXsxAPImdbynHEQ9ukbw/97eq68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HamOFcvLvEpOQ2B6Hhx2btc0rB1m+GwK9kdaO2LenWM7XA6Oa/oAlYyK7YWwO0hHhXcrY3Oo6LhuN4vVj2YBqBB+FmZeFTuNMYbLYUK+rAkkUOzUWHCqRdtT8xrQXxeQpdJ3sBcOLOwEzpxlPVLGDoColOTV4zctLbLyhCqKKKfIp+BlKZBcD2xDhl0B888mJ4DPlPX3cAX7WsgH/Ue4M5O5V2nCXEzj3qbN3t0I1sN4Tb6lJmO7muHi2lNolSv8RnDenclUUg8UzGK+502Nqnkidy9AJIm30w/LI9ehkQJW0+qxOB1IPocgx7uCDXCtVGI1HI4omIZtBrshFgsvxQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cG3k2Lez; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cG3k2Lez;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2sG0zdpz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:06 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C92940C10;
	Fri, 16 Jan 2026 14:53:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71FAFC16AAE;
	Fri, 16 Jan 2026 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575184;
	bh=oZRzhhrgyUs9gVhop4a/9/b2H0iyMtqMK1t/RPXY/I0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cG3k2LezNgpd5y2yIZznyAvfdol63MOQZGmSmXzeQ7c+Xs6tEjjqbBhOKO4MYDwG2
	 NSGIeHiQ6LAf2oOiSIC0SvffNzeX9ZAwt/GQ3A6eRccdU2WzZiuUszqGQSAHERu3Xt
	 qoGqQDhm7ya0VGwPazAn8WHLTy2pohIxJavHDpobIyJQd9uy9/Y19rTAK9AIm/lqZn
	 2TSjnDWinamgegl2VmUHXLOXKPmRxtEntuSwemfSFl+LuGXGy5rEPOjin8egj0bO1o
	 9hkkYl41RJ7TJaBkVubemkstw1rYTYTUz/mTmvldK85iTcuLxk3pYaNakbS2N1tz5t
	 Uyg+i4Z1H9o6w==
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
Subject: [PATCH 06/15] tick/sched: Unify idle cputime accounting
Date: Fri, 16 Jan 2026 15:51:59 +0100
Message-ID: <20260116145208.87445-7-frederic@kernel.org>
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

The non-vtime dynticks-idle cputime accounting is a big mess that
accumulates within two concurrent statistics, each having their own
shortcomings:

* The accounting for online CPUs which is based on the delta between
  tick_nohz_start_idle() and tick_nohz_stop_idle().

  Pros:
       - Works when the tick is off

       - Has nsecs granularity

  Cons:
       - Account idle steal time but doesn't substract it from idle
         cputime.

       - Assumes CONFIG_IRQ_TIME_ACCOUNTING by not accounting IRQs but
         the IRQ time is simply ignored when
         CONFIG_IRQ_TIME_ACCOUNTING=n

       - The windows between 1) idle task scheduling and the first call
         to tick_nohz_start_idle() and 2) idle task between the last
         tick_nohz_stop_idle() and the rest of the idle time are
         blindspots wrt. cputime accounting (though mostly insignificant
         amount)

       - Relies on private fields outside of kernel stats, with specific
         accessors.

* The accounting for offline CPUs which is based on ticks and the
  jiffies delta during which the tick was stopped.

  Pros:
       - Handles steal time correctly

       - Handle CONFIG_IRQ_TIME_ACCOUNTING=y and
         CONFIG_IRQ_TIME_ACCOUNTING=n correctly.

       - Handles the whole idle task

       - Accounts directly to kernel stats, without midlayer accumulator.

   Cons:
       - Doesn't elapse when the tick is off, which doesn't make it
         suitable for online CPUs.

       - Has TICK_NSEC granularity (jiffies)

       - Needs to track the dyntick-idle ticks that were accounted and
         substract them from the total jiffies time spent while the tick
         was stopped. This is an ugly workaround.

Having two different accounting for a single context is not the only
problem: since those accountings are of different natures, it is
possible to observe the global idle time going backward after a CPU goes
offline.

Clean up the situation with introducing a hybrid approach that stays
coherent and works for both online and offline CPUs:

* Tick based or native vtime accounting operate before the idle loop
  is entered and resume once the idle loop prepares to exit.

* When the idle loop starts, switch to dynticks-idle accounting as is
  done currently, except that the statistics accumulate directly to the
  relevant kernel stat fields.

* Private dyntick cputime accounting fields are removed.

* Works on both online and offline case.

Further improvement will include:

* Only switch to dynticks-idle cputime accounting when the tick actually
  goes in dynticks mode.

* Handle CONFIG_IRQ_TIME_ACCOUNTING=n correctly such that the
  dynticks-idle accounting still elapses while on IRQs.

* Correctly substract idle steal cputime from idle time

Reported-by: Xin Zhao <jackzxcui1989@163.com>
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/kernel_stat.h | 24 ++++++++++---
 include/linux/vtime.h       |  7 +++-
 kernel/sched/cputime.c      | 62 ++++++++++++++++----------------
 kernel/time/tick-sched.c    | 72 +++++++++++--------------------------
 4 files changed, 77 insertions(+), 88 deletions(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index dd020ecaf67b..ba65aad308a1 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -34,6 +34,9 @@ enum cpu_usage_stat {
 };
 
 struct kernel_cpustat {
+#ifdef CONFIG_NO_HZ_COMMON
+	int idle_dyntick;
+#endif
 	u64 cpustat[NR_STATS];
 };
 
@@ -99,6 +102,20 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
 	return kstat_cpu(cpu).irqs_sum;
 }
 
+#ifdef CONFIG_NO_HZ_COMMON
+extern void kcpustat_dyntick_start(void);
+extern void kcpustat_dyntick_stop(void);
+static inline bool kcpustat_idle_dyntick(void)
+{
+	return __this_cpu_read(kernel_cpustat.idle_dyntick);
+}
+#else
+static inline bool kcpustat_idle_dyntick(void)
+{
+	return false;
+}
+#endif /* CONFIG_NO_HZ_COMMON */
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
 extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
 extern void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu);
@@ -113,7 +130,7 @@ static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
 	*dst = kcpustat_cpu(cpu);
 }
 
-#endif
+#endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
 
 extern void account_user_time(struct task_struct *, u64);
 extern void account_guest_time(struct task_struct *, u64);
@@ -127,14 +144,13 @@ extern u64 get_idle_time(struct kernel_cpustat *kcs, int cpu);
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 static inline void account_process_tick(struct task_struct *tsk, int user)
 {
-	vtime_flush(tsk);
+	if (!kcpustat_idle_dyntick())
+		vtime_flush(tsk);
 }
 #else
 extern void account_process_tick(struct task_struct *, int user);
 #endif
 
-extern void account_idle_ticks(unsigned long ticks);
-
 #ifdef CONFIG_SCHED_CORE
 extern void __account_forceidle_time(struct task_struct *tsk, u64 delta);
 #endif
diff --git a/include/linux/vtime.h b/include/linux/vtime.h
index 10cdb08f960b..43934ff20c4a 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -32,6 +32,11 @@ static inline bool vtime_generic_enabled_cpu(int cpu)
 	return context_tracking_enabled_cpu(cpu);
 }
 
+static inline bool vtime_generic_enabled_this_cpu(void)
+{
+	return context_tracking_enabled_this_cpu();
+}
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 extern void vtime_account_irq(struct task_struct *tsk, unsigned int offset);
 extern void vtime_account_softirq(struct task_struct *tsk);
@@ -90,7 +95,7 @@ static inline bool vtime_accounting_enabled_cpu(int cpu)
 
 static inline bool vtime_accounting_enabled_this_cpu(void)
 {
-	return context_tracking_enabled_this_cpu();
+	return vtime_generic_enabled_this_cpu();
 }
 
 extern void vtime_task_switch_generic(struct task_struct *prev);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index f32c169da11a..c10fcc3d65b3 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -400,16 +400,30 @@ static void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 	}
 }
 
-static void irqtime_account_idle_ticks(int ticks)
-{
-	irqtime_account_process_tick(current, 0, ticks);
-}
 #else /* !CONFIG_IRQ_TIME_ACCOUNTING: */
-static inline void irqtime_account_idle_ticks(int ticks) { }
 static inline void irqtime_account_process_tick(struct task_struct *p, int user_tick,
 						int nr_ticks) { }
 #endif /* !CONFIG_IRQ_TIME_ACCOUNTING */
 
+#ifdef CONFIG_NO_HZ_COMMON
+void kcpustat_dyntick_start(void)
+{
+	if (!vtime_generic_enabled_this_cpu()) {
+		vtime_dyntick_start();
+		__this_cpu_write(kernel_cpustat.idle_dyntick, 1);
+	}
+}
+
+void kcpustat_dyntick_stop(void)
+{
+	if (!vtime_generic_enabled_this_cpu()) {
+		__this_cpu_write(kernel_cpustat.idle_dyntick, 0);
+		vtime_dyntick_stop();
+		steal_account_process_time(ULONG_MAX);
+	}
+}
+#endif /* CONFIG_NO_HZ_COMMON */
+
 /*
  * Use precise platform statistics if available:
  */
@@ -423,11 +437,15 @@ void vtime_account_irq(struct task_struct *tsk, unsigned int offset)
 		vtime_account_hardirq(tsk);
 	} else if (pc & SOFTIRQ_OFFSET) {
 		vtime_account_softirq(tsk);
-	} else if (!IS_ENABLED(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE) &&
-		   is_idle_task(tsk)) {
-		vtime_account_idle(tsk);
+	} else if (!kcpustat_idle_dyntick()) {
+		if (!IS_ENABLED(CONFIG_HAVE_VIRT_CPU_ACCOUNTING_IDLE) &&
+		    is_idle_task(tsk)) {
+			vtime_account_idle(tsk);
+		} else {
+			vtime_account_kernel(tsk);
+		}
 	} else {
-		vtime_account_kernel(tsk);
+		vtime_reset();
 	}
 }
 
@@ -469,6 +487,9 @@ void account_process_tick(struct task_struct *p, int user_tick)
 	if (vtime_accounting_enabled_this_cpu())
 		return;
 
+	if (kcpustat_idle_dyntick())
+		return;
+
 	if (irqtime_enabled()) {
 		irqtime_account_process_tick(p, user_tick, 1);
 		return;
@@ -490,29 +511,6 @@ void account_process_tick(struct task_struct *p, int user_tick)
 		account_idle_time(cputime);
 }
 
-/*
- * Account multiple ticks of idle time.
- * @ticks: number of stolen ticks
- */
-void account_idle_ticks(unsigned long ticks)
-{
-	u64 cputime, steal;
-
-	if (irqtime_enabled()) {
-		irqtime_account_idle_ticks(ticks);
-		return;
-	}
-
-	cputime = ticks * TICK_NSEC;
-	steal = steal_account_process_time(ULONG_MAX);
-
-	if (steal >= cputime)
-		return;
-
-	cputime -= steal;
-	account_idle_time(cputime);
-}
-
 /*
  * Adjust tick based cputime random precision against scheduler runtime
  * accounting.
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index f1d07a0276a5..74c97ad75856 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -285,8 +285,6 @@ static void tick_sched_handle(struct tick_sched *ts, struct pt_regs *regs)
 	if (IS_ENABLED(CONFIG_NO_HZ_COMMON) &&
 	    tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
 		touch_softlockup_watchdog_sched();
-		if (is_idle_task(current))
-			ts->idle_jiffies++;
 		/*
 		 * In case the current tick fired too early past its expected
 		 * expiration, make sure we don't bypass the next clock reprogramming
@@ -744,8 +742,12 @@ static void tick_nohz_update_jiffies(ktime_t now)
 
 static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
 {
+	u64 *cpustat = kcpustat_this_cpu->cpustat;
 	ktime_t delta;
 
+	if (vtime_generic_enabled_this_cpu())
+		return;
+
 	if (WARN_ON_ONCE(!tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)))
 		return;
 
@@ -753,9 +755,9 @@ static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
 
 	write_seqcount_begin(&ts->idle_sleeptime_seq);
 	if (nr_iowait_cpu(smp_processor_id()) > 0)
-		ts->iowait_sleeptime = ktime_add(ts->iowait_sleeptime, delta);
+		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
 	else
-		ts->idle_sleeptime = ktime_add(ts->idle_sleeptime, delta);
+		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
 
 	ts->idle_entrytime = now;
 	tick_sched_flag_clear(ts, TS_FLAG_IDLE_ACTIVE);
@@ -766,17 +768,21 @@ static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
 
 static void tick_nohz_start_idle(struct tick_sched *ts)
 {
+	if (vtime_generic_enabled_this_cpu())
+		return;
+
 	write_seqcount_begin(&ts->idle_sleeptime_seq);
 	ts->idle_entrytime = ktime_get();
 	tick_sched_flag_set(ts, TS_FLAG_IDLE_ACTIVE);
 	write_seqcount_end(&ts->idle_sleeptime_seq);
-
 	sched_clock_idle_sleep_event();
 }
 
-static u64 get_cpu_sleep_time_us(struct tick_sched *ts, ktime_t *sleeptime,
+static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
 				 bool compute_delta, u64 *last_update_time)
 {
+	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
+	u64 *cpustat = kcpustat_cpu(cpu).cpustat;
 	ktime_t now, idle;
 	unsigned int seq;
 
@@ -793,9 +799,9 @@ static u64 get_cpu_sleep_time_us(struct tick_sched *ts, ktime_t *sleeptime,
 		if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE) && compute_delta) {
 			ktime_t delta = ktime_sub(now, ts->idle_entrytime);
 
-			idle = ktime_add(*sleeptime, delta);
+			idle = ktime_add(cpustat[idx], delta);
 		} else {
-			idle = *sleeptime;
+			idle = cpustat[idx];
 		}
 	} while (read_seqcount_retry(&ts->idle_sleeptime_seq, seq));
 
@@ -822,9 +828,7 @@ static u64 get_cpu_sleep_time_us(struct tick_sched *ts, ktime_t *sleeptime,
  */
 u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
 {
-	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-
-	return get_cpu_sleep_time_us(ts, &ts->idle_sleeptime,
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE,
 				     !nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
@@ -848,9 +852,7 @@ EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
  */
 u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 {
-	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-
-	return get_cpu_sleep_time_us(ts, &ts->iowait_sleeptime,
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT,
 				     nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
@@ -1250,10 +1252,8 @@ void tick_nohz_idle_stop_tick(void)
 		ts->idle_sleeps++;
 		ts->idle_expires = expires;
 
-		if (!was_stopped && tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
-			ts->idle_jiffies = ts->last_jiffies;
+		if (!was_stopped && tick_sched_flag_test(ts, TS_FLAG_STOPPED))
 			nohz_balance_enter_idle(cpu);
-		}
 	} else {
 		tick_nohz_retain_tick(ts);
 	}
@@ -1282,6 +1282,7 @@ void tick_nohz_idle_enter(void)
 	WARN_ON_ONCE(ts->timer_expires_base);
 
 	tick_sched_flag_set(ts, TS_FLAG_INIDLE);
+	kcpustat_dyntick_start();
 	tick_nohz_start_idle(ts);
 
 	local_irq_enable();
@@ -1407,37 +1408,12 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
 	return ts->idle_calls;
 }
 
-static void tick_nohz_account_idle_time(struct tick_sched *ts,
-					ktime_t now)
-{
-	unsigned long ticks;
-
-	ts->idle_exittime = now;
-
-	if (vtime_accounting_enabled_this_cpu())
-		return;
-	/*
-	 * We stopped the tick in idle. update_process_times() would miss the
-	 * time we slept, as it does only a 1 tick accounting.
-	 * Enforce that this is accounted to idle !
-	 */
-	ticks = jiffies - ts->idle_jiffies;
-	/*
-	 * We might be one off. Do not randomly account a huge number of ticks!
-	 */
-	if (ticks && ticks < LONG_MAX)
-		account_idle_ticks(ticks);
-}
-
 void tick_nohz_idle_restart_tick(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
-	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
-		ktime_t now = ktime_get();
-		tick_nohz_restart_sched_tick(ts, now);
-		tick_nohz_account_idle_time(ts, now);
-	}
+	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
+		tick_nohz_restart_sched_tick(ts, ktime_get());
 }
 
 static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
@@ -1446,8 +1422,6 @@ static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
 		__tick_nohz_full_update_tick(ts, now);
 	else
 		tick_nohz_restart_sched_tick(ts, now);
-
-	tick_nohz_account_idle_time(ts, now);
 }
 
 /**
@@ -1489,6 +1463,7 @@ void tick_nohz_idle_exit(void)
 
 	if (tick_stopped)
 		tick_nohz_idle_update_tick(ts, now);
+	kcpustat_dyntick_stop();
 
 	local_irq_enable();
 }
@@ -1625,20 +1600,15 @@ void tick_setup_sched_timer(bool hrtimer)
 void tick_sched_timer_dying(int cpu)
 {
 	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-	ktime_t idle_sleeptime, iowait_sleeptime;
 	unsigned long idle_calls, idle_sleeps;
 
 	/* This must happen before hrtimers are migrated! */
 	if (tick_sched_flag_test(ts, TS_FLAG_HIGHRES))
 		hrtimer_cancel(&ts->sched_timer);
 
-	idle_sleeptime = ts->idle_sleeptime;
-	iowait_sleeptime = ts->iowait_sleeptime;
 	idle_calls = ts->idle_calls;
 	idle_sleeps = ts->idle_sleeps;
 	memset(ts, 0, sizeof(*ts));
-	ts->idle_sleeptime = idle_sleeptime;
-	ts->iowait_sleeptime = iowait_sleeptime;
 	ts->idle_calls = idle_calls;
 	ts->idle_sleeps = idle_sleeps;
 }
-- 
2.51.1


