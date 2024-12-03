Return-Path: <linuxppc-dev+bounces-3721-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D40169E1C87
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:44:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLn5Znhz3024;
	Tue,  3 Dec 2024 23:43:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229825;
	cv=none; b=V8IMRtUhFl1iwtOeFUHxuXdyaQhx6gC0PSanxLVoSan7Pdl9tnNb22/wexRUtgMig7Ezxg+Ts2G6pptbJUyneWsG8UYNKHCMa5+p5IyWYiMQnYDpfP+9WqpNTxgX5rMmVKDY6hbmIi/ufPxwx4oUgH343AJ7tXvOJne2UiS4CfxwdQiyqIXAnezH17V1+fiauOstdUprLfz9yBcynriYKsv2R76BbdiGotAsAxsqAtysMmz2PGDla+gffApZaOL8LE1wEBNEeOouiC2sx8N/FCTCM4o+4z/cM6U3Sr4Kd+ok56WQPru4MUEGxEVoS2wS1DRBE8V9IhNb4pv55Mpmjw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229825; c=relaxed/relaxed;
	bh=+tvdZ/gxOBepzsWqf8dlkPYMYadq7ckIakRRjzQFrww=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MOlkm+PEcK496obRsuPw0svnR5DexhTU1/C+mMIZXcR5aoN9XhTyx1RxlnhfXNQdCXtc2wpxOqJMsvToyKq7b+//zFpj+V2J3DQbTh3wyV/fi1/OYfgqa5ZBzzq2U/0piFDZUl5MwiiFZI9j1mOfPqkB6DZePlQOz1vRPWR6ZZXkVrrHL4AcvpS63bXVdjuEKW6RAqyEx0+JkNxuA4TRBBTROqtG7b4+lRhrl0owaiNeCApvgZw6e/Ta3jztvxDzHuJZP+vzIzPiTa5y/dDDSJr11sc3KLr0RKuA6WDUWSNntnfaHbJbMtb5V4/erdmc7R4jvrvkD38qg60NfqDqaQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=irjPdYeE; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=irjPdYeE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLk08tYz30FT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:41 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 599BDE0018;
	Tue,  3 Dec 2024 12:43:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229817;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+tvdZ/gxOBepzsWqf8dlkPYMYadq7ckIakRRjzQFrww=;
	b=irjPdYeEiRScqC6KlZNXt0SaqCvOE+GjA0I4+OGf1Ub8/+raCrWWKavofh8SCrEGoGc/ib
	4sB0SV7aDB2v0SRRf+NDQWgINjSmIx3QuDGde5H0FObjhba7MiT2i7O562McMU6vrUf9FZ
	Cw7WHj4r/FnszUGqqSyeaRjyROkE6VLlrFkW1FXbGFYOOo7vwxRTs9vVFR2TDeF8SC++KO
	jmFyrx1SNBouCOmB3OS+6xLYC3v9kMgYXgiyrXUgiC3JdRvHL3bxBRim7UJeoytOKRUY9k
	wUHJOAybaR4U9SK14zyKz/UPph0b0yV+7w38dIC/vwWXj+FYHYslMjMXq5VXXg==
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
	Simon Horman <horms@kernel.org>,
	Herve Codina <herve.codina@bootlin.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH net-next v3 10/10] net: freescale: ucc_geth: phylink conversion
Date: Tue,  3 Dec 2024 13:43:21 +0100
Message-ID: <20241203124323.155866-11-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
References: <20241203124323.155866-1-maxime.chevallier@bootlin.com>
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

ucc_geth is quite capable in terms of supported interfaces, and even
includes an externally controlled PCS (well, TBI). Port that driver to
phylink.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3: After adjusting patch 1, I also had to adjust the jump label in this
patch for the probe error handling.

 drivers/net/ethernet/freescale/Kconfig        |   3 +-
 drivers/net/ethernet/freescale/ucc_geth.c     | 445 ++++++++----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  13 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  73 +--
 4 files changed, 209 insertions(+), 325 deletions(-)

diff --git a/drivers/net/ethernet/freescale/Kconfig b/drivers/net/ethernet/freescale/Kconfig
index 75401d2a5fb4..a2d7300925a8 100644
--- a/drivers/net/ethernet/freescale/Kconfig
+++ b/drivers/net/ethernet/freescale/Kconfig
@@ -81,8 +81,7 @@ config UCC_GETH
 	tristate "Freescale QE Gigabit Ethernet"
 	depends on QUICC_ENGINE && PPC32
 	select FSL_PQ_MDIO
