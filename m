Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8818E105
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 13:15:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48l02y0JSzzF0gt
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 23:15:22 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kz8C1w0BzDr80
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:34:51 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFcOT-0001zi-1B; Sat, 21 Mar 2020 12:34:21 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id 16805FFBBF;
 Sat, 21 Mar 2020 12:34:20 +0100 (CET)
Message-Id: <20200321113241.824030968@linutronix.de>
User-Agent: quilt/0.65
Date: Sat, 21 Mar 2020 12:25:55 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 11/20] rcuwait: Add @state argument to rcuwait_wait_event()
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

From: Peter Zijlstra (Intel) <peterz@infradead.org>

Extend rcuwait_wait_event() with a state variable so that it is not
restricted to UNINTERRUPTIBLE waits.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Davidlohr Bueso <dave@stgolabs.net>

---
 include/linux/rcuwait.h       |   12 ++++++++++--
 kernel/locking/percpu-rwsem.c |    2 +-
 2 files changed, 11 insertions(+), 3 deletions(-)

--- a/include/linux/rcuwait.h
+++ b/include/linux/rcuwait.h
@@ -3,6 +3,7 @@
 #define _LINUX_RCUWAIT_H_
 
 #include <linux/rcupdate.h>
+#include <linux/sched/signal.h>
 
 /*
  * rcuwait provides a way of blocking and waking up a single
@@ -30,23 +31,30 @@ extern void rcuwait_wake_up(struct rcuwa
  * The caller is responsible for locking around rcuwait_wait_event(),
  * such that writes to @task are properly serialized.
  */
-#define rcuwait_wait_event(w, condition)				\
+#define rcuwait_wait_event(w, condition, state)				\
 ({									\
+	int __ret = 0;							\
 	rcu_assign_pointer((w)->task, current);				\
 	for (;;) {							\
 		/*							\
 		 * Implicit barrier (A) pairs with (B) in		\
 		 * rcuwait_wake_up().					\
 		 */							\
-		set_current_state(TASK_UNINTERRUPTIBLE);		\
+		set_current_state(state);				\
 		if (condition)						\
 			break;						\
 									\
+		if (signal_pending_state(state, current)) {		\
+			__ret = -EINTR;					\
+			break;						\
+		}							\
+									\
 		schedule();						\
 	}								\
 									\
 	WRITE_ONCE((w)->task, NULL);					\
 	__set_current_state(TASK_RUNNING);				\
+	__ret;								\
 })
 
 #endif /* _LINUX_RCUWAIT_H_ */
--- a/kernel/locking/percpu-rwsem.c
+++ b/kernel/locking/percpu-rwsem.c
@@ -162,7 +162,7 @@ void percpu_down_write(struct percpu_rw_
 	 */
 
 	/* Wait for all now active readers to complete. */
-	rcuwait_wait_event(&sem->writer, readers_active_check(sem));
+	rcuwait_wait_event(&sem->writer, readers_active_check(sem), TASK_UNINTERRUPTIBLE);
 }
 EXPORT_SYMBOL_GPL(percpu_down_write);
 


