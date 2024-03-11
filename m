Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E342F877ECD
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:20:33 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=tAHqJkQx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZ7z5Pjlz3vg6
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:20:31 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=tAHqJkQx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::60a; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZ1F5sngz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:14:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cPzET3DBqD5sQtKdECsm6QBYG+GAwpw56ZtGzm+X2aVZEJCWGy8YF9spEDgu1djp3tkJbBC172RLYI9Swbnd3bV6tsLd4vNKbsYHrjwTKIJDv3CFBEMi1RFQFfXLHz2aGbSE+SLM52ovqjUCpDL3vsjYTN1qTxSf96Dva15laN2GX2I3Baz+R4OoSiPDJXwqi8HmRWFLupo3HVoErT+ppOYCxmTVR8i3/SQ/R5smte3vIu7qA8LC8HQkASRLFrkBGY1f9mWW59lSFgVEpR96eUHcQ6jIpl/uWFwxvz8/aYY1KHw4+n8gN339jeh3uFVrqCJ01qIu1zIOHSU9+Eprzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ti+VBv044mAHayjE+En1j+sknmsBI96or1om/+ztZD4=;
 b=Pv6NofW3yVcOj77rwbOCYrhDFX3q2s3eep4HVzX6nNjG/K3lgIBgZ+w/M1oMYzUBds+PgRcKiT3oj7YNFssMMi1kGvULkz4Mj1gRtARKT/ZKF1EE7dUvs8kuRsmyqsMq+672WN4FcF0mhzuhxz4RJmUqRph3C2LQMwH79O6KIgYxchCYvGXeOykYzFqBwUg5xf0Y1wL5pZC+cNS+OFTHoPHKNhvgxqJggTzTs4Ww1EBIdv/gge7Ka77mOyMZ7YOvYesQbPx5U/SIiUFTrk1cB+OgRx5iIY8BEhZN9nbNqjYsPckbSOVhfIxE1eJPZ2O0MBjP0xQsc+OJbUxmEwXFrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ti+VBv044mAHayjE+En1j+sknmsBI96or1om/+ztZD4=;
 b=tAHqJkQxWMUKs0l2WdGA1iIXbP8jbyMqGRk9lwDpZi7XxMK5LrCiLYt5kl1E5tnZy97M3XABXqS6/oa25oU50ylqfvRbNdL4wQHxLkWmR04iiRC/ihjXzuY3i7x6mll7zSKDBn19z/oXQylphe1HAy40MTFVd7JgWftD8x/3vms=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:39 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:39 +0000
From: Chancel Liu <chancel.liu@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	linux-imx@nxp.com,
	alsa-devel@alsa-project.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 4/5] ASoC: fsl: fsl_rpmsg: Register CPU DAI with name of rpmsg channel
