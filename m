Return-Path: <linuxppc-dev+bounces-15906-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57373D32E5E
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2sr4yK5z3bfY;
	Sat, 17 Jan 2026 01:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c04:e001:324:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575216;
	cv=none; b=kkP/NW1Je7h4Nm5uSduPXEoUus6G6HciiCLEu/yIMLiAPDDESTCaXUyxylQBRk/zls7nr2iGJcBVRN8vItTUo8iHZbOGMVgPjCsrI04UjPpJstFvMW+yMsxRkolJOJnbfkp5hy+1LK2YC8xXB+ztemdazwZYwlZ8bHNGbv1/LZ0ReA8M0N4iMvx/h0Si5DUvyWjOXh6j2Jo3Rcd6vnO8DvtkAwZTuEuP95tgoK10Mm1l+eUSoVlqu/4NFuUmAGgWyULdguyJ6BC62GnQZencxaXFjBnvRTnzUEebYvSZJ6NvbOuAEACrQxjmX3F/aieW5uw287RX/LgWy4A+IP9txg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575216; c=relaxed/relaxed;
	bh=R8zaGf3FT8WPV7UjXIAAJJoG6f3qvt1b9WAVmune5fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JQrO6H/bUWIljFIJVMgSvPJBEHg4/JWqR18U7yyHnWodsGu9v9pCh7vxHfHWeuDOnLpoeJH16hwA31gO5qNp6/pW3AdH4hs2lqYrQvn8mjZ/LiF1LP3b76rmKJVqG/n8wqseDWzmU6530uAu9fM7lqXaTuZBrYiD5F3GkK0prH+Npal485+X76pPzp8T9HtLN9tA2SxD2A1FQENBOlMZH4So7mgOoQ54TCqfmq5lhV4BOgZEhwOxR5Os2YNoBZ/kmj5J6uVd/N2ws7nDZLJvTyEAPnApaQ4z1tDQzz9Vj6Kpz/ZEl/+idE3pTitsHsXtFp3uLgtPn5il4ylI+DpAjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U7f1kh7r; dkim-atps=neutral; spf=pass (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=U7f1kh7r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c04:e001:324:0:1991:8:25; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [IPv6:2600:3c04:e001:324:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2sq5XVWz30hP
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:53:35 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B107060160;
	Fri, 16 Jan 2026 14:53:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4247FC19425;
	Fri, 16 Jan 2026 14:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575213;
	bh=+EcaS9wpjAI5nYExsBELcaZu8W8ohxG84dL93BxRlIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=U7f1kh7rJjODodXqRraFZwOOQ0AX4fWSIf9o/E9fD1XYzZBx+5fe236YW0A3Ve8O1
	 Rz04lUtX6W0Gw6C314tLM0ft3an+9Nd8rmqrWtM0Vhg6x0+EvQe2+e6aDyUNfLVhon
	 0A/oWIFSINFiw5FCD1JK/pclfTftfMl9sh3tJos2b6nVCiOf19VU4C3AZuhhFqDtjQ
	 QwaQZu0Nnu2URB700+D7zJp6yNwtJJ9uRVarOFgNrqtd0i5eO4zzPyC1Hmdi8COYRc
	 vyQapnbNGGxOsmIOJu1LHgQBI29sqN/KUWMmFR8J2STLF9hH/rT/6h1EPP7gcz39KZ
	 0Pk5QK2wl08WQ==
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
Subject: [PATCH 10/15] tick/sched: Remove unused fields
Date: Fri, 16 Jan 2026 15:52:03 +0100
Message-ID: <20260116145208.87445-11-frederic@kernel.org>
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

Remove fields after the dyntick-idle cputime migration to scheduler
code.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/tick-sched.h       | 12 ------------
 kernel/time/timer_list.c       |  6 +-----
 scripts/gdb/linux/timerlist.py |  4 ----
 3 files changed, 1 insertion(+), 21 deletions(-)

diff --git a/kernel/time/tick-sched.h b/kernel/time/tick-sched.h
index b4a7822f495d..79b9252047b1 100644
--- a/kernel/time/tick-sched.h
+++ b/kernel/time/tick-sched.h
@@ -44,9 +44,7 @@ struct tick_device {
  *			to resume the tick timer operation in the timeline
  *			when the CPU returns from nohz sleep.
  * @next_tick:		Next tick to be fired when in dynticks mode.
- * @idle_jiffies:	jiffies at the entry to idle for idle time accounting
  * @idle_waketime:	Time when the idle was interrupted
- * @idle_sleeptime_seq:	sequence counter for data consistency
  * @idle_entrytime:	Time when the idle call was entered
  * @last_jiffies:	Base jiffies snapshot when next event was last computed
  * @timer_expires_base:	Base time clock monotonic for @timer_expires
@@ -55,9 +53,6 @@ struct tick_device {
  * @idle_expires:	Next tick in idle, for debugging purpose only
  * @idle_calls:		Total number of idle calls
  * @idle_sleeps:	Number of idle calls, where the sched tick was stopped
- * @idle_exittime:	Time when the idle state was left
- * @idle_sleeptime:	Sum of the time slept in idle with sched tick stopped
- * @iowait_sleeptime:	Sum of the time slept in idle with sched tick stopped, with IO outstanding
  * @tick_dep_mask:	Tick dependency mask - is set, if someone needs the tick
  * @check_clocks:	Notification mechanism about clocksource changes
  */
@@ -73,12 +68,10 @@ struct tick_sched {
 	struct hrtimer			sched_timer;
 	ktime_t				last_tick;
 	ktime_t				next_tick;
-	unsigned long			idle_jiffies;
 	ktime_t				idle_waketime;
 	unsigned int			got_idle_tick;
 
 	/* Idle entry */
-	seqcount_t			idle_sleeptime_seq;
 	ktime_t				idle_entrytime;
 
 	/* Tick stop */
@@ -90,11 +83,6 @@ struct tick_sched {
 	unsigned long			idle_calls;
 	unsigned long			idle_sleeps;
 
-	/* Idle exit */
-	ktime_t				idle_exittime;
-	ktime_t				idle_sleeptime;
-	ktime_t				iowait_sleeptime;
-
 	/* Full dynticks handling */
 	atomic_t			tick_dep_mask;
 
diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 488e47e96e93..e77b512e8597 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -154,14 +154,10 @@ static void print_cpu(struct seq_file *m, int cpu, u64 now)
 		P_flag(highres, TS_FLAG_HIGHRES);
 		P_ns(last_tick);
 		P_flag(tick_stopped, TS_FLAG_STOPPED);
-		P(idle_jiffies);
 		P(idle_calls);
 		P(idle_sleeps);
 		P_ns(idle_entrytime);
 		P_ns(idle_waketime);
-		P_ns(idle_exittime);
-		P_ns(idle_sleeptime);
-		P_ns(iowait_sleeptime);
 		P(last_jiffies);
 		P(next_timer);
 		P_ns(idle_expires);
@@ -258,7 +254,7 @@ static void timer_list_show_tickdevices_header(struct seq_file *m)
 
 static inline void timer_list_header(struct seq_file *m, u64 now)
 {
-	SEQ_printf(m, "Timer List Version: v0.10\n");
+	SEQ_printf(m, "Timer List Version: v0.11\n");
 	SEQ_printf(m, "HRTIMER_MAX_CLOCK_BASES: %d\n", HRTIMER_MAX_CLOCK_BASES);
 	SEQ_printf(m, "now at %Ld nsecs\n", (unsigned long long)now);
 	SEQ_printf(m, "\n");
diff --git a/scripts/gdb/linux/timerlist.py b/scripts/gdb/linux/timerlist.py
index ccc24d30de80..c14ce55674c9 100644
--- a/scripts/gdb/linux/timerlist.py
+++ b/scripts/gdb/linux/timerlist.py
@@ -90,14 +90,10 @@ def print_cpu(hrtimer_bases, cpu, max_clock_bases):
             text += f"  .{'nohz':15s}: {int(bool(ts['flags'] & TS_FLAG_NOHZ))}\n"
             text += f"  .{'last_tick':15s}: {ts['last_tick']}\n"
             text += f"  .{'tick_stopped':15s}: {int(bool(ts['flags'] & TS_FLAG_STOPPED))}\n"
-            text += f"  .{'idle_jiffies':15s}: {ts['idle_jiffies']}\n"
             text += f"  .{'idle_calls':15s}: {ts['idle_calls']}\n"
             text += f"  .{'idle_sleeps':15s}: {ts['idle_sleeps']}\n"
             text += f"  .{'idle_entrytime':15s}: {ts['idle_entrytime']} nsecs\n"
             text += f"  .{'idle_waketime':15s}: {ts['idle_waketime']} nsecs\n"
-            text += f"  .{'idle_exittime':15s}: {ts['idle_exittime']} nsecs\n"
-            text += f"  .{'idle_sleeptime':15s}: {ts['idle_sleeptime']} nsecs\n"
-            text += f"  .{'iowait_sleeptime':15s}: {ts['iowait_sleeptime']} nsecs\n"
             text += f"  .{'last_jiffies':15s}: {ts['last_jiffies']}\n"
             text += f"  .{'next_timer':15s}: {ts['next_timer']}\n"
             text += f"  .{'idle_expires':15s}: {ts['idle_expires']} nsecs\n"
-- 
2.51.1


