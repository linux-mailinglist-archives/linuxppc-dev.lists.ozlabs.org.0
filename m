Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 571B85F1377
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 22:17:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MfM2k0LsFz3fND
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Oct 2022 06:17:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IiGxYQa7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=seco.com (client-ip=40.107.104.58; helo=eur03-dba-obe.outbound.protection.outlook.com; envelope-from=sean.anderson@seco.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=seco.com header.i=@seco.com header.a=rsa-sha256 header.s=selector1 header.b=IiGxYQa7;
	dkim-atps=neutral
Received: from EUR03-DBA-obe.outbound.protection.outlook.com (mail-dbaeur03on2058.outbound.protection.outlook.com [40.107.104.58])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MfLtx5WVDz3c6s
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Oct 2022 06:10:17 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D54kJBmksJCZfK2FoPO9Zoz9RYt+1EmQT2iALyYkQHNXERPZvPF49G1F+zG+vaoKk8qya54QYH3n9Ubf45O56xofPsQ2Kk84+yw9SO0BbYmbjUmFeVNgY+7dpSpEZew8OOJcx1z4Sz7IbA7d0mKJuHZDNnksVNMo4xoyKzyrvV3wLuAyWQj2XKbK+TNdSHWQgIsVTV9XnJ6+4VA+wXGpphV/yi1cbI60quCEvZp6aYw/E6wocBqnb2Qt5iyFBvW48eB8NmEGU7piD/rNnK/KlfUh4Azhl4wejbCM7J7do7noKpVXX0j154FBWPZhm4BNORBhH1MRyudlASRwEWJzEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U8mr+E5E/bquLjHtd3y1fs2FBigd04YzSdV1VetNIuY=;
 b=Bwn/YCqR05i7DFzvotfL58doGVzJXI/AUmtpqeryjryXtXgATWrVcRC35mESS5HYhiQlITrIeCxGY1D10Y7PeSCob9UMmQKbM4PyWjH+hqst0GeGHFUwedtUVvtErdrb8mWFT95JJu6CGzk0luMxcvH8olmWn2SCqXlxSaaBKN3/t73x7IE1MQ1R3xL1AsiUrFoJeObOjRGmtz+51Ys7Xz5FrS22GP3M4Dt0F9J5W0iGUUaTWc9t7/hUAGIljo1Irig4o0ax94uEOvMSN21s6RMk0SqpOM51YWWC4Eyeo8gfzAbhZnD5AFo5xNQy7ef8bPBFFE1svScVCfXdtKGd4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U8mr+E5E/bquLjHtd3y1fs2FBigd04YzSdV1VetNIuY=;
 b=IiGxYQa7CSxAhymfJM1+6kbvCnQD8AYpH6ldsRc5anVzVeoFEArZN2YNqQ/tW+1739dY2D5qFaLb43Pb4zD1ucrw7ovBulhYW7cBGXgmMw9V+EA8dfInBMK682uBUpmE9X9R0HhqTAEkNJznS3GX8nLENaIShnva/fmKBm9iN5FOcEx7nBDDZ1uNmrYNOrpkAlmZlW9j/6JMJIrNv0JvbAw0TGPnZeemagiAodJ1XKwZo7suLi/onHjdvo1UwDeNLWgZbUvh7+HcbUUJvlLXwwvq0JSuRcebP4dIYqOSa7dvryafSAonvjRQm/R1zweR79cabz6od9e+nDDzwgvYEw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com (2603:10a6:10:7d::22)
 by AS8PR03MB7749.eurprd03.prod.outlook.com (2603:10a6:20b:404::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 20:10:02 +0000
Received: from DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d]) by DB7PR03MB4972.eurprd03.prod.outlook.com
 ([fe80::204a:de22:b651:f86d%6]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 20:10:02 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: "David S . Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>,
	Madalin Bucur <madalin.bucur@nxp.com>,
	Camelia Alexandra Groza <camelia.groza@nxp.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next v6 9/9] arm64: dts: layerscape: Add nodes for QSGMII PCSs
