Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CDB877ECB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 12:19:52 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rcVgD0KX;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TtZ7B1sPQz3vhg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Mar 2024 22:19:50 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=rcVgD0KX;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f400:fe1f::60a; helo=eur01-ve1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR01-VE1-obe.outbound.protection.outlook.com (mail-ve1eur01on060a.outbound.protection.outlook.com [IPv6:2a01:111:f400:fe1f::60a])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TtZ1F1Rbdz2xcw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Mar 2024 22:14:41 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kVXRzCZwyaIa7ewGzC7C8EmVT8hjJP3pcht3+DYj5CuiARyfGgF6nzirZNSqi95jeZyVXDPlMPfY8Iq0B1uagmnB+4c7AfTtft6ijc9/lHvNVQ0F42DNHKIrYBVyHsSVah0Qk2stjY738GNrASPYJsFY1VC87hSdtJ00V7y/xuKwbvpoypNnwh1YSREEv589BC/sMp2ZMhSm9sQrX0Ex8mAHxsKO2S2S3uMDPOqX+V1N2Me85quSzEi4fPycRiWJNxzEfFwHfo0w28QdVWXLVefnakkG27ywliw78Htji4wsMipMqR9tyv6WC+HFy2ray0c6f1/lB3Q4Oyk5qgJFyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Oq+9ih4N4PlGzWqjRA4TbHrwiNaic4itHjhTLfn3qt4=;
 b=C27Hgc9e7gTVOMobA8+fEh4086hxgxitPwXsxBFblf2U8576JYJkCyfLPxWQhNjaPeQ+UHExQ2UvTTYavfxQJYd6Z0/wk7JdD63UcYSz5dc2KFEo1/aOhoNBRuks1EB0CU1zzblLKKBoGx7ebJnE8ujWsH8i+Vis1J8ZnoPYQaAfDhsB52oTJs3CRZnrQX8aFmXZ9CZTRReJsDvdswxgDgRv/hOPhX6Y4bRKaTSisbE6JZvZOoIVZnIfTjuACUA3vXHkHnQb7nHqFqbklLeuAnCYmIXdQA+TbnKP+PN5qUvuM/efQHjij+olQFpIlr1bDj//6yju0vSXMIT2/5pYpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Oq+9ih4N4PlGzWqjRA4TbHrwiNaic4itHjhTLfn3qt4=;
 b=rcVgD0KXFho/KClJeGK8zXXPeH2zTJI8tiYSN1kyqS9ZibYbgMvSRIIpN07PJCLG0cTOIaN3BNd1pxpnApyY+sc7BebhaomuUjRtRH5KPxigLww6TEbrHF60lptj7a0N3Ib/wILSRdZIv5H7JUUUrxIK7MfHkcVTGt7hmMeme9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DU2PR04MB9145.eurprd04.prod.outlook.com (2603:10a6:10:2f4::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.35; Mon, 11 Mar
 2024 11:14:34 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.035; Mon, 11 Mar 2024
 11:14:34 +0000
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
Subject: [PATCH v3 3/5] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
Date: Mon, 11 Mar 2024 20:13:47 +0900
Message-ID: <20240311111349.723256-4-chancel.liu@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 818634b5-35f6-4a48-ef09-08dc41bc6e5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	rP51D5sTwYvm7ujbSRSklNgMcpULRAlHHwhaboxLzwcfkEOzayEpQ6puoH3VRln1l0g8uVcwlJ3iOUuqRNn8Ru5zr8Cnh+rug5BqEZy3OV4nL/+XmdLXy6zdhS4hfJkhC3OkU7uhFemLphQYNv6xcffyRQ5LGOrAaX46FgCmPgZUCnOizJnZN4Sxwnm6a7X2Tnza0XeSPA9UVsjIzQPov3OhrihQz5ClGCoNMI86UlZkfEbJZssAsPAFH5bfJozU7JjxsqP2X7HE5UoIyjmZijBOl7pDHr5rYHFLDnW1UxOF1fe6Rr4dXvocqRJNvvF8XeZQ0E4scDWAk+jFJa9Ag5Rm2xb2VPb4dOTuZw3OOJSwcE5iox9WoZ7amuejxAT8+RMPB+kk10nhqg43g5ocGtnTB2mc+u39YpmqlmAFWOo+1JBaj5lDcPimv4nro33/1JbM7CzZ4VFO0kC64UkHsvwyNp391sA4d6dkll2nxXezB9N/3IXrhpM/hDX5YyJeXwtDre7B/DMEviCKdbfeRul82WeWKuTHCQabtSGiSbO7Sx4u0dAJ3QCUavmKvmmbwysWNpl/Dajl5IpqTjfWvSVBOvYrQnAdR94ApomoZFjYRmCv1Ley4D4yG/MbtyL7pPLQS9F51jZK7JuzJFyuQ24cQvDYAoFiPdAWjiUkPx3FqXALZjNDcm1t4iBpTG6ekoQ72VT1kXt4HXO1IvDJy5jVDXvDxZ7H5Rp6phzs930=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7416005)(376005)(1800799015)(52116005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?jHbFeeABRlAKx2xtl6hZ4KxrD8eqUlaD8uW/Due+6GIx9QbDWi/XdRx37pkw?=
 =?us-ascii?Q?vz4T7r9Yni5TboDMXneFYTtsmlP5EuSfBhFG103e2lAnSjNYdIQX4yvkLx9l?=
 =?us-ascii?Q?FMcQNEGICdmJx9k3h04s/JC7ogTbHBmO7a5/IyfyUZr5C8lRjeOdmRPWGlAA?=
 =?us-ascii?Q?/1uBbAZmGqDgp/9DBjOXfiKVzDF6IXNH96q7CO+vmwqkCtrT6LRMjoa7lAaC?=
 =?us-ascii?Q?vDY6cggHa/f7lgQkGUchD0LNtjnCPswVlOysRvaOa4BcvDak5j9r/rPMAYzG?=
 =?us-ascii?Q?CuafbV0VQrUeiFcmsotH6o738nf4oxKcM65YwWnqHbgy1DrZeIMGzuVw7fsF?=
 =?us-ascii?Q?fXvlNJr0BfwvfzHSaD7RJSW1KX4XpF3cOal62Tn+AY+0OHvb42RU7p9Mfzdp?=
 =?us-ascii?Q?hA8oG2hnssuODAme8NWtwFthbaz90dlBxqA3Do9l71JHqu1PHmAqaFxCneZi?=
 =?us-ascii?Q?t8q75aMTKw0b5xDuMm75rerqrveRxVMoizfs8m+F1+a8x8N2yKPz2aqNZxa9?=
 =?us-ascii?Q?T9nDR5GjJqf/ooiFD46KJ6T4INoyDbxXWYkVjTCZsg6KOxxia9PbRhXIJgqj?=
 =?us-ascii?Q?3ZsNu8rqVMRe83UCkC73wdUOB9bK5iijP+O7jYYAjoWJ1bPImq56Rps5tJ76?=
 =?us-ascii?Q?h8Tm89Rghyu5bGxVE7DBSxFFhjtkAHfXuYFbbdAc4yUJVhMUEVDN2rAnEwYH?=
 =?us-ascii?Q?FrQLOasrQh3YgosGQFXf1oGZCq0Yy/eHIezNXIunh0rIF+3KyjJn9KeqAdoK?=
 =?us-ascii?Q?VXhe8a53Mo9LLE6zBGIeQGC50HbdkwfiJ5oLWY2suyctioC8P/wZ1f+RdS3Y?=
 =?us-ascii?Q?dNKFpNm/Gytr7cuAGyJVo4pzFty2wxsRVbN8Dcqx62a4pwCKu9GOGdcpBHg3?=
 =?us-ascii?Q?mQ4ySa447JQ1XTgXplfB7VSm66zY21/7vIV/oZW8INQxtgscJr+tewejd2th?=
 =?us-ascii?Q?2stICoccH/Qem8ao7d0QnJ07YnfWe+9+Vq/2cv6mbv4NYq4QOJrEtmHfXwkG?=
 =?us-ascii?Q?3F6JCeVVc0FnNAiI75lTqw6/ojr8cbBZcI9NW9U1MBEq9Xa2t8DA0G3QHVwP?=
 =?us-ascii?Q?VHnQFmaCVKTSxMTBaeViOZmxEF+T66nkLFd5PkQmg0KWU0RJmGHzJ6DuuBCd?=
 =?us-ascii?Q?z7pFq7egWMf0tS/QWAfW4ZmIEWmXccyupaFzh8B6/AyiWoTAmmyhR7Il31cE?=
 =?us-ascii?Q?s4aRhcJjaDt+mIeFizUOWGkCqsYDUDYlsbuXPm/I1OT49G0fT46A2SOWmPvu?=
 =?us-ascii?Q?W8aXgX7bDCXYwEsbCWg7V6BnhYUgto/leuBQ7yPQ5PSR/CnNQTJiqXWzDkR1?=
 =?us-ascii?Q?dlDiHacJVxsgaQU1fR1OV08ZJr1XZH2N5gy1N6zEd1kPgqTxIQb9mZdmzM26?=
 =?us-ascii?Q?EYvHgYOQnIojSUgZbxi6ly+dDDr03RRUNKtsSbZhNyVsYlMStz7vxG5K95JG?=
 =?us-ascii?Q?GMwikuiHr/6XnYdrQtDtGA2P24uD0lZkfl48IOpElIhpXcwVSs4Nn2gd3xtv?=
 =?us-ascii?Q?IUotX+77Wzpqru/YfsYyqxncWX76awkghsKP6ekRFzrlZnM3MB1S+3wiNj1R?=
 =?us-ascii?Q?30j2Wm7zDe+OUPRMJPhcVQ8/Hi8nYWEWrCvlRsA7?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 818634b5-35f6-4a48-ef09-08dc41bc6e5e
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2024 11:14:34.2881
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8NYbpR1uwtobhKYLxgST7xU5tJm1QcIniMBW0dMbiXOLtSHkpoMvsiEUBMHjm3zBIsL0qygPzklqDLl+JL/hvw==
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

Let imx-audio-rpmsg register platform device for card. So that card
register and unregister can be controlled by rpmsg driver's register
and unregister.

Signed-off-by: Chancel Liu <chancel.liu@nxp.com>
---
 sound/soc/fsl/fsl_rpmsg.c       | 11 -----------
 sound/soc/fsl/imx-audio-rpmsg.c | 17 ++++++++++++++++-
 2 files changed, 16 insertions(+), 12 deletions(-)

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
index 40820d5ad92d..38aafb8954c7 100644
--- a/sound/soc/fsl/imx-audio-rpmsg.c
+++ b/sound/soc/fsl/imx-audio-rpmsg.c
@@ -12,6 +12,7 @@
  */
 struct imx_audio_rpmsg {
 	struct platform_device *rpmsg_pdev;
+	struct platform_device *card_pdev;
 };
 
 static int imx_audio_rpmsg_cb(struct rpmsg_device *rpdev, void *data, int len,
@@ -95,6 +96,16 @@ static int imx_audio_rpmsg_probe(struct rpmsg_device *rpdev)
 		ret = PTR_ERR(data->rpmsg_pdev);
 	}
 
+	data->card_pdev = platform_device_register_data(&rpdev->dev,
+							"imx-audio-rpmsg",
+							PLATFORM_DEVID_AUTO,
+							rpdev->id.name,
+							strlen(rpdev->id.name) + 1);
+	if (IS_ERR(data->card_pdev)) {
+		dev_err(&rpdev->dev, "failed to register rpmsg card.\n");
+		ret = PTR_ERR(data->card_pdev);
+	}
+
 	return ret;
 }
 
@@ -105,6 +116,9 @@ static void imx_audio_rpmsg_remove(struct rpmsg_device *rpdev)
 	if (data->rpmsg_pdev)
 		platform_device_unregister(data->rpmsg_pdev);
 
+	if (data->card_pdev)
+		platform_device_unregister(data->card_pdev);
+
 	dev_info(&rpdev->dev, "audio rpmsg driver is removed\n");
 }
 
@@ -113,6 +127,7 @@ static struct rpmsg_device_id imx_audio_rpmsg_id_table[] = {
 	{ .name = "rpmsg-micfil-channel" },
 	{ },
 };
+MODULE_DEVICE_TABLE(rpmsg, imx_audio_rpmsg_id_table);
 
 static struct rpmsg_driver imx_audio_rpmsg_driver = {
 	.drv.name	= "imx_audio_rpmsg",
@@ -126,5 +141,5 @@ module_rpmsg_driver(imx_audio_rpmsg_driver);
 
 MODULE_DESCRIPTION("Freescale SoC Audio RPMSG interface");
 MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
-MODULE_ALIAS("platform:imx_audio_rpmsg");
+MODULE_ALIAS("rpmsg:imx_audio_rpmsg");
 MODULE_LICENSE("GPL v2");
-- 
2.43.0

