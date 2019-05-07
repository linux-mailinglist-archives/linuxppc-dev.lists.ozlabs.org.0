Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8031579F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 04:30:35 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 44yk9P05gmzDqMr
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 May 2019 12:30:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=sirena.org.uk
 (client-ip=2a01:7e01::f03c:91ff:fed4:a3b6; helo=heliosphere.sirena.org.uk;
 envelope-from=broonie@sirena.org.uk; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=sirena.org.uk header.i=@sirena.org.uk
 header.b="DjY3qcA5"; dkim-atps=neutral
Received: from heliosphere.sirena.org.uk (heliosphere.sirena.org.uk
 [IPv6:2a01:7e01::f03c:91ff:fed4:a3b6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 44yk7w5H5WzDqK5
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  7 May 2019 12:29:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sirena.org.uk; s=20170815-heliosphere; h=Date:Message-Id:In-Reply-To:
 Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
 List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:
 List-Archive; bh=aSPRS/UQTQIlG/Fpji6u6bjSVgCp4Melu+2tov3g5R4=; b=DjY3qcA5pL1T
 mdfHfSDzwvw3BrCANnUOvAs6VsvCK/pP3j6IHqgqKB0C/7yDb2O5wD9srqBNXfJZp9rSDQBjAMLQM
 HRXF7W0D/7KIq4CCCI87rLtxy/uW2pRJ9XjE8tunuBmYX4Lj3U69V7ENW4fXZ8wd9WMm8JZad2IRE
 ttC3c=;
Received: from kd111239185057.au-net.ne.jp ([111.239.185.57]
 helo=finisterre.sirena.org.uk)
 by heliosphere.sirena.org.uk with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.89)
 (envelope-from <broonie@sirena.org.uk>)
 id 1hNpqp-0003RP-LM; Tue, 07 May 2019 02:29:04 +0000
Received: by finisterre.ee.mobilebroadband (Postfix, from userid 1000)
 id 9513A440035; Tue,  7 May 2019 03:28:53 +0100 (BST)
From: Mark Brown <broonie@kernel.org>
To: S.j. Wang <shengjiu.wang@nxp.com>
Subject: Applied "ASoC: fsl_esai: Add pm runtime function" to the asoc tree
In-Reply-To: <20190503194944.30167-1-nicoleotsuka@gmail.com>
X-Patchwork-Hint: ignore
Message-Id: <20190507022853.9513A440035@finisterre.sirena.org.uk>
Date: Tue,  7 May 2019 03:28:53 +0100 (BST)
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
Cc: alsa-devel@alsa-project.org, timur@kernel.org, Xiubo.Lee@gmail.com,
 festevam@gmail.com, Shengjiu Wang <shengjiu.wang@nxp.com>, tiwai@suse.com,
 lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 perex@perex.cz, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The patch

   ASoC: fsl_esai: Add pm runtime function

has been applied to the asoc tree at

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-5.3

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.  

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

From b2d337d8de9fb6dd4f2970ebec0fa2375f7c9cdd Mon Sep 17 00:00:00 2001
From: "S.j. Wang" <shengjiu.wang@nxp.com>
Date: Fri, 3 May 2019 12:49:44 -0700
Subject: [PATCH] ASoC: fsl_esai: Add pm runtime function

Add pm runtime support and move clock handling there.
Close the clocks at suspend to reduce the power consumption.

fsl_esai_suspend is replaced by pm_runtime_force_suspend.
fsl_esai_resume is replaced by pm_runtime_force_resume.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_esai.c | 141 +++++++++++++++++++++------------------
 1 file changed, 77 insertions(+), 64 deletions(-)

diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index bad0dfed6b68..10d2210c91ef 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -9,6 +9,7 @@
 #include <linux/module.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/pm_runtime.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm_params.h>
 
@@ -466,30 +467,6 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
 	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-	int ret;
-
-	/*
-	 * Some platforms might use the same bit to gate all three or two of
-	 * clocks, so keep all clocks open/close at the same time for safety
-	 */
-	ret = clk_prepare_enable(esai_priv->coreclk);
-	if (ret)
-		return ret;
-	if (!IS_ERR(esai_priv->spbaclk)) {
-		ret = clk_prepare_enable(esai_priv->spbaclk);
-		if (ret)
-			goto err_spbaclk;
-	}
-	if (!IS_ERR(esai_priv->extalclk)) {
-		ret = clk_prepare_enable(esai_priv->extalclk);
-		if (ret)
-			goto err_extalck;
-	}
-	if (!IS_ERR(esai_priv->fsysclk)) {
-		ret = clk_prepare_enable(esai_priv->fsysclk);
-		if (ret)
-			goto err_fsysclk;
-	}
 
 	if (!dai->active) {
 		/* Set synchronous mode */
@@ -506,16 +483,6 @@ static int fsl_esai_startup(struct snd_pcm_substream *substream,
 
 	return 0;
 
-err_fsysclk:
-	if (!IS_ERR(esai_priv->extalclk))
-		clk_disable_unprepare(esai_priv->extalclk);
-err_extalck:
-	if (!IS_ERR(esai_priv->spbaclk))
-		clk_disable_unprepare(esai_priv->spbaclk);
-err_spbaclk:
-	clk_disable_unprepare(esai_priv->coreclk);
-
-	return ret;
 }
 
 static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
@@ -576,20 +543,6 @@ static int fsl_esai_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static void fsl_esai_shutdown(struct snd_pcm_substream *substream,
-			      struct snd_soc_dai *dai)
-{
-	struct fsl_esai *esai_priv = snd_soc_dai_get_drvdata(dai);
-
-	if (!IS_ERR(esai_priv->fsysclk))
-		clk_disable_unprepare(esai_priv->fsysclk);
-	if (!IS_ERR(esai_priv->extalclk))
-		clk_disable_unprepare(esai_priv->extalclk);
-	if (!IS_ERR(esai_priv->spbaclk))
-		clk_disable_unprepare(esai_priv->spbaclk);
-	clk_disable_unprepare(esai_priv->coreclk);
-}
-
 static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 			    struct snd_soc_dai *dai)
 {
@@ -658,7 +611,6 @@ static int fsl_esai_trigger(struct snd_pcm_substream *substream, int cmd,
 
 static const struct snd_soc_dai_ops fsl_esai_dai_ops = {
 	.startup = fsl_esai_startup,
-	.shutdown = fsl_esai_shutdown,
 	.trigger = fsl_esai_trigger,
 	.hw_params = fsl_esai_hw_params,
 	.set_sysclk = fsl_esai_set_dai_sysclk,
@@ -947,6 +899,10 @@ static int fsl_esai_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	pm_runtime_enable(&pdev->dev);
+
+	regcache_cache_only(esai_priv->regmap, true);
+
 	ret = imx_pcm_dma_init(pdev, IMX_ESAI_DMABUF_SIZE);
 	if (ret)
 		dev_err(&pdev->dev, "failed to init imx pcm dma: %d\n", ret);
@@ -954,6 +910,13 @@ static int fsl_esai_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static int fsl_esai_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+
+	return 0;
+}
+
 static const struct of_device_id fsl_esai_dt_ids[] = {
 	{ .compatible = "fsl,imx35-esai", },
 	{ .compatible = "fsl,vf610-esai", },
@@ -961,22 +924,35 @@ static const struct of_device_id fsl_esai_dt_ids[] = {
 };
 MODULE_DEVICE_TABLE(of, fsl_esai_dt_ids);
 
-#ifdef CONFIG_PM_SLEEP
-static int fsl_esai_suspend(struct device *dev)
-{
-	struct fsl_esai *esai = dev_get_drvdata(dev);
-
-	regcache_cache_only(esai->regmap, true);
-	regcache_mark_dirty(esai->regmap);
-
-	return 0;
-}
-
-static int fsl_esai_resume(struct device *dev)
+#ifdef CONFIG_PM
+static int fsl_esai_runtime_resume(struct device *dev)
 {
 	struct fsl_esai *esai = dev_get_drvdata(dev);
 	int ret;
 
+	/*
+	 * Some platforms might use the same bit to gate all three or two of
+	 * clocks, so keep all clocks open/close at the same time for safety
+	 */
+	ret = clk_prepare_enable(esai->coreclk);
+	if (ret)
+		return ret;
+	if (!IS_ERR(esai->spbaclk)) {
+		ret = clk_prepare_enable(esai->spbaclk);
+		if (ret)
+			goto err_spbaclk;
+	}
+	if (!IS_ERR(esai->extalclk)) {
+		ret = clk_prepare_enable(esai->extalclk);
+		if (ret)
+			goto err_extalclk;
+	}
+	if (!IS_ERR(esai->fsysclk)) {
+		ret = clk_prepare_enable(esai->fsysclk);
+		if (ret)
+			goto err_fsysclk;
+	}
+
 	regcache_cache_only(esai->regmap, false);
 
 	/* FIFO reset for safety */
@@ -987,22 +963,59 @@ static int fsl_esai_resume(struct device *dev)
 
 	ret = regcache_sync(esai->regmap);
 	if (ret)
-		return ret;
+		goto err_regcache_sync;
 
 	/* FIFO reset done */
 	regmap_update_bits(esai->regmap, REG_ESAI_TFCR, ESAI_xFCR_xFR, 0);
 	regmap_update_bits(esai->regmap, REG_ESAI_RFCR, ESAI_xFCR_xFR, 0);
 
+	return 0;
+
+err_regcache_sync:
+	if (!IS_ERR(esai->fsysclk))
+		clk_disable_unprepare(esai->fsysclk);
+err_fsysclk:
+	if (!IS_ERR(esai->extalclk))
+		clk_disable_unprepare(esai->extalclk);
+err_extalclk:
+	if (!IS_ERR(esai->spbaclk))
+		clk_disable_unprepare(esai->spbaclk);
+err_spbaclk:
+	clk_disable_unprepare(esai->coreclk);
+
+	return ret;
+}
+
+static int fsl_esai_runtime_suspend(struct device *dev)
+{
+	struct fsl_esai *esai = dev_get_drvdata(dev);
+
+	regcache_cache_only(esai->regmap, true);
+	regcache_mark_dirty(esai->regmap);
+
+	if (!IS_ERR(esai->fsysclk))
+		clk_disable_unprepare(esai->fsysclk);
+	if (!IS_ERR(esai->extalclk))
+		clk_disable_unprepare(esai->extalclk);
+	if (!IS_ERR(esai->spbaclk))
+		clk_disable_unprepare(esai->spbaclk);
+	clk_disable_unprepare(esai->coreclk);
+
 	return 0;
 }
-#endif /* CONFIG_PM_SLEEP */
+#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_esai_pm_ops = {
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_esai_suspend, fsl_esai_resume)
+	SET_RUNTIME_PM_OPS(fsl_esai_runtime_suspend,
+			   fsl_esai_runtime_resume,
+			   NULL)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static struct platform_driver fsl_esai_driver = {
 	.probe = fsl_esai_probe,
+	.remove = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
 		.pm = &fsl_esai_pm_ops,
-- 
2.20.1

