Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3387546B9
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 06:01:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WyYizL8g;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4R2vmf0Mxnz3c7v
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jul 2023 14:01:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WyYizL8g;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=aqjl=db=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4R2t202l0Pz3bZ1
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jul 2023 12:43:20 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 75B7961E30;
	Sat, 15 Jul 2023 02:43:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 126BCC433CA;
	Sat, 15 Jul 2023 02:43:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689388996;
	bh=RuDoz5aPqD3aUOvDQSAThUCLEL5M1SgbHJ5N/FMTEyk=;
	h=From:To:Cc:Subject:Date:From;
	b=WyYizL8g2SP9GuYPsxUP8ZDy4T0ftbFERGpKPkypIfBnsJE/Qwo2A4Ui40tCNu94u
	 aAh3BtuR8duQ9xCEzbFnVvAFiI1eNdjBxqfq2tZMUJh8slq15Xb8M9gw5EQGSKbe2d
	 b/XuuxXvIUPUtthUrxt1A+1Khy6FfsKHypSlZQ0qKeIc8oMiVOXVo1VkfTVeR7uQF0
	 fbHdKHUejOo2nOwT8OhHKJ/75P7A/8F1hmaSwqFdXRXD3gqjK4X2ggQpdgDu0Ak/45
	 1H51T/Tjglptg+xeUOVCA4IJs4dUHnkeo8/ymqXKTv++MwjXjaH+AH7JVvlWJ07pf2
	 bIHl5yX6bbtZA==
Received: (nullmailer pid 4061163 invoked by uid 1000);
	Fri, 14 Jul 2023 17:48:13 -0000
From: Rob Herring <robh@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, Wolfgang Grandegger <wg@grandegger.com>, Marc Kleine-Budde <mkl@pengutronix.de>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Chandrasekar Ramakrishnan <rcsekar@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, Kurt Kanzenbach <kurt@linutronix.de>, Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com, =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Cla
 udiu Manoil <claudiu.manoil@nxp.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linus.walleij@linaro.org>, =?UTF-8?q?Alvin=20=C5=A0ipraga?= <alsi@bang-olufsen.dk>, George McCollister <george.mccollister@gmail.com>, Andreas Larsson <andreas@gaisler.com>, Iyappan Subramanian <iyappan@os.amperecomputing.com>, Keyur Chudgar <keyur@os.amperecomputing.com>, Chris Snook <chris.snook@gmail.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>, Madalin Bucur <madalin.bucur@nxp.com>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team <linux-imx@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Pantelis Antoniou <pantelis.antoniou@gmail.com>, Li Yang <leoyang.li@nxp.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil Mehta <salil.mehta@huawei.com>, Douglas Miller <dougmill@linux.ibm.com>, Marcin Wojtas <mw@semihalf.com>, Russell King <linux@armlinux.org.uk>, Tara
 s Chornyi <taras.chornyi@plvision.eu>, Mirko Lindner <mlindner@marvell.com>, Stephen Hemminger <stephen@networkplumber.org>, Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Horatiu Vultur <horatiu.vultur@microchip.com>, Timur Tabi <timur@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, Steve Glendinning <steve.glendinning@shawell.net>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Vinod Ko
 ul <vkoul@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Samin Guo <samin.guo@starfivetech.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Grygorii Strashko <grygorii.strashko@ti.com>, Kevin Brace <kevinbrace@bracecomputerlab.com>, Francois Romieu <romieu@fr.zoreil.com>, Michal Simek <michal.simek@amd.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Alexander Aring <alex.aring@gmail.com>, Stefan Schmidt <stefan@datenfreihafen.org>, Miquel Raynal <miquel.raynal@bootlin.com>, Alex Elder <elder@kernel.org>, =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <clement.leger@bootlin.com>, Heiner Kallweit <hkallweit1@gmail.com>, SkyLake Huang <SkyLake.Huang@mediatek.com>, Kalle Valo <kvalo@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>, =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouille
 r?= <jerome.pouiller@silabs.com>, Richard Cochran <richardcochran@gmail.com>
