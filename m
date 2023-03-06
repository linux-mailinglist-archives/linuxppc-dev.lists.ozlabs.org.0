Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BCBE26ACDEA
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Mar 2023 20:23:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PVpQt41jtz3fZ6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Mar 2023 06:23:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qkR5w38n;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qkR5w38n;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:7d00::303; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qkR5w38n;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=qkR5w38n;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05hn20303.outbound.protection.outlook.com [IPv6:2a01:111:f400:7d00::303])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PVpGb2cj9z3cBm
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 Mar 2023 06:16:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9GGq6XJV4t12CLbwma++7CQnOz5UXXTjYOEliMCg7c=;
 b=qkR5w38nlzb8jmcePajJWj27iP3POKUPRUmZyJtR3dqPwBxmFwLXRN3WBxyQJUXTpTn9JUizkSzNbotfQIE9FQOrMV9OnEMmMFW0KlDlyu+45xxHElfgQ5sBRnwvWXmgDu3VrO4qvPqZkHO0AOrLv65R/mxStVyv6dWgTVTszJ0D4xqK6XmFLLvdhK1wdZKxwsKSnYG5a116bkIby/pifXEcvKsAu4bhKjhzwVTBBYy6174M+oZ/rN4XxG4ineiibYyKmLQ5G3WJkVggDdX9u/zS6Z6j7PsPiPCofCanHtpUIhkwAvWW+bigOKyGGP3mRqY7qhZxfvxg92lJCjWc4Q==
Received: from AM5PR0201CA0012.eurprd02.prod.outlook.com
 (2603:10a6:203:3d::22) by AS2PR03MB9146.eurprd03.prod.outlook.com
 (2603:10a6:20b:5fa::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Mon, 6 Mar
 2023 19:16:21 +0000
Received: from AM6EUR05FT046.eop-eur05.prod.protection.outlook.com
 (2603:10a6:203:3d:cafe::dd) by AM5PR0201CA0012.outlook.office365.com
 (2603:10a6:203:3d::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28 via Frontend
 Transport; Mon, 6 Mar 2023 19:16:21 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 20.160.56.86)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Fail (protection.outlook.com: domain of seco.com does not
 designate 20.160.56.86 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.86; helo=inpost-eu.tmcas.trendmicro.com;
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.86) by
 AM6EUR05FT046.mail.protection.outlook.com (10.233.241.175) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6178.14 via Frontend Transport; Mon, 6 Mar 2023 19:16:21 +0000
Received: from outmta (unknown [192.168.82.140])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id 48B2020080270;
	Mon,  6 Mar 2023 19:16:21 +0000 (UTC)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (unknown [104.47.17.177])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id EC4D42008006F;
	Mon,  6 Mar 2023 19:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=a/htDj17lImiYvNMnGRUHS7GWVjqxz4MzGNRV7HEfdyKjNNUx+wnPYaRNASu4Rj5vhVDCu8r30ZlHzo/6FQ9U2/v7MvR4o0c7C7iH5X2g1fw+9BPDiYpQEviNZ+KjRvboCFPFEx3SACFsOk0OSjE8ZDLWB/PZYYjHOlfjHuvsbqiReoMQ28FZQT3BTZwzx85LbclQzbz382UWv+qyLMK3Jg3Tx5WGhZA4Cd9ZTQjPMAvqd72P7F8+pEIZkBEKMnDuFjEgyMiWM6c3lwAuXNtNE62Xc8dbWJ5hkQJHsfYL5iKZcdQZh/9RP9hpkgFszVkFqRolX9w/Wywcl5Vj0GeeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M9GGq6XJV4t12CLbwma++7CQnOz5UXXTjYOEliMCg7c=;
 b=Wz2G6qmHIImMx/5maDzmUVB8Nl6P6l0Hb10X2+V7YDefp2wKcAwqilwul5YEgyyAWtkGYDIY11DmYwAcdr3BgObNSQplVNe8Pm+yEQ3/iCE59DzLW+u+TDf+0GCQMGS81x8xppKu5rj8ndxa5J3CMBY9/GOumWfXG4H50flWtQGf3ZL6g5fReQADX6jMzVchQBZowPRaB+RBRUktiGaG0tYFzuwj1F1N0uTdtwfveyeAQ255nPXb+Rhu2NdlNrGaZ98xP5YCjZwNk9r09zUhOikLa6S90NbIWUEgMylLzLVpZVm2Km8wEwlNYTtVgCFY+bxPoF5/s7+yVCsEbuTKKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M9GGq6XJV4t12CLbwma++7CQnOz5UXXTjYOEliMCg7c=;
 b=qkR5w38nlzb8jmcePajJWj27iP3POKUPRUmZyJtR3dqPwBxmFwLXRN3WBxyQJUXTpTn9JUizkSzNbotfQIE9FQOrMV9OnEMmMFW0KlDlyu+45xxHElfgQ5sBRnwvWXmgDu3VrO4qvPqZkHO0AOrLv65R/mxStVyv6dWgTVTszJ0D4xqK6XmFLLvdhK1wdZKxwsKSnYG5a116bkIby/pifXEcvKsAu4bhKjhzwVTBBYy6174M+oZ/rN4XxG4ineiibYyKmLQ5G3WJkVggDdX9u/zS6Z6j7PsPiPCofCanHtpUIhkwAvWW+bigOKyGGP3mRqY7qhZxfvxg92lJCjWc4Q==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS8PR03MB9511.eurprd03.prod.outlook.com (2603:10a6:20b:5a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.28; Mon, 6 Mar
 2023 19:16:10 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::dbcf:1089:3242:614e%5]) with mapi id 15.20.6156.027; Mon, 6 Mar 2023
 19:16:10 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v10 09/13] arm64: dts: ls1046a: Add serdes nodes
