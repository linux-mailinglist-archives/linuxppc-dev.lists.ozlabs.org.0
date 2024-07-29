Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF6893FE1A
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2024 21:13:03 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WRbnqhgg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WXp0Y56kbz3cdn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2024 05:13:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector1 header.b=WRbnqhgg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:c201::; helo=am0pr83cu005.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazlp170100000.outbound.protection.outlook.com [IPv6:2a01:111:f403:c201::])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WXnzs2ccgz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2024 05:12:23 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e652HF/JEDQPW4Ssd2XH2hID1EpV3Fd8EQOioUwCAc0cuK5yWE3kfvY3B0fIvSFrV6Jy8SvEVI7emSPXeot96eoMojPpsoV3E5wbnpRwdXnND0uFma7qP3rs3mF2t6LSXI1f145/gUIaQokY4SkQXsLnMHxH6ZUOemXVjuvOVionti4tp0TpknUZQVocuUPptZklhjhUGZtyyzzSkvW7EYEd3yxeXyVpMTymwYeFI13YxdDcc+Kuo9UJ4BuHnG+tu3OBuuXbuLf1gCf9OH+4pqRYFB6rTXDRr0IVxqXOWhe36pkuaplXgBumvWkcs7SJJsHpESleMZfltx+LEOa0xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JCsi7YEvLI9ZylUJ9nzGtVjkEG917DqbNXG+mkLGto8=;
 b=fsZ0qtY9F8LPSbXpD/s3Z4BEy+HW8GdGh63x0ZWlk9cAnewbXZWA+DJnuKzwf1X82ZZMyy/XdLgicct235f8V0Pzukj3ObtpXsf+nhHyt0W+4vyMD1DUkngeJ66PLaENCUMyiEcufChmGvQDfIgVSe+JDdDDHptTZwcr8Y0Y4QoDI0N43mWXqq3HTtSvjOuUJGUrbKZ/y9jNjbg1CxCRb5GyeReHH5JaoygxJYTXCyYlzNaSgY7Iu0g4WTsF/2Mfq6HvZ2FtsGsE0rBjp8KzLYUaKLgAyZ6xiAiPlOcUAsYFkSMBGbjjIIwK7xVysY+N6t5pLI2zFmg7zLp06jlGOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JCsi7YEvLI9ZylUJ9nzGtVjkEG917DqbNXG+mkLGto8=;
 b=WRbnqhgg0m05vo/2bk4gkYYouezqJuke+X9U3B0Upj7AWH2h2wnjr1A6GygcvFmaq3zG0S8ilgXHWfX9pJOUO7VCdafT0eWzDcVaWthPMqIfD4PEQtl+eZiyQiM0J15VlNvAJMSBgq0IXg8hKG9v2yLb5xRSWeWRtihkATVvbdRoJXCtfMUKCCebB3paT57Xnt8kIJPn4HmT1zi8GjFLSPrT5rvomjZUw+yxa70f+TjkSX+2bKI1s9wOssSgOU+bTbllBy0I6Ns3P2uiBDx4+WiPdsEDqjSspz9BwRXTq9Hqh4l23+U8pbcbEL0apnSj5UjBpXrXaimKksmvaurKbQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by AS8PR04MB7557.eurprd04.prod.outlook.com (2603:10a6:20b:294::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Mon, 29 Jul
 2024 19:12:00 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::9126:a61e:341d:4b06%5]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 19:12:00 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-rtc@vger.kernel.org (open list:REAL TIME CLOCK (RTC) SUBSYSTEM),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list),
	linuxppc-dev@lists.ozlabs.org (open list:FREESCALE SOC DRIVERS),
	linux-arm-kernel@lists.infradead.org (moderated list:FREESCALE SOC DRIVERS)
Subject: [PATCH 1/1] dt-bindings: soc: fsl: Convert rcpm to yaml format
Date: Mon, 29 Jul 2024 15:11:42 -0400
Message-Id: <20240729191143.1826125-1-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0041.namprd05.prod.outlook.com
 (2603:10b6:a03:39b::16) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|AS8PR04MB7557:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a61ad68-8192-403a-587b-08dcb0025266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 	BCL:0;ARA:13230040|376014|7416014|1800799024|52116014|366016|921020|38350700014;
