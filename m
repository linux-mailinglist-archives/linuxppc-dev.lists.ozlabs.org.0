Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id CC90D413CB7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 21 Sep 2021 23:41:04 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HDZcG55CKz3000
	for <lists+linuxppc-dev@lfdr.de>; Wed, 22 Sep 2021 07:41:02 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=jPvOfkC9;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=broonie@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=jPvOfkC9; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HDZWg5kB4z3c80
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 22 Sep 2021 07:37:03 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4563261019;
 Tue, 21 Sep 2021 21:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632260221;
 bh=G7kWIcw4ckECqndMsfL0TFZeJcsVijEwbp3xeXyzy6s=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jPvOfkC95HGyn8KibMlCXjpanucalXwrjPFvpm3YaIhZZraGeYxydLukOaVah10qA
 EFg80auHm8KNvGb3RxCgM7fta9fT5iC6mgPZuApjOY/SXGr9VDov/fhO3+ioB6eBbm
 UzLQ9gkn4i4PaeEHFetcsBPxmJsXbH8Az0WwKrNjbwIoauDreYSNNLl5sKByKmEaSa
 CNtrjBNJt/gelDc5kFoPhLwTx8QTtrHmS0yM8kE8AfbjV3cnwx15xB4K/b1evhyC0A
 16X9icPl0oJBoY97tYx9ihiTDn9ZXC6OyVs+sLNF+vNTNBi0RMgbUz58/yG7Rq3Qxm
 B7Mhvt31ZLYmQ==
From: Mark Brown <broonie@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: [PATCH v2 07/16] ASoC: fsl_ssi: Update to modern clocking terminology
Date: Tue, 21 Sep 2021 22:35:33 +0100
Message-Id: <20210921213542.31688-7-broonie@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210921213542.31688-1-broonie@kernel.org>
References: <20210921213542.31688-1-broonie@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4340; h=from:subject;
 bh=G7kWIcw4ckECqndMsfL0TFZeJcsVijEwbp3xeXyzy6s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBhSk8YHTyBkFIgFWPSSM7RcGqhjDLLq/Qb3JfQlk8H
 8gmQD6yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCYUpPGAAKCRAk1otyXVSH0CCZB/
 0RCqCGoZy2uQipO9OTLyfb5kosGNW8wq2v+XhQhjlJ9bXpfLJuHYAdUe3c7ezc24yA3Qj2wWlydFUr
 Cx24LgeYc19drt309/LNlx0RG+MpL2Xj5bOuUXU/cVMppVBt6y7bpXNsqHNfBbOtfwxMbhNumqcC5c
 LxqBsWDFuyjeUFUW+qm3O0MdR3ADugM9MLLfuu4PcVVFGROIwj0dh6tO0CFK+MFtWvXKrsOVo+kLGO
 JQuSGAdlkK/SsnrDsL5rJWGONQTCapjuStkcLlm70b0bVR1nQrPFdHD6Bm5TEZGLbpXo5yicbwuNg4
 Jsick0pSFIxVAhHOYSpSO6q5cizQOH
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
Content-Transfer-Encoding: 8bit
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
Cc: alsa-devel@alsa-project.org, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

As part of moving to remove the old style defines for the bus clocks update
the fsl_ssi driver to use more modern terminology for clocking.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 sound/soc/fsl/fsl_ssi.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index ecbc1c365d5b..1169d1104b9e 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -350,16 +350,16 @@ static bool fsl_ssi_is_ac97(struct fsl_ssi *ssi)
 		SND_SOC_DAIFMT_AC97;
 }
 
