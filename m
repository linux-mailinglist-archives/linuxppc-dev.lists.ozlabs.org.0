Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEFB832FEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Jan 2024 21:43:23 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ecNteuu8;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TGs5P3sRCz3dDP
	for <lists+linuxppc-dev@lfdr.de>; Sat, 20 Jan 2024 07:43:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ecNteuu8;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::600; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=frank.li@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20600.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::600])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TGs1t36l4z3cC7
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Jan 2024 07:40:18 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hRjsyzcO+Lxju+7c5YEQvjhir3wvLO4I+Az5AW/tuUn8EJ7IgXSBw+EKDJcCOZl8mElRYfbsml9vy8yCuFQi6mj+LsySEg0cB5TVCrnnorhcCAFihM3HwdZ0Cq4IkZtItcfyoFKv0t0kYOpD3kX9AbdnsJeT8w+Hr8XhNcQp52mi3LfnmcKi7DJUypLD2/u28oX1Cyjcj+qPkLIALnCrqL1afSm4CD3G/ZPJnROFHPsAbawUSKdbBzdLzmSa5LtBeAGia3UzfBTBFnj5ya5wGSTGfxRr1rkwqU8u89xF3ISFH4g18qvospW/xDAzGEZP/YH65bXuvs75zOKWJ7mdaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LOs+aBSYLoaLS9CuweZUCxkljVwBp4EF+JkRWWQ93vg=;
 b=LbEhfgU6XYs3BCuvG4jrezTECXj8OLnXDnpdeebjILpYG+S3oEAqO/Zf1eHIpNv3haXvHSxcp2MsbPpU1+NWk4giQgwYU239tiGeUYTe+qWCyoc8io1IgVdSb1ZmJx+ZezWaMsG+IWcvy0jI+lBYLks7RqA8lNnONK0o5FRAuPUlbm71yL3Hu12Wi1HEFKv3nluyEgLPHCWcDTZFGhccohIFLLCDowHZVZM6CghINWSUMrwu16phT/Ye7ihMZoaa3S0g8ThDP6mouLgtaXZw48BL0T5QDlMtr7U1mJcCzPVkglaRFqKqZi2B8r/JXxbrGg8mUq250jJwFRIRH7XGaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LOs+aBSYLoaLS9CuweZUCxkljVwBp4EF+JkRWWQ93vg=;
 b=ecNteuu8x/AOkFRDUZa0WkUCsInCU/6UKFH4FsnepMGSX1IQ0fgcdKBcKdkNeNE2doZutvXuiQjOXLF4WtmjG0zmjRJFjcVLvgeH+RgYCWCBPxDMTJxRgWatLAk/pF1kZXaN8Sq8XdLLMOetmEP+FrmofJGw0Mn6cVJ/JvFOzK4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com (2603:10a6:102:240::14)
 by DBBPR04MB7769.eurprd04.prod.outlook.com (2603:10a6:10:1e0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 20:39:59 +0000
Received: from PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9]) by PAXPR04MB9642.eurprd04.prod.outlook.com
 ([fe80::b8af:bfe5:dffd:59a9%4]) with mapi id 15.20.7202.027; Fri, 19 Jan 2024
 20:39:59 +0000
