Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6918B7848
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:07:04 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ESoaPv5I;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMT22nvkz3vhm
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:07:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ESoaPv5I;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62e; helo=mail-ej1-x62e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNJ5Gz2z3cVd
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:02:56 +1000 (AEST)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-a5557e3ebcaso939127966b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485773; x=1715090573; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9KNDmF6F3m74+nDreAw5/fBepQ+vGW6wvqeA9DbjkOo=;
        b=ESoaPv5I/MR14AEwC1x21vD6tmUkUL4thFXElcNtw5j3/xYo6GbhQSwi9bu5uet8sK
         04asDLJlBtSfiiFYS7gQnSuDLs9NkhOfgbnn5nLLMbVbWp64TicgR9hUx5iR42tND0j/
         SliN9y0p/5XMuqqWZ1xwTtVpNXc+6KO/z1vUGKXPMlkomBmuYqxa6Imrt7viuc3FDGlu
         4cPMQJ/wnlFcFaEpyMnuEo5UDnEq5bvSaVgp1qwLZwW2bwLF12sPgQuN82Hs5qHpHnaX
         /pUIpBxnrhUi8tsLqR4QnMSr8vOcuwtG1aBEgfyVS5d/kdnAYOmMOBQPim7cueUP2FMZ
         GZGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485773; x=1715090573;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9KNDmF6F3m74+nDreAw5/fBepQ+vGW6wvqeA9DbjkOo=;
        b=GYvxCbZ3nRZEuRohXK2ccHzv2yG66w4jNSFgTbSUO9RCHdJW4O6uU4Spwgt46emFDl
         qDT4UmFqnf/XgI/Cs+ljTbofm8bO1Jt53UCQHcm66i17gILrXdWQSWPz2HG1Xh0mxMDJ
         GlSGogfJzEAYRL+Mp9i+o1vyMlxIzUuR8bPe9xBfm1rEClNXg2FGaEcioZv1WCXRlAXC
         q56Oyca3tSPT88XJRzGU+07kTIlATSQFkTzCVZjRipCt7w7MVAKIUgt88SElSu4Y9dOY
         hCNmpTbzzxGFzs2hZGRAf4B3zFnFWmQkPSh2XPLtbncCRvx9DIuw89EGTDTE9WhUxqrn
         CdTA==
X-Forwarded-Encrypted: i=1; AJvYcCXWdcNlxr2J8u1DbIzQb+pv06NGT9ahnmheRhUIyiWHH33/HNUrmX3KHlOzxe7YtSU3vm85FX6daBk2xU0CyNN1ucWX+a3Zp6xNrLEw1w==
X-Gm-Message-State: AOJu0YxvACYnCredKAPS84Bgw8XMC2GadgRSUa7crJtVMDsYE6UfDCPT
	xsmV7XHSUdLhIWC6vHGO8zaFA4J2/hvuIHHn6UeMXB8qMj38WMB45FQhCU61MZs=
X-Google-Smtp-Source: AGHT+IG/ZiponzJElmGagl83BnX3KT4uxCge8Ge47biNA19yQUZRpq529TvSC+CjU+ZaC4bHHg0f4A==
X-Received: by 2002:a17:907:7892:b0:a51:abd8:8621 with SMTP id ku18-20020a170907789200b00a51abd88621mr2756333ejc.19.1714485772679;
        Tue, 30 Apr 2024 07:02:52 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:52 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:14 +0200
Subject: [PATCH 05/13] ASoC: amd: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-5-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2245;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=/1R0OmMKMV4s3Y8w3vGDBextL0ongiiaeIRyC36ykHM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnxeEAVYc1UmVefhlabtyjgdGe38YIR/9kHe
 88Pd0erXViJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58QAKCRDBN2bmhouD
 13M+D/4v2IeMte5vzz35J+GSwt7AUvJI6iiLCBM0Feu/9wQWRBj36O7yPQreb40lyCMtfUWWmb8
 PShQ3rPb8K6XWqMorWGoy5zD+sdIlhb3aWdBInfWwoMeTWxADZZqB+m8/PW3NnAEd9TqRNPKDzQ
 jWO60UiF8okwGVwjHAgprvGmhVSjbNI5b5g/PnV4ttO98aUjFne8AK3/v4C1DcS3awukX5VnTy1
 o1tZft+T6oiNutSPknPNyp2e5UMWDq8hNQzw3jdk4AaoJE9hpFvcrsQPZ+VnqOYZgBEvVVxzBvP
 F2I2uZ0c0mauf6GMEdHrqzLHGBc1gp99UZ8uAQssnSLSezJhM1SeIt5OCFiN9uy9UuvLStU2nks
 AQ2HWvKuN0XC7sRtuOgRTf8M30UUcO1Dm1iNeyQ3t4JdCEiXZ/ZQnG0+G8T2RN2gTcHBw76uZtA
 wt6P3w7TbxrYOWmPYbdW3DPPI4BMRNgYcPkq2qUpO3Ni0yaF5U/tH7Zprko1lynY03aPlkdyyeH
 p0Fg98AeEb7XYDd0cAJPC/j2leODUWvm/g8HvufxNzL7j78grTfc59M1lb9ogOQp9e2K1UDEAvB
 Efq5+HYBjP++8fA9Gwf5msphLx/h/eRifC+99A5yPh9l9gtluGNv38A8cEcrlAMPbo/N0GbTHXH
 R12gBWVNQAkbTwQ==
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
 sound/soc/amd/acp/acp-mach-common.c  | 2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c        | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/sound/soc/amd/acp/acp-mach-common.c b/sound/soc/amd/acp/acp-mach-common.c
index 665a6ea0a2a8..a36300a4ed8a 100644
--- a/sound/soc/amd/acp/acp-mach-common.c
+++ b/sound/soc/amd/acp/acp-mach-common.c
@@ -217,7 +217,7 @@ static void acp_card_shutdown(struct snd_pcm_substream *substream)
 static int acp_card_rt5682_hw_params(struct snd_pcm_substream *substream,
 				      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct acp_card_drvdata *drvdata = card->drvdata;
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
diff --git a/sound/soc/amd/acp3x-rt5682-max9836.c b/sound/soc/amd/acp3x-rt5682-max9836.c
index d6cdb6d9fdd6..357dfd016baf 100644
--- a/sound/soc/amd/acp3x-rt5682-max9836.c
+++ b/sound/soc/amd/acp3x-rt5682-max9836.c
@@ -143,7 +143,7 @@ static int rt5682_clk_enable(struct snd_pcm_substream *substream)
 static int acp3x_1015_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai;
 	int srate, i, ret;
 
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 66b800962f8c..2f630753278d 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -218,7 +218,7 @@ static int acp63_sdw_dma_open(struct snd_soc_component *component,
 	struct acp_sdw_dma_stream *stream;
 	struct snd_soc_dai *cpu_dai;
 	struct amd_sdw_manager *amd_manager;
-	struct snd_soc_pcm_runtime *prtd = substream->private_data;
+	struct snd_soc_pcm_runtime *prtd = snd_soc_substream_to_rtd(substream);
 	int ret;
 
 	runtime = substream->runtime;

-- 
2.43.0

