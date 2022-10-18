Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EB47603695
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:18:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsVCL23Xnz3dtD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:18:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=lZWO/Gc0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=lZWO/Gc0;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV462sBkz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:50 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dd6TCp5SoSuMr58AeLunmXo8/KqEqoxpHFRL1qEqn+UyiCOXZ9AVz8gLCM4fuTpZ6c5vlU/t60/fSKLZhwAzFVR5XxQFwOiZHxAC5KRTIq4GM8DreL+yxkoX3vP2OEkVpNSbyfPzIB1vzTCM0kSUOOkBMI0wTH0ZnZkzzvBF4R5zuXs/oWWj4qZQzBi9r5NTFNvFT6iGAkVCH1SvD006atX5ARgbtdk34VY9xChqmUn8FA+7qE+57drdKynt5nv4f/5+WTXDnuYQOBT8XYQ1anpNdjlIkM+1GsYyDcORQdnGE16YweddcFl4jdO3qeMVxxbensUxec9+CPGIA3bX7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nVno0eCXEjiERCkt74LI6z3yAklh4xF38QFIhk+Iqfc=;
 b=hZ12ZA5XjvuMo7VgB9dcmdb6jK2beC9Mha6rUCkX4gd8VAoekKz/8Efxv8bs8wyWNoi0mnL2sXXvoXgcmysZvOQhNnOrU4kmRlDGhRyKqgku2fx1gp0+x5nG4TQIZBk1adyJYC8ja0toJc6udk67bT+X78LrRQnkcvvHpRt7muuOtflRWQydKJUkGc20zu/knmJ/35iD1WHDnDCsUTcS86SYXaaeXYSstCL65HYCsNuCZYLVGTW7NoF8aWtomgw42/ZywJP8OV6p1T5fep71zsuuRH+4uiHHyuSxDbxDxVSpXAQ+8Pk7DSaiUrtervnlSLAeJQKV1nyF7NY3hXh17g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nVno0eCXEjiERCkt74LI6z3yAklh4xF38QFIhk+Iqfc=;
 b=lZWO/Gc026Thl2lIf1V71pDDsfy1ZzzkdBlTnzWuf8zk9kni453uUg6N8Pr55n1pKizNmmVoRmX+q67Nl2HsWu11r8m3fsSyganM2wFsM+ZJwvXPYO2IJz1U82PbgYoyH4oskRSzvi6ofiYPpUfJow+0Ayqsi2nKznWJgcyjJVYn1ozCmJ9yXCqIwqH+lsAXTcBwXA9OawolCW6V1Ya6TljSl3n1RqN9ZzQLELX8GZAAb3/7oJ/ncyU6v14SEMXiO/ChW4opMxjMsq1Vz+/pprP/gooaxnSl1vUrpxmK8USs+MRCKWVrtD5k338KrP55Ul+r/HKYFrux/2RtPCP6aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:35 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:35 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 7/8] arm64: dts: ls1046ardb: Add serdes bindings
