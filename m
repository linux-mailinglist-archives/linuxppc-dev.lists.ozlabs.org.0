Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 152335A4B8C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 14:23:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MGV2k6x4Hz3cFY
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Aug 2022 22:23:10 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cJmKJG7O;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.70; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=cJmKJG7O;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2070.outbound.protection.outlook.com [40.107.21.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MGN6m2Kh6z3bY5
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Aug 2022 17:56:16 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iu0ZVGk+Au+mnimVo3UewfPuNxPHWw0WP98AHr+NLizbdj0KaxHBcz5mNEhN/xnDl+oYcGtFxIraOT3fD42sD5hO/Me8Fpla6DMuNA0UTUuTlsVZ0i/ATAhY7IBehrAzjhfBt6Ykvu+NOnMiTtLsW5wO83gW91UX3HBFwET3aT54+V5/moNLkFyjb7JCGgAgUOyqJWV707Lsdd9tDYmyLblKdijcCAFpweJ/YKROYfpnnwQA0Iw6THWGF9mIIBY0BAfkk9jf+KOax918gcUXAjNCAC7exW9wDwC0zozTRCkgqqtdEOeaeMG1vq9x1YyFMsFLv8QINtFVfONG4Mb05g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h/uhp+ejqiSCUTv6XvJqDLN5rybCPPKud1opQ3+Huqk=;
 b=WTNYTV8omxEwLV1qFWsIh0RBEiCPX9TlyYxX+nwqf7LV9NZJclST1KUoK6nLoifq+srmIWQyWSZXtDGRFE5NvFVJejaeXSannhuacNToAyUoy+dRXlnOFb/r/iFIOe6qi7R3YXUJNwpkXoE892iAsK1kSrnTpunlxRmP7DPlmmE3Pw/L1y6yHAMz5bRSl9DbBR6Hv9gpLfLSa/8gpNuA0yR3F5HTTU4ZOGpPUI/2R1yTk9rJ1oEemJq+uMmC//Jwg6KpejY9zZsZWicA82X23GxppXwkQUuqaGukJJKUA3ANP/gE6dShbA+FBzfDITrC0la+917QM5KATRJ3YqFREA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h/uhp+ejqiSCUTv6XvJqDLN5rybCPPKud1opQ3+Huqk=;
 b=cJmKJG7OI8iw5vIqHfYPDYm3MKy0uFXRUvUZx084PO0r4H+FViaQ4ZTX8vWbg9lrm8uDQkhDcWyWedN4seyLsyLw5kA/qCO4gPwqoH1V+caVcrdKQ8mIxB+i7UMo8tuMFzxdtVgX0qkFscYxEd6neOvgCeYzWfwJL8ECrtIvuLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PR3PR04MB7482.eurprd04.prod.outlook.com (2603:10a6:102:8f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.21; Mon, 29 Aug
 2022 07:55:58 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::3139:70b4:6648:bd32%4]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 07:55:58 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH 1/5] ASoC: dt-bindings: fsl_rpmsg: Add a property to assign platform driver name
