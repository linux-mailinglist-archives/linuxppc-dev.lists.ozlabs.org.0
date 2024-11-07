Return-Path: <linuxppc-dev+bounces-2991-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4578E9C0C85
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Nov 2024 18:10:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XkpV30ltNz3bmH;
	Fri,  8 Nov 2024 04:10:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=217.70.178.240
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730999403;
	cv=none; b=V43Ntl13msWmpLlZ3cK56p9/vM42jef5Ftr/LxGydu5INAhp5knqDkj9KO/tRJ4o2JJCPYGqzBXmyvmL1Seej3Ze0ba1uiJBP+VQ6iVU+Eu1KGhHvVkmt0FvxFJWPUGPzgFF7sVUblR8Yb+iJP0hV6JpmtY289H+H0uwq0/GRwnHIBIX9hU9LKQnL/jjlAJsx8plf8gjXrCWQmCPxW3eaONx1JuG0fqINVU8MyWRE0YGigtInLp/+9+EjGBKov4BCqC5KT8PLcPfovJoP78KIgz6yIXeB7QoO+7ARhK+oSY6v6Z7hyELa0lLMYLZ9x8x5IJXgRG8MIzaE+Da13lvVA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730999403; c=relaxed/relaxed;
	bh=yGftyA+3TjwSi4jztRcRdZXVFb6mlDb7o3s4PkJNec8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxRdroybO1wOBZP/3MBAI4MI/d1qiJb5eeRxIpRqRXSO0oIbasYs0ROVo4Mh5HrTHlCOPAR71sQ5DwSz4y7HWhDn/Om5qjB1Aw8uCFgdapXWdVE4clgnLS+Pj9/unFpS5HWPm8AZI87fJNJvt7MP16gFhfT4SZ5runRNwJGI0dbLWGkuqJycfxfdP/rccLqqpRSJViftl9F86BjRm46WdiJ3y9jJ9elSqDAeZojSORrRLj432yGXJEGL8VhjsqOe00G7JB1zFsMc4VU6hDFDiRdJcUf2Ge0HS7VOQEct2kfGJ88R/MciGslsKJELKgMhUUOp7mZKuloccineB6HKJw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cV4RJ02K; dkim-atps=neutral; spf=pass (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=cV4RJ02K;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=217.70.178.240; helo=mslow1.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XkpTy6yZHz3bnL
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  8 Nov 2024 04:09:57 +1100 (AEDT)
Received: from relay1-d.mail.gandi.net (unknown [217.70.183.193])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id BD7B5C2AA2
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Nov 2024 17:03:19 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 84051240010;
	Thu,  7 Nov 2024 17:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1730998990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yGftyA+3TjwSi4jztRcRdZXVFb6mlDb7o3s4PkJNec8=;
	b=cV4RJ02KulSkgy7RoPhzVTZJoHOnokc8SIhumyIm1XDfLvi2PsRUYkad+zKyL335ejELsQ
	Y9CY7cESyynqwEcvi4oFnTMfnyL2TN2AvEy1ErWhNaOMAr72tTRo2pAnax9ZV/Wsolh9Cc
	EvHku5U/O/Mmwe+vpNW9q7c1fqSLrBjLEb+QlRVix1wHInTgXS7bdpJdmxhawFzgNTIoeP
	9N7x5H/ze4AUdSRdQ9CELYGGWrCMbU02tuAnZksGplckvoP1Wc7D4wTLBRuHBttZ8d/oDj
	PMEKgiM6U78DBac+qh8fsmqBGR01FTHRyXtS1EfB9SAv6VNKAlCP3+P0LHd+Ug==
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
Subject: [PATCH net-next 7/7] net: freescale: ucc_geth: phylink conversion
Date: Thu,  7 Nov 2024 18:02:54 +0100
Message-ID: <20241107170255.1058124-8-maxime.chevallier@bootlin.com>
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

ucc_geth is quite capable in terms of supported interfaces, and even
includes an externally controlled PCS (well, TBI). Port that driver to
phylink.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/ethernet/freescale/Kconfig        |   3 +-
 drivers/net/ethernet/freescale/ucc_geth.c     | 516 ++++++++----------
 drivers/net/ethernet/freescale/ucc_geth.h     |  13 +-
 .../net/ethernet/freescale/ucc_geth_ethtool.c |  61 +--
 4 files changed, 236 insertions(+), 357 deletions(-)

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
index 0ec4ea95ad6d..df74ebd8dbe8 100644
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
@@ -1258,89 +1259,6 @@ static int init_min_frame_len(u16 min_frame_length,
 	return 0;
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
-	if ((ugeth->phy_interface == PHY_INTERFACE_MODE_RMII) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_ID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_RXID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RGMII_TXID) ||
-	    (ugeth->phy_interface == PHY_INTERFACE_MODE_RTBI)) {
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
@@ -1512,113 +1430,6 @@ static void ugeth_activate(struct ucc_geth_private *ugeth)
 	__netdev_watchdog_up(ugeth->ndev);
 }
 
-static void ugeth_link_up(struct ucc_geth_private *ugeth,
-			  struct phy_device *phy,
-			  phy_interface_t interface, int speed, int duplex)
-{
-	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
-	struct ucc_fast __iomem *uf_regs = ugeth->uccf->uf_regs;
-	u32 tempval = in_be32(&ug_regs->maccfg2);
-	u32 upsmr = in_be32(&uf_regs->upsmr);
-	int new_state = 0;
-
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
-
-	if (speed != ugeth->oldspeed) {
-		new_state = 1;
-		switch (speed) {
-		case SPEED_1000:
-			tempval = ((tempval &
-				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-				    MACCFG2_INTERFACE_MODE_BYTE);
-			break;
-		case SPEED_100:
-		case SPEED_10:
-			tempval = ((tempval &
-				    ~(MACCFG2_INTERFACE_MODE_MASK)) |
-				    MACCFG2_INTERFACE_MODE_NIBBLE);
-			/* if reduced mode, re-set UPSMR.R10M */
-			if (interface == PHY_INTERFACE_MODE_RMII ||
-			    phy_interface_mode_is_rgmii(interface) ||
-			    interface == PHY_INTERFACE_MODE_RTBI) {
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
-		}
-		ugeth->oldspeed = speed;
-	}
-
-	if (!ugeth->oldlink) {
-		new_state = 1;
-		ugeth->oldlink = 1;
-	}
-
-	if (new_state) {
-		/*
-		 * To change the MAC configuration we need to disable
-		 * the controller. To do so, we have to either grab
-		 * ugeth->lock, which is a bad idea since 'graceful
-		 * stop' commands might take quite a while, or we can
-		 * quiesce driver's activity.
-		 */
-		ugeth_quiesce(ugeth);
-		ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
-
-		out_be32(&ug_regs->maccfg2, tempval);
-		out_be32(&uf_regs->upsmr, upsmr);
-
-		ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
-		ugeth_activate(ugeth);
-	}
-
-	if (netif_msg_link(ugeth))
-		phy_print_status(phy);
-}
-
-static void ugeth_link_down(struct ucc_geth_private *ugeth)
-{
-	ugeth->oldlink = 0;
-	ugeth->oldspeed = 0;
-	ugeth->oldduplex = -1;
-}
-
-/* Called every time the controller might need to be made
- * aware of new link state.  The PHY code conveys this
- * information through variables in the ugeth structure, and this
- * function converts those variables into the appropriate
- * register values, and can bring down the device if needed.
- */
-
-static void adjust_link(struct net_device *dev)
-{
-	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct phy_device *phydev = dev->phydev;
-
-	if (phydev->link)
-		ugeth_link_up(ugeth, phydev, phydev->interface,
-			      phydev->speed, phydev->duplex);
-	else
-		ugeth_link_down(ugeth);
-}
-
 /* Initialize TBI PHY interface for communicating with the
  * SERDES lynx PHY on the chip.  We communicate with this PHY
  * through the MDIO bus on each controller, treating it as a
@@ -1666,32 +1477,152 @@ static void uec_configure_serdes(struct net_device *dev)
 	put_device(&tbiphy->mdio.dev);
 }
 
-/* Configure the PHY for dev.
- * returns 0 if success.  -1 if failure
- */
-static int init_phy(struct net_device *dev)
+static bool phy_interface_mode_is_reduced(phy_interface_t interface)
+{
+	return phy_interface_mode_is_rgmii(interface) ||
+	       interface == PHY_INTERFACE_MODE_RMII ||
+	       interface == PHY_INTERFACE_MODE_RTBI;
+}
+
+static void ugeth_mac_link_up(struct phylink_config *config, struct phy_device *phy,
+			      unsigned int mode, phy_interface_t interface,
+			      int speed, int duplex, bool tx_pause, bool rx_pause)
 {
-	struct ucc_geth_private *priv = netdev_priv(dev);
-	struct ucc_geth_info *ug_info = priv->ug_info;
-	struct phy_device *phydev;
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+	struct ucc_geth_info *ug_info = ugeth->ug_info;
+	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
+	struct ucc_fast __iomem *uf_regs = ugeth->uccf->uf_regs;
+	u32 old_maccfg2, maccfg2 = in_be32(&ug_regs->maccfg2);
+	u32 old_upsmr, upsmr = in_be32(&uf_regs->upsmr);
 
-	priv->oldlink = 0;
-	priv->oldspeed = 0;
-	priv->oldduplex = -1;
+	old_maccfg2 = maccfg2;
+	old_upsmr = upsmr;
 
-	phydev = of_phy_connect(dev, ug_info->phy_node, &adjust_link, 0,
-				priv->phy_interface);
-	if (!phydev) {
-		dev_err(&dev->dev, "Could not attach to PHY\n");
-		return -ENODEV;
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
+
+		switch (speed) {
+		case SPEED_10:
+			upsmr |= UCC_GETH_UPSMR_R10M;
+			fallthrough;
+		case SPEED_100:
+			if (interface != PHY_INTERFACE_MODE_RTBI)
+				upsmr |= UCC_GETH_UPSMR_RMM;
+		}
 	}
 
-	if (priv->phy_interface == PHY_INTERFACE_MODE_SGMII)
-		uec_configure_serdes(dev);
+	if (interface == PHY_INTERFACE_MODE_TBI ||
+	    interface == PHY_INTERFACE_MODE_RTBI)
+		upsmr |= UCC_GETH_UPSMR_TBIM;
+
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		upsmr |= UCC_GETH_UPSMR_SGMM;
 
-	phy_set_max_speed(phydev, priv->max_speed);
+	if (duplex == DUPLEX_HALF)
+		maccfg2 &= ~(MACCFG2_FDX);
+	else
+		maccfg2 |= MACCFG2_FDX;
 
-	return 0;
+	if (maccfg2 != old_maccfg2 || upsmr != old_upsmr) {
+		/*
+		 * To change the MAC configuration we need to disable
+		 * the controller. To do so, we have to either grab
+		 * ugeth->lock, which is a bad idea since 'graceful
+		 * stop' commands might take quite a while, or we can
+		 * quiesce driver's activity.
+		 */
+		ugeth_quiesce(ugeth);
+		ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
+
+		out_be32(&ug_regs->maccfg2, maccfg2);
+		out_be32(&uf_regs->upsmr, upsmr);
+
+		ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
+		ugeth_activate(ugeth);
+	}
+
+	if (interface == PHY_INTERFACE_MODE_SGMII)
+		uec_configure_serdes(ndev);
+
+	if (!phylink_autoneg_inband(mode)) {
+		ug_info->aufc = 0;
+		ug_info->receiveFlowControl = rx_pause;
+		ug_info->transmitFlowControl = tx_pause;
+
+		init_flow_control_params(ug_info->aufc,
+					 ug_info->receiveFlowControl,
+					 ug_info->transmitFlowControl,
+					 ug_info->pausePeriod,
+					 ug_info->extensionField,
+					 &ugeth->uccf->uf_regs->upsmr,
+					 &ugeth->ug_regs->uempr,
+					 &ugeth->ug_regs->maccfg1);
+	}
+
+	ugeth_enable(ugeth, COMM_DIR_RX_AND_TX);
+}
+
+static void ugeth_mac_link_down(struct phylink_config *config,
+				unsigned int mode, phy_interface_t interface)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+
+	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
+}
+
+static void ugeth_mac_config(struct phylink_config *config, unsigned int mode,
+			     const struct phylink_link_state *state)
+{
+	struct net_device *ndev = to_net_dev(config->dev);
+	struct ucc_geth_private *ugeth = netdev_priv(ndev);
+	struct ucc_geth_info *ug_info = ugeth->ug_info;
+	u16 value;
+
+	if (state->interface == PHY_INTERFACE_MODE_TBI ||
+	    state->interface == PHY_INTERFACE_MODE_RTBI) {
+		struct phy_device *tbiphy;
+
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
+
+		put_device(&tbiphy->mdio.dev);
+	}
+
+	if (phylink_autoneg_inband(mode)) {
+		ug_info->aufc = 1;
+
+		init_flow_control_params(ug_info->aufc, 1, 1,
+					 ug_info->pausePeriod,
+					 ug_info->extensionField,
+					 &ugeth->uccf->uf_regs->upsmr,
+					 &ugeth->ug_regs->uempr,
+					 &ugeth->ug_regs->maccfg1);
+	}
 }
 
 static void ugeth_dump_regs(struct ucc_geth_private *ugeth)
@@ -1963,7 +1894,6 @@ static void ucc_geth_set_multi(struct net_device *dev)
 static void ucc_geth_stop(struct ucc_geth_private *ugeth)
 {
 	struct ucc_geth __iomem *ug_regs = ugeth->ug_regs;
-	struct phy_device *phydev = ugeth->ndev->phydev;
 
 	ugeth_vdbg("%s: IN", __func__);
 
@@ -1972,7 +1902,7 @@ static void ucc_geth_stop(struct ucc_geth_private *ugeth)
 	 * Must be done before disabling the controller
 	 * or deadlock may happen.
 	 */
-	phy_stop(phydev);
+	phylink_stop(ugeth->phylink);
 
 	/* Disable the controller */
 	ugeth_disable(ugeth, COMM_DIR_RX_AND_TX);
@@ -3214,12 +3144,6 @@ static int ucc_geth_init_mac(struct ucc_geth_private *ugeth)
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
@@ -3231,12 +3155,6 @@ static int ucc_geth_init_mac(struct ucc_geth_private *ugeth)
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
@@ -3259,10 +3177,10 @@ static int ucc_geth_open(struct net_device *dev)
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
@@ -3278,7 +3196,7 @@ static int ucc_geth_open(struct net_device *dev)
 		goto err;
 	}
 
-	phy_start(dev->phydev);
+	phylink_start(ugeth->phylink);
 	napi_enable(&ugeth->napi);
 	netdev_reset_queue(dev);
 	netif_start_queue(dev);
@@ -3305,7 +3223,7 @@ static int ucc_geth_close(struct net_device *dev)
 
 	cancel_work_sync(&ugeth->timeout_work);
 	ucc_geth_stop(ugeth);
-	phy_disconnect(dev->phydev);
+	phylink_disconnect_phy(ugeth->phylink);
 
 	free_irq(ugeth->ug_info->uf_info.irq, ugeth->ndev);
 
@@ -3339,7 +3257,7 @@ static void ucc_geth_timeout_work(struct work_struct *work)
 		ucc_geth_stop(ugeth);
 		ucc_geth_init_mac(ugeth);
 		/* Must start PHY here */
-		phy_start(dev->phydev);
+		phylink_start(ugeth->phylink);
 		netif_tx_start_all_queues(dev);
 	}
 
@@ -3381,10 +3299,12 @@ static int ucc_geth_suspend(struct platform_device *ofdev, pm_message_t state)
 		setbits32(ugeth->uccf->p_uccm, UCC_GETH_UCCE_MPD);
 		setbits32(&ugeth->ug_regs->maccfg2, MACCFG2_MPE);
 		ucc_fast_enable(ugeth->uccf, COMM_DIR_RX_AND_TX);
-	} else if (!(ugeth->wol_en & WAKE_PHY)) {
-		phy_stop(ndev->phydev);
 	}
 
