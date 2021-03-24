Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C743734759D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 11:14:36 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F53xk5p2sz3d7f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:14:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F53w4020hz2xyB
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 21:13:06 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B17DB202743;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A7526202740;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 63D8040341;
 Wed, 24 Mar 2021 11:12:36 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 6/6] ASoC: fsl_micfil: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:48 +0800
Message-Id: <1616579928-22428-7-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
References: <1616579928-22428-1-git-send-email-shengjiu.wang@nxp.com>
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

When there is power domain bind with ipg_clk clock,

The call flow:
devm_regmap_init_mmio_clk
   - clk_prepare()
      - clk_pm_runtime_get()

cause the power domain of clock always be enabled after
regmap_init(). which impact the power consumption.

So use devm_regmap_init_mmio instead of
devm_regmap_init_mmio_clk,but explicitly enable
clock when it is used.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Reviewed-by: Viorel Suman <viorel.suman@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 25 ++++++++++++++++++++-----
 1 file changed, 20 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 2b9edd4bb94d..3cf789ed6cbe 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -31,6 +31,7 @@ struct fsl_micfil {
 	struct platform_device *pdev;
 	struct regmap *regmap;
 	const struct fsl_micfil_soc_data *soc;
+	struct clk *busclk;
 	struct clk *mclk;
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	unsigned int dataline;
@@ -660,16 +661,22 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 		return PTR_ERR(micfil->mclk);
 	}
 
+	micfil->busclk = devm_clk_get(&pdev->dev, "ipg_clk");
+	if (IS_ERR(micfil->busclk)) {
+		dev_err(&pdev->dev, "failed to get ipg clock: %ld\n",
+			PTR_ERR(micfil->busclk));
+		return PTR_ERR(micfil->busclk);
+	}
+
 	/* init regmap */
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	regs = devm_ioremap_resource(&pdev->dev, res);
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	micfil->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
-						   "ipg_clk",
-						   regs,
-						   &fsl_micfil_regmap_config);
+	micfil->regmap = devm_regmap_init_mmio(&pdev->dev,
+					       regs,
+					       &fsl_micfil_regmap_config);
 	if (IS_ERR(micfil->regmap)) {
 		dev_err(&pdev->dev, "failed to init MICFIL regmap: %ld\n",
 			PTR_ERR(micfil->regmap));
@@ -729,6 +736,7 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, micfil);
 
 	pm_runtime_enable(&pdev->dev);
+	regcache_cache_only(micfil->regmap, true);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_micfil_component,
 					      &fsl_micfil_dai, 1);
@@ -752,6 +760,7 @@ static int __maybe_unused fsl_micfil_runtime_suspend(struct device *dev)
 	regcache_cache_only(micfil->regmap, true);
 
 	clk_disable_unprepare(micfil->mclk);
+	clk_disable_unprepare(micfil->busclk);
 
 	return 0;
 }
@@ -761,10 +770,16 @@ static int __maybe_unused fsl_micfil_runtime_resume(struct device *dev)
 	struct fsl_micfil *micfil = dev_get_drvdata(dev);
 	int ret;
 
-	ret = clk_prepare_enable(micfil->mclk);
+	ret = clk_prepare_enable(micfil->busclk);
 	if (ret < 0)
 		return ret;
 
+	ret = clk_prepare_enable(micfil->mclk);
+	if (ret < 0) {
+		clk_disable_unprepare(micfil->busclk);
+		return ret;
+	}
+
 	regcache_cache_only(micfil->regmap, false);
 	regcache_mark_dirty(micfil->regmap);
 	regcache_sync(micfil->regmap);
-- 
2.27.0

