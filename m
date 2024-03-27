Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3E6E88F0B6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:15:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Eq00WyCo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fZb5N7mz3vtb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:15:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=Eq00WyCo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Wh74zWkz3vXJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:04:23 +1100 (AEDT)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id 24E00208B324;
	Wed, 27 Mar 2024 09:03:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 24E00208B324
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711555402;
	bh=41Ale5uO1PTnfIKryTKC5pcjHNLS2gULLDrqEidl/kI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Eq00WyCo6hcxiDCDUMRPmi0qrbBDFeudu7D2o12HCiVhgx5hyPk09CSdrCwkmdexm
	 e1eYeDyIRpXMIVLQCm12FB4zn/X5Ye3TrTP4crCGnn6auu/kqknM2AUPJSVgHko5Fw
	 HOHNjfcli5SdkOKdXhCQu+gocWohTCdQFuGGhSG4=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 6/9] ipmi: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 16:03:11 +0000
Message-Id: <20240327160314.9982-7-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240327160314.9982-1-apais@linux.microsoft.com>
References: <20240327160314.9982-1-apais@linux.microsoft.com>
X-Mailman-Approved-At: Thu, 28 Mar 2024 08:10:21 +1100
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
Cc: imx@lists.linux.dev, ulf.hansson@linaro.org, oneukum@suse.com, duncan.sands@free.fr, hayashi.kunihiko@socionext.com, linux-mmc@vger.kernel.org, aubin.constans@microchip.com, linus.walleij@linaro.org, Frank.Li@nxp.com, linux-hyperv@vger.kernel.org, HaraldWelte@viatech.com, paul@crapouillou.net, linux-tegra@vger.kernel.org, netdev@vger.kernel.org, maintainers@bluecherrydvr.com, peter.ujfalusi@gmail.com, manivannan.sadhasivam@linaro.org, linux-riscv@lists.infradead.org, kys@microsoft.com, robert.jarzmik@free.fr, haijie1@huawei.com, linux-renesas-soc@vger.kernel.org, wei.liu@kernel.org, linux-omap@vger.kernel.org, florian.fainelli@broadcom.com, linux-rdma@vger.kernel.org, vireshk@kernel.org, jassisinghbrar@gmail.com, decui@microsoft.com, wangzhou1@hisilicon.com, jernej.skrabec@gmail.com, jh80.chung@samsung.com, zw@zh-kernel.org, wens@csie.org, stern@rowland.harvard.edu, linux-arm-msm@vger.kernel.org, orsonzhai@gmail.com, pierre@ossman.eu, linux-usb@vger.kernel.org, Eugeniy.Paltsev@sy
 nopsys.com, patrice.chotard@foss.st.com, asahi@lists.linux.dev, brucechang@via.com.tw, keescook@chromium.org, oakad@yahoo.com, sven@svenpeter.dev, rjui@broadcom.com, s.hauer@pengutronix.de, sean.wang@mediatek.com, linux-actions@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, haojian.zhuang@gmail.com, mirq-linux@rere.qmqm.pl, dmaengine@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, baolin.wang@linux.alibaba.com, matthias.bgg@gmail.com, openipmi-developer@lists.sourceforge.net, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, sbranden@broadcom.com, logang@deltatee.com, andersson@kernel.org, marcan@marcan.st, haiyangz@microsoft.com, linux-mips@vger.kernel.org, leoyang.li@nxp.com, konrad.dybcio@linaro.org, linux-sunxi@lists.linux.dev, vkoul@kernel.org, linux-s390@vger.kernel.org, mhiramat@kernel.org, zhang.lyra@gmail.com, tj@kernel.org, manuel.lauss@gmail.com, linux-media@vger.kernel.org, s
 hawnguo@kernel.org, afaerber@suse.de, daniel@zonque.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts drivers/infiniband/* from tasklet to BH workqueue.

Based on the work done by Tejun Heo <tj@kernel.org>
Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git for-6.10

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/char/ipmi/ipmi_msghandler.c | 30 ++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/char/ipmi/ipmi_msghandler.c b/drivers/char/ipmi/ipmi_msghandler.c
index b0eedc4595b3..fce2a2dbdc82 100644
--- a/drivers/char/ipmi/ipmi_msghandler.c
+++ b/drivers/char/ipmi/ipmi_msghandler.c
@@ -36,12 +36,13 @@
 #include <linux/nospec.h>
 #include <linux/vmalloc.h>
 #include <linux/delay.h>
+#include <linux/workqueue.h>
 
 #define IPMI_DRIVER_VERSION "39.2"
 
 static struct ipmi_recv_msg *ipmi_alloc_recv_msg(void);
 static int ipmi_init_msghandler(void);
-static void smi_recv_tasklet(struct tasklet_struct *t);
+static void smi_recv_work(struct work_struct *t);
 static void handle_new_recv_msgs(struct ipmi_smi *intf);
 static void need_waiter(struct ipmi_smi *intf);
 static int handle_one_recv_msg(struct ipmi_smi *intf,
@@ -498,13 +499,13 @@ struct ipmi_smi {
 	/*
 	 * Messages queued for delivery.  If delivery fails (out of memory
 	 * for instance), They will stay in here to be processed later in a
-	 * periodic timer interrupt.  The tasklet is for handling received
+	 * periodic timer interrupt.  The work is for handling received
 	 * messages directly from the handler.
 	 */
 	spinlock_t       waiting_rcv_msgs_lock;
 	struct list_head waiting_rcv_msgs;
 	atomic_t	 watchdog_pretimeouts_to_deliver;
