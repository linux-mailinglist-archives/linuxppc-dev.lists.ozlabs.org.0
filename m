Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 843A618E11F
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:20:45 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l09366KNzDrNf
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:20:39 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kz8D06s7zDr80
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:34:51 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFcOb-0002LP-6D; Sat, 21 Mar 2020 12:34:29 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id E04FC1040C9;
 Sat, 21 Mar 2020 12:34:21 +0100 (CET)
Message-Id: <20200321113242.534508206@linutronix.de>
User-Agent: quilt/0.65
Date: Sat, 21 Mar 2020 12:26:02 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 18/20] lockdep: Add hrtimer context tracing bits
References: <20200321112544.878032781@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-transfer-encoding: 8-bit
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
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-ia64@vger.kernel.org,
 Peter Zijlstra <peterz@infradead.org>, linux-pci@vger.kernel.org,
 Sebastian Siewior <bigeasy@linutronix.de>, platform-driver-x86@vger.kernel.org,
 Guo Ren <guoren@kernel.org>, Joel Fernandes <joel@joelfernandes.org>,
 Vincent Chen <deanbo422@gmail.com>, Ingo Molnar <mingo@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Davidlohr Bueso <dave@stgolabs.net>,
 kbuild test robot <lkp@intel.com>, Brian Cain <bcain@codeaurora.org>,
 linux-acpi@vger.kernel.org, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Davidlohr Bueso <dbueso@suse.de>, netdev@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Set current->irq_config = 1 for hrtimers which are not marked to expire in
hard interrupt context during hrtimer_init(). These timers will expire in
softirq context on PREEMPT_RT.

Setting this allows lockdep to differentiate these timers. If a timer is
marked to expire in hard interrupt context then the timer callback is not
supposed to acquire a regular spinlock instead of a raw_spinlock in the
expiry callback.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
---
 include/linux/irqflags.h |   15 +++++++++++++++
 include/linux/sched.h    |    1 +
 kernel/locking/lockdep.c |    2 +-
 kernel/time/hrtimer.c    |    6 +++++-
 4 files changed, 22 insertions(+), 2 deletions(-)

--- a/include/linux/irqflags.h
+++ b/include/linux/irqflags.h
@@ -56,6 +56,19 @@ do {						\
 do {						\
 	current->softirq_context--;		\
 } while (0)
+
+# define lockdep_hrtimer_enter(__hrtimer)		\
+	  do {						\
+		  if (!__hrtimer->is_hard)		\
+			current->irq_config = 1;	\
+	  } while (0)
+
+# define lockdep_hrtimer_exit(__hrtimer)		\
+	  do {						\
+		  if (!__hrtimer->is_hard)		\
+			current->irq_config = 0;	\
+	  } while (0)
+
 #else
 # define trace_hardirqs_on()		do { } while (0)
 # define trace_hardirqs_off()		do { } while (0)
@@ -68,6 +81,8 @@ do {						\
 # define trace_hardirq_exit()		do { } while (0)
 # define lockdep_softirq_enter()	do { } while (0)
 # define lockdep_softirq_exit()		do { } while (0)
+# define lockdep_hrtimer_enter(__hrtimer)		do { } while (0)
+# define lockdep_hrtimer_exit(__hrtimer)		do { } while (0)
 #endif
 
 #if defined(CONFIG_IRQSOFF_TRACER) || \
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -983,6 +983,7 @@ struct task_struct {
 	unsigned int			softirq_enable_event;
 	int				softirqs_enabled;
 	int				softirq_context;
+	int				irq_config;
 #endif
 
 #ifdef CONFIG_LOCKDEP
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -3759,7 +3759,7 @@ static int check_wait_context(struct tas
 		/*
 		 * Check if force_irqthreads will run us threaded.
 		 */
-		if (curr->hardirq_threaded)
+		if (curr->hardirq_threaded || curr->irq_config)
 			curr_inner = LD_WAIT_CONFIG;
 		else
 			curr_inner = LD_WAIT_SPIN;
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -1404,7 +1404,7 @@ static void __hrtimer_init(struct hrtime
 	base = softtimer ? HRTIMER_MAX_CLOCK_BASES / 2 : 0;
 	base += hrtimer_clockid_to_base(clock_id);
 	timer->is_soft = softtimer;
-	timer->is_hard = !softtimer;
+	timer->is_hard = !!(mode & HRTIMER_MODE_HARD);
 	timer->base = &cpu_base->clock_base[base];
 	timerqueue_init(&timer->node);
 }
@@ -1514,7 +1514,11 @@ static void __run_hrtimer(struct hrtimer
 	 */
 	raw_spin_unlock_irqrestore(&cpu_base->lock, flags);
 	trace_hrtimer_expire_entry(timer, now);
+	lockdep_hrtimer_enter(timer);
+
 	restart = fn(timer);
+
+	lockdep_hrtimer_exit(timer);
 	trace_hrtimer_expire_exit(timer);
 	raw_spin_lock_irq(&cpu_base->lock);
 


