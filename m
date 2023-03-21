Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F0286C3BC2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Mar 2023 21:27:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ph3762CN5z3fTl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Mar 2023 07:27:14 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oiUIusOr;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oiUIusOr;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe16::320; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oiUIusOr;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=oiUIusOr;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02hn20320.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::320])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Ph2rH0jgPz3cjF
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Mar 2023 07:14:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=oiUIusOr4WYscAZnFEKTuQdl+RkngrPj0cUR8sJpkXWkqSodr/pgPgWwi5Tjuxxf5Eu6/L8ByqqUxQfOcDlviypGzYYlCZBNFc3n6ZLBKgmDqamz/nsL/aVIp+BTY9p6kv6w5HfVgevFYegz6+8bv6UIlLPwx/sGJwCEYBt4gP1K4/fNkhyBYJ9cZmWHXGQGV21rHQnYCvWgp5qOwlwnTAn/5YZ38t3o7KBGY1KrVhucbXQPCPKoGRu9re1nQljnlj4Q2ZG+OHYGnk713R304qd61CacFIiXkPE21LLvIX72x04tuOiM8piiV7KZFuBK5m9LYOuyINcXPq2k843Dyw==
Received: from DUZPR01CA0196.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b6::23) by AM9PR03MB7459.eurprd03.prod.outlook.com
 (2603:10a6:20b:268::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:14:02 +0000
Received: from DB8EUR05FT050.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:4b6:cafe::8a) by DUZPR01CA0196.outlook.office365.com
 (2603:10a6:10:4b6::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37 via Frontend
 Transport; Tue, 21 Mar 2023 20:14:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 DB8EUR05FT050.mail.protection.outlook.com (10.233.238.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6222.17 via Frontend Transport; Tue, 21 Mar 2023 20:14:02 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 39EF82008088E;
	Tue, 21 Mar 2023 20:14:02 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.170])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 922BE2008006F;
	Tue, 21 Mar 2023 20:12:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nnhHb5iUABCN8Emks24mnldqW5+0QKAztNON+Jqa11B8KfxmBfZFAnVEd1nU1dhF05Q/QoGz+DdVnr8BYuhM4C8zSBmdYQ2bN09Adf9bf5/VruEgQsM18Q1BBMJzLaCKDl/QWtIK39+cLP+OlnNZ3R/85uj4d94Bodnb7lx2RwHQjZfUmK5qjAROl6QkwKmI6uivdlsbYOkNIgeUHxzn4FD2OjIo5NYoLz4VL4GWrN83FrS9cI65J1Fqsp3kIzqCfEg6xiEzR/v/VQR6R//1gQx24v3VM/IOP1vuLMC6eau90QUiAnQ8wVdvU/Fgi4uZmxbz9AnqIkmi3cb0hZl1Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=KZttIJXo3WxjfwyyScLA1ow2UgSeRQfnftc70UG5OSMSzFPNaFYrEoS0RpA8WdTw00vEs+0Ejq6XxMpK83xv8vyTRcTWuq5Dj2mTG4H9eHofdcouNrKMJhsRZwk+wANBRFeLiSkqwgljy25Q5aGHWFRjJ+zpBB8EN17IbWhLezY1cXG6/yemjGPiEGCN1GT2wb0CuQ0t5h1Y40HeoSu8Dy+35iY3RMp6rlKHiQNV5gFeytpru8/pEHaNk+ET99ZYZlm+FmACM2KbhQeflTtSTNgxZro2v2sadsMuPs0smneGEuTj7/ifhkU3SdafUpUZed1IcWphx9s1zIM5ds1LWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=oiUIusOr4WYscAZnFEKTuQdl+RkngrPj0cUR8sJpkXWkqSodr/pgPgWwi5Tjuxxf5Eu6/L8ByqqUxQfOcDlviypGzYYlCZBNFc3n6ZLBKgmDqamz/nsL/aVIp+BTY9p6kv6w5HfVgevFYegz6+8bv6UIlLPwx/sGJwCEYBt4gP1K4/fNkhyBYJ9cZmWHXGQGV21rHQnYCvWgp5qOwlwnTAn/5YZ38t3o7KBGY1KrVhucbXQPCPKoGRu9re1nQljnlj4Q2ZG+OHYGnk713R304qd61CacFIiXkPE21LLvIX72x04tuOiM8piiV7KZFuBK5m9LYOuyINcXPq2k843Dyw==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AM9PR03MB7044.eurprd03.prod.outlook.com (2603:10a6:20b:2d9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Tue, 21 Mar
 2023 20:13:54 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%6]) with mapi id 15.20.6178.037; Tue, 21 Mar 2023
 20:13:54 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v12 12/13] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Tue, 21 Mar 2023 16:13:11 -0400
Message-Id: <20230321201313.2507539-13-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230321201313.2507539-1-sean.anderson@seco.com>
References: <20230321201313.2507539-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR20CA0026.namprd20.prod.outlook.com
 (2603:10b6:208:e8::39) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AM9PR03MB7044:EE_|DB8EUR05FT050:EE_|AM9PR03MB7459:EE_