+	rtnl_lock();
+	phylink_suspend(ugeth->phylink, ugeth->wol_en);
+	rtnl_unlock();
+
 	return 0;
 }
 
@@ -3418,12 +3338,9 @@ static int ucc_geth_resume(struct platform_device *ofdev)
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
@@ -3438,13 +3355,12 @@ static int ucc_geth_resume(struct platform_device *ofdev)
 
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
@@ -3452,7 +3368,6 @@ static const struct net_device_ops ucc_geth_netdev_ops = {
 	.ndo_stop		= ucc_geth_close,
 	.ndo_start_xmit		= ucc_geth_start_xmit,
 	.ndo_validate_addr	= eth_validate_addr,
-	.ndo_change_carrier     = fixed_phy_change_carrier,
 	.ndo_set_mac_address	= ucc_geth_set_mac_addr,
 	.ndo_set_rx_mode	= ucc_geth_set_multi,
 	.ndo_tx_timeout		= ucc_geth_timeout,
@@ -3492,6 +3407,12 @@ static int ucc_geth_parse_clock(struct device_node *np, const char *which,
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
@@ -3499,8 +3420,10 @@ static int ucc_geth_probe(struct platform_device* ofdev)
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
 
@@ -3538,26 +3461,19 @@ static int ucc_geth_probe(struct platform_device* ofdev)
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
-		goto err_put_tbi;
+	phy_node = of_parse_phandle(np, "phy-handle", 0);
+	if (phy_node) {
+		prop = of_get_property(phy_node, "interface", NULL);
+		if (prop) {
+			dev_err(&ofdev->dev,
+				"Device-tree property 'interface' is no longer supported. Please use 'phy-connection-type' instead.");
+			of_node_put(phy_node);
+			goto err_put_tbi;
+		}
+		of_node_put(phy_node);
 	}
 
 	err = of_get_phy_mode(np, &phy_interface);
@@ -3566,28 +3482,13 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 		goto err_put_tbi;
 	}
 
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
-
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
@@ -3616,7 +3517,7 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 	dev = devm_alloc_etherdev(&ofdev->dev, sizeof(*ugeth));
 	if (!dev) {
 		err = -ENOMEM;
-		goto err_deregister_fixed_link;
+		goto err_put_tbi;
 	}
 
 	ugeth = netdev_priv(dev);
@@ -3643,23 +3544,50 @@ static int ucc_geth_probe(struct platform_device* ofdev)
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
@@ -3668,12 +3596,11 @@ static int ucc_geth_probe(struct platform_device* ofdev)
 
 	return 0;
 
-err_deregister_fixed_link:
-	if (of_phy_is_fixed_link(np))
-		of_phy_deregister_fixed_link(np);
+err_destroy_phylink:
+	phylink_destroy(phylink);
 err_put_tbi:
 	of_node_put(ug_info->tbi_node);
-	of_node_put(ug_info->phy_node);
+
 	return err;
 }
 