From: Frank Li <Frank.Li@nxp.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Li Yang <leoyang.li@nxp.com>,
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 4/4] powerpc: dts: fsl: rename ifc node name to be memory-controller
Date: Fri, 19 Jan 2024 15:38:57 -0500
Message-Id: <20240119203911.3143928-4-Frank.Li@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240119203911.3143928-1-Frank.Li@nxp.com>
References: <20240119203911.3143928-1-Frank.Li@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0234.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::29) To PAXPR04MB9642.eurprd04.prod.outlook.com
 (2603:10a6:102:240::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9642:EE_|DBBPR04MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: de2f034f-7193-4d4d-6aac-08dc192ecd6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	VUcmw6Inq3E6FAC2BjSxLGzcks6gXp0xS2xx5d6g8WRKBjWqTKZdl8PL5hPU+DwZ4Y+IUdnzzf9AdSrfqcuO8/X6d7UV0qV5fbf5OiJHj0g+wglLDD70KL3wHehZSO8QSK2+ho1u3p2qlSGEFxQElbeDRlC1PsCEus1bf4KkYiiy6HlblBxOZShBAcj51wTWGzsX+e09mmE0UqXi7DQ+OTjHqJyY1uTI4qrnt5pTj9Iaw9C+pSWkhcd18z1RYpXqlqfD4Sr99kYbGBWzxHAkFL0Th7Yxh9GnkmmX7eIj9AZeHeIf69NMvHB+CG4pgD+toB2k78ElWMVnbNpEhvskmqJ9FfVk7AJwDM8XPWZPOdUKgltZ2fxZ2GwuMe0yZUVaaL8s93c0B1JjZvuqQVnOqJiyWlfP5MYSGa2ilZExt23Tcr5/b3or88B01ZgXK9/iwBuTEC5C5iF+J4+yN5eaoCUMmbBaCv8/eGKE7OTc1qCJj/AWIj0LYJ63Gs63yKfEhAEBs7iOTJ15J7kG6W9gVKI96gmFTDYiOOg95IvkSFRcB2MyfoxX3ZATDQdARy8TpReDSFWBmcuMk5USeEBqTQC9YH5qfI9V3h0VyzBaJTLc+TjFexjQ7NOEpw5PSExVtPeS28frkbF/MDA5xD4GkA==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB9642.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(346002)(366004)(396003)(39860400002)(376002)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(66556008)(38100700002)(5660300002)(2616005)(86362001)(66946007)(2906002)(66476007)(7416002)(110136005)(478600001)(36756003)(83380400001)(41300700001)(4326008)(8936002)(316002)(8676002)(38350700005)(6486002)(52116002)(921011)(6506007)(6512007)(26005)(1076003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?Ifm9kKrUw9LkJzkYmqc931nYjRPLEdWfAWtmkVhJIE6qpJWJPmdUfS1zupQK?=
 =?us-ascii?Q?yN32u0egelNn32XDBmjBMy4rnoAuSylKby8jIoa2AERNV6TxQBuU2fcEmFRi?=
 =?us-ascii?Q?t2cWwR9GAnBMdcAJcaiWUfr4YKcccHMqKYjRSNOliS/uGWeFZHUk3R8t5m7J?=
 =?us-ascii?Q?GMvimRxc2WuPQjVT2CpVEgNZcjoeOKVxpydlZM4Nx6fob0z7YgAz0nElqS8n?=
 =?us-ascii?Q?G2wlKVOdYU67FsKJacr5J38VBXNmaugLWQusezWmhQN3IWHsrI9zsIQhBIhF?=
 =?us-ascii?Q?vkL03Kz7rcuOBaRyGB0peTifVUrAyjK7YoR1d8YP02F+tgnBFE51Xmh77shc?=
 =?us-ascii?Q?Wjv/eyfEZv523F3tJA1zvYNDH9m2U+Wb+ZeIjIWYuGbXxFu52iCEJ4f14RsS?=
 =?us-ascii?Q?CQJCWeY/aDRhzKHNFy3oFA82BaleH7PwLQ++jwnQ+X9HltQJd3yIatgHO1Jo?=
 =?us-ascii?Q?phIU0dODKF3bMeoctXip/hSlGaluxkdOSF6MxF8CYjNDM5XscfGTG+cUGG9r?=
 =?us-ascii?Q?IzecTZhhAOGeRhqCSrGb626d+1ZFfRHUqHYutN0B+7wrcelGxqNdxNSuKmv5?=
 =?us-ascii?Q?iP4IjHYzstZajy4lLblC6nMdX5hwFIRh9yqFtfRZjfZubDn1J4EDCn2QW14I?=
 =?us-ascii?Q?0o4p7Er9JujeabM6Lngnmrjjns7RRBACtCAeIzd41TNt2P8gCvvocSIXp8+M?=
 =?us-ascii?Q?aOtK6M2ZCIx/ZH3Yb4ZWdinft+/Ab4EJegOKKuLq+wYfMhXe2B7YN7jIvncE?=
 =?us-ascii?Q?X9dfv+MjbMPwzmmmHQVFj78YxNdVa/PU+5mifM35Xxum9HZp334qCzx//uLc?=
 =?us-ascii?Q?WEi8DOZI2Y+yR6672ngM32X5MuPm1oTBM4LZO0OR3O7RW1p/U1YIvIu5F22T?=
 =?us-ascii?Q?bkXnwuk1L0r16qEJ6wECJoL5iRihfcptvZmXV1vEkfVplKR4uCoosnWMJuZy?=
 =?us-ascii?Q?o1BfU0HbFQow709+eRRdjCFickuR9CTt4s0AdzXp8LrYndUyQEhkzcgovSDf?=
 =?us-ascii?Q?Kv/5ZOcPIfi4fRQdTxotM9RFxfSVk/EzKR9CdXwf6bytgvn2p+ceO8qsWuo/?=
 =?us-ascii?Q?uyncoNvl/DcGcymu6OZHLkozQZwYJXj19zv+oTuw2rsegXSooiEB36qhUSM/?=
 =?us-ascii?Q?d5CEo9ALwK2f5j2CBfHmwYd/a4HgKbbP6KJSGJpczoNPe7ppqB60BQdUloi0?=
 =?us-ascii?Q?mPLFDztZ6AFse4CQ/f3/7UraVuZcohdP+2EnRpb6dwwRz4QDKo8fCcsPn14J?=
 =?us-ascii?Q?JS/nLkWlZCF9Q2RVAVEHBfE2fSeDVJswxvqX5l7ZI9Pg2eSErNRdqnVnCJ26?=
 =?us-ascii?Q?iQAPsM4gDNdrhIgTbh7wvO7ReUMYsHeOHKpIhtANdQQU+eOOwYYKMBVDy+81?=
 =?us-ascii?Q?aPd2QQ+DqVk8AvCctizjWWmkXKoZY1CTYaUwA9bXzmrf5dCOSJjWzGF4y744?=
 =?us-ascii?Q?6SAQcJl1BZQNYBnRTJvBRWtEN68RfehGGh1CRH4Zs0neVrlWz+Ujc+1M/Iz4?=
 =?us-ascii?Q?0iSVFjRK3bD55FF6rqq+b3gvUkJvETXESZlgR01uF7kcC0Rvtj6irUoPxGyy?=
 =?us-ascii?Q?FfFukh0lc7TqSLWAdAuOULLaXrKbULCcdl5nZBhh?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de2f034f-7193-4d4d-6aac-08dc192ecd6c
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9642.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 20:39:59.0552
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0QantGdMgUZ9ShADwa+M9XPKXoCEFB/mRdJSf0j+xxz1qKTbFAabyjetCa3EqE7UnPIOKbGfmdCM7hDQ3RhJCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7769
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
Cc: imx@lists.linux.dev
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Li Yang <leoyang.li@nxp.com>

Update the node name to be align with binding document.

Signed-off-by: Li Yang <leoyang.li@nxp.com>
Signed-off-by: Frank Li <Frank.Li@nxp.com>
---
 arch/powerpc/boot/dts/fsl/bsc9131rdb.dts    | 2 +-
 arch/powerpc/boot/dts/fsl/bsc9132qds.dts    | 2 +-
 arch/powerpc/boot/dts/fsl/c293pcie.dts      | 2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi | 2 +-
 arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
index 8da984251abc8..0ba86a6dce1b6 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
+++ b/arch/powerpc/boot/dts/fsl/bsc9131rdb.dts
@@ -15,7 +15,7 @@ memory {
 		device_type = "memory";
 	};
 
-	board_ifc: ifc: ifc@ff71e000 {
+	board_ifc: ifc: memory-controller@ff71e000 {
 		/* NAND Flash on board */
 		ranges = <0x0 0x0 0x0 0xff800000 0x00004000>;
 		reg = <0x0 0xff71e000 0x0 0x2000>;
diff --git a/arch/powerpc/boot/dts/fsl/bsc9132qds.dts b/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
index 7cb2158dfe583..ce642e879a1b8 100644
--- a/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
+++ b/arch/powerpc/boot/dts/fsl/bsc9132qds.dts
@@ -15,7 +15,7 @@ memory {
 		device_type = "memory";
 	};
 
-	ifc: ifc@ff71e000 {
+	ifc: memory-controller@ff71e000 {
 		/* NOR, NAND Flash on board */
 		ranges = <0x0 0x0 0x0 0x88000000 0x08000000
 			  0x1 0x0 0x0 0xff800000 0x00010000>;
diff --git a/arch/powerpc/boot/dts/fsl/c293pcie.dts b/arch/powerpc/boot/dts/fsl/c293pcie.dts
index 5e905e0857cf9..e2fdac2ed4205 100644
--- a/arch/powerpc/boot/dts/fsl/c293pcie.dts
+++ b/arch/powerpc/boot/dts/fsl/c293pcie.dts
@@ -42,7 +42,7 @@ memory {
 		device_type = "memory";
 	};
 
-	ifc: ifc@fffe1e000 {
+	ifc: memory-controller@fffe1e000 {
 		reg = <0xf 0xffe1e000 0 0x2000>;
 		ranges = <0x0 0x0 0xf 0xec000000 0x04000000
 			  0x1 0x0 0xf 0xff800000 0x00010000
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
index fdc19aab2f706..583a6cd050793 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_32b.dtsi
@@ -36,7 +36,7 @@ memory {
 	device_type = "memory";
 };
 
-board_ifc: ifc: ifc@ffe1e000 {
+board_ifc: ifc: memory-controller@ffe1e000 {
 	/* NOR, NAND Flashes and CPLD on board */
 	ranges = <0x0 0x0 0x0 0xee000000 0x02000000
 		  0x1 0x0 0x0 0xff800000 0x00010000
diff --git a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
index de2fceed4f799..4d41efe0038f2 100644
--- a/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
+++ b/arch/powerpc/boot/dts/fsl/p1010rdb_36b.dtsi
@@ -36,7 +36,7 @@ memory {
 	device_type = "memory";
 };
 
-board_ifc: ifc: ifc@fffe1e000 {
+board_ifc: ifc: memory-controller@fffe1e000 {
 	/* NOR, NAND Flashes and CPLD on board */
 	ranges = <0x0 0x0 0xf 0xee000000 0x02000000
 		  0x1 0x0 0xf 0xff800000 0x00010000
-- 
2.34.1

