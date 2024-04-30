Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1AB48B7868
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:09:37 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TN7fm+zc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMWz2Rxgz3cYL
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:09:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=TN7fm+zc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::62d; helo=mail-ej1-x62d.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMNY51ljz3cX8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:03:09 +1000 (AEST)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-a55911bff66so702903866b.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485787; x=1715090587; darn=lists.ozlabs.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=TN7fm+zcd+OrR9gAAMBwlvIm+r2QzaTNP+WtsgkWcujq1evNwIOzBbjOJZ97q4SpwQ
         phMsqaaPcuEBmkxfx14fFAhBU580qASkvpEbAZF3j6b12zfcptj4TdP8pvL5M298IWDZ
         cpw858gy5MGRJkjCsVS0ibRbmzwYmD7h/MHyPXi5AN2daIKAWjw90nByYghvv7bkrUX1
         NEOkqumciYlZreNtMscWYyt9xZsvm0hBL1TxJnP0sD31GjsxfvUuLxACtuMESY88UmAJ
         ROdYIUxRsaIMWtWx6gPKA5qHcxKjRNu2/WYbuXfSP7TO+YAn1cZy6zoiIVBtt9i5WQFa
         2cyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485787; x=1715090587;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xJJbSwuzaR0w7NGJdc7U0qNxw71mhhvz2h+n/8bje3M=;
        b=OVHTReJra0fWmWVakf02jLdlN5iDpDX0wXGE3MgR3W/Bumq3XD5NLWWkhoHKruxOLX
         XGUOJ73GjSxwqdeuAqdku74ICmRM5QY/3MpFnydWpWTj1dxzf2Cjnp5X4ccDcCOPKAfo
         PNwaixk+pP6PruYdQFLiBYAain3PK7dffL1/cPZcMyp3xwx0hfqmVhSqu8jfuhGJBko2
         ZK3N+Eh9OKaGsPhWQWlet3YuNCjg6joTjZZ8o06+vt2R4xr+0wYXEifacKjqVaZD38ca
         RT1ysE+CDz1zcnwlzpyf/OFEOaHY3Nrjdfm6Tpck8JJ+W3gIq228lu6m4cjgeKRCj8P5
         sogg==
X-Forwarded-Encrypted: i=1; AJvYcCWfajuI5DtLNm/i102nT+1E+YPAVJDoAiC3ExfNlciN5ExRjlvLtPF7ftnZ+SNdPQH7Bcu3cSBsqLusz/jJJS7X+55T7fiOlT2JIVmaMw==
X-Gm-Message-State: AOJu0YwAUo4pNt6xAEH8zQY4iHXangJjQpZFgOFZbUe+sQrvRe3j9CkC
	b4YlRplaEFHl71GyHVLOsLH7JSd81+nYve3/VNLfyU1GETyFavZgdtLbWG9+l68=
X-Google-Smtp-Source: AGHT+IGuEd/p4bNUH8qGU+eaFSK8VAtxB3CIFoT6x1kpuMcKSCXiGNBYxe9tpKOFHZ0t3goA5+TDFQ==
X-Received: by 2002:a17:906:5d1:b0:a52:5460:a1c6 with SMTP id t17-20020a17090605d100b00a525460a1c6mr8141356ejt.48.1714485786717;
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:03:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 30 Apr 2024 16:02:17 +0200
Subject: [PATCH 08/13] ASoC: kirkwood: Use snd_soc_substream_to_rtd() for
 accessing private_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-asoc-snd-substream-clean-v1-8-6f8a8902b479@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=764;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=XOQ3D1Q+qL3SzysXsYcm80LUwBWHBaXzmlHz6/Wj4iY=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPn0JcifyNVMar6zygwpR2fCs5/vlSNdY5zrU
 P/gTARf59qJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD59AAKCRDBN2bmhouD
 1zGnD/4/+HNhnrisX+IxTCcgOIYVGlhMNGY5vKejxjMo983A81khcr7uNg3V39Ut/IpxeMUDDM2
 Rk6W37xxCNkLbnV8wmT6q0+6JYwo8P4avbWhlcyWX4f/X54F3DagobrxkUqSfNm3z/Ohm2iMNsI
 5ugz6Ay/15M8khl/LqKWzwuHNFkFgmxkcWkPSduL9KTHrRilAIDNLYrHPm02HPDdxNLtZNU+BHW
 HTvM9E0VR5hTDhkw7zVMnhr+YV3QpwCclGbZOhu0Cp0nBuhuyLS6jviuYyHCMCY6GkcreN+twHB
 cXmh7Xs1u91x/WYnyYmDtSjzvRIkkxVrWxw/QN9qTHQ1RYB/Xx60ra0zeLmBEmOfRz9SMfyGoUn
 vRlI/JhDNPgNBYSjjkyIBwajOY5i3uiToFIm6XjRwuDnhvfIY1W7C/uwA0GMStEoF+JFVDyw8pW
 XIHJD1hjJyGYX0RH/SbX84Zx3pQWMS27eL7z7lzWdJWctPFRnKSWOGotjeOgM72adhckEHzGgIF
 QJDjo4+G5LVVPbCJwrxnbN0CSfbzPMsVVru2jraEYMcMNH7CzrolNQXfdPgbEj/6nlHJvhm8a5t
 qifBptWPRDKql5mFD1fojt0Pdiv7EWmzeVOR/7d4Fw5AkjTCjcEbUzTHSDxxQlJZ3JQ4G9+PKsH
 o8NVxPN16vhnqFQ==
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
 sound/soc/kirkwood/kirkwood-dma.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/kirkwood/kirkwood-dma.c b/sound/soc/kirkwood/kirkwood-dma.c
index ef00792e1d49..036b42058272 100644
--- a/sound/soc/kirkwood/kirkwood-dma.c
+++ b/sound/soc/kirkwood/kirkwood-dma.c
@@ -19,7 +19,7 @@
 
 static struct kirkwood_dma_data *kirkwood_priv(struct snd_pcm_substream *subs)
 {
-	struct snd_soc_pcm_runtime *soc_runtime = subs->private_data;
+	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(subs);
 	return snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(soc_runtime, 0));
 }
 

-- 
2.43.0

