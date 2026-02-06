Return-Path: <linuxppc-dev+bounces-16682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oFKuMab5hWlEIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16682-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:24:38 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E8EFED81
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:24:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xDg4yrWz3bt7;
	Sat, 07 Feb 2026 01:24:35 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387875;
	cv=none; b=jYSDzSMEOzCtT97+aVt9FK4urksqw9YvuXLKuyam9ogX/7QSJ2VhS9Jn+afiTg2oXCtilcCqkGApRAQsQ+7u67nDW4pPjY7l314k1+o2rVORR2uCy4ZpGRxU0T/zeE9UGYLT77XWlGYpCsp1f5moXYhCEtrr/4yFg84QusAdQiSYFmCWe6+ErdEvu8vg2w8tSsJfG+2SBe88yoUnkJWceS09vbtmMfton6p5WwZcRWhYRD1Lt7mbwLLnkE3nr2AN8KvZum1RTAn5YR5VooD+zaJK1MH8EXuZp0wYtmrOVtpqU6GTpwPSlGdvnTqDj03NJvf59DMrGWHNuMWDUFumYg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387875; c=relaxed/relaxed;
	bh=3H0UT5mmP+PzQcktmPpZqQCKp80Haya8O7/lAYYm6Qk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Yw8BAzC6MCmsNSIeYXfvXz4M4R94mhbNl5tzr7EtxEd1qjTGwzgj9hUWF6qTbx+3l1rLJie/yXj17oKT4SLkEPn8n4KmMMppF149lWB24cyW3SrAspweJniGLgT74YXZqzAFdzenNti31N1rHOpVIPNiw0CtTe/VFb3HJXwk05hRc7LDMCJd8sJDsseYXFs6UOWRP22d8d6DLf34kKoLo+dxKL4Em15ORGyzZ3t0lDbTZnO7jTJYfkVfuB/PLQUgxGspZirqvPkryW0DCqcSafPaMOfquK+4kZTDF+JxVWu263rxfmiJam5qkR8WM8ejH9AMcKac8agGh77mhCpFTg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jxn/Mj8d; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jxn/Mj8d;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xDf5cvyz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:24:34 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A9DB960010;
	Fri,  6 Feb 2026 14:24:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DEBDC116C6;
	Fri,  6 Feb 2026 14:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387872;
	bh=//EtvZKobCna72857H6n33BD/elKdPC5DUmkUub5hKc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jxn/Mj8dW/tra7FN7+Oh0XhZYfX0wbnou8S3FdxKUXiEMky/8nSQDiLRjlzM/rUUO
	 te0/HNoMSmI13uUW/ooM9bmU9XpsxfQz4TN3tesCUnifM+Yu2KNpCdxGKaXDj6b78n
	 a4R0Y0hhfgn8WJbHFteRCXJyW3rlzkMU5Nwu8RETbokq3a5pSagIqo0Ya/6hY4oMXy
	 W33IgloZg45tGo/OezgaM8d0hFIpf89sG43oO711GotnRxCB9Cp260IaDW98W9duu1
	 /TFJ4VLUlrx7eD0Nng1scT2+/7DfVKdQF6TjjgQFr2CJvsirtt4VGEDZq5h6ZasAiM
	 kMIq1rWI8aNJQ==
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
Subject: [PATCH 12/15] tick/sched: Consolidate idle time fetching APIs
Date: Fri,  6 Feb 2026 15:22:42 +0100
Message-ID: <20260206142245.58987-13-frederic@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-16682-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 11E8EFED81
X-Rspamd-Action: no action

Fetching the idle cputime is available through a variety of accessors
all over the place depending on the different accounting flavours and
needs:

- idle vtime generic accounting can be accessed by kcpustat_field(),
  kcpustat_cpu_fetch(), get_idle/iowait_time() and
  get_cpu_idle/iowait_time_us()

- dynticks-idle accounting can only be accessed by get_idle/iowait_time()
  or get_cpu_idle/iowait_time_us()

- CONFIG_NO_HZ_COMMON=n idle accounting can be accessed by kcpustat_field()
  kcpustat_cpu_fetch(), or get_idle/iowait_time() but not by
  get_cpu_idle/iowait_time_us()

Moreover get_idle/iowait_time() relies on get_cpu_idle/iowait_time_us()
with a non-sensical conversion to microseconds and back to nanoseconds
on the way.

Start consolidating the APIs with removing get_idle/iowait_time() and
make kcpustat_field() and kcpustat_cpu_fetch() work for all cases.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 fs/proc/stat.c              | 40 +++---------------------
 fs/proc/uptime.c            |  8 ++---
 include/linux/kernel_stat.h | 34 ++++++++++++++++++---
 kernel/sched/cputime.c      | 61 ++++++++++++++++++++++++-------------
 4 files changed, 76 insertions(+), 67 deletions(-)

diff --git a/fs/proc/stat.c b/fs/proc/stat.c
index 8b444e862319..c00468a83f64 100644
--- a/fs/proc/stat.c
+++ b/fs/proc/stat.c
@@ -22,38 +22,6 @@
 #define arch_irq_stat() 0
 #endif
 
