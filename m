Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F0AC88F0BC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Mar 2024 22:17:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=hZ9tbK6a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4fdn0BlCz3w4Y
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 08:17:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=hZ9tbK6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4Wh84rVMz3vXd
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 03:04:24 +1100 (AEDT)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id EA6502087EAD;
	Wed, 27 Mar 2024 09:03:21 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com EA6502087EAD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1711555402;
	bh=gG4HkPGUSv7UfrkIT/fLFeBn/l/I1IKATXvhPYPLyTc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hZ9tbK6alrLBbs0gi/RA/rTTHk4Szr/ALK9qb/ljV5Z39ltd2AcQcwhzALpCC1wKd
	 GIeCnfcSDRZCYwM84p9o8SFEII+jFkZGxJDmCb1a1V3QFisDxrwsPRClaYIO9y61bo
	 AS1FoX6+/lM0tmj1WVEb896g3y43UOh3+1q2HAqg=
From: Allen Pais <apais@linux.microsoft.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 5/9] mailbox: Convert from tasklet to BH workqueue
Date: Wed, 27 Mar 2024 16:03:10 +0000
Message-Id: <20240327160314.9982-6-apais@linux.microsoft.com>
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
 drivers/mailbox/bcm-pdc-mailbox.c | 21 +++++++++++----------
 drivers/mailbox/imx-mailbox.c     | 16 ++++++++--------
 2 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/drivers/mailbox/bcm-pdc-mailbox.c b/drivers/mailbox/bcm-pdc-mailbox.c
index 1768d3d5aaa0..242e7504a628 100644
--- a/drivers/mailbox/bcm-pdc-mailbox.c
+++ b/drivers/mailbox/bcm-pdc-mailbox.c
@@ -43,6 +43,7 @@
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
 #include <linux/dmapool.h>
+#include <linux/workqueue.h>
 
 #define PDC_SUCCESS  0
 
@@ -293,8 +294,8 @@ struct pdc_state {
 
 	unsigned int pdc_irq;
 
-	/* tasklet for deferred processing after DMA rx interrupt */
-	struct tasklet_struct rx_tasklet;
+	/* work for deferred processing after DMA rx interrupt */
+	struct work_struct rx_work;
 
 	/* Number of bytes of receive status prior to each rx frame */
 	u32 rx_status_len;
@@ -952,18 +953,18 @@ static irqreturn_t pdc_irq_handler(int irq, void *data)
 	iowrite32(intstatus, pdcs->pdc_reg_vbase + PDC_INTSTATUS_OFFSET);
 
 	/* Wakeup IRQ thread */
-	tasklet_schedule(&pdcs->rx_tasklet);
+	queue_work(system_bh_wq, &pdcs->rx_work);
 	return IRQ_HANDLED;
 }
 
 /**
- * pdc_tasklet_cb() - Tasklet callback that runs the deferred processing after
+ * pdc_work_cb() - Work callback that runs the deferred processing after
  * a DMA receive interrupt. Reenables the receive interrupt.
  * @t: Pointer to the Altera sSGDMA channel structure
  */
