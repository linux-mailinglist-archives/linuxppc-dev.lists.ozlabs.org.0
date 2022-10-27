Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C570610186
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:21:00 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywWZ346Bz3fB5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:20:58 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B52Nf1Kj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=B52Nf1Kj;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKF1wYGz3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:12:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SD7XwjQDc74dKGE7x4O9QOowuXUx6jNlH8R1JUuYXF3QyIUYDBu7OfeXMdmDyek10poUSwZaobQ1Vlr+IKP7asc/lLwkMrerNSDvb9cS/wwVrAsjkCQXxC+n/tVeM6sxjQe43O347zzb39COhHp2nl5nrRgwbMHJEJ3yogaiXm2xK2Etm16PtM5rwwR19aYhxnhx4cXBUSMIuu68+Fc4uiwAvPsqwtLn4Lq84VfXFdB/a4vN6FwmdpejRvEUXunE/KsvZNNxnoVPWHMmTSNxioH5u6tatA1NIOEsvzqt3IlsbRCjvG4W0NUFDcJcaxDj1uzTqdQ3ulsk/Ih9Jty+sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pbSw1foLbnuG6kHVdttirTvvrT0y8JYzpNi8EroVDw=;
 b=bZiX2uer21Zvb2CqqTeqc3S7a+5lSN7saELspYRzRD69s29kSRC/bfFD4feE5bWe5w8kMlNYlPWc22zrcrvI1qV5kkJAVRivh9paz20hpU+bzwuibGWkJ8DVXh95268jmSBNR2JtKr5gKmwjqcMe4XDAW4wxi8FUzIwLS5GZYGZ/6au8Vp3PSfaNwVIPyt7B3xo+ZVVvuK95FlZZ85CE9ZSquRX2VFdT2TywFTgbM+CY3YUV5Cb1hV2yQ4eG3ciOtWRdayY8UTPEE/wfSaQYX3r1yQ8j9ZqjUJYl0XLVNVKTPt9YyArGmroU5G8uFK8R8gHgMpotAZxPa79hTJzJUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pbSw1foLbnuG6kHVdttirTvvrT0y8JYzpNi8EroVDw=;
 b=B52Nf1KjQQ3aLUcK6s8gD6ZCG2izhA/oB9gNy29NF11aoxOkokDbSwU/rVCAjRufrFIr0X+QkGzRMKNQaYl23g90WNag6kTEs444rtsT5uc8k3vj0LTOrlE/RRNioDj8xrqIj0ydB05PZUzOOxnHouQmjCDt04luBzkTEmqBqF0HvgbP30EFGPw6yS7/ZuiDhC/QJyVlJe5zPIs3DKnGeSOZc0Y2vzK/b4hs0cifEajjgiQTSzqFNat5A8jDJdZ4KSH/eA/8cEW+UqHoqPI+7f7vPl96r+t8dfh85vceQ3RwKETDyZBg6pdt7BlRxX9GIg9pU0hI2GF3J/eXtdiEFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:50 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:50 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 9/9] [DO NOT MERGE] arm64: dts: ls1088ardb: Add serdes bindings
