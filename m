Return-Path: <linuxppc-dev+bounces-16677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6DhLNH75hWlEIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16677-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:58 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D72FECFE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:58 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xCv6qDcz3bf4;
	Sat, 07 Feb 2026 01:23:55 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387835;
	cv=none; b=gobd3M2AZPz0GEb2opjK5JnYmYF0a7x3Qn0msFG6KBmkcqKvNgPghRXix6idmvY58AELwHLKPeCvqtN002ApwkxDpACYxzP2TutY1ACx2tyz+cfj8grUqfeJU+i08M2RdtbdY4l6DkgE0NIYkSwJ7vlbhFbNh46SqLoTh1+w9qMpKqnTkorrSuhN9dtZy8rryrBXCSi34E7hTFQ4b1HObYRlEhdob7RIUcplXR0QoSv6/qf8qc2j/ZbryAwxGnKb0Z06Os0PZkhLxcQG84RHxknJFlrCRJXYMMJHOP/VxxaXU4cNeZrYEjRIlSInMKcKTetDxZCMLhhEMdHrei5b0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387835; c=relaxed/relaxed;
	bh=4uIkRrPXY9GYTf9xbstNuVUo+IaCiB7eP37WQUsHVGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JezZjF9FjSxWMuR7FK80X2c8zJ3VXxp2XXTFKSIoxJPZeZ0wr3be3OxVXLw/KHPRXgTqLbNkfeXhT+JiXxIHLYZeNPSOTeebUtRS733YkH8bFt02CJ+nwKDfIIQkWj3Y7F3Qmt5XFkV538ETYHXJC1RetSfnOBIn3AFwtNyhN5IcB36FKGfogHJ5GWXluaD8pUsHlTW+fzBB7iF7kCah9DMfHvfGkZ5k9vEkQ7vuypta8PpsaEev6w5PPHCfnV2MImoF4FsCrUC7rOiWU0RNmq1C2e5FO7x1vO8qbcRjPjLGyF7vispqbBXJf8tR64qoWJUK+ll7hEXtKdVR68MIdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFmGLTxE; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=kFmGLTxE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xCv1LQSz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:23:55 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9B1B3441C4;
	Fri,  6 Feb 2026 14:23:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0AE5C116C6;
	Fri,  6 Feb 2026 14:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387833;
	bh=E9zTeO5x+KjyNgewXK9Mi3ZXHv+NiD0HDMZoN+zshlE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kFmGLTxEaIrIJJzRiPyrmfO9obNPSzQIgdiRScbMZu6qmx1Q6FtQ3R9Aw+6E8sRP1
	 3HtC8F8wo9w5y4hyRZiXDWe6Yoq2bgTp2n8jPUF3eJ6HQBvK+/pJ9k1rbP08KaVmzm
	 ZlV4GHCqJz3b4bCL4bpJyQm/uQ7FP1PYUfH4bOW6rvOZ1dWtTlSgNXYl+BX1RnSr67
	 yzI4+xZbT6c/vJnJYNf9zWE2vAXmLgUjA2AWtc/XVqEC4McNjBgteT+FxFDp9kUWts
	 KcmTfBVhmkCrD0QQgxfkHNsLefiRvPn55fMJFTNwmnJgP5m43MOuO0Hw8OxB1AGwKO
	 cytjZ4krynFmA==
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
	linuxppc-dev@lists.ozlabs.org,
	Shrikanth Hegde <sshegde@linux.ibm.com>
Subject: [PATCH 07/15] cpufreq: ondemand: Simplify idle cputime granularity test
Date: Fri,  6 Feb 2026 15:22:37 +0100
Message-ID: <20260206142245.58987-8-frederic@kernel.org>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20260206142245.58987-1-frederic@kernel.org>
References: <20260206142245.58987-1-frederic@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.79 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16677-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:frederic@kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sshegde@linux.ibm.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	RCPT_COUNT_TWELVE(0.00)[36];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.997];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 35D72FECFE
X-Rspamd-Action: no action

cpufreq calls get_cpu_idle_time_us() just to know if idle cputime
accounting has a nanoseconds granularity.

Use the appropriate indicator instead to make that deduction.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/cpufreq/cpufreq_ondemand.c | 7 +------
 include/linux/tick.h               | 2 ++
 kernel/time/hrtimer.c              | 2 +-
 kernel/time/tick-internal.h        | 2 --
 kernel/time/tick-sched.c           | 8 +++++++-
 kernel/time/timer.c                | 2 +-
 6 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
