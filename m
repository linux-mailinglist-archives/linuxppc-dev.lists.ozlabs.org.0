Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 905476E11FC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:14:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4RP3QRcz3fnS
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:14:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nSz8JD2o;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nSz8JD2o;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::31a; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nSz8JD2o;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=nSz8JD2o;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn031a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::31a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gc6Fw5z3fRV
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:20 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=nSz8JD2oB9EW7YPFfb0rohANkA7PZl852TCy2tfOmNg6PUliC3xYoRAqBW1fG6hFkyUuEPCJlt+vqWfKKPRhw4CTfX1uMivp0dpRuQ6zem7cHvThNDOFU+tSqUWtn+gfZWVmrNb5tkT6iv34+6aWlTs+V8e9dmMtut7Nt5bpELWD5IiH1ZLEYWUKHtMzc7cw1dBYZgWTMDHTMp9D4QkrQfliZqwMbi6RW/MevU2igYhJiOF5gqHfMh3tgxyESkucHeYosn5mYKKC1RTT0Zkupe0HL/s4PcQXApACuf3s+LIgzQCzue8UDJ95Rhk1/FWHcN8zwDexuP0FZRDvxyzhGQ==
Received: from AS9PR06CA0322.eurprd06.prod.outlook.com (2603:10a6:20b:45b::6)
 by PA4PR03MB7024.eurprd03.prod.outlook.com (2603:10a6:102:e4::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:02 +0000
Received: from AM6EUR05FT048.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:45b:cafe::dc) by AS9PR06CA0322.outlook.office365.com
 (2603:10a6:20b:45b::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.84)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.84 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.84; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.84) by
 AM6EUR05FT048.mail.protection.outlook.com (10.233.241.223) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:07:02 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id EAC512008088C;
	Thu, 13 Apr 2023 16:07:01 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id D30462008006F;
	Thu, 13 Apr 2023 16:08:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A44j8PjwpNj2qcQUOmNXr3x6aNy8aEcvqHjK6QOA+CV2rSqO6KJSnpXVrzOWZRKqAZcFpS7l8X4X/O5vJ8C/s+PA6L7L1Vx5UjLDtCghReLReV2YgQHZkHiDw8yUPToKQTZlutwv4dst54ml/tM64WDtZCRExVqV156pvLr+MSRP/fn7Y7c04bjeV5eraxBuB3Kgl/gRVtYaYUibZ3QqbFi6G9l0YOvX8Z8KDnuhgxjX4420DnbmYneBKBFgMd1lxVo8AnunmzXfYZG2Ig9v7YSwTQse6QcnvJaKdRD70HVxsLOzRUTdvF+O6++DnbuWl2gedv167OLhY2DJh1UTgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=aObiZOO4BHfstwqolwg4DIGi5eqtH24hCRJx/LQNZaFd6KRz7wK7ceomhTS2/SGaAEYGJn7g81066F+N5A1vjEQozqgCXY/zroZRs2h+/P6u4U0AbiIZgh9BQ3VvM62Eoqak6fDTRDOG5Cn0/Ck9s2TJWbW6zwQ8LvN+5Ur0T+aOXZn//3OhDzR5Gwox7G1AM13WCmVqp3jow/F2H8HMTXImr0KTCk7H/XPsgOID0PTMOMA3e0a3QodyWvGUOR9ve4FCh7JS6ApzLK330QJ4/cI0lpGqzG1tML8M1dNaVLKgVnpnI9v29BoBkwT8zN63iSyR3/VfVrq0nyJAQWG4KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=nSz8JD2oB9EW7YPFfb0rohANkA7PZl852TCy2tfOmNg6PUliC3xYoRAqBW1fG6hFkyUuEPCJlt+vqWfKKPRhw4CTfX1uMivp0dpRuQ6zem7cHvThNDOFU+tSqUWtn+gfZWVmrNb5tkT6iv34+6aWlTs+V8e9dmMtut7Nt5bpELWD5IiH1ZLEYWUKHtMzc7cw1dBYZgWTMDHTMp9D4QkrQfliZqwMbi6RW/MevU2igYhJiOF5gqHfMh3tgxyESkucHeYosn5mYKKC1RTT0Zkupe0HL/s4PcQXApACuf3s+LIgzQCzue8UDJ95Rhk1/FWHcN8zwDexuP0FZRDvxyzhGQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:54 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:54 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 12/15] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Thu, 13 Apr 2023 12:06:04 -0400
