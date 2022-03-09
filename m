Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A8E4D2C39
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 10:36:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KD6XG5KNmz3bcY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Mar 2022 20:36:30 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com
 (client-ip=92.121.34.21; helo=inva021.nxp.com;
 envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
X-Greylist: delayed 495 seconds by postgrey-1.36 at boromir;
 Wed, 09 Mar 2022 20:36:05 AEDT
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KD6Wn1mhjz2ywb
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Mar 2022 20:36:04 +1100 (AEDT)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id A9FEA2028D7;
 Wed,  9 Mar 2022 10:27:47 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com
 (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 468B92027BD;
 Wed,  9 Mar 2022 10:27:47 +0100 (CET)
Received: from localhost.localdomain (shlinux2.ap.freescale.net
 [10.192.224.44])
 by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id C23CD183AC94;
 Wed,  9 Mar 2022 17:27:45 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com, Xiubo.Lee@gmail.com, festevam@gmail.com,
 shengjiu.wang@gmail.com, lgirdwood@gmail.com, broonie@kernel.org,
 perex@perex.cz, tiwai@suse.com, alsa-devel@alsa-project.org
Subject: [PATCH] ASoC: fsl_spdif: keep all TxClk sources by txclk array
Date: Wed,  9 Mar 2022 17:18:43 +0800
Message-Id: <1646817523-26800-1-git-send-email-shengjiu.wang@nxp.com>
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

From: Viorel Suman <viorel.suman@nxp.com>

Use txclk array to keep all TxClk sources instead of keeping
clocks per rate - need to do this in order to avoid multiple
prepare_enable/disable_unprepare of the same clock during
suspend/resume.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_spdif.c | 41 +++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 21 deletions(-)

diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 57c41b2f7d17..e0acce6b2213 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -125,7 +125,7 @@ struct fsl_spdif_priv {
 	u16 sysclk_df[SPDIF_TXRATE_MAX];
 	u8 txclk_src[SPDIF_TXRATE_MAX];
 	u8 rxclk_src;
-	struct clk *txclk[SPDIF_TXRATE_MAX];
+	struct clk *txclk[STC_TXCLK_SRC_MAX];
 	struct clk *rxclk;
 	struct clk *coreclk;
 	struct clk *sysclk;
@@ -526,7 +526,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		goto clk_set_bypass;
 
 	/* The S/PDIF block needs a clock of 64 * fs * txclk_df */
-	ret = clk_set_rate(spdif_priv->txclk[rate],
+	ret = clk_set_rate(spdif_priv->txclk[clk],
 			   64 * sample_rate * txclk_df);
 	if (ret) {
 		dev_err(&pdev->dev, "failed to set tx clock rate\n");
@@ -537,7 +537,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 	dev_dbg(&pdev->dev, "expected clock rate = %d\n",
 			(64 * sample_rate * txclk_df * sysclk_df));
 	dev_dbg(&pdev->dev, "actual clock rate = %ld\n",
-			clk_get_rate(spdif_priv->txclk[rate]));
+			clk_get_rate(spdif_priv->txclk[clk]));
 
 	/* set fs field in consumer channel status */
 	spdif_set_cstatus(ctrl, IEC958_AES3_CON_FS, csfs);
@@ -1376,12 +1376,10 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 	struct device *dev = &pdev->dev;
 	u64 savesub = 100000, ret;
 	struct clk *clk;
-	char tmp[16];
 	int i;
 
 	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
-		sprintf(tmp, "rxtx%d", i);
-		clk = devm_clk_get(dev, tmp);
+		clk = spdif_priv->txclk[i];
 		if (IS_ERR(clk)) {
 			dev_err(dev, "no rxtx%d clock in devicetree\n", i);
 			return PTR_ERR(clk);
@@ -1395,7 +1393,6 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			continue;
 
 		savesub = ret;
-		spdif_priv->txclk[index] = clk;
 		spdif_priv->txclk_src[index] = i;
 
 		/* To quick catch a divisor, we allow a 0.1% deviation */
@@ -1407,7 +1404,7 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
 			spdif_priv->txclk_src[index], rate[index]);
 	dev_dbg(dev, "use txclk df %d for %dHz sample rate\n",
 			spdif_priv->txclk_df[index], rate[index]);
-	if (clk_is_match(spdif_priv->txclk[index], spdif_priv->sysclk))
+	if (clk_is_match(spdif_priv->txclk[spdif_priv->txclk_src[index]], spdif_priv->sysclk))
 		dev_dbg(dev, "use sysclk df %d for %dHz sample rate\n",
 				spdif_priv->sysclk_df[index], rate[index]);
 	dev_dbg(dev, "the best rate for %dHz sample rate is %dHz\n",
@@ -1423,6 +1420,7 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	struct resource *res;
 	void __iomem *regs;
 	int irq, ret, i;
+	char tmp[16];
 
 	spdif_priv = devm_kzalloc(&pdev->dev, sizeof(*spdif_priv), GFP_KERNEL);
 	if (!spdif_priv)
@@ -1462,8 +1460,17 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 		}
 	}
 
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
+		sprintf(tmp, "rxtx%d", i);
+		spdif_priv->txclk[i] = devm_clk_get(&pdev->dev, tmp);
+		if (IS_ERR(spdif_priv->txclk[i])) {
+			dev_err(&pdev->dev, "no rxtx%d clock in devicetree\n", i);
+			return PTR_ERR(spdif_priv->txclk[i]);
+		}
+	}
+
 	/* Get system clock for rx clock rate calculation */
-	spdif_priv->sysclk = devm_clk_get(&pdev->dev, "rxtx5");
+	spdif_priv->sysclk = spdif_priv->txclk[5];
 	if (IS_ERR(spdif_priv->sysclk)) {
 		dev_err(&pdev->dev, "no sys clock (rxtx5) in devicetree\n");
 		return PTR_ERR(spdif_priv->sysclk);
@@ -1481,7 +1488,7 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 		dev_warn(&pdev->dev, "no spba clock in devicetree\n");
 
 	/* Select clock source for rx/tx clock */
-	spdif_priv->rxclk = devm_clk_get(&pdev->dev, "rxtx1");
+	spdif_priv->rxclk = spdif_priv->txclk[1];
 	if (IS_ERR(spdif_priv->rxclk)) {
 		dev_err(&pdev->dev, "no rxtx1 clock in devicetree\n");
 		return PTR_ERR(spdif_priv->rxclk);
@@ -1562,9 +1569,7 @@ static int fsl_spdif_runtime_suspend(struct device *dev)
 			&spdif_priv->regcache_srpc);
 	regcache_cache_only(spdif_priv->regmap, true);
 
-	clk_disable_unprepare(spdif_priv->rxclk);
-
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++)
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++)
 		clk_disable_unprepare(spdif_priv->txclk[i]);
 
 	if (!IS_ERR(spdif_priv->spbaclk))
@@ -1594,16 +1599,12 @@ static int fsl_spdif_runtime_resume(struct device *dev)
 		}
 	}
 
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
+	for (i = 0; i < STC_TXCLK_SRC_MAX; i++) {
 		ret = clk_prepare_enable(spdif_priv->txclk[i]);
 		if (ret)
 			goto disable_tx_clk;
 	}
 
-	ret = clk_prepare_enable(spdif_priv->rxclk);
-	if (ret)
-		goto disable_tx_clk;
-
 	regcache_cache_only(spdif_priv->regmap, false);
 	regcache_mark_dirty(spdif_priv->regmap);
 
@@ -1613,12 +1614,10 @@ static int fsl_spdif_runtime_resume(struct device *dev)
 
 	ret = regcache_sync(spdif_priv->regmap);
 	if (ret)
-		goto disable_rx_clk;
+		goto disable_tx_clk;
 
 	return 0;
 
-disable_rx_clk:
-	clk_disable_unprepare(spdif_priv->rxclk);
 disable_tx_clk:
 	for (i--; i >= 0; i--)
 		clk_disable_unprepare(spdif_priv->txclk[i]);
-- 
2.17.1

