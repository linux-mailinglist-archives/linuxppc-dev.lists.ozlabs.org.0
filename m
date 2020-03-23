Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 862C518F8B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Mar 2020 16:36:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48mJPs1XW8zDq9l
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Mar 2020 02:36:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=linutronix.de
 (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de;
 envelope-from=bigeasy@linutronix.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=linutronix.de
Received: from Galois.linutronix.de (Galois.linutronix.de
 [IPv6:2a0a:51c0:0:12e:550::1])
 (using TLSv1.2 with cipher DHE-RSA-AES256-SHA256 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48mJ461jHyzDqkp
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Mar 2020 02:20:54 +1100 (AEDT)
Received: from bigeasy by Galois.linutronix.de with local (Exim 4.80)
 (envelope-from <bigeasy@linutronix.de>)
 id 1jGOsF-000148-59; Mon, 23 Mar 2020 16:20:19 +0100
Date: Mon, 23 Mar 2020 16:20:19 +0100
From: Sebastian Siewior <bigeasy@linutronix.de>
To: Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] completion: Use lockdep_assert_RT_in_threaded_ctx() in
 complete_all()
Message-ID: <20200323152019.4qjwluldohuh3by5@linutronix.de>
References: <20200321112544.878032781@linutronix.de>
 <20200321113242.317954042@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200321113242.317954042@linutronix.de>
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
 Oleg Nesterov <oleg@redhat.com>, Guo Ren <guoren@kernel.org>,
 Joel Fernandes <joel@joelfernandes.org>, Vincent Chen <deanbo422@gmail.com>,
 Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Davidlohr Bueso <dave@stgolabs.net>, linux-acpi@vger.kernel.org,
 Brian Cain <bcain@codeaurora.org>, Davidlohr Bueso <dbueso@suse.de>,
 "Paul E . McKenney" <paulmck@kernel.org>, linux-hexagon@vger.kernel.org,
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-csky@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Darren Hart <dvhart@infradead.org>, Zhang Rui <rui.zhang@intel.com>,
 Len Brown <lenb@kernel.org>, Fenghua Yu <fenghua.yu@intel.com>,
 Arnd Bergmann <arnd@arndb.de>, linux-pm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Greentime Hu <green.hu@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 platform-driver-x86@vger.kernel.org, Kalle Valo <kvalo@codeaurora.org>,
 kbuild test robot <lkp@intel.com>, Felipe Balbi <balbi@kernel.org>,
 Michal Simek <monstr@monstr.eu>, Tony Luck <tony.luck@intel.com>,
 Nick Hu <nickhu@andestech.com>, Geoff Levand <geoff@infradead.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Logan Gunthorpe <logang@deltatee.com>, "David S. Miller" <davem@davemloft.net>,
 Andy Shevchenko <andy@infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The warning was intended to spot complete_all() users from hardirq
context on PREEMPT_RT. The warning as-is will also trigger in interrupt
handlers, which are threaded on PREEMPT_RT, which was not intended.

Use lockdep_assert_RT_in_threaded_ctx() which triggers in non-preemptive
context on PREEMPT_RT.

Suggested-by: Peter Zijlstra <peterz@infradead.org>
Reported-by: kernel test robot <rong.a.chen@intel.com>
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 include/linux/lockdep.h   | 15 +++++++++++++++
 kernel/sched/completion.c |  2 +-
 2 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/include/linux/lockdep.h b/include/linux/lockdep.h
index 425b4ceb7cd07..206774ac69460 100644
--- a/include/linux/lockdep.h
+++ b/include/linux/lockdep.h
@@ -711,6 +711,21 @@ do {									\
 # define lockdep_assert_in_irq() do { } while (0)
 #endif
 
+#ifdef CONFIG_PROVE_RAW_LOCK_NESTING
+
+# define lockdep_assert_RT_in_threaded_ctx() do {			\
+		WARN_ONCE(debug_locks && !current->lockdep_recursion &&	\
+			  current->hardirq_context &&			\
+			  !(current->hardirq_threaded || current->irq_config),	\
+			  "Not in threaded context on PREEMPT_RT as expected\n");	\
+} while (0)
+
+#else
+
+# define lockdep_assert_RT_in_threaded_ctx() do { } while (0)
+
+#endif
+
 #ifdef CONFIG_LOCKDEP
 void lockdep_rcu_suspicious(const char *file, const int line, const char *s);
 #else
diff --git a/kernel/sched/completion.c b/kernel/sched/completion.c
index f15e96164ff1e..a778554f9dad7 100644
--- a/kernel/sched/completion.c
+++ b/kernel/sched/completion.c
@@ -58,7 +58,7 @@ void complete_all(struct completion *x)
 {
 	unsigned long flags;
 
-	WARN_ON(irqs_disabled());
+	lockdep_assert_RT_in_threaded_ctx();
 
 	raw_spin_lock_irqsave(&x->wait.lock, flags);
 	x->done = UINT_MAX;
-- 
2.26.0.rc2

