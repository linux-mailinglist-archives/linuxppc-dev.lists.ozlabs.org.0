Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C8278BEC31
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2024 21:03:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=EdNk8jSv;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYnjR6LYTz3cXw
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 May 2024 05:03:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.a=rsa-sha256 header.s=default header.b=EdNk8jSv;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.microsoft.com (client-ip=13.77.154.182; helo=linux.microsoft.com; envelope-from=apais@linux.microsoft.com; receiver=lists.ozlabs.org)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VYngx3X4Bz3cNV
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 May 2024 05:01:49 +1000 (AEST)
Received: from apais-vm1.0synte4vioeebbvidf5q0vz2ua.xx.internal.cloudapp.net (unknown [52.183.86.224])
	by linux.microsoft.com (Postfix) with ESMTPSA id E1D0320B2C84;
	Tue,  7 May 2024 12:01:16 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com E1D0320B2C84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1715108477;
	bh=mX2YAniCW2eYUsUQX5ZcYr2ONK42mr/yq6WM+p/B+C0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EdNk8jSvZ0osHttD1tqTz37AM5imHZTgIwMHytXyDMWJzMJjqzHxFQRjxo6PtDSWg
	 ekdrRq4DpliAQGinMIj/0FmMShpTaDlW4ALDZrhD2HE39O3wh0LQlrQdgYpsIPEUyN
	 l2hmV7Fv12LcssvupQsH4+XAIqMWHDSbAd+5xWE0=
From: Allen Pais <apais@linux.microsoft.com>
To: netdev@vger.kernel.org
Subject: [PATCH 1/1] [RFC] ethernet: Convert from tasklet to BH workqueue
Date: Tue,  7 May 2024 19:01:11 +0000
Message-Id: <20240507190111.16710-2-apais@linux.microsoft.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240507190111.16710-1-apais@linux.microsoft.com>
References: <20240507190111.16710-1-apais@linux.microsoft.com>
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
Cc: marcin.s.wojtas@gmail.com, kda@linux-powerpc.org, edumazet@google.com, linux-acenic@sunsite.dk, louis.peens@corigine.com, angelogioacchino.delregno@collabora.com, borisp@nvidia.com, cooldavid@cooldavid.org, linux@armlinux.org.uk, aneesh.kumar@kernel.org, tlfalcon@linux.ibm.com, naveen.n.rao@linux.ibm.com, kuba@kernel.org, pabeni@redhat.com, lorenzo@kernel.org, Mark-MC.Lee@mediatek.com, jes@trained-monkey.org, nnac123@linux.ibm.com, richardcochran@gmail.com, sean.wang@mediatek.com, npiggin@gmail.com, linux-net-drivers@amd.com, cai.huoqing@linux.dev, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, mlindner@marvell.com, bryan.whitehead@microchip.com, oss-drivers@corigine.com, dougmill@linux.ibm.com, linux-kernel@vger.kernel.org, UNGLinuxDriver@microchip.com, stephen@networkplumber.org, linux-rdma@vger.kernel.org, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net, nbd@nbd.name
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The only generic interface to execute asynchronously in the BH context is
tasklet; however, it's marked deprecated and has some design flaws. To
replace tasklets, BH workqueue support was recently added. A BH workqueue
behaves similarly to regular workqueues except that the queued work items
are executed in the BH context.

This patch converts drivers/ethernet/* from tasklet to BH workqueue.

Based on the work done by Tejun Heo <tj@kernel.org>
Branch: https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git disable_work-v1

Signed-off-by: Allen Pais <allen.lkml@gmail.com>
---
 drivers/infiniband/hw/mlx4/cq.c               |  2 +-
 drivers/infiniband/hw/mlx5/cq.c               |  2 +-
 drivers/net/ethernet/alteon/acenic.c          | 26 +++----
 drivers/net/ethernet/alteon/acenic.h          |  7 +-
 drivers/net/ethernet/amd/xgbe/xgbe-drv.c      | 30 ++++----
 drivers/net/ethernet/amd/xgbe/xgbe-i2c.c      | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-mdio.c     | 16 ++---
 drivers/net/ethernet/amd/xgbe/xgbe-pci.c      |  4 +-
 drivers/net/ethernet/amd/xgbe/xgbe.h          | 11 +--
 drivers/net/ethernet/broadcom/cnic.c          | 19 ++---
 drivers/net/ethernet/broadcom/cnic.h          |  2 +-
 drivers/net/ethernet/cadence/macb.h           |  3 +-
 drivers/net/ethernet/cadence/macb_main.c      | 10 +--
 .../net/ethernet/cavium/liquidio/lio_core.c   |  4 +-
 .../net/ethernet/cavium/liquidio/lio_main.c   | 25 +++----
 .../ethernet/cavium/liquidio/lio_vf_main.c    | 10 +--
 .../ethernet/cavium/liquidio/octeon_droq.c    |  4 +-
 .../ethernet/cavium/liquidio/octeon_main.h    |  5 +-
 .../net/ethernet/cavium/octeon/octeon_mgmt.c  | 12 ++--
 drivers/net/ethernet/cavium/thunder/nic.h     |  5 +-
 .../net/ethernet/cavium/thunder/nicvf_main.c  | 24 +++----
 .../ethernet/cavium/thunder/nicvf_queues.c    |  5 +-
 .../ethernet/cavium/thunder/nicvf_queues.h    |  3 +-
 drivers/net/ethernet/chelsio/cxgb/sge.c       | 19 ++---
 drivers/net/ethernet/chelsio/cxgb4/cxgb4.h    |  9 +--
 .../net/ethernet/chelsio/cxgb4/cxgb4_main.c   |  2 +-
 .../ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c  |  4 +-
 .../net/ethernet/chelsio/cxgb4/cxgb4_uld.c    |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c      | 41 +++++------
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c    |  6 +-
 drivers/net/ethernet/dlink/sundance.c         | 41 +++++------
 .../net/ethernet/huawei/hinic/hinic_hw_cmdq.c |  2 +-
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.c  | 17 +++--
 .../net/ethernet/huawei/hinic/hinic_hw_eqs.h  |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea.h          |  3 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c     | 14 ++--
 drivers/net/ethernet/ibm/ibmvnic.c            | 24 +++----
 drivers/net/ethernet/ibm/ibmvnic.h            |  2 +-
 drivers/net/ethernet/jme.c                    | 72 +++++++++----------
 drivers/net/ethernet/jme.h                    |  9 +--
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  2 +-
 drivers/net/ethernet/marvell/skge.c           | 12 ++--
 drivers/net/ethernet/marvell/skge.h           |  3 +-
 drivers/net/ethernet/mediatek/mtk_wed_wo.c    | 12 ++--
 drivers/net/ethernet/mediatek/mtk_wed_wo.h    |  3 +-
 drivers/net/ethernet/mellanox/mlx4/cq.c       | 42 +++++------
 drivers/net/ethernet/mellanox/mlx4/eq.c       | 10 +--
 drivers/net/ethernet/mellanox/mlx4/mlx4.h     | 11 +--
 drivers/net/ethernet/mellanox/mlx5/core/cq.c  | 38 +++++-----
 drivers/net/ethernet/mellanox/mlx5/core/eq.c  | 12 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.c   | 15 ++--
 .../ethernet/mellanox/mlx5/core/fpga/conn.h   |  3 +-
 .../net/ethernet/mellanox/mlx5/core/lib/eq.h  | 11 +--
 drivers/net/ethernet/mellanox/mlxsw/pci.c     | 29 ++++----
 drivers/net/ethernet/micrel/ks8842.c          | 29 ++++----
 drivers/net/ethernet/micrel/ksz884x.c         | 37 +++++-----
 drivers/net/ethernet/microchip/lan743x_ptp.c  |  2 +-
 drivers/net/ethernet/natsemi/ns83820.c        | 10 +--
 drivers/net/ethernet/netronome/nfp/nfd3/dp.c  |  7 +-
 .../net/ethernet/netronome/nfp/nfd3/nfd3.h    |  2 +-
 drivers/net/ethernet/netronome/nfp/nfdk/dp.c  |  6 +-
 .../net/ethernet/netronome/nfp/nfdk/nfdk.h    |  3 +-
 drivers/net/ethernet/netronome/nfp/nfp_net.h  |  4 +-
 .../ethernet/netronome/nfp/nfp_net_common.c   | 12 ++--
 .../net/ethernet/netronome/nfp/nfp_net_dp.h   |  4 +-
 drivers/net/ethernet/ni/nixge.c               | 19 ++---
 drivers/net/ethernet/qlogic/qed/qed.h         |  2 +-
 drivers/net/ethernet/qlogic/qed/qed_int.c     |  6 +-
 drivers/net/ethernet/qlogic/qed/qed_int.h     |  4 +-
 drivers/net/ethernet/qlogic/qed/qed_main.c    | 20 +++---
 drivers/net/ethernet/sfc/falcon/farch.c       |  4 +-
 drivers/net/ethernet/sfc/falcon/net_driver.h  |  2 +-
 drivers/net/ethernet/sfc/falcon/selftest.c    |  2 +-
 drivers/net/ethernet/sfc/net_driver.h         |  2 +-
 drivers/net/ethernet/sfc/selftest.c           |  2 +-
 drivers/net/ethernet/sfc/siena/farch.c        |  4 +-
 drivers/net/ethernet/sfc/siena/net_driver.h   |  2 +-
 drivers/net/ethernet/sfc/siena/selftest.c     |  2 +-
 drivers/net/ethernet/silan/sc92031.c          | 47 ++++++------
 drivers/net/ethernet/smsc/smc91x.c            | 16 ++---
 drivers/net/ethernet/smsc/smc91x.h            |  3 +-
 include/linux/mlx4/device.h                   |  2 +-
 include/linux/mlx5/cq.h                       |  2 +-
 83 files changed, 501 insertions(+), 473 deletions(-)

diff --git a/drivers/infiniband/hw/mlx4/cq.c b/drivers/infiniband/hw/mlx4/cq.c
index 4cd738aae53c..75ae9412c21d 100644
--- a/drivers/infiniband/hw/mlx4/cq.c
+++ b/drivers/infiniband/hw/mlx4/cq.c
@@ -253,7 +253,7 @@ int mlx4_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 		goto err_dbmap;
 
 	if (udata)
-		cq->mcq.tasklet_ctx.comp = mlx4_ib_cq_comp;
+		cq->mcq.work_ctx.comp = mlx4_ib_cq_comp;
 	else
 		cq->mcq.comp = mlx4_ib_cq_comp;
 	cq->mcq.event = mlx4_ib_cq_event;
diff --git a/drivers/infiniband/hw/mlx5/cq.c b/drivers/infiniband/hw/mlx5/cq.c
index 9773d2a3d97f..d38a160928c0 100644
--- a/drivers/infiniband/hw/mlx5/cq.c
+++ b/drivers/infiniband/hw/mlx5/cq.c
@@ -1017,7 +1017,7 @@ int mlx5_ib_create_cq(struct ib_cq *ibcq, const struct ib_cq_init_attr *attr,
 
 	mlx5_ib_dbg(dev, "cqn 0x%x\n", cq->mcq.cqn);
 	if (udata)
-		cq->mcq.tasklet_ctx.comp = mlx5_ib_cq_comp;
+		cq->mcq.work_ctx.comp = mlx5_ib_cq_comp;
 	else
 		cq->mcq.comp  = mlx5_ib_cq_comp;
 	cq->mcq.event = mlx5_ib_cq_event;
diff --git a/drivers/net/ethernet/alteon/acenic.c b/drivers/net/ethernet/alteon/acenic.c
index eafef84fe3be..9d0394ceeafa 100644
--- a/drivers/net/ethernet/alteon/acenic.c
+++ b/drivers/net/ethernet/alteon/acenic.c
@@ -1560,9 +1560,9 @@ static void ace_watchdog(struct net_device *data, unsigned int txqueue)
 }
 
 
-static void ace_tasklet(struct tasklet_struct *t)
+static void ace_work(struct work_struct *t)
 {
-	struct ace_private *ap = from_tasklet(ap, t, ace_tasklet);
+	struct ace_private *ap = from_work(ap, t, ace_work);
 	struct net_device *dev = ap->ndev;
 	int cur_size;
 
@@ -1595,7 +1595,7 @@ static void ace_tasklet(struct tasklet_struct *t)
 #endif
 		ace_load_jumbo_rx_ring(dev, RX_JUMBO_SIZE - cur_size);
 	}
-	ap->tasklet_pending = 0;
+	ap->work_pending = 0;
 }
 
 
@@ -1617,7 +1617,7 @@ static void ace_dump_trace(struct ace_private *ap)
  *
  * Loading rings is safe without holding the spin lock since this is
  * done only before the device is enabled, thus no interrupts are
- * generated and by the interrupt handler/tasklet handler.
+ * generated and by the interrupt handler/work handler.
  */
 static void ace_load_std_rx_ring(struct net_device *dev, int nr_bufs)
 {
@@ -2160,7 +2160,7 @@ static irqreturn_t ace_interrupt(int irq, void *dev_id)
 	 */
 	if (netif_running(dev)) {
 		int cur_size;
-		int run_tasklet = 0;
+		int run_work = 0;
 
 		cur_size = atomic_read(&ap->cur_rx_bufs);
 		if (cur_size < RX_LOW_STD_THRES) {
@@ -2172,7 +2172,7 @@ static irqreturn_t ace_interrupt(int irq, void *dev_id)
 				ace_load_std_rx_ring(dev,
 						     RX_RING_SIZE - cur_size);
 			} else
-				run_tasklet = 1;
+				run_work = 1;
 		}
 
 		if (!ACE_IS_TIGON_I(ap)) {
@@ -2188,7 +2188,7 @@ static irqreturn_t ace_interrupt(int irq, void *dev_id)
 					ace_load_mini_rx_ring(dev,
 							      RX_MINI_SIZE - cur_size);
 				} else
-					run_tasklet = 1;
+					run_work = 1;
 			}
 		}
 
@@ -2205,12 +2205,12 @@ static irqreturn_t ace_interrupt(int irq, void *dev_id)
 					ace_load_jumbo_rx_ring(dev,
 							       RX_JUMBO_SIZE - cur_size);
 				} else
-					run_tasklet = 1;
+					run_work = 1;
 			}
 		}
-		if (run_tasklet && !ap->tasklet_pending) {
-			ap->tasklet_pending = 1;
-			tasklet_schedule(&ap->ace_tasklet);
+		if (run_work && !ap->work_pending) {
+			ap->work_pending = 1;
+			queue_work(system_bh_wq, &ap->ace_work);
 		}
 	}
 
@@ -2267,7 +2267,7 @@ static int ace_open(struct net_device *dev)
 	/*
 	 * Setup the bottom half rx ring refill handler
 	 */
-	tasklet_setup(&ap->ace_tasklet, ace_tasklet);
+	INIT_WORK(&ap->ace_work, ace_work);
 	return 0;
 }
 
@@ -2301,7 +2301,7 @@ static int ace_close(struct net_device *dev)
 	cmd.idx = 0;
 	ace_issue_cmd(regs, &cmd);
 
-	tasklet_kill(&ap->ace_tasklet);
+	cancel_work_sync(&ap->ace_work);
 
 	/*
 	 * Make sure one CPU is not processing packets while
diff --git a/drivers/net/ethernet/alteon/acenic.h b/drivers/net/ethernet/alteon/acenic.h
index ca5ce0cbbad1..2ea5cd8005aa 100644
--- a/drivers/net/ethernet/alteon/acenic.h
+++ b/drivers/net/ethernet/alteon/acenic.h
@@ -2,6 +2,7 @@
 #ifndef _ACENIC_H_
 #define _ACENIC_H_
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 
 
 /*
@@ -667,8 +668,8 @@ struct ace_private
 	struct rx_desc		*rx_mini_ring;
 	struct rx_desc		*rx_return_ring;
 
-	int			tasklet_pending, jumbo;
-	struct tasklet_struct	ace_tasklet;
+	int			work_pending, jumbo;
+	struct work_struct	ace_work;
 
 	struct event		*evt_ring;
 
@@ -776,7 +777,7 @@ static int ace_open(struct net_device *dev);
 static netdev_tx_t ace_start_xmit(struct sk_buff *skb,
 				  struct net_device *dev);
 static int ace_close(struct net_device *dev);
-static void ace_tasklet(struct tasklet_struct *t);
+static void ace_work(struct work_struct *t);
 static void ace_dump_trace(struct ace_private *ap);
 static void ace_set_multicast_list(struct net_device *dev);
 static int ace_change_mtu(struct net_device *dev, int new_mtu);
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
index 6b73648b3779..424dafaffc87 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-drv.c
@@ -403,9 +403,9 @@ static bool xgbe_ecc_ded(struct xgbe_prv_data *pdata, unsigned long *period,
 	return false;
 }
 
-static void xgbe_ecc_isr_task(struct tasklet_struct *t)
+static void xgbe_ecc_isr_task(struct work_struct *t)
 {
-	struct xgbe_prv_data *pdata = from_tasklet(pdata, t, tasklet_ecc);
+	struct xgbe_prv_data *pdata = from_work(pdata, t, work_ecc);
 	unsigned int ecc_isr;
 	bool stop = false;
 
@@ -465,17 +465,17 @@ static irqreturn_t xgbe_ecc_isr(int irq, void *data)
 {
 	struct xgbe_prv_data *pdata = data;
 
-	if (pdata->isr_as_tasklet)
-		tasklet_schedule(&pdata->tasklet_ecc);
+	if (pdata->isr_as_work)
+		queue_work(system_bh_wq, &pdata->work_ecc);
 	else
-		xgbe_ecc_isr_task(&pdata->tasklet_ecc);
+		xgbe_ecc_isr_task(&pdata->work_ecc);
 
 	return IRQ_HANDLED;
 }
 
-static void xgbe_isr_task(struct tasklet_struct *t)
+static void xgbe_isr_task(struct work_struct *t)
 {
-	struct xgbe_prv_data *pdata = from_tasklet(pdata, t, tasklet_dev);
+	struct xgbe_prv_data *pdata = from_work(pdata, t, work_dev);
 	struct xgbe_hw_if *hw_if = &pdata->hw_if;
 	struct xgbe_channel *channel;
 	unsigned int dma_isr, dma_ch_isr;
@@ -582,7 +582,7 @@ static void xgbe_isr_task(struct tasklet_struct *t)
 
 	/* If there is not a separate ECC irq, handle it here */
 	if (pdata->vdata->ecc_support && (pdata->dev_irq == pdata->ecc_irq))
-		xgbe_ecc_isr_task(&pdata->tasklet_ecc);
+		xgbe_ecc_isr_task(&pdata->work_ecc);
 
 	/* If there is not a separate I2C irq, handle it here */
 	if (pdata->vdata->i2c_support && (pdata->dev_irq == pdata->i2c_irq))
@@ -604,10 +604,10 @@ static irqreturn_t xgbe_isr(int irq, void *data)
 {
 	struct xgbe_prv_data *pdata = data;
 
-	if (pdata->isr_as_tasklet)
-		tasklet_schedule(&pdata->tasklet_dev);
+	if (pdata->isr_as_work)
+		queue_work(system_bh_wq, &pdata->work_dev);
 	else
-		xgbe_isr_task(&pdata->tasklet_dev);
+		xgbe_isr_task(&pdata->work_dev);
 
 	return IRQ_HANDLED;
 }
@@ -1007,8 +1007,8 @@ static int xgbe_request_irqs(struct xgbe_prv_data *pdata)
 	unsigned int i;
 	int ret;
 
-	tasklet_setup(&pdata->tasklet_dev, xgbe_isr_task);
-	tasklet_setup(&pdata->tasklet_ecc, xgbe_ecc_isr_task);
+	INIT_WORK(&pdata->work_dev, xgbe_isr_task);
+	INIT_WORK(&pdata->work_ecc, xgbe_ecc_isr_task);
 
 	ret = devm_request_irq(pdata->dev, pdata->dev_irq, xgbe_isr, 0,
 			       netdev_name(netdev), pdata);
@@ -1078,8 +1078,8 @@ static void xgbe_free_irqs(struct xgbe_prv_data *pdata)
 
 	devm_free_irq(pdata->dev, pdata->dev_irq, pdata);
 
-	tasklet_kill(&pdata->tasklet_dev);
-	tasklet_kill(&pdata->tasklet_ecc);
+	cancel_work_sync(&pdata->work_dev);
+	cancel_work_sync(&pdata->work_ecc);
 
 	if (pdata->vdata->ecc_support && (pdata->dev_irq != pdata->ecc_irq))
 		devm_free_irq(pdata->dev, pdata->ecc_irq, pdata);
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-i2c.c b/drivers/net/ethernet/amd/xgbe/xgbe-i2c.c
index a9ccc4258ee5..8e1ec81a632e 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-i2c.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-i2c.c
@@ -274,9 +274,9 @@ static void xgbe_i2c_clear_isr_interrupts(struct xgbe_prv_data *pdata,
 		XI2C_IOREAD(pdata, IC_CLR_STOP_DET);
 }
 
-static void xgbe_i2c_isr_task(struct tasklet_struct *t)
+static void xgbe_i2c_isr_task(struct work_struct *t)
 {
-	struct xgbe_prv_data *pdata = from_tasklet(pdata, t, tasklet_i2c);
+	struct xgbe_prv_data *pdata = from_work(pdata, t, work_i2c);
 	struct xgbe_i2c_op_state *state = &pdata->i2c.op_state;
 	unsigned int isr;
 
@@ -321,10 +321,10 @@ static irqreturn_t xgbe_i2c_isr(int irq, void *data)
 {
 	struct xgbe_prv_data *pdata = (struct xgbe_prv_data *)data;
 
-	if (pdata->isr_as_tasklet)
-		tasklet_schedule(&pdata->tasklet_i2c);
+	if (pdata->isr_as_work)
+		queue_work(system_bh_wq, &pdata->work_i2c);
 	else
-		xgbe_i2c_isr_task(&pdata->tasklet_i2c);
+		xgbe_i2c_isr_task(&pdata->work_i2c);
 
 	return IRQ_HANDLED;
 }
@@ -369,7 +369,7 @@ static void xgbe_i2c_set_target(struct xgbe_prv_data *pdata, unsigned int addr)
 
 static irqreturn_t xgbe_i2c_combined_isr(struct xgbe_prv_data *pdata)
 {
-	xgbe_i2c_isr_task(&pdata->tasklet_i2c);
+	xgbe_i2c_isr_task(&pdata->work_i2c);
 
 	return IRQ_HANDLED;
 }
@@ -449,7 +449,7 @@ static void xgbe_i2c_stop(struct xgbe_prv_data *pdata)
 
 	if (pdata->dev_irq != pdata->i2c_irq) {
 		devm_free_irq(pdata->dev, pdata->i2c_irq, pdata);
-		tasklet_kill(&pdata->tasklet_i2c);
+		cancel_work_sync(&pdata->work_i2c);
 	}
 }
 
@@ -464,7 +464,7 @@ static int xgbe_i2c_start(struct xgbe_prv_data *pdata)
 
 	/* If we have a separate I2C irq, enable it */
 	if (pdata->dev_irq != pdata->i2c_irq) {
-		tasklet_setup(&pdata->tasklet_i2c, xgbe_i2c_isr_task);
+		INIT_WORK(&pdata->work_i2c, xgbe_i2c_isr_task);
 
 		ret = devm_request_irq(pdata->dev, pdata->i2c_irq,
 				       xgbe_i2c_isr, 0, pdata->i2c_name,
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c b/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
index 4a2dc705b528..8df27c6262bf 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-mdio.c
@@ -703,9 +703,9 @@ static void xgbe_an73_isr(struct xgbe_prv_data *pdata)
 	}
 }
 
