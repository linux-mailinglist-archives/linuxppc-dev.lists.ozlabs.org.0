Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 36D386593A2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 01:12:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Njm0c0km5z3cfZ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Dec 2022 11:12:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TwFKYNnl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.77; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TwFKYNnl;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2077.outbound.protection.outlook.com [40.107.21.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Njln92Xyvz3c61
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Dec 2022 11:02:21 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=msFXItchX/olfRvNPArHvrSZMagh9WhbHdU68/gOvWIzTGBaAReHp2yhNyUEqXmaYixX9PUU7uUAWjOCCLM6/csAFy4Hg4qAmxN9LRqoUmAccgk7mbnmHHte8XBf4b82r3mP1CdMsSD/CpOoka3JklrN2sa058TsZ2IAzXuZooD4kN7BM6c+6a925uB6N/BgQZKjYVKTxQFrNn1CG4yHYZMkXS7JTBfzPs7bOcTN+bj4q/EOQMzB5k+zAq3uEIYXpIhVV+8CIybDP3PrgEzEsoHjGLitmZdyl9mxg3q8fhnCGAWyYXfBZKZXX3TzIWfqoNHeVKJ1r/OVJzhifPcMTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EgA+xGyUKhZul6yfScdpRs6xmUVEJ+3u5IzfiIhlolE=;
 b=RoFUDxQddA/x9DGnjWaICWolmpymgb/u6EwuH7gUJwPjl/N40Lp0DdhSSO8MFZwvbO9+CxU1DLVgGem51k7hc2bGCtpPv+tGaRWeo6OlyRnI+4H19b0jmAfIljTADhI4jeyq0azwqKtJxb0u0+uoi3FhWWb4yulqVkJHfORfKP/DBUCIpS9v+IHA4fcr9NWgD/ZTJ6mxEs5KsBEmoNHUia0FKY8Xpytzjgh6kR48184raKH/NwXr/VETfGBeVrpPjIwgNvOJEND/2ULQnPkqagU0nA6pTfShp0HAnsT/FF5IoId+KWJAs0iJPBYrIJbkK9KCe41/m0NmkiDZe6TFrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EgA+xGyUKhZul6yfScdpRs6xmUVEJ+3u5IzfiIhlolE=;
 b=TwFKYNnlDhT8mPFueJ/zVCaQo/27B0/vCZwI3+Hf3f8FrLIpuPbm1f8QWyek1Mats8PhTkI0KpxjDj0YghHi5gQ+8ylzcUWoN6bLWUoHT3TKPCQqFy05Yr/XcyxdVTMtRYGJ/3F/XV83s75KoJaZ6UEsPBIjACfvhFGwBkAvGaa+3tbtlEqlnf9ytu1jOEuiWyfOz2ePGCHlPi5T44swGx+vgUyIrWu6rONDNBdq2DbdFhnmXRvT5ge06hVLXIF57W3iRHzVEl1sVGg2V2VXvBYWVRUmbauI+DEysD9TSJILsevBhsFS71KqA49BOMcLtFsmfRneCTlwDHs7zBj50g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by PAWPR03MB9788.eurprd03.prod.outlook.com (2603:10a6:102:2ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Fri, 30 Dec
 2022 00:02:06 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%8]) with mapi id 15.20.5944.016; Fri, 30 Dec 2022
 00:02:06 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v9 10/10] arm64: dts: ls1088ardb: Add serdes bindings
