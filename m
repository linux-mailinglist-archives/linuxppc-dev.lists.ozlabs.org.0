Return-Path: <linuxppc-dev+bounces-16672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gH8PFFj5hWl7IwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16672-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6803DFECBE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xC81xkrz3bkL;
	Sat, 07 Feb 2026 01:23:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387796;
	cv=none; b=U/c+9YkmHRv4UYa0sdMVdKOjd0zR8/UbdVVcnQE80XgF+Ji8CwMD2lruuqxQ6op2C7vXignH+ENx0skwnhYrFShsmfti9NZBDtAkgu2ssPmFADlEdjKUDR4dQhDF125iZT1ufYO7Dt0IBuJG6vfzmNnSS59DjRRlirmdodyY7Ay8B6vvcDw6IvDfACMChw4VcCVjHoy2jH8pt8uYVJZsPkgcv5a9mEgTFjRSbyJuFKVpDNKkzs8HG++ib0hr/sSnuRGhYDXtS7CMCrE5EbWJeFJSlf6vwASsvyN1lObLYPMBQpFaUIDLl9cDNZsqmPr3hQ7EovBXvDWLh6t0Yd2SEA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387796; c=relaxed/relaxed;
	bh=0b6DGWtNHp8iHX57UB5UmDq6xXVWItBxry1sN4NZrjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HFVJQppsw1jP/hK2b1qgBuogN2bGc74H6MxRyBhg7MzOAj2G4dHVRsU44i+cSFK3VKuXjU9qogASeQBEW1gARTsHv1L0q9Drurivmr8teOEvS+NB+u6vHaZnpeQOWIPzay+Pp25QOdskENbot6++OLh5G02Ev8y7Xx/Z4lQYDQAhUodx0EemmoZpsDWhLbJbX9oEVSMSPbe93zdgvFg10jiM4ZIXrcdeCuYbVcLX1+H5hAhwWoDM6nq4GWdRejFmsWUPtG/KnOm9QTrZFItLuDT+BLVQiAPRg0MgtqBEab13SuGY2i6BtJZ1iT8DEzZ1aUZ1YUxSS1hvqdfK3FsRlA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U/R+hWp2; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U/R+hWp2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xC72XMTz2xpg
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:23:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3AC886001A;
	Fri,  6 Feb 2026 14:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F6FDC116C6;
	Fri,  6 Feb 2026 14:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387792;
	bh=LzZmy6jqMt6NobQKkguWtqCpma0/ISXupISgS1lOgXU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U/R+hWp20w6WR9wbISxrYpIFFmsig+ITL1xt4J7YCi9YrVgSWZVjaE/RifELVM5NW
	 w6p6Q+TwOhS+atviKJwHZcnXE5cweK8V8QlaQ+a0Hv0OJ7MC9iRcs9Lih+6MAqwMUc
	 s9ok9Hr2/T7R6lOhqa4tuoX5hwm42XPcb5mB+wm6VRVep3WawJI5hMBwWZEExEGe5X
	 V4cS4jtoRLfQIaW7ivr+gMO7a1qdbqWAxL1gw4/2Lw5h8A0+NffM9QNY2bJHk+Gfi5
	 /0dXEgD1/rFpNVbOPPFhtUPFxTe8o652LxIUa+gyc8Sl+9hBv1NWzdn9h1GlOrjOew
	 89qITlYW13c2g==
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
Subject: [PATCH 02/15] sched/cputime: Remove superfluous and error prone kcpustat_field() parameter
Date: Fri,  6 Feb 2026 15:22:32 +0100
Message-ID: <20260206142245.58987-3-frederic@kernel.org>
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
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[generic];
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[36];
	TAGGED_FROM(0.00)[bounces-16672-lists,linuxppc-dev=lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:frederic@kernel.org,m:chleroy@kernel.org,m:rafael@kernel.org,m:agordeev@linux.ibm.com,m:anna-maria@linutronix.de,m:bsegall@google.com,m:boqun.feng@gmail.com,m:borntraeger@linux.ibm.com,m:dietmar.eggemann@arm.com,m:hca@linux.ibm.com,m:mingo@redhat.com,m:jan.kiszka@siemens.com,m:joelagnelf@nvidia.com,m:juri.lelli@redhat.com,m:kbingham@kernel.org,m:maddy@linux.ibm.com,m:mgorman@suse.de,m:mpe@ellerman.id.au,m:neeraj.upadhyay@kernel.org,m:npiggin@gmail.com,m:paulmck@kernel.org,m:peterz@infradead.org,m:rostedt@goodmis.org,m:svens@linux.ibm.com,m:tglx@linutronix.de,m:urezki@gmail.com,m:vschneid@redhat.com,m:gor@linux.ibm.com,m:vincent.guittot@linaro.org,m:viresh.kumar@linaro.org,m:jackzxcui1989@163.com,m:linux-pm@vger.kernel.org,m:linux-s390@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:sshegde@linux.ibm.com,m:boqunfeng@gmail.com,s:lists@lfdr.de];
	DKIM_TRACE(0.00)[kernel.org:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	NEURAL_HAM(-0.00)[-0.997];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[frederic@kernel.org,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[kernel.org,linux.ibm.com,linutronix.de,google.com,gmail.com,arm.com,redhat.com,siemens.com,nvidia.com,suse.de,ellerman.id.au,infradead.org,goodmis.org,linaro.org,163.com,vger.kernel.org,lists.ozlabs.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: 6803DFECBE
X-Rspamd-Action: no action

The first parameter to kcpustat_field() is a pointer to the cpu kcpustat
to be fetched from. This parameter is error prone because a copy to a
kcpustat could be passed by accident instead of the original one. Also
the kcpustat structure can already be retrieved with the help of the
mandatory CPU argument.

Remove the needless paramater.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 drivers/cpufreq/cpufreq_governor.c | 6 +++---
 drivers/macintosh/rack-meter.c     | 2 +-
 include/linux/kernel_stat.h        | 8 +++-----
 kernel/rcu/tree.c                  | 9 +++------
 kernel/rcu/tree_stall.h            | 7 +++----
 kernel/sched/cputime.c             | 5 ++---
 6 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
index 1a7fcaf39cc9..b6683628091d 100644
--- a/drivers/cpufreq/cpufreq_governor.c
+++ b/drivers/cpufreq/cpufreq_governor.c
@@ -105,7 +105,7 @@ void gov_update_cpu_data(struct dbs_data *dbs_data)
 			j_cdbs->prev_cpu_idle = get_cpu_idle_time(j, &j_cdbs->prev_update_time,
 								  dbs_data->io_is_busy);
 			if (dbs_data->ignore_nice_load)
-				j_cdbs->prev_cpu_nice = kcpustat_field(&kcpustat_cpu(j), CPUTIME_NICE, j);
+				j_cdbs->prev_cpu_nice = kcpustat_field(CPUTIME_NICE, j);
 		}
 	}
 }
