Return-Path: <linuxppc-dev+bounces-15909-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9E9D32E85
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:54:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2tF5y01z3bsC;
	Sat, 17 Jan 2026 01:53:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575237;
	cv=none; b=FQR0OSLf0dHPwWAxmpd77BojpSRcAeutlMt9ULIJFrkvrurBvQkR7X7jAZDCUzO2h6fw2LhKm1CDzSH1Txeg7acd1CJtzCMvh2bA2z8W3bnIcrJp2s1Z5Go7WK5jISOqey+CQQ1GK9CLJ1FVd4SVCmUSzKGnS9MVvwmGpvplcI7i8sUt8q9UPm9ZkuavNHxfzGvOJVao8kvEPy4qTJIaKg4/m7gb09+AamVXz9TJ04LiQrUWompwfeLsDMNTfAgaOkdJbMMxNxu78Iu8oXlN4OAdArO3Xdh7/y+6SmU32tU/i8MjM4dBPwfCcUMDFzVgsK2JdM1MrK7dwadtIuy+1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575237; c=relaxed/relaxed;
	bh=62KRpDA45sMEUK+dTQ/CIpSYuFIvBbU2FIQ0enGwxOc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NGqsVoMimgsWhXHMrw5fOz0Km5nO54D8W1i3cSDlV+vDk52cvfSQeCG+9Oc5fLpCD5o0Yuwvu8PCvzFGaJFjk3idOnyaIfPF+bOpZnLfDKOkHou+qq1b2IQr8NlTrk/xOm/LHTm8xJvWfKmw8FDzDmRa/Nhq8k/S3fviA2oCU6gt0i89Oy0XgryORJFrD+hFYFx9nmnpt/kqI1xO6kkgWAY3kAoGvVA7u+4sVIcNqEr1bKgYGY7nTfQ9XuEx6tZl37iaIIUMSaZFhMl9WozsL6lTZCna3CA2ZPYFQZeh5QWeFDdSjy0/Y4rTYd1QTZ0Faor2OiCMI/T7sPE20RIgAg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QTuE+pev; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QTuE+pev;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2tF1XxWz3bkq
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9D5434199D;
	Fri, 16 Jan 2026 14:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BFCFC116C6;
	Fri, 16 Jan 2026 14:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575235;
	bh=8v3ULYDqt0dF0OoyYvjCFXVF3r/R8dp2K5PMXJFm6yY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QTuE+pevi7Ewtc5J4XzS2UyPIDX6nKym9hfu473HaWWIdWlledSc2OUe2hDm9GjOu
	 aIpXiBUIscS+O2fSFPLXX3Tag46bUkGLCfL75SiNLjoAITlPVWYZuanFHF6VjbaKdw
	 daTCh/g4e/qMOdWH3BpJWKAuEzWjK/sDbXfsXBnjZ5mVW6FI5Z33aH80Afp37MySD8
	 Jxi8QkRD+ZeXuYuXyAgdatTG1bSK6XRmNw9+ZaYjhhSMzGB8vaMxhspoZJfxHBSPo3
	 CkHOTOCFZB2yfJWRjUQfoFmcssxDFrE+v0AAlOiNVBOdxgzmUMTuR4lKnN+oaWQQoG
	 mNnXatX/ElVkg==
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
Subject: [PATCH 13/15] sched/cputime: Consolidate get_cpu_[idle|iowait]_time_us()
Date: Fri, 16 Jan 2026 15:52:06 +0100
Message-ID: <20260116145208.87445-14-frederic@kernel.org>
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

get_cpu_idle/iowait_time_us() may ultimately fail if generic vtime
accounting is enabled.

The ad-hoc replacement solution by cpufreq is to compute jiffies minus
the whole busy cputime. Although the intention should provide a coherent
low resolution estimation of the idle and iowait time, the
implementation is buggy because jiffies don't start at 0.

Enhance instead get_cpu_[idle|iowait]_time_us() to provide support for
vtime generic accounting.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/cpufreq/cpufreq.c   | 29 +----------------------------
 include/linux/kernel_stat.h |  3 +++
 include/linux/tick.h        |  4 ----
 kernel/sched/cputime.c      | 14 ++++++++++----
 4 files changed, 14 insertions(+), 36 deletions(-)

diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
index 4472bb1ec83c..ecb9634cd06b 100644
--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -130,38 +130,11 @@ struct kobject *get_governor_parent_kobj(struct cpufreq_policy *policy)
 }
 EXPORT_SYMBOL_GPL(get_governor_parent_kobj);
 
