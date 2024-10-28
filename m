Return-Path: <linuxppc-dev+bounces-2636-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CE1C9B2D6E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 28 Oct 2024 11:52:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XcVbP0PNTz2yNB;
	Mon, 28 Oct 2024 21:52:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2604:1380:4641:c500::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1730112769;
	cv=none; b=XULNgh9pLGs0xzrByreus2EtDjWkkcQ19gp9YoEKASpRp/LcMfpCe+5XRUqgajv8swUy56Ksl7qQ2pU9yLRgqGHiHsSXU7c9eZlJJHmr1MqGr3Y2on272cjlBKNaptbEQdubtgYT8PKQRkqSCPDmkP6LMTTxnAMyMft2vFAaEgnKUlv7tCcFlQhZtO6lUxZhnoz6PiDa5qFWZ2SyT8uJEXcDKZJDZLRRlD/w0qPCFlCUndH7UqyZla/ET4HTHE2rXSO+yAF8rOcMk9RxEStpgLkf1mWakafbbMS0KIGF4v7dMZN2p0EFNe9Lz5+/r1WK+5Ix4REY6yjOjxX3JD6x5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1730112769; c=relaxed/relaxed;
	bh=MArPwIibXOwBRHrqIyIhYklbYPYtAkoBXtUutKRY6/4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OfC02Q/3lHu47OHfl7ETSSyBpDwXF3i7qGYdLrY3k4iN7et4SQQMxMyRAnQ2vObIoqFiUcyd/R1UyXNRE4o+rtqhrI6chmxpmudm8xNWsZBiO/xOrdFwUR8Hl/V3uM8I1VKVsIWuaJZKMK7uigEKUTOleHmVbINbVxXYEXb7hUHA+BQ4aQbNrOTH8/9Trgv+R/PNeYugCqG5aSGYlcnlyuXAK8LnbINKu6O4/azrISHQ9oGntpFtj6BuEIQBEz2i/c+tV6KTsEmPcbV43xJfexsFhDOzixEBDLo7UjhY3uhjjmgi3h/aYzCVgps11X4HDyjudcTblHoWY4vgFJe7cw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nsoG3Xmm; dkim-atps=neutral; spf=pass (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=nsoG3Xmm;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=sashal@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XcVbN00Nqz2yN2
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 28 Oct 2024 21:52:47 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AAA355C4AC4;
	Mon, 28 Oct 2024 10:52:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 16C7AC4CEC3;
	Mon, 28 Oct 2024 10:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730112765;
	bh=rX41ZOQ5a9g3sr0RIrKQoLXoA0dMd/d6xOlSLFfu9tg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nsoG3Xmm2eMtS7GsKaCU473oR28k+uBfbn7R/lx3RagCxCdbq7x3ueMmiqfiaeES7
	 WzkvCNMSjdCh8Mno70w4gFJi8eIOJYWqBvfTHg497e66rxgtfOhR5BFp+4vYZwNARz
	 AXsxLjjRPBAWs5+AuI/MaDuPxerHvF0mgE2xH+iVZ8NyoA8TP5F1x4703C1mALXUKV
	 KnzRmx8ZgCwU7nSTkKz3dfN+ID+wj6+FDrN6nLCdTPUTHNAj3y2p5fQxZRWvoGUNvj
	 /pKvLPC+yMF2JJm+vEoZgQ/Np7Jtuql7wOZdM6gkL4p5pneMn+gDThz14MXONo5HFQ
	 FgUPZraumURBg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Shengjiu Wang <shengjiu.wang@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	lgirdwood@gmail.com,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH AUTOSEL 6.6 13/15] ASoC: fsl_micfil: Add sample rate constraint
Date: Mon, 28 Oct 2024 06:52:09 -0400
Message-ID: <20241028105218.3559888-13-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241028105218.3559888-1-sashal@kernel.org>
References: <20241028105218.3559888-1-sashal@kernel.org>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.58
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
	SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

From: Shengjiu Wang <shengjiu.wang@nxp.com>

