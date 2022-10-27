Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F12561016E
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Oct 2022 21:19:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MywTT706bz3cJy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Oct 2022 06:19:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YhRQrqPw;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.21.66; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=YhRQrqPw;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2066.outbound.protection.outlook.com [40.107.21.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MywKD4Xmgz3cBv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Oct 2022 06:12:00 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TVjmRqnhkGHyKEyjVReqwz0y5/uMjkc+Bnq2nPEt2VpvFA8wnrrvmmcVlXyNqqvz0ETCymf4LVL/GCANkX2WRFD7LRmkqxDq/FUWuddm9e1N3BoiLx4tpkp0uL2awi46VP/AOI0eoZMLrAcRZtlnkc/bMLqxpRpBSblc3kLw1sjQ7QlHIqFXqARKP9Caq4NibZ/8nWYs1+y331QopvaSDVzjV92UyRPpCCu/92sQa22IZet7pYRwsiOSY6hn+Gc+Q8KQr12VoiGX2GasY6aTgy4kKMPqbgHuC+7fMoCPYpuJIcxrfF/Mz3XodcbbM6i8nvr2HCBET24OpVgE8Up3iQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=FuClKz+SGRq+SdSEp26NUGAqOuZBWqEhCwRLN7nq1Ss5wXpsOGmINKgv8PGjdtIyeX7DoZ6dVXvWq95VTJ3KD6y5rWiyzlnPZ+LTAuE3+tqEFXpqwF0HkX2wTipleFOssT3UEH7sLWAEqPxx3/SeQrfcmga0WmQ1fk9w5z80T/FwrjeXTDMqkVB3tafh79kzCBLhGoavLz9VDMV2YLpzsnZ0AY1QcBl9t14jVrzd99MzUabzUGSxNCWIx296E3hHT+aaJwl68VOjsOxq/hU68ew6h3ZLiNRr79WqFLLwxbnyPBBficK1LiN2HXsCGfmycAN37lLOV6wDy2tOEeSvJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=YhRQrqPw73y09yWHI7EmRHdjfw2tabYeMvrCfknpgoIg1eTGpomDVb5TrkA6sqjKiSOB9qaGbzIfBdpPwvThwynB9NHMsjWxw+ZmZIQxnVB+PJChvhmS1ND5+jjipuvHpZVpKkcSRoGCcNgIKkv8sw5sxhnZ9rEUfdgLM0JVCTG5PZEKnjOQSdI3+Dr7YFAxsIP0Vtv6S7HCq+v6MTZ4ZpJWzPBz/dDS91gBOwJo0NzceULocyuX2RQVPJ5GfWwIzCpIwvm46FO0QYQOOGdQK0Ja4zt+xjytmYuHWfePdRlO0Cim9X9O2tZnj726m2A7XMtCnOfgXJd7mFySg3s/Yg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com (2603:10a6:803:c5::12)
 by AS2PR03MB9648.eurprd03.prod.outlook.com (2603:10a6:20b:5e8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 19:11:45 +0000
Received: from VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d]) by VI1PR03MB4973.eurprd03.prod.outlook.com
 ([fe80::3d5c:1e59:4df8:975d%6]) with mapi id 15.20.5769.014; Thu, 27 Oct 2022
 19:11:45 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v8 7/9] arm64: dts: ls1088a: Add serdes bindings
