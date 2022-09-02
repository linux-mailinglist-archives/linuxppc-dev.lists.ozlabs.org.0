Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 852B45ABA4A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Sep 2022 23:42:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MKBFv2Nxzz3bWM
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Sep 2022 07:42:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=mjYvWbXX;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=mjYvWbXX;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MKB973Zqgz305d
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Sep 2022 07:38:03 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CpTgF2S85kdGZ+IN4waO8Ax+Q6nnqkvjmTUcHcFBKpHoMio4K8Lc9wOslbmrgXitw2u4rLG9p+FbDPggrGuhdzoZ/N5v/mhe/39uLkKshIWKZS1BZGUqobiL3BjZQmm9fe/ZFwl2uli4TsiJdZYHOS5qacCvCoqPtcN2wPSxNTjlmoz0D14Jan7eRr/B21XQWBDQEQgpXC17A7yv+KsBozUE9LIWZfXjggymJ4BlKUQtL/mPcgx6zUVONbk3q7Sv+/8ZyCfDhWH/8sDYv3oliHM6RjLkGu7SA8LFJv9J8NOf/z9mSvzv5ltjLNmTs7wEBqxz+fr3wBXRcJAcpXxTHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=U/ZGi+njQGfKr1YiLruvjOMhgjjAM3Wmef+3rKquXXY+vWFyKb0ME3tYhgKVgZSMnfQxmw8feS/o9sHHkPgQiNlAEnKygL5CyNSG5HU1k70wQsnqbymWdbiKMvu4VSz5QKjg14VcxeY0LBqRfJbyQIAuVKUEMpzw3SIIfA/c3EwUrjsYoLJoFfrJCPRVurpUWt06/nACRazlFNlmUGslreCKM2/NfB38Hl/xGQZXNYVwiEuyrK1zaKxv5EjZVSDJtx65f9o/QtuAodUuSYk613SNnDBb02pGT88JwSdltci5s/1hvAmQBl5p8goFAo7omlAuIiFCHvJc3dYy9CSeGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=mjYvWbXXCLURWedgOZjTFd+Ja/c6LiNLEu3dNtqNy3w/tH4GPwaD1VkObhmBvN6u31eygFg2eBmVb1aoaecP2nFkRql1fleWkcuuu7DG8nAi8KCoxoMtwRoxehcUlDQBW06Uq6UgIxSWmH2ggx3VdO0c+xAYmtRpXmEQimEIbw7jLyReIZso+0R/mcLnmAkAgZrnyAiIpQcV1w/Xft7RgDlV9qeM6YUTG2z6i0OFv/6QcOR0blySR/+PvIEyh71v7mapCDHABvyfI0a49Pl2xNe/D6C2VAalykmfbUIp+uGXr+enp1EUv3ffjr36RDxMt4h2EhuTMMzEku5qdutcew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by PAXPR03MB7886.eurprd03.prod.outlook.com (2603:10a6:102:215::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.15; Fri, 2 Sep
 2022 21:37:48 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5566.019; Fri, 2 Sep 2022
 21:37:48 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v5 6/8] arm64: dts: ls1088a: Add serdes bindings
Date: Fri,  2 Sep 2022 17:37:19 -0400
Message-Id: <20220902213721.946138-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220902213721.946138-1-sean.anderson@seco.com>
References: <20220902213721.946138-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR08CA0008.namprd08.prod.outlook.com
 (2603:10b6:208:239::13) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1cc8f08-18f1-4a0e-08fe-08da8d2b6159
