Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1B46B7D60
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Mar 2023 17:23:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pb25x1q1kz3chr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Mar 2023 03:23:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IaQ0QWTL;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IaQ0QWTL;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe0d::330; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IaQ0QWTL;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IaQ0QWTL;
	dkim-atps=neutral
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04hn0330.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe0d::330])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pb1sL0hKgz3cDG
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Mar 2023 03:12:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=IaQ0QWTLN438h9vu8zqI9gNldp5smcLlMsRiArFpNap14YUOsB4KKy1BU7HJf6ucqhz3jddr0c3Kc+sJ4gCkG1mD0soUgE6EO0xNCn/rGce0qC0JvaUFS0ur7Gtk06i+ZQD8bxC9HLAfmh7Rxep7TPasJO2mlOuejs5yXTf66vLRR8ENXKJ1bIA2Y9B+Qbpx4MDxlQYnK+e7XTZkYEGFXvodbsYrJFh5gbpLPCd74BgqNn4q3LLMQGoOExfNdTLmGyQ6K7DlJsuJzaD+P8kdeWK8nVZ2Zc/yDLUP2OYuFkapbkwlwraXm5VcPv+2NDfPLOkMuFNNc5Q5iei0NW8mqQ==
Received: from FR3P281CA0030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:d10:1c::16)
 by AS8PR03MB8997.eurprd03.prod.outlook.com (2603:10a6:20b:5bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:35 +0000
Received: from VI1EUR05FT052.eop-eur05.prod.protection.outlook.com
 (2603:10a6:d10:1c:cafe::89) by FR3P281CA0030.outlook.office365.com
 (2603:10a6:d10:1c::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.25 via Frontend
 Transport; Mon, 13 Mar 2023 16:12:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT052.mail.protection.outlook.com (10.233.242.85) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6199.11 via Frontend Transport; Mon, 13 Mar 2023 16:12:35 +0000
Received: from outmta (unknown [192.168.82.133])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id D8C5A2008088F;
	Mon, 13 Mar 2023 16:12:34 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (unknown [104.47.14.52])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 449BA20080075;
	Mon, 13 Mar 2023 16:03:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZD6ToflxbKHgXCFLvodatXY5hIRfk51iZMkyEIJRy3PRLd2cgIhXYv56auJjsVojeLlhb2+bJLcMF8jY+9VvZoNUJa1RAINY09ozVPrUwdsbAVT4YrdM9a89CQGyS41KnVd2jllCCpvyDBe1Y8X7gK5r54lOSfoQtv4eaIgGTg60wVHs+SVU2/2aTMce1T86sT8kA25luzRp1ds+hS92SF6bmlj5Qlfy7H4a8DRTTwvZAgSNEJl8F8QTQUeG6hEG+SRrFqlHQs2oeB0Gq9tbDZVtqlfOg1nqLCDQvzYoQjaTgHg9vF1CbhyxTmm2da64U6hSH5vkIpDLFa18SMeAaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=KU+9VR5Ga2ckGgiLxPwrozIP2tfeXoh0gHeDQosoxFT+KCoVbi25pDFFPUMKvLx8tnSEHmlxUhvTzLOpkfmZA02y10q8gQ6lz8wDeqWNH/d96yBUpleA3tfoLCWoEeHa5qOreXgyI76N4CJxS9yxgXUkwEJICNm3o/abROPTMG6bDEudEC6QX9dbeZVc3G7lRZEjxkWxCUq7+aPGPQgu7G0qm09m39LvyMT87OfP22wPtKerQ7a8HJrKN7qo0yU46aqVtLpgNTJMLJvC9mIP1OLlc1aHUA3fJf99bZ/uqCa72hJ8hoybmXSHL18wWK7gAST0Bx73i6A+PiM66KqdyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Msa/ApeasZWDyIVGMQqmliC9DhgV10v70JxGPKM6HnM=;
 b=IaQ0QWTLN438h9vu8zqI9gNldp5smcLlMsRiArFpNap14YUOsB4KKy1BU7HJf6ucqhz3jddr0c3Kc+sJ4gCkG1mD0soUgE6EO0xNCn/rGce0qC0JvaUFS0ur7Gtk06i+ZQD8bxC9HLAfmh7Rxep7TPasJO2mlOuejs5yXTf66vLRR8ENXKJ1bIA2Y9B+Qbpx4MDxlQYnK+e7XTZkYEGFXvodbsYrJFh5gbpLPCd74BgqNn4q3LLMQGoOExfNdTLmGyQ6K7DlJsuJzaD+P8kdeWK8nVZ2Zc/yDLUP2OYuFkapbkwlwraXm5VcPv+2NDfPLOkMuFNNc5Q5iei0NW8mqQ==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB7781.eurprd03.prod.outlook.com (2603:10a6:20b:405::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.24; Mon, 13 Mar
 2023 16:12:23 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%4]) with mapi id 15.20.6178.024; Mon, 13 Mar 2023
 16:12:23 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v11 10/13] arm64: dts: ls1046ardb: Add serdes descriptions
