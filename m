Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B493518E129
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:26:24 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l0Hd3LXrzF0jZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:26:21 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kz8F0N6jzDrRL
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:34:53 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFcOa-0002G3-Hx; Sat, 21 Mar 2020 12:34:28 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id 5E7261040C7;
 Sat, 21 Mar 2020 12:34:21 +0100 (CET)
Message-Id: <20200321113242.317954042@linutronix.de>
User-Agent: quilt/0.65
Date: Sat, 21 Mar 2020 12:26:00 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 16/20] completion: Use simple wait queues
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
 linux-acpi@vger.kernel.org, Brian Cain <bcain@codeaurora.org>,
 Davidlohr Bueso <dbueso@suse.de>, "Paul E . McKenney" <paulmck@kernel.org>,
 linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, kbuild test robot <lkp@intel.com>,
 Felipe Balbi <balbi@kernel.org>, Michal Simek <monstr@monstr.eu>,
 Tony Luck <tony.luck@intel.com>, Nick Hu <nickhu@andestech.com>,
 Geoff Levand <geoff@infradead.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 netdev@vger.kernel.org, Logan Gunthorpe <logang@deltatee.com>,
 "David S. Miller" <davem@davemloft.net>, Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Thomas Gleixner <tglx@linutronix.de>

completion uses a wait_queue_head_t to enqueue waiters.

wait_queue_head_t contains a spinlock_t to protect the list of waiters
which excludes it from being used in truly atomic context on a PREEMPT_RT
enabled kernel.

The spinlock in the wait queue head cannot be replaced by a raw_spinlock
because:

  - wait queues can have custom wakeup callbacks, which acquire other
    spinlock_t locks and have potentially long execution times

  - wake_up() walks an unbounded number of list entries during the wake up
    and may wake an unbounded number of waiters.

For simplicity and performance reasons complete() should be usable on
PREEMPT_RT enabled kernels.

completions do not use custom wakeup callbacks and are usually single
waiter, except for a few corner cases.

Replace the wait queue in the completion with a simple wait queue (swait),
which uses a raw_spinlock_t for protecting the waiter list and therefore is
safe to use inside truly atomic regions on PREEMPT_RT.

There is no semantical or functional change:

  - completions use the exclusive wait mode which is what swait provides

  - complete() wakes one exclusive waiter

  - complete_all() wakes all waiters while holding the lock which protects
    the wait queue against newly incoming waiters. The conversion to swait
    preserves this behaviour.

complete_all() might cause unbound latencies with a large number of waiters
being woken at once, but most complete_all() usage sites are either in
testing or initialization code or have only a really small number of
concurrent waiters which for now does not cause a latency problem. Keep it
simple for now.

The fixup of the warning check in the USB gadget driver is just a straight
forward conversion of the lockless waiter check from one waitqueue type to
the other.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Joel Fernandes (Google) <joel@joelfernandes.org>
Reviewed-by: Davidlohr Bueso <dbueso@suse.de>
Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Linus Torvalds <torvalds@linux-foundation.org>
---
V2: Split out the orinoco and usb gadget parts and amended change log
---
 drivers/usb/gadget/function/f_fs.c |    2 +-
 include/linux/completion.h         |    8 ++++----
 kernel/sched/completion.c          |   36 +++++++++++++++++++-----------------
 3 files changed, 24 insertions(+), 22 deletions(-)

