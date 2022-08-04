Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29AF158A31B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:12:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNHm6kN5z3fGd
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:12:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KactuDJK;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.77; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KactuDJK;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9Z0S1Qz2xHD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mJhNbKyeq26RvHxUM8Myfpupatk5aTo4IsUWHP7Ii65i+eYsYzk/AxK42kK/b8xH70hpU3/2XFRxs67McIi4Mp7bKaHfQ5EuWnATL2B+0ZAPC4qm2R9h/ewa/ZBMmCx3RVHqV0yJSI6YuYNlcUHyZlI54/XheH0aLpsJSVj+U+WkPbuXdBCAKjqRPnfiFraFmJye13VQq2ktDMJ3NYKBxJFKVOiPcDiVagYlZeePGaqUb1Y+WUcmFGXNkOQ43PnGk0q3I3ENy3tHIILyFECDnCUJv/VhiqJmENumVSAyv9/TqhSajUT3MyPgF3a7w0uagu2DCl4SU9hnqvT4bGfADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bvF+CPj/eLlyyZjf2Zzil/gKULCioBp37jPWZ6heAf4=;
 b=nshIkgR3QPmndD47KqHfbwu0QyB+huJ/A2wj2AAqRvPrSfoPfiOvSLkvvXlbM6wiOUekxhJHD81c8BwDIg3usUXqNcS2/GL8pDH+2+a/xtb+5JteTgyeQud8rW9EhL7dQvUU7Uf/zo+AIVLugpqfyNEX0R8kDbUIn6BzYBiaalJaK/QzIEFzayEwWI0Ns98Mbx8PT/k4RSLUESvzfzOfL+fTHJKQOUwveONVZcYnKcJJhp4bEkS8iAHg8uiWQIdv9UQidkKXb8CABe01r2bATH9Vnfu2GvfKrXBqms9OtRzSJVi96fwAdfskj1m4E0pXzUgs2ywrOrQkh71ZJpkagg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bvF+CPj/eLlyyZjf2Zzil/gKULCioBp37jPWZ6heAf4=;
 b=KactuDJKvpxl5s+HK4CA/4NxQfFViwkLgRZFVZ6zowQ3UrCZgaBUjhq7m0qssB3JimkHw3p1tMmGzyFSQQctd9wscICtqpuEwri5d4p/TxjPymn9pQYHeE8MlyFOw0NrJeQsp2rwdVr5HbzGLdlxYX3EU0HlWWqqZOjaugiqHuPy3gtYRsbeUMgCUmoces7dXKMNl08dh+dE+IlE6IaM0089G0D5HsjYSz89AI0aJ8r59lrtmF5MefS29zbbsbSR+UQVIE+l7bvoZvFb65ynowsp0EkmNJ/ckXonlYGnls2pPl2RqnHfIccmA2GREnbNDTLiOpeqRlwu1lGkTSj3Tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:26 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:26 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 7/8] arm64: dts: ls1046ardb: Add serdes bindings