Subject: [PATCH] net: Explicitly include correct DT includes
Date: Fri, 14 Jul 2023 11:48:00 -0600
Message-Id: <20230714174809.4060885-1-robh@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 15 Jul 2023 14:01:09 +1000
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
Cc: devicetree@vger.kernel.org, linux-omap@vger.kernel.org, linux-wireless@vger.kernel.org, netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org, linux-can@vger.kernel.org, linux-renesas-soc@vger.kernel.org, linux-wpan@vger.kernel.org, linux-mediatek@lists.infradead.org, ath11k@lists.infradead.org, wcn36xx@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-oxnas@groups.io, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it as merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/net/can/bxcan.c                                 | 1 -
 drivers/net/can/ifi_canfd/ifi_canfd.c                   | 1 -
 drivers/net/can/m_can/m_can.c                           | 1 -
 drivers/net/can/m_can/m_can.h                           | 1 -
 drivers/net/can/rcar/rcar_canfd.c                       | 1 -
 drivers/net/can/sja1000/sja1000_platform.c              | 1 -
 drivers/net/can/sun4i_can.c                             | 1 -
 drivers/net/can/ti_hecc.c                               | 1 -
 drivers/net/dsa/b53/b53_mdio.c                          | 1 +
 drivers/net/dsa/b53/b53_mmap.c                          | 1 +
 drivers/net/dsa/hirschmann/hellcreek.c                  | 1 -
 drivers/net/dsa/hirschmann/hellcreek_ptp.c              | 1 +
 drivers/net/dsa/lan9303-core.c                          | 1 +
 drivers/net/dsa/microchip/ksz8863_smi.c                 | 3 +++
 drivers/net/dsa/microchip/ksz_common.c                  | 2 +-
 drivers/net/dsa/mt7530-mmio.c                           | 3 ++-
 drivers/net/dsa/mv88e6xxx/chip.c                        | 2 +-
 drivers/net/dsa/ocelot/felix_vsc9959.c                  | 1 +
 drivers/net/dsa/ocelot/seville_vsc9953.c                | 3 ++-
 drivers/net/dsa/qca/qca8k-leds.c                        | 1 +
 drivers/net/dsa/realtek/realtek-mdio.c                  | 2 +-
 drivers/net/dsa/realtek/realtek-smi.c                   | 1 -
 drivers/net/dsa/sja1105/sja1105_main.c                  | 1 -
 drivers/net/dsa/vitesse-vsc73xx-core.c                  | 1 -
 drivers/net/dsa/xrs700x/xrs700x.c                       | 2 +-
 drivers/net/ethernet/aeroflex/greth.c                   | 4 ++--
 drivers/net/ethernet/amd/sunlance.c                     | 2 +-
 drivers/net/ethernet/apm/xgene-v2/main.h                | 1 +
 drivers/net/ethernet/arc/emac_main.c                    | 2 +-
 drivers/net/ethernet/atheros/ag71xx.c                   | 3 ++-
 drivers/net/ethernet/cadence/macb_main.c                | 1 -
 drivers/net/ethernet/cirrus/cs89x0.c                    | 1 -
 drivers/net/ethernet/ezchip/nps_enet.c                  | 5 ++---
 drivers/net/ethernet/freescale/dpaa/dpaa_eth.c          | 3 ++-
 drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c      | 2 ++
 drivers/net/ethernet/freescale/enetc/enetc_ierb.c       | 2 +-
 drivers/net/ethernet/freescale/fec_mpc52xx.c            | 4 ++--
 drivers/net/ethernet/freescale/fec_mpc52xx_phy.c        | 3 ++-
 drivers/net/ethernet/freescale/fec_ptp.c                | 1 -
 drivers/net/ethernet/freescale/fman/fman.c              | 1 +
 drivers/net/ethernet/freescale/fman/fman_port.c         | 1 +
 drivers/net/ethernet/freescale/fman/mac.c               | 2 ++
 drivers/net/ethernet/freescale/fs_enet/mac-fcc.c        | 1 -
 drivers/net/ethernet/freescale/fs_enet/mac-fec.c        | 1 -
 drivers/net/ethernet/freescale/fs_enet/mac-scc.c        | 1 -
 drivers/net/ethernet/freescale/fsl_pq_mdio.c            | 1 +
 drivers/net/ethernet/freescale/gianfar.c                | 2 +-
 drivers/net/ethernet/freescale/gianfar_ethtool.c        | 2 ++
 drivers/net/ethernet/freescale/ucc_geth.c               | 3 ++-
 drivers/net/ethernet/freescale/xgmac_mdio.c             | 4 ++--
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c       | 3 ---
 drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c       | 4 ----
 drivers/net/ethernet/ibm/ehea/ehea_main.c               | 1 +
 drivers/net/ethernet/ibm/emac/core.c                    | 1 +
 drivers/net/ethernet/ibm/emac/core.h                    | 1 -
 drivers/net/ethernet/ibm/emac/mal.c                     | 2 ++
 drivers/net/ethernet/ibm/emac/rgmii.c                   | 2 ++
 drivers/net/ethernet/ibm/emac/tah.c                     | 2 ++
 drivers/net/ethernet/ibm/emac/zmii.c                    | 2 ++
 drivers/net/ethernet/korina.c                           | 2 +-
 drivers/net/ethernet/marvell/mvmdio.c                   | 2 +-
 drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c         | 1 -
 drivers/net/ethernet/marvell/prestera/prestera_rxtx.c   | 3 ---
 drivers/net/ethernet/marvell/sky2.c                     | 1 -
 drivers/net/ethernet/mediatek/mtk_eth_soc.c             | 3 ++-
 drivers/net/ethernet/mediatek/mtk_star_emac.c           | 1 -
 drivers/net/ethernet/mediatek/mtk_wed.c                 | 1 +
 drivers/net/ethernet/mediatek/mtk_wed_wo.c              | 3 +--
 drivers/net/ethernet/microchip/lan966x/lan966x_main.c   | 3 ++-
 drivers/net/ethernet/mscc/ocelot_fdma.c                 | 1 -
 drivers/net/ethernet/mscc/ocelot_vsc7514.c              | 3 ++-
 drivers/net/ethernet/ni/nixge.c                         | 5 ++---
 drivers/net/ethernet/qualcomm/emac/emac-sgmii.c         | 2 ++
 drivers/net/ethernet/qualcomm/emac/emac.c               | 1 -
 drivers/net/ethernet/qualcomm/qca_spi.c                 | 1 -
 drivers/net/ethernet/qualcomm/qca_uart.c                | 1 -
 drivers/net/ethernet/renesas/ravb_main.c                | 3 +--
 drivers/net/ethernet/renesas/rswitch.c                  | 3 +--
 drivers/net/ethernet/renesas/sh_eth.c                   | 2 --
 drivers/net/ethernet/smsc/smsc911x.c                    | 1 -
 drivers/net/ethernet/socionext/sni_ave.c                | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c     | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c    | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c       | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c          | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c    | 4 +++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c         | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c       | 1 -
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c       | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 3 ++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c   | 1 -
 drivers/net/ethernet/sun/niu.c                          | 2 +-
 drivers/net/ethernet/sun/sunbmac.c                      | 2 +-
 drivers/net/ethernet/sun/sungem.c                       | 1 +
 drivers/net/ethernet/sun/sunhme.c                       | 3 ++-
 drivers/net/ethernet/sun/sunqe.c                        | 2 +-
 drivers/net/ethernet/ti/am65-cpsw-nuss.c                | 1 +
 drivers/net/ethernet/ti/cpsw-common.c                   | 1 -
 drivers/net/ethernet/ti/cpsw-phy-sel.c                  | 1 -
 drivers/net/ethernet/ti/davinci_mdio.c                  | 1 -
 drivers/net/ethernet/via/via-rhine.c                    | 2 +-
 drivers/net/ethernet/via/via-velocity.c                 | 2 +-
 drivers/net/ethernet/xilinx/ll_temac.h                  | 1 +
 drivers/net/ethernet/xilinx/ll_temac_main.c             | 4 +---
 drivers/net/ethernet/xilinx/ll_temac_mdio.c             | 2 +-
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c       | 3 ++-
 drivers/net/ethernet/xilinx/xilinx_emaclite.c           | 4 ++--
 drivers/net/ieee802154/ca8210.c                         | 1 -
 drivers/net/ipa/ipa_main.c                              | 2 +-
 drivers/net/pcs/pcs-rzn1-miic.c                         | 1 +
 drivers/net/phy/marvell-88x2222.c                       | 1 -
 drivers/net/phy/mediatek-ge-soc.c                       | 2 --
 drivers/net/wireless/ath/ath10k/ahb.c                   | 2 +-
 drivers/net/wireless/ath/ath11k/qmi.c                   | 1 -
 drivers/net/wireless/ath/wcn36xx/main.c                 | 3 +--
 drivers/net/wireless/intersil/orinoco/airport.c         | 2 +-
 drivers/net/wireless/mediatek/mt76/mt7915/soc.c         | 1 -
 drivers/net/wireless/silabs/wfx/bus_sdio.c              | 2 +-
 net/core/of_net.c                                       | 1 +
 124 files changed, 110 insertions(+), 120 deletions(-)

diff --git a/drivers/net/can/bxcan.c b/drivers/net/can/bxcan.c
index 39de7164bc4e..49cf9682b925 100644
--- a/drivers/net/can/bxcan.c
+++ b/drivers/net/can/bxcan.c
@@ -23,7 +23,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/net/can/ifi_canfd/ifi_canfd.c b/drivers/net/can/ifi_canfd/ifi_canfd.c
index 1d6642c94f2f..72307297d75e 100644
--- a/drivers/net/can/ifi_canfd/ifi_canfd.c
+++ b/drivers/net/can/ifi_canfd/ifi_canfd.c
@@ -20,7 +20,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 
 #include <linux/can/dev.h>
diff --git a/drivers/net/can/m_can/m_can.c b/drivers/net/can/m_can/m_can.c
index c5af92bcc9c9..4e76cd9c02b0 100644
--- a/drivers/net/can/m_can/m_can.c
+++ b/drivers/net/can/m_can/m_can.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/can/m_can/m_can.h b/drivers/net/can/m_can/m_can.h
index a839dc71dc9b..267d06ce6ade 100644
--- a/drivers/net/can/m_can/m_can.h
+++ b/drivers/net/can/m_can/m_can.h
@@ -22,7 +22,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/net/can/rcar/rcar_canfd.c b/drivers/net/can/rcar/rcar_canfd.c
index e4d748913439..b82842718735 100644
--- a/drivers/net/can/rcar/rcar_canfd.c
+++ b/drivers/net/can/rcar/rcar_canfd.c
@@ -34,7 +34,6 @@
 #include <linux/moduleparam.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
diff --git a/drivers/net/can/sja1000/sja1000_platform.c b/drivers/net/can/sja1000/sja1000_platform.c
index 4e59952c66d4..33f0e46ab1c2 100644
--- a/drivers/net/can/sja1000/sja1000_platform.c
+++ b/drivers/net/can/sja1000/sja1000_platform.c
@@ -17,7 +17,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "sja1000.h"
 
diff --git a/drivers/net/can/sun4i_can.c b/drivers/net/can/sun4i_can.c
index 0827830bbf28..b493a3d8ea9a 100644
--- a/drivers/net/can/sun4i_can.c
+++ b/drivers/net/can/sun4i_can.c
@@ -59,7 +59,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/reset.h>
 
diff --git a/drivers/net/can/ti_hecc.c b/drivers/net/can/ti_hecc.c
index 54284661992e..a8243acde92d 100644
--- a/drivers/net/can/ti_hecc.c
+++ b/drivers/net/can/ti_hecc.c
@@ -21,7 +21,6 @@
 #include <linux/clk.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 
 #include <linux/can/dev.h>
diff --git a/drivers/net/dsa/b53/b53_mdio.c b/drivers/net/dsa/b53/b53_mdio.c
index 8b422b298cd5..4d55d8d18376 100644
--- a/drivers/net/dsa/b53/b53_mdio.c
+++ b/drivers/net/dsa/b53/b53_mdio.c
@@ -19,6 +19,7 @@
 #include <linux/kernel.h>
 #include <linux/phy.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/delay.h>
 #include <linux/brcmphy.h>
 #include <linux/rtnetlink.h>