-static void xgbe_an_isr_task(struct tasklet_struct *t)
+static void xgbe_an_isr_task(struct work_struct *t)
 {
-	struct xgbe_prv_data *pdata = from_tasklet(pdata, t, tasklet_an);
+	struct xgbe_prv_data *pdata = from_work(pdata, t, work_an);
 
 	netif_dbg(pdata, intr, pdata->netdev, "AN interrupt received\n");
 
@@ -727,17 +727,17 @@ static irqreturn_t xgbe_an_isr(int irq, void *data)
 {
 	struct xgbe_prv_data *pdata = (struct xgbe_prv_data *)data;
 
-	if (pdata->isr_as_tasklet)
-		tasklet_schedule(&pdata->tasklet_an);
+	if (pdata->isr_as_work)
+		queue_work(system_bh_wq, &pdata->work_an);
 	else
-		xgbe_an_isr_task(&pdata->tasklet_an);
+		xgbe_an_isr_task(&pdata->work_an);
 
 	return IRQ_HANDLED;
 }
 
 static irqreturn_t xgbe_an_combined_isr(struct xgbe_prv_data *pdata)
 {
-	xgbe_an_isr_task(&pdata->tasklet_an);
+	xgbe_an_isr_task(&pdata->work_an);
 
 	return IRQ_HANDLED;
 }
@@ -1454,7 +1454,7 @@ static void xgbe_phy_stop(struct xgbe_prv_data *pdata)
 
 	if (pdata->dev_irq != pdata->an_irq) {
 		devm_free_irq(pdata->dev, pdata->an_irq, pdata);
-		tasklet_kill(&pdata->tasklet_an);
+		cancel_work_sync(&pdata->work_an);
 	}
 
 	pdata->phy_if.phy_impl.stop(pdata);
@@ -1477,7 +1477,7 @@ static int xgbe_phy_start(struct xgbe_prv_data *pdata)
 
 	/* If we have a separate AN irq, enable it */
 	if (pdata->dev_irq != pdata->an_irq) {
-		tasklet_setup(&pdata->tasklet_an, xgbe_an_isr_task);
+		INIT_WORK(&pdata->work_an, xgbe_an_isr_task);
 
 		ret = devm_request_irq(pdata->dev, pdata->an_irq,
 				       xgbe_an_isr, 0, pdata->an_name,
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
index f409d7bd1f1e..712c1f04925a 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
+++ b/drivers/net/ethernet/amd/xgbe/xgbe-pci.c
@@ -139,7 +139,7 @@ static int xgbe_config_multi_msi(struct xgbe_prv_data *pdata)
 		return ret;
 	}
 
-	pdata->isr_as_tasklet = 1;
+	pdata->isr_as_work = 1;
 	pdata->irq_count = ret;
 
 	pdata->dev_irq = pci_irq_vector(pdata->pcidev, 0);
@@ -176,7 +176,7 @@ static int xgbe_config_irqs(struct xgbe_prv_data *pdata)
 		return ret;
 	}
 
-	pdata->isr_as_tasklet = pdata->pcidev->msi_enabled ? 1 : 0;
+	pdata->isr_as_work = pdata->pcidev->msi_enabled ? 1 : 0;
 	pdata->irq_count = 1;
 	pdata->channel_irq_count = 1;
 
diff --git a/drivers/net/ethernet/amd/xgbe/xgbe.h b/drivers/net/ethernet/amd/xgbe/xgbe.h
index f01a1e566da6..b37231e637f7 100644
--- a/drivers/net/ethernet/amd/xgbe/xgbe.h
+++ b/drivers/net/ethernet/amd/xgbe/xgbe.h
@@ -133,6 +133,7 @@
 #include <linux/dcache.h>
 #include <linux/ethtool.h>
 #include <linux/list.h>
+#include <linux/workqueue.h>
 
 #define XGBE_DRV_NAME		"amd-xgbe"
 #define XGBE_DRV_DESC		"AMD 10 Gigabit Ethernet Driver"
@@ -1298,11 +1299,11 @@ struct xgbe_prv_data {
 
 	unsigned int lpm_ctrl;		/* CTRL1 for resume */
 
-	unsigned int isr_as_tasklet;
-	struct tasklet_struct tasklet_dev;
-	struct tasklet_struct tasklet_ecc;
-	struct tasklet_struct tasklet_i2c;
-	struct tasklet_struct tasklet_an;
+	unsigned int isr_as_work;
+	struct work_struct work_dev;
+	struct work_struct work_ecc;
+	struct work_struct work_i2c;
+	struct work_struct work_an;
 
 	struct dentry *xgbe_debugfs;
 
diff --git a/drivers/net/ethernet/broadcom/cnic.c b/drivers/net/ethernet/broadcom/cnic.c
index 3d63177e7e52..8664c873da4d 100644
--- a/drivers/net/ethernet/broadcom/cnic.c
+++ b/drivers/net/ethernet/broadcom/cnic.c
@@ -31,6 +31,7 @@
 #include <linux/if_vlan.h>
 #include <linux/prefetch.h>
 #include <linux/random.h>
+#include <linux/workqueue.h>
 #if IS_ENABLED(CONFIG_VLAN_8021Q)
 #define BCM_VLAN 1
 #endif
@@ -3015,9 +3016,9 @@ static int cnic_service_bnx2(void *data, void *status_blk)
 	return cnic_service_bnx2_queues(dev);
 }
 
-static void cnic_service_bnx2_msix(struct tasklet_struct *t)
+static void cnic_service_bnx2_msix(struct work_struct *t)
 {
-	struct cnic_local *cp = from_tasklet(cp, t, cnic_irq_task);
+	struct cnic_local *cp = from_work(cp, t, cnic_irq_task);
 	struct cnic_dev *dev = cp->dev;
 
 	cp->last_status_idx = cnic_service_bnx2_queues(dev);
@@ -3036,7 +3037,7 @@ static void cnic_doirq(struct cnic_dev *dev)
 		prefetch(cp->status_blk.gen);
 		prefetch(&cp->kcq1.kcq[KCQ_PG(prod)][KCQ_IDX(prod)]);
 
-		tasklet_schedule(&cp->cnic_irq_task);
+		queue_work(system_bh_wq, &cp->cnic_irq_task);
 	}
 }
 
@@ -3140,9 +3141,9 @@ static u32 cnic_service_bnx2x_kcq(struct cnic_dev *dev, struct kcq_info *info)
 	return last_status;
 }
 
-static void cnic_service_bnx2x_bh(struct tasklet_struct *t)
+static void cnic_service_bnx2x_bh(struct work_struct *t)
 {
-	struct cnic_local *cp = from_tasklet(cp, t, cnic_irq_task);
+	struct cnic_local *cp = from_work(cp, t, cnic_irq_task);
 	struct cnic_dev *dev = cp->dev;
 	struct bnx2x *bp = netdev_priv(dev->netdev);
 	u32 status_idx, new_status_idx;
@@ -4427,7 +4428,7 @@ static void cnic_free_irq(struct cnic_dev *dev)
 
 	if (ethdev->drv_state & CNIC_DRV_STATE_USING_MSIX) {
 		cp->disable_int_sync(dev);
-		tasklet_kill(&cp->cnic_irq_task);
+		cancel_work_sync(&cp->cnic_irq_task);
 		free_irq(ethdev->irq_arr[0].vector, dev);
 	}
 }
@@ -4440,7 +4441,7 @@ static int cnic_request_irq(struct cnic_dev *dev)
 
 	err = request_irq(ethdev->irq_arr[0].vector, cnic_irq, 0, "cnic", dev);
 	if (err)
-		tasklet_disable(&cp->cnic_irq_task);
+		disable_work_sync(&cp->cnic_irq_task);
 
 	return err;
 }
@@ -4463,7 +4464,7 @@ static int cnic_init_bnx2_irq(struct cnic_dev *dev)
 		CNIC_WR(dev, base + BNX2_HC_CMD_TICKS_OFF, (64 << 16) | 220);
 
 		cp->last_status_idx = cp->status_blk.bnx2->status_idx;
-		tasklet_setup(&cp->cnic_irq_task, cnic_service_bnx2_msix);
+		INIT_WORK(&cp->cnic_irq_task, cnic_service_bnx2_msix);
 		err = cnic_request_irq(dev);
 		if (err)
 			return err;
@@ -4872,7 +4873,7 @@ static int cnic_init_bnx2x_irq(struct cnic_dev *dev)
 	struct cnic_eth_dev *ethdev = cp->ethdev;
 	int err = 0;
 
-	tasklet_setup(&cp->cnic_irq_task, cnic_service_bnx2x_bh);
+	INIT_WORK(&cp->cnic_irq_task, cnic_service_bnx2x_bh);
 	if (ethdev->drv_state & CNIC_DRV_STATE_USING_MSIX)
 		err = cnic_request_irq(dev);
 
diff --git a/drivers/net/ethernet/broadcom/cnic.h b/drivers/net/ethernet/broadcom/cnic.h
index fedc84ada937..9b0a271c11d5 100644
--- a/drivers/net/ethernet/broadcom/cnic.h
+++ b/drivers/net/ethernet/broadcom/cnic.h
@@ -268,7 +268,7 @@ struct cnic_local {
 	u32				bnx2x_igu_sb_id;
 	u32				int_num;
 	u32				last_status_idx;
-	struct tasklet_struct		cnic_irq_task;
+	struct work_struct		cnic_irq_task;
 
 	struct kcqe		*completed_kcq[MAX_COMPLETED_KCQE];
 
diff --git a/drivers/net/ethernet/cadence/macb.h b/drivers/net/ethernet/cadence/macb.h
index aa5700ac9c00..a6d95a11b4a5 100644
--- a/drivers/net/ethernet/cadence/macb.h
+++ b/drivers/net/ethernet/cadence/macb.h
@@ -13,6 +13,7 @@
 #include <linux/net_tstamp.h>
 #include <linux/interrupt.h>
 #include <linux/phy/phy.h>
+#include <linux/workqueue.h>
 
 #if defined(CONFIG_ARCH_DMA_ADDR_T_64BIT) || defined(CONFIG_MACB_USE_HWSTAMP)
 #define MACB_EXT_DESC
@@ -1322,7 +1323,7 @@ struct macb {
 	spinlock_t rx_fs_lock;
 	unsigned int max_tuples;
 
-	struct tasklet_struct	hresp_err_tasklet;
+	struct work_struct	hresp_err_work;
 
 	int	rx_bd_rd_prefetch;
 	int	tx_bd_rd_prefetch;
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index 898debfd4db3..08ceb51ca127 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -1792,9 +1792,9 @@ static int macb_tx_poll(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
-static void macb_hresp_error_task(struct tasklet_struct *t)
+static void macb_hresp_error_task(struct work_struct *t)
 {
-	struct macb *bp = from_tasklet(bp, t, hresp_err_tasklet);
+	struct macb *bp = from_work(bp, t, hresp_err_work);
 	struct net_device *dev = bp->dev;
 	struct macb_queue *queue;
 	unsigned int q;
@@ -1994,7 +1994,7 @@ static irqreturn_t macb_interrupt(int irq, void *dev_id)
 		}
 
 		if (status & MACB_BIT(HRESP)) {
-			tasklet_schedule(&bp->hresp_err_tasklet);
+			queue_work(system_bh_wq, &bp->hresp_err_work);
 			netdev_err(dev, "DMA bus error: HRESP not OK\n");
 
 			if (bp->caps & MACB_CAPS_ISR_CLEAR_ON_WRITE)
@@ -5150,7 +5150,7 @@ static int macb_probe(struct platform_device *pdev)
 		goto err_out_unregister_mdio;
 	}
 
-	tasklet_setup(&bp->hresp_err_tasklet, macb_hresp_error_task);
+	INIT_WORK(&bp->hresp_err_work, macb_hresp_error_task);
 
 	netdev_info(dev, "Cadence %s rev 0x%08x at 0x%08lx irq %d (%pM)\n",
 		    macb_is_gem(bp) ? "GEM" : "MACB", macb_readl(bp, MID),
@@ -5194,7 +5194,7 @@ static void macb_remove(struct platform_device *pdev)
 		mdiobus_free(bp->mii_bus);
 
 		unregister_netdev(dev);
-		tasklet_kill(&bp->hresp_err_tasklet);
+		cancel_work_sync(&bp->hresp_err_work);
 		pm_runtime_disable(&pdev->dev);
 		pm_runtime_dont_use_autosuspend(&pdev->dev);
 		if (!pm_runtime_suspended(&pdev->dev)) {
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_core.c b/drivers/net/ethernet/cavium/liquidio/lio_core.c
index f38d31bfab1b..ba09260e7ea7 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_core.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_core.c
@@ -925,7 +925,7 @@ int liquidio_schedule_msix_droq_pkt_handler(struct octeon_droq *droq, u64 ret)
 			if (OCTEON_CN23XX_VF(oct))
 				dev_err(&oct->pci_dev->dev,
 					"should not come here should not get rx when poll mode = 0 for vf\n");
-			tasklet_schedule(&oct_priv->droq_tasklet);
+			queue_work(system_bh_wq, &oct_priv->droq_work);
 			return 1;
 		}
 		/* this will be flushed periodically by check iq db */
@@ -975,7 +975,7 @@ static void liquidio_schedule_droq_pkt_handlers(struct octeon_device *oct)
 				droq->ops.napi_fn(droq);
 				oct_priv->napi_mask |= BIT_ULL(oq_no);
 			} else {
-				tasklet_schedule(&oct_priv->droq_tasklet);
+				queue_work(system_bh_wq, &oct_priv->droq_work);
 			}
 		}
 	}
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_main.c b/drivers/net/ethernet/cavium/liquidio/lio_main.c
index 34f02a8ec2ca..4d0aced1896b 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_main.c
@@ -21,6 +21,7 @@
 #include <linux/firmware.h>
 #include <net/vxlan.h>
 #include <linux/kthread.h>
+#include <linux/workqueue.h>
 #include "liquidio_common.h"
 #include "octeon_droq.h"
 #include "octeon_iq.h"
@@ -156,12 +157,12 @@ static int liquidio_set_vf_link_state(struct net_device *netdev, int vfidx,
 static struct handshake handshake[MAX_OCTEON_DEVICES];
 static struct completion first_stage;
 
-static void octeon_droq_bh(struct tasklet_struct *t)
+static void octeon_droq_bh(struct work_struct *t)
 {
 	int q_no;
 	int reschedule = 0;
-	struct octeon_device_priv *oct_priv = from_tasklet(oct_priv, t,
-							  droq_tasklet);
+	struct octeon_device_priv *oct_priv = from_work(oct_priv, t,
+							  droq_work);
 	struct octeon_device *oct = oct_priv->dev;
 
 	for (q_no = 0; q_no < MAX_OCTEON_OUTPUT_QUEUES(oct); q_no++) {
@@ -186,7 +187,7 @@ static void octeon_droq_bh(struct tasklet_struct *t)
 	}
 
 	if (reschedule)
-		tasklet_schedule(&oct_priv->droq_tasklet);
+		queue_work(system_bh_wq, &oct_priv->droq_work);
 }
 
 static int lio_wait_for_oq_pkts(struct octeon_device *oct)
@@ -205,7 +206,7 @@ static int lio_wait_for_oq_pkts(struct octeon_device *oct)
 		}
 		if (pkt_cnt > 0) {
 			pending_pkts += pkt_cnt;
-			tasklet_schedule(&oct_priv->droq_tasklet);
+			queue_work(system_bh_wq, &oct_priv->droq_work);
 		}
 		pkt_cnt = 0;
 		schedule_timeout_uninterruptible(1);
@@ -1136,7 +1137,7 @@ static void octeon_destroy_resources(struct octeon_device *oct)
 		break;
 	}                       /* end switch (oct->status) */
 
-	tasklet_kill(&oct_priv->droq_tasklet);
+	cancel_work_sync(&oct_priv->droq_work);
 }
 
 /**
@@ -1240,7 +1241,7 @@ static void liquidio_destroy_nic_device(struct octeon_device *oct, int ifidx)
 	list_for_each_entry_safe(napi, n, &netdev->napi_list, dev_list)
 		netif_napi_del(napi);
 
-	tasklet_enable(&oct_priv->droq_tasklet);
+	enable_and_queue_work(system_bh_wq, &oct_priv->droq_work);
 
 	if (atomic_read(&lio->ifstate) & LIO_IFSTATE_REGISTERED)
 		unregister_netdev(netdev);
@@ -1776,7 +1777,7 @@ static int liquidio_open(struct net_device *netdev)
 	int ret = 0;
 
 	if (oct->props[lio->ifidx].napi_enabled == 0) {
-		tasklet_disable(&oct_priv->droq_tasklet);
+		disable_work_sync(&oct_priv->droq_work);
 
 		list_for_each_entry_safe(napi, n, &netdev->napi_list, dev_list)
 			napi_enable(napi);
@@ -1902,7 +1903,7 @@ static int liquidio_stop(struct net_device *netdev)
 		if (OCTEON_CN23XX_PF(oct))
 			oct->droq[0]->ops.poll_mode = 0;
 
-		tasklet_enable(&oct_priv->droq_tasklet);
+		enable_and_queue_work(system_bh_wq, &oct_priv->droq_work);
 	}
 
 	dev_info(&oct->pci_dev->dev, "%s interface is stopped\n", netdev->name);
@@ -4210,9 +4211,9 @@ static int octeon_device_init(struct octeon_device *octeon_dev)
 		}
 	}
 
-	/* Initialize the tasklet that handles output queue packet processing.*/
-	dev_dbg(&octeon_dev->pci_dev->dev, "Initializing droq tasklet\n");
-	tasklet_setup(&oct_priv->droq_tasklet, octeon_droq_bh);
+	/* Initialize the work that handles output queue packet processing.*/
+	dev_dbg(&octeon_dev->pci_dev->dev, "Initializing droq work\n");
+	INIT_WORK(&oct_priv->droq_work, octeon_droq_bh);
 
 	/* Setup the interrupt handler and record the INT SUM register address
 	 */
diff --git a/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c b/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
index 62c2eadc33e3..54e402f18c4f 100644
--- a/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
+++ b/drivers/net/ethernet/cavium/liquidio/lio_vf_main.c
@@ -87,7 +87,7 @@ static int lio_wait_for_oq_pkts(struct octeon_device *oct)
 		}
 		if (pkt_cnt > 0) {
 			pending_pkts += pkt_cnt;
-			tasklet_schedule(&oct_priv->droq_tasklet);
+			queue_work(system_bh_wq, &oct_priv->droq_work);
 		}
 		pkt_cnt = 0;
 		schedule_timeout_uninterruptible(1);
@@ -584,7 +584,7 @@ static void octeon_destroy_resources(struct octeon_device *oct)
 		break;
 	}
 
-	tasklet_kill(&oct_priv->droq_tasklet);
+	cancel_work_sync(&oct_priv->droq_work);
 }
 
 /**
@@ -687,7 +687,7 @@ static void liquidio_destroy_nic_device(struct octeon_device *oct, int ifidx)
 	list_for_each_entry_safe(napi, n, &netdev->napi_list, dev_list)
 		netif_napi_del(napi);
 
-	tasklet_enable(&oct_priv->droq_tasklet);
+	enable_and_queue_work(system_bh_wq, &oct_priv->droq_work);
 
 	if (atomic_read(&lio->ifstate) & LIO_IFSTATE_REGISTERED)
 		unregister_netdev(netdev);
@@ -911,7 +911,7 @@ static int liquidio_open(struct net_device *netdev)
 	int ret = 0;
 
 	if (!oct->props[lio->ifidx].napi_enabled) {
-		tasklet_disable(&oct_priv->droq_tasklet);
+		disable_work_sync(&oct_priv->droq_work);
 
 		list_for_each_entry_safe(napi, n, &netdev->napi_list, dev_list)
 			napi_enable(napi);
@@ -986,7 +986,7 @@ static int liquidio_stop(struct net_device *netdev)
 
 		oct->droq[0]->ops.poll_mode = 0;
 
-		tasklet_enable(&oct_priv->droq_tasklet);
+		enable_and_queue_work(system_bh_wq, &oct_priv->droq_work);
 	}
 
 	cancel_delayed_work_sync(&lio->stats_wk.work);
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
index 0d6ee30affb9..ad673cc141dc 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_droq.c
@@ -101,7 +101,7 @@ u32 octeon_droq_check_hw_for_pkts(struct octeon_droq *droq)
 	last_count = pkt_count - droq->pkt_count;
 	droq->pkt_count = pkt_count;
 
-	/* we shall write to cnts  at napi irq enable or end of droq tasklet */
+	/* we shall write to cnts  at napi irq enable or end of droq BH work */
 	if (last_count)
 		atomic_add(last_count, &droq->pkts_pending);
 
@@ -769,7 +769,7 @@ octeon_droq_process_packets(struct octeon_device *oct,
 				(u16)rdisp->rinfo->recv_pkt->rh.r.subcode));
 	}
 
-	/* If there are packets pending. schedule tasklet again */
+	/* If there are packets pending. queue BH work again */
 	if (atomic_read(&droq->pkts_pending))
 		return 1;
 
diff --git a/drivers/net/ethernet/cavium/liquidio/octeon_main.h b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
index 5b4cb725f60f..bbc60215d629 100644
--- a/drivers/net/ethernet/cavium/liquidio/octeon_main.h
+++ b/drivers/net/ethernet/cavium/liquidio/octeon_main.h
@@ -24,6 +24,7 @@
 #define  _OCTEON_MAIN_H_
 
 #include <linux/sched/signal.h>
+#include <linux/workqueue.h>
 
 #if BITS_PER_LONG == 32
 #define CVM_CAST64(v) ((long long)(v))
@@ -36,8 +37,8 @@
 #define DRV_NAME "LiquidIO"
 
 struct octeon_device_priv {
-	/** Tasklet structures for this device. */
-	struct tasklet_struct droq_tasklet;
+	/** Work structures for this device. */
+	struct work_struct droq_work;
 	unsigned long napi_mask;
 	struct octeon_device *dev;
 };
diff --git a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
index 007d4b06819e..f1d61c4a362c 100644
--- a/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
+++ b/drivers/net/ethernet/cavium/octeon/octeon_mgmt.c
@@ -11,6 +11,7 @@
 #include <linux/etherdevice.h>
 #include <linux/capability.h>
 #include <linux/net_tstamp.h>
+#include <linux/workqueue.h>
 #include <linux/interrupt.h>
 #include <linux/netdevice.h>
 #include <linux/spinlock.h>
@@ -144,7 +145,7 @@ struct octeon_mgmt {
 	unsigned int last_speed;
 	struct device *dev;
 	struct napi_struct napi;
-	struct tasklet_struct tx_clean_tasklet;
+	struct work_struct tx_clean_work;
 	struct device_node *phy_np;
 	resource_size_t mix_phys;
 	resource_size_t mix_size;
@@ -315,9 +316,9 @@ static void octeon_mgmt_clean_tx_buffers(struct octeon_mgmt *p)
 		netif_wake_queue(p->netdev);
 }
 
