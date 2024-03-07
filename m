Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BF3874909
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 08:48:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jfkklg15;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tr1d16xJgz3vpG
	for <lists+linuxppc-dev@lfdr.de>; Thu,  7 Mar 2024 18:48:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.a=rsa-sha256 header.s=selector2 header.b=jfkklg15;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=permerror (SPF Permanent Error: Void lookup limit of 2 exceeded) smtp.mailfrom=nxp.com (client-ip=2a01:111:f403:260f::601; helo=eur04-he1-obe.outbound.protection.outlook.com; envelope-from=chancel.liu@nxp.com; receiver=lists.ozlabs.org)
Received: from EUR04-HE1-obe.outbound.protection.outlook.com (mail-he1eur04on20601.outbound.protection.outlook.com [IPv6:2a01:111:f403:260f::601])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tr1Yt0HWgz3dgN
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  7 Mar 2024 18:45:38 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqjjAK1JBSA0GAaEYjpx+YxzOW62YpnGVJBNDn6Ohf+m7bfqgYmUzP441EyBSI43G9PM/y/bfEbSLkGWqPxMcROwayJ31Ev8I9C0VvBYU/vM7t4wIB03zzKsnTKAaD+uO1Qw0LS4wN3eWp/DOto7q7UtZba1a/YOldfXjuz9qdPYsHlVOxcZXvHATOVxUFpAepuibiD1puoqZ7NhPPbk+gmIN4aSNBrTG0EzdZcO0Sk4GwVEipn87X368kMTxDGkP8HsD4AOKGl9nCq8FEAWKNyl5HsXV3SJsLchhekTuqwKgzHY1VnxearewXv4l0SNeCwijNufqPowGCYNdMMNFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aZiJj3fsB+O1feVfob5RoaOIMXTf33VgcwdmeMj53/8=;
 b=X++ePnxiuHebSPEuB4Wkm/DBdDDQAXO3vRDtmispgZsl1m1r/qXTbsaaVkX8R4ZmI1panUxSKv6yD9jd5fsNWoj+dkJ87iKK80ot7AFoWnbZVzjzG2Oa4l5PNSc9Zh281vhmSiVfvNVQyTPcEGFxH5u4miK4OpFWxbCr/cjpPzzja/wcfMe1MISOMKxhdKm+z1sB2S9G+2kI1sNBDN8T4eM0ig1R1YoDLQIY1H/e+8LOp3ZKnlN3bYThZb45OcyKRsbjA4eVsSkZNoijPeqMHDBtqNuvb7knBmgPl6yPwc6oILr+VgKTObOeJvUin937yt8i+foS1HZy55hybBF9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aZiJj3fsB+O1feVfob5RoaOIMXTf33VgcwdmeMj53/8=;
 b=jfkklg15+TlqaM5hQbjowyYLNWus1nNjq1oC0ZrI06IuZYl7CVyVv5SRO8iFt+4/gYpWx5xd1vHi2WLmqYmp47FezU/qUDWBtrv0+cPlqSTnBymG2hUg9EFh0MBktRxqYrTS9ZinWNA65T+AqS4gUhvbNMwsnEChHNZSSBHioYc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com (2603:10a6:10:360::21)
 by DB9PR04MB9789.eurprd04.prod.outlook.com (2603:10a6:10:4ed::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.26; Thu, 7 Mar
 2024 07:45:23 +0000
Received: from DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01]) by DB9PR04MB9498.eurprd04.prod.outlook.com
 ([fe80::4bee:acb0:401a:3a01%7]) with mapi id 15.20.7362.024; Thu, 7 Mar 2024
 07:45:23 +0000
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
Subject: [PATCH v2 3/4] ASoC: fsl: Let imx-audio-rpmsg register platform device for card
Date: Thu,  7 Mar 2024 16:44:36 +0900
Message-ID: <20240307074437.1472593-4-chancel.liu@nxp.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240307074437.1472593-1-chancel.liu@nxp.com>
References: <20240307074437.1472593-1-chancel.liu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To DB9PR04MB9498.eurprd04.prod.outlook.com
 (2603:10a6:10:360::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB9498:EE_|DB9PR04MB9789:EE_
X-MS-Office365-Filtering-Correlation-Id: f0ecbf9d-514e-493d-6ecb-08dc3e7a8b97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	pWcnNUqzcq4SnESXhzNeFuVqofqrp/GZR+YML/h8LwGo6qHbxzu6JA9AKRZ4S/Irt09E3X/Eu//VitWVo++AcxB6F4SJJ7UZ39ldVommbGgxU0ASFJU6xaVzAHc0o0tpFQM3v+ptbD5hZk2597H9Csm4evkYR62gNiMjwLHHKYlrde8MmaWL/CGzq0lrFj6phy7rYx2BDzjIWjDuOOVBGxUU6DuTGmaSX68aEKsdCTDiDuykT4K7mU4AAI0RlQ17IMsKSd41DEoI2V66wTdjajFEufD614cBrCj0Y16YV6oMe4K8Jjo4r09ymc1nyuK+6G8QV/qwZ3gHjJVNPv3sZmsRcAey9hVr6+KoKdW915D85lU5oFUTCXehjv6s4TGsLk2C4uMhYyomJHnJAI1JxiLatvyl3daDNCHymAsaHljb2SxbL7+MWrQIpMLCxuEQp+oRFykLLmLc628cx6yML0Wdydg75FOl8K7hhrIdc0IiPwIZGka6H2NEsbxyJkPqOg9bAN3TbT/okBAiNANSx5z8TJH7SgywHNSVGzHajdCxk7N5wLfkPW9bIPQFeuPfDExNGH4fheeIc06Dlfpc4QcVATIYHSUaDY1YeN7ofYKyQ1DC9vvhdSE2RWkXWSbz3G5UPEGNbH7w15R/Drhlq4PjqRK7mynsko6AwuhE/PEjQLFvg8LBnSyDbXZSYRhHnw+3NzenA304YqmjUmC4DSULDDnw3mWaRywyyRXh9f0=
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB9498.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(921011)(38350700005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?vQOxgWPFUzUHuFlnq+UbZyZrqCCLNVpXQbaYw22ppExgN1T+JEII0dlEr96l?=
 =?us-ascii?Q?VF0Q383A2I8e+E7fb+hKbiVaPr8B3ZgOR2eutO4LQ1LZNlnk4BybrPvkj7yC?=
 =?us-ascii?Q?yqwc5RSt5Ew6YLiO14v0dC7+X0Ee/vhH+trWk4aqfLRn3DiY7unkLJPnMT7G?=
 =?us-ascii?Q?AglN+a8FgCX4xVxw/SMSqb77nhB0nhh0LBGMGKKZPJgSRJWxMi2x1su07tpW?=
 =?us-ascii?Q?fmQrXMglw6SmDftRlYjZAvjYLagi9DHYwn3la5kxynivzfhaUGYDhVY0izWm?=
 =?us-ascii?Q?NI1laIYvlprSVmoROLPXOC0UYXArTw18qvoQoJyZY+pz07/wv00W2PvYV+fT?=
 =?us-ascii?Q?Xw10l+zB+JElVggs8vRPjjgz59BaJx7t0nE/R4wHWtarxeVpUIfpjM/a9APM?=
 =?us-ascii?Q?kx4FWGoZLikRapY6ievUGkG1/kNAJOMIO+UCvl/RL/NKxWsZn6ij3SzJ1JiG?=
 =?us-ascii?Q?MMxZSg8emGTjuwHFoQQVNLkaroidprVuYeWbyaosdTJb79rmbA7VY0SdwZVT?=
 =?us-ascii?Q?V4kNSnSkFTHB1yb5qKUhKqSZi+y9QQ9Ox8hZ+tegg+sMb8zz4kK55UXFJji/?=
 =?us-ascii?Q?HzDG7vnkq5y3QZ3ENoQa6Y5/XtJZqLYZ4n/fRvfZa30APicY1fnzY/WqwPxy?=
 =?us-ascii?Q?Ig2AamZ+UPUpdVZ1AMbGcMgEKZuqP008vUxhtfxwTHWkSVTAuQk1JzQakn9Z?=
 =?us-ascii?Q?ZaKWo8SxzAULC0amwUL+iljaoB5A/1kaax7snbx/ctU1YM82106qVs072gxj?=
 =?us-ascii?Q?j9zmg7YR7y0cOuMr++oZqWMP8KWRT636fJV0q4XJzmscAnx91zNyV5yDkdf3?=
 =?us-ascii?Q?VY9wQT3wqyN3+qmN+Ib5ysq6NqmSeST6NtYuehTmGfIpVy2OUeVT7vFtoATM?=
 =?us-ascii?Q?wLjG0pXKOU34VZh70Nz+RJSNbBhre1lx4Mn6lMyLc0Uk8SQ4mAFUZNZeOJOg?=
 =?us-ascii?Q?jGRA07m2c4rM2k+a+wR+v32y5flAxbxswC1U0w1xVcGq3QG6zlpWgu8u1tpg?=
 =?us-ascii?Q?ghPw91jy4lUWN0KIa99HEAn2q60tJXGjduPTOsYLkshu0Zii6OIxlynE8xoy?=
 =?us-ascii?Q?T7Rh0iUJjMkngWOB6J4iF5wn8a9nE0wCoast1KrKMgSlG9fHmmPx12dUqe2t?=
 =?us-ascii?Q?60uGHqC8UCAvfIy/HMRtutfUO2dl2VN2j6N4v1ozK1CvOdwU0oXSfZdgEN+/?=
 =?us-ascii?Q?QiMeHQwDcbkChRyN2t0S5QA9XFJnEi2ocgBoalLUTLGxukRHCyddS2TcBGFm?=
 =?us-ascii?Q?MWq3nt9Qh0TkLnTfGbiyFLSxQzS00gmJWqDA0wHEYYnIrMex4iBJJDDJpQ7h?=
 =?us-ascii?Q?z+NHdgt3SDly2kUmLjoFWn1XvMcYtWS+OtEfkrdeQDbYnIbz1mWKni0EFi9+?=
 =?us-ascii?Q?04TgsXGl5Yh/WQIFKHpdmnylxMUPG4e3qfAMmMNq3kc6irCoXLbz3cAaKTvR?=
 =?us-ascii?Q?L3n8al4kdQg/vpY1XeuQwcGO8NMPEJve50IWuElj0m8R7j1y9bY5rA9swNmj?=
 =?us-ascii?Q?mnw4TJzqPJztYfa4kJGXAAG4PNxWkD9D9qwLdxVss+FIa/BZG5Mko2vSKFrj?=
 =?us-ascii?Q?kQtuiMUohYKjCt6YSg6ApP+zuQBOAO91JM4uC5Oj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0ecbf9d-514e-493d-6ecb-08dc3e7a8b97
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB9498.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2024 07:45:23.0398
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGMT21PAjoFlZ4KvMAYDcVCsFGFKBpS1kxem+oDqsLZQJdA1U2aP1kLjxqcpJ3c025j9wRjHG53WIWNHPGS8XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB9789
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
index 40820d5ad92d..60f27b0a2530 100644
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
+							strlen(rpdev->id.name));
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

