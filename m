Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A11DB6E11F6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:14:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4QR3hKFz3ffX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:14:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=W+RYWp2+;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=W+RYWp2+;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::308; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=W+RYWp2+;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=W+RYWp2+;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn20308.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::308])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gc0BmCz3fRr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=W+RYWp2+5UIZxObPPKeNxrxaDiLd+L2uIlwVIJFgntkaZUkJzZVFR/q5vji1+TNXpgqGhUB6oc7zu+7glm+XQEtRTUioWAwQdj0YqQcWQc2MYrvizXTwDsziE8m9Pmmif3t8tpORCCuViINr3PGhBUPCHg5dySOXMii7zEPfVMYD0xlhzPNNhUFITltnh/1K9Zk95X72x1iiEWrODyWS2hrPZjD9GYkFMRaRdjriPfwV8Lgd9rJDPzecKk8VarJZ9nuGeNthoE8Q0Gh+tM7JtpkVu99wd/ISRkuMTF9uTBAylOgHrvK2lU/v5B4XP0wpuuAyg5CZKsVzbCMHrIN/Cw==
Received: from DU2PR04CA0054.eurprd04.prod.outlook.com (2603:10a6:10:234::29)
 by DB4PR03MB9506.eurprd03.prod.outlook.com (2603:10a6:10:3f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:01 +0000
Received: from DB8EUR05FT022.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:234:cafe::8c) by DU2PR04CA0054.outlook.office365.com
 (2603:10a6:10:234::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 DB8EUR05FT022.mail.protection.outlook.com (10.233.238.212) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.30 via Frontend Transport; Thu, 13 Apr 2023 16:07:00 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B7BEB2008026E;
	Thu, 13 Apr 2023 16:07:00 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 112F520080073;
	Thu, 13 Apr 2023 16:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Pe9gzG7f6IYN7fGQbTO2BGc1TauvbNShFOjHd0RTg6XiGuX/hNm5uuHi5Hnbl2lbVwY9ZoWrBZnvK1POU9LdEkKJ6sbNRgNRpfoMmN6gbE/ToGbGnunhWWkW0URsyo2C17U6zbgqd5bhcjBGyhtg1kZ5R8XazTRuPCkuJm3gqAKl1sm5SaCzKqfJ8OO4udgswfTdI8ybLMKCOpi01LtlklIAaqr2pYBOpIZGrt+ykd/CpBpDLWEluvSAjcwOl+t8PXNsnuIAgzAbpH4l4xDhi2YhIXmDT284pl/sjEPyeBCJ2k6Md/PoYtZAuzIhALAKIvaOEQdIPfJR47HGkFpDNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=aQRlbD4w82lNhLfnwN6UEoRlBOfybiLxjy3lDUSeSgk9FbYqv6Fn6UAIrpuPPxb0vwtxEaz1FeKXXlDQYKmx/xpPgJRoxI7c6dGhTZfQ/5DqH8kbgkBfD6XfQwL6nbtUMOtIoqPiOPksxj/vu5m4U/JOAedQUEMbdXyxm6XGlyJVVAjk4I/X2+7KcVv5oZW0YtySmNlaYaxWWtkpDKKYxZGD8CqwCcsC7SJEfuHUB9NbnsFYQ5ZSfcyd1xyNaZlrkPi2xzYl4DwGPUZlZQ2Qqev5Nu9iu54fH4Nd6Zck6fqoiR56A06IvGgl5tZ2J8UMUxygdGQFxPyQ2H4xux1p7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=W+RYWp2+5UIZxObPPKeNxrxaDiLd+L2uIlwVIJFgntkaZUkJzZVFR/q5vji1+TNXpgqGhUB6oc7zu+7glm+XQEtRTUioWAwQdj0YqQcWQc2MYrvizXTwDsziE8m9Pmmif3t8tpORCCuViINr3PGhBUPCHg5dySOXMii7zEPfVMYD0xlhzPNNhUFITltnh/1K9Zk95X72x1iiEWrODyWS2hrPZjD9GYkFMRaRdjriPfwV8Lgd9rJDPzecKk8VarJZ9nuGeNthoE8Q0Gh+tM7JtpkVu99wd/ISRkuMTF9uTBAylOgHrvK2lU/v5B4XP0wpuuAyg5CZKsVzbCMHrIN/Cw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:51 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:51 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 10/15] arm64: dts: ls1046ardb: Add serdes descriptions
