Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BD428B7859
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:08:33 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BfbJONrc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMVk5HwWz3vxK
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:08:30 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=BfbJONrc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::629; helo=mail-ej1-x629.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNS5tX0z3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:04 +1000 (AEST)
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-a58ebdd8b64so336054766b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485781; x=1715090581; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8wnYPNchoJMJHPXPE9uqd4IXLQ1+2DNP0wbgQTer3qE=;
        b=BfbJONrcsMngrK3nh+zgfQp/Oe9UDVtK9Zn8xOqt+4B20LjDMPicb1BQv9damQS+tW
         iI/2/i8+//t1C5LNuELW44IDzi4cHnp0Svm1AWF/JWVCkpLpmN1YSFgqtef8eGxIsERR
         jW8GPCpKsQZen2xmZZ7eQsYtyOvCGv/dw6y3iSArXTCix6A272INb8Cx6NxuRj1Af55N
         eM+D0cHmdl+xiq+P9O3YiKj3C1HolR2vNSfBpVQUNHiK7VmUH+QsSnL5gT7LWdl3nZcG
         hamVwo6JQcH3ISgtSDRm7sGdVyPJJNUUh2sOV2aZyHGeWmoIjfkt924bRBtkR4O9VM1r
         yitg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485781; x=1715090581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8wnYPNchoJMJHPXPE9uqd4IXLQ1+2DNP0wbgQTer3qE=;
        b=U6nJ2LtCjkOb0IUwio7Y8lFQStb+v8Gx/D7jWOQGyce14LgykG7AAHOwnsU68GbjHP
         CUyQcjK861yTKKtTnNp0sr/nQG2tUI4wZ5qbMlV6C3rfUQBANYgciPOw4WUhwKfhVF4l
         gubsbDsLNzpm9YCra+OtC8OsUcpAo0jAWrvvYNGVbQ2MrHWxPR0nzF6rpE9iZhNSE7sv
         JusO3R4boUYeFrdoHhH7Acra+G5pJiz99lILK4I38tbAcrlC+6gwB2/dE3cpYMQHmVUx
         AxJlG3E5cDnaXaCMZy5bZANC9cvkPwjmsB3rdl3rtEEC7Ne8kc+O3D0h1AI75FdA9DdR
         rjYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtFTSGn51POwJUQxO8jd6ues12yIwrR11B3iGGvXTgs//bIeWBJKxhd3C6/JDJKp0bzzaC+PvAbG3Fcq/OF9w/5C0do1BMJoL3695enA==
X-Gm-Message-State: AOJu0Yxc3fWsNUpvfRqW2PktJMGCDUhQuA+Iu93Ccbi8ELmq4cO8oNnZ
	RwuIujxCI4W0Jy3CZ8R2y+Y/I2B5igJIU4h6hR/MT9dT1dsI65+nFPlxlLki9pA=
X-Google-Smtp-Source: AGHT+IHfqH0vbD3bQInQbBF2YUx3yEJaJuYtVm+BQiqXb8Xkd6Z+iJPnJ+JbD3G3lpGOTc/Xz5AyMg==
X-Received: by 2002:a17:907:76a4:b0:a58:94c1:88c9 with SMTP id jw4-20020a17090776a400b00a5894c188c9mr10358426ejc.54.1714485780892;
        Tue, 30 Apr 2024 07:03:00 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:00 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:16 +0200
Subject: [PATCH 07/13] ASoC: img: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-7-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1453;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ZJVoQsuYVbU6eX1WKifNhQyvCwwvs/Q4umjN6N4+yu4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnz7LqN72vQN5f6xW+8v1IAmdOUCMPS6bcOV
 4KOBcs83WmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58wAKCRDBN2bmhouD
 12uLD/wJ78QXDNb2piUOxSHgAlHla7As9001viT+koWXU/H7+DT8NtdMhT51dhbsQHiwJTtlPtD
 v3rC/wbLFAMaGDIiWvpnu6k+B052j/BXEI/AehuKgv4cRWhNtPKvFOKq1xqdWsRw0716H2t9hFG
 2jji38Y55VThEkJU2s/2A+dyolipm/A2PYgxMVJTO2l5DA469GyAQo6sBIY2U/cunIB3Nd5iXjE
 Q3am7Lu9EXrAVEs3BW97SbLIHkYf0T5TAzmd8NGKPpDxyuCZXX18ORVI6i9N7ObF7t002ooK2kS
 ojdOtbdfw+8odlw1cUk0WmcG2BmcKgq60G25WepWhGsaV86YzAG4j0PmBLoDpKaIajgntlgaXru
 C59rV1W8tr/ZE1ju9NExCpppLGnkJdg1uS/O8ht/KxBbXbi7EIaeuB9CgaJ61HQpTjOo7fl4Wbf
 Rpr2d48ma59TnUEfG2V3VYPvbYQlMec8a+1gOtwjG9C7eGdUDWFPtphMaW/PQOdGdwQE6of966h
 08q8aydTVqPyc6BlBswO7GuRGZvbVbSjXzYlnWR3btBq5N/fAyyLJVZQAR/CLmHCNxuMnquGLnh
 Ki9ObapaRsHnKsbyLXLqmRwcEn/t2Ywexl6X3EbXj9/YMjD5OQJehn/bvQ8tFvT1+BObAtIFNxa
 lE5v1KAME9l6c0Q==
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
 sound/soc/img/img-i2s-in.c  | 2 +-
 sound/soc/img/img-i2s-out.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index dacc29fcf24b..b69a364d619e 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -395,7 +395,7 @@ static int img_i2s_in_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *sc)
 {
 	unsigned int i2s_channels = params_channels(params) / 2;
-	struct snd_soc_pcm_runtime *rtd = st->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(st);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index f442d985ab87..6f9831c6d6e0 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -401,7 +401,7 @@ static int img_i2s_out_dma_prepare_slave_config(struct snd_pcm_substream *st,
 	struct snd_pcm_hw_params *params, struct dma_slave_config *sc)
 {
 	unsigned int i2s_channels = params_channels(params) / 2;
-	struct snd_soc_pcm_runtime *rtd = st->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(st);
 	struct snd_dmaengine_dai_dma_data *dma_data;
 	int ret;
 

-- 
2.43.0

