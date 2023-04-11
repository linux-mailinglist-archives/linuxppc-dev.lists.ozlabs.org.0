Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F35EB6DE46D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:59:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PwwB06KbWz3fmd
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:59:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KaHWddSp;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KaHWddSp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::31a; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KaHWddSp;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=KaHWddSp;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn031a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::31a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PwvtJ1Yhtz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/5ZidoOwblv8boPFBnKfSvOWKFcGNl8uH9DMZAeTSw=;
 b=KaHWddSpwEYE+OYdRLK9FH5SPGNB9UjqOOskInEi6dTX3uBmBiaE8c2bkRmjPXDnIUoKT/0FEnDC+UVH8MEgE91Dr2Yfo/NOix/g0GsOqShlAvfL0gcHlnN8KUJ2uqRog3zK9xngf+0eTGReqS/lb/e74z3irzPVbHGpQRfjZo3qT4dswKP1+B7b2L45zUNCGdNz/RBXN2d56CAlIITdVP9XcRHSbULvei7eDWw+aiheCOpeC6mMGGXKnZcoVbiQ1F+VIuGb2/Abdd0/dncqVzYNiplBQy3Zzh6Vnf1F+B5A87pc7Aj3CZamoWT/wbGq1G5/P/7Yw6gRvWQ/u6/ctw==
Received: from DB9PR06CA0025.eurprd06.prod.outlook.com (2603:10a6:10:1db::30)
 by AS8PR03MB8806.eurprd03.prod.outlook.com (2603:10a6:20b:53d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:24 +0000
Received: from DB8EUR05FT025.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::7e) by DB9PR06CA0025.outlook.office365.com
 (2603:10a6:10:1db::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.40 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.80)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.80 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.80; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.80) by
 DB8EUR05FT025.mail.protection.outlook.com (10.233.239.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.29 via Frontend Transport; Tue, 11 Apr 2023 18:45:24 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id BE54B2008088C;
	Tue, 11 Apr 2023 18:45:23 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 908EC2008006F;
	Tue, 11 Apr 2023 18:46:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F06S64yzazgGMiRnyBlOoIP9apX18DD9VH+wrciRi7dwT9E7bWNtjauTu5NuOObsp7JnATxvEHs7jAjrwE5REaBlHr0umS+0FDKlvONK5dNjNiaBLE6IJQTNWgQW4Iz1r/SDtqdcELKXuM4jm8TCtOAVWWlPlKaaDTRRlCIf01sawEwChPs48Re5a3QuB8UKubcj9wL2Ua5dcjGcdh80yqIDgR3QNDnFxhtKcPMpEWH9SiU1r7pLU4c7rnXnul4pnUewsOdxv+Ty4DBjj5nL8MP+zZwtVxkg+XqUVUmNZta/AL00FIZ++UAeC8It3AQkgOadBVjLoxzy0Xna1Mt/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j/5ZidoOwblv8boPFBnKfSvOWKFcGNl8uH9DMZAeTSw=;
 b=LevvINTa/+LYB7WVU930U+pAc9A4yhKY/AvkvGfMbLSOEYe9vTJWDtFrSpvY/PiFKZ0sdDEQOHwtUM1z2P667YqjDVQV5+Iw71NAkKvnxmkEHWRlsGgAAoiCKFjjowWRsVQjFe8nyVHVi0EXRFx2nD4iovWzghKigLMBn/wFw/zRzReUJUBS5ezh+FGI/yzY2Y9obUs8QQMg9gUYR8o3PPNld7pBw/wm7d/TXY5hP6LnJJEdk8T17I0YnygdtGDxM7jjIhbzhuNXH+Cjc12JKoUl4qvl6H6yOr8tb2alTqsYRN8Hm6JzW+k4dRTysN1RceU+ctSAzXIIznw1FZ5Drg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j/5ZidoOwblv8boPFBnKfSvOWKFcGNl8uH9DMZAeTSw=;
 b=KaHWddSpwEYE+OYdRLK9FH5SPGNB9UjqOOskInEi6dTX3uBmBiaE8c2bkRmjPXDnIUoKT/0FEnDC+UVH8MEgE91Dr2Yfo/NOix/g0GsOqShlAvfL0gcHlnN8KUJ2uqRog3zK9xngf+0eTGReqS/lb/e74z3irzPVbHGpQRfjZo3qT4dswKP1+B7b2L45zUNCGdNz/RBXN2d56CAlIITdVP9XcRHSbULvei7eDWw+aiheCOpeC6mMGGXKnZcoVbiQ1F+VIuGb2/Abdd0/dncqVzYNiplBQy3Zzh6Vnf1F+B5A87pc7Aj3CZamoWT/wbGq1G5/P/7Yw6gRvWQ/u6/ctw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:04 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:45:04 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 14/15] arm64: dts: ls1088ardb: Add SFP cage
