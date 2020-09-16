Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id D358026C067
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 11:23:47 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BrvmK21WWzDqQf
	for <lists+linuxppc-dev@lfdr.de>; Wed, 16 Sep 2020 19:23:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.13.50;
 helo=eur01-he1-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=cc4fYAc4;
 dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr130050.outbound.protection.outlook.com [40.107.13.50])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Brvf4472ZzDqLy
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 16 Sep 2020 19:18:20 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W3ChNmPZJ9TEbpPQv1Sp+S+1a5hx3t+8sYX0MKNZa4DqSQxCy6J992nrkwT7tWUZa0PnJU5JMNgWprhmBcrt9g6m+4ukkmjDU2iOwvzk+6Cq+gVA9kNDfSjRW49z9ur8Dh5KTmiiiU0NxyM1sFJwU7Us3Nz1/HFms6ybGz0fwmYE7xmpMaqXc5aKCqun0lNP3XAk+uGdujXY4seq9dW5OfFX3tMAITYUEXD8UxOo7iukFat0TNzKMb2suQmXO8hGMi5WsKCj2pKZR2UTvXO0jqYZTyaWJuuP2/lHMOfccPr64e7kdi/qHCM32TU4GpSmozuVj9vi3t1eUTKotQbDnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPdkg5pM26NwSoPKyxFUwwxgafCPSJtpAoNaGFtS4i8=;
 b=UHtgLK1B4M66FGm6TPi+b3MYCFI7QBJd5RVTjeer2dbfcv3Evkdr/DDF89EyXyk4730mtZXtFJGTG5Zu65JZ67RZO7bU+BpIFLYsXqNYlv6v7874Rb5C3Q6IVsPH+ptxYmya3eoSVV2dceJPv7fb3jNPnLlEpsdOI3/mwNFZZt4x4Np4U8wYdPQOLBHYw8gimbz7O1P6gFZq4MpU4M2dYRamXUE8/PeL7ju0j5L+FGLh7eV1qESr8bbfH6jj4MssIrX5u0DdLEzZ/QLlXmx3Pd2yL8N0ekYIkDCifZGSrM3U7J9N9FMVS47o7LI6ztI28NOvCWM5ixvLTxeqFaCc7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SPdkg5pM26NwSoPKyxFUwwxgafCPSJtpAoNaGFtS4i8=;
 b=cc4fYAc4wzqDKLaF19cmOivfFKpY6phyAp06vwzMkIilCjg2f/nWN49RaOFHe7NVluq0fTBbpyP2Tan6Uso5EEHYeBq51ghARgii8jcaGdpQRFgNDnaeuEjnFKGzOq/ROw+u7ln8TPbIGYLi7A0bltWqOKXHtLNsc6u2Y7uO0lI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR0402MB3630.eurprd04.prod.outlook.com
 (2603:10a6:803:d::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3370.18; Wed, 16 Sep
 2020 09:18:14 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Wed, 16 Sep 2020
 09:18:14 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, alsa-devel@alsa-project.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Date: Wed, 16 Sep 2020 12:17:56 +0300
Message-Id: <1600247876-8013-3-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
References: <1600247876-8013-1-git-send-email-viorel.suman@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR01CA0158.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:aa::27) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR01CA0158.eurprd01.prod.exchangelabs.com (2603:10a6:208:aa::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend
 Transport; Wed, 16 Sep 2020 09:18:12 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 8d2fe603-d556-413e-4666-08d85a2170b0
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3630:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR0402MB36301A4D8C614EF909763BC8D3210@VI1PR0402MB3630.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3qWh1zl4oLA1fMTLGPksLHV5vAg5ZqMtYzofmSGSaw+onmIlb7onq0T99V6+Mm2rViQGvczZnR/QoNDZhZQ1aF8Enl2dyEmkqpdg1cBF1lg1MCA65Rh+5Q0X6L1/fq4Bx+5bp0LC/BpcbIyXc8YIlBsJzNH6KUzXmCQGt42zIxtvzDfqBLF6L0ahADNTHIk80tlgs3QRcjCJDOxNRLcjHOase9bi/l/laN5h44p4lwVpuUnPbi7/1ug+Mqk8+fFLrvhtFWwvuReWr2Vvm7ra/vDTrxmUuzKBt4/qNsx3jRzxAEKmARnJRzw4Y/6C9FVj8/RMwlsYEwqu/YsNEBtYIY5kTzbwfMHaBf8E2G1Biz8rC8Y/SpkdmyPrhM3z17aoV0z+2RR8htKKmncNzKytjCu3PTvOqT4iehPQsOLg0dmGG9WidFEVWvq9b05EqhU7VVOSKgKTfGFu+oTAuOLEGr5CNa5Um1LteZzPfyZQiV6dm9IQTSor8D9hiC1ujWFi
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6512007)(6486002)(4326008)(966005)(8676002)(8936002)(2906002)(66476007)(66556008)(66946007)(6666004)(2616005)(956004)(86362001)(16526019)(83380400001)(5660300002)(6506007)(7416002)(54906003)(110136005)(26005)(186003)(52116002)(498600001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: lf2kdOgKBJewUYiykcQcSOj0TEO6+BgVqyI5k/GZtIZAwWfG0k6FyCkIgqZqHHGT1YjS/EUZow7XIZYB15kq5S+IF7aESbwJS/gZABBncbQL+GGqK1JrSr25Ub6ZAz3aGObxEcPKnjnA0tuLqfHxIo+CtexOTIXX5ZmntIy+l3X3mMukYxZpf4s2U3TcUe8+FQMFX9QXhgpY3AQnGkXHstx0D7KOyAJPVO1x7jbGTg5dLJl/7RQsI6D1KFUYF5X2ToDDKa1zmFPRaP26RwUXYBbJaBMzKnfNu3CdPXIIW1MJTScYW+biyKVr5akxV/1Ovry2G2lJ00sUDS13NSclFtFxlcoqzbaDG+Zy0MPFpAe6sIgs7Hk6tnpXrYlfrkCU+NLQfl2o3fSMYB8p1x8rkEgUQ1VlFEkNNGADV9yHWkln3dw+cbwI1yPLxLyaxCSAc51Wd007MHNR13wBPyXBrkj19LcAz+PydQx5+R0p45hdMqeqzNGw3QCI8Od74hZiA0qWPnkQFcfII5rIpDL0CN5DPCBAiL94bEPmpYDFzKBwqGYjqa2kMCIpJfUFNZ92L/bVW2Z7skrgcqOZMnBPEabrRwxt5+Dpc/qCM7wqLDbt/Uvw/M5F7xBgZK8MuPutGZ4eWJi1Q86MFE3039P24Q==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d2fe603-d556-413e-4666-08d85a2170b0
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2020 09:18:14.5415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjOs/DAfFw+324fDSNwv6L6mym7M3g6e1BtSDZoBFJIILmjF2I2Bmx2KYuVuKhOj7RzlA9OoSYcMWW1hWKcuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3630
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
Cc: Viorel Suman <viorel.suman@gmail.com>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml        | 104 +++++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
new file mode 100644
index 00000000..d4bb792
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -0,0 +1,104 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/fsl,xcvr.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP Audio Transceiver (XCVR) Controller
+
+maintainers:
+  - Viorel Suman <viorel.suman@nxp.com>
+
+properties:
+  $nodename:
+    pattern: "^xcvr@.*"
+
+  compatible:
+    const: fsl,imx8mp-xcvr
+
+  reg:
+    items:
+      - description: 20K RAM for code and data
+      - description: registers space
+      - description: RX FIFO address
+      - description: TX FIFO address
+
+  reg-names:
+    items:
+      - const: ram
+      - const: regs
+      - const: rxfifo
+      - const: txfifo
+
+  interrupts:
+    maxItems: 3
+
+  clocks:
+    items:
+      - description: Peripheral clock
+      - description: PHY clock
+      - description: SPBA clock
+      - description: PLL clock
+
+  clock-names:
+    items:
+      - const: ipg
+      - const: phy
+      - const: spba
+      - const: pll_ipg
+
+  dmas:
+    maxItems: 2
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
+
+  firmware-name:
+    $ref: /schemas/types.yaml#/definitions/string
+    const: imx/xcvr/xcvr-imx8mp.bin
+    description: |
+      Should contain the name of the default firmware image
+      file located on the firmware search path
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+  - clock-names
+  - dmas
+  - dma-names
+  - firmware-name
+  - resets
+
+examples:
+  - |
+    #include <dt-bindings/clock/imx8mp-clock.h>
+    #include <dt-bindings/reset/imx8mp-reset.h>
+
+    xcvr: xcvr@30cc0000 {
+           compatible = "fsl,imx8mp-xcvr";
+           reg = <0x30cc0000 0x800>,
+                 <0x30cc0800 0x400>,
+                 <0x30cc0c00 0x080>,
+                 <0x30cc0e00 0x080>;
+           reg-names = "ram", "regs", "rxfifo", "txfifo";
+           interrupts = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>, /* XCVR IRQ 0 */
+                        <GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>, /* XCVR IRQ 1 */
+                        <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>; /* XCVR PHY - SPDIF wakeup IRQ */
+           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
+           clock-names = "ipg", "phy", "spba", "pll_ipg";
+           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
+           dma-names = "rx", "tx";
+           firmware-name = "imx/xcvr/xcvr-imx8mp.bin";
+           resets = <&audiomix_reset 0>;
+    };
-- 
2.7.4

