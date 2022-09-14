Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4565B86D3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 12:57:17 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MSHNC0lDzz3bkR
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Sep 2022 20:57:15 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hCybVIQg;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.6.85; helo=eur04-db3-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=hCybVIQg;
	dkim-atps=neutral
Received: from EUR04-DB3-obe.outbound.protection.outlook.com (mail-eopbgr60085.outbound.protection.outlook.com [40.107.6.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MSHHL5n0jz3bZP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Sep 2022 20:53:02 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BhsAq5MqncbydV+oAFECT5hXoCxuHLe6M6yjPWVzEXlQOZPsPvzkMdkCR513rpFOicHR7p+O9rrbeAS+zMhVBl+orFny+o/PcmrG1pMePSz4ZT9NNd4KtHxYVOrCphUIysbwaPcYrBGvszhXBsXNsL7ofMF3E62K9+3U4fDysKCJ+KkcLGXh/WobYq0bY7PtvDzRyy1zQd2zqUBZq6f42zfoR76A1c1dzUk8NhhfOd5ej3ymVDAukfMXRGNjdbJ6wI9iGm0cmpC97WjeneLFDptnthe7MsMTjnn1vUSvQ2zLHn3XN4+9zXyTaTG5pFGS97UNrBcTK1htMy0995qihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XLcmkkiNlbs0tz1gDm+D2uOeNAsHk5XjyBwV+M9cYLE=;
 b=YCOjdybrX7t++PKeGQqr7BAUuejEsy2mQsxOsxBvDUw+kpcevlo4i0qs++adTcVuPYV8PC1RhQHSSsza37x1WdGA/zUzoiU/OpzhX0mX6KE9eyxbnAD7zOQ+pKBFF5sXXyzT23hQstPOeMVENn8BJ5JI40IjO7jA3Cs3MsheRg8gwZE5IRs6tAXW0jVaUsTBoNrrNTlXP8dfbthlv2kHPVO3ObVMUdF8gjw+HNXe7jU2SJWevTOmzW3d67LdjyUwrZnwSJ/5txcwvfelw/aKk+XZNz9yjdxLqIwSdmo3U2e1PDDzIFchNCdLVJmIDEtHUMicxvVujjxUVO1cSAjsiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XLcmkkiNlbs0tz1gDm+D2uOeNAsHk5XjyBwV+M9cYLE=;
 b=hCybVIQgYvow8FpUgCckyj0GTsoZrF7uVkdjbbeo2cGvpEg7C93TqhTfaEiygU/UXQNXNjjk//u18wHwClygU/ql7fJ1mcHCh9N5hYQaaKVwkv1+g3LuexaQrAWRV9ivCdsH0ttUlndLZfZhabSNwX0cwpSca6NqTSQLH1cd0Uk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PA4PR04MB7773.eurprd04.prod.outlook.com (2603:10a6:102:cd::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.22; Wed, 14 Sep
 2022 10:53:01 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 10:53:01 +0000
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
	shengjiu.wang@nxp.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH v2 5/7] ASoC: fsl_rpmsg: Register different ASoC machine devices
Date: Wed, 14 Sep 2022 18:51:43 +0800
Message-Id: <20220914105145.2543646-6-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220914105145.2543646-1-chancel.liu@nxp.com>
References: <20220914105145.2543646-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0017.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::10) To VI1PR04MB4222.eurprd04.prod.outlook.com
 (2603:10a6:803:46::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: VI1PR04MB4222:EE_|PA4PR04MB7773:EE_
X-MS-Office365-Filtering-Correlation-Id: dbf8eb0b-90ca-4c45-48bf-08da963f4add
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	R6r0XmpGG+Qx547+Zkf1gZk5ZRmrMLGCh/mFBQf8YLKRwN+lqtMuBFB3EBDFwCTegQ9C+gW3MEYvmUEhkqddpeO7Dw6jkSbNNPW1G5VtU66V1t/GgMpNYLC10WoB1fcwmplkh0DGAul6zYTc292Gy7P1HYuenjTrM5mclu9266cQB921JtzGQtsvNiL8NUtHNMtszdh7GlIcw6+iqR92Ln1aPlIAXK3iMt1/S/b/dBhTIZn3YW/bO44TDBdR64Rmkv5wCA2A0gwL/0PxlQk5jyrzmyGwtI8bY+dNAIT/jO5BlivZvXRg07nuhHGMRQaBErFUoslHIHGSs9xAMmcASi+GxdSuBtsErYuKFvYL8V9bi1qeuSk0acQL6G8J6BUGpO3d3N6Vh8qcWp0LWJ44HrbQnQ2AiWKW+FTrPupA9SE5SGttf8PmJL/IvXFYlbH8RzBRAZPHViar5RynTfnXirn/SAa1fhlmtE3MPJMiviMldGeWaDDYOuLAR3ssHlLOnj50H5vEM2rqgvJ4M+XZ2W+DQlO+y4yMaIn+lvdOZI9XW6nq47uIqY0NuWNxufoPF7xeVzugDsXtLji1bGwzcOBAng/8CLKRatH/KNx8x4ArY4LCjbRMsDM6ITsP7dAhL/6m+22BqJBizAm+46y0JRsgzD1kezWOGtxEOC79V3JYcnqhYEaoqXB1qfCz5+/1/FVR0GBuUnpjqtWM+qHH7YFQSXtxYZ7lUdmUxxBlIHgBK8i5XzzgWmgjyygUCVJH6DRhLJDJzE4h1LzOlQEb3T+uYAheD7HlkoxFKBscUOc=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(396003)(39860400002)(366004)(136003)(451199015)(36756003)(66946007)(921005)(316002)(2616005)(6666004)(1076003)(8676002)(2906002)(186003)(52116002)(26005)(478600001)(83380400001)(86362001)(38350700002)(41300700001)(38100700002)(6512007)(7416002)(6506007)(44832011)(66556008)(66476007)(6486002)(5660300002)(4326008)(4744005)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0B/DNRFII8C2nc9cec5j8Yaecyf9cUooRX+DCOHOZtPM0OoaiOOSwtUJuISr?=
 =?us-ascii?Q?ewvAaeCm1cX+BTEncWelGtPS94jCGy5P9c99FmcxviXL/f+MCtvdbBwmwi3j?=
 =?us-ascii?Q?F3+RIcxj3BZbZ41Sy/XtPVEr30kERqOlVEYsH2cTiek7Jw22k097T9lwVJoF?=
 =?us-ascii?Q?X543g6TOheokhNJTz+v7fRhO46mt+uvu7/qlsfwes8A9mzhIu5ZhPtHSYXY5?=
 =?us-ascii?Q?YGg1GVObIN3wMYgUFWZJXGyBtL0ZJgEr0ZGSh2efREH5cdNSj4EB2n1rr604?=
 =?us-ascii?Q?0tLpj7wYnyzewN+7zw4edjjRQzqEq77jUlk43eJtRJihgiJsY6hr78uGIBVY?=
 =?us-ascii?Q?7GI9e2ujpzI8iflCUytD2eeFQd9aY3nLV3S388fd2Kn+y/h4pfYrYLt34jVm?=
 =?us-ascii?Q?duSfj8SF5+UPnm20uKLeg96HsLrTAKKSKQNAUX85wUYvsf6OIT99kqa4KH7V?=
 =?us-ascii?Q?RR0LcPq9E3tvjzNvGZG5loBcUtHsZlymugKoX+Ju0qorRcGH0rIm8iKTqzZk?=
 =?us-ascii?Q?NlEi3m0ZIyg8Jdw0+/YJk4WVNkEFsH0XaFKuHvSHhsmDxMbFveD3R31WWFoR?=
 =?us-ascii?Q?ZqGt+zzNcblUXJzVxy8tImB5azb5vxLRh9cRmgiUIyaDCi4bNmV5ZBhASZU6?=
 =?us-ascii?Q?IJitQ7np1vusU88y9YHMslAjWcPEPC6w2ILE/z3vKLvu711ZUFoO5LZ+Qk97?=
 =?us-ascii?Q?Nv2ZtBq5PEpFHmXiaI9A9wSF89OGOG6UFuZKpytLgep2FNpXmN+c132LFnQ4?=
 =?us-ascii?Q?nsAObs882v6wBPJObMuN7T4NtcW7aj2kJZBgULLVtsJzukwh+W/wZNh125VF?=
 =?us-ascii?Q?GwUZeIOHC1676fr/lyewdUxSKzC/jYnQkvOlAzB6kfVvN8nq7XKoR0eUatwH?=
 =?us-ascii?Q?1YAIlcrHWB+tWtE0j1tRJK1qmui0/7Tk2fTgvIy4j948mZOq7ENbfP1mN/u4?=
 =?us-ascii?Q?LrdGDER5+vG0gjn94x7C0ZJVrA3SlAos9GCDtPFgrDkKmyPR5rouM2EAwsTr?=
 =?us-ascii?Q?g5S5/4yi4A6pdlmfrPWrMlQnM+v7s2SZyEQsikdFSJVUoVo4wXUWknWE6FrZ?=
 =?us-ascii?Q?eQ24W35qR8OCjyziT5QD9e6zOxP9nCAMfHMCgZB13aHiVDEVmtfCc9aCTMCu?=
 =?us-ascii?Q?BYg/EnfqNTH8nczD4TnMJvvHk9KDZwzNyjwVhGaDuJLr13gwctHWq15fWfRt?=
 =?us-ascii?Q?cQn0MDVbkAhi+t/iosEQB2wdayX4a91uevkRgD0tk95ZRq+h9825f4wlnX67?=
 =?us-ascii?Q?yflwP7UbxluvofGY/9mqBSEgQ3k0m03eTrG7BldkhOQVRUfYc+iQqqux0ot4?=
 =?us-ascii?Q?DHPKVCH8EwWnTTSMSyzwFzCwqFa6C6Nc8ljJBPzhxSngFFYPcKeWxyJ0BLnt?=
 =?us-ascii?Q?/8eONs0g9VlUN8fh4Pi6vabWPgE17KD+g2NKjKZCv7wSp3h0Yg3N8swfssjL?=
 =?us-ascii?Q?R4EAVVUgS7hI9dP9b+wubjhl6xboFvgNQ7CltgC3/mstPqh8nKNVQcHTnyJV?=
 =?us-ascii?Q?hfQZQ/vj4fL+wiZFie1SFab396XQDtVuMEc62C4x5S2NtOS12j7s78uV1BY+?=
 =?us-ascii?Q?7UaXVY/Yewio3U2Nm6VBuNnK+zNuNgqgYKfyreDC?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf8eb0b-90ca-4c45-48bf-08da963f4add
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 10:53:01.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SwqE8KV8D5Tuy5B92IFI/TgU/3ZQIjp0la8WDwo5o3ceylwPuhrUqDEjMKmNOBkgLkhGty60/lnq2GGkZqyfgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR04MB7773
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

This driver helps register ASoC machine device thus use of
PLATFORM_DEVID_AUTO macro in API can automatically create device for
each sound card based on rpmsg.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index bf94838bdbef..fde3d5006ce0 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -235,7 +235,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 
 	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
 							 "imx-audio-rpmsg",
-							 PLATFORM_DEVID_NONE,
+							 PLATFORM_DEVID_AUTO,
 							 NULL,
 							 0);
 	if (IS_ERR(rpmsg->card_pdev)) {
-- 
2.25.1

