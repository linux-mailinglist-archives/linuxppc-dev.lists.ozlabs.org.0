Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0008F6EC3A8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 04:37:43 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q4TnK5JDNz3fCj
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Apr 2023 12:37:41 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DN8aWpht;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=renesas.com (client-ip=2a01:111:f403:700c::714; helo=jpn01-os0-obe.outbound.protection.outlook.com; envelope-from=kuninori.morimoto.gx@renesas.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.a=rsa-sha256 header.s=selector1 header.b=DN8aWpht;
	dkim-atps=neutral
Received: from JPN01-OS0-obe.outbound.protection.outlook.com (mail-os0jpn01on20714.outbound.protection.outlook.com [IPv6:2a01:111:f403:700c::714])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q4TmS6826z3cC1
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 24 Apr 2023 12:36:56 +1000 (AEST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e+NaNPnLTX0+UYrdIrvP9PsHk95ang3CyYbBHPwE4iTSZydG3jur0K6redF4YUCOrrfIzXE29G1YknzcdWxUPr689bpxDFS6IXMPi3QuRIEDo68vdU939lpQxTM2GFQbKuf10uOxdpjAhAYXezHOjhMfUQFhP75Q6cP3B40xqPUnnu/jTa9pMtSv8sXwr1Hj89z50kHGgI05WZx/ImQRTRwFa2kvMVBcu5I3pAdExopEI72hbGNYxt0DdIzEAaq9RnVkF/hppacShKElJhXY3bCm4iuBGqedx6STWZ+kUhgtdAxi1wEvpsjNOAwMG72ZD3IE9biLCbiPFOmWVjh/Xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kd2APHEbK+LWgfn/zoTh5Bk3d69NV1EG/b0RIT+4pU4=;
 b=I8QhHpsomWWNyFmD+pSbpHPd50D0Z8Cae1n+70iBF93q0pssVlNkc0ulf3OrGW9FWrS+6Nh7HlFMBwy//m5PSQdvAnT5ISOAsyfS2314fYS+gW4ASoyMRMH+gkLdKG6QxDZQ8hQLQAyNZ2PlxaZvQaRxmjqy8TUg2SYIN/X4NRbZDjDeOKP4A5VK4RbQbhZ10T9mS3aYZhRvHjykjaSgeN8vEiudmWw2hLYYP2tMLMFR3Rs3gcv0q4rWNdZ24etWyIfTv/Fd7UfOKlweZYB09pRKfkpP2Mo9EY9zd8jUfhQQc3cPjmLK/E4989xZP+6dzl2/7lplYZ9JO+5eOvXAIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kd2APHEbK+LWgfn/zoTh5Bk3d69NV1EG/b0RIT+4pU4=;
 b=DN8aWphtsVGgrDIbvLTrLF02kxTYeEjaJCMWe1vj6fiorT7qJ2JRhw4IqavruZOqW72OTNpJ3rPhrw4V0HFPhFgBP5SF/EIT5l+roD76DTxijqVtTHMy0ykUldO0Ey4yEIMsox/toWn85cDJoDuYQ5ovi0AmX5kJeNgSYUS56y4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com (2603:1096:604:194::10)
 by OS0PR01MB5681.jpnprd01.prod.outlook.com (2603:1096:604:b3::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Mon, 24 Apr
 2023 02:36:38 +0000
Received: from OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840]) by OS3PR01MB8426.jpnprd01.prod.outlook.com
 ([fe80::91e7:a94f:9f75:d840%5]) with mapi id 15.20.6319.022; Mon, 24 Apr 2023
 02:36:38 +0000
Message-ID: <874jp60zwq.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
To: Jaroslav Kysela <perex@perex.cz>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Takashi Iwai <tiwai@suse.com>, Xiubo Li <Xiubo.Lee@gmail.com>
In-Reply-To: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
References: <87bkje0zzf.wl-kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v2 05/13] ASoC: fsl: use asoc_dummy_dlc
User-Agent: Wanderlust/2.15.9 Emacs/27.1 Mule/6.0
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 24 Apr 2023 02:36:37 +0000
X-ClientProxiedBy: TY2PR0101CA0015.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::27) To OS3PR01MB8426.jpnprd01.prod.outlook.com
 (2603:1096:604:194::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OS3PR01MB8426:EE_|OS0PR01MB5681:EE_
X-MS-Office365-Filtering-Correlation-Id: f5a24478-0a88-4b2c-5ac4-08db446cbab5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 	s6pRuoXqhF2oYGgVk6xtfMC/pEDvXwo+9kl+WbB7/gg9S1sBidUYpoKxZ7P/5V0QHhFsCzvQ4cokGxw5ubJuBs3YkaXAmary4Gn0zIJYWTML5sSdW2TggKXxlN+WKM2xWNqlFCZVbXkrV6uwzAlU+7clwdLhNw8YhaCtPuLXVrdH+OATS/d3jOsEnD9Hqq9dItBIDWVltdndQuKuoBX95VCha80EwRzSlVRBf9G8yaxWxx3WuzsAPZtOuBCEAgkg3L4fwkY2fRgPMH3Fgs1sND7BCjpbg7sMG4GwaA4YcKjGUmgstZAwIGy2YwmYXj/3rDFNnCUxbIvW3zX1dHgQkfSV/vI4QudcC32B/+NnCUGfl38wPn3GsJ7pMxCht7F56Rvti/zM8N79wrzadoKzy8CWVTjAaNNPU6BiT8WC7WBOumH7JLsJhzSaYNFryLY7ya8likiYshPZAydnTMlfE2tl8iJWFZE4o4y4i2Oo8RPfbotC/OGgcWc8ofssTwEKKnST8P8H6/fNIxPIfT3UuSVNxmMg8s1oBMaGxKU3f63D/NJLOrI5xBpMBoMs5/zmHPH8lTwDhgS5xqnG5/3V0SW07ykM3K4BB327XCdfR3mZjSIr9WJBHBrpLKMz2nJ2
X-Forefront-Antispam-Report: 	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB8426.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(396003)(376002)(346002)(136003)(39860400002)(366004)(451199021)(2906002)(52116002)(6486002)(2616005)(6512007)(6506007)(26005)(186003)(66946007)(66556008)(66476007)(8676002)(8936002)(316002)(41300700001)(4326008)(478600001)(5660300002)(7416002)(54906003)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 	=?us-ascii?Q?c2UuVCoA5HeL/gip56zdAIfm7cpwyvpa+IrQBr3n1GCRrFsijT8isXjLIFkM?=
 =?us-ascii?Q?uf67ZGRnCDbBrjCQCUfTRB/P4kM8F7SbdGKOnOEhqjRuIWhu/1yaaSZiCYk7?=
 =?us-ascii?Q?r9Ep6jrFLGv5057hQIiMzrGCfl/wxwEtUkXm/j7RQ3ozNkwxogfT7p+tfpY9?=
 =?us-ascii?Q?TS+h7v5ZYhjD46lSN4f0FhzqN6XyAUMxYZFdM/1D7lmFZq7bLosSQOdmRqPK?=
 =?us-ascii?Q?GP3aZNQq2PDxxx6CtR6qxJ0fGGnJ5ad7uzYYkcrtxlx3lDy5RafwzqTUpk+o?=
 =?us-ascii?Q?WtyM56O/4oNNehXw6Xme5B4kuRqNQO07Ezh6O7UhEMuuJxuRWIjHuJHnWhzJ?=
 =?us-ascii?Q?jpzz92N5FzQp+yaLp+fFlE3viofEb6+2H/Hp/hM3l0UtTtLPfkEHSyirJQG5?=
 =?us-ascii?Q?gzTQmMSogv8dOU0IwQ+PJ4DaaL42q54TUqmsenjMbcsKjBDDey0Y7qiVYS4+?=
 =?us-ascii?Q?l5HessLq1VaVADP2Fn4UiAf/dAD9B7WgfTzMe2bXB4RSQLGOsL3SAxS4lol9?=
 =?us-ascii?Q?Rg0ryYuLWvBFvxaFtWzLs6N3rYQ2spyU/RPZ4E02rmR+IeYGgakbGPyyWZ1s?=
 =?us-ascii?Q?uwgoiu45BorXDEMsJpt5ED7ewtCUBR+FpTkONoc3z4xriZ84NPVvPEnueVon?=
 =?us-ascii?Q?AcGzq5j2WBWBGNQzJW3OPsrByZqGQPnhixMLwukKOzBvb0tAkfwspW8cugSp?=
 =?us-ascii?Q?t2FCsJ8NzOWLXuqeGw70tpbNmuXOY6kYKTyaatLSc06JRuycEzA83tPGYKPx?=
 =?us-ascii?Q?NPW49LdJJzB6a7aFoKnIWCuiSlKMZzdRJv9CwD3RpOV11NStT2Fe59UpP6vR?=
 =?us-ascii?Q?uDJO7yo3olxG1KCDtzFqUbOJlkJ/nsal1uI03CVXu1sgZ8JUXWFfXaV4lntq?=
 =?us-ascii?Q?0cPveum80djcXBo3sHlGWxEUIJxbQpNfXbAhy5GbMk63dQYHIg0ShE6VY5Yy?=
 =?us-ascii?Q?0ML5xc05h4IM2uihaFMbH+zAfyHLZ1ihbXVdfSnvN7Ux2NpzUKzia0QDYqKf?=
 =?us-ascii?Q?r8shHGYbUu5qH4UXn9VDRdisbbDVMYDYQzSPTvHsrCXelAHx/ughyuI3PScp?=
 =?us-ascii?Q?5h2N5/N64rR6agxhjHRSlrHoP4/5bJAIhkr9zScKdr4Sid2gYnvUx34xFFMI?=
 =?us-ascii?Q?iMLOPdI5jvmXH+xKM4BG1TRpTSplLfuIOYwZEnsGXqf1Shdff2s03LNA+cWt?=
 =?us-ascii?Q?cXhvIsf8qYKwAVrDBMFjK00Jhd9k5dSg3gxclW+RBOLCzeFpdtrDM2i2g8kv?=
 =?us-ascii?Q?FgRpBsf6VXlnqpDGN5m6Gd3/1rlJhjdvL4oZqAkMn/E1brszq9OZPqc/MMop?=
 =?us-ascii?Q?cYgCVlSNh76YR2uTYdh2nccNP4DHOlOy4wXNGR5k90KwsVyl63cb8E1zQeU1?=
 =?us-ascii?Q?i/s2/KH6ERpg6R7glCHQ/cnvKYPcN8v5zreeGJ5LHDseDEOScuP5tZiYesn/?=
 =?us-ascii?Q?aRjNVZ+JAR0BntONxTC2PQGgJiuP2TUHOKOOEaj/BH4nUUSsLmgm3Wk2kDHk?=
 =?us-ascii?Q?bgAn5McvCywMPoHVS5oUWzwINR5Xek+ineKhPVHqpshDyp+DpWehZVa4BHgK?=
 =?us-ascii?Q?tlqv7k9/qWxlMy98lutfnSwH+SdwFkVlw7LcADohRkvaA54cNAxuqQ7CHwoU?=
 =?us-ascii?Q?lAuHZ1GBmANf74iZxKWElhA=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5a24478-0a88-4b2c-5ac4-08db446cbab5
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB8426.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2023 02:36:38.5521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i5a+nrRfba1626Z8fFaua8J7lQFmkd2/yr/WMTWN2LBky5vQoia9v+Jgjg/XEFwT6AyUA8qaPi2QtdEim9FNCJBpAgFjnApNnltFwy+QrYqLm7jwRnL4uHbyZkfGsmDw
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS0PR01MB5681
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, Shengjiu Wang <shengjiu.wang@nxp.com>, Nicolin Chen <nicoleotsuka@gmail.com>, NXP Linux Team <linux-imx@nxp.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Now we can share asoc_dummy_dlc. This patch use it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
---
 sound/soc/fsl/imx-audmix.c | 14 +++++---------
 sound/soc/fsl/imx-card.c   | 11 +----------
 sound/soc/fsl/imx-rpmsg.c  |  3 +--
 sound/soc/fsl/imx-spdif.c  |  8 +++-----
 4 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index b2c5aca92c6b..efbcd4a65ca8 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 2, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -244,7 +244,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		 */
 		priv->dai[i].cpus	=
 		priv->dai[i].platforms	= &dlc[0];
-		priv->dai[i].codecs	= &dlc[1];
+		priv->dai[i].codecs	= &asoc_dummy_dlc;
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
@@ -252,8 +252,6 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
-		priv->dai[i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
 		priv->dai[i].dynamic = 1;
@@ -270,15 +268,13 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus	= &dlc[2];
-		priv->dai[num_dai + i].codecs	= &dlc[3];
+		priv->dai[num_dai + i].cpus	= &dlc[1];
+		priv->dai[num_dai + i].codecs	= &asoc_dummy_dlc;
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
 
 		priv->dai[num_dai + i].name = be_name;
-		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
-		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
 		priv->dai[num_dai + i].no_pcm = 1;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index 64a4d7e9db60..78e2e3932ba5 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -615,17 +615,8 @@ static int imx_card_parse_of(struct imx_card_data *data)
 				plat_data->type = CODEC_AK5552;
 
 		} else {
-			dlc = devm_kzalloc(dev, sizeof(*dlc), GFP_KERNEL);
-			if (!dlc) {
-				ret = -ENOMEM;
-				goto err;
-			}
-
-			link->codecs	 = dlc;
+			link->codecs	 = &asoc_dummy_dlc;
 			link->num_codecs = 1;
-
-			link->codecs->dai_name = "snd-soc-dummy-dai";
-			link->codecs->name = "snd-soc-dummy";
 		}
 
 		if (!strncmp(link->name, "HiFi-ASRC-FE", 12)) {
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 89178106fe2c..93fc976e98dc 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -92,8 +92,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	/* Optional codec node */
 	ret = of_parse_phandle_with_fixed_args(np, "audio-codec", 0, 0, &args);
 	if (ret) {
-		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-		data->dai.codecs->name = "snd-soc-dummy";
+		*data->dai.codecs = asoc_dummy_dlc;
 	} else {
 		struct clk *clk;
 
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index ab978431ac98..44463f92e522 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,7 +26,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
@@ -37,8 +37,8 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	 * platform is using soc-generic-dmaengine-pcm
 	 */
 	data->dai.cpus		=
-	data->dai.platforms	= &comp[0];
-	data->dai.codecs	= &comp[1];
+	data->dai.platforms	= comp;
+	data->dai.codecs	= &asoc_dummy_dlc;
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
@@ -46,8 +46,6 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
-	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
-	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
-- 
2.25.1

