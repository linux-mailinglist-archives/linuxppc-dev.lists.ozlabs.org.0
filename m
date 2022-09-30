Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2790B5F0561
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:51:53 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf19f5qBZz3f53
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:51:50 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ovbyTrKA;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.56; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=ovbyTrKA;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60056.outbound.protection.outlook.com [40.107.6.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13q6Mk1z3bnY
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:47 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=L9a+a3HfuvE2oxy6ROf7QtItpuUxepaSt7hzxu/dVCjfWJaeCdFG2VsdIASt9fS7/2EFIPVPG9Z507L0ktcK3XaUizV6SovQ3mahYfV1Yjrko/I0SFOv/wXgeE0sjqjcmgMHn32zNXJI0bmQ8mBrEqxPNOzUOCg59+suyesSnND4BY1DkC5t11p5DlWMxlmPwoxTtPmG8q6OvH0QfoMOhvc+q/Rw0s6OxRX0UrPL31oVUDt3N3as+OZDMADa0jpV9JWcYPJS80Xzbd5059vL1COppE7584FgOhJV6Ugwi1TDrD+HQkXgPU76+LFJFB/gHt12Fbe4lT22/ipMcHUH2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PxTQ7IVzde13UUXchPar1dvJ+XllS83LF43FxapAL3E=;
 b=IppSwjybC6FGRayCWpV0GeS2YuaQgu0VdjkrC8n9OTG1m6yVsj5TljHe+pMy6spNVCAYEfhmWsn+wdp5XtEcYQCrPwYiqvOjy4a1F9y2kn2GTsTTXTDE2zGHSogqU4QD/DJZi43PXLQ0GRJTBqidZHj4KYoxs+YRMVMyOL3yKOqhRFj50YGE2o/1KZjcK4WzXvsrWH3wCZpVN+P5gULD4S+PX5c3PpudtLpjbHK5edXsGRypRNvjy6YONwooE41u9VHqzTMK04Mu13/Dw7QpueMy5rHy7nND4cgLW/ouVVC3CHo5CN45t1fpcixapSEHKIa4c341nrInoSI4Yeo4Ng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PxTQ7IVzde13UUXchPar1dvJ+XllS83LF43FxapAL3E=;
 b=ovbyTrKABrEmgxA2XeeXPMZLJRTzQUpYqFj7ayPbY6UgV94nbLFr+w+zUCGJhfGmTXeDAZzPvduxATSdpueMiE125jvr0HLykNCbJ98/gjVLjUCHbBqKwsJjvaOBxeStJf2nmQQil5mUEPit4wTQlMReiBWFmj9TJ8nxq6oRDF0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:32 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:32 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org,
	robh+dt@kernel.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v3 7/7] ASoC: imx-rpmsg: Assign platform driver used by machine driver to link with
Date: Fri, 30 Sep 2022 14:44:41 +0800
Message-Id: <20220930064441.2548505-8-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220930064441.2548505-1-chancel.liu@nxp.com>
References: <20220930064441.2548505-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2P153CA0041.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::10)
 To VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PAXPR04MB8640:EE_