Date: Mon, 29 Aug 2022 15:51:40 +0800
Message-Id: <20220829075144.2405000-2-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220829075144.2405000-1-chancel.liu@nxp.com>
References: <20220829075144.2405000-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:4:186::13) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 720768d7-02f5-4f6e-f135-08da8993e852
X-MS-TrafficTypeDiagnostic: PR3PR04MB7482:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	5yyjbXe9a92Y88qWN7oTFJUa26iG/lrvBXmFTqqeTYSsN9BXhiJ80D0D95AXoSEvnFm9CiTXQb6oCL91EmTAKDG3Hk9WRktaOfsmMQGhqkWhiGWSor6O7IrQmRLXy2xDd1Y/qqHhqqb6rWPEVNa47kxCZBZSu8Hf7dPXkiX3wHxEcv+FYzdTD/g8Qjhn1jFXQeAwtwWP1rHTu4WWpAsW/ABAgkejnMaM10+n2aO97y1+CxY3AC+wG+hFFtfpSv72VrVZBBtTn5XlKK2YZ08stJoqJtlWUINa/1g0swBOS2kh1jFPRR8S2/PgekQ7FcmLOWfrKXkAXlMSyaXfs5r+beQdgE0t9UCOR6L5wt2AD8MlHin/uSCqu/1pL86XAHl4CeH+8UdtRdou9HpSmUTVoKpwGzxol9+j4Zf6h+O+OdZm/Ye5SL8Pnf7gVzk+kJ8PgRi5EegakCQi6Ny7PTSEigmJ1ZK9pa+T4qr6RP84PoNvyDwNdmSTd9KUxJFSZMBCQRwEJwpqM/hbRlMM1XQlE8vT7kZXwMrdd6tL/COWxWRM0+O3Wm+ii3DfeHKogUEL2pDldZN02HlzHr1+OA3uNfn67YbzFhvueCO3mhya92vGxx5wIVkgOw2j7maSbRfcX77ds5PziUCp134ToMPV0AKWvj/BRGOiBxrKRVMe9eeBcfTeeSg9n8zQgQzWOm5/q/ruEY57bYgp4N1qTwCKKLd+qAfxmcrk6weO5eb+N/LVvgJ5FrHi9C3OZcncbeh41Tnm7ONmMjOaldX2eAXijnjANm4sbjLTRKxsQDsUR1o=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(376002)(346002)(366004)(39860400002)(136003)(396003)(7416002)(5660300002)(8936002)(41300700001)(186003)(6506007)(2616005)(6512007)(86362001)(1076003)(6666004)(44832011)(52116002)(2906002)(26005)(38350700002)(316002)(36756003)(66476007)(83380400001)(478600001)(38100700002)(921005)(4326008)(6486002)(66556008)(8676002)(66946007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?1YQA757UJ5Lp+71cInY34JB+iOIxz8UApDHGpHsOzsCwqRjF/1YVK58yxihX?=
 =?us-ascii?Q?Q3AoFxNY1PypYgSpR+JNcwDA6onfP4l06VdmC7xu07Wj3tPLs/v9hM6UPtf8?=
 =?us-ascii?Q?9/CWmx0ryzwsLcEGg0wXc0TecMnstJLoOrNqHq4x780UdGjWajzryy6p+kbg?=
 =?us-ascii?Q?YltThpN1/0zD5LsiRQZ9Wvg5up6dJvOWHkWZiFMRl5puS3bN1y1RmtDYOWtW?=
 =?us-ascii?Q?s77vEVDlQxpRoEdxaS7lLsl0ZUJk5ktnk1yNpbLEHEYavmo7+iRnD7kSorIj?=
 =?us-ascii?Q?dZM7Byu1RF+EyBgKJY+I3gDF3NQfRPpcYcY8RCckAprh25qns3Sdu6bZxbWs?=
 =?us-ascii?Q?j0LEwfhWcP9f+qKoJDvzL918gu6JNbciJNQ/+CI1HDN3rMaF1fiGv7xWJ1m2?=
 =?us-ascii?Q?Kr+ddA/cFKCPn2wpgVhMcc3DH9eoIuY0qbhZa7n2dbWFfHnRbaJA8762q4mG?=
 =?us-ascii?Q?ZwXco8OK1ecM0PDfCDPT3XDB4qlXikafjXOMSzws35olBVzvVNY3JCA7U7uS?=
 =?us-ascii?Q?UVvkcfg29iEkvLhFf9y+ARJLnpOhRiyKFz3RvR8XqH/oGOtblb8edWYqDfNR?=
 =?us-ascii?Q?JZc+oP7ah28JEDE2j9WlSgY0PgjtZ+x0INX01LRt4Ngu6ON/gX7NiHc5hJMz?=
 =?us-ascii?Q?1aRyf4LwTphpVG5XUdjXbW/SuQquuRtulXs/s1LPmWdFvpEvhO8+5vgYxrRy?=
 =?us-ascii?Q?96hISQbp9UrOoJulo8DSaf6B/rp0X88zd8qoRDUiUyvYgq+on6P3Uv6r7w1/?=
 =?us-ascii?Q?pBJSVtYQs8uaJJjrGO3+mMupib1UXIH6PZoAkquejHhDltuDEAXB8ECiyl2o?=
 =?us-ascii?Q?Boi3InVHb5EFxC5EQuQEAKRb6FjUulGoddhTVAp4PAaV35MX+4CTicXeY+z1?=
 =?us-ascii?Q?99eDu4PM+rpV5+p55h1Ab4joE5OI4KHtsyGjCg4mAT3g9SuDEDVSOw7W184h?=
 =?us-ascii?Q?L/ck26qR/LACCgs27+PSzcowiV009CX82YbMRp/jILYZwGjyQOkVW1McaHTO?=
 =?us-ascii?Q?Y4TlRO3oOiMWI7sZpMZj+WAywWDQ9BvMYwx3+J7TPmjhZ5b2habrn7P66k9R?=
 =?us-ascii?Q?aiqQvcEYosCPsX3WZZpFy9bmV7Ws+SEf0/ntCYnJKdo3HVFREJzNGtg4srfS?=
 =?us-ascii?Q?49d+/x1xQRl0CQZywhXho86MrPFSU2yW1O9xndT6f8xFJwB5M9SR8C5ERjVH?=
 =?us-ascii?Q?WQeFmkJ/ZP0q284ETWUbPNYGl4yNeG0iYxHsgJfC7eDalr1aI3FnfRphInl4?=
 =?us-ascii?Q?RWNmBuDLInYF6onvGXEHgRqdXPRUChsVjoo4YcJJ5u8clrmUkJRtwlVvs6LD?=
 =?us-ascii?Q?vW/7GSY3IQgp0lCC90XrNsS7R6aLMKxfH68XNfljwQ7oFByvKzsMsV7jTNAI?=
 =?us-ascii?Q?PFMenVw0KwoqUYnELk9+H0DeKi/VF1nxx8Hx7V+jp0rPn5OE4t+s98Zlt+GO?=
 =?us-ascii?Q?myJ8KlH/3zRECulHX8cMicMIT+0U3dZMeAkgAU2+xqqTi2PwRFLu82Nm/pI0?=
 =?us-ascii?Q?blc7dWrsyEIqSmfqwCnVrfTsX295D649heQ25S0CfXOdAJuavP4eIjThPrt8?=
 =?us-ascii?Q?vWgNPko9Mr7LnfRHvUGPVAiWmGClifekn5X+a2WI?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 720768d7-02f5-4f6e-f135-08da8993e852
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 07:55:57.9012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P5pCZTQhJtXtbfbnqFcBDzYNXJuDh6GcgEtbkuN+tEnWkt6jqBlVLk1w2PjDExkyPZuNr/f3/2LnMR5mD/DYzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR04MB7482
X-Mailman-Approved-At: Mon, 29 Aug 2022 22:21:55 +1000
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Add a string property to assign ASoC platform driver name. It also
represents the rpmsg channel this sound card sits on. This property
can be omitted if there is only one sound card and it sits on
"rpmsg-audio-channel".

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 .../devicetree/bindings/sound/fsl,rpmsg.yaml  | 34 +++++++++++++++++--
 1 file changed, 32 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
index d370c98a62c7..35e3cb9f768b 100644
--- a/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
+++ b/Documentation/devicetree/bindings/sound/fsl,rpmsg.yaml
@@ -11,8 +11,11 @@ maintainers:
 
 description: |
   fsl_rpmsg is a virtual audio device. Mapping to real hardware devices
-  are SAI, DMA controlled by Cortex M core. What we see from Linux
-  side is a device which provides audio service by rpmsg channel.
+  are SAI, MICFIL, DMA controlled by Cortex M core. What we see from
+  Linux side is a device which provides audio service by rpmsg channel.
+  We can create different sound cards which access different hardwares
+  such as SAI, MICFIL, .etc through building rpmsg channels between
+  Cortex-A and Cortex-M.
 
 properties:
   compatible:
@@ -85,6 +88,14 @@ properties:
       This is a boolean property. If present, the receiving function
       will be enabled.
 
+  fsl,platform:
+    $ref: /schemas/types.yaml#/definitions/string
+    description: |
+      A string property to assign ASoC platform driver name. It also
+      represents the rpmsg channel this sound card sits on. This property
+      can be omitted if there is only one sound card and it sits on
+      "rpmsg-audio-channel".
+
 required:
   - compatible
   - model
@@ -107,3 +118,22 @@ examples:
                  <&clk IMX8MN_AUDIO_PLL2_OUT>;
         clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
     };
+
+  - |
+    #include <dt-bindings/clock/imx8mm-clock.h>
+
+    rpmsg_micfil: rpmsg_micfil {
+        compatible = "fsl,imx8mm-rpmsg-audio";
+        model = "micfil-audio";
+        fsl,platform = "rpmsg-micfil-channel";
+        fsl,enable-lpa;
+        fsl,rpmsg-in;
+        clocks = <&clk IMX8MM_CLK_PDM_IPG>,
+                 <&clk IMX8MM_CLK_PDM_ROOT>,
+                 <&clk IMX8MM_CLK_SDMA3_ROOT>,
+                 <&clk IMX8MM_AUDIO_PLL1_OUT>,
+                 <&clk IMX8MM_AUDIO_PLL2_OUT>;
+        clock-names = "ipg", "mclk", "dma", "pll8k", "pll11k";
+    };
+
+...
-- 
2.25.1