index a6ecc203f7b7..bb7db82930e4 100644
--- a/drivers/cpufreq/cpufreq_ondemand.c
+++ b/drivers/cpufreq/cpufreq_ondemand.c
@@ -334,17 +334,12 @@ static void od_free(struct policy_dbs_info *policy_dbs)
 static int od_init(struct dbs_data *dbs_data)
 {
 	struct od_dbs_tuners *tuners;
-	u64 idle_time;
-	int cpu;
 
 	tuners = kzalloc(sizeof(*tuners), GFP_KERNEL);
 	if (!tuners)
 		return -ENOMEM;
 
-	cpu = get_cpu();
-	idle_time = get_cpu_idle_time_us(cpu, NULL);
-	put_cpu();
-	if (idle_time != -1ULL) {
+	if (tick_nohz_is_active()) {
 		/* Idle micro accounting is supported. Use finer thresholds */
 		dbs_data->up_threshold = MICRO_FREQUENCY_UP_THRESHOLD;
 	} else {
diff --git a/include/linux/tick.h b/include/linux/tick.h
index ac76ae9fa36d..738007d6f577 100644
--- a/include/linux/tick.h
+++ b/include/linux/tick.h
@@ -126,6 +126,7 @@ enum tick_dep_bits {
 
 #ifdef CONFIG_NO_HZ_COMMON
 extern bool tick_nohz_enabled;
+extern bool tick_nohz_is_active(void);
 extern bool tick_nohz_tick_stopped(void);
 extern bool tick_nohz_tick_stopped_cpu(int cpu);
 extern void tick_nohz_idle_stop_tick(void);
@@ -142,6 +143,7 @@ extern u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time);
 extern u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time);
 #else /* !CONFIG_NO_HZ_COMMON */
 #define tick_nohz_enabled (0)
+static inline bool tick_nohz_is_active(void) { return false; }
 static inline int tick_nohz_tick_stopped(void) { return 0; }
 static inline int tick_nohz_tick_stopped_cpu(int cpu) { return 0; }
 static inline void tick_nohz_idle_stop_tick(void) { }
diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index f8ea8c8fc895..e1bbf883dfa8 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -943,7 +943,7 @@ void clock_was_set(unsigned int bases)
 	cpumask_var_t mask;
 	int cpu;
 
-	if (!hrtimer_hres_active(cpu_base) && !tick_nohz_active)
+	if (!hrtimer_hres_active(cpu_base) && !tick_nohz_is_active())
 		goto out_timerfd;
 
 	if (!zalloc_cpumask_var(&mask, GFP_KERNEL)) {
diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
index 4e4f7bbe2a64..597d816d22e8 100644
--- a/kernel/time/tick-internal.h
+++ b/kernel/time/tick-internal.h
@@ -156,7 +156,6 @@ static inline void tick_nohz_init(void) { }
 #endif
 
 #ifdef CONFIG_NO_HZ_COMMON
-extern unsigned long tick_nohz_active;
 extern void timers_update_nohz(void);
 extern u64 get_jiffies_update(unsigned long *basej);
 # ifdef CONFIG_SMP
@@ -171,7 +170,6 @@ extern void timer_expire_remote(unsigned int cpu);
 # endif
 #else /* CONFIG_NO_HZ_COMMON */
 static inline void timers_update_nohz(void) { }
-#define tick_nohz_active (0)
 #endif
 
 DECLARE_PER_CPU(struct hrtimer_cpu_base, hrtimer_bases);
diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index 21ac561a8545..81c619bf662c 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -691,7 +691,7 @@ void __init tick_nohz_init(void)
  * NO HZ enabled ?
  */
 bool tick_nohz_enabled __read_mostly  = true;
-unsigned long tick_nohz_active  __read_mostly;
+static unsigned long tick_nohz_active  __read_mostly;
 /*
  * Enable / Disable tickless mode
  */
@@ -702,6 +702,12 @@ static int __init setup_tick_nohz(char *str)
 
 __setup("nohz=", setup_tick_nohz);
 
+bool tick_nohz_is_active(void)
+{
+	return tick_nohz_active;
+}
+EXPORT_SYMBOL_GPL(tick_nohz_is_active);
+
 bool tick_nohz_tick_stopped(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
diff --git a/kernel/time/timer.c b/kernel/time/timer.c
index 1f2364126894..7e1e3bde6b8b 100644
--- a/kernel/time/timer.c
+++ b/kernel/time/timer.c
@@ -281,7 +281,7 @@ DEFINE_STATIC_KEY_FALSE(timers_migration_enabled);
 
 static void timers_update_migration(void)
 {
-	if (sysctl_timer_migration && tick_nohz_active)
+	if (sysctl_timer_migration && tick_nohz_is_active())
 		static_branch_enable(&timers_migration_enabled);
 	else
 		static_branch_disable(&timers_migration_enabled);
-- 
2.51.1