X-MS-Office365-Filtering-Correlation-Id: d3f9734a-b949-4071-067e-08daa2af82dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	P1RYtWeT0OEu3IGyrZ1PeFVv4tl8Gr/VKdexYZkoSMzBQbaUmZNRwvSDV2hbv5FU0JdSf1CFlTAoXUSbIV2yCuMxWQBMDAgmptIRdqEGj5EZCIfuMatCiijVKyZL0WKhe9JG9A9HSZxAdEAH7pcM/3pu41Xy+Bxn2QbJxrq2bORwn75fUI1+h7F5rS9I+i3r1Wy/vk4QzPaxuRDeFbgeGwdLhJmsMu6GxANCuKNBB3JuA8fcVKoDilMipeQDvOtE5/ih1pcE/BEqxD07nctEXCBk2h1Mj9jVh8VVcfghGuby0v30UGCXCBrYRFlTdLl6OHD1oNvKtCVkOzP9phe1ufYwHDkdOmCivno1LJ4JWAdtKC/21GPto8AolHJw/iesiB453SjHvgbogLlpUnJ0oBZ7CPcylWZ4qt6sGpLtLDubpAYjv1wAwUknnWtVupnlCIi4CENRzkdtVVk7FZS8dTZZO1RwF3OpnUZQu+EoblpqYJRpdHTyQQeAbKBst4CrDLC61gD0lBP5YtXhFEWegds9sw1H/yyIHlSJ4FIKqzIhfEne7wLt3AKpgaaAITWu4NPDkds2m1r8xPbycpoYIO4eruxDao+dDQaky799A09+gY79w0fdC8M7bo2LMQ+eLcM3tzADpiyzUAU6te0LhVYxn/unIFHpg75LW+KSDzoig1PXOSAmICGXMrSKZxk+V7sUfKUgeyi1DKhNEJ6g+1V6UJy1C7ZXZ7w22cGo/gOw//iokpUDFxFNijj8zbm/j8ZkcNX35OcAYy6pblq4ZbD2sk+rtfu2w+LxBffy23c=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?UjSjW1tvTo7XvclbJyYEehLnAVgCYmYe1RsMjJsOdYWfxkkLWo3vXFYjsUEM?=
 =?us-ascii?Q?a3jk5nh8JZ/6tLn/0/BHwwQ9oxFDEYAAWwEbvQ0+DSRMl71XwpN5HsYmE3Oj?=
 =?us-ascii?Q?B0dNaiIJaIbzJFDv38w2qt1K31z3yi3RS8+geVf5shKcu2v0+mybiM24I0bN?=
 =?us-ascii?Q?kkTxjpk5p2i1T90PnUcGECExMGXSnCJAsgBNRowi8RYe74cGQDMhpJ5KM2jI?=
 =?us-ascii?Q?26rUWNcBqVrOIq50n4+uPNb4sIOpbKIsHPS2pnWBpQMP3Gi3zOddhZKaogCV?=
 =?us-ascii?Q?ShYE1zbYFV+o1FIjYLIRKyCB9UJ6d2ldsv/677k2x/Xuy8CBOoct7n6Bms6m?=
 =?us-ascii?Q?6bYbiXJSYLh6ZmwP4qW2i8NMDslKrULhXRF9V78nXCOEVW9TLf5Zj5TDEfGS?=
 =?us-ascii?Q?HeMydM0VFWcaaI0kgkERUAaEaPbgAea4k64OqQ7zQcdlh9jFFtY0tkqae5O7?=
 =?us-ascii?Q?XnzucYiUQBz2F27+synjpuHl2C1PKX6UvAzFE/H9pqeZwY75fediDye+fD9l?=
 =?us-ascii?Q?Ugzi8xJwNx/JasBgyKVjI6O7ESQe/mTF9OfFtZdpd7+EW4Pqkg37VM0y4KK2?=
 =?us-ascii?Q?Mins0lLRJ4tQv6uwCzY5SGHRNLM7KPTugH2ACsKlgZJausedL8NaNNAnsial?=
 =?us-ascii?Q?5VBtA/v9lp6FjFs3dG1CNGVGfLKAZapHe6TO5KyQSusty/C8PK/yJuQCQFK1?=
 =?us-ascii?Q?6IkUA7QDROFbIlMmnCBxA4d7m3QTmfptOyEo/8jgrfH2SrqffJsHKG4bbJmb?=
 =?us-ascii?Q?BliBPjFYMxl3rTt8nH3cSNIW10Q4uMZE3cQ4fMtumrRrv1M94TMAGPh2JEI8?=
 =?us-ascii?Q?H/8VJ3x7Rx+/3vRjSLZrlEkO5+hBMM11JBMlxoxcR/Pl6KcoZ6p0yuGf5P+R?=
 =?us-ascii?Q?Rd/sLPAQxSXlRO8e/6mdTm/VRt37Ye9j2uWNUHHJ51Weq64KJoH1UNh4IK0n?=
 =?us-ascii?Q?gmIF3WjKqX7oWfI1vVZfAN0ClgzYdvEHIntL8F8xhF+zU6s+3F9/OtLw/vrq?=
 =?us-ascii?Q?99KhuERV2NJCr0BRS8CTE0mUDqU8vYyxTGvXOtMCpT6MTkDj2maGkZPTfX6b?=
 =?us-ascii?Q?o8/85Qkq0xQAk3R6YHMnAxGtH9Qh2ikHZ9un3zubeVcP1/BONEPSIxUc4zT8?=
 =?us-ascii?Q?S0RkEqyYV0vPzyY8zns5FRWDOq3woS0xEulLEfKzksTySpj4zTsdU0h4cIth?=
 =?us-ascii?Q?SyXPWmd7dHcnt2ni7KzJs9Of8JoRGdGxNRnxUX/4WD4KkAaQbtYPr+kO+gEe?=
 =?us-ascii?Q?gPjIaE1tSWz+sHdGBGmc3tRjNaV+zJLuY0QHXs+pvLSDCnHlSPpDOwZ+bb1x?=
 =?us-ascii?Q?2NNWvsurtr79q93l4gwAvJPJDsCTtwuyi3ToZItPvCUT/HR9RG+Bu8KPn33f?=
 =?us-ascii?Q?+gGIpuU5UxQj5pl/2vzDVx5bYVZu1zvBlW5AG3VWZaqOliW5SaBz7Z/W8uEQ?=
 =?us-ascii?Q?Lxy5g/5B0Hhk8q2Kdp+BfR9Hb/yNTaKlGYFLb4+2xkpzK/iBU7iwabo5A6TA?=
 =?us-ascii?Q?9LxM/aoR8hiABab/wBkHhFp28jhUOXlf/vLcoxOweOUV2hGXNoFTInoHW7eK?=
 =?us-ascii?Q?bwuN1wxlFco8+EP+8H7jtHFk55C38vxfdAe1sMV3?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3f9734a-b949-4071-067e-08daa2af82dc
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:32.8374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j5smtdEt7MDHvpjNzyGXwuVPrhX3nxh0nROnHDgVXRF2SgU0MeZNONQt9Hq2sIb4SXSQ6o6bL3IhDWdjf0asOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8640
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
Cc: Chancel Liu <chancel.liu@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each ASoC platform driver is named by rpmsg channel. ASoC machine
driver can parse "fsl,rpmsg-channel-name" property to figure out which
ASoC platform driver it should link with.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 2e117311e582..57684064c9da 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -36,6 +36,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	struct platform_device *rpmsg_pdev = to_platform_device(dev);
 	struct device_node *np = rpmsg_pdev->dev.of_node;
 	struct of_phandle_args args;
+	const char *platform_name;
 	struct imx_rpmsg *data;
 	int ret = 0;
 
@@ -81,7 +82,10 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	}
 
 	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
-	data->dai.platforms->name = IMX_PCM_DRV_NAME;
+	if (!of_property_read_string(np, "fsl,rpmsg-channel-name", &platform_name))
+		data->dai.platforms->name = platform_name;
+	else
+		data->dai.platforms->name = "rpmsg-audio-channel";
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 	data->card.num_links = 1;
-- 
2.25.1