-static bool fsl_ssi_is_i2s_master(struct fsl_ssi *ssi)
+static bool fsl_ssi_is_i2s_clock_provider(struct fsl_ssi *ssi)
 {
-	return (ssi->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBS_CFS;
+	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		SND_SOC_DAIFMT_CBC_CFC;
 }
 
-static bool fsl_ssi_is_i2s_cbm_cfs(struct fsl_ssi *ssi)
+static bool fsl_ssi_is_i2s_cbp_cfc(struct fsl_ssi *ssi)
 {
-	return (ssi->dai_fmt & SND_SOC_DAIFMT_MASTER_MASK) ==
-		SND_SOC_DAIFMT_CBM_CFS;
+	return (ssi->dai_fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) ==
+		SND_SOC_DAIFMT_CBP_CFC;
 }
 
 /**
@@ -808,7 +808,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 	u32 wl = SSI_SxCCR_WL(sample_size);
 	int ret;
 
-	if (fsl_ssi_is_i2s_master(ssi)) {
+	if (fsl_ssi_is_i2s_clock_provider(ssi)) {
 		ret = fsl_ssi_set_bclk(substream, dai, hw_params);
 		if (ret)
 			return ret;
@@ -841,7 +841,7 @@ static int fsl_ssi_hw_params(struct snd_pcm_substream *substream,
 		u8 i2s_net = ssi->i2s_net;
 
 		/* Normal + Network mode to send 16-bit data in 32-bit frames */
-		if (fsl_ssi_is_i2s_cbm_cfs(ssi) && sample_size == 16)
+		if (fsl_ssi_is_i2s_cbp_cfc(ssi) && sample_size == 16)
 			i2s_net = SSI_SCR_I2S_MODE_NORMAL | SSI_SCR_NET;
 
 		/* Use Normal mode to send mono data at 1st slot of 2 slots */
@@ -865,7 +865,7 @@ static int fsl_ssi_hw_free(struct snd_pcm_substream *substream,
 	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
 	struct fsl_ssi *ssi = snd_soc_dai_get_drvdata(asoc_rtd_to_cpu(rtd, 0));
 
-	if (fsl_ssi_is_i2s_master(ssi) &&
+	if (fsl_ssi_is_i2s_clock_provider(ssi) &&
 	    ssi->baudclk_streams & BIT(substream->stream)) {
 		clk_disable_unprepare(ssi->baudclk);
 		ssi->baudclk_streams &= ~BIT(substream->stream);
@@ -891,18 +891,18 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 	ssi->i2s_net = SSI_SCR_NET;
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
-		switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-		case SND_SOC_DAIFMT_CBS_CFS:
+		switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+		case SND_SOC_DAIFMT_CBC_CFC:
 			if (IS_ERR(ssi->baudclk)) {
 				dev_err(ssi->dev,
 					"missing baudclk for master mode\n");
 				return -EINVAL;
 			}
 			fallthrough;
-		case SND_SOC_DAIFMT_CBM_CFS:
+		case SND_SOC_DAIFMT_CBP_CFC:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_MASTER;
 			break;
-		case SND_SOC_DAIFMT_CBM_CFM:
+		case SND_SOC_DAIFMT_CBP_CFP:
 			ssi->i2s_net |= SSI_SCR_I2S_MODE_SLAVE;
 			break;
 		default:
@@ -962,17 +962,17 @@ static int _fsl_ssi_set_dai_fmt(struct fsl_ssi *ssi, unsigned int fmt)
 		return -EINVAL;
 	}
 
-	/* DAI clock master masks */
-	switch (fmt & SND_SOC_DAIFMT_MASTER_MASK) {
-	case SND_SOC_DAIFMT_CBS_CFS:
+	/* DAI clock provider masks */
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_CBC_CFC:
 		/* Output bit and frame sync clocks */
 		strcr |= SSI_STCR_TFDIR | SSI_STCR_TXDIR;
 		scr |= SSI_SCR_SYS_CLK_EN;
 		break;
-	case SND_SOC_DAIFMT_CBM_CFM:
+	case SND_SOC_DAIFMT_CBP_CFP:
 		/* Input bit or frame sync clocks */
 		break;
-	case SND_SOC_DAIFMT_CBM_CFS:
+	case SND_SOC_DAIFMT_CBP_CFC:
 		/* Input bit clock but output frame sync clock */
 		strcr |= SSI_STCR_TFDIR;
 		break;
@@ -1341,7 +1341,7 @@ static int fsl_ssi_imx_probe(struct platform_device *pdev,
 		}
 	}
 
-	/* Do not error out for slave cases that live without a baud clock */
+	/* Do not error out for consumer cases that live without a baud clock */
 	ssi->baudclk = devm_clk_get(dev, "baud");
 	if (IS_ERR(ssi->baudclk))
 		dev_dbg(dev, "failed to get baud clock: %ld\n",
-- 
2.20.1