-	select PHYLIB
-	select FIXED_PHY
+	select PHYLINK
 	help
 	  This driver supports the Gigabit Ethernet mode of the QUICC Engine,
 	  which is available on some Freescale SOCs.
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 57debcba124c..f47f8177a93b 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -26,7 +26,7 @@
 #include <linux/dma-mapping.h>
 #include <linux/mii.h>
 #include <linux/phy.h>
-#include <linux/phy_fixed.h>
+#include <linux/phylink.h>
 #include <linux/workqueue.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -34,6 +34,7 @@
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
+#include <linux/rtnetlink.h>
 
 #include <linux/uaccess.h>
 #include <asm/irq.h>
@@ -1265,84 +1266,6 @@ static bool phy_interface_mode_is_reduced(phy_interface_t interface)
 	       interface == PHY_INTERFACE_MODE_RTBI;
 }
 
-static int adjust_enet_interface(struct ucc_geth_private *ugeth)
-{
-	struct ucc_geth_info *ug_info;
-	struct ucc_geth __iomem *ug_regs;
-	struct ucc_fast __iomem *uf_regs;
-	u32 upsmr, maccfg2;
-	u16 value;
-
-	ugeth_vdbg("%s: IN", __func__);
-
-	ug_info = ugeth->ug_info;
-	ug_regs = ugeth->ug_regs;
-	uf_regs = ugeth->uccf->uf_regs;
-
-	/*                    Set MACCFG2                    */
-	maccfg2 = in_be32(&ug_regs->maccfg2);
-
-	/* Disable frame length check */
-	maccfg2 &= ~MACCFG2_LC;
-	maccfg2 &= ~MACCFG2_INTERFACE_MODE_MASK;
-	if ((ugeth->max_speed == SPEED_10) ||
-	    (ugeth->max_speed == SPEED_100))
-		maccfg2 |= MACCFG2_INTERFACE_MODE_NIBBLE;
-	else if (ugeth->max_speed == SPEED_1000)
-		maccfg2 |= MACCFG2_INTERFACE_MODE_BYTE;
-	maccfg2 |= ug_info->padAndCrc;
-	out_be32(&ug_regs->maccfg2, maccfg2);
-
-	/*                    Set UPSMR                      */
-	upsmr = in_be32(&uf_regs->upsmr);
-	upsmr &= ~(UCC_GETH_UPSMR_RPM | UCC_GETH_UPSMR_R10M |
-		   UCC_GETH_UPSMR_TBIM | UCC_GETH_UPSMR_RMM);
-	if (phy_interface_mode_is_reduced(ugeth->phy_interface)) {
-		if (ugeth->phy_interface != PHY_INTERFACE_MODE_RMII)
-			upsmr |= UCC_GETH_UPSMR_RPM;
-		switch (ugeth->max_speed) {
-		case SPEED_10:
-			upsmr |= UCC_GETH_UPSMR_R10M;
-			fallthrough;
-		case SPEED_100:
-			if (ugeth->phy_interface != PHY_INTERFACE_MODE_RTBI)
-				upsmr |= UCC_GETH_UPSMR_RMM;
-		}
-	}
-	if ((ugeth->phy_interface == PHY_INTERFACE_MODE_TBI) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
-		upsmr |= UCC_GETH_UPSMR_TBIM;
-	}
-	if (ugeth->phy_interface == PHY_INTERFACE_MODE_SGMII)
-		upsmr |= UCC_GETH_UPSMR_SGMM;
-
-	out_be32(&uf_regs->upsmr, upsmr);
-
-	/* Disable autonegotiation in tbi mode, because by default it
-	comes up in autonegotiation mode. */
-	/* Note that this depends on proper setting in utbipar register. */
-	if ((ugeth->phy_interface == PHY_INTERFACE_MODE_TBI) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
-		struct ucc_geth_info *ug_info = ugeth->ug_info;
-		struct phy_device *tbiphy;
-
-		if (!ug_info->tbi_node)
-			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
-
-		tbiphy = of_phy_find_device(ug_info->tbi_node);
-		if (!tbiphy)
-			pr_warn("Could not get TBI device\n");
-
-		value = phy_read(tbiphy, ENET_TBI_MII_CR);
-		value &= ~0x1000;	/* Turn off autonegotiation */
-		phy_write(tbiphy, ENET_TBI_MII_CR, value);
-
-		put_device(&tbiphy->mdio.dev);
-	}
-
-	return 0;
-}
-
 static int ugeth_graceful_stop_tx(struct ucc_geth_private *ugeth)
 {
 	struct ucc_fast_private *uccf;
@@ -1560,64 +1483,62 @@ static void uec_configure_serdes(struct net_device *dev)
 	put_device(&tbiphy->mdio.dev);
 }
 