diff --git a/drivers/net/dsa/b53/b53_mmap.c b/drivers/net/dsa/b53/b53_mmap.c
index 5db1ed26f03a..5e39641ea887 100644
--- a/drivers/net/dsa/b53/b53_mmap.c
+++ b/drivers/net/dsa/b53/b53_mmap.c
@@ -19,6 +19,7 @@
 #include <linux/bits.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/platform_data/b53.h>
diff --git a/drivers/net/dsa/hirschmann/hellcreek.c b/drivers/net/dsa/hirschmann/hellcreek.c
index af50001ccdd4..720f4e4ed0b0 100644
--- a/drivers/net/dsa/hirschmann/hellcreek.c
+++ b/drivers/net/dsa/hirschmann/hellcreek.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/platform_device.h>
 #include <linux/bitops.h>
diff --git a/drivers/net/dsa/hirschmann/hellcreek_ptp.c b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
index 3e44ccb7db84..5249a1c2a80b 100644
--- a/drivers/net/dsa/hirschmann/hellcreek_ptp.c
+++ b/drivers/net/dsa/hirschmann/hellcreek_ptp.c
@@ -9,6 +9,7 @@
  *	    Kurt Kanzenbach <kurt@linutronix.de>
  */
 
+#include <linux/of.h>
 #include <linux/ptp_clock_kernel.h>
 #include "hellcreek.h"
 #include "hellcreek_ptp.h"
diff --git a/drivers/net/dsa/lan9303-core.c b/drivers/net/dsa/lan9303-core.c
index ff76444057d2..02e93559d536 100644
--- a/drivers/net/dsa/lan9303-core.c
+++ b/drivers/net/dsa/lan9303-core.c
@@ -8,6 +8,7 @@
 #include <linux/regmap.h>
 #include <linux/mutex.h>
 #include <linux/mii.h>
+#include <linux/of.h>
 #include <linux/phy.h>
 #include <linux/if_bridge.h>
 #include <linux/if_vlan.h>
diff --git a/drivers/net/dsa/microchip/ksz8863_smi.c b/drivers/net/dsa/microchip/ksz8863_smi.c
index fd6e2e69a42a..5711a59e2ac9 100644
--- a/drivers/net/dsa/microchip/ksz8863_smi.c
+++ b/drivers/net/dsa/microchip/ksz8863_smi.c
@@ -5,6 +5,9 @@
  * Copyright (C) 2019 Pengutronix, Michael Grzeschik <kernel@pengutronix.de>
  */
 
+#include <linux/mod_devicetable.h>
+#include <linux/property.h>
+
 #include "ksz8.h"
 #include "ksz_common.h"
 
diff --git a/drivers/net/dsa/microchip/ksz_common.c b/drivers/net/dsa/microchip/ksz_common.c
index 813b91a816bb..3662bb791afb 100644
--- a/drivers/net/dsa/microchip/ksz_common.c
+++ b/drivers/net/dsa/microchip/ksz_common.c
@@ -18,8 +18,8 @@
 #include <linux/if_vlan.h>
 #include <linux/irq.h>
 #include <linux/irqdomain.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/micrel_phy.h>
 #include <net/dsa.h>
diff --git a/drivers/net/dsa/mt7530-mmio.c b/drivers/net/dsa/mt7530-mmio.c
index 1a3d4b692f34..0a6a2fe34e64 100644
--- a/drivers/net/dsa/mt7530-mmio.c
+++ b/drivers/net/dsa/mt7530-mmio.c
@@ -1,7 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0-only
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
diff --git a/drivers/net/dsa/mv88e6xxx/chip.c b/drivers/net/dsa/mv88e6xxx/chip.c
index 8b51756bd805..77f078995e04 100644
--- a/drivers/net/dsa/mv88e6xxx/chip.c
+++ b/drivers/net/dsa/mv88e6xxx/chip.c
@@ -23,7 +23,7 @@
 #include <linux/list.h>
 #include <linux/mdio.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/platform_data/mv88e6xxx.h>
diff --git a/drivers/net/dsa/ocelot/felix_vsc9959.c b/drivers/net/dsa/ocelot/felix_vsc9959.c
index bb39fedd46c7..d2af1896527b 100644
--- a/drivers/net/dsa/ocelot/felix_vsc9959.c
+++ b/drivers/net/dsa/ocelot/felix_vsc9959.c
@@ -16,6 +16,7 @@
 #include <net/pkt_sched.h>
 #include <linux/iopoll.h>
 #include <linux/mdio.h>
+#include <linux/of.h>
 #include <linux/pci.h>
 #include <linux/time.h>
 #include "felix.h"
diff --git a/drivers/net/dsa/ocelot/seville_vsc9953.c b/drivers/net/dsa/ocelot/seville_vsc9953.c
index 15003b2af264..8f912bda120b 100644
--- a/drivers/net/dsa/ocelot/seville_vsc9953.c
+++ b/drivers/net/dsa/ocelot/seville_vsc9953.c
@@ -2,13 +2,14 @@
 /* Distributed Switch Architecture VSC9953 driver
  * Copyright (C) 2020, Maxim Kochetkov <fido_max@inbox.ru>
  */
+#include <linux/platform_device.h>
 #include <linux/types.h>
 #include <soc/mscc/ocelot_vcap.h>
 #include <soc/mscc/ocelot_sys.h>
 #include <soc/mscc/ocelot.h>
 #include <linux/mdio/mdio-mscc-miim.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
 #include <linux/pcs-lynx.h>
 #include <linux/dsa/ocelot.h>
 #include <linux/iopoll.h>
diff --git a/drivers/net/dsa/qca/qca8k-leds.c b/drivers/net/dsa/qca/qca8k-leds.c
index 1261e0bb21ef..e8c16e76e34b 100644
--- a/drivers/net/dsa/qca/qca8k-leds.c
+++ b/drivers/net/dsa/qca/qca8k-leds.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include <linux/property.h>
 #include <linux/regmap.h>
 #include <net/dsa.h>
 
diff --git a/drivers/net/dsa/realtek/realtek-mdio.c b/drivers/net/dsa/realtek/realtek-mdio.c
index 5a8fe707ca25..4310e7793e58 100644
--- a/drivers/net/dsa/realtek/realtek-mdio.c
+++ b/drivers/net/dsa/realtek/realtek-mdio.c
@@ -20,7 +20,7 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/overflow.h>
 #include <linux/regmap.h>
 
diff --git a/drivers/net/dsa/realtek/realtek-smi.c b/drivers/net/dsa/realtek/realtek-smi.c
index 1b447d96b9c4..c2bd8bb6c9c2 100644
--- a/drivers/net/dsa/realtek/realtek-smi.c
+++ b/drivers/net/dsa/realtek/realtek-smi.c
@@ -31,7 +31,6 @@
 #include <linux/spinlock.h>
 #include <linux/skbuff.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
diff --git a/drivers/net/dsa/sja1105/sja1105_main.c b/drivers/net/dsa/sja1105/sja1105_main.c
index 3529a565b4aa..b74300d38943 100644
--- a/drivers/net/dsa/sja1105/sja1105_main.c
+++ b/drivers/net/dsa/sja1105/sja1105_main.c
@@ -15,7 +15,6 @@
 #include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
-#include <linux/of_device.h>
 #include <linux/pcs/pcs-xpcs.h>
 #include <linux/netdev_features.h>
 #include <linux/netdevice.h>
diff --git a/drivers/net/dsa/vitesse-vsc73xx-core.c b/drivers/net/dsa/vitesse-vsc73xx-core.c
index ef1a4a7c47b2..4f09e7438f3b 100644
--- a/drivers/net/dsa/vitesse-vsc73xx-core.c
+++ b/drivers/net/dsa/vitesse-vsc73xx-core.c
@@ -18,7 +18,6 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/bitops.h>
 #include <linux/if_bridge.h>