Date: Mon, 13 Mar 2023 12:11:34 -0400
Message-Id: <20230313161138.3598068-11-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230313161138.3598068-1-sean.anderson@seco.com>
References: <20230313161138.3598068-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::11) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB7781:EE_|VI1EUR05FT052:EE_|AS8PR03MB8997:EE_
X-MS-Office365-Filtering-Correlation-Id: 789d0384-2c8a-4d7b-6733-08db23ddc201
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  RN1pHxqX018Z1x6u3/6Yl0BhPGf/ZIzsb0yXHJu9PAZff+baagPWJ4nAk7o3HjsOULUt+8NAVzhhgfCvghgSGTSsu8z38aJ6QgtokBL3mMx4SXPUtw9IuZXMz7VWPoX1jfpLUEjkw2QdTO0+061lJkiVi6ggkcRGFZq3a3albMTDRWk/L7xN4yP5xy3je71PcaRiaAf+VoJMcZ80VisPdHYXNB7uYFNZJrXXPRD0FhWwP/x1K5qS1i2+l0zBUxLSrDx2E0r4o5Ldd5KiN5d7rih/2j82oH8yoSeQCytJhVRlXYegUfg//ic9IMI1ESGX/irttB7PHlUcZdOv1aJ3IyqrwLi0BaS6WIatf1IUZEVc19PIVoHqYzJogy//ryCdBda+pAevFhZd9t75aH3O+NF761f21azFOTEkoKLTOLpLGKzIdf/odd9hKcBfFCYNvftdIcb9fVpttBIBM3Zh4erIjxNzQdaY7KfCdVE0+9wPN4zy1MQOW8F1J6cQEqSaManB8S15vOKcKOk06qOMt+bUU2vDLbt9Dim58RNJU2x7Jen2HkXWPeAkvS/gC7TruySOJoT1vL/PmEM/5f4AAZ4DBjWj00AtA/n1CHC0BW518BpaITfjBuwzTwKDlI71vp39Dzxdok/iiqfeLciepArzQvR+x21RM+3HQMnGbgK4aCnzVfJGdZok8op2btOdy2kVlyHVUJL57qV96t/gvQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(366004)(39850400004)(346002)(396003)(376002)(136003)(451199018)(110136005)(41300700001)(54906003)(478600001)(8676002)(4326008)(66556008)(66476007)(66946007)(8936002)(36756003)(86362001)(38350700002)(38100700002)(26005)(6512007)(1076003)(6486002)(6666004)(186003)(52116002)(44832011)(5660300002)(7416002)(2906002)(316002)(6506007)(83380400001)(2616005);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7781
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT052.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	06d71af1-1a2a-4a9c-c027-08db23ddbafb
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	l1RNcH6qf+/f8NIWKoB/Fhhf3ARr0WXUJmuvM9XBabSAY6NQC7U8nmTurzprruCG7Gteyyq+x7OaqC7JXAFMlzdVJHGhsW1ac0SJ9eLm7e9Esf/W2MbD79abtdthQ0Ti9twKPvQS9f+Ay3waytKtuQWbF2umM2UesjMKqz3FL8D3VFNyPizJuZvpUJ6DouRsta686DL3imVGikwP+Htj3Cfc3lbRflX0a6cFci2j7B/nMLfI261TKDZkG0njUmbxTh3zXs2R1ASj1vvW1JAqwzfpDGQXB02iLUEEiBVKr29KPKgVlWLBXHOE6B0Nga1XHuBa8Kp8mezyWsCFaPAaQvBb/ZlYVPSMJpyEl0W2KDtnWR3WKuwFZHA8Vo3TK/0NPf721xamRrF/1k8AwPISxJNYum8eiBO5NMAo3P+gW+QW50ZnWhxKd9kSAdD77gD5rkVAQkH6LemPvNf3ydK8C5iiIoUn+VUGdYCDWLPif+0Gl7Fe3KJKtiV2YUvzdB9ZHUHnKxHx+JdK97H4IK+ZPNovpVovRNUQQ+J+CMRSvPCwOdvjcaJHNhn1QApQvaISEP+EuLQVXUy4JMhsd/hV/QwzxGqAt2a/QQq/PQwHZnVaf4KrxzoyLaLcmG0Lg8UQHiDOpmOaBF1TFegXZEiughprekSuMlp4sVtLu4Q2IIxKU1Bag+WUEWwby+kMVutzkg6/kGNOPVX98vGBEbjQIW7UEPeFCodI/SFSLU5v+tZiMB2QTDEu5IPGTM7bBUVkdG2EV3Lz4JV8gXPqaxtS7A==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(346002)(39850400004)(396003)(376002)(136003)(451199018)(5400799012)(36840700001)(46966006)(40470700004)(40460700003)(54906003)(110136005)(8936002)(478600001)(41300700001)(4326008)(70206006)(8676002)(70586007)(36756003)(86362001)(82310400005)(356005)(34020700004)(40480700001)(7636003)(36860700001)(82740400003)(7596003)(1076003)(6506007)(26005)(6486002)(6666004)(186003)(5660300002)(44832011)(7416002)(2906002)(316002)(6512007)(83380400001)(336012)(47076005)(2616005)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Mar 2023 16:12:35.1736
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 789d0384-2c8a-4d7b-6733-08db23ddc201
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT052.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8997
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

