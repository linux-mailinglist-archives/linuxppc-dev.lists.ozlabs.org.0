Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF8336DE458
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:53:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww2m6B8Tz3fSr
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:53:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g9itBuQY;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g9itBuQY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::324; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g9itBuQY;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=g9itBuQY;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn20324.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::324])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt31zFTz3cMs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:31 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=g9itBuQYXwBgEztxG6+t8VSKl+7BOoLrlRd9LGlsSq1dtOUW7eedTUPDb2NCFsskg8pLBtguiD5UbPe3rcEPo3PJgwZSHoEGYKed2wJahBdBA06FYS33qjIN/FfiNBAjWvhmQ1FIUOomk5g5r2HrrTrzbny3LhB/A8zbdbyoCmsN1OFo301jakmIxCRQEMUVrSpK2RUe8lB8K5BKVOuawQo8ZGNygO9SdJkW6Id6Y609m1ah2gb7jOZxTalk7nsg0+PRaoJyZ4XWwwBdlazgAe7AfLFtZ8aJQaj3J0TORz8HW5PTA7DxMB7XPFQAukCpLlH6iVNuqs6uw4S+MjekiQ==
Received: from DUZPR01CA0124.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::7) by AS8PR03MB7537.eurprd03.prod.outlook.com
 (2603:10a6:20b:344::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:13 +0000
Received: from DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::c0) by DUZPR01CA0124.outlook.office365.com
 (2603:10a6:10:4bc::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 DB8EUR05FT027.mail.protection.outlook.com (10.233.239.192) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:13 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B65A82008026F;
	Tue, 11 Apr 2023 18:45:12 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 248CE20080075;
	Tue, 11 Apr 2023 18:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nn2kFZZPWbUfzOl+9cwYJAEZ5MB1Ndcxq4BmBcMY4MwgSubB/fimj4hpbSBCiWTXsmXrhWz8QrPIbhF6xq6Fk2yx7+8Nf9sUwDP0w8BOkGfe7MHTSmFhlE92KFICmg7z0JQMjV1TiNeyRNGPrXscwv5PIjL6hl1j3ah9TC7r0z2lmliA1A7EGjdPsw3dGLFW36ZEABQH2T96G6mEQz4rc6Jqc8OpSsXW45V4s4vFhGZnSSyolNQ2xR/bakvfRlt2LshoEDtuTHF+/C9CueXaL5HQZvdAEFtAxV/bREca/hu7Km56I8zTWGjhkOD+J+iaipjeiNTjsY9Q1V7eoh05IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=G2Y3dzqwr2QQtA949Y1KGxgK1AClraX+K8sY+y2vfVLPowSwZumxxR9R5KCO4OWHf+CDG210nggwAbTpW/bZB8sOZp9WA8afMnjxW32jFr/ePtqh/hMM9QsRlp+RH7XdZRzpEZRVv9Wt3250zkY1/6Py6rrYWBrHdn+qZY4pGq0Mi/GisjrSXnQ3I+ldjwQ9Ud7kOas5dZ4ProRffc5hKRDe5OjcCB3ERbexTERs56xO/WJw5j29nRWIleWrGi262ued/WVje/mXdFYF4c9B0NzMI80C+lWdrjMJowadhl9pPB4FwAV/2BgidDZxks5bxf0EfP6ybNI7huDj+XIDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=g9itBuQYXwBgEztxG6+t8VSKl+7BOoLrlRd9LGlsSq1dtOUW7eedTUPDb2NCFsskg8pLBtguiD5UbPe3rcEPo3PJgwZSHoEGYKed2wJahBdBA06FYS33qjIN/FfiNBAjWvhmQ1FIUOomk5g5r2HrrTrzbny3LhB/A8zbdbyoCmsN1OFo301jakmIxCRQEMUVrSpK2RUe8lB8K5BKVOuawQo8ZGNygO9SdJkW6Id6Y609m1ah2gb7jOZxTalk7nsg0+PRaoJyZ4XWwwBdlazgAe7AfLFtZ8aJQaj3J0TORz8HW5PTA7DxMB7XPFQAukCpLlH6iVNuqs6uw4S+MjekiQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:57 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:57 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 10/15] arm64: dts: ls1046ardb: Add serdes descriptions
