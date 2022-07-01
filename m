Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 102D556309C
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 11:48:37 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LZ9PZ6n8Fz3cgj
	for <lists+linuxppc-dev@lfdr.de>; Fri,  1 Jul 2022 19:48:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=<UNKNOWN>)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LZ9NM2hVPz3cfD
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  1 Jul 2022 19:47:31 +1000 (AEST)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 5ECDF1A13D2;
	Fri,  1 Jul 2022 11:47:28 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id F0B121A13C8;
	Fri,  1 Jul 2022 11:47:27 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id A23E9180222C;
	Fri,  1 Jul 2022 17:47:26 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: nicoleotsuka@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	shengjiu.wang@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	alsa-devel@alsa-project.org,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 2/6] ASoC: fsl_spdif: Add support for PLL switch at runtime.
Date: Fri,  1 Jul 2022 17:32:37 +0800
Message-Id: <1656667961-1799-3-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
References: <1656667961-1799-1-git-send-email-shengjiu.wang@nxp.com>
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

i.MX8MQ/MN/MM/MP platforms typically have 2 AUDIO PLLs being
configured to handle 8kHz and 11kHz series audio rates.

The patch implements the functionality to select at runtime
the appropriate AUDIO PLL as function of audio file rate.
As the clock parent may be changed, need to probe txclk
according to sample rate again.

Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/Kconfig     |  1 +
 sound/soc/fsl/fsl_spdif.c | 48 +++++++++++++++++++++++++++++++++++----
 2 files changed, 44 insertions(+), 5 deletions(-)

diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
index 10fa38753453..910b8747b6bd 100644
--- a/sound/soc/fsl/Kconfig
+++ b/sound/soc/fsl/Kconfig
@@ -59,6 +59,7 @@ config SND_SOC_FSL_SPDIF
 	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
 	select SND_SOC_IMX_PCM_FIQ if SND_IMX_SOC != n && (MXC_TZIC || MXC_AVIC)
 	select BITREVERSE
+	select SND_SOC_FSL_UTILS
 	help
 	  Say Y if you want to add Sony/Philips Digital Interface (SPDIF)
 	  support for the Freescale CPUs.
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index 0504431792cf..7fc1c96929bb 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -23,6 +23,7 @@
 #include <sound/soc.h>
 
 #include "fsl_spdif.h"
+#include "fsl_utils.h"
 #include "imx-pcm.h"
 
 #define FSL_SPDIF_TXFIFO_WML	0x8
@@ -114,6 +115,8 @@ struct spdif_mixer_control {
  * @dma_params_rx: DMA parameters for receive channel
  * @regcache_srpc: regcache for SRPC
  * @bypass: status of bypass input to output
+ * @pll8k_clk: PLL clock for the rate of multiply of 8kHz
+ * @pll11k_clk: PLL clock for the rate of multiply of 11kHz
  */
 struct fsl_spdif_priv {
 	const struct fsl_spdif_soc_data *soc;
@@ -137,6 +140,8 @@ struct fsl_spdif_priv {
 	/* regcache for SRPC */
 	u32 regcache_srpc;
 	bool bypass;
+	struct clk *pll8k_clk;
+	struct clk *pll11k_clk;
 };
 
 static struct fsl_spdif_soc_data fsl_spdif_vf610 = {
@@ -480,6 +485,8 @@ static int spdif_set_rx_clksrc(struct fsl_spdif_priv *spdif_priv,
 	return 0;
 }
 
+static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv, enum spdif_txrate index);
+
 static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 				int sample_rate)
 {
@@ -528,6 +535,10 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	ret = fsl_spdif_probe_txclk(spdif_priv, rate);
+	if (ret)
+		return ret;
+
 	clk = spdif_priv->txclk_src[rate];
 	if (clk >= STC_TXCLK_SRC_MAX) {
 		dev_err(&pdev->dev, "tx clock source is out of range\n");
@@ -647,6 +658,29 @@ static void fsl_spdif_shutdown(struct snd_pcm_substream *substream,
 	}
 }
 
+static int spdif_reparent_rootclk(struct fsl_spdif_priv *spdif_priv, unsigned int sample_rate)
+{
+	struct platform_device *pdev = spdif_priv->pdev;
+	struct clk *clk;
+	int ret;
+
+	/* Reparent clock if required condition is true */
+	if (!fsl_spdif_can_set_clk_rate(spdif_priv, STC_TXCLK_SPDIF_ROOT))
+		return 0;
+
+	/* Get root clock */
+	clk = spdif_priv->txclk[STC_TXCLK_SPDIF_ROOT];
+
+	/* Disable clock first, for it was enabled by pm_runtime */
+	clk_disable_unprepare(clk);
+	fsl_asoc_reparent_pll_clocks(&pdev->dev, clk, spdif_priv->pll8k_clk,
+				     spdif_priv->pll11k_clk, sample_rate);
+	ret = clk_prepare_enable(clk);
+	if (ret)
+		return ret;
+
+	return 0;
+}
 static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -659,6 +693,13 @@ static int fsl_spdif_hw_params(struct snd_pcm_substream *substream,
 	int ret = 0;
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		ret = spdif_reparent_rootclk(spdif_priv, sample_rate);
+		if (ret) {
+			dev_err(&pdev->dev, "%s: reparent root clk failed: %d\n",
+				__func__, sample_rate);
+			return ret;
+		}
+
 		ret  = spdif_set_sample_rate(substream, sample_rate);
 		if (ret) {
 			dev_err(&pdev->dev, "%s: set sample rate failed: %d\n",
@@ -1548,11 +1589,8 @@ static int fsl_spdif_probe(struct platform_device *pdev)
 	}
 	spdif_priv->rxclk_src = DEFAULT_RXCLK_SRC;
 
-	for (i = 0; i < SPDIF_TXRATE_MAX; i++) {
-		ret = fsl_spdif_probe_txclk(spdif_priv, i);
-		if (ret)
-			return ret;
-	}
+	fsl_asoc_get_pll_clocks(&pdev->dev, &spdif_priv->pll8k_clk,
+				&spdif_priv->pll11k_clk);
 
 	/* Initial spinlock for control data */
 	ctrl = &spdif_priv->fsl_spdif_control;
-- 
2.17.1

