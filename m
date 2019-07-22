Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 067CE70092
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 15:10:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45shm635jDzDqGg
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Jul 2019 23:09:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=daniel.baluta@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
X-Greylist: delayed 492 seconds by postgrey-1.36 at bilbo;
 Mon, 22 Jul 2019 22:57:06 AEST
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45shTG23QpzDq5b
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 22 Jul 2019 22:57:05 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1E0291A00DB;
 Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com
 [134.27.226.22])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1058B1A00AA;
 Mon, 22 Jul 2019 14:48:49 +0200 (CEST)
Received: from fsr-ub1864-103.ea.freescale.net
 (fsr-ub1864-103.ea.freescale.net [10.171.82.17])
 by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 60ADD205DB;
 Mon, 22 Jul 2019 14:48:48 +0200 (CEST)
From: Daniel Baluta <daniel.baluta@nxp.com>
To: broonie@kernel.org
Subject: [PATCH 01/10] ASoC: fsl_sai: add of_match data
Date: Mon, 22 Jul 2019 15:48:24 +0300
Message-Id: <20190722124833.28757-2-daniel.baluta@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190722124833.28757-1-daniel.baluta@nxp.com>
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
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
Cc: alsa-devel@alsa-project.org, viorel.suman@nxp.com, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, shengjiu.wang@nxp.com,
 angus@akkea.ca, tiwai@suse.com, perex@perex.cz, nicoleotsuka@gmail.com,
 linux-imx@nxp.com, kernel@pengutronix.de, festevam@gmail.com,
 linux-kernel@vger.kernel.org, l.stach@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

From: Lucas Stach <l.stach@pengutronix.de>

New revisions of the SAI IP block have even more differences that need
be taken into account by the driver. To avoid sprinking compatible
checks all over the driver move the current differences into of_match_data.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 22 ++++++++++++++--------
 sound/soc/fsl/fsl_sai.h |  6 +++++-
 2 files changed, 19 insertions(+), 9 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d58cc3ae90d8..ed0432e7327a 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -9,6 +9,7 @@
 #include <linux/dmaengine.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
+#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
@@ -788,10 +789,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	sai->pdev = pdev;
-
-	if (of_device_is_compatible(np, "fsl,imx6sx-sai") ||
-	    of_device_is_compatible(np, "fsl,imx6ul-sai"))
-		sai->sai_on_imx = true;
+	sai->soc_data = of_device_get_match_data(&pdev->dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
@@ -900,7 +898,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	if (sai->sai_on_imx)
+	if (sai->soc_data->use_imx_pcm)
 		return imx_pcm_dma_init(pdev, IMX_SAI_DMABUF_SIZE);
 	else
 		return devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
@@ -913,10 +911,18 @@ static int fsl_sai_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct fsl_sai_soc_data fsl_sai_vf610_data = {
+	.use_imx_pcm = false,
+};
+
+static const struct fsl_sai_soc_data fsl_sai_imx6sx_data = {
+	.use_imx_pcm = true,
+};
+
 static const struct of_device_id fsl_sai_ids[] = {
-	{ .compatible = "fsl,vf610-sai", },
-	{ .compatible = "fsl,imx6sx-sai", },
-	{ .compatible = "fsl,imx6ul-sai", },
+	{ .compatible = "fsl,vf610-sai", .data = &fsl_sai_vf610_data },
+	{ .compatible = "fsl,imx6sx-sai", .data = &fsl_sai_imx6sx_data },
+	{ .compatible = "fsl,imx6ul-sai", .data = &fsl_sai_imx6sx_data },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, fsl_sai_ids);
diff --git a/sound/soc/fsl/fsl_sai.h b/sound/soc/fsl/fsl_sai.h
index 24cb156bf995..83e2bfe05b1b 100644
--- a/sound/soc/fsl/fsl_sai.h
+++ b/sound/soc/fsl/fsl_sai.h
@@ -126,6 +126,10 @@
 #define FSL_SAI_MAXBURST_TX 6
 #define FSL_SAI_MAXBURST_RX 6
 
+struct fsl_sai_soc_data {
+	bool use_imx_pcm;
+};
+
 struct fsl_sai {
 	struct platform_device *pdev;
 	struct regmap *regmap;
@@ -135,7 +139,6 @@ struct fsl_sai {
 	bool is_slave_mode;
 	bool is_lsb_first;
 	bool is_dsp_mode;
-	bool sai_on_imx;
 	bool synchronous[2];
 
 	unsigned int mclk_id[2];
@@ -143,6 +146,7 @@ struct fsl_sai {
 	unsigned int slots;
 	unsigned int slot_width;
 
+	const struct fsl_sai_soc_data *soc_data;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct snd_dmaengine_dai_dma_data dma_params_tx;
 };
-- 
2.17.1

