Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E228CE4B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 14:26:10 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4C9ZXH0SKMzDqYK
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Oct 2020 23:26:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.20.87;
 helo=eur05-db8-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=QZZemehQ;
 dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2087.outbound.protection.outlook.com [40.107.20.87])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4C9ZLp3QJ0zDqTg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 13 Oct 2020 23:17:54 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NWGyBxG3aPayi00lO9agfZfDl3OrayteQx3Y07vSkWRzfEWxEuqoNBJhtRAlyY+D5yVExBA8tjPbYrdsPnzs6YFe8hkoj3OSNRqismf0k43mLG8aQ/y1vSAYsG5G1+1VnkRCkbQDg9ZD/wE9XwjyFN+w+5iqucWPG0Ye9NbNQkstU1fKnitLi3KVOtgTWDLA8X6H0PP6joX6gJPNvwknQzujIJUHooQNkbTp3va0MXLJTBkKEkMjt3z2BN/ZsdkD/+uLItf96IIYKXsLu90pu7Q2XVm4kEq1nrkUZ+79EXSHKeuuSCxSbDz2ruvW5oSa+lB1DWSVylhFHSr2rL2cCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEmLAKoGOck/B2qWs94DgUNXN0XetiA7Mvy/QsLu9+I=;
 b=QvgiOtVIxryiF4JZ8d1WZT/8g4SZynUeg8CgNw3a/OGfo6n4K4jxsZfnHvNklEucbizNBLWcwQD5W6ziPG+W0Y0bKLbeoNbVMa2Jp9f5FyvhpaFGkHCf69Gpi5zwlLkL6ObkI6zroTjM5Fr7IUsA7CidvoEJu53qi89/5mcYK3plGwEcX8aNlnFKLTFBX3UMaX9dcD7LjGs5db2gePTdia3YTVhswAlAi9tbAvgL0gMpPcNxo/ABZFKj8i6xXcvDusniDlx/CDfOyPHSzW/DQJAfXM7JhG2l1RKec9CZWTDRMVQBJH463EfW/RCuEPjEl1XHsgtEn2PvrW4nIBQZpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IEmLAKoGOck/B2qWs94DgUNXN0XetiA7Mvy/QsLu9+I=;
 b=QZZemehQWWtdpsDpXqbSi9HzBObDJFPhGlvNuqyV7uFBlxAQyt1M/9Obtctlj6CQ2ncPlLHH6QmahcBKK7BJreCtj7t4k6P2R8sA1iI2Nka35cwzcfq+rl2khaa7+2FAvWeN7lkX8j++L69pJAMBkaItq5jOSgfeahywlnW84RE=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5198.eurprd04.prod.outlook.com
 (2603:10a6:803:56::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3455.23; Tue, 13 Oct
 2020 12:17:45 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3455.030; Tue, 13 Oct 2020
 12:17:45 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Viorel Suman <viorel.suman@nxp.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v4 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Date: Tue, 13 Oct 2020 15:17:33 +0300
Message-Id: <20201013121733.83684-3-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
References: <20201013121733.83684-1-viorel.suman@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [86.127.156.60]
X-ClientProxiedBy: VI1PR0602CA0007.eurprd06.prod.outlook.com
 (2603:10a6:800:bc::17) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from localhost.localdomain (86.127.156.60) by
 VI1PR0602CA0007.eurprd06.prod.outlook.com (2603:10a6:800:bc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3477.20 via Frontend
 Transport; Tue, 13 Oct 2020 12:17:44 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: c44225f1-9238-4e1f-62f7-08d86f71fdde
X-MS-TrafficTypeDiagnostic: VI1PR04MB5198:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB51988CEC080AA9FAFACA90F1D3040@VI1PR04MB5198.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1169;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jkmiROD8iVPE0RiQxstSC5FWSBJolNi64xpz5AvmFzxpOyUOSKgFkix6mbvskYlpTxckNs92V1hD+fDVY3ys8S17AOOjWWy4ghwNxhxkvdyvwJN+DbFLQqyzEUQexQ/rY3lpFQaXRberfxaWDiLhPOPqD7TcijwSBVTzLevuaQDQKJv/6f7Nz8/WffkuyASxesuAeZwtmX7hCpx0PBC5q58m8qc+uaoD5QmXGe2tR27lbkk8V2KfEBAuqbRNdMvTbqLlvsGlCggaBfnqtpTah5ljYVKxunc/7PYqnfa+9z5ih55D1cozgNCdTHmyWYIBQC0YaqPOOK8G7kIc0puxbbL5w7164mNANk5dQj2B+df69zZzEqaRGP5GM2DTzU1F8Cy1O9oTD1Sza7BNE1fsyOC7E1zQ4x+l8gAeVhqDSmQeZl5ftjk46n1CtggwCsRXHtvydVWsDLSYUquf2WstTYnNmtlHoqb2utJT+Gk+o9A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(83080400001)(86362001)(186003)(8676002)(8936002)(5660300002)(66476007)(6506007)(7416002)(498600001)(66556008)(16526019)(66946007)(1076003)(69590400008)(956004)(2616005)(966005)(6512007)(6486002)(26005)(6666004)(52116002)(110136005)(2906002)(83380400001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: gjPZWDTajjYEmIgC5dRH5gQA2Mie8mR2AfWROVU8p6T73WsXWXLBGKCdhb5+rWrBtNs4JGqOZn49B8q78fL2r7FZlGBcwfRHu02Tws22aujbJXdrGXs0yMe56XD5StCIUGJfT+5YTwJIK4Q9oQm/3fRD9fMAqQvzcYxaVoANJGg4pCNdLYRPC4vCgpbkWnzOcmu1sfsS8+3c7KhVtXLhL2LOBKijkiWgFaaRwAVQY/xLYPcwP+84bZ1pODRTF0RqMmebSPbo5PTYtH2fHYaskUjyJtoGrc+SDb3hG24ccC1VCQCts6skPssQeS28KkWPQ04KVtIamcb5WSYSJ//8cigOw1CEy0eSnrWbqA/uV7OSzZ4m/os16tlwD8DwoqDnoshOInaKIchr3giAvR48Za7I1oxP9TbFX8Y7KfgOQB9gw4URnLWZ4cW9azHJuDrMGJgTgGgFEfJESv2T0AphQ7mWeAbeKT8mBKH9H30GraNGAIyk/0PNul+HFLc5qSyodL7tIy0DqA9VWmKwJqgs7/gUAhVKCMyI18ECswChN3q65d5rPe0ovyuwu5E2g6dCdpS04PqayGpGHVIRu/LkHn3fLC19KyUf7Mip7pFvC2zZX/zRZepyMrTP6zlQxE0u89Y5bOcJMI/MoibR3jm2Iw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c44225f1-9238-4e1f-62f7-08d86f71fdde
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2020 12:17:45.6581 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 78XvgaJOkLjBCWosoMpUPstSkEY9Zl/W68Td5tI0Z+PMqlO1L5TRthXfkWN7NV4OcM24TLlk+5JZijy5OmWHUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5198
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Viorel Suman <viorel.suman@nxp.com>

XCVR (Audio Transceiver) is a new IP module found on i.MX8MP.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
---
 .../devicetree/bindings/sound/fsl,xcvr.yaml   | 104 ++++++++++++++++++
 1 file changed, 104 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
new file mode 100644
index 000000000000..223b8ea693dc
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
+description: |
+  NXP XCVR (Audio Transceiver) is a on-chip functional module
+  that allows CPU to receive and transmit digital audio via
+  HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
+
+properties:
+  $nodename:
+    pattern: "^xcvr@.*"
+
+  compatible:
+    enum:
+      - fsl,imx8mp-xcvr
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
+    maxItems: 1
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
+    items:
+      - description: DMA controller phandle and request line for RX
+      - description: DMA controller phandle and request line for TX
+
+  dma-names:
+    items:
+      - const: rx
+      - const: tx
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
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
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
+           interrupts = <0x0 128 IRQ_TYPE_LEVEL_HIGH>;
+           clocks = <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_IPG>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_EARC_PHY>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_SPBA2_ROOT>,
+                    <&audiomix_clk IMX8MP_CLK_AUDIOMIX_AUDPLL_ROOT>;
+           clock-names = "ipg", "phy", "spba", "pll_ipg";
+           dmas = <&sdma2 30 2 0>, <&sdma2 31 2 0>;
+           dma-names = "rx", "tx";
+           resets = <&audiomix_reset 0>;
+    };
-- 
2.26.2

