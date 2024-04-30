Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E3F68B7890
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:12:10 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PhOAxzsc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMZv5HkGz3w9F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:12:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PhOAxzsc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNl6HXKz3cYj
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:19 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a58fbbcd77aso301152066b.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485797; x=1715090597; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=PhOAxzsci9N9VrzUA5cP6irjmFaBlMk7A8aOSvU9d0kIJrl8eMs60bJCm6/+PI6Rnr
         3rR4W9Cm8z53IIymJTRT56LJP9zcbRQcFDAFohE6uwhSuYWNHXfLC8HaxAPqzBKSZEbq
         GV8wPzKuugmxVJhvw44lqFC817LphKt+g9XzKh7qtJ7jl2a83eMh0HgPEaH3z38/1mrX
         nkBAnSGHWra5KnfmUUQ/DU+KwZWW8I8C1DkK27j+5lc2NGe1aywS/4Dv2WEmeB8v4WON
         dGNkfXt6W6D3E62AtU7IPlRf/0lkimECd616TPiyqge8ScmdG52SyC5jM8yggm0rxk53
         rVtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485797; x=1715090597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JWJR2WoIWwHgA1WyLmTI5AFP9P56iC3vbRDROZEp3Cc=;
        b=dS0K9LG5IKRrxcXavDkiXFb0dxxz9x6kMW7B5+DYhkptVnlpjoZJDDxd3Rq8I6gozC
         qOzrzwaEOKK+9YqugObbs9mczOgx3our66viETmXM0Ntpv0xgzCltG3MR7iHFo4F9w3b
         iucuDJMhnn5kYhCw5/LFXlsUTuvmXsZHeSWbb79HkavNuaH8g+muNZGF1Q9/gfsMwduE
         iRTIfm7iiMaCVWSYAXEksZ89EwH0AShTOtEdSZO+zyM9BuXvvoYPpbNe2YRv9qUsr2uA
         tXeNgd7YTGO9GubOT4XbjGukFAjXDrkyA0zXE8tAdggbI/WzFdIDSa4q8qk6C2x8/tGB
         t7ng==
X-Forwarded-Encrypted: i=1; AJvYcCWOBBrPcdfScHbWGCyQoTZL7NalONGf7qu6xopAjfcBBaE9jL1zFLoC6DL3EoYwAK2Q4NwYOaQkzg5BR4PqzYJQyGhwC+qjiEaD1cwAMg==
X-Gm-Message-State: AOJu0Yy1NCppqXQlTHxE2gr8hlXio+hseSbv/v3WDGtyiSJew92qEwPC
	0hCbUkAlMFuI+HVnhFOfrFU5LTOW/lz1Vs2MgiPIVrY9dzc2Ai5guMdpFN7DUxE=
X-Google-Smtp-Source: AGHT+IGzpv19AvraaJONqek/5WZ+vpK0ygTzaKpESURpr1fKUPncz+rrCHoTLxWTmS70O2gF9usxBg==
X-Received: by 2002:a17:906:fb19:b0:a46:cef3:4aba with SMTP id lz25-20020a170906fb1900b00a46cef34abamr6908081ejb.75.1714485797197;
        Tue, 30 Apr 2024 07:03:17 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:16 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:20 +0200
Subject: [PATCH 11/13] ASoC: meson: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-11-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=2L2Sd/bZA9DPmGMKb1blU4asO9ABeFUMOyqlFuFMjDE=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn2JvN54IaqcYA5GLEuMvhDQe+mNVTJTI3Tr
 QdG3HJ5mpaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59gAKCRDBN2bmhouD
 197sD/4lVw4vRS0TaJQoEqN1/VKp4Q9D5lysYmYFjuJDSklcrh+mHGjmHyG95rjuMpfUp5WdZ9F
 iytvncSSC/Cuz5v/Jf8fvm3m9JjwXFFBP5Lc4SMyVJAeiWnSKjzxXSJpUg4BiTtCWCFACQ+V2Bb
 YGk8kFBRlLhu+hIsRVvO7YExMVKSyWC+LUviOI2MtzsH1IZm+J1MJ32ygUWTM2XfMun8P6JaMaS
 zdUyUnJjZrzCI9/u7V7zlNe7qD1tuI5xufOqCOiAa6z0lCBNjRJeSVaVzniiHsE9d/ko9UTugjE
 fj2ylpg5b6Vgg5XqItpdB+YsDKsAIWOpQw+4DM9EyACs1+eZoj3ODueF18BqqnON9iBFHyQC+PS
 tFWPcxkNUPvKTgBAo35M7FSPkECi12I5S4WqPZrRjoTs1lUtOhRGq3DjzGjtxPPe1fgDGvsk4Mf
 4VM/tTJWrMOhnmX9/Vm3iZWKyJcLwmff0kZYETc6VVP4YKbsUIvlZbkhmLuh4EY05gpbzW/i98e
 2SqiRpAD6/3HhVAbX7RcNsQAFGYv0XBd6/7ewRdKkn2ly0KIqT3t5dloWm1fn8iCmzLrSnDN+mR
 h9asUnfi+hgioFVTE27PhDIzW+cxFlTOVreYfN8Fh5JIFmJW8FNL9xUzP6zwTdjGwt18Z9Ey1s3
 y25Qq5uL4jC7B2Q==
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
 sound/soc/meson/aiu-fifo.c | 2 +-
 sound/soc/meson/axg-fifo.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/sound/soc/meson/aiu-fifo.c b/sound/soc/meson/aiu-fifo.c
index 4041ff8e437f..b222bde1f61b 100644
--- a/sound/soc/meson/aiu-fifo.c
+++ b/sound/soc/meson/aiu-fifo.c
@@ -25,7 +25,7 @@
 
 static struct snd_soc_dai *aiu_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }
diff --git a/sound/soc/meson/axg-fifo.c b/sound/soc/meson/axg-fifo.c
index bebee0ca8e38..1ead5ebc84c4 100644
--- a/sound/soc/meson/axg-fifo.c
+++ b/sound/soc/meson/axg-fifo.c
@@ -46,7 +46,7 @@ static struct snd_pcm_hardware axg_fifo_hw = {
 
 static struct snd_soc_dai *axg_fifo_dai(struct snd_pcm_substream *ss)
 {
-	struct snd_soc_pcm_runtime *rtd = ss->private_data;
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(ss);
 
 	return snd_soc_rtd_to_cpu(rtd, 0);
 }

-- 
2.43.0

