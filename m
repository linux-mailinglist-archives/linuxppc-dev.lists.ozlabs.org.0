Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF82C6E11E0
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Apr 2023 18:12:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Py4NW601Wz3fc5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Apr 2023 02:12:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G5f+eRpE;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G5f+eRpE;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=2a01:111:f400:fe16::300; helo=eur02-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G5f+eRpE;
	dkim=pass (2048-bit key) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=G5f+eRpE;
	dkim-atps=neutral
Received: from EUR02-VI1-obe.outbound.protection.outlook.com (mail-vi1eur02hn20300.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe16::300])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Py4GZ6vg5z3fR0
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Apr 2023 02:07:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=G5f+eRpERpqUzPydooP3WFAO2AJPDN4YtZUlwuOBUSGB0hkb1ASBc7JTJjR+T4Zyz8LnttHTmYFEIJGPQyecCXCkByjelViJOcoSP+bOxVtujbu3lb4dtycv8BYl3pXSt2PHbXrMaCiFNkxoh4ukptUVutxnis2+JImPfl02XuccikUsTU2S+T43J8uOnZu5we697OzEGfarCBipyD71JTtUWEm9fg3giCi9+sktN+tDfg3H79j2HzfgfY3+JTpTlBvGv2pab7Rd0s5v1bumd6IINyQ6OqkVZgLEv7Kg0j9Cp4tojBBsFQGJR7wFftZH4zZRwYS/bvNnT/h8wwKIRg==
Received: from DB9PR06CA0020.eurprd06.prod.outlook.com (2603:10a6:10:1db::25)
 by DB9PR03MB7828.eurprd03.prod.outlook.com (2603:10a6:10:2c8::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:59 +0000
Received: from DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
 (2603:10a6:10:1db:cafe::4b) by DB9PR06CA0020.outlook.office365.com
 (2603:10a6:10:1db::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.32 via Frontend
 Transport; Thu, 13 Apr 2023 16:06:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 20.160.56.81)
 smtp.mailfrom=seco.com; dkim=pass (signature was verified)
 header.d=seco.com;dmarc=pass action=none header.from=seco.com;
Received-SPF: Pass (protection.outlook.com: domain of seco.com designates
 20.160.56.81 as permitted sender) receiver=protection.outlook.com;
 client-ip=20.160.56.81; helo=inpost-eu.tmcas.trendmicro.com; pr=C
Received: from inpost-eu.tmcas.trendmicro.com (20.160.56.81) by
 DB8EUR05FT054.mail.protection.outlook.com (10.233.238.111) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6298.33 via Frontend Transport; Thu, 13 Apr 2023 16:06:58 +0000
Received: from outmta (unknown [192.168.82.135])
	by inpost-eu.tmcas.trendmicro.com (Trend Micro CAS) with ESMTP id B667D2008026E;
	Thu, 13 Apr 2023 16:06:58 +0000 (UTC)
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (unknown [104.47.51.171])
	by repre.tmcas.trendmicro.com (Trend Micro CAS) with ESMTPS id BC67920080073;
	Thu, 13 Apr 2023 16:08:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MfJk0TLgtQ0FfRWsqPXnTG4DF2eKRnwpcoMCELpYka7t3fLQ8eHs0ErCOSyPose/yUPsakcVOO68VMCTFPbrVzoRrSaoJMrP4k0EjP3Ge9mhBwb3j5axys1fLNuVGZG9tjNJ3UwiBCeh79bsf6BwLLchz3iikd6m8RF98S+MRhM/ZMm3C2JLsoVTv6D4nY7g5dYnU497p0mIdHtSMrlPU8QFVlFKu+/Int50JyLXNqdJQpUTsb1KbQChgNEsNs8b4O0+biblDV65xkeyNj0CGxg7djqhtvyNvZBVZP/UQmII3D/a/4DC5PPoa0qMPvXLoiJc2z5mrKTigkM6cq/3sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=eXhnddw30EjiBgWQ9DiwXeMnIiIkIwORlDxsWERHdle17qopqkHg8Htut0mg03OWs64JMNdp7sr4tjvDjMnc6t9TybBdFM57qwPZI56cAglf/+mp0LNUXHL/oX+5FrlvY2BdtRB90FPOMc3u0O143sjCTCe3epkrhw+etWWY8BxhKO1UWTTtp8PHVNtSmQMsGuHy3NP2NrwGUXxKrMO/qnQPin/ST54lfBw/euLxtV21hFtGz8vYzaKKXqEEkCtWHmgYHSI7DADuaFhNYKREwWZ+2AqehG2dZQoXqwIrdDl9LbBslUuFTjjqM983lUN5/uT9IDFYJro0PJ9GC1ZiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOEtSA60wMXs/yMCjTmhGeYB3RHdSPz2YLllpEhk3Z4=;
 b=G5f+eRpERpqUzPydooP3WFAO2AJPDN4YtZUlwuOBUSGB0hkb1ASBc7JTJjR+T4Zyz8LnttHTmYFEIJGPQyecCXCkByjelViJOcoSP+bOxVtujbu3lb4dtycv8BYl3pXSt2PHbXrMaCiFNkxoh4ukptUVutxnis2+JImPfl02XuccikUsTU2S+T43J8uOnZu5we697OzEGfarCBipyD71JTtUWEm9fg3giCi9+sktN+tDfg3H79j2HzfgfY3+JTpTlBvGv2pab7Rd0s5v1bumd6IINyQ6OqkVZgLEv7Kg0j9Cp4tojBBsFQGJR7wFftZH4zZRwYS/bvNnT/h8wwKIRg==
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8325.eurprd03.prod.outlook.com (2603:10a6:10:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Thu, 13 Apr
 2023 16:06:52 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2226:eb03:a8c:a7e5%2]) with mapi id 15.20.6298.030; Thu, 13 Apr 2023
 16:06:52 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v14 11/15] arm64: dts: ls1088a: Add serdes nodes