Date: Thu, 29 Dec 2022 19:01:39 -0500
Message-Id: <20221230000139.2846763-11-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: 310a2a0a-7e81-49c2-d298-08dae9f91677
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ebK/N3IrU6Bp7lozKUye9HSrLCRBJvoClvDk3UGiaHlApglSgINmwqup1lT1yLpWTNXBdgtwfJ63L2OiSHSPiCvR86zxcWP8B7P/C3GNR2LmDfDwJtJCB/tbalh+sL2hGf0TL07IzDLwrE+GlTWxuCq4RufypeJW5BNoCIUnnP+nENYph20IcW2yGg1pkljCC83+jeZRjLTa/WfClNRXi/SXwENgj/Yy65mIIiknvyJ97gw1r8ibHd2OijXfmlB/sCtmLX23Sy9ylULw2NCKdYy2+JIS/HQSXWTzNBtRkH3iTqRKEyW0IUgGZjvM5JsWHOw2tCGB3gN9xGvt+ZKpO95evYkunsuJWzpv5+ZgpU6SesptC0hvzDolgWO8R6zHHClfLzW3ggMf1XpFUPFgffJVF5vDmVZ5kr77vj5/G445fjrxNgicDbZppRYcfEGDBv7KdgG1oed2p7bvQBzhY/1raEZDXpUIs0uxU72wLrYGVdnuIYQ9o17WFPv9b37WCaBykoqM2z3Qpb762s0Ha8/VMRU1NrYD5Xutx3+jfqYMkRBv7DOVZLwOjoFZbvVFT38WP6l4H5edNTFTHBKY5OdkmTa8o4G6/IWs3XuRgKv3UP91eQNqUmgbFJ9wMwiCFmO+WSCsdLi+dfpwRiSEIV8IM8K9v/KOY8sOpYkXw65A7K/p/K42FC+o7rFAybzFU1YOLPtStl9tyJFPug5Vow==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(366004)(396003)(346002)(376002)(136003)(39850400004)(451199015)(8936002)(83380400001)(4326008)(8676002)(66556008)(66946007)(7416002)(5660300002)(1076003)(66476007)(44832011)(38100700002)(6506007)(186003)(26005)(6512007)(2616005)(38350700002)(6666004)(316002)(86362001)(2906002)(110136005)(36756003)(54906003)(41300700001)(478600001)(6486002)(52116002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Da9cpYEYxtFA55qVGCWqORdK79PQCL8EE7MvffiCx4ItDA42VQiqczda4xv0?=
 =?us-ascii?Q?TtuoQN9UYHCpmUh2gCHXWMsqOPrc0s+PHpt/Eoy0gYGq1wE43PqJvrw3aM9E?=
 =?us-ascii?Q?A9tmCfQZ7hGLAwaW9lR2/SBtU1eQ6YANNAU3Lpk2FHJDr+tdEet55LtLXTlm?=
 =?us-ascii?Q?5yb0enI4eNIegWt47YVpBOC8cYfgv1jhvSyr8VBT1MeeUGRCFJnA6NpqaPwJ?=
 =?us-ascii?Q?FZ6g908lKj9k+xtUveKIqKbnFngwKrKb3p90bUHVgwYuvLxqu0CrdoDounCU?=
 =?us-ascii?Q?ILNJC65efZ9U6F4ly0tVj3NQfAH2/WEmaNShVE4m+kKC53Nx5a9OCd2oeEbv?=
 =?us-ascii?Q?WfWNIsD0CwM7W03An2zRZvVLLwerRFNhXFUxEHQ65JXOxS4SjKNxmDCV9Wa5?=
 =?us-ascii?Q?OcnMDNxSk0VTwg6E3ft2+WG5wwjDRLa+6LSBvpok2qjhZZcRN/nOWnO45xCm?=
 =?us-ascii?Q?RDv0Y/3EwgJ1ZtDutMR5dAUAzoAgA600JHEtSQl/daqY8w6mLfHsfA3Vg08b?=
 =?us-ascii?Q?p4U0eWg6W5vaKbgB1sHPEdvixOX7eWP/NRMJXaCGonzS6YAJqyOdcGK+bviD?=
 =?us-ascii?Q?AmC9U1gJKWT5WmwfkqixSWCcC251LUOj9x6g0NeVY36R938ojqEoQphRVWj2?=
 =?us-ascii?Q?iDJYrIZETjj+hY1s9AW4fIz1ytvcN7mmVg/Y5S1qa9gPRhQ0BR/kDBTiWjBo?=
 =?us-ascii?Q?u+6ZBHF40oiXqfiTlfO7t/LeSDscCq5w5xmHi9dHWiEkRJytrXkGIMJ3XrXI?=
 =?us-ascii?Q?ozE6ZnUEEDO3/SgZnd3VvlMwHNc06BYge66Is9HW8feLTt5KTgGH5H/1YPoH?=
 =?us-ascii?Q?9Vbr/qDhislpZRQSRLSDZC3QXJ3Io8zBIW9g2/uyTNHiM1NSDHTrlCWy0RRj?=
 =?us-ascii?Q?NmNTVnFXNT6PZ7X0HU1Y5pXV+xQNnstiy7NM/LTZOV6LERE6oup6xlszIpsQ?=
 =?us-ascii?Q?VUX0X+1JDKF0fxhNz5aB0TnBmKJJEKJ0xNTudha7Ly4GJAI2TYXJKEKcqomV?=
 =?us-ascii?Q?nBGAw0tyjJlRVHSJsJIAhn0c8Y6nbRv8AUEnlSSc0KBwW4UPuiTQ5nPHNB4t?=
 =?us-ascii?Q?E+wxYi7Ww2WgbOOYCneYTpeDDPDpBZfnaCVle1yB6B2TgUxgf0R6Szutw1iR?=
 =?us-ascii?Q?Y2qTJegF6qEia0jo0FN0ZASQaxeCa3zZu3gdEYaGIElIFFQPBko2QN8vpH0o?=
 =?us-ascii?Q?xPsgER7ZZzSQkHfG3e2VkZ/JEKmgqG8pwEt//bwXHxQIvTuY/l7KDfo/rOEB?=
 =?us-ascii?Q?5ixideuJ9aIqFQug3XgqZa+U6H31Ou4vuK7XsbnIYpT4rR9DShXQr9QPkDIF?=
 =?us-ascii?Q?D99Ak9USxgY4wgLpfgrK6kDA0+bN5tDITXty8fs5ENDrApUtymiXDLc96Amv?=
 =?us-ascii?Q?qStLr8wFjn4hgI4Rkoe6ImH/qJuPvAsgIj8x1NZlWbIizBxLn7DXdhosSOmq?=
 =?us-ascii?Q?tut2IuN/mK6zaYemLTUHdjtH/YjX/kDSBKBCNTzpdEeYavEf9DPUxPmSGbJf?=
 =?us-ascii?Q?WZWjXyuZZXUvQPPvvc+KiBZJn6p0iKKPBgGwcBiWckt8YgLnuBdmRxuNOw6l?=
 =?us-ascii?Q?ATXmTLuwQfrVtDu6MVGzthZWtHDVchx0gVjXjruxmLjprC9pWubiQT4erKog?=
 =?us-ascii?Q?QQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 310a2a0a-7e81-49c2-d298-08dae9f91677
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2022 00:02:06.0207
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iLGVc4OAZFxRk4gMqT1eolrQ8lNaTcBTa5/XUoyALD+Z5xtwFYQvf+0SaTqIDAftNbBwkbqEIerYghV468dDTw==
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

This adds serdes support to the LS1088ARDB. I have tested the QSGMII
ports as well as the two 10G ports. The SFP slot is now fully supported,
instead of being modeled as a fixed-link.

Linux hangs around when the serdes is initialized if the si5341 is
enabled with the in-tree driver, so I have modeled it as a two fixed
clocks instead. There are a few registers in the QIXIS FPGA which
control the SFP GPIOs; I have modeled them as discrete GPIO controllers
for now. I never saw the AQR105 interrupt fire; not sure what was going
on, but I have removed it to force polling.

To enable serdes support, the DPC needs to set the macs to
MAC_LINK_TYPE_BACKPLANE. All MACs using the same QSGMII should be
converted at once. Additionally, in order to change interface types, the
MC firmware must support DPAA2_MAC_FEATURE_PROTOCOL_CHANGE.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

Changes in v9:
- Add fsl,unused-lanes-reserved to allow a gradual transition, depending
  on the mac link type.
- Remove unused clocks
- Fix some phy mode node names
- phy-type -> fsl,phy

Changes in v8:
- Rename serdes phy handles like the LS1046A
- Add SFP slot binding
- Fix incorrect lane ordering (it's backwards on the LS1088A just like it is in
  the LS1046A).
- Fix duplicated lane 2 (it should have been lane 3).
- Fix incorrectly-documented value for XFI1.
- Remove interrupt for aquantia phy. It never fired for whatever reason,
  preventing the link from coming up.
- Add GPIOs for QIXIS FPGA.
- Enable MAC1 PCS
- Remove si5341 binding

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 162 +++++++++++++++++-
 1 file changed, 160 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 1bfbce69cc8b..d75cf52a7616 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,17 +10,137 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
+
 #include "fsl-ls1088a.dtsi"
 
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
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
+
+	sfp_slot: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp_i2c>;
+		los-gpios = <&los_stat 5 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&los_stat 4 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&brdcfg9 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	fsl,unused-lanes-reserved;
+	status = "okay";
+
+	/*
+	 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane numbers and pin
+	 * numbers are _reversed_.
+	 */
+	serdes1_A: phy@0 {
+		#phy-cells = <0>;
+		reg = <0>;
+
+		/* QSGb */
+		qsgmii-0 {
+			fsl,pccr = <0x9>;
+			fsl,index = <0>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_QSGMII>;
+		};
+	};
+
+	serdes1_B: phy@1 {
+		#phy-cells = <0>;
+		reg = <1>;
+
+		/* QSGa */
+		qsgmii-1 {
+			fsl,pccr = <0x9>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			fsl,type = <PHY_TYPE_QSGMII>;
+		};
+	};
+
+	serdes1_C: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
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
+		 * XFI1
+		 * Table 23-1 and section 23.5.16.4 disagree; this reflects the
+		 * table.
+		 *
+		 * fsl,cfg is documented as 1, but it is set to 2 by the RCW!
+		 * This is the same as the LS1046A.
+		 */
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
+};
+
+&dpmac1 {
+	managed = "in-band-status";
+	pcs-handle = <&pcs1>;
+	phys = <&serdes1_C>;
+	sfp = <&sfp_slot>;
 };
 
 &dpmac2 {
 	phy-handle = <&mdio2_aquantia_phy>;
 	phy-connection-type = "10gbase-r";
+	managed = "in-band-status";
 	pcs-handle = <&pcs2>;
+	phys = <&serdes1_D>;
 };
 
 &dpmac3 {
@@ -28,6 +148,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac4 {
@@ -35,6 +156,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac5 {
@@ -42,6 +164,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac6 {
@@ -49,6 +172,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac7 {
@@ -56,6 +180,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac8 {
@@ -63,6 +188,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac9 {
@@ -70,6 +196,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac10 {
@@ -77,6 +204,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_B>;
 };
 
 &emdio1 {
@@ -128,7 +256,6 @@ &emdio2 {
 
 	mdio2_aquantia_phy: ethernet-phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c45";
-		interrupts-extended = <&extirq 2 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x0>;
 	};
 };
@@ -171,6 +298,12 @@ rtc@51 {
 				interrupts-extended = <&extirq 0 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
+
+		sfp_i2c: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
 	};
 };
 
@@ -185,8 +318,29 @@ nand@0,0 {
 	};
 
 	fpga: board-control@2,0 {
-		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis",
+			     "simple-bus";
 		reg = <0x2 0x0 0x0000100>;
+		ranges = <0x0 0x2 0x0 0x0000100>;
+
+		los_stat: gpio-controller@1d {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-los-stat",
+				     "ni,169445-nand-gpio";
+			reg = <0x1d 0x1>;
+			reg-names = "dat";
+			no-output;
+		};
+
+		brdcfg9: gpio-controller@59 {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-brdcfg9",
+				     "ni,169445-nand-gpio";
+			reg = <0x59 0x1>;
+			reg-names = "dat";
+		};
 	};
 };
 
@@ -203,6 +357,10 @@ &esdhc {
 	status = "okay";
 };
 
+&pcs_mdio1 {
+	status = "okay";
+};
+
 &pcs_mdio2 {
 	status = "okay";
 };
-- 
2.35.1.1320.gc452695387.dirty