diff --git a/drivers/net/dsa/xrs700x/xrs700x.c b/drivers/net/dsa/xrs700x/xrs700x.c
index fa622639d640..753fef757f11 100644
--- a/drivers/net/dsa/xrs700x/xrs700x.c
+++ b/drivers/net/dsa/xrs700x/xrs700x.c
@@ -7,7 +7,7 @@
 #include <net/dsa.h>
 #include <linux/etherdevice.h>
 #include <linux/if_bridge.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/netdev_features.h>
 #include <linux/if_hsr.h>
 #include "xrs700x.h"
diff --git a/drivers/net/ethernet/aeroflex/greth.c b/drivers/net/ethernet/aeroflex/greth.c
index aa0d2f3aaeaa..597a02c75d52 100644
--- a/drivers/net/ethernet/aeroflex/greth.c
+++ b/drivers/net/ethernet/aeroflex/greth.c
@@ -29,9 +29,9 @@
 #include <linux/io.h>
 #include <linux/crc32.h>
 #include <linux/mii.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <asm/cacheflush.h>
 #include <asm/byteorder.h>
diff --git a/drivers/net/ethernet/amd/sunlance.c b/drivers/net/ethernet/amd/sunlance.c
index 68ca1225eedc..33bb539ad70a 100644
--- a/drivers/net/ethernet/amd/sunlance.c
+++ b/drivers/net/ethernet/amd/sunlance.c
@@ -92,7 +92,7 @@ static char lancestr[] = "LANCE";
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/gfp.h>
 #include <linux/pgtable.h>
 
diff --git a/drivers/net/ethernet/apm/xgene-v2/main.h b/drivers/net/ethernet/apm/xgene-v2/main.h
index b3985a7be59d..7be6f83e22fe 100644
--- a/drivers/net/ethernet/apm/xgene-v2/main.h
+++ b/drivers/net/ethernet/apm/xgene-v2/main.h
@@ -22,6 +22,7 @@
 #include <linux/of_mdio.h>
 #include <linux/prefetch.h>
 #include <linux/phy.h>
+#include <linux/platform_device.h>
 #include <net/ip.h>
 #include "mac.h"
 #include "enet.h"
diff --git a/drivers/net/ethernet/arc/emac_main.c b/drivers/net/ethernet/arc/emac_main.c
index 2b427d8a1831..31ee477dd131 100644
--- a/drivers/net/ethernet/arc/emac_main.c
+++ b/drivers/net/ethernet/arc/emac_main.c
@@ -15,11 +15,11 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
 
 #include "emac.h"
 
diff --git a/drivers/net/ethernet/atheros/ag71xx.c b/drivers/net/ethernet/atheros/ag71xx.c
index ff1a5edf8df1..009e0b3066fa 100644
--- a/drivers/net/ethernet/atheros/ag71xx.c
+++ b/drivers/net/ethernet/atheros/ag71xx.c
@@ -29,9 +29,10 @@
 
 #include <linux/if_vlan.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/phylink.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/drivers/net/ethernet/cadence/macb_main.c b/drivers/net/ethernet/cadence/macb_main.c
index f6a0f12a6d52..b61566afb2f4 100644
--- a/drivers/net/ethernet/cadence/macb_main.c
+++ b/drivers/net/ethernet/cadence/macb_main.c
@@ -26,7 +26,6 @@
 #include <linux/platform_device.h>
 #include <linux/phylink.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
diff --git a/drivers/net/ethernet/cirrus/cs89x0.c b/drivers/net/ethernet/cirrus/cs89x0.c
index 276c32c3926a..7c51fd9fc9be 100644
--- a/drivers/net/ethernet/cirrus/cs89x0.c
+++ b/drivers/net/ethernet/cirrus/cs89x0.c
@@ -54,7 +54,6 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/kernel.h>
 #include <linux/types.h>
diff --git a/drivers/net/ethernet/ezchip/nps_enet.c b/drivers/net/ethernet/ezchip/nps_enet.c
index f1eb660aaee2..edf000e7bab4 100644
--- a/drivers/net/ethernet/ezchip/nps_enet.c
+++ b/drivers/net/ethernet/ezchip/nps_enet.c
@@ -6,10 +6,9 @@
 #include <linux/module.h>
 #include <linux/etherdevice.h>
 #include <linux/interrupt.h>
-#include <linux/of_address.h>
-#include <linux/of_irq.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include "nps_enet.h"
 
 #define DRV_NAME			"nps_mgt_enet"
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
index 431f8917dc39..7cbfc5864ade 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_eth.c
@@ -7,8 +7,8 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_platform.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/io.h>
@@ -17,6 +17,7 @@
 #include <linux/icmp.h>
 #include <linux/ip.h>
 #include <linux/ipv6.h>
+#include <linux/platform_device.h>
 #include <linux/udp.h>
 #include <linux/tcp.h>
 #include <linux/net.h>
diff --git a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
index 9c71cbbb13d8..5bd0b36d1feb 100644
--- a/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
+++ b/drivers/net/ethernet/freescale/dpaa/dpaa_ethtool.c
@@ -6,7 +6,9 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/string.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/net_tstamp.h>
 #include <linux/fsl/ptp_qoriq.h>
 
diff --git a/drivers/net/ethernet/freescale/enetc/enetc_ierb.c b/drivers/net/ethernet/freescale/enetc/enetc_ierb.c
index b307bef4dc29..d39617ab9306 100644
--- a/drivers/net/ethernet/freescale/enetc/enetc_ierb.c
+++ b/drivers/net/ethernet/freescale/enetc/enetc_ierb.c
@@ -18,8 +18,8 @@
  */
 
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include "enetc.h"
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx.c b/drivers/net/ethernet/freescale/fec_mpc52xx.c
index b88816b71ddf..f843ea0df065 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx.c
@@ -29,12 +29,12 @@
 #include <linux/crc32.h>
 #include <linux/hardirq.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
diff --git a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
index 95f778cce98c..894130985e2c 100644
--- a/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
+++ b/drivers/net/ethernet/freescale/fec_mpc52xx_phy.c
@@ -13,10 +13,11 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/phy.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_mdio.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 #include <asm/mpc52xx.h>
 #include "fec_mpc52xx.h"
diff --git a/drivers/net/ethernet/freescale/fec_ptp.c b/drivers/net/ethernet/freescale/fec_ptp.c
index ab86bb8562ef..9428a06b6a87 100644
--- a/drivers/net/ethernet/freescale/fec_ptp.c
+++ b/drivers/net/ethernet/freescale/fec_ptp.c
@@ -30,7 +30,6 @@
 #include <linux/phy.h>
 #include <linux/fec.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_net.h>
 
diff --git a/drivers/net/ethernet/freescale/fman/fman.c b/drivers/net/ethernet/freescale/fman/fman.c
index 9d85fb136e34..d96028f01770 100644
--- a/drivers/net/ethernet/freescale/fman/fman.c
+++ b/drivers/net/ethernet/freescale/fman/fman.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/fsl/guts.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/delay.h>
 #include <linux/module.h>
diff --git a/drivers/net/ethernet/freescale/fman/fman_port.c b/drivers/net/ethernet/freescale/fman/fman_port.c
index ab90fe2bee5e..406e75e9e5ea 100644
--- a/drivers/net/ethernet/freescale/fman/fman_port.c
+++ b/drivers/net/ethernet/freescale/fman/fman_port.c
@@ -6,6 +6,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/io.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/interrupt.h>
diff --git a/drivers/net/ethernet/freescale/fman/mac.c b/drivers/net/ethernet/freescale/fman/mac.c
index 43665806c590..57de8a6ab180 100644
--- a/drivers/net/ethernet/freescale/fman/mac.c
+++ b/drivers/net/ethernet/freescale/fman/mac.c
@@ -12,12 +12,14 @@
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
 #include <linux/device.h>
+#include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/netdevice.h>
 #include <linux/phy_fixed.h>
 #include <linux/phylink.h>
 #include <linux/etherdevice.h>
 #include <linux/libfdt_env.h>
