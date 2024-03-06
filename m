Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ACA5873024
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 09:00:05 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=aQpmH65o;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TqPwy5tgZz3vkj
	for <lists+linuxppc-dev@lfdr.de>; Wed,  6 Mar 2024 19:00:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=aQpmH65o;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:2613::601; helo=eur05-vi1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:2613::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TqPs165Rpz3dwr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  6 Mar 2024 18:56:37 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Js8Sjw3OaVSFBKKV3szzHgfVsNFYThpw82oB4yM73kou8Q+4SddTMFto2DBSOIWwJQuWj7oNh+4kmTBHE45mTDDqyIV2Th68AHoej1S3qcuokmO1o1VqyVS5NN7/EEu9tzPUvAVs+bNNex1aAPU8rZhTfchKlqAmHiOjF/PVa0WfuSwRpUu8AtA7NARlB+S1GS0zoCirgjJS4LD922eYFZT39xF7dumLcMhfxTzuqmh4UR3YZnszr75f/BMhgqz8UZdw2RONSBENUVKVSfa0J1SFFNreWi0fhX4ULwWzKiFVX7XqnjdcJv4TvXBsi/Fcx9jM+GD3hUzrwnb9p0sx3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wgGzeG+iwTNJd/AAbQ6AjkhznAUN+suHLFNatmwyngw=;
 b=VZIDc3juLEC2pF2HfAInhKYr++FNSFJToelSGk6m2onkphh41ensG6kWDIQCeEdTJO4aL3qOlTqsd/IWXHPwTUJBFEKl9sMNykbrwJiiTwGcILOWaun3INz1fza0eYaRE59rt34UwQh198D3yXrgQ5sQXw0DvOFKyjTBNUVk+fNjUmDSogD8mInQ0AuF0JKds1nK86FyQ2iNs7Rkc3kOhPqS3zkI4jzqo1ZH6KroIbWeo8WPgdlwF5oKLTT+t3JQBoQdQi0s6rsKZg7rpRMIWCU5SUEMfg5z4G/10dI1Ma6YtYvbGPrb8EbSdTL2tutFDhVJ+GUo9VIaTZwp+7VY7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wgGzeG+iwTNJd/AAbQ6AjkhznAUN+suHLFNatmwyngw=;
 b=aQpmH65o36JP3fh873lbMSYCMv72jbk+JS1wnhA4cXybzJ+G2zI9pdxv25akCM13DAulvYmZ1W7BKb1PJAlhSv9FxSxYTwc70w3KpC0DpmZSSkKB3bnXBhZ78hu1ruZuhOCpT9YtutLun+BRIiHHYy4sz88Bu4wPKFRmUh/v/rc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by VE1PR04MB7376.eurprd04.prod.outlook.com (2603:10a6:800:1a0::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.39; Wed, 6 Mar
 2024 07:56:26 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7339.035; Wed, 6 Mar 2024
 07:56:26 +0000
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
Subject: [PATCH 3/4] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
Date: Wed,  6 Mar 2024 16:55:09 +0900
Message-ID: <20240306075510.535963-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240306075510.535963-1-chancel.liu@nxp.com>
References: <20240306075510.535963-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|VE1PR04MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ef007f8-46ea-484f-ab02-08dc3db2ecca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	ZDXBDj4Z33vSjF+trkNOfZXoAKa2YCnmiGVBJPf+ZCWWIAvR629HLH6VDAn6iIdaNTg7EN51ELeXW50738fAfqBp3xSgR+PQ53xQEgQi4c0KCKVCYxyeId9LdFx7mWRSxFIxYVIPMm2mLstgcQcb9UvAIo3rIDe60ctkFXrGKtzswCOSKsDuXQa0w9zU5oM+UH4cLf+hgm3ybvA5bRrj8uhKGGvYRz10Oo6nSP/NgREEIVHrTFBRPhTkqHpQLhW3FZp7op/shKmCuSJHJc3vrO3QG1g/YcJOgrJxKIgZvSkDgoY7Fr7EZnuthqVM1b+PfuhtZV2Nv+jpwBBLpPRJ26NdmxcMgGPWKIcmSmcmBUSmOQlp+M2Xu/AkzDXHP2x0INkOIH+wm3AtszFxk9sTYEITYHbsfGBDpAv8+8cQf6tDqIelf+KQOw+H1HR8iT9+bJxyKMdTThdPu+qj4m0vrD5WPej76+D7u35u+Esm4roWvu5uouH0P47QnfW/S/b2xbMIDM1naqkniWit5WoFV1+hGRXly7T29HlM7KSMi2BTCbOJuid22dgtD/3PiiwIF3gQ8TCaLbhPB9MywJmHAGyUe3ThnUvDddK9+HGKrINfSR7j0FIE8cegarjbbp/Rr5TL9zp9CWIs8XDDgYPhYZ0dfYbpgXMcORJH/z/oOTx8QqepHPoLGPrNuIPL65EUXstuY8RGmCqTT1/ifnM8Jk+pVaql7Vk63o1569L8eA8=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?oHaffo0X1sfIB/xo0qytN0TW2Msuu/eDOBt2jE5uYwF9mTvLEZ8DNTez5l9r?=
 =?us-ascii?Q?NrZDe3YCosRMtatWYqWGXLVEuWh6rXIJWBKxHYHbNGx5J6Bpg899EJDfcvMl?=
 =?us-ascii?Q?agm3rOEFqe2M2obpET4i5oS3pr+BOESEkpfdlW2dVSBVToGxv/BgdDQ2H0ax?=
 =?us-ascii?Q?OetfVJVAKc62Qb79uAfj20zKpY4f/mBjhuy89SFryn55s9Hgq84acG/g+gLU?=
 =?us-ascii?Q?IJY17ZpAvYeVxNgx27mHuAazthG5e+PmnhBXKBJeTLbIARyL7rFXuGI70nlN?=
 =?us-ascii?Q?gqTO4yOmYPG5PX+2uwDVjrUEOZzW4FiLOkKArKavtBcC9P2gjf7bmqYhzg3X?=
 =?us-ascii?Q?9ZezAO/iE0z4qr5H4WBCIugAptvKKjXdmx9ytiSX2Ghf49uiPQdmWtGkjNbr?=
 =?us-ascii?Q?YHR9Go2lucCcd3u+SEyv9TwK6Hfp6c0tl98Jf9NqD7dFLNxTgj6rVnc9Hkww?=
 =?us-ascii?Q?yEVrxF9ylShz+agWLup2B8I4TjDvcNaOdhOGagw8/zFy4fy7/lXLQZ1X8CGd?=
 =?us-ascii?Q?tlN/2+M3qMzPwbLp+suL8qWPtkrqTTcm9M04DIoBr0hIQ6QD4m3o02QqZbms?=
 =?us-ascii?Q?IncmLYsVfIMdG8fncOu08n5ngC8+Zzet3Jf7p9xBfScFAtND4NKzhYmNHQ4B?=
 =?us-ascii?Q?14AnjGkk08pzX7ZpNdY4pAJWVItCJtdWknZNu95kBParbN0baIrNRlPi5HiW?=
 =?us-ascii?Q?wEdTXVJw04bM99JF5zkGdisNyUVz+ngi5wVrh3QI4g95ldMax4s5dnEglbFs?=
 =?us-ascii?Q?OuQkcD8I9iVN2/PC8E2L9u4NIgHe0XSu+aLJLIGKCq1rnunOWmfv1sOBZl6A?=
 =?us-ascii?Q?POURE3pntwPQKgXO8Zj8LcReVjjDJrpnic1mJ+N5lOmvgZ97Sa8j6/Tee3Sy?=
 =?us-ascii?Q?qIrmqWhY6XfwVYkx71gNdpK+EOhMlskk+CPpDacFAfWGsibNHQIyUof/UgNq?=
 =?us-ascii?Q?pSdJxJhV27QD+6oEp8sD+mCSNu6zoL/cL4VMzLthaICZcFpSPylsZytPS16q?=
 =?us-ascii?Q?5A9GW5XlNaS5kvBsmT1jDWlwNNq9FmXgaU0vJrwuRT1P9itHMsA/OMSs9qTr?=
 =?us-ascii?Q?cYMV87oENaLwT2hcn4sA5kjIxPd0jl6ZTEkZE0aIct9bUHW8n0n/S8tnxKFS?=
 =?us-ascii?Q?lhsL/iXMmSZucwIYg+d7dTg/oz1KuCRAPfr48MCWARamq09ecswG76iTXNqm?=
 =?us-ascii?Q?CtWyuSCfmLBhePznAO37j/xXdmKGjrLQ2D998rZAgdDIcun3AN0SvSbjR7+p?=
 =?us-ascii?Q?hvT3NuuxEzP92C8aGMzMiDybHohhewe0w8gkRPUdpFOAIeWJgz2MiSgsbRkS?=
 =?us-ascii?Q?LtGGluCNzUIjZIAJeLLIwsRAXTAgKR/Qlxk8wdlQ+KoROgp+XPjaGbnoI5Ej?=
 =?us-ascii?Q?yGUjlSGFDTBUTpHiDwocEy/1UgI+L9NTmymBUFcUjUQ6GjDryCwTRBs18Yv/?=
 =?us-ascii?Q?MmLLj2pp8riLbaNp7y8Wv+pVdM0ntfvj5/gE8BGlpuvn1SObY2ucZFugMxMe?=
 =?us-ascii?Q?qMaT/QQAtAK0/GEHA5V9VUP5NyZd8XHahifI2/pE/Szg6IIUZYG1jg2IK99w?=
 =?us-ascii?Q?ah644GE2lpXPtTJdX79tnhrsKOuDuFrQgkdr85yd?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ef007f8-46ea-484f-ab02-08dc3db2ecca
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2024 07:56:26.7987
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5pMs1NzbT0apiJeB/iRWX44t4OFoWKxuoYvHGQADOBL0SLvlyYgPRLyeoylrNW5dmQX63Qiz6YkOeXPn/HTtUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7376
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

Let imx-audio-rpmsg register platform device for card. So that card
register and unregister can be controlled by rpmsg driver's register
and unregister.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c       | 11 -----------
 sound/soc/fsl/imx-audio-rpmsg.c | 18 +++++++++++++++++-
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index 00852f174a69..53bd517e59d6 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -240,17 +240,6 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_pm_disable;
 
-	rpmsg->card_pdev = platform_device_register_data(&pdev->dev,
-							 "imx-audio-rpmsg",
-							 PLATFORM_DEVID_AUTO,
-							 NULL,
-							 0);
-	if (IS_ERR(rpmsg->card_pdev)) {
-		dev_err(&pdev->dev, "failed to register rpmsg card\n");
-		ret = PTR_ERR(rpmsg->card_pdev);
-		goto err_pm_disable;
-	}
-
 	return 0;
 
 err_pm_disable:
diff --git a/sound/soc/fsl/imx-audio-rpmsg.c b/sound/soc/fsl/imx-audio-rpmsg.c
index 40820d5ad92d..a6817ce1e92a 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -12,6 +12,7 @@
  */
 struct imx_audio_rpmsg {
 	struct platform_device *rpmsg_pdev;
+	struct platform_device *card_pdev;
 };
 
 static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
@@ -95,6 +96,17 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 		ret = PTR_ERR(data->rpmsg_pdev);
 	}
 
