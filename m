Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16BF553A03E
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 11:24:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LCkJ3721xz3bqC
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Jun 2022 19:24:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33; helo=metis.ext.pengutronix.de; envelope-from=mfe@pengutronix.de; receiver=<UNKNOWN>)
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LCkHG6bxpz3bYG
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Jun 2022 19:24:08 +1000 (AEST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1nwKZy-0006FD-OT; Wed, 01 Jun 2022 11:23:50 +0200
Received: from [2a0a:edc0:0:1101:1d::28] (helo=dude02.red.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1nwKZx-005oH4-5Z; Wed, 01 Jun 2022 11:23:47 +0200
Received: from mfe by dude02.red.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <mfe@pengutronix.de>)
	id 1nwKZu-00Dxwi-Us; Wed, 01 Jun 2022 11:23:46 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org
Subject: [PATCH 1/3] ASoC: fsl_sai: use local device pointer
Date: Wed,  1 Jun 2022 11:23:40 +0200
Message-Id: <20220601092342.3328644-1-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, kernel@pengutronix.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use a local variable to dereference the device pointer once and use the
local variable in further calls. No functional changes.

Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>
---
 sound/soc/fsl/fsl_sai.c | 53 +++++++++++++++++++++--------------------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index fa950dde5310..a7637d602f3c 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1004,6 +1004,7 @@ static int fsl_sai_runtime_resume(struct device *dev);
 static int fsl_sai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
+	struct device *dev = &pdev->dev;
 	struct fsl_sai *sai;
 	struct regmap *gpr;
 	struct resource *res;
@@ -1012,12 +1013,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	int irq, ret, i;
 	int index;
 
-	sai = devm_kzalloc(&pdev->dev, sizeof(*sai), GFP_KERNEL);
+	sai = devm_kzalloc(dev, sizeof(*sai), GFP_KERNEL);
 	if (!sai)
 		return -ENOMEM;
 
 	sai->pdev = pdev;
-	sai->soc_data = of_device_get_match_data(&pdev->dev);
+	sai->soc_data = of_device_get_match_data(dev);
 
 	sai->is_lsb_first = of_property_read_bool(np, "lsb-first");
 
@@ -1032,18 +1033,18 @@ static int fsl_sai_probe(struct platform_device *pdev)
 			ARRAY_SIZE(fsl_sai_reg_defaults_ofs8);
 	}
 
-	sai->regmap = devm_regmap_init_mmio(&pdev->dev, base, &fsl_sai_regmap_config);
+	sai->regmap = devm_regmap_init_mmio(dev, base, &fsl_sai_regmap_config);
 	if (IS_ERR(sai->regmap)) {
-		dev_err(&pdev->dev, "regmap init failed\n");
+		dev_err(dev, "regmap init failed\n");
 		return PTR_ERR(sai->regmap);
 	}
 
-	sai->bus_clk = devm_clk_get(&pdev->dev, "bus");
+	sai->bus_clk = devm_clk_get(dev, "bus");
 	/* Compatible with old DTB cases */
 	if (IS_ERR(sai->bus_clk) && PTR_ERR(sai->bus_clk) != -EPROBE_DEFER)
