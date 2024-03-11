Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4F9877EE9
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:22:43 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=drjX1bWp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZBT3t5Nz3vff
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:22:41 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=drjX1bWp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::602; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on0602.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::602])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZ1Q1WsTz3cCt
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:14:49 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oPK5leh7gLQEuREzNWsrpaT/mWabDVhi6GMH2cuhzwopwCGGFw+a3EkNSlz4/B3NCobon6mXYma8frgEDCOBwLbOV3CWSARqZwwSAeATQnh4XfSvDSFEvkjSYUdG9xtxkNIvW75pi/oJgk1b8Dswt9ZrrzZDRROQ3CG8H9/FJrJrQVxA9K1J0pE9q2xj3oX6pecUoDk75uSY63NvetdhT4gf5+3341MKzYR9K0zqVeqNKhybUAtGm3z2DWydXFtkYNz2CdLCCnCiSnA6VJ5zcUc+j+UHcHc/WiZMiuRzYkBYs7YKnUOwTHkJtxFsqxQHztjfru1Izwl16dkWs8PdYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CaP8RKoyNqXGxOJY7gl5KarHmyUtzc3rg//cAW3HNCo=;
 b=iq3ibI5wSZf5nil4X85qGqHYbfm01Rsq3WxFvz/0cTxDItEnL9ztgqrpcPK2l6fap9EOwsYU2ugCXlnd3HAQI8QbOLGM6SjBeN8ZkbeICDKbsamL39468ciaaT+6BARyLXUmTQOL7M+GPVY5bqutxbYBEhnCUQ2QFTZRn0kjCEk34+s/nXmf9m1x7CbMph145hzMnkmxhV24Rhg+HJkwqxwC2lWq615gdiLRa3KVcDHOXQb7QLx3pB9WJdYG01K38ww/bUFXnFu/JX1K9iYS7PL2K6ZAM1HFrT8tqhWiUPiZ6po0xbQW5sJCfsAm8cofe0RbBUhhCxKdLiIqu1Fmrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CaP8RKoyNqXGxOJY7gl5KarHmyUtzc3rg//cAW3HNCo=;
 b=drjX1bWpf/zQ90NB+Oc1YxpbXRy2FGwE9eyv8zAWXIqexI+WDxMC5U9R7W4UGVJZqBW2XupnEG0QClzCvfgakrvr/Aya+zrlp17zLbCCPBTk582jWpqQDB41SDJefcHhdYXORMG1JRzKCn77ImBrCVOgf9GlfQblIy8nSd4LaDw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:44 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:44 +0000
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
Subject: [PATCH v3 5/5] ASoC: fsl: imx-rpmsg: Update to correct DT node
Date: Mon, 11 Mar 2024 20:13:49 +0900
Message-ID: <20240311111349.723256-6-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6b05619b-2107-46fb-c346-08dc41bc74a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	Fdd5Ajd84kqY8vyNDiO7Gu6jjRISWKMdsHKBlYj1WBB5PPbBah3tOxRBBnXa8YbujafhjrXmTYY9HD4YYaBwC/WmiLUMc6q4CDR7U9Sav+gKzT7lUNlGw5j8JyI+6919LpImQU/Hpt89+juNggub52jpFTCbzNdl9T8nzh1wDNqWleFtiGbC5I3KV0PTnYvku3xhA2kEVGcgiXGFoV3u3o7SkVnQHZ+fhaj8FFMc7WuZl4eeuakwnwMbG03m71rP6q4VgBnygLVRF6esEUYCRP+MlOuRDtSiHRVuDNEbJCVAbDEN40A+P8Si9hRelRw/qE+hfFWtig4YJQd+MtqpzsHiaC/5HJvMtNGrwuSlq3fr07CtR7DJMsePt9W/C8rvwEV+Oh14h7Nbzh0IzIArkhEaSEhPrAv0dZ0FHAO01Ax1iNhBw17kqf+cBG+RwOt2lNs2ZexSkKeb0vellS+XMQWh3bPAlU9D9DwS3PJ26KR/xJ9cPnraS5flLRJcs0rALnWftTPfsw0ZzFBNDVSGtwSaXNl5Q20oq/k8wr5WrWWj6pSCTFO99sTGq9trc/WqFRBkLo7Grd3JaDrp+MCBKr8CzbluyLpHlfQ3KmwIk43CMOwBcrnOm2dVuI76ijXW6UJtlrvZLt5o+ZsdqxABqIBidRH1JXGQ97bhg7jJzcZ9nSc6DRwfzezr7LGaKiglJGn0ZfXUrF85pBSJugvY80uRtBXgtay/e8Y91rV/O1k=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?k+2Nn6xXQUS4FO0aD2iI5ySlMvQX0UPzSJHbchMzlMrZMlslI5MavC37eUF5?=
 =?us-ascii?Q?p/zw+NxlVTnnLn07AXk762Yz4EumL6v4aiO3ZbBQ09dppkkrAZzab/gjluNv?=
 =?us-ascii?Q?EHUQcfrrUUfZryFJGxv7Y0WXCv9yeaf2TpIajPoN1EiQE9xBH0QPp6hPQlqo?=
 =?us-ascii?Q?YAhLBAV3kJMnePnxVbWCeLNO1FQ4g2lurduCRvncJGuuGiRGgqNDZaLZJTve?=
 =?us-ascii?Q?S+6JlmSh0JdAD4XX7fszMJqHBSvs1WLofKgQlGS2i6uuXBGdwcLXUm70iTt7?=
 =?us-ascii?Q?QKlXRpcEmmPEjyDbkrdx6JigLZ0HncjosKUSmYK25Ru5jfsktgOc0Gqp1R03?=
 =?us-ascii?Q?fEZvDn175coewp9VzVRI6tUOgY7fcSh2kvc/MrUGdpn9SGCIB0U4RJENxJ8+?=
 =?us-ascii?Q?Cv6hvcSn1gZb0gNSNXVFoevkwhgwiaMTHJAK7SYjEWcoHGMbY2o3R8hNuAUK?=
 =?us-ascii?Q?1b0/uCh7Wmvz0arfSK9xSC53WFKGSgjYmyxGAESXVKaUMf9ND2JYNjVMz9lz?=
 =?us-ascii?Q?ix+/5vkUCT3ITrUT5qTYZokGsJ8s4Js6JvbyBWrSneKYRIa5DXjZ4IncKo5l?=
 =?us-ascii?Q?8go2E+7N0glAqRDxx3g2SGRfT95O9HHQGvbeyo1NFGY5WylHvWXtCxreyg/l?=
 =?us-ascii?Q?YmsbrmHlhTnf9mgqbkfjLDdmfUQixStHKEBdZ12fr0if61hOc66KNqAGrMGc?=
 =?us-ascii?Q?fGvbBnwRC7KK0RZY2HDbKetA3LgE94rLdiGQfCAHbVBC8I3+zCJS+CiYOIFv?=
 =?us-ascii?Q?cKvgd4wnLztdjHUDwrPd0SEVYlpj94BQV1iG3JETiqZ43KD6xPVdMh2EuIXg?=
 =?us-ascii?Q?dsotdCqq4/gRPat6KT60cG4yO8MamGDqpCRodVr2/GlfYiBggQQKpToC315p?=
 =?us-ascii?Q?tGTZTGu5pLW1w+9WNlMPTP6F3PxEYR8nTsJhX2nctvmkoGBwWBOcnktVEiNy?=
 =?us-ascii?Q?OzrxeAX9J5t/0hGMQAwBc+0EeQ6GDKmvZqEorNyjeMFMGT3y7NiJ03z8Azi6?=
 =?us-ascii?Q?pMQY46SVmnDz48X31QIHx7bB9ABkW/o5GQo3DegKjLOfti2PoBozhlUYhRnW?=
 =?us-ascii?Q?XXmAcFi7kz/IGRPeP0VUYYglGTPo5Pgd9d6O2j+SMr3rJhCaLsIla7r7E4Jh?=
 =?us-ascii?Q?dNgskcKet6fgZ3zqa3woGhwX+CHtFa5p+LauJxTEmXsiEB+O0MBpB6rAFKz0?=
 =?us-ascii?Q?bJ8nBdz3EQVTJOENTuEQyzTbRv0h3OVFBFXdZwX1vidNU3p1s3tJi5uXowD4?=
 =?us-ascii?Q?n3ZIIdXPiyFdaHzCvTKjfg0GbexZodqJGbOMJc0jF6ESTNg7FlQ5/fomK182?=
 =?us-ascii?Q?5rCDGmF4EIuymniC8YXhZDtNpNMLL2Qx4hf+YBoe0cxM9btJcGJV/3qG8KJL?=
 =?us-ascii?Q?OlazuMybIl1kJOeBLtCuRKzl06MUTnjR/ntt8AarMu6swB0BrXOvEFNoS/Er?=
 =?us-ascii?Q?uaRn1n9c/XcvGzlnjHbrZma8dkBHdBXaWkOz67nVyy4SR6dAebjO3H2FAwpj?=
 =?us-ascii?Q?Pur2bpEtJ1dUYHs7ncDScGOZdBd49/vXeb6a2X+qcCgk86PBtSkRrfWTdz3z?=
 =?us-ascii?Q?KV56ERAct3v22B1c6SQ09YJVXaXKr2CrlN33bRiD?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b05619b-2107-46fb-c346-08dc41bc74a6
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:44.8279
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TnuXlIR2zjIQh3anNEhtsjIHWIjTVyVNRh4xKyeptACaOtoEGdyQXBOOOnUirX85gpYtRcznypCd1GGwMRDv7Q==
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

