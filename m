Return-Path: <linuxppc-dev+bounces-3232-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E6079C8E52
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Nov 2024 16:37:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Xq44n5X5Zz30TK;
	Fri, 15 Nov 2024 02:36:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::228"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1731598585;
	cv=none; b=fZxGJDIbkcZipsA5RkUlL64B0O16B5IR0be0yrZRrTSP3jB9cqLbpH7l53xD4EPCgY3Xcw49AdkYkl3xfN853huytAN2/cSWbUEt1XqXvAzou6IBj/kDUvFASAXbEAorsCXjotppZv3UICB9X6RUhMKvhHwwzghCRsbLTzxeuCL+qgIGTzv5HmOadP/38k9VCHW4PSgVr9Q0j5q6pKwhzaJIOe1AhSOasOmxCZiW0g6kCfiLaGcicg1sjAUoJ6Y+5JM6ogx+V1uIO+732YROwbB499XoUQ8BR3EzurCfHUsmWdhqkwYcFNlW9pGIZNAwcG4IhixaTv0NXGx4qlKIdg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1731598585; c=relaxed/relaxed;
	bh=2J76VxJOFhE7W3G57sG/Tt9BM1TPg186/HkI44UmxWw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y5tQ6Oqxux524T99CnQn263TU8YvG29DPjqPslMjTBWzKO8xNm0ramuTMlcMLgiPLjn8BQGcFrq16T/BUZa/EYCTgkxKMfUFYtBkurRgZmY6UMxb8dvFtAV/R6QM4yWRMpx1ojxq82bMZK6/ID8P8xEpDELwkCDY9v/BeSYwnxArlYNB7VH3X6WEVI85LTjqzn5LOzGdMNGRcy4G06U/Zulnp/ZkP+s1FFinhSNXdwH1h1LhdBhjLtv4Ad9M2d4/Oi/ErdKPL88iGLHMdPlwkvFoI9PNNffaV1Yql/xdNQPKLSybV/CtBTA1UU1oAdKlnSYjvthVqc5e0gAJjhn3rA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FM20FU5O; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=FM20FU5O;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::228; helo=relay8-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Xq44g6psxz306d
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 15 Nov 2024 02:36:19 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 22B781BF206;
	Thu, 14 Nov 2024 15:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1731598567;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2J76VxJOFhE7W3G57sG/Tt9BM1TPg186/HkI44UmxWw=;
	b=FM20FU5O6wYlTQaNiSx3v+cWLn+KxSgejmicoCY8EaaA1B8McXZ3qoyZSoJolg7UbHj/oQ
	+plmJWfGN2DpT5QuM2uWkuJUy0Bl1JSkDrZFdUih2IBboNbZxK4kNYQ5rFUl82aiPxD3S4
	0qOpjBQazmJXXqpbvf2po2CniM0QpcZiTnrwnkGMJlZHRmiXIK5Qut7/aTvrNxyBhnOb89
	SKQ/OynqEwv+uCZO10RXQp6de+5OupKK3wsNNmK/ii64r8gu3tJyKdIF3lZziTvT9c26lr
	ONP689zqjr8MOxGXyW8c136/+sNMvNDl+MrXQulod085Ok8/3pRdHyPTfpfybg==
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
Subject: [PATCH net-next v2 02/10] net: freescale: ucc_geth: split adjust_link for phylink conversion
Date: Thu, 14 Nov 2024 16:35:53 +0100
Message-ID: <20241114153603.307872-3-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
References: <20241114153603.307872-1-maxime.chevallier@bootlin.com>
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

Preparing the phylink conversion, split the adjust_link callbaclk, by
clearly separating the mac configuration, link_up and link_down phases.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V2: No changes.

Russell, I did see your comment with regards to the overall usefulness
of this patch, hopefully now patch 10 is a easier to digest now, but if
now I'll just merge that one with the actual phylink switch in patch 10.

 drivers/net/ethernet/freescale/ucc_geth.c | 180 +++++++++++-----------
 1 file changed, 93 insertions(+), 87 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 80540c817c4e..6286cd185a35 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1548,105 +1548,111 @@ static void ugeth_activate(struct ucc_geth_private *ugeth)
 	__netdev_watchdog_up(ugeth->ndev);
 }
 
