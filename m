Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C0E265BEE8E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:29:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCnb3Qp1z3c2g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:29:23 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=rCxhvnJ7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=rCxhvnJ7;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXChC4ccnz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:43 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KQyjfbBVJhI1egbxzNHXC1h8FyBdZhRMFydzgFitQOHPsxpdlFQlAEA/GccuKIVknnq/yKP8c4T2MrAwgr9pqM4pCBhRQApzC+STS/AeI0jAzBDrpH8WPB1Ogx0uXRMhSEqtafEW5CkOdnT5c7GTrxrOQ+bWSCV7n/S/L1S4fK6d6DZcnsSqeSttRpxCHjQhRCDiKRymvCSuG9Ns9KEjBAVTkCPgeN81Khu7yCeH+lKClsrWxShDQwZl623UtwT8w2WE5VFmPZOTk9i8KY1E0dl5nOqxyQsTV522QT1RQjNI4WBZlQkKfNVcPYCuIFWj64QYMS4LzWA1SGCkTJsz5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzaBavZmS5R2zZZqUSeXNj3V8G/JU9dcurXFW62d+v8=;
 b=ERjKzOmBameDjOfUvF3+SI1DGfl75M5a5jGx8NdeDux4UFxQn5SLzIIlxN5yu0o3Pvr/2JFpWDVWLs5L2WEfiZjbPHe4W5caU590raBw+pCR42IccqniuDmJBhG6pqsVu4waX/J0lejFU66vUTnrYxOKokqPwGCHeu889rUMY2krMZHF3e/HzKNm0FGZr6j9WwGfj+rCEVJIyOH1LW4am5x5C20XbPi13NpeAUcbBUKGrW6DLks06n775juu+hKTLhAharS2TCRYJVprOXH2D8uF4J66cvn4nXhWQS5z9kc6B/ED09kk1V5pLIkS5NUi3xS/S48dWC3xFbf1dcoKuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzaBavZmS5R2zZZqUSeXNj3V8G/JU9dcurXFW62d+v8=;
 b=rCxhvnJ70WEP8xm4QcaTR0ti8ifb2vAWum/28CjkA5xdXOoGBCrGTcN38FWQi0z9l+k/rUPxs30/NDTHDvNWj6c2CqNcjmJp7L1hYLaYvrd8KHGU8ZwB5b20n1ReYrao/ntCJLsoemOziSN9118EroNeUOThzG3biKUPqnvMolm/SQCg6f5Wc26QheDYzGX6xJNv3Wz7R1YqCIPHnbglOCHr5wik9f5GAMEdNUkCyM48eaVR6hbXmXgwmyefC8KCfSAJV5ErCpnb8TmVfWAH9o129f9ZX3Lo975bklTic1j3ipFjZVTaXVprlDLsF0PR6KqJoW0bWqtJDFXo06MmSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:25 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:25 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 7/8] arm64: dts: ls1046ardb: Add serdes bindings
