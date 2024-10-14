Return-Path: <linuxppc-dev+bounces-2183-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DDA299BFAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 14 Oct 2024 08:02:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XRmpR2K3Sz3bfj;
	Mon, 14 Oct 2024 17:02:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=92.121.34.13
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728885727;
	cv=none; b=obA1kNETTCBJaRMeXIMC6Vzm1cg4moiL9zf1vr36opFZRxgnVJcjXg7bUK+TNseATv+gDwLxcV04X2SSSpcLhwBKy/ONddha/cPb1TYxNpRb2VJN5K11nJxSHh97gabFO6GeV82h/gkdJPei5b8kRoK2kQP1+Kj4ZhQ5P967n6R3CQfMfmw1APSwzpvJomQYBSdYI+duHMc96Ij/hJNWqIDf8EbM+V0xxNkHh7zGMd8DoUwGZZI7TnyDtS5iCiyRF3h18iIeK1koJVdUFGIBoBCmJY/8F6lm6K3ucAPC1pV+yQWi0z0vEjfEYHT3zE/wdozQOtlEd2Y6Y1VA5bfHUg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728885727; c=relaxed/relaxed;
	bh=37bGOE+1/YukgQOjYvpC5wjBOTT/W8+5WDoNP6gTw+c=;
	h=From:To:Subject:Date:Message-Id; b=l5KbWZSV2Gex8/XGClKP+COE+xQoutaMlYytf0F6sbP803J90etv2gmzMrHcK+8uOpZTYRdZLsmOZr5rOr1wGX+wws22BZYxzMwmoXADZDm3zU21T0t6ppmcydApCtF7Zyia9056yXJrMvEJS8pHLk1X/+AIhOvOIc26N5oa0VPtPhFZVqZPY/3cxqebXQNYZ7v+y1zCVKjgGQWo9GgRObL52suzuh9QYBMA9uIGzH9lfAHFJoJc4L6PXBWgfoI4fes9RqYO7Y9Gux3+sh3Vx0LbfzajZZvkus8X+iSSSkx8IICz+9rmQ8oGGCXvefcMSS2PzcQfYQ8rgVuzIuIIbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com; spf=pass (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org) smtp.mailfrom=nxp.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=nxp.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=nxp.com (client-ip=92.121.34.13; helo=inva020.nxp.com; envelope-from=shengjiu.wang@nxp.com; receiver=lists.ozlabs.org)
Received: from inva020.nxp.com (inva020.nxp.com [92.121.34.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XRmpP6bBSz3bdX
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 14 Oct 2024 17:02:05 +1100 (AEDT)
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 590D51A1440;
	Mon, 14 Oct 2024 08:02:02 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 1F2501A1281;
	Mon, 14 Oct 2024 08:02:02 +0200 (CEST)
Received: from localhost.localdomain (shlinux2.ap.freescale.net [10.192.224.44])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 906AF183DC03;
	Mon, 14 Oct 2024 14:02:00 +0800 (+08)
From: Shengjiu Wang <shengjiu.wang@nxp.com>
To: shengjiu.wang@gmail.com,
	Xiubo.Lee@gmail.com,
	festevam@gmail.com,
	nicoleotsuka@gmail.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ASoC: fsl_micfil: Add sample rate constraint
Date: Mon, 14 Oct 2024 13:38:33 +0800
Message-Id: <1728884313-6778-1-git-send-email-shengjiu.wang@nxp.com>
X-Mailer: git-send-email 2.7.4
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Status: No, score=-0.0 required=5.0 tests=RCVD_IN_MSPIKE_H2,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>

On some platforms, for example i.MX93, there is only one
audio PLL source, so some sample rate can't be supported.
If the PLL source is used for 8kHz series rates, then 11kHz
series rates can't be supported.

So add constraints according to the frequency of available
clock sources, then alsa-lib will help to convert the
unsupported rate for the driver.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
---
 sound/soc/fsl/fsl_micfil.c | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 4e65966d54fc..619ee7a5b867 100644
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
@@ -450,12 +460,34 @@ static int fsl_micfil_startup(struct snd_pcm_substream *substream,
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
 
@@ -1160,6 +1192,12 @@ static int fsl_micfil_probe(struct platform_device *pdev)
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
2.34.1


