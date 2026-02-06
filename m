Return-Path: <linuxppc-dev+bounces-16680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCB7G5f5hWlEIwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16680-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:24:23 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 74637FED4C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:24:22 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xDM3sD4z3bkL;
	Sat, 07 Feb 2026 01:24:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387859;
	cv=none; b=hzFHQHMu6+k68wToz+1h4U/dVj4d2voukDMQ32+WSke6t9AV6lpM5gNr6ake4cbGU/lfLrp/WPXUV2Le6viXcIGkCXFekc86PiAmJ8oC6tTHpU5jmeFiQFLvOjIIAxNaId3wgBkZhHaVQn43bWjq0ICXGxj5y2YROvshHK/uE7J/k6M4SU2PFee0GlY6CH6TmHCWWMRq2ncuRG46ka49tGg38+cqEyaFYj1NkqLGln0QLWXrDNK8SmSAlvW9q6O68QUMkyf/apyfxT9vgmyxQF1j5lYY6cIBMB38kQQyxv1odUSL22tea2qr+Bk29yJWjRZGSPRcJpm7gb9LOj7veA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387859; c=relaxed/relaxed;
	bh=R8zaGf3FT8WPV7UjXIAAJJoG6f3qvt1b9WAVmune5fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kLQVg7L1wb+UqNiz2Q5SGM9vtPgMEYF8ue2zzje7t2+iX6DWKxBNTYnlVbGMRRHAE9tg/e2S8ZVGFt+gz69DzWNnSz6gmMVSyKa83D5nZviB76KOX0E5EVKSaYqJqLZpqABR5l+ddE1Z+yatFeV8HYMa9pdi5eHkOu0BlBa8qwtNfD9YUBCxwLF3XEmoc0y+OLDbRAd9Nm1XB8cfTOS0/l9yV63wURmueBHKXYiYa0qpw9tCCIZsPpfp0GFXUPN75g/mR3Fr6U/T/sF/wpnuS1unh5y9y0Q97pn5g4qNUuWgYWGyIvmveenoGUxRRY8/mWQ1T5lU31YbSmWqw0Dd1g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GGt7uhGg; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GGt7uhGg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xDL5G40z30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:24:18 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 241BE43493;
	Fri,  6 Feb 2026 14:24:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B39C4C19421;
	Fri,  6 Feb 2026 14:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387857;
	bh=+EcaS9wpjAI5nYExsBELcaZu8W8ohxG84dL93BxRlIw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GGt7uhGgdfn/qTXYNfVirakaELJhXF1cQom9lCy+xWNR1NRHpLbDYvvRVJxyQdfIO
	 UTt6ynULkVtYtWROVD1Vam+xUXFqff8GWwTEgIs+OXx96Ad9LSn1eRszqA8NLDypdC
	 /9o1J8IT+0hjlkLxFvhgut5S63r3IyCR9AwNosfJ7ZJhHSgqzghAUFrZYhN18Ntu5j
	 +sR3iRCTUXtJmujbbURmvCNYZSoCb0/bt9UGoW3pKBYPB/S1EbCNv6Q5FrP0C/d1YU
	 yjWz5AVtQXxK40Ps91hx2GeC0ai6KNMpnmCDnzTkKCOjb8SjoXRQZKORvKBdB4Sg5H
	 0DqwO4r8eBmmw==
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
Subject: [PATCH 10/15] tick/sched: Remove unused fields
Date: Fri,  6 Feb 2026 15:22:40 +0100
Message-ID: <20260206142245.58987-11-frederic@kernel.org>
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
	R_SPF_ALLOW(-0.20)[+ip4:112.213.38.117:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-16680-lists,linuxppc-dev=lfdr.de];
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
	ASN(0.00)[asn:133159, ipnet:112.213.32.0/21, country:AU];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: 74637FED4C
X-Rspamd-Action: no action

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


