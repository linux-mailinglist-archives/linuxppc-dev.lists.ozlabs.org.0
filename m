Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A47355EAC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 00:18:30 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FFMP05RQzz3c5J
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Apr 2021 08:18:28 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256 header.s=mail2016061301 header.b=BzCGx5SN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=walle.cc (client-ip=176.9.125.105; helo=ssl.serverraum.org;
 envelope-from=michael@walle.cc; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 secure) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2016061301 header.b=BzCGx5SN; 
 dkim-atps=neutral
Received: from ssl.serverraum.org (ssl.serverraum.org [176.9.125.105])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FFBVf4lq7z2xZZ
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Apr 2021 01:37:46 +1000 (AEST)
Received: from mwalle01.fritz.box (unknown
 [IPv6:2a02:810c:c200:2e91:fa59:71ff:fe9b:b851])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-384) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by ssl.serverraum.org (Postfix) with ESMTPSA id 1165E22253;
 Tue,  6 Apr 2021 17:37:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=walle.cc;
 s=mail2016061301; t=1617723464;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lACUh6+pO6Mh+0/uWp/aTCFDfW7S2kCGechEIv6LxiY=;
 b=BzCGx5SN0jEHC8+qmmZDOwoUgfLCkVr2Bh3VdVahuCWxROBxMtqgptKfIa6bJEmq/EtSNw
 xbTAmCcHgGRkO6HOTDaNFGM66muyr5PV40PdpKWguXRFitmNaJGctJFf2VWVACHE8N7ZeX
 sP/zgBXVPofopSD6ybGoDe+vesSQZOk=
From: Michael Walle <michael@walle.cc>
To: ath9k-devel@qca.qualcomm.com, UNGLinuxDriver@microchip.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-amlogic@lists.infradead.org, linux-oxnas@groups.io,
 linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org,
 devicetree@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH net-next v2 2/2] of: net: fix of_get_mac_addr_nvmem() for PCI
 and DSA nodes
Date: Tue,  6 Apr 2021 17:37:25 +0200
Message-Id: <20210406153725.10059-3-michael@walle.cc>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210406153725.10059-1-michael@walle.cc>
References: <20210406153725.10059-1-michael@walle.cc>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Wed, 07 Apr 2021 08:17:11 +1000
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
Cc: Andrew Lunn <andrew@lunn.ch>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jerome.pouiller@silabs.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Andreas Larsson <andreas@gaisler.com>, Rob Herring <robh+dt@kernel.org>,
 Michal Simek <michal.simek@xilinx.com>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Paul Mackerras <paulus@samba.org>, Michael Walle <michael@walle.cc>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Li Yang <leoyang.li@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Stephen Hemminger <stephen@networkplumber.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Frank Rowand <frowand.list@gmail.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Gregory Clement <gregory.clement@bootlin.com>,
 Madalin Bucur <madalin.bucur@nxp.com>, Russell King <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Wingman Kwok <w-kwok2@ti.com>,
 Chen-Yu Tsai <wens@csie.org>, Jose Abreu <joabreu@synopsys.com>,
 bcm-kernel-feedback-list@broadcom.com, NXP Linux Team <linux-imx@nxp.com>,
 Chris Snook <chris.snook@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Radhey Shyam Pandey <radhey.shyam.pandey@xilinx.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Sunil Goutham <sgoutham@marvell.com>,
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
 Grygorii Strashko <grygorii.strashko@ti.com>, Byungho An <bh74.an@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, Stanislaw Gruszka <stf_xl@wp.pl>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Sascha Hauer <s.hauer@pengutronix.de>,
 Sean Wang <sean.wang@mediatek.com>, Salil Mehta <salil.mehta@huawei.com>,
 Maxime Ripard <mripard@kernel.org>, Vladimir Zapolskiy <vz@mleia.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Murali Karicheri <m-karicheri2@ti.com>, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Kalle Valo <kvalo@codeaurora.org>, Mirko Lindner <mlindner@marvell.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Vladimir Oltean <olteanv@gmail.com>,
 Fugang Duan <fugang.duan@nxp.com>, Vadym Kochan <vkochan@marvell.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Bryan Whitehead <bryan.whitehead@microchip.com>,
 Helmut Schaa <helmut.schaa@googlemail.com>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 "David S . Miller" <davem@davemloft.net>, Taras Chornyi <tchornyi@marvell.com>,
 Vinod Koul <vkoul@kernel.org>, Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Joyce Ooi <joyce.ooi@intel.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Shawn Guo <shawnguo@kernel.org>,
 Claudiu Beznea <claudiu.beznea@microchip.com>, Felix Fietkau <nbd@nbd.name>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_get_mac_address() already supports fetching the MAC address by an
nvmem provider. But until now, it was just working for platform devices.
Esp. it was not working for DSA ports and PCI devices. It gets more
common that PCI devices have a device tree binding since SoCs contain
integrated root complexes.

Use the nvmem of_* binding to fetch the nvmem cells by a struct
device_node. We still have to try to read the cell by device first
because there might be a nvmem_cell_lookup associated with that device.

Signed-off-by: Michael Walle <michael@walle.cc>
---
Please note, that I've kept the nvmem_get_mac_address() which operates
on a device. The new of_get_mac_addr_nvmem() is almost identical and
there are no users of the former function right now, but it seems to be
the "newer" version to get the MAC address for a "struct device". Thus
I've kept it. Please advise, if I should kill it though.

 drivers/of/of_net.c | 37 +++++++++++++++++++++++++++++++------
 1 file changed, 31 insertions(+), 6 deletions(-)

diff --git a/drivers/of/of_net.c b/drivers/of/of_net.c
index 2344ad7fff5e..2323c6063eaf 100644
--- a/drivers/of/of_net.c
+++ b/drivers/of/of_net.c
@@ -11,6 +11,7 @@
 #include <linux/phy.h>
 #include <linux/export.h>
 #include <linux/device.h>
+#include <linux/nvmem-consumer.h>
 
 /**
  * of_get_phy_mode - Get phy mode for given device_node
@@ -56,18 +57,42 @@ static int of_get_mac_addr(struct device_node *np, const char *name, u8 *addr)
 	return -ENODEV;
 }
 
-static int of_get_mac_addr_nvmem(struct device_node *np, u8 addr)
+static int of_get_mac_addr_nvmem(struct device_node *np, u8 *addr)
 {
 	struct platform_device *pdev = of_find_device_by_node(np);
+	struct nvmem_cell *cell;
+	const void *mac;
+	size_t len;
 	int ret;
 
-	if (!pdev)
-		return -ENODEV;
+	/* Try lookup by device first, there might be a nvmem_cell_lookup
+	 * associated with a given device.
+	 */
+	if (pdev) {
+		ret = nvmem_get_mac_address(&pdev->dev, addr);
+		put_device(&pdev->dev);
+		return ret;
+	}
+
+	cell = of_nvmem_cell_get(np, "mac-address");
+	if (IS_ERR(cell))
+		return PTR_ERR(cell);
+
+	mac = nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+
+	if (IS_ERR(mac))
+		return PTR_ERR(mac);
+
+	if (len != ETH_ALEN || !is_valid_ether_addr(mac)) {
+		kfree(mac);
+		return -EINVAL;
+	}
 
-	ret = nvmem_get_mac_address(&pdev->dev, addr);
-	put_device(&pdev->dev);
+	ether_addr_copy(addr, mac);
+	kfree(mac);
 
-	return ret;
+	return 0;
 }
 
 /**
-- 
2.20.1