+#include <linux/platform_device.h>
 
 #include "mac.h"
 #include "fman_mac.h"
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
index b47490be872c..925428f1b0c8 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fcc.c
@@ -32,7 +32,6 @@
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/gfp.h>
 #include <linux/pgtable.h>
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
index 61f4b6e50d29..f609dc112458 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-fec.c
@@ -32,7 +32,6 @@
 #include <linux/fs.h>
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/gfp.h>
 
diff --git a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
index 64300ac13e02..66d40da5cde0 100644
--- a/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
+++ b/drivers/net/ethernet/freescale/fs_enet/mac-scc.c
@@ -32,7 +32,6 @@
 #include <linux/platform_device.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
 
 #include <asm/irq.h>
 #include <linux/uaccess.h>
diff --git a/drivers/net/ethernet/freescale/fsl_pq_mdio.c b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
index 9d58d8334467..647a499fe84b 100644
--- a/drivers/net/ethernet/freescale/fsl_pq_mdio.c
+++ b/drivers/net/ethernet/freescale/fsl_pq_mdio.c
@@ -12,6 +12,7 @@
  */
 
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/slab.h>
diff --git a/drivers/net/ethernet/freescale/gianfar.c b/drivers/net/ethernet/freescale/gianfar.c
index 38d5013c6fed..4f0099ce8f1e 100644
--- a/drivers/net/ethernet/freescale/gianfar.c
+++ b/drivers/net/ethernet/freescale/gianfar.c
@@ -60,6 +60,7 @@
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
 #include <linux/string.h>
 #include <linux/errno.h>
 #include <linux/unistd.h>
@@ -75,7 +76,6 @@
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
 #include <linux/ip.h>
 #include <linux/tcp.h>
 #include <linux/udp.h>
diff --git a/drivers/net/ethernet/freescale/gianfar_ethtool.c b/drivers/net/ethernet/freescale/gianfar_ethtool.c
index b2b0d3c26fcc..7a15b9245698 100644
--- a/drivers/net/ethernet/freescale/gianfar_ethtool.c
+++ b/drivers/net/ethernet/freescale/gianfar_ethtool.c
@@ -38,7 +38,9 @@
 #include <linux/phy.h>
 #include <linux/sort.h>
 #include <linux/if_vlan.h>
+#include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/fsl/ptp_qoriq.h>
 
 #include "gianfar.h"
diff --git a/drivers/net/ethernet/freescale/ucc_geth.c b/drivers/net/ethernet/freescale/ucc_geth.c
index 7a4cb4f07c32..49e759f24444 100644
--- a/drivers/net/ethernet/freescale/ucc_geth.c
+++ b/drivers/net/ethernet/freescale/ucc_geth.c
@@ -28,11 +28,12 @@
 #include <linux/phy.h>
 #include <linux/phy_fixed.h>
 #include <linux/workqueue.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <linux/uaccess.h>
 #include <asm/irq.h>
diff --git a/drivers/net/ethernet/freescale/xgmac_mdio.c b/drivers/net/ethernet/freescale/xgmac_mdio.c
index a13b4ba4d6e1..65dc07d0df0f 100644
--- a/drivers/net/ethernet/freescale/xgmac_mdio.c
+++ b/drivers/net/ethernet/freescale/xgmac_mdio.c
@@ -19,10 +19,10 @@
 #include <linux/kernel.h>
 #include <linux/mdio.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
 #include <linux/phy.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 
 /* Number of microseconds to wait for a register to respond */
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
index a7eb87da4e70..a08d1f0a5a16 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_ppe.c
@@ -9,9 +9,6 @@
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 
 #include "hns_dsaf_ppe.h"
 
diff --git a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
index e2ff3ca198d1..93344563a259 100644
--- a/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
+++ b/drivers/net/ethernet/hisilicon/hns/hns_dsaf_rcb.c
@@ -11,10 +11,6 @@
 #include <linux/etherdevice.h>
 #include <asm/cacheflush.h>
 #include <linux/platform_device.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
-#include <linux/of_irq.h>
 #include <linux/spinlock.h>
 
 #include "hns_dsaf_main.h"
diff --git a/drivers/net/ethernet/ibm/ehea/ehea_main.c b/drivers/net/ethernet/ibm/ehea/ehea_main.c
index 858c71ef5213..997e41c4f05e 100644
--- a/drivers/net/ethernet/ibm/ehea/ehea_main.c
+++ b/drivers/net/ethernet/ibm/ehea/ehea_main.c
@@ -31,6 +31,7 @@
 #include <linux/prefetch.h>
 #include <linux/of.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <net/ip.h>
 
diff --git a/drivers/net/ethernet/ibm/emac/core.c b/drivers/net/ethernet/ibm/emac/core.c
index c97095abd26a..0c314bf97480 100644
--- a/drivers/net/ethernet/ibm/emac/core.c
+++ b/drivers/net/ethernet/ibm/emac/core.c
@@ -38,6 +38,7 @@
 #include <linux/of_irq.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/drivers/net/ethernet/ibm/emac/core.h b/drivers/net/ethernet/ibm/emac/core.h
index 89a1b0fea158..295516b07662 100644
--- a/drivers/net/ethernet/ibm/emac/core.h
+++ b/drivers/net/ethernet/ibm/emac/core.h
@@ -27,7 +27,6 @@
 #include <linux/netdevice.h>
 #include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
-#include <linux/of_platform.h>
 #include <linux/slab.h>
 
 #include <asm/io.h>
diff --git a/drivers/net/ethernet/ibm/emac/mal.c b/drivers/net/ethernet/ibm/emac/mal.c
index ff5487bbebe3..c3236b59e7e9 100644
--- a/drivers/net/ethernet/ibm/emac/mal.c
+++ b/drivers/net/ethernet/ibm/emac/mal.c
@@ -22,7 +22,9 @@
 
 #include <linux/delay.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
+#include <linux/platform_device.h>
 
 #include "core.h"
 #include <asm/dcr-regs.h>
diff --git a/drivers/net/ethernet/ibm/emac/rgmii.c b/drivers/net/ethernet/ibm/emac/rgmii.c
index 50358cf00130..fd437f986edf 100644
--- a/drivers/net/ethernet/ibm/emac/rgmii.c
+++ b/drivers/net/ethernet/ibm/emac/rgmii.c
@@ -19,7 +19,9 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/ethtool.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 
 #include "emac.h"
diff --git a/drivers/net/ethernet/ibm/emac/tah.c b/drivers/net/ethernet/ibm/emac/tah.c
index 008bbdaf1204..aae9a88d95d7 100644
--- a/drivers/net/ethernet/ibm/emac/tah.c
+++ b/drivers/net/ethernet/ibm/emac/tah.c
@@ -14,7 +14,9 @@
  *
  * Copyright (c) 2005 Eugene Surovegin <ebs@ebshome.net>
  */
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 
 #include "emac.h"
diff --git a/drivers/net/ethernet/ibm/emac/zmii.c b/drivers/net/ethernet/ibm/emac/zmii.c
index 57a25c7a9e70..6337388ee5f4 100644
--- a/drivers/net/ethernet/ibm/emac/zmii.c
+++ b/drivers/net/ethernet/ibm/emac/zmii.c
@@ -19,7 +19,9 @@
 #include <linux/slab.h>
 #include <linux/kernel.h>
 #include <linux/ethtool.h>
+#include <linux/mod_devicetable.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <asm/io.h>
 
 #include "emac.h"
diff --git a/drivers/net/ethernet/korina.c b/drivers/net/ethernet/korina.c
index 2b9335cb4bb3..41f3f3df6ec3 100644
--- a/drivers/net/ethernet/korina.c
+++ b/drivers/net/ethernet/korina.c
@@ -33,6 +33,7 @@
  *  should stick to this procedure.
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/moduleparam.h>
@@ -43,7 +44,6 @@
 #include <linux/ioport.h>
 #include <linux/iopoll.h>
 #include <linux/in.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/slab.h>
 #include <linux/string.h>