-static inline u64 get_cpu_idle_time_jiffy(unsigned int cpu, u64 *wall)
-{
-	struct kernel_cpustat kcpustat;
-	u64 cur_wall_time;
-	u64 idle_time;
-	u64 busy_time;
-
-	cur_wall_time = jiffies64_to_nsecs(get_jiffies_64());
-
-	kcpustat_cpu_fetch(&kcpustat, cpu);
-
-	busy_time = kcpustat.cpustat[CPUTIME_USER];
-	busy_time += kcpustat.cpustat[CPUTIME_SYSTEM];
-	busy_time += kcpustat.cpustat[CPUTIME_IRQ];
-	busy_time += kcpustat.cpustat[CPUTIME_SOFTIRQ];
-	busy_time += kcpustat.cpustat[CPUTIME_STEAL];
-	busy_time += kcpustat.cpustat[CPUTIME_NICE];
-
-	idle_time = cur_wall_time - busy_time;
-	if (wall)
-		*wall = div_u64(cur_wall_time, NSEC_PER_USEC);
-
-	return div_u64(idle_time, NSEC_PER_USEC);
-}
-
 u64 get_cpu_idle_time(unsigned int cpu, u64 *wall, int io_busy)
 {
 	u64 idle_time = get_cpu_idle_time_us(cpu, io_busy ? wall : NULL);
 
-	if (idle_time == -1ULL)
-		return get_cpu_idle_time_jiffy(cpu, wall);
-	else if (!io_busy)
+	if (!io_busy)
 		idle_time += get_cpu_iowait_time_us(cpu, wall);
 
 	return idle_time;
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index e1efd26e56f0..e59916477075 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -133,6 +133,9 @@ static inline bool kcpustat_idle_dyntick(void)
 }
 #endif /* CONFIG_NO_HZ_COMMON */
 
+extern u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time);
+extern u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time);
+
 /* Fetch cputime values when vtime is disabled on a CPU */
 static inline u64 kcpustat_field_default(enum cpu_usage_stat usage, int cpu)
 {
diff --git a/include/linux/tick.h b/include/linux/tick.h
index ac76ae9fa36d..1296cba67bee 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -138,8 +138,6 @@ extern bool tick_nohz_idle_got_tick(void);
 extern ktime_t tick_nohz_get_next_hrtimer(void);
 extern ktime_t tick_nohz_get_sleep_length(ktime_t *delta_next);
 extern unsigned long tick_nohz_get_idle_calls_cpu(int cpu);
-extern u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time);
-extern u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time);
 #else /* !CONFIG_NO_HZ_COMMON */
 #define tick_nohz_enabled (0)
 static inline int tick_nohz_tick_stopped(void) { return 0; }
@@ -160,8 +158,6 @@ static inline ktime_t tick_nohz_get_sleep_length(ktime_t *delta_next)
 	*delta_next = TICK_NSEC;
 	return *delta_next;
 }
-static inline u64 get_cpu_idle_time_us(int cpu, u64 *unused) { return -1; }
-static inline u64 get_cpu_iowait_time_us(int cpu, u64 *unused) { return -1; }
 #endif /* !CONFIG_NO_HZ_COMMON */
 
 /*
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 9906abe5d7bc..f0620b429698 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -511,6 +511,13 @@ u64 kcpustat_field_iowait(int cpu)
 				      nr_iowait_cpu(cpu), ktime_get());
 }
 EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
+#else
+static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
+				  bool compute_delta, ktime_t now)
+{
+	return kcpustat_cpu(cpu).cpustat[idx];
+}
+#endif /* CONFIG_NO_HZ_COMMON */
 
 static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
 				 bool compute_delta, u64 *last_update_time)
@@ -519,7 +526,7 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
 	u64 res;
 
 	if (vtime_generic_enabled_cpu(cpu))
-		return -1;
+		res = kcpustat_field(idx, cpu);
 	else
 		res = kcpustat_field_dyntick(cpu, idx, compute_delta, now);
 
@@ -544,7 +551,7 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
  * This time is measured via accounting rather than sampling,
  * and is as accurate as ktime_get() is.
  *
- * Return: -1 if generic vtime is enabled, else total idle time of the @cpu
+ * Return: total idle time of the @cpu
  */
 u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
 {
@@ -568,7 +575,7 @@ EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
  * This time is measured via accounting rather than sampling,
  * and is as accurate as ktime_get() is.
  *
- * Return: -1 if generic vtime is enabled, else total iowait time of @cpu
+ * Return: total iowait time of @cpu
  */
 u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 {
@@ -576,7 +583,6 @@ u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 				     nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
-#endif /* CONFIG_NO_HZ_COMMON */
 
 /*
  * Use precise platform statistics if available:
-- 
2.51.1