-u64 get_idle_time(struct kernel_cpustat *kcs, int cpu)
-{
-	u64 idle, idle_usecs = -1ULL;
-
-	if (cpu_online(cpu))
-		idle_usecs = get_cpu_idle_time_us(cpu, NULL);
-
-	if (idle_usecs == -1ULL)
-		/* !NO_HZ or cpu offline so we can rely on cpustat.idle */
-		idle = kcs->cpustat[CPUTIME_IDLE];
-	else
-		idle = idle_usecs * NSEC_PER_USEC;
-
-	return idle;
-}
-
-static u64 get_iowait_time(struct kernel_cpustat *kcs, int cpu)
-{
-	u64 iowait, iowait_usecs = -1ULL;
-
-	if (cpu_online(cpu))
-		iowait_usecs = get_cpu_iowait_time_us(cpu, NULL);
-
-	if (iowait_usecs == -1ULL)
-		/* !NO_HZ or cpu offline so we can rely on cpustat.iowait */
-		iowait = kcs->cpustat[CPUTIME_IOWAIT];
-	else
-		iowait = iowait_usecs * NSEC_PER_USEC;
-
-	return iowait;
-}
-
 static void show_irq_gap(struct seq_file *p, unsigned int gap)
 {
 	static const char zeros[] = " 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0";
@@ -105,8 +73,8 @@ static int show_stat(struct seq_file *p, void *v)
 		user		+= cpustat[CPUTIME_USER];
 		nice		+= cpustat[CPUTIME_NICE];
 		system		+= cpustat[CPUTIME_SYSTEM];
-		idle		+= get_idle_time(&kcpustat, i);
-		iowait		+= get_iowait_time(&kcpustat, i);
+		idle		+= cpustat[CPUTIME_IDLE];
+		iowait		+= cpustat[CPUTIME_IOWAIT];
 		irq		+= cpustat[CPUTIME_IRQ];
 		softirq		+= cpustat[CPUTIME_SOFTIRQ];
 		steal		+= cpustat[CPUTIME_STEAL];
@@ -146,8 +114,8 @@ static int show_stat(struct seq_file *p, void *v)
 		user		= cpustat[CPUTIME_USER];
 		nice		= cpustat[CPUTIME_NICE];
 		system		= cpustat[CPUTIME_SYSTEM];
-		idle		= get_idle_time(&kcpustat, i);
-		iowait		= get_iowait_time(&kcpustat, i);
+		idle		= cpustat[CPUTIME_IDLE];
+		iowait		= cpustat[CPUTIME_IOWAIT];
 		irq		= cpustat[CPUTIME_IRQ];
 		softirq		= cpustat[CPUTIME_SOFTIRQ];
 		steal		= cpustat[CPUTIME_STEAL];
diff --git a/fs/proc/uptime.c b/fs/proc/uptime.c
index b5343d209381..433aa947cd57 100644
--- a/fs/proc/uptime.c
+++ b/fs/proc/uptime.c
@@ -18,12 +18,8 @@ static int uptime_proc_show(struct seq_file *m, void *v)
 	int i;
 
 	idle_nsec = 0;
-	for_each_possible_cpu(i) {
-		struct kernel_cpustat kcs;
-
-		kcpustat_cpu_fetch(&kcs, i);
-		idle_nsec += get_idle_time(&kcs, i);
-	}
+	for_each_possible_cpu(i)
+		idle_nsec += kcpustat_field(CPUTIME_IDLE, i);
 
 	ktime_get_boottime_ts64(&uptime);
 	timens_add_boottime(&uptime);
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index 9343353ac7a3..3680519d7b2c 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -110,32 +110,59 @@ extern void kcpustat_dyntick_start(u64 now);
 extern void kcpustat_dyntick_stop(u64 now);
 extern void kcpustat_irq_enter(u64 now);
 extern void kcpustat_irq_exit(u64 now);
+extern u64 kcpustat_field_idle(int cpu);
+extern u64 kcpustat_field_iowait(int cpu);
 
 static inline bool kcpustat_idle_dyntick(void)
 {
 	return __this_cpu_read(kernel_cpustat.idle_dyntick);
 }
 #else
+static inline u64 kcpustat_field_idle(int cpu)
+{
+	return kcpustat_cpu(cpu).cpustat[CPUTIME_IDLE];
+}
+static inline u64 kcpustat_field_iowait(int cpu)
+{
+	return kcpustat_cpu(cpu).cpustat[CPUTIME_IOWAIT];
+}
+
 static inline bool kcpustat_idle_dyntick(void)
 {
 	return false;
 }
 #endif /* CONFIG_NO_HZ_COMMON */
 
+/* Fetch cputime values when vtime is disabled on a CPU */
+static inline u64 kcpustat_field_default(enum cpu_usage_stat usage, int cpu)
+{
+	if (usage == CPUTIME_IDLE)
+		return kcpustat_field_idle(cpu);
+	if (usage == CPUTIME_IOWAIT)
+		return kcpustat_field_iowait(cpu);
+	return kcpustat_cpu(cpu).cpustat[usage];
+}
+
+static inline void kcpustat_cpu_fetch_default(struct kernel_cpustat *dst, int cpu)
+{
+	*dst = kcpustat_cpu(cpu);
+	dst->cpustat[CPUTIME_IDLE] = kcpustat_field_idle(cpu);
+	dst->cpustat[CPUTIME_IOWAIT] = kcpustat_field_iowait(cpu);
+}
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
 extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
 extern void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu);
 #else
 static inline u64 kcpustat_field(enum cpu_usage_stat usage, int cpu)
 {
-	return kcpustat_cpu(cpu).cpustat[usage];
+	return kcpustat_field_default(usage, cpu);
 }
 
 static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
 {
-	*dst = kcpustat_cpu(cpu);
+	kcpustat_cpu_fetch_default(dst, cpu);
 }
