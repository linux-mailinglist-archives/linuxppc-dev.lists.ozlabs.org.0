Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C098765939A
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:09:35 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NjlxT4ph4z3fDY
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:09:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Blmellj0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.88; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=Blmellj0;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2088.outbound.protection.outlook.com [40.107.21.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln831F9z3bhG
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:20 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyXQK53xOkxV+14w69JN2bAHBWjVGL8lNovOlKOrdIkcl91HLOBRBSzNKX3fk0havGAHal6rZcSZKnj9/S0I5k/qd1HGB5MGlsUxeR4ytkdvFyOkhi3gqFbQZy/nhULR6OfU/MqGaO8E81Bt4BrS7zgQdCUAT0EC0c3+dUmxxyqtWRDfZC+dcbAHQ46aw8uc4cS5xkPwMj/03Q/EvZDRA5bKzRTWr/2Ls1W5qGtQQq/RfBkC3IIqq8WTbn1TMDSvgZDQiz7pe4cN+YlVKhrT9RSrwxmGYYJuJL3iRhy3E0hl4WszOn4GBoHIvbs+YKQyxVaN4sV3FCWiqM/Cy3mpxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ss4qE5zrYYzG97ZHWTTuWmTqjeYEzIGtMjzy6muwERM=;
 b=bYfbQZy5z1XthaDEU4E6HxShSoyf5s8xCY0WbnLRDewDHDVkRe1kWPvOYOrjLCdYQBrKw+D14khJxcn7LXgZ/HN/3rO5AwN5OCV0R4KSBCgBzL54IN8eOA6N+2LJgu+SgvwZ455YC9iwoOF1y0rX+EofSPlFFLDXN4mDPi8wWffqUoq+VWpKgtZENXmlj724FTtdgZ0ij/eDGlDnKoYfdl0QPN0o5ovbNEA35XVkuA20UlQkcSMMbRItrwMLhCOiARpBKe2JsPfyfdkwrrxcdUqkY6irkS5vTWM4ewx+tsanpyaA8FGxvRa85GxNqSUsffciF4c+SAz/BDLuxsl4DA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ss4qE5zrYYzG97ZHWTTuWmTqjeYEzIGtMjzy6muwERM=;
 b=Blmellj03sdfv/KRtE8ojC84CbQfb6fcqGNW5dOUY21XJLyR8AIZOQ8vBFWCU2M73uhJre1NfB5+SjJaQ2zhfwwhfWTbKR69Dq2Rk08Kp7ly/GNCUgrS4m8dZ6vhXjkiP7J1eDNPv1zfrl+5S/hjez04BoqItIxAuywySPq6E9cP5TiAwvktl0wPydTKAJ40c1WynRRmY83sjzhteYRCaCCGQmowmaoAEAfwDD5xaQX/LfcXLI8FrCxoraVgeyGLOI4WWNnNstySIz6ai9perkwPmDcpVdL0sw2woarO57D7wQJeRXFFkyAcoLN2auuN7CxduxNd1YC+9uypwH2W5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:02:01 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:02:01 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 07/10] arm64: dts: ls1046ardb: Add serdes bindings