X-MS-TrafficTypeDiagnostic: PAXPR03MB7886:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	jqpbxceMFgen5YMM5s4EYyp90T4ias5ZHIk3KacfoEh7OvFZKTQkKMIuWs5fGOFLuRAhmAf5hotNqF/hxOB8uFChydQaTDVIjAwFofDSYEzmfDAw+tNHXN24hhB2xvXoXedAFPfmm+PpgVqKukR4RkUSAGceBklGUU9gZBUD1Rmwqr/O/twGWlnFnu4fYZJx7zf/FgemSyv9ZUPBnjCNgaVqQpyw6VrEg/LH7ITGIFUVvzRABkpbtRI34jLy/QgmrAVqA8iP0IoLR5VwYxNRZLnwM6TCObG4Na6WzzSZd64x2BPO9hlktQo7urJbG/XqoBVhcZH9sx0EfCOuxUaEIQBK+8aPt7KtBH4Bm3XMBLXexKayeR7VJIhayJOPlWT3UK8pMhMOz0T1QYfc20PdglVuKn45ZJVH0Oa2r3xHSSyC73pNO6e0cj0iDpB/QkMRIMrCp8QZv4EDt9exlKtEkp1KWgo+zwkrKirieLaPPpMw5OrbwlVNqIIIBPbbN42QqF4WjJP4riL4SDlcZwqVIJawWBk9Jzn0Uh9cuFSpFTNjk10XSvpzseQOhabWRNgg4wC31rY20Mk9ZjDCzYxBqVXXpeUATCuVfBRSjz9WEcQZ6dWdCHNLSFZgp03raq+YGMxQJvX1A/Ca1BwQBhviU0Qtb0JLtlHeMEMtyBHJEgVp9EP1q0FnnwWsEqnDT+9wUNtg3CKDNnf4mJ61zF/X8VC+j+uDgwI1VHQEwaGmmk2ai5DM81tKC0ajXP7BkqEN
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(136003)(346002)(396003)(366004)(376002)(39850400004)(110136005)(54906003)(38100700002)(316002)(36756003)(186003)(1076003)(38350700002)(2616005)(86362001)(6486002)(8676002)(4326008)(66946007)(66556008)(83380400001)(66476007)(2906002)(52116002)(6506007)(6512007)(26005)(8936002)(5660300002)(478600001)(6666004)(7416002)(41300700001)(44832011);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?he1F+mLGZ89e+VbYjAXTf0E3jBdC6CSZQnGjgI0HfjitFI3GgxZe76ZKCKVt?=
 =?us-ascii?Q?xT3jrqGPqtTy09+ok9SBn0MQy91NEEWfwf1zZxA4NYpAKknIO2zME3Lp9ePz?=
 =?us-ascii?Q?XMHKfH6cy8EycoWw16ud80GZJYip0OvYhuwCooTcqfQQT36pIBnZtCtYh1//?=
 =?us-ascii?Q?09457cPvoiSqhZhugcvQq0Rc8dRfTfR1CvpojuyAXGeQRBERIptfWxTrvRIz?=
 =?us-ascii?Q?are0cukqiKycDsU0NPFFSMC2ZRY7tN4o4uLTe2SMgDCOYIRo3XhrnCWrRV/p?=
 =?us-ascii?Q?PWrnscTORLFQBErwbdnuwRkfb5RqxoBF9wyBDs7qCaS5sYp9LovsuqqtRVV/?=
 =?us-ascii?Q?JHUoxrOnD/htHktbtHodBzZ2cUVfWP1TrsJwfgsiTNKQZSwH7fKy0OExCEqu?=
 =?us-ascii?Q?HB4OQtlcaZl0EmwiUy5RKlJT8LFIeHAZWm0rpoIjDAjnY1P0tYs8wR2/Hi8Y?=
 =?us-ascii?Q?QqibS89+oE1TOs3Y0e+29AvrBUAGMryPzAhI/OKxDNgeKf1PcWwLnm2g6azJ?=
 =?us-ascii?Q?ssTpEmEIgoBvXzC80AVaFns4tglSMTxDekqBxRJUMd54tBYdVkzrWrn8++nf?=
 =?us-ascii?Q?x8Xn/6ro98BMv7DuUILMmvP6ADFbjSRk5kOBdsgfMWr72y3lsgNGYe+OD4J7?=
 =?us-ascii?Q?0sTA/RpxfAAdw8BPUZOwERGtrkd3/hczzCWiuDM4D7cy7NRgQ3mZpKo/gnli?=
 =?us-ascii?Q?Y7Y48iv6tdaoZkSlPT+Cju/EmPR6RLBt7+/QT/iHRzFdbAJqn9eWqE43Zkt2?=
 =?us-ascii?Q?tTh1RBABRFr+lVD7QLvzqRTQEL1sDYKQ95XH8hZ9vCuGJgR6KF7O46BZGSab?=
 =?us-ascii?Q?mi1Uz+tbtxcJ1BdU3SymSbqdsZgc1jZaWVZ8NBaOdQyfBGW0xOY0Wym0ttfK?=
 =?us-ascii?Q?yQMPsNaexAowBEz/CVCnrVUy6Sdfmpfe90ZpKnCHCpXUp6ry1s7bnnpKzZlS?=
 =?us-ascii?Q?JRgf/mJyzzuW5HQu2j10xDFFTHrt3MVLC8nLFqzRMBVSD3d/fX4ehbYqe/bP?=
 =?us-ascii?Q?FlsxsCxpmyWnrBlV4bnInpKbLiOBrQbcJTTpq6uuE+64Sy80XG+QXO1NdWMb?=
 =?us-ascii?Q?iyjXc1NxpmXmu8Y36MHBwxCxTRDZYWthbzTI+VvlwYcBLux/M9G0+gCWlENG?=
 =?us-ascii?Q?/9gHilP0gwZQM3jqA1ALM4b0MsEN3Is7CqMZwGk5WQqCE8ZGz+CeLanf3ovm?=
 =?us-ascii?Q?JYP1afS8jwSkKw0/cF+VnzHdB/GxIlNDXJd07LHRXASAM9LKIImhzwfwJaI+?=
 =?us-ascii?Q?437UDVU6V0IQHt1f3bhCMijUsA38s77yCkW6H2c8j7oq6xjBAfD5slqx4oWd?=
 =?us-ascii?Q?xSKHm+nA7Ua8eQrD/W1hMz/Xu1CF3vkar8mp9xEmPMn5ZPWtUK0i/8o2jv5b?=
 =?us-ascii?Q?qSuAwdqFhS2fZamGp9DsYTFP6wviv24EZXgMl3q7Gbjbfk44aLRm9UmJZU4i?=
 =?us-ascii?Q?lMZQq976ptLBywcHYl379mZobBJClrSl5E5h4Vc80pH/gkCixzLgEVXBZcUt?=
 =?us-ascii?Q?YXA6kwfjUR0DGaTbnPAeyWST7Vv4OPm5CvFSVmtzfxdecnWw5hazfUP9qek+?=
 =?us-ascii?Q?4U1uSv058MJlDfsGFF54/pDf4Pq37emfjjsv7iVSwZKwbsuupyn8sIWWzLgs?=
 =?us-ascii?Q?kQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1cc8f08-18f1-4a0e-08fe-08da8d2b6159
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2022 21:37:48.5025
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SYT0/hj5m5EoElKOzC6SsNgNZXoE/N7hERn2FfXD5cKxPrhcq4UWEHVcKley+dpxSnAFWxr4g1WEIIL597nAmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR03MB7886
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
Cc: devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>, Rob Herring <robh+dt@kernel.org>, Camelia Alexandra Groza <camelia.groza@nxp.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Ioana Ciornei <ioana.ciornei@nxp.com>, linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This adds bindings for the SerDes devices. They are disabled by default
to prevent any breakage on existing boards.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v4)

Changes in v4:
- Convert to new bindings

Changes in v3:
- New

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index 421d879013d7..3810d66f8725 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
@@ -238,6 +238,24 @@ reset: syscon@1e60000 {
 			reg = <0x0 0x1e60000 0x0 0x10000>;
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1088a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		isc: syscon@1f70000 {
 			compatible = "fsl,ls1088a-isc", "syscon";
 			reg = <0x0 0x1f70000 0x0 0x10000>;
-- 
2.35.1.1320.gc452695387.dirty