Date: Thu, 13 Apr 2023 12:06:03 -0400
Message-Id: <20230413160607.4128315-12-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230413160607.4128315-1-sean.anderson@seco.com>
References: <20230413160607.4128315-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0007.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::33) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: 	DB9PR03MB8847:EE_|DB9PR03MB8325:EE_|DB8EUR05FT054:EE_|DB9PR03MB7828:EE_
X-MS-Office365-Filtering-Correlation-Id: 365b3753-2141-433e-e541-08db3c391c69
X-TrendMicro-CAS-OUT-LOOP-IDENTIFIER: 656f966764b7fb185830381c646b41a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original:  MIelGnzHMW2JkH3TA1LghvB26Z0IDcNaF828mnN1iNUP+Dg0kz5LtuWQ67NVFtCdoGZ3gfJhZStSXosuDc5vvOI0qxEa/4sL/bM1463S/fomkUNQsV9kk8Dy94X5GAWoFraNxu2kmIYO6tYE0D3iSn7T+NHFWNSklUU5ZDj+DZQs4EQAxqxHDxzNK+s9Rn/szmZv/y1m+hmnCoI+JJbWRJ3J+13ynlOzFktYwvGZ/Cex1qD3EQpjWZM0WXh+Y8dLwL6SRmfYBy11yLFXolsb0qteYkKLQ0PjRwBW2NDgDnR9+MdNQUCd1BZauJezAiY4lYQPO0JV9nkTg9Aphukv6NSHRSLqflw9cAAF3Lz+hOH4z3u/zm7ogWEXUbV1XUPO6P/6J0yUmfiBkjn0tEkYAiDDlV1Qm6rRMdRMdz0EePjf55Znt9Al2mYO8U3FXIOlHi2Qt1sC7BgkPl2qImGynhsE7AUMtpBXE3eZrUQ/thzXGrQ4ROvPIBkTI2rgUJQqaAiAsflGXphmPOBOZRRRVIC5SfozaG4rx6IDWtNms4216Pd594dcK5CsPlv8QCjGndb01mZGNYgIIkWjPUr6N0JNuyvCT9PO/UiMQ2W+g116UorQAR3fEVsUoJy/rhF0
X-Forefront-Antispam-Report-Untrusted:  CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR03MB8847.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(396003)(346002)(376002)(39850400004)(366004)(451199021)(6666004)(52116002)(6486002)(66476007)(66556008)(66946007)(4326008)(36756003)(110136005)(2906002)(7416002)(44832011)(86362001)(41300700001)(5660300002)(8676002)(8936002)(316002)(38100700002)(38350700002)(478600001)(54906003)(6512007)(6506007)(1076003)(26005)(2616005)(186003)(83380400001)(21314003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8325
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:  DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 	9f9c900a-de1d-4cc1-26aa-08db3c3918a1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	mKd6BYr/V+eEio7g3jgKGT8WSZY9g/hJdvTHgzTNmd+rKvAyHv/SnUrSoDgzI2CPjs+orv/8bODt1RF053s4Rc9gIlYtm1NHbHpwKW9CwtKhyhZi7TypQK9jSn1/ekPy1Det/cWvRwSrLVnMlUfVcfYMsdXkB48O8LT1QNdUGII2hBg4GD8cHeuLBpmCMydhbhObUgPmWw9NNkbvJ7CRdBw6QecGsEenvTMyKLnYSYCql1jkREXF1RMq6a5KtNdHoyKq/b6dsimVE/+6fm8xfyK+WeK2rtFo4ZGiD2oCvqyXfhw8R5QRJ6rJV3KLBKt1U3ohzA5Tlqc0iftoVzOI+3TYoECA006pxriWtNN7uXCaGn8LX3IdwywMiEb70QNTGxQborlvekjGF71v7RCkJ3E425ujSYrmRIsXhQ+SYp3GFXHbkuINGnHDhGQ435CUWtfVd2HTfFaugHKsGXkciT6Q8+RhWueazVRPsRWn2pDL/yI8Fx31Uv/lzqfhpdq/fW75rCECS6e3MPHf8UpN7ByRDKlZftjaAOXB97SEryxhwIciPbkOEHiRSGZBXIFnK16cmT+9xpe7Ynkbf3T9K8Bc/Y9DdrLy/CsaCZeoa4DbrVJUSJaUk+4DzOlO5LiAXeZ7G5wfcGwITU1A/T1DECWJ/JohBUJfLTN9yZhXcd0pUQMoPjQ6fa5NxpSZg9nsF+cTBVQDi13bjMPIUbso6D9iDDc4sIP3o/IpJWTcWXmSjJGjcLuILXyozUwwoWmBFlYI0SDEHSw9aMBJJSCRvg==
X-Forefront-Antispam-Report: 	CIP:20.160.56.81;CTRY:NL;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:inpost-eu.tmcas.trendmicro.com;PTR:inpost-eu.tmcas.trendmicro.com;CAT:NONE;SFS:(13230028)(346002)(376002)(396003)(39850400004)(136003)(5400799015)(451199021)(46966006)(36840700001)(40470700004)(7416002)(8676002)(8936002)(41300700001)(5660300002)(44832011)(4326008)(7636003)(7596003)(316002)(356005)(2906002)(70206006)(70586007)(478600001)(54906003)(110136005)(86362001)(6486002)(82740400003)(6666004)(186003)(1076003)(6512007)(6506007)(40460700003)(82310400005)(34070700002)(83380400001)(336012)(26005)(40480700001)(36860700001)(2616005)(36756003)(47076005)(21314003)(12100799027);DIR:OUT;SFP:1501;
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Apr 2023 16:06:58.9780
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 365b3753-2141-433e-e541-08db3c391c69
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=bebe97c3-6438-442e-ade3-ff17aa50e733;Ip=[20.160.56.81];Helo=[inpost-eu.tmcas.trendmicro.com]
X-MS-Exchange-CrossTenant-AuthSource: 	DB8EUR05FT054.eop-eur05.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB7828
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
- New

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 126 ++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index e5fb137ac02b..59b401daad4d 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -9,6 +9,7 @@
  */
 #include <dt-bindings/clock/fsl,qoriq-clockgen.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/phy/phy.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -238,6 +239,131 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+
+			/*
+			 * XXX: Lane A uses pins SD1_RX3_P/N! That is, the lane
+			 * numbers and pin numbers are _reversed_.
+			 */
+			serdes1_A: phy@0 {
+				#phy-cells = <0>;
+				reg = <0>;
+
+				/* SG3 */
+				sgmii-0 {
+					fsl,pccr = <0x8>;
+					fsl,index = <0>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_SGMII>;
+				};
+
+				/* QSGb */
+				qsgmii-0 {
+					fsl,pccr = <0x9>;
+					fsl,index = <0>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+			};
+
+			serdes1_B: phy@1 {
+				#phy-cells = <0>;
+				reg = <1>;
+
+				/* SG7 */
+				sgmii-1 {
+					fsl,pccr = <0x8>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_SGMII>;
+				};
+
+				/* QSGa */
+				qsgmii-1 {
+					fsl,pccr = <0x9>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+
+				/* TODO: PCIe1 */
+			};
+
+			serdes1_C: phy@2 {
+				#phy-cells = <0>;
+				reg = <2>;
+
+				/* SG1 */
+				sgmii-2 {
+					fsl,pccr = <0x8>;
+					fsl,index = <2>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/*
+				 * XFI1
+				 * Table 23-1 and section 23.5.16.4 disagree;
+				 * this reflects the table.
+				 *
+				 * fsl,cfg is documented as 1, but it is set to
+				 * 2 by the RCW! This is the same as the
+				 * LS1046A.
+				 */
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
+				/* SG2 */
+				sgmii-3 {
+					fsl,pccr = <0x8>;
+					fsl,index = <3>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_2500BASEX>;
+				};
+
+				/* QSGb */
+				qsgmii-0 {
+					fsl,pccr = <0x9>;
+					fsl,index = <0>;
+					fsl,cfg = <0x2>;
+					fsl,type = <PHY_TYPE_QSGMII>;
+				};
+
+				/* XFI2 */
+				xfi-1 {
+					fsl,pccr = <0xb>;
+					fsl,index = <1>;
+					fsl,cfg = <0x1>;
+					fsl,type = <PHY_TYPE_10GBASER>;
+				};
+			};
+
+		};
+
+		serdes2: serdes@1eb0000 {
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			status = "disabled";
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.35.1.1320.gc452695387.dirty

