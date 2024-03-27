Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9703D88F0BA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:17:10 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qqrrXo5l;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fd02f1xz3w2t
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:17:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=qqrrXo5l;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Wh76d5Hz3vXd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:04:23 +1100 (AEDT)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id 5196C208B32D;
	Wed, 27 Mar 2024 09:03:22 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5196C208B32D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711555402;
	bh=Kzv1AWOVV8GwTK+7jQ3kzJ2xEaKpz9QhVy5gAjNjK7U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qqrrXo5lmMz+nfVNN9r5cBg6a0WE9kMxRH4QKGEt97MvZ5OTYlhItum+d/Dt8FYns
	 jLTUDWcoZbdYSBF9SUUK19Rtc09qXlm1au2glAYLh7DoVs08kRZPQ+6L/Q5VrqnVTO
	 GE1JR4g35YmWcS2Wb0B0gHhtq9fb3bDtUTSJFZuw=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 7/9] s390: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 16:03:12 +0000
Message-Id: <20240327160314.9982-8-apais@linux.microsoft.com>
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

Note: Not tested. Please test/review.

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/s390/block/dasd.c              | 42 ++++++++++++------------
 drivers/s390/block/dasd_int.h          | 10 +++---
 drivers/s390/char/con3270.c            | 27 ++++++++--------
 drivers/s390/crypto/ap_bus.c           | 24 +++++++-------
 drivers/s390/crypto/ap_bus.h           |  2 +-
 drivers/s390/crypto/zcrypt_msgtype50.c |  2 +-
 drivers/s390/crypto/zcrypt_msgtype6.c  |  4 +--
 drivers/s390/net/ctcm_fsms.c           |  4 +--
 drivers/s390/net/ctcm_main.c           | 15 ++++-----
 drivers/s390/net/ctcm_main.h           |  5 +--
 drivers/s390/net/ctcm_mpc.c            | 12 +++----
 drivers/s390/net/ctcm_mpc.h            |  7 ++--
 drivers/s390/net/lcs.c                 | 26 +++++++--------
 drivers/s390/net/lcs.h                 |  2 +-
 drivers/s390/net/qeth_core_main.c      |  2 +-
 drivers/s390/scsi/zfcp_qdio.c          | 45 +++++++++++++-------------
 drivers/s390/scsi/zfcp_qdio.h          |  9 +++---
 17 files changed, 117 insertions(+), 121 deletions(-)

diff --git a/drivers/s390/block/dasd.c b/drivers/s390/block/dasd.c
index 0a97cfedd706..c6f9910f0a98 100644
--- a/drivers/s390/block/dasd.c
+++ b/drivers/s390/block/dasd.c
@@ -54,8 +54,8 @@ MODULE_LICENSE("GPL");
  * SECTION: prototypes for static functions of dasd.c
  */
 static int dasd_flush_block_queue(struct dasd_block *);
-static void dasd_device_tasklet(unsigned long);
-static void dasd_block_tasklet(unsigned long);
+static void dasd_device_work(struct work_struct *);
+static void dasd_block_work(struct work_struct *);
 static void do_kick_device(struct work_struct *);
 static void do_reload_device(struct work_struct *);
 static void do_requeue_requests(struct work_struct *);
@@ -114,9 +114,8 @@ struct dasd_device *dasd_alloc_device(void)
 	dasd_init_chunklist(&device->erp_chunks, device->erp_mem, PAGE_SIZE);
 	dasd_init_chunklist(&device->ese_chunks, device->ese_mem, PAGE_SIZE * 2);
 	spin_lock_init(&device->mem_lock);
-	atomic_set(&device->tasklet_scheduled, 0);
-	tasklet_init(&device->tasklet, dasd_device_tasklet,
-		     (unsigned long) device);
+	atomic_set(&device->work_scheduled, 0);
+	INIT_WORK(&device->bh, dasd_device_work);
 	INIT_LIST_HEAD(&device->ccw_queue);
 	timer_setup(&device->timer, dasd_device_timeout, 0);
 	INIT_WORK(&device->kick_work, do_kick_device);
@@ -154,9 +153,8 @@ struct dasd_block *dasd_alloc_block(void)
 	/* open_count = 0 means device online but not in use */
 	atomic_set(&block->open_count, -1);
 
-	atomic_set(&block->tasklet_scheduled, 0);
-	tasklet_init(&block->tasklet, dasd_block_tasklet,
-		     (unsigned long) block);
+	atomic_set(&block->work_scheduled, 0);
+	INIT_WORK(&block->bh, dasd_block_work);
 	INIT_LIST_HEAD(&block->ccw_queue);
 	spin_lock_init(&block->queue_lock);
 	INIT_LIST_HEAD(&block->format_list);
@@ -2148,12 +2146,12 @@ EXPORT_SYMBOL_GPL(dasd_flush_device_queue);
 /*
  * Acquire the device lock and process queues for the device.
  */