Date: Tue, 18 Oct 2022 19:11:11 -0400
Message-Id: <20221018231112.2142074-8-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBAPR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: 78fd30f7-b551-4040-97a0-08dab15e1a5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8NGsE9/jP6iaaTqiPRPjkgPl4SYdFODOIhf/d1/saWJ/JRjeNl6mi4LeT4mLW/bcT1iZKfy7RZsTQ9JEsaEF/bV5pXeOMSYjimi+Kt09BbV6DPBThCNjerP2xTsZz5+fUoyahXZF71cvP+R1nlFjEitsPYRvwnlUJMzqTW5sn70KUbovXhu9PuSl7KofgurMTQrQeINRt+Wpn1jHOFXeWC9kgzeqsO2FHzXm5Vxr2a0lwywqLN6RKqEbgYldqXR7TGNehrWfkmjUukJxHF6LwfcCdAv2Wnht1hIyPkMhfX+DoS5tozB/mp4AdDIddbnRFnEzUNzMRmKP8OCEAi4rn57okcUYj+BGQtQVd1n/MA9LPRC7q1thvUQrOyWOHkNUqiaI7vunYi0OzE5yFsIIDQdhMJokVVy5CBHtYJilo5RHDC6Thbky7bm3LDdTodgPFFWRoyUk7nMUVpz6fUrSxYGBa63GR2YulCRhHlawNi885K4EAu7XedA2NFfkB8FKzsfz2GiiNQxyHVEbFtd9vmRo5cyoNpk7/V8itLml6bfWCnAOinporqVJGKLciL3X7iDSjnmWOuzHIzNt36kvILOFOQTOdRM2WGC8PuqvI6dBcLM64sow1V5Y7mU66JXQrlw4aANzZNrFr4gjcd4ajZ7qWhzqXnNoHAj37i/48YkbE94xtlF5Bt46vIkUMzgkrMUESOGZZp5BSWCd6ohyYka+PbsvaDnLtgeNHKu2vzdC5dnGE9/On831u9GPuDoS8iXM3Lt9ijBSpX6sYcdPizKVH+bIDDCwijCWDRJqnfixhUJETCuBq+uRQNr553un
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(966005)(2616005)(186003)(478600001)(54906003)(6666004)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?iPGiO1u7j+LOF8Gfysix9p+CHyh7GDkRHjsrMLHS0LuiK52+PjTC+gXB8BIw?=
 =?us-ascii?Q?gno5bORbr3SsFe0/EiF8i/2k1y2GMRdEnaupIH67SnlRqNTO73A1+V4T/+EB?=
 =?us-ascii?Q?rPQG35SQMOk4I7GNJRaeZOd3L4q68QxRYrZIbCX63B7VzromqJq13cxSHkz/?=
 =?us-ascii?Q?J3lniwqtAmFKdNViL8v5IVh9gnW4F2PY+PB9izeIrLth6dyvYkirYH4zDOm5?=
 =?us-ascii?Q?YhSRZdmRHiFoYeSIPi7TfuPgTqR6Vu2aTBzLXL+9vaKeGpvDfWeSyn2euH55?=
 =?us-ascii?Q?v2OZodLv3aL4tRwok2hFsaZjKCbfxwhOZl2EheVMxFD/4YAcCUPtG49SwuHI?=
 =?us-ascii?Q?Yjn29zFYxANwnYHT7h9dvT5BwEFCL7AZsNzT17gqBBHXgDLWbJEAhYUdg5Ih?=
 =?us-ascii?Q?ji2m8wCm9e2oo3OKXIcegmLqrTnOkPPJ6unVPKzFHPyg4UbgU1KcIWPBXFml?=
 =?us-ascii?Q?84zhVni8hYUOZabZ6XrPn+QnZeXHp49I47vBq4fTiNbYlf2RWsjXKF61y9C/?=
 =?us-ascii?Q?xGq6WIxM2Qz1l12M7ow6wM97mEr9znSzHOXxZfe5apexpEjxgpNRCojvLDEE?=
 =?us-ascii?Q?BxsjkeArilu51jJyvVW3NRFhqj+9zs1tu9vRppGR13uNhKG/LAQUUrzYWnv/?=
 =?us-ascii?Q?DsLHjII47Iy+N1h8preEkbguSbHPV+/QMiUpI+kAGcOqZazo5zSNw4qm1OKh?=
 =?us-ascii?Q?f4vyzIZ4yihVECg1BSTwSIh8yznSeq7JrP6BNhOkOj7RbsGCDXBVm/DEP0SY?=
 =?us-ascii?Q?/7bbFSsXx9Z535MolmxP0FlH5r84ZwCDfGftnncWlkJIHN0g98Ba4DbbWP7l?=
 =?us-ascii?Q?cKVBUO1X84cViNCEA+TzKqxNXfEQ9KKnlI2DLRcKpuTLZrqqjzUzKo9HX8aG?=
 =?us-ascii?Q?PdK87HWvUa8P7r5uh5M7cNhq5COjkBwxntqcYqc0wSOH/fMqYQ9PWWnqyelr?=
 =?us-ascii?Q?jVoCGzFaYxexIit1Yv9vBxvGPaSQTeCgHYPeVa970ur+86XEIE+HU9YXZLZ6?=
 =?us-ascii?Q?E06/ozC0XwHU2/oo8ySVzRu+TAPx7RP1zUJNfOMxHD0/xe403ouSIr097cXQ?=
 =?us-ascii?Q?PCUZvObSzraRlBBhr00W2WHlysEFvmpv/kalGwNmhLz0T7ZqJKk0N+PLRsKp?=
 =?us-ascii?Q?mGDfJpln6L1oDBmt60Yi+CZME3BH/sVaNmwnHA4zRPgILexQbSI6yJcqB85r?=
 =?us-ascii?Q?qQNYVQXkHMKpHWomLn1ewdWjn5TgpmarLUN+DOQv6DGbNeCurI40x04OmuEU?=
 =?us-ascii?Q?loxhaSDWT3dbX5tTQHSmVtVBRYiboEgMEBP9GHVMH/VSdifNT9gHmVo3gYgg?=
 =?us-ascii?Q?jW+hk45sUIQ54LpllzYnLud7LChnQT5jgzql+GacTwQYxESF4WqBrOJb/W99?=
 =?us-ascii?Q?X8Z/oMD3OhM2xW6B51+RId1k9RaespSPl8ITEgqAvyzzaa1ucnN5xiEFJ+l/?=
 =?us-ascii?Q?WASTKCed76vc38T0mTtUwfBSwz0vxdTES0fgc2LIXRqJ8Z3/aB7Si0XvxPSZ?=
 =?us-ascii?Q?X4TODHHUBRJNMXfEeN3KaJSzR82JrHMYEhnt/nDPsXYRVpPGjA2fyflcrRl6?=
 =?us-ascii?Q?R79L1aXQCGfSqwnUfA8PDmcn8XSLDlId9Z1z0KLo4ouyOAggJSfljpcPwDuo?=
 =?us-ascii?Q?lg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78fd30f7-b551-4040-97a0-08dab15e1a5a
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:35.4939
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oZc/4XVd/7RdhUQfTbt0YJ8Ah13erJYOnYjbcgGYGfFvpRA7tBIzkNr/ALqxB7EQgtLJdoURgxlKXo08rxSqLg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6421
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

(no changes since v6)

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
index a6ccccf9e39b..bcecbea72d31 100644
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