X-Microsoft-Antispam-Message-Info: 	=?us-ascii?Q?BtJOyh2Suhgalp3PFNlzZd2I+X89QGuiw5iu06Sfdv1c8VvpIZbPHw2ljyXu?=
 =?us-ascii?Q?fMMSVMPe1fhAbWwQex6Xxx8Ua4/2GbECzVakUZmn6B7zfnMsax5yvOKW3TFt?=
 =?us-ascii?Q?xp9/KUxM00xlHsFuwFUI9OkRqLCFgfCkapOwHeJqaeAmUv1oaF4Ii6ydiCGo?=
 =?us-ascii?Q?mvdccExI1yFnz3GtpQYnftQszEdUZdGdhY60Q0yFZUgsECOUZyot0vS7iybH?=
 =?us-ascii?Q?SGeyI4qH0URxoiz0Xu4tWzslZ/iSpV2gvAEQol4pwH3CNpGtZTDRUcOiG4Ep?=
 =?us-ascii?Q?fNaSQq8zCufnUf4eKjnCmtpI+2amiViuWl7Wwl6RYjHbNngS4fezuE/LAUbB?=
 =?us-ascii?Q?6LQvg5sL13VzRl75wN/a+MWsZlaIhdzUlRqAEWCtZhxNBEIOCHOQjLPGsYOl?=
 =?us-ascii?Q?J6o43fUb2e+Ey9lvMcGwlAcm/SNCyPvW1BKpnkfvQ23BwAQrcqFFYMnSaXs5?=
 =?us-ascii?Q?kLRFy/yz/shS44kYFBbvw4yQ9BPUKGQQPnXmgXSu5pE/KfvisZ4aai3V4dyi?=
 =?us-ascii?Q?Xf1f/uBi0t0RR7HbvU3GABOAYCUXW8BA5W/whTK5mKi1JuemKzRdU3uEi7Gg?=
 =?us-ascii?Q?bCG0ThCisarr9OvIibUBJ3gpisRzWpHXpYBNUssfmr72i3x8DrNnRL2WR9K1?=
 =?us-ascii?Q?vWA8CGbxGHi5SIHTkO+OKRtM3wGQT11ZuH+x3hyacWd1uUGCgQ6dOC4bAto4?=
 =?us-ascii?Q?U0FaaN/Hu2AI0Qv9Z7VfYMmr8u9TmAANZMFfDArLmxQXwBXlEm19GeIGxock?=
 =?us-ascii?Q?hGHGr/fyHDNki6/DdGb2wAOByUqMph+jLelHlliGRDobiiFLuF760PIWGC/l?=
 =?us-ascii?Q?fxagolvTdwIMEx/FTP8Hwxp2lrEtbYnlj70gXJWCh0CmwZpVj1jUU8pCCa1R?=
 =?us-ascii?Q?nvHYicDPWgesNRv7xeE2Em5S1UqnOnZOZriigiUapV06r56Y/wjZ/KAEIed1?=
 =?us-ascii?Q?XqmGyQjaVFsh9jcU07mVl5YduKG0QNHj0j9ubeQluILFlV48I6mp3mGboxZi?=
 =?us-ascii?Q?z8R+mCHn87MbUWwnizVUx5hrvnSbMWw5TkG7sbnl0KMJ6whX6JEXScrFgpk+?=
 =?us-ascii?Q?sEqeUFUsAKtNC8GNkE1x5dLjV9lnKiUbVt/pmRtOcgYt1JJSN6OSVggsqzSP?=
 =?us-ascii?Q?9WaoEdsTM3geo3VBLKAf7hoS2Xkkkkdsm08YuwOHFghh98UACCvytZ4HXVs8?=
 =?us-ascii?Q?vvdOi8OZFgDtY/euB12GgCDtwMtAyPRqrzf7/6fwXHiOipIGsScNYjHyDjc6?=
 =?us-ascii?Q?em66Kdb/wtdGZm/yoTWEq+0dYNlUu66F7vkVlsYKngzp20kGeE0I1CoxTH2D?=
 =?us-ascii?Q?ItuO6q/tdj90mYFmr0/BdR0Qup3xDp7gcUbtMkn0YSZNAFbre7COYMEDcmOZ?=
 =?us-ascii?Q?N8qu8itP47h0xNGgQJz0wHfhjEZi?=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(52116014)(366016)(921020)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?el+yGtakbAF7x32ItC8Bb7npe3yQ/0R8wsaeiTr01DV7gw89bWOCDynIAImc?=
 =?us-ascii?Q?j7/3vIA0EJooKD2OrF87mLuvjBgXwf+JuyoFM06rN+lhG4w6kIhQ/5eJQp58?=
 =?us-ascii?Q?vhVA7GegmLbCw47PIZoXii1pfzo3l0yzjgNJs3zFeMFxXrDZqJIHlKhe1P1Y?=
 =?us-ascii?Q?oLjWYbcVHcNVF7RmRKwHL+HBwEsVm+f/p7kwLgpWmPDlIaIpDrJw4ce9XSq2?=
 =?us-ascii?Q?TGvgcx0cOjGdDuIS3Vq04lYTtiDOQ8BFSlglXOIxo4WZ1KGq6xGB/VKCwzKZ?=
 =?us-ascii?Q?OXrRhTo8V2CRcjNKPCTwKJUuxYZYe94vGK5oHLgmsNGALyHYvkbSVHAD0sIK?=
 =?us-ascii?Q?F7yQLpF3hS47l6YIrdWndPis/ZSS4PwmdJY8bH7oMHRyOmPjk4a2tQwuukra?=
 =?us-ascii?Q?ZV9lY7TynZa3mZeZaUL923+huQ0/c11negt+laRi5NzVhCH1YqV9ZRDaEcUq?=
 =?us-ascii?Q?9IUdedZtNbi1TuftI9+NpJSvONtTR5GicmA6lke+nK74kzL8K8jhnpgsFxq2?=
 =?us-ascii?Q?ELKMDL3d+OFOaf3aXBunRsrpOY52WiNn/rBBAATDTJE4CssrVjDMery1uHzM?=
 =?us-ascii?Q?WQl44ufp8w2vCFC+l703bzbcJi/5ijwwiPlELWxE4GkXS6yifIA9rjLSBdbr?=
 =?us-ascii?Q?ntGQe2/rC3HuYrqaxkATQlmXmc50XAyQQnSrWHPp+LDjNAstkqLEdt7CNS7/?=
 =?us-ascii?Q?Dryax5T/5soeDTPP2aG3+xp/3ZBawo/17auOkhe7o9PPETF0KpVURbohGY52?=
 =?us-ascii?Q?7bSerJfvl8YDzu9YdOjPYqW5dTZY0BEHuK39BvIf9OFXecpIv6U8ia9RoKrV?=
 =?us-ascii?Q?LhWnd1yMcn3fSNmXGA0OZfDgUkYpWwP6gK9jsodxANtRFNeJM/NCQX2TwYxN?=
 =?us-ascii?Q?3L1wfLdGBiImo4ODuUV7tCln2POjbYGbCbPIdpwxYEcX3N6Nz5/Kx9GKDd/U?=
 =?us-ascii?Q?HHp3vHkxlAQwTQkk0DZ64kKjBsyN8mb+UkVobMO7hORmVCWdztuaUCWIvtBq?=
 =?us-ascii?Q?LLMOY2Djoa7eInhVP2Qxd3D07W2e/vTDcAz3OyzJRZbC2Ywx/Xwjix3kYGFY?=
 =?us-ascii?Q?nVwbZ+1GM97vJ1LGRX2wn76TQZi2NLAoqV6l3PDObGX6uoH7m1ln4oIC4Vle?=
 =?us-ascii?Q?jmCB0erNGcl3ELTSWSQyL/oPCRwtyWzb/vnDqvDC/ENhxGr5IJkK1dmdHM9G?=
 =?us-ascii?Q?ZsqvE975DPQStu7JJZCtUapWaMQtohT455fv1NLnB+cH3ScWi9fwL4z25Ryb?=
 =?us-ascii?Q?dSD0xKEkzz6d0JVVSkulykAGEuQu6LSWZ1cxHHBvyu9VZPMRfJ9Xu1J/3Rt0?=
 =?us-ascii?Q?k4zm5SkLMFtn4PcyoRjvAxqXc1xx2EiRduuqlyjgrYLkUa7E0wqpfMkImQzF?=
 =?us-ascii?Q?q6XNYig1z5Ae+mdZZgaBWqFwpQrZ4h/HeY27cY/sPFwn9GbIEOWb188ya/NE?=
 =?us-ascii?Q?FyNdRHxhRUlFvuhFMMIeVpzYLoX4A5p2ODLgIezHvhK6UbW1prSFIGOMuwIn?=
 =?us-ascii?Q?Q7Lr3L8AvtKVKqeOMQXa4Wio5s5Opu0GVrl2gpNYU87dIE9axIT+vSOKNwwK?=
 =?us-ascii?Q?rvZ7vUQHZd34f6v77Yaqp0IunkfOiYHTG82EOQGb?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a61ad68-8192-403a-587b-08dcb0025266
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 19:11:59.9919
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyOzITQ9HYW6yMmEqniN+zvMNdTAfhW36EFJE1mls22249Z3XTFnywyuls49L0Ac5XGobZZy9/wjGknnksmHjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7557
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Convert dt-binding rcpm from txt to yaml format.
Add fsl,ls1028a-rcpm compatible string.

Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 .../bindings/rtc/fsl,ls-ftm-alarm.yaml        |  2 +-
 .../devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 91 +++++++++++++++++++
 .../devicetree/bindings/soc/fsl/rcpm.txt      | 69 --------------
 3 files changed, 92 insertions(+), 70 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/fsl/rcpm.txt

