Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D986ACE0A
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:28:49 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpXb3rJdz3f8B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:28:47 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gR89kiXY;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gR89kiXY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0c::319; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gR89kiXY;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=gR89kiXY;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-db3eur04hn0319.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0c::319])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGh3jXPz3f48
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:44 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=gR89kiXYnP+Gbtr6MSn1u3c+3nFvsv3KHs9PNGwGoIPSumJoYZ2bpPhrmMDlBnX5Bx5mD92coShLFYum/4VqoFdvzpShuf51eWZdoFMO8DM27K+rpGkBtLNf1gyMQxh4Xt/+dEWbwkesOLFJ1Z1jV+zC30A2A0pSJc3+SeHwp8N0Tzv1IQFlQ9h71OHzw7v2oJFhL/QjDJ5SPimE3hyTph/LDyAVZQUVkQXob24m6gByyTlCPsQe2e+qqUl4m3T2OHk+QD7Mgk1nyDwvuWZs4vTBckltDAziiIUZxeSXvvdUdDc4dLdbJhyodhpgTq43BOFn5LrV5OJIwig2s4aIqQ==
Received: from FR3P281CA0093.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:a1::13)
 by VI1PR03MB9986.eurprd03.prod.outlook.com (2603:10a6:800:1c8::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.25; Mon, 6 Mar
 2023 19:16:26 +0000
Received: from VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:a1:cafe::b3) by FR3P281CA0093.outlook.office365.com
 (2603:10a6:d10:a1::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.15 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:25 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 VI1EUR05FT048.mail.protection.outlook.com (10.233.243.188) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.15 via Frontend Transport; Mon, 6 Mar 2023 19:16:25 +0000
Received: from outmta (unknown [192.168.82.132])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 45FB420080270;
	Mon,  6 Mar 2023 19:16:25 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 184602008006F;
	Mon,  6 Mar 2023 19:15:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WnO8WHh0L9oCcYvWTEFpkNbVPaVP4zMqUPZF3qGrnnLLSKUqmtc/l1+JrF1XJhYJ50FW02AysNsTJP8zqlaNCqnm+fWMNvzUw9amEx++AEQ8n2TtcteaFLsRpFXq/nLSvSjCKIAxuuNxWvG4x7AcOFJMnp6SPh5AyPb89fRrRU8gQ352vM3Aaap9PBHxrAQTHXbhytNdAAM+ttScf69Jr0Cp3iOYxOGYrnBeeetjkoHukBvBjKDAvJKDpHH+7aODKA9qzl+ns09aynjpYbgIoHEnYWhtAQJn4QmT10cfxxM1ONr0lnC6235yhAtboHq7ecS4ANIjVHsm0KmDNHaehw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=mhZG/9FqHoqd/oU+jzuBdR+1reso5n0tnBlqPdnDhRv6okqv6Zkb/T7bcg8TuhMz+SK9WjPYHbUAP9SHh8x+phkZmFzH7Whq2Zp4KuhEfQtzbBfyZlUKHuZSDWwl3e1xJ5rGxT06E82mWSIgTjnpi0luTyNlqGSWdT101m/RE4WqKj0cHg7cFDNWvnh9ZITa18Z/qWFG5brYfsjQHSCJe/d922eyB3bYNmkXBpxE/YjD41RxN5N/Y2rMC1/dpX6CX3B9LjLN94dKbds10+wvdW2oCVNMuoEO03p39/0elxq4N2XzpWyVSMrAR1f0ja4zc2DraZWdcjNl+9vKC6aotg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpZmh4r7VLUlTccmB8UP7KLEKxBYPMGpEwwLMpgpm6E=;
 b=gR89kiXYnP+Gbtr6MSn1u3c+3nFvsv3KHs9PNGwGoIPSumJoYZ2bpPhrmMDlBnX5Bx5mD92coShLFYum/4VqoFdvzpShuf51eWZdoFMO8DM27K+rpGkBtLNf1gyMQxh4Xt/+dEWbwkesOLFJ1Z1jV+zC30A2A0pSJc3+SeHwp8N0Tzv1IQFlQ9h71OHzw7v2oJFhL/QjDJ5SPimE3hyTph/LDyAVZQUVkQXob24m6gByyTlCPsQe2e+qqUl4m3T2OHk+QD7Mgk1nyDwvuWZs4vTBckltDAziiIUZxeSXvvdUdDc4dLdbJhyodhpgTq43BOFn5LrV5OJIwig2s4aIqQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:15 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:15 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 12/13] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Mon,  6 Mar 2023 14:15:34 -0500
