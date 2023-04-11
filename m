Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C426DE463
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:55:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww5f2xMcz3fnh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:55:34 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RQpWJM9X;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RQpWJM9X;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::308; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RQpWJM9X;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=RQpWJM9X;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0308.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::308])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt50GrXz3cMs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=RQpWJM9X7JqWKWnQ1/BTEfEN4kjXURGDnqfoKpxFXVD/w8F2kGuwwcUgsgVKjDE5LByc1OkRdnoUu/gClVOkegwvxdtbDpgX0QWSjtQCTH6EaT3SAV7QQWqSTjY1Q7/KZqAz9x2NkRTjfp1OpTxkpN0gIZTC1hOGB50F1hUB8f/4wFWgrH0X0XVx8HTlAk4F5UKxjhZGYanfeqJb0ZO8jYgdt4JZx9VPAzXibIBqDtSIg9Kf51WIZVbdLqvD3KxF1vM+l5A33wrVB/bWpq7DKj/MUAUXxNYe+n+9un7nw3OWav69fvfqxzdIY9essVz+weAw8YgiAFJ5Dz6xsY0Alw==
Received: from AS8PR05CA0001.eurprd05.prod.outlook.com (2603:10a6:20b:311::6)
 by AM9PR03MB7409.eurprd03.prod.outlook.com (2603:10a6:20b:26e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:14 +0000
Received: from VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:311:cafe::81) by AS8PR05CA0001.outlook.office365.com
 (2603:10a6:20b:311::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.34 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 VI1EUR05FT018.mail.protection.outlook.com (10.233.243.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:13 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id BAD0E20080270;
	Tue, 11 Apr 2023 18:45:13 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 4D2562008006F;
	Tue, 11 Apr 2023 18:46:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hpMANxxElIx4VEQEKhzik5lEV/plX/40d0CsnMOJi/yQeEfMQkuCRFQKYPXanH8uyDyuXAAf4GAkUvKfQBTHB/iXYuic3Wk6RWB0u2DI9c49HUyP0D/4EFTxN+c/oe07vpHHs5Oe+KQtnAs07Y+ue22qX+jkCXnJH3pfamyGIld/DRn8kBtsY0OTpOKC5wUXj9RlPmJU8a3xvlzVBgj2EE9rLRpZ6vqPEGrPv2KfdwyV+5PN4iguhIRVBuWho3fxsWgDfeK/rhXISgG2yR5+MN4EO0MK5tSsZIVLqCR/iPwVSOV2z7Dul3VCwKTcOFDPZ5+0wNBS5jd4L7JmSrlgbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=hRcjx8SVynAUh7Lwz36HRJMAySsesQVkgBHccjmj7iKCOccQlD4Roazp1LgTqqRWiKmBNl9bPRvmF5rWd6xQ4qbCFFQqBkFHn8Oyufs7Yo+XfIrchydRcvM8awe+HnqiMTOSFoaJDpBVY2XwEAz3bP84/YvMdPMM6rGR3RsIUBrTWqMXfv8dljC+ZVKXn6USnZwyzxre7zLkOsqn394dTvMMj3DkS8hOqLJNHk6BaHRrrxt6JKC3vm40bcdXFEZ8COavKDybpH7V4tKqauzloJc12aKCbLKGUYg1sK2jzymwCKBwPPwB6f28j+HUwK6vK+MxdtnTD9P1CpANe+1rEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=RQpWJM9X7JqWKWnQ1/BTEfEN4kjXURGDnqfoKpxFXVD/w8F2kGuwwcUgsgVKjDE5LByc1OkRdnoUu/gClVOkegwvxdtbDpgX0QWSjtQCTH6EaT3SAV7QQWqSTjY1Q7/KZqAz9x2NkRTjfp1OpTxkpN0gIZTC1hOGB50F1hUB8f/4wFWgrH0X0XVx8HTlAk4F5UKxjhZGYanfeqJb0ZO8jYgdt4JZx9VPAzXibIBqDtSIg9Kf51WIZVbdLqvD3KxF1vM+l5A33wrVB/bWpq7DKj/MUAUXxNYe+n+9un7nw3OWav69fvfqxzdIY9essVz+weAw8YgiAFJ5Dz6xsY0Alw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:59 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:58 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 11/15] arm64: dts: ls1088a: Add serdes nodes
Date: Tue, 11 Apr 2023 14:43:08 -0400
Message-Id: <20230411184313.3679145-12-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|VI1EUR05FT018:EE_|AM9PR03MB7409:EE_
X-MS-Office365-Filtering-Correlation-Id: d6d08d59-e4b0-4f9b-e294-08db3abce310
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  BgWif/KZLrreIiP81mUNIdRjhG3td6dxUd1APar0RbkJLrqoA5GXZnTbP9kCmlz2d+vPMYNdNLJiGhwY+NlfQXxP5MsB+Ue4c1DxUwOVrFAS7HCjxwq4FIf+R13Y0iGN+aLYzT6hWiQl8KM55/pgCCo23Q/EfiUjvCPb2jxER/WrHJJaCCLg+vFZbkiQlRF3EdvRkc2j+BXHjZYXI7dJLD4sFlfqhfW9TYbylyb57Ec7hsQIaqUbu14uuJktmGTq3CkEoHExf1+IrqW+7O3Q3MDzL+/wbpUzlz/nwV0+UuLWY1pFexjgC+dzSug74X4Mk+w3XeK9qc5xcvIlWIn82qDE8ziswfhrhvgpIhOtdFNM/03osQppktJhX/owi7NJJxwl+gf+ymioF2jz16ZQSF6IC/isjwWAU31fF75E1OCUfSYR+CL40mmgq1JWZi/Fw2N0xTzjVP+Soz2jKtsqVqFekpvdq8QBuzsDF0YF5napuy+V6HyZzcvf9e6Y8MBzs2ZRE7rKm5dLZvXAeVFXtZwKOSAwAt/AqkNjYgtwQnkjK6BEJGTkIM0AE6qEcLXZaEemPA3E5c2nTHgiWulA69JSD3NhHkiSt5sG0cV73Xp6NUIvQDIieZ/5D664hjO2
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a474c46d-c995-4f2c-386e-08db3abcd9f1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	HvAymqkKu8KQpy8GV7zvPwf3srivAwfNDdTb+w0LPxe/nCU161wDJB/MThOfzm76vVVtuYCsf0T95bGlVAS2RcfQ7sRNOJDrg1/vx1aESKxglg1awCf5/u4I579FD2hSiDry2zVJYXzmUOqInld+Z78/aZ2yT+hXPKr47Q1AR/hoByzQMPKt5NYRaZ1igi9oCKTHyrapWBBDUr79U0WpGK11byKFs57eILZhmDUNanEQGrf/MiI5i/pyEhK+toSAib2gnxOKnmDHpQ0O/ZmSIt3tir9tbstoWQK34dTJexefS6oVRlaGAWsSFV6sCNqbTIYPk2M31OXVhdwwwiKTRu/aoYvWxEPHfPL0YFra5KldRTHlW8Lv1Sm3iEBVUE5Be5tzR0hN/v5f3fnvNmT6vdNUv73QGJjpTMLZrUyQV6ldikef6M+rvSDMCw/XGiPCDt5LGLaZUsGwc8T6oqJyqrLtvvoSkxsrk6jlxrtgtVRyvTAPxdoepmmZ9SeOuJVHGTGXfofqmQmMdDGVcSR5jyBksdt//V/CrNjPwSb1Bcpk59Gr3UuZcxNm1pBOHQpuPT2sik1r/LV39dSKJPxJjEDb6gFWk91sg3mqCdtpavm/biqbh9k4YpmgB3p8VWthBLrQZyCCt1D3VhuOlinnowBNKjVEszFoI4+wfrUp838/nx5nfjY6F14J97MubQOm7GzNZCgqAwjXExRURXzSoS4cb6KBS8jdeY3Fakd3Xxd3TJjIw47iBsgyWbghO8wvNU7EeqpFsiCgh365WLkx3Q==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39850400004)(136003)(396003)(376002)(346002)(5400799015)(451199021)(40470700004)(36840700001)(46966006)(6666004)(6486002)(47076005)(36756003)(336012)(2616005)(83380400001)(40480700001)(86362001)(82310400005)(36860700001)(34070700002)(356005)(7596003)(7636003)(6512007)(6506007)(1076003)(26005)(40460700003)(82740400003)(186003)(110136005)(316002)(2906002)(54906003)(7416002)(4326008)(8936002)(5660300002)(44832011)(41300700001)(8676002)(70206006)(70586007)(478600001)(21314003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:13.9917
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d08d59-e4b0-4f9b-e294-08db3abce310
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT018.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7409
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

(no changes since v10)

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