Date: Thu, 29 Dec 2022 19:01:36 -0500
Message-Id: <20221230000139.2846763-8-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221230000139.2846763-1-sean.anderson@seco.com>
References: <20221230000139.2846763-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::29) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|PAWPR03MB9788:EE_
X-MS-Office365-Filtering-Correlation-Id: 90a5ebc1-37d2-43e0-44e7-08dae9f9138e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	zIBucs2QKOylxb6jmciLwAQLvS1Q9p/8V481UhKnynkS0iTawIzbcMDcjD4epG+r9Lhsk4646lS7XkKl9JaZ77v7u+ZFrQ2GnKLrIpw8ODvlX4sEys/RBlHKs5omsjQWIN+14I5ePcdTSfaNZmBt4SuzRqNueuLsR4ZjPQY9NXeQR2ZQcWhoiwBvtnN21ICjY4lMhpad2b009yk0yaAn9z17X5gpN0n7PGfrojZ429XftMCSTrNacET6AvbGhfWsR7vTlgGVngQddyvqALAmQmMJi7yJFhkf3498RzI3ETc9CECIEYzjDMzOaVco+6CGJfC0TRvUBtmnL6vhD4QX7rUQ6qTE06HxYIBrgZl4wu7h4Uu78tj08n7vYs9XNS6ekZwx0g8TQ8WA7Mdt95xK6LEfpOyKtAIvraPelL5Ha/N7S5o+7nKUASp/iA3kUmJ84y869Sl57wavQ5lgDtWN5xF1pySXn7a8EnKPGaGucbSmkJ+EpnY7lqteLjPjj8GVqFtBELLPvmJ7+TunwhhyMRsnKHecPY3Z37GMQ9AW3ZKHER8kbOcS919A6URTCL9wJk3NcSPLQc1EffX3PmJ4tU68vTY2d4n6YnZFebiffMg8/tslLlNr8q6q4pEphjeTkHJx9H1z3FIhIWmPnEBPJfSS96EbvcPsIfFlDCIVVFvpob4cesEFiHlGlCeCLhXM9WFggNW0+JtZXMXFFi52uI+MdMtrjof1OPKAd7GagrQIekjC71aIDTk1LDU77w8Y
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(966005)(6486002)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?YkAmMkNoka4gBMPe7uioKVXKZXoQ3TGg2nWaLd8v32aqwlH/0xpT9pkcVRQC?=
 =?us-ascii?Q?SZxbohxzEfcjY3ifchpXoCBf9dB5StEOFgiUuVTIqSpc1zBXdLqmk6oonDWj?=
 =?us-ascii?Q?ZO42t0GhBAMsnHE7AppnGPpuzeFNzZj52BHs/QQoNShgtt4lG9QhpdFHdI7F?=
 =?us-ascii?Q?QLxxZynRXHIQvhESZRKJUtkBmCqmnpj524eEQuXpF+7jLWkfEwCmPXmmL7on?=
 =?us-ascii?Q?kSfXx1AQG2Jjt9pQdZu0Buzo8u8tgvKmMN5BAYfz+k/2mCDMOafDFsNfk0Wh?=
 =?us-ascii?Q?LJgfNbTa20/MCjU/dceMnEc7bWOJrlBcXiTcQwUZsJ3tvSzA6AWBjAqhS5UM?=
 =?us-ascii?Q?5xsbBGxg0E1HH9XkA5lYGnemRVR0xYmprrIrrPBkO5kaewVYNUBxvgj+nEMj?=
 =?us-ascii?Q?q5w9gjAyOfNyMveaQviOKcre/pKpVcq2nR1ZLTpnyw/qJi/ONI3uWCirVjdD?=
 =?us-ascii?Q?C5EpW6SqgQn0BFHOwGr26pXGbQEdUg1ENm/Y3/8tY/tj7Pi8a37VyHhJ2Pc3?=
 =?us-ascii?Q?7C4qhbeO8r4dxIg5reFrYViw56CwbToePKgTSqmj2PTcgiEYZRzyGkHLqJUr?=
 =?us-ascii?Q?NbPIeV3xzRwasYrHmvH9l8DuMFLTEgX3x5duT1m73Gr3TyY+K2l1SWAMiyAg?=
 =?us-ascii?Q?HP+E3F5G5GmuAO91TgtaOGvexv+PjA0r/noIR3h9MAyo2ldhZOWDCB3OqbQe?=
 =?us-ascii?Q?XSCwP1ET/qQUJ0ywsMMlcbhDQMOFeI6ocjkrQJG+Lxi/X4KOY37UegH90U7h?=
 =?us-ascii?Q?zX4WfCyEIdz6KGrZAC08XKj27fseLuYODmnNRqcTWH9cqAJEay58W6tybqwC?=
 =?us-ascii?Q?FW0mHsigOxIgmvDImPSmdZA9RV2iYT51w9i1GfMmlqbwyj/DBRLJtRaQ0pvg?=
 =?us-ascii?Q?9S/UG2bbE870gZv9M4ZHwibo1y7cJRgAwmNlrkWfe0SgehfXozWxap+Fb4Re?=
 =?us-ascii?Q?Rs/BParvcPoa01meyAIYc+3oYn03DbntGDIKJL3/YaY65XRG3NSldEOfcaZl?=
 =?us-ascii?Q?nFV0aIS+3CKGH4ZyWPL/yAEZTHFq9ACBjWY00cjv6koFIIFf7A3rqEzmMQVn?=
 =?us-ascii?Q?XvCtMT07YL/XcaB4dmtmK1oP8PYMofuYAv6nRIdCJ8jPJF+cBnIAGrgedarw?=
 =?us-ascii?Q?klMg7ixuw0/P04QNEBlORdwAC24sb7IacIZ71v58qyJLDwiNFfxQtK70xg3Q?=
 =?us-ascii?Q?5dFq6CpRR7but1wl5fu20nwTO3DX0o27EelfwsNNrF/xC4aHAyU6OYp/q67R?=
 =?us-ascii?Q?MYk7tlJLP4UT/Sl20cUflyljUSWnW5R93cpmRliq8FqGj3YWIWnXKZcyDDIC?=
 =?us-ascii?Q?Do71Y2FH7WQrAg/XAv3l8Ap4hzj3UOXB7dqqOfUmdxnQFf5TMuJ5o3nBFdrC?=
 =?us-ascii?Q?5spDyHG0yWVMEJh53+gKypbbe6freWD+dZfmxPiY/0+/GyJmnAlm6VuDSVKO?=
 =?us-ascii?Q?rOeEh9pVB/hh425mIi1QBfPZloekScXV8q56Slz9p8HHS2AHk6tKbKZ8f9NZ?=
 =?us-ascii?Q?SZF+s5dr9TVZ5iIf0ZKrGFiWxi/vz5nNDf5MHrYn2DHHwDdiXdo5sRawhnfP?=
 =?us-ascii?Q?J3cT42AHrlGtmvDh3FeJRHp+F6iuMIqmgQLZlqDdHDP3xXQGWXIZhDMJ9m21?=
 =?us-ascii?Q?gg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90a5ebc1-37d2-43e0-44e7-08dae9f9138e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:02:01.1971
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: x2FdGRd5Bf5Dh123w9j27guJzV4U8yWqK3u70dzX4+QZ8kpKHthFkiX5Cty5KDhK57t36VMRfPbbBg91nNuvCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR03MB9788
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
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Bagas Sanjaya <bagasdotme@gmail.com>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds appropriate bindings for the macs which use the SerDes. The
156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
no driver for this device (and as far as I know all you can do with the
100MHz clocks is gate them), so I have chosen to model it as a single
fixed clock.

Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
This means that Lane A (what the driver thinks is lane 0) uses pins
SD1_TX3_P/N.

