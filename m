Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3726E78AF
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 13:32:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q1dtl3XLzz3g9L
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Apr 2023 21:32:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
X-Greylist: delayed 551 seconds by postgrey-1.36 at boromir; Wed, 19 Apr 2023 21:08:04 AEST
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q1dLX4cnwz3fj2
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 19 Apr 2023 21:08:04 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 7ACAD1A11F6;
	Wed, 19 Apr 2023 12:58:49 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 168121A0F1F;
	Wed, 19 Apr 2023 12:58:49 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 1F73D1800254;
	Wed, 19 Apr 2023 18:58:47 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: kuninori.morimoto.gx@renesas.com,
	shengjiu.wang@gmail.com,
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
	alsa-devel@alsa-project.org
Subject: [PATCH] Revert "ASoC: fsl: remove unnecessary dai_link->platform"
Date: Wed, 19 Apr 2023 18:29:18 +0800
Message-Id: <1681900158-17428-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

This reverts commit 33683cbf49b5412061cb1e4c876063fdef86def4.

dai_link->platform is needed. The platform component is
"snd_dmaengine_pcm", which is registered from cpu driver,

If dai_link->platform is not assigned, then platform
component will not be probed, then there will be issue:

aplay: main:831: audio open error: Invalid argument

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-audmix.c | 14 ++++++++++----
 sound/soc/fsl/imx-spdif.c  |  5 ++++-
 2 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index 2c57fe9d2d08..1292a845c424 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -207,8 +207,8 @@ static int imx_audmix_probe(struct platform_device *pdev)
 	for (i = 0; i < num_dai; i++) {
 		struct snd_soc_dai_link_component *dlc;
 
-		/* for CPU/Codec x 2 */
-		dlc = devm_kcalloc(&pdev->dev, 4, sizeof(*dlc), GFP_KERNEL);
+		/* for CPU/Codec/Platform x 2 */
+		dlc = devm_kcalloc(&pdev->dev, 6, sizeof(*dlc), GFP_KERNEL);
 		if (!dlc)
 			return -ENOMEM;
 
@@ -240,9 +240,11 @@ static int imx_audmix_probe(struct platform_device *pdev)
 
 		priv->dai[i].cpus = &dlc[0];
 		priv->dai[i].codecs = &dlc[1];
+		priv->dai[i].platforms = &dlc[2];
 
 		priv->dai[i].num_cpus = 1;
 		priv->dai[i].num_codecs = 1;
+		priv->dai[i].num_platforms = 1;
 
 		priv->dai[i].name = dai_name;
 		priv->dai[i].stream_name = "HiFi-AUDMIX-FE";
@@ -250,6 +252,7 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		priv->dai[i].codecs->name = "snd-soc-dummy";
 		priv->dai[i].cpus->of_node = args.np;
 		priv->dai[i].cpus->dai_name = dev_name(&cpu_pdev->dev);
+		priv->dai[i].platforms->of_node = args.np;
 		priv->dai[i].dynamic = 1;
 		priv->dai[i].dpcm_playback = 1;
 		priv->dai[i].dpcm_capture = (i == 0 ? 1 : 0);
@@ -264,17 +267,20 @@ static int imx_audmix_probe(struct platform_device *pdev)
 		be_cp = devm_kasprintf(&pdev->dev, GFP_KERNEL,
 				       "AUDMIX-Capture-%d", i);
 
-		priv->dai[num_dai + i].cpus = &dlc[2];
-		priv->dai[num_dai + i].codecs = &dlc[3];
+		priv->dai[num_dai + i].cpus = &dlc[3];
+		priv->dai[num_dai + i].codecs = &dlc[4];
+		priv->dai[num_dai + i].platforms = &dlc[5];
 
 		priv->dai[num_dai + i].num_cpus = 1;
 		priv->dai[num_dai + i].num_codecs = 1;
+		priv->dai[num_dai + i].num_platforms = 1;
 
 		priv->dai[num_dai + i].name = be_name;
 		priv->dai[num_dai + i].codecs->dai_name = "snd-soc-dummy-dai";
 		priv->dai[num_dai + i].codecs->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].cpus->of_node = audmix_np;
 		priv->dai[num_dai + i].cpus->dai_name = be_name;
+		priv->dai[num_dai + i].platforms->name = "snd-soc-dummy";
 		priv->dai[num_dai + i].no_pcm = 1;
 		priv->dai[num_dai + i].dpcm_playback = 1;
 		priv->dai[num_dai + i].dpcm_capture  = 1;
diff --git a/sound/soc/fsl/imx-spdif.c b/sound/soc/fsl/imx-spdif.c
index 114b49660193..4446fba755b9 100644
--- a/sound/soc/fsl/imx-spdif.c
+++ b/sound/soc/fsl/imx-spdif.c
@@ -26,7 +26,7 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 	}
 
 	data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
-	comp = devm_kzalloc(&pdev->dev, 2 * sizeof(*comp), GFP_KERNEL);
+	comp = devm_kzalloc(&pdev->dev, 3 * sizeof(*comp), GFP_KERNEL);
 	if (!data || !comp) {
 		ret = -ENOMEM;
 		goto end;
@@ -34,15 +34,18 @@ static int imx_spdif_audio_probe(struct platform_device *pdev)
 
 	data->dai.cpus		= &comp[0];
 	data->dai.codecs	= &comp[1];
+	data->dai.platforms	= &comp[2];
 
 	data->dai.num_cpus	= 1;
 	data->dai.num_codecs	= 1;
+	data->dai.num_platforms	= 1;
 
 	data->dai.name = "S/PDIF PCM";
 	data->dai.stream_name = "S/PDIF PCM";
 	data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 	data->dai.codecs->name = "snd-soc-dummy";
 	data->dai.cpus->of_node = spdif_np;
+	data->dai.platforms->of_node = spdif_np;
 	data->dai.playback_only = true;
 	data->dai.capture_only = true;
 
-- 
2.34.1

