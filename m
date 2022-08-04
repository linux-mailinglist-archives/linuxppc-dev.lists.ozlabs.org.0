Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A5DA058A318
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 00:10:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LzNGC3mBKz3dtM
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Aug 2022 08:10:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pofHkK50;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.13.77; helo=eur01-he1-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=pofHkK50;
	dkim-atps=neutral
Received: from EUR01-HE1-obe.outbound.protection.outlook.com (mail-eopbgr130077.outbound.protection.outlook.com [40.107.13.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LzN9Y30Mbz2xGN
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Aug 2022 08:06:41 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gtQCz5v32/edesvksbQEfylD1cJ/Dbsf8f6pYdkECh1iSmet9/tKVkRQFHLcMm3Y8Ii14C91G2t4KWJZZki8jo0AWVxFulQTx1F1g0Ex/3AiDfasHJSAc2czicRyKTPiyqYHlMFGb398wFewdBe/ybBPb4l59NV1qLTW3EyZERozBdvsG/FFgAWT24GHJMnHpPX4SHTzCRqttxMqWwBI9jxAAcgeQcQ7SeSnWE6vesGE0HtNA7DmYLA0/1UF7GjM/wPtnZbUJgk1WtEyGVOI6AvrGY08gqJeo7azztFK5iBS6R1TmI4BXlp5+fQkvHDLay/VqdX7zmIy0a9sqbV92w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jeDeT2WqBjVc1/CaxSnllBIO0s7ckUr2vLbji3tgKbg=;
 b=Zcy1UHFKWrkpFGooTYnCJg6md7n4b0Cr8jgg9NaDWUs0JjcO5dRgI455aKdgq/WBrOB0Fx39gjajMKPpwFQYOs9Up1dPa1qUQRLMRJ8EqsgudW19w06re9eoRz4pEzj2DRWwUSsEg5oyhw9ccZj1+rKrpCYkWYI0x6A2Iz3QuiiXRmFh/pyZXEr067CL+/shTfOarTc2GfiplT7pf2LDjatoiEh3Qew6dIGgR4xlbL7FdD0E+HxuhSPVGxcPbyBd1OpdvyTOxQo+Z3S1WztWmsxOKZr0li5NS2W0q+M5AGlHSaY0+QJrhNsuWh23UK7nV58vh+Em67HChhzzFzmfqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jeDeT2WqBjVc1/CaxSnllBIO0s7ckUr2vLbji3tgKbg=;
 b=pofHkK50tbGB1eE2XrSnoFeA56Rth6Gb1WAbRobZNxtreM7zUt2q/QHti0g+VeKkVSZDN660z7yLPAbxrQ1QoHXXi2DTUPYZyd3B02BmUg9mFdtdoE9/ho+jUAJeH0F/KdHc469H+XINwA6+TO6DEt8IHsZu0UTFAl+5pjBueAQehKjomOPk9olVFbzy8cwd9a+T/eGWrMraRXqLk2PDQEJ5p3OQyDwP9a8rtZs88MeXFkuiaQKunndIkzLqzNKZi90kejOXQ2eJWP64brOg9c9kppJhtY04y/ZYFkq5+RB0l3+R1sLI0wt5gz7EGDR17LCK3nVTXoXSqefp9+wBzA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB8419.eurprd03.prod.outlook.com (2603:10a6:20b:527::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5458.24; Thu, 4 Aug
 2022 22:06:24 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::ecaa:a5a9:f0d5:27a2%4]) with mapi id 15.20.5504.014; Thu, 4 Aug 2022
 22:06:24 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v4 6/8] arm64: dts: ls1088a: Add serdes bindings
Date: Thu,  4 Aug 2022 18:06:00 -0400
Message-Id: <20220804220602.477589-7-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220804220602.477589-1-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0097.namprd03.prod.outlook.com
 (2603:10b6:208:32a::12) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b9b60e91-7881-4bcb-912c-08da76659201