diff --git a/drivers/net/ethernet/marvell/mvmdio.c b/drivers/net/ethernet/marvell/mvmdio.c
index 8662543ca5c8..a1a80f13b1e8 100644
--- a/drivers/net/ethernet/marvell/mvmdio.c
+++ b/drivers/net/ethernet/marvell/mvmdio.c
@@ -24,8 +24,8 @@
 #include <linux/interrupt.h>
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
index 1fec84b4c068..9e1b596c8f08 100644
--- a/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
+++ b/drivers/net/ethernet/marvell/mvpp2/mvpp2_main.c
@@ -24,7 +24,6 @@
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/phy.h>
 #include <linux/phylink.h>
 #include <linux/phy/phy.h>
diff --git a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
index 9277a8fd1339..cc2a9ae794be 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_rxtx.c
@@ -5,9 +5,6 @@
 #include <linux/dmapool.h>
 #include <linux/etherdevice.h>
 #include <linux/if_vlan.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of.h>
 #include <linux/platform_device.h>
 
 #include "prestera_dsa.h"
diff --git a/drivers/net/ethernet/marvell/sky2.c b/drivers/net/ethernet/marvell/sky2.c
index 7c487f9b36ec..c4cca27fb0d5 100644
--- a/drivers/net/ethernet/marvell/sky2.c
+++ b/drivers/net/ethernet/marvell/sky2.c
@@ -32,7 +32,6 @@
 #include <linux/prefetch.h>
 #include <linux/debugfs.h>
 #include <linux/mii.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/dmi.h>
 
diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
index 834c644b67db..e76ca9489149 100644
--- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
+++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
@@ -6,11 +6,12 @@
  *   Copyright (C) 2013-2016 Michael Lee <igvtee@gmail.com>
  */
 
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_address.h>
 #include <linux/mfd/syscon.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/net/ethernet/mediatek/mtk_star_emac.c b/drivers/net/ethernet/mediatek/mtk_star_emac.c
index 02c03325911f..31aebeb2e285 100644
--- a/drivers/net/ethernet/mediatek/mtk_star_emac.c
+++ b/drivers/net/ethernet/mediatek/mtk_star_emac.c
@@ -17,7 +17,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/mediatek/mtk_wed.c b/drivers/net/ethernet/mediatek/mtk_wed.c
index 985cff910f30..52688cbaa7b4 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2021 Felix Fietkau <nbd@nbd.name> */
 
 #include <linux/kernel.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/bitfield.h>
diff --git a/drivers/net/ethernet/mediatek/mtk_wed_wo.c b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
index 69fba29055e9..3bd51a3d6650 100644
--- a/drivers/net/ethernet/mediatek/mtk_wed_wo.c
+++ b/drivers/net/ethernet/mediatek/mtk_wed_wo.c
@@ -7,10 +7,9 @@
 
 #include <linux/kernel.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_platform.h>
 #include <linux/interrupt.h>
-#include <linux/of_address.h>
 #include <linux/mfd/syscon.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/bitfield.h>
 
diff --git a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
index fbb0bb4594cd..73f20683210e 100644
--- a/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
+++ b/drivers/net/ethernet/microchip/lan966x/lan966x_main.c
@@ -5,9 +5,10 @@
 #include <linux/if_vlan.h>
 #include <linux/iopoll.h>
 #include <linux/ip.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/phy/phy.h>
+#include <linux/platform_device.h>
 #include <linux/reset.h>
 #include <net/addrconf.h>
 
diff --git a/drivers/net/ethernet/mscc/ocelot_fdma.c b/drivers/net/ethernet/mscc/ocelot_fdma.c
index 8e3894cf5f7c..41efdc836580 100644
--- a/drivers/net/ethernet/mscc/ocelot_fdma.c
+++ b/drivers/net/ethernet/mscc/ocelot_fdma.c
@@ -12,7 +12,6 @@
 #include <linux/dmapool.h>
 #include <linux/dsa/ocelot.h>
 #include <linux/netdevice.h>
-#include <linux/of_platform.h>
 #include <linux/skbuff.h>
 
 #include "ocelot_fdma.h"
diff --git a/drivers/net/ethernet/mscc/ocelot_vsc7514.c b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
index 97e90e2869d4..151b42465348 100644
--- a/drivers/net/ethernet/mscc/ocelot_vsc7514.c
+++ b/drivers/net/ethernet/mscc/ocelot_vsc7514.c
@@ -10,8 +10,9 @@
 #include <linux/of_net.h>
 #include <linux/netdevice.h>
 #include <linux/phylink.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/skbuff.h>
 #include <net/switchdev.h>
diff --git a/drivers/net/ethernet/ni/nixge.c b/drivers/net/ethernet/ni/nixge.c
index 0fd156286d4d..ba27bbc68f85 100644
--- a/drivers/net/ethernet/ni/nixge.c
+++ b/drivers/net/ethernet/ni/nixge.c
@@ -7,11 +7,10 @@
 #include <linux/etherdevice.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
-#include <linux/of_irq.h>
+#include <linux/platform_device.h>
 #include <linux/skbuff.h>
 #include <linux/phy.h>
 #include <linux/mii.h>
diff --git a/drivers/net/ethernet/qualcomm/emac/emac-sgmii.c b/drivers/net/ethernet/qualcomm/emac/emac-sgmii.c
index 802ef81493e0..e4bc18009d08 100644
--- a/drivers/net/ethernet/qualcomm/emac/emac-sgmii.c
+++ b/drivers/net/ethernet/qualcomm/emac/emac-sgmii.c
@@ -8,7 +8,9 @@
 #include <linux/interrupt.h>
 #include <linux/iopoll.h>
 #include <linux/acpi.h>
+#include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include "emac.h"
 #include "emac-mac.h"
 #include "emac-sgmii.h"
diff --git a/drivers/net/ethernet/qualcomm/emac/emac.c b/drivers/net/ethernet/qualcomm/emac/emac.c
index eaa50050aa0b..19bb16daf4e7 100644
--- a/drivers/net/ethernet/qualcomm/emac/emac.c
+++ b/drivers/net/ethernet/qualcomm/emac/emac.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
-#include <linux/of_device.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <linux/acpi.h>
diff --git a/drivers/net/ethernet/qualcomm/qca_spi.c b/drivers/net/ethernet/qualcomm/qca_spi.c
index 4a1b94e5a8ea..bec723028e96 100644
--- a/drivers/net/ethernet/qualcomm/qca_spi.c
+++ b/drivers/net/ethernet/qualcomm/qca_spi.c
@@ -35,7 +35,6 @@
 #include <linux/moduleparam.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/sched.h>
 #include <linux/skbuff.h>
diff --git a/drivers/net/ethernet/qualcomm/qca_uart.c b/drivers/net/ethernet/qualcomm/qca_uart.c
index 26646cb6a20a..ace99c62d03a 100644
--- a/drivers/net/ethernet/qualcomm/qca_uart.c
+++ b/drivers/net/ethernet/qualcomm/qca_uart.c
@@ -32,7 +32,6 @@
 #include <linux/module.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/sched.h>
 #include <linux/serdev.h>
diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
index 4d6b3b7d6abb..7df9f9f8e134 100644
--- a/drivers/net/ethernet/renesas/ravb_main.c
+++ b/drivers/net/ethernet/renesas/ravb_main.c
@@ -21,10 +21,9 @@
 #include <linux/module.h>
 #include <linux/net_tstamp.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
diff --git a/drivers/net/ethernet/renesas/rswitch.c b/drivers/net/ethernet/renesas/rswitch.c
index 4e412ac0965a..0ba7fb75d589 100644
--- a/drivers/net/ethernet/renesas/rswitch.c
+++ b/drivers/net/ethernet/renesas/rswitch.c
@@ -12,11 +12,10 @@
 #include <linux/module.h>
 #include <linux/net_tstamp.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/phy/phy.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rtnetlink.h>
 #include <linux/slab.h>
diff --git a/drivers/net/ethernet/renesas/sh_eth.c b/drivers/net/ethernet/renesas/sh_eth.c
index d8ec729825be..274ea16c0a1f 100644
--- a/drivers/net/ethernet/renesas/sh_eth.c
+++ b/drivers/net/ethernet/renesas/sh_eth.c
@@ -19,8 +19,6 @@
 #include <linux/mdio-bitbang.h>
 #include <linux/netdevice.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/cache.h>
