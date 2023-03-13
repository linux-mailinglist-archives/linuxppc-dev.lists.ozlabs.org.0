Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EF396B7D64
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:25:48 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb28B1VDMz3fm2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:25:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YUrAqnGN;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YUrAqnGN;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe16::32c; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YUrAqnGN;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YUrAqnGN;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02hn2032c.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::32c])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1sS6KQ8z3cCD
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:13:00 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=YUrAqnGNNumPkAcyXkNrJ5rbySlZsdBKqcssmR/5SBpjx2LdwZFYkoiFQ7I6lDhkwFb2jXHmJ9awHaGzlYsVZPcFHKkOeHMp8Pjxn1MEfrczogBpWpryXD+q+3TCtSSbUaIFth+U5fldjFJrqnkJofoNo8o+UZJ75kK2SKW3tZtL5w2ChNO+8CUZtFRk4KxPlItTfvcScOWmU561LsyR9uxhxRxC90EAY2947aS8qUWKkQSIbcjMc+Nmw2MwArNpfTaRvZcUgS8oUG5ZRDXX1h6QdqSDSHFKi0YH6vmx9aJvBxHeUCuSEKmnDctgZ2T9WS7zKZfY4JH3vtMuJ+rq2Q==
Received: from AS9PR04CA0040.eurprd04.prod.outlook.com (2603:10a6:20b:46a::32)
 by PAVPR03MB9678.eurprd03.prod.outlook.com (2603:10a6:102:318::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:42 +0000
Received: from VI1EUR05FT023.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:46a:cafe::cb) by AS9PR04CA0040.outlook.office365.com
 (2603:10a6:20b:46a::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT023.mail.protection.outlook.com (10.233.242.111) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:41 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 3C9FE2008088A;
	Mon, 13 Mar 2023 16:12:41 +0000 (UTC)
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (unknown [104.47.0.56])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 5E3DE20080075;
	Mon, 13 Mar 2023 16:03:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aotph7ozVEsT7e9cu5qgnn24ehnacuZOSf2O/kOsfyvKPst4WUvAsSrLZItbF5K0fLnFqPkc13O/GPOwhJu7VP2ZXZIMwpXpcOFP7XnpWVV3bD7ZbN6/w3c+aNODqV+ElFYkS1UJGcxwIv5PWSmOmZORT5El37kHDhqqh+f63nvi4zwZhMwek+QydlhL4RwoM98tMsTYxUYVgFbP9dPD/vYDRGuos6v8iZ+640KgA/eGftO4MiDw1uhaIIgYWysgrqQDx1ajKYnUrKyD43sY6vYOCgJUg3xqMsjaWjZ7pfOmoM//j7HKpUXzqN/hN5NNOdU5bFDltwa0zLUB8gvx/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=RCK29F5ZQF2f7Lh8CFe0SIemsg2vdke4ZZ2aF6BBxxYM01Xmn34/e+sXlT7AYgcKgLLWGrTQvxdrac1mFwAxIobAew+5bJ56P9RySgFApah39iDL/G/JL08TbP/IZudwrU4TdO5g6YyU4EtKBlxS9Nv5uQpcglFuPt36G9+GEZFu4bGbOws+eV0MaalMMJyjVi7/S1OwhbUZGBQK0K0Fig8nQbWGCRrmVt5ihs83gIekxCBKQo4SX0EKV7DVy/LxvF/4cFD14b0R4oNPXwdQQVKm/qzx3FIb7WUtCyXmHytT1L3s8vXqcfEOXJhJznvqB3xweHbXK+LWDMi3/mncUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=YUrAqnGNNumPkAcyXkNrJ5rbySlZsdBKqcssmR/5SBpjx2LdwZFYkoiFQ7I6lDhkwFb2jXHmJ9awHaGzlYsVZPcFHKkOeHMp8Pjxn1MEfrczogBpWpryXD+q+3TCtSSbUaIFth+U5fldjFJrqnkJofoNo8o+UZJ75kK2SKW3tZtL5w2ChNO+8CUZtFRk4KxPlItTfvcScOWmU561LsyR9uxhxRxC90EAY2947aS8qUWKkQSIbcjMc+Nmw2MwArNpfTaRvZcUgS8oUG5ZRDXX1h6QdqSDSHFKi0YH6vmx9aJvBxHeUCuSEKmnDctgZ2T9WS7zKZfY4JH3vtMuJ+rq2Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DBBPR03MB6828.eurprd03.prod.outlook.com (2603:10a6:10:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:27 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:27 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 12/13] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Mon, 13 Mar 2023 12:11:36 -0400
Message-Id: <20230313161138.3598068-13-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DBBPR03MB6828:EE_|VI1EUR05FT023:EE_|PAVPR03MB9678:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cbad9a2-81a2-4141-e5ee-08db23ddc5ca
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  /zQCURQNmYEQ/8iEA3HneA26EjJfpJK+Mgf3tfHrTJbeemcm1KIlAPnGlV6t59TdzYAW6yzV2V+PRUyTkHFXmKFqxjaN9ajWtccUBrsmUutGlQ06g1vWMXtuudi20WkRIo7W5+9HMZxCFkteYP0LDsa4tvQMLsg7+6AqMFKiB9CxnGmU5W35f9DV0/H0Jw9nbH8lyl/luAltSZacf2MDQGP//P4BUj8eUGSMggZ1tkKIMODaNQy40ymKdsNx0fX4jKNBDz8HPkVjnQgNSZjD3AsHDLPOE5WPMDpKS9SvNdP5xxnxbTHN4oGIAytkn0A/BD8whuMqFk9ef/NkESSi6RCxEdXNPllPpcp08YlwRvorMxddWNd356HGa8bDqRSn0xCZmv/d3razLXHuI7q/h3iXwcmZ0In6I11nQa9P8ZcH/fOQ+CLaGbpwT2BRVrcdg1HfTQRmvChvxRANEdWSdEHvM/aVxA6l9j4d7pWx2f4gCgmpqn38YVQp39y6KbIDVNe6TJDDkWrG7m6xBEBXNAP+7PqPw0T4FLpjafHxdKOKC7UYHA3YjFHabFvCKjCoYsIg7trPZ9nMTkoTwytDek5uDFBcYLds/jv63lwk91JkghRbQ2lHKGX3QfUZTyH+xBevLagTpL6s6D+24x14TSmNFxXDEsQZnICwjFaLlbMfy5hujw/K1nDdil7+tvjAvsvbKn0cd5tVvUZwXiJikw==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(366004)(136003)(376002)(396003)(39850400004)(451199018)(7416002)(5660300002)(52116002)(44832011)(86362001)(36756003)(38350700002)(38100700002)(2616005)(186003)(6512007)(1076003)(6506007)(6666004)(26005)(2906002)(478600001)(41300700001)(66946007)(6486002)(8936002)(316002)(110136005)(54906003)(66556008)(4326008)(83380400001)(8676002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR03MB6828
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT023.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	8933030d-5352-4bc2-c22b-08db23ddbcfe
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	/1kbC4agnmukZDvlwihv2l6u8fUAZYv4BC1XXjGHhCcezquHh4lurnjuJsQNFCz546wtMfYM2xswmXLYEESIfMtoqhZEBluUDbdn1n7SLH4YqT2iXvNlMcwT+TanrO4o2Z7FskRIO04m381cG5ElK7bWFPhrEYsewWALxdM7mvV+hSAb/ebhiq5y2ADgEMQvcq9WuqVxLOp48mANbY/L+xmeEVathvLYli/A4GU03T4t3fIzYrsFPmVbPIL1ql/QiH6Jb8Z8ekXJrTk5VW209WTuOu0rs21w9PoDWphml/sgxyAvCK/aAjE31Gdy2SHoWY2BaF9sMqSM6KY9Va70zfewA/bxCE4ZC63EDuzm2+K9kLGvuinII/u+EzXr2F/kD6ChW1oXiGZDUxzTrYRMX3vuDaFbZCPEvBQqmaJJSPKje/q2FM4oZYtO5BgZmS4uU7f/Rxudi4Wb1fcbyrA/VUnKefWOczZfMXQF55Da7poK+jvvfpzeM4NPFSTia2Np4I5pgyju4zTuiFxrdqSbG2rj2BUUwNhgJOQn1ZE2JzkmACnIaAfNgk1MZJJFcko3NYwhogyV30zXf/2r/vxWOmoNS9vLXXJ8a5UieSoOBOiz+x9Wp12sppI0JWPE/vSLAZMjjaifBVvWTmzY4o26vx8XX8I10j1e7m0fm9dyWXZj+2MulHtE+Z1fb7/wl0mJlrmg/RardoIC+YtYx1CHICfgJ4fFN6RnZfXyuqhQ0+VhSb31MtOff0/egm5ciaoTlRvvVjQ3e/AwGwOVk36Cbg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(396003)(376002)(39850400004)(136003)(5400799012)(451199018)(36840700001)(46966006)(40470700004)(336012)(2616005)(7416002)(186003)(44832011)(6512007)(6506007)(26005)(1076003)(8936002)(83380400001)(34020700004)(6666004)(82310400005)(36860700001)(356005)(82740400003)(6486002)(47076005)(5660300002)(40460700003)(4326008)(70206006)(2906002)(8676002)(40480700001)(70586007)(41300700001)(7596003)(7636003)(110136005)(316002)(478600001)(36756003)(54906003)(86362001)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:41.5272
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cbad9a2-81a2-4141-e5ee-08db23ddc5ca
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT023.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR03MB9678
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

The internal PCSs are not always accessible during boot (such as if the
serdes has deselected the appropriate link mode). Give them appropriate
compatible strings so they don't automatically (fail to) probe as
genphys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v8)

