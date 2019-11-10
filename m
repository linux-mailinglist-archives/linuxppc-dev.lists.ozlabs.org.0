Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC40F6710
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 04:28:13 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 479fbY67K1zDqRj
	for <lists+linuxppc-dev@lfdr.de>; Sun, 10 Nov 2019 14:28:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sashal@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="LHmYWKZS"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 479dbT27CnzF1Lg
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 10 Nov 2019 13:43:01 +1100 (AEDT)
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5A0D621655;
 Sun, 10 Nov 2019 02:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353779;
 bh=JQk9omXxklF8VgVrkHHZjnjSyVreUFDVuykH+LeLiPA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=LHmYWKZSYRtYNnvk8bCxMtZcDryaB0QRE6hPCNEh9MERo64lz0Hdb2tYaPTD/raSe
 xrvZeYDkj93F+wKzPQRzZZEKqxIBOtGwiu9xc82r4PMxT1rfgzOAuXKBPL7DEIOy4a
 AWotOcSBGIgWMjMsIykoF2rm6YMUIazaBNkWHRkg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.19 085/191] net: freescale: fix return type of
 ndo_start_xmit function
Date: Sat,  9 Nov 2019 21:38:27 -0500
Message-Id: <20191110024013.29782-85-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
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
Cc: Sasha Levin <sashal@kernel.org>, netdev@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, YueHaibing <yuehaibing@huawei.com>,
 "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: YueHaibing <yuehaibing@huawei.com>

[ Upstream commit 06983aa526c759ebdf43f202d8d0491d9494e2f4 ]

The method ndo_start_xmit() is defined as returning an 'netdev_tx_t',
which is a typedef for an enum type, so make sure the implementation in
this driver has returns 'netdev_tx_t' value, and change the function
return type to netdev_tx_t.

Found by coccinelle.

Signed-off-by: YueHaibing <yuehaibing@huawei.com>
Signed-off-by: David S. Miller <davem@davemloft.net>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c        | 3 ++-
 drivers/net/ethernet/freescale/fec_mpc52xx.c          | 3 ++-
 drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c | 3 ++-
 drivers/net/ethernet/freescale/gianfar.c              | 4 ++--
 drivers/net/ethernet/freescale/ucc_geth.c             | 3 ++-
 5 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index d7915cd68dc14..462bb8c4f80c9 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -2046,7 +2046,8 @@ static inline int dpaa_xmit(struct dpaa_priv *priv,
 	return 0;
 }
 
-static int dpaa_start_xmit(struct sk_buff *skb, struct net_device *net_dev)
+static netdev_tx_t
+dpaa_start_xmit(struct sk_buff *skb, struct net_device *net_dev)
 {
 	const int queue_mapping = skb_get_queue_mapping(skb);
 	bool nonlinear = skb_is_nonlinear(skb);
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index 6d7269d87a850..b90bab72efdb3 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -305,7 +305,8 @@ static int mpc52xx_fec_close(struct net_device *dev)
  * invariant will hold if you make sure that the netif_*_queue()
  * calls are done at the proper times.
  */
-static int mpc52xx_fec_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t
+mpc52xx_fec_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct mpc52xx_fec_priv *priv = netdev_priv(dev);
 	struct bcom_fec_bd *bd;
diff --git a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
index 2c2976a2dda6b..7c548ed535da5 100644
--- a/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
+++ b/drivers/net/ethernet/freescale/fs_enet/fs_enet-main.c
@@ -481,7 +481,8 @@ static struct sk_buff *tx_skb_align_workaround(struct net_device *dev,
 }
 #endif
 
-static int fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t
+fs_enet_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct fs_enet_private *fep = netdev_priv(dev);
 	cbd_t __iomem *bdp;
diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index f27f9bae1a4ac..c97c4edfa31bc 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -112,7 +112,7 @@
 const char gfar_driver_version[] = "2.0";
 
 static int gfar_enet_open(struct net_device *dev);
-static int gfar_start_xmit(struct sk_buff *skb, struct net_device *dev);
+static netdev_tx_t gfar_start_xmit(struct sk_buff *skb, struct net_device *dev);
 static void gfar_reset_task(struct work_struct *work);
 static void gfar_timeout(struct net_device *dev);
 static int gfar_close(struct net_device *dev);
@@ -2334,7 +2334,7 @@ static inline bool gfar_csum_errata_76(struct gfar_private *priv,
 /* This is called by the kernel when a frame is ready for transmission.
  * It is pointed to by the dev->hard_start_xmit function pointer
  */
-static int gfar_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t gfar_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct gfar_private *priv = netdev_priv(dev);
 	struct gfar_priv_tx_q *tx_queue = NULL;
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 1e2b53a934fb9..a5bf02ae4bc5c 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -3085,7 +3085,8 @@ static int ucc_geth_startup(struct ucc_geth_private *ugeth)
 
 /* This is called by the kernel when a frame is ready for transmission. */
 /* It is pointed to by the dev->hard_start_xmit function pointer */
-static int ucc_geth_start_xmit(struct sk_buff *skb, struct net_device *dev)
+static netdev_tx_t
+ucc_geth_start_xmit(struct sk_buff *skb, struct net_device *dev)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
 #ifdef CONFIG_UGETH_TX_ON_DEMAND
-- 
2.20.1