-static void pdc_tasklet_cb(struct tasklet_struct *t)
+static void pdc_work_cb(struct work_struct *t)
 {
-	struct pdc_state *pdcs = from_tasklet(pdcs, t, rx_tasklet);
+	struct pdc_state *pdcs = from_work(pdcs, t, rx_work);
 
 	pdc_receive(pdcs);
 
@@ -1577,8 +1578,8 @@ static int pdc_probe(struct platform_device *pdev)
 
 	pdc_hw_init(pdcs);
 
-	/* Init tasklet for deferred DMA rx processing */
-	tasklet_setup(&pdcs->rx_tasklet, pdc_tasklet_cb);
+	/* Init work for deferred DMA rx processing */
+	INIT_WORK(&pdcs->rx_work, pdc_work_cb);
 
 	err = pdc_interrupts_init(pdcs);
 	if (err)
@@ -1595,7 +1596,7 @@ static int pdc_probe(struct platform_device *pdev)
 	return PDC_SUCCESS;
 
 cleanup_buf_pool:
-	tasklet_kill(&pdcs->rx_tasklet);
+	cancel_work_sync(&pdcs->rx_work);
 	dma_pool_destroy(pdcs->rx_buf_pool);
 
 cleanup_ring_pool:
@@ -1611,7 +1612,7 @@ static void pdc_remove(struct platform_device *pdev)
 
 	pdc_free_debugfs();
 
-	tasklet_kill(&pdcs->rx_tasklet);
+	cancel_work_sync(&pdcs->rx_work);
 
 	pdc_hw_disable(pdcs);
 
diff --git a/drivers/mailbox/imx-mailbox.c b/drivers/mailbox/imx-mailbox.c
index 5c1d09cad761..933727f89431 100644
--- a/drivers/mailbox/imx-mailbox.c
+++ b/drivers/mailbox/imx-mailbox.c
@@ -21,6 +21,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/suspend.h>
 #include <linux/slab.h>
+#include <linux/workqueue.h>
 
 #include "mailbox.h"
 
@@ -80,7 +81,7 @@ struct imx_mu_con_priv {
 	char			irq_desc[IMX_MU_CHAN_NAME_SIZE];
 	enum imx_mu_chan_type	type;
 	struct mbox_chan	*chan;
-	struct tasklet_struct	txdb_tasklet;
+	struct work_struct 	txdb_work;
 };
 
 struct imx_mu_priv {
@@ -232,7 +233,7 @@ static int imx_mu_generic_tx(struct imx_mu_priv *priv,
 		break;
 	case IMX_MU_TYPE_TXDB:
 		imx_mu_xcr_rmw(priv, IMX_MU_GCR, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx), 0);
-		tasklet_schedule(&cp->txdb_tasklet);
+		queue_work(system_bh_wq, &cp->txdb_work);
 		break;
 	case IMX_MU_TYPE_TXDB_V2:
 		imx_mu_xcr_rmw(priv, IMX_MU_GCR, IMX_MU_xCR_GIRn(priv->dcfg->type, cp->idx), 0);
@@ -420,7 +421,7 @@ static int imx_mu_seco_tx(struct imx_mu_priv *priv, struct imx_mu_con_priv *cp,
 		}
 
 		/* Simulate hack for mbox framework */
-		tasklet_schedule(&cp->txdb_tasklet);
+		queue_work(system_bh_wq, &cp->txdb_work);
 
 		break;
 	default:
@@ -484,9 +485,9 @@ static int imx_mu_seco_rxdb(struct imx_mu_priv *priv, struct imx_mu_con_priv *cp
 	return err;
 }
 
-static void imx_mu_txdb_tasklet(unsigned long data)
+static void imx_mu_txdb_work(struct work_struct *t)
 {
-	struct imx_mu_con_priv *cp = (struct imx_mu_con_priv *)data;
+	struct imx_mu_con_priv *cp = from_work(cp, t, txdb_work);
 
 	mbox_chan_txdone(cp->chan, 0);
 }
@@ -570,8 +571,7 @@ static int imx_mu_startup(struct mbox_chan *chan)
 
 	if (cp->type == IMX_MU_TYPE_TXDB) {
 		/* Tx doorbell don't have ACK support */
-		tasklet_init(&cp->txdb_tasklet, imx_mu_txdb_tasklet,
-			     (unsigned long)cp);
+		INIT_WORK(&cp->txdb_work, imx_mu_txdb_work);
 		return 0;
 	}
 
@@ -615,7 +615,7 @@ static void imx_mu_shutdown(struct mbox_chan *chan)
 	}
 
 	if (cp->type == IMX_MU_TYPE_TXDB) {
-		tasklet_kill(&cp->txdb_tasklet);
+		cancel_work_sync(&cp->txdb_work);
 		pm_runtime_put_sync(priv->dev);
 		return;
 	}
-- 
2.17.1

