Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FC38B7811
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Apr 2024 16:04:06 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bda601+Y;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VTMPc3YTcz3clb
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 May 2024 00:04:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Bda601+Y;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linaro.org (client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com; envelope-from=krzysztof.kozlowski@linaro.org; receiver=lists.ozlabs.org)
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VTMN53GM9z3cLl
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 May 2024 00:02:44 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-51d62b0ecb7so4567548e87.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Apr 2024 07:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714485757; x=1715090557; darn=lists.ozlabs.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=Bda601+YSSI0yPJGTIYaaaR55DXTHn5iepgQZoOxh48IcJi4zkDnAf/O9bHk1GHjXL
         YK20fWH/Wq8+zn9Wg78JnOmM2sPOTk/zcDCyYtQMTaPxm6E+2Xu6bvEUJuFvEG8nlc1s
         0pSX1ndhxSK/VLszkg+Oahl7KLBncMKFDy78IU8Dobuf9H96pKK23xrYWDZZKJscdn2E
         i+uNR+cDIHgr8e3d2APBllJeGXL7TNtkG+Iv1H4JcMTqjxLZFodmQE8NfPcpFltraHVn
         sJwE7y+IBbsUtZ839lwu270hmLAxo3290b6g02gyAwrgXHkYK9Ph86QSYSstT6TqS9ZX
         WalQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714485757; x=1715090557;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ziKPpXLYR2zn3+NU5Pk66H9ism9mr6GLdkSFbxKAZ4=;
        b=SmVlTb33Yz4lRIRShB4VTgVuQYcAEIhP0UZdOtpdoXP/adRoN6qfrFhcZU+86YUg3l
         B2mcHFZGDTDO03QfjoiwUr+QAhozoBCVP9cTaje9ZgmdBf2bzt7+rKlvNYpEVOmP2zc7
         4kacwfmhW/+gLfJPgyzfqU45g5z5pj136Aat+iKC0WWcdfx8swauxmxq8gxp0lwAZ9m9
         qSqw+xkpdfZ3b/BKty9bTWkYqSheNxMwp45Yo3zlqLGkHFRc5ma7N6JinJYZD2W+qUlR
         TEZsXlQJ9PVDbQnyTD4vwm2eX1BvLcljiBJ6EssiLZ4IPMVp3Nop2f4AFpe4OafuOG2K
         OBEw==
X-Forwarded-Encrypted: i=1; AJvYcCWqqOLG4VUD/3oCaRRyUEl5fVPakr5SqQqPBy261IrXw2C0asOq7B8im3ptcmr7CrIbWsPdqNi08JtRL+F3wzilw2bL5W8IG388lN+xqQ==
X-Gm-Message-State: AOJu0YxLriIpIFwkhilpPF7OXstHe+Kb8wF3PahztliPJmd4ZUsJ0RIL
	OM4Rd0EtP8SNlclHeZKBpDaWJvh2uGVkvz2Kd2h7obyGh+x702NJjG74nnIP7/0=
X-Google-Smtp-Source: AGHT+IFxX6RMrPFkE+iKjGFWGX6uNErIhwrc6ioCbIidZRB0tmw4GxAmrC5NZWl96iLeoUrVLfRGvw==
X-Received: by 2002:ac2:47f0:0:b0:51d:70d9:f844 with SMTP id b16-20020ac247f0000000b0051d70d9f844mr5882908lfp.22.1714485756019;
        Tue, 30 Apr 2024 07:02:36 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id pv27-20020a170907209b00b00a5940af3f67sm31434ejb.16.2024.04.30.07.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 07:02:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 00/13] ASoC: Use snd_soc_substream_to_rtd() for accessing
 private_data