-static void dasd_device_tasklet(unsigned long data)
+static void dasd_device_work(struct work_struct *t)
 {
-	struct dasd_device *device = (struct dasd_device *) data;
+	struct dasd_device *device = from_work(device, t, bh);
 	struct list_head final_queue;
 
-	atomic_set (&device->tasklet_scheduled, 0);
+	atomic_set (&device->work_scheduled, 0);
 	INIT_LIST_HEAD(&final_queue);
 	spin_lock_irq(get_ccwdev_lock(device->cdev));
 	/* Check expire time of first request on the ccw queue. */
@@ -2174,15 +2172,15 @@ static void dasd_device_tasklet(unsigned long data)
 }
 
 /*
- * Schedules a call to dasd_tasklet over the device tasklet.
+ * Schedules a call to dasd_work over the device wq.
  */
 void dasd_schedule_device_bh(struct dasd_device *device)
 {
 	/* Protect against rescheduling. */
-	if (atomic_cmpxchg (&device->tasklet_scheduled, 0, 1) != 0)
+	if (atomic_cmpxchg (&device->work_scheduled, 0, 1) != 0)
 		return;
 	dasd_get_device(device);
-	tasklet_hi_schedule(&device->tasklet);
+	queue_work(system_bh_highpri_wq, &device->bh);
 }
 EXPORT_SYMBOL(dasd_schedule_device_bh);
 
@@ -2595,7 +2593,7 @@ int dasd_sleep_on_immediatly(struct dasd_ccw_req *cqr)
 	else
 		rc = -EIO;
 
-	/* kick tasklets */
+	/* kick works */
 	dasd_schedule_device_bh(device);
 	if (device->block)
 		dasd_schedule_block_bh(device->block);
@@ -2891,15 +2889,15 @@ static void __dasd_block_start_head(struct dasd_block *block)
  * block layer request queue, creates ccw requests, enqueues them on
  * a dasd_device and processes ccw requests that have been returned.
  */
