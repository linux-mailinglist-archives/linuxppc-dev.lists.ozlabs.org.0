Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 81FF1273298
	for <lists+linuxppc-dev@lfdr.de>; Mon, 21 Sep 2020 21:15:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwDfn3J9KzDqbC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 05:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=oss.nxp.com (client-ip=40.107.0.70;
 helo=eur02-am5-obe.outbound.protection.outlook.com;
 envelope-from=viorel.suman@oss.nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com
 header.a=rsa-sha256 header.s=selector2-NXP1-onmicrosoft-com header.b=NQfRBgzH;
 dkim-atps=neutral
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00070.outbound.protection.outlook.com [40.107.0.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwDW82vyjzDqsJ
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 05:08:52 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HzrSWTzva/Hz4uRyKeQO+G0FBlf2zQukqzYkLZrJrh4fQ+V7OGJS9zKxwLPNsQfcNOvSRZsG6VUF8TAwJcxV8uGkIg92/kq0qEBnC/hmyLxUV5l+RcJEHtOxceEtwcApIH8SyYTJl3QCfGuItgEEFuyPgsEhluEgQMwlq/7Ct22UbM6JVErrLPF7ZfoMRXevcrl6SJ+9Ab39yma6Nn8PewjK53JcxfGsY8eF7nktIrfsaA2TE2RPhMQyiRlMAVr8IUeBpd9tsiGzQdVVeQM6/As+Phfgss/R8E1Lv3myC/tO20eOjKZYhA1R4GHZ9BWs/HomIK8LcIXxaC/TFwTW9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNiJax0QLjM78wUbXKwzY6w1aZBNGq+Rsq4aqvMBrVE=;
 b=cQcBGQF5o4PrtB0BFzAC7LiZoQ61mXLISLhQnxS1zt1YrTbzfJIgnbbmL6U4Ka0w7M9Z+DgLXFqXtbjDTFc0fgkvjaDOwYgbH5bckkzsE+rC6BIjWb4HFDdMe7Ra2S0C2OcGNyQ44XEFNaW/e5p6PIdeS5nbHGMR58+3nsYMQT/oscUJqyLTodnLTMzNLt3jmw/sfcoHTFttWF2e+0HLKyj6568Yh7RBpMSDeFhhk4Ii2VSFqJP5t2Fqtj+9Itsy+RpS+PiO0L+A6IaiapkF1g788lsUPRqy8T8aDDA3+pf050JYEgUZsme8153/+/LdCqBrKVsjGQQn/3HWqdQTzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector2-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MNiJax0QLjM78wUbXKwzY6w1aZBNGq+Rsq4aqvMBrVE=;
 b=NQfRBgzH+dxRjuPvkzIWiStvFTpuaB01ej4H5Xx8JM1HOJ3FyQfD8Yvz4t6KslHgq2cURf0AJC/hjXGKhpsIiFnAw643g/5WOYDHOTmMOw/JPtZMnG4ZtvcrddMW9bVSwPxI3GI7bTJtBNJ4y8E6VmXIsR9tb9Y9i4Iuv9ail+M=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oss.nxp.com;
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12) by VI1PR04MB5984.eurprd04.prod.outlook.com
 (2603:10a6:803:d6::31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3391.14; Mon, 21 Sep
 2020 19:08:46 +0000
Received: from VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000]) by VI1PR0401MB2272.eurprd04.prod.outlook.com
 ([fe80::e00e:ad13:489b:8000%6]) with mapi id 15.20.3391.011; Mon, 21 Sep 2020
 19:08:46 +0000
