Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B0156ACDF4
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:26:44 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpVB1f7qz3fBH
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:26:42 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dGx4DioS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dGx4DioS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe12::30c; helo=eur02-db5-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dGx4DioS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=dGx4DioS;
	dkim-atps=neutral
Received: from EUR02-DB5-obe.outbound.protection.outlook.com (mail-db5eur02hn2030c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe12::30c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGd2Bt8z3cC5
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:41 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRoDDvinI3bzAhNZtEHDnCdEHKTE8WBoLmSiBtr9wwc=;
 b=dGx4DioS7IHNY0VnESET17XGkCF+mpUrozXGQR/E9vgCTq08Y9srToFNVZ0LG2vwl5M93aW3PTMcm+ocHM35FuilYS0BiVcyjEZ18LPnoxXsJDYy7qLJfw9Q3o36M2Efh6wVmlFcp+rGIHzzLCEZ5hwBQgoAGPPdZ6WHXthmXXFYdq1oGPDo3C2/M41kDIA3mG8s84ZZ0glxPnOrCjAw1zRa+6NHQJAQkcqGAe1eIfJXnouDzdvAzyMrI877sZCZ/v0Re4iSec+CVVx/zgcmsuehKkKhzS1jl1+Lay9opeOQFHXFwNHcbLLfrVMuD1VWMrBzq4qDrq3vzTp5Z3YG6Q==
Received: from FR3P281CA0078.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1f::19)
 by DU0PR03MB9615.eurprd03.prod.outlook.com (2603:10a6:10:422::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:23 +0000
Received: from VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:1f:cafe::7a) by FR3P281CA0078.outlook.office365.com
 (2603:10a6:d10:1f::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.16 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:22 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.82)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.82 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.82; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.82) by
 VI1EUR05FT006.mail.protection.outlook.com (10.233.242.94) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:22 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 42EFD2008088E;
	Mon,  6 Mar 2023 19:16:22 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 1470A2008006F;
	Mon,  6 Mar 2023 19:15:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RUqnvXe6mUH1bBpjIasxEMdHbBP/iAKAVzpT8jmM+SmYfJ67yChiasxueS1AFD+NhH7g4b8J4FX44/7ANPfibddXlFHzszohaBUiU+1kJqOBUBCveG00nmubs9ef1FI5p1XvFQDGN/UFGsSMu2FuPrI1aKF1Vk5ilRw71J2re+9B+5EoXJiXjZCTHGwnc9nn3rrOo0tBmIb1XE0DtAZqyHz+/GBP+Qrr3KWwicdTqyMH1JBI7jabRQ2XOtbygmYLw29RymBDmoSGIPD7xQho4Ro5X5cw1cK2zO2Wo3yB8Kn37O/Txm/sLv94+E0t+kZjXAaUif33S1xeZNr8rcdAMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRoDDvinI3bzAhNZtEHDnCdEHKTE8WBoLmSiBtr9wwc=;
 b=DXlRqM5mrvAlU/qT9O6MlC1dnjVotbsaYYhe3MSzbmdzujx4uXndjNQY1mVjL3AilRRnaaODzKwMTeK6mu1kJtzb0IuKsxHXB8zeKAX7KQ1wrJtpMef7VDqlQuZU3RjUQLjVoHQBRD5StlcWrTfX1uIe6hHx91KPNwB3WzfzjkqopzxrsfgRspPNdt0xSnB0zWJY39br1rdJ3aacQdzZjiTSbpjNDf3vlF7J1eXuw8hwjubEebJzBMiDRJC/wUEwCnsfFc+7PUpGMo6FJNx/XRYJj2vlC23OOnyv5IT3xRtU0szC7Rm473sFfuOZsWbigG6BEYj4Xai9JJkFp5Kemg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRoDDvinI3bzAhNZtEHDnCdEHKTE8WBoLmSiBtr9wwc=;
 b=dGx4DioS7IHNY0VnESET17XGkCF+mpUrozXGQR/E9vgCTq08Y9srToFNVZ0LG2vwl5M93aW3PTMcm+ocHM35FuilYS0BiVcyjEZ18LPnoxXsJDYy7qLJfw9Q3o36M2Efh6wVmlFcp+rGIHzzLCEZ5hwBQgoAGPPdZ6WHXthmXXFYdq1oGPDo3C2/M41kDIA3mG8s84ZZ0glxPnOrCjAw1zRa+6NHQJAQkcqGAe1eIfJXnouDzdvAzyMrI877sZCZ/v0Re4iSec+CVVx/zgcmsuehKkKhzS1jl1+Lay9opeOQFHXFwNHcbLLfrVMuD1VWMrBzq4qDrq3vzTp5Z3YG6Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:13 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:13 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 11/13] arm64: dts: ls1088a: Add serdes nodes