-	struct tasklet_struct recv_tasklet;
+	struct work_struct recv_work;
 
 	spinlock_t             xmit_msgs_lock;
 	struct list_head       xmit_msgs;
@@ -704,7 +705,7 @@ static void clean_up_interface_data(struct ipmi_smi *intf)
 	struct cmd_rcvr  *rcvr, *rcvr2;
 	struct list_head list;
 
-	tasklet_kill(&intf->recv_tasklet);
+	cancel_work_sync(&intf->recv_work);
 
 	free_smi_msg_list(&intf->waiting_rcv_msgs);
 	free_recv_msg_list(&intf->waiting_events);
@@ -1319,7 +1320,7 @@ static void free_user(struct kref *ref)
 {
 	struct ipmi_user *user = container_of(ref, struct ipmi_user, refcount);
 
-	/* SRCU cleanup must happen in task context. */
+	/* SRCU cleanup must happen in work context. */
 	queue_work(remove_work_wq, &user->remove_work);
 }
 
@@ -3605,8 +3606,7 @@ int ipmi_add_smi(struct module         *owner,
 	intf->curr_seq = 0;
 	spin_lock_init(&intf->waiting_rcv_msgs_lock);
 	INIT_LIST_HEAD(&intf->waiting_rcv_msgs);
-	tasklet_setup(&intf->recv_tasklet,
-		     smi_recv_tasklet);
+	INIT_WORK(&intf->recv_work, smi_recv_work);
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 0);
 	spin_lock_init(&intf->xmit_msgs_lock);
 	INIT_LIST_HEAD(&intf->xmit_msgs);
@@ -4779,7 +4779,7 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
 			 * To preserve message order, quit if we
 			 * can't handle a message.  Add the message
 			 * back at the head, this is safe because this
-			 * tasklet is the only thing that pulls the
+			 * work is the only thing that pulls the
 			 * messages.
 			 */
 			list_add(&smi_msg->link, &intf->waiting_rcv_msgs);
@@ -4812,10 +4812,10 @@ static void handle_new_recv_msgs(struct ipmi_smi *intf)
 	}
 }
 
-static void smi_recv_tasklet(struct tasklet_struct *t)
+static void smi_recv_work(struct work_struct *t)
 {
 	unsigned long flags = 0; /* keep us warning-free. */
-	struct ipmi_smi *intf = from_tasklet(intf, t, recv_tasklet);
+	struct ipmi_smi *intf = from_work(intf, t, recv_work);
 	int run_to_completion = intf->run_to_completion;
 	struct ipmi_smi_msg *newmsg = NULL;
 
@@ -4866,7 +4866,7 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 
 	/*
 	 * To preserve message order, we keep a queue and deliver from
-	 * a tasklet.
+	 * a work.
 	 */
 	if (!run_to_completion)
 		spin_lock_irqsave(&intf->waiting_rcv_msgs_lock, flags);
@@ -4887,9 +4887,9 @@ void ipmi_smi_msg_received(struct ipmi_smi *intf,
 		spin_unlock_irqrestore(&intf->xmit_msgs_lock, flags);
 
 	if (run_to_completion)
-		smi_recv_tasklet(&intf->recv_tasklet);
+		smi_recv_work(&intf->recv_work);
 	else
-		tasklet_schedule(&intf->recv_tasklet);
+		queue_work(system_bh_wq, &intf->recv_work);
 }
 EXPORT_SYMBOL(ipmi_smi_msg_received);
 
@@ -4899,7 +4899,7 @@ void ipmi_smi_watchdog_pretimeout(struct ipmi_smi *intf)
 		return;
 
 	atomic_set(&intf->watchdog_pretimeouts_to_deliver, 1);
-	tasklet_schedule(&intf->recv_tasklet);
+	queue_work(system_bh_wq, &intf->recv_work);
 }
 EXPORT_SYMBOL(ipmi_smi_watchdog_pretimeout);
 
@@ -5068,7 +5068,7 @@ static bool ipmi_timeout_handler(struct ipmi_smi *intf,
 				       flags);
 	}
 
-	tasklet_schedule(&intf->recv_tasklet);
+	queue_work(system_bh_wq, &intf->recv_work);
 
 	return need_timer;
 }
-- 
2.17.1

