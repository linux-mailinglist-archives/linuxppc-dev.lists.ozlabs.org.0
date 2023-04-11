Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E56536DE460
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Apr 2023 20:54:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pww4h5KpKz3fX4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Apr 2023 04:54:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JsoKI8BS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JsoKI8BS;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7eaf::307; helo=eur03-am7-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JsoKI8BS;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=JsoKI8BS;
	dkim-atps=neutral
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (mail-am7eur03hn20307.outbound.protection.outlook.com [IPv6:2a01:111:f400:7eaf::307])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pwvt45fzbz3cFx
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Apr 2023 04:45:32 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=JsoKI8BSdQZb+P697EDhkhNrH04ER/+/QcBH0xMS3iQIEGsVbM9bXeVH1TdhFPrO7w/zv6EtLfd9SuQieB8VSvHQr5psrZgDStt6FaTw87NOms0p7fBXOkt/BQxczZxLWaehbtzQo8QTuew7TWuwTfmw57DXkjRyOMtf9yK+C9QiTMngSJ03JxRWu1KeWcATWZepJ6c+BEHyI6RWKMboiTXqi7naUAzbEtM9OoBhItKcT4Dn8fiKGrZpy/Jdv6qisEmeWPc7ybmLe1VKb0G+rShT2upIPUkLbgk8YA+5A04ljAG9P2uVd+iJri4YeB0hMwQt3dgeMjFd+SvMqC3V6w==
Received: from AM6PR0202CA0071.eurprd02.prod.outlook.com
 (2603:10a6:20b:3a::48) by GV2PR03MB8584.eurprd03.prod.outlook.com
 (2603:10a6:150:79::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.36; Tue, 11 Apr
 2023 18:45:13 +0000
Received: from VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
 (2603:10a6:20b:3a:cafe::d) by AM6PR0202CA0071.outlook.office365.com
 (2603:10a6:20b:3a::48) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.29 via Frontend
 Transport; Tue, 11 Apr 2023 18:45:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.87)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.87 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.87; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.87) by
 VI1EUR05FT047.mail.protection.outlook.com (10.233.243.5) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.28 via Frontend Transport; Tue, 11 Apr 2023 18:45:12 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id A915C2008026E;
	Tue, 11 Apr 2023 18:45:12 +0000 (UTC)
Received: from EUR03-AM7-obe.outbound.protection.outlook.com (unknown [104.47.51.239])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id 73F3D20080074;
	Tue, 11 Apr 2023 18:46:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NsDgYM2WQARaDdDh2470TxZtQCY/l9oKz92eeATyVzs2SUxSxIGhrr7yLdk/nL19Uru8mFloXSbLUtCJYJ9q8wMfGHyW7Z84KaK2+RZka9gPhjV0Xdh8PKAunSuxs5Ydh23DUYBXSk9UxXUc1vTWMtskMIje9tSOFcEpIHDNGSdaQ5XnnhGSyBTsSAK5gA7AwSRIDNY718YNLYEBobfXysU/r+2IZ5xSbXxlLW3YYNJ3nj+Gf/kg2wpHnyi7WuGwftMgs287PM8+e5jubqsaf9RIeTEXDYZDeNeRiTw79/Q6mm5X58iHl4i2eqgj7S15R/n44Dj7vTDOOQRtlWWSbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=RmP1kqd5LLFYbLaDKrQM6p5uvMZxWIOnwrA7ghCp36LnojUDc1eZiJScMWq/DY7Gi+j6iVLaqFAF/wLCdn6BfmLC0SNBAbBZeSHJqpfnb0g03b8p2J+EUS5fTWmncC45QDoXo5dGgFuLhQKPRNZPA2mqlgyhfk3YB2lpcReZ9O0gfbzOzgC9VyQVeLsey4BpWdu+TKP7+TFCDXwOPltJ/lczduNbpLGSIG5NDhqkmP6+BRUhAnmPXJTW2pDCaA7JyS6GaetZU6uEdN7ZQAt2X8NpnobX14453xK7aEZLehBFo/juxHUr+DsklWCEhwuBzbZWqMQ++xlRdTysNeCcAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3Dzi6UE2v9qVmQpqrCtfoOE4ZEKRnVlJ9GnYZynAFGA=;
 b=JsoKI8BSdQZb+P697EDhkhNrH04ER/+/QcBH0xMS3iQIEGsVbM9bXeVH1TdhFPrO7w/zv6EtLfd9SuQieB8VSvHQr5psrZgDStt6FaTw87NOms0p7fBXOkt/BQxczZxLWaehbtzQo8QTuew7TWuwTfmw57DXkjRyOMtf9yK+C9QiTMngSJ03JxRWu1KeWcATWZepJ6c+BEHyI6RWKMboiTXqi7naUAzbEtM9OoBhItKcT4Dn8fiKGrZpy/Jdv6qisEmeWPc7ybmLe1VKb0G+rShT2upIPUkLbgk8YA+5A04ljAG9P2uVd+iJri4YeB0hMwQt3dgeMjFd+SvMqC3V6w==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB4PR03MB9433.eurprd03.prod.outlook.com (2603:10a6:10:3fa::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Tue, 11 Apr
 2023 18:44:55 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6277.035; Tue, 11 Apr 2023
 18:44:55 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v13 09/15] arm64: dts: ls1046a: Add serdes nodes
