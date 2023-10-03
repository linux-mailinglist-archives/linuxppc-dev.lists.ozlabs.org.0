Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFC17B744C
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 00:52:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4mX8P14;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Y4j5Pvfz3vcX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 09:52:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=V4mX8P14;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::434; helo=mail-wr1-x434.google.com; envelope-from=ansuelsmth@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0RP94zm0z3vwM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:36:45 +1100 (AEDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3231df054c4so1238756f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 03 Oct 2023 11:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696358202; x=1696963002; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+fCFYguW26XBa+rOo0KRC67oNqcDD6Ug3bXWKB0TTpQ=;
        b=V4mX8P14E9N4yeRML6vXLlfUoegIodS95jV0aDjMbnWI6BlXVq7Q0qDZurpzvjM9Tg
         d7Rg8OlHRShcsP9322R2MrpTKl8mDn5b1JOKjWvXslw+SufBUgmzCBUMTT4/8/GV0FTJ
         5bOOYQro9rlOiO9gAwhvH8npQrveU111yivNZDSHEfafKCuUT7+z5q8IqoMszB2sbd6W
         ZkKNKSO2UoX/hkh1mHK+5v4nBRXBpqE0BzRZqJrcM+ukdRREYU3vCdYkS7OrxV9onkSH
         8jcJieymKDOWJAoiPbAeHoZeGYWpMBYu4pAQHxAUCohr3XueYXbP6WxWHwQa5KRwne5M
         /Q3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696358202; x=1696963002;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+fCFYguW26XBa+rOo0KRC67oNqcDD6Ug3bXWKB0TTpQ=;
        b=f5Qy0sE6Ua5HVA9BJTEj7/JeiKRLqKBZr9GwAZ95CQAjPJQ3EZLCfqc8pEv12hp10H
         A91eZURPCEMhesNUvqc0WyWzaa8EsApqUcoGbCYG1VS6LhNtK+GFws3nDf/drCT6//pA
         6TCKSlVZAdL+UK6ZHVSxqnq3rblbkvNg/vKZ3PoA6bhOa20Iks+3N/CDrUbqCzIVZcvT
         WqIN1NBo/nQJA2Y1ePfxyqFEXDJ+5QOy80B0nQ0hnDoFbr/TDRDSpvYxKG1/3PC97Xql
         fDEFR31i8exKEIKmZ0eaOOFmag5z9UsBjVjyDXzO+yrJsGDLp0FPfstvuXX9UISDdisj
         1ssg==
X-Gm-Message-State: AOJu0YxVfldmC29fZP0wynVMASprm5trqN4J4SMCQ5ZkdfQQeaWqWxYl
	c+EcbGqPYKnNp4gzygx2iZE=
X-Google-Smtp-Source: AGHT+IG7bkG2n/qQaertwmXTrNhAacTId8YcGp5AKj0I0Rq0xnocVh8f9vBhWG7s7pyfk1y9PtIoCw==
X-Received: by 2002:adf:e892:0:b0:31f:f72c:dfa3 with SMTP id d18-20020adfe892000000b0031ff72cdfa3mr48759wrm.68.1696358202368;
        Tue, 03 Oct 2023 11:36:42 -0700 (PDT)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id k15-20020a7bc40f000000b004013797efb6sm10147400wmi.9.2023.10.03.11.36.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 11:36:42 -0700 (PDT)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Jason Gunthorpe <jgg@ziepe.ca>,
	Leon Romanovsky <leon@kernel.org>,
	Wolfgang Grandegger <wg@grandegger.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Chris Snook <chris.snook@gmail.com>,
	Raju Rangoju <rajur@chelsio.com>,
	Jeroen de Borst <jeroendb@google.com>,
	Praveen Kaligineedi <pkaligineedi@google.com>,
	Shailend Chand <shailend@google.com>,
	Douglas Miller <dougmill@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Nick Child <nnac123@linux.ibm.com>,
	Haren Myneni <haren@linux.ibm.com>,
	Rick Lindsley <ricklind@linux.ibm.com>,
	Dany Madden <danymadden@us.ibm.com>,
	Thomas Falcon <tlfalcon@linux.ibm.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <quic_jjohnson@quicinc.com>,
	Gregory Greenman <gregory.greenman@intel.com>,
	Chandrashekar Devegowda <chandrashekar.devegowda@intel.com>,
	Intel Corporation <linuxwwan@intel.com>,
	Chiranjeevi Rapolu <chiranjeevi.rapolu@linux.intel.com>,
	Liu Haijun <haijun.liu@mediatek.com>,
	M Chetan Kumar <m.chetan.kumar@linux.intel.com>,
	Ricardo Martinez <ricardo.martinez@linux.intel.com>,
	Loic Poulain <loic.poulain@linaro.org>,
	Sergey Ryazanov <ryazanov.s.a@gmail.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Yuanjun Gong <ruc_gongyuanjun@163.com>,
	Simon Horman <horms@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Ziwei Xiao <ziweixiao@google.com>,
	Rushil Gupta <rushilg@google.com>,
	Coco Li <lixiaoyan@google.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Junfeng Guo <junfeng.guo@intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Wei Fang <wei.fang@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Yuri Karpov <YKarpov@ispras.ru>,
	Zhengchao Shao <shaozhengchao@huawei.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Zheng Zengkai <zhengzengkai@huawei.com>,
	Lee Jones <lee@kernel.org>,
	Maximilian Luz <luzmaximilian@gmail.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Dawei Li <set_pte_at@outlook.com>,
	Anjaneyulu <pagadala.yesu.anjaneyulu@intel.com>,
	Benjamin Berg <benjamin.berg@intel.com>,
	linux-rdma@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-can@vger.kernel.org,
	netdev@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	ath10k@lists.infradead.org,
	linux-wireless@vger.kernel.org
Subject: [net-next PATCH v2 3/4] netdev: replace napi_reschedule with napi_schedule
Date: Tue,  3 Oct 2023 16:51:49 +0200
Message-Id: <20231003145150.2498-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003145150.2498-1-ansuelsmth@gmail.com>
References: <20231003145150.2498-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 04 Oct 2023 09:50:30 +1100
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that napi_schedule return a bool, we can drop napi_reschedule that
does the same exact function. The function comes from a very old commit
bfe13f54f502 ("ibm_emac: Convert to use napi_struct independent of struct
net_device") and the purpose is actually deprecated in favour of
different logic.

Convert every user of napi_reschedule to napi_schedule.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com> # ath10k
Acked-by: Nick Child <nnac123@linux.ibm.com> # ibm
Acked-by: Marc Kleine-Budde <mkl@pengutronix.de> # for can/dev/rx-offload.c
---
Changes v2:
- Add ack tag
---
 drivers/infiniband/ulp/ipoib/ipoib_ib.c                |  4 ++--
 drivers/net/can/dev/rx-offload.c                       |  2 +-
 drivers/net/ethernet/chelsio/cxgb4/sge.c               |  2 +-
 drivers/net/ethernet/chelsio/cxgb4vf/sge.c             |  2 +-
 drivers/net/ethernet/ezchip/nps_enet.c                 |  2 +-
 drivers/net/ethernet/google/gve/gve_main.c             |  2 +-
 drivers/net/ethernet/ibm/ehea/ehea_main.c              |  2 +-
 drivers/net/ethernet/ibm/emac/mal.c                    |  2 +-
 drivers/net/ethernet/ibm/ibmveth.c                     |  2 +-
 drivers/net/ethernet/ibm/ibmvnic.c                     |  2 +-
 drivers/net/ethernet/mellanox/mlx4/en_rx.c             |  2 +-
 drivers/net/ethernet/ni/nixge.c                        |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c |  2 +-
 drivers/net/ethernet/xscale/ixp4xx_eth.c               |  4 ++--
 drivers/net/fjes/fjes_main.c                           |  2 +-
 drivers/net/wan/ixp4xx_hss.c                           |  4 ++--
 drivers/net/wireless/ath/ath10k/pci.c                  |  2 +-
 drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c             |  2 +-
 include/linux/netdevice.h                              | 10 ----------
 19 files changed, 21 insertions(+), 31 deletions(-)

diff --git a/drivers/infiniband/ulp/ipoib/ipoib_ib.c b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
index ed25061fac62..7f84d9866cef 100644
--- a/drivers/infiniband/ulp/ipoib/ipoib_ib.c
+++ b/drivers/infiniband/ulp/ipoib/ipoib_ib.c
@@ -488,7 +488,7 @@ int ipoib_rx_poll(struct napi_struct *napi, int budget)
 		if (unlikely(ib_req_notify_cq(priv->recv_cq,
 					      IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 
@@ -518,7 +518,7 @@ int ipoib_tx_poll(struct napi_struct *napi, int budget)
 		napi_complete(napi);
 		if (unlikely(ib_req_notify_cq(priv->send_cq, IB_CQ_NEXT_COMP |
 					      IB_CQ_REPORT_MISSED_EVENTS)) &&
-		    napi_reschedule(napi))
+		    napi_schedule(napi))
 			goto poll_more;
 	}
 	return n < 0 ? 0 : n;
diff --git a/drivers/net/can/dev/rx-offload.c b/drivers/net/can/dev/rx-offload.c
index 77091f7d1fa7..46e7b6db4a1e 100644
--- a/drivers/net/can/dev/rx-offload.c
+++ b/drivers/net/can/dev/rx-offload.c
@@ -67,7 +67,7 @@ static int can_rx_offload_napi_poll(struct napi_struct *napi, int quota)
 
 		/* Check if there was another interrupt */
 		if (!skb_queue_empty(&offload->skb_queue))
-			napi_reschedule(&offload->napi);
+			napi_schedule(&offload->napi);
 	}
 
 	return work_done;
diff --git a/drivers/net/ethernet/chelsio/cxgb4/sge.c b/drivers/net/ethernet/chelsio/cxgb4/sge.c
index 98dd78551d89..b5ff2e1a9975 100644
--- a/drivers/net/ethernet/chelsio/cxgb4/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4/sge.c
@@ -4261,7 +4261,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 
 			if (fl_starving(adap, fl)) {
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
index 2d0cf76fb3c5..5b1d746e6563 100644
--- a/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
+++ b/drivers/net/ethernet/chelsio/cxgb4vf/sge.c
@@ -2094,7 +2094,7 @@ static void sge_rx_timer_cb(struct timer_list *t)
 				struct sge_eth_rxq *rxq;
 
 				rxq = container_of(fl, struct sge_eth_rxq, fl);
-				if (napi_reschedule(&rxq->rspq.napi))
+				if (napi_schedule(&rxq->rspq.napi))
 					fl->starving++;
 				else
 					set_bit(id, s->starving_fl);
diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index edf000e7bab4..4d7184d46824 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -198,7 +198,7 @@ static int nps_enet_poll(struct napi_struct *napi, int budget)
 		 */
 		if (nps_enet_is_tx_pending(priv)) {
 			nps_enet_reg_set(priv, NPS_ENET_REG_BUF_INT_ENABLE, 0);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		}
 	}
 
diff --git a/drivers/net/ethernet/google/gve/gve_main.c b/drivers/net/ethernet/google/gve/gve_main.c
index 83b09dcfafc4..276f996f95dc 100644
--- a/drivers/net/ethernet/google/gve/gve_main.c
+++ b/drivers/net/ethernet/google/gve/gve_main.c
@@ -281,7 +281,7 @@ static int gve_napi_poll(struct napi_struct *napi, int budget)
 		if (block->rx)
 			reschedule |= gve_rx_work_pending(block->rx);
 
-		if (reschedule && napi_reschedule(napi))
+		if (reschedule && napi_schedule(napi))
 			iowrite32be(GVE_IRQ_MASK, irq_doorbell);
 	}
 	return work_done;
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 251dedd55cfb..1e29e5c9a2df 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -900,7 +900,7 @@ static int ehea_poll(struct napi_struct *napi, int budget)
 		if (!cqe && !cqe_skb)
 			return rx;
 
-		if (!napi_reschedule(napi))
+		if (!napi_schedule(napi))
 			return rx;
 
 		cqe_skb = ehea_proc_cqes(pr, EHEA_POLL_MAX_CQES);
diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index 462646d1b817..2439f7e96e05 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -442,7 +442,7 @@ static int mal_poll(struct napi_struct *napi, int budget)
 		if (unlikely(mc->ops->peek_rx(mc->dev) ||
 			     test_bit(MAL_COMMAC_RX_STOPPED, &mc->flags))) {
 			MAL_DBG2(mal, "rotting packet" NL);
-			if (!napi_reschedule(napi))
+			if (!napi_schedule(napi))
 				goto more_work;
 
 			spin_lock_irqsave(&mal->lock, flags);
diff --git a/drivers/net/ethernet/ibm/ibmveth.c b/drivers/net/ethernet/ibm/ibmveth.c
index 832a2ae01950..9490272c0421 100644
--- a/drivers/net/ethernet/ibm/ibmveth.c
+++ b/drivers/net/ethernet/ibm/ibmveth.c
@@ -1433,7 +1433,7 @@ static int ibmveth_poll(struct napi_struct *napi, int budget)
 		BUG_ON(lpar_rc != H_SUCCESS);
 
 		if (ibmveth_rxq_pending_buffer(adapter) &&
-		    napi_reschedule(napi)) {
+		    napi_schedule(napi)) {
 			lpar_rc = h_vio_signal(adapter->vdev->unit_address,
 					       VIO_IRQ_DISABLE);
 		}
diff --git a/drivers/net/ethernet/ibm/ibmvnic.c b/drivers/net/ethernet/ibm/ibmvnic.c
index cdf5251e5679..2094f413cbe4 100644
--- a/drivers/net/ethernet/ibm/ibmvnic.c
+++ b/drivers/net/ethernet/ibm/ibmvnic.c
@@ -3519,7 +3519,7 @@ static int ibmvnic_poll(struct napi_struct *napi, int budget)
 		if (napi_complete_done(napi, frames_processed)) {
 			enable_scrq_irq(adapter, rx_scrq);
 			if (pending_scrq(adapter, rx_scrq)) {
-				if (napi_reschedule(napi)) {
+				if (napi_schedule(napi)) {
 					disable_scrq_irq(adapter, rx_scrq);
 					goto restart_poll;
 				}
diff --git a/drivers/net/ethernet/mellanox/mlx4/en_rx.c b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
index 332472fe4990..a09b6e05337d 100644
--- a/drivers/net/ethernet/mellanox/mlx4/en_rx.c
+++ b/drivers/net/ethernet/mellanox/mlx4/en_rx.c
@@ -400,7 +400,7 @@ void mlx4_en_recover_from_oom(struct mlx4_en_priv *priv)
 	for (ring = 0; ring < priv->rx_ring_num; ring++) {
 		if (mlx4_en_is_ring_empty(priv->rx_ring[ring])) {
 			local_bh_disable();
-			napi_reschedule(&priv->rx_cq[ring]->napi);
+			napi_schedule(&priv->rx_cq[ring]->napi);
 			local_bh_enable();
 		}
 	}
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index f71a4f8bbb89..fa1f78b03cb2 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -683,7 +683,7 @@ static int nixge_poll(struct napi_struct *napi, int budget)
 		if (status & (XAXIDMA_IRQ_IOC_MASK | XAXIDMA_IRQ_DELAY_MASK)) {
 			/* If there's more, reschedule, but clear */
 			nixge_dma_write_reg(priv, XAXIDMA_RX_SR_OFFSET, status);
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			/* if not, turn on RX IRQs again ... */
 			cr = nixge_dma_read_reg(priv, XAXIDMA_RX_CR_OFFSET);
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
index f9e43fc32ee8..3ca1c2a816ff 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_selftests.c
@@ -802,7 +802,7 @@ static int stmmac_test_flowctrl(struct stmmac_priv *priv)
 		stmmac_start_rx(priv, priv->ioaddr, i);
 
 		local_bh_disable();
-		napi_reschedule(&ch->rx_napi);
+		napi_schedule(&ch->rx_napi);
 		local_bh_enable();
 	}
 
diff --git a/drivers/net/ethernet/xscale/ixp4xx_eth.c b/drivers/net/ethernet/xscale/ixp4xx_eth.c
index b242aa61d8ab..64dea4ad2ad3 100644
--- a/drivers/net/ethernet/xscale/ixp4xx_eth.c
+++ b/drivers/net/ethernet/xscale/ixp4xx_eth.c
@@ -714,9 +714,9 @@ static int eth_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_below_low_watermark(rxq) &&
-			    napi_reschedule(napi)) { /* not empty again */
+			    napi_schedule(napi)) { /* not empty again */
 #if DEBUG_RX
-				netdev_debug(dev, "eth_poll napi_reschedule succeeded\n");
+				netdev_debug(dev, "eth_poll napi_schedule succeeded\n");
 #endif
 				qmgr_disable_irq(rxq);
 				continue;
diff --git a/drivers/net/fjes/fjes_main.c b/drivers/net/fjes/fjes_main.c
index 2513be6d4e11..cd8cf08477ec 100644
--- a/drivers/net/fjes/fjes_main.c
+++ b/drivers/net/fjes/fjes_main.c
@@ -1030,7 +1030,7 @@ static int fjes_poll(struct napi_struct *napi, int budget)
 		}
 
 		if (((long)jiffies - (long)adapter->rx_last_jiffies) < 3) {
-			napi_reschedule(napi);
+			napi_schedule(napi);
 		} else {
 			spin_lock(&hw->rx_status_lock);
 			for (epidx = 0; epidx < hw->max_epid; epidx++) {
diff --git a/drivers/net/wan/ixp4xx_hss.c b/drivers/net/wan/ixp4xx_hss.c
index e46b7f5ee49e..b09f4c235142 100644
--- a/drivers/net/wan/ixp4xx_hss.c
+++ b/drivers/net/wan/ixp4xx_hss.c
@@ -687,10 +687,10 @@ static int hss_hdlc_poll(struct napi_struct *napi, int budget)
 			napi_complete(napi);
 			qmgr_enable_irq(rxq);
 			if (!qmgr_stat_empty(rxq) &&
-			    napi_reschedule(napi)) {
+			    napi_schedule(napi)) {
 #if DEBUG_RX
 				printk(KERN_DEBUG "%s: hss_hdlc_poll"
-				       " napi_reschedule succeeded\n",
+				       " napi_schedule succeeded\n",
 				       dev->name);
 #endif
 				qmgr_disable_irq(rxq);
diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 23f366221939..2f8c785277af 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -3148,7 +3148,7 @@ static int ath10k_pci_napi_poll(struct napi_struct *ctx, int budget)
 		 * immediate servicing.
 		 */
 		if (ath10k_ce_interrupt_summary(ar)) {
-			napi_reschedule(ctx);
+			napi_schedule(ctx);
 			goto out;
 		}
 		ath10k_pci_enable_legacy_irq(ar);
diff --git a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
index f4ff2198b5ef..210d84c67ef9 100644
--- a/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
+++ b/drivers/net/wwan/t7xx/t7xx_hif_dpmaif_rx.c
@@ -852,7 +852,7 @@ int t7xx_dpmaif_napi_rx_poll(struct napi_struct *napi, const int budget)
 	if (!ret) {
 		napi_complete_done(napi, work_done);
 		rxq->sleep_lock_pending = true;
-		napi_reschedule(napi);
+		napi_schedule(napi);
 		return work_done;
 	}
 
diff --git a/include/linux/netdevice.h b/include/linux/netdevice.h
index 2bead8e2a14d..bbf9038f2afd 100644
--- a/include/linux/netdevice.h
+++ b/include/linux/netdevice.h
@@ -516,16 +516,6 @@ static inline void napi_schedule_irqoff(struct napi_struct *n)
 		__napi_schedule_irqoff(n);
 }
 
-/* Try to reschedule poll. Called by dev->poll() after napi_complete().  */
-static inline bool napi_reschedule(struct napi_struct *napi)
-{
-	if (napi_schedule_prep(napi)) {
-		__napi_schedule(napi);
-		return true;
-	}
-	return false;
-}
-
 /**
  * napi_complete_done - NAPI processing complete
  * @n: NAPI context
-- 
2.40.1

