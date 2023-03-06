Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB57D6ACDF3
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:25:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpSz2cpMz3fcK
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:25:39 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kclXiq+/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kclXiq+/;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::31c; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kclXiq+/;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=kclXiq+/;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn2031c.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::31c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGc34R5z3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:40 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u438zab4qoiJJtVGpcxRtVtryvOv9pQB4X3GQpbIQHE=;
 b=kclXiq+/FswDQIZR+oX3kDktbxTh1t2qRuqlfkW9m19phOvpYVJur+HBDWeMTp2OZ6GpsB1Sv05kB4G2l87EcnTSogFryWks9o6c5E2rwoh1PVu/HkEvhCtUL9ZJ+DK2w/Vw9XMEe+H39W/DtIq2CDUI4rCrRTXxI4tahQIlp2MEFpPc0h9VpJxowGV0co46mQgCFRYXeVNVaZepvh8AiQPVK//WGr9tazgApgER63AMq/d3w7YIQ96URAemi7e8PoKQQljEZuQWhhXWEtUkxifKE/GJtvfKbC9oeZJn5NFL4dr/vZmO31iMjUvDVz0rTo+OnMDeRgXNVH+SfNkH5A==
Received: from AS9PR04CA0174.eurprd04.prod.outlook.com (2603:10a6:20b:530::15)
 by AM9PR03MB8010.eurprd03.prod.outlook.com (2603:10a6:20b:43d::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:21 +0000
Received: from AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:530:cafe::c4) by AS9PR04CA0174.outlook.office365.com
 (2603:10a6:20b:530::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 AM6EUR05FT020.mail.protection.outlook.com (10.233.241.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:21 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 5EE4020080271;
	Mon,  6 Mar 2023 19:16:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 392DA2008006F;
	Mon,  6 Mar 2023 19:15:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lsmh/4U93hv6gSsvaZ/9rN3PYoIrfOsreonAQGIHC5KIHwSbHaey6lyQMYTROj4l1JLBd2RAm+1amDmtdc9Xf5n5zCIL9tQO3/u9XCb2FC5tv5EmLkyeS5bqoLaePZb1xFqc2RefFFv+WkRz/JCNwWdo5nk0TL/t/kDy60ELyse1zgwo46kQHbD2+w1JZUb7u6SytUImhyP8PQRbG7yAKcC/3kd1mTjrWPWK/cBBWE9VIEIfHjVwhoz4+I4xR24DpMr/G8qilpQ5FoA5SYuSqN2SlnO5jCLwhxf1uyYEmC7k8I0FlJ1XjZXV5U+EEhJvxO7Svd395yqpKr6mGIK2Fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u438zab4qoiJJtVGpcxRtVtryvOv9pQB4X3GQpbIQHE=;
 b=A/IphMyDkFkwds3kJEJode79yw5JJR8ZA/gPnJ1QezvbCjNe8PJ4dXCJ5gOa5KAIK/FjGbgvswWRgexu8g/nM66Vged6gmxgS0iDSGFgbDk+CYdE7Mt68ogpfh2nCkdq/WS6O5Mbzxnhs9d4caBcKwQ8eK5bdJaRSgfIyOgEUTRRG+nhmv1HHm8ni+qHi0d74kk4KjJzN8YgddWZRIQw44ZcxH0yODvwEkebFuRTPRZjRK2t998p930dM1rn4gElCGC03uxHuzMWldh3mmz7oEwAgx0vVUZkzrKMxpS6185SHSZ6bebOrOhoaqo3146ZQDnsP18oFfgIYuuNJcgBzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u438zab4qoiJJtVGpcxRtVtryvOv9pQB4X3GQpbIQHE=;
 b=kclXiq+/FswDQIZR+oX3kDktbxTh1t2qRuqlfkW9m19phOvpYVJur+HBDWeMTp2OZ6GpsB1Sv05kB4G2l87EcnTSogFryWks9o6c5E2rwoh1PVu/HkEvhCtUL9ZJ+DK2w/Vw9XMEe+H39W/DtIq2CDUI4rCrRTXxI4tahQIlp2MEFpPc0h9VpJxowGV0co46mQgCFRYXeVNVaZepvh8AiQPVK//WGr9tazgApgER63AMq/d3w7YIQ96URAemi7e8PoKQQljEZuQWhhXWEtUkxifKE/GJtvfKbC9oeZJn5NFL4dr/vZmO31iMjUvDVz0rTo+OnMDeRgXNVH+SfNkH5A==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:11 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:11 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 10/13] arm64: dts: ls1046ardb: Add serdes descriptions
Date: Mon,  6 Mar 2023 14:15:32 -0500
Message-Id: <20230306191535.1917656-11-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|AM6EUR05FT020:EE_|AM9PR03MB8010:EE_
X-MS-Office365-Filtering-Correlation-Id: 28b3ca3a-5b3f-4fa8-1364-08db1e774561
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  IOBRuoxeuLe45whN/JMyizILEVErRhMxz/xr7oGTDgjKkNNboqQ2luBEQ4IJ5KRszSXSvokaHBXqDD3qa4j73UgELbqL57BhXAPQ8NGpHvuTpcoETtXNld0r6i+Swd4+HoD024zecUWHdyjYzMRpIzs38vt4TTdSzZIl28lrnYf6t2LW7zqkj7M7vzg4eobYPyhNMv5VMyteIEVrzvxlZ70iG9eWkpX4/vH9UsBgeuGhWZQgYMpb3C5HJ6joTiymMmxV2c0vVVJYkCZqIye8BVf5MQoNBarpp/ixJrdjAvJR60ZoT5zmWQ1vFnpBO/+cLCUoeJ5x6XL7Gt2i8XQkwKZnCL/d2VIHgCseMSpDbhNP2fIBCdb9xodPysOaUcGwKvXe13Tk3O9tF1kMcS2yclrgMEmI2eMpqNX7spP1xIecVW1GQkufwQUqEj5ueSTmX+wRxPcvocNEf5JnkB0UORi4H/MBbvdIIP0srkIO1V9e+dFC302XmHEFn7GiWdjoOqVqfdJmUNRPB0XrUs5tDNk9IEco4Q3JrmFDHHlHbVgz/U7xqasBTrjsqa5d1QNw/XtsOO3RcLrshYpEQDsY59I+SLoUH+DNf793cXQHrLFtWBL58HBY5DmO7fol5Y8/TexRYF604B/ew6H2DTWXoVlWSvqREYk3aYTLIowQJUIgasM4wYpevw9lJOHedqYUhsN/ODlCFG03EqkcUf1KgQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	90a40a6a-b3f8-4694-7bf8-08db1e773f58
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	o3M8bk41dK7KN0nMwK9l1wJ1MvseOgXSJZe8Y6pye6sf75IudPOjxhDdaqNYDfzudAJ7lEe6Ftqgw/zKfwhcqNWQmJl9KMtiWnkl9OYU0E6VtekPSE+bNFkXysMmOZ/7JTEtwx4eCaagzicaem/3IqNDzLSCcKfWC21aVCSa9jzx7POyB3vv9uOE58ZeH6zyQDnmirQDRkC3PGHnweGae8N8eUbP9UJwlxmth3SAX/4y/diXl+2wlM7mznarWr1UvXx51O5iQ7DP/F+CgVVLR1EEFedwwupGtpY2mHjCJD35C+m9mTQMMKJ//g/eokDTxWBXpbp3Vme+faQErp6K4bnkgA7YDXgPDibl12zqkFMbk5IP1gtiL73ivWtbaZRxRR7bJExlK5md0cHkPqTc/JkrT3KFMUuFLd75qQmbhB8Az8N7bv4Qut1kbiB/g3CbsPS7TF8CrJ4ONuHE9WRZrKX1bnpd1glO7PSYCCA9avsN0IxAjhg51xnSXNqlqC5YFl7OcclluToMRnZlWQ3ZOzSIK+2l6yfvlfClD1SXkOdX5UeyUHkLqbnHxgjrcBxWGRn+gqGHI+x/J9ueabgKsHtGtjO6W6+p/SMA7Px7s+XmwrfHhIwcwt3sKaTKki0zKfpe67pfETe4GtR9lf4TunvmOYt5M/oQ+R1FCnNBoNBzMpXlA8hSDVHlJUkJgcL9kzMzNk788GS7Qdhe1k1DOE4L6uRnIs3hffQM1eBvZZy/AyqAcRI6Mrmt6HalePeG4h6OSO38oSMV/yDviOQ06w==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(136003)(346002)(39850400004)(396003)(5400799012)(451199018)(46966006)(36840700001)(40470700004)(36756003)(4326008)(70206006)(70586007)(41300700001)(7416002)(40480700001)(8936002)(8676002)(44832011)(1076003)(2906002)(5660300002)(7596003)(82740400003)(7636003)(36860700001)(356005)(86362001)(34020700004)(6666004)(6486002)(478600001)(110136005)(54906003)(316002)(82310400005)(47076005)(83380400001)(40460700003)(6506007)(2616005)(336012)(186003)(6512007)(26005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:21.6519
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 28b3ca3a-5b3f-4fa8-1364-08db1e774561
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT020.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB8010
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