@@ -3681,13 +3608,10 @@ static void ucc_geth_remove(struct platform_device* ofdev)
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
index 42fbbdf14ff2..0a3c2645e16b 100644
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
@@ -1209,14 +1212,12 @@ struct ucc_geth_private {
 	u16 skb_dirtytx[NUM_TX_QUEUES];
 
 	struct ugeth_mii_info *mii_info;
-	phy_interface_t phy_interface;
-	int max_speed;
 	uint32_t msg_enable;
-	int oldspeed;
-	int oldduplex;
-	int oldlink;
 	int wol_en;
 
+	struct phylink *phylink;
+	struct phylink_config phylink_config;
+
 	struct device_node *node;
 };
 
diff --git a/drivers/net/ethernet/freescale/ucc_geth_ethtool.c b/drivers/net/ethernet/freescale/ucc_geth_ethtool.c
index 2a085f8f34b2..661521960cba 100644
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
 
-	wol->supported = 0;
-	wol->wolopts = 0;
-
-	if (phydev)
-		phy_ethtool_get_wol(phydev, wol);
+	phylink_ethtool_get_wol(ugeth->phylink, wol);
 
 	if (qe_alive_during_sleep())
 		wol->supported |= WAKE_MAGIC;
@@ -361,19 +321,14 @@ static void uec_get_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 static int uec_set_wol(struct net_device *netdev, struct ethtool_wolinfo *wol)
 {
 	struct ucc_geth_private *ugeth = netdev_priv(netdev);
-	struct phy_device *phydev = netdev->phydev;
 	int ret = 0;
 
 	if (wol->wolopts & ~(WAKE_PHY | WAKE_MAGIC))
 		return -EINVAL;
-	else if ((wol->wolopts & WAKE_PHY) && !phydev)
-		return -EINVAL;
 	else if (wol->wolopts & WAKE_MAGIC && !qe_alive_during_sleep())
 		return -EINVAL;
 
-	if (wol->wolopts & WAKE_PHY)
-		ret = phy_ethtool_set_wol(phydev, wol);
-
+	ret = phylink_ethtool_set_wol(ugeth->phylink, wol);
 	if (ret)
 		return ret;
 
-- 
2.47.0


