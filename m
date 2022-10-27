Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BC06610170
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:20:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywVX37Ydz3f39
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:20:04 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iCHZyOVD;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.46; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=iCHZyOVD;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2046.outbound.protection.outlook.com [40.107.21.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKF1g12z3cBv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:12:01 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lU+vEtcu+vipHs2DSfTPidymrqQtRc+7e2Z1oxH6Bya8lSoLTzq7n4/xnhCRAJHFLv0zlYkiwRbKZ4Pvvy1TuHY3Su2jwrQ+N0CAHsHUJjt0RppXLreDziDKr3PW6wiGuqr2Wvbg1digeUN8VFjEtRetsIHw3BCptvtfjz1PNoExVE2EemmWGoWhIxZLnh0/c/en/HB6vJUt9qM8azXB61WaFSwDVqZBEbyicdYDrJExCm2nMkk1bneSCtHuKlEB++6B0IbMKYmwo3D6YF8+WMLToyuHVMGOvXQbMHuJeCsAmIss7tLufGMkcmRu5nIWTJa4HlsJmcY55wpn4TmN2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X/uNCDEmTY1zQ8OCTFQCdFu+UG/G+IVl8XhChK8qxqk=;
 b=JR/GwkiAuMgY7Pv1g9LhuVG9OLSDcbTcVvrUmw6W3lCqkvOZC44ntbW2mGym2N8/8Yek0kDmqCn/4lDzPhRikLCK8ehPFWAEXdCiGVKQ+umNtfBPyF6BX0Fda36P0AhDZW5ZNhGoSvuSTM+fsQlJW3bSTt3p6fwM+C8PezvFmv5365jIP8DfpJifIM37pG5OtADtGdyeQ3X7limTOk0YQ6zc4t8/anUuV7DiKPkJZTKSYwuLOc0BIowbobTDywTLaDsKkSwvtp0aNjPjkSJ4sfgE0S/w6/7DbHLXhCUNAkFA+tObZqb2Oe03ueMBDbVLTEV7kxrWfXux5TZKlH06tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X/uNCDEmTY1zQ8OCTFQCdFu+UG/G+IVl8XhChK8qxqk=;
 b=iCHZyOVDrOcolrvgxpnvIrXuE2iJkO8/ECCdoj/mq+EqEkRGs8pFLOSj0dwSuP5+yMECIbYUbxFDoGV43X84InHC0gWifVfX/I2yoxXYHr9xBhx7aENXla3RJA4Ypv7iw+yaYjE/oBrt53sAZFtI8v/Bgv+LJXc9nKN3gP+AqdSPhjXfSVHFrfWUwJ2X8HOEezr38L3Ai80u1OmG6pmVbK0FvWqDl9uxTjB2OlimZcn+/oEZqU7h0tO+34ZmuSQ0krtC8wQ3m8an4PD2Wea1chqDoAC9j8faB5i5sxbdHbX+XFs0ruTxUfXh3JJXZoY1+ywTAXPxnNEyS3HRJrOKxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:47 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:47 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 8/9] arm64: dts: ls1088a: Prevent PCSs from probing as phys