X-MS-TrafficTypeDiagnostic: AS8PR03MB8419:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	3MTSStfQ47Za3Qxys+/+WhDI+blNMZpFj0DGCRtivp0HufD0PS6wr/KL5Q5hHpFoiUskS8UYsfLcMgbyAnz3h0jimtBM9T1PM04jwy+j9vvd043tjl/wAU1yxm0MjOS9bbgi5/v13Dml6REITOMdiU9/0Hq8PCGfygycGyNw/5Jh3tFs1IOZybD0VxbdR0Dvrw5KB+FJ8M69Afd6rXCjlAaA6UXvd75rm0CyfBRH1aQJgjEU1Qi7Wpl32soMfzK1c7tBimvFrnKuMerTTo6Lb4kkawVl9O744qPgfR6mr4iChxMxq3h3E8KufGWSCo1WZRKgrIhvfWAEFwecOuLKYN9foOsOYQwBn9OiJp2OvB97BX60kMp6SZAxeierjAv61gCOncBMbMGZwq939F8d5AFh/87g0kXZQ/ug3/mKkiAsPfyBdbvXIiYn77mM303zH/LW5X4PN0mPwZMiUMIS+0Wz0SozoDGQsgaYH7g1URydEU/GI42VxK4K3xRzSmTcTUcieU2bSm+XthWzu4NvfYlow/NXAJJBuoUPMspdPzbDdPLQJSwDgs7AMeBDc4dW9V8G6V5bqd0xX5uAQjX8v7R+tyGyeOSjMwmyBYC4SLK21UB7HJEDUrxobVl4pT5cmfRfGMZ0gOpxiNm9/ZB3+otI82DvzvU7OguoocmsWAZ2yRPdcgqbxYbfi1udVYV40f/Dr1E4BjzJgESuKQGxwsLHFXKONy/UqVUXphg5EQSIO6v5R99bUNzlAenlSeU5+t+2jlMMgE1ydIC1NgSSN94rP+5X7hQhlIXebcZxR28=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(366004)(396003)(376002)(136003)(39850400004)(346002)(6486002)(36756003)(110136005)(5660300002)(316002)(66556008)(54906003)(66476007)(4326008)(8676002)(66946007)(38350700002)(1076003)(6512007)(86362001)(2616005)(478600001)(186003)(83380400001)(8936002)(6666004)(38100700002)(41300700001)(7416002)(44832011)(6506007)(52116002)(2906002)(26005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?6fAeQj98R8QGLlxuXI9IFNwMhk+/kXidLi+c7+49Asx9on2zXszTIXyEEYHG?=
 =?us-ascii?Q?e9DJRXDScUNz3++L5KDXjccdXCK5RClHaqzMuH6RlXF8/JbWWF1XpF+KK6PS?=
 =?us-ascii?Q?y3gJ/4QbVA0wBNQOY7ad8MRWX3h2TYjX7iIWsM7w2JaUCsPvC38bGbiWq+RI?=
 =?us-ascii?Q?Io24tqvr2feyAvIa7w8uVfNaz+KRIYS42POd/wEHN8MP+gnlkASncQuHmkyH?=
 =?us-ascii?Q?z2BgL/osc7IZKuQjWZCAm1jRX+EaRk+S0jYFyYxVQ7W6T3VGjT3JnUKXpyke?=
 =?us-ascii?Q?tmj/yc4Y2aM9rVXh7Rc+NZ59X/jhMgm89qIuYcGj/3q/kElj7sj/QxHGTA3H?=
 =?us-ascii?Q?Oqu0jSlQ/gAcbni61q6PBzYZ6IqxWzCZ5YjInPMn+5GQEp5s0xlV9LjL/mWe?=
 =?us-ascii?Q?I4oZurV6AiCTRfMQuNIyXDOC2UebnQHBEJDo7uuNhgXd67ut6VevnWfRsS96?=
 =?us-ascii?Q?s9XES4v/g6e+LNCqFlMspIBoNEmP0qCPnpJnYHnZS0l4yjrkLUJUZwTtT9Tp?=
 =?us-ascii?Q?ShdYEXVruLOIS9UYB7bQGv+wLko8YlIdS5/wucbCXKzWsHaxxZSomqmqHLo8?=
 =?us-ascii?Q?dHz4ol54CCRymQ6UYKZg5S6cYTQQUIzvJWxjtYU3vtKxB9+F3XBlC1HMvc/G?=
 =?us-ascii?Q?1d2S8JZbfmxGQfhtU8lZy0Cabc3DIg3+QzWnt4DLrHo9zquMGRfbNtbXMubn?=
 =?us-ascii?Q?d00Pvw5rHdxhcs4/WhaHdvYa2sZ27ygcypPdV/CgT4z/OF2Q2e/1VwlDOWLl?=
 =?us-ascii?Q?ALG5hSRwKhmwqfYco1id7TGPEzg1TX2GvKM60YihGEMNw/hX62iLI2pSitC6?=
 =?us-ascii?Q?9jh7XVHuPJ1V6E10Ig1YLOLlyT/BIlhAnUtbD4d2GZkfVMbxhmRN9GvH63do?=
 =?us-ascii?Q?0yBd/9BPMfyk1e6FezT50HMh4cxDGz5jqTnUFGopevvocMKRATdc9htogBFd?=
 =?us-ascii?Q?rizJpYXpJBkW9WS2UfUq4vaDrUSEifi1QsjHqC51sGzp34QyATGWkFjlgw3y?=
 =?us-ascii?Q?WvrEF/zYPyVvszGRX/NQ0AvawitYODQwKi31qvx4NcuW8NF21Jv9pR4I4d1c?=
 =?us-ascii?Q?xJdLvpus0V00Kn480QmqarMaxQ8Ic3oZwd/cRA2gKWzjcJzqJ0OmXOphTM0A?=
 =?us-ascii?Q?YR4pCEICY0WE1IwhiJoSnvqJ8OtYP/UNZTsCpSp8+Rzi91ym4PWQNHGfhDS5?=
 =?us-ascii?Q?lHzYulmjTChu31OYmoaea1uG47gKQDX7wiDPtPS67ypN74P6D4ZYTXv6rDki?=
 =?us-ascii?Q?5YeA5JEhvMfl3Hqfj95xQ2jp6BM143YPRQ63XUTrnsAMRBt/dXaGJEquYlyF?=
 =?us-ascii?Q?4B1xSz+FBxlmqpbCFpQgmjb4IQfg3fkXak33c3Am7CO1aCjfynxgqmPonaD8?=
 =?us-ascii?Q?Mku2lXCSf7g3yM1Nqa+beRCUIlsjZjtinSdug8bMpVwyAzsiBw5vrPW57XSD?=
 =?us-ascii?Q?eoMsmXJTIw6xPkFSwr265eYfPB1rc2tVjqaB2uLB/++pgqP9m41m3dhPq9Za?=
 =?us-ascii?Q?4mdvDsY3D6H+q6oI+OLiNpqm4KSutAwi4tf6+byrHyec+D0xSwgACqT5dwp4?=
 =?us-ascii?Q?US8IlX5xd8TiGATte006ewCcpslA5k4P3EmUYIeJzDXrmD04b/VCdb+/+kpI?=
 =?us-ascii?Q?mg=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9b60e91-7881-4bcb-912c-08da76659201
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2022 22:06:24.6259
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tNt70ihNwvdXFyngm2VnV5lo+4id0ini2Fcu/jJpKufTKicmZ/6GUsUytSaJe4SmVpuVnrqJuApqgusoRVs7Ug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB8419
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

Changes in v4:
- Convert to new bindings

Changes in v3:
- New

 arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1088a.dtsi
index f476b7d8b056..f252e968fb73 100644
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

