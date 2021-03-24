Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E93B3475A1
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 11:14:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F53y43g1vz3dDM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:14:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F53w40NyQz301j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 21:13:06 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B1CC5202742;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6F108202739;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id C910D40339;
 Wed, 24 Mar 2021 11:12:30 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 1/6] ASoC: fsl_esai: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:43 +0800
Message-Id: <1616579928-22428-2-git-send-email-shengjiu.wang@nxp.com>
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

When there is power domain bind with bus clock,

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
---
 sound/soc/fsl/fsl_esai.c | 48 ++++++++++++++++++++++++++++++----------
 1 file changed, 36 insertions(+), 12 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index 41b154417b92..c0d4f3c5dbb1 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -945,6 +945,9 @@ static const struct regmap_config fsl_esai_regmap_config = {
 	.cache_type = REGCACHE_FLAT,
 };
 
+static int fsl_esai_runtime_resume(struct device *dev);
+static int fsl_esai_runtime_suspend(struct device *dev);
+
 static int fsl_esai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -969,8 +972,7 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	if (IS_ERR(regs))
 		return PTR_ERR(regs);
 
-	esai_priv->regmap = devm_regmap_init_mmio_clk(&pdev->dev,
-			"core", regs, &fsl_esai_regmap_config);
+	esai_priv->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &fsl_esai_regmap_config);
 	if (IS_ERR(esai_priv->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap: %ld\n",
 				PTR_ERR(esai_priv->regmap));
@@ -1039,11 +1041,23 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	}
 
 	dev_set_drvdata(&pdev->dev, esai_priv);
-
 	spin_lock_init(&esai_priv->lock);
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_esai_runtime_resume(&pdev->dev);
+		if (ret)
+			goto err_pm_disable;
+	}
+
+	ret = pm_runtime_get_sync(&pdev->dev);
+	if (ret < 0) {
+		pm_runtime_put_noidle(&pdev->dev);
+		goto err_pm_get_sync;
+	}
+
 	ret = fsl_esai_hw_init(esai_priv);
 	if (ret)
-		return ret;
+		goto err_pm_get_sync;
 
 	esai_priv->tx_mask = 0xFFFFFFFF;
 	esai_priv->rx_mask = 0xFFFFFFFF;
@@ -1054,24 +1068,33 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMA, 0);
 	regmap_write(esai_priv->regmap, REG_ESAI_RSMB, 0);
 
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
+
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_esai_component,
 					      &fsl_esai_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register DAI: %d\n", ret);
-		return ret;
+		goto err_pm_get_sync;
 	}
 
 	INIT_WORK(&esai_priv->work, fsl_esai_hw_reset);
 
-	pm_runtime_enable(&pdev->dev);
-
-	regcache_cache_only(esai_priv->regmap, true);
-
 	ret = imx_pcm_dma_init(pdev, IMX_ESAI_DMABUF_SIZE);
-	if (ret)
+	if (ret) {
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
+		goto err_pm_get_sync;
+	}
 
 	return ret;
+
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_esai_runtime_suspend(&pdev->dev);
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
 }
 
 static int fsl_esai_remove(struct platform_device *pdev)
@@ -1079,6 +1102,9 @@ static int fsl_esai_remove(struct platform_device *pdev)
 	struct fsl_esai *esai_priv = platform_get_drvdata(pdev);
 
 	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_esai_runtime_suspend(&pdev->dev);
+
 	cancel_work_sync(&esai_priv->work);
 
 	return 0;
@@ -1092,7 +1118,6 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
 
-#ifdef CONFIG_PM
 static int fsl_esai_runtime_resume(struct device *dev)
 {
 	struct fsl_esai *esai = dev_get_drvdata(dev);
@@ -1160,7 +1185,6 @@ static int fsl_esai_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_esai_pm_ops = {
 	SET_RUNTIME_PM_OPS(fsl_esai_runtime_suspend,
-- 
2.27.0