diff --git a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
index 388102ae30cd8..3ec111f2fdc40 100644
--- a/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
+++ b/Documentation/devicetree/bindings/rtc/fsl,ls-ftm-alarm.yaml
@@ -42,7 +42,7 @@ properties:
         minItems: 1
     description:
       phandle to rcpm node, Please refer
-      Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+      Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
 
   big-endian:
     $ref: /schemas/types.yaml#/definitions/flag
diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
new file mode 100644
index 0000000000000..6c6cda7f2b220
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
@@ -0,0 +1,91 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Run Control and Power Management
+
+description:
+  The RCPM performs all device-level tasks associated with device run control
+  and power management.
+
+maintainers:
+  - Frank Li <Frank.Li@nxp.com>
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - fsl,ls1012a-rcpm
+          - fsl,ls1021a-rcpm
+          - fsl,ls1028a-rcpm
+          - fsl,ls1043a-rcpm
+          - fsl,ls1045a-rcpm
+          - fsl,p2041-rcpm
+          - fsl,p5020-rcpm
+          - fsl,t4240-rcpm
+      - enum:
+          - fsl,qoriq-rcpm-1.0
+          - fsl,qoriq-rcpm-2.0
+          - fsl,qoriq-rcpm-2.1
+          - fsl,qoriq-rcpm-2.1+
+    minItems: 1
+    description: |
+      All references to "1.0" and "2.0" refer to the QorIQ chassis version to
+      which the chip complies.
+      Chassis Version         Example Chips
+      ---------------         -------------------------------
+      1.0                     p4080, p5020, p5040, p2041, p3041
+      2.0                     t4240, b4860, b4420
+      2.1                     t1040,
+      2.1+                    ls1021a, ls1012a, ls1043a, ls1046a
+
+  reg:
+    maxItems: 1
+
+  "#fsl,rcpm-wakeup-cells":
+    description: |
+      The number of IPPDEXPCR register cells in the
+      fsl,rcpm-wakeup property.
+
+      Freescale RCPM Wakeup Source Device Tree Bindings
+
+      Required fsl,rcpm-wakeup property should be added to a device node if
+      the device can be used as a wakeup source.
+
+      fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
+      register cells. The number of IPPDEXPCR register cells is defined in
+      "#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
+      the bit mask that should be set in IPPDEXPCR0, and the second register
+      cell is for IPPDEXPCR1, and so on.
+
+      Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
+      mechanism for keeping certain blocks awake during STANDBY and MEM, in
+      order to use them as wake-up sources.
+
+  little-endian:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      RCPM register block is Little Endian. Without it RCPM
+      will be Big Endian (default case).
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    rcpm: global-utilities@e2000 {
+          compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
+          reg = <0xe2000 0x1000>;
+          #fsl,rcpm-wakeup-cells = <2>;
+    };
+
+    serial@2950000 {
+         compatible = "fsl,ls1021a-lpuart";
+         reg = <0x2950000 0x1000>;
+         interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
+         clocks = <&sysclk>;
+         clock-names = "ipg";
+         fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
+    };
diff --git a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt b/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
deleted file mode 100644
index 5a33619d881d0..0000000000000
--- a/Documentation/devicetree/bindings/soc/fsl/rcpm.txt
+++ /dev/null
@@ -1,69 +0,0 @@
-* Run Control and Power Management
--------------------------------------------
-The RCPM performs all device-level tasks associated with device run control
-and power management.
-
-Required properites:
-  - reg : Offset and length of the register set of the RCPM block.
-  - #fsl,rcpm-wakeup-cells : The number of IPPDEXPCR register cells in the
-	fsl,rcpm-wakeup property.
-  - compatible : Must contain a chip-specific RCPM block compatible string
-	and (if applicable) may contain a chassis-version RCPM compatible
-	string. Chip-specific strings are of the form "fsl,<chip>-rcpm",
-	such as:
-	* "fsl,p2041-rcpm"
-	* "fsl,p5020-rcpm"
-	* "fsl,t4240-rcpm"
-
-	Chassis-version strings are of the form "fsl,qoriq-rcpm-<version>",
-	such as:
-	* "fsl,qoriq-rcpm-1.0": for chassis 1.0 rcpm
-	* "fsl,qoriq-rcpm-2.0": for chassis 2.0 rcpm
-	* "fsl,qoriq-rcpm-2.1": for chassis 2.1 rcpm
-	* "fsl,qoriq-rcpm-2.1+": for chassis 2.1+ rcpm
-
-All references to "1.0" and "2.0" refer to the QorIQ chassis version to
-which the chip complies.
-Chassis Version		Example Chips
----------------		-------------------------------
-1.0				p4080, p5020, p5040, p2041, p3041
-2.0				t4240, b4860, b4420
-2.1				t1040,
-2.1+				ls1021a, ls1012a, ls1043a, ls1046a
-
-Optional properties:
- - little-endian : RCPM register block is Little Endian. Without it RCPM
-   will be Big Endian (default case).
-
-Example:
-The RCPM node for T4240:
-	rcpm: global-utilities@e2000 {
-		compatible = "fsl,t4240-rcpm", "fsl,qoriq-rcpm-2.0";
-		reg = <0xe2000 0x1000>;
-		#fsl,rcpm-wakeup-cells = <2>;
-	};
-
-* Freescale RCPM Wakeup Source Device Tree Bindings
--------------------------------------------
-Required fsl,rcpm-wakeup property should be added to a device node if the device
-can be used as a wakeup source.
-
-  - fsl,rcpm-wakeup: Consists of a phandle to the rcpm node and the IPPDEXPCR
-	register cells. The number of IPPDEXPCR register cells is defined in
-	"#fsl,rcpm-wakeup-cells" in the rcpm node. The first register cell is
-	the bit mask that should be set in IPPDEXPCR0, and the second register
-	cell is for IPPDEXPCR1, and so on.
-
-	Note: IPPDEXPCR(IP Powerdown Exception Control Register) provides a
-	mechanism for keeping certain blocks awake during STANDBY and MEM, in
-	order to use them as wake-up sources.
-
-Example:
-	lpuart0: serial@2950000 {
-		compatible = "fsl,ls1021a-lpuart";
-		reg = <0x0 0x2950000 0x0 0x1000>;
-		interrupts = <GIC_SPI 80 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&sysclk>;
-		clock-names = "ipg";
-		fsl,rcpm-wakeup = <&rcpm 0x0 0x40000000>;
-	};
-- 
2.34.1