-static void octeon_mgmt_clean_tx_tasklet(struct tasklet_struct *t)
+static void octeon_mgmt_clean_tx_work(struct work_struct *t)
 {
-	struct octeon_mgmt *p = from_tasklet(p, t, tx_clean_tasklet);
+	struct octeon_mgmt *p = from_work(p, t, tx_clean_work);
 	octeon_mgmt_clean_tx_buffers(p);
 	octeon_mgmt_enable_tx_irq(p);
 }
@@ -684,7 +685,7 @@ static irqreturn_t octeon_mgmt_interrupt(int cpl, void *dev_id)
 	}
 	if (mixx_isr.s.orthresh) {
 		octeon_mgmt_disable_tx_irq(p);
-		tasklet_schedule(&p->tx_clean_tasklet);
+		queue_work(system_bh_wq, &p->tx_clean_work);
 	}
 
 	return IRQ_HANDLED;
@@ -1487,8 +1488,7 @@ static int octeon_mgmt_probe(struct platform_device *pdev)
 
 	skb_queue_head_init(&p->tx_list);
 	skb_queue_head_init(&p->rx_list);
-	tasklet_setup(&p->tx_clean_tasklet,
-		      octeon_mgmt_clean_tx_tasklet);
+	INIT_WORK(&p->tx_clean_work, octeon_mgmt_clean_tx_work);
 
 	netdev->priv_flags |= IFF_UNICAST_FLT;
 
diff --git a/drivers/net/ethernet/cavium/thunder/nic.h b/drivers/net/ethernet/cavium/thunder/nic.h
index 090d6b83982a..4ffe6e177d8c 100644
--- a/drivers/net/ethernet/cavium/thunder/nic.h
+++ b/drivers/net/ethernet/cavium/thunder/nic.h
@@ -9,6 +9,7 @@
 #include <linux/netdevice.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
+#include <linux/workqueue.h>
 #include "thunder_bgx.h"
 
 /* PCI device IDs */
