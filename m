Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C33A48B783F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:06:23 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G+AoN2rr;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMSF3CZzz3dDn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:06:21 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=G+AoN2rr;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNB5lcmz3cSM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:02:50 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a58e2740cd7so563076766b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485767; x=1715090567; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=G+AoN2rrNCTUcEQbGkJH9+d5ikCHNObOEqOqzwJhUrXOvrdxVqtHDO+Utjgn4hGtYe
         zLOrli86YFQ7HROvlYWkVkoq65baCcTmhVIV5toPtjvqlGjAePRLGJ1fEKr6sbFtUef+
         b+scHNeltyLRNfGEDdsL1LkoGSGF7Qyzy63ZFqC/SR9flMn/jqu/Qc6ZJPH6qRQThL+j
         pjApCvAilSKD9I5QbzO0AZG1OiNfFoH0hFoTMQTfj13MkKl4JyhP2wWQc/ky5vfdzMYu
         90zXcod+p0kEat1M6/pXLj2gPpKNlcgAKx0F/8nY+cwvvZehiLG0s0yj4HdHu9x7TmKs
         7e1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485767; x=1715090567;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sVmB3IwNsO++LEmxsGA1Of52OGeiLTZOoIEqlaO4Y6U=;
        b=glhw/3mpAiCZ+rmVJB5h9hOHbZZMAhXu/QXBFUlY0CtZWYRzPwd8r+kxcotZbrQcC3
         7YuO1vG1PKXRK0vsQkYNh4yB13vFiYJLQoCjDdxyYrUk9Y99vNLE1tHoFyJFHmIsRV46
         KaqTlqvgjs+5BF9TUlSLYj49J7NRN9CtyRzinXhJRSG9LKyqq2zjXdzxEpSzfyUW06TU
         QowYvWdTUGRyFEF1+Yoyi/bRjK0G9svQRSX3dfO7UjXcfvbaqh247AqPsV+DwebeBDoP
         7RwWC+ICP6JM8w4kh+Kvqi39P7MbmRBWd3yOoZsJlYfqjrCPzxEbZHlG3ptI2t9kGsOA
         V4oA==
X-Forwarded-Encrypted: i=1; AJvYcCXJ1CwVankVZjOXsfZ35se/d9IgJLBGiSYGkPUSvl1GizGiLpIJ2kArvERv4GJ2L95DEA3DWxZfJz5TOXbub2JrnD2xFgWVpAY8AifNag==
X-Gm-Message-State: AOJu0YysZHGROaNr3uO0C1njTXx9+rYsvhS3/LoKFOgC7G+rhKddS4co
	yBTtztIcFO4D5RQQdvPzhHmQifeevwbeZDBADRd91MM2eCsgjmqkF7PZZbrtzMg=
X-Google-Smtp-Source: AGHT+IFp03X1JFPDrIujOHhWiOUjRy/996U+B0l6yK76tZHW13kgA6dvKPQweqrNY0l31/l3LaTzjw==
X-Received: by 2002:a17:906:3ac3:b0:a58:ebdd:8aa4 with SMTP id z3-20020a1709063ac300b00a58ebdd8aa4mr2360562ejd.20.1714485766998;
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:46 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:13 +0200
Subject: [PATCH 04/13] ASoC: arm: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-4-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1205;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=eDseprbctVXAhiZOvRsQsRjQ1srjlolDCUwu7Poiuqc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnwqTKqjOWhyghuqcWCQALMCLVh7T8zMCEGN
 dvM+Z0GdNKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58AAKCRDBN2bmhouD
 18RiD/4qLIFwqpuprQ1tMuUxq4zKnCWe3121KK341e3C6K9aJyN/BTLnFTKGCeHCS8O34sFL66W
 T7sO0tVkpzvEVFOfhdAxTxVSNxk8b8r6nlylo9rzqkM9QzU1SQsGJxog0QKojxAO0I6sntjpOI1
 C4eLl6KKsV1j1hvxU76kJP6e32eMeIdiZaAxMmQsQSK0v013+TK6DZ0Pzoka7GW21s3JFCovROF
 vXxmHvtZZeMHmbCCg5y/XZBWunSMfsNrjjgO+mIu7XV7gkK7P9MQYjLZJqqQZ+vhoD2Qg9UAnk7
 OQE9DLavtk9A5wwayHHudVq/E4K3OsGqYV+1R5o5G1+IXBsr5pk5VcYEwd60z1VKxXXSO/b83Yc
 ENbgYWPE1yLUGcTgo4uG5za0uVWxDFi/b7wDRbmmROHuH09+9ryGv2cvKPGHQDn8f6u5L/cH8NS
 Ks+CcsLhi9wVjDnpMDTWNA/8OLpqgOgk1oqEI3Ef0cIjYKbQDoqPj8qg/30LXXJWsi3ixd/UGXX
 LNNqCHmIDRExk6Qjid/ky+fQP2yP3ITflnWYCAlkkGB6jsfhk/qkiIbv4uytjIVSSs+x9OJUdPk
 73ZmPvgfk/AnUFwJpDnK2XdUlBKSk6Z3H5g0na7JWMYATpXKrxMAJjcyW1bMqbdfGqkv8gNWzrz
 mSfEosfDuUmcoLg==
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
 sound/arm/pxa2xx-pcm-lib.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/arm/pxa2xx-pcm-lib.c b/sound/arm/pxa2xx-pcm-lib.c
index 51d2ff80df16..571e9d909cdf 100644
--- a/sound/arm/pxa2xx-pcm-lib.c
+++ b/sound/arm/pxa2xx-pcm-lib.c
@@ -33,7 +33,7 @@ int pxa2xx_pcm_hw_params(struct snd_pcm_substream *substream,
 			 struct snd_pcm_hw_params *params)
 {
 	struct dma_chan *chan = snd_dmaengine_pcm_get_chan(substream);
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	struct dma_slave_config config;
 	int ret;
@@ -79,7 +79,7 @@ EXPORT_SYMBOL(pxa2xx_pcm_prepare);
 
 int pxa2xx_pcm_open(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct snd_dmaengine_dai_dma_data *dma_params;
 	int ret;

-- 
2.43.0