Date: Mon,  6 Mar 2023 14:15:31 -0500
Message-Id: <20230306191535.1917656-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230306191535.1917656-1-sean.anderson@seco.com>
References: <20230306191535.1917656-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|AS8PR03MB9511:EE_|AM6EUR05FT046:EE_|AS2PR03MB9146:EE_
X-MS-Office365-Filtering-Correlation-Id: f0424e71-dfeb-4a4a-4a30-08db1e774536
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  U+xTsRqzoQfJKdlrAnYphZOfpFxH8YhUFQMo8BSDnf9vDQdtbYXRtBGz9KaG440FKaPFuc/XULNSZZ2bY/E7mXkUqV0u6nlMcxxBs57wxQCU/JHnObby+Ci9Key+af6pCJ2m8Fdo5NrvbJdGDUbTJ1npDbUJD9nSuOLdCoQevV/IWn+XVvcsz8oRvJFNE4gXyRpG7wOdPSgpsa8bTRc3o0IetB5W38vqO86G7Nui0WmaMsJ9qBb76N3s1x/y8r9C59m9OZMsY900bT0oIeTc/UG7Dg7rFs2+VKE+71ScUrA4Jxd1ZFbNtaHV3Opg2A08HW5Y5U2Nex68kiZi5DeYYGfrPnaC+F/HIGagGkQl68GkQW/+XZPno1incvcP0AkovwJApeNe6zsLDiFT5VcbgUNPI9uyhe/EIzidVjVQ5Ig6YPoiAk0U71CPGMKXepljM6utiB5yW4/CaGKyCroInfZh/hTBr78QYU9jetUCfH9p3YoK6k7eBMr+eWf7ReVbot7H+8ySXRo/SA6KUjZgNQV3i2TWNKa1GQV1tNCaGtQ3H9awNSzCudRPWkyZQe6VeunnOTiGvwd0mtA1bQgNoNj2lL4nKsavuHhhAv/TqUbf9A0UE0kQ3yxDGZg5al7KAitpLIXyFYtvrElcSqQnHsaeWZbvFcIfbrB5gf7/oRObj9FZioeSslDipoBKFfGYXqDilBGgWOsJkeKGPvzgOQ==
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(346002)(376002)(39850400004)(396003)(136003)(366004)(451199018)(110136005)(54906003)(36756003)(316002)(83380400001)(86362001)(6486002)(6506007)(186003)(2906002)(5660300002)(66476007)(4326008)(8936002)(66946007)(41300700001)(8676002)(478600001)(44832011)(26005)(6512007)(1076003)(2616005)(7416002)(52116002)(66556008)(6666004)(38100700002)(38350700002)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB9511
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  AM6EUR05FT046.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	0804670e-20ce-4c49-b1a9-08db1e773e4f
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	D71X8Ux7AJ8JfL3ubIbbZCY4+Ibqarz6+uSpdz7xTm2aOOJPshZ5TECg1Hvhgfwq0bT/238S2+8HtZ6Y7+D98BO0UU8jNlOgRInnEWn6tTsyA2wzWsaTkVzfjWZuWWLTWDBIKpTGMMJnvA/fHTeIu/IVuwWM98rQUFjwZJGBuL6nC3d1RTe6kBVooWhqeZDbGXAuchZMwvmbMwb5ddcipeak2H0NhvmKyzg4eG58pdB4oYx+7rRExgq5aHO3SfFba8PosgXAdY3nsRQs1EsPHxH7SehwyePvLxuSqg0ytQ1jrDNR4e+mMdrSmTUip3sWskcLlM18KBybt4x2xc8468lwVrmuyi67EkQq1dYQ9VrghtnncyO2lxjnSNLdTKwDhKQIxwp3VaPLhcrV3bVthuk4kbV6LH+kzV/4X2dhi8XIFdBqk1rzaDko8cnymgCaY/RDLOIkR2h3EX/YAwST1sfFAJLzHOElZvhRWItk3o5tWhOf3soQJFXz3UieuxG7HxAQx6vrErjKGKdLE8w4kVkRtS8qQ4a+N8cIqdYE81qHY14plGYvfsQtX+/bp/8h+axnvsWNLQvQ4AdBh1OmT55r6ffwb9Qe4rLIrDVWzi0O8DS19wedkyZDm+93hpBEmI7LdXUJ4oDjlSbnHKkdO0MEi96L/YZiFcW4u+gxExHlYw/Cl0JC/F0gylwR3wQ4bln9JxpWALz+F4r7pkOcpEBAJbP59FJ23eDxDJFnt12DXZOwtkOnUWsKFCQ4Yq8q5CkNNMU2m1sLnc0PZkwLBQ==
X-Forefront-Antispam-Report: 	CIP:20.160.56.86;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230025)(136003)(346002)(39850400004)(396003)(376002)(5400799012)(451199018)(36840700001)(40470700004)(46966006)(6666004)(478600001)(34020700004)(83380400001)(47076005)(36860700001)(36756003)(82310400005)(316002)(356005)(82740400003)(54906003)(110136005)(26005)(336012)(2616005)(186003)(6512007)(40460700003)(1076003)(6486002)(6506007)(7596003)(7636003)(4326008)(86362001)(7416002)(44832011)(5660300002)(8676002)(41300700001)(70586007)(8936002)(40480700001)(70206006)(2906002)(21314003)(12100799021);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2023 19:16:21.3872
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f0424e71-dfeb-4a4a-4a30-08db1e774536
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.86];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	AM6EUR05FT046.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9146
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