This adds appropriate descriptions for the macs which use the SerDes. The
156.25MHz fixed clock is a crystal. The 100MHz clocks (there are
actually 3) come from a Renesas 6V49205B at address 69 on i2c0. There is
no driver for this device (and as far as I know all you can do with the
100MHz clocks is gate them), so I have chosen to model it as a single
fixed clock.

Note: the SerDes1 lane numbering for the LS1046A is *reversed*.
This means that Lane A (what the driver thinks is lane 0) uses pins
SD1_TX3_P/N.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

(no changes since v10)

Changes in v10:
- Move serdes descriptions to SoC dtsi
- Don't use /clocks
- Use "descriptions" instead of "bindings"
- Split off defconfig change into separate patch

Changes in v9:
- Fix name of phy mode node
- phy-type -> fsl,phy

Changes in v8:
- Rename serdes phy handles to use _A, _B, etc. instead of _0, _1, etc.
  This should help remind readers that the numbering corresponds to the
  physical layout of the registers, and not the lane (pin) number.

Changes in v6:
- XGI.9 -> XFI.9

Changes in v4:
- Convert to new bindings

 .../boot/dts/freescale/fsl-ls1046a-rdb.dts    | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
index 07f6cc6e354a..0d6dcfd1630a 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a-rdb.dts
@@ -26,6 +26,24 @@ aliases {
 	chosen {
 		stdout-path = "serial0:115200n8";
 	};
+
+	clk_100mhz: clock-100mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <100000000>;
+	};
+
+	clk_156mhz: clock-156mhz {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <156250000>;
+	};
+};
+
+&serdes1 {
+	clocks = <&clk_100mhz>, <&clk_156mhz>;
+	clock-names = "ref0", "ref1";
+	status = "okay";
 };
 
 &duart0 {
@@ -140,21 +158,29 @@ ethernet@e6000 {
 	ethernet@e8000 {
 		phy-handle = <&sgmii_phy1>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_B>;
+		phy-names = "serdes";
 	};
 
 	ethernet@ea000 {
 		phy-handle = <&sgmii_phy2>;
 		phy-connection-type = "sgmii";
+		phys = <&serdes1_A>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f0000 { /* 10GEC1 */
 		phy-handle = <&aqr106_phy>;
 		phy-connection-type = "xgmii";
+		phys = <&serdes1_D>;
+		phy-names = "serdes";
 	};
 
 	ethernet@f2000 { /* 10GEC2 */
 		phy-connection-type = "10gbase-r";
 		managed = "in-band-status";
+		phys = <&serdes1_C>;
+		phy-names = "serdes";
 	};
 
 	mdio@fc000 {
-- 
2.35.1.1320.gc452695387.dirty

