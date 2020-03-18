Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1583B18A440
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Mar 2020 21:51:32 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48jMds1q9RzDr1F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 19 Mar 2020 07:51:29 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48jMXm1dtYzDqxB
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Mar 2020 07:47:04 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jEfaK-000669-59; Wed, 18 Mar 2020 21:46:40 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id 9A0B91040CD;
 Wed, 18 Mar 2020 21:46:36 +0100 (CET)
Message-Id: <20200318204408.102694393@linutronix.de>
User-Agent: quilt/0.65
Date: Wed, 18 Mar 2020 21:43:09 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V2 07/15] powerpc/ps3: Convert half completion to rcuwait
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
 netdev@vger.kernel.org, Joel Fernandes <joel@joelfernandes.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>, "Paul E . McKenney" <paulmck@kernel.org>,
 Logan Gunthorpe <logang@deltatee.com>, Arnd Bergmann <arnd@arndb.de>,
 linuxppc-dev@lists.ozlabs.org, Steven Rostedt <rostedt@goodmis.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
 Kalle Valo <kvalo@codeaurora.org>, Felipe Balbi <balbi@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 linux-wireless@vger.kernel.org, Oleg Nesterov <oleg@redhat.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The PS3 notification interrupt and kthread use a hacked up completion to
communicate. Since we're wanting to change the completion implementation and
this is abuse anyway, replace it with a simple rcuwait since there is only ever
the one waiter.

AFAICT the kthread uses TASK_INTERRUPTIBLE to not increase loadavg, kthreads
cannot receive signals by default and this one doesn't look different. Use
TASK_IDLE instead.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Cc: Michael Ellerman <mpe@ellerman.id.au>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: linuxppc-dev@lists.ozlabs.org
---
V2: New patch to avoid the magic completion wait variant
---
 arch/powerpc/platforms/ps3/device-init.c |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/reboot.h>
+#include <linux/rcuwait.h>
 
 #include <asm/firmware.h>
 #include <asm/lv1call.h>
@@ -670,7 +671,8 @@ struct ps3_notification_device {
 	spinlock_t lock;
 	u64 tag;
 	u64 lv1_status;
-	struct completion done;
+	struct rcuwait wait;
+	bool done;
 };
 
 enum ps3_notify_type {
@@ -712,7 +714,8 @@ static irqreturn_t ps3_notification_inte
 		pr_debug("%s:%u: completed, status 0x%llx\n", __func__,
 			 __LINE__, status);
 		dev->lv1_status = status;
-		complete(&dev->done);
+		dev->done = true;
+		rcuwait_wake_up(&dev->wait);
 	}
 	spin_unlock(&dev->lock);
 	return IRQ_HANDLED;
@@ -725,12 +728,12 @@ static int ps3_notification_read_write(s
 	unsigned long flags;
 	int res;
 
-	init_completion(&dev->done);
 	spin_lock_irqsave(&dev->lock, flags);
 	res = write ? lv1_storage_write(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
 					&dev->tag)
 		    : lv1_storage_read(dev->sbd.dev_id, 0, 0, 1, 0, lpar,
 				       &dev->tag);
+	dev->done = false;
 	spin_unlock_irqrestore(&dev->lock, flags);
 	if (res) {
 		pr_err("%s:%u: %s failed %d\n", __func__, __LINE__, op, res);
@@ -738,14 +741,10 @@ static int ps3_notification_read_write(s
 	}
 	pr_debug("%s:%u: notification %s issued\n", __func__, __LINE__, op);
 
-	res = wait_event_interruptible(dev->done.wait,
-				       dev->done.done || kthread_should_stop());
+	rcuwait_wait_event(&dev->wait, dev->done || kthread_should_stop(), TASK_IDLE);
+
 	if (kthread_should_stop())
 		res = -EINTR;
-	if (res) {
-		pr_debug("%s:%u: interrupted %s\n", __func__, __LINE__, op);
-		return res;
-	}
 
 	if (dev->lv1_status) {
 		pr_err("%s:%u: %s not completed, status 0x%llx\n", __func__,