Date: Tue, 11 Apr 2023 14:43:07 -0400
Message-Id: <20230411184313.3679145-11-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|DB8EUR05FT027:EE_|AS8PR03MB7537:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e00c0e7-91da-4c87-9fdc-08db3abce298
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  p3zL9exg3J4gGmLgmBmkq3nZTMn3Txeryw9qpbHeU2eHcRa6okYVA7xBgZif0QJaexYTjepGGYFQHVl8avnLevybZriYsZOFP+Q/uuMz8GCPidSz/mbmrlQo0AeVETaYGgls8V1LASySRHBC3zup3GwzaKJmtHbkSKaN54NgBbkCzn+uR4Wv56t70CEGfTh1uOPr8ow7XUhZN3LjfJKTm0Ax9ZjqQNPn0YXGItP3C+04McIyfMaH2pJ8kZaPZYQsu4Ixf3HjhPP+6L0eM9zQNczCQxOwh4GrOg6KTYYFqwC6Q0kT32fz1tisDP+HFogCfPeU04vlzyNrKYrZHVrgQV2CjViRN1mzniz3GyzTWckqF3700OGQODD0H6ZjnXi6BTOoUUb7TkYsc3fbrT23acnSTU/UTWd7eFHVGgR3Z0YCkBcvEe1Zln9c+Jv5PZ+BN/4vFOrrnDp0HjFlXNer/YuRvEcrP8tviNtKFfJtOFyDDHa9X3QR5d0qOAmi3+G7VZm18yOLjSrKrTsK4v54x6e0RWdSIMOkfk8H5q85HOZyCq337xYz6uWSYntS/BptNvQqanMmkv9WWAAjrsbBOH1tIpWMiQsqHUvZ8NOXX2fyrVRLTv1Btz4d4JUH9WcK
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a457fc29-8e68-4dea-f94f-08db3abcd8f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bSPH7+D9hHrz1AXS9akzp/VTOvT7Qq4PJYIlaWkcGr29rdx+nqQh0bpAs79LUt211Ooh8yvPv7wcX34gnIYls8JpYJh96tJQb8Tu6XyNNQgti3SgE+HTTmmVMhVsu+uuCF2iwRaEZv0uWL6MS9KFFxaKOuPSon+pKE7Daxj6Oczj4DxNbHZykKC57pB/kb70sJqBZ0cGEtlsPes3XcE5Dofj7yhcKPu5Efp7n7Rm5w1crizEkmtvTkpBarWo5G21OzCWqMcD04Dm6R7wHXJ/NpGelsot4J3p1VinP8w42j9S1yKIvzN9snrb27zfLO9FtIwa0z0kA61XdiV549gdx3aBuxuFENwjlJGMS57XqTDWyXa2+ecY+oaNskl1T43fAXjlfi0/7q3R6AS4ra16SrpNGc2F/qG3IVAXIBVsicsI7xZYNQG/c3tEmDkD6G3D9NfiIJB70l4n3ZGHEwqdW06shEm/g9bmkKI9IDvjPDuqtjY+yH6+jUYhQsyOR0sVAR4rsW2VTvArca/m3G7e24m/FoEMcBGN7Uw8Rwfpnm2muhgbmA6brkt4w6CHSDY/wdc9cm7LR6gYhJHv+UGLGb0LC/8df6UFy7tleWd+v9w8aop60LuI83sRRnsm8uNFiIqvx5TcTAvjYOM2hOflE5/x/NypQaRrc/TenIE/V+tAXSn81Tn7hTGgVcwe4iIhjnBGm7oEyMxrAjJGVtVzouXNxhM/Lv0s/zigb9NlbzD9TZnZ3QC0y9kvrRhCIjOC//ZVBUZCKJVT35EP+1dkZg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(376002)(39850400004)(346002)(396003)(5400799015)(451199021)(40470700004)(46966006)(36840700001)(36860700001)(6666004)(36756003)(5660300002)(2906002)(44832011)(7636003)(7416002)(82740400003)(40480700001)(86362001)(8676002)(356005)(7596003)(70586007)(70206006)(82310400005)(8936002)(41300700001)(4326008)(47076005)(83380400001)(54906003)(34070700002)(2616005)(316002)(1076003)(6506007)(6512007)(110136005)(186003)(6486002)(478600001)(26005)(40460700003)(336012)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:13.2035
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e00c0e7-91da-4c87-9fdc-08db3abce298
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT027.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7537
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