Date: Tue, 11 Apr 2023 14:43:06 -0400
Message-Id: <20230411184313.3679145-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230411184313.3679145-1-sean.anderson@seco.com>
References: <20230411184313.3679145-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0350.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::25) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB4PR03MB9433:EE_|VI1EUR05FT047:EE_|GV2PR03MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 13a8d14f-4118-4e9b-4adb-08db3abce26d
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  7yVD7ZA7hru9xfqKa2pkz1R2+66pkFo+j9gvQ8KD5zGnMHWVre+2z8UTIPsoBswUOmWMd7O+Z7ZdFlhdOpzK7jwm8KUR7+jK75oHnYAPGjBpm2zYJucYPWKZRd2dvST5APjKkyXzarYTDMK/RJ5qyVipHtgeK/OZvaf+RMXaOc+uEbVo1UubSMQ5ki8QY7AJ5FHviX5YvNEBHcxVK8J5FIie1EAh5tTKqx2HxSiqjc+PN9kzpGDuX6zyR5baYH4tjTGHrDulBuV6pTlGhp6rzMLdEZi0Jt8qIUIWgnEyk8XLj5VJ0ydl+QhBgP/YBO0W8Vx+a+cliOv9ebpgpAnsF2F5xrdNVgmsvTkNpsQhl2dJvBtNZpGFNIS67vmfSVMKz6DVwjUEqikyS/iJ0HVxsse2YGWeEA6y6QTNNYgszAdiI0/fOySN0qMtqMkek7Cn4bGxE3UpQI0wVRC9lG+f0cvtzGAuqbynwow4u6su66GRpo/CnFxAd7VR+HrNoMgB4KIvqDcOX91EJl/it4A4+lyl4qu5k/ff0CF/c9tPH1TJU2rpXg1sebcfaCGJATPeSAQozbloIcalVcjYAP2jKoojG8+nEymVmQ37fnIQMMPPGa61CEqd+3ulb+FgscKp
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39850400004)(396003)(136003)(376002)(346002)(451199021)(316002)(110136005)(38350700002)(38100700002)(54906003)(66556008)(66476007)(8676002)(66946007)(4326008)(86362001)(478600001)(186003)(2616005)(26005)(41300700001)(36756003)(6506007)(1076003)(6512007)(2906002)(83380400001)(44832011)(8936002)(6666004)(52116002)(5660300002)(7416002)(6486002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR03MB9433
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	d6db5d27-5848-4dff-5ee3-08db3abcd7f0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ML/wrW/QmLo7hTXwjJHAOyGxWJrg/uLOdGi9cmujkEk3QfAGvxoiuvhvIwt/BOIuNDWApu8OBnnwnoF1+j8zfmIyacDs6hR2CgcpySWDL2fohR4sYSphAbgxt7dJyshI9902Pkk9Iy5f/s8WG9N4zOAIgN1Ahpnno8q2OMKvX/wq39mjdhUKS9miYEeeqtPWGp4hQwwPwrRTG669oIVOPAFljzdNBztFPdlEJflSnF7WlAJB/1uUM0eQKI1ZTR/QIyLDtxKmXHTAQyTEyMOqbgJy7O4C4e+kF87aOkiAqDaX/qqfUM0mf+n77fFOlK4WhPmPpZdbYW7RrN/IiddzbwOxEa5C+0Dy3l8RMn9gK7ZSjD6xL1TyczNLC6yVUWRzcrpSde8m+OqA81K53ipfTsc+Z1MqklCc4u+TkNbgPBl7u7P97awLdNtcv3PiO6F5ZUAuroyfdDvXIeymBWCKwHqh+ENEJf7X4rzMdRB7tIaNIauyhj0wF4KNX0W/2qhfIWLO3OQNruhFPCWvc6U7fEEKOvDjwR29zQ96OucjMK3vHKc9HO8Wjv4enAGEQags6cV+DUe1EnlZtKqQ3itBSLOzYWiMQk5t3brNodUgl0Ek76nZyWraNy7EyVQvOo3GIPZLlEHcZFjKvmvEIMFWuEQEnZS+gS6nLfDaGX+uWlrxRSKq6skUeJ6GLKMvNJnx3v0bdoYduZqddajy1wG8GFtvgG/xFLCBKQNUraPJdTrunCFLaz/JnpOoRsGyibGiF2mVjRusiES1AEBRicFLZQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.87;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(136003)(346002)(39850400004)(396003)(376002)(451199021)(5400799015)(46966006)(40470700004)(36840700001)(36756003)(54906003)(86362001)(41300700001)(110136005)(83380400001)(316002)(70586007)(4326008)(478600001)(6486002)(70206006)(8676002)(82310400005)(5660300002)(40480700001)(8936002)(2906002)(7416002)(44832011)(36860700001)(34070700002)(356005)(186003)(7596003)(82740400003)(7636003)(6666004)(26005)(6512007)(1076003)(6506007)(336012)(2616005)(47076005)(40460700003)(21314003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2023 18:45:12.9352
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13a8d14f-4118-4e9b-4adb-08db3abce26d
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.87];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	VI1EUR05FT047.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV2PR03MB8584
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

