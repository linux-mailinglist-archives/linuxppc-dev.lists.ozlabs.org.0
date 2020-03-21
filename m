Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CC318E0D9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 12:51:46 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48kzWg5mTqzDrg8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 21 Mar 2020 22:51:43 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 48kz886gYkzDr84
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 21 Mar 2020 22:34:48 +1100 (AEDT)
Received: from p5de0bf0b.dip0.t-ipconnect.de ([93.224.191.11]
 helo=nanos.tec.linutronix.de)
 by Galois.linutronix.de with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <tglx@linutronix.de>)
 id 1jFcOQ-0001zH-Br; Sat, 21 Mar 2020 12:34:18 +0100
Received: from nanos.tec.linutronix.de (localhost [IPv6:::1])
 by nanos.tec.linutronix.de (Postfix) with ESMTP id AC6861039FD;
 Sat, 21 Mar 2020 12:34:17 +0100 (CET)
Message-Id: <20200321113240.936097534@linutronix.de>
User-Agent: quilt/0.65
Date: Sat, 21 Mar 2020 12:25:46 +0100
From: Thomas Gleixner <tglx@linutronix.de>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [patch V3 02/20] pci/switchtec: Replace completion wait queue usage
 for poll
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

The poll callback is using the completion wait queue and sticks it into
poll_wait() to wake up pollers after a command has completed.

This works to some extent, but cannot provide EPOLLEXCLUSIVE support
because the waker side uses complete_all() which unconditionally wakes up
all waiters. complete_all() is required because completions internally use
exclusive wait and complete() only wakes up one waiter by default.

This mixes conceptually different mechanisms and relies on internal
implementation details of completions, which in turn puts contraints on
changing the internal implementation of completions.

Replace it with a regular wait queue and store the state in struct
switchtec_user.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
Cc: Kurt Schwemmer <kurt.schwemmer@microsemi.com>
Cc: linux-pci@vger.kernel.org
---
V2: Reworded changelog.
---
 drivers/pci/switch/switchtec.c |   22 +++++++++++++---------
 1 file changed, 13 insertions(+), 9 deletions(-)

--- a/drivers/pci/switch/switchtec.c
+++ b/drivers/pci/switch/switchtec.c
@@ -52,10 +52,11 @@ struct switchtec_user {
 
 	enum mrpc_state state;
 
-	struct completion comp;
+	wait_queue_head_t cmd_comp;
 	struct kref kref;
 	struct list_head list;
 
+	bool cmd_done;
 	u32 cmd;
 	u32 status;
 	u32 return_code;
@@ -77,7 +78,7 @@ static struct switchtec_user *stuser_cre
 	stuser->stdev = stdev;
 	kref_init(&stuser->kref);
 	INIT_LIST_HEAD(&stuser->list);
-	init_completion(&stuser->comp);
+	init_waitqueue_head(&stuser->cmd_comp);
 	stuser->event_cnt = atomic_read(&stdev->event_cnt);
 
 	dev_dbg(&stdev->dev, "%s: %p\n", __func__, stuser);
@@ -175,7 +176,7 @@ static int mrpc_queue_cmd(struct switcht
 	kref_get(&stuser->kref);
 	stuser->read_len = sizeof(stuser->data);
 	stuser_set_state(stuser, MRPC_QUEUED);
-	reinit_completion(&stuser->comp);
+	stuser->cmd_done = false;
 	list_add_tail(&stuser->list, &stdev->mrpc_queue);
 
 	mrpc_cmd_submit(stdev);
@@ -222,7 +223,8 @@ static void mrpc_complete_cmd(struct swi
 		memcpy_fromio(stuser->data, &stdev->mmio_mrpc->output_data,
 			      stuser->read_len);
 out:
-	complete_all(&stuser->comp);
+	stuser->cmd_done = true;
+	wake_up_interruptible(&stuser->cmd_comp);
 	list_del_init(&stuser->list);
 	stuser_put(stuser);
 	stdev->mrpc_busy = 0;
@@ -529,10 +531,11 @@ static ssize_t switchtec_dev_read(struct
 	mutex_unlock(&stdev->mrpc_mutex);
 
 	if (filp->f_flags & O_NONBLOCK) {
-		if (!try_wait_for_completion(&stuser->comp))
+		if (!stuser->cmd_done)
 			return -EAGAIN;
 	} else {
-		rc = wait_for_completion_interruptible(&stuser->comp);
+		rc = wait_event_interruptible(stuser->cmd_comp,
+					      stuser->cmd_done);
 		if (rc < 0)
 			return rc;
 	}
@@ -580,7 +583,7 @@ static __poll_t switchtec_dev_poll(struc
 	struct switchtec_dev *stdev = stuser->stdev;
 	__poll_t ret = 0;
 
-	poll_wait(filp, &stuser->comp.wait, wait);
+	poll_wait(filp, &stuser->cmd_comp, wait);
 	poll_wait(filp, &stdev->event_wq, wait);
 
 	if (lock_mutex_and_test_alive(stdev))
@@ -588,7 +591,7 @@ static __poll_t switchtec_dev_poll(struc
 
 	mutex_unlock(&stdev->mrpc_mutex);
 
-	if (try_wait_for_completion(&stuser->comp))
+	if (stuser->cmd_done)
 		ret |= EPOLLIN | EPOLLRDNORM;
 
 	if (stuser->event_cnt != atomic_read(&stdev->event_cnt))
@@ -1272,7 +1275,8 @@ static void stdev_kill(struct switchtec_
 
 	/* Wake up and kill any users waiting on an MRPC request */
 	list_for_each_entry_safe(stuser, tmpuser, &stdev->mrpc_queue, list) {
-		complete_all(&stuser->comp);
+		stuser->cmd_done = true;
+		wake_up_interruptible(&stuser->cmd_comp);
 		list_del_init(&stuser->list);
 		stuser_put(stuser);
 	}