Date: Tue, 20 Sep 2022 16:23:55 -0400
Message-Id: <20220920202356.1451033-8-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220920202356.1451033-1-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: d408b4b4-4601-45ee-f794-08da9b461c63
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	7UwtiqTf45Izo4P6PpZ6vVpvGWwntUF6CTj8ESgumjfcn/P74ZHqFP3FuQp8gSmgNWGtVj65T2JtyWiWxjd2vO/3VboyaJTOz+MGWSVedoEf4zsQO8CmJZ6zYof5B2bnSuBQ4pkQ7LN71y692lm/v9SlGAU3b/BiE6ujT7DpwK4R4Iia+zSdwAF2+qoZXZiz/wxunrj8x20im2Je2k/UI4aX/ztwVzHG0+4y3QCMmpEtzRcxYMqjPOd5iAI3WRz9Auag2jeygeYMT643CDwcuPAy6AGxrAFyyp7mUVF4ACHVumEXaWcgReTJ1HFCmBtlSV4iecROYCj+eRWGuXGYWHdWjh4p19Awvj6PjXo7cp9gGdnIMb/OpnbjMygBYDFqFl+IuoogA5bNxlZ2Js1E9y8DIr1Wzdbe3zTnrYMfmVblza+LBYNmvgEHaKt7/sG8yZLOzf+hNtc4ohFdF15Hzd4jTCtZ3Jsys+9r/Bk8qfizVWsotnNjaWFtfE4nerFng5b2AySaKSM3+kEvIaJVqvASKZT9giMqFlBqXcg7hNMupDuHenMQU3Wd4cKf76JXyvR55NbCTdzPCDfeEmtZdxWIMVP/trh/8uVZxGILl8bR9SGSAJuu+F2u1ywHLANkPV4Jzw0awLVnkzSFahiin1XUum2inlR1odHtCgmAosYQCc4fnc9f+fAD0YlFXsiBk6fWIQ0PUAZxg+pzPDOf1fTpncFCMCsjHNP3MYIM8AprLxmV3dSzTYjyf9hDq4XYVEn0CJtsweoUkJaTnTUf5XZTpD5ke8LpV20jtzFVjOSoK/OSN5kW86m15KcfR/9X
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(966005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ozbRWVAUkXkxTTOcZLpDBlv63MULdtwB0esO5D6GtbKthGYRluwNsZPAT5HW?=
 =?us-ascii?Q?5ICudJDJfxKTW9ysdfy2PiBFiV9l7wkW6ZOIHLJkfTuFf9PkkdpDyBfn4ZXP?=
 =?us-ascii?Q?PBfAv3Rx7xApPGAX/17Ho9JIs3KfLkEu38WHnkL2r2fDAsXiJEwivPrQD3El?=
 =?us-ascii?Q?xNWg6lHTKLFyhxvW5gHekTvFFS+KKcTInAPNcdQ7AzcSzfWP4Ww1X2Mr4XPS?=
 =?us-ascii?Q?XSyfTtGEVtxSCP+uG6gcBSf6H1quLVdBAH3IPXjyIHgmlbJiGX/Ye6KdBYpw?=
 =?us-ascii?Q?7e1i9wGWKJ1fn8+NF39DMSkQc9PL1xgHGlp9fa7HGeiam3WtW51OUeEV9yNQ?=
 =?us-ascii?Q?brEKdP21t4NqVkLODxIE98tL3nnZgp7Nj4t+mb2oJpblFfCT+9Qh9svjPECT?=
 =?us-ascii?Q?5J2VSx0Caor2KTFlzibWXOz1rhQ6NnO64dHzFWLykb1sI/TKod97VCUmI210?=
 =?us-ascii?Q?dL97ZNFAfCluaLE1OryUNum2zelP4FM4pWCAUYqJy8ZA5RrWNNjbEWbeanZq?=
 =?us-ascii?Q?IPtGckN838Sy+OOfwCBA08wYl9eo+cP/8E0rKWBVI63K+OULwYchspc/IQKM?=
 =?us-ascii?Q?y+YPbLqlFavZnsdRKjl0DH78T8GepJ88U8IhY3fYcel3fkrazo6tVy8rMpWr?=
 =?us-ascii?Q?Qxeg/AVpCfGTWZPtvvBwzr+B26r4CnLW54IkJGWjg61Fe7+9BWowPav8ojOb?=
 =?us-ascii?Q?1HQNxydBrmPn2+NFpnmKj6XZam1KkWduO4MLP4XCOtxklXoeOKiBVNwvUjJm?=
 =?us-ascii?Q?ER8cPjQcv3iHuA1bj2C81fyklXLkrMT+tMQ4bN2eH4CptFjduguCd3hnBjt8?=
 =?us-ascii?Q?EQfBNHzKEX5MeXnob6RE2ZM4b5E0W8bDLMkSunQxG1G5WfifDW+wxLf1ZsPH?=
 =?us-ascii?Q?TJpJ0K467/gEP/P0M9jW6bcbO7kOU12IvKbOdLz0ubOKNJIZvWt+ckaFXhl6?=
 =?us-ascii?Q?0TlLu8tQ7MWqK3nVMH+UO/eWSBo2Hbk07A/PL0c2UAiaDcAUtd1oOXheogHm?=
 =?us-ascii?Q?TFI8M/3X23zEHBSaqvx6T3+dU+zK802mI1j8HDNsWK9RJBcVXyLEMmdddBFG?=
 =?us-ascii?Q?B33p/tUgbY+5X62oKUzBlDocJHiM9zxmGj/FxTQpK6XM8zP3hn7B5mtbk4bD?=
 =?us-ascii?Q?H6aJJhly84YY1uSdRyfqMgHAEIFtqRX960ewvP809F2hAQX8lAA6/zm6vPzs?=
 =?us-ascii?Q?QZ0I7ZWuGDd/Dnx3irQTzs9s9+plMP0LC299x/zkNbZmNV82yh7cQbsxur0J?=
 =?us-ascii?Q?FfNWw51vrLXhYyVqrUSVgGsm/Alxx7kbp/TOd5jWRC1EUO/uOkiFWNFjfffH?=
 =?us-ascii?Q?FbxS5Zrz/YjxCz2tvIJw0bstrCHD0c18tY3kJSwDiSFPZBU2t23u7YWl5cig?=
 =?us-ascii?Q?QFNtXDXETfaoOD08PENhOR6ftcBV3oTo+Nd4eThJ+Qk6gj2Iso5hcgVYw8XL?=
 =?us-ascii?Q?L0OI1pIuXyuTq5YT7wdn1DJj43t9jJwwiQ5iiqrJpNFXtfLuap0SzQlSPg8v?=
 =?us-ascii?Q?14jZoou8f0AngENbRrTGwL7qHzfT78iITD7tL4JsQf+WNaFXtXkrf4TW9gTV?=
 =?us-ascii?Q?YF1CEp+waWcM1TpzaMIYeKT1DD1LvIzKvnm7FvHIfgmqiD1ehTqykGR8ySHI?=
 =?us-ascii?Q?Kw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d408b4b4-4601-45ee-f794-08da9b461c63
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:25.4707
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZFSw3q5YJv8yyoek8w1Vfw2v1tVlVzpnQcvtvvslFp3rpxwRZSPqiOqdGk8jdn0h1FlMrIrChMnUUXlewUPY5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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

Changes in v6:
- XGI.9 -> XFI.9

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 112 ++++++++++++++++++
 drivers/phy/freescale/Kconfig                 |   1 +
 2 files changed, 113 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 7025aad8ae89..81d725a15e27 100644
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
+			phy-type = <PHY_TYPE_SGMII>;
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
+			phy-type = <PHY_TYPE_2500BASEX>;
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
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.10 */
+		xfi-0 {
+			fsl,pccr = <0xb>;
+			fsl,index = <0>;
+			fsl,cfg = <0x2>;
+			phy-type = <PHY_TYPE_10GBASER>;
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
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI.9 */
+		xfi-9 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_10GBASER>;
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
index 40d3bfb36076..30fad8dc4fcc 100644
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

