Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 812413F9441
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 08:23:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GwqR632JZz2ynV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Aug 2021 16:23:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GwqQh3Crkz2yJ6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Aug 2021 16:23:07 +1000 (AEST)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 55FD1200FE7;
 Fri, 27 Aug 2021 08:23:04 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id DBF18200E4B;
 Fri, 27 Aug 2021 08:23:03 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 6E4D8183AC8B;
 Fri, 27 Aug 2021 14:23:02 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH v2] ASoC: fsl_rpmsg: add soc specific data structure
Date: Fri, 27 Aug 2021 14:00:38 +0800
Message-Id: <1630044038-19036-1-git-send-email-shengjiu.wang@nxp.com>
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
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Each platform has different supported rates and
formats, so add soc specific data for each platform.
This soc specific data is attached with compatible string.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Fabio Estevam <festevam@gmail.com>
---
changes in v2:
- remove checking rpmsg->soc_data is NULL
- add Reviewed-by Fabio

 sound/soc/fsl/fsl_rpmsg.c | 46 +++++++++++++++++++++++++++++++++++----
 sound/soc/fsl/fsl_rpmsg.h | 12 ++++++++++
 2 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index d60f4dac6c1b..07abad7fe372 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -138,11 +138,42 @@ static const struct snd_soc_component_driver fsl_component = {
 	.name           = "fsl-rpmsg",
 };
 
+static const struct fsl_rpmsg_soc_data imx7ulp_data = {
+	.rates = SNDRV_PCM_RATE_8000 | SNDRV_PCM_RATE_16000 |
+		 SNDRV_PCM_RATE_48000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mm_data = {
+	.rates = SNDRV_PCM_RATE_KNOT,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE | SNDRV_PCM_FMTBIT_DSD_U8 |
+		   SNDRV_PCM_FMTBIT_DSD_U16_LE | SNDRV_PCM_FMTBIT_DSD_U32_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mn_data = {
+	.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+		 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
+		 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |
+		 SNDRV_PCM_RATE_192000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
+static const struct fsl_rpmsg_soc_data imx8mp_data = {
+	.rates = SNDRV_PCM_RATE_32000 | SNDRV_PCM_RATE_44100 |
+		 SNDRV_PCM_RATE_48000 | SNDRV_PCM_RATE_88200 |
+		 SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_176400 |
+		 SNDRV_PCM_RATE_192000,
+	.formats = SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE |
+		   SNDRV_PCM_FMTBIT_S32_LE,
+};
+
 static const struct of_device_id fsl_rpmsg_ids[] = {
-	{ .compatible = "fsl,imx7ulp-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mm-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mn-rpmsg-audio"},
-	{ .compatible = "fsl,imx8mp-rpmsg-audio"},
+	{ .compatible = "fsl,imx7ulp-rpmsg-audio", .data = &imx7ulp_data},
+	{ .compatible = "fsl,imx8mm-rpmsg-audio", .data = &imx8mm_data},
+	{ .compatible = "fsl,imx8mn-rpmsg-audio", .data = &imx8mn_data},
+	{ .compatible = "fsl,imx8mp-rpmsg-audio", .data = &imx8mp_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_rpmsg_ids);
@@ -157,6 +188,13 @@ static int fsl_rpmsg_probe(struct platform_device *pdev)
 	if (!rpmsg)
 		return -ENOMEM;
 
+	rpmsg->soc_data = of_device_get_match_data(&pdev->dev);
+
+	fsl_rpmsg_dai.playback.rates = rpmsg->soc_data->rates;
+	fsl_rpmsg_dai.capture.rates = rpmsg->soc_data->rates;
+	fsl_rpmsg_dai.playback.formats = rpmsg->soc_data->formats;
+	fsl_rpmsg_dai.capture.formats = rpmsg->soc_data->formats;
+
 	if (of_property_read_bool(np, "fsl,enable-lpa")) {
 		rpmsg->enable_lpa = 1;
 		rpmsg->buffer_size = LPA_LARGE_BUFFER_SIZE;
diff --git a/sound/soc/fsl/fsl_rpmsg.h b/sound/soc/fsl/fsl_rpmsg.h
index 4f5b49eb18d8..b04086fbf828 100644
--- a/sound/soc/fsl/fsl_rpmsg.h
+++ b/sound/soc/fsl/fsl_rpmsg.h
@@ -6,6 +6,16 @@
 #ifndef __FSL_RPMSG_H
 #define __FSL_RPMSG_H
 
+/*
+ * struct fsl_rpmsg_soc_data
+ * @rates: supported rates
+ * @formats: supported formats
+ */
+struct fsl_rpmsg_soc_data {
+	int rates;
+	u64 formats;
+};
+
 /*
  * struct fsl_rpmsg - rpmsg private data
  *
@@ -15,6 +25,7 @@
  * @pll8k: parent clock for multiple of 8kHz frequency
  * @pll11k: parent clock for multiple of 11kHz frequency
  * @card_pdev: Platform_device pointer to register a sound card
+ * @soc_data: soc specific data
  * @mclk_streams: Active streams that are using baudclk
  * @force_lpa: force enable low power audio routine if condition satisfy
  * @enable_lpa: enable low power audio routine according to dts setting
@@ -27,6 +38,7 @@ struct fsl_rpmsg {
 	struct clk *pll8k;
 	struct clk *pll11k;
 	struct platform_device *card_pdev;
+	const struct fsl_rpmsg_soc_data *soc_data;
 	unsigned int mclk_streams;
 	int force_lpa;
 	int enable_lpa;
-- 
2.17.1