Because this will break ethernet if the serdes is not enabled, enable
the serdes driver by default on Layerscape.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---
This depends on [1].

[1] https://lore.kernel.org/netdev/20220804194705.459670-4-sean.anderson@seco.com/

Changes in v9:
- Fix name of phy mode node
- phy-type -> fsl,phy

Changes in v8:
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.

Changes in v6:
- XGI.9 -> XFI.9

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 7025aad8ae89..534f19855b47 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -10,6 +10,8 @@
 
 /dts-v1/;
 
+#include <dt-bindings/phy/phy.h>
+
 #include "fsl-ls1046a.dtsi"
 
 / {
@@ -26,8 +28,110 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	clocks {
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
 };
 
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
+
+	/*
+	 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane numbers and pin
+	 * numbers are _reversed_. In addition, the PCCR documentation is
+	 * _inconsistent_ in its usage of these terms!
+	 *
+	 * PCCR "Lane 0" refers to...
+	 * ==== =====================
+	 *    0 Lane A
+	 *    2 Lane A
+	 *    8 Lane A
+	 *    9 Lane A
+	 *    B Lane D!
+	 */
+	serdes1_A: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* SGMII.6 */
+		sgmii-0 {
+			fsl,pccr = <0x8>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_SGMII>;
+		};
+	};
+
+	serdes1_B: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* SGMII.5 */
+		sgmii-1 {
+			fsl,pccr = <0x8>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+	};
+
+	serdes1_C: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* SGMII.10 */
+		sgmii-2 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.10 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x2>;
+			fsl,type = <PHY_TYPE_10GBASER>;
+		};
+	};
+
+	serdes1_D: phy@3 {
+		#phy-cells = <0>;
+		reg = <3>;
+
+		/* SGMII.9 */
+		sgmii-3 {
+			fsl,pccr = <0x8>;
+			fsl,index = <3>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.9 */
+		xfi-1 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_10GBASER>;
+		};
+	};
+};
+
+
 &duart0 {
 	status = "okay";
 };
@@ -140,21 +244,29 @@ ethernet@e6000 {
 	ethernet@e8000 {
 		phy-handle = <&sgmii_phy1>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_B>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_A>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_D>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		fixed-link = <0 1 1000 0 0>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_C>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index 6bebe00f5889..b396162dc859 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -54,6 +54,7 @@ config PHY_FSL_LYNX_10G
 	depends on ARCH_LAYERSCAPE || PPC || COMPILE_TEST
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default y if ARCH_LAYERSCAPE
 	help
 	  This adds support for the Lynx "SerDes" devices found on various QorIQ
 	  SoCs. There may be up to four SerDes devices on each SoC, and each
-- 
2.35.1.1320.gc452695387.dirty