In order to support register and unregister rpmsg sound card through
remoteproc platform device for card to probe is registered in
imx-audio-rpmsg. ASoC machine driver no longer can get DT node of ASoC
CPU DAI device through parent device.

ASoC machine driver can get DT node of ASoC CPU DAI device with rpmsg
channel name acquired from platform specific data.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 28 +++++++++++++++++++---------
 1 file changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index e5bd63dab10c..0f1ad7ad7d27 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -108,10 +108,8 @@ static int imx_rpmsg_late_probe(struct snd_soc_card *card)
 static int imx_rpmsg_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link_component *dlc;
-	struct device *dev = pdev->dev.parent;
-	/* rpmsg_pdev is the platform device for the rpmsg node that probed us */
-	struct platform_device *rpmsg_pdev = to_platform_device(dev);
-	struct device_node *np = rpmsg_pdev->dev.of_node;
+	struct snd_soc_dai *cpu_dai;
+	struct device_node *np = NULL;
 	struct of_phandle_args args;
 	const char *platform_name;
 	struct imx_rpmsg *data;
@@ -127,10 +125,6 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		goto fail;
 	}
 
-	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
-	if (ret)
-		dev_warn(&pdev->dev, "no reserved DMA memory\n");
-
 	data->dai.cpus = &dlc[0];
 	data->dai.num_cpus = 1;
 	data->dai.platforms = &dlc[1];
@@ -152,6 +146,23 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	 */
 	data->dai.ignore_pmdown_time = 1;
 
+	data->dai.cpus->dai_name = pdev->dev.platform_data;
+	cpu_dai = snd_soc_find_dai(data->dai.cpus);
+	if (!cpu_dai) {
+		ret = -EPROBE_DEFER;
+		goto fail;
+	}
+	np = cpu_dai->dev->of_node;
+	if (!np) {
+		dev_err(&pdev->dev, "failed to parse CPU DAI device node\n");
+		ret = -ENODEV;
+		goto fail;
+	}
+
+	ret = of_reserved_mem_device_init_by_idx(&pdev->dev, np, 0);
+	if (ret)
+		dev_warn(&pdev->dev, "no reserved DMA memory\n");
+
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
@@ -170,7 +181,6 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 			data->sysclk = clk_get_rate(clk);
 	}
 
-	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
 	if (!of_property_read_string(np, "fsl,rpmsg-channel-name", &platform_name))
 		data->dai.platforms->name = platform_name;
 	else
-- 
2.43.0

