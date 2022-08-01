Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id ED383586B04
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 14:43:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LxHpW6V1Cz3c9L
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Aug 2022 22:42:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.21; helo=inva021.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LxHp717Gkz2xG5
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Aug 2022 22:42:37 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0228A20148F;
	Mon,  1 Aug 2022 14:42:34 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id BEB9220130A;
	Mon,  1 Aug 2022 14:42:33 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 4C22A180031C;
	Mon,  1 Aug 2022 20:42:32 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: imx-rpmsg: Support configure sysclk for codec dai
Date: Mon,  1 Aug 2022 20:26:13 +0800
Message-Id: <1659356773-8315-1-git-send-email-shengjiu.wang@nxp.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Some codecs need to configure the sysclk even with slave
mode, otherwise it may not work properly with some case.

wm8960 is the one that need sysclk be configured, so add
late_probe() to call the snd_soc_dai_set_sysclk() of codec

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/imx-rpmsg.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index 2e117311e582..bef4bd997c98 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -19,6 +19,7 @@
 struct imx_rpmsg {
 	struct snd_soc_dai_link dai;
 	struct snd_soc_card card;
+	unsigned int sysclk;
 };
 
 static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
@@ -28,6 +29,27 @@ static const struct snd_soc_dapm_widget imx_rpmsg_dapm_widgets[] = {
 	SND_SOC_DAPM_MIC("Main MIC", NULL),
 };
 
+static int imx_rpmsg_late_probe(struct snd_soc_card *card)
+{
+	struct imx_rpmsg *data = snd_soc_card_get_drvdata(card);
+	struct snd_soc_pcm_runtime *rtd = list_first_entry(&card->rtd_list,
+							   struct snd_soc_pcm_runtime, list);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+	struct device *dev = card->dev;
+	int ret;
+
+	if (!data->sysclk)
+		return 0;
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, data->sysclk, SND_SOC_CLOCK_IN);
+	if (ret && ret != -ENOTSUPP) {
+		dev_err(dev, "failed to set sysclk in %s\n", __func__);
+		return ret;
+	}
+
+	return 0;
+}
+
 static int imx_rpmsg_probe(struct platform_device *pdev)
 {
 	struct snd_soc_dai_link_component *dlc;
@@ -72,12 +94,18 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 		data->dai.codecs->dai_name = "snd-soc-dummy-dai";
 		data->dai.codecs->name = "snd-soc-dummy";
 	} else {
+		struct clk *clk;
+
 		data->dai.codecs->of_node = args.np;
 		ret = snd_soc_get_dai_name(&args, &data->dai.codecs->dai_name);
 		if (ret) {
 			dev_err(&pdev->dev, "Unable to get codec_dai_name\n");
 			goto fail;
 		}
+
+		clk = devm_get_clk_from_child(&pdev->dev, args.np, NULL);
+		if (!IS_ERR(clk))
+			data->sysclk = clk_get_rate(clk);
 	}
 
 	data->dai.cpus->dai_name = dev_name(&rpmsg_pdev->dev);
@@ -103,6 +131,7 @@ static int imx_rpmsg_probe(struct platform_device *pdev)
 	data->card.owner = THIS_MODULE;
 	data->card.dapm_widgets = imx_rpmsg_dapm_widgets;
 	data->card.num_dapm_widgets = ARRAY_SIZE(imx_rpmsg_dapm_widgets);
+	data->card.late_probe = imx_rpmsg_late_probe;
 	/*
 	 * Inoder to use common api to get card name and audio routing.
 	 * Use parent of_node for this device, revert it after finishing using
-- 
2.34.1

