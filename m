Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE8B85ABA52
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:43:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBHW3zpQz3dny
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:43:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=HChhU5pg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=HChhU5pg;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB984zLrz30Jq
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:04 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GhMi0Gh8UKhgduShWjmKTEjqp48r6DCIoizRkLLmt7AITkbcpiRweWb9PZqOvk6Tu60poBK0PCNsW/KcEtvyZenqFwpcGKWpn1v5oxijz+sNA8hQsuVDtvwZM2IxYB008Ra3xwtUwTXn+zXr7zdwHCqRX7hlb9XxyOyFttZqAxcj/66NsG7o1xCJnbwU6FE9LohihJkcuy+UgkgC8UaZ9Mt4KtQPwfIXT5p3A5B6PpQNCBQDC0x+uOSCesgdcnW2S23zfxjzx8I3RsSoskYFgY5olkbCYgIZLl0JbClBC8xaSF1ZP7fXrfl5HSLjs3nNPXJEJ0H/xHHl6tuyWmzRNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJcGuRDLXkpqwjovwzHU15ijeVXmDmxdQjfWw+v/3fs=;
 b=hbzd07/ZNwJbOTKqsxeKPHn4KQHjh1tKlGnVKJMbOz+mqWqRvMkpn92Avfa59JgyST/gC8GGFH+aSM5X7IB+vMIisPFX5sSOZbMn4yrpjDJdi3eSqtEuTDE7UjwtlOx7dXZtl5T3MV5KJTg53oixsqSyM7B5fOTmtKzoq9ZcO1sp+uUhFPU9GgomimecQXPHDoa1H1Y9bdBQ2sjId0hTr9RhToJiVBKRGuE/Okee9yccp5DBPlJKIx9MGRNmHdWGK2YB9AWuJNV/gfEDfjc/E8jcNCjmzrQwf8u2PNsYETN9Ol3KolKwi/AkKN84jSZ1esXKwZqQuCcXBp921TvFUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJcGuRDLXkpqwjovwzHU15ijeVXmDmxdQjfWw+v/3fs=;
 b=HChhU5pgOje4NrBdeL8txOej09ntd37Cd+T5J56H9ncZaorPEZwN7J/4msjHkw9PDLAbwF6KI54nO41LcAhUpy+KIVQaoSeqcUGaizOmMxR1XOaYTyvcAdBTjpXlO+f+lxQ00PNeLV8qyh3TycGY6aeFyvO+Oj1YczV6Vpw7wTPRlZnl6OI3JRWAiHJAry8+Z9ABDysQv9fiHlg8dwt18CQ5TZHKdonp+C1yB6hHTkXTo2npGTZBofHWesJGMrUQT9ZjH3EWr48m445oyOhuymu3CAJEli6BUtGv/n3vRNhBp24hitYox5mGJhnhaPaf8eeB+v1Jtz6j3KPZ5IFosA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:52 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:52 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 8/8] [WIP] arm64: dts: ls1088ardb: Add serdes bindings