From: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Timur Tabi <timur@kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Viorel Suman <viorel.suman@nxp.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 2/2] ASoC: dt-bindings: fsl_xcvr: Add document for XCVR
Date: Mon, 21 Sep 2020 22:08:12 +0300
Message-Id: <1600715292-28529-3-git-send-email-viorel.suman@oss.nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600715292-28529-1-git-send-email-viorel.suman@oss.nxp.com>
References: <1600715292-28529-1-git-send-email-viorel.suman@oss.nxp.com>
Content-Type: text/plain
X-ClientProxiedBy: AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:20b:150::21) To VI1PR0401MB2272.eurprd04.prod.outlook.com
 (2603:10a6:800:31::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from fsr-ub1664-116.ea.freescale.net (83.217.231.2) by
 AM0PR10CA0041.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:150::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.3391.11 via Frontend
 Transport; Mon, 21 Sep 2020 19:08:44 +0000
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [83.217.231.2]
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: f13c9b29-48ec-4bff-6b83-08d85e61c3c3
X-MS-TrafficTypeDiagnostic: VI1PR04MB5984:
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <VI1PR04MB5984443F978B9CC1470772D2D33A0@VI1PR04MB5984.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TWa7pcbnPd0f8Vp5EcJ750ga6jHEmBXHgUlaqJsXfQCUJeSSoPTewtM5nwhwLE0N4tZhhuuw1DK2aqe5e9oGzSu3utDDSyqLzkROZd5AutiAx1cI1NMXqY0TwUD8uYhVa1OkczMnP+VKpd1cHMjnI7V2bz0+WQkSE2gIbpMurvaEMHNklZApbRMf7M1CFIC2ZVVz28Z6NoDDXRBRsQ1EyvmlHyqetCkXR6NHY3PPc8S6tg7Xjx5rFF3xzqLgOQnpwSn/AOeO6dG1WKtS0mD7rXZjAeWa/GRJWw3SqQ7Wh8wbPMuXHoYgNR0EG9EaNM1xdYKxPqdtQl6ZXnNensdBbKpJx3jG2kSQNiny6O+pk6OX0yLZpQ8MDyHlF1qqKOMYF2w3tQsHX49Fj1llDztoB5cE8HDqgczsiaReuhX0jhAyooFeFIa5VWX6P2vOipqXbRJPWVWFRRjIHwuHAINhAazStcv6UvZ8qTaC9E1TgkavA4dvNX1TjSeXW0VXvGdS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:VI1PR0401MB2272.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(366004)(8676002)(26005)(7416002)(66556008)(478600001)(316002)(52116002)(54906003)(110136005)(2906002)(956004)(6506007)(966005)(86362001)(66946007)(2616005)(66476007)(186003)(16526019)(6512007)(8936002)(6666004)(6486002)(5660300002)(4326008)(83380400001)(921003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: imajBIK/MtWuJUoBpWaduDWNG5CjejP1a2nAwzj0NSjN29L5KDezraTLdicR8n10u0jUhwoUSkReLP5IEsH1ou0yaMs8hKmKVNc6Q3/0Q/kGEzKkpbte0Vr8qw1PyXKFqK+SHBUby8Sz142Lr1KDNN+BrNkkGHjFSxA1dh4gQZXw/TH3mhvqFOw158b4FWGK9QlLZol+ssSXC5Fs1vDnKzPkJ/WL80BLbgimioQLqXUzZrwYAkvbUrufajpTkfpMgZw92Xu9pgTO/GeJZf6/hxzoCJs/W+fhV0dYYauENiOEWSHCe9s5eWjB0oE2va/9K5hN1GCEUvxTtBiVXfCH/9y4Mc3R/S6GLBjdOge6SZo6XtTypk2SKLRwMUbYJORCREY4mz67XX7S0whqCQEQb/MNSfdsG8T5pHWxANFOeY325STCU6EPDfqSNhbA8hipp2Q4cm5ePmU2wyft4hx2s7Dfn/EcqwkTKlw4IGIJUZ4BVwMidlTJ5c1fc2Hq7Qbd2swaZFBU8ORiV0CVRk7wUm0VzTawrMD1ww+AurKoqM0TX6Z8jUUBW26U7KMN3JnnkG4bFVEl4PgIzNh4QMWIyKzVnGbSSx0lagSKZAaM1JzAy3DcTQlVko+zGpYyoc9MYdg2dI7sTz9uya+p9I00Gw==
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f13c9b29-48ec-4bff-6b83-08d85e61c3c3
X-MS-Exchange-CrossTenant-AuthSource: VI1PR0401MB2272.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2020 19:08:46.4387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoDfSk9/pLbrTwcAWpIiGp0AsYau/+1bvmGRVr+8597cEnvaumlKBbLnkGzU3zTBQ9ILwTQa6OrPZK+gJYehpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB5984
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
 .../devicetree/bindings/sound/fsl,xcvr.yaml        | 103 +++++++++++++++++++++
 1 file changed, 103 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/sound/fsl,xcvr.yaml

diff --git a/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
new file mode 100644
index 00000000..8abab2d
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/fsl,xcvr.yaml
@@ -0,0 +1,103 @@
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
+           firmware-name = "imx/xcvr/xcvr-imx8mp.bin";
+           resets = <&audiomix_reset 0>;
+    };
-- 
2.7.4

