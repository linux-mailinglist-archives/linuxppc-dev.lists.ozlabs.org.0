Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C80D658A31C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:12:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNJY58rmz3fL4
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:12:45 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Yofo/F+l;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.2.72; helo=eur02-ve1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Yofo/F+l;
	dkim-atps=neutral
Received: from EUR02-VE1-obe.outbound.protection.outlook.com (mail-eopbgr20072.outbound.protection.outlook.com [40.107.2.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9Z3bW7z2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ObR15jMLuHDWYuE6brh0Hq9ZStYo2h+ZHYQ4nIFan7jm86cT0T5IPPEVfdwXDnmRgBJWOwNbZhHi2ia5YbFVzB2aQR91kDFACBmeUY/poLZGRJUREqFGbGxEezJF+urTciDn+TC+qKtaay/Zbz9eayxdEu2eqOt6oEwJKYW8GYwV2VwP9CG+ml5a+YXqxQVkkkNS7v+6tDjthvHlE7EPXZ99E2wCO2OjXzsuzebHqGTRKIqqxNTJlaKg3qnccAyWJPaHJWI8X5rsnM5BnO2t9HBMIamBTF6JTPBF211llLYd8WEOdGa4HtrgkkqDiJZ+BC+yx1tysCD9Ps5NO3lmnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oqchtlTiHCYugeUEDYbtK9JXnNGq1U+Kw71k+Lbvo1s=;
 b=M9ZCbWk1gIm7LDrN16TRwv7D0/LnyCmedBx5IIMrnsU5PewWH2h/BbsfvImaeL9VwAIrEOxgY5M7ihfZsNLy+UoF6ynYyysSgqxtL98jzB+K4m2xh7K0fq6tlqoeiooc92mq61xELSBZBpFCp1Uzvjd/Fjf6jM1e1Ahz3eKcr3/ZiNfElv24Z4qfRvUhv8i/bR62FgtGXkolz0NztVgxoA8t9oS0oJCkGSumsaFa+o6Ell9JIBMoH26EXr18bi7aPpoJHzIkSZGB/aWTPvJE/qfB5bt8o0xUvY9DqRfW79pjpUVczJRwUdW49umqCrD2RZ84gGOTkHM5+4QFJddwLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oqchtlTiHCYugeUEDYbtK9JXnNGq1U+Kw71k+Lbvo1s=;
 b=Yofo/F+lyQVN0d74jdrKrFaL8aoNHKl0TUMHyA73O++36iU/VTHgz8UXUasPkl5MTmJJpLTfPYw0VigIZUhAG4Rqnl8gst38H6B0gIw0DSqle96mJx5sMS3i/7imGqVu9mNjWlFLbIIPA79rPMLMhH5+iag9TdR7kLFgX/GV2ylZ4r+DEE1lpR1YCf6C+HTmEkyYgPbTeBwWgHHzZRTssnATJaMaULfEBDQVoi3t31ypEUOI2I95v26Vk/dJIUP3Z3aRpYLKbBEwgPIjHw4uftqDBpU8NvtCS6aHdZVnzeGaeWPsp5EDXa/5BRgNkby40QhCEK1vanbShmVjRtXbIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:27 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 8/8] [WIP] arm64: dts: ls1088ardb: Add serdes bindings
Date: Thu,  4 Aug 2022 18:06:02 -0400
Message-Id: <20220804220602.477589-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b566126f-5ff3-4c60-f736-08da76659438
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	yCg+FW97ZVMv9CsWWNYKXGX6grk9hMTHeK8rtTj+3q+phBqXIOsGjRTEFJQq06BsPAZjw90ym0QD2+KToExHITW60NK2h/YxDpvfVb/62ev90WacrOJMMrdG8HkITWQiQnehUvxjyXmTOTdy0NPV2jB3ckqkXoy4Mx7lOTejGPx3JhUCI9wizTMiig6iEIY6pdIjhACX6UzJ3Ipu0Qqhrfm0FS6ow/4SX0dDklvd8L03BcUnWT3Hb/T2mX8gIiaPg64zX2EvlLhRtxRtj4HkpBNlQPrxJ+rjHahlAIHSLvhLUd0xsth2G3PZsDa54V18Y5dVEeNvBiET7o5DuebX4GqO3OxVFYru13bB1u4td6yjT9jbqttsS2T+sjy9kBqtZfo1HyVT0dWjF1SyrXUqSbRbt4IevBR3XJX5stQwXXRwzJdP1nndzu2xk5WFxVDZ/OABYqEnh+AJUXdCY4yP1mPyvpHGMBiGgCfgBX1JxmhrBBT7C/jqQl4pCnN50AjsfNe1HY+77nn+uqOCHnm+NTWNEgcNg26V0RLBaBqBBwc6WtzYk54ciMJmbdrCLLl3J+6kgMbCSqeMZCs6fMQXj03oMKfS0zHHa8ggehDUmEM3fhKD9fd4YxNbi2drx8xSzewoS/5cj+/drORd+ZNxXFzt+uizLSR4gSPjnFmieVN6toCVX7jbovGDhk4rarh21DS1+vK00HLrtcjg4Lp5ip89d+6r19WYN/vl+kGPm0MUqGQyg4fn6JFA0q8eEEMM7Gzbv3Q0yQXKQUvz3NcAUgBy3trnbYlsACbVk/ikWLE=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?qOULPihdtXQs/jZXUiFTkESyv2VdRFK+68at8ktgUKWX3UbNtq1sjpqeVIxt?=
 =?us-ascii?Q?NH/51ydU6TyEdWQXj1m7Kt2tARrmDZmedi5Ptntj0ps45MYY1T6eHJ9+m/Ft?=
 =?us-ascii?Q?gZG5sePHwhlDEDJixfucLNwp0tGurkcW9lbMmJWlky6IL5rCPWLvQ9YIe9p0?=
 =?us-ascii?Q?LNHUlgnGVplS60PFRWMF5ylbWG1KAtbtIGNuKRd9IqJKb/qca7WEN/NUDh9J?=
 =?us-ascii?Q?gVZFMjC7gfsbvQUaNCNDNJwVFvECU35irlUHpOujw4suENUVkw18gx4rVodI?=
 =?us-ascii?Q?Qg2tfN3HZi1ZB0dWXFjGulclg6faQkTyOWljkZUP6ZE2oN3nYltiHkSH8AKP?=
 =?us-ascii?Q?DXymOr7Hnig0lgldYA7yI+36cB6fA47bccflN3osYoRbugWyTBQ2rNr2BoK9?=
 =?us-ascii?Q?h8lu87p5unvb3UcAAd/s0uliBaPv6BFTkWLDA3Slm4SqB+g0F8DQToS2YYui?=
 =?us-ascii?Q?im8uppf0fDEPnCLU3Yo2sU8/8OkMOIdw89M5jq/dJnBDh13yF2z93iYY2ec6?=
 =?us-ascii?Q?hwcHcLDOsPECInKHeY8uhT0sAkaixbozyhBsmTMaghsgyj7P5jcECt9UAk3U?=
 =?us-ascii?Q?npN7QaHmNUIy8rG2hcvaUa8Hxd58uuS5UJ8eftJWjzSHzPiS38n9fL0d/CsD?=
 =?us-ascii?Q?VK7NrJM9jaEiZr2x1KB3kD/ySfGLNgiX7UNiCb3AJ50aRlxNytrawouADmnK?=
 =?us-ascii?Q?djq4W8sLV/BAaLN1+MWFT3kR5sC+NV8sSWk5tmdpA48NhuKQuBSuXGNvfCNr?=
 =?us-ascii?Q?beZTIFlGePqIV13xXud6J6QoZYftYj/uTIiEyItrni3I/R7EWrENXks0taDA?=
 =?us-ascii?Q?FVfHKmpi+UNlxhPvGbnL1psPWGgwmOpf8oW8FaBoULxGmu70Ef0ObEkflM8w?=
 =?us-ascii?Q?BU9S0QyMjOELFmPAvEw0hq9qL9xoFviGGWuXMZdNnQZJuwGUVCym1/Tq8NJN?=
 =?us-ascii?Q?AnJifnN1dxzDlCHNWE0HiusFGDJCbXxQjZQjkI2hpoIxVmv6Ep6EoAVYc6Os?=
 =?us-ascii?Q?7oDnQz2qzVpjG6MnO4TUQx6DasuNlZJ3/thfEHgMeH67QUiRlnDlUGPdUBfG?=
 =?us-ascii?Q?3EKcMxgeURrCov3UdwonRkOMfrU1p+aKqEdeWD0srjE00kpzT+hmE2kHYUYJ?=
 =?us-ascii?Q?t37SCdwJ3xl3upIDmlBnnHqYCvBadxnepD2NNvjecqO35EUlF4YPi8rAtWL7?=
 =?us-ascii?Q?+baSxs56brIwEwaKMlgBUnCgkSkA5h9VIFFSV9jir+UgokkdY/o2ro4V2BhC?=
 =?us-ascii?Q?rWGseLAhntOJAaY5A9YbXkItDb0mtQ3tgn4kBrv3u0ELFbds5tia3y/q+UbQ?=
 =?us-ascii?Q?E2CHkfz6UyEf8nipdp0MueImZL5hGigUYCtmtOZQxf91gqrounv7UWo8YSB5?=
 =?us-ascii?Q?WMKExqAZyoG9KF05wjsmT22BI6cHnHzokrdfVw5vSukKm9U/gOAVkAisCptR?=
 =?us-ascii?Q?aFLgIasR6Q4GURrgLVup4v7U4ilNEi3/fxjwe8rbuqpFCvwut791SLKSbCwy?=
 =?us-ascii?Q?4IXZzahorTC290wf0kUCSWXiL2+HRaHWR7Bhv+MReuKLvi6XqPs/8hgrODaB?=
 =?us-ascii?Q?Kzfac1VajZa5S/zVf0YMvF6lXV8ydS4gl7epxtNdpORpQ8/ZSQ2rnopUnQ2R?=
 =?us-ascii?Q?xA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b566126f-5ff3-4c60-f736-08da76659438
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:27.8288
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EOPewZsdbCNxVldkjs49hgCvPNegaoHwqofL6Lc0J4S96A+YJcbUG5KZy1bKwLhzoc5Y80Wlge8qiXeVzuRq9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This is a first stab at adding serdes support on the LS1088A. Linux
hangs around when the serdes is initialized if the si5341 is enabled, so
it's commented out. The MC firmware needs to be fairly new (it must
support DPAA2_MAC_FEATURE_PROTOCOL_CHANGE), and the DPC needs to set the
macs to MAC_LINK_TYPE_BACKPLANE. For this reason, I think this will be
difficult to do in a backwards-compatible manner. I have not really
tested this, but hopefully it can be a good starting point.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 161 ++++++++++++++++++
 1 file changed, 161 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 1bfbce69cc8b..7279d914843c 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,17 +10,138 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy.h>