-
 #endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
 
 extern void account_user_time(struct task_struct *, u64);
@@ -145,7 +172,6 @@ extern void account_system_index_time(struct task_struct *, u64,
 				      enum cpu_usage_stat);
 extern void account_steal_time(u64);
 extern void account_idle_time(u64);
-extern u64 get_idle_time(struct kernel_cpustat *kcs, int cpu);
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 static inline void account_process_tick(struct task_struct *tsk, int user)
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index d2cad4d8dc10..057fdc00dbc6 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -476,24 +476,14 @@ void kcpustat_irq_exit(u64 now)
 		kcpustat_idle_start(kc, now);
 }
 
-static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
-				 bool compute_delta, u64 *last_update_time)
+static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
+				  bool compute_delta, u64 now)
 {
 	struct kernel_cpustat *kc = &kcpustat_cpu(cpu);
 	u64 *cpustat = kc->cpustat;
 	unsigned int seq;
-	ktime_t now;
 	u64 idle;
 
-	now = ktime_get();
-	if (last_update_time)
-		*last_update_time = ktime_to_us(now);
-
-	if (vtime_generic_enabled_cpu(cpu)) {
-		idle = kcpustat_field(idx, cpu);
-		goto to_us;
-	}
-
 	do {
 		seq = read_seqcount_begin(&kc->idle_sleeptime_seq);
 
@@ -503,12 +493,42 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
 			idle = cpustat[idx];
 	} while (read_seqcount_retry(&kc->idle_sleeptime_seq, seq));
 
-to_us:
-	do_div(idle, NSEC_PER_USEC);
-
 	return idle;
 }
 
+u64 kcpustat_field_idle(int cpu)
+{
+	return kcpustat_field_dyntick(cpu, CPUTIME_IDLE,
+				      !nr_iowait_cpu(cpu), ktime_get());
+}
+EXPORT_SYMBOL_GPL(kcpustat_field_idle);
+
+u64 kcpustat_field_iowait(int cpu)
+{
+	return kcpustat_field_dyntick(cpu, CPUTIME_IOWAIT,
+				      nr_iowait_cpu(cpu), ktime_get());
+}
+EXPORT_SYMBOL_GPL(kcpustat_field_iowait);
+
+static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
+				 bool compute_delta, u64 *last_update_time)
+{
+	ktime_t now = ktime_get();
+	u64 res;
+
+	if (vtime_generic_enabled_cpu(cpu))
+		res = kcpustat_field(idx, cpu);
+	else
+		res = kcpustat_field_dyntick(cpu, idx, compute_delta, now);
+
+	do_div(res, NSEC_PER_USEC);
+
+	if (last_update_time)
+		*last_update_time = res;
+
+	return res;
+}
+
 /**
  * get_cpu_idle_time_us - get the total idle time of a CPU
  * @cpu: CPU number to query
@@ -556,7 +576,6 @@ u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 				     nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
-
 #endif /* CONFIG_NO_HZ_COMMON */
 
 /*
@@ -1110,8 +1129,8 @@ u64 kcpustat_field(enum cpu_usage_stat usage, int cpu)
 	struct rq *rq;
 	int err;
 
-	if (!vtime_accounting_enabled_cpu(cpu))
-		return val;
+	if (!vtime_generic_enabled_cpu(cpu))
+		return kcpustat_field_default(usage, cpu);
 
 	rq = cpu_rq(cpu);
 
@@ -1206,8 +1225,8 @@ void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
 	struct rq *rq;
 	int err;
 
-	if (!vtime_accounting_enabled_cpu(cpu)) {
-		*dst = *src;
+	if (!vtime_generic_enabled_cpu(cpu)) {
+		kcpustat_cpu_fetch_default(dst, cpu);
 		return;
 	}
 
@@ -1220,7 +1239,7 @@ void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
 		curr = rcu_dereference(rq->curr);
 		if (WARN_ON_ONCE(!curr)) {
 			rcu_read_unlock();
-			*dst = *src;
+			kcpustat_cpu_fetch_default(dst, cpu);
 			return;
 		}
 
-- 
2.51.1