Date: Mon,  6 Mar 2023 14:15:33 -0500
Message-Id: <20230306191535.1917656-12-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|VI1EUR05FT006:EE_|DU0PR03MB9615:EE_
X-MS-Office365-Filtering-Correlation-Id: 851a1cb8-f598-457f-8b1f-08db1e7745ed
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  nXGYLsktqeGC96m5Vn8yLHYG9AwVl9vbwAvlbs1O1g5ZJukJgtDOGtz1qSL/sMqbVaDvQUxyY7/qWLqtKnuNMtXhcAFZsY4pn5bZBl/0IHRN2g+inq3hhBlO7uXsqqJ9ebcbxl+HzpiIjScWw/cMU6p+R4uHyPC8xlf73n9n4aIRLXNOYkJxCNmn32uqCiKiSgbqVn0T3hS2ERVf+BHaWeWMU3V9p1wHLNKLzGcAH8pyTuy2PXD4YphEHKyMZiuLqc8etsWQb7/bawEJPHCgjw89y9uvoC5I7v+DR9E9nOFMhupP3Sll15GRhFRR98d8PNj8KqvB1l7y7c7HxyxgX/93fEC5hoX+xByUl/Yqq09okTgjXUTdYqZgke6Ns73RHDEMRfB7Sr9cgiYCZMahIRVyGaLpcVP17WhnSlWMntlFm5WXXRM78ZzxWkU/mCAabn1X7SJJ2jV/Lf7HYpk7AG4Bw6cBqyDkqXB5CWao3khjqrmfrq7JJBuI8fhd2MeCSTxat+V0kR0+VzLRjaSo4fGEe8fGz0i6b4TNw2hJtG1gpJtZVM12OLZYcyHfFT0flds79EXPEXplz5jxHM+p2b08uj2R9dGYlHZjRlBuXgrSgXlP7IN1YDfUP2JSzIGcul+HQq/9aIjmFLwTNiyFmiqnzNfcfHONIO86H372wt1bEhhnxYUD1h0t1sqt9YdTpQBkhpj0gIWPXKxvYCY1Ug==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	3e764f3a-1712-4bf7-ca84-08db1e774065
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	bLDTcmUU9MNdurVUK+AR34We/UQM25YFzP1toA/l8IWmQxdR+6/hKUDk40Gjd1DXFLI09fsERIdGu/Ttlad2zZjGDkb8OHftFORa1Srkd/hNX3C95VfNiy1sNZZKlzLaP/xCDFqFz0P4JdO+rDCMGa7/FCnLFd87yHwu03uzMyD+oYs0EwDVuiZpq+jt1ZHZuEEquW41vUPA+217kIljOuUtpjhTwIzfvthkPKGq+/CxNMEw5Vn1DChp6ld0SQZpjfZ/dXyyDJu/FIWobKSQ+VYtDvlSO6ip2Qb0NBe0HJHfsC4wItsdi6UXy8A4YWRWFKUIIq/bDGIaUuvSfDqH0xNBgi7Ff6DRJgHaeBxz2i2/RVGDUHaCUJ40MJp4dcx1wg5g3Re2s2f5f3e8l9COsMD2BvmtVSSO/BCvOhnzds8+Tt55IWAytXg+f11K/ki2p/12gvVuVh0JOk3RFBDKmmuBtf8G3t7JoeB7NL+TQXP+H6NU27ueMqPmTT49V4NYa6/YdSSZ1+yDa6YB+ByPLAtfTVFoa5oMXuxRRFShhwuIpMk9CzCZ1X9W78UJMVBosicHh4EirOcaxB0NSMd2MWE261/ekmm7SU1Ijorsbok3neKTgVgaFU6ycwojtJSt6qAPiZrX7Mkn/BORbsNOoFgI61wHuv18uT8VZGKBllemplSZlgRPmbrIl0Mj86RzYSfDlrD+KWW0ix7jYsxMXd8CJYynlGgKDO06uNsUeMSg8AnDOX4tGhnsD7svbpc7CIkbJAKpCoAS7xs5rQ8Cvw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.82;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39850400004)(376002)(396003)(136003)(346002)(451199018)(5400799012)(46966006)(36840700001)(40470700004)(8936002)(5660300002)(7416002)(44832011)(70586007)(70206006)(2906002)(8676002)(4326008)(54906003)(110136005)(316002)(478600001)(6666004)(34020700004)(36756003)(47076005)(36860700001)(6512007)(6506007)(1076003)(6486002)(26005)(2616005)(41300700001)(7596003)(40480700001)(82740400003)(86362001)(83380400001)(82310400005)(7636003)(356005)(40460700003)(186003)(336012)(21314003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:22.5412
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 851a1cb8-f598-457f-8b1f-08db1e7745ed
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.82];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT006.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9615
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