diff --git a/drivers/net/ethernet/smsc/smsc911x.c b/drivers/net/ethernet/smsc/smsc911x.c
index 174dc8908b72..2f755722e858 100644
--- a/drivers/net/ethernet/smsc/smsc911x.c
+++ b/drivers/net/ethernet/smsc/smsc911x.c
@@ -43,7 +43,6 @@
 #include <linux/smsc911x.h>
 #include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/of_net.h>
 #include <linux/acpi.h>
diff --git a/drivers/net/ethernet/socionext/sni_ave.c b/drivers/net/ethernet/socionext/sni_ave.c
index 492c39c08af1..4838d2383a43 100644
--- a/drivers/net/ethernet/socionext/sni_ave.c
+++ b/drivers/net/ethernet/socionext/sni_ave.c
@@ -15,10 +15,11 @@
 #include <linux/mii.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/of_mdio.h>
-#include <linux/of_platform.h>
 #include <linux/phy.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/types.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 9f88530c5e8c..2bf74efbf2eb 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -14,7 +14,7 @@
 #include <linux/iopoll.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index b9378a63f0e8..92e06a96757a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -12,7 +12,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
index 8063ba1c3ce8..e22ef0d6bc73 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ingenic.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
index 73c1dfa7ecb1..e301bf7fc30f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c
@@ -7,8 +7,8 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
+#include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/stmmac.h>
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
index 92b16048f91c..0b159dc0d5f6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c
@@ -13,7 +13,7 @@
 #include <linux/io.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/mfd/syscon.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
index 42954020de2c..f91753565d60 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-oxnas.c
@@ -12,7 +12,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e62940414e54..fa791f0f24ad 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -3,7 +3,6 @@
 
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/phy/phy.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index d81591b470a2..35789cb549f7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -14,8 +14,8 @@
 #include <linux/of_net.h>
 #include <linux/gpio.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/delay.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index d3a39d2fb3a9..b1c5f2527c0d 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -7,8 +7,10 @@
  *
  */
 
+#include <linux/mod_devicetable.h>
+#include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/mfd/syscon.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 
 #include "stmmac_platform.h"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index dcbb17c4f07a..ef03e4669491 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 
 #include "stmmac_platform.h"
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
index bdb4de59a672..3a09085819dc 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-stm32.c
@@ -11,7 +11,6 @@
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
index 1e714380d125..2885d8568d4b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
@@ -11,9 +11,10 @@
 #include <linux/mdio-mux.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
+#include <linux/of_platform.h>
 #include <linux/phy.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
index f8367c5b490b..65ddf6ce1535 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/stmmac.h>
 #include <linux/clk.h>
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index acbb284be174..a8731ce0fff0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -6,7 +6,8 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/of_net.h>
 #include <linux/stmmac.h>
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
index 231152ee5a32..85ec9d975a55 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_net.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 
 #include "stmmac.h"
diff --git a/drivers/net/ethernet/sun/niu.c b/drivers/net/ethernet/sun/niu.c
index 7a2e76776297..011d74087f86 100644
--- a/drivers/net/ethernet/sun/niu.c
+++ b/drivers/net/ethernet/sun/niu.c
@@ -31,7 +31,7 @@
 #include <linux/slab.h>
 
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include "niu.h"
 
diff --git a/drivers/net/ethernet/sun/sunbmac.c b/drivers/net/ethernet/sun/sunbmac.c
index 34b94153bf0c..cc34d92d2e3d 100644
--- a/drivers/net/ethernet/sun/sunbmac.c
+++ b/drivers/net/ethernet/sun/sunbmac.c
@@ -25,7 +25,7 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/gfp.h>
 
 #include <asm/auxio.h>
diff --git a/drivers/net/ethernet/sun/sungem.c b/drivers/net/ethernet/sun/sungem.c
index 4154e68639ac..9bd1df8308d2 100644
--- a/drivers/net/ethernet/sun/sungem.c
+++ b/drivers/net/ethernet/sun/sungem.c
@@ -40,6 +40,7 @@
 #include <linux/bitops.h>
 #include <linux/mm.h>
 #include <linux/gfp.h>
+#include <linux/of.h>
 
 #include <asm/io.h>
 #include <asm/byteorder.h>
diff --git a/drivers/net/ethernet/sun/sunhme.c b/drivers/net/ethernet/sun/sunhme.c
index b93613cd1994..b983b9c23be6 100644
--- a/drivers/net/ethernet/sun/sunhme.c
+++ b/drivers/net/ethernet/sun/sunhme.c
@@ -32,9 +32,10 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
-#include <linux/of_device.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/random.h>
 #include <linux/skbuff.h>
 #include <linux/slab.h>
diff --git a/drivers/net/ethernet/sun/sunqe.c b/drivers/net/ethernet/sun/sunqe.c
index 6418fcc3139f..b37360f44972 100644
--- a/drivers/net/ethernet/sun/sunqe.c
+++ b/drivers/net/ethernet/sun/sunqe.c
@@ -27,8 +27,8 @@
 #include <linux/bitops.h>
 #include <linux/dma-mapping.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pgtable.h>
+#include <linux/platform_device.h>
 
 #include <asm/io.h>
 #include <asm/dma.h>
diff --git a/drivers/net/ethernet/ti/am65-cpsw-nuss.c b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
index bebcfd5e6b57..bea6fc0f324c 100644
--- a/drivers/net/ethernet/ti/am65-cpsw-nuss.c
+++ b/drivers/net/ethernet/ti/am65-cpsw-nuss.c
@@ -19,6 +19,7 @@
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/phylink.h>
 #include <linux/phy/phy.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/ti/cpsw-common.c b/drivers/net/ethernet/ti/cpsw-common.c
index bfa81bbfce3f..26dc906eae90 100644
--- a/drivers/net/ethernet/ti/cpsw-common.c
+++ b/drivers/net/ethernet/ti/cpsw-common.c
@@ -3,7 +3,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 
diff --git a/drivers/net/ethernet/ti/cpsw-phy-sel.c b/drivers/net/ethernet/ti/cpsw-phy-sel.c
index 25e707d7b87c..4edb7963f856 100644
--- a/drivers/net/ethernet/ti/cpsw-phy-sel.c
+++ b/drivers/net/ethernet/ti/cpsw-phy-sel.c
@@ -12,7 +12,6 @@
 #include <linux/netdevice.h>
 #include <linux/phy.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include "cpsw.h"
 
diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 23169e36a3d4..89b6d23e9937 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -23,7 +23,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/davinci_emac.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_mdio.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/mdio-bitbang.h>
diff --git a/drivers/net/ethernet/via/via-rhine.c b/drivers/net/ethernet/via/via-rhine.c
index d716e6fe26e1..3e09e5036490 100644
--- a/drivers/net/ethernet/via/via-rhine.c
+++ b/drivers/net/ethernet/via/via-rhine.c
@@ -94,7 +94,7 @@ static const int multicast_filter_limit = 32;
 #include <linux/ioport.h>
 #include <linux/interrupt.h>
 #include <linux/pci.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
diff --git a/drivers/net/ethernet/via/via-velocity.c b/drivers/net/ethernet/via/via-velocity.c
index 86f7843b4591..731f689412e6 100644
--- a/drivers/net/ethernet/via/via-velocity.c
+++ b/drivers/net/ethernet/via/via-velocity.c
@@ -57,8 +57,8 @@
 #include <linux/if.h>
 #include <linux/uaccess.h>
 #include <linux/proc_fs.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/inetdevice.h>
 #include <linux/platform_device.h>
diff --git a/drivers/net/ethernet/xilinx/ll_temac.h b/drivers/net/ethernet/xilinx/ll_temac.h
index 6668d1b760d8..90d122d5475c 100644
--- a/drivers/net/ethernet/xilinx/ll_temac.h
+++ b/drivers/net/ethernet/xilinx/ll_temac.h
@@ -5,6 +5,7 @@
 
 #include <linux/netdevice.h>
 #include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/spinlock.h>
 
 #ifdef CONFIG_PPC_DCR