Date: Thu, 27 Oct 2022 15:11:12 -0400
Message-Id: <20221027191113.403712-9-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221027191113.403712-1-sean.anderson@seco.com>
References: <20221027191113.403712-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0218.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::13) To VI1PR03MB4973.eurprd03.prod.outlook.com
 (2603:10a6:803:c5::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR03MB4973:EE_|AS2PR03MB9648:EE_
X-MS-Office365-Filtering-Correlation-Id: 94de8072-5b26-4f21-b8a8-08dab84f1826
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	PI7xiQ+Y+HUxey8h6TdUznZsVpMPuxAkdbOtPVeryHJZbd26sEow1XpzfCHnsSeSvlNeNed3+dZaS1HfZv/j8ptkYXZYaDUUAkncKFR4Kuh5yzGoDh+lt0MNl44nZa2Lt8K2TbGmA7gDRpwAMz3l8NWOAUj3IVwoGhTvAN0AEm9jxaWicsjdEUCd/rO35fdBkOfW0xht5SJpWRWtfSrWIXuV9+057lKdsE8rfI8Y+W2UZhMCwoTAmwBV1ZXPGbrKtCM4g1qdJC4pnrAWUp2EWM4cKz9y7eB8DdgvqrlmEPMTiG4hbRMgZ1G4wmAMy2Cf58033TKDiXLkjC/EaG8r0AYk2q7Ps6mEPA7g8VxLRql+ie9CvApE5Hsyo6+C/SGCoVr+aaALEgE61hTzAkKc/gG7XNPNy2snz1wnZK+aLkKwEtcgZvQXkfcNyToW1CpXkdPniWq1d2hXAHgWCtUl+G36Q0ge5/b/Nqb7wI+kBPhs/Jjat+ENm4OWuaM8GsqV6kc7n5q1jcLETO8l/VCt5P1QVdXAnth/C+dSAM3xo0GNkAzTibz1QqAnwUEjEQO43TZ774GUatl+d6XImWzH9ayNsTRSBNvggR19hmCptk1+taxSp/wyI5OP92VbSYJKTm1NsB3X8QZycNevOEVsUVZfD5QEC73U+mUiZnfCEpkK/+yk8UHjqM30Fbs42VyMNjQJGoTAbXiKN+HCpZWvF8+Wtfq2W6zbPQJPSOj0BvxSmiZtwuBz+P9xXrLe4Tgb6PYevTAzunptzSDvM8clGQ==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?GGteZoJZxNw1ZywCX8ocMH9rthlvSWbfngvzosttWjq0CDKvjK/wmYOlJqD7?=
 =?us-ascii?Q?G/M64LI9clFkT3f3trS/VeIQqsgIy6IiZGWmXfM+aV2ZJDtNdblNtVE4h28I?=
 =?us-ascii?Q?p2ehkLk+WjK5/qXyAg1DzmAlxAbnfTNXI0nnLNfRnOHNSdX2KxPEpErqssd6?=
 =?us-ascii?Q?D6AYBOk6t1Q1JTZ4x5t3TcEZA4ZgXjJO4iD7V8tjN010v+TxeC7yX676WSoz?=
 =?us-ascii?Q?T8KMjn7ZYClVR1E6nxiLmMoKCCSwNOz2IPVUm24dKAoeSmY+Ul07Snvv5TX4?=
 =?us-ascii?Q?+xLn/1QV+tb8f20ZoL9yxr8LshHPECowC+dYRksBxj4diQjj2DhfGq95oCla?=
 =?us-ascii?Q?jf6/rXpp/+lnYySwh7eC28g4JLa+SE7McWa6A4hRzpre3dttjh7o0O93rzjU?=
 =?us-ascii?Q?YP9Jmw8tdexkSshdXJZRzh7CjBNVVve+J+VGoWncQXLkIzMYL1Vd2JhfRtEj?=
 =?us-ascii?Q?2g9DWr2majXhPCX5JwY3YWAGY4sj6iLWJiAsaStuleDV09q+I3ZtadWMuJ98?=
 =?us-ascii?Q?HjikCVgYwz1i+/BMtLLb9m8QGx+8nAJ1x89L1yrRDroUL7azPEyadgjo5MZ1?=
 =?us-ascii?Q?97cwpolqH9OZaODzvfNNCXXB7liQVWAPGLmLFulv4HY7jCcuYlteiFas1gVd?=
 =?us-ascii?Q?l2soklcX/XkWk/NZzj1+eXFQNYZuenrM5Mf7ugIfYWSkaBuA4eulqnN3+7+6?=
 =?us-ascii?Q?fba5aMkFjvxXM8+BZgDlMf1FQsKHoYvR6Tsym+SLYQH9Xfdn7RKnnpaWMzRL?=
 =?us-ascii?Q?f4J5nNLDX+2lk7LJiARch0nCqaBZ3gq+Ogp1H3/yGbMvMcb9Yl7UtSNHyv+S?=
 =?us-ascii?Q?focuUi3Yc1dVRulGc2NBiBhdVBWfMQiIixxshHQ53ASOp65BbAQtXw9jRw8T?=
 =?us-ascii?Q?fMbrqR7Sanc29BERJX0WcQ8c52CHX53u5V1JFl07sXWR4Kfa/EBrgDSvoXyv?=
 =?us-ascii?Q?OttsUnxbXt/F2/8AGMMtqT049bPZjzLsLbWnFMyZh7jcl8Zg0vakP2mceTrO?=
 =?us-ascii?Q?Ovg+gnbXlcKxtwfufDzoSvIPoUYvVhcizrObj9SRm6LbKLr9fFqpcvMzH6Jc?=
 =?us-ascii?Q?XL0vbagHK+lFfdzSXtcUuWpbyNJsruDVVzXIKE3wHS4PSHqeXJRH2533q8Cj?=
 =?us-ascii?Q?MubofhEj90zzUcnY839gseVw6vIFNaU1CrgCDGRQskS2sf5Pa+65RC5tkllp?=
 =?us-ascii?Q?Sl8L3uyKY/GAvQEuhwXH0hn3qB6N/J92PiTXdEWiO6BK1f7lRTGuWl6qPp4H?=
 =?us-ascii?Q?hMgmADsnYjxLbHjliw4F1YD8w4a7bRs3KjBf8D4m5RBM/0XFDTs47KZQGhK6?=
 =?us-ascii?Q?ZKxFfLBq4iQfoM+Otcmu7in+zRfwRmLB8He22/26x+3LuSYxOs48ukMV8N+C?=
 =?us-ascii?Q?f+6hvd2/iyCIInBbE2f11bMZLm5pc4RZgeY6QNtcQ6EqQGDfWv50AKgwPQcP?=
 =?us-ascii?Q?opdjjxZk8U93ORM04MlGAQvFn0osJWlVGSWIRVojPbNIHOSjGndmSgPPzkk+?=
 =?us-ascii?Q?Lyc68Vws3hSr76V6TJ7yNM4ja6OaHhvnHQEDXb/Cio7Hok2+TeuvihoJ4ipQ?=
 =?us-ascii?Q?3Iq125svG/hlLTnYndXuKw3r0oNKQ+PXKxQcpoOi0srpl4Y7P7BCRgcwwxRr?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94de8072-5b26-4f21-b8a8-08dab84f1826
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:47.5651
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K9pPG99Zh2MMYKJgCLMZHsEJHc4KBxEDfo5mEglxFscb2FLcw855DsfWH03a2hC6yZ4iUle9qVSJKVdTOWUF9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9648
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

The internal PCSs are not always accessible during boot (such as if the
serdes has deselected the appropriate link mode). Give them appropriate
compatible strings so they don't automatically (fail to) probe as
genphys.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>

---

Changes in v8:
- New

 .../arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 30 ++++++++++++-------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 3810d66f8725..7603ea6328d2 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -817,7 +817,8 @@ pcs_mdio1: mdio@8c07000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs1: ethernet-phy@0 {
+			pcs1: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -830,7 +831,8 @@ pcs_mdio2: mdio@8c0b000 {
 			#size-cells = <0>;
 			status = "disabled";
 
-			pcs2: ethernet-phy@0 {
+			pcs2: ethernet-pcs@0 {
+				compatible = "fsl,lynx-pcs";
 				reg = <0>;
 			};
 		};
@@ -843,19 +845,23 @@ pcs_mdio3: mdio@8c0f000 {
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
@@ -868,19 +874,23 @@ pcs_mdio7: mdio@8c1f000 {
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

