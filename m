Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 572886B7D41
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:19:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb20V1dtSz3fYN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:19:06 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pOc4WiXX;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pOc4WiXX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::305; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pOc4WiXX;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pOc4WiXX;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn0305.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::305])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1sB5jdBz3c7d
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=pOc4WiXXMQqBD6gtEp4L8hZ330z4TjxcQMdZtp/zs+6TK/sSBpeMKkJGmndABi4yVUHapXUHiUMXC3nRz2F664h5j3yuBVQwK+IxocByQBWf9s/gQAhENYLY5kBaEbsO2PVbKSMBOEJEh2otlHIeVCo9moyQrLKcYT7ENQcV51NBsfO9PqDGcOuaA3kS351fuob0G69PeQpprpikU+bQYvIeCwtdp/gUOYBwKGzMHvfrUNCtS9Bk2blH8Lg2Jr2Saew2+f9rGvVzxEbowsvATFATOru176WG5DQBaFxTXPJlU+OBkXlZ4B88zLKGsnAKVPf3CPUkQ8ebjbn8RsJrTA==
Received: from AS9PR06CA0630.eurprd06.prod.outlook.com (2603:10a6:20b:46e::22)
 by DU0PR03MB9254.eurprd03.prod.outlook.com (2603:10a6:10:47a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:27 +0000
Received: from VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:46e:cafe::da) by AS9PR06CA0630.outlook.office365.com
 (2603:10a6:20b:46e::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.85)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.85 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.85; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.85) by
 VI1EUR05FT013.mail.protection.outlook.com (10.233.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:27 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 8CF1F2008026E;
	Mon, 13 Mar 2023 16:12:26 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D461D20080077;
	Mon, 13 Mar 2023 16:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=T2Lt4F6DLrxXn5o2TVBECxNU8FGigxwAzN9ofc2RGrtN4YTGVlwxYTW9w5CcDC7ftcF2Qh2Vu38+itSE6Xb6VfMjjg9jsoFtMJP8RHRs2LIMzwTKEwx5V++B89EOLSfS2MpUVOI9mC9Ac5onfofcAvoRxP0gVPKZn+FlVvqzMobWNPDwgElJRXwzV/z5lwhwYc7SZWIPIM1Kwoq4aRpF9/eDS3Z1hfmMS7qCSrxVpxiaRP6St5f+JHdWYX9s+W0P8d7+n6yUyPoDPdXbWJF56bDjyMjVDJf2h2lCVEBzlppW4P9ojIdHIshRXCs6T1ttNf4pXIM3ltbA8Kxe0fcOUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=kesj46kxRLkAPia7MDAYkjkuUfvp0oXHCCXpWlPsops3nVAqr5RpxhrlrVdhp7USOAnroiDWXicmfE2CHJjxBoiZ/EL9DPdcskd73yKFD4NdZefmsZ+tRHBeNOz7dEnnvh721myFxUpZuEETHQgeLo7sYE+qQjE9liMzqZbLbe3fPgfN+KPyqWTaiIkBTWGJBhRlxoa82N8N3G/V8Avn2tlBHJY5YirYEiheugr0gNUpH+FWkRHum2LYkNcA8rJcECPVqSdgiYuwHrTk1CPC6RW9wC4Ajm/Z+Cnbhjac3AnD4+lKzrVOwMZiOKNVuBtpHmsiuRW0KLDqf9wrDnhJjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=pOc4WiXXMQqBD6gtEp4L8hZ330z4TjxcQMdZtp/zs+6TK/sSBpeMKkJGmndABi4yVUHapXUHiUMXC3nRz2F664h5j3yuBVQwK+IxocByQBWf9s/gQAhENYLY5kBaEbsO2PVbKSMBOEJEh2otlHIeVCo9moyQrLKcYT7ENQcV51NBsfO9PqDGcOuaA3kS351fuob0G69PeQpprpikU+bQYvIeCwtdp/gUOYBwKGzMHvfrUNCtS9Bk2blH8Lg2Jr2Saew2+f9rGvVzxEbowsvATFATOru176WG5DQBaFxTXPJlU+OBkXlZ4B88zLKGsnAKVPf3CPUkQ8ebjbn8RsJrTA==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:22 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:22 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 09/13] arm64: dts: ls1046a: Add serdes nodes
