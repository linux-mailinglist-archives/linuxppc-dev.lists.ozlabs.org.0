Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B69EA66792D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:27:01 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nt7h34Xc8z3fFc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 02:26:59 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=xSdW0KUu;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=2a01:4f8:c0c:9d57::1; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=xSdW0KUu;
	dkim-atps=neutral
X-Greylist: delayed 480 seconds by postgrey-1.36 at boromir; Fri, 13 Jan 2023 02:23:31 AEDT
Received: from mail.3ffe.de (0001.3ffe.de [IPv6:2a01:4f8:c0c:9d57::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt7c334Vdz3c4c;
	Fri, 13 Jan 2023 02:23:31 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 8107916A3;
	Thu, 12 Jan 2023 16:15:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673536526;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=rwJHVT/sthynx13hNDgfbweyywm6KR7oWSc3hnaT8yA=;
	b=xSdW0KUuTFACwN8P5e+7WOnj87FwYebBGrG57fwIEFEdLXbBMqq3DtW1I6sLHYIWD6h+ev
	lT469vVYlcZpsj/CIQkydYULCrG87roTkfucR96tWJfp0hgr9gf+7IUjAiVOmNWM94JGZp
	RBENMSAAlfMcGu8bXrLdG+mKAUU9Yw0iTbs4iVjI7RRE4GGeBObFNvmvz8iN9PXVn9BHf2
	cQT2xbmRr7dJjvW+jA+KxYSfy9kj+bIVFH8mncTHKvroLuPeCdDPgCeYFjad/RIUFBRBIU
	XNs/h2JL1FzHBf3jztCv5X35YKxa7QkHtEjxwu0n1OZ4GxfhoE2nH+26S8PXUA==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:13 +0100
Subject:  [PATCH net-next 07/10] net: lan743x: Separate C22 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230112-net-next-c45-seperation-part-2-v1-7-5eeaae931526@walle.cc>
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

The microchip lan743x MDIO bus driver can perform both C22 and C45
transfers in some variants. Create separate functions for each and
register the C45 versions using the new API calls where appropriate.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/ethernet/microchip/lan743x_main.c | 106 +++++++++++++-------------
 1 file changed, 51 insertions(+), 55 deletions(-)

diff --git a/drivers/net/ethernet/microchip/lan743x_main.c b/drivers/net/ethernet/microchip/lan743x_main.c
index 534840f9a7ca..e205edf477de 100644
--- a/drivers/net/ethernet/microchip/lan743x_main.c
+++ b/drivers/net/ethernet/microchip/lan743x_main.c
@@ -792,7 +792,7 @@ static int lan743x_mac_mii_wait_till_not_busy(struct lan743x_adapter *adapter)
 				  !(data & MAC_MII_ACC_MII_BUSY_), 0, 1000000);
 }
 
-static int lan743x_mdiobus_read(struct mii_bus *bus, int phy_id, int index)
+static int lan743x_mdiobus_read_c22(struct mii_bus *bus, int phy_id, int index)
 {
 	struct lan743x_adapter *adapter = bus->priv;
 	u32 val, mii_access;
@@ -814,8 +814,8 @@ static int lan743x_mdiobus_read(struct mii_bus *bus, int phy_id, int index)
 	return (int)(val & 0xFFFF);
 }
 