Date: Thu, 13 Apr 2023 12:06:02 -0400
Message-Id: <20230413160607.4128315-11-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB8325:EE_|DB8EUR05FT022:EE_|DB4PR03MB9506:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d283758-1662-417a-22a3-08db3c391d98
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  bIVad8sahONUq2Wd5ii3NGRsZKBWV4Tw26o6Atp+HyFkAYKRBloHSx9F3Ex0jI9nL8sY7g6saWbqlNl/c9wIIBvMExZUVMi1m6c3KjgrIMiFfIaqNSJ/5gVpM6iG076v5ONtofutEWwp5/CA6TMMQQREGBA0tUrGca9c0XjzPNdu1pbjAYRlX+U198PcK1CfZ2E/kcTGc+6rwLPtNGVZ21dEQ/up6E0Qke3zqAN+OHfiIfMRmAOQaNMppNNNL20js8IrEgXsuEAzQ3I1S8zTuMTRtlZwjkCU64hUtYkArMVot4LZv9wYlvHglygrjahwpWPvCf4csSa1rcIR0SKQj0KRHdGH0D7F7827/4fCjL++JVhd+V9N4q8kJt6+csLSHKD8zg2U08G1BXLxXLiVQSQI+39A3rJO5yt2cbOAWZTm2mB69fZGVK8PO25bwfSQSZQTGAtBNmHY9bJCj7tAn5yL0y24qmYfoouPQb0ggtz1cfSmYQ8H8G3Cv8iT1SKL7EdsLyf78zGGVZUGWD4eqjGzJhJSif/WR7vvbSsqy0O70XlucmOY9z9Ny/p2eMKTTScVSY5iJGpK1VqekuPADqHdeujvjrITPAn/+uqzjVESLV6dpFjqNnQqfskCpVGw
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(6666004)(52116002)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(41300700001)(5660300002)(8676002)(8936002)(316002)(38100700002)(38350700002)(478600001)(54906003)(6512007)(6506007)(1076003)(26005)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT022.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	f1bf2396-d911-48b7-0b10-08db3c39179b
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	8SIWQ7RJX4YQ4GBeWdNzDYuX2TTbkS0w63w7wnL2WIzrqGz+vu/vxwy3QtNP1LHXqRCuuD4rSq2XHb0TKIsvHhpHCY3cJB7sjcMRfZro9QShmJCDuj/4Ed8yd7HKvke4SF7aGLRXG3CNgjaRUDqLGB4mg+mhnHvHLVzTVjhW5TJ1iM4GnzzUpRHitf6tvzCNaJxnIM4N0LOZcReqJOyQ2rBeQoumZIxPwyD8zjSEI8PcCICuLDY+6P5i5nHFFnkDSicCjmMBe7vYx5iaAtQo/gUDqomdBW/CHmMR9swYeKm0iPnSvyPcZvW4WKQOYIiOB+9cjunwzYgObzdpx5PbUU2mwcKipXfwUJHJooD0YwpxYaJP5J0vY8+0YRplNHZ4uRi+YmOxif0vgnzq9Owk/NzP334a90qSV69P89l1R7FmQFjED5yu//QVw5jwxKz+06kajsimXSzZYF5rGAW9pnOJAPHgHHsDYNSB9EyumulPHVwYDYfCMcGi14UFCG54dDFZik2SjsoHl/gmTozNe5QLTE8SScyihJpeYscQpGhv83xIl6rII3sSgm8e9P2Dct4g3aQdxQBQQSorg4bXfjcmgfmhLDfGQTq8hGO+Yiuou2JEE91xJvT2/D3ZAAVm//cMrxfWtL3uJ8WYKKpw3NxctGg6m6uDlRz2VMwOFFugOHj55berW+Cm9jUEGwTB7iElsX5QkyjK1l/NqmMqjYhnRpimuMg1u+1g/Kf2ajw=
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(396003)(39850400004)(376002)(346002)(451199021)(5400799015)(36840700001)(46966006)(316002)(4326008)(82740400003)(70206006)(70586007)(2616005)(47076005)(336012)(5660300002)(41300700001)(34070700002)(44832011)(82310400005)(6666004)(36756003)(86362001)(6486002)(54906003)(40480700001)(6512007)(6506007)(26005)(186003)(1076003)(2906002)(83380400001)(7416002)(8676002)(8936002)(36860700001)(478600001)(356005)(7596003)(7636003)(110136005)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:00.9587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d283758-1662-417a-22a3-08db3c391d98
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT022.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9506
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

This adds appropriate descriptions for the macs which use the SerDes. The
156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
no driver for this device (and as far as I know all you can do with the
100MHz clocks is gate them), so I have chosen to model it as a single
fixed clock.

Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
This means that Lane A (what the driver thinks is lane 0) uses pins
SD1_TX3_P/N.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v10)

Changes in v10:
- Move serdes descriptions to SoC dtsi
- Don't use /clocks
- Use "descriptions" instead of "bindings"
- Split off defconfig change into separate patch

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

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 07f6cc6e354a..0d6dcfd1630a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -26,6 +26,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	clk_100mhz: clock-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk_156mhz: clock-156mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+};
+
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
 };
 
 &duart0 {
@@ -140,21 +158,29 @@ ethernet@e6000 {
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
 		phy-connection-type = "10gbase-r";
 		managed = "in-band-status";
+		phys = <&serdes1_C>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
-- 
2.35.1.1320.gc452695387.dirty