Date: Fri,  2 Sep 2022 17:37:21 -0400
Message-Id: <20220902213721.946138-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1cf90d08-7ca9-454a-7109-08da8d2b6371
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	cCBUJWznz3dVvFfgTYxjLdFA7LqNh9o2DhhGO035PwJCYPztgD4FNzggnYdy64UJb7DHdL1cYQY2dBuBta6prhVGrqhwZdHhTZtrNDcXNlZ/0OD53cxooV5FVDFhM8nqNj5ih17iVFntiEOcTiOg2rkjwZ+90MMSiAhxSQAhkCUhGDZvYYnz2UOEqEp0Od3XIqAVBT92OLkxSHCwCJJg9kWhvPeZS1ljtMeRnvXJ39TwPrc0KsnUxy33G1BmiIrG4hRX1t5so0iHN/LpQja2Tsi7C1bpu1h1RkHy4YQ6pqPTWsqEqZa8G0spMueP8H9euYDmBzTo5zPkLSehecMvMh2Vnpa56p9+cXQ6jNdk6j7tVT9O3cg+aPvDmULo+mhY/qy7HWTFUAIpvmXHG1Y2k88jbW1vQPGCF+O3M1TrQ4MzHjbn1zDrUy3tkdZtNhlfue1L5ZUQ9srQqvuSFfZQclZefx61bCeXT0TRkEaiJTTuVTmtoPVtbma6MgeNdKaVcEHEVjzabWKQuBwi1HrPHPzS8NluKmFGR/YxbqIkC6tPGIRIkKxPt9N31xrrWCqmAeiIOJc8d9IGl17/JJe+TsKnX0w2xt5BGzaJw1YerS0HLA8suSfMM90jt2W3DBwvmmZWstWrV4tkUMWr8EGADtzmeXAkTr/tkgoshc/L5hdoBsA2yN40UA3AZRtRFpEzw4uxhdzTPMK6uOR2DBX90VbuomMsDVynGjTeYEX3plwmaOzlgN+PwXxVMBtWtZag
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6zCutHWbZlv4tUjh0kkUy2cGFhtil1bkaQoMfgWuWA4w2dKODrew/eQPYzny?=
 =?us-ascii?Q?3G5c7yKXfNgKNzVGh6v90FMrpon/BGewubGSKzKXRZHzt/LWWUMfg5QdxnGS?=
 =?us-ascii?Q?9f//99z9h45iROhfchfoIWHltWl0mI/p1vX08J5Cww9ZloKG4SFRGFPSOVNq?=
 =?us-ascii?Q?Tp2/CFNVuql4OKv7jdSvGRqh77PgWtv8TLgQkbTv2eLRj41rCoDwOdgLjiyM?=
 =?us-ascii?Q?gS8ltZNePus+8BU9QRPNn152MAXHonlsRLj5Rg8hzlqsgyJa07LFK/kCMbmE?=
 =?us-ascii?Q?h4yRYgfSZfbrMBYb4vusZ2LInWnGAzx2CPYH6W/3D7zxHnc0NJqB2JgiqSCj?=
 =?us-ascii?Q?fnaT7reWlHqM8rxerk5UgHeDzAn2ZcdporhvEd21lT9FaKYfHL6KqnTyuiTO?=
 =?us-ascii?Q?Hk6cbXyQBROILKc1nBhsH5hGv8Qwa91adEpwtvut+YDpXyzPcPtbs2QqTjpZ?=
 =?us-ascii?Q?IrmyxBqp5qB7Tbi4MFq1kfO1o6XShvDBhhOoifNAW7AkPh8Uukvma9uAYIJQ?=
 =?us-ascii?Q?1doYD4ZBE7xyLFB7TTVtIR4UECRLQXBWugDiltlG2RIB5e4hO7bt/aKhEZeV?=
 =?us-ascii?Q?60dMpx2QlBl+dVsw3E1WGuN5a4oK0By5ETa0o6SSqblTE9kwF81YY6sYFl4D?=
 =?us-ascii?Q?NsEt0GW0PkWSOzmj/LfUoPlSX13KCUM+bfRSJ7aTEIGOJhQzD3lauKk941jM?=
 =?us-ascii?Q?S3XY93P78zGWxtY7590vWBmlDr/V7/2BzvNBjc96VlswOiRDjJ9s0ftYBJOg?=
 =?us-ascii?Q?C4Lj88C/dUrkccZcXsXcbMKQzF1AbL1I//Jp8O0UXsxe0U2gHOCM+aClS7HX?=
 =?us-ascii?Q?66mWg8fWPU6s++I86T9YJCdTDdghJeak0HhFuXxRK5rwvamXuHatXoNP5dK8?=
 =?us-ascii?Q?GYLj370e0Wc653LtXqutG4479ZE8k3GZqkdlBjjRlZoE4ToCLouKc7CjW5Ld?=
 =?us-ascii?Q?74/2Ac+gBHMXg+S4XE4LFvqSpzBIlCwJmpqXI5BOWKuEmj/xjanDKmAeYkEY?=
 =?us-ascii?Q?7VgDUs7WphVwVk7yw5MK9CZsOBg0+ge28eH0v8j5a4M2fMmI//VwLEYjE4GJ?=
 =?us-ascii?Q?Ksijul1HXE/lXn/VkI0XlTO8dA4hIiv+LGVb6npfMOegjodXv03jtI4V1Wah?=
 =?us-ascii?Q?PhmnPZSLW4/5d1QK2DdZqZVT/aHxmHfCStY+PIgl6/KtZskT7twm1Uoumko1?=
 =?us-ascii?Q?xcGLV+qj+cXAvaaL8F9TjYtKMlj6kdV3v0J/i+TfYJA6UcnqzyR6vWcrIQnv?=
 =?us-ascii?Q?d+qX3vJfIdrxKicJdmvWShr4hssJxFzyYEip4hublMFE72fSDjKdoz6GtAdz?=
 =?us-ascii?Q?R53Zx+Twal008UG9QSRBupASxOkHedNasT3dXQUUfFj+Ko2Mrgfzy+t13CtA?=
 =?us-ascii?Q?Q+UJeCytIdpMM/tQr9GgayXuZswqAnE1Enlsb98MO7uvMXpuWmNJ/s3QvKNZ?=
 =?us-ascii?Q?sbdgpabAL3wI7Sv7di8AmK+hBGIOR724dZC7RPUGIdHZ4WWbE+u3l+6FKPGK?=
 =?us-ascii?Q?WtScKY/eoXaMQdtMqlJD6GiLcqMUNLAASaHHb9gdaIQWnAZJz9JJBbaUUUhv?=
 =?us-ascii?Q?nLJcrSLG57BZY01uSGmLnzOfiSKKTq8eEIyvSbuI/cDtiHARex1ibp3Ub8IN?=
 =?us-ascii?Q?LA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1cf90d08-7ca9-454a-7109-08da8d2b6371
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:52.0179
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ga1zyeyPfyJOSowdPCvlpwqjdDokShfe31P4mJ7lzzym1wLB3SCIb6wTwimWSQ8qRmKQ31FrIz92tH4EBy6dUw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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

(no changes since v4)

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