-static void ugeth_link_up(struct ucc_geth_private *ugeth,
-			  struct phy_device *phy,
-			  phy_interface_t interface, int speed, int duplex)
+static void ugeth_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex, bool tx_pause, bool rx_pause)
 {
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+	struct ucc_geth_info *ug_info = ugeth->ug_info;
 	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
 	struct ucc_fast __iomem *uf_regs = ugeth->uccf->uf_regs;
-	u32 tempval = in_be32(&ug_regs->maccfg2);
-	u32 upsmr = in_be32(&uf_regs->upsmr);
-	int new_state = 0;
+	u32 old_maccfg2, maccfg2 = in_be32(&ug_regs->maccfg2);
+	u32 old_upsmr, upsmr = in_be32(&uf_regs->upsmr);
 
-	/* Now we make sure that we can be in full duplex mode.
-	 * If not, we operate in half-duplex mode.
-	 */
-	if (duplex != ugeth->oldduplex) {
-		new_state = 1;
-		if (duplex == DUPLEX_HALF)
-			tempval &= ~(MACCFG2_FDX);
-		else
-			tempval |= MACCFG2_FDX;
-		ugeth->oldduplex = duplex;
-	}
+	old_maccfg2 = maccfg2;
+	old_upsmr = upsmr;
+
+	/* No length check */
+	maccfg2 &= ~MACCFG2_LC;
+	maccfg2 &= ~MACCFG2_INTERFACE_MODE_MASK;
+	upsmr &= ~(UCC_GETH_UPSMR_RPM | UCC_GETH_UPSMR_R10M |
+		   UCC_GETH_UPSMR_TBIM | UCC_GETH_UPSMR_RMM);
+
+	if (speed == SPEED_10 || speed == SPEED_100)
+		maccfg2 |= MACCFG2_INTERFACE_MODE_NIBBLE;
+	else if (speed == SPEED_1000)
+		maccfg2 |= MACCFG2_INTERFACE_MODE_BYTE;
+
+	maccfg2 |= ug_info->padAndCrc;
+
+	if (phy_interface_mode_is_reduced(interface)) {
+
+		if (interface != PHY_INTERFACE_MODE_RMII)
+			upsmr |= UCC_GETH_UPSMR_RPM;
 
-	if (speed != ugeth->oldspeed) {
-		new_state = 1;
 		switch (speed) {
-		case SPEED_1000:
-			tempval = ((tempval &
-				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-				    MACCFG2_INTERFACE_MODE_BYTE);
-			break;
-		case SPEED_100:
 		case SPEED_10:
-			tempval = ((tempval &
-				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-				    MACCFG2_INTERFACE_MODE_NIBBLE);
-			/* if reduced mode, re-set UPSMR.R10M */
-			if (phy_interface_mode_is_reduced(interface)) {
-				if (speed == SPEED_10)
-					upsmr |= UCC_GETH_UPSMR_R10M;
-				else
-					upsmr &= ~UCC_GETH_UPSMR_R10M;
-			}
-			break;
-		default:
-			if (netif_msg_link(ugeth))
-				pr_warn("%s:  Speed (%d) is not 10/100/1000!",
-					netdev_name(ugeth->ndev), speed);
-			break;
+			upsmr |= UCC_GETH_UPSMR_R10M;
+			fallthrough;
+		case SPEED_100:
+			if (interface != PHY_INTERFACE_MODE_RTBI)
+				upsmr |= UCC_GETH_UPSMR_RMM;
 		}
-		ugeth->oldspeed = speed;
 	}
 
-	if (!ugeth->oldlink) {
-		new_state = 1;
-		ugeth->oldlink = 1;
-	}
+	if (interface == PHY_INTERFACE_MODE_TBI ||
+	    interface == PHY_INTERFACE_MODE_RTBI)
+		upsmr |= UCC_GETH_UPSMR_TBIM;
+
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		upsmr |= UCC_GETH_UPSMR_SGMM;
 
-	if (new_state) {
+	if (duplex == DUPLEX_HALF)
+		maccfg2 &= ~(MACCFG2_FDX);
+	else
+		maccfg2 |= MACCFG2_FDX;
+
+	if (maccfg2 != old_maccfg2 || upsmr != old_upsmr) {
 		/*
 		 * To change the MAC configuration we need to disable
 		 * the controller. To do so, we have to either grab
@@ -1628,69 +1549,79 @@ static void ugeth_link_up(struct ucc_geth_private *ugeth,
 		ugeth_quiesce(ugeth);
 		ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
 
-		out_be32(&ug_regs->maccfg2, tempval);
+		out_be32(&ug_regs->maccfg2, maccfg2);
 		out_be32(&uf_regs->upsmr, upsmr);
 
 		ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
 		ugeth_activate(ugeth);
 	}
 
-	if (netif_msg_link(ugeth))
-		phy_print_status(phy);
-}
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		uec_configure_serdes(ndev);
 
-static void ugeth_link_down(struct ucc_geth_private *ugeth)
-{
-	ugeth->oldlink = 0;
-	ugeth->oldspeed = 0;
-	ugeth->oldduplex = -1;
-}
+	if (!phylink_autoneg_inband(mode)) {
+		ug_info->aufc = 0;
+		ug_info->receiveFlowControl = rx_pause;
+		ug_info->transmitFlowControl = tx_pause;
 
-/* Called every time the controller might need to be made
- * aware of new link state.  The PHY code conveys this
- * information through variables in the ugeth structure, and this
- * function converts those variables into the appropriate
- * register values, and can bring down the device if needed.
- */
+		init_flow_control_params(ug_info->aufc,
+					 ug_info->receiveFlowControl,
+					 ug_info->transmitFlowControl,
+					 ug_info->pausePeriod,
+					 ug_info->extensionField,
+					 &ugeth->uccf->uf_regs->upsmr,
+					 &ugeth->ug_regs->uempr,
+					 &ugeth->ug_regs->maccfg1);
+	}
 
-static void adjust_link(struct net_device *dev)
+	ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
+}
+
+static void ugeth_mac_link_down(struct phylink_config *config,
+				unsigned int mode, phy_interface_t interface)
 {
-	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct phy_device *phydev = dev->phydev;
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
 
-	if (phydev->link)
-		ugeth_link_up(ugeth, phydev, phydev->interface,
-			      phydev->speed, phydev->duplex);
-	else
-		ugeth_link_down(ugeth);
+	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
 }
 
-/* Configure the PHY for dev.
- * returns 0 if success.  -1 if failure
- */
-static int init_phy(struct net_device *dev)
+static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
+			     const struct phylink_link_state *state)
 {
-	struct ucc_geth_private *priv = netdev_priv(dev);
-	struct ucc_geth_info *ug_info = priv->ug_info;
-	struct phy_device *phydev;
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+	struct ucc_geth_info *ug_info = ugeth->ug_info;
+	u16 value;
 
-	priv->oldlink = 0;
-	priv->oldspeed = 0;
-	priv->oldduplex = -1;
+	if (state->interface == PHY_INTERFACE_MODE_TBI ||
+	    state->interface == PHY_INTERFACE_MODE_RTBI) {
+		struct phy_device *tbiphy;
 
-	phydev = of_phy_connect(dev, ug_info->phy_node, &adjust_link, 0,
-				priv->phy_interface);
-	if (!phydev) {
-		dev_err(&dev->dev, "Could not attach to PHY\n");
-		return -ENODEV;
-	}
+		if (!ug_info->tbi_node)
+			pr_warn("TBI mode requires that the device tree specify a tbi-handle\n");
+
+		tbiphy = of_phy_find_device(ug_info->tbi_node);
+		if (!tbiphy)
+			pr_warn("Could not get TBI device\n");
+
+		value = phy_read(tbiphy, ENET_TBI_MII_CR);
+		value &= ~0x1000;	/* Turn off autonegotiation */
+		phy_write(tbiphy, ENET_TBI_MII_CR, value);
 
-	if (priv->phy_interface == PHY_INTERFACE_MODE_SGMII)
-		uec_configure_serdes(dev);
+		put_device(&tbiphy->mdio.dev);
+	}
 
-	phy_set_max_speed(phydev, priv->max_speed);
+	if (phylink_autoneg_inband(mode)) {
+		ug_info->aufc = 1;
 
-	return 0;
+		init_flow_control_params(ug_info->aufc, 1, 1,
+					 ug_info->pausePeriod,
+					 ug_info->extensionField,
+					 &ugeth->uccf->uf_regs->upsmr,
+					 &ugeth->ug_regs->uempr,
+					 &ugeth->ug_regs->maccfg1);
+	}
 }
 
 static void ugeth_dump_regs(struct ucc_geth_private *ugeth)
@@ -1962,7 +1893,6 @@ static void ucc_geth_set_multi(struct net_device *dev)
 static void ucc_geth_stop(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
-	struct phy_device *phydev = ugeth->ndev->phydev;
 
 	ugeth_vdbg("%s: IN", __func__);
 
@@ -1971,7 +1901,7 @@ static void ucc_geth_stop(struct ucc_geth_private *ugeth)
 	 * Must be done before disabling the controller
 	 * or deadlock may happen.
 	 */
-	phy_stop(phydev);
+	phylink_stop(ugeth->phylink);
 
 	/* Disable the controller */
 	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
@@ -3213,12 +3143,6 @@ static int ucc_geth_init_mac(struct ucc_geth_private *ugeth)
 		goto err;
 	}
 
-	err = adjust_enet_interface(ugeth);
-	if (err) {
-		netif_err(ugeth, ifup, dev, "Cannot configure net device, aborting\n");
-		goto err;
-	}
-
 	/*       Set MACSTNADDR1, MACSTNADDR2                */
 	/* For more details see the hardware spec.           */
 	init_mac_station_addr_regs(dev->dev_addr[0],
@@ -3230,12 +3154,6 @@ static int ucc_geth_init_mac(struct ucc_geth_private *ugeth)
 				   &ugeth->ug_regs->macstnaddr1,
 				   &ugeth->ug_regs->macstnaddr2);
 
-	err = ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
-	if (err) {
-		netif_err(ugeth, ifup, dev, "Cannot enable net device, aborting\n");
-		goto err;
-	}
-
 	return 0;
 err:
 	ucc_geth_stop(ugeth);
@@ -3258,10 +3176,10 @@ static int ucc_geth_open(struct net_device *dev)
 		return -EINVAL;
 	}
 
-	err = init_phy(dev);
+	err = phylink_of_phy_connect(ugeth->phylink, ugeth->dev->of_node, 0);
 	if (err) {
-		netif_err(ugeth, ifup, dev, "Cannot initialize PHY, aborting\n");
-		return err;
+		dev_err(&dev->dev, "Could not attach to PHY\n");
+		return -ENODEV;
 	}
 
 	err = ucc_geth_init_mac(ugeth);
@@ -3277,7 +3195,7 @@ static int ucc_geth_open(struct net_device *dev)
 		goto err;
 	}
 
-	phy_start(dev->phydev);
+	phylink_start(ugeth->phylink);
 	napi_enable(&ugeth->napi);
 	netdev_reset_queue(dev);
 	netif_start_queue(dev);
@@ -3304,7 +3222,7 @@ static int ucc_geth_close(struct net_device *dev)
 
 	cancel_work_sync(&ugeth->timeout_work);
 	ucc_geth_stop(ugeth);
-	phy_disconnect(dev->phydev);
+	phylink_disconnect_phy(ugeth->phylink);
 
 	free_irq(ugeth->ug_info->uf_info.irq, ugeth->ndev);
 
@@ -3338,7 +3256,7 @@ static void ucc_geth_timeout_work(struct work_struct *work)
 		ucc_geth_stop(ugeth);
 		ucc_geth_init_mac(ugeth);
 		/* Must start PHY here */
-		phy_start(dev->phydev);
+		phylink_start(ugeth->phylink);
 		netif_tx_start_all_queues(dev);
 	}
 
