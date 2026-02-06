Return-Path: <linuxppc-dev+bounces-16676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCxkCXf5hWl7IwQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-16676-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:51 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 397B6FECF0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 06 Feb 2026 15:23:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4f6xCl6xJLz30hP;
	Sat, 07 Feb 2026 01:23:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2600:3c0a:e001:78e:0:1991:8:25"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1770387827;
	cv=none; b=YQ2OxX5/H5+ROqs1Vakfz8F/igLKj/nhH8tOlr/y46PCbhUZjv1mBKEEazS6N85mKWx6EO+NQwKhzar/gKm80hWXR1P2T7ibNcVdQcDlMtpVfsR5XXFE81GkAvETiGnMHpsGBiHkKazmraKqdEiNaU/VqwEzpyTsswwAjnoSd+R+Qbq9MhUnk4mhhGEYVFzvGKU+gVZOLpjMkRA9xd13XVDAr23XAm0yhge1esLC4roDXwAh64PR2PYSinkT7uiQ0+EtmQULy5G5BTAugQRN50h3MhyJsO5I4eAR7KQNQqcCdcGrW4w6tz5IPnwk7EMAW5ixQxSy6lkFOCF/W9aTfA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1770387827; c=relaxed/relaxed;
	bh=POPibxyOagzVcT4hEx7uaFzz58paGMOC47VaH5n/Ja4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlW0u1ri0kJ0bf2hUVKtWeDmBv7x37gdGbhs3HAqubkPoCbZyIHDr0DwhR90o+3TQtKCcyPFxYX7PYqDiUfusOHezh7QHPBFMkr141oKqsYswJVlRxtKmGWFsOnIiowRkqCOHu3ciDcyQA4bNe6GUm2fGw3b5DAYuqGz5uBM81lOW4fQNCTXH9V0d/ET8mCpJX40Bv6VuDfgiZm+341F7xy0Y9yVNZiOkri4RtytpwJ0jshbDDqkCxmhlbmzp/4rILLT7o6jZ74ro6KCAePjthOjID1u6Za2Zijqn0Az+wk+40DiZPLMMuRGDdml6PrrPXIM5ffRv0RXrnRI2H0amQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QuJHwKim; dkim-atps=neutral; spf=pass (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=QuJHwKim;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2600:3c0a:e001:78e:0:1991:8:25; helo=sea.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [IPv6:2600:3c0a:e001:78e:0:1991:8:25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4f6xCl1JLxz30BR
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 07 Feb 2026 01:23:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8BA6543DF2;
	Fri,  6 Feb 2026 14:23:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D1A3C19421;
	Fri,  6 Feb 2026 14:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770387825;
	bh=IbgsIe5v0OELV1evugyCjy9XF5xOTfRaayo/oBM79xA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QuJHwKimvlBEaQIGoSfFSWw9NDTB7xFmowSy62HChbpxS8iy3G+mEUj/wfuxFrlaE
	 5hlfMtG5hGCbjdTWRYDmBMTIihoVaqilYpYvD9QU9kQ6AachZN8IyGaj2td+xbxux/
	 ziugIIhogKJsFFPVS0cGD14tRHv0HmYpbgHrfxT2azEbcVAR/exVFgxbXwtKy0bFfy
	 3jx44jWh2QRHMP8YVaVpd14C/ZoX7UPxx8SCWU2xJKxGCnq98MSRk000APsyz7ADnJ
	 CprSaCtnWDCODM1IuvJgTrafHPo/iNsOQioAH7uPH4P3yz/+Mc6pMcntIGR8IqS19d
	 p5OM+KulhxrQg==
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
Subject: [PATCH 06/15] tick/sched: Unify idle cputime accounting
Date: Fri,  6 Feb 2026 15:22:36 +0100
Message-ID: <20260206142245.58987-7-frederic@kernel.org>
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
	TAGGED_FROM(0.00)[bounces-16676-lists,linuxppc-dev=lfdr.de];
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
X-Rspamd-Queue-Id: 397B6FECF0
X-Rspamd-Action: no action

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
 kernel/time/tick-sched.c    | 71 +++++++++++--------------------------
 4 files changed, 76 insertions(+), 88 deletions(-)

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
index 61b94c12d7dd..a4506336002d 100644
--- a/include/linux/vtime.h
+++ b/include/linux/vtime.h
@@ -31,6 +31,11 @@ static inline bool vtime_generic_enabled_cpu(int cpu)
 	return context_tracking_enabled_cpu(cpu);
 }
 
+static inline bool vtime_generic_enabled_this_cpu(void)
+{
+	return context_tracking_enabled_this_cpu();
+}
+
 #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
 extern void vtime_account_idle(struct task_struct *tsk);
 extern void vtime_account_irq(struct task_struct *tsk, unsigned int offset);
@@ -90,7 +95,7 @@ static inline bool vtime_accounting_enabled_cpu(int cpu)
 
 static inline bool vtime_accounting_enabled_this_cpu(void)
 {
-	return context_tracking_enabled_this_cpu();
+	return vtime_generic_enabled_this_cpu();
 }
 
 extern void vtime_task_switch_generic(struct task_struct *prev);
diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
index 5613838d0307..d67f93e845a7 100644
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
index 9632066aea4d..21ac561a8545 100644
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
@@ -766,18 +768,21 @@ static void tick_nohz_stop_idle(struct tick_sched *ts, ktime_t now)
 
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
 
-static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx, ktime_t *sleeptime,
+static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx,
 				 bool compute_delta, u64 *last_update_time)
 {
 	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
+	u64 *cpustat = kcpustat_cpu(cpu).cpustat;
 	ktime_t now, idle;
 	unsigned int seq;
 
@@ -799,9 +804,9 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx, ktime_t *slee
 		if (tick_sched_flag_test(ts, TS_FLAG_IDLE_ACTIVE) && compute_delta) {
 			ktime_t delta = ktime_sub(now, ts->idle_entrytime);
 
-			idle = ktime_add(*sleeptime, delta);
+			idle = ktime_add(cpustat[idx], delta);
 		} else {
-			idle = *sleeptime;
+			idle = cpustat[idx];
 		}
 	} while (read_seqcount_retry(&ts->idle_sleeptime_seq, seq));
 