Date: Mon, 11 Mar 2024 20:13:48 +0900
Message-ID: <20240311111349.723256-5-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240311111349.723256-1-chancel.liu@nxp.com>
References: <20240311111349.723256-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2P153CA0032.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::23) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DU2PR04MB9145:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a0d48e-40ae-45aa-bd3c-08dc41bc7177
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	fv7kDjMv0wIvnCOkKrzrqtLIgl1XwZj3RgZYwrmntB/bmGBU8MDoSxpQ/zSDKec2zP0QiVr01srCAp+7Vn3gUoXb8QvGIxMu7jcHPHkhpdjA3ejPQxY2f5Rt9FYol7mn6ue2/HVdscYvaih2ljQ1kBcKj/TQ+JPUM3xM0wy0PHlX0J22L9vg9myPlxj0yC12NxzowBrW0o+szxoOHr+KbOiuWPxP00Gg5vJSIhG2p7fFVg9y7w0U1dmdb7e4a+5pNW+Na3KsZ/nV+0yuPzNF4n7pKI4mUradZ3/PyZaYoWbKRXjSwjSjjLnLs1UVPZn2PprM1fjL8otSaL+Np9N7WUGq5StnfFgUk8m8w/QMha9uxvQYUUZZqlOxMqU5IuU4nwkBg/BKyXO+tYyTund3TRsiT6pWAuSINUhiJq8WPVcn92mmA7yi3dbLYnnqAC8cBWa+LDiGBtEzJH2Sofg+SHu62FZO/bRbFMq2GnOCRHJWf6vTdL5fs0bwpt9PjTpyf8UNextaheB/Xg638yFeLKKjjHlfOpbcxMPw5IxCR6N8epfKdz6lQ7zU4rF6D/0XHa6E98yPpdyTrPK98e9tpyGBlxBhgKzU74u1SG8S6TXCFy4m/DhYnIiTBoPhKE6loq0fkT6QLIum7K0/r81v7dvmc0JrvCS/W30t6PZK+3KEBdFh0xqpq3QUaQp2z0Dzucy8ZpG+YSkyFXu85IULgRuKN6OAFsBicV43BaescSM=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?0/MzwoJyVVds3Gppc/mUhHBxN3BthvxUgSoWFueGG7DVr7yN25I/LuNWdPfp?=
 =?us-ascii?Q?4JGhfY4lGmk+OpXqtfg5D9ha3rulmFlXTHjza7IbFF2NZDIjqHxx2WI05eED?=
 =?us-ascii?Q?Azn6jqEWoXUPd7AQ1pdOF2wen897zyfr73tUlR0QPGBJm2Nqe/TjwAvN4EDO?=
 =?us-ascii?Q?oXTOF4L6anYjyJg/yz+TJkQc7j78JcMg17wJ6qDdumHb7CBINiJL4T5VTW/z?=
 =?us-ascii?Q?meGw/7KGOnh2WccX60m9WLDnscCsVyVJDSJV1IYypQP9CrYg02ALswpJDS/5?=
 =?us-ascii?Q?9frNPDFuD7rOAQ/TYpJptjs8gmpNGAOukl90AxELyI94mFy9GVR60Gjx16D6?=
 =?us-ascii?Q?1PiYxQzmmweQ6IvzQMxsUu2tSqRw+apumvf28s9TPtVWfQSA5N+l+jwPE5AI?=
 =?us-ascii?Q?+7mKeajMYMkO7jVGd3ZCCnpgfDh0l0b4C8ADctTcuxn2m+rnKwQBZacW4gpS?=
 =?us-ascii?Q?mn/iH88Zclz+5YqrPttm8qzo4LDb3ZZXXTPbZJWlALsSk85bd+CtDr9rJ+n8?=
 =?us-ascii?Q?V5xQcdJlkcfkAAl9I3/0pmcP7EKuc1m5B9R4oN8C9Is7DqBECz8WI0qb7Ooo?=
 =?us-ascii?Q?dClGrSyFRE6DIyOHKbaHf6yzw1U92WCusFHhsndP0p++bO1awbaMfFvoTfI1?=
 =?us-ascii?Q?iB8LishvGEenSSeRMmIgHsZ7OELq+5XF2iBkEdr4a84rL1LFaCLX7tadifJ8?=
 =?us-ascii?Q?Xax4gaReTiYfKAKMM/tNNn8R/NHw2Y0V8/dXrbeIOpE6RTGUWSgfSoXJIc4+?=
 =?us-ascii?Q?ZEtHhFKqpSVzuehBPMf4mEr2EW3zLFThabK4ruiqClo0ba0a9NNu8VG3o04l?=
 =?us-ascii?Q?hggkcRVIx/aim1TqzeCjM5NsLN4bVhbcc30VsZ3XsO1XCkFidHJRRyugBemM?=
 =?us-ascii?Q?NpEajo9epqnBvsHb54ogVSwJCNy9WkHCslk9LeO/A1g0XUMQySM+YCSbCNnV?=
 =?us-ascii?Q?3RN1YnVYmsF8vk823wb6ECbbj1h26PrXhh8hKaB5GcJLCplYb2zVnlbcJFn+?=
 =?us-ascii?Q?OoruMO9PJbpw65pgPk4HRLTOQNmfgSef+lE5eem3Qb//So7YQLNvY7qfHEya?=
 =?us-ascii?Q?RCaFgVygzSkQyNE8ysJwhqEcmJpFS+6b+FXuNtGQDgw/pAjTwIpU6WsCx54r?=
 =?us-ascii?Q?R8qEuEvCvY4RlRWr0t2Q5vzbDif9XbX31jeBxT+yqHGDAeqbcwFzSnWcrXxP?=
 =?us-ascii?Q?yjsoTm6gD7x90SLdtZlbWwoqeftMHDCVYuL7aNjYeY/zFr/gWRrmXc83GSk9?=
 =?us-ascii?Q?cNTE9llkw42f8tdsefLxxLkdph6MrcBennwy/w3GyOrS4U50kGVYyDAOV73Z?=
 =?us-ascii?Q?N4jR0/SlzRurdZPe3LjFPFoorJAbd2+oqEZ2mHyrSjmQeBPrJBNYRGtd/A/J?=
 =?us-ascii?Q?CC3Ex/92G76yU9qOi2Ax2mgfIq746ufkOAwOf0yjWIQDHhU1/pGfUDtSAqGh?=
 =?us-ascii?Q?dgXH5Yps4QFI/i2+A3T0yEJRgpwZn+gvqqkrKHEIlGs6bjvR0Im9ILbDepKM?=
 =?us-ascii?Q?j+tMod0Rjy4oXfjOG18/d/AlrAPOXn6zWcQ69TkUXQBRjCsfZzFrrEjZCH+T?=
 =?us-ascii?Q?erFZoKu1I9Txcx6S4BzEZj+NA/yJYhtIANZtX+Zm?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a0d48e-40ae-45aa-bd3c-08dc41bc7177
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:39.6215
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UGSJ/iTPyaggm/AfurHMImwNdfffEBjxwRtMCTwXsedWB/eOd8hUQ8q041l9YNUqui+kEefPQ4khNVKwsKMabw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9145
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

