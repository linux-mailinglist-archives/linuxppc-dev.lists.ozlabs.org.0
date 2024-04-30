Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543658B7851
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:07:45 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x8RlHSi6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMTp70Ntz3ckL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:07:42 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=x8RlHSi6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::236; helo=mail-lj1-x236.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNP6FrVz3cTM
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:01 +1000 (AEST)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2def8e58471so90654761fa.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485778; x=1715090578; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=x8RlHSi6qaYprunejxEJWTP2xrol+lNMuhvMkTifiqdi7HCMeS07KIzQfRYE3WVsTZ
         SD/I++OgKFtThOYQGysb20/U9da/2KGTe+1+wnhQiR5e1kvfk024RFL0C9fl4mvcb1Yj
         G6UWuPEWMIsRedeFElvS+qaD3aV1H10x16J/EHKu5KXhGvM+clt//3rdn1w2jzTOQIiU
         h4oAN8YygFGfYPTlsaCRSO6JR7Z7GXAVFE3IdWMClm2dcoIb82T9BgfWSm43sVRPxjn5
         TJF4lOY2KA2wyoJMcuKp50EZUmxETchGJv8sNyX6R+RrBKIVbVRNRiqMC/7aSrmE7W68
         fOig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485778; x=1715090578;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNgLEZpy94T5of5dDiteuT7S3SOS839FWPGD9Oz3+lU=;
        b=ZQ6UfqFcpi8naU1FtaqV4NcZyoa+36PG8F6q9bYHIlEjd/lGkDt+iwYWaE8jRned7H
         gDV6e3DiO9KC834WkNij3rsVwgaupkdgyZ3ByTJpaPDpaEmKmDeedGmnrnl7Std3/Pfe
         9h+yPAXR8HAIJjALWZKGzbrwiEMSaeefIeuDJKEIWeike3LC+aIXRovtETq+LGSZbfOa
         SNdqEFcAg0gstPStqnhaVzfkqyCHTqW2DDFRCsrgB+Je9/bdZ53PMfFUMBbnDSTChUyI
         QYX9w8DxARG59f1QZlZpd0zM6qN7AgSaCUXd9Aq8CaRBSSG+TivAKKoCzbuCKaEdS1mX
         brtw==
X-Forwarded-Encrypted: i=1; AJvYcCUKVAq3T+MMjSvGecjWP6D0bn0OmMiAoVq2m4fn8E9d7ogvOcbVY2STpapyTkDMJbQC5623GB3VuLKYO+3IReK19+u5shHovf8+ZXIq5A==
X-Gm-Message-State: AOJu0YzOY50Fwinf3U/i3sGpNXHmq8Gj2rafd7wpibMD0lh+EnxsDL8O
	geplyc7l13gj3YThyOh7Uu+HNrP/JSC7L68oz7F678w9GxKIIPtBZVlvUNMWHfA=