@@ -828,9 +833,7 @@ static u64 get_cpu_sleep_time_us(int cpu, enum cpu_usage_stat idx, ktime_t *slee
  */
 u64 get_cpu_idle_time_us(int cpu, u64 *last_update_time)
 {
-	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-
-	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE, &ts->idle_sleeptime,
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IDLE,
 				     !nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
@@ -854,9 +857,7 @@ EXPORT_SYMBOL_GPL(get_cpu_idle_time_us);
  */
 u64 get_cpu_iowait_time_us(int cpu, u64 *last_update_time)
 {
-	struct tick_sched *ts = &per_cpu(tick_cpu_sched, cpu);
-
-	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT, &ts->iowait_sleeptime,
+	return get_cpu_sleep_time_us(cpu, CPUTIME_IOWAIT,
 				     nr_iowait_cpu(cpu), last_update_time);
 }
 EXPORT_SYMBOL_GPL(get_cpu_iowait_time_us);
@@ -1256,10 +1257,8 @@ void tick_nohz_idle_stop_tick(void)
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
@@ -1288,6 +1287,7 @@ void tick_nohz_idle_enter(void)
 	WARN_ON_ONCE(ts->timer_expires_base);
 
 	tick_sched_flag_set(ts, TS_FLAG_INIDLE);
+	kcpustat_dyntick_start();
 	tick_nohz_start_idle(ts);
 
 	local_irq_enable();
@@ -1413,37 +1413,12 @@ unsigned long tick_nohz_get_idle_calls_cpu(int cpu)
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
@@ -1452,8 +1427,6 @@ static void tick_nohz_idle_update_tick(struct tick_sched *ts, ktime_t now)
 		__tick_nohz_full_update_tick(ts, now);
 	else
 		tick_nohz_restart_sched_tick(ts, now);
-
-	tick_nohz_account_idle_time(ts, now);
 }
 
 /**
@@ -1495,6 +1468,7 @@ void tick_nohz_idle_exit(void)
 
 	if (tick_stopped)
 		tick_nohz_idle_update_tick(ts, now);
+	kcpustat_dyntick_stop();
 
 	local_irq_enable();
 }
@@ -1631,20 +1605,15 @@ void tick_setup_sched_timer(bool hrtimer)
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