Date: Fri, 30 Sep 2022 16:09:33 -0400
Message-Id: <20220930200933.4111249-10-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20220930200933.4111249-1-sean.anderson@seco.com>
References: <20220930200933.4111249-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0144.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::29) To DB7PR03MB4972.eurprd03.prod.outlook.com
 (2603:10a6:10:7d::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB7PR03MB4972:EE_|AS8PR03MB7749:EE_
X-MS-Office365-Filtering-Correlation-Id: b9996548-7008-4857-b9e5-08daa31fc24b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	UGacYtLl/7+x2ybBfyqs4qfyjGhp7ZIeQk29E4XGlOLgOLO7tEV7TUcv19F6AewEFiSpi74ZEPbuxf/RGLuLs+cacxXDqeM3f2MZBkulq0C/mztW/zISXoFmILP3LbKS3m947XMn2KyBH/h7UcItcwWbIQ3g61WWkhAoTpZ/Cl+XYH31fvIlKyNMyMrMRLwQOcTkZdLpxm5ya6UNkmgOCrVzOVUX+tjjV5hC16XdKZVy7c0nczR667UiwdlBtCmmj+XOADY9/vPul9hhNhC9GexDS9fd0Eswn365zrXa0IcH1ZUQ56LaADZJjUhlZ6nz39G1Dxh/E7WOqS+j1UrOETz+ERQaq0eUAq3j376VvyXJSEuJYwpGv4Wff2MNTpe++zNklLjFq+xi/GJkpiX1ez24Ficwbfs50Kulq6lkQirpPwN/SzdlC5EKpaJt79PyU4jRDi6KdnqEYY7EikAmrniu4yc2ZbGqpYoomyTtrUZHsIPnHkTwBCK0/LWHJjNUvGUSrDfQbPR89IyMNCHZ57M2g7iqkcxjMVTVP/SNXpCOf23sXSC82BdLPAZe5dsSLDqjzH3pPTa4IDfiVFD70hlMVGMV8roTjLc2BWnqxgHx3AYbo2sNZIa+u9x8/eOn41yNqKquBUxAJpu06Al7YUt0C12qBLH5g1xmz1KaLmQ2m2kY6NLcu8mNlJ8zmlYjOlFIV0pe0mlUVoddPd4zi7QPte7ancCfRD0EBubO2vzzOM54yqcUYL7qoPTY3KMR5OcpTJUus3j9caukxvyC+A==
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4972.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(376002)(136003)(366004)(396003)(346002)(39850400004)(451199015)(66946007)(2906002)(6666004)(38350700002)(38100700002)(8676002)(66476007)(66556008)(4326008)(41300700001)(36756003)(6486002)(6512007)(478600001)(6506007)(52116002)(26005)(110136005)(316002)(54906003)(186003)(1076003)(2616005)(86362001)(8936002)(7416002)(44832011)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?x9zRaGiVwyCIK6IFd+AufyqoCF7wDdzZ8BQ+MVjzTrcurFCc/cqwUue3Y5Yo?=
 =?us-ascii?Q?GwRx0kO3f0jyJUdYwA9Wzw7uX7e7WGXNd2iMONONC2IKVbkrraHitem77NXm?=
 =?us-ascii?Q?wMP64vYqQo8Fu4zgbtlE6YHuqsa/g4TMKSY0RV6QtyU4Kt7Pm0AuWSoUczP2?=
 =?us-ascii?Q?ESPY5GUSAEpLto8FdFCkd+5nyffz7u4fbKXg9RJfOwoz8eaFQXdHlkkeAQCX?=
 =?us-ascii?Q?2TAJZxigfC+eJ6tRMHlCWaNjIIbxI5t+bMSbJpjVjNrq0Nw06uUFvlkDrB1N?=
 =?us-ascii?Q?VMmqexDhYL4rmDdemS0FyU11yoT9jiuVUXHNinROrPROstvoEv96Rd+kTQTM?=
 =?us-ascii?Q?2wSTEwWaxevWy1h7hCcb9NHw6JCXh7PWbgAe+ee90PyCE2DsUHoETRd6ySsU?=
 =?us-ascii?Q?wKa4a4XKvEWkrNbtPQSL4i4+1y8DLCApXBGxOAIwjVvquhxyhyAfec1tKa7O?=
 =?us-ascii?Q?s0ObkTcqg3e5eTVq/eBQO3Mij4DfgBrcoWx72tE/hxyUT6oImZD0UDItIFm3?=
 =?us-ascii?Q?jj/7yzIX/VM2tIIGgexiiTYHsU3Y+vJZtFnM866+4XtGPUCySNq71px7St3m?=
 =?us-ascii?Q?3NlVrL6oOEET3zB359XGP41feKlB0d9HSFa69klKS5BrGYcNlLki8H6SV0rw?=
 =?us-ascii?Q?qFj79hfCeWDOWI1vzagwq8FhSOrl63i0tQyiLNyPvqEg5EmLx28b0b4jZMPb?=
 =?us-ascii?Q?2n2H9gkoBGAOHboiujwhvGUfm5+4wTNH51LePCU9zU5trpAvGIFhhBARRPDe?=
 =?us-ascii?Q?j7aclvOJPwu66Mh8MqdJwbPBtAAzICX40cld/hivqzOrzhnGB0IHBpBhZpNb?=
 =?us-ascii?Q?GEqIrkOwlzMAT9/G5VWWvT4V8k/vkEddXYVQY3Vu4gDEbnx7xRNnIlciKvR1?=
 =?us-ascii?Q?igTfPHhAZ0pu5zx6ixC9I5kwUo4J8zKwq+/d2pJbFbGtglfX3jWVUaic6Yz4?=
 =?us-ascii?Q?KGSbaS+24lJPti/PzvqZwIoK9VjFAgTtpN8BVH0gnfW14jQ69W2oxpMCMg+8?=
 =?us-ascii?Q?Nw9SkrhnYonATbxrKevC4d7oEuXhbGw7JDK8NArBOKdyZgJR/b+4+qod90r2?=
 =?us-ascii?Q?qyMw4DImmQjE83iGnTkAeqayb/sMlwafP3k3TWzy9AtZIzQUGEvlZFAM9TVR?=
 =?us-ascii?Q?fcaD0Q73uTBqN6o89EzqaUzeGptWI9w7DZvAH12RQm6WgJRp/IYFEw73sgj8?=
 =?us-ascii?Q?Lz0iszo5TqUkMSrCtYkDqthVY6DA5tHVab2Bin7LO8nFP4y/KS1QfzKHQyGK?=
 =?us-ascii?Q?x5M/kMxr47e1iUuljVQNa+b+JPY+FboLRXI+JA8nsUiASG2wwoh6XjHFz75C?=
 =?us-ascii?Q?Epr/5CS20Hr4zT+wAJG9B4fke8B5VHiSFl27aTKDFUo9hszN7vmg6F8evlfg?=
 =?us-ascii?Q?Uso1H1TXsJVzMl0gljQJ185LpIVTe7QnIfz0eiGAVeSeYrvDTfLYGJ8BHJu6?=
 =?us-ascii?Q?yYOie+3XOf98niExjAPG6WmFuoTxKA/j3oQTDX85JpfqB03MQS7NE7ee63PM?=
 =?us-ascii?Q?qxvts8iDWy5hvY31kKlnnFQ7GBzuRBCz0zMLNPZMHFwpkfWzBV2xj32Bscyu?=
 =?us-ascii?Q?CrvwqMDXZcdOaXpzZFAGZNY208TFA60UYGWuHE+fCt+P8n3F8RuHIF7wXSaj?=
 =?us-ascii?Q?TA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b9996548-7008-4857-b9e5-08daa31fc24b
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4972.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 20:10:02.6496
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8h04EDgrngAUFTvAbRWnFWxVdQuyRB2sh1T6/VMBM/OrHQT2ixkJaOcxPCfWM+lkeyKrolc+HXdswNoGfV8z2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR03MB7749
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
Cc: devicetree@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Sean Anderson <sean.anderson@seco.com>, Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh+dt@kernel.org>, Paul Mackerras <paulus@samba.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Shawn Guo <shawnguo@kernel.org>, Paolo Abeni <pabeni@redhat.com>, "linuxppc-dev @ lists . ozlabs . org" <linuxppc-dev@lists.ozlabs.org>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now that we actually read registers from QSGMII PCSs, it's important
that we have the correct address (instead of hoping that we're the MAC
with all the QSGMII PCSs on its bus). This adds nodes for the QSGMII
PCSs.  The exact mapping of QSGMII to MACs depends on the SoC.

Since the first QSGMII PCSs share an address with the SGMII and XFI
PCSs, we only add new nodes for PCSs 2-4. This avoids address conflicts
on the bus.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

(no changes since v3)

Changes in v3:
- Split this patch off from the previous one

Changes in v2:
- New

 .../boot/dts/freescale/fsl-ls1043-post.dtsi   | 24 ++++++++++++++++++
 .../boot/dts/freescale/fsl-ls1046-post.dtsi   | 25 +++++++++++++++++++
 2 files changed, 49 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi
index d237162a8744..5c4d7eef8b61 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1043-post.dtsi
@@ -24,9 +24,12 @@ &fman0 {
 
 	/* these aliases provide the FMan ports mapping */
 	enet0: ethernet@e0000 {
+		pcs-handle-names = "qsgmii";
 	};
 
 	enet1: ethernet@e2000 {
+		pcsphy-handle = <&pcsphy1>, <&qsgmiib_pcs1>;
+		pcs-handle-names = "sgmii", "qsgmii";
 	};
 
 	enet2: ethernet@e4000 {
@@ -36,11 +39,32 @@ enet3: ethernet@e6000 {
 	};
 
 	enet4: ethernet@e8000 {
+		pcsphy-handle = <&pcsphy4>, <&qsgmiib_pcs2>;
+		pcs-handle-names = "sgmii", "qsgmii";
 	};
 
 	enet5: ethernet@ea000 {
+		pcsphy-handle = <&pcsphy5>, <&qsgmiib_pcs3>;
+		pcs-handle-names = "sgmii", "qsgmii";
 	};
 
 	enet6: ethernet@f0000 {
 	};
+
+	mdio@e1000 {
+		qsgmiib_pcs1: ethernet-pcs@1 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x1>;
+		};
+
+		qsgmiib_pcs2: ethernet-pcs@2 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x2>;
+		};
+
+		qsgmiib_pcs3: ethernet-pcs@3 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x3>;
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi b/arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi
index d6caaea57d90..4e3345093943 100644
--- a/arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi
+++ b/arch/arm64/boot/dts/freescale/fsl-ls1046-post.dtsi
@@ -23,6 +23,8 @@ &soc {
 &fman0 {
 	/* these aliases provide the FMan ports mapping */
 	enet0: ethernet@e0000 {
+		pcsphy-handle = <&qsgmiib_pcs3>;
+		pcs-handle-names = "qsgmii";
 	};
 
 	enet1: ethernet@e2000 {
@@ -35,14 +37,37 @@ enet3: ethernet@e6000 {
 	};
 
 	enet4: ethernet@e8000 {
+		pcsphy-handle = <&pcsphy4>, <&qsgmiib_pcs1>;
+		pcs-handle-names = "sgmii", "qsgmii";
 	};
 
 	enet5: ethernet@ea000 {
+		pcsphy-handle = <&pcsphy5>, <&pcsphy5>;
+		pcs-handle-names = "sgmii", "qsgmii";
 	};
 
 	enet6: ethernet@f0000 {
 	};
 
 	enet7: ethernet@f2000 {
+		pcsphy-handle = <&pcsphy7>, <&qsgmiib_pcs2>, <&pcsphy7>;
+		pcs-handle-names = "sgmii", "qsgmii", "xfi";
+	};
+
+	mdio@eb000 {
+		qsgmiib_pcs1: ethernet-pcs@1 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x1>;
+		};
+
+		qsgmiib_pcs2: ethernet-pcs@2 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x2>;
+		};
+
+		qsgmiib_pcs3: ethernet-pcs@3 {
+			compatible = "fsl,lynx-pcs";
+			reg = <0x3>;
+		};
 	};
 };
-- 
2.35.1.1320.gc452695387.dirty