@@ -295,7 +296,7 @@ struct nicvf {
 	bool			rb_work_scheduled;
 	struct page		*rb_page;
 	struct delayed_work	rbdr_work;
-	struct tasklet_struct	rbdr_task;
+	struct work_struct	rbdr_task;
 
 	/* Secondary Qset */
 	u8			sqs_count;
@@ -319,7 +320,7 @@ struct nicvf {
 	bool			loopback_supported;
 	struct nicvf_rss_info	rss_info;
 	struct nicvf_pfc	pfc;
-	struct tasklet_struct	qs_err_task;
+	struct work_struct	qs_err_task;
 	struct work_struct	reset_task;
 	struct nicvf_work       rx_mode_work;
 	/* spinlock to protect workqueue arguments from concurrent access */
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_main.c b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
index eff350e0bc2a..d2a68d12fca1 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_main.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_main.c
@@ -982,9 +982,9 @@ static int nicvf_poll(struct napi_struct *napi, int budget)
  *
  * As of now only CQ errors are handled
  */
-static void nicvf_handle_qs_err(struct tasklet_struct *t)
+static void nicvf_handle_qs_err(struct work_struct *t)
 {
-	struct nicvf *nic = from_tasklet(nic, t, qs_err_task);
+	struct nicvf *nic = from_work(nic, t, qs_err_task);
 	struct queue_set *qs = nic->qs;
 	int qidx;
 	u64 status;
@@ -1069,7 +1069,7 @@ static irqreturn_t nicvf_rbdr_intr_handler(int irq, void *nicvf_irq)
 		if (!nicvf_is_intr_enabled(nic, NICVF_INTR_RBDR, qidx))
 			continue;
 		nicvf_disable_intr(nic, NICVF_INTR_RBDR, qidx);
-		tasklet_hi_schedule(&nic->rbdr_task);
+		queue_work(system_bh_highpri_wq, &nic->rbdr_task);
 		/* Clear interrupt */
 		nicvf_clear_intr(nic, NICVF_INTR_RBDR, qidx);
 	}
@@ -1085,7 +1085,7 @@ static irqreturn_t nicvf_qs_err_intr_handler(int irq, void *nicvf_irq)
 
 	/* Disable Qset err interrupt and schedule softirq */
 	nicvf_disable_intr(nic, NICVF_INTR_QS_ERR, 0);
-	tasklet_hi_schedule(&nic->qs_err_task);
+	queue_work(system_bh_highpri_wq, &nic->qs_err_task);
 	nicvf_clear_intr(nic, NICVF_INTR_QS_ERR, 0);
 
 	return IRQ_HANDLED;
@@ -1364,8 +1364,8 @@ int nicvf_stop(struct net_device *netdev)
 	for (irq = 0; irq < nic->num_vec; irq++)
 		synchronize_irq(pci_irq_vector(nic->pdev, irq));
 
-	tasklet_kill(&nic->rbdr_task);
-	tasklet_kill(&nic->qs_err_task);
+	cancel_work_sync(&nic->rbdr_task);
+	cancel_work_sync(&nic->qs_err_task);
 	if (nic->rb_work_scheduled)
 		cancel_delayed_work_sync(&nic->rbdr_work);
 
@@ -1488,11 +1488,11 @@ int nicvf_open(struct net_device *netdev)
 		nicvf_hw_set_mac_addr(nic, netdev);
 	}
 
-	/* Init tasklet for handling Qset err interrupt */
-	tasklet_setup(&nic->qs_err_task, nicvf_handle_qs_err);
+	/* Init work for handling Qset err interrupt */
+	INIT_WORK(&nic->qs_err_task, nicvf_handle_qs_err);
 
-	/* Init RBDR tasklet which will refill RBDR */
-	tasklet_setup(&nic->rbdr_task, nicvf_rbdr_task);
+	/* Init RBDR work which will refill RBDR */
+	INIT_WORK(&nic->rbdr_task, nicvf_rbdr_task);
 	INIT_DELAYED_WORK(&nic->rbdr_work, nicvf_rbdr_work);
 
 	/* Configure CPI alorithm */
@@ -1561,8 +1561,8 @@ int nicvf_open(struct net_device *netdev)
 cleanup:
 	nicvf_disable_intr(nic, NICVF_INTR_MBOX, 0);
 	nicvf_unregister_interrupts(nic);
-	tasklet_kill(&nic->qs_err_task);
-	tasklet_kill(&nic->rbdr_task);
+	cancel_work_sync(&nic->qs_err_task);
+	cancel_work_sync(&nic->rbdr_task);
 napi_del:
 	for (qidx = 0; qidx < qs->cq_cnt; qidx++) {
 		cq_poll = nic->napi[qidx];
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
index 06397cc8bb36..79b80eb8c0b0 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.c
@@ -8,6 +8,7 @@
 #include <linux/ip.h>
 #include <linux/etherdevice.h>
 #include <linux/iommu.h>
+#include <linux/workqueue.h>
 #include <net/ip.h>
 #include <net/tso.h>
 #include <uapi/linux/bpf.h>
@@ -461,9 +462,9 @@ void nicvf_rbdr_work(struct work_struct *work)
 }
 
 /* In Softirq context, alloc rcv buffers in atomic mode */
-void nicvf_rbdr_task(struct tasklet_struct *t)
+void nicvf_rbdr_task(struct work_struct *t)
 {
-	struct nicvf *nic = from_tasklet(nic, t, rbdr_task);
+	struct nicvf *nic = from_work(nic, t, rbdr_task);
 
 	nicvf_refill_rbdr(nic, GFP_ATOMIC);
 	if (nic->rb_alloc_fail) {
diff --git a/drivers/net/ethernet/cavium/thunder/nicvf_queues.h b/drivers/net/ethernet/cavium/thunder/nicvf_queues.h
index 8453defc296c..e167a065c7f6 100644
--- a/drivers/net/ethernet/cavium/thunder/nicvf_queues.h
+++ b/drivers/net/ethernet/cavium/thunder/nicvf_queues.h
@@ -8,6 +8,7 @@
 
 #include <linux/netdevice.h>
 #include <linux/iommu.h>
+#include <linux/workqueue.h>
 #include <net/xdp.h>
 #include "q_struct.h"
 
@@ -348,7 +349,7 @@ void nicvf_xdp_sq_doorbell(struct nicvf *nic, struct snd_queue *sq, int sq_num);
 
 struct sk_buff *nicvf_get_rcv_skb(struct nicvf *nic,
 				  struct cqe_rx_t *cqe_rx, bool xdp);
-void nicvf_rbdr_task(struct tasklet_struct *t);
+void nicvf_rbdr_task(struct work_struct *t);
 void nicvf_rbdr_work(struct work_struct *work);
 
 void nicvf_enable_intr(struct nicvf *nic, int int_type, int q_idx);
diff --git a/drivers/net/ethernet/chelsio/cxgb/sge.c b/drivers/net/ethernet/chelsio/cxgb/sge.c
index 861edff5ed89..3075a5c5c616 100644
--- a/drivers/net/ethernet/chelsio/cxgb/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb/sge.c
@@ -44,6 +44,7 @@
 #include <linux/if_arp.h>
 #include <linux/slab.h>
 #include <linux/prefetch.h>
+#include <linux/workqueue.h>
 
 #include "cpl5_cmd.h"
 #include "sge.h"
@@ -229,11 +230,11 @@ struct sched {
 	unsigned int	port;		/* port index (round robin ports) */
 	unsigned int	num;		/* num skbs in per port queues */
 	struct sched_port p[MAX_NPORTS];
-	struct tasklet_struct sched_tsk;/* tasklet used to run scheduler */
+	struct work_struct sched_tsk;/* work used to run scheduler */
 	struct sge *sge;
 };
 
-static void restart_sched(struct tasklet_struct *t);
+static void restart_sched(struct work_struct *t);
 
 
 /*
@@ -270,14 +271,14 @@ static const u8 ch_mac_addr[ETH_ALEN] = {
 };
 
 /*
- * stop tasklet and free all pending skb's
+ * stop work and free all pending skb's
  */
 static void tx_sched_stop(struct sge *sge)
 {
 	struct sched *s = sge->tx_sched;
 	int i;
 
-	tasklet_kill(&s->sched_tsk);
+	cancel_work_sync(&s->sched_tsk);
 
 	for (i = 0; i < MAX_NPORTS; i++)
 		__skb_queue_purge(&s->p[s->port].skbq);
@@ -371,7 +372,7 @@ static int tx_sched_init(struct sge *sge)
 		return -ENOMEM;
 
 	pr_debug("tx_sched_init\n");
-	tasklet_setup(&s->sched_tsk, restart_sched);
+	INIT_WORK(&s->sched_tsk, restart_sched);
 	s->sge = sge;
 	sge->tx_sched = s;
 
@@ -1300,12 +1301,12 @@ static inline void reclaim_completed_tx(struct sge *sge, struct cmdQ *q)
 }
 
 /*
- * Called from tasklet. Checks the scheduler for any
+ * Called from work. Checks the scheduler for any
  * pending skbs that can be sent.
  */
-static void restart_sched(struct tasklet_struct *t)
+static void restart_sched(struct work_struct *t)
 {
-	struct sched *s = from_tasklet(s, t, sched_tsk);
+	struct sched *s = from_work(s, t, sched_tsk);
 	struct sge *sge = s->sge;
 	struct adapter *adapter = sge->adapter;
 	struct cmdQ *q = &sge->cmdQ[0];
@@ -1451,7 +1452,7 @@ static unsigned int update_tx_info(struct adapter *adapter,
 			writel(F_CMDQ0_ENABLE, adapter->regs + A_SG_DOORBELL);
 		}
 		if (sge->tx_sched)
-			tasklet_hi_schedule(&sge->tx_sched->sched_tsk);
+			queue_work(system_bh_highpri_wq, &sge->tx_sched->sched_tsk);
 
 		flags &= ~F_CMDQ0_ENABLE;
 	}
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
index fca9533bc011..ce9b8124495c 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4.h
@@ -54,6 +54,7 @@
 #include <linux/ptp_classify.h>
 #include <linux/crash_dump.h>
 #include <linux/thermal.h>
+#include <linux/workqueue.h>
 #include <asm/io.h>
 #include "t4_chip_type.h"
 #include "cxgb4_uld.h"
@@ -880,7 +881,7 @@ struct sge_uld_txq {               /* state for an SGE offload Tx queue */
 	struct sge_txq q;
 	struct adapter *adap;
 	struct sk_buff_head sendq;  /* list of backpressured packets */
-	struct tasklet_struct qresume_tsk; /* restarts the queue */
+	struct work_struct qresume_tsk; /* restarts the queue */
 	bool service_ofldq_running; /* service_ofldq() is processing sendq */
 	u8 full;                    /* the Tx ring is full */
 	unsigned long mapping_err;  /* # of I/O MMU packet mapping errors */
@@ -890,7 +891,7 @@ struct sge_ctrl_txq {               /* state for an SGE control Tx queue */
 	struct sge_txq q;
 	struct adapter *adap;
 	struct sk_buff_head sendq;  /* list of backpressured packets */
-	struct tasklet_struct qresume_tsk; /* restarts the queue */
+	struct work_struct qresume_tsk; /* restarts the queue */
 	u8 full;                    /* the Tx ring is full */
 } ____cacheline_aligned_in_smp;
 
@@ -946,7 +947,7 @@ struct sge_eosw_txq {
 
 	u32 hwqid; /* Underlying hardware queue index */
 	struct net_device *netdev; /* Pointer to netdevice */
-	struct tasklet_struct qresume_tsk; /* Restarts the queue */
+	struct work_struct qresume_tsk; /* Restarts the queue */
 	struct completion completion; /* completion for FLOWC rendezvous */
 };
 
@@ -2107,7 +2108,7 @@ void free_tx_desc(struct adapter *adap, struct sge_txq *q,
 void cxgb4_eosw_txq_free_desc(struct adapter *adap, struct sge_eosw_txq *txq,
 			      u32 ndesc);
 int cxgb4_ethofld_send_flowc(struct net_device *dev, u32 eotid, u32 tc);
-void cxgb4_ethofld_restart(struct tasklet_struct *t);
+void cxgb4_ethofld_restart(struct work_struct *t);
 int cxgb4_ethofld_rx_handler(struct sge_rspq *q, const __be64 *rsp,
 			     const struct pkt_gl *si);
 void free_txq(struct adapter *adap, struct sge_txq *q);
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
index 2eb33a727bba..5d9b926aff7d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.c
@@ -589,7 +589,7 @@ static int fwevtq_handler(struct sge_rspq *q, const __be64 *rsp,
 			struct sge_uld_txq *oq;
 
 			oq = container_of(txq, struct sge_uld_txq, q);
-			tasklet_schedule(&oq->qresume_tsk);
+			queue_work(system_bh_wq, &oq->qresume_tsk);
 		}
 	} else if (opcode == CPL_FW6_MSG || opcode == CPL_FW4_MSG) {
 		const struct cpl_fw6_msg *p = (void *)rsp;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
index 338b04f339b3..9f077841b309 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.c
@@ -114,7 +114,7 @@ static int cxgb4_init_eosw_txq(struct net_device *dev,
 	eosw_txq->cred = adap->params.ofldq_wr_cred;
 	eosw_txq->hwqid = hwqid;
 	eosw_txq->netdev = dev;
-	tasklet_setup(&eosw_txq->qresume_tsk, cxgb4_ethofld_restart);
+	INIT_WORK(&eosw_txq->qresume_tsk, cxgb4_ethofld_restart);
 	return 0;
 }
 
@@ -143,7 +143,7 @@ static void cxgb4_free_eosw_txq(struct net_device *dev,
 	cxgb4_clean_eosw_txq(dev, eosw_txq);
 	kfree(eosw_txq->desc);
 	spin_unlock_bh(&eosw_txq->lock);
-	tasklet_kill(&eosw_txq->qresume_tsk);
+	cancel_work_sync(&eosw_txq->qresume_tsk);
 }
 
 static int cxgb4_mqprio_alloc_hw_resources(struct net_device *dev)
diff --git a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
index 17faac715882..388ade2ddca9 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.c
@@ -407,7 +407,7 @@ free_sge_txq_uld(struct adapter *adap, struct sge_uld_txq_info *txq_info)
 		struct sge_uld_txq *txq = &txq_info->uldtxq[i];
 
 		if (txq && txq->q.desc) {
-			tasklet_kill(&txq->qresume_tsk);
+			cancel_work_sync(&txq->qresume_tsk);
 			t4_ofld_eq_free(adap, adap->mbox, adap->pf, 0,
 					txq->q.cntxt_id);
 			free_tx_desc(adap, &txq->q, txq->q.in_use, false);
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 49d5808b7d11..ffa74e45248d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -41,6 +41,7 @@
 #include <linux/jiffies.h>
 #include <linux/prefetch.h>
 #include <linux/export.h>
+#include <linux/workqueue.h>
 #include <net/xfrm.h>
 #include <net/ipv6.h>
 #include <net/tcp.h>
@@ -2769,15 +2770,15 @@ static int ctrl_xmit(struct sge_ctrl_txq *q, struct sk_buff *skb)
 
 /**
  *	restart_ctrlq - restart a suspended control queue
- *	@t: pointer to the tasklet associated with this handler
+ *	@t: pointer to the work associated with this handler
  *
  *	Resumes transmission on a suspended Tx control queue.
  */
-static void restart_ctrlq(struct tasklet_struct *t)
+static void restart_ctrlq(struct work_struct *t)
 {
 	struct sk_buff *skb;
 	unsigned int written = 0;
-	struct sge_ctrl_txq *q = from_tasklet(q, t, qresume_tsk);
+	struct sge_ctrl_txq *q = from_work(q, t, qresume_tsk);
 
 	spin_lock(&q->sendq.lock);
 	reclaim_completed_tx_imm(&q->q);
@@ -2926,7 +2927,7 @@ static void ofldtxq_stop(struct sge_uld_txq *q, struct fw_wr_hdr *wr)
  *	left on the queue in case we experience DMA Mapping errors, etc.
  *	and need to give up and restart later.
  *
- *	service_ofldq() can be thought of as a task which opportunistically
+ *	service_ofldq() can be thought of as a work which opportunistically
  *	uses other threads execution contexts.  We use the Offload Queue
  *	boolean "service_ofldq_running" to make sure that only one instance
  *	is ever running at a time ...
@@ -3075,13 +3076,13 @@ static int ofld_xmit(struct sge_uld_txq *q, struct sk_buff *skb)
 
 /**
  *	restart_ofldq - restart a suspended offload queue
- *	@t: pointer to the tasklet associated with this handler
+ *	@t: pointer to the work associated with this handler
  *
  *	Resumes transmission on a suspended Tx offload queue.
  */
-static void restart_ofldq(struct tasklet_struct *t)
+static void restart_ofldq(struct work_struct *t)
 {
-	struct sge_uld_txq *q = from_tasklet(q, t, qresume_tsk);
+	struct sge_uld_txq *q = from_work(q, t, qresume_tsk);
 
 	spin_lock(&q->sendq.lock);
 	q->full = 0;            /* the queue actually is completely empty now */
@@ -4020,9 +4021,9 @@ static int napi_rx_handler(struct napi_struct *napi, int budget)
 	return work_done;
 }
 
-void cxgb4_ethofld_restart(struct tasklet_struct *t)
+void cxgb4_ethofld_restart(struct work_struct *t)
 {
-	struct sge_eosw_txq *eosw_txq = from_tasklet(eosw_txq, t,
+	struct sge_eosw_txq *eosw_txq = from_work(eosw_txq, t,
 						     qresume_tsk);
 	int pktcount;
 
@@ -4050,7 +4051,7 @@ void cxgb4_ethofld_restart(struct tasklet_struct *t)
  * @si: the gather list of packet fragments
  *
  * Process a ETHOFLD Tx completion. Increment the cidx here, but
- * free up the descriptors in a tasklet later.
+ * free up the descriptors in a work later.
  */
 int cxgb4_ethofld_rx_handler(struct sge_rspq *q, const __be64 *rsp,
 			     const struct pkt_gl *si)
@@ -4117,10 +4118,10 @@ int cxgb4_ethofld_rx_handler(struct sge_rspq *q, const __be64 *rsp,
 
 		spin_unlock(&eosw_txq->lock);
 
-		/* Schedule a tasklet to reclaim SKBs and restart ETHOFLD Tx,
+		/* Schedule a work to reclaim SKBs and restart ETHOFLD Tx,
 		 * if there were packets waiting for completion.
 		 */
-		tasklet_schedule(&eosw_txq->qresume_tsk);
+		queue_work(system_bh_wq, &eosw_txq->qresume_tsk);
 	}
 
 out_done:
@@ -4279,7 +4280,7 @@ static void sge_tx_timer_cb(struct timer_list *t)
 			struct sge_uld_txq *txq = s->egr_map[id];
 
 			clear_bit(id, s->txq_maperr);
-			tasklet_schedule(&txq->qresume_tsk);
+			queue_work(system_bh_wq, &txq->qresume_tsk);
 		}
 
 	if (!is_t4(adap->params.chip)) {
@@ -4719,7 +4720,7 @@ int t4_sge_alloc_ctrl_txq(struct adapter *adap, struct sge_ctrl_txq *txq,
 	init_txq(adap, &txq->q, FW_EQ_CTRL_CMD_EQID_G(ntohl(c.cmpliqid_eqid)));
 	txq->adap = adap;
 	skb_queue_head_init(&txq->sendq);
-	tasklet_setup(&txq->qresume_tsk, restart_ctrlq);
+	INIT_WORK(&txq->qresume_tsk, restart_ctrlq);
 	txq->full = 0;
 	return 0;
 }
@@ -4809,7 +4810,7 @@ int t4_sge_alloc_uld_txq(struct adapter *adap, struct sge_uld_txq *txq,
 	txq->q.q_type = CXGB4_TXQ_ULD;
 	txq->adap = adap;
 	skb_queue_head_init(&txq->sendq);
-	tasklet_setup(&txq->qresume_tsk, restart_ofldq);
+	INIT_WORK(&txq->qresume_tsk, restart_ofldq);
 	txq->full = 0;
 	txq->mapping_err = 0;
 	return 0;
@@ -4952,7 +4953,7 @@ void t4_free_sge_resources(struct adapter *adap)
 		struct sge_ctrl_txq *cq = &adap->sge.ctrlq[i];
 
 		if (cq->q.desc) {
-			tasklet_kill(&cq->qresume_tsk);
+			cancel_work_sync(&cq->qresume_tsk);
 			t4_ctrl_eq_free(adap, adap->mbox, adap->pf, 0,
 					cq->q.cntxt_id);
 			__skb_queue_purge(&cq->sendq);
@@ -5002,7 +5003,7 @@ void t4_sge_start(struct adapter *adap)
  *	t4_sge_stop - disable SGE operation
  *	@adap: the adapter
  *
- *	Stop tasklets and timers associated with the DMA engine.  Note that
+ *	Stop works and timers associated with the DMA engine.  Note that
  *	this is effective only if measures have been taken to disable any HW
  *	events that may restart them.
  */
@@ -5025,7 +5026,7 @@ void t4_sge_stop(struct adapter *adap)
 
 			for_each_ofldtxq(&adap->sge, i) {
 				if (txq->q.desc)
-					tasklet_kill(&txq->qresume_tsk);
+					cancel_work_sync(&txq->qresume_tsk);
 			}
 		}
 	}
@@ -5039,7 +5040,7 @@ void t4_sge_stop(struct adapter *adap)
 
 			for_each_ofldtxq(&adap->sge, i) {
 				if (txq->q.desc)
-					tasklet_kill(&txq->qresume_tsk);
+					cancel_work_sync(&txq->qresume_tsk);
 			}
 		}
 	}
@@ -5048,7 +5049,7 @@ void t4_sge_stop(struct adapter *adap)
 		struct sge_ctrl_txq *cq = &s->ctrlq[i];
 
 		if (cq->q.desc)
-			tasklet_kill(&cq->qresume_tsk);
+			cancel_work_sync(&cq->qresume_tsk);
 	}
 }
 
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 5b1d746e6563..9a449fca079d 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2587,7 +2587,7 @@ void t4vf_free_sge_resources(struct adapter *adapter)
  *	t4vf_sge_start - enable SGE operation
  *	@adapter: the adapter
  *
- *	Start tasklets and timers associated with the DMA engine.
+ *	Start works and timers associated with the DMA engine.
  */
 void t4vf_sge_start(struct adapter *adapter)
 {
@@ -2600,7 +2600,7 @@ void t4vf_sge_start(struct adapter *adapter)
  *	t4vf_sge_stop - disable SGE operation
  *	@adapter: the adapter
  *
- *	Stop tasklets and timers associated with the DMA engine.  Note that
+ *	Stop works and timers associated with the DMA engine.  Note that
  *	this is effective only if measures have been taken to disable any HW
  *	events that may restart them.
  */
@@ -2692,7 +2692,7 @@ int t4vf_sge_init(struct adapter *adapter)
 	s->fl_starve_thres = s->fl_starve_thres * 2 + 1;
 
 	/*
-	 * Set up tasklet timers.
+	 * Set up timers.
 	 */
 	timer_setup(&s->rx_timer, sge_rx_timer_cb, 0);
 	timer_setup(&s->tx_timer, sge_tx_timer_cb, 0);
diff --git a/drivers/net/ethernet/dlink/sundance.c b/drivers/net/ethernet/dlink/sundance.c
index aaf0eda96292..44cd33facdab 100644
--- a/drivers/net/ethernet/dlink/sundance.c
+++ b/drivers/net/ethernet/dlink/sundance.c
@@ -97,6 +97,7 @@ static char *media[MAX_UNITS];
 #include <linux/crc32.h>
 #include <linux/ethtool.h>
 #include <linux/mii.h>
+#include <linux/workqueue.h>
 
 MODULE_AUTHOR("Donald Becker <becker@scyld.com>");
 MODULE_DESCRIPTION("Sundance Alta Ethernet driver");
@@ -395,8 +396,8 @@ struct netdev_private {
 	unsigned int an_enable:1;
 	unsigned int speed;
 	unsigned int wol_enabled:1;			/* Wake on LAN enabled */
-	struct tasklet_struct rx_tasklet;
-	struct tasklet_struct tx_tasklet;
+	struct work_struct rx_work;
+	struct work_struct tx_work;
 	int budget;
 	int cur_task;
 	/* Multicast and receive mode. */
@@ -430,8 +431,8 @@ static void init_ring(struct net_device *dev);
 static netdev_tx_t start_tx(struct sk_buff *skb, struct net_device *dev);
 static int reset_tx (struct net_device *dev);
 static irqreturn_t intr_handler(int irq, void *dev_instance);
-static void rx_poll(struct tasklet_struct *t);
-static void tx_poll(struct tasklet_struct *t);
+static void rx_poll(struct work_struct *t);
+static void tx_poll(struct work_struct *t);
 static void refill_rx (struct net_device *dev);
 static void netdev_error(struct net_device *dev, int intr_status);
 static void netdev_error(struct net_device *dev, int intr_status);
@@ -541,8 +542,8 @@ static int sundance_probe1(struct pci_dev *pdev,
 	np->msg_enable = (1 << debug) - 1;
 	spin_lock_init(&np->lock);
 	spin_lock_init(&np->statlock);
-	tasklet_setup(&np->rx_tasklet, rx_poll);
-	tasklet_setup(&np->tx_tasklet, tx_poll);
+	INIT_WORK(&np->rx_work, rx_poll);
+	INIT_WORK(&np->tx_work, tx_poll);
 
 	ring_space = dma_alloc_coherent(&pdev->dev, TX_TOTAL_SIZE,
 			&ring_dma, GFP_KERNEL);
@@ -965,7 +966,7 @@ static void tx_timeout(struct net_device *dev, unsigned int txqueue)
 	unsigned long flag;
 
 	netif_stop_queue(dev);
-	tasklet_disable_in_atomic(&np->tx_tasklet);
+	disable_work_sync(&np->tx_work);
 	iowrite16(0, ioaddr + IntrEnable);
 	printk(KERN_WARNING "%s: Transmit timed out, TxStatus %2.2x "
 		   "TxFrameId %2.2x,"
@@ -1006,7 +1007,7 @@ static void tx_timeout(struct net_device *dev, unsigned int txqueue)
 		netif_wake_queue(dev);
 	}
 	iowrite16(DEFAULT_INTR, ioaddr + IntrEnable);
-	tasklet_enable(&np->tx_tasklet);
+	enable_and_queue_work(system_bh_wq, &np->tx_work);
 }
 
 
@@ -1058,9 +1059,9 @@ static void init_ring(struct net_device *dev)
 	}
 }
 
-static void tx_poll(struct tasklet_struct *t)
+static void tx_poll(struct work_struct *t)
 {
-	struct netdev_private *np = from_tasklet(np, t, tx_tasklet);
+	struct netdev_private *np = from_work(np, t, tx_work);
 	unsigned head = np->cur_task % TX_RING_SIZE;
 	struct netdev_desc *txdesc =
 		&np->tx_ring[(np->cur_tx - 1) % TX_RING_SIZE];
@@ -1104,11 +1105,11 @@ start_tx (struct sk_buff *skb, struct net_device *dev)
 			goto drop_frame;
 	txdesc->frag.length = cpu_to_le32 (skb->len | LastFrag);
 
-	/* Increment cur_tx before tasklet_schedule() */
+	/* Increment cur_tx before queue_work(system_bh_wq, ) */
 	np->cur_tx++;
 	mb();
-	/* Schedule a tx_poll() task */
-	tasklet_schedule(&np->tx_tasklet);
+	/* Schedule a tx_poll() work */
+	queue_work(system_bh_wq, &np->tx_work);
 
 	/* On some architectures: explicitly flush cache lines here. */
 	if (np->cur_tx - np->dirty_tx < TX_QUEUE_LEN - 1 &&
@@ -1199,7 +1200,7 @@ static irqreturn_t intr_handler(int irq, void *dev_instance)
 					ioaddr + IntrEnable);
 			if (np->budget < 0)
 				np->budget = RX_BUDGET;
-			tasklet_schedule(&np->rx_tasklet);
+			queue_work(system_bh_wq, &np->rx_work);
 		}
 		if (intr_status & (IntrTxDone | IntrDrvRqst)) {
 			tx_status = ioread16 (ioaddr + TxStatus);
@@ -1315,9 +1316,9 @@ static irqreturn_t intr_handler(int irq, void *dev_instance)
 	return IRQ_RETVAL(handled);
 }
 
-static void rx_poll(struct tasklet_struct *t)
+static void rx_poll(struct work_struct *t)
 {
-	struct netdev_private *np = from_tasklet(np, t, rx_tasklet);
+	struct netdev_private *np = from_work(np, t, rx_work);
 	struct net_device *dev = np->ndev;
 	int entry = np->cur_rx % RX_RING_SIZE;
 	int boguscnt = np->budget;
@@ -1407,7 +1408,7 @@ static void rx_poll(struct tasklet_struct *t)
 	np->budget -= received;
 	if (np->budget <= 0)
 		np->budget = RX_BUDGET;
-	tasklet_schedule(&np->rx_tasklet);
+	queue_work(system_bh_wq, &np->rx_work);
 }
 
 static void refill_rx (struct net_device *dev)
@@ -1819,9 +1820,9 @@ static int netdev_close(struct net_device *dev)
 	struct sk_buff *skb;
 	int i;
 
-	/* Wait and kill tasklet */
-	tasklet_kill(&np->rx_tasklet);
-	tasklet_kill(&np->tx_tasklet);
+	/* Wait and kill work */
+	cancel_work_sync(&np->rx_work);
+	cancel_work_sync(&np->tx_work);
 	np->cur_tx = 0;
 	np->dirty_tx = 0;
 	np->cur_task = 0;
diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_cmdq.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_cmdq.c
index d39eec9c62bf..02145cb1ebc4 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_cmdq.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_cmdq.c
@@ -344,7 +344,7 @@ static int cmdq_sync_cmd_direct_resp(struct hinic_cmdq *cmdq,
 	struct hinic_hw_wqe *hw_wqe;
 	struct completion done;
 
-	/* Keep doorbell index correct. bh - for tasklet(ceq). */
+	/* Keep doorbell index correct. - for BH work(ceq). */
 	spin_lock_bh(&cmdq->cmdq_lock);
 
 	/* WQE_SIZE = WQEBB_SIZE, we will get the wq element and not shadow*/
diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
index 045c47786a04..66c36c151294 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.c
@@ -368,12 +368,12 @@ static void eq_irq_work(struct work_struct *work)
 }
 
 /**
- * ceq_tasklet - the tasklet of the EQ that received the event
- * @t: the tasklet struct pointer
+ * ceq_work - the work of the EQ that received the event
+ * @t: the work struct pointer
  **/
-static void ceq_tasklet(struct tasklet_struct *t)
+static void ceq_work(struct work_struct *t)
 {
-	struct hinic_eq *ceq = from_tasklet(ceq, t, ceq_tasklet);
+	struct hinic_eq *ceq = from_work(ceq, t, ceq_work);
 
 	eq_irq_handler(ceq);
 }
@@ -413,7 +413,7 @@ static irqreturn_t ceq_interrupt(int irq, void *data)
 	/* clear resend timer cnt register */
 	hinic_msix_attr_cnt_clear(ceq->hwif, ceq->msix_entry.entry);
 
-	tasklet_schedule(&ceq->ceq_tasklet);
+	queue_work(system_bh_wq, &ceq->ceq_work);
 
 	return IRQ_HANDLED;
 }
@@ -782,7 +782,7 @@ static int init_eq(struct hinic_eq *eq, struct hinic_hwif *hwif,
 
 		INIT_WORK(&aeq_work->work, eq_irq_work);
 	} else if (type == HINIC_CEQ) {
-		tasklet_setup(&eq->ceq_tasklet, ceq_tasklet);
+		INIT_WORK(&eq->ceq_work, ceq_work);
 	}
 
 	/* set the attributes of the msix entry */
@@ -833,7 +833,7 @@ static void remove_eq(struct hinic_eq *eq)
 		hinic_hwif_write_reg(eq->hwif,
 				     HINIC_CSR_AEQ_CTRL_1_ADDR(eq->q_id), 0);
 	} else if (eq->type == HINIC_CEQ) {
-		tasklet_kill(&eq->ceq_tasklet);
+		cancel_work_sync(&eq->ceq_work);
 		/* clear ceq_len to avoid hw access host memory */
 		hinic_hwif_write_reg(eq->hwif,
 				     HINIC_CSR_CEQ_CTRL_1_ADDR(eq->q_id), 0);
@@ -968,9 +968,8 @@ void hinic_dump_ceq_info(struct hinic_hwdev *hwdev)
 		ci = hinic_hwif_read_reg(hwdev->hwif, addr);
 		addr = EQ_PROD_IDX_REG_ADDR(eq);
 		pi = hinic_hwif_read_reg(hwdev->hwif, addr);
-		dev_err(&hwdev->hwif->pdev->dev, "Ceq id: %d, ci: 0x%08x, sw_ci: 0x%08x, pi: 0x%x, tasklet_state: 0x%lx, wrap: %d, ceqe: 0x%x\n",
+		dev_err(&hwdev->hwif->pdev->dev, "Ceq id: %d, ci: 0x%08x, sw_ci: 0x%08x, pi: 0x%x, wrap: %d, ceqe: 0x%x\n",
 			q_id, ci, eq->cons_idx, pi,
-			eq->ceq_tasklet.state,
 			eq->wrapped, be32_to_cpu(*(__be32 *)(GET_CURR_CEQ_ELEM(eq))));
 	}
 }
diff --git a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.h b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.h
index 2f3222174fc7..49c08bebc07f 100644
--- a/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.h
+++ b/drivers/net/ethernet/huawei/hinic/hinic_hw_eqs.h
@@ -193,7 +193,7 @@ struct hinic_eq {
 
 	struct hinic_eq_work    aeq_work;
 
-	struct tasklet_struct   ceq_tasklet;
+	struct work_struct ceq_work;
 };
 
 struct hinic_hw_event_cb {
diff --git a/drivers/net/ethernet/ibm/ehea/ehea.h b/drivers/net/ethernet/ibm/ehea/ehea.h
index 208c440a602b..eeb124b5f9c5 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea.h
+++ b/drivers/net/ethernet/ibm/ehea/ehea.h
@@ -20,6 +20,7 @@
 #include <linux/vmalloc.h>
 #include <linux/if_vlan.h>
 #include <linux/platform_device.h>
+#include <linux/workqueue.h>
 
 #include <asm/ibmebus.h>
 #include <asm/io.h>
@@ -381,7 +382,7 @@ struct ehea_adapter {
 	struct platform_device *ofdev;
 	struct ehea_port *port[EHEA_MAX_PORTS];
 	struct ehea_eq *neq;       /* notification event queue */
-	struct tasklet_struct neq_tasklet;
+	struct work_struct neq_work;
 	struct ehea_mr mr;
 	u32 pd;                    /* protection domain */
 	u64 max_mc_mac;            /* max number of multicast mac addresses */
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 1e29e5c9a2df..88db27778363 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -976,7 +976,7 @@ int ehea_sense_port_attr(struct ehea_port *port)
 	u64 hret;
 	struct hcp_ehea_port_cb0 *cb0;
 
-	/* may be called via ehea_neq_tasklet() */
+	/* may be called via ehea_neq_work() */
 	cb0 = (void *)get_zeroed_page(GFP_ATOMIC);
 	if (!cb0) {
 		pr_err("no mem for cb0\n");
@@ -1216,9 +1216,9 @@ static void ehea_parse_eqe(struct ehea_adapter *adapter, u64 eqe)
 	}
 }
 
-static void ehea_neq_tasklet(struct tasklet_struct *t)
+static void ehea_neq_work(struct work_struct *t)
 {
-	struct ehea_adapter *adapter = from_tasklet(adapter, t, neq_tasklet);
+	struct ehea_adapter *adapter = from_work(adapter, t, neq_work);
 	struct ehea_eqe *eqe;
 	u64 event_mask;
 
@@ -1243,7 +1243,7 @@ static void ehea_neq_tasklet(struct tasklet_struct *t)
 static irqreturn_t ehea_interrupt_neq(int irq, void *param)
 {
 	struct ehea_adapter *adapter = param;
-	tasklet_hi_schedule(&adapter->neq_tasklet);
+	queue_work(system_bh_highpri_wq, &adapter->neq_work);
 	return IRQ_HANDLED;
 }
 
@@ -3423,7 +3423,7 @@ static int ehea_probe_adapter(struct platform_device *dev)
 		goto out_free_ad;
 	}
 
-	tasklet_setup(&adapter->neq_tasklet, ehea_neq_tasklet);
+	INIT_WORK(&adapter->neq_work, ehea_neq_work);
 
 	ret = ehea_create_device_sysfs(dev);
 	if (ret)
@@ -3444,7 +3444,7 @@ static int ehea_probe_adapter(struct platform_device *dev)
 	}
 
 	/* Handle any events that might be pending. */
-	tasklet_hi_schedule(&adapter->neq_tasklet);
+	queue_work(system_bh_highpri_wq, &adapter->neq_work);
 
 	ret = 0;
 	goto out;
@@ -3485,7 +3485,7 @@ static void ehea_remove(struct platform_device *dev)
 	ehea_remove_device_sysfs(dev);
 
 	ibmebus_free_irq(adapter->neq->attr.ist1, adapter);
-	tasklet_kill(&adapter->neq_tasklet);
+	cancel_work_sync(&adapter->neq_work);
 
 	ehea_destroy_eq(adapter->neq);
 	ehea_remove_adapter_mr(adapter);
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index 30c47b8470ad..5e09fdd9b63b 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -2721,7 +2721,7 @@ static const char *reset_reason_to_string(enum ibmvnic_reset_reason reason)
 /*
  * Initialize the init_done completion and return code values. We
  * can get a transport event just after registering the CRQ and the
- * tasklet will use this to communicate the transport event. To ensure
+ * work will use this to communicate the transport event. To ensure
  * we don't miss the notification/error, initialize these _before_
  * regisering the CRQ.
  */
@@ -4425,7 +4425,7 @@ static void send_request_cap(struct ibmvnic_adapter *adapter, int retry)
 	int cap_reqs;
 
 	/* We send out 6 or 7 REQUEST_CAPABILITY CRQs below (depending on
-	 * the PROMISC flag). Initialize this count upfront. When the tasklet
+	 * the PROMISC flag). Initialize this count upfront. When the work
 	 * receives a response to all of these, it will send the next protocol
 	 * message (QUERY_IP_OFFLOAD).
 	 */
@@ -4961,7 +4961,7 @@ static void send_query_cap(struct ibmvnic_adapter *adapter)
 	int cap_reqs;
 
 	/* We send out 25 QUERY_CAPABILITY CRQs below.  Initialize this count
-	 * upfront. When the tasklet receives a response to all of these, it
+	 * upfront. When the work receives a response to all of these, it
 	 * can send out the next protocol messaage (REQUEST_CAPABILITY).
 	 */
 	cap_reqs = 25;
@@ -5473,7 +5473,7 @@ static int handle_login_rsp(union ibmvnic_crq *login_rsp_crq,
 	int i;
 
 	/* CHECK: Test/set of login_pending does not need to be atomic
-	 * because only ibmvnic_tasklet tests/clears this.
+	 * because only ibmvnic_work tests/clears this.
 	 */
 	if (!adapter->login_pending) {
 		netdev_warn(netdev, "Ignoring unexpected login response\n");
@@ -6059,13 +6059,13 @@ static irqreturn_t ibmvnic_interrupt(int irq, void *instance)
 {
 	struct ibmvnic_adapter *adapter = instance;
 
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->work);
 	return IRQ_HANDLED;
 }
 
-static void ibmvnic_tasklet(struct tasklet_struct *t)
+static void ibmvnic_work(struct work_struct *t)
 {
-	struct ibmvnic_adapter *adapter = from_tasklet(adapter, t, tasklet);
+	struct ibmvnic_adapter *adapter = from_work(adapter, t, work);
 	struct ibmvnic_crq_queue *queue = &adapter->crq;
 	union ibmvnic_crq *crq;
 	unsigned long flags;
@@ -6146,7 +6146,7 @@ static void release_crq_queue(struct ibmvnic_adapter *adapter)
 
 	netdev_dbg(adapter->netdev, "Releasing CRQ\n");
 	free_irq(vdev->irq, adapter);
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6197,7 +6197,7 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 
 	retrc = 0;
 
-	tasklet_setup(&adapter->tasklet, (void *)ibmvnic_tasklet);
+	INIT_WORK(&adapter->work, (void *)ibmvnic_work);
 
 	netdev_dbg(adapter->netdev, "registering irq 0x%x\n", vdev->irq);
 	snprintf(crq->name, sizeof(crq->name), "ibmvnic-%x",
@@ -6219,12 +6219,12 @@ static int init_crq_queue(struct ibmvnic_adapter *adapter)
 	spin_lock_init(&crq->lock);
 
 	/* process any CRQs that were queued before we enabled interrupts */
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->work);
 
 	return retrc;
 
 req_irq_failed:
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->work);
 	do {
 		rc = plpar_hcall_norets(H_FREE_CRQ, vdev->unit_address);
 	} while (rc == H_BUSY || H_IS_LONG_BUSY(rc));
@@ -6617,7 +6617,7 @@ static int ibmvnic_resume(struct device *dev)
 	if (adapter->state != VNIC_OPEN)
 		return 0;
 
-	tasklet_schedule(&adapter->tasklet);
+	queue_work(system_bh_wq, &adapter->work);
 
 	return 0;
 }
diff --git a/drivers/net/ethernet/ibm/ibmvnic.h b/drivers/net/ethernet/ibm/ibmvnic.h
index 94ac36b1408b..8afceba3b427 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.h
+++ b/drivers/net/ethernet/ibm/ibmvnic.h
@@ -1036,7 +1036,7 @@ struct ibmvnic_adapter {
 	u32 cur_rx_buf_sz;
 	u32 prev_rx_buf_sz;
 
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	enum vnic_state state;
 	/* Used for serialization of state field. When taking both state
 	 * and rwi locks, take state lock first.
diff --git a/drivers/net/ethernet/jme.c b/drivers/net/ethernet/jme.c
index 1732ec3c3dbd..1fa89d45be0a 100644
--- a/drivers/net/ethernet/jme.c
+++ b/drivers/net/ethernet/jme.c
@@ -1141,7 +1141,7 @@ jme_dynamic_pcc(struct jme_adapter *jme)
 
 	if (unlikely(dpi->attempt != dpi->cur && dpi->cnt > 5)) {
 		if (dpi->attempt < dpi->cur)
-			tasklet_schedule(&jme->rxclean_task);
+			queue_work(system_bh_wq, &jme->rxclean_task);
 		jme_set_rx_pcc(jme, dpi->attempt);
 		dpi->cur = dpi->attempt;
 		dpi->cnt = 0;
@@ -1182,9 +1182,9 @@ jme_shutdown_nic(struct jme_adapter *jme)
 }
 
 static void
-jme_pcc_tasklet(struct tasklet_struct *t)
+jme_pcc_work(struct work_struct *t)
 {
-	struct jme_adapter *jme = from_tasklet(jme, t, pcc_task);
+	struct jme_adapter *jme = from_work(jme, t, pcc_task);
 	struct net_device *netdev = jme->dev;
 
 	if (unlikely(test_bit(JME_FLAG_SHUTDOWN, &jme->flags))) {
@@ -1282,9 +1282,9 @@ static void jme_link_change_work(struct work_struct *work)
 		jme_stop_shutdown_timer(jme);
 
 	jme_stop_pcc_timer(jme);
-	tasklet_disable(&jme->txclean_task);
-	tasklet_disable(&jme->rxclean_task);
-	tasklet_disable(&jme->rxempty_task);
+	disable_work_sync(&jme->txclean_task);
+	disable_work_sync(&jme->rxclean_task);
+	disable_work_sync(&jme->rxempty_task);
 
 	if (netif_carrier_ok(netdev)) {
 		jme_disable_rx_engine(jme);
@@ -1304,7 +1304,7 @@ static void jme_link_change_work(struct work_struct *work)
 		rc = jme_setup_rx_resources(jme);
 		if (rc) {
 			pr_err("Allocating resources for RX error, Device STOPPED!\n");
-			goto out_enable_tasklet;
+			goto out_enable_work;
 		}
 
 		rc = jme_setup_tx_resources(jme);
@@ -1326,22 +1326,22 @@ static void jme_link_change_work(struct work_struct *work)
 		jme_start_shutdown_timer(jme);
 	}
 
-	goto out_enable_tasklet;
+	goto out_enable_work;
 
 err_out_free_rx_resources:
 	jme_free_rx_resources(jme);
-out_enable_tasklet:
-	tasklet_enable(&jme->txclean_task);
-	tasklet_enable(&jme->rxclean_task);
-	tasklet_enable(&jme->rxempty_task);
+out_enable_work:
+	enable_and_queue_work(system_bh_wq, &jme->txclean_task);
+	enable_and_queue_work(system_bh_wq, &jme->rxclean_task);
+	enable_and_queue_work(system_bh_wq, &jme->rxempty_task);
 out:
 	atomic_inc(&jme->link_changing);
 }
 
 static void
-jme_rx_clean_tasklet(struct tasklet_struct *t)
+jme_rx_clean_work(struct work_struct *t)
 {
-	struct jme_adapter *jme = from_tasklet(jme, t, rxclean_task);
+	struct jme_adapter *jme = from_work(jme, t, rxclean_task);
 	struct dynpcc_info *dpi = &(jme->dpi);
 
 	jme_process_receive(jme, jme->rx_ring_size);
@@ -1374,9 +1374,9 @@ jme_poll(JME_NAPI_HOLDER(holder), JME_NAPI_WEIGHT(budget))
 }
 
 static void
-jme_rx_empty_tasklet(struct tasklet_struct *t)
+jme_rx_empty_work(struct work_struct *t)
 {
-	struct jme_adapter *jme = from_tasklet(jme, t, rxempty_task);
+	struct jme_adapter *jme = from_work(jme, t, rxempty_task);
 
 	if (unlikely(atomic_read(&jme->link_changing) != 1))
 		return;
@@ -1386,7 +1386,7 @@ jme_rx_empty_tasklet(struct tasklet_struct *t)
 
 	netif_info(jme, rx_status, jme->dev, "RX Queue Full!\n");
 
-	jme_rx_clean_tasklet(&jme->rxclean_task);
+	jme_rx_clean_work(&jme->rxclean_task);
 
 	while (atomic_read(&jme->rx_empty) > 0) {
 		atomic_dec(&jme->rx_empty);
@@ -1410,9 +1410,9 @@ jme_wake_queue_if_stopped(struct jme_adapter *jme)
 
 }
 
-static void jme_tx_clean_tasklet(struct tasklet_struct *t)
+static void jme_tx_clean_work(struct work_struct *t)
 {
-	struct jme_adapter *jme = from_tasklet(jme, t, txclean_task);
+	struct jme_adapter *jme = from_work(jme, t, txclean_task);
 	struct jme_ring *txring = &(jme->txring[0]);
 	struct txdesc *txdesc = txring->desc;
 	struct jme_buffer_info *txbi = txring->bufinf, *ctxbi, *ttxbi;
@@ -1510,12 +1510,12 @@ jme_intr_msi(struct jme_adapter *jme, u32 intrstat)
 
 	if (intrstat & INTR_TMINTR) {
 		jwrite32(jme, JME_IEVE, INTR_TMINTR);
-		tasklet_schedule(&jme->pcc_task);
+		queue_work(system_bh_wq, &jme->pcc_task);
 	}
 
 	if (intrstat & (INTR_PCCTXTO | INTR_PCCTX)) {
 		jwrite32(jme, JME_IEVE, INTR_PCCTXTO | INTR_PCCTX | INTR_TX0);
-		tasklet_schedule(&jme->txclean_task);
+		queue_work(system_bh_wq, &jme->txclean_task);
 	}
 
 	if ((intrstat & (INTR_PCCRX0TO | INTR_PCCRX0 | INTR_RX0EMP))) {
@@ -1538,9 +1538,9 @@ jme_intr_msi(struct jme_adapter *jme, u32 intrstat)
 	} else {
 		if (intrstat & INTR_RX0EMP) {
 			atomic_inc(&jme->rx_empty);
-			tasklet_hi_schedule(&jme->rxempty_task);
+			queue_work(system_bh_highpri_wq, &jme->rxempty_task);
 		} else if (intrstat & (INTR_PCCRX0TO | INTR_PCCRX0)) {
-			tasklet_hi_schedule(&jme->rxclean_task);
+			queue_work(system_bh_highpri_wq, &jme->rxclean_task);
 		}
 	}
 
@@ -1826,9 +1826,9 @@ jme_open(struct net_device *netdev)
 	jme_clear_pm_disable_wol(jme);
 	JME_NAPI_ENABLE(jme);
 
-	tasklet_setup(&jme->txclean_task, jme_tx_clean_tasklet);
-	tasklet_setup(&jme->rxclean_task, jme_rx_clean_tasklet);
-	tasklet_setup(&jme->rxempty_task, jme_rx_empty_tasklet);
+	INIT_WORK(&jme->txclean_task, jme_tx_clean_work);
+	INIT_WORK(&jme->rxclean_task, jme_rx_clean_work);
+	INIT_WORK(&jme->rxempty_task, jme_rx_empty_work);
 
 	rc = jme_request_irq(jme);
 	if (rc)
@@ -1914,9 +1914,9 @@ jme_close(struct net_device *netdev)
 	JME_NAPI_DISABLE(jme);
 
 	cancel_work_sync(&jme->linkch_task);
-	tasklet_kill(&jme->txclean_task);
-	tasklet_kill(&jme->rxclean_task);
-	tasklet_kill(&jme->rxempty_task);
+	cancel_work_sync(&jme->txclean_task);
+	cancel_work_sync(&jme->rxclean_task);
+	cancel_work_sync(&jme->rxempty_task);
 
 	jme_disable_rx_engine(jme);
 	jme_disable_tx_engine(jme);
@@ -3020,7 +3020,7 @@ jme_init_one(struct pci_dev *pdev,
 	atomic_set(&jme->tx_cleaning, 1);
 	atomic_set(&jme->rx_empty, 1);
 
-	tasklet_setup(&jme->pcc_task, jme_pcc_tasklet);
+	INIT_WORK(&jme->pcc_task, jme_pcc_work);
 	INIT_WORK(&jme->linkch_task, jme_link_change_work);
 	jme->dpi.cur = PCC_P1;
 
@@ -3180,9 +3180,9 @@ jme_suspend(struct device *dev)
 	netif_stop_queue(netdev);
 	jme_stop_irq(jme);
 
-	tasklet_disable(&jme->txclean_task);
-	tasklet_disable(&jme->rxclean_task);
-	tasklet_disable(&jme->rxempty_task);
+	disable_work_sync(&jme->txclean_task);
+	disable_work_sync(&jme->rxclean_task);
+	disable_work_sync(&jme->rxempty_task);
 
 	if (netif_carrier_ok(netdev)) {
 		if (test_bit(JME_FLAG_POLL, &jme->flags))
@@ -3198,9 +3198,9 @@ jme_suspend(struct device *dev)
 		jme->phylink = 0;
 	}
 
-	tasklet_enable(&jme->txclean_task);
-	tasklet_enable(&jme->rxclean_task);
-	tasklet_enable(&jme->rxempty_task);
+	enable_and_queue_work(system_bh_wq, &jme->txclean_task);
+	enable_and_queue_work(system_bh_wq, &jme->rxclean_task);
+	enable_and_queue_work(system_bh_wq, &jme->rxempty_task);
 
 	jme_powersave_phy(jme);
 
diff --git a/drivers/net/ethernet/jme.h b/drivers/net/ethernet/jme.h
index 860494ff3714..f485258eebab 100644
--- a/drivers/net/ethernet/jme.h
+++ b/drivers/net/ethernet/jme.h
@@ -12,6 +12,7 @@
 #ifndef __JME_H_INCLUDED__
 #define __JME_H_INCLUDED__
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 
 #define DRV_NAME	"jme"
 #define DRV_VERSION	"1.0.8"
@@ -406,11 +407,11 @@ struct jme_adapter {
 	spinlock_t		phy_lock;
 	spinlock_t		macaddr_lock;
 	spinlock_t		rxmcs_lock;
-	struct tasklet_struct	rxempty_task;
-	struct tasklet_struct	rxclean_task;
-	struct tasklet_struct	txclean_task;
+	struct work_struct	rxempty_task;
+	struct work_struct	rxclean_task;
+	struct work_struct	txclean_task;
 	struct work_struct	linkch_task;
-	struct tasklet_struct	pcc_task;
+	struct work_struct	pcc_task;
 	unsigned long		flags;
 	u32			reg_txcs;
 	u32			reg_txpfc;
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 23adf53c2aa1..469312d15e6f 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -2629,7 +2629,7 @@ static u32 mvpp2_txq_desc_csum(int l3_offs, __be16 l3_proto,
  * Per-thread access
  *
  * Called only from mvpp2_txq_done(), called from mvpp2_tx()
- * (migration disabled) and from the TX completion tasklet (migration
+ * (migration disabled) and from the TX completion BH work (migration
  * disabled) so using smp_processor_id() is OK.
  */
 static inline int mvpp2_txq_sent_desc_proc(struct mvpp2_port *port,
diff --git a/drivers/net/ethernet/marvell/skge.c b/drivers/net/ethernet/marvell/skge.c
index 1b43704baceb..337a5350c754 100644
--- a/drivers/net/ethernet/marvell/skge.c
+++ b/drivers/net/ethernet/marvell/skge.c
@@ -3342,13 +3342,13 @@ static void skge_error_irq(struct skge_hw *hw)
 }
 
 /*
- * Interrupt from PHY are handled in tasklet (softirq)
+ * Interrupt from PHY are handled in work (softirq)
  * because accessing phy registers requires spin wait which might
  * cause excess interrupt latency.
  */
-static void skge_extirq(struct tasklet_struct *t)
+static void skge_extirq(struct work_struct *t)
 {
-	struct skge_hw *hw = from_tasklet(hw, t, phy_task);
+	struct skge_hw *hw = from_work(hw, t, phy_task);
 	int port;
 
 	for (port = 0; port < hw->ports; port++) {
@@ -3389,7 +3389,7 @@ static irqreturn_t skge_intr(int irq, void *dev_id)
 	status &= hw->intr_mask;
 	if (status & IS_EXT_REG) {
 		hw->intr_mask &= ~IS_EXT_REG;
-		tasklet_schedule(&hw->phy_task);
+		queue_work(system_bh_wq, &hw->phy_task);
 	}
 
 	if (status & (IS_XA1_F|IS_R1_F)) {
@@ -3937,7 +3937,7 @@ static int skge_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	hw->pdev = pdev;
 	spin_lock_init(&hw->hw_lock);
 	spin_lock_init(&hw->phy_lock);
-	tasklet_setup(&hw->phy_task, skge_extirq);
+	INIT_WORK(&hw->phy_task, skge_extirq);
 
 	hw->regs = ioremap(pci_resource_start(pdev, 0), 0x4000);
 	if (!hw->regs) {
@@ -4035,7 +4035,7 @@ static void skge_remove(struct pci_dev *pdev)
 	dev0 = hw->dev[0];
 	unregister_netdev(dev0);
 
-	tasklet_kill(&hw->phy_task);
+	cancel_work_sync(&hw->phy_task);
 
 	spin_lock_irq(&hw->hw_lock);
 	hw->intr_mask = 0;
diff --git a/drivers/net/ethernet/marvell/skge.h b/drivers/net/ethernet/marvell/skge.h
index f72217348eb4..0e7ce19c692e 100644
--- a/drivers/net/ethernet/marvell/skge.h
+++ b/drivers/net/ethernet/marvell/skge.h
@@ -5,6 +5,7 @@
 #ifndef _SKGE_H
 #define _SKGE_H
 #include <linux/interrupt.h>
+#include <linux/workqueue.h>
 
 /* PCI config registers */
 #define PCI_DEV_REG1	0x40
@@ -2418,7 +2419,7 @@ struct skge_hw {
 	u32	     	     ram_offset;
 	u16		     phy_addr;
 	spinlock_t	     phy_lock;
-	struct tasklet_struct phy_task;
+	struct work_struct phy_task;
 
 	char		     irq_name[]; /* skge@pci:000:04:00.0 */
 };
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 7063c78bd35f..93b6f6fba933 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -71,7 +71,7 @@ static void
 mtk_wed_wo_irq_enable(struct mtk_wed_wo *wo, u32 mask)
 {
 	mtk_wed_wo_set_isr_mask(wo, 0, mask, false);
-	tasklet_schedule(&wo->mmio.irq_tasklet);
+	queue_work(system_bh_wq, &wo->mmio.irq_work);
 }
 
 static void
@@ -227,14 +227,14 @@ mtk_wed_wo_irq_handler(int irq, void *data)
 	struct mtk_wed_wo *wo = data;
 
 	mtk_wed_wo_set_isr(wo, 0);
-	tasklet_schedule(&wo->mmio.irq_tasklet);
+	queue_work(system_bh_wq, &wo->mmio.irq_work);
 
 	return IRQ_HANDLED;
 }
 
-static void mtk_wed_wo_irq_tasklet(struct tasklet_struct *t)
+static void mtk_wed_wo_irq_work(struct work_struct *t)
 {
-	struct mtk_wed_wo *wo = from_tasklet(wo, t, mmio.irq_tasklet);
+	struct mtk_wed_wo *wo = from_work(wo, t, mmio.irq_work);
 	u32 intr, mask;
 
 	/* disable interrupts */
@@ -395,7 +395,7 @@ mtk_wed_wo_hardware_init(struct mtk_wed_wo *wo)
 	wo->mmio.irq = irq_of_parse_and_map(np, 0);
 	wo->mmio.irq_mask = MTK_WED_WO_ALL_INT_MASK;
 	spin_lock_init(&wo->mmio.lock);
-	tasklet_setup(&wo->mmio.irq_tasklet, mtk_wed_wo_irq_tasklet);
+	INIT_WORK(&wo->mmio.irq_work, mtk_wed_wo_irq_work);
 
 	ret = devm_request_irq(wo->hw->dev, wo->mmio.irq,
 			       mtk_wed_wo_irq_handler, IRQF_TRIGGER_HIGH,
@@ -449,7 +449,7 @@ mtk_wed_wo_hw_deinit(struct mtk_wed_wo *wo)
 	/* disable interrupts */
 	mtk_wed_wo_set_isr(wo, 0);
 
-	tasklet_disable(&wo->mmio.irq_tasklet);
+	disable_work_sync(&wo->mmio.irq_work);
 
 	disable_irq(wo->mmio.irq);
 	devm_free_irq(wo->hw->dev, wo->mmio.irq, wo);
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.h b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
index 87a67fa3868d..d8e4cf594317 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.h
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.h
@@ -6,6 +6,7 @@
 
 #include <linux/skbuff.h>
 #include <linux/netdevice.h>
+#include <linux/workqueue.h>
 
 struct mtk_wed_hw;
 
@@ -247,7 +248,7 @@ struct mtk_wed_wo {
 		struct regmap *regs;
 
 		spinlock_t lock;
-		struct tasklet_struct irq_tasklet;
+		struct work_struct irq_work;
 		int irq;
 		u32 irq_mask;
 	} mmio;
diff --git a/drivers/net/ethernet/mellanox/mlx4/cq.c b/drivers/net/ethernet/mellanox/mlx4/cq.c
index e130e7259275..0427fddd506a 100644
--- a/drivers/net/ethernet/mellanox/mlx4/cq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/cq.c
@@ -52,23 +52,23 @@
 #define MLX4_CQ_STATE_ARMED_SOL		( 6 <<  8)
 #define MLX4_EQ_STATE_FIRED		(10 <<  8)
 
-#define TASKLET_MAX_TIME 2
-#define TASKLET_MAX_TIME_JIFFIES msecs_to_jiffies(TASKLET_MAX_TIME)
+#define BH_WORK_MAX_TIME 2
+#define BH_WORK_MAX_TIME_JIFFIES msecs_to_jiffies(BH_WORK_MAX_TIME)
 
-void mlx4_cq_tasklet_cb(struct tasklet_struct *t)
+void mlx4_cq_work_cb(struct work_struct *t)
 {
 	unsigned long flags;
-	unsigned long end = jiffies + TASKLET_MAX_TIME_JIFFIES;
-	struct mlx4_eq_tasklet *ctx = from_tasklet(ctx, t, task);
+	unsigned long end = jiffies + BH_WORK_MAX_TIME_JIFFIES;
+	struct mlx4_eq_work *ctx = from_work(ctx, t, work);
 	struct mlx4_cq *mcq, *temp;
 
 	spin_lock_irqsave(&ctx->lock, flags);
 	list_splice_tail_init(&ctx->list, &ctx->process_list);
 	spin_unlock_irqrestore(&ctx->lock, flags);
 
-	list_for_each_entry_safe(mcq, temp, &ctx->process_list, tasklet_ctx.list) {
-		list_del_init(&mcq->tasklet_ctx.list);
-		mcq->tasklet_ctx.comp(mcq);
+	list_for_each_entry_safe(mcq, temp, &ctx->process_list, work_ctx.list) {
+		list_del_init(&mcq->work_ctx.list);
+		mcq->work_ctx.comp(mcq);
 		if (refcount_dec_and_test(&mcq->refcount))
 			complete(&mcq->free);
 		if (time_after(jiffies, end))
@@ -76,29 +76,29 @@ void mlx4_cq_tasklet_cb(struct tasklet_struct *t)
 	}
 
 	if (!list_empty(&ctx->process_list))
-		tasklet_schedule(&ctx->task);
+		queue_work(system_bh_wq, &ctx->work);
 }
 
-static void mlx4_add_cq_to_tasklet(struct mlx4_cq *cq)
+static void mlx4_add_cq_to_work(struct mlx4_cq *cq)
 {
-	struct mlx4_eq_tasklet *tasklet_ctx = cq->tasklet_ctx.priv;
+	struct mlx4_eq_work *work_ctx = cq->work_ctx.priv;
 	unsigned long flags;
 	bool kick;
 
-	spin_lock_irqsave(&tasklet_ctx->lock, flags);
+	spin_lock_irqsave(&work_ctx->lock, flags);
 	/* When migrating CQs between EQs will be implemented, please note
 	 * that you need to sync this point. It is possible that
 	 * while migrating a CQ, completions on the old EQs could
 	 * still arrive.
 	 */
-	if (list_empty_careful(&cq->tasklet_ctx.list)) {
+	if (list_empty_careful(&cq->work_ctx.list)) {
 		refcount_inc(&cq->refcount);
-		kick = list_empty(&tasklet_ctx->list);
-		list_add_tail(&cq->tasklet_ctx.list, &tasklet_ctx->list);
+		kick = list_empty(&work_ctx->list);
+		list_add_tail(&cq->work_ctx.list, &work_ctx->list);
 		if (kick)
-			tasklet_schedule(&tasklet_ctx->task);
+			queue_work(system_bh_wq, &work_ctx->work);
 	}
-	spin_unlock_irqrestore(&tasklet_ctx->lock, flags);
+	spin_unlock_irqrestore(&work_ctx->lock, flags);
 }
 
 void mlx4_cq_completion(struct mlx4_dev *dev, u32 cqn)
@@ -412,10 +412,10 @@ int mlx4_cq_alloc(struct mlx4_dev *dev, int nent,
 	cq->uar        = uar;
 	refcount_set(&cq->refcount, 1);
 	init_completion(&cq->free);
-	cq->comp = mlx4_add_cq_to_tasklet;
-	cq->tasklet_ctx.priv =
-		&priv->eq_table.eq[MLX4_CQ_TO_EQ_VECTOR(vector)].tasklet_ctx;
-	INIT_LIST_HEAD(&cq->tasklet_ctx.list);
+	cq->comp = mlx4_add_cq_to_work;
+	cq->work_ctx.priv =
+		&priv->eq_table.eq[MLX4_CQ_TO_EQ_VECTOR(vector)].work_ctx;
+	INIT_LIST_HEAD(&cq->work_ctx.list);
 
 
 	cq->irq = priv->eq_table.eq[MLX4_CQ_TO_EQ_VECTOR(vector)].irq;
diff --git a/drivers/net/ethernet/mellanox/mlx4/eq.c b/drivers/net/ethernet/mellanox/mlx4/eq.c
index 9572a45f6143..ca67bb2ffc41 100644
--- a/drivers/net/ethernet/mellanox/mlx4/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx4/eq.c
@@ -1055,10 +1055,10 @@ static int mlx4_create_eq(struct mlx4_dev *dev, int nent,
 
 	eq->cons_index = 0;
 
-	INIT_LIST_HEAD(&eq->tasklet_ctx.list);
-	INIT_LIST_HEAD(&eq->tasklet_ctx.process_list);
-	spin_lock_init(&eq->tasklet_ctx.lock);
-	tasklet_setup(&eq->tasklet_ctx.task, mlx4_cq_tasklet_cb);
+	INIT_LIST_HEAD(&eq->work_ctx.list);
+	INIT_LIST_HEAD(&eq->work_ctx.process_list);
+	spin_lock_init(&eq->work_ctx.lock);
+	INIT_WORK(&eq->work_ctx.work, mlx4_cq_work_cb);
 
 	return err;
 
@@ -1101,7 +1101,7 @@ static void mlx4_free_eq(struct mlx4_dev *dev,
 		mlx4_warn(dev, "HW2SW_EQ failed (%d)\n", err);
 
 	synchronize_irq(eq->irq);
-	tasklet_disable(&eq->tasklet_ctx.task);
+	disable_work_sync(&eq->work_ctx.work);
 
 	mlx4_mtt_cleanup(dev, &eq->mtt);
 	for (i = 0; i < npages; ++i)
diff --git a/drivers/net/ethernet/mellanox/mlx4/mlx4.h b/drivers/net/ethernet/mellanox/mlx4/mlx4.h
index d7d856d1758a..f0029f68b5d3 100644
--- a/drivers/net/ethernet/mellanox/mlx4/mlx4.h
+++ b/drivers/net/ethernet/mellanox/mlx4/mlx4.h
@@ -54,6 +54,7 @@
 #include <linux/mlx4/driver.h>
 #include <linux/mlx4/doorbell.h>
 #include <linux/mlx4/cmd.h>
+#include <linux/workqueue.h>
 #include "fw_qos.h"
 
 #define DRV_NAME	"mlx4_core"
@@ -382,11 +383,11 @@ struct mlx4_srq_context {
 	__be64			db_rec_addr;
 };
 
-struct mlx4_eq_tasklet {
+struct mlx4_eq_work {
 	struct list_head list;
 	struct list_head process_list;
-	struct tasklet_struct task;
-	/* lock on completion tasklet list */
+	struct work_struct work;
+	/* lock on completion work list */
 	spinlock_t lock;
 };
 
@@ -400,7 +401,7 @@ struct mlx4_eq {
 	int			nent;
 	struct mlx4_buf_list   *page_list;
 	struct mlx4_mtt		mtt;
-	struct mlx4_eq_tasklet	tasklet_ctx;
+	struct mlx4_eq_work	work_ctx;
 	struct mlx4_active_ports actv_ports;
 	u32			ref_count;
 	cpumask_var_t		affinity_mask;
@@ -1228,7 +1229,7 @@ void mlx4_cmd_use_polling(struct mlx4_dev *dev);
 int mlx4_comm_cmd(struct mlx4_dev *dev, u8 cmd, u16 param,
 		  u16 op, unsigned long timeout);
 
-void mlx4_cq_tasklet_cb(struct tasklet_struct *t);
+void mlx4_cq_work_cb(struct work_struct *t);
 void mlx4_cq_completion(struct mlx4_dev *dev, u32 cqn);
 void mlx4_cq_event(struct mlx4_dev *dev, u32 cqn, int event_type);
 
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/cq.c b/drivers/net/ethernet/mellanox/mlx5/core/cq.c
index 4caa1b6f40ba..78ad929d5270 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/cq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/cq.c
@@ -38,14 +38,14 @@
 #include "mlx5_core.h"
 #include "lib/eq.h"
 
-#define TASKLET_MAX_TIME 2
-#define TASKLET_MAX_TIME_JIFFIES msecs_to_jiffies(TASKLET_MAX_TIME)
+#define BH_WORK_MAX_TIME 2
+#define BH_WORK_MAX_TIME_JIFFIES msecs_to_jiffies(BH_WORK_MAX_TIME)
 
-void mlx5_cq_tasklet_cb(struct tasklet_struct *t)
+void mlx5_cq_work_cb(struct work_struct *t)
 {
 	unsigned long flags;
-	unsigned long end = jiffies + TASKLET_MAX_TIME_JIFFIES;
-	struct mlx5_eq_tasklet *ctx = from_tasklet(ctx, t, task);
+	unsigned long end = jiffies + BH_WORK_MAX_TIME_JIFFIES;
+	struct mlx5_eq_work *ctx = from_work(ctx, t, work);
 	struct mlx5_core_cq *mcq;
 	struct mlx5_core_cq *temp;
 
@@ -54,35 +54,35 @@ void mlx5_cq_tasklet_cb(struct tasklet_struct *t)
 	spin_unlock_irqrestore(&ctx->lock, flags);
 
 	list_for_each_entry_safe(mcq, temp, &ctx->process_list,
-				 tasklet_ctx.list) {
-		list_del_init(&mcq->tasklet_ctx.list);
-		mcq->tasklet_ctx.comp(mcq, NULL);
+				 work_ctx.list) {
+		list_del_init(&mcq->work_ctx.list);
+		mcq->work_ctx.comp(mcq, NULL);
 		mlx5_cq_put(mcq);
 		if (time_after(jiffies, end))
 			break;
 	}
 
 	if (!list_empty(&ctx->process_list))
-		tasklet_schedule(&ctx->task);
+		queue_work(system_bh_wq, &ctx->work);
 }
 
-static void mlx5_add_cq_to_tasklet(struct mlx5_core_cq *cq,
-				   struct mlx5_eqe *eqe)
+static void mlx5_add_cq_to_work(struct mlx5_core_cq *cq,
+				struct mlx5_eqe *eqe)
 {
 	unsigned long flags;
-	struct mlx5_eq_tasklet *tasklet_ctx = cq->tasklet_ctx.priv;
+	struct mlx5_eq_work *work_ctx = cq->work_ctx.priv;
 
-	spin_lock_irqsave(&tasklet_ctx->lock, flags);
+	spin_lock_irqsave(&work_ctx->lock, flags);
 	/* When migrating CQs between EQs will be implemented, please note
 	 * that you need to sync this point. It is possible that
 	 * while migrating a CQ, completions on the old EQs could
 	 * still arrive.
 	 */
-	if (list_empty_careful(&cq->tasklet_ctx.list)) {
+	if (list_empty_careful(&cq->work_ctx.list)) {
 		mlx5_cq_hold(cq);
-		list_add_tail(&cq->tasklet_ctx.list, &tasklet_ctx->list);
+		list_add_tail(&cq->work_ctx.list, &work_ctx->list);
 	}
-	spin_unlock_irqrestore(&tasklet_ctx->lock, flags);
+	spin_unlock_irqrestore(&work_ctx->lock, flags);
 }
 
 /* Callers must verify outbox status in case of err */
@@ -113,10 +113,10 @@ int mlx5_create_cq(struct mlx5_core_dev *dev, struct mlx5_core_cq *cq,
 	refcount_set(&cq->refcount, 1);
 	init_completion(&cq->free);
 	if (!cq->comp)
-		cq->comp = mlx5_add_cq_to_tasklet;
+		cq->comp = mlx5_add_cq_to_work;
 	/* assuming CQ will be deleted before the EQ */
-	cq->tasklet_ctx.priv = &eq->tasklet_ctx;
-	INIT_LIST_HEAD(&cq->tasklet_ctx.list);
+	cq->work_ctx.priv = &eq->work_ctx;
+	INIT_LIST_HEAD(&cq->work_ctx.list);
 
 	/* Add to comp EQ CQ tree to recv comp events */
 	err = mlx5_eq_add_cq(&eq->core, cq);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/eq.c b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
index 40a6cb052a2d..f5bb666f609a 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/eq.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/eq.c
@@ -148,7 +148,7 @@ static int mlx5_eq_comp_int(struct notifier_block *nb,
 	eq_update_ci(eq, 1);
 
 	if (cqn != -1)
-		tasklet_schedule(&eq_comp->tasklet_ctx.task);
+		queue_work(system_bh_wq, &eq_comp->work_ctx.work);
 
 	return 0;
 }
@@ -979,7 +979,7 @@ static void destroy_comp_eq(struct mlx5_core_dev *dev, struct mlx5_eq_comp *eq,
 	if (destroy_unmap_eq(dev, &eq->core))
 		mlx5_core_warn(dev, "failed to destroy comp EQ 0x%x\n",
 			       eq->core.eqn);
-	tasklet_disable(&eq->tasklet_ctx.task);
+	disable_work_sync(&eq->work_ctx.work);
 	kfree(eq);
 	comp_irq_release(dev, vecidx);
 	table->curr_comp_eqs--;
@@ -1029,10 +1029,10 @@ static int create_comp_eq(struct mlx5_core_dev *dev, u16 vecidx)
 		goto clean_irq;
 	}
 
-	INIT_LIST_HEAD(&eq->tasklet_ctx.list);
-	INIT_LIST_HEAD(&eq->tasklet_ctx.process_list);
-	spin_lock_init(&eq->tasklet_ctx.lock);
-	tasklet_setup(&eq->tasklet_ctx.task, mlx5_cq_tasklet_cb);
+	INIT_LIST_HEAD(&eq->work_ctx.list);
+	INIT_LIST_HEAD(&eq->work_ctx.process_list);
+	spin_lock_init(&eq->work_ctx.lock);
+	INIT_WORK(&eq->work_ctx.work, mlx5_cq_work_cb);
 
 	irq = xa_load(&table->comp_irqs, vecidx);
 	eq->irq_nb.notifier_call = mlx5_eq_comp_int;
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c b/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c
index c4de6bf8d1b6..fe3edfac2b70 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.c
@@ -34,6 +34,7 @@
 #include <net/addrconf.h>
 #include <linux/etherdevice.h>
 #include <linux/mlx5/vport.h>
+#include <linux/workqueue.h>
 
 #include "mlx5_core.h"
 #include "lib/mlx5.h"
@@ -378,7 +379,7 @@ static inline void mlx5_fpga_conn_cqes(struct mlx5_fpga_conn *conn,
 		mlx5_cqwq_update_db_record(&conn->cq.wq);
 	}
 	if (!budget) {
-		tasklet_schedule(&conn->cq.tasklet);
+		queue_work(system_bh_wq, &conn->cq.work);
 		return;
 	}
 
@@ -388,9 +389,9 @@ static inline void mlx5_fpga_conn_cqes(struct mlx5_fpga_conn *conn,
 	mlx5_fpga_conn_arm_cq(conn);
 }
 
-static void mlx5_fpga_conn_cq_tasklet(struct tasklet_struct *t)
+static void mlx5_fpga_conn_cq_work(struct work_struct *t)
 {
-	struct mlx5_fpga_conn *conn = from_tasklet(conn, t, cq.tasklet);
+	struct mlx5_fpga_conn *conn = from_work(conn, t, cq.work);
 
 	if (unlikely(!conn->qp.active))
 		return;
@@ -476,7 +477,7 @@ static int mlx5_fpga_conn_create_cq(struct mlx5_fpga_conn *conn, int cq_size)
 	conn->cq.mcq.vector     = 0;
 	conn->cq.mcq.comp       = mlx5_fpga_conn_cq_complete;
 	conn->cq.mcq.uar        = fdev->conn_res.uar;
-	tasklet_setup(&conn->cq.tasklet, mlx5_fpga_conn_cq_tasklet);
+	INIT_WORK(&conn->cq.work, mlx5_fpga_conn_cq_work);
 
 	mlx5_fpga_dbg(fdev, "Created CQ #0x%x\n", conn->cq.mcq.cqn);
 
@@ -490,8 +491,8 @@ static int mlx5_fpga_conn_create_cq(struct mlx5_fpga_conn *conn, int cq_size)
 
 static void mlx5_fpga_conn_destroy_cq(struct mlx5_fpga_conn *conn)
 {
-	tasklet_disable(&conn->cq.tasklet);
-	tasklet_kill(&conn->cq.tasklet);
+	disable_work_sync(&conn->cq.work);
+	cancel_work_sync(&conn->cq.work);
 	mlx5_core_destroy_cq(conn->fdev->mdev, &conn->cq.mcq);
 	mlx5_wq_destroy(&conn->cq.wq_ctrl);
 }
@@ -933,7 +934,7 @@ struct mlx5_fpga_conn *mlx5_fpga_conn_create(struct mlx5_fpga_device *fdev,
 void mlx5_fpga_conn_destroy(struct mlx5_fpga_conn *conn)
 {
 	conn->qp.active = false;
-	tasklet_disable(&conn->cq.tasklet);
+	disable_work_sync(&conn->cq.work);
 	synchronize_irq(conn->cq.mcq.irqn);
 
 	mlx5_fpga_destroy_qp(conn->fdev->mdev, conn->fpga_qpn);
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.h b/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.h
index 5116e869a6e4..cb76cd681a4b 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/fpga/conn.h
@@ -36,6 +36,7 @@
 
 #include <linux/mlx5/cq.h>
 #include <linux/mlx5/qp.h>
+#include <linux/workqueue.h>
 
 #include "fpga/core.h"
 #include "fpga/sdk.h"
@@ -56,7 +57,7 @@ struct mlx5_fpga_conn {
 		struct mlx5_cqwq wq;
 		struct mlx5_wq_ctrl wq_ctrl;
 		struct mlx5_core_cq mcq;
-		struct tasklet_struct tasklet;
+		struct work_struct work;
 	} cq;
 
 	/* QP */
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h b/drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h
index 4b7f7131c560..1ec59452b784 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h
+++ b/drivers/net/ethernet/mellanox/mlx5/core/lib/eq.h
@@ -6,14 +6,15 @@
 #include <linux/mlx5/driver.h>
 #include <linux/mlx5/eq.h>
 #include <linux/mlx5/cq.h>
+#include <linux/workqueue.h>
 
 #define MLX5_EQE_SIZE       (sizeof(struct mlx5_eqe))
 
-struct mlx5_eq_tasklet {
+struct mlx5_eq_work {
 	struct list_head      list;
 	struct list_head      process_list;
-	struct tasklet_struct task;
-	spinlock_t            lock; /* lock completion tasklet list */
+	struct work_struct work;
+	spinlock_t            lock; /* lock completion work list */
 };
 
 struct mlx5_cq_table {
@@ -44,7 +45,7 @@ struct mlx5_eq_async {
 struct mlx5_eq_comp {
 	struct mlx5_eq          core;
 	struct notifier_block   irq_nb;
-	struct mlx5_eq_tasklet  tasklet_ctx;
+	struct mlx5_eq_work  work_ctx;
 	struct list_head        list;
 };
 
@@ -84,7 +85,7 @@ int mlx5_eq_add_cq(struct mlx5_eq *eq, struct mlx5_core_cq *cq);
 void mlx5_eq_del_cq(struct mlx5_eq *eq, struct mlx5_core_cq *cq);
 struct mlx5_eq_comp *mlx5_eqn2comp_eq(struct mlx5_core_dev *dev, int eqn);
 struct mlx5_eq *mlx5_get_async_eq(struct mlx5_core_dev *dev);
-void mlx5_cq_tasklet_cb(struct tasklet_struct *t);
+void mlx5_cq_work_cb(struct work_struct *t);
 
 u32 mlx5_eq_poll_irq_disabled(struct mlx5_eq_comp *eq);
 void mlx5_cmd_eq_recover(struct mlx5_core_dev *dev);
diff --git a/drivers/net/ethernet/mellanox/mlxsw/pci.c b/drivers/net/ethernet/mellanox/mlxsw/pci.c
index af99bf17eb36..3e652a3c3bfa 100644
--- a/drivers/net/ethernet/mellanox/mlxsw/pci.c
+++ b/drivers/net/ethernet/mellanox/mlxsw/pci.c
@@ -14,6 +14,7 @@
 #include <linux/if_vlan.h>
 #include <linux/log2.h>
 #include <linux/string.h>
+#include <linux/workqueue.h>
 
 #include "pci_hw.h"
 #include "pci.h"
@@ -78,7 +79,7 @@ struct mlxsw_pci_queue {
 	u8 num; /* queue number */
 	u8 elem_size; /* size of one element */
 	enum mlxsw_pci_queue_type type;
-	struct tasklet_struct tasklet; /* queue processing tasklet */
+	struct work_struct work; /* queue processing work */
 	struct mlxsw_pci *pci;
 	union {
 		struct {
@@ -135,9 +136,9 @@ struct mlxsw_pci {
 	bool skip_reset;
 };
 
-static void mlxsw_pci_queue_tasklet_schedule(struct mlxsw_pci_queue *q)
+static void mlxsw_pci_queue_work(struct mlxsw_pci_queue *q)
 {
-	tasklet_schedule(&q->tasklet);
+	queue_work(system_bh_wq, &q->work);
 }
 
 static char *__mlxsw_pci_queue_elem_get(struct mlxsw_pci_queue *q,
@@ -714,9 +715,9 @@ static char *mlxsw_pci_cq_sw_cqe_get(struct mlxsw_pci_queue *q)
 	return elem;
 }
 
-static void mlxsw_pci_cq_tasklet(struct tasklet_struct *t)
+static void mlxsw_pci_cq_work(struct work_struct *t)
 {
-	struct mlxsw_pci_queue *q = from_tasklet(q, t, tasklet);
+	struct mlxsw_pci_queue *q = from_work(q, t, work);
 	struct mlxsw_pci *mlxsw_pci = q->pci;
 	char *cqe;
 	int items = 0;
@@ -827,9 +828,9 @@ static char *mlxsw_pci_eq_sw_eqe_get(struct mlxsw_pci_queue *q)
 	return elem;
 }
 
-static void mlxsw_pci_eq_tasklet(struct tasklet_struct *t)
+static void mlxsw_pci_eq_work(struct work_struct *t)
 {
-	struct mlxsw_pci_queue *q = from_tasklet(q, t, tasklet);
+	struct mlxsw_pci_queue *q = from_work(q, t, work);
 	struct mlxsw_pci *mlxsw_pci = q->pci;
 	u8 cq_count = mlxsw_pci_cq_count(mlxsw_pci);
 	unsigned long active_cqns[BITS_TO_LONGS(MLXSW_PCI_CQS_MAX)];
@@ -873,7 +874,7 @@ static void mlxsw_pci_eq_tasklet(struct tasklet_struct *t)
 		return;
 	for_each_set_bit(cqn, active_cqns, cq_count) {
 		q = mlxsw_pci_cq_get(mlxsw_pci, cqn);
-		mlxsw_pci_queue_tasklet_schedule(q);
+		mlxsw_pci_queue_work(q);
 	}
 }
 
@@ -886,7 +887,7 @@ struct mlxsw_pci_queue_ops {
 		    struct mlxsw_pci_queue *q);
 	void (*fini)(struct mlxsw_pci *mlxsw_pci,
 		     struct mlxsw_pci_queue *q);
-	void (*tasklet)(struct tasklet_struct *t);
+	void (*work)(struct work_struct *t);
 	u16 (*elem_count_f)(const struct mlxsw_pci_queue *q);
 	u8 (*elem_size_f)(const struct mlxsw_pci_queue *q);
 	u16 elem_count;
@@ -914,7 +915,7 @@ static const struct mlxsw_pci_queue_ops mlxsw_pci_cq_ops = {
 	.pre_init	= mlxsw_pci_cq_pre_init,
 	.init		= mlxsw_pci_cq_init,
 	.fini		= mlxsw_pci_cq_fini,
-	.tasklet	= mlxsw_pci_cq_tasklet,
+	.work	= mlxsw_pci_cq_work,
 	.elem_count_f	= mlxsw_pci_cq_elem_count,
 	.elem_size_f	= mlxsw_pci_cq_elem_size
 };
@@ -923,7 +924,7 @@ static const struct mlxsw_pci_queue_ops mlxsw_pci_eq_ops = {
 	.type		= MLXSW_PCI_QUEUE_TYPE_EQ,
 	.init		= mlxsw_pci_eq_init,
 	.fini		= mlxsw_pci_eq_fini,
-	.tasklet	= mlxsw_pci_eq_tasklet,
+	.work	= mlxsw_pci_eq_work,
 	.elem_count	= MLXSW_PCI_EQE_COUNT,
 	.elem_size	= MLXSW_PCI_EQE_SIZE
 };
@@ -948,8 +949,8 @@ static int mlxsw_pci_queue_init(struct mlxsw_pci *mlxsw_pci, char *mbox,
 	q->type = q_ops->type;
 	q->pci = mlxsw_pci;
 
-	if (q_ops->tasklet)
-		tasklet_setup(&q->tasklet, q_ops->tasklet);
+	if (q_ops->work)
+		INIT_WORK(&q->work, q_ops->work);
 
 	mem_item->size = MLXSW_PCI_AQ_SIZE;
 	mem_item->buf = dma_alloc_coherent(&mlxsw_pci->pdev->dev,
@@ -1436,7 +1437,7 @@ static irqreturn_t mlxsw_pci_eq_irq_handler(int irq, void *dev_id)
 
 	for (i = 0; i < MLXSW_PCI_EQS_COUNT; i++) {
 		q = mlxsw_pci_eq_get(mlxsw_pci, i);
-		mlxsw_pci_queue_tasklet_schedule(q);
+		mlxsw_pci_queue_work(q);
 	}
 	return IRQ_HANDLED;
 }
diff --git a/drivers/net/ethernet/micrel/ks8842.c b/drivers/net/ethernet/micrel/ks8842.c
index ddd87ef71caf..c88209d8f569 100644
--- a/drivers/net/ethernet/micrel/ks8842.c
+++ b/drivers/net/ethernet/micrel/ks8842.c
@@ -22,6 +22,7 @@
 #include <linux/dmaengine.h>
 #include <linux/dma-mapping.h>
 #include <linux/scatterlist.h>
+#include <linux/workqueue.h>
 
 #define DRV_NAME "ks8842"
 
@@ -140,7 +141,7 @@ struct ks8842_rx_dma_ctl {
 	struct dma_async_tx_descriptor *adesc;
 	struct sk_buff  *skb;
 	struct scatterlist sg;
-	struct tasklet_struct tasklet;
+	struct work_struct work;
 	int channel;
 };
 
@@ -151,7 +152,7 @@ struct ks8842_adapter {
 	void __iomem	*hw_addr;
 	int		irq;
 	unsigned long	conf_flags;	/* copy of platform_device config */
-	struct tasklet_struct	tasklet;
+	struct work_struct	work;
 	spinlock_t	lock; /* spinlock to be interrupt safe */
 	struct work_struct timeout_work;
 	struct net_device *netdev;
@@ -589,9 +590,9 @@ static int __ks8842_start_new_rx_dma(struct net_device *netdev)
 	return err;
 }
 
-static void ks8842_rx_frame_dma_tasklet(struct tasklet_struct *t)
+static void ks8842_rx_frame_dma_work(struct work_struct *t)
 {
-	struct ks8842_adapter *adapter = from_tasklet(adapter, t, dma_rx.tasklet);
+	struct ks8842_adapter *adapter = from_work(adapter, t, dma_rx.work);
 	struct net_device *netdev = adapter->netdev;
 	struct ks8842_rx_dma_ctl *ctl = &adapter->dma_rx;
 	struct sk_buff *skb = ctl->skb;
@@ -722,9 +723,9 @@ static void ks8842_handle_rx_overrun(struct net_device *netdev,
 	netdev->stats.rx_fifo_errors++;
 }
 
-static void ks8842_tasklet(struct tasklet_struct *t)
+static void ks8842_work(struct work_struct *t)
 {
-	struct ks8842_adapter *adapter = from_tasklet(adapter, t, tasklet);
+	struct ks8842_adapter *adapter = from_work(adapter, t, work);
 	struct net_device *netdev = adapter->netdev;
 	u16 isr;
 	unsigned long flags;
@@ -813,8 +814,8 @@ static irqreturn_t ks8842_irq(int irq, void *devid)
 			/* disable IRQ */
 			ks8842_write16(adapter, 18, 0x00, REG_IER);
 
-		/* schedule tasklet */
-		tasklet_schedule(&adapter->tasklet);
+		/* schedule work */
+		queue_work(system_bh_wq, &adapter->work);
 
 		ret = IRQ_HANDLED;
 	}
@@ -835,9 +836,9 @@ static void ks8842_dma_rx_cb(void *data)
 	struct ks8842_adapter	*adapter = netdev_priv(netdev);
 
 	netdev_dbg(netdev, "RX DMA finished\n");
-	/* schedule tasklet */
+	/* schedule work */
 	if (adapter->dma_rx.adesc)
-		tasklet_schedule(&adapter->dma_rx.tasklet);
+		queue_work(system_bh_wq, &adapter->dma_rx.work);
 }
 
 static void ks8842_dma_tx_cb(void *data)
@@ -895,7 +896,7 @@ static void ks8842_dealloc_dma_bufs(struct ks8842_adapter *adapter)
 		dma_release_channel(rx_ctl->chan);
 	rx_ctl->chan = NULL;
 
-	tasklet_kill(&rx_ctl->tasklet);
+	cancel_work_sync(&rx_ctl->work);
 
 	if (sg_dma_address(&tx_ctl->sg))
 		dma_unmap_single(adapter->dev, sg_dma_address(&tx_ctl->sg),
@@ -955,7 +956,7 @@ static int ks8842_alloc_dma_bufs(struct net_device *netdev)
 		goto err;
 	}
 
-	tasklet_setup(&rx_ctl->tasklet, ks8842_rx_frame_dma_tasklet);
+	INIT_WORK(&rx_ctl->work, ks8842_rx_frame_dma_work);
 
 	return 0;
 err:
@@ -1178,7 +1179,7 @@ static int ks8842_probe(struct platform_device *pdev)
 		adapter->dma_tx.channel = -1;
 	}
 
-	tasklet_setup(&adapter->tasklet, ks8842_tasklet);
+	INIT_WORK(&adapter->work, ks8842_work);
 	spin_lock_init(&adapter->lock);
 
 	netdev->netdev_ops = &ks8842_netdev_ops;
@@ -1235,7 +1236,7 @@ static void ks8842_remove(struct platform_device *pdev)
 	struct resource *iomem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 
 	unregister_netdev(netdev);
-	tasklet_kill(&adapter->tasklet);
+	cancel_work_sync(&adapter->work);
 	iounmap(adapter->hw_addr);
 	free_netdev(netdev);
 	release_mem_region(iomem->start, resource_size(iomem));
diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index c5aeeb964c17..978d220ea6ec 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -26,6 +26,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/micrel_phy.h>
+#include <linux/workqueue.h>
 
 
 /* DMA Registers */
@@ -1339,8 +1340,8 @@ struct ksz_counter_info {
  * @mtu:		Current MTU used.  The default is REGULAR_RX_BUF_SIZE;
  * 			the maximum is MAX_RX_BUF_SIZE.
  * @opened:		Counter to keep track of device open.
- * @rx_tasklet:		Receive processing tasklet.
- * @tx_tasklet:		Transmit processing tasklet.
+ * @rx_work:		Receive processing work.
+ * @tx_work:		Transmit processing work.
  * @wol_enable:		Wake-on-LAN enable set by ethtool.
  * @wol_support:	Wake-on-LAN support used by ethtool.
  * @pme_wait:		Used for KSZ8841 power management.
@@ -1368,8 +1369,8 @@ struct dev_info {
 	int mtu;
 	int opened;
 
-	struct tasklet_struct rx_tasklet;
-	struct tasklet_struct tx_tasklet;
+	struct work_struct rx_work;
+	struct work_struct tx_work;
 
 	int wol_enable;
 	int wol_support;
@@ -4792,9 +4793,9 @@ static int dev_rcv_special(struct dev_info *hw_priv)
 	return received;
 }
 
-static void rx_proc_task(struct tasklet_struct *t)
+static void rx_proc_task(struct work_struct *t)
 {
-	struct dev_info *hw_priv = from_tasklet(hw_priv, t, rx_tasklet);
+	struct dev_info *hw_priv = from_work(hw_priv, t, rx_work);
 	struct ksz_hw *hw = &hw_priv->hw;
 
 	if (!hw->enabled)
@@ -4804,26 +4805,26 @@ static void rx_proc_task(struct tasklet_struct *t)
 		/* In case receive process is suspended because of overrun. */
 		hw_resume_rx(hw);
 
-		/* tasklets are interruptible. */
+		/* works are interruptible. */
 		spin_lock_irq(&hw_priv->hwlock);
 		hw_turn_on_intr(hw, KS884X_INT_RX_MASK);
 		spin_unlock_irq(&hw_priv->hwlock);
 	} else {
 		hw_ack_intr(hw, KS884X_INT_RX);
-		tasklet_schedule(&hw_priv->rx_tasklet);
+		queue_work(system_bh_wq, &hw_priv->rx_work);
 	}
 }
 
-static void tx_proc_task(struct tasklet_struct *t)
+static void tx_proc_task(struct work_struct *t)
 {
-	struct dev_info *hw_priv = from_tasklet(hw_priv, t, tx_tasklet);
+	struct dev_info *hw_priv = from_work(hw_priv, t, tx_work);
 	struct ksz_hw *hw = &hw_priv->hw;
 
 	hw_ack_intr(hw, KS884X_INT_TX_MASK);
 
 	tx_done(hw_priv);
 
-	/* tasklets are interruptible. */
+	/* works are interruptible. */
 	spin_lock_irq(&hw_priv->hwlock);
 	hw_turn_on_intr(hw, KS884X_INT_TX);
 	spin_unlock_irq(&hw_priv->hwlock);
@@ -4879,12 +4880,12 @@ static irqreturn_t netdev_intr(int irq, void *dev_id)
 
 		if (unlikely(int_enable & KS884X_INT_TX_MASK)) {
 			hw_dis_intr_bit(hw, KS884X_INT_TX_MASK);
-			tasklet_schedule(&hw_priv->tx_tasklet);
+			queue_work(system_bh_wq, &hw_priv->tx_work);
 		}
 
 		if (likely(int_enable & KS884X_INT_RX)) {
 			hw_dis_intr_bit(hw, KS884X_INT_RX);
-			tasklet_schedule(&hw_priv->rx_tasklet);
+			queue_work(system_bh_wq, &hw_priv->rx_work);
 		}
 
 		if (unlikely(int_enable & KS884X_INT_RX_OVERRUN)) {
@@ -5013,11 +5014,11 @@ static int netdev_close(struct net_device *dev)
 		hw_disable(hw);
 		hw_clr_multicast(hw);
 
-		/* Delay for receive task to stop scheduling itself. */
+		/* Delay for receive work to stop scheduling itself. */
 		msleep(2000 / HZ);
 
-		tasklet_kill(&hw_priv->rx_tasklet);
-		tasklet_kill(&hw_priv->tx_tasklet);
+		cancel_work_sync(&hw_priv->rx_work);
+		cancel_work_sync(&hw_priv->tx_work);
 		free_irq(dev->irq, hw_priv->dev);
 
 		transmit_cleanup(hw_priv, 0);
@@ -5068,8 +5069,8 @@ static int prepare_hardware(struct net_device *dev)
 	rc = request_irq(dev->irq, netdev_intr, IRQF_SHARED, dev->name, dev);
 	if (rc)
 		return rc;
-	tasklet_setup(&hw_priv->rx_tasklet, rx_proc_task);
-	tasklet_setup(&hw_priv->tx_tasklet, tx_proc_task);
+	INIT_WORK(&hw_priv->rx_work, rx_proc_task);
+	INIT_WORK(&hw_priv->tx_work, tx_proc_task);
 
 	hw->promiscuous = 0;
 	hw->all_multi = 0;
diff --git a/drivers/net/ethernet/microchip/lan743x_ptp.c b/drivers/net/ethernet/microchip/lan743x_ptp.c
index 2801f08bf1c9..a8d2be7d2b65 100644
--- a/drivers/net/ethernet/microchip/lan743x_ptp.c
+++ b/drivers/net/ethernet/microchip/lan743x_ptp.c
@@ -1380,7 +1380,7 @@ void lan743x_ptp_isr(void *context)
 
 	if (ptp_int_sts & PTP_INT_BIT_TX_TS_) {
 		ptp_schedule_worker(ptp->ptp_clock, 0);
-		enable_flag = 0;/* tasklet will re-enable later */
+		enable_flag = 0;/* BH work will re-enable later */
 	}
 	if (ptp_int_sts & PTP_INT_BIT_TX_SWTS_ERR_) {
 		netif_err(adapter, drv, adapter->netdev,
diff --git a/drivers/net/ethernet/natsemi/ns83820.c b/drivers/net/ethernet/natsemi/ns83820.c
index 998586872599..8e7e723706e8 100644
--- a/drivers/net/ethernet/natsemi/ns83820.c
+++ b/drivers/net/ethernet/natsemi/ns83820.c
@@ -415,7 +415,7 @@ struct ns83820 {
 	struct net_device	*ndev;
 
 	struct rx_info		rx_info;
-	struct tasklet_struct	rx_tasklet;
+	struct work_struct	rx_work;
 
 	unsigned		ihr;
 	struct work_struct	tq_refill;
@@ -925,9 +925,9 @@ static void rx_irq(struct net_device *ndev)
 	spin_unlock_irqrestore(&info->lock, flags);
 }
 
-static void rx_action(struct tasklet_struct *t)
+static void rx_action(struct work_struct *t)
 {
-	struct ns83820 *dev = from_tasklet(dev, t, rx_tasklet);
+	struct ns83820 *dev = from_work(dev, t, rx_work);
 	struct net_device *ndev = dev->ndev;
 	rx_irq(ndev);
 	writel(ihr, dev->base + IHR);
@@ -1426,7 +1426,7 @@ static void ns83820_do_isr(struct net_device *ndev, u32 isr)
 		writel(dev->IMR_cache, dev->base + IMR);
 		spin_unlock_irqrestore(&dev->misc_lock, flags);
 
-		tasklet_schedule(&dev->rx_tasklet);
+		queue_work(system_bh_wq, &dev->rx_work);
 		//rx_irq(ndev);
 		//writel(4, dev->base + IHR);
 	}
@@ -1929,7 +1929,7 @@ static int ns83820_init_one(struct pci_dev *pci_dev,
 	SET_NETDEV_DEV(ndev, &pci_dev->dev);
 
 	INIT_WORK(&dev->tq_refill, queue_refill);
-	tasklet_setup(&dev->rx_tasklet, rx_action);
+	INIT_WORK(&dev->rx_work, rx_action);
 
 	err = pci_enable_device(pci_dev);
 	if (err) {
diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
index d215efc6cad0..75ed7587b401 100644
--- a/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
+++ b/drivers/net/ethernet/netronome/nfp/nfd3/dp.c
@@ -4,6 +4,7 @@
 #include <linux/bpf_trace.h>
 #include <linux/netdevice.h>
 #include <linux/bitfield.h>
+#include <linux/workqueue.h>
 #include <net/xfrm.h>
 
 #include "../nfp_app.h"
@@ -1402,9 +1403,9 @@ static bool nfp_ctrl_rx(struct nfp_net_r_vector *r_vec)
 	return budget;
 }
 
-void nfp_nfd3_ctrl_poll(struct tasklet_struct *t)
+void nfp_nfd3_ctrl_poll(struct work_struct *t)
 {
-	struct nfp_net_r_vector *r_vec = from_tasklet(r_vec, t, tasklet);
+	struct nfp_net_r_vector *r_vec = from_work(r_vec, t, work);
 
 	spin_lock(&r_vec->lock);
 	nfp_nfd3_tx_complete(r_vec->tx_ring, 0);
@@ -1414,7 +1415,7 @@ void nfp_nfd3_ctrl_poll(struct tasklet_struct *t)
 	if (nfp_ctrl_rx(r_vec)) {
 		nfp_net_irq_unmask(r_vec->nfp_net, r_vec->irq_entry);
 	} else {
-		tasklet_schedule(&r_vec->tasklet);
+		queue_work(system_bh_wq, &r_vec->work);
 		nn_dp_warn(&r_vec->nfp_net->dp,
 			   "control message budget exceeded!\n");
 	}
diff --git a/drivers/net/ethernet/netronome/nfp/nfd3/nfd3.h b/drivers/net/ethernet/netronome/nfp/nfd3/nfd3.h
index 9c1c10dcbaee..972593f54ecd 100644
--- a/drivers/net/ethernet/netronome/nfp/nfd3/nfd3.h
+++ b/drivers/net/ethernet/netronome/nfp/nfd3/nfd3.h
@@ -97,7 +97,7 @@ netdev_tx_t nfp_nfd3_tx(struct sk_buff *skb, struct net_device *netdev);
 bool
 nfp_nfd3_ctrl_tx_one(struct nfp_net *nn, struct nfp_net_r_vector *r_vec,
 		     struct sk_buff *skb, bool old);
-void nfp_nfd3_ctrl_poll(struct tasklet_struct *t);
+void nfp_nfd3_ctrl_poll(struct work_struct *t);
 void nfp_nfd3_rx_ring_fill_freelist(struct nfp_net_dp *dp,
 				    struct nfp_net_rx_ring *rx_ring);
 void nfp_nfd3_xsk_tx_free(struct nfp_nfd3_tx_buf *txbuf);
diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
index dae5af7d1845..9eb6b6e8e2f0 100644
--- a/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
+++ b/drivers/net/ethernet/netronome/nfp/nfdk/dp.c
@@ -1564,9 +1564,9 @@ static bool nfp_ctrl_rx(struct nfp_net_r_vector *r_vec)
 	return budget;
 }
 
-void nfp_nfdk_ctrl_poll(struct tasklet_struct *t)
+void nfp_nfdk_ctrl_poll(struct work_struct *t)
 {
-	struct nfp_net_r_vector *r_vec = from_tasklet(r_vec, t, tasklet);
+	struct nfp_net_r_vector *r_vec = from_work(r_vec, t, work);
 
 	spin_lock(&r_vec->lock);
 	nfp_nfdk_tx_complete(r_vec->tx_ring, 0);
@@ -1576,7 +1576,7 @@ void nfp_nfdk_ctrl_poll(struct tasklet_struct *t)
 	if (nfp_ctrl_rx(r_vec)) {
 		nfp_net_irq_unmask(r_vec->nfp_net, r_vec->irq_entry);
 	} else {
-		tasklet_schedule(&r_vec->tasklet);
+		queue_work(system_bh_wq, &r_vec->work);
 		nn_dp_warn(&r_vec->nfp_net->dp,
 			   "control message budget exceeded!\n");
 	}
diff --git a/drivers/net/ethernet/netronome/nfp/nfdk/nfdk.h b/drivers/net/ethernet/netronome/nfp/nfdk/nfdk.h
index fe55980348e9..d9eef0b11746 100644
--- a/drivers/net/ethernet/netronome/nfp/nfdk/nfdk.h
+++ b/drivers/net/ethernet/netronome/nfp/nfdk/nfdk.h
@@ -6,6 +6,7 @@
 
 #include <linux/bitops.h>
 #include <linux/types.h>
+#include <linux/workqueue.h>
 
 #define NFDK_TX_DESC_PER_SIMPLE_PKT	2
 
@@ -122,7 +123,7 @@ netdev_tx_t nfp_nfdk_tx(struct sk_buff *skb, struct net_device *netdev);
 bool
 nfp_nfdk_ctrl_tx_one(struct nfp_net *nn, struct nfp_net_r_vector *r_vec,
 		     struct sk_buff *skb, bool old);
-void nfp_nfdk_ctrl_poll(struct tasklet_struct *t);
+void nfp_nfdk_ctrl_poll(struct work_struct *t);
 void nfp_nfdk_rx_ring_fill_freelist(struct nfp_net_dp *dp,
 				    struct nfp_net_rx_ring *rx_ring);
 #ifndef CONFIG_NFP_NET_IPSEC
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net.h b/drivers/net/ethernet/netronome/nfp/nfp_net.h
index 46764aeccb37..8ab22ecd7813 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net.h
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net.h
@@ -339,7 +339,7 @@ struct nfp_net_rx_ring {
  * struct nfp_net_r_vector - Per ring interrupt vector configuration
  * @nfp_net:        Backpointer to nfp_net structure
  * @napi:           NAPI structure for this ring vec
- * @tasklet:        ctrl vNIC, tasklet for servicing the r_vec
+ * @work:        ctrl vNIC, work for servicing the r_vec
  * @queue:          ctrl vNIC, send queue
  * @lock:           ctrl vNIC, r_vec lock protects @queue
  * @tx_ring:        Pointer to TX ring
@@ -389,7 +389,7 @@ struct nfp_net_r_vector {
 	union {
 		struct napi_struct napi;
 		struct {
-			struct tasklet_struct tasklet;
+			struct work_struct work;
 			struct sk_buff_head queue;
 			spinlock_t lock;
 		};
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
index f28e769e6fda..4f852613d50e 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_common.c
@@ -463,7 +463,7 @@ static irqreturn_t nfp_ctrl_irq_rxtx(int irq, void *data)
 {
 	struct nfp_net_r_vector *r_vec = data;
 
-	tasklet_schedule(&r_vec->tasklet);
+	queue_work(system_bh_wq, &r_vec->work);
 
 	return IRQ_HANDLED;
 }
@@ -761,8 +761,8 @@ static void nfp_net_vecs_init(struct nfp_net *nn)
 
 			__skb_queue_head_init(&r_vec->queue);
 			spin_lock_init(&r_vec->lock);
-			tasklet_setup(&r_vec->tasklet, nn->dp.ops->ctrl_poll);
-			tasklet_disable(&r_vec->tasklet);
+			INIT_WORK(&r_vec->work, nn->dp.ops->ctrl_poll);
+			disable_work_sync(&r_vec->work);
 		}
 
 		cpumask_set_cpu(cpumask_local_spread(r, numa_node), &r_vec->affinity_mask);
@@ -776,7 +776,7 @@ nfp_net_napi_add(struct nfp_net_dp *dp, struct nfp_net_r_vector *r_vec, int idx)
 		netif_napi_add(dp->netdev, &r_vec->napi,
 			       nfp_net_has_xsk_pool_slow(dp, idx) ? dp->ops->xsk_poll : dp->ops->poll);
 	else
-		tasklet_enable(&r_vec->tasklet);
+		enable_and_queue_work(system_bh_wq, &r_vec->work);
 }
 
 static void
@@ -785,7 +785,7 @@ nfp_net_napi_del(struct nfp_net_dp *dp, struct nfp_net_r_vector *r_vec)
 	if (dp->netdev)
 		netif_napi_del(&r_vec->napi);
 	else
-		tasklet_disable(&r_vec->tasklet);
+		disable_work_sync(&r_vec->work);
 }
 
 static void
@@ -1148,7 +1148,7 @@ void nfp_ctrl_close(struct nfp_net *nn)
 
 	for (r = 0; r < nn->dp.num_r_vecs; r++) {
 		disable_irq(nn->r_vecs[r].irq_vector);
-		tasklet_disable(&nn->r_vecs[r].tasklet);
+		disable_work_sync(&nn->r_vecs[r].work);
 	}
 
 	nfp_net_clear_config_and_disable(nn);
diff --git a/drivers/net/ethernet/netronome/nfp/nfp_net_dp.h b/drivers/net/ethernet/netronome/nfp/nfp_net_dp.h
index 831c83ce0d3d..39dd7b00a3bb 100644
--- a/drivers/net/ethernet/netronome/nfp/nfp_net_dp.h
+++ b/drivers/net/ethernet/netronome/nfp/nfp_net_dp.h
@@ -122,7 +122,7 @@ enum nfp_nfd_version {
  * @dma_mask:			DMA addressing capability
  * @poll:			Napi poll for normal rx/tx
  * @xsk_poll:			Napi poll when xsk is enabled
- * @ctrl_poll:			Tasklet poll for ctrl rx/tx
+ * @ctrl_poll:			Work poll for ctrl rx/tx
  * @xmit:			Xmit for normal path
  * @ctrl_tx_one:		Xmit for ctrl path
  * @rx_ring_fill_freelist:	Give buffers from the ring to FW
@@ -141,7 +141,7 @@ struct nfp_dp_ops {
 
 	int (*poll)(struct napi_struct *napi, int budget);
 	int (*xsk_poll)(struct napi_struct *napi, int budget);
-	void (*ctrl_poll)(struct tasklet_struct *t);
+	void (*ctrl_poll)(struct work_struct *t);
 	netdev_tx_t (*xmit)(struct sk_buff *skb, struct net_device *netdev);
 	bool (*ctrl_tx_one)(struct nfp_net *nn, struct nfp_net_r_vector *r_vec,
 			    struct sk_buff *skb, bool old);
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index fa1f78b03cb2..9d9ec00acf37 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -17,6 +17,7 @@
 #include <linux/nvmem-consumer.h>
 #include <linux/ethtool.h>
 #include <linux/iopoll.h>
+#include <linux/workqueue.h>
 
 #define TX_BD_NUM		64
 #define RX_BD_NUM		128
@@ -184,7 +185,7 @@ struct nixge_priv {
 	void __iomem *ctrl_regs;
 	void __iomem *dma_regs;
 
-	struct tasklet_struct dma_err_tasklet;
+	struct work_struct dma_err_work;
 
 	int tx_irq;
 	int rx_irq;
@@ -732,7 +733,7 @@ static irqreturn_t nixge_tx_irq(int irq, void *_ndev)
 		/* Write to the Rx channel control register */
 		nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET, cr);
 
-		tasklet_schedule(&priv->dma_err_tasklet);
+		queue_work(system_bh_wq, &priv->dma_err_work);
 		nixge_dma_write_reg(priv, XAXIDMA_TX_SR_OFFSET, status);
 	}
 out:
@@ -780,16 +781,16 @@ static irqreturn_t nixge_rx_irq(int irq, void *_ndev)
 		/* write to the Rx channel control register */
 		nixge_dma_write_reg(priv, XAXIDMA_RX_CR_OFFSET, cr);
 
-		tasklet_schedule(&priv->dma_err_tasklet);
+		queue_work(system_bh_wq, &priv->dma_err_work);
 		nixge_dma_write_reg(priv, XAXIDMA_RX_SR_OFFSET, status);
 	}
 out:
 	return IRQ_HANDLED;
 }
 
-static void nixge_dma_err_handler(struct tasklet_struct *t)
+static void nixge_dma_err_handler(struct work_struct *t)
 {
-	struct nixge_priv *lp = from_tasklet(lp, t, dma_err_tasklet);
+	struct nixge_priv *lp = from_work(lp, t, dma_err_work);
 	struct nixge_hw_dma_bd *cur_p;
 	struct nixge_tx_skb *tx_skb;
 	u32 cr, i;
@@ -878,8 +879,8 @@ static int nixge_open(struct net_device *ndev)
 
 	phy_start(phy);
 
-	/* Enable tasklets for Axi DMA error handling */
-	tasklet_setup(&priv->dma_err_tasklet, nixge_dma_err_handler);
+	/* Enable works for Axi DMA error handling */
+	INIT_WORK(&priv->dma_err_work, nixge_dma_err_handler);
 
 	napi_enable(&priv->napi);
 
@@ -902,7 +903,7 @@ static int nixge_open(struct net_device *ndev)
 	napi_disable(&priv->napi);
 	phy_stop(phy);
 	phy_disconnect(phy);
-	tasklet_kill(&priv->dma_err_tasklet);
+	cancel_work_sync(&priv->dma_err_work);
 	netdev_err(ndev, "request_irq() failed\n");
 	return ret;
 }
@@ -927,7 +928,7 @@ static int nixge_stop(struct net_device *ndev)
 	nixge_dma_write_reg(priv, XAXIDMA_TX_CR_OFFSET,
 			    cr & (~XAXIDMA_CR_RUNSTOP_MASK));
 
-	tasklet_kill(&priv->dma_err_tasklet);
+	cancel_work_sync(&priv->dma_err_work);
 
 	free_irq(priv->tx_irq, ndev);
 	free_irq(priv->rx_irq, ndev);
diff --git a/drivers/net/ethernet/qlogic/qed/qed.h b/drivers/net/ethernet/qlogic/qed/qed.h
index 1d719726f72b..208dda46204e 100644
--- a/drivers/net/ethernet/qlogic/qed/qed.h
+++ b/drivers/net/ethernet/qlogic/qed/qed.h
@@ -565,7 +565,7 @@ struct qed_hwfn {
 	struct qed_consq		*p_consq;
 
 	/* Slow-Path definitions */
-	struct tasklet_struct		sp_dpc;
+	struct work_struct		p_dpc;
 	bool				b_sp_dpc_enabled;
 
 	struct qed_ptt			*p_main_ptt;
diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.c b/drivers/net/ethernet/qlogic/qed/qed_int.c
index 2661c483c67e..a5b7937cca3c 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.c
@@ -1236,9 +1236,9 @@ static void qed_sb_ack_attn(struct qed_hwfn *p_hwfn,
 	barrier();
 }
 
-void qed_int_sp_dpc(struct tasklet_struct *t)
+void qed_int_sp_dpc(struct work_struct *t)
 {
-	struct qed_hwfn *p_hwfn = from_tasklet(p_hwfn, t, sp_dpc);
+	struct qed_hwfn *p_hwfn = from_work(p_hwfn, t, sp_dpc);
 	struct qed_pi_info *pi_info = NULL;
 	struct qed_sb_attn_info *sb_attn;
 	struct qed_sb_info *sb_info;
@@ -2305,7 +2305,7 @@ u64 qed_int_igu_read_sisr_reg(struct qed_hwfn *p_hwfn)
 
 static void qed_int_sp_dpc_setup(struct qed_hwfn *p_hwfn)
 {
-	tasklet_setup(&p_hwfn->sp_dpc, qed_int_sp_dpc);
+	INIT_WORK(&p_hwfn->sp_dpc, qed_int_sp_dpc);
 	p_hwfn->b_sp_dpc_enabled = true;
 }
 
diff --git a/drivers/net/ethernet/qlogic/qed/qed_int.h b/drivers/net/ethernet/qlogic/qed/qed_int.h
index 7e5127f61744..38034f5c2992 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_int.h
+++ b/drivers/net/ethernet/qlogic/qed/qed_int.h
@@ -142,12 +142,12 @@ int qed_int_sb_release(struct qed_hwfn *p_hwfn,
  * qed_int_sp_dpc(): To be called when an interrupt is received on the
  *                   default status block.
  *
- * @t: Tasklet.
+ * @t: Work.
  *
  * Return: Void.
  *
  */
-void qed_int_sp_dpc(struct tasklet_struct *t);
+void qed_int_sp_dpc(struct work_struct *t);
 
 /**
  * qed_int_get_num_sbs(): Get the number of status blocks configured
diff --git a/drivers/net/ethernet/qlogic/qed/qed_main.c b/drivers/net/ethernet/qlogic/qed/qed_main.c
index c278f8893042..990a3199499d 100644
--- a/drivers/net/ethernet/qlogic/qed/qed_main.c
+++ b/drivers/net/ethernet/qlogic/qed/qed_main.c
@@ -684,9 +684,9 @@ static void qed_simd_handler_clean(struct qed_dev *cdev, int index)
 	       sizeof(struct qed_simd_fp_handler));
 }
 
-static irqreturn_t qed_msix_sp_int(int irq, void *tasklet)
+static irqreturn_t qed_msix_sp_int(int irq, void *work)
 {
-	tasklet_schedule((struct tasklet_struct *)tasklet);
+	queue_work(system_bh_wq, (struct work_struct *)work);
 	return IRQ_HANDLED;
 }
 
@@ -708,7 +708,7 @@ static irqreturn_t qed_single_int(int irq, void *dev_instance)
 
 		/* Slowpath interrupt */
 		if (unlikely(status & 0x1)) {
-			tasklet_schedule(&hwfn->sp_dpc);
+			queue_work(system_bh_wq, &hwfn->sp_dpc);
 			status &= ~0x1;
 			rc = IRQ_HANDLED;
 		}
@@ -779,15 +779,15 @@ int qed_slowpath_irq_req(struct qed_hwfn *hwfn)
 	return rc;
 }
 
-static void qed_slowpath_tasklet_flush(struct qed_hwfn *p_hwfn)
+static void qed_slowpath_work_flush(struct qed_hwfn *p_hwfn)
 {
 	/* Calling the disable function will make sure that any
 	 * currently-running function is completed. The following call to the
 	 * enable function makes this sequence a flush-like operation.
 	 */
 	if (p_hwfn->b_sp_dpc_enabled) {
-		tasklet_disable(&p_hwfn->sp_dpc);
-		tasklet_enable(&p_hwfn->sp_dpc);
+		disable_work_sync(&p_hwfn->sp_dpc);
+		enable_and_queue_work(system_bh_wq, &p_hwfn->sp_dpc);
 	}
 }
 
@@ -803,7 +803,7 @@ void qed_slowpath_irq_sync(struct qed_hwfn *p_hwfn)
 	else
 		synchronize_irq(cdev->pdev->irq);
 
-	qed_slowpath_tasklet_flush(p_hwfn);
+	qed_slowpath_work_flush(p_hwfn);
 }
 
 static void qed_slowpath_irq_free(struct qed_dev *cdev)
@@ -834,10 +834,10 @@ static int qed_nic_stop(struct qed_dev *cdev)
 		struct qed_hwfn *p_hwfn = &cdev->hwfns[i];
 
 		if (p_hwfn->b_sp_dpc_enabled) {
-			tasklet_disable(&p_hwfn->sp_dpc);
+			disable_work_sync(&p_hwfn->sp_dpc);
 			p_hwfn->b_sp_dpc_enabled = false;
 			DP_VERBOSE(cdev, NETIF_MSG_IFDOWN,
-				   "Disabled sp tasklet [hwfn %d] at %p\n",
+				   "Disabled sp work [hwfn %d] at %p\n",
 				   i, &p_hwfn->sp_dpc);
 		}
 	}
@@ -3115,7 +3115,7 @@ void qed_get_protocol_stats(struct qed_dev *cdev,
 int qed_mfw_tlv_req(struct qed_hwfn *hwfn)
 {
 	DP_VERBOSE(hwfn->cdev, NETIF_MSG_DRV,
-		   "Scheduling slowpath task [Flag: %d]\n",
+		   "Scheduling slowpath work [Flag: %d]\n",
 		   QED_SLOWPATH_MFW_TLV_REQ);
 	/* Memory barrier for setting atomic bit */
 	smp_mb__before_atomic();
diff --git a/drivers/net/ethernet/sfc/falcon/farch.c b/drivers/net/ethernet/sfc/falcon/farch.c
index c64623c2e80c..4a3b0fbd1d0e 100644
--- a/drivers/net/ethernet/sfc/falcon/farch.c
+++ b/drivers/net/ethernet/sfc/falcon/farch.c
@@ -766,7 +766,7 @@ void ef4_farch_finish_flr(struct ef4_nic *efx)
 /**************************************************************************
  *
  * Event queue processing
- * Event queues are processed by per-channel tasklets.
+ * Event queues are processed by per-channel works.
  *
  **************************************************************************/
 
@@ -1397,7 +1397,7 @@ void ef4_farch_rx_defer_refill(struct ef4_rx_queue *rx_queue)
  *
  * Hardware interrupts
  * The hardware interrupt handler does very little work; all the event
- * queue processing is carried out by per-channel tasklets.
+ * queue processing is carried out by per-channel works.
  *
  **************************************************************************/
 
diff --git a/drivers/net/ethernet/sfc/falcon/net_driver.h b/drivers/net/ethernet/sfc/falcon/net_driver.h
index a2c7139f2b32..4f37f853769f 100644
--- a/drivers/net/ethernet/sfc/falcon/net_driver.h
+++ b/drivers/net/ethernet/sfc/falcon/net_driver.h
@@ -361,7 +361,7 @@ struct ef4_rx_queue {
  * struct ef4_channel - An Efx channel
  *
  * A channel comprises an event queue, at least one TX queue, at least
- * one RX queue, and an associated tasklet for processing the event
+ * one RX queue, and an associated BH work for processing the event
  * queue.
  *
  * @efx: Associated Efx NIC
diff --git a/drivers/net/ethernet/sfc/falcon/selftest.c b/drivers/net/ethernet/sfc/falcon/selftest.c
index c3dc88e6c26c..530e0e22b2d8 100644
--- a/drivers/net/ethernet/sfc/falcon/selftest.c
+++ b/drivers/net/ethernet/sfc/falcon/selftest.c
@@ -26,7 +26,7 @@
  * - All IRQs may be disabled on a CPU for a *long* time by e.g. a
  *   slow serial console or an old IDE driver doing error recovery
  * - The PREEMPT_RT patches mostly deal with this, but also allow a
- *   tasklet or normal task to be given higher priority than our IRQ
+ *   BH work or normal task to be given higher priority than our IRQ
  *   threads
  * Try to avoid blaming the hardware for this.
  */
diff --git a/drivers/net/ethernet/sfc/net_driver.h b/drivers/net/ethernet/sfc/net_driver.h
index f2dd7feb0e0c..9f6d6dbb6fb4 100644
--- a/drivers/net/ethernet/sfc/net_driver.h
+++ b/drivers/net/ethernet/sfc/net_driver.h
@@ -421,7 +421,7 @@ enum efx_sync_events_state {
  * struct efx_channel - An Efx channel
  *
  * A channel comprises an event queue, at least one TX queue, at least
- * one RX queue, and an associated tasklet for processing the event
+ * one RX queue, and an associated BH work for processing the event
  * queue.
  *
  * @efx: Associated Efx NIC
diff --git a/drivers/net/ethernet/sfc/selftest.c b/drivers/net/ethernet/sfc/selftest.c
index 894fad0bb5ea..8f30fab454cf 100644
--- a/drivers/net/ethernet/sfc/selftest.c
+++ b/drivers/net/ethernet/sfc/selftest.c
@@ -29,7 +29,7 @@
  * - All IRQs may be disabled on a CPU for a *long* time by e.g. a
  *   slow serial console or an old IDE driver doing error recovery
  * - The PREEMPT_RT patches mostly deal with this, but also allow a
- *   tasklet or normal task to be given higher priority than our IRQ
+ *   BH work or normal task to be given higher priority than our IRQ
  *   threads
  * Try to avoid blaming the hardware for this.
  */
diff --git a/drivers/net/ethernet/sfc/siena/farch.c b/drivers/net/ethernet/sfc/siena/farch.c
index 89ccd65c978b..166482dd192a 100644
--- a/drivers/net/ethernet/sfc/siena/farch.c
+++ b/drivers/net/ethernet/sfc/siena/farch.c
@@ -766,7 +766,7 @@ void efx_farch_finish_flr(struct efx_nic *efx)
 /**************************************************************************
  *
  * Event queue processing
- * Event queues are processed by per-channel tasklets.
+ * Event queues are processed by per-channel works.
  *
  **************************************************************************/
 
@@ -1414,7 +1414,7 @@ void efx_farch_rx_defer_refill(struct efx_rx_queue *rx_queue)
  *
  * Hardware interrupts
  * The hardware interrupt handler does very little work; all the event
- * queue processing is carried out by per-channel tasklets.
+ * queue processing is carried out by per-channel works.
  *
  **************************************************************************/
 
diff --git a/drivers/net/ethernet/sfc/siena/net_driver.h b/drivers/net/ethernet/sfc/siena/net_driver.h
index 94152f595acd..4502c7ce5495 100644
--- a/drivers/net/ethernet/sfc/siena/net_driver.h
+++ b/drivers/net/ethernet/sfc/siena/net_driver.h
@@ -431,7 +431,7 @@ enum efx_sync_events_state {
  * struct efx_channel - An Efx channel
  *
  * A channel comprises an event queue, at least one TX queue, at least
- * one RX queue, and an associated tasklet for processing the event
+ * one RX queue, and an associated BH work for processing the event
  * queue.
  *
  * @efx: Associated Efx NIC
diff --git a/drivers/net/ethernet/sfc/siena/selftest.c b/drivers/net/ethernet/sfc/siena/selftest.c
index 526da43d4b61..e5a3f7300daf 100644
--- a/drivers/net/ethernet/sfc/siena/selftest.c
+++ b/drivers/net/ethernet/sfc/siena/selftest.c
@@ -29,7 +29,7 @@
  * - All IRQs may be disabled on a CPU for a *long* time by e.g. a
  *   slow serial console or an old IDE driver doing error recovery
  * - The PREEMPT_RT patches mostly deal with this, but also allow a
- *   tasklet or normal task to be given higher priority than our IRQ
+ *   BH work or normal task to be given higher priority than our IRQ
  *   threads
  * Try to avoid blaming the hardware for this.
  */
diff --git a/drivers/net/ethernet/silan/sc92031.c b/drivers/net/ethernet/silan/sc92031.c
index ff4197f5e46d..e449ac0c89a2 100644
--- a/drivers/net/ethernet/silan/sc92031.c
+++ b/drivers/net/ethernet/silan/sc92031.c
@@ -34,6 +34,7 @@
 #include <linux/ethtool.h>
 #include <linux/mii.h>
 #include <linux/crc32.h>
+#include <linux/workqueue.h>
 
 #include <asm/irq.h>
 
@@ -255,7 +256,7 @@ enum PMConfigBits {
  */
 
 /* Locking rules for the interrupt:
- * - the interrupt and the tasklet never run at the same time
+ * - the interrupt and the work never run at the same time
  * - neither run between sc92031_disable_interrupts and
  *   sc92031_enable_interrupt
  */
@@ -266,8 +267,8 @@ struct sc92031_priv {
 	void __iomem		*port_base;
 	/* pci device structure */
 	struct pci_dev		*pdev;
-	/* tasklet */
-	struct tasklet_struct	tasklet;
+	/* work */
+	struct work_struct	work;
 
 	/* CPU address of rx ring */
 	void			*rx_ring;
@@ -355,7 +356,7 @@ static void sc92031_disable_interrupts(struct net_device *dev)
 	struct sc92031_priv *priv = netdev_priv(dev);
 	void __iomem *port_base = priv->port_base;
 
-	/* tell the tasklet/interrupt not to enable interrupts */
+	/* tell the work/interrupt not to enable interrupts */
 	atomic_set(&priv->intr_mask, 0);
 	wmb();
 
@@ -363,9 +364,9 @@ static void sc92031_disable_interrupts(struct net_device *dev)
 	iowrite32(0, port_base + IntrMask);
 	_sc92031_dummy_read(port_base);
 
-	/* wait for any concurrent interrupt/tasklet to finish */
+	/* wait for any concurrent interrupt/work to finish */
 	synchronize_irq(priv->pdev->irq);
-	tasklet_disable(&priv->tasklet);
+	disable_work_sync(&priv->work);
 }
 
 static void sc92031_enable_interrupts(struct net_device *dev)
@@ -373,7 +374,7 @@ static void sc92031_enable_interrupts(struct net_device *dev)
 	struct sc92031_priv *priv = netdev_priv(dev);
 	void __iomem *port_base = priv->port_base;
 
-	tasklet_enable(&priv->tasklet);
+	enable_and_queue_work(system_bh_wq, &priv->work);
 
 	atomic_set(&priv->intr_mask, IntrBits);
 	wmb();
@@ -644,7 +645,7 @@ static void _sc92031_reset(struct net_device *dev)
 	ioread32(port_base + IntrStatus);
 }
 
-static void _sc92031_tx_tasklet(struct net_device *dev)
+static void _sc92031_tx_work(struct net_device *dev)
 {
 	struct sc92031_priv *priv = netdev_priv(dev);
 	void __iomem *port_base = priv->port_base;
@@ -692,8 +693,8 @@ static void _sc92031_tx_tasklet(struct net_device *dev)
 			netif_wake_queue(dev);
 }
 
-static void _sc92031_rx_tasklet_error(struct net_device *dev,
-				      u32 rx_status, unsigned rx_size)
+static void _sc92031_rx_work_error(struct net_device *dev,
+				   u32 rx_status, unsigned rx_size)
 {
 	if(rx_size > (MAX_ETH_FRAME_SIZE + 4) || rx_size < 16) {
 		dev->stats.rx_errors++;
@@ -717,7 +718,7 @@ static void _sc92031_rx_tasklet_error(struct net_device *dev,
 	}
 }
 
-static void _sc92031_rx_tasklet(struct net_device *dev)
+static void _sc92031_rx_work(struct net_device *dev)
 {
 	struct sc92031_priv *priv = netdev_priv(dev);
 	void __iomem *port_base = priv->port_base;
@@ -773,7 +774,7 @@ static void _sc92031_rx_tasklet(struct net_device *dev)
 			     rx_size > (MAX_ETH_FRAME_SIZE + 4) ||
 			     rx_size < 16 ||
 			     !(rx_status & RxStatesOK))) {
-			_sc92031_rx_tasklet_error(dev, rx_status, rx_size);
+			_sc92031_rx_work_error(dev, rx_status, rx_size);
 			break;
 		}
 
@@ -820,7 +821,7 @@ static void _sc92031_rx_tasklet(struct net_device *dev)
 	iowrite32(priv->rx_ring_tail, port_base + RxBufRPtr);
 }
 
-static void _sc92031_link_tasklet(struct net_device *dev)
+static void _sc92031_link_work(struct net_device *dev)
 {
 	if (_sc92031_check_media(dev))
 		netif_wake_queue(dev);
@@ -830,9 +831,9 @@ static void _sc92031_link_tasklet(struct net_device *dev)
 	}
 }
 
-static void sc92031_tasklet(struct tasklet_struct *t)
+static void sc92031_work(struct work_struct *t)
 {
-	struct  sc92031_priv *priv = from_tasklet(priv, t, tasklet);
+	struct  sc92031_priv *priv = from_work(priv, t, work);
 	struct net_device *dev = priv->ndev;
 	void __iomem *port_base = priv->port_base;
 	u32 intr_status, intr_mask;
@@ -845,10 +846,10 @@ static void sc92031_tasklet(struct tasklet_struct *t)
 		goto out;
 
 	if (intr_status & TxOK)
-		_sc92031_tx_tasklet(dev);
+		_sc92031_tx_work(dev);
 
 	if (intr_status & RxOK)
-		_sc92031_rx_tasklet(dev);
+		_sc92031_rx_work(dev);
 
 	if (intr_status & RxOverflow)
 		dev->stats.rx_errors++;
@@ -859,7 +860,7 @@ static void sc92031_tasklet(struct tasklet_struct *t)
 	}
 
 	if (intr_status & (LinkFail | LinkOK))
-		_sc92031_link_tasklet(dev);
+		_sc92031_link_work(dev);
 
 out:
 	intr_mask = atomic_read(&priv->intr_mask);
@@ -890,7 +891,7 @@ static irqreturn_t sc92031_interrupt(int irq, void *dev_id)
 		goto out_none;
 
 	priv->intr_status = intr_status;
-	tasklet_schedule(&priv->tasklet);
+	queue_work(system_bh_wq, &priv->work);
 
 	return IRQ_HANDLED;
 
@@ -1109,7 +1110,7 @@ static void sc92031_poll_controller(struct net_device *dev)
 
 	disable_irq(irq);
 	if (sc92031_interrupt(irq, dev) != IRQ_NONE)
-		sc92031_tasklet(&priv->tasklet);
+		sc92031_work(&priv->work);
 	enable_irq(irq);
 }
 #endif
@@ -1449,10 +1450,10 @@ static int sc92031_probe(struct pci_dev *pdev, const struct pci_device_id *id)
 	spin_lock_init(&priv->lock);
 	priv->port_base = port_base;
 	priv->pdev = pdev;
-	tasklet_setup(&priv->tasklet, sc92031_tasklet);
-	/* Fudge tasklet count so the call to sc92031_enable_interrupts at
+	INIT_WORK(&priv->work, sc92031_work);
+	/* Fudge work count so the call to sc92031_enable_interrupts at
 	 * sc92031_open will work correctly */
-	tasklet_disable_nosync(&priv->tasklet);
+	disable_work(&priv->work);
 
 	/* PCI PM Wakeup */
 	iowrite32((~PM_LongWF & ~PM_LWPTN) | PM_Enable, port_base + PMConfig);
diff --git a/drivers/net/ethernet/smsc/smc91x.c b/drivers/net/ethernet/smsc/smc91x.c
index 78ff3af7911a..8cf8e2b44eef 100644
--- a/drivers/net/ethernet/smsc/smc91x.c
+++ b/drivers/net/ethernet/smsc/smc91x.c
@@ -245,7 +245,7 @@ static void smc_reset(struct net_device *dev)
 
 	DBG(2, dev, "%s\n", __func__);
 
-	/* Disable all interrupts, block TX tasklet */
+	/* Disable all interrupts, block TX work */
 	spin_lock_irq(&lp->lock);
 	SMC_SELECT_BANK(lp, 2);
 	SMC_SET_INT_MASK(lp, 0);
@@ -356,7 +356,7 @@ static void smc_enable(struct net_device *dev)
 	/*
 	 * From this point the register bank must _NOT_ be switched away
 	 * to something else than bank 2 without proper locking against
-	 * races with any tasklet or interrupt handlers until smc_shutdown()
+	 * races with any work or interrupt handlers until smc_shutdown()
 	 * or smc_reset() is called.
 	 */
 }
@@ -536,9 +536,9 @@ static inline void  smc_rcv(struct net_device *dev)
 /*
  * This is called to actually send a packet to the chip.
  */
-static void smc_hardware_send_pkt(struct tasklet_struct *t)
+static void smc_hardware_send_pkt(struct work_struct *t)
 {
-	struct smc_local *lp = from_tasklet(lp, t, tx_task);
+	struct smc_local *lp = from_work(lp, t, tx_task);
 	struct net_device *dev = lp->dev;
 	void __iomem *ioaddr = lp->base;
 	struct sk_buff *skb;
@@ -550,7 +550,7 @@ static void smc_hardware_send_pkt(struct tasklet_struct *t)
 
 	if (!smc_special_trylock(&lp->lock, flags)) {
 		netif_stop_queue(dev);
-		tasklet_schedule(&lp->tx_task);
+		queue_work(system_bh_wq, &lp->tx_task);
 		return;
 	}
 
@@ -1248,7 +1248,7 @@ static irqreturn_t smc_interrupt(int irq, void *dev_id)
 			smc_rcv(dev);
 		} else if (status & IM_ALLOC_INT) {
 			DBG(3, dev, "Allocation irq\n");
-			tasklet_hi_schedule(&lp->tx_task);
+			queue_work(system_bh_highpri_wq, &lp->tx_task);
 			mask &= ~IM_ALLOC_INT;
 		} else if (status & IM_TX_EMPTY_INT) {
 			DBG(3, dev, "TX empty\n");
@@ -1515,7 +1515,7 @@ static int smc_close(struct net_device *dev)
 
 	/* clear everything */
 	smc_shutdown(dev);
-	tasklet_kill(&lp->tx_task);
+	cancel_work_sync(&lp->tx_task);
 	smc_phy_powerdown(dev);
 	return 0;
 }
@@ -1968,7 +1968,7 @@ static int smc_probe(struct net_device *dev, void __iomem *ioaddr,
 	dev->netdev_ops = &smc_netdev_ops;
 	dev->ethtool_ops = &smc_ethtool_ops;
 
-	tasklet_setup(&lp->tx_task, smc_hardware_send_pkt);
+	INIT_WORK(&lp->tx_task, smc_hardware_send_pkt);
 	INIT_WORK(&lp->phy_configure, smc_phy_configure);
 	lp->dev = dev;
 	lp->mii.phy_id_mask = 0x1f;
diff --git a/drivers/net/ethernet/smsc/smc91x.h b/drivers/net/ethernet/smsc/smc91x.h
index 46eee747c699..a3e7bd8ba2e0 100644
--- a/drivers/net/ethernet/smsc/smc91x.h
+++ b/drivers/net/ethernet/smsc/smc91x.h
@@ -201,7 +201,7 @@ struct smc_local {
 	 * desired memory.  Then, I'll send it out and free it.
 	 */
 	struct sk_buff *pending_tx_skb;
-	struct tasklet_struct tx_task;
+	struct work_struct tx_task;
 
 	struct gpio_desc *power_gpio;
 	struct gpio_desc *reset_gpio;
@@ -260,6 +260,7 @@ struct smc_local {
  * as RX which can overrun memory and lose packets.
  */
 #include <linux/dma-mapping.h>
+#include <linux/workqueue.h>
 
 #ifdef SMC_insl
 #undef SMC_insl
diff --git a/include/linux/mlx4/device.h b/include/linux/mlx4/device.h
index 27f42f713c89..e5605dbdb5ca 100644
--- a/include/linux/mlx4/device.h
+++ b/include/linux/mlx4/device.h
@@ -745,7 +745,7 @@ struct mlx4_cq {
 		struct list_head list;
 		void (*comp)(struct mlx4_cq *);
 		void		*priv;
-	} tasklet_ctx;
+	} work_ctx;
 	int		reset_notify_added;
 	struct list_head	reset_notify;
 	u8			usage;
diff --git a/include/linux/mlx5/cq.h b/include/linux/mlx5/cq.h
index cb15308b5cb0..fd4b7b6d5ca0 100644
--- a/include/linux/mlx5/cq.h
+++ b/include/linux/mlx5/cq.h
@@ -56,7 +56,7 @@ struct mlx5_core_cq {
 		struct list_head list;
 		void (*comp)(struct mlx5_core_cq *cq, struct mlx5_eqe *eqe);
 		void		*priv;
-	} tasklet_ctx;
+	} work_ctx;
 	int			reset_notify_added;
 	struct list_head	reset_notify;
 	struct mlx5_eq_comp	*eq;
-- 
2.17.1