[ Upstream commit b9a8ecf81066e01e8a3de35517481bc5aa0439e5 ]

On some platforms, for example i.MX93, there is only one
audio PLL source, so some sample rate can't be supported.
If the PLL source is used for 8kHz series rates, then 11kHz
series rates can't be supported.

So add constraints according to the frequency of available
clock sources, then alsa-lib will help to convert the
unsupported rate for the driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Link: https://patch.msgid.link/1728884313-6778-1-git-send-email-shengjiu.wang@nxp.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 sound/soc/fsl/fsl_micfil.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 0d37edb70261c..551c49ed375ef 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -28,6 +28,13 @@
 
 #define MICFIL_OSR_DEFAULT	16
 
+#define MICFIL_NUM_RATES	7
+#define MICFIL_CLK_SRC_NUM	3
+/* clock source ids */
+#define MICFIL_AUDIO_PLL1	0
+#define MICFIL_AUDIO_PLL2	1
+#define MICFIL_CLK_EXT3		2
+
 enum quality {
 	QUALITY_HIGH,
 	QUALITY_MEDIUM,
@@ -45,9 +52,12 @@ struct fsl_micfil {
 	struct clk *mclk;
 	struct clk *pll8k_clk;
 	struct clk *pll11k_clk;
+	struct clk *clk_src[MICFIL_CLK_SRC_NUM];
 	struct snd_dmaengine_dai_dma_data dma_params_rx;
 	struct sdma_peripheral_config sdmacfg;
 	struct snd_soc_card *card;
+	struct snd_pcm_hw_constraint_list constraint_rates;
+	unsigned int constraint_rates_list[MICFIL_NUM_RATES];
 	unsigned int dataline;
 	char name[32];
 	int irq[MICFIL_IRQ_LINES];
@@ -449,12 +459,34 @@ static int fsl_micfil_startup(struct snd_pcm_substream *substream,
 			      struct snd_soc_dai *dai)
 {
 	struct fsl_micfil *micfil = snd_soc_dai_get_drvdata(dai);
+	unsigned int rates[MICFIL_NUM_RATES] = {8000, 11025, 16000, 22050, 32000, 44100, 48000};
+	int i, j, k = 0;
+	u64 clk_rate;
 
 	if (!micfil) {
 		dev_err(dai->dev, "micfil dai priv_data not set\n");
 		return -EINVAL;
 	}
 
+	micfil->constraint_rates.list = micfil->constraint_rates_list;
+	micfil->constraint_rates.count = 0;
+
+	for (j = 0; j < MICFIL_NUM_RATES; j++) {
+		for (i = 0; i < MICFIL_CLK_SRC_NUM; i++) {
+			clk_rate = clk_get_rate(micfil->clk_src[i]);
+			if (clk_rate != 0 && do_div(clk_rate, rates[j]) == 0) {
+				micfil->constraint_rates_list[k++] = rates[j];
+				micfil->constraint_rates.count++;
+				break;
+			}
+		}
+	}
+
+	if (micfil->constraint_rates.count > 0)
+		snd_pcm_hw_constraint_list(substream->runtime, 0,
+					   SNDRV_PCM_HW_PARAM_RATE,
+					   &micfil->constraint_rates);
+
 	return 0;
 }
 
@@ -1124,6 +1156,12 @@ static int fsl_micfil_probe(struct platform_device *pdev)
 	fsl_asoc_get_pll_clocks(&pdev->dev, &micfil->pll8k_clk,
 				&micfil->pll11k_clk);
 
+	micfil->clk_src[MICFIL_AUDIO_PLL1] = micfil->pll8k_clk;
+	micfil->clk_src[MICFIL_AUDIO_PLL2] = micfil->pll11k_clk;
+	micfil->clk_src[MICFIL_CLK_EXT3] = devm_clk_get(&pdev->dev, "clkext3");
+	if (IS_ERR(micfil->clk_src[MICFIL_CLK_EXT3]))
+		micfil->clk_src[MICFIL_CLK_EXT3] = NULL;
+
 	/* init regmap */
 	regs = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(regs))
-- 
2.43.0


