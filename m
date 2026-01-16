Return-Path: <linuxppc-dev+bounces-15901-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5431D32E3A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Jan 2026 15:53:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dt2s81y89z30N8;
	Sat, 17 Jan 2026 01:53:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.105.4.254
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768575180;
	cv=none; b=DyxOjTqFwdsIyV3ijR1z+x/n8BJEsg5zUxD5uLxEVKq2g75RUJ+oCFn426LYs5xZfZVZER3ZEQGKPCDyZn3HEOAfZg7RVguNj917WrRukeqmA1rJAfpcziWDQ3wymFLZYlxsE+ftzJhYAaLWrpUUrgcCpVjbx8hYC1wHapUYa2rJcP2EBnRTs3a+gM2Y/URcDxXlt5EKvZCm7THDX/1uZnfnFcmBLBWPFG7s8XHDLfenVzp0w6/r+O8Rnkk8kwJwGOMTYr4hVL5nZbOakvAQiW1gMi1FJg8dmQq0jP6aFVqQ16RlTXbbKzZyMAC1PmH2OQZv6rKC+McqdlUuVEfjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768575180; c=relaxed/relaxed;
	bh=7rNBu3JZuwA0BwIsLcdzHZtjjAnqR/sDtodHvIoZeVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HrXvVd3RVVtR1ioAmYrTLpzfAsmEaUhueq0o37bYSYNalYeKgWkJATj05VmirPRbtlheKSD4X4Xeg9TNynP+MXCtmdQTjz23JTylD+DZY6dfbnBRGMFQReeT5iYaH8ETLH7tQ9WePCnq8ALScqOebv8Mi4v4pLTbISX4wPzeNagYpLVo2eeKjbcYoBqGBqeqWG1oLBBg8rUHdLJ0CY4fo6uVv9gQGkMCQhr+FPrYPHsUvL2Ojg2C3/a2h5tpr1APcttuYf6Yv5bVOLP1ooOjqcDsUszvpfF9/rvbPBuv6JtIvqRCKx11veGxNBIpezsLad2CY9gsfAHv1/UMbvoKzA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lXLhbUJp; dkim-atps=neutral; spf=pass (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=lXLhbUJp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.105.4.254; helo=tor.source.kernel.org; envelope-from=frederic@kernel.org; receiver=lists.ozlabs.org)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dt2s737GXz2xS2
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Jan 2026 01:52:59 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 549E7601B2;
	Fri, 16 Jan 2026 14:52:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D6E9C19421;
	Fri, 16 Jan 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768575177;
	bh=vvbridxIQso7KWjeK226R2O4tHRCA31JE5Z2K7DDlx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lXLhbUJpSe2jZoljJhKsDC27GLZ/Nje4Dfdzt+9e5A8Qe8HbJQL7AtTSlBBvtQxYD
	 JEoEUArdN7c3biSjO8pjEpKLgy7I+x7b5EXJ363hnEJgvBoZ7tBYEZi9O1iG8ihbmx
	 OiKewfemzThz7ZiIqZtX1yp/OwINnAHXAkawnJCl5Uv7QUVyhWRkLIvuoXNMyOqUtp
	 Wacczq3p1j2eXAzBRjlloY9pra1JLen6QZ8H5kz+I+b/GguE0H5BY85+SBDFweFt9k
	 IrF8ut5IrXm87oPBfxgY3ztrHxHfFSNiUltGY0wE56dwU1pbhAy5XE2ybMtWzgE/yJ
	 7QQq0bJS/Kv5g==
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
Subject: [PATCH 05/15] s390/time: Prepare to stop elapsing in dynticks-idle
Date: Fri, 16 Jan 2026 15:51:58 +0100
Message-ID: <20260116145208.87445-6-frederic@kernel.org>
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

Currently the tick subsystem stores the idle cputime accounting in
private fields, allowing cohabitation with architecture idle vtime
accounting. The former is fetched on online CPUs, the latter on offline
CPUs.