X-MS-Office365-Filtering-Correlation-Id: 11a035ae-ad76-4f57-0c09-08db2a48d072
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  CxGgjuF/an0PnOL2qON2QoMbRPbygGju4rZXjPvBj/AqPMuVTdvYeYfUV4SW7cQwvuBKco22FnWNfe5T4VTZpwMp7ADpoUl/hz2UKwXP7mIy6deS9QUQkCXaYjWVUsLVKSggFy05at1tV1g7KfSdgKb5L2CaQiz0eueA7fKHPZmr/yEyzz9LgGftt5dIKwOgD2fEOVOKu4bC6OmX/clFXY28dDjLuF+0zUNJUE0RE+mw7p997nbVf3Kp2TP/WSrcf5wA7UI6ZumNLUSrUZM0YoyFVAowsw564EpqLEq7G1GuwfAmxbqy8IUL9vo2DnIbrmP9g6AspKt6eqM9qQ1Nd+RQLjWD0wI15qYAg3yixgGPnRVAbDA0HrWTjeJTmTtQ1Ck0Re51QJoYIXb24CCv4Nz4NFmzHVtOPOnm57eROBadLCBdW+XTLG6zs/ZRukDuCtri7I/xEvqI/S+l3h5xUXw38IpJjHYN8uGkICfwUWmUXLjmyhk+NLxsjT1llcJVCZ8z6FuD3xBpVcv9ZKNJ7Khw06CugcRHKEcPw6cwh8FnD/ClnsrT23BaGU/j/2zB4IDPA9I3CdYKBeJsI7WGLzDNXu/Yf3sBfiy+6iB9oOH25JvSa6hn0XzX0gZYrSp9CMGnUh2mljD9CloH96FIiU4z9NtddeLXtvUxzFPAe3yAan7Gp9wuh67+q+TouBnwtFh5J9FMCuQvTahMKiJdmg==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(376002)(396003)(346002)(39860400002)(366004)(136003)(451199018)(2616005)(54906003)(83380400001)(6512007)(7416002)(6506007)(6486002)(478600001)(316002)(1076003)(26005)(52116002)(5660300002)(6666004)(186003)(110136005)(86362001)(38350700002)(38100700002)(66946007)(41300700001)(44832011)(2906002)(8936002)(66476007)(66556008)(8676002)(4326008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7044
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT050.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d0a2e4f6-3c36-4082-9dda-08db2a48cb3a
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	RVZk76cLBLCPEg5StOZALKqZq3hOWTO2fPj07w41d3dcvo9pCOPY5XP4QcDty+kryvwTYzkelgNzYngc96vAKQQWWJ3HoNGH+5ojlSIaM4ZsIz+qbA8IsSJ35HQUW0PFQABzi77Xla/jHxK8DA43nXuqQqshVHFvV/+pxZZaZtzITDZIvMsIeU1A6EnZLPT/r+0ZvKo3PIr4wgTUAVlPpZP6O/dRfhe4BeUUnwTEXvMgVC+WMl9bQeXOH1Om6tyDYNwad6EohAsVF74ZebMdPTkAFNhCD3DNesSbxvYfVfYaSynD+c7zpQ7qHY1NXrhGUl0UurIQ/AiEXfzZLhmeTUaSNSnlzWBmrMvfLE1tPCio0wOrpP3rLsrhWNpx1YWtrv/fNU06ij8KH0V7ZHC4GmDeYyMNJmOonABvtlyvcuFkiWIOQoImdZl5xmAx5nZrSOuTDWgldtSlFPajA/K+FHA7XCHZrQ7DPoZXCANMb1ybU3ZKgZFfRGR/tJJwtf24sUcK6Xd84/5EpRW5pOc9YkaGDZJ7oJ9+h4SG7sKbaFxukJqy7Muq3P8g8b7uysf57NaxlKzXCbwNSIz+S1LEJIQSeX+XTe5ag/yxE4oeBLIzfVFy1y9URHsByFfwdsde+ldVv2nHrU9xT0XHN9k79EGbkcPe0tpEtp+EQ/e95bkK9XECXamY87PAR2OcQnskGJj6sLk9t+qIgOQxeXToboce4LMex3VRliPOldaf7fHfNuF690GrrX1JoxbP5Gv9R0UZu0jagY9oV7/A+v5FWQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(396003)(39860400002)(376002)(346002)(136003)(451199018)(5400799012)(40470700004)(46966006)(36840700001)(110136005)(2616005)(1076003)(6506007)(336012)(6512007)(47076005)(26005)(186003)(6486002)(8676002)(83380400001)(4326008)(6666004)(316002)(478600001)(70206006)(54906003)(70586007)(7416002)(5660300002)(8936002)(82740400003)(7636003)(44832011)(34070700002)(7596003)(2906002)(41300700001)(36860700001)(356005)(40460700003)(82310400005)(86362001)(36756003)(40480700001)(12100799024);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2023 20:14:02.5266
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11a035ae-ad76-4f57-0c09-08db2a48d072
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT050.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7459
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

