Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FE658B78A1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:12:57 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GtbswIeW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMbp71wlz3wDW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:12:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=GtbswIeW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::12e; helo=mail-lf1-x12e.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNq6dQwz3cYc
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:23 +1000 (AEST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-516d1ecaf25so7961529e87.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485800; x=1715090600; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=GtbswIeWjcq9ccBFl7BvseEuDVdDEGVeDBurlpjtKTHnDMWosJfSgZttbCjlAfir0C
         069NU33WD+sZPN5p3+ZtRaIFmLeoQ69Iv/XaNJ7eRK18LABjCDgSIasmDYH6ZOBexAjL
         SpiUj/tvXxCuQSvJEnkjh6ufLPXSB5uDffhiz1FAZmW5J9pwk250FCdoi3VypG9Wof/7
         jEwxDAsvYA7qaZSvwh/Vi0LRI0xuZ5/k5OCSJYqNUy+KiiWbJcDauBJ7IPSiR1adMUD6
         GH9ZVk3Npuc4DzzJkSIWEYUeoNRU4FbTOpnEJYl4NKaR6PM5tAKtJM8iHVJIWD6NpDzR
         akpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485800; x=1715090600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iPEO0RWAvqMjT0IhuA0J9gOKQsCIQYXZsdev+OBW9Pk=;
        b=a37OPxrX3VcHsSh8GeSQq1Xh0FpJ1wB4rW4nWpxbYpFERFfOEUGywQ0PtPjwMLzAIA
         NfXrRIECf8uLLqF455v+W9o9CwyPUC+Mqaxd8p4Mk4BHcRt9WA8oXBgk9srM2IbWQiwP
         fLX/CPASZPIqbpo8ZzyQvetxirueiatn32A2xQkOw8ywdqQcs6Zvh42sZ5fwQpB67fRR
         h/dul5iDt6XlbKi0Vc/RA/bvLyg62vZYnvNnY0JWLmO5kp6Jw9SMP1FEHJp5mMl4KP8+
         I3bixIZN1PKP7w1wDu3+LetQE8kAkLl1GeHe+V/HKpnsx6DVGpMUWjbKsFg9Jlflp4OD
         +gdw==
X-Forwarded-Encrypted: i=1; AJvYcCVNKPbj6oBHMlA3Jm6bCjNpRU5qcchyVve2EAn+s1XZAIPC31aEVNv5B2waVnsTB4OwNoOHfPFseRdZQgc2FqDZ419/L637A03Rt/Ef7g==
X-Gm-Message-State: AOJu0Yxy+mYW7d+mUWrOhnybCKbL0ai229nNEmkVU2jjysEhpFwPXh0r
	DXimjA3xnMRMT99qZSY9BJ4ocV4GetCEYGMRLXW2ikUEnubaiu5bouxRmepAiYw=
X-Google-Smtp-Source: AGHT+IGh5m+2saezt4d4/Xj30jwjHn2HaB5/1wzlPXeDMAywvUMwy38mdPMQn/OqpOvF0tN4moRDWA==
X-Received: by 2002:ac2:4342:0:b0:516:d0c2:755 with SMTP id o2-20020ac24342000000b00516d0c20755mr1936131lfl.63.1714485799614;
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:21 +0200
Subject: [PATCH 12/13] ASoC: samsung: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-12-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=859;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=s6T6qKBmGyM2bmAZfxmnWfBAOCON5ixd+eIprC5zOI4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn3jE3Jqd/FGkciqXRI8lqVudz+blh1rLunh
 DAPo4JfRZmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59wAKCRDBN2bmhouD
 167MD/9WOiPSu4HFniDht9/iDlJgx4fouuoHImJ/CM8XXopNUpo7cqRR15JqKSLsDj6vLCZnDjI
 XJH4l92Ge2WRJcz0/XCKWm3Oj9AtC7ODuCsB3t2mfhBJxD0iuojyzEbOdRvzU55KzY/Jm2DElBe
 AVz2VKMPgF1zFr4pkhx3dxiMHbLe6UGPzibytjl5whdT2xAoImo+S2NZTWCKOe4+N7Zrs5X4MKN
 nksx0kWoenkduh9GxKCpr++Kokx/YYpvDE8obQfhLY80Z4tPSY6cX4vv9sfrzB9vGeLAU9yTvAc
 Wxh0WUV5cT2zuYc4pUkyqV+EX/Y3tPEE5xSP136C9a7FWO+Rd52ezaWXED2BY3hXspNrTrKXXTD
 nFQfKJ3M0bszW7Tctw01tKYZUa9Qf0bz/0oVbI6rpDgM3+PPLaVWT1D47FaKzfKQ9jnjaZWzOoF
 1F53c9Pv5Cdt+RLqjXfD1JfrGJRJ7hUbPzMQ/arruJidb9QiloV9Dp70EuGD0VudxXWXtwRzztI
 eIzKDw49c8QYUITfwxYEr1QsvBeQMeOGj/PlXQl1p6vj/Y4oFGW1SjDTITGrfjGFfmKEABGvYP6
 yK41SS5+akvGSPouciQ7r2EIqpAZMYxIFkaCVPRLm6VL/jKT9HDivO012DCh8z7Q3NuvimCGlwg
 o5bO2V6wsqvDkUQ==
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
 sound/soc/samsung/midas_wm1811.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index f31244156ff6..0841e2e6f8ce 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -127,7 +127,7 @@ static int midas_stop_fll1(struct snd_soc_pcm_runtime *rtd)
 static int midas_aif1_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params)
 {
-	struct snd_soc_pcm_runtime *rtd	= substream->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
 	unsigned int pll_out;
 
 	/* AIF1CLK should be at least 3MHz for "optimal performance" */

-- 
2.43.0