+
 #include "fsl-ls1088a.dtsi"
 
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
+	clocks {
+		si5341_xtal: clock-48mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <48000000>;
+		};
+
+		clk_100mhz: clock-100mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <100000000>;
+		};
+
+		clk_156mhz: clock-156mhz {
+			compatible = "fixed-clock";
+			#clock-cells = <0>;
+			clock-frequency = <156250000>;
+		};
+	};
+
+	ovdd: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "ovdd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	dvdd: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "dvdd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+};
+
+&serdes1 {
+	//clocks = <&si5341 0 8>, <&si5341 0 9>;
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
+
+	serdes1_0: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* SG2 */
+		sgmii-3 {
+			fsl,pccr = <0x8>;
+			fsl,index = <3>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI2 */
+		xfi-1 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_1: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* SG1 */
+		sgmii-2 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/*
+		 * XFI2
+		 * Table 23-1 and section 23.5.16.4 disagree; this reflects the
+		 * table.
+		 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_2: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* QSGb */
+		qsgmii-1 {
+			fsl,pccr = <0x9>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_QSGMII>;
+		};
+	};
+
+	serdes1_3: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* QSGa */
+		qsgmii-0 {
+			fsl,pccr = <0x9>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_QSGMII>;
+		};
+	};
+};
+
+&dpmac1 {
+	phys = <&serdes1_1>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_0>;
 };
 
 &dpmac3 {
@@ -28,6 +149,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac4 {
@@ -35,6 +157,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac5 {
@@ -42,6 +165,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac6 {
@@ -49,6 +173,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_3>;
 };
 
 &dpmac7 {
@@ -56,6 +181,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac8 {
@@ -63,6 +189,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac9 {
@@ -70,6 +197,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_2>;
 };
 
 &dpmac10 {
@@ -77,6 +205,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_2>;
 };
 
 &emdio1 {
@@ -142,6 +271,38 @@ i2c-switch@77 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		i2c@1 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x1>;
+
+			si5341: clock-generator@74 {
+				#address-cells = <1>;
+				#clock-cells = <2>;
+				#size-cells = <0>;
+				compatible = "silabs,si5341";
+				reg = <0x74>;
+				clocks = <&si5341_xtal>;
+				clock-names = "xtal";
+				vdd-supply = <&ovdd>;
+				vdda-supply = <&dvdd>;
+				vddo8-supply = <&ovdd>;
+				vddo9-supply = <&ovdd>;
+				silabs,iovdd-33;
+				status = "disabled";
+
+				out@8 {
+					reg = <8>;
+					silabs,format = <1>;
+				};
+
+				out@9 {
+					reg = <9>;
+					silabs,format = <1>;
+				};
+			};
+		};
+
 		i2c@2 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.35.1.1320.gc452695387.dirty

