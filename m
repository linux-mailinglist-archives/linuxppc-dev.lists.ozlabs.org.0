Return-Path: <linuxppc-dev+bounces-15907-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 43BD6D32E6D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2t00ySVz3bjN;
	Sat, 17 Jan 2026 01:53:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575224;
	cv=none; b=JtUCMByd8SlGuq8l4C4RjG8PkEHEb6mACPNT4GccjdDCWIZmfGqqWr6zgppi6xHSqJNQsUrFO/CZxm69zQnll2rlvrNBMdbJxyIlsfQWuXujJqbqwKW5nYK32MEJWLMpLMhMS2SMTtEu9bEJ4Yv41tSrRRC83451jHloGDn7IbB1uamN94DkDxhwcshMx2pS52s3kNdpmci188BbVCFSYeYF8mdxLyP1MONHeSnBNxZZ5YYuSHY+j4Mnq7bPCiPsmiVOGRwx6nd5Tcy8qN48+ONldaYikjpkRkAJvwyubz+/U1N/TiHxnRZmY8sW0GbK29vsqebYVtrg3mmYp7O+Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575224; c=relaxed/relaxed;
	bh=n8VnwAWr4jqdfU/KPr6cKdj7EIwiAbxs4OxWVp4iIAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhaPNpIDPE9ENy56iiqFGHsJ2bv2eRycWEsf+l3rt+R0t5e2WI9oyB2GTm+IMCgWzmoc7TLQ8Rk6VXVAzZsjclMEHtMDGM0Xa/dxCiMpHZ1TMSGnaVKACuk2rrLHYJobtzNVA+FHcCOplM0bBiHK1SiOY6iMKMY9g9mFk3hZgxwx5TC9oQAwJ+0MTLX+PwAvajDO8qTeAMdtM+s0hUwlcxLt3gXoqOMWfaQFOw1wd+XBXG+u1/Vh46mr5s0jTMgjxxAIUR5rwxBIEBX3xx5+XEjTJxNPHtKnmxg+/LvfWctZbN6HU2W3JeKsljaUS+XCHsZaxYiivlxlQRQjxwDHnw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=majYxb9z; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=majYxb9z;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2sz1kH9z2xnj
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:43 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 33AA8601B4;
	Fri, 16 Jan 2026 14:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD3A9C116C6;
	Fri, 16 Jan 2026 14:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575220;
	bh=cektvtI2SQiWO5ottxWjn0y5YqwpxHFc7QfJqdyaGjA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=majYxb9zCy1nbQRA1636ysfFV2EK0/qpH4WyUbSc4F11FOMivnoCU9dWsqRzdXQgO
	 0MLmU7Iotug0Svmin6qEo2i1OFpka0D0pxed3kZHXuclBjeyOb9jqgwcmlGfY4sDbp
	 gTbntQVtC6lzNf/gQvADwtKPpq2oBLDumuiuXSG3Kg2h0ar+0eIT8+KEN/d045w8+6
	 82dvl0WaoB4Ywhlw/3Uf6eUdwdbcpYIAG4ZCujx8X6rcyhTTcP/60iw490KEUqeb80
	 dw8qTk9m3iTx/4o116/7uPT8R2t7A6lLVjoZoB8HZ9lBMYbZRP+h+TxnFcGco+/gcK
	 ynzL8m/vHtxdg==
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
Subject: [PATCH 11/15] tick/sched: Account tickless idle cputime only when tick is stopped
Date: Fri, 16 Jan 2026 15:52:04 +0100
Message-ID: <20260116145208.87445-12-frederic@kernel.org>
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

There is no real point in switching to dyntick-idle cputime accounting
mode if the tick is not actually stopped. This just adds overhead,
notably fetching the GTOD, on each idle exit and each idle IRQ entry for
no reason during short idle trips.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/tick-sched.c | 44 ++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 24 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index cbd645fb8df6..05da130d257a 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -1135,8 +1135,10 @@ void tick_nohz_idle_stop_tick(void)
 		ts->idle_sleeps++;
 		ts->idle_expires = expires;
 