-static int lan743x_mdiobus_write(struct mii_bus *bus,
-				 int phy_id, int index, u16 regval)
+static int lan743x_mdiobus_write_c22(struct mii_bus *bus,
+				     int phy_id, int index, u16 regval)
 {
 	struct lan743x_adapter *adapter = bus->priv;
 	u32 val, mii_access;
@@ -835,12 +835,10 @@ static int lan743x_mdiobus_write(struct mii_bus *bus,
 	return ret;
 }
 
-static u32 lan743x_mac_mmd_access(int id, int index, int op)
+static u32 lan743x_mac_mmd_access(int id, int dev_addr, int op)
 {
-	u16 dev_addr;
 	u32 ret;
 
-	dev_addr = (index >> 16) & 0x1f;
 	ret = (id << MAC_MII_ACC_PHY_ADDR_SHIFT_) &
 		MAC_MII_ACC_PHY_ADDR_MASK_;
 	ret |= (dev_addr << MAC_MII_ACC_MIIMMD_SHIFT_) &
@@ -858,7 +856,8 @@ static u32 lan743x_mac_mmd_access(int id, int index, int op)
 	return ret;
 }
 
-static int lan743x_mdiobus_c45_read(struct mii_bus *bus, int phy_id, int index)
+static int lan743x_mdiobus_read_c45(struct mii_bus *bus, int phy_id,
+				    int dev_addr, int index)
 {
 	struct lan743x_adapter *adapter = bus->priv;
 	u32 mmd_access;
@@ -868,32 +867,30 @@ static int lan743x_mdiobus_c45_read(struct mii_bus *bus, int phy_id, int index)
 	ret = lan743x_mac_mii_wait_till_not_busy(adapter);
 	if (ret < 0)
 		return ret;
-	if (index & MII_ADDR_C45) {
-		/* Load Register Address */
-		lan743x_csr_write(adapter, MAC_MII_DATA, (u32)(index & 0xffff));
-		mmd_access = lan743x_mac_mmd_access(phy_id, index,
-						    MMD_ACCESS_ADDRESS);
-		lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
-		ret = lan743x_mac_mii_wait_till_not_busy(adapter);
-		if (ret < 0)
-			return ret;
-		/* Read Data */
-		mmd_access = lan743x_mac_mmd_access(phy_id, index,
-						    MMD_ACCESS_READ);
-		lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
-		ret = lan743x_mac_mii_wait_till_not_busy(adapter);
-		if (ret < 0)
-			return ret;
-		ret = lan743x_csr_read(adapter, MAC_MII_DATA);
-		return (int)(ret & 0xFFFF);
-	}
 
-	ret = lan743x_mdiobus_read(bus, phy_id, index);
-	return ret;
+	/* Load Register Address */
+	lan743x_csr_write(adapter, MAC_MII_DATA, index);
+	mmd_access = lan743x_mac_mmd_access(phy_id, dev_addr,
+					    MMD_ACCESS_ADDRESS);
+	lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
+	ret = lan743x_mac_mii_wait_till_not_busy(adapter);
+	if (ret < 0)
+		return ret;
+
+	/* Read Data */
+	mmd_access = lan743x_mac_mmd_access(phy_id, dev_addr,
+					    MMD_ACCESS_READ);
+	lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
+	ret = lan743x_mac_mii_wait_till_not_busy(adapter);
+	if (ret < 0)
+		return ret;
+
+	ret = lan743x_csr_read(adapter, MAC_MII_DATA);
+	return (int)(ret & 0xFFFF);
 }
 
-static int lan743x_mdiobus_c45_write(struct mii_bus *bus,
-				     int phy_id, int index, u16 regval)
+static int lan743x_mdiobus_write_c45(struct mii_bus *bus, int phy_id,
+				     int dev_addr, int index, u16 regval)
 {
 	struct lan743x_adapter *adapter = bus->priv;
 	u32 mmd_access;
@@ -903,26 +900,23 @@ static int lan743x_mdiobus_c45_write(struct mii_bus *bus,
 	ret = lan743x_mac_mii_wait_till_not_busy(adapter);
 	if (ret < 0)
 		return ret;
-	if (index & MII_ADDR_C45) {
-		/* Load Register Address */
-		lan743x_csr_write(adapter, MAC_MII_DATA, (u32)(index & 0xffff));
-		mmd_access = lan743x_mac_mmd_access(phy_id, index,
-						    MMD_ACCESS_ADDRESS);
-		lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
-		ret = lan743x_mac_mii_wait_till_not_busy(adapter);
-		if (ret < 0)
-			return ret;
-		/* Write Data */
-		lan743x_csr_write(adapter, MAC_MII_DATA, (u32)regval);
-		mmd_access = lan743x_mac_mmd_access(phy_id, index,
-						    MMD_ACCESS_WRITE);
-		lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
-		ret = lan743x_mac_mii_wait_till_not_busy(adapter);
-	} else {
-		ret = lan743x_mdiobus_write(bus, phy_id, index, regval);
-	}
 
-	return ret;
+	/* Load Register Address */
+	lan743x_csr_write(adapter, MAC_MII_DATA, (u32)index);
+	mmd_access = lan743x_mac_mmd_access(phy_id, dev_addr,
+					    MMD_ACCESS_ADDRESS);
+	lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
+	ret = lan743x_mac_mii_wait_till_not_busy(adapter);
+	if (ret < 0)
+		return ret;
+
+	/* Write Data */
+	lan743x_csr_write(adapter, MAC_MII_DATA, (u32)regval);
+	mmd_access = lan743x_mac_mmd_access(phy_id, dev_addr,
+					    MMD_ACCESS_WRITE);
+	lan743x_csr_write(adapter, MAC_MII_ACC, mmd_access);
+
+	return lan743x_mac_mii_wait_till_not_busy(adapter);
 }
 
 static int lan743x_sgmii_wait_till_not_busy(struct lan743x_adapter *adapter)
@@ -3286,8 +3280,10 @@ static int lan743x_mdiobus_init(struct lan743x_adapter *adapter)
 			netif_dbg(adapter, drv, adapter->netdev,
 				  "SGMII operation\n");
 			adapter->mdiobus->probe_capabilities = MDIOBUS_C22_C45;
-			adapter->mdiobus->read = lan743x_mdiobus_c45_read;
-			adapter->mdiobus->write = lan743x_mdiobus_c45_write;
+			adapter->mdiobus->read = lan743x_mdiobus_read_c22;
+			adapter->mdiobus->write = lan743x_mdiobus_write_c22;
+			adapter->mdiobus->read_c45 = lan743x_mdiobus_read_c45;
+			adapter->mdiobus->write_c45 = lan743x_mdiobus_write_c45;
 			adapter->mdiobus->name = "lan743x-mdiobus-c45";
 			netif_dbg(adapter, drv, adapter->netdev,
 				  "lan743x-mdiobus-c45\n");
@@ -3300,15 +3296,15 @@ static int lan743x_mdiobus_init(struct lan743x_adapter *adapter)
 				  "RGMII operation\n");
 			// Only C22 support when RGMII I/F
 			adapter->mdiobus->probe_capabilities = MDIOBUS_C22;
-			adapter->mdiobus->read = lan743x_mdiobus_read;
-			adapter->mdiobus->write = lan743x_mdiobus_write;
+			adapter->mdiobus->read = lan743x_mdiobus_read_c22;
+			adapter->mdiobus->write = lan743x_mdiobus_write_c22;
 			adapter->mdiobus->name = "lan743x-mdiobus";
 			netif_dbg(adapter, drv, adapter->netdev,
 				  "lan743x-mdiobus\n");
 		}
 	} else {
-		adapter->mdiobus->read = lan743x_mdiobus_read;
-		adapter->mdiobus->write = lan743x_mdiobus_write;
+		adapter->mdiobus->read = lan743x_mdiobus_read_c22;
+		adapter->mdiobus->write = lan743x_mdiobus_write_c22;
 		adapter->mdiobus->name = "lan743x-mdiobus";
 		netif_dbg(adapter, drv, adapter->netdev, "lan743x-mdiobus\n");
 	}

-- 
2.30.2