This adds nodes for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v10:
- Move serdes bindings to SoC dtsi
- Add support for all (ethernet) serdes modes
- Refer to "nodes" instead of "bindings"
- Move compatible/reg first

Changes in v4:
- Convert to new bindings

Changes in v3:
- New

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index e5fb137ac02b..59b401daad4d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -9,6 +9,7 @@
  */
 #include <dt-bindings/clock/fsl,qoriq-clockgen.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -238,6 +239,131 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			/*
+			 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane
+			 * numbers and pin numbers are _reversed_.
+			 */
+			serdes1_A: phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+
+				/* SG3 */
+				sgmii-0 {
+					fsl,pccr = <0x8>;
+					fsl,index = <0>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_SGMII>;
+				};
+
+				/* QSGb */
+				qsgmii-0 {
+					fsl,pccr = <0x9>;
+					fsl,index = <0>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+			};
+
+			serdes1_B: phy@1 {
+				#phy-cells = <0>;
+				reg = <1>;
+
+				/* SG7 */
+				sgmii-1 {
+					fsl,pccr = <0x8>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_SGMII>;
+				};
+
+				/* QSGa */
+				qsgmii-1 {
+					fsl,pccr = <0x9>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+
+				/* TODO: PCIe1 */
+			};
+
+			serdes1_C: phy@2 {
+				#phy-cells = <0>;
+				reg = <2>;
+
+				/* SG1 */
+				sgmii-2 {
+					fsl,pccr = <0x8>;
+					fsl,index = <2>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/*
+				 * XFI1
+				 * Table 23-1 and section 23.5.16.4 disagree;
+				 * this reflects the table.
+				 *
+				 * fsl,cfg is documented as 1, but it is set to
+				 * 2 by the RCW! This is the same as the
+				 * LS1046A.
+				 */
+				xfi-0 {
+					fsl,pccr = <0xb>;
+					fsl,index = <0>;
+					fsl,cfg = <0x2>;
+					fsl,type = <PHY_TYPE_10GBASER>;
+				};
+			};
+
+			serdes1_D: phy@3 {
+				#phy-cells = <0>;
+				reg = <3>;
+
+				/* SG2 */
+				sgmii-3 {
+					fsl,pccr = <0x8>;
+					fsl,index = <3>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/* QSGb */
+				qsgmii-0 {
+					fsl,pccr = <0x9>;
+					fsl,index = <0>;
+					fsl,cfg = <0x2>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+
+				/* XFI2 */
+				xfi-1 {
+					fsl,pccr = <0xb>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_10GBASER>;
+				};
+			};
+
+		};
+
+		serdes2: serdes@1eb0000 {
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.35.1.1320.gc452695387.dirty

