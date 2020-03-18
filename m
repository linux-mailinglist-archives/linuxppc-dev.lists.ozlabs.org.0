Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F5F18A4A4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:55:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jMkS4C4rzDqnF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:55:28 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jMXn3286zDqxB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 07:47:05 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEfaO-0006CB-Vy; Wed, 18 Mar 2020 21:46:45 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id 61F721040CC;
 Wed, 18 Mar 2020 21:46:36 +0100 (CET)
Message-Id: <20200318204408.010461877@linutronix.de>
User-Agent: quilt/0.65
Date: Wed, 18 Mar 2020 21:43:08 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 06/15] rcuwait: Add @state argument to rcuwait_wait_event()
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
Cc: linux-usb@vger.kernel.org, Peter Zijlstra <peterz@infradead.org>,
 linux-pci@vger.kernel.org, Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Joel Fernandes <joel@joelfernandes.org>, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, Davidlohr Bueso <dave@stgolabs.net>,
 Arnd Bergmann <arnd@arndb.de>, Logan Gunthorpe <logang@deltatee.com>,
 "Paul E . McKenney" <paulmck@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Steven Rostedt <rostedt@goodmis.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-wireless@vger.kernel.org,
 Oleg Nesterov <oleg@redhat.com>, netdev@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Extend rcuwait_wait_event() with a state variable so that it is not
restricted to UNINTERRUPTIBLE waits.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Oleg Nesterov <oleg@redhat.com>
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
 

