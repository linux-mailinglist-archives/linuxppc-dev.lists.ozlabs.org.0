Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEBB3B2CE
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 07:10:12 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44rfBB2zCwzDqPw
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Apr 2019 15:10:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=true.cz
 (client-ip=178.217.244.18; helo=smtp-out.xnet.cz; envelope-from=ynezz@true.cz;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=true.cz
X-Greylist: delayed 444 seconds by postgrey-1.36 at bilbo;
 Sat, 27 Apr 2019 09:15:11 AEST
Received: from smtp-out.xnet.cz (smtp-out.xnet.cz [178.217.244.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44rVJb4WdNzDqYn
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Apr 2019 09:15:11 +1000 (AEST)
Received: from meh.true.cz (meh.true.cz [108.61.167.218])
 (Authenticated sender: petr@true.cz)
 by smtp-out.xnet.cz (Postfix) with ESMTPSA id 0DDB736BA;
 Sat, 27 Apr 2019 01:07:39 +0200 (CEST)
Received: by meh.true.cz (OpenSMTPD) with ESMTP id 8681a2a5;
 Sat, 27 Apr 2019 01:07:37 +0200 (CEST)
From: =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>
To: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Heiko Stuebner <heiko@sntech.de>,
 Fugang Duan <fugang.duan@nxp.com>, Claudiu Manoil <claudiu.manoil@nxp.com>,
 Yisen Zhuang <yisen.zhuang@huawei.com>,
 Salil Mehta <salil.mehta@huawei.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 Microchip Linux Driver Support <UNGLinuxDriver@microchip.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Kalle Valo <kvalo@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Li Yang <leoyang.li@nxp.com>
Subject: [PATCH 2/4] dt-bindings: doc: Reflect new NVMEM of_get_mac_address
 behaviour
Date: Sat, 27 Apr 2019 01:06:40 +0200
Message-Id: <1556320002-26213-3-git-send-email-ynezz@true.cz>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1556320002-26213-1-git-send-email-ynezz@true.cz>
References: <1556320002-26213-1-git-send-email-ynezz@true.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sat, 27 Apr 2019 15:04:36 +1000
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, linuxppc-dev@lists.ozlabs.org,
 linux-wireless@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Alban Bedel <albeu@free.fr>, =?UTF-8?q?Petr=20=C5=A0tetiar?= <ynezz@true.cz>,
 linux-oxnas@groups.io, Frank Rowand <frowand.list@gmail.com>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 Heiner Kallweit <hkallweit1@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As of_get_mac_address now supports NVMEM under the hood, we should
update the bindings documentation with the new nvmem-cell* properties.
While at it, fix also other missing properties supported by
of_get_mac_address.

Signed-off-by: Petr Štetiar <ynezz@true.cz>
---
 Documentation/devicetree/bindings/net/altera_tse.txt             | 3 +++
 Documentation/devicetree/bindings/net/arc_emac.txt               | 4 ++++
 Documentation/devicetree/bindings/net/brcm,amac.txt              | 3 +++
 Documentation/devicetree/bindings/net/brcm,bcmgenet.txt          | 5 +++++
 Documentation/devicetree/bindings/net/brcm,systemport.txt        | 4 ++++
 Documentation/devicetree/bindings/net/cavium-mix.txt             | 7 ++++++-
 Documentation/devicetree/bindings/net/cavium-pip.txt             | 5 +++++
 Documentation/devicetree/bindings/net/cpsw.txt                   | 3 +++
 Documentation/devicetree/bindings/net/davicom-dm9000.txt         | 4 ++++
 Documentation/devicetree/bindings/net/davinci_emac.txt           | 2 ++
 Documentation/devicetree/bindings/net/dsa/dsa.txt                | 7 ++++---
 Documentation/devicetree/bindings/net/emac_rockchip.txt          | 4 ++++
 Documentation/devicetree/bindings/net/ethernet.txt               | 2 ++
 Documentation/devicetree/bindings/net/ezchip_enet.txt            | 6 ++++++
 Documentation/devicetree/bindings/net/fsl-fec.txt                | 4 ++++
 Documentation/devicetree/bindings/net/fsl-tsec-phy.txt           | 4 ++++
 Documentation/devicetree/bindings/net/hisilicon-femac.txt        | 3 +++
 Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt | 3 +++
 Documentation/devicetree/bindings/net/keystone-netcp.txt         | 9 ++++++---
 Documentation/devicetree/bindings/net/macb.txt                   | 8 ++++----
 Documentation/devicetree/bindings/net/marvell-orion-net.txt      | 3 +++
 Documentation/devicetree/bindings/net/marvell-pxa168.txt         | 3 +++
 Documentation/devicetree/bindings/net/microchip,enc28j60.txt     | 3 +++
 Documentation/devicetree/bindings/net/microchip,lan78xx.txt      | 2 ++
 Documentation/devicetree/bindings/net/opencores-ethoc.txt        | 4 ++++
 Documentation/devicetree/bindings/net/oxnas-dwmac.txt            | 6 ++++++
 Documentation/devicetree/bindings/net/qca,qca7000.txt            | 3 +++
 Documentation/devicetree/bindings/net/samsung-sxgbe.txt          | 3 +++
 Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt  | 2 ++
 Documentation/devicetree/bindings/net/socfpga-dwmac.txt          | 4 ++++
 .../devicetree/bindings/net/socionext,uniphier-ave4.txt          | 3 +++
 Documentation/devicetree/bindings/net/socionext-netsec.txt       | 2 ++
 Documentation/devicetree/bindings/net/stmmac.txt                 | 4 ++++
 Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt | 2 ++
 Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt     | 2 ++
 Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt      | 3 +++
 36 files changed, 128 insertions(+), 11 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/altera_tse.txt b/Documentation/devicetree/bindings/net/altera_tse.txt
index 0e21df9..dbc2bb4 100644
--- a/Documentation/devicetree/bindings/net/altera_tse.txt
+++ b/Documentation/devicetree/bindings/net/altera_tse.txt
@@ -47,8 +47,11 @@ Required properties:
 	- device_type: Must be "ethernet-phy".
 
 Optional properties:
+- mac-address: See ethernet.txt in the same directory.
 - local-mac-address: See ethernet.txt in the same directory.
 - max-frame-size: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/net/arc_emac.txt b/Documentation/devicetree/bindings/net/arc_emac.txt
index c73a0e9..139204e 100644
--- a/Documentation/devicetree/bindings/net/arc_emac.txt
+++ b/Documentation/devicetree/bindings/net/arc_emac.txt
@@ -13,6 +13,10 @@ Optional properties:
   only if property "phy-reset-gpios" is available.  Missing the property
   will have the duration be 1 millisecond.  Numbers greater than 1000 are
   invalid and 1 millisecond will be used instead.
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Clock handling:
 The clock frequency is needed to calculate and set polling period of EMAC.
diff --git a/Documentation/devicetree/bindings/net/brcm,amac.txt b/Documentation/devicetree/bindings/net/brcm,amac.txt
index 0bfad65..a9b9514 100644
--- a/Documentation/devicetree/bindings/net/brcm,amac.txt
+++ b/Documentation/devicetree/bindings/net/brcm,amac.txt
@@ -18,6 +18,9 @@ Required properties:
 
 Optional properties:
 - mac-address:	See ethernet.txt file in the same directory
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Examples:
 
diff --git a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
index 3956af1..b7e2517 100644
--- a/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
+++ b/Documentation/devicetree/bindings/net/brcm,bcmgenet.txt
@@ -30,6 +30,11 @@ Optional properties:
   See Documentation/devicetree/bindings/net/fixed-link.txt for information on
   the property specifics
 
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
+
 Required child nodes:
 
 - mdio bus node: this node should always be present regardless of the PHY
diff --git a/Documentation/devicetree/bindings/net/brcm,systemport.txt b/Documentation/devicetree/bindings/net/brcm,systemport.txt
index 83f29e0..ce3c812 100644
--- a/Documentation/devicetree/bindings/net/brcm,systemport.txt
+++ b/Documentation/devicetree/bindings/net/brcm,systemport.txt
@@ -20,6 +20,10 @@ Optional properties:
 - systemport,num-tier1-arb: number of tier 1 arbiters, an integer
 - systemport,num-txq: number of HW transmit queues, an integer
 - systemport,num-rxq: number of HW receive queues, an integer
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example:
 ethernet@f04a0000 {
diff --git a/Documentation/devicetree/bindings/net/cavium-mix.txt b/Documentation/devicetree/bindings/net/cavium-mix.txt
index 8d7c309..41bcc99 100644
--- a/Documentation/devicetree/bindings/net/cavium-mix.txt
+++ b/Documentation/devicetree/bindings/net/cavium-mix.txt
@@ -18,7 +18,12 @@ Properties:
 - interrupts: Two interrupt specifiers.  The first is the MIX
   interrupt routing and the second the routing for the AGL interrupts.
 
-- phy-handle: Optional, see ethernet.txt file in the same directory.
+Optional properties:
+- phy-handle: See ethernet.txt file in the same directory.
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example:
 	ethernet@1070000100800 {
diff --git a/Documentation/devicetree/bindings/net/cavium-pip.txt b/Documentation/devicetree/bindings/net/cavium-pip.txt
index e3b8fe71..4b1c3d9 100644
--- a/Documentation/devicetree/bindings/net/cavium-pip.txt
+++ b/Documentation/devicetree/bindings/net/cavium-pip.txt
@@ -43,6 +43,11 @@ Properties for PIP port which is a child the PIP interface:
 - tx-delay: Delay value for RGMII transmit clock. Optional. Disabled if 0.
   Value range is 1-31, and mapping to the actual delay varies depending on HW.
 
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
+
 Example:
 
 	pip@11800a0000000 {
diff --git a/Documentation/devicetree/bindings/net/cpsw.txt b/Documentation/devicetree/bindings/net/cpsw.txt
index 3264e19..248f7df 100644
--- a/Documentation/devicetree/bindings/net/cpsw.txt
+++ b/Documentation/devicetree/bindings/net/cpsw.txt
@@ -50,6 +50,9 @@ Required properties:
 Optional properties:
 - dual_emac_res_vlan	: Specifies VID to be used to segregate the ports
 - mac-address		: See ethernet.txt file in the same directory
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - phy_id		: Specifies slave phy id (deprecated, use phy-handle)
 - phy-handle		: See ethernet.txt file in the same directory
 
diff --git a/Documentation/devicetree/bindings/net/davicom-dm9000.txt b/Documentation/devicetree/bindings/net/davicom-dm9000.txt
index 64c159e..ce60d35 100644
--- a/Documentation/devicetree/bindings/net/davicom-dm9000.txt
+++ b/Documentation/devicetree/bindings/net/davicom-dm9000.txt
@@ -12,6 +12,10 @@ Optional properties:
 - davicom,ext-phy : Use external PHY
 - reset-gpios : phandle of gpio that will be used to reset chip during probe
 - vcc-supply : phandle of regulator that will be used to enable power to chip
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example:
 
diff --git a/Documentation/devicetree/bindings/net/davinci_emac.txt b/Documentation/devicetree/bindings/net/davinci_emac.txt
index ca83dcc..c953945 100644
--- a/Documentation/devicetree/bindings/net/davinci_emac.txt
+++ b/Documentation/devicetree/bindings/net/davinci_emac.txt
@@ -20,6 +20,8 @@ Required properties:
 Optional properties:
 - phy-handle: See ethernet.txt file in the same directory.
               If absent, davinci_emac driver defaults to 100/FULL.
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
 - nvmem-cells: phandle, reference to an nvmem node for the MAC address
 - nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
 - ti,davinci-rmii-en: 1 byte, 1 means use RMII
diff --git a/Documentation/devicetree/bindings/net/dsa/dsa.txt b/Documentation/devicetree/bindings/net/dsa/dsa.txt
index d66a529..9e2f0fa 100644
--- a/Documentation/devicetree/bindings/net/dsa/dsa.txt
+++ b/Documentation/devicetree/bindings/net/dsa/dsa.txt
@@ -71,9 +71,10 @@ properties, described in binding documents:
 			  Documentation/devicetree/bindings/net/fixed-link.txt
 			  for details.
 
-- local-mac-address	: See
-			  Documentation/devicetree/bindings/net/ethernet.txt
-			  for details.
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example
 
diff --git a/Documentation/devicetree/bindings/net/emac_rockchip.txt b/Documentation/devicetree/bindings/net/emac_rockchip.txt
index 05bd7da..a84944a 100644
--- a/Documentation/devicetree/bindings/net/emac_rockchip.txt
+++ b/Documentation/devicetree/bindings/net/emac_rockchip.txt
@@ -14,6 +14,10 @@ Required properties:
 
 Optional properties:
 - phy-supply: phandle to a regulator if the PHY needs one
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Clock handling:
 - clocks: Must contain an entry for each entry in clock-names.
diff --git a/Documentation/devicetree/bindings/net/ethernet.txt b/Documentation/devicetree/bindings/net/ethernet.txt
index 2974e63..1e2bc9a 100644
--- a/Documentation/devicetree/bindings/net/ethernet.txt
+++ b/Documentation/devicetree/bindings/net/ethernet.txt
@@ -10,6 +10,8 @@ Documentation/devicetree/bindings/phy/phy-bindings.txt.
   the boot program; should be used in cases where the MAC address assigned to
   the device by the boot program is different from the "local-mac-address"
   property;
+- nvmem-cells: phandle, reference to an nvmem node for the MAC address
+- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
 - max-speed: number, specifies maximum speed in Mbit/s supported by the device;
 - max-frame-size: number, maximum transfer unit (IEEE defined MTU), rather than
   the maximum frame size (there's contradiction in the Devicetree
diff --git a/Documentation/devicetree/bindings/net/ezchip_enet.txt b/Documentation/devicetree/bindings/net/ezchip_enet.txt
index 4e29b2b..f928b92 100644
--- a/Documentation/devicetree/bindings/net/ezchip_enet.txt
+++ b/Documentation/devicetree/bindings/net/ezchip_enet.txt
@@ -5,6 +5,12 @@ Required properties:
 - reg: Address and length of the register set for the device
 - interrupts: Should contain the ENET interrupt
 
+Optional properties:
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
+
 Examples:
 
 	ethernet@f0003000 {
diff --git a/Documentation/devicetree/bindings/net/fsl-fec.txt b/Documentation/devicetree/bindings/net/fsl-fec.txt
index 2d41fb9..f2099f0 100644
--- a/Documentation/devicetree/bindings/net/fsl-fec.txt
+++ b/Documentation/devicetree/bindings/net/fsl-fec.txt
@@ -46,6 +46,10 @@ Optional properties:
   tx/rx queues 1 and 2. "int0" will be used for queue 0 and ENET_MII interrupts.
   For imx6sx, "int0" handles all 3 queues and ENET_MII. "pps" is for the pulse
   per second interrupt associated with 1588 precision time protocol(PTP).
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 
 Optional subnodes:
diff --git a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
index 047bdf7..6bc9a68 100644
--- a/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
+++ b/Documentation/devicetree/bindings/net/fsl-tsec-phy.txt
@@ -71,6 +71,10 @@ Properties:
     in the L2.
   - rx-stash-idx : Denotes the index of the first byte from the received
     buffer to stash in the L2.
+  - mac-address: See ethernet.txt in the same directory.
+  - local-mac-address: See ethernet.txt in the same directory.
+  - nvmem-cells: See ethernet.txt in the same directory.
+  - nvmem-cell-names: See ethernet.txt in the same directory.
 
 Example:
 	ethernet@24000 {
diff --git a/Documentation/devicetree/bindings/net/hisilicon-femac.txt b/Documentation/devicetree/bindings/net/hisilicon-femac.txt
index d11af5e..e28bb6e 100644
--- a/Documentation/devicetree/bindings/net/hisilicon-femac.txt
+++ b/Documentation/devicetree/bindings/net/hisilicon-femac.txt
@@ -15,6 +15,9 @@ Required properties:
 - reset-names: should contain the reset signal name "mac"(required)
 	and "phy"(optional).
 - mac-address: see ethernet.txt [1].
+- local-mac-address: see ethernet.txt [1].
+- nvmem-cells: see ethernet.txt [1].
+- nvmem-cell-names: see ethernet.txt [1].
 - phy-mode: see ethernet.txt [1].
 - phy-handle: see ethernet.txt [1].
 - hisilicon,phy-reset-delays-us: triplet of delays if PHY reset signal given.
diff --git a/Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt b/Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt
index eea73ad..dddd408 100644
--- a/Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt
+++ b/Documentation/devicetree/bindings/net/hisilicon-hix5hd2-gmac.txt
@@ -19,6 +19,9 @@ Required properties:
 - phy-mode: see ethernet.txt [1].
 - phy-handle: see ethernet.txt [1].
 - mac-address: see ethernet.txt [1].
+- local-mac-address: see ethernet.txt [1].
+- nvmem-cells: see ethernet.txt [1].
+- nvmem-cell-names: see ethernet.txt [1].
 - clocks: clock phandle and specifier pair.
 - clock-names: contain the clock name "mac_core"(required) and "mac_ifc"(optional).
 - resets: should contain the phandle to the MAC core reset signal(optional),
diff --git a/Documentation/devicetree/bindings/net/keystone-netcp.txt b/Documentation/devicetree/bindings/net/keystone-netcp.txt
index 04ba1dc..61e8019 100644
--- a/Documentation/devicetree/bindings/net/keystone-netcp.txt
+++ b/Documentation/devicetree/bindings/net/keystone-netcp.txt
@@ -137,9 +137,12 @@ Optional properties:
 		when it obtains the mac address from efuse.
 - local-mac-address:	the driver is designed to use the of_get_mac_address api
 			only if efuse-mac is 0. When efuse-mac is 0, the MAC
-			address is obtained from local-mac-address. If this
-			attribute is not present, then the driver will use a
-			random MAC address.
+			address is obtained from nvmem-cells, mac-address and
+			local-mac-address. If any of this attributes is not present,
+			then the driver will use a random MAC address.
+- mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - "netcp-device label":	phandle to the device specification for each of NetCP
 			sub-module attached to this interface.
 
diff --git a/Documentation/devicetree/bindings/net/macb.txt b/Documentation/devicetree/bindings/net/macb.txt
index 8b80515..92c5642 100644
--- a/Documentation/devicetree/bindings/net/macb.txt
+++ b/Documentation/devicetree/bindings/net/macb.txt
@@ -26,15 +26,15 @@ Required properties:
 	Optional elements: 'tsu_clk'
 - clocks: Phandles to input clocks.
 
-Optional properties:
-- nvmem-cells: phandle, reference to an nvmem node for the MAC address
-- nvmem-cell-names: string, should be "mac-address" if nvmem is to be used
-
 Optional properties for PHY child node:
 - reset-gpios : Should specify the gpio for phy reset
 - magic-packet : If present, indicates that the hardware supports waking
   up via magic packet.
 - phy-handle : see ethernet.txt file in the same directory
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Examples:
 
diff --git a/Documentation/devicetree/bindings/net/marvell-orion-net.txt b/Documentation/devicetree/bindings/net/marvell-orion-net.txt
index 6fd988c..2e0c06f 100644
--- a/Documentation/devicetree/bindings/net/marvell-orion-net.txt
+++ b/Documentation/devicetree/bindings/net/marvell-orion-net.txt
@@ -37,6 +37,9 @@ Required port properties:
  - reg: port number relative to ethernet controller, shall be 0, 1, or 2.
  - interrupts: port interrupt.
  - local-mac-address: See ethernet.txt file in the same directory.
+ - mac-address: See ethernet.txt in the same directory.
+ - nvmem-cells: See ethernet.txt in the same directory.
+ - nvmem-cell-names: See ethernet.txt in the same directory.
 
 Optional port properties:
  - marvell,tx-queue-size: size of the transmit ring buffer.
diff --git a/Documentation/devicetree/bindings/net/marvell-pxa168.txt b/Documentation/devicetree/bindings/net/marvell-pxa168.txt
index 845a148..5eaafa2 100644
--- a/Documentation/devicetree/bindings/net/marvell-pxa168.txt
+++ b/Documentation/devicetree/bindings/net/marvell-pxa168.txt
@@ -12,6 +12,9 @@ Optional properties:
 - #size-cells: must be 0 when using sub-nodes.
 - phy-handle: see ethernet.txt file in the same directory.
 - local-mac-address: see ethernet.txt file in the same directory.
+- mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Sub-nodes:
 Each PHY can be represented as a sub-node. This is not mandatory.
diff --git a/Documentation/devicetree/bindings/net/microchip,enc28j60.txt b/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
index 24626e0..c06923d 100644
--- a/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
+++ b/Documentation/devicetree/bindings/net/microchip,enc28j60.txt
@@ -22,6 +22,9 @@ Optional properties:
   According to the ENC28J80 datasheet, the chip allows a maximum of 20 MHz, however,
   board designs may need to limit this value.
 - local-mac-address: See ethernet.txt in the same directory.
+- mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 
 Example (for NXP i.MX28 with pin control stuff for GPIO irq):
diff --git a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
index 76786a0..a31c475 100644
--- a/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
+++ b/Documentation/devicetree/bindings/net/microchip,lan78xx.txt
@@ -10,6 +10,8 @@ Required properties:
 Optional properties:
 - local-mac-address:   see ethernet.txt
 - mac-address:         see ethernet.txt
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Optional properties of the embedded PHY:
 - microchip,led-modes: a 0..4 element vector, with each element configuring
diff --git a/Documentation/devicetree/bindings/net/opencores-ethoc.txt b/Documentation/devicetree/bindings/net/opencores-ethoc.txt
index 2dc127c..e7969dc 100644
--- a/Documentation/devicetree/bindings/net/opencores-ethoc.txt
+++ b/Documentation/devicetree/bindings/net/opencores-ethoc.txt
@@ -10,6 +10,10 @@ Required properties:
 Optional properties:
 - clocks: phandle to refer to the clk used as per
   Documentation/devicetree/bindings/clock/clock-bindings.txt
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 
 Examples:
 
diff --git a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
index d7117a2..7f43451 100644
--- a/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/oxnas-dwmac.txt
@@ -17,6 +17,12 @@ Required properties on all platforms:
 
 - oxsemi,sys-ctrl: a phandle to the system controller syscon node
 
+Optional properties:
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
+
 Example :
 
 etha: ethernet@40400000 {
diff --git a/Documentation/devicetree/bindings/net/qca,qca7000.txt b/Documentation/devicetree/bindings/net/qca,qca7000.txt
index e4a8a51..5a2627e 100644
--- a/Documentation/devicetree/bindings/net/qca,qca7000.txt
+++ b/Documentation/devicetree/bindings/net/qca,qca7000.txt
@@ -24,6 +24,9 @@ Optional properties:
 		      are invalid. Missing the property will set the SPI
 		      frequency to 8000000 Hertz.
 - local-mac-address : see ./ethernet.txt
+- mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - qca,legacy-mode   : Set the SPI data transfer of the QCA7000 to legacy mode.
 		      In this mode the SPI master must toggle the chip select
 		      between each data word. In burst mode these gaps aren't
diff --git a/Documentation/devicetree/bindings/net/samsung-sxgbe.txt b/Documentation/devicetree/bindings/net/samsung-sxgbe.txt
index 46e5911..94c12b4 100644
--- a/Documentation/devicetree/bindings/net/samsung-sxgbe.txt
+++ b/Documentation/devicetree/bindings/net/samsung-sxgbe.txt
@@ -22,6 +22,9 @@ Required properties:
 
 Optional properties:
 - mac-address: 6 bytes, mac address
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - max-frame-size: Maximum Transfer Unit (IEEE defined MTU), rather
 		  than the maximum frame size.
 
diff --git a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
index 36f1aef..881848f 100644
--- a/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
+++ b/Documentation/devicetree/bindings/net/snps,dwc-qos-ethernet.txt
@@ -105,6 +105,8 @@ Optional properties:
 - dma-coherent: Present if dma operations are coherent
 - mac-address: See ethernet.txt in the same directory
 - local-mac-address: See ethernet.txt in the same directory
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - phy-reset-gpios: Phandle and specifier for any GPIO used to reset the PHY.
   See ../gpio/gpio.txt.
 - snps,en-lpi: If present it enables use of the AXI low-power interface
diff --git a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt b/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
index 17d6819..29ffd21 100644
--- a/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
+++ b/Documentation/devicetree/bindings/net/socfpga-dwmac.txt
@@ -19,6 +19,10 @@ altr,emac-splitter: Should be the phandle to the emac splitter soft IP node if
 		DWMAC controller is connected emac splitter.
 phy-mode: The phy mode the ethernet operates in
 altr,sgmii-to-sgmii-converter: phandle to the TSE SGMII converter
+mac-address: See ethernet.txt in the same directory.
+local-mac-address: See ethernet.txt in the same directory.
+nvmem-cells: See ethernet.txt in the same directory.
+nvmem-cell-names: See ethernet.txt in the same directory.
 
 This device node has additional phandle dependency, the sgmii converter:
 
diff --git a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
index fc8f017..13daf31 100644
--- a/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
+++ b/Documentation/devicetree/bindings/net/socionext,uniphier-ave4.txt
@@ -33,6 +33,9 @@ Required properties:
 
 Optional properties:
  - local-mac-address: See ethernet.txt in the same directory.
+ - mac-address: See ethernet.txt in the same directory.
+ - nvmem-cells: See ethernet.txt in the same directory.
+ - nvmem-cell-names: See ethernet.txt in the same directory.
 
 Required subnode:
  - mdio: A container for child nodes representing phy nodes.
diff --git a/Documentation/devicetree/bindings/net/socionext-netsec.txt b/Documentation/devicetree/bindings/net/socionext-netsec.txt
index 0cff94f..c5ac7fc 100644
--- a/Documentation/devicetree/bindings/net/socionext-netsec.txt
+++ b/Documentation/devicetree/bindings/net/socionext-netsec.txt
@@ -28,6 +28,8 @@ Optional properties: (See ethernet.txt file in the same directory)
 	accesses performed by the device are cache coherent.
 - local-mac-address: See ethernet.txt in the same directory.
 - mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - max-speed: See ethernet.txt in the same directory.
 - max-frame-size: See ethernet.txt in the same directory.
 
diff --git a/Documentation/devicetree/bindings/net/stmmac.txt b/Documentation/devicetree/bindings/net/stmmac.txt
index cb69406..0a0519a 100644
--- a/Documentation/devicetree/bindings/net/stmmac.txt
+++ b/Documentation/devicetree/bindings/net/stmmac.txt
@@ -21,6 +21,10 @@ Required properties:
 	The 3rd cell is reset post-delay in micro seconds.
 
 Optional properties:
+- mac-address: See ethernet.txt in the same directory.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - resets: Should contain a phandle to the STMMAC reset signal, if any
 - reset-names: Should contain the reset signal name "stmmaceth", if a
 	reset phandle is given
diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
index 7b9a776..bd5cc92 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.txt
@@ -15,6 +15,8 @@ Optional properties:
 
 - mac-address: See ethernet.txt in the parent directory
 - local-mac-address: See ethernet.txt in the parent directory
+- nvmem-cells: See ethernet.txt in the parent directory.
+- nvmem-cell-names: See ethernet.txt in the parent directory.
 - ieee80211-freq-limit: See ieee80211.txt
 - mediatek,mtd-eeprom: Specify a MTD partition + offset containing EEPROM data
 
diff --git a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
index b7396c8..77074a0 100644
--- a/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
+++ b/Documentation/devicetree/bindings/net/wireless/qca,ath9k.txt
@@ -36,6 +36,8 @@ Optional properties:
 			kernel firmware loader).
 - mac-address: See ethernet.txt in the parent directory
 - local-mac-address: See ethernet.txt in the parent directory
+- nvmem-cells: See ethernet.txt in the parent directory.
+- nvmem-cell-names: See ethernet.txt in the parent directory.
 
 
 In this example, the node is defined as child node of the PCI controller:
diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt
index 5efb7ac..7fee9d5 100644
--- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt
+++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/qe/ucc.txt
@@ -43,6 +43,9 @@ to check for the new properties first.
 
 Required properties for network device_type:
 - mac-address : list of bytes representing the ethernet address.
+- local-mac-address: See ethernet.txt in the same directory.
+- nvmem-cells: See ethernet.txt in the same directory.
+- nvmem-cell-names: See ethernet.txt in the same directory.
 - phy-handle : The phandle for the PHY connected to this controller.
 
 Recommended properties:
-- 
1.9.1

