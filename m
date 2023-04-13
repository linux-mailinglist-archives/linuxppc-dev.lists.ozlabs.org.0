Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3586E1205
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:16:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4TS0bTKz3fd3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:16:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RKF6n2j;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RKF6n2j;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe1e::318; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RKF6n2j;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=1RKF6n2j;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-he1eur01hn0318.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1e::318])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4Gg6HZHz3fSH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=1RKF6n2j8nGgHwng6EjaTwhgAe/5Zeh7KvJRNiKrNxZojFJVcUo1mJRMC8VCfGrrHfeH11sRy0UZWWkX6KRcYVnX/huhJmeAkM5bn4Y1DW0MXYIMk0sIDB7BvfRRnqHR0j+atIq++7wgpGxAsBJ42s68jbXWj4Q66WY26iNK9whM50/wbjf/YW9REIk0xLRRYuH4qz6YvpkDODHw5ZMsxW7VdPPnunvAe59/arERXD2URpcx2NLQN13YyI9k1mVahu9p/GHRWen8o5mlmA2uZRS9Ze0IZgO9YeMEQcKiq3IzGAE4Pk0/ubaNvbtgh6L+tR+hHB5iLNM7Sz56uzLJOg==
Received: from AM5PR0202CA0013.eurprd02.prod.outlook.com
 (2603:10a6:203:69::23) by DU0PR03MB9128.eurprd03.prod.outlook.com
 (2603:10a6:10:467::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:07:04 +0000
Received: from AM6EUR05FT040.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:69:cafe::a5) by AM5PR0202CA0013.outlook.office365.com
 (2603:10a6:203:69::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.31 via Frontend
 Transport; Thu, 13 Apr 2023 16:07:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 AM6EUR05FT040.mail.protection.outlook.com (10.233.241.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.32 via Frontend Transport; Thu, 13 Apr 2023 16:07:03 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id CD1582008088C;
	Thu, 13 Apr 2023 16:07:03 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (unknown [104.47.18.113])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id ED56320080073;
	Thu, 13 Apr 2023 16:08:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PkEJaVJVsxQ9s9CUEYH9mmn2RLLns/8a5YzNjbMnVx9sxCqwiDC2sq29m/+0ymWeodPnL40BySy6LOTZWKtuujD3ta5N7tf5MShQza/5nbh3ZvbodlG+AEiCHzC5U4zndYsmjmj0K8ASMH5MVksjuCSdhQMf2emhW878JyLlDoaOteAXqywHnQOkTOgmW+maDdgTpD/ztpMUkIaxbNhLjsi5oIXehlN+tPMw4XYEXlMhTq1KIox8S4FmIMwFDzdNqP+SnY53NgTocTTzF6L2hVkCwLwky5Jr2oHaxn+yHDHsVUXLsDR48obhq2fieACRZAB3H3M0/acxzHOANoIvng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=mYv2H5zMP9Pmr8oqdy3cq1Cjul+WIAdg0xu6D156IhRDwb1qLex9AOuiOkPJWud9sYNx/McEur8hR95Gw8O1x13ljZ+8FN6bEmcZIsvYqX9VBRUqCz5g70DRxnxjabTcd4WSaaRbDGv43YtXN9AwUCqzGIvhBEQL1b6EkT5dskFz+g4vdXV74wheyZ+P7DosZhZYNfhXGCDgkU1C5kwqmqWFNxxafkSdQkGryTHFNDA66cswGdsvN+UaohRN0SBSQ2wTkCXWApcDOOx3R5uw9rkFPqjC60PNsV5fa4uvCSEOGvYL/VFRK7s9tMluW27klpO9UGaCpd4Hd7yJxKBrkA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=1RKF6n2j8nGgHwng6EjaTwhgAe/5Zeh7KvJRNiKrNxZojFJVcUo1mJRMC8VCfGrrHfeH11sRy0UZWWkX6KRcYVnX/huhJmeAkM5bn4Y1DW0MXYIMk0sIDB7BvfRRnqHR0j+atIq++7wgpGxAsBJ42s68jbXWj4Q66WY26iNK9whM50/wbjf/YW9REIk0xLRRYuH4qz6YvpkDODHw5ZMsxW7VdPPnunvAe59/arERXD2URpcx2NLQN13YyI9k1mVahu9p/GHRWen8o5mlmA2uZRS9Ze0IZgO9YeMEQcKiq3IzGAE4Pk0/ubaNvbtgh6L+tR+hHB5iLNM7Sz56uzLJOg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9369.eurprd03.prod.outlook.com (2603:10a6:20b:57b::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Thu, 13 Apr
 2023 16:06:49 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:49 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 09/15] arm64: dts: ls1046a: Add serdes nodes
Date: Thu, 13 Apr 2023 12:06:01 -0400
Message-Id: <20230413160607.4128315-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS2PR03MB9369:EE_|AM6EUR05FT040:EE_|DU0PR03MB9128:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b979e4e-acab-4271-cfd6-08db3c391f5c
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  avoqzQBv5BAxvwVCO4na5LzUX9AT3b4wKlcCIweV37MI7kO1B42lNao773upDF5Sdj89NTCSgFh7eypmW9a+uzBiu7d56JPR3j5idK9moKe3NMcbFF5QsBfZVB3iAQYC2gs5kh+Bk0UF2REtgxO583h/xEu4Wd7MrX0yHO444/3McPCdvaorFMSTrdZxzCWaKvY8aT4N0mAOXichv+gVr1aXdaED/ZE/eiNFR/5Vey3zLiJxXHC6jLKKSyct2O1tPTHMqUcJ/Kki+VRjTrUg2AFU/AIRfAXsP2a452UOQL/AhcXQDL3LJdpxYCjDSY9hQTV1IiUzxX5CLzm5eE629Vg8aKrE6i4vJcpnwOJ8m2BV7sYjkFa2wsK+adVKe7OuATNF2LiRzPYZ+XSTmOaj3VLKAagZHWv06Zs/ZpvODGTt0ugkeFv2Wm26FCYgQzFM/hneUC5rQZLUN9KYbKupCLGsaq4f/8cKBLsSIBiWlfi131TbQESks15/pt1Of9ShJDrxnrBTPGj6zyp3thEnBgAU1Fg197OQVsli3UkoME6Z4GEFikOZGFpy6avUzEu7g9MopAaJ9eyQ0xAGXUrxAsCixfYpM7IYy4cfHALgfHdXcodIRXdXkZkvNtTEPe1k
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(346002)(39850400004)(396003)(136003)(451199021)(478600001)(52116002)(6512007)(83380400001)(36756003)(38350700002)(2616005)(86362001)(38100700002)(2906002)(316002)(6506007)(26005)(110136005)(186003)(1076003)(54906003)(5660300002)(44832011)(66946007)(6486002)(66476007)(6666004)(8936002)(41300700001)(66556008)(7416002)(8676002)(4326008)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9369
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	b8d582bd-f255-43d9-0160-08db3c391697
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	idxBrzrGS1JHa6RJlsWylYnqFGlAPloX7xwtraolcjwNfdamvRsrdwOuVuD2/oMckKpf/6eey8kVvKUbka3JQv/gEAlSEl3AWxM36o3/GaI1BhIKq665FFeyR/1iDbSHP3cajuhX2rvvuh9sPFa3sef3Yiada6dvPkOP2FkG5GTUiQbYKmFnQ2lEEFegjWLCwP2WQR6iSH0ceLPnyJGml4RC6pxqR0s6T9sThlYwjQdZCDwHBog/ay0me+3lLPK/Yl1kfdCjS8ldtQVJPHqYCRSDvh/QUdEsUicXn22y7GjkVNduLDcROo61a/20yOxcuttHExGq5ajIGWSFKRUvu529X04mcygem4qgDERxKDvsdGLb0QZ0wX9L+xmV6PuozVjHPoEq7wvOTyJeKVd4D9K4gPbSuIf/Q0HtRQL/6F6Jz4FKIPdrkBDY/65RUL0MHoH/FYy5XkJtlkgU/xhEdDEDUkkSV865hwFPlxFI7COfa9t3K7OwLHA7EgXAPUAqYsHBdO/KoosV+abPwMjxBD32blVklcvDzjQdlEemmVWq91TIrqxj1gv3QcUON8aiLK/6L0m+iE+Ymvsuit8A6NzKOqYqpgkiJjG/cDIupoS5HoBihkBOM04mN/O0GQxqJcttcTmXfuMtscFBiyR8RMDFBdzzIOZFwJf+IV5QqnrzxYlBLNyrVSutHqoBOawQmBji4CECgfD4P9edFacoDJIfZmUENTpfaDmJUCxViTqfDddRH3pNOxQMLCZTFxdiXXWFTACbMs1jkHV/hyGifw==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(39850400004)(396003)(376002)(346002)(5400799015)(451199021)(46966006)(36840700001)(40470700004)(110136005)(54906003)(478600001)(83380400001)(336012)(36860700001)(2616005)(6506007)(186003)(1076003)(36756003)(86362001)(6512007)(26005)(7636003)(47076005)(82740400003)(7596003)(40480700001)(82310400005)(34070700002)(356005)(6486002)(6666004)(40460700003)(2906002)(41300700001)(70206006)(316002)(70586007)(4326008)(44832011)(7416002)(8676002)(8936002)(5660300002)(21314003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:07:03.9567
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b979e4e-acab-4271-cfd6-08db3c391f5c
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT040.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9128
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

