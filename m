Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 176E966795A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Jan 2023 16:33:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nt7q66vkJz3fVg
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 Jan 2023 02:33:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=ZscdTe8D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=walle.cc (client-ip=159.69.201.130; helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2022082101 header.b=ZscdTe8D;
	dkim-atps=neutral
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nt7cB1Q50z3cfS;
	Fri, 13 Jan 2023 02:23:38 +1100 (AEDT)
Received: from mwalle01.sab.local (unknown [213.135.10.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.3ffe.de (Postfix) with ESMTPSA id 699BC15D5;
	Thu, 12 Jan 2023 16:15:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc; s=mail2022082101;
	t=1673536524;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGlMvwVE0XBFSe9hGJvTgj13A12QmBDoi6rAazqMrhA=;
	b=ZscdTe8D24J1musI5j2G7C9p7+ZQ5A+f8En3gxFovHFbVirPpUojaZkfg333kVIDkDF3u1
	JkLizYnIr5ACFDZnrUbxG7bosetMyVxoGTk4vVHb3dlVYWpyrNR3Gv8VlK90gXxJzafZ6J
	xAmzBjKWMTol8QKlyKKhzrU2+AzcReoW6O5Lkwhj8E3BH6xgVrvjvKNoB3/nprPu4gTFIA
	YStEnuS/eof5Rt7PsXK7P80//8ogCCMooFjZwakakV+TeFA6h3WcMwkRo12ls99PGFIO4e
	d0VputPdm1yE5Q/e/hkRFikGmt7mi5GgxQNdqBEw9dFiWC7f9diy0rkmOmtt7A==
From: Michael Walle <michael@walle.cc>
Date: Thu, 12 Jan 2023 16:15:08 +0100
Subject:  [PATCH net-next 02/10] net: mdio: i2c: Separate C22 and C45 transactions
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id:  <20230112-net-next-c45-seperation-part-2-v1-2-5eeaae931526@walle.cc>
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

The MDIO over I2C bus driver can perform both C22 and C45 transfers.
Create separate functions for each and register the C45 versions using
the new API calls.

Signed-off-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Michael Walle <michael@walle.cc>
---
 drivers/net/mdio/mdio-i2c.c | 32 +++++++++++++++++++++++---------
 1 file changed, 23 insertions(+), 9 deletions(-)

diff --git a/drivers/net/mdio/mdio-i2c.c b/drivers/net/mdio/mdio-i2c.c
index bf8bf5e20faf..9577a1842997 100644
--- a/drivers/net/mdio/mdio-i2c.c
+++ b/drivers/net/mdio/mdio-i2c.c
@@ -30,7 +30,8 @@ static unsigned int i2c_mii_phy_addr(int phy_id)
 	return phy_id + 0x40;
 }
 
-static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
+static int i2c_mii_read_default_c45(struct mii_bus *bus, int phy_id, int devad,
+				    int reg)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msgs[2];
@@ -41,8 +42,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 		return 0xffff;
 
 	p = addr;
-	if (reg & MII_ADDR_C45) {
-		*p++ = 0x20 | ((reg >> 16) & 31);
+	if (devad >= 0) {
+		*p++ = 0x20 | devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -64,8 +65,8 @@ static int i2c_mii_read_default(struct mii_bus *bus, int phy_id, int reg)
 	return data[0] << 8 | data[1];
 }
 
-static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
-				 u16 val)
+static int i2c_mii_write_default_c45(struct mii_bus *bus, int phy_id,
+				     int devad, int reg, u16 val)
 {
 	struct i2c_adapter *i2c = bus->priv;
 	struct i2c_msg msg;
@@ -76,8 +77,8 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 		return 0;
 
 	p = data;
-	if (reg & MII_ADDR_C45) {
-		*p++ = (reg >> 16) & 31;
+	if (devad >= 0) {
+		*p++ = devad;
 		*p++ = reg >> 8;
 	}
 	*p++ = reg;
@@ -94,6 +95,17 @@ static int i2c_mii_write_default(struct mii_bus *bus, int phy_id, int reg,
 	return ret < 0 ? ret : 0;
 }
 
+static int i2c_mii_read_default_c22(struct mii_bus *bus, int phy_id, int reg)
+{
+	return i2c_mii_read_default_c45(bus, phy_id, -1, reg);
+}
+
+static int i2c_mii_write_default_c22(struct mii_bus *bus, int phy_id, int reg,
+				     u16 val)
+{
+	return i2c_mii_write_default_c45(bus, phy_id, -1, reg, val);
+}
+
 /* RollBall SFPs do not access internal PHY via I2C address 0x56, but
  * instead via address 0x51, when SFP page is set to 0x03 and password to
  * 0xffffffff.
@@ -403,8 +415,10 @@ struct mii_bus *mdio_i2c_alloc(struct device *parent, struct i2c_adapter *i2c,
 		mii->write = i2c_mii_write_rollball;
 		break;
 	default:
-		mii->read = i2c_mii_read_default;
-		mii->write = i2c_mii_write_default;
+		mii->read = i2c_mii_read_default_c22;
+		mii->write = i2c_mii_write_default_c22;
+		mii->read_c45 = i2c_mii_read_default_c45;
+		mii->write_c45 = i2c_mii_write_default_c45;
 		break;
 	}
 

-- 
2.30.2
