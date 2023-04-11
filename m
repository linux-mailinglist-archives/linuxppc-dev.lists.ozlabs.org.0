Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 035A66DE469
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:57:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww7Y6PfDz3frt
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:57:13 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=U5B7whMw;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=U5B7whMw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0e::316; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=U5B7whMw;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=U5B7whMw;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-vi1eur04hn0316.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0e::316])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt547vXz3cMs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=U5B7whMwzlCGWG3scmWdRgCy4LX4raYWdoRMfnyj+1wJmMJCW8QUZbnohr1ylTkv8gTN53NCvrZRAVfIBWrCjifIoxmmP9v1T0Q/kIX7cVsTl192267gOypbE5Z3DiEetBdALk+svtzpX36QtN7FObR7lkV8yfvBsz7Tn9OgyRXN5bzRvG67k8Yt91WWUK/7gfXss2rLWSo6c7TQykbJCP7ghL+qGpCC88TEKVnIjyv4+m/VUV5tdpzEmEGOhd3DCrc8sYIZ/oy5d6zv2yktziDDZIJuz4lDs2IyAOqFF9opdjZAqZC2sVi7U9jIx6QxQLsN6ivGQKlePRx8NCUMcw==
Received: from DUZPR01CA0123.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4bc::8) by AM7PR03MB6546.eurprd03.prod.outlook.com
 (2603:10a6:20b:1bf::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.28; Tue, 11 Apr
 2023 18:45:15 +0000
Received: from DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:4bc:cafe::d2) by DUZPR01CA0123.outlook.office365.com
 (2603:10a6:10:4bc::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB8EUR05FT021.mail.protection.outlook.com (10.233.239.32) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 18:45:14 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 331C72008026E;
	Tue, 11 Apr 2023 18:45:14 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id C035E2008006F;
	Tue, 11 Apr 2023 18:46:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cbIBsGMp8ZynYCwB0pMFJmgc6MdT7HVFTKujHjkb6phFFcU5ZRozTm7I8CoiRdZFH8U+3Ir5G6PQfSkSnJH5CO8KUOG5m3wZdQbMiC+a8ajuani2P5gdfzqwbhuBYAj8nxunmWApNGztH51ScddCju47br0tyXtDPPBTZpUAesYgrLC3L0tPYGgJ3kqnjbdQrVCb0Vv5A07XdZB51utnIVBeYAClKB8LoFuKZ/gPqOYGERF2V2oQG2ALUAoV2BgxYBnQnEzRnBOyqzo/+GU6QOABm5kT0sSow20cpubsjyjbPPdtfzHxeAl9/LXqY0zCIjhn3+VMFAZ4t4U9luSoig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=BWZrc+PeHhtEbR5YPcl6+AsPgSRV7m4v9YOzt3aQW6JSSGRQxz1mFdIPuw5gybnRX/OkbMxVUhhk8TlTn1YU75nG/+FrCnvWIL74aKe9Sxfi93jeupfj6pod8EYOA7d+lBv13WvlW8xC14b0PSztzyOwBAt6B/rDSSF2mI7+fU6rbElNnQFeQBEnzFMGgfy0WkEQMZ+CVa5oETjHTydmFij/v9g0Nmr5wJG5wCsZDLcg3Otv81r5TyWoR9n1/GKkuveJs6yYbCHQd+36QOO2eLpFSYz5XLrReC//s7n/33Bhn7pkR0fTRa9Gv3NogNoB36ZDrG+towWuaZn/b+WQyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=U5B7whMwzlCGWG3scmWdRgCy4LX4raYWdoRMfnyj+1wJmMJCW8QUZbnohr1ylTkv8gTN53NCvrZRAVfIBWrCjifIoxmmP9v1T0Q/kIX7cVsTl192267gOypbE5Z3DiEetBdALk+svtzpX36QtN7FObR7lkV8yfvBsz7Tn9OgyRXN5bzRvG67k8Yt91WWUK/7gfXss2rLWSo6c7TQykbJCP7ghL+qGpCC88TEKVnIjyv4+m/VUV5tdpzEmEGOhd3DCrc8sYIZ/oy5d6zv2yktziDDZIJuz4lDs2IyAOqFF9opdjZAqZC2sVi7U9jIx6QxQLsN6ivGQKlePRx8NCUMcw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:45:00 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:45:00 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 12/15] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Tue, 11 Apr 2023 14:43:09 -0400
Message-Id: <20230411184313.3679145-13-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|DB8EUR05FT021:EE_|AM7PR03MB6546:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c22ca68-be6e-4ee1-665f-08db3abce35f
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  CJcO9pMt9E8SCKtGwvbTsjCwozN6UTqbbveKLXBJAVYH2Kf9i6ENkhs9kq18XjW6g/hxhtGOcV6Z5OzBmQxku7FvTMndint2xnURt4W/a7qM0MnhhRqdNaAddrH0JdALXB7vudpVY6JCpFLgrOfubR+wksQl69LNyqryYjRN0up6eTh4BlO3aD+Tdjqxmqv8wKdbvOwq3ntubv5tFhZpPTGqMe4kHMRhf0DdhrNVJyGVspFHBDViroKotuW2x6Jt5S1whi1Vnl1wemI6p+us3LkzA5MtT2N5ROGmldMiB8KOW6dzr8vG3hYX23Y+tYzzH1u4ZdkcESC5QVnlIWGajWp3XVqumWSUQ9LW6ttcofWlYB66y0g0ZZGdoN/RobX1Qsfd75nS2mkhfs8UKoRDD6S9LZqeq7OLVj8EnPb5N1ibkgcF8d/zNlboxz9Wnm4F9qA5auy50ajO6cqGsyVFoyWZ8LFQ0iW+HwD1w/pzQ8mxJjiDf1A0VVgcoh3v5604t5mSK0AAuklaAuFEP04WqGzVBd/EeIQfXtyX5XJf5laJlQjgZvkfrj+3uTsgvVL/wLQZ48r8aebZiH2+3Du24L+QCQfh0OkBHFFkSU5UWvY/nYXqmIuyWs6736dfQqkY
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(52116002)(5660300002)(7416002)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	0c9cc9f0-8d3b-4f43-5a67-08db3abcdaf7
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	W6G7I38orXPbScgeqA4MbhsCI9HvDfec3HEhw0KnsnQdVZApzBxgQVCHHqs/VBn2GFlNO8HR+9uGnfWk4+CjAWs9zexXBYhM0Zk0PEhSui6vaGiPF+y1wDN6nfL0hd5TNZDF0WJGrCkGmVMFLNk41moRZQ6mspFdc0ZHYnpyKSm1P/CykkyIpJtaJN38iZgWTf6AmyP1e55ise4aCOqs/rriuciTGQsMh5RcW28MIvp3RWhdW2wjpvbYDkwNqguR8dKcU9S00DFX9EseX6XHeEUqCJgY8/0oRuF5p2jADynrAJ2crHjU9GzY3hPk1MRdv8h9+1cJWzpV7zhw5olp8bOVWSRQhABedAWu+y9Gjt2IMEewEMCDQ3WY7Anlm/0JqhWafF0HQ3h7lKFQPQu9waKv5vYlkKtN/sGvx4xFAPd8Brkaxs77/ou1CRFX25rFpO4gn14vxzOL6YJ3z32ZhtuZVXf9lGgPk8CGl6Q+95XoyOznHrY+ihw8NpqffBvLXH3ANWMfVo8NTFAtvoNaTloglPiGVUeJRZSDqoQuQ2B64r+y9HtN7RY3LAKm1YD+LSRxEtoZ12mPGe7/5AqJmFzD5W/0b1UyDqnG+Fq1RcwFw8sW2sGOQa0jOZFEo5vOB4MJdlsxDXxzAUhAxuG61vck2qahkk93CRGoZFWNvUd4IaUmJROfgdVR0kzm+zla4z+Y+oXBplP9f1qgHA17D1DaQiD6dgRqbN6jyrp36mM=
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(396003)(39850400004)(136003)(376002)(346002)(5400799015)(451199021)(46966006)(36840700001)(47076005)(86362001)(7596003)(7636003)(478600001)(40480700001)(356005)(6486002)(110136005)(2906002)(54906003)(83380400001)(7416002)(2616005)(186003)(82310400005)(336012)(34070700002)(8676002)(36756003)(8936002)(41300700001)(5660300002)(82740400003)(36860700001)(6512007)(1076003)(26005)(6506007)(316002)(44832011)(70586007)(4326008)(70206006)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:14.5062
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c22ca68-be6e-4ee1-665f-08db3abce35f
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT021.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM7PR03MB6546
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

