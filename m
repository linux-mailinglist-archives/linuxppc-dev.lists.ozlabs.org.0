Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0246B18A506
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:58:43 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jMp45sBMzDqhD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:58:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=tglx@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jMXn3HH6zDqyq
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 07:47:05 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEfaO-0006BC-A3; Wed, 18 Mar 2020 21:46:44 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id 13D7C1040D1;
 Wed, 18 Mar 2020 21:46:37 +0100 (CET)
Message-Id: <20200318204408.319891308@linutronix.de>
User-Agent: quilt/0.65
Date: Wed, 18 Mar 2020 21:43:11 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 09/15] timekeeping: Split jiffies seqlock
References: <20200318204302.693307984@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Linutronix-Spam-Score: -1.0
X-Linutronix-Spam-Level: -
X-Linutronix-Spam-Status: No , -1.0 points, 5.0 required, ALL_TRUSTED=-1,
 SHORTCIRCUIT=-0.0001
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Randy Dunlap <rdunlap@infradead.org>, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, Logan Gunthorpe <logang@deltatee.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 netdev@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de>

seqlock consists of a sequence counter and a spinlock_t which is used to
serialize the writers. spinlock_t is substituted by a "sleeping" spinlock
on PREEMPT_RT enabled kernels which breaks the usage in the timekeeping
code as the writers are executed in hard interrupt and therefore
non-preemptible context even on PREEMPT_RT.

The spinlock in seqlock cannot be unconditionally replaced by a
raw_spinlock_t as many seqlock users have nesting spinlock sections or
other code which is not suitable to run in truly atomic context on RT.

Instead of providing a raw_seqlock API for a single use case, open code the
seqlock for the jiffies use case and implement it with a raw_spinlock_t and
a sequence counter.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 kernel/time/jiffies.c     |    7 ++++---
 kernel/time/tick-common.c |   10 ++++++----
 kernel/time/tick-sched.c  |   19 ++++++++++++-------
 kernel/time/timekeeping.c |    6 ++++--
 kernel/time/timekeeping.h |    3 ++-
 5 files changed, 28 insertions(+), 17 deletions(-)

--- a/kernel/time/jiffies.c
+++ b/kernel/time/jiffies.c
@@ -58,7 +58,8 @@ static struct clocksource clocksource_ji
 	.max_cycles	= 10,
 };
 
-__cacheline_aligned_in_smp DEFINE_SEQLOCK(jiffies_lock);
+__cacheline_aligned_in_smp DEFINE_RAW_SPINLOCK(jiffies_lock);
+__cacheline_aligned_in_smp seqcount_t jiffies_seq;
 
 #if (BITS_PER_LONG < 64)
 u64 get_jiffies_64(void)
@@ -67,9 +68,9 @@ u64 get_jiffies_64(void)
 	u64 ret;
 
 	do {
-		seq = read_seqbegin(&jiffies_lock);
+		seq = read_seqcount_begin(&jiffies_seq);
 		ret = jiffies_64;
-	} while (read_seqretry(&jiffies_lock, seq));
+	} while (read_seqcount_retry(&jiffies_seq, seq));
 	return ret;
 }
 EXPORT_SYMBOL(get_jiffies_64);
--- a/kernel/time/tick-common.c
+++ b/kernel/time/tick-common.c
@@ -84,13 +84,15 @@ int tick_is_oneshot_available(void)
 static void tick_periodic(int cpu)
 {
 	if (tick_do_timer_cpu == cpu) {
-		write_seqlock(&jiffies_lock);
+		raw_spin_lock(&jiffies_lock);
+		write_seqcount_begin(&jiffies_seq);
 
 		/* Keep track of the next tick event */
 		tick_next_period = ktime_add(tick_next_period, tick_period);
 
 		do_timer(1);
-		write_sequnlock(&jiffies_lock);
+		write_seqcount_end(&jiffies_seq);
+		raw_spin_unlock(&jiffies_lock);
 		update_wall_time();
 	}
 
@@ -162,9 +164,9 @@ void tick_setup_periodic(struct clock_ev
 		ktime_t next;
 
 		do {
-			seq = read_seqbegin(&jiffies_lock);
+			seq = read_seqcount_begin(&jiffies_seq);
 			next = tick_next_period;
-		} while (read_seqretry(&jiffies_lock, seq));
+		} while (read_seqcount_retry(&jiffies_seq, seq));
 
 		clockevents_switch_state(dev, CLOCK_EVT_STATE_ONESHOT);
 
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -65,7 +65,8 @@ static void tick_do_update_jiffies64(kti
 		return;
 
 	/* Reevaluate with jiffies_lock held */
-	write_seqlock(&jiffies_lock);
+	raw_spin_lock(&jiffies_lock);
+	write_seqcount_begin(&jiffies_seq);
 
 	delta = ktime_sub(now, last_jiffies_update);
 	if (delta >= tick_period) {
@@ -91,10 +92,12 @@ static void tick_do_update_jiffies64(kti
 		/* Keep the tick_next_period variable up to date */
 		tick_next_period = ktime_add(last_jiffies_update, tick_period);
 	} else {
-		write_sequnlock(&jiffies_lock);
+		write_seqcount_end(&jiffies_seq);
+		raw_spin_unlock(&jiffies_lock);
 		return;
 	}
-	write_sequnlock(&jiffies_lock);
+	write_seqcount_end(&jiffies_seq);
+	raw_spin_unlock(&jiffies_lock);
 	update_wall_time();
 }
 
@@ -105,12 +108,14 @@ static ktime_t tick_init_jiffy_update(vo
 {
 	ktime_t period;
 
-	write_seqlock(&jiffies_lock);
+	raw_spin_lock(&jiffies_lock);
+	write_seqcount_begin(&jiffies_seq);
 	/* Did we start the jiffies update yet ? */
 	if (last_jiffies_update == 0)
 		last_jiffies_update = tick_next_period;
 	period = last_jiffies_update;
-	write_sequnlock(&jiffies_lock);
+	write_seqcount_end(&jiffies_seq);
+	raw_spin_unlock(&jiffies_lock);
 	return period;
 }
 
@@ -676,10 +681,10 @@ static ktime_t tick_nohz_next_event(stru
 
 	/* Read jiffies and the time when jiffies were updated last */
 	do {
-		seq = read_seqbegin(&jiffies_lock);
+		seq = read_seqcount_begin(&jiffies_seq);
 		basemono = last_jiffies_update;
 		basejiff = jiffies;
-	} while (read_seqretry(&jiffies_lock, seq));
+	} while (read_seqcount_retry(&jiffies_seq, seq));
 	ts->last_jiffies = basejiff;
 	ts->timer_expires_base = basemono;
 
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -2397,8 +2397,10 @@ EXPORT_SYMBOL(hardpps);
  */
 void xtime_update(unsigned long ticks)
 {
-	write_seqlock(&jiffies_lock);
+	raw_spin_lock(&jiffies_lock);
+	write_seqcount_begin(&jiffies_seq);
 	do_timer(ticks);
-	write_sequnlock(&jiffies_lock);
+	write_seqcount_end(&jiffies_seq);
+	raw_spin_unlock(&jiffies_lock);
 	update_wall_time();
 }
--- a/kernel/time/timekeeping.h
+++ b/kernel/time/timekeeping.h
@@ -25,7 +25,8 @@ static inline void sched_clock_resume(vo
 extern void do_timer(unsigned long ticks);
 extern void update_wall_time(void);
 
-extern seqlock_t jiffies_lock;
+extern raw_spinlock_t jiffies_lock;
+extern seqcount_t jiffies_seq;
 
 #define CS_NAME_LEN	32
 