For consolidation purpose, architecture vtime accounting will continue
to account the cputime but will make a break when the idle tick is
stopped. The dyntick cputime accounting will then be relayed by the tick
subsystem so that the idle cputime is still seen advancing coherently
even when the tick isn't there to flush the idle vtime.

Prepare for that and introduce three new APIs which will be used in
subsequent patches:

_ vtime_dynticks_start() is deemed to be called when idle enters in
  dyntick mode. The idle cputime that elapsed so far is accumulated
  and accounted. Also idle time accounting is ignored.

- vtime_dynticks_stop() is deemed to be called when idle exits from
  dyntick mode. The vtime entry clocks are fast-forward to current time
  so that idle accounting restarts elapsing from now. Also idle time
  accounting is resumed.

- vtime_reset() is deemed to be called from dynticks idle IRQ entry to
  fast-forward the clock to current time so that the IRQ time is still
  accounted by vtime while nohz cputime is paused.

Also accumulated vtime won't be flushed from dyntick-idle ticks to avoid
accounting twice the idle cputime, along with nohz accounting.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 arch/s390/include/asm/idle.h | 11 +++---
 arch/s390/kernel/idle.c      | 13 ++++++--
 arch/s390/kernel/vtime.c     | 65 ++++++++++++++++++++++++++++++------
 3 files changed, 71 insertions(+), 18 deletions(-)

diff --git a/arch/s390/include/asm/idle.h b/arch/s390/include/asm/idle.h
index 09f763b9eb40..2770c4f761e1 100644
--- a/arch/s390/include/asm/idle.h
+++ b/arch/s390/include/asm/idle.h
@@ -12,11 +12,12 @@
 #include <linux/device.h>
 
 struct s390_idle_data {
-	unsigned long idle_count;
-	unsigned long idle_time;
-	unsigned long clock_idle_enter;
-	unsigned long timer_idle_enter;
-	unsigned long mt_cycles_enter[8];
+	bool		idle_dyntick;
+	unsigned long	idle_count;
+	unsigned long	idle_time;
+	unsigned long	clock_idle_enter;
+	unsigned long	timer_idle_enter;
+	unsigned long	mt_cycles_enter[8];
 };
 
 extern struct device_attribute dev_attr_idle_count;
diff --git a/arch/s390/kernel/idle.c b/arch/s390/kernel/idle.c
index 39cb8d0ae348..54bb932184dd 100644
--- a/arch/s390/kernel/idle.c
+++ b/arch/s390/kernel/idle.c
@@ -35,6 +35,12 @@ void account_idle_time_irq(void)
 			this_cpu_add(mt_cycles[i], cycles_new[i] - idle->mt_cycles_enter[i]);
 	}
 
+	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
+
+	/* Dyntick idle time accounted by nohz/scheduler */
+	if (idle->idle_dyntick)
+		return;
+
 	idle_time = lc->int_clock - idle->clock_idle_enter;
 
 	lc->steal_timer += idle->clock_idle_enter - lc->last_update_clock;
@@ -45,7 +51,6 @@ void account_idle_time_irq(void)
 
 	/* Account time spent with enabled wait psw loaded as idle time. */
 	WRITE_ONCE(idle->idle_time, READ_ONCE(idle->idle_time) + idle_time);
-	WRITE_ONCE(idle->idle_count, READ_ONCE(idle->idle_count) + 1);
 	account_idle_time(cputime_to_nsecs(idle_time));
 }
 
@@ -61,8 +66,10 @@ void noinstr arch_cpu_idle(void)
 	set_cpu_flag(CIF_ENABLED_WAIT);
 	if (smp_cpu_mtid)
 		stcctm(MT_DIAG, smp_cpu_mtid, (u64 *)&idle->mt_cycles_enter);