Changes in v8:
- New

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 30 ++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 59b401daad4d..bbc714f84577 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -932,7 +932,8 @@ pcs_mdio1: mdio@8c07000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs1: ethernet-phy@0 {
+			pcs1: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -945,7 +946,8 @@ pcs_mdio2: mdio@8c0b000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs2: ethernet-phy@0 {
+			pcs2: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -958,19 +960,23 @@ pcs_mdio3: mdio@8c0f000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs3_0: ethernet-phy@0 {
+			pcs3_0: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 
-			pcs3_1: ethernet-phy@1 {
+			pcs3_1: ethernet-pcs@1 {
+				compatible = "fsl,lynx-pcs";
 				reg = <1>;
 			};
 
-			pcs3_2: ethernet-phy@2 {
+			pcs3_2: ethernet-pcs@2 {
+				compatible = "fsl,lynx-pcs";
 				reg = <2>;
 			};
 
-			pcs3_3: ethernet-phy@3 {
+			pcs3_3: ethernet-pcs@3 {
+				compatible = "fsl,lynx-pcs";
 				reg = <3>;
 			};
 		};
@@ -983,19 +989,23 @@ pcs_mdio7: mdio@8c1f000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs7_0: ethernet-phy@0 {
+			pcs7_0: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 
-			pcs7_1: ethernet-phy@1 {
+			pcs7_1: ethernet-pcs@1 {
+				compatible = "fsl,lynx-pcs";
 				reg = <1>;
 			};
 
-			pcs7_2: ethernet-phy@2 {
+			pcs7_2: ethernet-pcs@2 {
+				compatible = "fsl,lynx-pcs";
 				reg = <2>;
 			};
 
-			pcs7_3: ethernet-phy@3 {
+			pcs7_3: ethernet-pcs@3 {
+				compatible = "fsl,lynx-pcs";
 				reg = <3>;
 			};
 		};
-- 
2.35.1.1320.gc452695387.dirty