-/* Called every time the controller might need to be made
- * aware of new link state.  The PHY code conveys this
- * information through variables in the ugeth structure, and this
- * function converts those variables into the appropriate
- * register values, and can bring down the device if needed.
- */
-
-static void adjust_link(struct net_device *dev)
+static void ugeth_link_up(struct ucc_geth_private *ugeth,
+			  struct phy_device *phy,
+			  phy_interface_t interface, int speed, int duplex)
 {
-	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct ucc_geth __iomem *ug_regs;
-	struct ucc_fast __iomem *uf_regs;
-	struct phy_device *phydev = ugeth->phydev;
+	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
+	struct ucc_fast __iomem *uf_regs = ugeth->uccf->uf_regs;
+	u32 tempval = in_be32(&ug_regs->maccfg2);
+	u32 upsmr = in_be32(&uf_regs->upsmr);
 	int new_state = 0;
 
-	ug_regs = ugeth->ug_regs;
-	uf_regs = ugeth->uccf->uf_regs;
-
-	if (phydev->link) {
-		u32 tempval = in_be32(&ug_regs->maccfg2);
-		u32 upsmr = in_be32(&uf_regs->upsmr);
-		/* Now we make sure that we can be in full duplex mode.
-		 * If not, we operate in half-duplex mode. */
-		if (phydev->duplex != ugeth->oldduplex) {
-			new_state = 1;
-			if (!(phydev->duplex))
-				tempval &= ~(MACCFG2_FDX);
-			else
-				tempval |= MACCFG2_FDX;
-			ugeth->oldduplex = phydev->duplex;
-		}
+	/* Now we make sure that we can be in full duplex mode.
+	 * If not, we operate in half-duplex mode.
+	 */
+	if (duplex != ugeth->oldduplex) {
+		new_state = 1;
+		if (duplex == DUPLEX_HALF)
+			tempval &= ~(MACCFG2_FDX);
+		else
+			tempval |= MACCFG2_FDX;
+		ugeth->oldduplex = duplex;
+	}
 
-		if (phydev->speed != ugeth->oldspeed) {
-			new_state = 1;
-			switch (phydev->speed) {
-			case SPEED_1000:
-				tempval = ((tempval &
-					    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-					    MACCFG2_INTERFACE_MODE_BYTE);
-				break;
-			case SPEED_100:
-			case SPEED_10:
-				tempval = ((tempval &
-					    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-					    MACCFG2_INTERFACE_MODE_NIBBLE);
-				/* if reduced mode, re-set UPSMR.R10M */
-				if ((ugeth->phy_interface == PHY_INTERFACE_MODE_RMII) ||
-				    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII) ||
-				    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-				    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-				    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) ||
-				    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
-					if (phydev->speed == SPEED_10)
-						upsmr |= UCC_GETH_UPSMR_R10M;
-					else
-						upsmr &= ~UCC_GETH_UPSMR_R10M;
-				}
-				break;
-			default:
-				if (netif_msg_link(ugeth))
-					pr_warn(
-						"%s: Ack!  Speed (%d) is not 10/100/1000!",
-						dev->name, phydev->speed);
-				break;
+	if (speed != ugeth->oldspeed) {
+		new_state = 1;
+		switch (speed) {
+		case SPEED_1000:
+			tempval = ((tempval &
+				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
+				    MACCFG2_INTERFACE_MODE_BYTE);
+			break;
+		case SPEED_100:
+		case SPEED_10:
+			tempval = ((tempval &
+				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
+				    MACCFG2_INTERFACE_MODE_NIBBLE);
+			/* if reduced mode, re-set UPSMR.R10M */
+			if (interface == PHY_INTERFACE_MODE_RMII ||
+			    phy_interface_mode_is_rgmii(interface) ||
+			    interface == PHY_INTERFACE_MODE_RTBI) {
+				if (speed == SPEED_10)
+					upsmr |= UCC_GETH_UPSMR_R10M;
+				else
+					upsmr &= ~UCC_GETH_UPSMR_R10M;
 			}
-			ugeth->oldspeed = phydev->speed;
+			break;
+		default:
+			if (netif_msg_link(ugeth))
+				pr_warn("%s:  Speed (%d) is not 10/100/1000!",
+					netdev_name(ugeth->ndev), speed);
+			break;
 		}
+		ugeth->oldspeed = speed;
+	}
 
-		if (!ugeth->oldlink) {
-			new_state = 1;
-			ugeth->oldlink = 1;
-		}
+	if (!ugeth->oldlink) {
+		new_state = 1;
+		ugeth->oldlink = 1;
+	}
 
-		if (new_state) {
-			/*
-			 * To change the MAC configuration we need to disable
-			 * the controller. To do so, we have to either grab
-			 * ugeth->lock, which is a bad idea since 'graceful
-			 * stop' commands might take quite a while, or we can
-			 * quiesce driver's activity.
-			 */
-			ugeth_quiesce(ugeth);
-			ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
+	if (new_state) {
+		/*
+		 * To change the MAC configuration we need to disable
+		 * the controller. To do so, we have to either grab
+		 * ugeth->lock, which is a bad idea since 'graceful
+		 * stop' commands might take quite a while, or we can
+		 * quiesce driver's activity.
+		 */
+		ugeth_quiesce(ugeth);
+		ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
 
-			out_be32(&ug_regs->maccfg2, tempval);
-			out_be32(&uf_regs->upsmr, upsmr);
+		out_be32(&ug_regs->maccfg2, tempval);
+		out_be32(&uf_regs->upsmr, upsmr);
 
-			ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
-			ugeth_activate(ugeth);
-		}
-	} else if (ugeth->oldlink) {
-			new_state = 1;
-			ugeth->oldlink = 0;
-			ugeth->oldspeed = 0;
-			ugeth->oldduplex = -1;
+		ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
+		ugeth_activate(ugeth);
 	}
 
-	if (new_state && netif_msg_link(ugeth))
-		phy_print_status(phydev);
+	if (netif_msg_link(ugeth))
+		phy_print_status(phy);
+}
+
+static void ugeth_link_down(struct ucc_geth_private *ugeth)
+{
+	ugeth->oldlink = 0;
+	ugeth->oldspeed = 0;
+	ugeth->oldduplex = -1;
+}
+
+/* Called every time the controller might need to be made
+ * aware of new link state.  The PHY code conveys this
+ * information through variables in the ugeth structure, and this
+ * function converts those variables into the appropriate
+ * register values, and can bring down the device if needed.
+ */
+
+static void adjust_link(struct net_device *dev)
+{
+	struct ucc_geth_private *ugeth = netdev_priv(dev);
+	struct phy_device *phydev = ugeth->phydev;
+
+	if (phydev->link)
+		ugeth_link_up(ugeth, phydev, phydev->interface,
+			      phydev->speed, phydev->duplex);
+	else
+		ugeth_link_down(ugeth);
 }
 
 /* Initialize TBI PHY interface for communicating with the
-- 
2.47.0