--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -1703,7 +1703,7 @@ static void ffs_data_put(struct ffs_data
 		pr_info("%s(): freeing\n", __func__);
 		ffs_data_clear(ffs);
 		BUG_ON(waitqueue_active(&ffs->ev.waitq) ||
-		       waitqueue_active(&ffs->ep0req_completion.wait) ||
+		       swait_active(&ffs->ep0req_completion.wait) ||
 		       waitqueue_active(&ffs->wait));
 		destroy_workqueue(ffs->io_completion_wq);
 		kfree(ffs->dev_name);
--- a/include/linux/completion.h
+++ b/include/linux/completion.h
@@ -9,7 +9,7 @@
  * See kernel/sched/completion.c for details.
  */
 
-#include <linux/wait.h>
+#include <linux/swait.h>
 
 /*
  * struct completion - structure used to maintain state for a "completion"
@@ -25,7 +25,7 @@
  */
 struct completion {
 	unsigned int done;
-	wait_queue_head_t wait;
+	struct swait_queue_head wait;
 };
 
 #define init_completion_map(x, m) __init_completion(x)
@@ -34,7 +34,7 @@ static inline void complete_acquire(stru
 static inline void complete_release(struct completion *x) {}
 
 #define COMPLETION_INITIALIZER(work) \
-	{ 0, __WAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
+	{ 0, __SWAIT_QUEUE_HEAD_INITIALIZER((work).wait) }
 
 #define COMPLETION_INITIALIZER_ONSTACK_MAP(work, map) \
 	(*({ init_completion_map(&(work), &(map)); &(work); }))
@@ -85,7 +85,7 @@ static inline void complete_release(stru
 static inline void __init_completion(struct completion *x)
 {
 	x->done = 0;
-	init_waitqueue_head(&x->wait);
+	init_swait_queue_head(&x->wait);
 }
 
 /**
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -29,12 +29,12 @@ void complete(struct completion *x)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&x->wait.lock, flags);
+	raw_spin_lock_irqsave(&x->wait.lock, flags);
 
 	if (x->done != UINT_MAX)
 		x->done++;
-	__wake_up_locked(&x->wait, TASK_NORMAL, 1);
-	spin_unlock_irqrestore(&x->wait.lock, flags);
+	swake_up_locked(&x->wait);
+	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
 }
 EXPORT_SYMBOL(complete);
 
@@ -58,10 +58,12 @@ void complete_all(struct completion *x)
 {
 	unsigned long flags;
 
-	spin_lock_irqsave(&x->wait.lock, flags);
+	WARN_ON(irqs_disabled());
+
+	raw_spin_lock_irqsave(&x->wait.lock, flags);
 	x->done = UINT_MAX;
-	__wake_up_locked(&x->wait, TASK_NORMAL, 0);
-	spin_unlock_irqrestore(&x->wait.lock, flags);
+	swake_up_all_locked(&x->wait);
+	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
 }
 EXPORT_SYMBOL(complete_all);
 
@@ -70,20 +72,20 @@ do_wait_for_common(struct completion *x,
 		   long (*action)(long), long timeout, int state)
 {
 	if (!x->done) {
-		DECLARE_WAITQUEUE(wait, current);
+		DECLARE_SWAITQUEUE(wait);
 
-		__add_wait_queue_entry_tail_exclusive(&x->wait, &wait);
 		do {
 			if (signal_pending_state(state, current)) {
 				timeout = -ERESTARTSYS;
 				break;
 			}
+			__prepare_to_swait(&x->wait, &wait);
 			__set_current_state(state);
-			spin_unlock_irq(&x->wait.lock);
+			raw_spin_unlock_irq(&x->wait.lock);
 			timeout = action(timeout);
-			spin_lock_irq(&x->wait.lock);
+			raw_spin_lock_irq(&x->wait.lock);
 		} while (!x->done && timeout);
-		__remove_wait_queue(&x->wait, &wait);
+		__finish_swait(&x->wait, &wait);
 		if (!x->done)
 			return timeout;
 	}
@@ -100,9 +102,9 @@ static inline long __sched
 
 	complete_acquire(x);
 
-	spin_lock_irq(&x->wait.lock);
+	raw_spin_lock_irq(&x->wait.lock);
 	timeout = do_wait_for_common(x, action, timeout, state);
-	spin_unlock_irq(&x->wait.lock);
+	raw_spin_unlock_irq(&x->wait.lock);
 
 	complete_release(x);
 
@@ -291,12 +293,12 @@ bool try_wait_for_completion(struct comp
 	if (!READ_ONCE(x->done))
 		return false;
 
-	spin_lock_irqsave(&x->wait.lock, flags);
+	raw_spin_lock_irqsave(&x->wait.lock, flags);
 	if (!x->done)
 		ret = false;
 	else if (x->done != UINT_MAX)
 		x->done--;
-	spin_unlock_irqrestore(&x->wait.lock, flags);
+	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
 	return ret;
 }
 EXPORT_SYMBOL(try_wait_for_completion);
@@ -322,8 +324,8 @@ bool completion_done(struct completion *
 	 * otherwise we can end up freeing the completion before complete()
 	 * is done referencing it.
 	 */
-	spin_lock_irqsave(&x->wait.lock, flags);
-	spin_unlock_irqrestore(&x->wait.lock, flags);
+	raw_spin_lock_irqsave(&x->wait.lock, flags);
+	raw_spin_unlock_irqrestore(&x->wait.lock, flags);
 	return true;
 }
 EXPORT_SYMBOL(completion_done);


