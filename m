Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F3050603694
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 01:17:13 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MsVBH69HMz3dwq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Oct 2022 10:17:11 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ns1RkOHG;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.8.75; helo=eur04-vi1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=ns1RkOHG;
	dkim-atps=neutral
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80075.outbound.protection.outlook.com [40.107.8.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MsV455GFGz2xZp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Oct 2022 10:11:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovfk0KrqyKbB1Qi592bhN2x1Dzxtq3+qx6nJkP/fxWf2o3xBLiR/Dkto9sRKJrraq2DAatxQBAg1qUdEQE2JP+GbO+lGBT3S63ZPtVTCzR3/O5Wp7GscC1Qo/2lW73C5yEM2iq5stmv2D0+MGH7rWBmORBPesLqDzW+KrZWC3uXYH/TDB9cXkSvxNzEIULZ8pNBZwM7wJp6BXIkgAcaSXe5Sa4/6K1w005rnql+0h5oI7Xa05KJjV24oFYXeyjlMLr7jaUTCqoIEJSumEq590/ZirlgtL1zJMhRkuewjEyL+MzvJ8vFPdnQKfFUn+UFn5FeUJtDoTiWZQ/Uqq6dPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=eSL14fRsZakoQkguFmSBeOJlIz8UHh7HP5mciH6JKBVGlpQzjLwaSmcRdu/FzusS8bURAttUaBeyv06WGuC46jIFzWR2WPvgdCIW5UVrMKPfVHcUWwizOf/d6edMeOJe6AOuna2AQSdvojh9QqY/L5zzt/oekOx+ePiz4CJiT4P5FyvVC7xiS9WgpiyEx3jmXaNtZrcUoIgINEJsWjg2xgtyrzm0xidhesrbyp4skx6P6NIMkO58Tt5/NZMq6MH67+22tbGp+uTf3BloXDZN1b8k/00+GqRRglLXJgdOt9SDG3ZoLkEeWaSAzC1CmjnpmgL3bPg+ywsEgoe2Ae2ExA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4rZnDIYRgiOMpogZa0b1T6zno6/ylouqK4NkpBXH1y4=;
 b=ns1RkOHGYLzdEtW26LI9I85erhaek7Pyn7I63WkjOflU/ofyyyV3ha/2EzcEAhgKCoigAq0n7A5izBUOlbjg0IVxaxPZmblcunyN9erSKZZfNUm5mrH+1OkqQS5T+Iv4s0rYvKJpjydXpGH2M4B/GK3gXb+rxc74vfbWQteYGW6uml7KvWEN7/GD6LLANFP8y1LYtsQb8nLcogL/4WdKxETIsSrOOBJ8zlnyScqKlMCD+U3XkUPsIDqr7igOD2faKhCGx3XqsthKckcGkSXK2ZRYqMVgvl9C4P+aPFXy8TDwi4RfV+BwtkRP4f/5mwBoDiyHwx3EWlWduNTA6kK8Qw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DBAPR03MB6421.eurprd03.prod.outlook.com (2603:10a6:10:198::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.26; Tue, 18 Oct
 2022 23:11:33 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5723.034; Tue, 18 Oct 2022
 23:11:33 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v7 6/8] arm64: dts: ls1088a: Add serdes bindings
Date: Tue, 18 Oct 2022 19:11:10 -0400
Message-Id: <20221018231112.2142074-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221018231112.2142074-1-sean.anderson@seco.com>
References: <20221018231112.2142074-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DBAPR03MB6421:EE_
X-MS-Office365-Filtering-Correlation-Id: c3885b56-4071-48f2-bbb4-08dab15e1956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	XscFpAsIH3HJvdZ5WW1slE49jJn5s0R6PCF91NMW43s0w8Ke3/XAxQFDJVImRZmt8k6SCwQ7UWRsJVpjUXJ26Q7E7W/HiAST74x4+mLaaB4Kwr5RCRbX9iA65USiev5vLhlanj5cbdPwullv9IVpjY3WlBCI7Omi19o67jI42ra52D5WYtxkpGy1OzqflhEeVEi8BP2wIkXsEYRUAH2JIS48JYypYDzk3Nmc9smKO2wSUF7de1TytGWRJI52nt+DyBp+am4xMlPsb8VLinhacBVcOYP4b8a3ah2ltl2+nR1A8tLquDcvTXvSPHp4shv1vgZ6GhzVPsybxdBx540VwDrq8SI8dhuz30D9hhk0jf9p329iHZZNhcK3F2OBJLYu25OPPHfBr/eiw9uMOuWRZ4s0nSWWZb08o/bt41L3bIBIRptQi9EaVu1F37l1XeRZlpC6w8wsLuw9N6yrzyZMGKaQOlSfgAWKEmMr9yXfpbGK/M8QJzxvwnwIy5WAyqPvQl/qcbSshVWsteQCx+T3rm3Rl++nR38UTgkEoO7OdLEms++UbFHNbZvmZC0NQlVDUSDv9T6WNAEN04XBOWX2z4y8njDbY+2JhkraOzGsuTxqu00x4cxoh2R2FV2ZIdIBP3IVqR6uLQtbfqnqFTC+onipSpsaYIXTDaUpukF+mXI1a7031VMSpTBgt/sVRlIb208hPv+VAmc71+kB4N/fJDIzpg/439SASrlLRFrxAQfuu52fQgh1+9PghWLV0wvM
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(346002)(376002)(136003)(396003)(366004)(39840400004)(451199015)(6506007)(6512007)(110136005)(26005)(86362001)(66476007)(8676002)(38350700002)(7416002)(5660300002)(36756003)(44832011)(2906002)(8936002)(4326008)(66556008)(38100700002)(41300700001)(66946007)(83380400001)(316002)(1076003)(52116002)(6486002)(2616005)(186003)(478600001)(54906003)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jmDtTIaQGNYeuakimU2gbPbwVfTamKvYHV45emNWf11b7IRDkDp/NfBXHzfj?=
 =?us-ascii?Q?Y4ioQZKkNVqx4GxlrWIDNpPjB3Dpi2wy5CX47nI5kx+d1e2nW64czscGaq5W?=
 =?us-ascii?Q?U8F/ZljgGHiFcE8EvdnzHauJBg9S3OVgcsvC2TtHKpZgqpDAgW0+dKE/+ZQs?=
 =?us-ascii?Q?iK0H2IPYq5Rq1NdsnkfT4F/8SKW8xVcqg8z4Xjzx5veYD8oE+h7vZATxFJ7v?=
 =?us-ascii?Q?QG+KUs7UJ6ZcUy5Iww3g/8ETPqSsvBAILJDx+pmuTMAWoVGIQ7hlCKRF8Oqq?=
 =?us-ascii?Q?CDn/mwVad7rWxQ60jJADR4OwJ7Ew0AyhgXuxA0pvl04mbZPHD3fPkoZ7H3qM?=
 =?us-ascii?Q?ZCrjN4tx6gl2UERnuMw/UvVgvbG4l+X7sUSbSn0FANSg+eXu3yaGj5Mj09+m?=
 =?us-ascii?Q?nPSA00pVmbeSc9C73KJEzk3RLv7YfPab1u3is5sFzXCaBave54Krl6cRsAOz?=
 =?us-ascii?Q?dgB8p5bk/cMrl65qWbz9QrjjEAbrHf2C5iumsXBE8Zzt4ZIjBPtXrr4y3j6+?=
 =?us-ascii?Q?erZvAiobEhp2RlVEMAYYikvWFu53mc9fHkptoFrKgtyYseTwAh+EHEY1WoFa?=
 =?us-ascii?Q?29UJgpZy9od23ay1Ilub5H6OQPg2TupM9gdjQ0DyisUIzjkWNlAA6QosJ/wg?=
 =?us-ascii?Q?B3xxPj4CuPG37H48yN9U8qTq2UpKEuX6WUPOLpsHOfJ1gtYYCGX+Az53WJqC?=
 =?us-ascii?Q?xOcIjFVPMahouQla5ktE0YWsGh0WC5BdX1ttnMiA4t+FDROxqF1S1azIMz+k?=
 =?us-ascii?Q?NJMl3Lvg9inn0qa+hpxREIZAOD7Eok452lpHTIrpVg2g8SPtn/N0c1YZ1RM1?=
 =?us-ascii?Q?/hQocHAy6lSDvsnU9kHxaGmPxOvZlVpznCmi64w38ZgmpBbhIqejXUbLWlpy?=
 =?us-ascii?Q?/doeJfITU0LxtntcDm+jV9oSsayqkxd9BhEzIrqdeT0LjdQeIEKYaRJcn3Ze?=
 =?us-ascii?Q?lF/vt1T3T3fEiongxsbLNdKAk1cePXSHvosDb3zXbyWII6BmX39seiDI1F7T?=
 =?us-ascii?Q?GANMusBOjGmsc234Vghe9JhEKdFzMCzwNdrnN+QdZ2LoEb0MrC7XKEMH+Cjw?=
 =?us-ascii?Q?KApqztafohSc+C6SECaM0eFaiWXEBm0Jaw/xMJ/kNaby3b3i8wVy+LnP7FJo?=
 =?us-ascii?Q?hvCK0YnyeCRpQvr0KVduWtTJynJhPG/CV17OoSfkULZck5lpK9uD+2tlIpAm?=
 =?us-ascii?Q?seMHLckKZsZTYbjSy9pLeCBw6cL37zt/jqCXFnWRhhBPnV+oB0YflI9Dqw5l?=
 =?us-ascii?Q?8+Zdhfl3Qx7LIyBQM0CuCTa/i49rfGqYA36siMoEtNtbJ0aCQ/4HHzUloVPP?=
 =?us-ascii?Q?scK/RHyqj9raCMCfwWRNot83KNE94SjsdYcCau/dvdrohc4xExu+/6usFDG7?=
 =?us-ascii?Q?mfbph31CA2b4wSC2lPPV6JBU4cG0GfkVfQP3XeB2Ds6Dko3IZ23RjEadt87t?=
 =?us-ascii?Q?fV+WZUv6j61ehZY9Q4dw77Ku02keNT5q+GlHOHZf/Q5AfbKSOePUcd5dycWK?=
 =?us-ascii?Q?AJwMoOkPvG1C6Bu+cNpawBUIiGMgeoGXMKKpfsgVtCG6hHib+ibUgYaAnTXv?=
 =?us-ascii?Q?dDxsEJR01lbZZmBIh0o7m3DldJCCr/ZjGTJR86tLWja89qwBAHGLa22+IPCN?=
 =?us-ascii?Q?Cg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c3885b56-4071-48f2-bbb4-08dab15e1956
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2022 23:11:33.8534
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0LnBNwdI59DkH9T4rbz/caR5mZ+Gc/x003RD+ZoEu+aWAk3MEOVFv9V37UD9yVT0u1z12jaSObgzkoOZuQerqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR03MB6421
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

