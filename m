Return-Path: <linuxppc-dev+bounces-3719-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18F4B9E1C84
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Dec 2024 13:44:40 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Y2gLl5rKLz308Z;
	Tue,  3 Dec 2024 23:43:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:4b98:dc4:8::224"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1733229823;
	cv=none; b=CYiJy4i5iaHEMO5eRX/JXlzWjaGL7KEqEAhE0WPKpqXfPwc7WCu8uU9L3LcabTSMCTn3HvU/fiqYMDRXGivxnpZBkoqcfNGGjENNHICIBCJVbE1lkkPJ6JO6dymTuaqPhAABt4dp1ftsIlk9SWZujRWPz9dcMHtZEaMJ+v6rmal5ZpQaMvPlKjQxFr3wXWv02dMdKe0+ZvFcRARBkJpXYHE+5SsaNw9NU2Ud2qqt9MGBJZBWjhxlWUmFbgqQ2hCF/O63Gl4AvZ6cyr1MGYoqXA5oqfzlaQI9JCcRouOao3pXSeeSokizgrZjyvRSw2uQmppVzhMN1pRuX/KbXUQHhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1733229823; c=relaxed/relaxed;
	bh=WBCqYYv3YXd5ENSbBD2+uchIXFYD+CKhJvuWxfPM7Xk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gih2o2jYdi3VVRqMnUjTqeGF7GuZrzzMeCHz/A+7xL8PsAmRNNtEY6NRDwWJb+cnxgmp5Y3G2LmNeQCg9W1qjP5Q930FiOEBYYoByoHPPW3L3s6/p1pY9MX/peJDE6siaK1Zar97eTlyAwU0gAlELMiy/RmGXZK9HOTiC+HvA0k9SxlXz/uO83wL8msjHQ6A1nGrwgqttKPreGorxJBNK+QvgrIBEn7VWahmnS4Q3QfudYD20Cpv/ZQ+xgZZ4tO37DX/N8xXjG9Gu7agi79jkdo+YcNghCYni4bCEWqOytECpxX00SLoAjSZpjaRVEDsmTyOBQH2R6dZd5XGLCVcbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NWEUoUA5; dkim-atps=neutral; spf=pass (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org) smtp.mailfrom=bootlin.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=gm1 header.b=NWEUoUA5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=bootlin.com (client-ip=2001:4b98:dc4:8::224; helo=relay4-d.mail.gandi.net; envelope-from=maxime.chevallier@bootlin.com; receiver=lists.ozlabs.org)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [IPv6:2001:4b98:dc4:8::224])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Y2gLh74x8z304Z
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Dec 2024 23:43:40 +1100 (AEDT)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 27420E0014;
	Tue,  3 Dec 2024 12:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733229815;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WBCqYYv3YXd5ENSbBD2+uchIXFYD+CKhJvuWxfPM7Xk=;
	b=NWEUoUA5RouWcr1xNFFyfJa84MrnUceEEs7jv6Dz3Mc72h3Vf0I2h4+H/uMA94Uqv7RtdS
	eUq8zTe/FZfiA0ZPe35qpSKqW7WH2G/LCFR9dazxkxdB+UiwtV/9nZmmPoN8Gs52fnBRhF
	KZFT2Q68jau98Q0k0Je3LF1MhiXV12e3s25Rn/arQtsffRLZqi4s5q0mYGMx6D83IriZ4S
	68Vb3x+cxsUfXg+fDz8TpFJU6qvKFamyDz40mqo93h3p14geaz6Yo6LaA6EOUcbD1dPaJR
	vY7VSsqUZDM67/hSP2oqSzHxvrqs50ZHbS+lGSoMaMhDGkHC68syLhyASj9teA==
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
Subject: [PATCH net-next v3 08/10] net: freescale: ucc_geth: Move the serdes configuration around
Date: Tue,  3 Dec 2024 13:43:19 +0100
Message-ID: <20241203124323.155866-9-maxime.chevallier@bootlin.com>
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

The uec_configure_serdes() function deals with serialized linkmodes
settings. It's used during the link bringup sequence. It is planned to
be used during the phylink conversion for mac configuration, but it
needs to me moved around in the process. To make the phylink port
clearer, this commit moves the function without any feature change.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
V3: No changes

 drivers/net/ethernet/freescale/ucc_geth.c | 93 +++++++++++------------
 1 file changed, 46 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 81aefe291d80..f6dd36dc03fe 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -1512,6 +1512,52 @@ static void ugeth_activate(struct ucc_geth_private *ugeth)
 	__netdev_watchdog_up(ugeth->ndev);
 }
 
