Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D8A5BEE8C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Sep 2022 22:28:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MXCm01wSMz3cdj
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Sep 2022 06:28:00 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=y2BBe8QR;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.20.53; helo=eur05-db8-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=y2BBe8QR;
	dkim-atps=neutral
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2053.outbound.protection.outlook.com [40.107.20.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MXChB328dz2ymS
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Sep 2022 06:24:42 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WC262f1GNmF/DBGsfJh2eJxWEnIFfjqcNwvcVSALA/Vw36oWEs/pqQuVgBcbNvheJhhhQhmfVDnnvlM95JAqP4x+P48T30EyIQMk0o/xaxDHFHSrJlwa7Y6Id6eMhKUGX6tpH4cfnpptU7O7qcKj1rhCgRwkye+D4+a+Hgmwv/oSaa+ZQVKmMLJyWcAs/OWyy0Nxr+4sKLCqVw2IFrK41PEM7IzgnQ4LsF4DRyjMOIPOTD+7GFFfY6dJWYtTnB6b5YGKKsH5XsFoxy8lRFKq+rAQCtLZuI4S+sXqI+n/sKtZiu/uIZOw4F+MBWYMcXpr6V7yp4BTRaRQKgtbv7ffNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=McHAhMqdWVMftPgZ9YQfhd8ST3HoArae8A3a5CupPo0=;
 b=WrY+sWC1fSC+oDJgGC+31gqEEH2m3slayoV7rXhHQOxe/IEnMzB8b6aHAOSAgk31VZuMM6c2W9wonEfR7BCJaQ0ojLttJvhXDB5fSFS9Iq25THCpkPqWAJdJVj2ZGBHw6qqFYWJp0haH4pO/tGw9lM8f7CSZr2YrYMuib5CJQB7q7xlz7tB9pu1e2Nt1nYwDDqTjkSHHSXW6XRk7R1t3hRVu6+M/jREom/+m0zJwsptzZ3cGdWjc3IFD/MBZW6S+CUb+1IIPbLfhFztbTyKwF8Ql1m2ZWY6WGCcKJSzHc/JTynLWgDd3dIa6wGPJGuaibZNVQaUhiHH7aHao/XtR3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=McHAhMqdWVMftPgZ9YQfhd8ST3HoArae8A3a5CupPo0=;
 b=y2BBe8QROC8vN23eBKBw0dUaU4Aqd4UUmZlyPzM8TGNllJqcCfSUnrcGjQmdPceNK/Cq/6q7xpF6MHElnzxr4JinT8t/BrNp8jqli91DrRl1pxgquf6s9lpkKDkGnI27mDuqWhwx+eeIeIGaAm7TEIutXCVIJ2d1vUTCMI6ef5EgDlDGWRC3P4bZTUKqlt//HH8V8TT6CHvaN8wL8ImttpiFjJtEoMs5jGMAz5EWQzlw3CI/+aO6AecEra2ef7ezElxO3ESv1sC6qee+pWuwuZMGLpFsHKZjk4xqgertIMfImFi4iKz4wrF2mFk+/+jRQVsJDV77rCk67h/xzTyQ1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by DU0PR03MB9566.eurprd03.prod.outlook.com (2603:10a6:10:41e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5632.21; Tue, 20 Sep
 2022 20:24:22 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5654.014; Tue, 20 Sep 2022
 20:24:22 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	linux-phy@lists.infradead.org
Subject: [PATCH v6 5/8] arm64: dts: ls1046a: Add serdes bindings
Date: Tue, 20 Sep 2022 16:23:53 -0400
Message-Id: <20220920202356.1451033-6-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220920202356.1451033-1-sean.anderson@seco.com>
References: <20220920202356.1451033-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0014.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::26) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|DU0PR03MB9566:EE_
X-MS-Office365-Filtering-Correlation-Id: 11dce546-0dd3-4f78-64f8-08da9b461a82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	e2brf7KsT6UzYHNoq9dlguujEbskgZYFcynCdjWMw55x8+YirGh+lu7hYk7ZKmh7kWIrXqpUMeifNpAGvXBpk9C727Vc0l15Qp5WBEfKHJbQxp6aLHHdzy0y9mBpQ4inpoJFc4hSKLP8++i2zWBWhyzK+5jCgbldGbXCf9goqEw0tkmJcYmmP6g1LB8d6BkAFWWCxKZLj1KkpXLmLInmtgxhKE9eJ3Sb/jR8mfMlPu7cb6JkED1lhK2gZm5DsCveKRxFWH+q/cDkgiKHG52VKkt4VRUZTziyzeU0QWARHBcydRf2LbcOmpcV/vUIiK4XAeCpSkdWOuEs6TQVNVnfMbZJuHCc/U2Rnyai3QqP92CyNJEIG/tI3zMYXLP3RWAXp3GMOgJ+w1ZgTOPRh+FGFYfFEvZVPOQAhNUyzPX0fU2oFqwUUZurIVEr0L0FtGJKX4zbue1iXYgIoTMWu2cF6yvA/0dsYB3UqUOKlTnpBVJdz+yTY0tsv9xUHhlNI00HQFOkXsNJ9eLQvw+4/rH5gykPdiKivhX00ZRiCXNUxtMOm5mKQ88fkjArAKDEJ4TFPYXow3EUD/1Ttu6UrDfmASnXVkwUqtSlouTXZMaxLya2TbljoN70pRb5ESwxVf0Ic3f3TOk5P0KPgErvSB5zdp+BbVYycIi9NxcmerMYJb6XzJ2AJmZqKoQ3LMO/aeaoZrA1SCmvwygFUAwpydO4UvuKpcZ6V37otBB0DPK+foWL2ygx8MMUO/NXGQ8S9O9Y
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(136003)(376002)(39850400004)(346002)(451199015)(41300700001)(38350700002)(7416002)(52116002)(6666004)(83380400001)(36756003)(6506007)(8936002)(5660300002)(110136005)(54906003)(44832011)(2906002)(86362001)(316002)(478600001)(6486002)(1076003)(38100700002)(186003)(66946007)(66556008)(66476007)(2616005)(26005)(6512007)(8676002)(4326008);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?fXtEbwUFofthxPtxHpJhm6fO5LMimcVlf4WDy+2bPn6I82qOzmZHCbisOSP4?=
 =?us-ascii?Q?TTrJT+Ep5XzZ/gqWxPfhkQm5iVfTaVjGU9tYFch9hlH5KJyQ8m6g3JmJsQ3R?=
 =?us-ascii?Q?8JxLfgQszVI9/E1nUWuO6YyLAfB6GK5xW1mAa74Ak1WslgSw8oM9lJChTb50?=
 =?us-ascii?Q?ZN0RAqZ8VtcUiL/KlBEwn15XjyplrJ7asHeluJHGR1vlx3zVviCIQuBO++Yz?=
 =?us-ascii?Q?83SDc8tymHdtyxYAWd6B9vnaEwrMai6C1oVpAv7l7/LYT14gAnAYOhMTWH6K?=
 =?us-ascii?Q?RVlZ2WPSPL8qtKv26Fy8ryrNbkMMNCh0x0gNehKGhj+KqQ6uU0hTClWR+MHV?=
 =?us-ascii?Q?2MI262lNus/hxgG+mz0AzgPC3E+rtl1e75Y1I+j3nVcDF6DACXdKMl6IzXqI?=
 =?us-ascii?Q?VFutlm5cIBM7AdCTRBJhL5UbJmejCCMWU1u+FoRalvaXfGpgLn9oenAiFLq5?=
 =?us-ascii?Q?eZVqFAugm6L4Dtt89/bkNJ0SeBh8WpHbaoZnY9MkUAx4bnzv1oYcaCbQ7wCO?=
 =?us-ascii?Q?44tQUncQSGdKTJ2OUTde5neKOo1YlI5oH155FIE/MLw0/spx2pUqr41eT+Uu?=
 =?us-ascii?Q?WxKOgS6Maa/OOTB+BvMgKgFVTp2j2SXy6WrWIqr1mTWKDuF3m3PeBnwyXevO?=
 =?us-ascii?Q?VYZ8jNPD6KW7fWlu4s7io2zh+FpW5aDGBYUWYOd5jgHB9B1y7QmEcnYoP0dR?=
 =?us-ascii?Q?WcT3f19zScSTiOPwO/JqBQBSQ7Vz+Y7yqa8KkqSJiMaGuZVQSnqTLJw5oato?=
 =?us-ascii?Q?pQe3LHl/r3K8/TxW+RAAoYxqO3ZqNFiL8VPykmjmpWcxGtHvcRWdtZeCIna+?=
 =?us-ascii?Q?YH33vNH8LmIqHGYLv4gotiaVBd8wAk6jHkz+m7DCSYeGQburmSU1NnJHQ9Kl?=
 =?us-ascii?Q?qtvb7/1wh7qtLUuP1Grft3vw5zfncoTBzuQ363oRDbdbclQu1uxt2t4fLBG/?=
 =?us-ascii?Q?PoCLWxOdb5xJjxXjYjfOd3kNLG1miwr1eR1Fvh2p3SUhsaPbg45Qsp9+OVXF?=
 =?us-ascii?Q?3ZLm3PYiPyatPPIXsSN9brItcxNVdnB1kQoM5WDuFvJYqeITAIu0gIvMKKSA?=
 =?us-ascii?Q?wkk783o6pA/PJYk0bhjQLNy9v7Y2MLK/Y7YM//LG/AIYs8TSQ1FfNGHxDJn6?=
 =?us-ascii?Q?JsjVrlSaSh7V4fS2w85pS+zk2VpS9Cf+OIx1cMFoKTbzhoVxbwpMd6cjjIZJ?=
 =?us-ascii?Q?05vry3WD9Sb7NXt4dVMHEH+oAYLPlTvnPBugNNC2Jhzt9gsV/YFir8SttaTj?=
 =?us-ascii?Q?0BDB3hn/VW8GWyZQR8IyFraGhlXcfb+bR6dagUeXPz+1d1Wwl69C5dqT4OKB?=
 =?us-ascii?Q?kmt6Z07hP+t+uO25k3rGaoNDBJMzcgfyXqVYNdxcOlbSmCN1D/mZrWsqzYlA?=
 =?us-ascii?Q?ooG6JMLIUo2k0tuCECuy5XIICXIw/qZ/SAUIRVYuGKl54Ki+BQS5LfWRetXA?=
 =?us-ascii?Q?z5mlvbUSNmOOIVXM/0bSj+9Nl4FvQblX7ohBmSgoXNSZnvWadR8706Eo8XAZ?=
 =?us-ascii?Q?xud5204y7NAxnlc+XBqEexRWRMudcF/khyDakhKED6sjKxqpLSlLwCTJ0nBx?=
 =?us-ascii?Q?2NiHJb+TSegqVFt0QhfJyHVgn23hU3TnEMwjph5dFdRL28GXyNxwv3HNp+Yw?=
 =?us-ascii?Q?gw=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11dce546-0dd3-4f78-64f8-08da9b461a82
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2022 20:24:22.2209
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3dxEpCSycMZDAYxWLJo0PzgmruMmrK1QTflfbQOVEeuzb8lRpTe0jYJFjjsZWvN0iY/OP/p6GWldd2u/4h1gLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU0PR03MB9566
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
- Describe modes in device tree

Changes in v2:
- Use one phy cell for SerDes1, since no lanes can be grouped
- Disable SerDes by default to prevent breaking boards inadvertently.

 arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
index feab604322cf..48d81c6e1cfb 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046a.dtsi
@@ -421,6 +421,24 @@ sfp: efuse@1e80000 {
 			clock-names = "sfp";
 		};
 
+		serdes1: serdes@1ea0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1ea0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
+		serdes2: serdes@1eb0000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			#clock-cells = <1>;
+			compatible = "fsl,ls1046a-serdes", "fsl,lynx-10g";
+			reg = <0x0 0x1eb0000 0x0 0x2000>;
+			status = "disabled";
+		};
+
 		dcfg: dcfg@1ee0000 {
 			compatible = "fsl,ls1046a-dcfg", "syscon";
 			reg = <0x0 0x1ee0000 0x0 0x1000>;
-- 
2.35.1.1320.gc452695387.dirty