@@ -165,7 +165,7 @@ unsigned int dbs_update(struct cpufreq_policy *policy)
 		j_cdbs->prev_cpu_idle = cur_idle_time;
 
 		if (ignore_nice) {
-			u64 cur_nice = kcpustat_field(&kcpustat_cpu(j), CPUTIME_NICE, j);
+			u64 cur_nice = kcpustat_field(CPUTIME_NICE, j);
 
 			idle_time += div_u64(cur_nice - j_cdbs->prev_cpu_nice, NSEC_PER_USEC);
 			j_cdbs->prev_cpu_nice = cur_nice;
@@ -539,7 +539,7 @@ int cpufreq_dbs_governor_start(struct cpufreq_policy *policy)
 		j_cdbs->prev_load = 0;
 
 		if (ignore_nice)
-			j_cdbs->prev_cpu_nice = kcpustat_field(&kcpustat_cpu(j), CPUTIME_NICE, j);
+			j_cdbs->prev_cpu_nice = kcpustat_field(CPUTIME_NICE, j);
 	}
 
 	gov->start(policy);
diff --git a/drivers/macintosh/rack-meter.c b/drivers/macintosh/rack-meter.c
index 896a43bd819f..20b2ecd32340 100644
--- a/drivers/macintosh/rack-meter.c
+++ b/drivers/macintosh/rack-meter.c
@@ -87,7 +87,7 @@ static inline u64 get_cpu_idle_time(unsigned int cpu)
 		 kcpustat->cpustat[CPUTIME_IOWAIT];
 
 	if (rackmeter_ignore_nice)
-		retval += kcpustat_field(kcpustat, CPUTIME_NICE, cpu);
+		retval += kcpustat_field(CPUTIME_NICE, cpu);
 
 	return retval;
 }
diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index b97ce2df376f..dd020ecaf67b 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -100,14 +100,12 @@ static inline unsigned long kstat_cpu_irqs_sum(unsigned int cpu)
 }
 
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
-extern u64 kcpustat_field(struct kernel_cpustat *kcpustat,
-			  enum cpu_usage_stat usage, int cpu);
+extern u64 kcpustat_field(enum cpu_usage_stat usage, int cpu);
 extern void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu);
 #else
-static inline u64 kcpustat_field(struct kernel_cpustat *kcpustat,
-				 enum cpu_usage_stat usage, int cpu)
+static inline u64 kcpustat_field(enum cpu_usage_stat usage, int cpu)
 {
-	return kcpustat->cpustat[usage];
+	return kcpustat_cpu(cpu).cpustat[usage];
 }
 
 static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 293bbd9ac3f4..ceea4b2f755b 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -968,14 +968,11 @@ static int rcu_watching_snap_recheck(struct rcu_data *rdp)
 		if (rcu_cpu_stall_cputime && rdp->snap_record.gp_seq != rdp->gp_seq) {
 			int cpu = rdp->cpu;
 			struct rcu_snap_record *rsrp;
-			struct kernel_cpustat *kcsp;
-
-			kcsp = &kcpustat_cpu(cpu);
 
 			rsrp = &rdp->snap_record;
-			rsrp->cputime_irq     = kcpustat_field(kcsp, CPUTIME_IRQ, cpu);
-			rsrp->cputime_softirq = kcpustat_field(kcsp, CPUTIME_SOFTIRQ, cpu);
-			rsrp->cputime_system  = kcpustat_field(kcsp, CPUTIME_SYSTEM, cpu);
+			rsrp->cputime_irq     = kcpustat_field(CPUTIME_IRQ, cpu);
+			rsrp->cputime_softirq = kcpustat_field(CPUTIME_SOFTIRQ, cpu);
+			rsrp->cputime_system  = kcpustat_field(CPUTIME_SYSTEM, cpu);
 			rsrp->nr_hardirqs = kstat_cpu_irqs_sum(cpu) + arch_irq_stat_cpu(cpu);
 			rsrp->nr_softirqs = kstat_cpu_softirqs_sum(cpu);
 			rsrp->nr_csw = nr_context_switches_cpu(cpu);
diff --git a/kernel/rcu/tree_stall.h b/kernel/rcu/tree_stall.h
index b67532cb8770..cf7ae51cba40 100644
--- a/kernel/rcu/tree_stall.h
+++ b/kernel/rcu/tree_stall.h
@@ -479,7 +479,6 @@ static void print_cpu_stat_info(int cpu)
 {
 	struct rcu_snap_record rsr, *rsrp;
 	struct rcu_data *rdp = per_cpu_ptr(&rcu_data, cpu);
-	struct kernel_cpustat *kcsp = &kcpustat_cpu(cpu);
 
 	if (!rcu_cpu_stall_cputime)
 		return;
@@ -488,9 +487,9 @@ static void print_cpu_stat_info(int cpu)
 	if (rsrp->gp_seq != rdp->gp_seq)
 		return;
 
-	rsr.cputime_irq     = kcpustat_field(kcsp, CPUTIME_IRQ, cpu);
-	rsr.cputime_softirq = kcpustat_field(kcsp, CPUTIME_SOFTIRQ, cpu);
-	rsr.cputime_system  = kcpustat_field(kcsp, CPUTIME_SYSTEM, cpu);
+	rsr.cputime_irq     = kcpustat_field(CPUTIME_IRQ, cpu);
+	rsr.cputime_softirq = kcpustat_field(CPUTIME_SOFTIRQ, cpu);
+	rsr.cputime_system  = kcpustat_field(CPUTIME_SYSTEM, cpu);
 
 	pr_err("\t         hardirqs   softirqs   csw/system\n");
 	pr_err("\t number: %8lld %10d %12lld\n",
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 4f97896887ec..5dcb0f2e01bc 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -961,10 +961,9 @@ static int kcpustat_field_vtime(u64 *cpustat,
 	return 0;
 }
 
-u64 kcpustat_field(struct kernel_cpustat *kcpustat,
-		   enum cpu_usage_stat usage, int cpu)
+u64 kcpustat_field(enum cpu_usage_stat usage, int cpu)
 {
-	u64 *cpustat = kcpustat->cpustat;
+	u64 *cpustat = kcpustat_cpu(cpu).cpustat;
 	u64 val = cpustat[usage];
 	struct rq *rq;
 	int err;
-- 
2.51.1