Date: Thu,  4 Aug 2022 18:06:01 -0400
Message-Id: <20220804220602.477589-8-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: a8e19e34-415d-4222-b6ff-08da76659351
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	4hcC5eotmgVPADqx53FZZA7QQpvHnN6NxuDZ5S7W4H2Wfk3j9rvZt36/hrEJ8CXaZOd/+Yd1rIyyjysdT9szXGSDh0Wcrkv3eppJgkuEqVPAQ/y+cQuzBoj5RuTwq14lnqoYJ+1GUpBhAxn6ykm3UBlRW7h2KZZL1QPHtTBNyoOVBnAQZpSLYyMwVsdCfdkZ85MD0m2bTqnDm1sVkgS4JvgNPMxJZYqqgpMF5lqCCH9zkkFSflGfyDqK7/oU1p748Hb+5ufDU8tQ4SEDilqwlh6rXgGxsWk9cub4Cp9CdbfGDA6+kPqITxo0QTC+T/pQ38IUE8H/U7SBiIOTTAkkTkjnEX7bBdQM6EDhi0v3tNOhGbIdHg4pEFoiBUtVW5RvVfHbN2gnw42B+yOPz1WpJtk6Zt2ImRfum7PS+khxXvSO8pUknvjjUDehGWsQf5rEcsiVf7Gz+wT+k1mr4h9npq7OJjSIakl9iAfSiltyc+wKsv7jKkAHo0gjK7og8THawAr6Aq6B8C/Iz8PlVpQ9MB/Sv2O5jGlxCvueFH5w+82TMjpMxhUlk1+6P16q3myWPJBUT4N9TFd1Pk1FWUil+wq1r/aBPAW0ibsxYc6GdLF59D3HaNnBJFuKxZQnz3gmEHLXPr7mORqE9JNmUKfZl9gliz0fIyk327KOPVLBa57JqowRVnXF6F9B5jxh9HDAgh6x/Xlm8k9AylZu8l0hD3a+GWE70KDuM+Akv1HcrZxYerhov6oVoCN+7YFC17u4+32iceyoPihiG5UEFhbFHsbBQyoWjHoy4O3GLxpw+TRJQluGmiauLaDLExykpMaIXCz3EI2T2G+0fETTD8NRTQTzUprxPoM8TtjZhKeoe+A=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(966005)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?QcU5sBxYDJqIIiiaJqzj2PpwAtUrr9dyLqZ7wne7phjUUbRcFLSJ7pfuov4I?=
 =?us-ascii?Q?D91A4MNmKVrbkgGY8C+/1PFQ3IaLLP2Z603KNwCOpux0qHVjFEPK3a4oIPoc?=
 =?us-ascii?Q?zJU+k2H1glRqAAcWLyUxpAzHUdtHbfBpdVXB8naOq2mz8Shtt1KiZIcvuC40?=
 =?us-ascii?Q?3POfSGlgKsK0FF6Q2Y4lY3CJ/IMQumoat3on3YwDWwn0cuXxDQMZAmdoISx9?=
 =?us-ascii?Q?pVlzoPxP7iBPlrgGHoc+2KVQ1cVw+7rPsWuCZ97kzUzyrT5z5SvhBRYEmWku?=
 =?us-ascii?Q?7BVERLpIn6vffT/n16sxdTt0uXySYbJshfUQmxZSIo8ABqbSmzoj17Ds3F7T?=
 =?us-ascii?Q?Cz7+4V4PELfOupa+hW1Gn5pvmVzwXdzgbu2U1c3U4by4DR3Fq3aMkQgWiHHz?=
 =?us-ascii?Q?rm8JSUj+igVex47KLDyA6hp9ZpaPrhfp3VDZECXdP9T+NOdk+Ervb7exwSom?=
 =?us-ascii?Q?qSq7nRFmOM4nJjdKRVzKxxt8RaKz9hXYGggIIcPMLLGCobYnWeMR8bwQlP1w?=
 =?us-ascii?Q?K2aI9Cyuf79A0QkhBq+3yS+Ppr9W/scI+BnytSBofhWNUK+LswEPE1JiUwTi?=
 =?us-ascii?Q?A85KuFAo1INjIVhNkR3hNT6cABT8unQ89a2WKH7mxiF47t1dz3nEuIJxuMNr?=
 =?us-ascii?Q?tBIwUMPoZ7zUZ2Ct3wsg/sBVokJdwMPxfzQ6z3B0n3zgJHrqFlwpq5JervNb?=
 =?us-ascii?Q?1y7G9S7TQ/UuaXO3isjB10d5e2PXsj4gvro3qe0TwD2diEjOo9PK+IC90p1I?=
 =?us-ascii?Q?XRPkTI63jU0uERf5DZDvQwMVu6kzraOZZOO5okaILKbmW8T2snATYjBZa+ZW?=
 =?us-ascii?Q?uTMpwlT3kkR01GXAKUf+PhQNP+4YKqpX9BQhVWrsCUsU/eOUYNhHRzxKeXy2?=
 =?us-ascii?Q?kKCgk98ohFwbrMAmuVwW1kHrklf1XB+yQ6KjpMAxNqMFpyrVaaHrvUFCEsgK?=
 =?us-ascii?Q?1QPTEM8Im8JWgeuqHp5QQ8pYeSTGzGRo/d32ViCKSDrGuxr274vO1kaJaw0S?=
 =?us-ascii?Q?9QIpDXA7Ytk4rWqalxtXh0NzWiVE0aT4HOh9euNwDA9rQhsjipTe+2UJAzh9?=
 =?us-ascii?Q?w0XpAqt2RJfIWc0pKQykdugJ7/QTYelugJurtjjV9RxENBIdgvoVr7+9byKH?=
 =?us-ascii?Q?oaWQVncO11RcGaOdHTYUSP+K9eW8ozJC05L8seKdI47B1dcZRYJvKno4ecbZ?=
 =?us-ascii?Q?LHMm2Q1SPBtHPa0ZrkILv94m8UaZZn2JRUmeAwHReLCgANCWmHc+r60Mm+If?=
 =?us-ascii?Q?7OWgaqhPQkwhrRoGbmxmuHPtOa1lyNID+1sDhOi5Srqdzsj5ZP9WGS4SVhk2?=
 =?us-ascii?Q?Esrx3XC0M0+Cl3X96omM0BRugKxadZ+Hftg99MUZPbcRx8TUlfvGGAqOAx3y?=
 =?us-ascii?Q?26Px8EQBfgvz9lOS1crymGLvHsoOJfVvL8jIuQKJdP4dc2yz0TWFjmbAKqZC?=
 =?us-ascii?Q?kZ6Us19X9zccLSlpHWSblyr17jXEZZh4k5n0WisSfJl3D2OMxvZljAKPSJxI?=
 =?us-ascii?Q?eGlJHE81bGOkJW1DG9r7BI0TgM6g9qeb00pxmZjLHlg6DlHcKnmdMoTB4/2i?=
 =?us-ascii?Q?yxI0DjzA8t6bOfzTUwAQ8fAJHFDWkyVgEnKIOlzpahBDBj75e+lYiLoIbyzi?=
 =?us-ascii?Q?ng=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8e19e34-415d-4222-b6ff-08da76659351
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:26.2508
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unOBdQccy9sXbnrEE2wqPQ6UtCa8RdpQZRJQtmmFlNxjprEQt22JF483nGSu1VEyU4PcZVxykHtkomJjueAgaQ==
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

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 7025aad8ae89..a848556bd7db 100644
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
+	serdes1_0: phy@0 {
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
+	serdes1_1: phy@1 {
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
+	serdes1_2: phy@2 {
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
+	serdes1_3: phy@3 {
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
+		/* XGI.9 */
+		xfi-9 {
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
+		phys = <&serdes1_1>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_0>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_3>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		fixed-link = <0 1 1000 0 0>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_2>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
diff --git a/drivers/phy/freescale/Kconfig b/drivers/phy/freescale/Kconfig
index fe2a3efe0ba4..9595666213d0 100644
--- a/drivers/phy/freescale/Kconfig
+++ b/drivers/phy/freescale/Kconfig
@@ -43,6 +43,7 @@ config PHY_FSL_LYNX_10G
 	tristate "Freescale Layerscale Lynx 10G SerDes support"
 	select GENERIC_PHY
 	select REGMAP_MMIO
+	default y if ARCH_LAYERSCAPE
 	help
 	  This adds support for the Lynx "SerDes" devices found on various QorIQ
 	  SoCs. There may be up to four SerDes devices on each SoC, and each
-- 
2.35.1.1320.gc452695387.dirty