-	idle->clock_idle_enter = get_tod_clock_fast();
-	idle->timer_idle_enter = get_cpu_timer();
+	if (!idle->idle_dyntick) {
+		idle->clock_idle_enter = get_tod_clock_fast();
+		idle->timer_idle_enter = get_cpu_timer();
+	}
 	bpon();
 	__load_psw_mask(psw_mask);
 }
diff --git a/arch/s390/kernel/vtime.c b/arch/s390/kernel/vtime.c
index 234a0ba30510..c19528eb4ee3 100644
--- a/arch/s390/kernel/vtime.c
+++ b/arch/s390/kernel/vtime.c
@@ -17,6 +17,7 @@
 #include <asm/vtimer.h>
 #include <asm/vtime.h>
 #include <asm/cpu_mf.h>
+#include <asm/idle.h>
 #include <asm/smp.h>
 
 #include "entry.h"
@@ -111,23 +112,30 @@ static void account_system_index_scaled(struct task_struct *p, u64 cputime,
 	account_system_index_time(p, cputime_to_nsecs(cputime), index);
 }
 
-/*
- * Update process times based on virtual cpu times stored by entry.S
- * to the lowcore fields user_timer, system_timer & steal_clock.
- */
-static int do_account_vtime(struct task_struct *tsk)
+static inline void vtime_reset_last_update(struct lowcore *lc)
 {
-	u64 timer, clock, user, guest, system, hardirq, softirq;
-	struct lowcore *lc = get_lowcore();
-
-	timer = lc->last_update_timer;
-	clock = lc->last_update_clock;
 	asm volatile(
 		"	stpt	%0\n"	/* Store current cpu timer value */
 		"	stckf	%1"	/* Store current tod clock value */
 		: "=Q" (lc->last_update_timer),
 		  "=Q" (lc->last_update_clock)
 		: : "cc");
+}
+
+/*
+ * Update process times based on virtual cpu times stored by entry.S
+ * to the lowcore fields user_timer, system_timer & steal_clock.
+ */
+static int do_account_vtime(struct task_struct *tsk)
+{
+	u64 timer, clock, user, guest, system, hardirq, softirq;
+	struct lowcore *lc = get_lowcore();
+
+	timer = lc->last_update_timer;
+	clock = lc->last_update_clock;
+
+	vtime_reset_last_update(lc);
+
 	clock = lc->last_update_clock - clock;
 	timer -= lc->last_update_timer;
 
@@ -261,6 +269,43 @@ void vtime_account_hardirq(struct task_struct *tsk)
 	virt_timer_forward(delta);
 }
 
+#ifdef CONFIG_NO_HZ_COMMON
+/**
+ * vtime_reset - Fast forward vtime entry clocks
+ *
+ * Called from dynticks idle IRQ entry to fast-forward the clocks to current time
+ * so that the IRQ time is still accounted by vtime while nohz cputime is paused.
+ */
+void vtime_reset(void)
+{
+	vtime_reset_last_update(get_lowcore());
+}
+
+/**
+ * vtime_dyntick_start - Inform vtime about entry to idle-dynticks
+ *
+ * Called when idle enters in dyntick mode. The idle cputime that elapsed so far
+ * is flushed and the tick subsystem takes over the idle cputime accounting.
+ */
+void vtime_dyntick_start(void)
+{
+	__this_cpu_write(s390_idle.idle_dyntick, true);
+	vtime_flush(current);
+}
+
+/**
+ * vtime_dyntick_stop - Inform vtime about exit from idle-dynticks
+ *
+ * Called when idle exits from dyntick mode. The vtime entry clocks are
+ * fast-forward to current time and idle accounting resumes.
+ */
+void vtime_dyntick_stop(void)
+{
+	vtime_reset_last_update(get_lowcore());
+	__this_cpu_write(s390_idle.idle_dyntick, false);
+}
+#endif /* CONFIG_NO_HZ_COMMON */
+
 /*
  * Sorted add to a list. List is linear searched until first bigger
  * element is found.
-- 
2.51.1


