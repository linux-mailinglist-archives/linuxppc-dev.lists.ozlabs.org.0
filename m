Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 976C68B782F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:05:35 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FUJj31z/;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMRK1gxdz3cZn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:05:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=FUJj31z/;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMN86zbMz2y3b
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:02:48 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a58f1f36427so377262566b.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485764; x=1715090564; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=FUJj31z/KOSpGLpUEo37nRMQZNev8q+M62ZXyaDU7rAe7mpYNa4BY4/vFVqYv24x54
         qlOgrCghyz7blUEC3jrXeK0YRqXyn7+Gfke7E1Uw/5eE7lF/MTln+TfrUZ/4DqvihBYs
         U3kbP4DWRurTrhA6HkJGvEveKaPcjLwoPyPa8ldwsudaaAFp8g6WHhyWuJiwZYZ2vN04
         uL4iDn6R7mrmmuSFfcE5EhCZ8nMnA6VmeZFeQD/k8bwmsef6LIrNaM7+hL6FAfCvAgua
         TIzR8BAw6WGAZdI+PlCcKK3lykD9rfIfJ6laoKg1mE9fWKJF+Z9nzmxxOCKavZfTAAH2
         xRkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485764; x=1715090564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5Lk1lue097q/WOSyrBvWDsG60XQkpuZqlzoh3fFX8H4=;
        b=kX8HATfQCnQLUrl1bLtT6SYi/YIOn8LE/cwSeTtO70BHvfHegcjMtGQrVZI23uSqWl
         6ft+HVR2+AVH8mPCVN7sbpackZY/x1ziwVN7i3LvgbzuDt59hYZKb6Lx1gIll9AnyNPK
         z+bmHgLqGsJKKm6OLfaVCx8M3N8yB7epKuuRL9Z0vAfN5N8d833puQRwafFUgL1eZPli
         bq1yNTzOi/twN4Xnq/BtKfezzAJxoxOr60w9qfkTs+/I2ptZqPbbiFVe4jl8Q5x/S669
         5GZqffrQOlPnozMUujKIQ704TMFRpFnc3YM6IOyyUW6syJDFJMXw5c7PoA+kVLJQ6V3M
         Setg==
X-Forwarded-Encrypted: i=1; AJvYcCVS21Knd60BzzQV0/tFHWZgZ/fj1YYxCGHR9YhTcbink3vLLmes3fJVU2QPVp84hIcHrfbcDqy5VJMjOWCQe3E4Nv60XEzHU10A81ic0A==
X-Gm-Message-State: AOJu0Yw5mSR+BWUHFbLqjOEhdOEI24EwA0Ho+GzQatlUk9iE2fE+pAI6
	pr6bfaHmUcdGgfpKdkPo391eZEWzKLYu18+qpWLImNeduUzi2VaQneLIfPIC2og=
X-Google-Smtp-Source: AGHT+IEe6L8iR4uGhiIxTqGIW4asn+4q9EAd3lfdb1piiCjrm73a/9Wg4NOc67T8NvbSyWss22Ri9g==
X-Received: by 2002:a17:906:ff42:b0:a55:b345:63ec with SMTP id zo2-20020a170906ff4200b00a55b34563ecmr2134852ejb.15.1714485764472;
        Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:43 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:12 +0200
Subject: [PATCH 03/13] ASoC: ti: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-3-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=704;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=WaTWh6A8XvKFs+19MMAHdgA+abbpsyoPq1iDSypgs+0=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnvj78Se5sQ1IGtmZPj3Apt3l8lrraNbdATP
 5UZknZzzu2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD57wAKCRDBN2bmhouD
 1/rKEACNiDDDmi+VKdGySua5uR69g1WVV9N9njkaGa6BQYvqocDTXh2A5T950fbqbmHniXfNShS
 JZsCqqwu5KxhFaDGF7+cJT9d8h+f+7+N7XdkXJiLCDqED/vhEdXSK+RJxvjyb2UGCtkF2vXvq3I
 qq11t/wIu9DJwANQ/5NqaRpQUsdJGIYQrngiCXGTVr86HT4kWz6cB50Fq2Rc1Nwer1MNbFgNXPD
 EjdcTuqvqRJxRoo0qJQ1uv5PK8ANQ1WI38IhHUgC9cSPyb8BjmRNwBk/6M8bqGZXxd2GI3h0DzD
 8V7Ep+O/4i5WkC/o/RdS0k/Jvzkfl794WdVSrh5ko0yoTWBfgLKB0pDzT5Td5wsGDLH4nLzQX/V
 5FUZJy3lvXFB5nrv9g3mS+E8KOagd4bqA8hkkVqkp5amB7IyjqR87us8YZTtD99ZhtHJ8VBMkd+
 fbJwxHjx4G4Tlbdh0zvD3QybwWSvS6+wPWtlX37WjHLAiWt8YIsZU7wDGSPZJGubhB71ork6bJk
 ATYI7HLcuqJT/iIWO4n1K+oIgsMbXTSo/c+WM1q9Tc22MWyviROO784jazEoZ1HWS2txtvOqMzf
 OBzZt/XtPghj+yRRLI6/+9SDQsMxuhH//frbs22BShcGa8gdvXz3dj2VkoB0xwDtpQ8OPZ7XHdl
 o8rt6UoEwW2rmsw==
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
 sound/soc/ti/omap-hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/ti/omap-hdmi.c b/sound/soc/ti/omap-hdmi.c
index 4513b527ab97..639bc83f4263 100644
--- a/sound/soc/ti/omap-hdmi.c
+++ b/sound/soc/ti/omap-hdmi.c
@@ -40,7 +40,7 @@ struct hdmi_audio_data {
 static
 struct hdmi_audio_data *card_drvdata_substream(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_card_get_drvdata(rtd->card);
 }

-- 
2.43.0