Message-Id: <20230413160607.4128315-13-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB8325:EE_|AM6EUR05FT048:EE_|PA4PR03MB7024:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e73caf-db75-4b20-006a-08db3c391e3e
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  tyUwaGmeEC7mWJkbSFzmP/1MZjhW40+CWn5b+ypngmXQKGfCZqCLf0WFDquWe2WNZsv6JvAL5LMdcdq4r75GWeusKoMCP60akJtUK2VJ2E+L5yE0Cx2xgJCYIMZb/W+cgtCXOOK7rgzQbPzFWtcKXXphKmlfSzq+cPAM1qWcR06TS0F+sEjHLzqfsZteRPj6NuSO/hITTSCAh/d4ydDr74ljqQxcIYcxUNN0idS/XhUV1G6NeIQpAfxtPzKgI+f5QLdoUaithru+W48UobZ9nWsPtpp+hEBoOhWU9BkkUoxT/FHcwAc05hZzlCYmqt7baQbI9/Bo6nRT5P6K+gyC2Ox8XWTzrXaVgY1r7jxLBeDqBvNoIAKQicSQWqlolAgT2AtbEImdTgIDeW30D+KLuBuQkQuzKgGqCuzWeVafkUwMlLs17Mu46mqNimYhRjAmRObQ3ifvHnf1ecTIf5+jkE5HhWYI7WxdA6IjN7QFl0YEFaJA67633eYsRsgACoEOocDOH1t3LwMLG3lmKF3hfAJQJIr4IHUTroiunTB3QeoMpz+MEJt+Ig4vJ0Gv1LLHc5MDk6dTOlWTng6OKe0rXLnQycecpgS2SHvgYrIGKF5ChC95D/BZTsMZ1decX7rq
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(6666004)(52116002)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(41300700001)(5660300002)(8676002)(8936002)(316002)(38100700002)(38350700002)(478600001)(54906003)(6512007)(6506007)(1076003)(26005)(2616005)(186003)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	2b03afed-a127-4ff4-f6bc-08db3c3919a9
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	2Yc4st1Rr8zCXg++UztLUnZFZ8p74UxQspcjt6YxTwrMqozpygyp3qL5VqqobBUT0eNMKjjjKoXn8rvzZcTczdtGBVKTJ+KKGMw7WsK3U7qciUiHLNPCx3xix13W9HKYv60mVG34Xb0kHaCF2ysNjbaNc1KURgbqGvlZFQFjNzlRoeABbxYDtZpdlxO4EsGdqfpG9xcc8Zmg4PY0+rY5vzfzaU7h0ddTN2V3OM5KdN58A19Y+5LdAyVDkJviAMa9hxM77jnXaUUsQTQB9Bc1QMIuQvpTX/9DBPxLIXJvFeoVuOEK30lCY6Pl639a4cinf7NyUb4Z0eQk+mnPTiUjzDvVgIsNoxx4NRutFAQrtdqlqvMa9RFUNo/YAam7DiDhIvO/Wn695A0olb7mufPxrsVFATqRG4feFz4gdsLgtoeOKsQAHgf77GtrwsKqigcGB07ztu43dfkzaxKsB9hRA6ScIUt/HaXNqDaz+F8ejOnUuCwGi+6hgzGJNt+wYm+9kRrcYtlusRzh5BsUl9azk0xEs5y09CegLqOoU3DtsqvjXm47yOed1xeJwXnE66DQnVDQsiaWaLzj5AClXZCD7VsO0wjO7xBCGYDtSgWG4YBa7j5EGpuS9T3UJL3QgrcdAa9rAELozf5HIvYzGk/ey2olKH/bPHWy6Q4OPPNXr3HHKF6+lp/yOXM/LG0Ix8yR2AVoqXCYbbsoJ0TTVzG/zcRZHCFHncBga1q4PHqCf+gMatMit26+HsFKJ8nh5CwGHTJzYwkmid1plPa2HsR9Ig==
X-Forefront-Antispam-Report: 	CIP:20.160.56.84;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(376002)(136003)(346002)(39850400004)(5400799015)(451199021)(36840700001)(40470700004)(46966006)(316002)(83380400001)(34070700002)(41300700001)(110136005)(54906003)(82310400005)(86362001)(36860700001)(478600001)(336012)(70206006)(2616005)(8676002)(4326008)(70586007)(36756003)(82740400003)(6486002)(47076005)(356005)(2906002)(7636003)(7596003)(8936002)(186003)(44832011)(40460700003)(6512007)(26005)(1076003)(6506007)(5660300002)(40480700001)(6666004)(7416002)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:02.0614
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e73caf-db75-4b20-006a-08db3c391e3e
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.84];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR03MB7024
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

