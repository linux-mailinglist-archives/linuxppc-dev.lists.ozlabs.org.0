Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 611A766793B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:29:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nt7l520xVz3fMn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 02:29:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=dxJrkPGr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=dxJrkPGr;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt7c66SKHz3cDh;
	Fri, 13 Jan 2023 02:23:34 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id AB61D1694;
	Thu, 12 Jan 2023 16:15:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673536526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDAHxHfRrvf51PIr8qmkywmz1eulPcXYJJmt0L06/Wc=;
	b=dxJrkPGrUuPERHwOXrIz6EipOact5Skyuz4gZjFnkKNdVRA5sGIMzO2HgJvV2WvCfXExga
	NZeMBVuR2zjkdVevQ6QDTKYgKRx5BLIGSZMKrrokbRjn2C7acN0prb44Ylj5sSAsot20t9
	dNfeIt3I77raGBZTUUQxHdVLb4qoQnoU+8T09zcOraoSzVkYZr//XkQhenVWTOcOnZGiUD
	zrr7VBG8+/i0oEYcU1Gn/9FGPDi5RYrXUv2osARSmAh95Dt/EK8+M8fYVPFRZj9drfIh9N
	RKMcfuCqZo0JW69x802ebFbfKfbSC5EZtbV2kQf3LNk/bXJIyVUlvnNWf2GAzA==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:11 +0100
Subject:  [PATCH net-next 05/10] net: mdio: ipq4019: Separate C22 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230112-net-next-c45-seperation-part-2-v1-5-5eeaae931526@walle.cc>
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

The ipq4019 driver can perform both C22 and C45 transfers.  Create
separate functions for each and register the C45 versions using the
new driver API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/mdio/mdio-ipq4019.c | 154 +++++++++++++++++++++++-----------------
 1 file changed, 90 insertions(+), 64 deletions(-)

diff --git a/drivers/net/mdio/mdio-ipq4019.c b/drivers/net/mdio/mdio-ipq4019.c
index 4eba5a91075c..78b93de636f5 100644
--- a/drivers/net/mdio/mdio-ipq4019.c
+++ b/drivers/net/mdio/mdio-ipq4019.c
@@ -53,7 +53,8 @@ static int ipq4019_mdio_wait_busy(struct mii_bus *bus)
 				  IPQ4019_MDIO_SLEEP, IPQ4019_MDIO_TIMEOUT);
 }
 
-static int ipq4019_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
+static int ipq4019_mdio_read_c45(struct mii_bus *bus, int mii_id, int mmd,
+				 int reg)
 {
 	struct ipq4019_mdio_data *priv = bus->priv;
 	unsigned int data;
@@ -62,61 +63,71 @@ static int ipq4019_mdio_read(struct mii_bus *bus, int mii_id, int regnum)
 	if (ipq4019_mdio_wait_busy(bus))
 		return -ETIMEDOUT;
 
-	/* Clause 45 support */
-	if (regnum & MII_ADDR_C45) {
-		unsigned int mmd = (regnum >> 16) & 0x1F;
-		unsigned int reg = regnum & 0xFFFF;
+	data = readl(priv->membase + MDIO_MODE_REG);
 
-		/* Enter Clause 45 mode */
-		data = readl(priv->membase + MDIO_MODE_REG);
+	data |= MDIO_MODE_C45;
 
-		data |= MDIO_MODE_C45;
+	writel(data, priv->membase + MDIO_MODE_REG);
 
-		writel(data, priv->membase + MDIO_MODE_REG);
+	/* issue the phy address and mmd */
+	writel((mii_id << 8) | mmd, priv->membase + MDIO_ADDR_REG);
 
-		/* issue the phy address and mmd */
-		writel((mii_id << 8) | mmd, priv->membase + MDIO_ADDR_REG);
+	/* issue reg */
+	writel(reg, priv->membase + MDIO_DATA_WRITE_REG);
 
-		/* issue reg */
-		writel(reg, priv->membase + MDIO_DATA_WRITE_REG);
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_ADDR;
 
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_ADDR;
-	} else {
-		/* Enter Clause 22 mode */
-		data = readl(priv->membase + MDIO_MODE_REG);
+	/* issue read command */
+	writel(cmd, priv->membase + MDIO_CMD_REG);
 
-		data &= ~MDIO_MODE_C45;
+	/* Wait read complete */
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
 
-		writel(data, priv->membase + MDIO_MODE_REG);
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_READ;
 
-		/* issue the phy address and reg */
-		writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
+	writel(cmd, priv->membase + MDIO_CMD_REG);
 
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_READ;
-	}
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
 
-	/* issue read command */
-	writel(cmd, priv->membase + MDIO_CMD_REG);
+	/* Read and return data */
+	return readl(priv->membase + MDIO_DATA_READ_REG);
+}
+
+static int ipq4019_mdio_read_c22(struct mii_bus *bus, int mii_id, int regnum)
+{
+	struct ipq4019_mdio_data *priv = bus->priv;
+	unsigned int data;
+	unsigned int cmd;
 
-	/* Wait read complete */
 	if (ipq4019_mdio_wait_busy(bus))
 		return -ETIMEDOUT;
 
-	if (regnum & MII_ADDR_C45) {
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_READ;
+	data = readl(priv->membase + MDIO_MODE_REG);
 
-		writel(cmd, priv->membase + MDIO_CMD_REG);
+	data &= ~MDIO_MODE_C45;
 
-		if (ipq4019_mdio_wait_busy(bus))
-			return -ETIMEDOUT;
-	}
+	writel(data, priv->membase + MDIO_MODE_REG);
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
+
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_READ;
+
+	/* issue read command */
+	writel(cmd, priv->membase + MDIO_CMD_REG);
+
+	/* Wait read complete */
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
 
 	/* Read and return data */
 	return readl(priv->membase + MDIO_DATA_READ_REG);
 }
 
