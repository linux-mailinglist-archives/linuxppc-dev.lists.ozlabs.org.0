Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E3363475A3
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 11:15:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F53yT6yYFz3bpV
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Mar 2021 21:15:13 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F53w40kJjz302j
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Mar 2021 21:13:06 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id B0EA520273F;
 Wed, 24 Mar 2021 11:13:03 +0100 (CET)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 6FC7420273E;
 Wed, 24 Mar 2021 11:12:59 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id CF5844033C;
 Wed, 24 Mar 2021 11:12:32 +0100 (CET)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, perex@perex.cz, tiwai@suse.com,
 alsa-devel@alsa-project.org
Subject: [PATCH 3/6] ASoC: fsl_asrc: Don't use devm_regmap_init_mmio_clk
Date: Wed, 24 Mar 2021 17:58:45 +0800
Message-Id: <1616579928-22428-4-git-send-email-shengjiu.wang@nxp.com>
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

When there is power domain bind with mem clock,

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
 sound/soc/fsl/fsl_asrc.c | 57 +++++++++++++++++++++++++++++++---------
 1 file changed, 44 insertions(+), 13 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 63d236ef5c4d..0e1ad8efebd3 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1008,6 +1008,9 @@ static int fsl_asrc_get_fifo_addr(u8 dir, enum asrc_pair_index index)
 	return REG_ASRDx(dir, index);
 }
 
+static int fsl_asrc_runtime_resume(struct device *dev);
+static int fsl_asrc_runtime_suspend(struct device *dev);
+
 static int fsl_asrc_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -1039,8 +1042,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 
 	asrc->paddr = res->start;
 
-	asrc->regmap = devm_regmap_init_mmio_clk(&pdev->dev, "mem", regs,
-						 &fsl_asrc_regmap_config);
+	asrc->regmap = devm_regmap_init_mmio(&pdev->dev, regs, &fsl_asrc_regmap_config);
 	if (IS_ERR(asrc->regmap)) {
 		dev_err(&pdev->dev, "failed to init regmap\n");
 		return PTR_ERR(asrc->regmap);
@@ -1117,12 +1119,6 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 		}
 	}
 
-	ret = fsl_asrc_init(asrc);
-	if (ret) {
-		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
-		return ret;
-	}
-
 	asrc->channel_avail = 10;
 
 	ret = of_property_read_u32(np, "fsl,asrc-rate",
@@ -1161,21 +1157,56 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	}
 
 	platform_set_drvdata(pdev, asrc);
-	pm_runtime_enable(&pdev->dev);
 	spin_lock_init(&asrc->lock);
-	regcache_cache_only(asrc->regmap, true);
+	pm_runtime_enable(&pdev->dev);
+	if (!pm_runtime_enabled(&pdev->dev)) {
+		ret = fsl_asrc_runtime_resume(&pdev->dev);
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
+	ret = fsl_asrc_init(asrc);
+	if (ret) {
+		dev_err(&pdev->dev, "failed to init asrc %d\n", ret);
+		goto err_pm_get_sync;
+	}
+
+	ret = pm_runtime_put_sync(&pdev->dev);
+	if (ret < 0)
+		goto err_pm_get_sync;
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      &fsl_asrc_dai, 1);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to register ASoC DAI\n");
-		return ret;
+		goto err_pm_get_sync;
 	}
 
 	return 0;
+
+err_pm_get_sync:
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_asrc_runtime_suspend(&pdev->dev);
+err_pm_disable:
+	pm_runtime_disable(&pdev->dev);
+	return ret;
+}
+
+static int fsl_asrc_remove(struct platform_device *pdev)
+{
+	pm_runtime_disable(&pdev->dev);
+	if (!pm_runtime_status_suspended(&pdev->dev))
+		fsl_asrc_runtime_suspend(&pdev->dev);
+
+	return 0;
 }
 
-#ifdef CONFIG_PM
 static int fsl_asrc_runtime_resume(struct device *dev)
 {
 	struct fsl_asrc *asrc = dev_get_drvdata(dev);
@@ -1252,7 +1283,6 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 
 	return 0;
 }
-#endif /* CONFIG_PM */
 
 static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
@@ -1291,6 +1321,7 @@ MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
 
 static struct platform_driver fsl_asrc_driver = {
 	.probe = fsl_asrc_probe,
+	.remove = fsl_asrc_remove,
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
-- 
2.27.0