-		sai->bus_clk = devm_clk_get(&pdev->dev, "sai");
+		sai->bus_clk = devm_clk_get(dev, "sai");
 	if (IS_ERR(sai->bus_clk)) {
-		dev_err(&pdev->dev, "failed to get bus clock: %ld\n",
+		dev_err(dev, "failed to get bus clock: %ld\n",
 				PTR_ERR(sai->bus_clk));
 		/* -EPROBE_DEFER */
 		return PTR_ERR(sai->bus_clk);
@@ -1051,9 +1052,9 @@ static int fsl_sai_probe(struct platform_device *pdev)
 
 	for (i = 1; i < FSL_SAI_MCLK_MAX; i++) {
 		sprintf(tmp, "mclk%d", i);
-		sai->mclk_clk[i] = devm_clk_get(&pdev->dev, tmp);
+		sai->mclk_clk[i] = devm_clk_get(dev, tmp);
 		if (IS_ERR(sai->mclk_clk[i])) {
-			dev_err(&pdev->dev, "failed to get mclk%d clock: %ld\n",
+			dev_err(dev, "failed to get mclk%d clock: %ld\n",
 					i + 1, PTR_ERR(sai->mclk_clk[i]));
 			sai->mclk_clk[i] = NULL;
 		}
@@ -1068,10 +1069,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (irq < 0)
 		return irq;
 
-	ret = devm_request_irq(&pdev->dev, irq, fsl_sai_isr, IRQF_SHARED,
+	ret = devm_request_irq(dev, irq, fsl_sai_isr, IRQF_SHARED,
 			       np->name, sai);
 	if (ret) {
-		dev_err(&pdev->dev, "failed to claim irq %u\n", irq);
+		dev_err(dev, "failed to claim irq %u\n", irq);
 		return ret;
 	}
 
@@ -1088,7 +1089,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	if (of_find_property(np, "fsl,sai-synchronous-rx", NULL) &&
 	    of_find_property(np, "fsl,sai-asynchronous", NULL)) {
 		/* error out if both synchronous and asynchronous are present */
-		dev_err(&pdev->dev, "invalid binding for synchronous mode\n");
+		dev_err(dev, "invalid binding for synchronous mode\n");
 		return -EINVAL;
 	}
 
@@ -1109,7 +1110,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	    of_device_is_compatible(np, "fsl,imx6ul-sai")) {
 		gpr = syscon_regmap_lookup_by_compatible("fsl,imx6ul-iomuxc-gpr");
 		if (IS_ERR(gpr)) {
-			dev_err(&pdev->dev, "cannot find iomuxc registers\n");
+			dev_err(dev, "cannot find iomuxc registers\n");
 			return PTR_ERR(gpr);
 		}
 
@@ -1127,23 +1128,23 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	sai->dma_params_tx.maxburst = FSL_SAI_MAXBURST_TX;
 
 	platform_set_drvdata(pdev, sai);
-	pm_runtime_enable(&pdev->dev);
-	if (!pm_runtime_enabled(&pdev->dev)) {
-		ret = fsl_sai_runtime_resume(&pdev->dev);
+	pm_runtime_enable(dev);
+	if (!pm_runtime_enabled(dev)) {
+		ret = fsl_sai_runtime_resume(dev);
 		if (ret)
 			goto err_pm_disable;
 	}
 
-	ret = pm_runtime_get_sync(&pdev->dev);
+	ret = pm_runtime_get_sync(dev);
 	if (ret < 0) {
-		pm_runtime_put_noidle(&pdev->dev);
+		pm_runtime_put_noidle(dev);
 		goto err_pm_get_sync;
 	}
 
 	/* Get sai version */
-	ret = fsl_sai_check_version(&pdev->dev);
+	ret = fsl_sai_check_version(dev);
 	if (ret < 0)
-		dev_warn(&pdev->dev, "Error reading SAI version: %d\n", ret);
+		dev_warn(dev, "Error reading SAI version: %d\n", ret);
 
 	/* Select MCLK direction */
 	if (of_find_property(np, "fsl,sai-mclk-direction-output", NULL) &&
@@ -1152,7 +1153,7 @@ static int fsl_sai_probe(struct platform_device *pdev)
 				   FSL_SAI_MCTL_MCLK_EN, FSL_SAI_MCTL_MCLK_EN);
 	}
 
-	ret = pm_runtime_put_sync(&pdev->dev);
+	ret = pm_runtime_put_sync(dev);
 	if (ret < 0)
 		goto err_pm_get_sync;
 
@@ -1165,12 +1166,12 @@ static int fsl_sai_probe(struct platform_device *pdev)
 		if (ret)
 			goto err_pm_get_sync;
 	} else {
-		ret = devm_snd_dmaengine_pcm_register(&pdev->dev, NULL, 0);
+		ret = devm_snd_dmaengine_pcm_register(dev, NULL, 0);
 		if (ret)
 			goto err_pm_get_sync;
 	}
 
-	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_component,
+	ret = devm_snd_soc_register_component(dev, &fsl_component,
 					      &sai->cpu_dai_drv, 1);
 	if (ret)
 		goto err_pm_get_sync;
@@ -1178,10 +1179,10 @@ static int fsl_sai_probe(struct platform_device *pdev)
 	return ret;
 
 err_pm_get_sync:
-	if (!pm_runtime_status_suspended(&pdev->dev))
-		fsl_sai_runtime_suspend(&pdev->dev);
+	if (!pm_runtime_status_suspended(dev))
+		fsl_sai_runtime_suspend(dev);
 err_pm_disable:
-	pm_runtime_disable(&pdev->dev);
+	pm_runtime_disable(dev);
 
 	return ret;
 }
-- 
2.30.2

