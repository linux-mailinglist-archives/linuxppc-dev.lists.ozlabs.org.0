Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FED66794B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:31:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nt7n571Plz3fDF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 02:31:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=DQo+zpBo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=DQo+zpBo;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt7c66dRZz3cFP;
	Fri, 13 Jan 2023 02:23:34 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 465221690;
	Thu, 12 Jan 2023 16:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673536525;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=va3eUaZnHCKlQplAwN4w5XiSMq1VSmnSgM2dhGILW2o=;
	b=DQo+zpBotQ2t/EbMh9EwCQFrWeNxSObgLR2Aj66zj7Y5QWFbcoPO+2wfXmrgfzJ03vIm7v
	Tr6LlfT/JR1d89sTPgeA9NFXQWptTt64vUiRBt9RE1JSwqAWAaf5AuFL19L79/nH54D3/J
	y1Vn10Wj3G1pCWS6IyPidtuk8kKpOpOZm0RSBUXGuQQDrNskjsuGQHRYsT7BJ62eSRB12i
	z0Y1o1Y5CLboAv0SLBJB8Qyde/orRDhxQP9U0RGBjhKigSi76/VeCXI/wVPVVMZUeX/ofl
	HfWx0KXdNS4Rne9HeO1h0C1ehT1vt6KYK5/lGWSAkAc3H9g6YgCY2R4jSAISyQ==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:10 +0100
Subject:  [PATCH net-next 04/10] net: mdio: aspeed: Separate C22 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230112-net-next-c45-seperation-part-2-v1-4-5eeaae931526@walle.cc>
References:  <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
In-Reply-To:  <20230112-net-next-c45-seperation-part-2-v1-0-5eeaae931526@walle.cc>
To: Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Ray Jui <rjui@broadcom.com>,
 Scott Branden <sbranden@broadcom.com>,
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>, UNGLinuxDriver@microchip.com,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Li Yang <leoyang.li@nxp.com>
X-Mailer: b4 0.11.1
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
Cc: Andrew Lunn <andrew@lunn.ch>, linux-aspeed@lists.ozlabs.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Walle <michael@walle.cc>, linux-mediatek@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Andrew Lunn <andrew@lunn.ch>

The aspeed MDIO bus driver can perform both C22 and C45 transfers.
Modify the existing C45 functions to take the devad as a parameter,
and remove the wrappers so there are individual C22 and C45 functions. Add
the C45 functions to the new API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/mdio/mdio-aspeed.c | 47 +++++++++++-------------------------------
 1 file changed, 12 insertions(+), 35 deletions(-)

diff --git a/drivers/net/mdio/mdio-aspeed.c b/drivers/net/mdio/mdio-aspeed.c
index 944d005d2bd1..2f4bbda5e56c 100644
--- a/drivers/net/mdio/mdio-aspeed.c
+++ b/drivers/net/mdio/mdio-aspeed.c
@@ -104,61 +104,36 @@ static int aspeed_mdio_write_c22(struct mii_bus *bus, int addr, int regnum,
 			      addr, regnum, val);
 }
 
-static int aspeed_mdio_read_c45(struct mii_bus *bus, int addr, int regnum)
+static int aspeed_mdio_read_c45(struct mii_bus *bus, int addr, int devad,
+				int regnum)
 {
-	u8 c45_dev = (regnum >> 16) & 0x1F;
-	u16 c45_addr = regnum & 0xFFFF;
 	int rc;
 
 	rc = aspeed_mdio_op(bus, ASPEED_MDIO_CTRL_ST_C45, MDIO_C45_OP_ADDR,
-			    addr, c45_dev, c45_addr);
+			    addr, devad, regnum);
 	if (rc < 0)
 		return rc;
 
 	rc = aspeed_mdio_op(bus, ASPEED_MDIO_CTRL_ST_C45, MDIO_C45_OP_READ,
-			    addr, c45_dev, 0);
+			    addr, devad, 0);
 	if (rc < 0)
 		return rc;
 
 	return aspeed_mdio_get_data(bus);
 }
 
-static int aspeed_mdio_write_c45(struct mii_bus *bus, int addr, int regnum,
-				 u16 val)
+static int aspeed_mdio_write_c45(struct mii_bus *bus, int addr, int devad,
+				 int regnum, u16 val)
 {
-	u8 c45_dev = (regnum >> 16) & 0x1F;
-	u16 c45_addr = regnum & 0xFFFF;
 	int rc;
 
 	rc = aspeed_mdio_op(bus, ASPEED_MDIO_CTRL_ST_C45, MDIO_C45_OP_ADDR,
-			    addr, c45_dev, c45_addr);
+			    addr, devad, regnum);
 	if (rc < 0)
 		return rc;
 
 	return aspeed_mdio_op(bus, ASPEED_MDIO_CTRL_ST_C45, MDIO_C45_OP_WRITE,
-			      addr, c45_dev, val);
-}
-
-static int aspeed_mdio_read(struct mii_bus *bus, int addr, int regnum)
-{
-	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d\n", __func__, addr,
-		regnum);
-
-	if (regnum & MII_ADDR_C45)
-		return aspeed_mdio_read_c45(bus, addr, regnum);
-
-	return aspeed_mdio_read_c22(bus, addr, regnum);
-}
-
-static int aspeed_mdio_write(struct mii_bus *bus, int addr, int regnum, u16 val)
-{
-	dev_dbg(&bus->dev, "%s: addr: %d, regnum: %d, val: 0x%x\n",
-		__func__, addr, regnum, val);
-
-	if (regnum & MII_ADDR_C45)
-		return aspeed_mdio_write_c45(bus, addr, regnum, val);
-
-	return aspeed_mdio_write_c22(bus, addr, regnum, val);
+			      addr, devad, val);
 }
 
 static int aspeed_mdio_probe(struct platform_device *pdev)
@@ -185,8 +160,10 @@ static int aspeed_mdio_probe(struct platform_device *pdev)
 	bus->name = DRV_NAME;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);
 	bus->parent = &pdev->dev;
-	bus->read = aspeed_mdio_read;
-	bus->write = aspeed_mdio_write;
+	bus->read = aspeed_mdio_read_c22;
+	bus->write = aspeed_mdio_write_c22;
+	bus->read_c45 = aspeed_mdio_read_c45;
+	bus->write_c45 = aspeed_mdio_write_c45;
 	bus->probe_capabilities = MDIOBUS_C22_C45;
 
 	rc = of_mdiobus_register(bus, pdev->dev.of_node);

-- 
2.30.2
