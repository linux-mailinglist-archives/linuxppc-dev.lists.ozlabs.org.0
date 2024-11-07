Return-Path: <linuxppc-dev+bounces-2996-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B75B9C0C98
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV6259Gz3bqp;
	Fri,  8 Nov 2024 04:10:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999406;
	cv=none; b=R/X4viupKuH0vXSxQR+uA/x9jwEFeLH+Z6uOb5uDe+4JiBK5JDAq3eY7Itr9TSsDEBuuy+uO9LWXRx8OQMmoteKJBcFyMT+Q5e0yX0VVA1FfrInjEy7Lz56OWLvYlqCRmyK6d6t/sr2onx8zkv6dip/5E8IUmUAaOuOEDr/mzHlLldzoK0q1/GhPS/WW/zCG3MTkzW4ceWxaxSWVsUmFpqOPZBnlVnbHihbQTJ1YcqMaE1NsLSeBdkI5yN7IjZnr6xFrysSPhATvmy4f1O7K+C/LFZnB+/iZThJPuXP19tbBbkztKhDi0vTf+bfTPfEU76DgQLEcrVLoGbzM8XpbkA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999406; c=relaxed/relaxed;
	bh=k6q7tdI6RrEYm0CUr1INjQm0vYZfLZRptd9Ex9Lu9TA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NFFYyFciwZfJ1SS3hYWxpmx7Vk64YkfItclZTNDFNzz4+vr1lSwAA6Pul9bpMDECjCFfxETMD8k07T24z7Q7u2YY3qzmlcSc88kz7o7bshJGY7yZatlanzMYlygXVo1riNoDFLCthJYpPsUeoQB4IwQ48j2is3ZfFFR4rfI2lpXDA/m8Mud36qKV9VewL4G179TtSzBqrCBlSbqQ1Dz7T4f5NPMDcij5Q42SvdMvSVdZD4z89lemqFFqHgcAo3HRPFo6wRD0Wn06mspePPWoUdSI4HJqhJeMbVHJAmcr2Ki6yoyNJ/cKmJojvKdRRL8vqbY86q1+u6NI8WSApy1xbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oJxc5x9r; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=oJxc5x9r;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpV44f8Qz3brC
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:10:03 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 9F967C38F3
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:22 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3E46E240003;
	Thu,  7 Nov 2024 17:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k6q7tdI6RrEYm0CUr1INjQm0vYZfLZRptd9Ex9Lu9TA=;
	b=oJxc5x9rOv27FaUmQAe8RP9079WfwAEhFD3DXJ7M8rzVXn+rQsrW2+M0TL8gfGVL51E8wf
	yMrPXPmH5m/gJzlPQdkjCZNT7HH+VI+SqW+MppLvQQnUQ+WnAFWnHVV+xJ8XIlyG3m1J1v
	BBQNJWCOab+2pLUinXL3+S3aii2vRIG/6WoQ0iL4nZPVow13KUp9K0nw5CP292GvX8NnDL
	IVy7AStV/xP79i4QJ5EeZDRi/wc2fDbYKHiRkOPmf3K3f1rS/LzEmN9XDzz79vOivDT7eT
	scgn0EdJxZnqv0zUl6zTcNy4ek1nR0SVTKbzffSYseCoYctjeI9HnJ/RRWksoA==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next 3/7] net: freescale: ucc_geth: Use netdev->phydev to access the PHY
Date: Thu,  7 Nov 2024 18:02:50 +0100
Message-ID: <20241107170255.1058124-4-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
References: <20241107170255.1058124-1-maxime.chevallier@bootlin.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

As this driver pre-dates phylib, it uses a private pointer to get a
reference to the attached phy_device. Drop that pointer and use the
netdev's pointer instead.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/ucc_geth.c     | 27 ++++++++-----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  1 -
 .../net/ethernet/freescale/ucc_geth_ethtool.c | 17 ++++++------
 3 files changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 6286cd185a35..13b8f8401c81 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1646,7 +1646,7 @@ static void ugeth_link_down(struct ucc_geth_private *ugeth)
 static void adjust_link(struct net_device *dev)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = dev->phydev;
 
 	if (phydev->link)
 		ugeth_link_up(ugeth, phydev, phydev->interface,
@@ -1727,8 +1727,6 @@ static int init_phy(struct net_device *dev)
 
 	phy_set_max_speed(phydev, priv->max_speed);
 
-	priv->phydev = phydev;
-
 	return 0;
 }
 
@@ -2001,7 +1999,7 @@ static void ucc_geth_set_multi(struct net_device *dev)
 static void ucc_geth_stop(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = ugeth->ndev->phydev;
 
 	ugeth_vdbg("%s: IN", __func__);
 
@@ -3316,13 +3314,13 @@ static int ucc_geth_open(struct net_device *dev)
 		goto err;
 	}
 
-	phy_start(ugeth->phydev);
+	phy_start(dev->phydev);
 	napi_enable(&ugeth->napi);
 	netdev_reset_queue(dev);
 	netif_start_queue(dev);
 
 	device_set_wakeup_capable(&dev->dev,
-			qe_alive_during_sleep() || ugeth->phydev->irq);
+			qe_alive_during_sleep() || dev->phydev->irq);
 	device_set_wakeup_enable(&dev->dev, ugeth->wol_en);
 
 	return err;