@@ -3363,6 +3281,7 @@ static int ucc_geth_suspend(struct platform_device *ofdev, pm_message_t state)
 {
 	struct net_device *ndev = platform_get_drvdata(ofdev);
 	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+	bool mac_wol = false;
 
 	if (!netif_running(ndev))
 		return 0;
@@ -3380,10 +3299,13 @@ static int ucc_geth_suspend(struct platform_device *ofdev, pm_message_t state)
 		setbits32(ugeth->uccf->p_uccm, UCC_GETH_UCCE_MPD);
 		setbits32(&ugeth->ug_regs->maccfg2, MACCFG2_MPE);
 		ucc_fast_enable(ugeth->uccf, COMM_DIR_RX_AND_TX);
-	} else if (!ugeth->phy_wol_en) {
-		phy_stop(ndev->phydev);
+		mac_wol = true;
 	}
 
+	rtnl_lock();
+	phylink_suspend(ugeth->phylink, mac_wol);
+	rtnl_unlock();
+
 	return 0;
 }
 
@@ -3417,12 +3339,9 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 		}
 	}
 
-	ugeth->oldlink = 0;
-	ugeth->oldspeed = 0;
-	ugeth->oldduplex = -1;
-
-	phy_stop(ndev->phydev);
-	phy_start(ndev->phydev);
+	rtnl_lock();
+	phylink_resume(ugeth->phylink);
+	rtnl_unlock();
 
 	napi_enable(&ugeth->napi);
 	netif_device_attach(ndev);