Each rpmsg sound card sits on one rpmsg channel. Register CPU DAI with
name of rpmsg channel so that ASoC machine driver can easily link CPU
DAI with rpmsg channel name.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 53bd517e59d6..bc41a0666856 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -135,7 +135,6 @@ static struct snd_soc_dai_driver fsl_rpmsg_dai = {
 
 static const struct snd_soc_component_driver fsl_component = {
 	.name			= "fsl-rpmsg",
-	.legacy_dai_naming	= 1,
 };
 
 static const struct fsl_rpmsg_soc_data imx7ulp_data = {
@@ -190,19 +189,40 @@ MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
 static int fsl_rpmsg_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct snd_soc_dai_driver *dai_drv;
+	const char *dai_name;
 	struct fsl_rpmsg *rpmsg;
 	int ret;
 
+	dai_drv = devm_kzalloc(&pdev->dev, sizeof(struct snd_soc_dai_driver), GFP_KERNEL);
+	if (!dai_drv)
+		return -ENOMEM;
+	memcpy(dai_drv, &fsl_rpmsg_dai, sizeof(fsl_rpmsg_dai));
+
 	rpmsg = devm_kzalloc(&pdev->dev, sizeof(struct fsl_rpmsg), GFP_KERNEL);
 	if (!rpmsg)
 		return -ENOMEM;
 
 	rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
 
-	fsl_rpmsg_dai.playback.rates = rpmsg->soc_data->rates;
-	fsl_rpmsg_dai.capture.rates = rpmsg->soc_data->rates;
-	fsl_rpmsg_dai.playback.formats = rpmsg->soc_data->formats;
-	fsl_rpmsg_dai.capture.formats = rpmsg->soc_data->formats;
+	if (rpmsg->soc_data) {
+		dai_drv->playback.rates = rpmsg->soc_data->rates;
+		dai_drv->capture.rates = rpmsg->soc_data->rates;
+		dai_drv->playback.formats = rpmsg->soc_data->formats;
+		dai_drv->capture.formats = rpmsg->soc_data->formats;
+	}
+
+	/* Use rpmsg channel name as cpu dai name */
+	ret = of_property_read_string(np, "fsl,rpmsg-channel-name", &dai_name);
+	if (ret) {
+		if (ret == -EINVAL) {
+			dai_name = "rpmsg-audio-channel";
+		} else {
+			dev_err(&pdev->dev, "Failed to get rpmsg channel name: %d!\n", ret);
+			return ret;
+		}
+	}
+	dai_drv->name = dai_name;
 
 	if (of_property_read_bool(np, "fsl,enable-lpa")) {
 		rpmsg->enable_lpa = 1;
@@ -236,7 +256,7 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
-					      &fsl_rpmsg_dai, 1);
+					      dai_drv, 1);
 	if (ret)
 		goto err_pm_disable;
 
-- 
2.43.0