Date: Tue, 11 Apr 2023 14:43:11 -0400
Message-Id: <20230411184313.3679145-15-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|DB8EUR05FT025:EE_|AS8PR03MB8806:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bafbf53-af96-4af2-bfa7-08db3abce938
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  f1b1LMMhNw8tUZ0NffLteQYdXtd1F2ezc1pkuttwp7GDXmOmZR/Y1UToiHv/OImYXmvHLmojlm5eHKFsDBWKTvQNYrB/QnXrG1kEEC+RohG6PbdmQTLwFfVdx29BLWr+kqVuCkqcXYZsCSSmKe5zMvvnLvzFG+XGLgdC1EZ2CDiZFk9re+XbKnkSwELgMQOgoyunWWUy0HaxgUeX2Zfdo2A1N88yY030dMzZ2c7hONkJ5Ha+MNMxF68+jGvGY3295/zYIP9VRh2pOBGHT4HSm7ynsXt1yyqGlDk5PwmNkqhkXHZhUXbv55PKAE4hlUIcsAJL08K4Sz7MYDtxFIXZTkbxjpUrygeVaceFMm5rtVSsd51WNJBZS7aUs/L0M3e0pYNCWUpFVqDWedkSMBlDVuOcMX+mkagN0o8HLahGUt4/NBAfoN3Bl9t1A4uoiyM0r5YBYalF59qN9JJwMYqzYuVbj6h8EdRYsedjke26WjbPZ5PMGFdvB8BYI0eSSzlzhPWLq4g2Jeo6WoHu7UFRtgHmXCZp1geUCf+C4ns4xnN1OgYOms/xIFIcgm0qshOMLEdNHdYUtLw184oRbOFm70eSu2ev/u/Iru321vqdrPy3LwCzejI8yfO3vx62NSBx
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	a2914f07-5c9c-4bd3-a85e-08db3abcdd31
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	A2D+WDI0vx3Hrslb4YGVsKVcwJqnXEKPao9vVhI7pq6WRMpDCever0e8+41AQaBlTK4xwvRv10wtFT9OFOKlT9zrubQbTCTEFgh/0aDekHBLdZFhBiDcVad7C9HXTKxxiWgR1XQXH4bsDkAFqtkrHXCPmZI87RuXUvD0tvvtYdqO5jk0o3/UhPUIdOWCDDGVBbYcFItexu8MY2SIxJVODyic/XRcgEYkMi0RS7dHxi7/4z+pI8EFlocmkmf7WMUYXSh/OajKF99Owe9hQ6Che9sswm41ELe55IorJfxrMJZsqwGg0qys34UxtG7LMeqFGkDFfkJJimjHk98OgH0G2++/hWRvrHAWOJWRzqf7FQRCrHTfSfsTc04Q+l/nmSLBQ9pAAEz+zWlUeQXEU73QuNdALqevOEW7u/6FUZKOJvtwCtrrlFN1YzH0MuF0HJgY6a9ttO3XGJ9PWpoRnk2YYqdJGxhvJ/JPdicGXvahjO5YHCsk3mDwsFPwhAMLyeezsEMh3qq1uSucvFwkllm5AmoqqBFc+5WCl4Wz2xpq/AM21htrzzzWmjoF2bbJBS1D5aU5mFUL2dIrg+hrLHv1cy3o1KnnRxKaQnOZYCn/mArgphNP+kwtm2c/N4WJqlRCXTo+sVGiNqq9DuVhRgNQEWaV94KaMEPEzVGAYS1f1p44eMps+tBj2vLZOf+7iY/0KunkaWjgl39ShZfPFse7F89Oukcupk4oOEz9yFIdk1UyrxTh0uNidjgeEcEGRhSNBF/I8XfQVQGQa9yHTGkikw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.80;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(396003)(136003)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(40460700003)(26005)(36756003)(54906003)(478600001)(8936002)(2616005)(6486002)(47076005)(7636003)(356005)(7596003)(82740400003)(44832011)(6506007)(1076003)(6512007)(2906002)(83380400001)(86362001)(7416002)(5660300002)(186003)(40480700001)(336012)(36860700001)(34070700002)(70586007)(8676002)(70206006)(4326008)(110136005)(82310400005)(316002)(6666004)(41300700001)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:24.3192
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bafbf53-af96-4af2-bfa7-08db3abce938
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.80];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT025.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8806
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

