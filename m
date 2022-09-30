Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 582135F0551
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 08:49:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mf16L6cZdz3cBF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 30 Sep 2022 16:48:58 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=e7PNuN9D;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=40.107.21.84; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=e7PNuN9D;
	dkim-atps=neutral
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2084.outbound.protection.outlook.com [40.107.21.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mf13P3sPNz3042
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 30 Sep 2022 16:46:25 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bb4snV54Z3WxTt1JhQu1b/IMNpYoaul22TJJA5gNAtXoniaouxArH7PqrAmNeJ/LglCZEOjLZvuU2nO3DfrcFi3l9dbadp538tmllKU+cztp34vdmXoE74R3GMnVoDjY8pRHqqsf5iqr4f48larqw2Lv0LoklpXmEovhPliIFD+NqBlfnBPhO+kwNAeW5JPg0aNOFeItgVyV604EH+w60Leq+yKLKCi+mzpu7XZ+S019tzqEtjUZXC1aS4G1hWNwYcs5NorINDvCSMWu51ZxtV42GcEjDAqP9oeE9mQ5hkG9EO1l4m3MNF5JP+PYV+WeiNFcGqjU/Ltd7tMziPgu1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XYTwAAt7/koMSdph33oVPkc9b5DPWLIipSpB1mPQMd8=;
 b=kRarVE4l/NKyOjoTTGJrqLwc2sx8b9fOer/3Qyj2zMQUEC0YEakiO4ijfbO9uZ/4j3TbwTy4YuP7lexkJSS6HXFVX8wYwV+dwpSAy43elGhGs6fLe12hygwhVaQ2oDxibr55C69hm56xjiNGCXg5GaMf2oQ/RUHTh11TdFibeFttraoCXSESqgN7km4djFjN2T72LeIxOwfQu8aBGDzzQYnZltFXWQYy/IUhaBHoUmeVRfQZPumCpBI1wZOS7QDqFcYTKedD0KLM2o9LVpENw7NTh9Vm+p9eSbcujCsbtIW+rS+Ta2WTsJc4WMEaEGrDe4Gg+kYfusY1OmDLgi/qYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XYTwAAt7/koMSdph33oVPkc9b5DPWLIipSpB1mPQMd8=;
 b=e7PNuN9DaSPa/0WrKtWoLwXyDDOAeIdVjiMMTF7edy3zbEn1resgIFkGuN9Tlv+tJ8rU2RVipkYg32DyYVX3ZyRFtwbxp9rd+NP/xRVwZ7PW7WDL3u0Z0RLD2ZJ4KLwPCu9kpAyuO6QoY1x/rhzWTouinfBcdGMNMjKC02z8pRQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com (2603:10a6:803:46::19)
 by PAXPR04MB8640.eurprd04.prod.outlook.com (2603:10a6:102:21f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 30 Sep
 2022 06:46:13 +0000
Received: from VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904]) by VI1PR04MB4222.eurprd04.prod.outlook.com
 ([fe80::7008:1596:bb4:d904%4]) with mapi id 15.20.5676.023; Fri, 30 Sep 2022
 06:46:13 +0000
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
Subject: [PATCH v3 3/7] ASoC: imx-pcm-rpmsg: Register different platform drivers
Date: Fri, 30 Sep 2022 14:44:37 +0800
Message-Id: <20220930064441.2548505-4-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6fd0eebb-7a9f-4d03-4bb2-08daa2af7784
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	hUdEKGzKHstPegjKh8cyr8QDvx2NJKz113KrqeMBAyzmp1+jS1Kc5PX+i4Myst0g8XVvOpq4s65Zz98xJjFqcqUyEHdj2I2z0XNKZqmT6nBVAhuGv78W5WRj6RungNFlrjR3mM6VPNiuyPAsqNYPGtSp/pmUBB6vhzbUcf0acftjwPAEchiagNVXXrWdM32GiFkhNxDe6tYw/1SkwAc/zPEpDY/j2QUxI5VohHqG5AjjJa+Dz9uynGgCETc9O0KRuWtfBEg0Sy5jMcP+h3mfth8E+T3eX6t7BAtFOKnm4NWdlz5GnSnECp29JMCHCAkibGbArilLEixE2WGuuMXZcoEPJ7Dif0WMjLTT+6oKI7RC2/4o+0W+gG/6bGaDdt3ElIeG/IKegsC1NhXion/O94Gi8AEH6IWqS8ZkgPvubODXbinO9dOxc7OPwS7lpQvxc6E4zxG2/f89Mrr7Affb8uCKCiBuU3ngi1fi5Yz/Aks/VfOwkuUNStc/paZR1RObak83nk8lJBCwkk69MCcTqHiPhil2cWwTE87bQkaKgkVaTvNiLiDgkQ5AZ/PyUOrIWEtq+ZUlcHS+6KZpbuG0OHxKU3t9zKgH1G2EIpFZi2eI6pwKPMXuxnKaiTUDvyzJBjy2TLB7hvvdl3iWbpYzAc/iMa50Kl7Lmr1rEUznxoYhpaYlltvy+fAo9j4WtzNNp2k0BGBk4wvnm6tEzssTarewwmDLGYCj2868WxdzBl69m7tfHM99zzpN27zvPk0F16d49dQo1o+HuguZFgXbbugGDdBDsvr/XkL93qWNWJY=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR04MB4222.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(83380400001)(7416002)(44832011)(5660300002)(66476007)(66556008)(66946007)(316002)(6506007)(41300700001)(4326008)(52116002)(6512007)(26005)(6666004)(36756003)(8936002)(8676002)(86362001)(2906002)(2616005)(186003)(1076003)(38350700002)(38100700002)(921005)(478600001)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?mXIGqZGy+rg6sAv6+X/HvnYSHA7H2s5Mhd1gTA8TBC2zb4MdyzFamj0yEGSx?=
 =?us-ascii?Q?ObB69NLtDa+OK1N5ZddLWP+Z+ePGgVKy5t50K1onGZmVL11Rh4zhRhA3EB3c?=
 =?us-ascii?Q?qXKwzm4dzsVndswJ2ry+ksa7lISE0rnCybihxhyWIs9I3Gl4U6Ed2TlLoi/x?=
 =?us-ascii?Q?IgCqVwjfCwhvY8iW5G1+j8evgTYzdJoMjU7t85wC4+xB3wwUojH1n1V1wETo?=
 =?us-ascii?Q?li4zTxnOva4kp2Xb26+73VaOooiEWodW9Mj2Y8SqMq4HNbBiZuIfSH3q9j6E?=
 =?us-ascii?Q?cOsWgyq29lBR1EVGNfYTvXZkhhz/lWBwReZq8wUAKfsWLww5P33c9Q1DFS74?=
 =?us-ascii?Q?BAwDeeFysbUjxTvFlOopX4KpiVmSWS6jpajmGH0d/8MFuZtFraH3kUwZADLQ?=
 =?us-ascii?Q?1wUhEnJxfMK+Rkwmpbo/JFtI3xXf6nqA0vRDqtXSHMbmP1dDPZjbKACC+9WA?=
 =?us-ascii?Q?5ynJmZt3qxRXSrcwAHtlDM9W5puAflukOnqjEGcrpAi5qJk2584bslAaeihu?=
 =?us-ascii?Q?E+EP55L4opF7UAddtJbl0lUI2P2cGJKhpH0A3gexb0P3wBuEdPBJx5nKr7V7?=
 =?us-ascii?Q?Qo79OFMFXhfQYLRbtegMiRBizQB0GxN4SZEXFbwALfemrr5olzT/TDH5p5w7?=
 =?us-ascii?Q?rx1bpF+jupTc2AKnKM+oweRQ83mbvBBwLtr+FvqSuXe0/JgTV5oKrDoKOWYZ?=
 =?us-ascii?Q?Sr8H/1eeA4mjOHxfE1XQ8kM9UCdXXUbHG9d+Gcvml0LQwlW9+7nWr3OKcVn1?=
 =?us-ascii?Q?V8QLY/t9eaSdGfqTNxr24A7yYdKSi28j/QBleeIKfPw3HzYpg1yr5scYI2N7?=
 =?us-ascii?Q?y/KiwSOqM5AGMdekyb3IKKIs+wbvQbnBZ75MoFomWY1vAm+l7Lj/jcs5zJXv?=
 =?us-ascii?Q?L2DYV4KTJ0Xcix0ws/DlM049i9FQ+sXXyC3qnd6awo0W86FTOUg+Ex+Pg4pQ?=
 =?us-ascii?Q?N9i+eQ+I55b8nnSzgE28Y1zrcOgQdOHUFM+Bbqqjnc13TH03ztcJ/0f0+vpT?=
 =?us-ascii?Q?oI7vuZ87vOa6nZhqLF9Zc4CHO7U2VEstQsEw3uSZevLttoF92nOAnKyQmjQy?=
 =?us-ascii?Q?AP7DDmAqGqmFif9Jp/9xP6g0BJlPz/lW1TxoCCu9zUOCBaHEaAoAZJEy6CBI?=
 =?us-ascii?Q?WWYI+lOCPokRJRLClSLik7QBqCua6P+lz48IK1Jdm4HrMKPzn7jIaCPqXIiP?=
 =?us-ascii?Q?CD5GEXr6WdZSJdl5I2KFHnHTmbAP9zg3GbiIjzMWZcVY2uO1GnqLst3GzjPk?=
 =?us-ascii?Q?3DPvaLmADhgfNRYDK81NFFHPC4LlbNWJh7Mh8c9UOVCLgVm21ew4reMqD4qx?=
 =?us-ascii?Q?jQ1f8lSXm2T/uXyTw/8qC9wgwu016pf++f6PzSfZ6H2Ms7VxFJTjLoixbdIk?=
 =?us-ascii?Q?8Zlrl5xpJeAH3KnJJg2HGAYMXyTOx0JQ6AT544I7AhNjahuLW1cqfLlCJtc4?=
 =?us-ascii?Q?k1JlubJpL4IdmDhFY2uKzoFdjDrXjmFwEybFY5gBH4/ktVQfmW3bPRACqmgC?=
 =?us-ascii?Q?UorVyUVVQS0pA+6rKHL1vMLW6k2W8sBk8dubGczRmUnqkQmjcDFAKAvRPAkG?=
 =?us-ascii?Q?v3GmcjXb1C7sfG68tP02PKojqk1Zv7AUFqexRomL?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fd0eebb-7a9f-4d03-4bb2-08daa2af7784
