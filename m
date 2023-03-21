Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9872F6C3BBC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:25:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph34r3fD5z3fh8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:25:16 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TEzwlMxD;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TEzwlMxD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7e1a::31b; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TEzwlMxD;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=TEzwlMxD;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05hn2031b.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e1a::31b])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2rD1wwxz3cgq
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:20 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=TEzwlMxDdwwbUZ10lSm+svYLWZ6Z0RXjQenVF1pEHTQ3yOTUru8vRbbDpZX4Kd3EmfuByNK4Qgrju6nGSAoE1RqwTOqVI6mv3u4Y7XTRlZWE5BgMGlXPhov+OT5IDb73ZAVFaOQVBPaGYBJqLle/Fe0rvHm5C+BHvVR0xn20B5ODMgdKHkf55SZQYCXOBqg6+Gy0uuqyhnRigpvYbrAomufZP+5o647V0qWYpMUtpYi0Scml9n4rasl8sJHb0XWuynn7IFxZx2/nRhoRfFVl7E8XX9WKtOqxi/cFU5GtevIzoxPkq/wT2S+IstTehGl3xAGh8/PpNRr71GQDqdu7Tg==
Received: from AS9PR06CA0662.eurprd06.prod.outlook.com (2603:10a6:20b:49c::7)
 by PR3PR03MB6682.eurprd03.prod.outlook.com (2603:10a6:102:7d::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:14:02 +0000
Received: from AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:49c:cafe::d2) by AS9PR06CA0662.outlook.office365.com
 (2603:10a6:20b:49c::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 AM6EUR05FT011.mail.protection.outlook.com (10.233.241.29) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:14:02 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 318C22008088A;
	Tue, 21 Mar 2023 20:14:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.170])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 81D272008006F;
	Tue, 21 Mar 2023 20:12:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vzcn2h2DvRpC2WOOMlJGK6vQe69QY8cnv8D254Oj5+Rn7HKh32IIZiyujkuTjNVQRUSFSaG//mjG6CBqBmY3OH8k0e+xJrtu/GFMbhfxBo+oh2RBgrtsU3i0pA+xX4UhzO/DxC1LvrHj5qm46T6GKPEZhU1OfIbdR3w21guVfFqLarnBXcH+EMI0K2e0oe0BthiLZP6q7RRrcV4Yn9G5iRSkOCSNh3b3vHFRnwJEOAWr0WpF2X/GMXoyhFzuoVfBoZQXjBrRA25R1ng4YdDU2JtcXzTmjAv0nSKqHf17JOmHjjvDS/wzv39R7rqzoidLqKSjD2REbUADjrEJWlOy4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=l8lLrEWLypylkykFj95loyL1xkn3XOUXpf02npZkPL32j1mC6jyAYjU7R8BDB9dy/cvW7qIwokKblrHk198DjhSqxrvhwq6cJyLQssBQTXZXJcQcvwXrT+RHw44V25jV+isGm8mNeStK2katMETyPhmVXCgytWmcjKgfME1UJxx7QsE+090Z55M1Fwe9SnP3o8VAdBRc793Uo1ZcOpKrzPyhshsRyqmDtNSX2N1mywgWu7a/YRUHu+9XkdJIT7cQ5ahka4uNmcf28fWBVYlnZcL6cAQz79Fqi9Q4dOOV5wKe3HJDOYEf3XFl6AfWq/X7pOuGWlK/Jo5GBdbwB4axKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=TEzwlMxDdwwbUZ10lSm+svYLWZ6Z0RXjQenVF1pEHTQ3yOTUru8vRbbDpZX4Kd3EmfuByNK4Qgrju6nGSAoE1RqwTOqVI6mv3u4Y7XTRlZWE5BgMGlXPhov+OT5IDb73ZAVFaOQVBPaGYBJqLle/Fe0rvHm5C+BHvVR0xn20B5ODMgdKHkf55SZQYCXOBqg6+Gy0uuqyhnRigpvYbrAomufZP+5o647V0qWYpMUtpYi0Scml9n4rasl8sJHb0XWuynn7IFxZx2/nRhoRfFVl7E8XX9WKtOqxi/cFU5GtevIzoxPkq/wT2S+IstTehGl3xAGh8/PpNRr71GQDqdu7Tg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:49 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:48 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 09/13] arm64: dts: ls1046a: Add serdes nodes