Date: Mon, 13 Mar 2023 12:11:33 -0400
Message-Id: <20230313161138.3598068-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|VI1EUR05FT013:EE_|DU0PR03MB9254:EE_
X-MS-Office365-Filtering-Correlation-Id: 969054b8-c2e8-4422-58f5-08db23ddbd27
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Nnqugh9P1JUW7vInwBtnjuuwGxYW983AlmBmxKvmsAMZIIVTXC4jj6bHWCcorkrSyEPaa/G+gH0pVsAd/Y/yycr5H2lpn1bjl9TT5hKlD5gFi7d9I9v26Wrpi1s5cuH29ZJYXI4ybtEVB0YrHcm7cDILzmOzZt+rU3ReRNxKwNwpWgkSTf5CHVLEyjYjdzn/w/jHyxH8mR74MNa0JgPIOkGpqwN3mSFtuOBGrqHl18xxobcKAlTqU2kVo9NK6YZhA2xqaPuoUtgAA1OQ81FK5VuBXJLKefwjissA+uzN22rx0yxoRywLPybbxyB2yP4wZM95M8KbUg/pYgB6HrQ5ohQ1skZUyGTI2pC+fePTjJcm6C6E3ED4CV/HusSK/Aeishht4fs4+K/5Apv/TSftyFTgT9rjqI7c5GJQ7QZeVAL7YYJz62YPF9htLMq/opLKOmzxmlMXGhxqxstmCWXdqYj4ct7hkQB1DyswHJymLW5Awi8341tQiJDiSPT6+t+SrukqdumppBqUbpUtkBMV36y6IA70dVmhVj7BOzg/YjCDtpqtzsq05fL6xQqKiCbhMaM3/QfCwTAdKdAPICA1uDh1kQr9DqJZyyT6i/Xv2UJqFOoj83WoTgOWQlmeW/oVpnERGOI51dnAIii+YHAG9nnFE0dE/TkSf3F4ywAchFxdYrIqbHSM85IURXkpe+YrjcWZo1l9hAtscPBkh+mKeA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	89f4f1ed-f34b-4b62-1b47-08db23ddb9fa
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fxXMLAaoZYxuRDa8SJfErW80BtdqgSLyjEoqbNYBPTf3w6TLNDArJcRUBTRq6S8nZ0xFe2j6K00bDpGpB3Uj0Lk9P2jnXVufqIZHJja36BVgF1oF10JZq69ueiofxUyjdRnWGKqkujrenuapMTLptmd/fneMMMbzkGQ2qoaPmi66+RgysNKrU9L9ARNTr9IlS7dFNNHBDCN4XVTpFJxTNiGiDdlpXgCGtp1Pm9Zrgsws1Rt741BzuZnYm1l8jDSWf7XpZudYsVPCxkAugO+aYBT88gpwV9sG0R9whD4R+o8IjFJxKre3yM9Lfm9PgaL6aFZv5Y4mGu/9nsuDrNMpoL/1ne6OdyDd6p4bfF+pYgDFKoGK/O1QMvwV+ETrP6xxAOGTcVMf5BSf6vng9zoSEiBcFAA5XEr1Np6ggo3KO4T9cRa3B8WZezFebPIm3LBWdnIQHca5Nq0ehOvLOaYjW6NtxLLa/oBxBqnN6aX08uAJpMbWoXCLBqRcTSsxvW9s+3exu2SQPOtYTrloAlLc/gx9lgf42Yj1kSWYox0ERO5GxaNRWPcEBkZrZUjhdUDhXyHn9meNxHrUgXOUD52ndZ53i50rU8qsTrZcIzi+ZVtRT2HCvJ89kLOmrCbdVwZIrKFnxTTaRdddD+llrNQZx66P8eksfp5AFblFIuhF6yp+2YdQ1TSPh4tl9Vy0cKJYIxDZKsOKA42N63aBjeFr5FX5226EdzWNBh0KRSk3scl7JpXy7tw5+qXxfBlpHv0asMwOwm/VX5+iWxxY5Fy1wA==
X-Forefront-Antispam-Report: 	CIP:20.160.56.85;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(376002)(346002)(39850400004)(136003)(396003)(451199018)(5400799012)(40470700004)(46966006)(36840700001)(356005)(86362001)(7636003)(82740400003)(7596003)(34020700004)(36756003)(36860700001)(44832011)(2906002)(7416002)(5660300002)(8936002)(40480700001)(40460700003)(4326008)(6506007)(26005)(186003)(6512007)(1076003)(83380400001)(336012)(110136005)(47076005)(2616005)(316002)(54906003)(70206006)(8676002)(478600001)(70586007)(6666004)(6486002)(41300700001)(82310400005)(21314003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:27.0493
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 969054b8-c2e8-4422-58f5-08db23ddbd27
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.85];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT013.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9254
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
- Describe modes in device tree

Changes in v2:
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

 .../arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 111 ++++++++++++++++++
 1 file changed, 111 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index a01e3cfec77f..f6361fafaef7 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -12,6 +12,7 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/thermal/thermal.h>
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/phy/phy.h>
 
 / {
 	compatible = "fsl,ls1046a";
@@ -424,6 +425,116 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: serdes@1ea0000 {
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			/*
+			 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane
+			 * numbers and pin numbers are _reversed_. In addition,
+			 * the PCCR documentation is _inconsistent_ in its
+			 * usage of these terms!
+			 *
+			 * PCCR "Lane 0" refers to...
+			 * ==== =====================
+			 *    0 Lane A
+			 *    2 Lane A
+			 *    8 Lane A
+			 *    9 Lane A
+			 *    B Lane D!
+			 */
+			serdes1_A: phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+
+				/* SGMII.6 */
+				sgmii-0 {
+					fsl,pccr = <0x8>;
+					fsl,index = <0>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_SGMII>;
+				};
+			};
+
+			serdes1_B: phy@1 {
+				#phy-cells = <0>;
+				reg = <1>;
+
+				/* SGMII.5 */
+				sgmii-1 {
+					fsl,pccr = <0x8>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/* QSGMII.6,5,10,1 */
+				qsgmii-1 {
+					fsl,pccr = <0x9>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+
+				/* TODO: PCIe.1 */
+			};
+
+			serdes1_C: phy@2 {
+				#phy-cells = <0>;
+				reg = <2>;
+
+				/* SGMII.10 */
+				sgmii-2 {
+					fsl,pccr = <0x8>;
+					fsl,index = <2>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/* XFI.10 */
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
+				/* SGMII.9 */
+				sgmii-3 {
+					fsl,pccr = <0x8>;
+					fsl,index = <3>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/* XFI.9 */
+				xfi-1 {
+					fsl,pccr = <0xb>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_10GBASER>;
+				};
+			};
+		};
+
+		serdes2: serdes@1eb0000 {
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.35.1.1320.gc452695387.dirty