X-MS-Exchange-CrossTenant-AuthSource: VI1PR04MB4222.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2022 06:46:13.6200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fsg82xx5/zgCX4Opj+Ai5r2UNRXzFqVYig5hRcw8LnFrckNNl0GUrGLFRreFCSHxbWfzhZC8KCCdTtcoJimz2w==
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

This patch can register different ASoC platform drivers if there are
several rpmsg channels. Thus sound cards based on different rpmsg
channels can link to their respective platform drivers. Besides, the
name of driver is equal to the name of rpmsg channel.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-pcm-rpmsg.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 35049043e532..3157cd5a837e 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -684,7 +684,7 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	info->rpdev = container_of(pdev->dev.parent, struct rpmsg_device, dev);
 	info->dev = &pdev->dev;
 	/* Setup work queue */
-	info->rpmsg_wq = alloc_ordered_workqueue("rpmsg_audio",
+	info->rpmsg_wq = alloc_ordered_workqueue(info->rpdev->id.name,
 						 WQ_HIGHPRI |
 						 WQ_UNBOUND |
 						 WQ_FREEZABLE);
@@ -723,11 +723,15 @@ static int imx_rpmsg_pcm_probe(struct platform_device *pdev)
 	if (ret)
 		goto fail;
 
-	component = snd_soc_lookup_component(&pdev->dev, IMX_PCM_DRV_NAME);
+	component = snd_soc_lookup_component(&pdev->dev, NULL);
 	if (!component) {
 		ret = -EINVAL;
 		goto fail;
 	}
+
+	/* platform component name is used by machine driver to link with */
+	component->name = info->rpdev->id.name;
+
 #ifdef CONFIG_DEBUG_FS
 	component->debugfs_prefix = "rpmsg";
 #endif
-- 
2.25.1