@@ -3437,13 +3356,12 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 
 static int ucc_geth_ioctl(struct net_device *dev, struct ifreq *rq, int cmd)
 {
+	struct ucc_geth_private *ugeth = netdev_priv(dev);
+
 	if (!netif_running(dev))
 		return -EINVAL;
 
-	if (!dev->phydev)
-		return -ENODEV;
-
-	return phy_mii_ioctl(dev->phydev, rq, cmd);
+	return phylink_mii_ioctl(ugeth->phylink, rq, cmd);
 }
 
 static const struct net_device_ops ucc_geth_netdev_ops = {
@@ -3451,7 +3369,6 @@ static const struct net_device_ops ucc_geth_netdev_ops = {
 	.ndo_stop		= ucc_geth_close,
 	.ndo_start_xmit		= ucc_geth_start_xmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_change_carrier     = fixed_phy_change_carrier,
 	.ndo_set_mac_address	= ucc_geth_set_mac_addr,
 	.ndo_set_rx_mode	= ucc_geth_set_multi,
 	.ndo_tx_timeout		= ucc_geth_timeout,
@@ -3491,6 +3408,12 @@ static int ucc_geth_parse_clock(struct device_node *np, const char *which,
 	return 0;
 }
 
+struct phylink_mac_ops ugeth_mac_ops = {
+	.mac_link_up = ugeth_mac_link_up,
+	.mac_link_down = ugeth_mac_link_down,
+	.mac_config = ugeth_mac_config,
+};
+
 static int ucc_geth_probe(struct platform_device* ofdev)
 {
 	struct device *device = &ofdev->dev;
@@ -3498,8 +3421,10 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	struct net_device *dev = NULL;
 	struct ucc_geth_private *ugeth = NULL;
 	struct ucc_geth_info *ug_info;
+	struct device_node *phy_node;
+	struct phylink *phylink;
 	struct resource res;
-	int err, ucc_num, max_speed = 0;
+	int err, ucc_num;
 	const unsigned int *prop;
 	phy_interface_t phy_interface;
 
@@ -3537,57 +3462,35 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	ug_info->uf_info.regs = res.start;
 	ug_info->uf_info.irq = irq_of_parse_and_map(np, 0);
 
-	ug_info->phy_node = of_parse_phandle(np, "phy-handle", 0);
-	if (!ug_info->phy_node && of_phy_is_fixed_link(np)) {
-		/*
-		 * In the case of a fixed PHY, the DT node associated
-		 * to the PHY is the Ethernet MAC DT node.
-		 */
-		err = of_phy_register_fixed_link(np);
-		if (err)
-			return err;
-		ug_info->phy_node = of_node_get(np);
-	}
-
 	/* Find the TBI PHY node.  If it's not there, we don't support SGMII */
 	ug_info->tbi_node = of_parse_phandle(np, "tbi-handle", 0);
 
-	prop = of_get_property(ug_info->phy_node, "interface", NULL);
-	if (prop) {
-		dev_err(&ofdev->dev,
-			"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
-		err = -EINVAL;
-		goto err_deregister_fixed_link;
+	phy_node = of_parse_phandle(np, "phy-handle", 0);
+	if (phy_node) {
+		prop = of_get_property(phy_node, "interface", NULL);
+		if (prop) {
+			dev_err(&ofdev->dev,
+				"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
+			of_node_put(phy_node);
+			err = -EINVAL;
+			goto err_put_tbi;
+		}
+		of_node_put(phy_node);
 	}
 
 	err = of_get_phy_mode(np, &phy_interface);
 	if (err) {
 		dev_err(&ofdev->dev, "Invalid phy-connection-type");
-		goto err_deregister_fixed_link;
-	}
-
-	/* get speed, or derive from PHY interface */
-	if (max_speed == 0)
-		switch (phy_interface) {
-		case PHY_INTERFACE_MODE_GMII:
-		case PHY_INTERFACE_MODE_RGMII:
-		case PHY_INTERFACE_MODE_RGMII_ID:
-		case PHY_INTERFACE_MODE_RGMII_RXID:
-		case PHY_INTERFACE_MODE_RGMII_TXID:
-		case PHY_INTERFACE_MODE_TBI:
-		case PHY_INTERFACE_MODE_RTBI:
-		case PHY_INTERFACE_MODE_SGMII:
-			max_speed = SPEED_1000;
-			break;
-		default:
-			max_speed = SPEED_100;
-			break;
-		}
+		goto err_put_tbi;
+	}
 
-	if (max_speed == SPEED_1000) {
+	if (phy_interface == PHY_INTERFACE_MODE_GMII ||
+	    phy_interface_mode_is_rgmii(phy_interface) ||
+	    phy_interface == PHY_INTERFACE_MODE_TBI ||
+	    phy_interface == PHY_INTERFACE_MODE_RTBI ||
+	    phy_interface == PHY_INTERFACE_MODE_SGMII) {
 		unsigned int snums = qe_get_num_of_snums();
 
-		/* configure muram FIFOs for gigabit operation */
 		ug_info->uf_info.urfs = UCC_GETH_URFS_GIGA_INIT;
 		ug_info->uf_info.urfet = UCC_GETH_URFET_GIGA_INIT;
 		ug_info->uf_info.urfset = UCC_GETH_URFSET_GIGA_INIT;
@@ -3616,7 +3519,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	dev = devm_alloc_etherdev(&ofdev->dev, sizeof(*ugeth));
 	if (!dev) {
 		err = -ENOMEM;
-		goto err_deregister_fixed_link;
+		goto err_put_tbi;
 	}
 
 	ugeth = netdev_priv(dev);
@@ -3643,23 +3546,50 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	dev->max_mtu = 1518;
 
 	ugeth->msg_enable = netif_msg_init(debug.msg_enable, UGETH_MSG_DEFAULT);
-	ugeth->phy_interface = phy_interface;
-	ugeth->max_speed = max_speed;
 
-	/* Carrier starts down, phylib will bring it up */
-	netif_carrier_off(dev);
+	ugeth->phylink_config.dev = &dev->dev;
+	ugeth->phylink_config.type = PHYLINK_NETDEV;
+
+	ugeth->phylink_config.mac_capabilities =
+		MAC_SYM_PAUSE | MAC_10 | MAC_100 | MAC_1000FD;
+
+	__set_bit(PHY_INTERFACE_MODE_MII,
+		  ugeth->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_RMII,
+		  ugeth->phylink_config.supported_interfaces);
+	__set_bit(PHY_INTERFACE_MODE_GMII,
+		  ugeth->phylink_config.supported_interfaces);
+	phy_interface_set_rgmii(ugeth->phylink_config.supported_interfaces);
+
+	if (ug_info->tbi_node) {
+		__set_bit(PHY_INTERFACE_MODE_SGMII,
+			  ugeth->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_TBI,
+			  ugeth->phylink_config.supported_interfaces);
+		__set_bit(PHY_INTERFACE_MODE_RTBI,
+			  ugeth->phylink_config.supported_interfaces);
+	}
+
+	phylink = phylink_create(&ugeth->phylink_config, dev_fwnode(&dev->dev),
+				 phy_interface, &ugeth_mac_ops);
+	if (IS_ERR(phylink)) {
+		err = PTR_ERR(phylink);
+		goto err_put_tbi;
+	}
+
+	ugeth->phylink = phylink;
 
 	err = devm_register_netdev(&ofdev->dev, dev);
 	if (err) {
 		if (netif_msg_probe(ugeth))
 			pr_err("%s: Cannot register net device, aborting\n",
 			       dev->name);
-		goto err_deregister_fixed_link;
+		goto err_destroy_phylink;
 	}
 
 	err = of_get_ethdev_address(np, dev);
 	if (err == -EPROBE_DEFER)
-		goto err_deregister_fixed_link;
+		goto err_destroy_phylink;
 
 	ugeth->ug_info = ug_info;
 	ugeth->dev = device;
@@ -3668,11 +3598,11 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 
 	return 0;
 
-err_deregister_fixed_link:
-	if (of_phy_is_fixed_link(np))
-		of_phy_deregister_fixed_link(np);
+err_destroy_phylink:
+	phylink_destroy(phylink);
+err_put_tbi:
 	of_node_put(ug_info->tbi_node);
-	of_node_put(ug_info->phy_node);
+
 	return err;
 }
 
@@ -3680,13 +3610,10 @@ static void ucc_geth_remove(struct platform_device* ofdev)
 {
 	struct net_device *dev = platform_get_drvdata(ofdev);
 	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct device_node *np = ofdev->dev.of_node;
 
 	ucc_geth_memclean(ugeth);
-	if (of_phy_is_fixed_link(np))
-		of_phy_deregister_fixed_link(np);
+	phylink_destroy(ugeth->phylink);
 	of_node_put(ugeth->ug_info->tbi_node);
-	of_node_put(ugeth->ug_info->phy_node);
 }
 
 static const struct of_device_id ucc_geth_match[] = {
diff --git a/drivers/net/ethernet/freescale/ucc_geth.h b/drivers/net/ethernet/freescale/ucc_geth.h
index dfb727327093..38789faae706 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.h
+++ b/drivers/net/ethernet/freescale/ucc_geth.h
@@ -16,6 +16,7 @@
 
 #include <linux/kernel.h>
 #include <linux/list.h>
+#include <linux/phylink.h>
 #include <linux/if_ether.h>
 
 #include <soc/fsl/qe/immap_qe.h>
@@ -1074,6 +1075,9 @@ struct ucc_geth_tad_params {
 	u16 vid;
 };
 
+struct phylink;
+struct phylink_config;
+
 /* GETH protocol initialization structure */
 struct ucc_geth_info {
 	struct ucc_fast_info uf_info;
@@ -1124,7 +1128,6 @@ struct ucc_geth_info {
 	u32 eventRegMask;
 	u16 pausePeriod;
 	u16 extensionField;
-	struct device_node *phy_node;
 	struct device_node *tbi_node;
 	u8 weightfactor[NUM_TX_QUEUES];
 	u8 interruptcoalescingmaxvalue[NUM_RX_QUEUES];
@@ -1209,15 +1212,13 @@ struct ucc_geth_private {
 	u16 skb_dirtytx[NUM_TX_QUEUES];
 
 	struct ugeth_mii_info *mii_info;
-	phy_interface_t phy_interface;
-	int max_speed;
 	uint32_t msg_enable;
-	int oldspeed;
-	int oldduplex;
-	int oldlink;
 	u32 wol_en;
 	u32 phy_wol_en;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct device_node *node;
 };
 
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 89b323ef8145..1fb49e5a414a 100644
--- a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
+++ b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
@@ -103,26 +103,18 @@ static const char rx_fw_stat_gstrings[][ETH_GSTRING_LEN] = {
 static int
 uec_get_ksettings(struct net_device *netdev, struct ethtool_link_ksettings *cmd)
 {
-	struct phy_device *phydev = netdev->phydev;
-
-	if (!phydev)
-		return -ENODEV;
-
-	phy_ethtool_ksettings_get(phydev, cmd);
+	struct ucc_geth_private *ugeth = netdev_priv(netdev);
 
-	return 0;
+	return phylink_ethtool_ksettings_get(ugeth->phylink, cmd);
 }
 
 static int
 uec_set_ksettings(struct net_device *netdev,
 		  const struct ethtool_link_ksettings *cmd)
 {
-	struct phy_device *phydev = netdev->phydev;
-
-	if (!phydev)
-		return -ENODEV;
+	struct ucc_geth_private *ugeth = netdev_priv(netdev);
 
-	return phy_ethtool_ksettings_set(phydev, cmd);
+	return phylink_ethtool_ksettings_set(ugeth->phylink, cmd);
 }
 
 static void
@@ -130,15 +122,8 @@ uec_get_pauseparam(struct net_device *netdev,
                      struct ethtool_pauseparam *pause)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = netdev->phydev;
-
-	if (phydev)
-		pause->autoneg = phydev->autoneg;
 
-	if (ugeth->ug_info->receiveFlowControl)
-		pause->rx_pause = 1;
-	if (ugeth->ug_info->transmitFlowControl)
-		pause->tx_pause = 1;
+	return phylink_ethtool_get_pauseparam(ugeth->phylink, pause);
 }
 
 static int
@@ -146,31 +131,11 @@ uec_set_pauseparam(struct net_device *netdev,
                      struct ethtool_pauseparam *pause)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = netdev->phydev;
-	int ret = 0;
 
 	ugeth->ug_info->receiveFlowControl = pause->rx_pause;
 	ugeth->ug_info->transmitFlowControl = pause->tx_pause;
 
-	if (phydev && phydev->autoneg) {
-		if (netif_running(netdev)) {
-			/* FIXME: automatically restart */
-			netdev_info(netdev, "Please re-open the interface\n");
-		}
-	} else {
-		struct ucc_geth_info *ug_info = ugeth->ug_info;
-
-		ret = init_flow_control_params(ug_info->aufc,
-					ug_info->receiveFlowControl,
-					ug_info->transmitFlowControl,
-					ug_info->pausePeriod,
-					ug_info->extensionField,
-					&ugeth->uccf->uf_regs->upsmr,
-					&ugeth->ug_regs->uempr,
-					&ugeth->ug_regs->maccfg1);
-	}
-
-	return ret;
+	return phylink_ethtool_set_pauseparam(ugeth->phylink, pause);
 }
 
 static uint32_t
@@ -344,13 +309,8 @@ uec_get_drvinfo(struct net_device *netdev,
 static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = netdev->phydev;
-
-	wol->supported = 0;
-	wol->wolopts = 0;
 
-	if (phydev)
-		phy_ethtool_get_wol(phydev, wol);
+	phylink_ethtool_get_wol(ugeth->phylink, wol);
 
 	if (qe_alive_during_sleep())
 		wol->supported |= WAKE_MAGIC;
@@ -361,19 +321,16 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 static int uec_set_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = netdev->phydev;
 	int ret = 0;
 
-	if (phydev) {
-		ret = phy_ethtool_set_wol(phydev, wol);
-		if (ret == -EOPNOTSUPP) {
-			ugeth->phy_wol_en = 0;
-		} else if (ret) {
-			return ret;
-		} else {
-			ugeth->phy_wol_en = wol->wolopts;
-			goto out;
-		}
+	ret = phylink_ethtool_set_wol(ugeth->phylink, wol);
+	if (ret == -EOPNOTSUPP) {
+		ugeth->phy_wol_en = 0;
+	} else if (ret) {
+		return ret;
+	} else {
+		ugeth->phy_wol_en = wol->wolopts;
+		goto out;
 	}
 
 	/* If the PHY isn't handling the WoL and the MAC is asked to more than
-- 
2.47.0