-static int ipq4019_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
-							 u16 value)
+static int ipq4019_mdio_write_c45(struct mii_bus *bus, int mii_id, int mmd,
+				  int reg, u16 value)
 {
 	struct ipq4019_mdio_data *priv = bus->priv;
 	unsigned int data;
@@ -125,50 +136,63 @@ static int ipq4019_mdio_write(struct mii_bus *bus, int mii_id, int regnum,
 	if (ipq4019_mdio_wait_busy(bus))
 		return -ETIMEDOUT;
 
-	/* Clause 45 support */
-	if (regnum & MII_ADDR_C45) {
-		unsigned int mmd = (regnum >> 16) & 0x1F;
-		unsigned int reg = regnum & 0xFFFF;
+	data = readl(priv->membase + MDIO_MODE_REG);
 
-		/* Enter Clause 45 mode */
-		data = readl(priv->membase + MDIO_MODE_REG);
+	data |= MDIO_MODE_C45;
 
-		data |= MDIO_MODE_C45;
+	writel(data, priv->membase + MDIO_MODE_REG);
 
-		writel(data, priv->membase + MDIO_MODE_REG);
+	/* issue the phy address and mmd */
+	writel((mii_id << 8) | mmd, priv->membase + MDIO_ADDR_REG);
 
-		/* issue the phy address and mmd */
-		writel((mii_id << 8) | mmd, priv->membase + MDIO_ADDR_REG);
+	/* issue reg */
+	writel(reg, priv->membase + MDIO_DATA_WRITE_REG);
 
-		/* issue reg */
-		writel(reg, priv->membase + MDIO_DATA_WRITE_REG);
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_ADDR;
 
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_ADDR;
+	writel(cmd, priv->membase + MDIO_CMD_REG);
 
-		writel(cmd, priv->membase + MDIO_CMD_REG);
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
 
-		if (ipq4019_mdio_wait_busy(bus))
-			return -ETIMEDOUT;
-	} else {
-		/* Enter Clause 22 mode */
-		data = readl(priv->membase + MDIO_MODE_REG);
+	/* issue write data */
+	writel(value, priv->membase + MDIO_DATA_WRITE_REG);
 
-		data &= ~MDIO_MODE_C45;
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_WRITE;
+	writel(cmd, priv->membase + MDIO_CMD_REG);
 
-		writel(data, priv->membase + MDIO_MODE_REG);
+	/* Wait write complete */
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
 
-		/* issue the phy address and reg */
-		writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
-	}
+	return 0;
+}
+
+static int ipq4019_mdio_write_c22(struct mii_bus *bus, int mii_id, int regnum,
+				  u16 value)
+{
+	struct ipq4019_mdio_data *priv = bus->priv;
+	unsigned int data;
+	unsigned int cmd;
+
+	if (ipq4019_mdio_wait_busy(bus))
+		return -ETIMEDOUT;
+
+	/* Enter Clause 22 mode */
+	data = readl(priv->membase + MDIO_MODE_REG);
+
+	data &= ~MDIO_MODE_C45;
+
+	writel(data, priv->membase + MDIO_MODE_REG);
+
+	/* issue the phy address and reg */
+	writel((mii_id << 8) | regnum, priv->membase + MDIO_ADDR_REG);
 
 	/* issue write data */
 	writel(value, priv->membase + MDIO_DATA_WRITE_REG);
 
 	/* issue write command */
-	if (regnum & MII_ADDR_C45)
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_C45_WRITE;
-	else
-		cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_WRITE;
+	cmd = MDIO_CMD_ACCESS_START | MDIO_CMD_ACCESS_CODE_WRITE;
 
 	writel(cmd, priv->membase + MDIO_CMD_REG);
 
@@ -235,8 +259,10 @@ static int ipq4019_mdio_probe(struct platform_device *pdev)
 		priv->eth_ldo_rdy = devm_ioremap_resource(&pdev->dev, res);
 
 	bus->name = "ipq4019_mdio";
-	bus->read = ipq4019_mdio_read;
-	bus->write = ipq4019_mdio_write;
+	bus->read = ipq4019_mdio_read_c22;
+	bus->write = ipq4019_mdio_write_c22;
+	bus->read_c45 = ipq4019_mdio_read_c45;
+	bus->write_c45 = ipq4019_mdio_write_c45;
 	bus->reset = ipq_mdio_reset;
 	bus->parent = &pdev->dev;
 	snprintf(bus->id, MII_BUS_ID_SIZE, "%s%d", pdev->name, pdev->id);

-- 
2.30.2