-		if (!was_stopped && tick_sched_flag_test(ts, TS_FLAG_STOPPED))
+		if (!was_stopped && tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
+			kcpustat_dyntick_start(ts->idle_entrytime);
 			nohz_balance_enter_idle(cpu);
+		}
 	} else {
 		tick_nohz_retain_tick(ts);
 	}
@@ -1177,7 +1179,6 @@ void tick_nohz_idle_enter(void)
 	ts = this_cpu_ptr(&tick_cpu_sched);
 	WARN_ON_ONCE(ts->timer_expires_base);
 	ts->idle_entrytime = ktime_get();
-	kcpustat_dyntick_start(ts->idle_entrytime);
 	tick_nohz_clock_sleep(ts);
 
 	local_irq_enable();
@@ -1207,9 +1208,10 @@ void tick_nohz_irq_exit(void)
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
 	if (tick_sched_flag_test(ts, TS_FLAG_INIDLE)) {
-		ts->idle_entrytime = ktime_get();
-		kcpustat_irq_exit(ts->idle_entrytime);
 		tick_nohz_clock_sleep(ts);
+		ts->idle_entrytime = ktime_get();
+		if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
+			kcpustat_irq_exit(ts->idle_entrytime);
 	} else {
 		tick_nohz_full_update_tick(ts);
 	}
@@ -1310,8 +1312,11 @@ void tick_nohz_idle_restart_tick(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 
-	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
-		tick_nohz_restart_sched_tick(ts, ktime_get());
+	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
+		ktime_t now = ktime_get();
+		kcpustat_dyntick_stop(now);
+		tick_nohz_restart_sched_tick(ts, now);
+	}
 }
 
 static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
@@ -1341,7 +1346,6 @@ static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
 void tick_nohz_idle_exit(void)
 {
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
-	bool idle_active, tick_stopped;
 	ktime_t now;
 
 	local_irq_disable();
@@ -1350,18 +1354,13 @@ void tick_nohz_idle_exit(void)
 	WARN_ON_ONCE(ts->timer_expires_base);
 
 	tick_sched_flag_clear(ts, TS_FLAG_INIDLE);
-	idle_active = tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE);
-	tick_stopped = tick_sched_flag_test(ts, TS_FLAG_STOPPED);
+	tick_nohz_clock_wakeup(ts);
 
-	if (idle_active || tick_stopped)
+	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED)) {
 		now = ktime_get();
-
-	if (idle_active)
-		tick_nohz_clock_wakeup(ts);
-
-	if (tick_stopped)
+		kcpustat_dyntick_stop(now);
 		tick_nohz_idle_update_tick(ts, now);
-	kcpustat_dyntick_stop(now);
+	}
 
 	local_irq_enable();
 }
@@ -1415,15 +1414,13 @@ static inline void tick_nohz_irq_enter(void)
 	struct tick_sched *ts = this_cpu_ptr(&tick_cpu_sched);
 	ktime_t now;
 
-	if (!tick_sched_flag_test(ts, TS_FLAG_STOPPED | TS_FLAG_IDLE_ACTIVE))
+	tick_nohz_clock_wakeup(ts);
+
+	if (!tick_sched_flag_test(ts, TS_FLAG_STOPPED))
 		return;
 
 	now = ktime_get();
-
-	if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE)) {
-		tick_nohz_clock_wakeup(ts);
-		kcpustat_irq_enter(now);
-	}
+	kcpustat_irq_enter(now);
 
 	/*
 	 * If all CPUs are idle we may need to update a stale jiffies value.
@@ -1432,8 +1429,7 @@ static inline void tick_nohz_irq_enter(void)
 	 * rare case (typically stop machine). So we must make sure we have a
 	 * last resort.
 	 */
-	if (tick_sched_flag_test(ts, TS_FLAG_STOPPED))
-		tick_nohz_update_jiffies(now);
+	tick_nohz_update_jiffies(now);
 }
 
 #else
-- 
2.51.1