+	data->card_pdev = platform_device_register_data(&rpdev->dev,
+							"imx-audio-rpmsg",
+							PLATFORM_DEVID_AUTO,
+							rpdev->id.name,
+							strlen(rpdev->id.name));
+	if (IS_ERR(data->card_pdev)) {
+		dev_err(&rpdev->dev, "failed to register rpmsg card.\n");
+		ret = PTR_ERR(data->card_pdev);
+		goto fail;
+	}
+
 	return ret;
 }
 
@@ -105,6 +117,9 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (data->rpmsg_pdev)
 		platform_device_unregister(data->rpmsg_pdev);
 
+	if (data->card_pdev)
+		platform_device_unregister(data->card_pdev);
+
 	dev_info(&rpdev->dev, "audio rpmsg driver is removed\n");
 }
 
@@ -113,6 +128,7 @@ static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
 	{ .name = "rpmsg-micfil-channel" },
 	{ },
 };
+MODULE_DEVICE_TABLE(rpmsg, imx_audio_rpmsg_id_table);
 
 static struct rpmsg_driver imx_audio_rpmsg_driver = {
 	.drv.name	= "imx_audio_rpmsg",
@@ -126,5 +142,5 @@ module_rpmsg_driver(imx_audio_rpmsg_driver);
 
 MODULE_DESCRIPTION("Freescale SoC Audio RPMSG interface");
 MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
-MODULE_ALIAS("platform:imx_audio_rpmsg");
+MODULE_ALIAS("rpmsg:imx_audio_rpmsg");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