Date: Thu, 27 Oct 2022 15:11:11 -0400
Message-Id: <20221027191113.403712-8-sean.anderson@seco.com>
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
X-MS-Office365-Filtering-Correlation-Id: dfa51c7b-7138-47e0-cd83-08dab84f1693
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	F+jx3qdTt76hQ1BwOtZmhQLBCzjS0OzhapofPye7uPlsAKzVqklpySHsP5GTsj+X+DKwbXpg++c+2NtqOZzranFAzP3jmeqD99zcgci8nkrNDK69is92fV45u6+itkW48yKU27EYCxeSQiOkBFIKR+SX848Ih5GtwNKT6H5Mn7eXUAiNQCDv+dZ0VCHes2mo7TDC/zL5OUKlQl48fgCCG3ic+A+KYSUvoq6sXOoJGBFBSt/nHvkOex95URLBCURbEz36sLpJhpr9OjNkNM1P5lS0+1xWjmy+kyzl73AaJvusxXii7fd28rk4bMWQKeOWENMnTiuqZIjVeO93Pj1sfSlw/+zECLwpX0eAH9+A3ngYbSJmFe5ZX506+y0ltaSRGDk10LQwGl6HcTuNmdso6/d3IEGVv6Ap9Th8yYz/OBuJYh77AWJf4qvABC9kaSXoHHbKBg3Lf7YXH8OWMofU8cTqzD5BYa/jB+7I+9kjc4pJkJ0hfbUA6VNWGEijsSx01IbS+i4wZSamBoAtmjdljU5uWGkokzG/0qdPnBv7NG6Ks/0eJh+AC7NKtC458z07/1t3o6GbIbmkhgpBk4Yb7KAMpVPeSR3VhyMCUga5D7zGmnEOfoHqz9RMoFJ7Yi+lz8AHyIa6rVPhkCK/oTFhmn6nqR7f4/nplLITSnHPW983qpw6tNSmJWO0qgCETiQeXRlT8je5ubqwZkD0zP+g7Y9V6zdLie+Aga8zDuqTZXizNU7oUsqQCmsmOm2KgwU4
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR03MB4973.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39850400004)(366004)(396003)(376002)(346002)(136003)(451199015)(110136005)(478600001)(5660300002)(54906003)(83380400001)(38100700002)(6486002)(7416002)(2906002)(44832011)(36756003)(66556008)(66946007)(8676002)(41300700001)(66476007)(316002)(4326008)(8936002)(6512007)(1076003)(186003)(2616005)(6666004)(86362001)(38350700002)(26005)(52116002)(6506007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?EqEUr+Dwpn1ldNxma8wklsiOSirnh8mp6b7ES0XJyiykVx3NgYqjf6pU50eA?=
 =?us-ascii?Q?5e5vIIQ53j7+RNHtPNPWtF+g02yQKukyqqJcAlGGEhbEVTuwC0pS/CZ8m/tN?=
 =?us-ascii?Q?bz6ti7zPkzIhJIE+z73TyMj/GOGcK7f1+zvZ8NsnSUsPzr/cVf3tGAQXxNsU?=
 =?us-ascii?Q?lOyJqfqWCvbj0knhVY5wXz28xsb/CgnPT7dyNpO2WP5ecoWlUOTetFNaqXje?=
 =?us-ascii?Q?L2csKICpGxp98VdCubMlV1UiwD+0pG8RoJgX+gRpxiSZgpuYQSydJmPOYh/z?=
 =?us-ascii?Q?7UPvr/5EwX/IcnJFVyKqXoJ3ddIptmuc0LCuT1IYzUS54I2JbtzQ3ma8QSCg?=
 =?us-ascii?Q?lxJIMfjqwhPbdL588Bg+QgYeB0JL1QrawQ+ddwfqdAMWksAOkuqkavhOt8SL?=
 =?us-ascii?Q?IU09OttAwH9bksm9IDmgbYWSnKclNc/W2LVRl4lOvQMij2FIdR9NOmfTvEYN?=
 =?us-ascii?Q?gNgMYACwDCrHK80sAP17/D++lWkIk8fFKAwfK/FC9/YLfVMYKkEIWgRTiCh2?=
 =?us-ascii?Q?6O8O4tw76BacQRcMmA7hwJqnktGswdeHR00PuTzlxFGoBa5qwRWgHyC0ZlXs?=
 =?us-ascii?Q?gCq/iUlkAvGHVk0kvcUrqePHFZYWhnuduW31QF8Rb7SfT9Ujc6ntQRN+aJWB?=
 =?us-ascii?Q?13fC1n4ftKovPAKKz2ltjxOfWH9RLXfiX5/IPzQnro8o5US2Pv4DcH6PwoYl?=
 =?us-ascii?Q?JhchXO7LypoIWW0Ukv465Bp3gWanMFvDSapnNRtm+8B8ctjQJWHtCn3xeauJ?=
 =?us-ascii?Q?XKeF0k+fj7vlK5KDDR9GuKKOWmvg/krxyNY3uLuojP9XI1hMjCdwm+YHwjIF?=
 =?us-ascii?Q?FQ/vD3z5ndc0hse/esB18GBa+ZAi4N2mLgfm8fGiPpRYW4zxOittz9vFToTi?=
 =?us-ascii?Q?hW4StXLb8CNEeVaVPqQXE5VeCUQIGcGI+iT1Vxn7bux4CxqF7DkH97tEzBnO?=
 =?us-ascii?Q?f+FGMePcfBX0h1H2KfsIFguEvbMBocaGNvfWEtzhXrrTdg9QtwMpTv2cuzwh?=
 =?us-ascii?Q?k/MrkZtW8qEkGZCYxLD9ERwIvRdgSNLY4LyUX1wrnVbAfReHWkrtCDWBL6VM?=
 =?us-ascii?Q?eug8sj5eQy0VKOgDTnp+gWMo2tvtAViDmqvRiINiJ2OK2ELR0pLF7Y/zPSUn?=
 =?us-ascii?Q?5hNuEcss5IvevyPy/FBl4vnxMI7Xv7EGkKz1i+j7aig8hFLDb0hSCEi1EmBX?=
 =?us-ascii?Q?mP/3JpMpLJCiC2L9WJaVdikh0PrTFQ7IAhFMA5g570KawBCcQoV71/iMB100?=
 =?us-ascii?Q?D5GSg6rRo3XuK8Bq8oICQgJE+d6h5C5BUZlSftJKS8Cirs/g68PlAfWLQT1a?=
 =?us-ascii?Q?XKqARcLvJDyyP0Xr/mb7h6N+Y9VN6ij+U2eSi1qQLEuN963m6fgAJdeb2jVe?=
 =?us-ascii?Q?JwgsPsT7pJAdrwG1W4OR1vgFmqji+X1Iqo/pxsrhAzcpa9K4oz164K60+81e?=
 =?us-ascii?Q?yTOzaehUlHOOvngqYQ1vpdDIspa2D6DR00+wSH1S+ibuhj2e3K+gnQPETCb+?=
 =?us-ascii?Q?8LX3o4z/EzB6b6u69E0rUUZZ8MBwt8IayMAnhpIbAslCtURHmGQMF4axNl7/?=
 =?us-ascii?Q?hUFjw79hSWcmxYgCbPyCwF+ZTKWfeLsss6Kn9ckDa+TyZqDCLECd5ZN/W3ox?=
 =?us-ascii?Q?LQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dfa51c7b-7138-47e0-cd83-08dab84f1693
X-MS-Exchange-CrossTenant-AuthSource: VI1PR03MB4973.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 19:11:45.0964
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JdHz1w9UK30xE2HBBTD1TPe+W23G3PFvp1wcmbvv1IAuGQv+rC9n0egYWD6CVAPIIzRPr3VveAzs/TUUqpkP+g==
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

