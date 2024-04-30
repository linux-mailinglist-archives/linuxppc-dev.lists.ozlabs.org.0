Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4A08B80E4
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 21:54:41 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DdT/N5pI;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTWB71t5Kz3cWn
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 05:54:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20230601 header.b=DdT/N5pI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com; envelope-from=jernej.skrabec@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTW9K4q6kz3cTr
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 05:53:55 +1000 (AEST)
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a58fc650f8fso336826066b.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 12:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714506833; x=1715111633; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=DdT/N5pItYQGamFQgNb3nTptATLtDozj3vQ4u+1L2QH1SzwW1Z8qJvVqaIssO7ZAMB
         P1FOONZUYVvKEzFo8899whvCNLE4MLrBYeHWn6KzAyFVbHniUZvMsiLxYe2BqhKslIjH
         tF2XY3ib38sTp61TcWaETEurNWmRbSYd21pnPNmc7QNn2MaW+HYG75a6eKUKEXh8o4Lg
         lzxykcvhlsFOIkugvHEoK6W1Diu8N6gF5MyZbR2UeX64PFcrn8Zli82PNNG/+gUyd20M
         jER+ceqiywxC6mFEaNF3BC/1x15U4xsXKIKtnBKuu9ynjo58xfXdhJhbp4NWHlMQ7NT0
         dcgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714506833; x=1715111633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HQq1oWqrCF0TfrogSNrGXKQjYOwjvsMuDYhQTiGCeqo=;
        b=WjNKrhzaINvlRG7YfgcQFn03rrmrSAID1oMuJcWTjOV9p6ux9QRc6X7vblWI2t0GS6
         /G3vy90I4c4Uh6cikbnhCE9FY5KdOfCPm3muL/ujFvFMOoMbqIx7+K7FO2oQVE0zlIzg
         iyIRnyDx1hMZgvAzUHwthqfQkrYonV2vT2SJT2x3HscbB6Ze35ez8JsB/QHOLm1nPxxX
         sEzLsOA8o0bxP8NPCdNi7SToqhrLoU4e5LouQIUXAOU/2YUQTIW8iENx60zyW5QlN3LR
         Dvc8QYyLlpomj6PwuWIB81SQ9QkFR1hPNiLDnHel1FIJbGYvpNnbab1t0UxWQT3WkXEj
         ViJw==
X-Forwarded-Encrypted: i=1; AJvYcCVb+PkglzAq/OpgCyV2BMLgXWTcvFKDFgjhExUszDnCwuHIOkLYNJrKYw9XN9IeM5w85wTqy4sozh7uNxrPW6Z7X+pZ8ZB4NWdcdKxAxg==
X-Gm-Message-State: AOJu0YzxBIq6gtpze0MNpUg5kRxvxqQfjxMi0VDLQb6PNFfB/3y4X2X4
	dAeyIyAk8hTFui6OplI8oOoBzIhHEZ/tNmn+3uaibqGq1qsiQ4by
X-Google-Smtp-Source: AGHT+IHcHyFMebv11hNczXbfOSBPzOfPEK56ZS5IQDWu8DzPrwNQuSSocR8UcDfVrVvZhY8lrKqE1g==
X-Received: by 2002:a17:906:a084:b0:a55:387b:eef9 with SMTP id q4-20020a170906a08400b00a55387beef9mr455005ejy.10.1714506832645;
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 13-20020a170906058d00b00a522d34fee8sm15418045ejn.114.2024.04.30.12.53.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 12:53:52 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
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
 Samuel Holland <samuel@sholland.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject:  Re: [PATCH 13/13] ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 21:53:49 +0200
Message-ID: <3292058.44csPzL39Z@jernej-laptop>
In-Reply-To: <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
References:  <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
 <20240430-asoc-snd-substream-clean-v1-13-6f8a8902b479@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Dne torek, 30. april 2024 ob 16:02:22 GMT +2 je Krzysztof Kozlowski napisal(a):
> Do not open-code snd_soc_substream_to_rtd().
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  sound/soc/sunxi/sun50i-dmic.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
> index c76628bc86c6..fedfa4fc95fb 100644
> --- a/sound/soc/sunxi/sun50i-dmic.c
> +++ b/sound/soc/sunxi/sun50i-dmic.c
> @@ -74,7 +74,7 @@ static const struct dmic_rate dmic_rate_s[] = {
>  static int sun50i_dmic_startup(struct snd_pcm_substream *substream,
>  			       struct snd_soc_dai *cpu_dai)
>  {
> -	struct snd_soc_pcm_runtime *rtd = substream->private_data;
> +	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
>  	struct sun50i_dmic_dev *host = snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
>  
>  	/* only support capture */
> 
> 