@@ -3343,8 +3341,7 @@ static int ucc_geth_close(struct net_device *dev)
 
 	cancel_work_sync(&ugeth->timeout_work);
 	ucc_geth_stop(ugeth);
-	phy_disconnect(ugeth->phydev);
-	ugeth->phydev = NULL;
+	phy_disconnect(dev->phydev);
 
 	free_irq(ugeth->ug_info->uf_info.irq, ugeth->ndev);
 
@@ -3378,7 +3375,7 @@ static void ucc_geth_timeout_work(struct work_struct *work)
 		ucc_geth_stop(ugeth);
 		ucc_geth_init_mac(ugeth);
 		/* Must start PHY here */
-		phy_start(ugeth->phydev);
+		phy_start(dev->phydev);
 		netif_tx_start_all_queues(dev);
 	}
 
@@ -3421,7 +3418,7 @@ static int ucc_geth_suspend(struct platform_device *ofdev, pm_message_t state)
 		setbits32(&ugeth->ug_regs->maccfg2, MACCFG2_MPE);
 		ucc_fast_enable(ugeth->uccf, COMM_DIR_RX_AND_TX);
 	} else if (!(ugeth->wol_en & WAKE_PHY)) {
-		phy_stop(ugeth->phydev);
+		phy_stop(ndev->phydev);
 	}
 
 	return 0;
@@ -3461,8 +3458,8 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 	ugeth->oldspeed = 0;
 	ugeth->oldduplex = -1;
 
-	phy_stop(ugeth->phydev);
-	phy_start(ugeth->phydev);
+	phy_stop(ndev->phydev);
+	phy_start(ndev->phydev);
 
 	napi_enable(&ugeth->napi);
 	netif_device_attach(ndev);
@@ -3477,15 +3474,13 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 
 static int ucc_geth_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
-	struct ucc_geth_private *ugeth = netdev_priv(dev);
-
 	if (!netif_running(dev))
 		return -EINVAL;
 
-	if (!ugeth->phydev)
+	if (!dev->phydev)
 		return -ENODEV;
 
-	return phy_mii_ioctl(ugeth->phydev, rq, cmd);
+	return phy_mii_ioctl(dev->phydev, rq, cmd);
 }
 
 static const struct net_device_ops ucc_geth_netdev_ops = {
diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index 4294ed096ebb..c08a56b7c9fe 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -1210,7 +1210,6 @@ struct ucc_geth_private {
 	u16 skb_dirtytx[NUM_TX_QUEUES];
 
 	struct ugeth_mii_info *mii_info;
-	struct phy_device *phydev;
 	phy_interface_t phy_interface;
 	int max_speed;
 	uint32_t msg_enable;
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 699f346faf5c..fb5254d7d1ba 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -103,8 +103,7 @@ static const char rx_fw_stat_gstrings[][ETH_GSTRING_LEN] = {
 static int
 uec_get_ksettings(struct net_device *netdev, struct ethtool_link_ksettings *cmd)
 {
-	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = netdev->phydev;
 
 	if (!phydev)
 		return -ENODEV;
@@ -118,8 +117,7 @@ static int
 uec_set_ksettings(struct net_device *netdev,
 		  const struct ethtool_link_ksettings *cmd)
 {
-	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = netdev->phydev;
 
 	if (!phydev)
 		return -ENODEV;
@@ -132,8 +130,10 @@ uec_get_pauseparam(struct net_device *netdev,
                      struct ethtool_pauseparam *pause)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
 
-	pause->autoneg = ugeth->phydev->autoneg;
+	if (phydev)
+		pause->autoneg = phydev->autoneg;
 
 	if (ugeth->ug_info->receiveFlowControl)
 		pause->rx_pause = 1;
@@ -146,12 +146,13 @@ uec_set_pauseparam(struct net_device *netdev,
                      struct ethtool_pauseparam *pause)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
+	struct phy_device *phydev = netdev->phydev;
 	int ret = 0;
 
 	ugeth->ug_info->receiveFlowControl = pause->rx_pause;
 	ugeth->ug_info->transmitFlowControl = pause->tx_pause;
 
-	if (ugeth->phydev->autoneg) {
+	if (phydev && phydev->autoneg) {
 		if (netif_running(netdev)) {
 			/* FIXME: automatically restart */
 			netdev_info(netdev, "Please re-open the interface\n");
@@ -343,7 +344,7 @@ uec_get_drvinfo(struct net_device *netdev,
 static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = netdev->phydev;
 
 	if (phydev && phydev->irq)
 		wol->supported |= WAKE_PHY;
@@ -356,7 +357,7 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 static int uec_set_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = ugeth->phydev;
+	struct phy_device *phydev = netdev->phydev;
 
 	if (wol->wolopts & ~(WAKE_PHY | WAKE_MAGIC))
 		return -EINVAL;
-- 
2.47.0