Message-Id: <20230306191535.1917656-13-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|VI1EUR05FT048:EE_|VI1PR03MB9986:EE_
X-MS-Office365-Filtering-Correlation-Id: e510b069-a73c-4007-6c1a-08db1e7747ba
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  TzFwa/1eww9rLl16I/0cCaqd9iFGqAjLdhdD9jEK6GQHWsWHe3HicuDNt1yifl3jCppLfkxqCLomViab0suS34/8qQWRH7pQnmIz/ZsFyOy9XO6Lw/MXv3WM8q+O0/GrEH/8WaSpeZJr5RgQMhH728gtSegT7vQpn8c13TXag0ekwv4Rg1m4g3pO5CvsHiW5cvRz3gpQegdVRKKfk9r21Ueyo1o4Wm+H0j5a3qU7pTuUDR41KsvXsoNgLTBYBVIrZzX0tjDuTnB8QcdzhhharC1c/S52obzWtalD45WTRrLkJoxvJ/Cj+jP7kF1hFP1D6WZmxvXMUOK8lpKix5rYeYKrf4giGztJ5FeVTxowbaUGD4xgkSlr1O2KqLuE7LHRTv4lkBJAmO0s+uLU0a5Ti0IG7IV4AzVN1+/fHoepOfb0fPLPiJvYbHtfbpJrrRSuRRV8qCsH+NF66WutmHLbPPxUUqJPeoh6apOHYhJC0/U/sbQMIvc/+gJxZTiplB6ugB+up8NojljLBG6pCySNmkdnLhB0r8CBnpqstLH/NNL1TfPzADs+cCWCewgkQWKI+leNC4vbQFKnAyL45vQUmj3GkcOP4YTYsXmADrj50bCUN52MsCiWI15BdbOo9pQ6I3MUooLFqnk78LCItW7m2abPeued7MMkhfUvx4haKeKujrDxp8xvD53LACPSJ6MpkC+svIUTaEFmSWew6xVXJA==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	2c9ed15e-1f6c-4fb3-6232-08db1e77416e
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	REEHpX1gZlbo24lL52MbOwSEdeYCnJpFUg+7vLlBuIpYHS3leL40n0VUjhx1OCVxNV29uUF5l8alUMSKYeMR69mZ167CwNSU6QdGQ3+6IzGqC2HouYyGvjsKxZ4qkWTt33BolSNBryDnbvyN3b9StW7hqu6+utdFfHDK9wrRnw0SIgsqiljI1CpO70qZs6wiDJPevbveUy6DP88R87HOtNKLTpPK3PplBBH/Lwh2d5oKl+6kw0S0obid+6hbBADeUpmKvxLy5b2MNw11/FH/rS4z9NqzVoZVBftTOon+8YXvEfRoqY9I8jbIsk/odr0ZGFzGqBhSfYY0FBhNRdLEWRrJYMDZKhxDyR8Pt6XfLZ1tWaSUXEcp+gz/1OQyc0jI5nF9qvmOO43eeIRfZGeOxu1FDco0UxAtiqBPmmS+dVAegEJL7i2LN2kZBiO4V0hLWww9GV+dpUrj/mG0o8uDzBoerlWGEGl9v2TSWzBfrsF1KnSP3gdXlkVqL86/PDK4nVBjGKR2cjHoyJQ1jOaC/o04wlAsG3kZK32fjqiCGbEN2ecdpTaG8F5GIQlvKDoLkvWLuMU1V+EF67p3L3O5+5JlUnEsnAX4Kix6GTkfN0jwkkudh4OPVCM30GAgxBa5TH3SfhwjG1zBrxAv6fTba2/9mqg+tzz4qwN3UxMlTq1H6uUOvz0Qt45AsGSVrsVrs790bE+NoAPZHXPycJ04b4DpIpnQFZUHteiHSD88pPM=
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(396003)(346002)(39850400004)(376002)(451199018)(5400799012)(36840700001)(46966006)(478600001)(34020700004)(83380400001)(47076005)(36860700001)(6666004)(36756003)(82310400005)(316002)(82740400003)(110136005)(356005)(54906003)(7636003)(7596003)(6506007)(6512007)(26005)(1076003)(2616005)(336012)(186003)(6486002)(41300700001)(86362001)(5660300002)(44832011)(8936002)(7416002)(2906002)(70586007)(8676002)(70206006)(40480700001)(4326008)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:25.5460
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e510b069-a73c-4007-6c1a-08db1e7747ba
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT048.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB9986
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