-static void dasd_block_tasklet(unsigned long data)
+static void dasd_block_work(struct work_struct *t)
 {
-	struct dasd_block *block = (struct dasd_block *) data;
+	struct dasd_block *block = from_work(block, t, bh);
 	struct list_head final_queue;
 	struct list_head *l, *n;
 	struct dasd_ccw_req *cqr;
 	struct dasd_queue *dq;
 
-	atomic_set(&block->tasklet_scheduled, 0);
+	atomic_set(&block->work_scheduled, 0);
 	INIT_LIST_HEAD(&final_queue);
 	spin_lock_irq(&block->queue_lock);
 	/* Finish off requests on ccw queue */
@@ -2970,7 +2968,7 @@ static int _dasd_requests_to_flushqueue(struct dasd_block *block,
 		if (rc < 0)
 			break;
 		/* Rechain request (including erp chain) so it won't be
-		 * touched by the dasd_block_tasklet anymore.
+		 * touched by the dasd_block_work anymore.
 		 * Replace the callback so we notice when the request
 		 * is returned from the dasd_device layer.
 		 */
@@ -3025,16 +3023,16 @@ static int dasd_flush_block_queue(struct dasd_block *block)
 }
 
 /*
- * Schedules a call to dasd_tasklet over the device tasklet.
+ * Schedules a call to dasd_work over the device wq.
  */
 void dasd_schedule_block_bh(struct dasd_block *block)
 {
 	/* Protect against rescheduling. */
-	if (atomic_cmpxchg(&block->tasklet_scheduled, 0, 1) != 0)
+	if (atomic_cmpxchg(&block->work_scheduled, 0, 1) != 0)
 		return;
 	/* life cycle of block is bound to it's base device */
 	dasd_get_device(block->base);
-	tasklet_hi_schedule(&block->tasklet);
+	queue_work(system_bh_highpri_wq, &block->bh);
 }
 EXPORT_SYMBOL(dasd_schedule_block_bh);
 
diff --git a/drivers/s390/block/dasd_int.h b/drivers/s390/block/dasd_int.h
index e5f40536b425..abe4d43f474e 100644
--- a/drivers/s390/block/dasd_int.h
+++ b/drivers/s390/block/dasd_int.h
@@ -28,7 +28,7 @@
  *   known -> basic: request irq line for the device.
  *   basic -> ready: do the initial analysis, e.g. format detection,
  *                   do block device setup and detect partitions.
- *   ready -> online: schedule the device tasklet.
+ *   ready -> online: schedule the device work.
  * Things to do for shutdown state transitions:
  *   online -> ready: just set the new device state.
  *   ready -> basic: flush requests from the block device layer, clear
@@ -579,8 +579,8 @@ struct dasd_device {
 	struct list_head erp_chunks;
 	struct list_head ese_chunks;
 
-	atomic_t tasklet_scheduled;
-        struct tasklet_struct tasklet;
+	atomic_t work_scheduled;
+	struct work_struct bh;
 	struct work_struct kick_work;
 	struct work_struct reload_device;
 	struct work_struct kick_validate;
@@ -630,8 +630,8 @@ struct dasd_block {
 	struct list_head ccw_queue;
 	spinlock_t queue_lock;
 
-	atomic_t tasklet_scheduled;
-	struct tasklet_struct tasklet;
+	atomic_t work_scheduled;
+	struct work_struct bh;
 	struct timer_list timer;
 
 	struct dentry *debugfs_dentry;
diff --git a/drivers/s390/char/con3270.c b/drivers/s390/char/con3270.c
index 251d2a1c3eef..993275e9b2f4 100644
--- a/drivers/s390/char/con3270.c
+++ b/drivers/s390/char/con3270.c
@@ -28,6 +28,7 @@
 #include <asm/ebcdic.h>
 #include <asm/cpcmd.h>
 #include <linux/uaccess.h>
+#include <linux/workqueue.h>
 
 #include "raw3270.h"
 #include "keyboard.h"
@@ -107,8 +108,8 @@ struct tty3270 {
 	struct raw3270_request *readpartreq;
 	unsigned char inattr;		/* Visible/invisible input. */
 	int throttle, attn;		/* tty throttle/unthrottle. */
-	struct tasklet_struct readlet;	/* Tasklet to issue read request. */
-	struct tasklet_struct hanglet;	/* Tasklet to hang up the tty. */
+	struct work_struct read_work;	/* Work to issue read request. */
+	struct work_struct hang_work;	/* Work to hang up the tty. */
 	struct kbd_data *kbd;		/* key_maps stuff. */
 
 	/* Escape sequence parsing. */
@@ -667,9 +668,9 @@ static void tty3270_scroll_backward(struct kbd_data *kbd)
 /*
  * Pass input line to tty.
  */
-static void tty3270_read_tasklet(unsigned long data)
+static void tty3270_read_work(struct work_struct *T)
 {
-	struct raw3270_request *rrq = (struct raw3270_request *)data;
+	struct raw3270_request *rrq = from_work(rrq, t, read_work);
 	static char kreset_data = TW_KR;
 	struct tty3270 *tp = container_of(rrq->view, struct tty3270, view);
 	char *input;
@@ -734,8 +735,8 @@ static void tty3270_read_callback(struct raw3270_request *rq, void *data)
 	struct tty3270 *tp = container_of(rq->view, struct tty3270, view);
 
 	raw3270_get_view(rq->view);
-	/* Schedule tasklet to pass input to tty. */
-	tasklet_schedule(&tp->readlet);
+	/* Schedule work to pass input to tty. */
+	queue_work(system_bh_wq, &tp->read_work);
 }
 
 /*
@@ -768,9 +769,9 @@ static void tty3270_issue_read(struct tty3270 *tp, int lock)
 /*
  * Hang up the tty
  */
-static void tty3270_hangup_tasklet(unsigned long data)
+static void tty3270_hangup_work(struct work_struct *t)
 {
-	struct tty3270 *tp = (struct tty3270 *)data;
+	struct tty3270 *tp = from_work(tp, t, hang_work);
 
 	tty_port_tty_hangup(&tp->port, true);
 	raw3270_put_view(&tp->view);
@@ -797,7 +798,7 @@ static void tty3270_deactivate(struct raw3270_view *view)
 
 static void tty3270_irq(struct tty3270 *tp, struct raw3270_request *rq, struct irb *irb)
 {
-	/* Handle ATTN. Schedule tasklet to read aid. */
+	/* Handle ATTN. Schedule work to read aid. */
 	if (irb->scsw.cmd.dstat & DEV_STAT_ATTENTION) {
 		if (!tp->throttle)
 			tty3270_issue_read(tp, 0);
@@ -809,7 +810,7 @@ static void tty3270_irq(struct tty3270 *tp, struct raw3270_request *rq, struct i
 		if (irb->scsw.cmd.dstat & DEV_STAT_UNIT_CHECK) {
 			rq->rc = -EIO;
 			raw3270_get_view(&tp->view);
-			tasklet_schedule(&tp->hanglet);
+			queue_work(system_bh_wq, &tp->hang_work);
 		} else {
 			/* Normal end. Copy residual count. */
 			rq->rescnt = irb->scsw.cmd.count;
@@ -850,10 +851,8 @@ static struct tty3270 *tty3270_alloc_view(void)
 
 	tty_port_init(&tp->port);
 	timer_setup(&tp->timer, tty3270_update, 0);
-	tasklet_init(&tp->readlet, tty3270_read_tasklet,
-		     (unsigned long)tp->read);
-	tasklet_init(&tp->hanglet, tty3270_hangup_tasklet,
-		     (unsigned long)tp);
+	INIT_WORK(&tp->read_work, tty3270_read_work);
+	INIT_WORK(&tp->hang_work, tty3270_hangup_work);
 	return tp;
 
 out_readpartreq:
diff --git a/drivers/s390/crypto/ap_bus.c b/drivers/s390/crypto/ap_bus.c
index cce0bafd4c92..5136ecd965ae 100644
--- a/drivers/s390/crypto/ap_bus.c
+++ b/drivers/s390/crypto/ap_bus.c
@@ -111,10 +111,10 @@ static void ap_scan_bus_wq_callback(struct work_struct *);
 static DECLARE_WORK(ap_scan_bus_work, ap_scan_bus_wq_callback);
 
 /*
- * Tasklet & timer for AP request polling and interrupts
+ * Work & timer for AP request polling and interrupts
  */
-static void ap_tasklet_fn(unsigned long);
-static DECLARE_TASKLET_OLD(ap_tasklet, ap_tasklet_fn);
+static void ap_work_fn(struct work_struct *);
+static DECLARE_WORK(ap_work, ap_work_fn);
 static DECLARE_WAIT_QUEUE_HEAD(ap_poll_wait);
 static struct task_struct *ap_poll_kthread;
 static DEFINE_MUTEX(ap_poll_thread_mutex);
@@ -450,16 +450,16 @@ void ap_request_timeout(struct timer_list *t)
  * ap_poll_timeout(): AP receive polling for finished AP requests.
  * @unused: Unused pointer.
  *
- * Schedules the AP tasklet using a high resolution timer.
+ * Schedules the AP work using a high resolution timer.
  */
 static enum hrtimer_restart ap_poll_timeout(struct hrtimer *unused)
 {
-	tasklet_schedule(&ap_tasklet);
+	queue_work(system_bh_wq, &ap_work);
 	return HRTIMER_NORESTART;
 }
 
 /**
- * ap_interrupt_handler() - Schedule ap_tasklet on interrupt
+ * ap_interrupt_handler() - Schedule ap_work on interrupt
  * @airq: pointer to adapter interrupt descriptor
  * @tpi_info: ignored
  */
@@ -467,23 +467,23 @@ static void ap_interrupt_handler(struct airq_struct *airq,
 				 struct tpi_info *tpi_info)
 {
 	inc_irq_stat(IRQIO_APB);
-	tasklet_schedule(&ap_tasklet);
+	queue_work(system_bh_wq, &ap_work);
 }
 
 /**
- * ap_tasklet_fn(): Tasklet to poll all AP devices.
- * @dummy: Unused variable
+ * ap_work_fn(): Work to poll all AP devices.
+ * @t: pointer to work_struct
  *
  * Poll all AP devices on the bus.
  */
-static void ap_tasklet_fn(unsigned long dummy)
+static void ap_work_fn(struct work_struct *t)
 {
 	int bkt;
 	struct ap_queue *aq;
 	enum ap_sm_wait wait = AP_SM_WAIT_NONE;
 
 	/* Reset the indicator if interrupts are used. Thus new interrupts can
-	 * be received. Doing it in the beginning of the tasklet is therefore
+	 * be received. Doing it in the beginning of the work is therefore
 	 * important that no requests on any AP get lost.
 	 */
 	if (ap_irq_flag)
@@ -546,7 +546,7 @@ static int ap_poll_thread(void *data)
 			try_to_freeze();
 			continue;
 		}
-		ap_tasklet_fn(0);
+		queue_work(system_bh_wq, &ap_work);
 	}
 
 	return 0;
diff --git a/drivers/s390/crypto/ap_bus.h b/drivers/s390/crypto/ap_bus.h
index 59c7ed49aa02..7daea5c536c9 100644
--- a/drivers/s390/crypto/ap_bus.h
+++ b/drivers/s390/crypto/ap_bus.h
@@ -223,7 +223,7 @@ struct ap_message {
 	u16 flags;			/* Flags, see AP_MSG_FLAG_xxx */
 	int rc;				/* Return code for this message */
 	void *private;			/* ap driver private pointer. */
-	/* receive is called from tasklet context */
+	/* receive is called from work context */
 	void (*receive)(struct ap_queue *, struct ap_message *,
 			struct ap_message *);
 };
diff --git a/drivers/s390/crypto/zcrypt_msgtype50.c b/drivers/s390/crypto/zcrypt_msgtype50.c
index 3b39cb8f926d..c7bf389f2938 100644
--- a/drivers/s390/crypto/zcrypt_msgtype50.c
+++ b/drivers/s390/crypto/zcrypt_msgtype50.c
@@ -403,7 +403,7 @@ static int convert_response(struct zcrypt_queue *zq,
 /*
  * This function is called from the AP bus code after a crypto request
  * "msg" has finished with the reply message "reply".
- * It is called from tasklet context.
+ * It is called from work context.
  * @aq: pointer to the AP device
  * @msg: pointer to the AP message
  * @reply: pointer to the AP reply message
diff --git a/drivers/s390/crypto/zcrypt_msgtype6.c b/drivers/s390/crypto/zcrypt_msgtype6.c
index 215f257d2360..b62e2c9cee58 100644
--- a/drivers/s390/crypto/zcrypt_msgtype6.c
+++ b/drivers/s390/crypto/zcrypt_msgtype6.c
@@ -847,7 +847,7 @@ static int convert_response_rng(struct zcrypt_queue *zq,
 /*
  * This function is called from the AP bus code after a crypto request
  * "msg" has finished with the reply message "reply".
- * It is called from tasklet context.
+ * It is called from work context.
  * @aq: pointer to the AP queue
  * @msg: pointer to the AP message
  * @reply: pointer to the AP reply message
@@ -913,7 +913,7 @@ static void zcrypt_msgtype6_receive(struct ap_queue *aq,
 /*
  * This function is called from the AP bus code after a crypto request
  * "msg" has finished with the reply message "reply".
- * It is called from tasklet context.
+ * It is called from work context.
  * @aq: pointer to the AP queue
  * @msg: pointer to the AP message
  * @reply: pointer to the AP reply message
diff --git a/drivers/s390/net/ctcm_fsms.c b/drivers/s390/net/ctcm_fsms.c
index 9678c6a2cda7..3b02a41c4386 100644
--- a/drivers/s390/net/ctcm_fsms.c
+++ b/drivers/s390/net/ctcm_fsms.c
@@ -1420,12 +1420,12 @@ static void ctcmpc_chx_rx(fsm_instance *fi, int event, void *arg)
 		case MPCG_STATE_READY:
 			skb_put_data(new_skb, skb->data, block_len);
 			skb_queue_tail(&ch->io_queue, new_skb);
-			tasklet_schedule(&ch->ch_tasklet);
+			queue_work(system_bh_wq, &ch->ch_work);
 			break;
 		default:
 			skb_put_data(new_skb, skb->data, len);
 			skb_queue_tail(&ch->io_queue, new_skb);
-			tasklet_hi_schedule(&ch->ch_tasklet);
+			queue_work(system_bh_highpri_wq, &ch->ch_work);
 			break;
 		}
 	}
diff --git a/drivers/s390/net/ctcm_main.c b/drivers/s390/net/ctcm_main.c
index 878fe3ce53ad..c504db179982 100644
--- a/drivers/s390/net/ctcm_main.c
+++ b/drivers/s390/net/ctcm_main.c
@@ -223,8 +223,8 @@ static void channel_remove(struct channel *ch)
 				dev_kfree_skb_any(ch->trans_skb);
 			}
 			if (IS_MPC(ch)) {
-				tasklet_kill(&ch->ch_tasklet);
-				tasklet_kill(&ch->ch_disc_tasklet);
+				cancel_work_sync(&ch->ch_work);
+				cancel_work_sync(&ch->ch_disc_work);
 				kfree(ch->discontact_th);
 			}
 			kfree(ch->ccw);
@@ -1027,7 +1027,7 @@ static void ctcm_free_netdevice(struct net_device *dev)
 				kfree_fsm(grp->fsm);
 			dev_kfree_skb(grp->xid_skb);
 			dev_kfree_skb(grp->rcvd_xid_skb);
-			tasklet_kill(&grp->mpc_tasklet2);
+			cancel_work_sync(&grp->mpc_work2);
 			kfree(grp);
 			priv->mpcg = NULL;
 		}
@@ -1118,8 +1118,7 @@ static struct net_device *ctcm_init_netdevice(struct ctcm_priv *priv)
 			free_netdev(dev);
 			return NULL;
 		}
-		tasklet_init(&grp->mpc_tasklet2,
-				mpc_group_ready, (unsigned long)dev);
+		INIT_WORK(&grp->mpc_work2, mpc_group_ready);
 		dev->mtu = MPC_BUFSIZE_DEFAULT -
 				TH_HEADER_LENGTH - PDU_HEADER_LENGTH;
 
@@ -1319,10 +1318,8 @@ static int add_channel(struct ccw_device *cdev, enum ctcm_channel_types type,
 					goto nomem_return;
 
 		ch->discontact_th->th_blk_flag = TH_DISCONTACT;
-		tasklet_init(&ch->ch_disc_tasklet,
-			mpc_action_send_discontact, (unsigned long)ch);
-
-		tasklet_init(&ch->ch_tasklet, ctcmpc_bh, (unsigned long)ch);
+		INIT_WORK(&ch->ch_disc_work, mpc_action_send_discontact);
+		INIT_WORK(&ch->ch_work, ctcmpc_bh);
 		ch->max_bufsize = (MPC_BUFSIZE_DEFAULT - 35);
 		ccw_num = 17;
 	} else
diff --git a/drivers/s390/net/ctcm_main.h b/drivers/s390/net/ctcm_main.h
index 25164e8bf13d..1143c037a7f7 100644
--- a/drivers/s390/net/ctcm_main.h
+++ b/drivers/s390/net/ctcm_main.h
@@ -13,6 +13,7 @@
 
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 #include "fsm.h"
 #include "ctcm_dbug.h"
@@ -154,7 +155,7 @@ struct channel {
 	int max_bufsize;
 	struct sk_buff *trans_skb;	/* transmit/receive buffer */
 	struct sk_buff_head io_queue;	/* universal I/O queue */
-	struct tasklet_struct ch_tasklet;	/* MPC ONLY */
+	struct work_struct ch_work;	/* MPC ONLY */
 	/*
 	 * TX queue for collecting skb's during busy.
 	 */
@@ -188,7 +189,7 @@ struct channel {
 	fsm_timer		sweep_timer;
 	struct sk_buff_head	sweep_queue;
 	struct th_header	*discontact_th;
-	struct tasklet_struct	ch_disc_tasklet;
+	struct work_struct 	ch_disc_work;
 	/* MPC ONLY section end */
 
 	int retry;		/* retry counter for misc. operations */
diff --git a/drivers/s390/net/ctcm_mpc.c b/drivers/s390/net/ctcm_mpc.c
index 9e580ef69bda..0b7ed15ce29d 100644
--- a/drivers/s390/net/ctcm_mpc.c
+++ b/drivers/s390/net/ctcm_mpc.c
@@ -588,7 +588,7 @@ void ctc_mpc_flow_control(int port_num, int flowc)
 			fsm_newstate(grp->fsm, MPCG_STATE_READY);
 			/* ensure any data that has accumulated */
 			/* on the io_queue will now be sen t	*/
-			tasklet_schedule(&rch->ch_tasklet);
+			queue_work(system_bh_wq, &rch->ch_work);
 		}
 		/* possible race condition			*/
 		if (mpcg_state == MPCG_STATE_READY) {
@@ -847,7 +847,7 @@ static void mpc_action_go_ready(fsm_instance *fsm, int event, void *arg)
 	grp->out_of_sequence = 0;
 	grp->estconn_called = 0;
 
-	tasklet_hi_schedule(&grp->mpc_tasklet2);
+	queue_work(system_bh_highpri_wq, &grp->mpc_work2);
 
 	return;
 }
@@ -1213,16 +1213,16 @@ static void ctcmpc_unpack_skb(struct channel *ch, struct sk_buff *pskb)
 }
 
 /*
- * tasklet helper for mpc's skb unpacking.
+ * work helper for mpc's skb unpacking.
  *
  * ch		The channel to work on.
  * Allow flow control back pressure to occur here.
  * Throttling back channel can result in excessive
  * channel inactivity and system deact of channel
  */
-void ctcmpc_bh(unsigned long thischan)
+void ctcmpc_bh(struct work_struct *t)
 {
-	struct channel	  *ch	= (struct channel *)thischan;
+	struct channel	  *ch	= from_work(ch, t, ch_work);
 	struct sk_buff	  *skb;
 	struct net_device *dev	= ch->netdev;
 	struct ctcm_priv  *priv	= dev->ml_priv;
@@ -1380,7 +1380,7 @@ static void mpc_action_go_inop(fsm_instance *fi, int event, void *arg)
 	case MPCG_STATE_FLOWC:
 	case MPCG_STATE_READY:
 	default:
-		tasklet_hi_schedule(&wch->ch_disc_tasklet);
+		queue_work(system_bh_wq, &wch->ch_disc_work);
 	}
 
 	grp->xid2_tgnum = 0;
diff --git a/drivers/s390/net/ctcm_mpc.h b/drivers/s390/net/ctcm_mpc.h
index da41b26f76d1..735bea5d565a 100644
--- a/drivers/s390/net/ctcm_mpc.h
+++ b/drivers/s390/net/ctcm_mpc.h
@@ -13,6 +13,7 @@
 
 #include <linux/interrupt.h>
 #include <linux/skbuff.h>
+#include <linux/workqueue.h>
 #include "fsm.h"
 
 /*
@@ -156,8 +157,8 @@ struct mpcg_info {
 };
 
 struct mpc_group {
-	struct tasklet_struct mpc_tasklet;
-	struct tasklet_struct mpc_tasklet2;
+	struct work_struct mpc_work;
+	struct work_struct mpc_work2;
 	int	changed_side;
 	int	saved_state;
 	int	channels_terminating;
@@ -233,6 +234,6 @@ void mpc_group_ready(unsigned long adev);
 void mpc_channel_action(struct channel *ch, int direction, int action);
 void mpc_action_send_discontact(unsigned long thischan);
 void mpc_action_discontact(fsm_instance *fi, int event, void *arg);
-void ctcmpc_bh(unsigned long thischan);
+void ctcmpc_bh(struct work_struct *t);
 #endif
 /* --- This is the END my friend --- */
diff --git a/drivers/s390/net/lcs.c b/drivers/s390/net/lcs.c
index 25d4e6376591..751b7b212c91 100644
--- a/drivers/s390/net/lcs.c
+++ b/drivers/s390/net/lcs.c
@@ -49,7 +49,7 @@ static struct device *lcs_root_dev;
 /*
  * Some prototypes.
  */
-static void lcs_tasklet(unsigned long);
+static void lcs_work(struct work_struct *);
 static void lcs_start_kernel_thread(struct work_struct *);
 static void lcs_get_frames_cb(struct lcs_channel *, struct lcs_buffer *);
 #ifdef CONFIG_IP_MULTICAST
@@ -140,8 +140,8 @@ static void
 lcs_cleanup_channel(struct lcs_channel *channel)
 {
 	LCS_DBF_TEXT(3, setup, "cleanch");
-	/* Kill write channel tasklets. */
-	tasklet_kill(&channel->irq_tasklet);
+	/* Kill write channel works. */
+	cancel_work_sync(&channel->irq_work);
 	/* Free channel buffers. */
 	lcs_free_channel(channel);
 }
@@ -244,9 +244,8 @@ lcs_setup_read(struct lcs_card *card)
 	LCS_DBF_TEXT(3, setup, "initread");
 
 	lcs_setup_read_ccws(card);
-	/* Initialize read channel tasklet. */
-	card->read.irq_tasklet.data = (unsigned long) &card->read;
-	card->read.irq_tasklet.func = lcs_tasklet;
+	/* Initialize read channel work. */
+	INIT_WORK(card->read.irq_work, lcs_work);
 	/* Initialize waitqueue. */
 	init_waitqueue_head(&card->read.wait_q);
 }
@@ -290,9 +289,8 @@ lcs_setup_write(struct lcs_card *card)
 	LCS_DBF_TEXT(3, setup, "initwrit");
 
 	lcs_setup_write_ccws(card);
-	/* Initialize write channel tasklet. */
-	card->write.irq_tasklet.data = (unsigned long) &card->write;
-	card->write.irq_tasklet.func = lcs_tasklet;
+	/* Initialize write channel work. */
+	INIT_WORK(card->write.irq_work, lcs_work);
 	/* Initialize waitqueue. */
 	init_waitqueue_head(&card->write.wait_q);
 }
@@ -1429,22 +1427,22 @@ lcs_irq(struct ccw_device *cdev, unsigned long intparm, struct irb *irb)
 	}
 	if (irb->scsw.cmd.fctl & SCSW_FCTL_CLEAR_FUNC)
 		channel->state = LCS_CH_STATE_CLEARED;
-	/* Do the rest in the tasklet. */
-	tasklet_schedule(&channel->irq_tasklet);
+	/* Do the rest in the work. */
+	queue_work(system_bh_wq, &channel->irq_work);
 }
 
 /*
- * Tasklet for IRQ handler
+ * Work for IRQ handler
  */
 static void
-lcs_tasklet(unsigned long data)
+lcs_work(struct work_struct *t)
 {
 	unsigned long flags;
 	struct lcs_channel *channel;
 	struct lcs_buffer *iob;
 	int buf_idx;
 
-	channel = (struct lcs_channel *) data;
+	channel = from_work(channel, t, irq_work);
 	LCS_DBF_TEXT_(5, trace, "tlet%s", dev_name(&channel->ccwdev->dev));
 
 	/* Check for processed buffers. */
diff --git a/drivers/s390/net/lcs.h b/drivers/s390/net/lcs.h
index a2699b70b050..66bc02e1d7e5 100644
--- a/drivers/s390/net/lcs.h
+++ b/drivers/s390/net/lcs.h
@@ -290,7 +290,7 @@ struct lcs_channel {
 	struct ccw_device *ccwdev;
 	struct ccw1 ccws[LCS_NUM_BUFFS + 1];
 	wait_queue_head_t wait_q;
-	struct tasklet_struct irq_tasklet;
+	struct work_struct irq_work;
 	struct lcs_buffer iob[LCS_NUM_BUFFS];
 	int io_idx;
 	int buf_idx;
diff --git a/drivers/s390/net/qeth_core_main.c b/drivers/s390/net/qeth_core_main.c
index a0cce6872075..10ea95abc753 100644
--- a/drivers/s390/net/qeth_core_main.c
+++ b/drivers/s390/net/qeth_core_main.c
@@ -2911,7 +2911,7 @@ static int qeth_init_input_buffer(struct qeth_card *card,
 	}
 
 	/*
-	 * since the buffer is accessed only from the input_tasklet
+	 * since the buffer is accessed only from the input_work
 	 * there shouldn't be a need to synchronize; also, since we use
 	 * the QETH_IN_BUF_REQUEUE_THRESHOLD we should never run  out off
 	 * buffers
diff --git a/drivers/s390/scsi/zfcp_qdio.c b/drivers/s390/scsi/zfcp_qdio.c
index 8cbc5e1711af..407590697c66 100644
--- a/drivers/s390/scsi/zfcp_qdio.c
+++ b/drivers/s390/scsi/zfcp_qdio.c
@@ -13,6 +13,7 @@
 #include <linux/lockdep.h>
 #include <linux/slab.h>
 #include <linux/module.h>
+#include <linux/workqueue.h>
 #include "zfcp_ext.h"
 #include "zfcp_qdio.h"
 
@@ -72,9 +73,9 @@ static void zfcp_qdio_int_req(struct ccw_device *cdev, unsigned int qdio_err,
 	zfcp_qdio_handler_error(qdio, "qdireq1", qdio_err);
 }
 
-static void zfcp_qdio_request_tasklet(struct tasklet_struct *tasklet)
+static void zfcp_qdio_request_work(struct work_struct *work)
 {
-	struct zfcp_qdio *qdio = from_tasklet(qdio, tasklet, request_tasklet);
+	struct zfcp_qdio *qdio = from_work(qdio, work, request_work);
 	struct ccw_device *cdev = qdio->adapter->ccw_device;
 	unsigned int start, error;
 	int completed;
@@ -104,7 +105,7 @@ static void zfcp_qdio_request_timer(struct timer_list *timer)
 {
 	struct zfcp_qdio *qdio = from_timer(qdio, timer, request_timer);
 
-	tasklet_schedule(&qdio->request_tasklet);
+	queue_work(system_bh_wq, &qdio->request_work);
 }
 
 static void zfcp_qdio_int_resp(struct ccw_device *cdev, unsigned int qdio_err,
@@ -158,15 +159,15 @@ static void zfcp_qdio_int_resp(struct ccw_device *cdev, unsigned int qdio_err,
 		zfcp_erp_adapter_reopen(qdio->adapter, 0, "qdires2");
 }
 
-static void zfcp_qdio_irq_tasklet(struct tasklet_struct *tasklet)
+static void zfcp_qdio_irq_work(struct work_struct *work)
 {
-	struct zfcp_qdio *qdio = from_tasklet(qdio, tasklet, irq_tasklet);
+	struct zfcp_qdio *qdio = from_work(qdio, work, irq_work);
 	struct ccw_device *cdev = qdio->adapter->ccw_device;
 	unsigned int start, error;
 	int completed;
 
 	if (atomic_read(&qdio->req_q_free) < QDIO_MAX_BUFFERS_PER_Q)
-		tasklet_schedule(&qdio->request_tasklet);
+		queue_work(system_bh_wq, &qdio->request_work);
 
 	/* Check the Response Queue: */
 	completed = qdio_inspect_input_queue(cdev, 0, &start, &error);
@@ -178,14 +179,14 @@ static void zfcp_qdio_irq_tasklet(struct tasklet_struct *tasklet)
 
 	if (qdio_start_irq(cdev))
 		/* More work pending: */
-		tasklet_schedule(&qdio->irq_tasklet);
+		queue_work(system_bh_wq, &qdio->irq_work);
 }
 
 static void zfcp_qdio_poll(struct ccw_device *cdev, unsigned long data)
 {
 	struct zfcp_qdio *qdio = (struct zfcp_qdio *) data;
 
-	tasklet_schedule(&qdio->irq_tasklet);
+	queue_work(system_bh_wq, &qdio->irq_work);
 }
 
 static struct qdio_buffer_element *
@@ -315,7 +316,7 @@ int zfcp_qdio_send(struct zfcp_qdio *qdio, struct zfcp_qdio_req *q_req)
 
 	/*
 	 * This should actually be a spin_lock_bh(stat_lock), to protect against
-	 * Request Queue completion processing in tasklet context.
+	 * Request Queue completion processing in work context.
 	 * But we can't do so (and are safe), as we always get called with IRQs
 	 * disabled by spin_lock_irq[save](req_q_lock).
 	 */
@@ -339,7 +340,7 @@ int zfcp_qdio_send(struct zfcp_qdio *qdio, struct zfcp_qdio_req *q_req)
 	}
 
 	if (atomic_read(&qdio->req_q_free) <= 2 * ZFCP_QDIO_MAX_SBALS_PER_REQ)
-		tasklet_schedule(&qdio->request_tasklet);
+		queue_work(system_bh_wq, &qdio->request_work);
 	else
 		timer_reduce(&qdio->request_timer,
 			     jiffies + msecs_to_jiffies(ZFCP_QDIO_REQUEST_SCAN_MSECS));
@@ -406,8 +407,8 @@ void zfcp_qdio_close(struct zfcp_qdio *qdio)
 
 	wake_up(&qdio->req_q_wq);
 
-	tasklet_disable(&qdio->irq_tasklet);
-	tasklet_disable(&qdio->request_tasklet);
+	disable_work_sync(&qdio->irq_work);
+	disable_work_sync(&qdio->request_work);
 	del_timer_sync(&qdio->request_timer);
 	qdio_stop_irq(adapter->ccw_device);
 	qdio_shutdown(adapter->ccw_device, QDIO_FLAG_CLEANUP_USING_CLEAR);
@@ -511,11 +512,11 @@ int zfcp_qdio_open(struct zfcp_qdio *qdio)
 	atomic_or(ZFCP_STATUS_ADAPTER_QDIOUP, &qdio->adapter->status);
 
 	/* Enable processing for Request Queue completions: */
-	tasklet_enable(&qdio->request_tasklet);
+	enable_and_queue_work(system_bh_wq, &qdio->request_work);
 	/* Enable processing for QDIO interrupts: */
-	tasklet_enable(&qdio->irq_tasklet);
+	enable_and_queue_work(system_bh_wq, &qdio->irq_work);
 	/* This results in a qdio_start_irq(): */
-	tasklet_schedule(&qdio->irq_tasklet);
+	queue_work(system_bh_wq, &qdio->irq_work);
 
 	zfcp_qdio_shost_update(adapter, qdio);
 
@@ -534,8 +535,8 @@ void zfcp_qdio_destroy(struct zfcp_qdio *qdio)
 	if (!qdio)
 		return;
 
-	tasklet_kill(&qdio->irq_tasklet);
-	tasklet_kill(&qdio->request_tasklet);
+	cancel_work_sync(&qdio->irq_work);
+	cancel_work_sync(&qdio->request_work);
 
 	if (qdio->adapter->ccw_device)
 		qdio_free(qdio->adapter->ccw_device);
@@ -563,10 +564,10 @@ int zfcp_qdio_setup(struct zfcp_adapter *adapter)
 	spin_lock_init(&qdio->req_q_lock);
 	spin_lock_init(&qdio->stat_lock);
 	timer_setup(&qdio->request_timer, zfcp_qdio_request_timer, 0);
-	tasklet_setup(&qdio->irq_tasklet, zfcp_qdio_irq_tasklet);
-	tasklet_setup(&qdio->request_tasklet, zfcp_qdio_request_tasklet);
-	tasklet_disable(&qdio->irq_tasklet);
-	tasklet_disable(&qdio->request_tasklet);
+	INIT_WORK(&qdio->irq_work, zfcp_qdio_irq_work);
+	INIT_WORK(&qdio->request_work, zfcp_qdio_request_work);
+	disable_work_sync(&qdio->irq_work);
+	disable_work_sync(&qdio->request_work);
 
 	adapter->qdio = qdio;
 	return 0;
@@ -580,7 +581,7 @@ int zfcp_qdio_setup(struct zfcp_adapter *adapter)
  * wrapper function sets a flag to ensure hardware logging is only
  * triggered once before going through qdio shutdown.
  *
- * The triggers are always run from qdio tasklet context, so no
+ * The triggers are always run from qdio work context, so no
  * additional synchronization is necessary.
  */
 void zfcp_qdio_siosl(struct zfcp_adapter *adapter)
diff --git a/drivers/s390/scsi/zfcp_qdio.h b/drivers/s390/scsi/zfcp_qdio.h
index 8f7d2ae94441..ce92d2378b98 100644
--- a/drivers/s390/scsi/zfcp_qdio.h
+++ b/drivers/s390/scsi/zfcp_qdio.h
@@ -11,6 +11,7 @@
 #define ZFCP_QDIO_H
 
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 #include <asm/qdio.h>
 
 #define ZFCP_QDIO_SBALE_LEN	PAGE_SIZE
@@ -30,8 +31,8 @@
  * @req_q_util: used for accounting
  * @req_q_full: queue full incidents
  * @req_q_wq: used to wait for SBAL availability
- * @irq_tasklet: used for QDIO interrupt processing
- * @request_tasklet: used for Request Queue completion processing
+ * @irq_work: used for QDIO interrupt processing
+ * @request_work: used for Request Queue completion processing
  * @request_timer: used to trigger the Request Queue completion processing
  * @adapter: adapter used in conjunction with this qdio structure
  * @max_sbale_per_sbal: qdio limit per sbal
@@ -48,8 +49,8 @@ struct zfcp_qdio {
 	u64			req_q_util;
 	atomic_t		req_q_full;
 	wait_queue_head_t	req_q_wq;
-	struct tasklet_struct	irq_tasklet;
-	struct tasklet_struct	request_tasklet;
+	struct work_struct 	irq_work;
+	struct work_struct 	request_work;
 	struct timer_list	request_timer;
 	struct zfcp_adapter	*adapter;
 	u16			max_sbale_per_sbal;
-- 
2.17.1