Date: Thu, 27 Oct 2022 15:11:13 -0400
Message-Id: <20221027191113.403712-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221027191113.403712-1-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: f3a35663-eb1e-420b-07a4-08dab84f199d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Xt599HsB1xRqyHg0e2+MQy7pz4rZHcYsktGCPpBC6mVQofPmminW66uSqBg52WxNA/0hncN8G3iSeiHJLGsyYwfUxRQgcz7mq2LmuO6S7dWqEguZjJdzHmrGHwpp3Hu3RseGk07ikjBd0WtfB67zfVMaEaTj9TDI5NZo57jBVdLpelO0aypiYxv4cCfhcF/Fr3772ui8hpl7vDavZxWRtzK5X5rLIDJ/IjICt/lMeckw9dKBZhzSmwW8BUQJm0S0cYi/ZC1vqUT8BLGIFw5v2ziLc8HSR4CksjWUY+JVyjKa/Uw6+z4jblqRl5ugKn5734P69PU+A3/QIbZR5Mc1AmJnPqlfNfy8QcN13aH1+NuyEreYBu/IBVglW9wmvYi3u591ofE++BI4wZ7Pi2HolXSQGfsPR+rCY84WkZp5s8dit0nYGU9etIBW2/JAvYTQvo6lMmGNA9gFtTbmiBni5TtR165AXPqbDZEkD5Q6WpkpBcl6CmP1rm8x3K6oygeZsDGLNta7cTM3+IpmYz9Vd1VWzguUiDYkLFugu1WffwVBZ4GDlKqom52y/hZyGQ1zqb5ah0zFEA7WjP0E2AblnbJSFKCBfgoA9APJfzYgC9SYNdumwbkVgGEQJ55Bv1wH1liYZM5ZaLe3ZvfgsIIlRLTR8ijTo5yNlUQ+d4B9kpVTiV+Gd0r3dyvd8VFiWCEZPeGJWrS35jibY6L+lM8qp2hLGesq7KovkkEustCiPZEwAESQDkbEORp1FIHDEQH8yNkkCb9RFL2KZGaUmZjMDSgFj/imJDjHhnM55qaXZX8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?ORM7fp0I5IY7eWM6H0oig8XN5jDM4eikGPH80qg3fdcYAfvYJQLgExonIzi0?=
 =?us-ascii?Q?3SgKO+CqqOehq6XrTgEBQsH6r4UNIpsllBOjPtvH1kAxUvq8WjsCh1gv7JHP?=
 =?us-ascii?Q?EmMN6pz1W4DQwa0UXKMnb5SDIfds0NNyUnJgNoWCML62qV8nVNs6kAcSAicm?=
 =?us-ascii?Q?zylOLp8e69d6mSft509QEPRFBg/nSysWJQZHFJcz2YOUqgov0zxSJ75LTVxQ?=
 =?us-ascii?Q?5P8Gqch+mrLmugnvf6K7cMsedRasT8llGVuLtoYkcINlUGtXeTu4zdbzHeZK?=
 =?us-ascii?Q?iY1u4BgDID96jxnApBQeKQFXdIyzMY3kODYUupCHvSYw3PtdGWGKRInRNiL5?=
 =?us-ascii?Q?zT2SUWWAXAfe98UcoPEbHqT0YoQwRryXCTJ30TqC8EmrlIcbcL4R43rhSL6n?=
 =?us-ascii?Q?Vl0QUKoOSAvfhEf07ibvODggVmGjOUeZCCeiD3le9eF0jh9dHUxG9uM3N6Ki?=
 =?us-ascii?Q?ApSGIwBKDdfeZmw03IOf3DAcavmhBEyejlToUPY3K3NXdH/OoJoDDl63AZ7V?=
 =?us-ascii?Q?dDxne/ncg/3GdHB/bRkb6yvAsYbfiWFTdAnvxgyPdBxj59/3c9fDwElNgjI4?=
 =?us-ascii?Q?YydEfieXq7QCAKGBPBJHb/uAzeFy/gqEPIr4jT4tOxVTWcHcbkKwAVtxT/Z6?=
 =?us-ascii?Q?9+1ftyM9wC+LEJi/qQg41PNundmr8SCS3UtAq2/8fWddiDW78A19ObozTRlG?=
 =?us-ascii?Q?rzvuZP28ChCAexpR1q5pup74MMYih6G+z7tr2JLjvFbAS73wb7BJUjeaYgEH?=
 =?us-ascii?Q?w5sB+tmGnHpSyzCyWEPc5JUdSGcx+WQm/E740F1lTTYGk/7UUcrfan/EGesR?=
 =?us-ascii?Q?jtxgfUWKnISNNTLCIIq8eoWllpmCdEt+wcucl0Eq1a+ajAlJmkPV2jgORjGH?=
 =?us-ascii?Q?EkC3EJ8ewDa7/VIEJVg9Vl9dHfFkx2HDhrHwur0c2vndgMuqCgniMdiymukT?=
 =?us-ascii?Q?wSTxAwtPzRq2MEE7LTKJiVhnocR6maTfsV3xlqRSU4xZ0RA4jQqIUAV4xjcl?=
 =?us-ascii?Q?IeyKbhcleBZIg/GNkntd3Lk6Y2UroWO8k5XERtcYgT783KDBpMajOHvtTcIs?=
 =?us-ascii?Q?ajMYU75I/EOuCeayGFBl/EXwW48VNrWUSfqtf8Bd2E6pdoy183faH4EYmfkj?=
 =?us-ascii?Q?T54yRlelW4kwfXalRy0O22pBus/TN0d46glKgfpyDw2OR38Yr6VJ8CohlCP6?=
 =?us-ascii?Q?RyDsh6GCjDqIAx1jN6nSsGXOsGrqGl0ZDVSRYtSJFLl5r9jdBigSPcujyLiA?=
 =?us-ascii?Q?cTM18gD4fiQz+GEHWSu2sJxpy2mMcYUuSW+cm0vDXeiul2HIQt8kfgkJg+9R?=
 =?us-ascii?Q?leAlfZfRU8dq/b6kuamgrO+byc0gEGF+ZAwqGzPztWJmmMyi/ISAXeFFkL0t?=
 =?us-ascii?Q?4pDMlStoguRAZEtqTwcRdcQYDbkN8fyWUoCgI2CWWoBxnm9xsObK7CgMwWHx?=
 =?us-ascii?Q?ay1LfgMfUhB2dTAjc7+7d0H8Lg2+OPXMo9mbtD0yxCy1jypCZqcbodTtTtMf?=
 =?us-ascii?Q?ObG7USnjAPfuyLYOl2gjBLxKlw4UJrxoRqRJZKs+3+Mm7LA3kbNYF9F95+Lz?=
 =?us-ascii?Q?6ufuLmQSsi1jrhSwhpNjhOTYn+TJQMwgna17Bzc33r5WwFGWd+Mzob0Te3jr?=
 =?us-ascii?Q?1g=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3a35663-eb1e-420b-07a4-08dab84f199d
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:49.9557
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U/JlBrgfEbLV+tbDF/jb1R/BTfp6cqg+bQCjZLD4sbigEs5meFJfdqVASZbnG5xC5XR8INx6ZatU0C+9csF1Eg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9648
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
Cc: devicetree@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
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