Date: Tue, 30 Apr 2024 16:02:09 +0200
Message-Id: <20240430-asoc-snd-substream-clean-v1-0-6f8a8902b479@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOL5MGYC/x3MTQrCMBBA4auUWTuQxEhqryIu8jPRgZqUTBWh5
 O4Gl9/ivQOEGpPAMh3Q6MPCtQzo0wTx6cuDkNMwGGWssmeFXmpEKQnlHWRv5F8YV/IFr8YGp12
 a88XCyLdGmb//9e3e+w9CANGvagAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3547;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=nmVD9KKu0onQCo4+scSWvtThsneJsuva2ZwAC2itQ+Q=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmMPnp5GgNlhBx+/I3aG9tNIg/czLIulpjsgqB+
 gIo9+t++USJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZjD56QAKCRDBN2bmhouD
 1/7LEACEfk8kijEA2LTMQcsqwb/zKSF+KUnI8xKuCriVzrabC5ANnLec53cOfXlJiZr0ORRQZu1
 470KfeDgCK0rPa+5rmHArn0RjNORLJGv3UY9o33TRjgnRKnhemsjjVBOY2q2aSGa12PGCdgZZ2W
 9lYT6gbghyhPF8NwejTYWU67cXXHzw57qZrigi06wTI2UMEzGCAPqjVhM2lDMHiEyCTYsFh5fZC
 rR2QeMZ5pK1z03KZd5SaMByAHa4DJKQOESKs+zVprbQfv5lzpQpn0EVjmxu4IuLRoQxBzfNJhPt
 36FgoerUfQRcpNoGC21+oBlav8jvX4KPs07WDOuNAmbmOtgXCpWnMgFcFwHmF3waXKQHwzOjK+/
 2KrHGzOUV9Xbz/fFxxDvcrJ9KdrqfbWpHM0xl7iwulLPWb1KsQr+/NFKNg6MfijGBKz4sC0Zqt8
 vQP4on/GzYRbye0DENyAmvUZGrWaBcF6ARh875j/Wtbgf4akwjlz1IziblIY+5XW/H1pl10EmuK
 rZVUZawHpK9VaDDe13ybwYLFC6jLwchoLTS52Pq2adjWzHJ+DAX0kMA60ACfugVQyPnugr0zBEz
 B7kqe01ESwCaFe3059W+GzYuXFpqQpOOJOqIoNfu7R23l0QqyopaR9hd/2Y62EwfsI/mkovGRET
 HqyQWjcO1YItmKQ==
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

Hi,

Do not open-code snd_soc_substream_to_rtd() when accessing
snd_pcm_substream->private_data.  This makes code more consistent with
rest of ASoC and allows in the future to move the field to any other
place or add additional checks in snd_soc_substream_to_rtd().

Best regards,
Krzysztof

---
Krzysztof Kozlowski (13):
      ASoC: qcom: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: tegra: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: ti: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: arm: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: amd: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: fsl: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: img: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: kirkwood: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: loongson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: mediatek: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: meson: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: samsung: Use snd_soc_substream_to_rtd() for accessing private_data
      ASoC: sunxi: Use snd_soc_substream_to_rtd() for accessing private_data

 sound/arm/pxa2xx-pcm-lib.c                 |  4 ++--
 sound/soc/amd/acp/acp-mach-common.c        |  2 +-
 sound/soc/amd/acp3x-rt5682-max9836.c       |  2 +-
 sound/soc/amd/ps/ps-sdw-dma.c              |  2 +-
 sound/soc/fsl/fsl-asoc-card.c              |  2 +-
 sound/soc/fsl/imx-card.c                   |  6 +++---
 sound/soc/fsl/imx-hdmi.c                   |  2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c              |  6 +++---
 sound/soc/img/img-i2s-in.c                 |  2 +-
 sound/soc/img/img-i2s-out.c                |  2 +-
 sound/soc/kirkwood/kirkwood-dma.c          |  2 +-
 sound/soc/loongson/loongson_card.c         |  2 +-
 sound/soc/loongson/loongson_dma.c          |  2 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c |  4 ++--
 sound/soc/mediatek/mt8186/mt8186-afe-pcm.c | 14 +++++++-------
 sound/soc/mediatek/mt8186/mt8186-mt6366.c  |  2 +-
 sound/soc/mediatek/mt8188/mt8188-afe-pcm.c |  8 ++++----
 sound/soc/mediatek/mt8188/mt8188-mt6359.c  |  6 +++---
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c | 10 +++++-----
 sound/soc/mediatek/mt8195/mt8195-mt6359.c  |  4 ++--
 sound/soc/meson/aiu-fifo.c                 |  2 +-
 sound/soc/meson/axg-fifo.c                 |  2 +-
 sound/soc/qcom/apq8016_sbc.c               |  4 ++--
 sound/soc/qcom/qdsp6/q6apm-dai.c           |  2 +-
 sound/soc/qcom/sc7180.c                    | 10 +++++-----
 sound/soc/qcom/sc7280.c                    | 12 ++++++------
 sound/soc/qcom/sc8280xp.c                  |  8 ++++----
 sound/soc/qcom/sdw.c                       |  8 ++++----
 sound/soc/qcom/sm8250.c                    | 10 +++++-----
 sound/soc/qcom/x1e80100.c                  |  8 ++++----
 sound/soc/samsung/midas_wm1811.c           |  2 +-
 sound/soc/sunxi/sun50i-dmic.c              |  2 +-
 sound/soc/tegra/tegra_asoc_machine.c       |  2 +-
 sound/soc/tegra/tegra_pcm.c                |  6 +++---
 sound/soc/ti/omap-hdmi.c                   |  2 +-
 35 files changed, 82 insertions(+), 82 deletions(-)
---
base-commit: 82415cf72c7e224be7a6496f3a53c0b365c2fe9d
change-id: 20240430-asoc-snd-substream-clean-924b717d8f54

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