X-Google-Smtp-Source: AGHT+IFjpnpTp49C7eNXISEFR7RNPga2jXB5JGxKI22M+Sgkavx0dXEQC64nAv94ubWY9cbPtavVlQ==
X-Received: by 2002:a2e:9d88:0:b0:2dd:da86:ee38 with SMTP id c8-20020a2e9d88000000b002ddda86ee38mr10711122ljj.8.1714485777680;
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:57 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:15 +0200
Subject: [PATCH 06/13] ASoC: fsl: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-6-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5066;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=ucjMMVrCkGueEU7NLLh2sAE4bDhfGS2t9ibvgfiZuqk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnyVTX4VSForeLiGua7AKa1bycRXXidVTl9D
 CaOooFdBBqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD58gAKCRDBN2bmhouD
 1x+nD/9L3QfdqNvflH7gpARtP03tnjdskVjY9BZshvK55BYu/8uL8qeQ8m7grVZgtdnFSp17jzg
 psAIaY2iZ3XjkhL1Wm9i2Bco6fY+REaa9ipQVksNn10h2zoFp4l3tKiNz9T6HIW+tr9LB4YJ0ez
 95oxVwwR3mmgoGnOTgoBhBquIQotbSGxNdua1owIxI4ynwBEDk9aSuLzFvyZaK+a5pQqlk8sFHE
 1Zk4N9BanSfRWtR7ZmuLxcDMQFw+f9cLlfnQjEF7qbDegbSaNYOR4VuwuAPVTQgmhL2FDZ9ZZBZ
 VS8nH1w1VupmUXyDCQM9+Ord+ux+JRHtepLks0LWYAmaEYSn0maBsInTR79T6/Z5BTnHY5o05cb
 17XjcuRdjm0E9YceHUg/H7Cu+qPpavOo45i3peulA/Kw8Bmz/UrCoPzgKCZECARmZhBwtFfXKFi
 BFBqwmlfaJ5mO+BUYtGOK0mi8QL8IJGpqneIw6WuwxG8gcximwl6XUtbhpG9dUMulPUId44Q4Lx
 6MRqlOL82xSEpJjTLh5Q1IVtCafvXHdADF0e5NcyPGZeB3xciZX49dPUqRv/agS7rPISpGBqP+3
 2uMcyxscGa3WWW9aQmkwpKw3L4QuI/OgOw5ddiu+DS7516wv6HU8Om/sxKJq6Fm9j1OTCD6HkT0
 JghFY64qvYvldfw==
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
 sound/soc/fsl/fsl-asoc-card.c | 2 +-
 sound/soc/fsl/imx-card.c      | 6 +++---
 sound/soc/fsl/imx-hdmi.c      | 2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c | 6 +++---
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
index f6d2564864c6..5ddc0c2fe53f 100644
--- a/sound/soc/fsl/fsl-asoc-card.c
+++ b/sound/soc/fsl/fsl-asoc-card.c
@@ -242,7 +242,7 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
 
 static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
 	struct codec_priv *codec_priv = &priv->codec_priv;
 	struct device *dev = rtd->card->dev;
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index cb8723965f2f..0e18ccabe28c 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -252,7 +252,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 					   struct snd_pcm_hw_params *params,
 					   int slots, int slot_width)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_card_data *data = snd_soc_card_get_drvdata(rtd->card);
 	const struct imx_card_plat_data *plat_data = data->plat_data;
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
@@ -289,7 +289,7 @@ static unsigned long akcodec_get_mclk_rate(struct snd_pcm_substream *substream,
 static int imx_aif_hw_params(struct snd_pcm_substream *substream,
 			     struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
@@ -405,7 +405,7 @@ static int ak5558_hw_rule_rate(struct snd_pcm_hw_params *p, struct snd_pcm_hw_ru
 static int imx_aif_startup(struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_card *card = rtd->card;
 	struct imx_card_data *data = snd_soc_card_get_drvdata(card);
 	struct dai_link_data *link_data = &data->link_data[rtd->num];
diff --git a/sound/soc/fsl/imx-hdmi.c b/sound/soc/fsl/imx-hdmi.c
index e454085c6e5c..fe47b439a818 100644
--- a/sound/soc/fsl/imx-hdmi.c
+++ b/sound/soc/fsl/imx-hdmi.c
@@ -32,7 +32,7 @@ struct imx_hdmi_data {
 static int imx_hdmi_hw_params(struct snd_pcm_substream *substream,
 			      struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct imx_hdmi_data *data = snd_soc_card_get_drvdata(rtd->card);
 	bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index b84d1dfddba2..ba491cbb9930 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -316,7 +316,7 @@ static int imx_rpmsg_pcm_prepare(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 
@@ -461,7 +461,7 @@ static int imx_rpmsg_pcm_trigger(struct snd_soc_component *component,
 				 struct snd_pcm_substream *substream, int cmd)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	int ret = 0;
@@ -515,7 +515,7 @@ static int imx_rpmsg_pcm_ack(struct snd_soc_component *component,
 			     struct snd_pcm_substream *substream)
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
 	struct fsl_rpmsg *rpmsg = dev_get_drvdata(cpu_dai->dev);
 	struct rpmsg_info *info = dev_get_drvdata(component->dev);

-- 
2.43.0

