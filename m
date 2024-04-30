Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 187818B780A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:03:26 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zilnYj46;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMNq565Sz3cZ7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:03:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=zilnYj46;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMN52r6nz3bwL
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:02:44 +1000 (AEST)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-56e477db7fbso9854255a12.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485762; x=1715090562; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=zilnYj46PT+67C5nq3QK97XJ1uCzOVJx+cVp5R7KrEUMGVtj94w1zoMePk1qmiBjDb
         x2KNXCVDolW3dqC2I6kyKXMza4l5sZ02lkvQAqqa600cIoaKXTact8Zv7fLXPnS1T8t+
         c/sQxAy1p/+Yx74FYH2mfGSXMhTWZYh61JuwSjpiWY9tw6soz10WS9Ds52DjiYeoGypB
         L2XzeTgFzj3SUSuQ+HonrVeLOholk4n1DnAWFgzGhjql4sfopzpyOe/exHN+/m+TYTHx
         7pBkLY/6HEv3bAsyxU9rMCncQrQ9T0o3WZxoXQaFtUeHgdF9AGiEip8oAKRQADiuSP4O
         J6eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485762; x=1715090562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5IV4t0pNrZLc8K3zjbiMUiExRG0rwvdrAQLRnesERno=;
        b=so/1wgHKlDXK90PaiaDEGxg4IxLrCvD47n0QSDnBU+Y9P57pmP4sWBKIpgszsIvQqa
         y7OcpCbfWugCk625JLGgKRz+BAjM7O1OILdKQ3HG6hq36y4+33RFY4RmULuev36m42PW
         1RaDsUzCzW8mocx9yUjynu57wy/bBtiZNPa5yQdzEs9Upn/Dz+RJzp6B2E5lc2EikWQx
         /kc8zcW68UAq0GZHEOblB5F+GBgc+KyiynKlAUAI6wLbY7miPFWWcssvZzr3uyYkst5N
         icN5bZXhk5P3wVPO2l1KMmjKyPfv7ni4ycR7L+McomfVnyv++ZQfYjr6h9qS2T7gtRHJ
         ZeBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG6gnIX78Ij8l15j3JWn0hfv2sh5OKlzPKS08ESiCbDg20J+1LZGZX4KvkD98FBxxQWVdDKcFtfaO6VcCtiYhxeHYiASwCLwA4t4REBw==
X-Gm-Message-State: AOJu0YwxEgU0BWoRF6MxJHuQZJM4oCYBpQb32g9vvlQgOyAJ2FDBuRrf
	1fd9sK11yym+FMP5FO80FvAFkHo9DwcOQpMDdXCIHYdQ8Kll3fCHzdBo56HMxLY=
X-Google-Smtp-Source: AGHT+IHiryIlMBuC9NM2KOjVX/FiEZN10FwJJA8ZsqNvWyktK2eDEXsG0W+ylaSuA6HZE7/EUxYrVw==
X-Received: by 2002:a17:906:5851:b0:a52:54d8:6d21 with SMTP id h17-20020a170906585100b00a5254d86d21mr10321769ejs.7.1714485761837;
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:41 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:11 +0200
Subject: [PATCH 02/13] ASoC: tegra: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-2-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2412;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=NWayqZgMTQyhrridkNgCIJtQs25nYri5VnM17XYp3Mo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnuu9RjFk0ZahGK7moh34+XMb8y5IAinmHhw
 3VHDPhugCqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57gAKCRDBN2bmhouD
 1zWOD/4+tyzs1xgp6ykzyyJogYehC2MKqc9o7BAwaYhBihjzf+kvS/a49wjR8gzDJ7Vh3y3/hwL
 aLdHFckj8wwv4l0ss9+e4sAMLoHDo7uUPKc+rfA+yOS8XjuXoRm8FI6LehOSZcU8NK5w+LQWJ3U
 ceuoYZ1qz1qlNuzBLWh3xpsoRbk5sjR2sakihrnAleKyfoasgq6+XdUIQ0VJqWO3MEUcYPC/eXU
 h0snq64j4az27aiyUMbwLNSs6H3gn3+qoBo7CHTzJnJ0JDyk11jeRzxeQyznlPWuSUIqCMkCeft
 uT+ECq9fYZbdwFZIupds9jdP/39elefh2kxAnzlm5ROlK2Z/TDTgDQeaEvraSuji6ucd/CTWMOv
 VkU3vwo2GtZi3mVhPPnkMo6Nz5ObAvyQbuIY180agGlUo1VC1+m9LeJ98LBIPAdLIkbp6biPcfM
 6AHQapXJgPIkZGgszpxcOMdIHIf7X4eaVUkr12gdIijUr7p/VilIGXBzL7mADqRC3+Pzk5Q590A
 8MyHOr4aKOGAWSWyPRn1clfTUJnmOg92ZBgTm7yfpzUeQRED96dVL+70aCGXXlCP1V+EwhgZecx
 m2VLP4rPyvCJT3suEVLW0aKsOrnHxRm5mvO2RcJ5U/k/EfE5uCaHFZFgyQE+iEqtAyQa0sQ1Vex
 ffzIPP9MiKJu/1A==
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
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 sound/soc/tegra/tegra_pcm.c          | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 192e9692bdf2..775ce433fdbf 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -290,7 +290,7 @@ static unsigned int tegra_machine_mclk_rate_6mhz(unsigned int srate)
 static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 				   struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *codec_dai = snd_soc_rtd_to_codec(rtd, 0);
 	struct snd_soc_card *card = rtd->card;
 	struct tegra_machine *machine = snd_soc_card_get_drvdata(card);
diff --git a/sound/soc/tegra/tegra_pcm.c b/sound/soc/tegra/tegra_pcm.c
index 42acb56543db..4bdbcd2635ef 100644
--- a/sound/soc/tegra/tegra_pcm.c
+++ b/sound/soc/tegra/tegra_pcm.c
@@ -76,7 +76,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_platform_unregister);
 int tegra_pcm_open(struct snd_soc_component *component,
 		   struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_chan *chan;
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(rtd, 0);
@@ -127,7 +127,7 @@ EXPORT_SYMBOL_GPL(tegra_pcm_open);
 int tegra_pcm_close(struct snd_soc_component *component,
 		    struct snd_pcm_substream *substream)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 
 	if (rtd->dai_link->no_pcm)
 		return 0;
@@ -142,7 +142,7 @@ int tegra_pcm_hw_params(struct snd_soc_component *component,
 			struct snd_pcm_substream *substream,
 			struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd = substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	struct snd_dmaengine_dai_dma_data *dmap;
 	struct dma_slave_config slave_config;
 	struct dma_chan *chan;

-- 
2.43.0

