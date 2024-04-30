Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 57B218B7883
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:11:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hQnRihbx;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMZ66yV3z3w6q
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:11:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=hQnRihbx;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::229; helo=mail-lj1-x229.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNk2rtDz3cSq
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:18 +1000 (AEST)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so89783591fa.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485795; x=1715090595; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=hQnRihbxItluZ9DNHkQgYcRtBPOMUjkJSDyf3M6LR6D85eU1l4VvI/Ro1g36zFISbA
         CyqdVMmNeT5dKRocAcCdRdg9SnTwe+FbhRDBb3zlk2QTBrnOS2AhiX2s5CAtAg0YKezQ
         qeXmbHFgHZHGLNj7C/Y/OcJay4YZb+8DfL0fo//ZIQVV+noj4W6D5QOosCu7TESma4HG
         g4+1Qr/7twfP5moJIh+N6DISrpdlV2Q5bBFp3F5RxwMaEXPRrQfaTngDB8Q3TxB4osKV
         3DQ2tmrXCXgxDWLR+vZgUpfG3k7lZxmhSye+IW/LTu6B8kqKSaREKQ2+GrBWXO1SVs3S
         pezA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485795; x=1715090595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HlReh/uKfKGykX7vYGkVx56/1oeqm3j6UBVK+Qmhu9k=;
        b=GRN7ep2eExT0NIqzzoqcUbqUZ7dQVgLZg0VLER08+yJDh+dbYzAG+J4S2dX/kinCQF
         m1kU8RrDplmzsPQCTmY8DSnDzNiDtry0mlFv/FIZXTU4PN9SGi3PGV390sEtI4itzR1T
         PUtcojwudg66p8M5b8s6yWDMlnW6sY9O3nUbx3fTVspmDMJOYe39vgqbNcoMeRGu2WRP
         mElWYl1nURU0RiOd0xnye0rX654sal7lIXOGxyhdZBUYlJo3Jzr2DAm0eYdTSQ8BjqmE
         evPAQ/Vl0sLAEEwNln723b08i7lSc/1Nq8wWgVOjLEx334jc0u+MdarIAouXXdYwWw1R
         sl5A==
X-Forwarded-Encrypted: i=1; AJvYcCXDicTW/kT5rxt/BgNStehmAJUDx/Bm8mbXMMkbJZGYWxXeOatQl7JE2xqTgdjdEGJKHxReBorMveBhIM1wDLoODjU5TGugzn75v/j2KA==
X-Gm-Message-State: AOJu0Yxb2/7TUMYhRaIe5lIL44PsIR+Pp3S8t322eEPG+qqo0eSjlzrV
	vfRf3rfpt5haRjzTLm3g1w38gcd9CVa8ULEcPGD1WNx9FArfB+CO27JdEmZzvMc=
X-Google-Smtp-Source: AGHT+IEjPyu9X1615THrmlgihVBnJj6snuJyIqe3VYMH9bOXPEPLADlqYnOlMYNNwswyFzCxSlW3hA==
X-Received: by 2002:a2e:9145:0:b0:2df:b2d5:5935 with SMTP id q5-20020a2e9145000000b002dfb2d55935mr8668895ljg.28.1714485792538;
        Tue, 30 Apr 2024 07:03:12 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:11 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:19 +0200
Subject: [PATCH 10/13] ASoC: mediatek: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-10-6f8a8902b479@linaro.org>
References: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Banajit Goswami <bgoswami@quicinc.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Daniel Mack <daniel@zonque.org>, 
 Haojian Zhuang <haojian.zhuang@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, 
 Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
 Fabio Estevam <festevam@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Ban Tao <fengzheng923@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=13819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=74+WER8rBVNChp8T011lJzusbjvdwfTeUc05vWQCtnc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2wIAKWRRmb3f+Eu7E/sNsicAIeRJntuzxZ
 SxYr98J11CJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 1yOiD/9+no2oO2meu/Ufx9CEy3qSO7oTggEWW3FaqAqFcceuY3ZcL6EMZ2biHC/QRNK4ebDskKU
 3O2P3faEC8XJpoITbkbDIiqXeyFCKlF8xXpOUoqJU2b/1DL8tjHLJ65Dg+xoktZHD2NWmNoQiRg
 eIA9zZjygsEGOywLbr00ulna67FOpbcwyo0pYJ3dQYy1TyOTBy9jFGsl8RxPBCcZfhE2P3xy9Op
 3YJQdjnLIEm0nGjkPUwV/mbyv1dB9guABGSShJm5gvvH+W+/cqmtzgzKa5lD3MLc//md1a3Ju+V
 GYH6YWtUfX7QSYdrf2odSjymVm9iBei+GgTtQW9SfPeVHHo17PilaDoe5GVaygZohC2HM2K33n1
 Po5GQ+qHU9/lDaSYbLMh26vyEayDUXnoxPUHaOgSiNZamo6XG6T07CTTJnF0XA0JoNRQd5eyWJs
 BHmwevPcP6/bP/iV9hjNJnOo7ORDuwBCFPhQlH2IgPI/WGR/3ux6Ozr54ngy6kgQ1l8FYVYJ5zm
 lkr1t63qAutgNeS0JPV+5JJfLfhPY0jPjSPT2oOa93zLB79CYb2OCU4CZNxFUoUZ1ICYyxfXdkz
 vSpyKtJNvE/u0Mzrwu0nPoMZhU+mWKpd1utzIbZX8OCoJLTfC5V20Hpv2quS3imeWDvF5BCURTw
 YI43f977A5OcnvA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do not open-code snd_soc_substream_to_rtd().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 7 files changed, 24 insertions(+), 24 deletions(-)

diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index c1c486e275b9..572ded279b53 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -106,7 +106,7 @@ static const struct snd_pcm_hardware mt7986_afe_hardware = {
 static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
@@ -116,7 +116,7 @@ static int mt7986_memif_fs(struct snd_pcm_substream *substream,
 static int mt7986_irq_fs(struct snd_pcm_substream *substream,
 			 unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
 
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
index bfcfc68ac64d..bafbef96a42d 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-pcm.c
@@ -40,7 +40,7 @@ static const struct snd_pcm_hardware mt8186_afe_hardware = {
 static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -82,7 +82,7 @@ static int mt8186_fe_startup(struct snd_pcm_substream *substream,
 static void mt8186_fe_shutdown(struct snd_pcm_substream *substream,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -104,7 +104,7 @@ static int mt8186_fe_hw_params(struct snd_pcm_substream *substream,
 			       struct snd_pcm_hw_params *params,
 			       struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	unsigned int channels = params_channels(params);
@@ -153,7 +153,7 @@ static int mt8186_fe_hw_free(struct snd_pcm_substream *substream,
 static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8186_afe_private *afe_priv = afe->platform_priv;
@@ -252,7 +252,7 @@ static int mt8186_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 static int mt8186_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -269,7 +269,7 @@ static int mt8186_get_dai_fs(struct mtk_base_afe *afe,
 
 static int mt8186_irq_fs(struct snd_pcm_substream *substream, unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 		snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -290,7 +290,7 @@ static int mt8186_get_memif_pbuf_size(struct snd_pcm_substream *substream)
 static int mt8186_fe_prepare(struct snd_pcm_substream *substream,
 			     struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366.c b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
index 8fd31c52b077..771d53611c2a 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366.c
@@ -297,7 +297,7 @@ static const struct snd_soc_ops mt8186_da7219_i2s_ops = {
 static int mt8186_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
index 9647fe133dc8..ccb6c1f3adc7 100644
--- a/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
+++ b/sound/soc/mediatek/mt8188/mt8188-afe-pcm.c
@@ -91,7 +91,7 @@ int mt8188_afe_fs_timing(unsigned int rate)
 static int mt8188_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component = NULL;
 	struct mtk_base_afe *afe = NULL;
 	struct mt8188_afe_private *afe_priv = NULL;
@@ -300,7 +300,7 @@ static int mt8188_afe_enable_cm(struct mtk_base_afe *afe,
 static int mt8188_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -334,7 +334,7 @@ static int mt8188_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
@@ -358,7 +358,7 @@ static int mt8188_afe_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 {
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	const struct mt8188_afe_channel_merge *cm = mt8188_afe_found_cm(dai);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime * const runtime = substream->runtime;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index f629fc6bbb53..eba6f4c445ff 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -557,7 +557,7 @@ enum {
 static int mt8188_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int rate = params_rate(params);
 	unsigned int mclk_fs_ratio = 256;
 	unsigned int mclk_fs = rate * mclk_fs_ratio;
@@ -658,7 +658,7 @@ static int mt8188_dumb_amp_init(struct snd_soc_pcm_runtime *rtd)
 static int mt8188_max98390_hw_params(struct snd_pcm_substream *substream,
 				     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int bit_width = params_width(params);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai;
@@ -821,7 +821,7 @@ static const struct snd_soc_ops mt8188_nau8825_ops = {
 static int mt8188_rt5682s_i2s_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 64af9bf363fd..38891d1bd18a 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -84,7 +84,7 @@ int mt8195_afe_fs_timing(unsigned int rate)
 static int mt8195_memif_fs(struct snd_pcm_substream *substream,
 			   unsigned int rate)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_component *component =
 			snd_soc_rtdcom_lookup(rtd, AFE_PCM_NAME);
 	struct mtk_base_afe *afe = snd_soc_component_get_drvdata(component);
@@ -281,7 +281,7 @@ mt8195_afe_paired_memif_clk_prepare(struct snd_pcm_substream *substream,
 				    struct snd_soc_dai *dai,
 				    int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -310,7 +310,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 				   struct snd_soc_dai *dai,
 				   int enable)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	struct mt8195_afe_private *afe_priv = afe->platform_priv;
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -342,7 +342,7 @@ mt8195_afe_paired_memif_clk_enable(struct snd_pcm_substream *substream,
 static int mt8195_afe_fe_startup(struct snd_pcm_substream *substream,
 				 struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
@@ -380,7 +380,7 @@ static int mt8195_afe_fe_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params,
 				   struct snd_soc_dai *dai)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct mtk_base_afe *afe = snd_soc_dai_get_drvdata(dai);
 	int id = snd_soc_rtd_to_cpu(rtd, 0)->id;
 	struct mtk_base_afe_memif *memif = &afe->memif[id];
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 62e4e34cffbb..ca8751190520 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -338,7 +338,7 @@ static const struct snd_soc_ops mt8195_hdmitx_dptx_playback_ops = {
 static int mt8195_dptx_hw_params(struct snd_pcm_substream *substream,
 				 struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 
 	return snd_soc_dai_set_sysclk(cpu_dai, 0, params_rate(params) * 256,
@@ -394,7 +394,7 @@ static int mt8195_dptx_hw_params_fixup(struct snd_soc_pcm_runtime *rtd,
 static int mt8195_rt5682_etdm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);

-- 
2.43.0