diff --git a/drivers/net/ethernet/xilinx/ll_temac_main.c b/drivers/net/ethernet/xilinx/ll_temac_main.c
index e0ac1bcd9925..0bf9cdee1df2 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_main.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_main.c
@@ -35,12 +35,10 @@
 #include <linux/netdevice.h>
 #include <linux/if_ether.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
-#include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/skbuff.h>
 #include <linux/spinlock.h>
 #include <linux/tcp.h>      /* needed for sizeof(tcphdr) */
diff --git a/drivers/net/ethernet/xilinx/ll_temac_mdio.c b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
index 2371c072b53f..07a9fb49eda1 100644
--- a/drivers/net/ethernet/xilinx/ll_temac_mdio.c
+++ b/drivers/net/ethernet/xilinx/ll_temac_mdio.c
@@ -10,8 +10,8 @@
 #include <linux/mutex.h>
 #include <linux/phy.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/of_mdio.h>
 #include <linux/platform_data/xilinx-ll-temac.h>
diff --git a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
index 8e32dc50a408..b7ec4dafae90 100644
--- a/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
+++ b/drivers/net/ethernet/xilinx/xilinx_axienet_main.c
@@ -27,11 +27,12 @@
 #include <linux/etherdevice.h>
 #include <linux/module.h>
 #include <linux/netdevice.h>
+#include <linux/of.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
-#include <linux/of_platform.h>
 #include <linux/of_irq.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/skbuff.h>
 #include <linux/math64.h>
 #include <linux/phy.h>
diff --git a/drivers/net/ethernet/xilinx/xilinx_emaclite.c b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
index ad2c30d9a482..b358ecc67227 100644
--- a/drivers/net/ethernet/xilinx/xilinx_emaclite.c
+++ b/drivers/net/ethernet/xilinx/xilinx_emaclite.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/platform_device.h>
 #include <linux/uaccess.h>
 #include <linux/netdevice.h>
 #include <linux/etherdevice.h>
@@ -15,9 +16,8 @@
 #include <linux/ethtool.h>
 #include <linux/io.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/of_mdio.h>
 #include <linux/of_net.h>
 #include <linux/phy.h>
diff --git a/drivers/net/ieee802154/ca8210.c b/drivers/net/ieee802154/ca8210.c
index f9b10e84de06..aebb19f1b3a4 100644
--- a/drivers/net/ieee802154/ca8210.c
+++ b/drivers/net/ieee802154/ca8210.c
@@ -57,7 +57,6 @@
 #include <linux/io.h>
 #include <linux/kfifo.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/module.h>
 #include <linux/mutex.h>
diff --git a/drivers/net/ipa/ipa_main.c b/drivers/net/ipa/ipa_main.c
index 6a2f2fc2f501..da853353a5c7 100644
--- a/drivers/net/ipa/ipa_main.c
+++ b/drivers/net/ipa/ipa_main.c
@@ -13,8 +13,8 @@
 #include <linux/firmware.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_address.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/soc/qcom/mdt_loader.h>
diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-miic.c
index 323bec5e57f8..e5d642c67a2c 100644
--- a/drivers/net/pcs/pcs-rzn1-miic.c
+++ b/drivers/net/pcs/pcs-rzn1-miic.c
@@ -12,6 +12,7 @@
 #include <linux/of_platform.h>
 #include <linux/pcs-rzn1-miic.h>
 #include <linux/phylink.h>
+#include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <dt-bindings/net/pcs-rzn1-miic.h>
 
diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
index f83cae64585d..e3aa30dad2e6 100644
--- a/drivers/net/phy/marvell-88x2222.c
+++ b/drivers/net/phy/marvell-88x2222.c
@@ -14,7 +14,6 @@
 #include <linux/mdio.h>
 #include <linux/marvell_phy.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/sfp.h>
 #include <linux/netdevice.h>
diff --git a/drivers/net/phy/mediatek-ge-soc.c b/drivers/net/phy/mediatek-ge-soc.c
index 95369171a7ba..da512fab0eb0 100644
--- a/drivers/net/phy/mediatek-ge-soc.c
+++ b/drivers/net/phy/mediatek-ge-soc.c
@@ -2,8 +2,6 @@
 #include <linux/bitfield.h>
 #include <linux/module.h>
 #include <linux/nvmem-consumer.h>
-#include <linux/of_address.h>
-#include <linux/of_platform.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/phy.h>
 
diff --git a/drivers/net/wireless/ath/ath10k/ahb.c b/drivers/net/wireless/ath/ath10k/ahb.c
index 4a006fb4d424..76efea2f1138 100644
--- a/drivers/net/wireless/ath/ath10k/ahb.c
+++ b/drivers/net/wireless/ath/ath10k/ahb.c
@@ -5,7 +5,7 @@
  */
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/platform_device.h>
 #include <linux/clk.h>
 #include <linux/reset.h>
 #include "core.h"
diff --git a/drivers/net/wireless/ath/ath11k/qmi.c b/drivers/net/wireless/ath/ath11k/qmi.c
index d4eaf7d2ba84..98efa0f299ca 100644
--- a/drivers/net/wireless/ath/ath11k/qmi.c
+++ b/drivers/net/wireless/ath/ath11k/qmi.c
@@ -13,7 +13,6 @@
 #include <linux/of_address.h>
 #include <linux/ioport.h>
 #include <linux/firmware.h>
-#include <linux/of_device.h>
 #include <linux/of_irq.h>
 
 #define SLEEP_CLOCK_SELECT_INTERNAL_BIT	0x02
diff --git a/drivers/net/wireless/ath/wcn36xx/main.c b/drivers/net/wireless/ath/wcn36xx/main.c
index 8dbd115a393c..2bd1163177f0 100644
--- a/drivers/net/wireless/ath/wcn36xx/main.c
+++ b/drivers/net/wireless/ath/wcn36xx/main.c
@@ -19,9 +19,8 @@
 #include <linux/module.h>
 #include <linux/firmware.h>
 #include <linux/platform_device.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 #include <linux/rpmsg.h>
 #include <linux/soc/qcom/smem_state.h>
 #include <linux/soc/qcom/wcnss_ctrl.h>
diff --git a/drivers/net/wireless/intersil/orinoco/airport.c b/drivers/net/wireless/intersil/orinoco/airport.c
index a890bfa0d5cc..45ac00fdafa5 100644
--- a/drivers/net/wireless/intersil/orinoco/airport.c
+++ b/drivers/net/wireless/intersil/orinoco/airport.c
@@ -18,7 +18,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <asm/pmac_feature.h>
 
 #include "orinoco.h"
diff --git a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
index 32c137066e7f..701a27ffa4c2 100644
--- a/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
+++ b/drivers/net/wireless/mediatek/mt76/mt7915/soc.c
@@ -6,7 +6,6 @@
 #include <linux/platform_device.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_reserved_mem.h>
 #include <linux/of_gpio.h>
 #include <linux/iopoll.h>
diff --git a/drivers/net/wireless/silabs/wfx/bus_sdio.c b/drivers/net/wireless/silabs/wfx/bus_sdio.c
index 51a0d58a9070..909d5f346a01 100644
--- a/drivers/net/wireless/silabs/wfx/bus_sdio.c
+++ b/drivers/net/wireless/silabs/wfx/bus_sdio.c
@@ -10,7 +10,7 @@
 #include <linux/mmc/sdio_func.h>
 #include <linux/mmc/card.h>
 #include <linux/interrupt.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/irq.h>
 #include <linux/align.h>
diff --git a/net/core/of_net.c b/net/core/of_net.c
index 55d3fe229269..93ea425b9248 100644
--- a/net/core/of_net.c
+++ b/net/core/of_net.c
@@ -8,6 +8,7 @@
 #include <linux/kernel.h>
 #include <linux/of_net.h>
 #include <linux/of_platform.h>
+#include <linux/platform_device.h>
 #include <linux/phy.h>
 #include <linux/export.h>
 #include <linux/device.h>
-- 
2.40.1