Date: Tue, 21 Mar 2023 16:13:08 -0400
Message-Id: <20230321201313.2507539-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|AM6EUR05FT011:EE_|PR3PR03MB6682:EE_
X-MS-Office365-Filtering-Correlation-Id: 44ff4b9e-d69b-4891-eb08-08db2a48d054
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  Uqn64SCRpStyo9/w+sZR2t3o/QoqPfInw88l5XrrqEZDm9TQZjXOKS2ZCjzz1XxLA4wWTecl/hOzIWeOLud3N6l99VGh202kAIv7cphLkQ8ud2GYQ42m5qA0/4utrzXk6wVSzenuJjw5vi1dnDcH5hMjLkoqcQOlG8S61W2M0oaTyq4QWYAfXHANtMX2QfXvtUdD9suiz7Vf06RcgXAi/eunQmrjtvg+hLnb4aTCvSfSWG1rzgosNA4dJVsB9lnvDKjGQwxcQBGR/8cVgIQGrQ8s5/6kK9/FZCVutvgASbJrpWef17zNdhs7iK5xAP0Lwk7erbrIZTt+G5FTasbuI8Ee6ZI6MhVLlUFjBUQhwp0fh8P760VQal0nwGLnqtVQyLWf80g/gVbNrbOx4lGhrhtMnxs5sT2+2BmeY0hCZ+h1eLlxGeSqb6JvRvNPxRNXuVD2y4T0SenGQgRrsOb+IUTtMGhGCTM436OZYNIxhyEWy/GSKm92UssF9Fj8tsQ92YL2312+Y5hbM10WMZTTAWH45LASitc5Ad+GGYsafj4LSnpOg+LkMhbUESmCoC1tvXt6iNoywPh7opTYXl9ADcfQ8G7xhyR8Ugu0O5eCrk63zxeFC4g5HgYW8JA/ele8a2zugA9WDHAKfIv8UgL6wMyat20Z6Y5rbPhq/L6KKWxUleL4uHvBRtJ4R6LSKAop2oU2Xy5YeKVu8IUgTn1H8g==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d79c7595-3735-4af0-81ec-08db2a48c822
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	NygRff/ZxbonjnIBN3GYBHUAcqQCDvFII/PoxRCnrAGT6bcnIlJjgaB1g+32dlQ/XPfLVm+E5HC0kcwUUZOTEpfQRRDFloeorcs+DSOABWdVJDsqZzvP0o0bjFnOS5yxYHNmUwp2XI7K8j/h2DlcwtB1MAKtlm+gQLeVnNfa/UiR7l7SUNr5fHKYkgIWbTd9Aja4PUdBggrSRe2loJDVbz6kx6XGaArHUQ9BQkVCz8adMR/2hPWNOdKpVty+PaDqTlB7Ob3awRFLNy/V6Q5o0iCiv97z3pOmbC9YM3o5OO6k6AeQW8Y1YcynnK30Bn+mfC+wkvKf5FQM5oJ8jugR0oGKgqnAgf7pP/k1l2Bn2TH9Z7JObYsyTwEI1Sk47xkAM+lJaKayWqNB9B7DJMDbCALq76JFrqA2M1Rr1qMJVdjswZRDLI0/M9yDOueW+hJQbw3JkstBnnsXQjNPzS0MpNarifxlE3X+/IbFVhxf6WJGoNM9yuY7jpXydplJUNFFv2sSzl/hsYZbqjOm3Q2FShA9lFGlYLJ7Pn34MB/1ErVB+0/ts9Lxxy3mSWSaWX+qee6qpS/g1D+V0Qlzjy6v7NbI2CaS1+KxzOFZ42i0J7ygvyWweuoe292UStj0b43MnmA09QACViU36FgfLMvzMJi+5VlvuQYTfpHIaq+EDKx8vvr0LLY36lCn+lE6zbVe1W2LPVkJ0emFVngtNgMyv1oI6Wi1o3Suf1oX8bjh8SiXG7Pvrx4U38J9KxtRoHIYfbaQpv1Epl1H3t+7jeNMIg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(39860400002)(396003)(376002)(346002)(136003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(6486002)(54906003)(82310400005)(110136005)(478600001)(356005)(7596003)(316002)(7636003)(8676002)(86362001)(4326008)(82740400003)(6666004)(47076005)(83380400001)(70206006)(336012)(70586007)(8936002)(41300700001)(40460700003)(1076003)(6512007)(2906002)(6506007)(44832011)(186003)(26005)(2616005)(36860700001)(36756003)(34070700002)(7416002)(40480700001)(5660300002)(21314003)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:14:02.3826
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44ff4b9e-d69b-4891-eb08-08db2a48d054
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT011.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PR3PR03MB6682
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

