Return-Path: <linuxppc-dev+bounces-15911-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B0C4D32E9A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:54:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2tY2Lw3z3cPN;
	Sat, 17 Jan 2026 01:54:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575253;
	cv=none; b=m8fM26oSPeHv4YxnWGlursHVXURrJ2T0otaT/TnenxBz4yLCxESjrSczvWEdKO2QYyF7+O5mr1flZZ2ACdly5XMMYVx+CWHgqPBDcNZVNCGGqiBrj6/6gFVbXWm5fWnAGcZO6pHDDHYY9ftmFsLDhmzMDu8blyNQlOdrA1wTvle1gcHX0/1R80OA+BooxBMdVAjOxVZ/sbedu96S3TozOlf/Y+EInurvTpMJyx+sHb77DCCLdhMH0tJE5ehhuSnfhl3wdNypFe75UAruaRjaZemz3rdtKEkf3tmGXxNsGKFeDdaCjkqdF3yj0fj510KTnafyGpR4zLH4jtG4/IXqHA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575253; c=relaxed/relaxed;
	bh=IbJ6oLZAlZNTDhovpwOtm3OEGkCm/4XH0Irjhc9gHYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y+5FK/aQmsvmyimJJUSZ1kwX5M957Zi12ZoeSMmyF5vTPzheyatpBL8JdIhXhaXblbMxtrH6AnkAcaDeV+XmASqWuK/aqIipaOnObyPTVg5lqgJkQi4Kr0r4Gi6mkZhIe32hxoR5PgwepO/uI0jHj53vuf7ekaraILDxFOfDN0Kez9pPX0FN6hB0J8CnBTierHDgoeRjm+C9hL1HfxgIuQZ4WYpuPwFJ6QD/yAVqA5e9XchDyRpEo5DEmB8YSUpSE0O0NNLIu3TOs4NY0F7BEmqxRgvksW6i79OYxSM9LxNH+x33y7tuebeYIHsQ1eQzAaKXJthm1l+URYapeQZiZw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P58I4pON; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=P58I4pON;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2tX2wWWz3bt9
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:54:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5F947601BB;
	Fri, 16 Jan 2026 14:54:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4568DC19423;
	Fri, 16 Jan 2026 14:54:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575250;
	bh=NiFNP1dNEv/R0O+iuBotsMn8keb9Y+JzQXP3O6DHJSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P58I4pONEqgRKgQ76ZkWUDt5XWzZMMI1w+pz+lcYFsRcbcsZHQupqMSvLSprbGueN
	 b+pk/yo1pIdVpFUg3JXsmxcb/PGfRQU9pNdfd8Jr9hk0A1q6noGtXzxgWyURE9ouC3
	 1APMRpVzRm8n/zG3SHUGHD64MLVTPwa7TIMgoVeMS6BoBYJPpxS8Mw6kww+qUJDUgN
	 uiIDVVVHWgH05pom4hl7O6l7IccpprH56k6WxOcl/M06cBnf3pySTKttXVjeZktmJd
	 jPd5Cm2EqpHdhEMCmACSzFve7xNaBHvoUtLunX2kvWz82JJJyBOVA8xHbLW4Ftq6Hh
	 ouLpAwlTIoQ0g==
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
Subject: [PATCH 15/15] sched/cputime: Handle dyntick-idle steal time correctly
Date: Fri, 16 Jan 2026 15:52:08 +0100
Message-ID: <20260116145208.87445-16-frederic@kernel.org>
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

The dyntick-idle steal time is currently accounted when the tick
restarts but the stolen idle time is not substracted from the idle time
that was already accounted. This is to avoid observing the idle time
going backward as the dyntick-idle cputime accessors can't reliably know
in advance the stolen idle time.

In order to maintain a forward progressing idle cputime while
substracting idle steal time from it, keep track of the previously
accounted idle stolen time and substract it from _later_ idle cputime
accounting.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/kernel_stat.h | 1 +
 kernel/sched/cputime.c      | 9 ++++++++-
 2 files changed, 9 insertions(+), 1 deletion(-)

diff --git a/include/linux/kernel_stat.h b/include/linux/kernel_stat.h
index e59916477075..a5b5a25c3cc1 100644
--- a/include/linux/kernel_stat.h
+++ b/include/linux/kernel_stat.h
@@ -39,6 +39,7 @@ struct kernel_cpustat {
 	bool		idle_elapse;
 	seqcount_t	idle_sleeptime_seq;
 	ktime_t		idle_entrytime;
+	u64		idle_steal;
 #endif
 	u64		cpustat[NR_STATS];
 };
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 3dadfaa92b27..749a6ed4d2fa 100644
--- a/kernel/sched/cputime.c
+++ b/kernel/sched/cputime.c
@@ -424,18 +424,25 @@ static void kcpustat_idle_stop(struct kernel_cpustat *kc, ktime_t now)
 {
 	u64 *cpustat = kc->cpustat;
 	ktime_t delta;
+	u64 steal, steal_delta;
 
 	if (!kc->idle_elapse)
 		return;
 
 	delta = ktime_sub(now, kc->idle_entrytime);
+	steal = steal_account_process_time(delta);
 
 	write_seqcount_begin(&kc->idle_sleeptime_seq);
+	steal_delta = min_t(u64, kc->idle_steal, delta);
+	delta -= steal_delta;
+	kc->idle_steal -= steal_delta;
+
 	if (nr_iowait_cpu(smp_processor_id()) > 0)
 		cpustat[CPUTIME_IOWAIT] = ktime_add(cpustat[CPUTIME_IOWAIT], delta);
 	else
 		cpustat[CPUTIME_IDLE] = ktime_add(cpustat[CPUTIME_IDLE], delta);
 
+	kc->idle_steal += steal;
 	kc->idle_entrytime = now;
 	kc->idle_elapse = false;
 	write_seqcount_end(&kc->idle_sleeptime_seq);
@@ -459,7 +466,6 @@ void kcpustat_dyntick_stop(ktime_t now)
 		kc->idle_dyntick = false;
 		irqtime_dyntick_stop();
 		vtime_dyntick_stop();
-		steal_account_process_time(ULONG_MAX);
 	}
 }
 
@@ -507,6 +513,7 @@ static u64 kcpustat_field_dyntick(int cpu, enum cpu_usage_stat idx,
 		if (kc->idle_elapse && compute_delta) {
 			ktime_t delta = ktime_sub(now, kc->idle_entrytime);
 
+			delta -= min_t(u64, kc->idle_steal, (u64)delta);
 			idle = ktime_add(cpustat[idx], delta);
 		} else {
 			idle = cpustat[idx];
-- 
2.51.1


