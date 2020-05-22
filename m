Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A34821DE3B6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 12:08:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49T2JL3wWLzDr0y
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 May 2020 20:08:50 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.13; helo=inva020.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=nxp.com
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49T2Gp71xpzDqx2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 May 2020 20:07:27 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 56EFF1A324F;
 Fri, 22 May 2020 12:07:23 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 9A8B21A3239;
 Fri, 22 May 2020 12:07:18 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 0A9A740318;
 Fri, 22 May 2020 18:07:12 +0800 (SGT)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: timur@kernel.org, nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com,
 festevam@gmail.com, broonie@kernel.org, alsa-devel@alsa-project.org,
 lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com
Subject: [PATCH] ASoC: fsl_asrc: Merge suspend/resume function to
 runtime_suspend/resume
Date: Fri, 22 May 2020 17:57:24 +0800
Message-Id: <1590141444-28668-1-git-send-email-shengjiu.wang@nxp.com>
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

With dedicated power domain for asrc, power can be disabled after
probe and pm runtime suspend, then the value of all registers need to
be restored in pm runtime resume. So we can merge suspend/resume function
to runtime_suspend/resume function and enable regcache only in end of
probe.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_asrc.c | 70 ++++++++++++++++------------------------
 1 file changed, 27 insertions(+), 43 deletions(-)

diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index 432936039de4..3ebbe15ac378 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1100,6 +1100,7 @@ static int fsl_asrc_probe(struct platform_device *pdev)
 	platform_set_drvdata(pdev, asrc);
 	pm_runtime_enable(&pdev->dev);
 	spin_lock_init(&asrc->lock);
+	regcache_cache_only(asrc->regmap, true);
 
 	ret = devm_snd_soc_register_component(&pdev->dev, &fsl_asrc_component,
 					      &fsl_asrc_dai, 1);
@@ -1117,6 +1118,7 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 	struct fsl_asrc *asrc = dev_get_drvdata(dev);
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	int i, ret;
+	u32 asrctr;
 
 	ret = clk_prepare_enable(asrc->mem_clk);
 	if (ret)
@@ -1135,6 +1137,24 @@ static int fsl_asrc_runtime_resume(struct device *dev)
 			goto disable_asrck_clk;
 	}
 
+	/* Stop all pairs provisionally */
+	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
+			   ASRCTR_ASRCEi_ALL_MASK, 0);
+
+	/* Restore all registers */
+	regcache_cache_only(asrc->regmap, false);
+	regcache_mark_dirty(asrc->regmap);
+	regcache_sync(asrc->regmap);
+
+	regmap_update_bits(asrc->regmap, REG_ASRCFG,
+			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
+			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
+
+	/* Restart enabled pairs */
+	regmap_update_bits(asrc->regmap, REG_ASRCTR,
+			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
+
 	return 0;
 
 disable_asrck_clk:
@@ -1155,6 +1175,11 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 	struct fsl_asrc_priv *asrc_priv = asrc->private;
 	int i;
 
+	regmap_read(asrc->regmap, REG_ASRCFG,
+		    &asrc_priv->regcache_cfg);
+
+	regcache_cache_only(asrc->regmap, true);
+
 	for (i = 0; i < ASRC_CLK_MAX_NUM; i++)
 		clk_disable_unprepare(asrc_priv->asrck_clk[i]);
 	if (!IS_ERR(asrc->spba_clk))
@@ -1166,51 +1191,10 @@ static int fsl_asrc_runtime_suspend(struct device *dev)
 }
 #endif /* CONFIG_PM */
 
-#ifdef CONFIG_PM_SLEEP
-static int fsl_asrc_suspend(struct device *dev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(dev);
-	struct fsl_asrc_priv *asrc_priv = asrc->private;
-
-	regmap_read(asrc->regmap, REG_ASRCFG,
-		    &asrc_priv->regcache_cfg);
-
-	regcache_cache_only(asrc->regmap, true);
-	regcache_mark_dirty(asrc->regmap);
-
-	return 0;
-}
-
-static int fsl_asrc_resume(struct device *dev)
-{
-	struct fsl_asrc *asrc = dev_get_drvdata(dev);
-	struct fsl_asrc_priv *asrc_priv = asrc->private;
-	u32 asrctr;
-
-	/* Stop all pairs provisionally */
-	regmap_read(asrc->regmap, REG_ASRCTR, &asrctr);
-	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_ASRCEi_ALL_MASK, 0);
-
-	/* Restore all registers */
-	regcache_cache_only(asrc->regmap, false);
-	regcache_sync(asrc->regmap);
-
-	regmap_update_bits(asrc->regmap, REG_ASRCFG,
-			   ASRCFG_NDPRi_ALL_MASK | ASRCFG_POSTMODi_ALL_MASK |
-			   ASRCFG_PREMODi_ALL_MASK, asrc_priv->regcache_cfg);
-
-	/* Restart enabled pairs */
-	regmap_update_bits(asrc->regmap, REG_ASRCTR,
-			   ASRCTR_ASRCEi_ALL_MASK, asrctr);
-
-	return 0;
-}
-#endif /* CONFIG_PM_SLEEP */
-
 static const struct dev_pm_ops fsl_asrc_pm = {
 	SET_RUNTIME_PM_OPS(fsl_asrc_runtime_suspend, fsl_asrc_runtime_resume, NULL)
-	SET_SYSTEM_SLEEP_PM_OPS(fsl_asrc_suspend, fsl_asrc_resume)
+	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
+				pm_runtime_force_resume)
 };
 
 static const struct fsl_asrc_soc_data fsl_asrc_imx35_data = {
-- 
2.21.0