The MC firmware needs to be fairly new (it must support
DPAA2_MAC_FEATURE_PROTOCOL_CHANGE), and the DPC needs to set the macs to
MAC_LINK_TYPE_BACKPLANE. This will break ethernet if those features are
not enabled. I am not sure what the upstreaming plan should be.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

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

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 168 +++++++++++++++++-
 1 file changed, 166 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 1bfbce69cc8b..dac3337acbc9 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,17 +10,143 @@
 
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
+	//clocks = <&si5341 0 8>, <&si5341 0 9>;
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
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
+			phy-type = <PHY_TYPE_QSGMII>;
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
+			phy-type = <PHY_TYPE_QSGMII>;
+		};
+	};
+
+	serdes1_C: phy@2 {
+		#phy-cells = <0>;
+		reg = <2>;
+
+		/* SG1 */
+		sgmii-1 {
+			fsl,pccr = <0x8>;
+			fsl,index = <2>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_2500BASEX>;
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
+			phy-type = <PHY_TYPE_10GBASER>;
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
+			phy-type = <PHY_TYPE_2500BASEX>;
+		};
+
+		/* XFI2 */
+		xfi-1 {
+			fsl,pccr = <0xb>;
+			fsl,index = <1>;
+			fsl,cfg = <0x1>;
+			phy-type = <PHY_TYPE_10GBASER>;
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
@@ -28,6 +154,7 @@ &dpmac3 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_0>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac4 {
@@ -35,6 +162,7 @@ &dpmac4 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_1>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac5 {
@@ -42,6 +170,7 @@ &dpmac5 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_2>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac6 {
@@ -49,6 +178,7 @@ &dpmac6 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs3_3>;
+	phys = <&serdes1_A>;
 };
 
 &dpmac7 {
@@ -56,6 +186,7 @@ &dpmac7 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_0>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac8 {
@@ -63,6 +194,7 @@ &dpmac8 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_1>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac9 {
@@ -70,6 +202,7 @@ &dpmac9 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_2>;
+	phys = <&serdes1_B>;
 };
 
 &dpmac10 {
@@ -77,6 +210,7 @@ &dpmac10 {
 	phy-connection-type = "qsgmii";
 	managed = "in-band-status";
 	pcs-handle = <&pcs7_3>;
+	phys = <&serdes1_B>;
 };
 
 &emdio1 {
@@ -128,7 +262,6 @@ &emdio2 {
 
 	mdio2_aquantia_phy: ethernet-phy@0 {
 		compatible = "ethernet-phy-ieee802.3-c45";
-		interrupts-extended = <&extirq 2 IRQ_TYPE_LEVEL_LOW>;
 		reg = <0x0>;
 	};
 };
@@ -171,6 +304,12 @@ rtc@51 {
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
 
@@ -185,8 +324,29 @@ nand@0,0 {
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
 
@@ -203,6 +363,10 @@ &esdhc {
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