+/* Initialize TBI PHY interface for communicating with the
+ * SERDES lynx PHY on the chip.  We communicate with this PHY
+ * through the MDIO bus on each controller, treating it as a
+ * "normal" PHY at the address found in the UTBIPA register.  We assume
+ * that the UTBIPA register is valid.  Either the MDIO bus code will set
+ * it to a value that doesn't conflict with other PHYs on the bus, or the
+ * value doesn't matter, as there are no other PHYs on the bus.
+ */
+static void uec_configure_serdes(struct net_device *dev)
+{
+	struct ucc_geth_private *ugeth = netdev_priv(dev);
+	struct ucc_geth_info *ug_info = ugeth->ug_info;
+	struct phy_device *tbiphy;
+
+	if (!ug_info->tbi_node) {
+		dev_warn(&dev->dev, "SGMII mode requires that the device tree specify a tbi-handle\n");
+		return;
+	}
+
+	tbiphy = of_phy_find_device(ug_info->tbi_node);
+	if (!tbiphy) {
+		dev_err(&dev->dev, "error: Could not get TBI device\n");
+		return;
+	}
+
+	/*
+	 * If the link is already up, we must already be ok, and don't need to
+	 * configure and reset the TBI<->SerDes link.  Maybe U-Boot configured
+	 * everything for us?  Resetting it takes the link down and requires
+	 * several seconds for it to come back.
+	 */
+	if (phy_read(tbiphy, ENET_TBI_MII_SR) & TBISR_LSTATUS) {
+		put_device(&tbiphy->mdio.dev);
+		return;
+	}
+
+	/* Single clk mode, mii mode off(for serdes communication) */
+	phy_write(tbiphy, ENET_TBI_MII_ANA, TBIANA_SETTINGS);
+
+	phy_write(tbiphy, ENET_TBI_MII_TBICON, TBICON_CLK_SELECT);
+
+	phy_write(tbiphy, ENET_TBI_MII_CR, TBICR_SETTINGS);
+
+	put_device(&tbiphy->mdio.dev);
+}
+
 static void ugeth_link_up(struct ucc_geth_private *ugeth,
 			  struct phy_device *phy,
 			  phy_interface_t interface, int speed, int duplex)
@@ -1619,53 +1665,6 @@ static void adjust_link(struct net_device *dev)
 		ugeth_link_down(ugeth);
 }
 
-/* Initialize TBI PHY interface for communicating with the
- * SERDES lynx PHY on the chip.  We communicate with this PHY
- * through the MDIO bus on each controller, treating it as a
- * "normal" PHY at the address found in the UTBIPA register.  We assume
- * that the UTBIPA register is valid.  Either the MDIO bus code will set
- * it to a value that doesn't conflict with other PHYs on the bus, or the
- * value doesn't matter, as there are no other PHYs on the bus.
- */
-static void uec_configure_serdes(struct net_device *dev)
-{
-	struct ucc_geth_private *ugeth = netdev_priv(dev);
-	struct ucc_geth_info *ug_info = ugeth->ug_info;
-	struct phy_device *tbiphy;
-
-	if (!ug_info->tbi_node) {
-		dev_warn(&dev->dev, "SGMII mode requires that the device "
-			"tree specify a tbi-handle\n");
-		return;
-	}
-
-	tbiphy = of_phy_find_device(ug_info->tbi_node);
-	if (!tbiphy) {
-		dev_err(&dev->dev, "error: Could not get TBI device\n");
-		return;
-	}
-
-	/*
-	 * If the link is already up, we must already be ok, and don't need to
-	 * configure and reset the TBI<->SerDes link.  Maybe U-Boot configured
-	 * everything for us?  Resetting it takes the link down and requires
-	 * several seconds for it to come back.
-	 */
-	if (phy_read(tbiphy, ENET_TBI_MII_SR) & TBISR_LSTATUS) {
-		put_device(&tbiphy->mdio.dev);
-		return;
-	}
-
-	/* Single clk mode, mii mode off(for serdes communication) */
-	phy_write(tbiphy, ENET_TBI_MII_ANA, TBIANA_SETTINGS);
-
-	phy_write(tbiphy, ENET_TBI_MII_TBICON, TBICON_CLK_SELECT);
-
-	phy_write(tbiphy, ENET_TBI_MII_CR, TBICR_SETTINGS);
-
-	put_device(&tbiphy->mdio.dev);
-}
-
 /* Configure the PHY for dev.
  * returns 0 if success.  -1 if failure
  */
-- 
2.47.0