dpmac1 defaults to a fixed link. However, it has an SFP cage, so we can
determine more about the link (such as whether it's up/down) by
describing it. The GPIOs are part of the "QIXIS" FPGA. For now, just
model them as individual registers.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

Changes in v13:
- Split off SFP addition from serdes support

 .../boot/dts/freescale/fsl-ls1088a-rdb.dts    | 51 ++++++++++++++++++-
 1 file changed, 50 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
index 391c2b8afa81..9fb1960f1258 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-rdb.dts
@@ -10,11 +10,27 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
+
 #include "fsl-ls1088a.dtsi"
 
 / {
 	model = "LS1088A RDB Board";
 	compatible = "fsl,ls1088a-rdb", "fsl,ls1088a";
+
+	sfp_slot: sfp {
+		compatible = "sff,sfp";
+		i2c-bus = <&sfp_i2c>;
+		los-gpios = <&los_stat 5 GPIO_ACTIVE_HIGH>;
+		tx-fault-gpios = <&los_stat 4 GPIO_ACTIVE_HIGH>;
+		tx-disable-gpios = <&brdcfg9 4 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&dpmac1 {
+	managed = "in-band-status";
+	pcs-handle = <&pcs1>;
+	sfp = <&sfp_slot>;
 };
 
 &dpmac2 {
@@ -170,6 +186,12 @@ rtc@51 {
 				interrupts-extended = <&extirq 0 IRQ_TYPE_LEVEL_LOW>;
 			};
 		};
+
+		sfp_i2c: i2c@6 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			reg = <0x6>;
+		};
 	};
 };
 
@@ -184,8 +206,31 @@ nand@0,0 {
 	};
 
 	fpga: board-control@2,0 {
-		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "fsl,ls1088ardb-fpga", "fsl,fpga-qixis",
+			     "simple-bus";
 		reg = <0x2 0x0 0x0000100>;
+		ranges = <0x0 0x2 0x0 0x0000100>;
+
+		los_stat: gpio-controller@1d {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-los-stat",
+				     "ni,169445-nand-gpio";
+			reg = <0x1d 0x1>;
+			reg-names = "dat";
+			gpio-controller;
+			no-output;
+		};
+
+		brdcfg9: gpio-controller@59 {
+			#gpio-cells = <2>;
+			compatible = "fsl,fpga-qixis-brdcfg9",
+				     "ni,169445-nand-gpio";
+			reg = <0x59 0x1>;
+			reg-names = "dat";
+			gpio-controller;
+		};
 	};
 };
 
@@ -202,6 +247,10 @@ &esdhc {
 	status = "okay";
 };
 
+&pcs_mdio1 {
+	status = "okay";
+};
+
 &pcs_mdio2 {
 	status = "okay";
 };
-- 
2.35.1.1320.gc452695387.dirty

