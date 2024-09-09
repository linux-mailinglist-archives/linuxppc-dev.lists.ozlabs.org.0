Return-Path: <linuxppc-dev+bounces-1187-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96339971DAE
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 17:12:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X2Vh72DVlz2yNs;
	Tue, 10 Sep 2024 01:12:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a00:1450:4864:20::42a"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725894775;
	cv=none; b=V8SjcuO9jAndEsRDTukow7c1BAFPdPO6U45YoY0PSeRJAkEebB7nCx6qPAcSAHzCbvM5JyWQDFt26UAzD3XMkXiHMkGZ34pLsvTl/iXt9iEy1LipK4c47w5WrOlU5aHnc4Pufe5q+aCcaQSLvgBY5a62E1GaSVdsEC8RFwWvBdJvi/FkIpVktVvwK63uZnUDodlG4elWhXrU98l5DaDrLGrOopgB72lYTQg1OuL4KC9KLNzA4FszVi1m3FySdVyNxi51VGwZ4usyAI+oStiYyLr2C8VqPmusBkEHtlVxHROYw9b8GLNiwqnbAj5iCALyuFbyygIAiqOTHfZ+RWNwpg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725894775; c=relaxed/relaxed;
	bh=Sgkqs1A/DqOd+LNi6PkmNKStV4y6ssrPBnrKxQJYrqU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=PdztT+7DRoC+jOkvwsycFxenL0nffiZDynmU9GRq8JuOc5/3+bRDavAvRNswzNbZq4C1o7EqWICwIygktweGYQbL0pGLVGkJ79/uBk9sUXxBM3Lax9vZ868/MyQXyBMc6qTBer69P7HFSTUEwHtIQemTzL6gGzEAjrH7pWEfk3hnvwI/Un4G9yhlafPQO8eE9OBoeopHpgZ7w07JvXle6QKaS6Pwn8qu3AbhOSPYuIllQG0L98Fb1Z16KK2cYo/fxvbXVwRASE6GfYpsuOW0t+yI7LnqtfHBYb3fj1d20JL778PtltoiZk3q2nxuZHco7ub0gR8ZRmprP3LkhCJ+OQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com; dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sIEtoNGz; dkim-atps=neutral; spf=pass (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org) smtp.mailfrom=baylibre.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.a=rsa-sha256 header.s=20230601 header.b=sIEtoNGz;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=baylibre.com (client-ip=2a00:1450:4864:20::42a; helo=mail-wr1-x42a.google.com; envelope-from=ukleinek@baylibre.com; receiver=lists.ozlabs.org)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X2Vh52w9Kz2yNn
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Sep 2024 01:12:51 +1000 (AEST)
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-374c1963cb6so2749277f8f.3
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 09 Sep 2024 08:12:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1725894765; x=1726499565; darn=lists.ozlabs.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Sgkqs1A/DqOd+LNi6PkmNKStV4y6ssrPBnrKxQJYrqU=;
        b=sIEtoNGzbJAaqyOFFUXLvMwT1G9qPVT5u/8/AOqsZQJ8oNGBXWNOrbI9nhvhVrLgO2
         YvT34ZeD7MSlasnGejvIe/G1u6Vd0U3vsQ9rwwVA+yo9nSMElSsSrg8QwqGpYKJcro8N
         93pZiJmvPmypOixcCGPB0MNut7flJnwJX7VQ2J/r0sWJjbCOtc9dh6c6EBoAi6e0vYCe
         2hiyLhzKYqWOqy1iI3IYVBh2Yv47jNS82cAI+BCJeR1inKNu+IVRgjRp4v3H1kYSJ4xX
         ewGpoHbiqlsZzW2WbrmR3BzVWZV5Q5BIKWnekVF6f36ppNqyGUwVNYtMjO6oVatBwXYQ
         QkMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725894765; x=1726499565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sgkqs1A/DqOd+LNi6PkmNKStV4y6ssrPBnrKxQJYrqU=;
        b=fJNlw6ak0ZLv2ao6g1+/pf5zp8A/ZjJThCtVhDVX8qIEgZkM9PzrggNNO/I0oilAM1
         Jxvqd7RMDIIn+0TXIUebN0510RKBkZo3l3sDf42T794Qvu1JqRdr5DWoUjDMNh44WYM3
         kfE4P5meUYMzAAqCjdv9QkyX0koikacXb7nvPhXHooGJl8w+lXjS/6iTUFocdSCH1h86
         V1unJdtrL7vXKNOO6BMnswFTn6lcU6S7oM6XVvCe8T4FP79lxgnVJpwD6UP/Mad0V1hN
         PA7GKsrc1IBHmgF8ni1AgD5sll8a5Dz7FGGQZnHiyDRGXOCVvn5rTbsY1cQbeKaGE+QD
         N69Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4RY9XQjk9eVN3Zpz85PwjNBm32VpDRa6gTZ5HxAWcI4F6+WQYhI5XPhJ/CUM65a8zZsoycY6FZhAEf/Y=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YytJvUqSBiSBfAG4bFzlgJm8aFmIerzE+IuccG1ol0eatgSu/CJ
	zsljWYFRfz+rgZmvinw6g5Sj3PcGOlr7bCKZM3kvRg51ZTqz+T1IQVVvx6cxcMA=
X-Google-Smtp-Source: AGHT+IHJTw/xKgEpMgu1MGbGfdtG7mXHCy2bRWEfK1at3MWjli3167F6xq+bAVrnFnz6pX3wfGN6+Q==
X-Received: by 2002:adf:fac4:0:b0:374:c287:2af9 with SMTP id ffacd0b85a97d-3788967a59dmr6799776f8f.46.1725894764248;
        Mon, 09 Sep 2024 08:12:44 -0700 (PDT)
Received: from localhost (p200300f65f01db004d6a46a6454a1385.dip0.t-ipconnect.de. [2003:f6:5f01:db00:4d6a:46a6:454a:1385])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956e8674sm6309178f8f.115.2024.09.09.08.12.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Sep 2024 08:12:43 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	asahi@lists.linux.dev,
	alsa-devel@alsa-project.org,
	linux-arm-kernel@lists.infradead.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	sound-open-firmware@alsa-project.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: [PATCH] ASoC: Switch back to struct platform_driver::remove()
Date: Mon,  9 Sep 2024 17:12:30 +0200
Message-ID: <20240909151230.909818-2-u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=101320; i=u.kleine-koenig@baylibre.com; h=from:subject; bh=rBiW+3k+a1x1D2A5lwtHk7OSzZuOaBPwVcIRASRnLWY=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBm3xBeDLBqHMpYXzY7REYdaOrZ4HhGfGYVlZGKe /9I4AHVmEaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCZt8QXgAKCRCPgPtYfRL+ TlmCB/oCkRGu204c17XxYIzSHp5vRrOoRMIE5dDRpxj9PxqINJGZLDxs6vRCIxYRf3m0dfJAW4s J3nY98MVcktFA1vhoGwj5xczjCvm2NfE9bjoM+mOjiEl2PMyM3A8y+4izTyxOn357yDK+cCSfIy KUxWty1vTv7+ucFY6y4xM1+tfGdhdaQ8LgNP6UDzCwTVxvXB/GwBr7koQuUSQhh84B25yTSSwkx 82+YlvMOb/wNdvgOvwK3NDm1+V/dXM6QFKS/B3AxSdbNIhGDRgKqKdKt09Z4CYO1cHu3zsMi9Cs jw093eDBOCpHqbX09tM6M1b0pLSbH0JkeUijBJN3eIOuVt8P
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
return void") .remove() is (again) the right callback to implement for
platform drivers.

Convert all drivers below sound/soc to use .remove(), with the eventual
goal to drop struct platform_driver::remove_new(). As .remove() and
.remove_new() have the same prototypes, conversion is done by just
changing the structure member name in the driver initializer.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
Hello,

this is a single patch for all of sound/soc. If you prefer, I can split
it. If so, just tell how (per subdir? per driver? somehow else?) Also I trimmed
the list of recipents compared to what scripts/get_maintainer.sh emits. I
dropped all the maintainers for the individual drivers and only kept the list.
Otherwise the set of recipents is too huge.

Best regards
Uwe

 sound/soc/adi/axi-i2s.c                             | 2 +-
 sound/soc/adi/axi-spdif.c                           | 2 +-
 sound/soc/amd/acp-pcm-dma.c                         | 2 +-
 sound/soc/amd/acp/acp-rembrandt.c                   | 2 +-
 sound/soc/amd/acp/acp-renoir.c                      | 2 +-
 sound/soc/amd/acp/acp-sdw-sof-mach.c                | 2 +-
 sound/soc/amd/acp/acp63.c                           | 2 +-
 sound/soc/amd/acp/acp70.c                           | 2 +-
 sound/soc/amd/ps/ps-pdm-dma.c                       | 2 +-
 sound/soc/amd/ps/ps-sdw-dma.c                       | 2 +-
 sound/soc/amd/raven/acp3x-pcm-dma.c                 | 2 +-
 sound/soc/amd/renoir/acp3x-pdm-dma.c                | 2 +-
 sound/soc/amd/vangogh/acp5x-pcm-dma.c               | 2 +-
 sound/soc/amd/yc/acp6x-pdm-dma.c                    | 2 +-
 sound/soc/apple/mca.c                               | 2 +-
 sound/soc/atmel/atmel-i2s.c                         | 2 +-
 sound/soc/atmel/atmel_wm8904.c                      | 2 +-
 sound/soc/atmel/mchp-i2s-mcc.c                      | 2 +-
 sound/soc/atmel/mchp-pdmc.c                         | 2 +-
 sound/soc/atmel/mchp-spdifrx.c                      | 2 +-
 sound/soc/atmel/mchp-spdiftx.c                      | 2 +-
 sound/soc/atmel/sam9g20_wm8731.c                    | 2 +-
 sound/soc/atmel/sam9x5_wm8731.c                     | 2 +-
 sound/soc/atmel/tse850-pcm5142.c                    | 2 +-
 sound/soc/au1x/ac97c.c                              | 2 +-
 sound/soc/au1x/i2sc.c                               | 2 +-
 sound/soc/au1x/psc-ac97.c                           | 2 +-
 sound/soc/au1x/psc-i2s.c                            | 2 +-
 sound/soc/bcm/bcm63xx-i2s-whistler.c                | 2 +-
 sound/soc/bcm/cygnus-ssp.c                          | 2 +-
 sound/soc/cirrus/edb93xx.c                          | 2 +-
 sound/soc/cirrus/ep93xx-i2s.c                       | 2 +-
 sound/soc/codecs/cs42l43.c                          | 2 +-
 sound/soc/codecs/cs47l15.c                          | 2 +-
 sound/soc/codecs/cs47l24.c                          | 2 +-
 sound/soc/codecs/cs47l35.c                          | 2 +-
 sound/soc/codecs/cs47l85.c                          | 2 +-
 sound/soc/codecs/cs47l90.c                          | 2 +-
 sound/soc/codecs/cs47l92.c                          | 2 +-
 sound/soc/codecs/inno_rk3036.c                      | 2 +-
 sound/soc/codecs/lpass-rx-macro.c                   | 2 +-
 sound/soc/codecs/lpass-tx-macro.c                   | 2 +-
 sound/soc/codecs/lpass-va-macro.c                   | 2 +-
 sound/soc/codecs/lpass-wsa-macro.c                  | 2 +-
 sound/soc/codecs/msm8916-wcd-digital.c              | 2 +-
 sound/soc/codecs/rk817_codec.c                      | 2 +-
 sound/soc/codecs/wcd937x.c                          | 2 +-
 sound/soc/codecs/wcd938x.c                          | 2 +-
 sound/soc/codecs/wcd939x.c                          | 2 +-
 sound/soc/codecs/wm5102.c                           | 2 +-
 sound/soc/codecs/wm5110.c                           | 2 +-
 sound/soc/codecs/wm8994.c                           | 2 +-
 sound/soc/codecs/wm8997.c                           | 2 +-
 sound/soc/codecs/wm8998.c                           | 2 +-
 sound/soc/dwc/dwc-i2s.c                             | 2 +-
 sound/soc/fsl/fsl_asrc.c                            | 2 +-
 sound/soc/fsl/fsl_aud2htx.c                         | 2 +-
 sound/soc/fsl/fsl_audmix.c                          | 2 +-
 sound/soc/fsl/fsl_dma.c                             | 2 +-
 sound/soc/fsl/fsl_easrc.c                           | 2 +-
 sound/soc/fsl/fsl_esai.c                            | 2 +-
 sound/soc/fsl/fsl_micfil.c                          | 2 +-
 sound/soc/fsl/fsl_mqs.c                             | 2 +-
 sound/soc/fsl/fsl_rpmsg.c                           | 2 +-
 sound/soc/fsl/fsl_sai.c                             | 2 +-
 sound/soc/fsl/fsl_spdif.c                           | 2 +-
 sound/soc/fsl/fsl_ssi.c                             | 2 +-
 sound/soc/fsl/fsl_xcvr.c                            | 2 +-
 sound/soc/fsl/imx-audmux.c                          | 2 +-
 sound/soc/fsl/imx-pcm-rpmsg.c                       | 2 +-
 sound/soc/fsl/imx-sgtl5000.c                        | 2 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                    | 2 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                     | 2 +-
 sound/soc/fsl/p1022_ds.c                            | 2 +-
 sound/soc/fsl/p1022_rdk.c                           | 2 +-
 sound/soc/fsl/pcm030-audio-fabric.c                 | 2 +-
 sound/soc/generic/audio-graph-card.c                | 2 +-
 sound/soc/generic/audio-graph-card2-custom-sample.c | 2 +-
 sound/soc/generic/audio-graph-card2.c               | 2 +-
 sound/soc/generic/simple-card.c                     | 2 +-
 sound/soc/generic/test-component.c                  | 2 +-
 sound/soc/img/img-i2s-in.c                          | 2 +-
 sound/soc/img/img-i2s-out.c                         | 2 +-
 sound/soc/img/img-parallel-out.c                    | 2 +-
 sound/soc/img/img-spdif-in.c                        | 2 +-
 sound/soc/img/img-spdif-out.c                       | 2 +-
 sound/soc/img/pistachio-internal-dac.c              | 2 +-
 sound/soc/intel/atom/sst-mfld-platform-pcm.c        | 2 +-
 sound/soc/intel/atom/sst/sst_acpi.c                 | 2 +-
 sound/soc/intel/boards/bytcht_es8316.c              | 2 +-
 sound/soc/intel/boards/bytcr_rt5640.c               | 2 +-
 sound/soc/intel/boards/bytcr_rt5651.c               | 2 +-
 sound/soc/intel/boards/bytcr_wm5102.c               | 2 +-
 sound/soc/intel/boards/cht_bsw_max98090_ti.c        | 2 +-
 sound/soc/intel/boards/sof_es8336.c                 | 2 +-
 sound/soc/intel/boards/sof_pcm512x.c                | 2 +-
 sound/soc/intel/boards/sof_sdw.c                    | 2 +-
 sound/soc/intel/boards/sof_wm8804.c                 | 2 +-
 sound/soc/intel/catpt/device.c                      | 2 +-
 sound/soc/kirkwood/kirkwood-i2s.c                   | 2 +-
 sound/soc/mediatek/common/mtk-btcvsd.c              | 2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt7986/mt7986-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8183/mt8183-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8192/mt8192-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8195/mt8195-afe-pcm.c          | 2 +-
 sound/soc/mediatek/mt8365/mt8365-afe-pcm.c          | 2 +-
 sound/soc/meson/aiu.c                               | 2 +-
 sound/soc/meson/axg-card.c                          | 2 +-
 sound/soc/meson/gx-card.c                           | 2 +-
 sound/soc/mxs/mxs-sgtl5000.c                        | 2 +-
 sound/soc/pxa/mmp-sspa.c                            | 2 +-
 sound/soc/pxa/pxa2xx-ac97.c                         | 2 +-
 sound/soc/qcom/lpass-apq8016.c                      | 2 +-
 sound/soc/qcom/lpass-ipq806x.c                      | 2 +-
 sound/soc/qcom/lpass-sc7180.c                       | 2 +-
 sound/soc/qcom/lpass-sc7280.c                       | 2 +-
 sound/soc/qcom/qdsp6/q6routing.c                    | 2 +-
 sound/soc/rockchip/rockchip_i2s.c                   | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c               | 2 +-
 sound/soc/rockchip/rockchip_pdm.c                   | 2 +-
 sound/soc/rockchip/rockchip_rt5645.c                | 2 +-
 sound/soc/rockchip/rockchip_spdif.c                 | 2 +-
 sound/soc/samsung/arndale.c                         | 2 +-
 sound/soc/samsung/i2s.c                             | 2 +-
 sound/soc/samsung/odroid.c                          | 2 +-
 sound/soc/samsung/pcm.c                             | 2 +-
 sound/soc/samsung/snow.c                            | 2 +-
 sound/soc/samsung/spdif.c                           | 2 +-
 sound/soc/sh/fsi.c                                  | 2 +-
 sound/soc/sh/hac.c                                  | 2 +-
 sound/soc/sh/rcar/core.c                            | 2 +-
 sound/soc/sh/rz-ssi.c                               | 2 +-
 sound/soc/sh/siu_dai.c                              | 2 +-
 sound/soc/sof/imx/imx8.c                            | 2 +-
 sound/soc/sof/imx/imx8m.c                           | 2 +-
 sound/soc/sof/imx/imx8ulp.c                         | 2 +-
 sound/soc/sof/intel/bdw.c                           | 2 +-
 sound/soc/sof/intel/byt.c                           | 2 +-
 sound/soc/sof/mediatek/mt8186/mt8186.c              | 2 +-
 sound/soc/sof/mediatek/mt8195/mt8195.c              | 2 +-
 sound/soc/sprd/sprd-mcdt.c                          | 2 +-
 sound/soc/starfive/jh7110_pwmdac.c                  | 2 +-
 sound/soc/starfive/jh7110_tdm.c                     | 2 +-
 sound/soc/stm/stm32_adfsdm.c                        | 2 +-
 sound/soc/stm/stm32_i2s.c                           | 2 +-
 sound/soc/stm/stm32_sai_sub.c                       | 2 +-
 sound/soc/stm/stm32_spdifrx.c                       | 2 +-
 sound/soc/sunxi/sun4i-codec.c                       | 2 +-
 sound/soc/sunxi/sun4i-i2s.c                         | 2 +-
 sound/soc/sunxi/sun4i-spdif.c                       | 2 +-
 sound/soc/sunxi/sun50i-dmic.c                       | 2 +-
 sound/soc/sunxi/sun8i-codec.c                       | 2 +-
 sound/soc/tegra/tegra186_asrc.c                     | 2 +-
 sound/soc/tegra/tegra186_dspk.c                     | 2 +-
 sound/soc/tegra/tegra20_ac97.c                      | 2 +-
 sound/soc/tegra/tegra20_i2s.c                       | 2 +-
 sound/soc/tegra/tegra210_admaif.c                   | 2 +-
 sound/soc/tegra/tegra210_adx.c                      | 2 +-
 sound/soc/tegra/tegra210_ahub.c                     | 2 +-
 sound/soc/tegra/tegra210_amx.c                      | 2 +-
 sound/soc/tegra/tegra210_dmic.c                     | 2 +-
 sound/soc/tegra/tegra210_i2s.c                      | 2 +-
 sound/soc/tegra/tegra210_mixer.c                    | 2 +-
 sound/soc/tegra/tegra210_mvc.c                      | 2 +-
 sound/soc/tegra/tegra210_ope.c                      | 2 +-
 sound/soc/tegra/tegra210_sfc.c                      | 2 +-
 sound/soc/tegra/tegra30_ahub.c                      | 2 +-
 sound/soc/tegra/tegra30_i2s.c                       | 2 +-
 sound/soc/tegra/tegra_audio_graph_card.c            | 2 +-
 sound/soc/ti/ams-delta.c                            | 2 +-
 sound/soc/ti/davinci-i2s.c                          | 2 +-
 sound/soc/ti/davinci-mcasp.c                        | 2 +-
 sound/soc/ti/omap-mcbsp.c                           | 2 +-
 sound/soc/uniphier/aio-ld11.c                       | 2 +-
 sound/soc/uniphier/aio-pxs2.c                       | 2 +-
 sound/soc/uniphier/evea.c                           | 2 +-
 sound/soc/ux500/mop500.c                            | 2 +-
 sound/soc/ux500/ux500_msp_dai.c                     | 2 +-
 sound/soc/xilinx/xlnx_formatter_pcm.c               | 2 +-
 sound/soc/xilinx/xlnx_spdif.c                       | 2 +-
 sound/soc/xtensa/xtfpga-i2s.c                       | 2 +-
 184 files changed, 184 insertions(+), 184 deletions(-)

diff --git a/sound/soc/adi/axi-i2s.c b/sound/soc/adi/axi-i2s.c
index 4107eddc9ca8..41f89384f8fd 100644
--- a/sound/soc/adi/axi-i2s.c
+++ b/sound/soc/adi/axi-i2s.c
@@ -293,7 +293,7 @@ static struct platform_driver axi_i2s_driver = {
 		.of_match_table = axi_i2s_of_match,
 	},
 	.probe = axi_i2s_probe,
-	.remove_new = axi_i2s_dev_remove,
+	.remove = axi_i2s_dev_remove,
 };
 module_platform_driver(axi_i2s_driver);
 
diff --git a/sound/soc/adi/axi-spdif.c b/sound/soc/adi/axi-spdif.c
index 10545bd99704..5581134201a3 100644
--- a/sound/soc/adi/axi-spdif.c
+++ b/sound/soc/adi/axi-spdif.c
@@ -258,7 +258,7 @@ static struct platform_driver axi_spdif_driver = {
 		.of_match_table = axi_spdif_of_match,
 	},
 	.probe = axi_spdif_probe,
-	.remove_new = axi_spdif_dev_remove,
+	.remove = axi_spdif_dev_remove,
 };
 module_platform_driver(axi_spdif_driver);
 
diff --git a/sound/soc/amd/acp-pcm-dma.c b/sound/soc/amd/acp-pcm-dma.c
index b857e2676fe8..897dde630022 100644
--- a/sound/soc/amd/acp-pcm-dma.c
+++ b/sound/soc/amd/acp-pcm-dma.c
@@ -1426,7 +1426,7 @@ static const struct dev_pm_ops acp_pm_ops = {
 
 static struct platform_driver acp_dma_driver = {
 	.probe = acp_audio_probe,
-	.remove_new = acp_audio_remove,
+	.remove = acp_audio_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &acp_pm_ops,
diff --git a/sound/soc/amd/acp/acp-rembrandt.c b/sound/soc/amd/acp/acp-rembrandt.c
index e19981c7d65a..396434a45eea 100644
--- a/sound/soc/amd/acp/acp-rembrandt.c
+++ b/sound/soc/amd/acp/acp-rembrandt.c
@@ -295,7 +295,7 @@ static const struct dev_pm_ops rmb_dma_pm_ops = {
 
 static struct platform_driver rembrandt_driver = {
 	.probe = rembrandt_audio_probe,
-	.remove_new = rembrandt_audio_remove,
+	.remove = rembrandt_audio_remove,
 	.driver = {
 		.name = "acp_asoc_rembrandt",
 		.pm = &rmb_dma_pm_ops,
diff --git a/sound/soc/amd/acp/acp-renoir.c b/sound/soc/amd/acp/acp-renoir.c
index db835ed7c208..5e3f730aa6bf 100644
--- a/sound/soc/amd/acp/acp-renoir.c
+++ b/sound/soc/amd/acp/acp-renoir.c
@@ -244,7 +244,7 @@ static const struct dev_pm_ops rn_dma_pm_ops = {
 
 static struct platform_driver renoir_driver = {
 	.probe = renoir_audio_probe,
-	.remove_new = renoir_audio_remove,
+	.remove = renoir_audio_remove,
 	.driver = {
 		.name = "acp_asoc_renoir",
 		.pm = &rn_dma_pm_ops,
diff --git a/sound/soc/amd/acp/acp-sdw-sof-mach.c b/sound/soc/amd/acp/acp-sdw-sof-mach.c
index 08f368b3bbc8..b1cd173f607d 100644
--- a/sound/soc/amd/acp/acp-sdw-sof-mach.c
+++ b/sound/soc/amd/acp/acp-sdw-sof-mach.c
@@ -729,7 +729,7 @@ static struct platform_driver sof_sdw_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mc_probe,
-	.remove_new = mc_remove,
+	.remove = mc_remove,
 	.id_table = mc_id_table,
 };
 
diff --git a/sound/soc/amd/acp/acp63.c b/sound/soc/amd/acp/acp63.c
index f340920b3289..f325c374f228 100644
--- a/sound/soc/amd/acp/acp63.c
+++ b/sound/soc/amd/acp/acp63.c
@@ -304,7 +304,7 @@ static const struct dev_pm_ops acp63_dma_pm_ops = {
 
 static struct platform_driver acp63_driver = {
 	.probe = acp63_audio_probe,
-	.remove_new = acp63_audio_remove,
+	.remove = acp63_audio_remove,
 	.driver = {
 		.name = "acp_asoc_acp63",
 		.pm = &acp63_dma_pm_ops,
diff --git a/sound/soc/amd/acp/acp70.c b/sound/soc/amd/acp/acp70.c
index 1b0b59a22924..68d2590e1a4e 100644
--- a/sound/soc/amd/acp/acp70.c
+++ b/sound/soc/amd/acp/acp70.c
@@ -278,7 +278,7 @@ static const struct dev_pm_ops acp70_dma_pm_ops = {
 
 static struct platform_driver acp70_driver = {
 	.probe = acp_acp70_audio_probe,
-	.remove_new = acp_acp70_audio_remove,
+	.remove = acp_acp70_audio_remove,
 	.driver = {
 		.name = "acp_asoc_acp70",
 		.pm = &acp70_dma_pm_ops,
diff --git a/sound/soc/amd/ps/ps-pdm-dma.c b/sound/soc/amd/ps/ps-pdm-dma.c
index 7bbacbab1095..318fc260f293 100644
--- a/sound/soc/amd/ps/ps-pdm-dma.c
+++ b/sound/soc/amd/ps/ps-pdm-dma.c
@@ -448,7 +448,7 @@ static const struct dev_pm_ops acp63_pdm_pm_ops = {
 
 static struct platform_driver acp63_pdm_dma_driver = {
 	.probe = acp63_pdm_audio_probe,
-	.remove_new = acp63_pdm_audio_remove,
+	.remove = acp63_pdm_audio_remove,
 	.driver = {
 		.name = "acp_ps_pdm_dma",
 		.pm = &acp63_pdm_pm_ops,
diff --git a/sound/soc/amd/ps/ps-sdw-dma.c b/sound/soc/amd/ps/ps-sdw-dma.c
index 2f630753278d..3b4b9c6b3171 100644
--- a/sound/soc/amd/ps/ps-sdw-dma.c
+++ b/sound/soc/amd/ps/ps-sdw-dma.c
@@ -551,7 +551,7 @@ static const struct dev_pm_ops acp63_pm_ops = {
 
 static struct platform_driver acp63_sdw_dma_driver = {
 	.probe = acp63_sdw_platform_probe,
-	.remove_new = acp63_sdw_platform_remove,
+	.remove = acp63_sdw_platform_remove,
 	.driver = {
 		.name = "amd_ps_sdw_dma",
 		.pm = &acp63_pm_ops,
diff --git a/sound/soc/amd/raven/acp3x-pcm-dma.c b/sound/soc/amd/raven/acp3x-pcm-dma.c
index 3a50558f6751..bb9ed52d744d 100644
--- a/sound/soc/amd/raven/acp3x-pcm-dma.c
+++ b/sound/soc/amd/raven/acp3x-pcm-dma.c
@@ -509,7 +509,7 @@ static const struct dev_pm_ops acp3x_pm_ops = {
 
 static struct platform_driver acp3x_dma_driver = {
 	.probe = acp3x_audio_probe,
-	.remove_new = acp3x_audio_remove,
+	.remove = acp3x_audio_remove,
 	.driver = {
 		.name = "acp3x_rv_i2s_dma",
 		.pm = &acp3x_pm_ops,
diff --git a/sound/soc/amd/renoir/acp3x-pdm-dma.c b/sound/soc/amd/renoir/acp3x-pdm-dma.c
index c3b47e9bd239..95ac8c680037 100644
--- a/sound/soc/amd/renoir/acp3x-pdm-dma.c
+++ b/sound/soc/amd/renoir/acp3x-pdm-dma.c
@@ -489,7 +489,7 @@ static const struct dev_pm_ops acp_pdm_pm_ops = {
 
 static struct platform_driver acp_pdm_dma_driver = {
 	.probe = acp_pdm_audio_probe,
-	.remove_new = acp_pdm_audio_remove,
+	.remove = acp_pdm_audio_remove,
 	.driver = {
 		.name = "acp_rn_pdm_dma",
 		.pm = &acp_pdm_pm_ops,
diff --git a/sound/soc/amd/vangogh/acp5x-pcm-dma.c b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
index 491b16e52a72..d5965f2b09bc 100644
--- a/sound/soc/amd/vangogh/acp5x-pcm-dma.c
+++ b/sound/soc/amd/vangogh/acp5x-pcm-dma.c
@@ -499,7 +499,7 @@ static const struct dev_pm_ops acp5x_pm_ops = {
 
 static struct platform_driver acp5x_dma_driver = {
 	.probe = acp5x_audio_probe,
-	.remove_new = acp5x_audio_remove,
+	.remove = acp5x_audio_remove,
 	.driver = {
 		.name = "acp5x_i2s_dma",
 		.pm = &acp5x_pm_ops,
diff --git a/sound/soc/amd/yc/acp6x-pdm-dma.c b/sound/soc/amd/yc/acp6x-pdm-dma.c
index 72c4591e451b..3eb3e82efb10 100644
--- a/sound/soc/amd/yc/acp6x-pdm-dma.c
+++ b/sound/soc/amd/yc/acp6x-pdm-dma.c
@@ -440,7 +440,7 @@ static const struct dev_pm_ops acp6x_pdm_pm_ops = {
 
 static struct platform_driver acp6x_pdm_dma_driver = {
 	.probe = acp6x_pdm_audio_probe,
-	.remove_new = acp6x_pdm_audio_remove,
+	.remove = acp6x_pdm_audio_remove,
 	.driver = {
 		.name = "acp_yc_pdm_dma",
 		.pm = &acp6x_pdm_pm_ops,
diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 3780aca71076..c9e7d40c47cc 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -1179,7 +1179,7 @@ static struct platform_driver apple_mca_driver = {
 		.of_match_table = apple_mca_of_match,
 	},
 	.probe = apple_mca_probe,
-	.remove_new = apple_mca_remove,
+	.remove = apple_mca_remove,
 };
 module_platform_driver(apple_mca_driver);
 
diff --git a/sound/soc/atmel/atmel-i2s.c b/sound/soc/atmel/atmel-i2s.c
index 6c20c643f321..762199faf872 100644
--- a/sound/soc/atmel/atmel-i2s.c
+++ b/sound/soc/atmel/atmel-i2s.c
@@ -733,7 +733,7 @@ static struct platform_driver atmel_i2s_driver = {
 		.of_match_table	= atmel_i2s_dt_ids,
 	},
 	.probe		= atmel_i2s_probe,
-	.remove_new	= atmel_i2s_remove,
+	.remove		= atmel_i2s_remove,
 };
 module_platform_driver(atmel_i2s_driver);
 
diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index b7f16ea0cdfc..0f4021c6c588 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -187,7 +187,7 @@ static struct platform_driver atmel_asoc_wm8904_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe = atmel_asoc_wm8904_probe,
-	.remove_new = atmel_asoc_wm8904_remove,
+	.remove = atmel_asoc_wm8904_remove,
 };
 
 module_platform_driver(atmel_asoc_wm8904_driver);
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 35a56b266b8d..fbcb0070c188 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -1129,7 +1129,7 @@ static struct platform_driver mchp_i2s_mcc_driver = {
 		.of_match_table	= mchp_i2s_mcc_dt_ids,
 	},
 	.probe		= mchp_i2s_mcc_probe,
-	.remove_new	= mchp_i2s_mcc_remove,
+	.remove		= mchp_i2s_mcc_remove,
 };
 module_platform_driver(mchp_i2s_mcc_driver);
 
diff --git a/sound/soc/atmel/mchp-pdmc.c b/sound/soc/atmel/mchp-pdmc.c
index dcc4e14b3dde..260074018da9 100644
--- a/sound/soc/atmel/mchp-pdmc.c
+++ b/sound/soc/atmel/mchp-pdmc.c
@@ -1153,7 +1153,7 @@ static struct platform_driver mchp_pdmc_driver = {
 		.pm		= pm_ptr(&mchp_pdmc_pm_ops),
 	},
 	.probe	= mchp_pdmc_probe,
-	.remove_new = mchp_pdmc_remove,
+	.remove = mchp_pdmc_remove,
 };
 module_platform_driver(mchp_pdmc_driver);
 
diff --git a/sound/soc/atmel/mchp-spdifrx.c b/sound/soc/atmel/mchp-spdifrx.c
index 33ce5e54482b..b2507a1491b7 100644
--- a/sound/soc/atmel/mchp-spdifrx.c
+++ b/sound/soc/atmel/mchp-spdifrx.c
@@ -1194,7 +1194,7 @@ static void mchp_spdifrx_remove(struct platform_device *pdev)
 
 static struct platform_driver mchp_spdifrx_driver = {
 	.probe	= mchp_spdifrx_probe,
-	.remove_new = mchp_spdifrx_remove,
+	.remove = mchp_spdifrx_remove,
 	.driver	= {
 		.name	= "mchp_spdifrx",
 		.of_match_table = mchp_spdifrx_dt_ids,
diff --git a/sound/soc/atmel/mchp-spdiftx.c b/sound/soc/atmel/mchp-spdiftx.c
index a201a96fa690..4c60ea652896 100644
--- a/sound/soc/atmel/mchp-spdiftx.c
+++ b/sound/soc/atmel/mchp-spdiftx.c
@@ -888,7 +888,7 @@ static void mchp_spdiftx_remove(struct platform_device *pdev)
 
 static struct platform_driver mchp_spdiftx_driver = {
 	.probe	= mchp_spdiftx_probe,
-	.remove_new = mchp_spdiftx_remove,
+	.remove = mchp_spdiftx_remove,
 	.driver	= {
 		.name	= "mchp_spdiftx",
 		.of_match_table = mchp_spdiftx_dt_ids,
diff --git a/sound/soc/atmel/sam9g20_wm8731.c b/sound/soc/atmel/sam9g20_wm8731.c
index d3ec9826d505..335e216ea7b4 100644
--- a/sound/soc/atmel/sam9g20_wm8731.c
+++ b/sound/soc/atmel/sam9g20_wm8731.c
@@ -207,7 +207,7 @@ static struct platform_driver at91sam9g20ek_audio_driver = {
 		.of_match_table = of_match_ptr(at91sam9g20ek_wm8731_dt_ids),
 	},
 	.probe	= at91sam9g20ek_audio_probe,
-	.remove_new = at91sam9g20ek_audio_remove,
+	.remove = at91sam9g20ek_audio_remove,
 };
 
 module_platform_driver(at91sam9g20ek_audio_driver);
diff --git a/sound/soc/atmel/sam9x5_wm8731.c b/sound/soc/atmel/sam9x5_wm8731.c
index d1c1f370a9cd..1b5ef4e9d2b8 100644
--- a/sound/soc/atmel/sam9x5_wm8731.c
+++ b/sound/soc/atmel/sam9x5_wm8731.c
@@ -196,7 +196,7 @@ static struct platform_driver sam9x5_wm8731_driver = {
 		.of_match_table = of_match_ptr(sam9x5_wm8731_of_match),
 	},
 	.probe = sam9x5_wm8731_driver_probe,
-	.remove_new = sam9x5_wm8731_driver_remove,
+	.remove = sam9x5_wm8731_driver_remove,
 };
 module_platform_driver(sam9x5_wm8731_driver);
 
diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index 5d208e0b4b90..0a9efd5f2861 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -431,7 +431,7 @@ static struct platform_driver tse850_driver = {
 		.of_match_table = tse850_dt_ids,
 	},
 	.probe = tse850_probe,
-	.remove_new = tse850_remove,
+	.remove = tse850_remove,
 };
 
 module_platform_driver(tse850_driver);
diff --git a/sound/soc/au1x/ac97c.c b/sound/soc/au1x/ac97c.c
index b0e1a1253e10..f8ab936250dc 100644
--- a/sound/soc/au1x/ac97c.c
+++ b/sound/soc/au1x/ac97c.c
@@ -336,7 +336,7 @@ static struct platform_driver au1xac97c_driver = {
 		.pm	= AU1XPSCAC97_PMOPS,
 	},
 	.probe		= au1xac97c_drvprobe,
-	.remove_new	= au1xac97c_drvremove,
+	.remove		= au1xac97c_drvremove,
 };
 
 module_platform_driver(au1xac97c_driver);
diff --git a/sound/soc/au1x/i2sc.c b/sound/soc/au1x/i2sc.c
index 064406080d72..7d296f29dade 100644
--- a/sound/soc/au1x/i2sc.c
+++ b/sound/soc/au1x/i2sc.c
@@ -313,7 +313,7 @@ static struct platform_driver au1xi2s_driver = {
 		.pm	= AU1XI2SC_PMOPS,
 	},
 	.probe		= au1xi2s_drvprobe,
-	.remove_new	= au1xi2s_drvremove,
+	.remove		= au1xi2s_drvremove,
 };
 
 module_platform_driver(au1xi2s_driver);
diff --git a/sound/soc/au1x/psc-ac97.c b/sound/soc/au1x/psc-ac97.c
index 1727eeb12b64..8a59a50978b9 100644
--- a/sound/soc/au1x/psc-ac97.c
+++ b/sound/soc/au1x/psc-ac97.c
@@ -486,7 +486,7 @@ static struct platform_driver au1xpsc_ac97_driver = {
 		.pm	= AU1XPSCAC97_PMOPS,
 	},
 	.probe		= au1xpsc_ac97_drvprobe,
-	.remove_new	= au1xpsc_ac97_drvremove,
+	.remove		= au1xpsc_ac97_drvremove,
 };
 
 module_platform_driver(au1xpsc_ac97_driver);
diff --git a/sound/soc/au1x/psc-i2s.c b/sound/soc/au1x/psc-i2s.c
index 52734dec8247..bee013555e7a 100644
--- a/sound/soc/au1x/psc-i2s.c
+++ b/sound/soc/au1x/psc-i2s.c
@@ -404,7 +404,7 @@ static struct platform_driver au1xpsc_i2s_driver = {
 		.pm	= AU1XPSCI2S_PMOPS,
 	},
 	.probe		= au1xpsc_i2s_drvprobe,
-	.remove_new	= au1xpsc_i2s_drvremove,
+	.remove		= au1xpsc_i2s_drvremove,
 };
 
 module_platform_driver(au1xpsc_i2s_driver);
diff --git a/sound/soc/bcm/bcm63xx-i2s-whistler.c b/sound/soc/bcm/bcm63xx-i2s-whistler.c
index c64609718738..c47ed1e6ea2b 100644
--- a/sound/soc/bcm/bcm63xx-i2s-whistler.c
+++ b/sound/soc/bcm/bcm63xx-i2s-whistler.c
@@ -293,7 +293,7 @@ static struct platform_driver bcm63xx_i2s_driver = {
 		.of_match_table = of_match_ptr(snd_soc_bcm_audio_match),
 	},
 	.probe = bcm63xx_i2s_dev_probe,
-	.remove_new = bcm63xx_i2s_dev_remove,
+	.remove = bcm63xx_i2s_dev_remove,
 };
 
 module_platform_driver(bcm63xx_i2s_driver);
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 90088516fed0..e0ce0232eb1e 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -1390,7 +1390,7 @@ MODULE_DEVICE_TABLE(of, cygnus_ssp_of_match);
 
 static struct platform_driver cygnus_ssp_driver = {
 	.probe		= cygnus_ssp_probe,
-	.remove_new	= cygnus_ssp_remove,
+	.remove		= cygnus_ssp_remove,
 	.driver		= {
 		.name	= "cygnus-ssp",
 		.of_match_table = cygnus_ssp_of_match,
diff --git a/sound/soc/cirrus/edb93xx.c b/sound/soc/cirrus/edb93xx.c
index 8bb67d7d2b4b..8dac754ddb0d 100644
--- a/sound/soc/cirrus/edb93xx.c
+++ b/sound/soc/cirrus/edb93xx.c
@@ -105,7 +105,7 @@ static struct platform_driver edb93xx_driver = {
 		.name	= "edb93xx-audio",
 	},
 	.probe		= edb93xx_probe,
-	.remove_new	= edb93xx_remove,
+	.remove		= edb93xx_remove,
 };
 
 module_platform_driver(edb93xx_driver);
diff --git a/sound/soc/cirrus/ep93xx-i2s.c b/sound/soc/cirrus/ep93xx-i2s.c
index 522de4b80293..d45862ceb0c9 100644
--- a/sound/soc/cirrus/ep93xx-i2s.c
+++ b/sound/soc/cirrus/ep93xx-i2s.c
@@ -523,7 +523,7 @@ MODULE_DEVICE_TABLE(of, ep93xx_i2s_of_ids);
 
 static struct platform_driver ep93xx_i2s_driver = {
 	.probe	= ep93xx_i2s_probe,
-	.remove_new = ep93xx_i2s_remove,
+	.remove = ep93xx_i2s_remove,
 	.driver	= {
 		.name	= "ep93xx-i2s",
 		.of_match_table = ep93xx_i2s_of_ids,
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 5183b4586424..d0098b4558b5 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -2461,7 +2461,7 @@ static struct platform_driver cs42l43_codec_driver = {
 	},
 
 	.probe		= cs42l43_codec_probe,
-	.remove_new	= cs42l43_codec_remove,
+	.remove		= cs42l43_codec_remove,
 	.id_table	= cs42l43_codec_id_table,
 };
 module_platform_driver(cs42l43_codec_driver);
diff --git a/sound/soc/codecs/cs47l15.c b/sound/soc/codecs/cs47l15.c
index ab6e7cd99733..29a2bcfb3048 100644
--- a/sound/soc/codecs/cs47l15.c
+++ b/sound/soc/codecs/cs47l15.c
@@ -1493,7 +1493,7 @@ static struct platform_driver cs47l15_codec_driver = {
 		.name = "cs47l15-codec",
 	},
 	.probe = &cs47l15_probe,
-	.remove_new = cs47l15_remove,
+	.remove = cs47l15_remove,
 };
 
 module_platform_driver(cs47l15_codec_driver);
diff --git a/sound/soc/codecs/cs47l24.c b/sound/soc/codecs/cs47l24.c
index ec405ef66a8e..e2a839fae4fc 100644
--- a/sound/soc/codecs/cs47l24.c
+++ b/sound/soc/codecs/cs47l24.c
@@ -1344,7 +1344,7 @@ static struct platform_driver cs47l24_codec_driver = {
 		.name = "cs47l24-codec",
 	},
 	.probe = cs47l24_probe,
-	.remove_new = cs47l24_remove,
+	.remove = cs47l24_remove,
 };
 
 module_platform_driver(cs47l24_codec_driver);
diff --git a/sound/soc/codecs/cs47l35.c b/sound/soc/codecs/cs47l35.c
index 0d7ee7ea6257..85555c7a2e4b 100644
--- a/sound/soc/codecs/cs47l35.c
+++ b/sound/soc/codecs/cs47l35.c
@@ -1769,7 +1769,7 @@ static struct platform_driver cs47l35_codec_driver = {
 		.name = "cs47l35-codec",
 	},
 	.probe = &cs47l35_probe,
-	.remove_new = cs47l35_remove,
+	.remove = cs47l35_remove,
 };
 
 module_platform_driver(cs47l35_codec_driver);
diff --git a/sound/soc/codecs/cs47l85.c b/sound/soc/codecs/cs47l85.c
index 2dfb867e6edd..d34f4e8c26d3 100644
--- a/sound/soc/codecs/cs47l85.c
+++ b/sound/soc/codecs/cs47l85.c
@@ -2720,7 +2720,7 @@ static struct platform_driver cs47l85_codec_driver = {
 		.name = "cs47l85-codec",
 	},
 	.probe = &cs47l85_probe,
-	.remove_new = cs47l85_remove,
+	.remove = cs47l85_remove,
 };
 
 module_platform_driver(cs47l85_codec_driver);
diff --git a/sound/soc/codecs/cs47l90.c b/sound/soc/codecs/cs47l90.c
index 2549cb1fc121..a9e703981f37 100644
--- a/sound/soc/codecs/cs47l90.c
+++ b/sound/soc/codecs/cs47l90.c
@@ -2644,7 +2644,7 @@ static struct platform_driver cs47l90_codec_driver = {
 		.name = "cs47l90-codec",
 	},
 	.probe = &cs47l90_probe,
-	.remove_new = cs47l90_remove,
+	.remove = cs47l90_remove,
 };
 
 module_platform_driver(cs47l90_codec_driver);
diff --git a/sound/soc/codecs/cs47l92.c b/sound/soc/codecs/cs47l92.c
index 0c05ae0b09fb..2c355c61acd8 100644
--- a/sound/soc/codecs/cs47l92.c
+++ b/sound/soc/codecs/cs47l92.c
@@ -2092,7 +2092,7 @@ static struct platform_driver cs47l92_codec_driver = {
 		.name = "cs47l92-codec",
 	},
 	.probe = &cs47l92_probe,
-	.remove_new = cs47l92_remove,
+	.remove = cs47l92_remove,
 };
 
 module_platform_driver(cs47l92_codec_driver);
diff --git a/sound/soc/codecs/inno_rk3036.c b/sound/soc/codecs/inno_rk3036.c
index 11320423c69c..fdd19f8e8864 100644
--- a/sound/soc/codecs/inno_rk3036.c
+++ b/sound/soc/codecs/inno_rk3036.c
@@ -476,7 +476,7 @@ static struct platform_driver rk3036_codec_platform_driver = {
 		.of_match_table = of_match_ptr(rk3036_codec_of_match),
 	},
 	.probe = rk3036_codec_platform_probe,
-	.remove_new = rk3036_codec_platform_remove,
+	.remove = rk3036_codec_platform_remove,
 };
 
 module_platform_driver(rk3036_codec_platform_driver);
diff --git a/sound/soc/codecs/lpass-rx-macro.c b/sound/soc/codecs/lpass-rx-macro.c
index ce42749660c8..71e0d3bffd3f 100644
--- a/sound/soc/codecs/lpass-rx-macro.c
+++ b/sound/soc/codecs/lpass-rx-macro.c
@@ -4024,7 +4024,7 @@ static struct platform_driver rx_macro_driver = {
 		.pm = &rx_macro_pm_ops,
 	},
 	.probe = rx_macro_probe,
-	.remove_new = rx_macro_remove,
+	.remove = rx_macro_remove,
 };
 
 module_platform_driver(rx_macro_driver);
diff --git a/sound/soc/codecs/lpass-tx-macro.c b/sound/soc/codecs/lpass-tx-macro.c
index 209c12ec16dd..a134584acf90 100644
--- a/sound/soc/codecs/lpass-tx-macro.c
+++ b/sound/soc/codecs/lpass-tx-macro.c
@@ -2534,7 +2534,7 @@ static struct platform_driver tx_macro_driver = {
 		.pm = &tx_macro_pm_ops,
 	},
 	.probe = tx_macro_probe,
-	.remove_new = tx_macro_remove,
+	.remove = tx_macro_remove,
 };
 
 module_platform_driver(tx_macro_driver);
diff --git a/sound/soc/codecs/lpass-va-macro.c b/sound/soc/codecs/lpass-va-macro.c
index e95d1f29ef18..c781da476240 100644
--- a/sound/soc/codecs/lpass-va-macro.c
+++ b/sound/soc/codecs/lpass-va-macro.c
@@ -1738,7 +1738,7 @@ static struct platform_driver va_macro_driver = {
 		.pm = &va_macro_pm_ops,
 	},
 	.probe = va_macro_probe,
-	.remove_new = va_macro_remove,
+	.remove = va_macro_remove,
 };
 
 module_platform_driver(va_macro_driver);
diff --git a/sound/soc/codecs/lpass-wsa-macro.c b/sound/soc/codecs/lpass-wsa-macro.c
index 76900274acf3..c989d82d1d3c 100644
--- a/sound/soc/codecs/lpass-wsa-macro.c
+++ b/sound/soc/codecs/lpass-wsa-macro.c
@@ -2980,7 +2980,7 @@ static struct platform_driver wsa_macro_driver = {
 		.pm = &wsa_macro_pm_ops,
 	},
 	.probe = wsa_macro_probe,
-	.remove_new = wsa_macro_remove,
+	.remove = wsa_macro_remove,
 };
 
 module_platform_driver(wsa_macro_driver);
diff --git a/sound/soc/codecs/msm8916-wcd-digital.c b/sound/soc/codecs/msm8916-wcd-digital.c
index 978c4d056e81..ebb6f2e84818 100644
--- a/sound/soc/codecs/msm8916-wcd-digital.c
+++ b/sound/soc/codecs/msm8916-wcd-digital.c
@@ -1241,7 +1241,7 @@ static struct platform_driver msm8916_wcd_digital_driver = {
 		   .of_match_table = msm8916_wcd_digital_match_table,
 	},
 	.probe = msm8916_wcd_digital_probe,
-	.remove_new = msm8916_wcd_digital_remove,
+	.remove = msm8916_wcd_digital_remove,
 };
 
 module_platform_driver(msm8916_wcd_digital_driver);
diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index 5fea600bc3a4..3c5b66357661 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -529,7 +529,7 @@ static struct platform_driver rk817_codec_driver = {
 		   .name = "rk817-codec",
 		   },
 	.probe = rk817_platform_probe,
-	.remove_new = rk817_platform_remove,
+	.remove = rk817_platform_remove,
 };
 
 module_platform_driver(rk817_codec_driver);
diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index af296b77a723..45f32d281908 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2957,7 +2957,7 @@ MODULE_DEVICE_TABLE(of, wcd937x_of_match);
 
 static struct platform_driver wcd937x_codec_driver = {
 	.probe = wcd937x_probe,
-	.remove_new = wcd937x_remove,
+	.remove = wcd937x_remove,
 	.driver = {
 		.name = "wcd937x_codec",
 		.of_match_table = of_match_ptr(wcd937x_of_match),
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aa92f1bfc921..f2a4f3262bdb 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -3596,7 +3596,7 @@ MODULE_DEVICE_TABLE(of, wcd938x_dt_match);
 
 static struct platform_driver wcd938x_codec_driver = {
 	.probe = wcd938x_probe,
-	.remove_new = wcd938x_remove,
+	.remove = wcd938x_remove,
 	.driver = {
 		.name = "wcd938x_codec",
 		.of_match_table = of_match_ptr(wcd938x_dt_match),
diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 68fc591670dc..4a417a92514d 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -3683,7 +3683,7 @@ MODULE_DEVICE_TABLE(of, wcd939x_dt_match);
 
 static struct platform_driver wcd939x_codec_driver = {
 	.probe = wcd939x_probe,
-	.remove_new = wcd939x_remove,
+	.remove = wcd939x_remove,
 	.driver = {
 		.name = "wcd939x_codec",
 		.of_match_table = of_match_ptr(wcd939x_dt_match),
diff --git a/sound/soc/codecs/wm5102.c b/sound/soc/codecs/wm5102.c
index 4ecf07c7448c..651f1319204d 100644
--- a/sound/soc/codecs/wm5102.c
+++ b/sound/soc/codecs/wm5102.c
@@ -2174,7 +2174,7 @@ static struct platform_driver wm5102_codec_driver = {
 		.name = "wm5102-codec",
 	},
 	.probe = wm5102_probe,
-	.remove_new = wm5102_remove,
+	.remove = wm5102_remove,
 };
 
 module_platform_driver(wm5102_codec_driver);
diff --git a/sound/soc/codecs/wm5110.c b/sound/soc/codecs/wm5110.c
index 0f299cd07b2e..502196253d42 100644
--- a/sound/soc/codecs/wm5110.c
+++ b/sound/soc/codecs/wm5110.c
@@ -2534,7 +2534,7 @@ static struct platform_driver wm5110_codec_driver = {
 		.name = "wm5110-codec",
 	},
 	.probe = wm5110_probe,
-	.remove_new = wm5110_remove,
+	.remove = wm5110_remove,
 };
 
 module_platform_driver(wm5110_codec_driver);
diff --git a/sound/soc/codecs/wm8994.c b/sound/soc/codecs/wm8994.c
index a99908582a50..a4abe6e53bfc 100644
--- a/sound/soc/codecs/wm8994.c
+++ b/sound/soc/codecs/wm8994.c
@@ -4699,7 +4699,7 @@ static struct platform_driver wm8994_codec_driver = {
 		.pm = &wm8994_pm_ops,
 	},
 	.probe = wm8994_probe,
-	.remove_new = wm8994_remove,
+	.remove = wm8994_remove,
 };
 
 module_platform_driver(wm8994_codec_driver);
diff --git a/sound/soc/codecs/wm8997.c b/sound/soc/codecs/wm8997.c
index 87442840f0af..5389c363b14e 100644
--- a/sound/soc/codecs/wm8997.c
+++ b/sound/soc/codecs/wm8997.c
@@ -1210,7 +1210,7 @@ static struct platform_driver wm8997_codec_driver = {
 		.name = "wm8997-codec",
 	},
 	.probe = wm8997_probe,
-	.remove_new = wm8997_remove,
+	.remove = wm8997_remove,
 };
 
 module_platform_driver(wm8997_codec_driver);
diff --git a/sound/soc/codecs/wm8998.c b/sound/soc/codecs/wm8998.c
index 3c2c4d12c08e..b72b8a64be8f 100644
--- a/sound/soc/codecs/wm8998.c
+++ b/sound/soc/codecs/wm8998.c
@@ -1426,7 +1426,7 @@ static struct platform_driver wm8998_codec_driver = {
 		.name = "wm8998-codec",
 	},
 	.probe = wm8998_probe,
-	.remove_new = wm8998_remove,
+	.remove = wm8998_remove,
 };
 
 module_platform_driver(wm8998_codec_driver);
diff --git a/sound/soc/dwc/dwc-i2s.c b/sound/soc/dwc/dwc-i2s.c
index e6a5eebe5bc9..57b789d7fbed 100644
--- a/sound/soc/dwc/dwc-i2s.c
+++ b/sound/soc/dwc/dwc-i2s.c
@@ -1089,7 +1089,7 @@ static const struct dev_pm_ops dwc_pm_ops = {
 
 static struct platform_driver dw_i2s_driver = {
 	.probe		= dw_i2s_probe,
-	.remove_new	= dw_i2s_remove,
+	.remove		= dw_i2s_remove,
 	.driver		= {
 		.name	= "designware-i2s",
 		.of_match_table = of_match_ptr(dw_i2s_of_match),
diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
index b793263291dc..bd5c46d763c0 100644
--- a/sound/soc/fsl/fsl_asrc.c
+++ b/sound/soc/fsl/fsl_asrc.c
@@ -1392,7 +1392,7 @@ MODULE_DEVICE_TABLE(of, fsl_asrc_ids);
 
 static struct platform_driver fsl_asrc_driver = {
 	.probe = fsl_asrc_probe,
-	.remove_new = fsl_asrc_remove,
+	.remove = fsl_asrc_remove,
 	.driver = {
 		.name = "fsl-asrc",
 		.of_match_table = fsl_asrc_ids,
diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index a6cbaa6364c7..021d73e409aa 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -296,7 +296,7 @@ static const struct dev_pm_ops fsl_aud2htx_pm_ops = {
 
 static struct platform_driver fsl_aud2htx_driver = {
 	.probe = fsl_aud2htx_probe,
-	.remove_new = fsl_aud2htx_remove,
+	.remove = fsl_aud2htx_remove,
 	.driver = {
 		.name = "fsl-aud2htx",
 		.pm = pm_ptr(&fsl_aud2htx_pm_ops),
diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
index f3a24758aedb..3cd9a66b70a1 100644
--- a/sound/soc/fsl/fsl_audmix.c
+++ b/sound/soc/fsl/fsl_audmix.c
@@ -548,7 +548,7 @@ static const struct dev_pm_ops fsl_audmix_pm = {
 
 static struct platform_driver fsl_audmix_driver = {
 	.probe = fsl_audmix_probe,
-	.remove_new = fsl_audmix_remove,
+	.remove = fsl_audmix_remove,
 	.driver = {
 		.name = "fsl-audmix",
 		.of_match_table = fsl_audmix_ids,
diff --git a/sound/soc/fsl/fsl_dma.c b/sound/soc/fsl/fsl_dma.c
index c4bc9395dff7..aca066b5a43c 100644
--- a/sound/soc/fsl/fsl_dma.c
+++ b/sound/soc/fsl/fsl_dma.c
@@ -911,7 +911,7 @@ static struct platform_driver fsl_soc_dma_driver = {
 		.of_match_table = fsl_soc_dma_ids,
 	},
 	.probe = fsl_soc_dma_probe,
-	.remove_new = fsl_soc_dma_remove,
+	.remove = fsl_soc_dma_remove,
 };
 
 module_platform_driver(fsl_soc_dma_driver);
diff --git a/sound/soc/fsl/fsl_easrc.c b/sound/soc/fsl/fsl_easrc.c
index 962f30912091..82359edd6a8b 100644
--- a/sound/soc/fsl/fsl_easrc.c
+++ b/sound/soc/fsl/fsl_easrc.c
@@ -2093,7 +2093,7 @@ static const struct dev_pm_ops fsl_easrc_pm_ops = {
 
 static struct platform_driver fsl_easrc_driver = {
 	.probe = fsl_easrc_probe,
-	.remove_new = fsl_easrc_remove,
+	.remove = fsl_easrc_remove,
 	.driver = {
 		.name = "fsl-easrc",
 		.pm = pm_ptr(&fsl_easrc_pm_ops),
diff --git a/sound/soc/fsl/fsl_esai.c b/sound/soc/fsl/fsl_esai.c
index d0d8a01da9bd..a65f5b9935a2 100644
--- a/sound/soc/fsl/fsl_esai.c
+++ b/sound/soc/fsl/fsl_esai.c
@@ -1198,7 +1198,7 @@ static const struct dev_pm_ops fsl_esai_pm_ops = {
 
 static struct platform_driver fsl_esai_driver = {
 	.probe = fsl_esai_probe,
-	.remove_new = fsl_esai_remove,
+	.remove = fsl_esai_remove,
 	.driver = {
 		.name = "fsl-esai-dai",
 		.pm = &fsl_esai_pm_ops,
diff --git a/sound/soc/fsl/fsl_micfil.c b/sound/soc/fsl/fsl_micfil.c
index 22b240a70ad4..193be098fa5e 100644
--- a/sound/soc/fsl/fsl_micfil.c
+++ b/sound/soc/fsl/fsl_micfil.c
@@ -1317,7 +1317,7 @@ static const struct dev_pm_ops fsl_micfil_pm_ops = {
 
 static struct platform_driver fsl_micfil_driver = {
 	.probe = fsl_micfil_probe,
-	.remove_new = fsl_micfil_remove,
+	.remove = fsl_micfil_remove,
 	.driver = {
 		.name = "fsl-micfil-dai",
 		.pm = &fsl_micfil_pm_ops,
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index df160834c81b..145f9ca15e43 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -381,7 +381,7 @@ MODULE_DEVICE_TABLE(of, fsl_mqs_dt_ids);
 
 static struct platform_driver fsl_mqs_driver = {
 	.probe		= fsl_mqs_probe,
-	.remove_new	= fsl_mqs_remove,
+	.remove		= fsl_mqs_remove,
 	.driver		= {
 		.name	= "fsl-mqs",
 		.of_match_table = fsl_mqs_dt_ids,
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index be46fbfd487a..0a551be3053b 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -328,7 +328,7 @@ static const struct dev_pm_ops fsl_rpmsg_pm_ops = {
 
 static struct platform_driver fsl_rpmsg_driver = {
 	.probe  = fsl_rpmsg_probe,
-	.remove_new = fsl_rpmsg_remove,
+	.remove = fsl_rpmsg_remove,
 	.driver = {
 		.name = "fsl_rpmsg",
 		.pm = pm_ptr(&fsl_rpmsg_pm_ops),
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index d03b0172b8ad..ab58a4461073 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -1817,7 +1817,7 @@ static const struct dev_pm_ops fsl_sai_pm_ops = {
 
 static struct platform_driver fsl_sai_driver = {
 	.probe = fsl_sai_probe,
-	.remove_new = fsl_sai_remove,
+	.remove = fsl_sai_remove,
 	.driver = {
 		.name = "fsl-sai",
 		.pm = &fsl_sai_pm_ops,
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index eace399cb064..b6ff04f7138a 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -1763,7 +1763,7 @@ static struct platform_driver fsl_spdif_driver = {
 		.pm = pm_ptr(&fsl_spdif_pm),
 	},
 	.probe = fsl_spdif_probe,
-	.remove_new = fsl_spdif_remove,
+	.remove = fsl_spdif_remove,
 };
 
 module_platform_driver(fsl_spdif_driver);
diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
index c4c1d9c44056..320108bebf30 100644
--- a/sound/soc/fsl/fsl_ssi.c
+++ b/sound/soc/fsl/fsl_ssi.c
@@ -1734,7 +1734,7 @@ static struct platform_driver fsl_ssi_driver = {
 		.pm = pm_sleep_ptr(&fsl_ssi_pm),
 	},
 	.probe = fsl_ssi_probe,
-	.remove_new = fsl_ssi_remove,
+	.remove = fsl_ssi_remove,
 };
 
 module_platform_driver(fsl_ssi_driver);
diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
index c98e3db74fe7..beede7344efd 100644
--- a/sound/soc/fsl/fsl_xcvr.c
+++ b/sound/soc/fsl/fsl_xcvr.c
@@ -1540,7 +1540,7 @@ static struct platform_driver fsl_xcvr_driver = {
 		.pm = pm_ptr(&fsl_xcvr_pm_ops),
 		.of_match_table = fsl_xcvr_dt_ids,
 	},
-	.remove_new = fsl_xcvr_remove,
+	.remove = fsl_xcvr_remove,
 };
 module_platform_driver(fsl_xcvr_driver);
 
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index f97ae14dc452..43e14f2eca8d 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -354,7 +354,7 @@ static const struct dev_pm_ops imx_audmux_pm = {
 
 static struct platform_driver imx_audmux_driver = {
 	.probe		= imx_audmux_probe,
-	.remove_new	= imx_audmux_remove,
+	.remove		= imx_audmux_remove,
 	.driver	= {
 		.name	= DRIVER_NAME,
 		.pm = pm_sleep_ptr(&imx_audmux_pm),
diff --git a/sound/soc/fsl/imx-pcm-rpmsg.c b/sound/soc/fsl/imx-pcm-rpmsg.c
index 22156f99dcee..1daf0be3d100 100644
--- a/sound/soc/fsl/imx-pcm-rpmsg.c
+++ b/sound/soc/fsl/imx-pcm-rpmsg.c
@@ -822,7 +822,7 @@ MODULE_DEVICE_TABLE(platform, imx_rpmsg_pcm_id_table);
 
 static struct platform_driver imx_pcm_rpmsg_driver = {
 	.probe  = imx_rpmsg_pcm_probe,
-	.remove_new = imx_rpmsg_pcm_remove,
+	.remove = imx_rpmsg_pcm_remove,
 	.id_table = imx_rpmsg_pcm_id_table,
 	.driver = {
 		.name = IMX_PCM_DRV_NAME,
diff --git a/sound/soc/fsl/imx-sgtl5000.c b/sound/soc/fsl/imx-sgtl5000.c
index 3c1e69092d2f..8bcf54ef709e 100644
--- a/sound/soc/fsl/imx-sgtl5000.c
+++ b/sound/soc/fsl/imx-sgtl5000.c
@@ -214,7 +214,7 @@ static struct platform_driver imx_sgtl5000_driver = {
 		.of_match_table = imx_sgtl5000_dt_ids,
 	},
 	.probe = imx_sgtl5000_probe,
-	.remove_new = imx_sgtl5000_remove,
+	.remove = imx_sgtl5000_remove,
 };
 module_platform_driver(imx_sgtl5000_driver);
 
diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 0423cf43c7a0..8554fb690772 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -327,7 +327,7 @@ MODULE_DEVICE_TABLE(of, psc_ac97_match);
 
 static struct platform_driver psc_ac97_driver = {
 	.probe = psc_ac97_of_probe,
-	.remove_new = psc_ac97_of_remove,
+	.remove = psc_ac97_of_remove,
 	.driver = {
 		.name = "mpc5200-psc-ac97",
 		.of_match_table = psc_ac97_match,
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 931b430fa983..9ad44eeed6ad 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -225,7 +225,7 @@ MODULE_DEVICE_TABLE(of, psc_i2s_match);
 
 static struct platform_driver psc_i2s_driver = {
 	.probe = psc_i2s_of_probe,
-	.remove_new = psc_i2s_of_remove,
+	.remove = psc_i2s_of_remove,
 	.driver = {
 		.name = "mpc5200-psc-i2s",
 		.of_match_table = psc_i2s_match,
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index 6f5eecf6d88c..66db05970d82 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -408,7 +408,7 @@ static void p1022_ds_remove(struct platform_device *pdev)
 
 static struct platform_driver p1022_ds_driver = {
 	.probe = p1022_ds_probe,
-	.remove_new = p1022_ds_remove,
+	.remove = p1022_ds_remove,
 	.driver = {
 		/*
 		 * The name must match 'compatible' property in the device tree,
diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index a42149311c8b..d4568346714f 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -370,7 +370,7 @@ static void p1022_rdk_remove(struct platform_device *pdev)
 
 static struct platform_driver p1022_rdk_driver = {
 	.probe = p1022_rdk_probe,
-	.remove_new = p1022_rdk_remove,
+	.remove = p1022_rdk_remove,
 	.driver = {
 		/*
 		 * The name must match 'compatible' property in the device tree,
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index 2bab0fc1de59..5542c4ee6d12 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -124,7 +124,7 @@ MODULE_DEVICE_TABLE(of, pcm030_audio_match);
 
 static struct platform_driver pcm030_fabric_driver = {
 	.probe		= pcm030_fabric_probe,
-	.remove_new	= pcm030_fabric_remove,
+	.remove		= pcm030_fabric_remove,
 	.driver		= {
 		.name	= DRV_NAME,
 		.of_match_table    = pcm030_audio_match,
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index 03add80e75f3..4b384475b972 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -664,7 +664,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe = graph_probe,
-	.remove_new = simple_util_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/audio-graph-card2-custom-sample.c b/sound/soc/generic/audio-graph-card2-custom-sample.c
index 8e5a51098490..7151d426bee9 100644
--- a/sound/soc/generic/audio-graph-card2-custom-sample.c
+++ b/sound/soc/generic/audio-graph-card2-custom-sample.c
@@ -177,7 +177,7 @@ static struct platform_driver custom_card = {
 		.of_match_table = custom_of_match,
 	},
 	.probe	= custom_probe,
-	.remove_new = simple_util_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(custom_card);
 
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index bf4c1ab4ec58..4ad3d1b0714f 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -1438,7 +1438,7 @@ static struct platform_driver graph_card = {
 		.of_match_table = graph_of_match,
 	},
 	.probe	= graph_probe,
-	.remove_new = simple_util_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(graph_card);
 
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index 42c60b92cca5..76a1d05e2ebe 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -838,7 +838,7 @@ static struct platform_driver simple_card = {
 		.of_match_table = simple_of_match,
 	},
 	.probe = simple_probe,
-	.remove_new = simple_util_remove,
+	.remove = simple_util_remove,
 };
 
 module_platform_driver(simple_card);
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index df2487b700cc..407288055741 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -637,7 +637,7 @@ static struct platform_driver test_driver = {
 		.of_match_table = test_of_match,
 	},
 	.probe  = test_driver_probe,
-	.remove_new = test_driver_remove,
+	.remove = test_driver_remove,
 };
 module_platform_driver(test_driver);
 
diff --git a/sound/soc/img/img-i2s-in.c b/sound/soc/img/img-i2s-in.c
index b69a364d619e..6a988976fb0d 100644
--- a/sound/soc/img/img-i2s-in.c
+++ b/sound/soc/img/img-i2s-in.c
@@ -607,7 +607,7 @@ static struct platform_driver img_i2s_in_driver = {
 		.pm = &img_i2s_in_pm_ops
 	},
 	.probe = img_i2s_in_probe,
-	.remove_new = img_i2s_in_dev_remove
+	.remove = img_i2s_in_dev_remove
 };
 module_platform_driver(img_i2s_in_driver);
 
diff --git a/sound/soc/img/img-i2s-out.c b/sound/soc/img/img-i2s-out.c
index 6f9831c6d6e0..1211e6184d97 100644
--- a/sound/soc/img/img-i2s-out.c
+++ b/sound/soc/img/img-i2s-out.c
@@ -607,7 +607,7 @@ static struct platform_driver img_i2s_out_driver = {
 		.pm = &img_i2s_out_pm_ops
 	},
 	.probe = img_i2s_out_probe,
-	.remove_new = img_i2s_out_dev_remove
+	.remove = img_i2s_out_dev_remove
 };
 module_platform_driver(img_i2s_out_driver);
 
diff --git a/sound/soc/img/img-parallel-out.c b/sound/soc/img/img-parallel-out.c
index 815e68a7048c..4ec63119d67c 100644
--- a/sound/soc/img/img-parallel-out.c
+++ b/sound/soc/img/img-parallel-out.c
@@ -311,7 +311,7 @@ static struct platform_driver img_prl_out_driver = {
 		.pm = &img_prl_out_pm_ops
 	},
 	.probe = img_prl_out_probe,
-	.remove_new = img_prl_out_dev_remove
+	.remove = img_prl_out_dev_remove
 };
 module_platform_driver(img_prl_out_driver);
 
diff --git a/sound/soc/img/img-spdif-in.c b/sound/soc/img/img-spdif-in.c
index 9646e9d3f0bc..3c513f5b8c54 100644
--- a/sound/soc/img/img-spdif-in.c
+++ b/sound/soc/img/img-spdif-in.c
@@ -878,7 +878,7 @@ static struct platform_driver img_spdif_in_driver = {
 		.pm = &img_spdif_in_pm_ops
 	},
 	.probe = img_spdif_in_probe,
-	.remove_new = img_spdif_in_dev_remove
+	.remove = img_spdif_in_dev_remove
 };
 module_platform_driver(img_spdif_in_driver);
 
diff --git a/sound/soc/img/img-spdif-out.c b/sound/soc/img/img-spdif-out.c
index dfa72afa946e..402695b5fc41 100644
--- a/sound/soc/img/img-spdif-out.c
+++ b/sound/soc/img/img-spdif-out.c
@@ -468,7 +468,7 @@ static struct platform_driver img_spdif_out_driver = {
 		.pm = &img_spdif_out_pm_ops
 	},
 	.probe = img_spdif_out_probe,
-	.remove_new = img_spdif_out_dev_remove
+	.remove = img_spdif_out_dev_remove
 };
 module_platform_driver(img_spdif_out_driver);
 
diff --git a/sound/soc/img/pistachio-internal-dac.c b/sound/soc/img/pistachio-internal-dac.c
index da6251680e41..fdeceb271e7f 100644
--- a/sound/soc/img/pistachio-internal-dac.c
+++ b/sound/soc/img/pistachio-internal-dac.c
@@ -271,7 +271,7 @@ static struct platform_driver pistachio_internal_dac_plat_driver = {
 		.pm = &pistachio_internal_dac_pm_ops
 	},
 	.probe = pistachio_internal_dac_probe,
-	.remove_new = pistachio_internal_dac_remove
+	.remove = pistachio_internal_dac_remove
 };
 module_platform_driver(pistachio_internal_dac_plat_driver);
 
diff --git a/sound/soc/intel/atom/sst-mfld-platform-pcm.c b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
index 8652b4a20020..373d68b4cf88 100644
--- a/sound/soc/intel/atom/sst-mfld-platform-pcm.c
+++ b/sound/soc/intel/atom/sst-mfld-platform-pcm.c
@@ -812,7 +812,7 @@ static struct platform_driver sst_platform_driver = {
 		.pm             = &sst_platform_pm,
 	},
 	.probe		= sst_platform_probe,
-	.remove_new	= sst_platform_remove,
+	.remove		= sst_platform_remove,
 };
 
 module_platform_driver(sst_platform_driver);
diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index 29d44c989e5f..9956dc63db74 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -358,7 +358,7 @@ static struct platform_driver sst_acpi_driver = {
 		.pm			= &intel_sst_pm,
 	},
 	.probe	= sst_acpi_probe,
-	.remove_new = sst_acpi_remove,
+	.remove = sst_acpi_remove,
 };
 
 module_platform_driver(sst_acpi_driver);
diff --git a/sound/soc/intel/boards/bytcht_es8316.c b/sound/soc/intel/boards/bytcht_es8316.c
index 3539c9ff0fd2..d3327bc237b5 100644
--- a/sound/soc/intel/boards/bytcht_es8316.c
+++ b/sound/soc/intel/boards/bytcht_es8316.c
@@ -709,7 +709,7 @@ static struct platform_driver snd_byt_cht_es8316_mc_driver = {
 		.name = "bytcht_es8316",
 	},
 	.probe = snd_byt_cht_es8316_mc_probe,
-	.remove_new = snd_byt_cht_es8316_mc_remove,
+	.remove = snd_byt_cht_es8316_mc_remove,
 };
 
 module_platform_driver(snd_byt_cht_es8316_mc_driver);
diff --git a/sound/soc/intel/boards/bytcr_rt5640.c b/sound/soc/intel/boards/bytcr_rt5640.c
index 4479825c08b5..2ed49acb4e36 100644
--- a/sound/soc/intel/boards/bytcr_rt5640.c
+++ b/sound/soc/intel/boards/bytcr_rt5640.c
@@ -1918,7 +1918,7 @@ static struct platform_driver snd_byt_rt5640_mc_driver = {
 		.name = "bytcr_rt5640",
 	},
 	.probe = snd_byt_rt5640_mc_probe,
-	.remove_new = snd_byt_rt5640_mc_remove,
+	.remove = snd_byt_rt5640_mc_remove,
 };
 
 module_platform_driver(snd_byt_rt5640_mc_driver);
diff --git a/sound/soc/intel/boards/bytcr_rt5651.c b/sound/soc/intel/boards/bytcr_rt5651.c
index 1f54da98aacf..8e4b821efe92 100644
--- a/sound/soc/intel/boards/bytcr_rt5651.c
+++ b/sound/soc/intel/boards/bytcr_rt5651.c
@@ -1142,7 +1142,7 @@ static struct platform_driver snd_byt_rt5651_mc_driver = {
 		.name = "bytcr_rt5651",
 	},
 	.probe = snd_byt_rt5651_mc_probe,
-	.remove_new = snd_byt_rt5651_mc_remove,
+	.remove = snd_byt_rt5651_mc_remove,
 };
 
 module_platform_driver(snd_byt_rt5651_mc_driver);
diff --git a/sound/soc/intel/boards/bytcr_wm5102.c b/sound/soc/intel/boards/bytcr_wm5102.c
index e5a7cc606aa9..0b10d89cb189 100644
--- a/sound/soc/intel/boards/bytcr_wm5102.c
+++ b/sound/soc/intel/boards/bytcr_wm5102.c
@@ -663,7 +663,7 @@ static struct platform_driver snd_byt_wm5102_mc_driver = {
 		.name = "bytcr_wm5102",
 	},
 	.probe = snd_byt_wm5102_mc_probe,
-	.remove_new = snd_byt_wm5102_mc_remove,
+	.remove = snd_byt_wm5102_mc_remove,
 };
 
 module_platform_driver(snd_byt_wm5102_mc_driver);
diff --git a/sound/soc/intel/boards/cht_bsw_max98090_ti.c b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
index f43bc20d6aae..d7c114858833 100644
--- a/sound/soc/intel/boards/cht_bsw_max98090_ti.c
+++ b/sound/soc/intel/boards/cht_bsw_max98090_ti.c
@@ -637,7 +637,7 @@ static struct platform_driver snd_cht_mc_driver = {
 		.name = "cht-bsw-max98090",
 	},
 	.probe = snd_cht_mc_probe,
-	.remove_new = snd_cht_mc_remove,
+	.remove = snd_cht_mc_remove,
 };
 
 module_platform_driver(snd_cht_mc_driver)
diff --git a/sound/soc/intel/boards/sof_es8336.c b/sound/soc/intel/boards/sof_es8336.c
index 578271b4230a..fc998fe4b196 100644
--- a/sound/soc/intel/boards/sof_es8336.c
+++ b/sound/soc/intel/boards/sof_es8336.c
@@ -838,7 +838,7 @@ static struct platform_driver sof_es8336_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = sof_es8336_probe,
-	.remove_new = sof_es8336_remove,
+	.remove = sof_es8336_remove,
 	.id_table = board_ids,
 };
 module_platform_driver(sof_es8336_driver);
diff --git a/sound/soc/intel/boards/sof_pcm512x.c b/sound/soc/intel/boards/sof_pcm512x.c
index b01cb2329542..5de883b9563e 100644
--- a/sound/soc/intel/boards/sof_pcm512x.c
+++ b/sound/soc/intel/boards/sof_pcm512x.c
@@ -430,7 +430,7 @@ static void sof_pcm512x_remove(struct platform_device *pdev)
 
 static struct platform_driver sof_audio = {
 	.probe = sof_audio_probe,
-	.remove_new = sof_pcm512x_remove,
+	.remove = sof_pcm512x_remove,
 	.driver = {
 		.name = "sof_pcm512x",
 		.pm = &snd_soc_pm_ops,
diff --git a/sound/soc/intel/boards/sof_sdw.c b/sound/soc/intel/boards/sof_sdw.c
index 855109d22131..f10ed95770ea 100644
--- a/sound/soc/intel/boards/sof_sdw.c
+++ b/sound/soc/intel/boards/sof_sdw.c
@@ -1368,7 +1368,7 @@ static struct platform_driver sof_sdw_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = mc_probe,
-	.remove_new = mc_remove,
+	.remove = mc_remove,
 	.id_table = mc_id_table,
 };
 
diff --git a/sound/soc/intel/boards/sof_wm8804.c b/sound/soc/intel/boards/sof_wm8804.c
index 0a5ce34d7f7b..facc6c32cbfe 100644
--- a/sound/soc/intel/boards/sof_wm8804.c
+++ b/sound/soc/intel/boards/sof_wm8804.c
@@ -294,7 +294,7 @@ static struct platform_driver sof_wm8804_driver = {
 		.pm = &snd_soc_pm_ops,
 	},
 	.probe = sof_wm8804_probe,
-	.remove_new = sof_wm8804_remove,
+	.remove = sof_wm8804_remove,
 };
 module_platform_driver(sof_wm8804_driver);
 
diff --git a/sound/soc/intel/catpt/device.c b/sound/soc/intel/catpt/device.c
index 2e1fa79a04d4..2aa637124bec 100644
--- a/sound/soc/intel/catpt/device.c
+++ b/sound/soc/intel/catpt/device.c
@@ -374,7 +374,7 @@ MODULE_DEVICE_TABLE(acpi, catpt_ids);
 
 static struct platform_driver catpt_acpi_driver = {
 	.probe = catpt_acpi_probe,
-	.remove_new = catpt_acpi_remove,
+	.remove = catpt_acpi_remove,
 	.driver = {
 		.name = "intel_catpt",
 		.acpi_match_table = catpt_ids,
diff --git a/sound/soc/kirkwood/kirkwood-i2s.c b/sound/soc/kirkwood/kirkwood-i2s.c
index d1eb90310afa..99bd066c7309 100644
--- a/sound/soc/kirkwood/kirkwood-i2s.c
+++ b/sound/soc/kirkwood/kirkwood-i2s.c
@@ -759,7 +759,7 @@ MODULE_DEVICE_TABLE(of, mvebu_audio_of_match);
 
 static struct platform_driver kirkwood_i2s_driver = {
 	.probe  = kirkwood_i2s_dev_probe,
-	.remove_new = kirkwood_i2s_dev_remove,
+	.remove = kirkwood_i2s_dev_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(mvebu_audio_of_match),
diff --git a/sound/soc/mediatek/common/mtk-btcvsd.c b/sound/soc/mediatek/common/mtk-btcvsd.c
index c12d170fa1de..d07f288f9752 100644
--- a/sound/soc/mediatek/common/mtk-btcvsd.c
+++ b/sound/soc/mediatek/common/mtk-btcvsd.c
@@ -1400,7 +1400,7 @@ static struct platform_driver mtk_btcvsd_snd_driver = {
 		.of_match_table = mtk_btcvsd_snd_dt_match,
 	},
 	.probe = mtk_btcvsd_snd_probe,
-	.remove_new = mtk_btcvsd_snd_remove,
+	.remove = mtk_btcvsd_snd_remove,
 };
 
 module_platform_driver(mtk_btcvsd_snd_driver);
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 6a17deb874df..5f11bc5438bd 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -1473,7 +1473,7 @@ static struct platform_driver mt2701_afe_pcm_driver = {
 		   .pm = &mt2701_afe_pm_ops,
 	},
 	.probe = mt2701_afe_pcm_dev_probe,
-	.remove_new = mt2701_afe_pcm_dev_remove,
+	.remove = mt2701_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt2701_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
index c1dee119e93a..9159b42adf6a 100644
--- a/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
+++ b/sound/soc/mediatek/mt6797/mt6797-afe-pcm.c
@@ -890,7 +890,7 @@ static struct platform_driver mt6797_afe_pcm_driver = {
 		   .pm = &mt6797_afe_pm_ops,
 	},
 	.probe = mt6797_afe_pcm_dev_probe,
-	.remove_new = mt6797_afe_pcm_dev_remove,
+	.remove = mt6797_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt6797_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
index 572ded279b53..d400bea0ef9c 100644
--- a/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
+++ b/sound/soc/mediatek/mt7986/mt7986-afe-pcm.c
@@ -601,7 +601,7 @@ static struct platform_driver mt7986_afe_pcm_driver = {
 		   .pm = &mt7986_afe_pm_ops,
 	},
 	.probe = mt7986_afe_pcm_dev_probe,
-	.remove_new = mt7986_afe_pcm_dev_remove,
+	.remove = mt7986_afe_pcm_dev_remove,
 };
 module_platform_driver(mt7986_afe_pcm_driver);
 
diff --git a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
index b6291b7c811e..03250273ea9c 100644
--- a/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
+++ b/sound/soc/mediatek/mt8173/mt8173-afe-pcm.c
@@ -1223,7 +1223,7 @@ static struct platform_driver mt8173_afe_pcm_driver = {
 		   .pm = &mt8173_afe_pm_ops,
 	},
 	.probe = mt8173_afe_pcm_dev_probe,
-	.remove_new = mt8173_afe_pcm_dev_remove,
+	.remove = mt8173_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8173_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
index 25348fdf75fa..3f377ba4ad53 100644
--- a/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
+++ b/sound/soc/mediatek/mt8183/mt8183-afe-pcm.c
@@ -1268,7 +1268,7 @@ static struct platform_driver mt8183_afe_pcm_driver = {
 		   .pm = &mt8183_afe_pm_ops,
 	},
 	.probe = mt8183_afe_pcm_dev_probe,
-	.remove_new = mt8183_afe_pcm_dev_remove,
+	.remove = mt8183_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8183_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
index 424c5c68f78a..9b502f4cd6ea 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-pcm.c
@@ -2325,7 +2325,7 @@ static struct platform_driver mt8192_afe_pcm_driver = {
 		   .pm = &mt8192_afe_pm_ops,
 	},
 	.probe = mt8192_afe_pcm_dev_probe,
-	.remove_new = mt8192_afe_pcm_dev_remove,
+	.remove = mt8192_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8192_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
index 38891d1bd18a..8016bfb35015 100644
--- a/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
+++ b/sound/soc/mediatek/mt8195/mt8195-afe-pcm.c
@@ -3199,7 +3199,7 @@ static struct platform_driver mt8195_afe_pcm_driver = {
 		   .pm = &mt8195_afe_pm_ops,
 	},
 	.probe = mt8195_afe_pcm_dev_probe,
-	.remove_new = mt8195_afe_pcm_dev_remove,
+	.remove = mt8195_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8195_afe_pcm_driver);
diff --git a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
index df6dd8c5bbe5..49efcdea975e 100644
--- a/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
+++ b/sound/soc/mediatek/mt8365/mt8365-afe-pcm.c
@@ -2264,7 +2264,7 @@ static struct platform_driver mt8365_afe_pcm_driver = {
 		   .pm = &mt8365_afe_pm_ops,
 	},
 	.probe = mt8365_afe_pcm_dev_probe,
-	.remove_new = mt8365_afe_pcm_dev_remove,
+	.remove = mt8365_afe_pcm_dev_remove,
 };
 
 module_platform_driver(mt8365_afe_pcm_driver);
diff --git a/sound/soc/meson/aiu.c b/sound/soc/meson/aiu.c
index 5d1419ed7a62..f2890111c1d2 100644
--- a/sound/soc/meson/aiu.c
+++ b/sound/soc/meson/aiu.c
@@ -345,7 +345,7 @@ MODULE_DEVICE_TABLE(of, aiu_of_match);
 
 static struct platform_driver aiu_pdrv = {
 	.probe = aiu_probe,
-	.remove_new = aiu_remove,
+	.remove = aiu_remove,
 	.driver = {
 		.name = "meson-aiu",
 		.of_match_table = aiu_of_match,
diff --git a/sound/soc/meson/axg-card.c b/sound/soc/meson/axg-card.c
index 646ab87afac2..59deb332bd35 100644
--- a/sound/soc/meson/axg-card.c
+++ b/sound/soc/meson/axg-card.c
@@ -360,7 +360,7 @@ MODULE_DEVICE_TABLE(of, axg_card_of_match);
 
 static struct platform_driver axg_card_pdrv = {
 	.probe = meson_card_probe,
-	.remove_new = meson_card_remove,
+	.remove = meson_card_remove,
 	.driver = {
 		.name = "axg-sound-card",
 		.of_match_table = axg_card_of_match,
diff --git a/sound/soc/meson/gx-card.c b/sound/soc/meson/gx-card.c
index 7edca3e49c8f..455f6bfc9f8f 100644
--- a/sound/soc/meson/gx-card.c
+++ b/sound/soc/meson/gx-card.c
@@ -129,7 +129,7 @@ MODULE_DEVICE_TABLE(of, gx_card_of_match);
 
 static struct platform_driver gx_card_pdrv = {
 	.probe = meson_card_probe,
-	.remove_new = meson_card_remove,
+	.remove = meson_card_remove,
 	.driver = {
 		.name = "gx-sound-card",
 		.of_match_table = gx_card_of_match,
diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 310e3ac77424..a41a13ae38a5 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -185,7 +185,7 @@ static struct platform_driver mxs_sgtl5000_audio_driver = {
 		.of_match_table = mxs_sgtl5000_dt_ids,
 	},
 	.probe = mxs_sgtl5000_probe,
-	.remove_new = mxs_sgtl5000_remove,
+	.remove = mxs_sgtl5000_remove,
 };
 
 module_platform_driver(mxs_sgtl5000_audio_driver);
diff --git a/sound/soc/pxa/mmp-sspa.c b/sound/soc/pxa/mmp-sspa.c
index abfaf3cdf5bb..73f36c9dd35c 100644
--- a/sound/soc/pxa/mmp-sspa.c
+++ b/sound/soc/pxa/mmp-sspa.c
@@ -574,7 +574,7 @@ static struct platform_driver asoc_mmp_sspa_driver = {
 		.of_match_table = of_match_ptr(mmp_sspa_of_match),
 	},
 	.probe = asoc_mmp_sspa_probe,
-	.remove_new = asoc_mmp_sspa_remove,
+	.remove = asoc_mmp_sspa_remove,
 };
 
 module_platform_driver(asoc_mmp_sspa_driver);
diff --git a/sound/soc/pxa/pxa2xx-ac97.c b/sound/soc/pxa/pxa2xx-ac97.c
index 80e0ea0ec9fb..78f50032afc5 100644
--- a/sound/soc/pxa/pxa2xx-ac97.c
+++ b/sound/soc/pxa/pxa2xx-ac97.c
@@ -286,7 +286,7 @@ static DEFINE_SIMPLE_DEV_PM_OPS(pxa2xx_ac97_pm_ops,
 
 static struct platform_driver pxa2xx_ac97_driver = {
 	.probe		= pxa2xx_ac97_dev_probe,
-	.remove_new	= pxa2xx_ac97_dev_remove,
+	.remove		= pxa2xx_ac97_dev_remove,
 	.driver		= {
 		.name	= "pxa2xx-ac97",
 		.pm	= &pxa2xx_ac97_pm_ops,
diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index 9005c85f8c54..b8f23414eb77 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -300,7 +300,7 @@ static struct platform_driver apq8016_lpass_cpu_platform_driver = {
 		.of_match_table	= of_match_ptr(apq8016_lpass_cpu_device_id),
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
-	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
 };
 module_platform_driver(apq8016_lpass_cpu_platform_driver);
 
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 5c874139f39d..e57d29ea4ce7 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -172,7 +172,7 @@ static struct platform_driver ipq806x_lpass_cpu_platform_driver = {
 		.of_match_table	= of_match_ptr(ipq806x_lpass_cpu_device_id),
 	},
 	.probe	= asoc_qcom_lpass_cpu_platform_probe,
-	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
 };
 module_platform_driver(ipq806x_lpass_cpu_platform_driver);
 
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index e6bcdf6ed796..fbead6af3d95 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -315,7 +315,7 @@ static struct platform_driver sc7180_lpass_cpu_platform_driver = {
 		.pm = &sc7180_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
-	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
 	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
 };
 
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 47c622327a8d..7cd3e291382a 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -445,7 +445,7 @@ static struct platform_driver sc7280_lpass_cpu_platform_driver = {
 		.pm = &sc7280_lpass_pm_ops,
 	},
 	.probe = asoc_qcom_lpass_cpu_platform_probe,
-	.remove_new = asoc_qcom_lpass_cpu_platform_remove,
+	.remove = asoc_qcom_lpass_cpu_platform_remove,
 	.shutdown = asoc_qcom_lpass_cpu_platform_shutdown,
 };
 
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index 81fde0681f95..90228699ba7d 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -1161,7 +1161,7 @@ static struct platform_driver q6pcm_routing_platform_driver = {
 		.of_match_table = of_match_ptr(q6pcm_routing_device_id),
 	},
 	.probe = q6pcm_routing_probe,
-	.remove_new = q6pcm_routing_remove,
+	.remove = q6pcm_routing_remove,
 };
 module_platform_driver(q6pcm_routing_platform_driver);
 
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index b378f870b3ad..4315da4a47c1 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -866,7 +866,7 @@ static const struct dev_pm_ops rockchip_i2s_pm_ops = {
 
 static struct platform_driver rockchip_i2s_driver = {
 	.probe = rockchip_i2s_probe,
-	.remove_new = rockchip_i2s_remove,
+	.remove = rockchip_i2s_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = of_match_ptr(rockchip_i2s_match),
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index ee517d7b5b7b..d1f28699652f 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -1423,7 +1423,7 @@ static const struct dev_pm_ops rockchip_i2s_tdm_pm_ops = {
 
 static struct platform_driver rockchip_i2s_tdm_driver = {
 	.probe = rockchip_i2s_tdm_probe,
-	.remove_new = rockchip_i2s_tdm_remove,
+	.remove = rockchip_i2s_tdm_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = rockchip_i2s_tdm_match,
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index d16a4a67a6a2..cae91108f7a8 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -703,7 +703,7 @@ static const struct dev_pm_ops rockchip_pdm_pm_ops = {
 
 static struct platform_driver rockchip_pdm_driver = {
 	.probe  = rockchip_pdm_probe,
-	.remove_new = rockchip_pdm_remove,
+	.remove = rockchip_pdm_remove,
 	.driver = {
 		.name = "rockchip-pdm",
 		.of_match_table = of_match_ptr(rockchip_pdm_match),
diff --git a/sound/soc/rockchip/rockchip_rt5645.c b/sound/soc/rockchip/rockchip_rt5645.c
index 449f62820045..b085d80ea2e4 100644
--- a/sound/soc/rockchip/rockchip_rt5645.c
+++ b/sound/soc/rockchip/rockchip_rt5645.c
@@ -233,7 +233,7 @@ MODULE_DEVICE_TABLE(of, rockchip_rt5645_of_match);
 
 static struct platform_driver snd_rk_mc_driver = {
 	.probe = snd_rk_mc_probe,
-	.remove_new = snd_rk_mc_remove,
+	.remove = snd_rk_mc_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.pm = &snd_soc_pm_ops,
diff --git a/sound/soc/rockchip/rockchip_spdif.c b/sound/soc/rockchip/rockchip_spdif.c
index eb9d5dee196e..d87c0e4f6f91 100644
--- a/sound/soc/rockchip/rockchip_spdif.c
+++ b/sound/soc/rockchip/rockchip_spdif.c
@@ -380,7 +380,7 @@ static const struct dev_pm_ops rk_spdif_pm_ops = {
 
 static struct platform_driver rk_spdif_driver = {
 	.probe = rk_spdif_probe,
-	.remove_new = rk_spdif_remove,
+	.remove = rk_spdif_remove,
 	.driver = {
 		.name = "rockchip-spdif",
 		.of_match_table = of_match_ptr(rk_spdif_match),
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index f02873b6ce7f..9619f550608c 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -207,7 +207,7 @@ static struct platform_driver arndale_audio_driver = {
 		.of_match_table = arndale_audio_of_match,
 	},
 	.probe = arndale_audio_probe,
-	.remove_new = arndale_audio_remove,
+	.remove = arndale_audio_remove,
 };
 
 module_platform_driver(arndale_audio_driver);
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 1bcabb114e29..8f6deb06e234 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -1741,7 +1741,7 @@ static const struct dev_pm_ops samsung_i2s_pm = {
 
 static struct platform_driver samsung_i2s_driver = {
 	.probe  = samsung_i2s_probe,
-	.remove_new = samsung_i2s_remove,
+	.remove = samsung_i2s_remove,
 	.id_table = samsung_i2s_driver_ids,
 	.driver = {
 		.name = "samsung-i2s",
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index 110ae14dd7ea..ed865cc07e2e 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -341,7 +341,7 @@ static struct platform_driver odroid_audio_driver = {
 		.pm		= &snd_soc_pm_ops,
 	},
 	.probe	= odroid_audio_probe,
-	.remove_new = odroid_audio_remove,
+	.remove = odroid_audio_remove,
 };
 module_platform_driver(odroid_audio_driver);
 
diff --git a/sound/soc/samsung/pcm.c b/sound/soc/samsung/pcm.c
index 573b2dee7f07..a03ba9374c2e 100644
--- a/sound/soc/samsung/pcm.c
+++ b/sound/soc/samsung/pcm.c
@@ -590,7 +590,7 @@ static void s3c_pcm_dev_remove(struct platform_device *pdev)
 
 static struct platform_driver s3c_pcm_driver = {
 	.probe  = s3c_pcm_dev_probe,
-	.remove_new = s3c_pcm_dev_remove,
+	.remove = s3c_pcm_dev_remove,
 	.driver = {
 		.name = "samsung-pcm",
 	},
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index aad0f9b4d4fc..4bbe7bcdb845 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -245,7 +245,7 @@ static struct platform_driver snow_driver = {
 		.of_match_table = snow_of_match,
 	},
 	.probe = snow_probe,
-	.remove_new = snow_remove,
+	.remove = snow_remove,
 };
 
 module_platform_driver(snow_driver);
diff --git a/sound/soc/samsung/spdif.c b/sound/soc/samsung/spdif.c
index f44e3180e8d3..235d0063d1b3 100644
--- a/sound/soc/samsung/spdif.c
+++ b/sound/soc/samsung/spdif.c
@@ -476,7 +476,7 @@ static void spdif_remove(struct platform_device *pdev)
 
 static struct platform_driver samsung_spdif_driver = {
 	.probe	= spdif_probe,
-	.remove_new = spdif_remove,
+	.remove = spdif_remove,
 	.driver	= {
 		.name	= "samsung-spdif",
 	},
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index 087e379aa3bc..221ce91f1950 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -2107,7 +2107,7 @@ static struct platform_driver fsi_driver = {
 		.of_match_table = fsi_of_match,
 	},
 	.probe		= fsi_probe,
-	.remove_new	= fsi_remove,
+	.remove		= fsi_remove,
 	.id_table	= fsi_id_table,
 };
 
diff --git a/sound/soc/sh/hac.c b/sound/soc/sh/hac.c
index cc200f45826c..db618c09d1e0 100644
--- a/sound/soc/sh/hac.c
+++ b/sound/soc/sh/hac.c
@@ -334,7 +334,7 @@ static struct platform_driver hac_pcm_driver = {
 	},
 
 	.probe = hac_soc_platform_probe,
-	.remove_new = hac_soc_platform_remove,
+	.remove = hac_soc_platform_remove,
 };
 
 module_platform_driver(hac_pcm_driver);
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index 15cb5e7008f9..9784718a2b6f 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -2087,7 +2087,7 @@ static struct platform_driver rsnd_driver = {
 		.of_match_table = rsnd_of_match,
 	},
 	.probe		= rsnd_probe,
-	.remove_new	= rsnd_remove,
+	.remove		= rsnd_remove,
 };
 module_platform_driver(rsnd_driver);
 
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index d0bf0487bf1b..040ce0431fd2 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -1204,7 +1204,7 @@ static struct platform_driver rz_ssi_driver = {
 		.of_match_table = rz_ssi_of_match,
 	},
 	.probe		= rz_ssi_probe,
-	.remove_new	= rz_ssi_remove,
+	.remove		= rz_ssi_remove,
 };
 
 module_platform_driver(rz_ssi_driver);
diff --git a/sound/soc/sh/siu_dai.c b/sound/soc/sh/siu_dai.c
index d0b5c543fd2f..7e771a164a80 100644
--- a/sound/soc/sh/siu_dai.c
+++ b/sound/soc/sh/siu_dai.c
@@ -788,7 +788,7 @@ static struct platform_driver siu_driver = {
 		.name	= "siu-pcm-audio",
 	},
 	.probe		= siu_probe,
-	.remove_new	= siu_remove,
+	.remove		= siu_remove,
 };
 
 module_platform_driver(siu_driver);
diff --git a/sound/soc/sof/imx/imx8.c b/sound/soc/sof/imx/imx8.c
index 9f24e3c283dd..f09ee0dea2cc 100644
--- a/sound/soc/sof/imx/imx8.c
+++ b/sound/soc/sof/imx/imx8.c
@@ -658,7 +658,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8_driver = {
 	.probe = sof_of_probe,
-	.remove_new = sof_of_remove,
+	.remove = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/imx/imx8m.c b/sound/soc/sof/imx/imx8m.c
index cdd1e79ef9f6..01d3ad3314f3 100644
--- a/sound/soc/sof/imx/imx8m.c
+++ b/sound/soc/sof/imx/imx8m.c
@@ -505,7 +505,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8m_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8m_driver = {
 	.probe = sof_of_probe,
-	.remove_new = sof_of_remove,
+	.remove = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8m",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/imx/imx8ulp.c b/sound/soc/sof/imx/imx8ulp.c
index 2585b1beef23..e5eee1c9f6da 100644
--- a/sound/soc/sof/imx/imx8ulp.c
+++ b/sound/soc/sof/imx/imx8ulp.c
@@ -507,7 +507,7 @@ MODULE_DEVICE_TABLE(of, sof_of_imx8ulp_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_imx8ulp_driver = {
 	.probe = sof_of_probe,
-	.remove_new = sof_of_remove,
+	.remove = sof_of_remove,
 	.driver = {
 		.name = "sof-audio-of-imx8ulp",
 		.pm = &sof_of_pm,
diff --git a/sound/soc/sof/intel/bdw.c b/sound/soc/sof/intel/bdw.c
index 7f18080e4e19..322ff118f0f6 100644
--- a/sound/soc/sof/intel/bdw.c
+++ b/sound/soc/sof/intel/bdw.c
@@ -684,7 +684,7 @@ static int sof_broadwell_probe(struct platform_device *pdev)
 /* acpi_driver definition */
 static struct platform_driver snd_sof_acpi_intel_bdw_driver = {
 	.probe = sof_broadwell_probe,
-	.remove_new = sof_acpi_remove,
+	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-bdw",
 		.pm = &sof_acpi_pm,
diff --git a/sound/soc/sof/intel/byt.c b/sound/soc/sof/intel/byt.c
index 7a57e162fb1c..f531710cf94e 100644
--- a/sound/soc/sof/intel/byt.c
+++ b/sound/soc/sof/intel/byt.c
@@ -465,7 +465,7 @@ static int sof_baytrail_probe(struct platform_device *pdev)
 /* acpi_driver definition */
 static struct platform_driver snd_sof_acpi_intel_byt_driver = {
 	.probe = sof_baytrail_probe,
-	.remove_new = sof_acpi_remove,
+	.remove = sof_acpi_remove,
 	.driver = {
 		.name = "sof-audio-acpi-intel-byt",
 		.pm = &sof_acpi_pm,
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186.c b/sound/soc/sof/mediatek/mt8186/mt8186.c
index 74522400207e..9466f7d2e535 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186.c
@@ -656,7 +656,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8186_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_mt8186_driver = {
 	.probe = sof_of_probe,
-	.remove_new = sof_of_remove,
+	.remove = sof_of_remove,
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8186",
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195.c b/sound/soc/sof/mediatek/mt8195/mt8195.c
index 82d221f53a46..5b4423ed8023 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195.c
@@ -612,7 +612,7 @@ MODULE_DEVICE_TABLE(of, sof_of_mt8195_ids);
 /* DT driver definition */
 static struct platform_driver snd_sof_of_mt8195_driver = {
 	.probe = sof_of_probe,
-	.remove_new = sof_of_remove,
+	.remove = sof_of_remove,
 	.shutdown = sof_of_shutdown,
 	.driver = {
 	.name = "sof-audio-of-mt8195",
diff --git a/sound/soc/sprd/sprd-mcdt.c b/sound/soc/sprd/sprd-mcdt.c
index 688419c6b092..814a1cde1d35 100644
--- a/sound/soc/sprd/sprd-mcdt.c
+++ b/sound/soc/sprd/sprd-mcdt.c
@@ -993,7 +993,7 @@ MODULE_DEVICE_TABLE(of, sprd_mcdt_of_match);
 
 static struct platform_driver sprd_mcdt_driver = {
 	.probe = sprd_mcdt_probe,
-	.remove_new = sprd_mcdt_remove,
+	.remove = sprd_mcdt_remove,
 	.driver = {
 		.name = "sprd-mcdt",
 		.of_match_table = sprd_mcdt_of_match,
diff --git a/sound/soc/starfive/jh7110_pwmdac.c b/sound/soc/starfive/jh7110_pwmdac.c
index 4a4dd431b82b..a603dd17931c 100644
--- a/sound/soc/starfive/jh7110_pwmdac.c
+++ b/sound/soc/starfive/jh7110_pwmdac.c
@@ -516,7 +516,7 @@ static struct platform_driver jh7110_pwmdac_driver = {
 		.pm = pm_ptr(&jh7110_pwmdac_pm_ops),
 	},
 	.probe		= jh7110_pwmdac_probe,
-	.remove_new	= jh7110_pwmdac_remove,
+	.remove		= jh7110_pwmdac_remove,
 };
 module_platform_driver(jh7110_pwmdac_driver);
 
diff --git a/sound/soc/starfive/jh7110_tdm.c b/sound/soc/starfive/jh7110_tdm.c
index 1e0ff6720747..d38090e68df5 100644
--- a/sound/soc/starfive/jh7110_tdm.c
+++ b/sound/soc/starfive/jh7110_tdm.c
@@ -660,7 +660,7 @@ static struct platform_driver jh7110_tdm_driver = {
 		.pm = pm_ptr(&jh7110_tdm_pm_ops),
 	},
 	.probe = jh7110_tdm_probe,
-	.remove_new = jh7110_tdm_dev_remove,
+	.remove = jh7110_tdm_dev_remove,
 };
 module_platform_driver(jh7110_tdm_driver);
 
diff --git a/sound/soc/stm/stm32_adfsdm.c b/sound/soc/stm/stm32_adfsdm.c
index fb5dd9a68bea..9351727dce1a 100644
--- a/sound/soc/stm/stm32_adfsdm.c
+++ b/sound/soc/stm/stm32_adfsdm.c
@@ -398,7 +398,7 @@ static struct platform_driver stm32_adfsdm_driver = {
 		   .of_match_table = stm32_adfsdm_of_match,
 		   },
 	.probe = stm32_adfsdm_probe,
-	.remove_new = stm32_adfsdm_remove,
+	.remove = stm32_adfsdm_remove,
 };
 
 module_platform_driver(stm32_adfsdm_driver);
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index a96aa308681a..faa00103ee7f 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1216,7 +1216,7 @@ static struct platform_driver stm32_i2s_driver = {
 		.pm = &stm32_i2s_pm_ops,
 	},
 	.probe = stm32_i2s_probe,
-	.remove_new = stm32_i2s_remove,
+	.remove = stm32_i2s_remove,
 };
 
 module_platform_driver(stm32_i2s_driver);
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index ad2492efb1cd..7bc4a96b7503 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1619,7 +1619,7 @@ static struct platform_driver stm32_sai_sub_driver = {
 		.pm = &stm32_sai_sub_pm_ops,
 	},
 	.probe = stm32_sai_sub_probe,
-	.remove_new = stm32_sai_sub_remove,
+	.remove = stm32_sai_sub_remove,
 };
 
 module_platform_driver(stm32_sai_sub_driver);
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index 9eed3c57e3f1..d1b32ba1e1a2 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -1072,7 +1072,7 @@ static struct platform_driver stm32_spdifrx_driver = {
 		.pm = &stm32_spdifrx_pm_ops,
 	},
 	.probe = stm32_spdifrx_probe,
-	.remove_new = stm32_spdifrx_remove,
+	.remove = stm32_spdifrx_remove,
 };
 
 module_platform_driver(stm32_spdifrx_driver);
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index 25af47b63bdd..330bc0c09f56 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -1828,7 +1828,7 @@ static struct platform_driver sun4i_codec_driver = {
 		.of_match_table = sun4i_codec_of_match,
 	},
 	.probe = sun4i_codec_probe,
-	.remove_new = sun4i_codec_remove,
+	.remove = sun4i_codec_remove,
 };
 module_platform_driver(sun4i_codec_driver);
 
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 3af0b2aab291..40de99a34bc3 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -1684,7 +1684,7 @@ static const struct dev_pm_ops sun4i_i2s_pm_ops = {
 
 static struct platform_driver sun4i_i2s_driver = {
 	.probe	= sun4i_i2s_probe,
-	.remove_new = sun4i_i2s_remove,
+	.remove = sun4i_i2s_remove,
 	.driver	= {
 		.name		= "sun4i-i2s",
 		.of_match_table	= sun4i_i2s_match,
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index f41c30955857..0aa416423246 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -726,7 +726,7 @@ static struct platform_driver sun4i_spdif_driver = {
 		.pm	= &sun4i_spdif_pm,
 	},
 	.probe		= sun4i_spdif_probe,
-	.remove_new	= sun4i_spdif_remove,
+	.remove		= sun4i_spdif_remove,
 };
 
 module_platform_driver(sun4i_spdif_driver);
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 884394ddaf86..3e751b5694fe 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -426,7 +426,7 @@ static struct platform_driver sun50i_dmic_driver = {
 		.pm     = &sun50i_dmic_pm,
 	},
 	.probe          = sun50i_dmic_probe,
-	.remove_new     = sun50i_dmic_remove,
+	.remove         = sun50i_dmic_remove,
 };
 
 module_platform_driver(sun50i_dmic_driver);
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index b5dafb749c3f..8c645e04d571 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -1713,7 +1713,7 @@ static struct platform_driver sun8i_codec_driver = {
 		.pm = &sun8i_codec_pm_ops,
 	},
 	.probe = sun8i_codec_probe,
-	.remove_new = sun8i_codec_remove,
+	.remove = sun8i_codec_remove,
 };
 module_platform_driver(sun8i_codec_driver);
 
diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 22af5135d77a..d914dba56013 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -1034,7 +1034,7 @@ static struct platform_driver tegra186_asrc_driver = {
 		.pm = &tegra186_asrc_pm_ops,
 	},
 	.probe = tegra186_asrc_platform_probe,
-	.remove_new = tegra186_asrc_platform_remove,
+	.remove = tegra186_asrc_platform_remove,
 };
 module_platform_driver(tegra186_asrc_driver)
 
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index 21cd41fec7a9..508128b7783e 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -542,7 +542,7 @@ static struct platform_driver tegra186_dspk_driver = {
 		.pm = &tegra186_dspk_pm_ops,
 	},
 	.probe = tegra186_dspk_platform_probe,
-	.remove_new = tegra186_dspk_platform_remove,
+	.remove = tegra186_dspk_platform_remove,
 };
 module_platform_driver(tegra186_dspk_driver);
 
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index 8011afe93c96..08c58e8f3c22 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -448,7 +448,7 @@ static struct platform_driver tegra20_ac97_driver = {
 		.of_match_table = tegra20_ac97_of_match,
 	},
 	.probe = tegra20_ac97_platform_probe,
-	.remove_new = tegra20_ac97_platform_remove,
+	.remove = tegra20_ac97_platform_remove,
 };
 module_platform_driver(tegra20_ac97_driver);
 
diff --git a/sound/soc/tegra/tegra20_i2s.c b/sound/soc/tegra/tegra20_i2s.c
index f11618e8f13e..3b9823d1a87a 100644
--- a/sound/soc/tegra/tegra20_i2s.c
+++ b/sound/soc/tegra/tegra20_i2s.c
@@ -500,7 +500,7 @@ static struct platform_driver tegra20_i2s_driver = {
 		.pm = &tegra20_i2s_pm_ops,
 	},
 	.probe = tegra20_i2s_platform_probe,
-	.remove_new = tegra20_i2s_platform_remove,
+	.remove = tegra20_i2s_platform_remove,
 };
 module_platform_driver(tegra20_i2s_driver);
 
diff --git a/sound/soc/tegra/tegra210_admaif.c b/sound/soc/tegra/tegra210_admaif.c
index 9f9334e48049..a866aeb2719d 100644
--- a/sound/soc/tegra/tegra210_admaif.c
+++ b/sound/soc/tegra/tegra210_admaif.c
@@ -856,7 +856,7 @@ static const struct dev_pm_ops tegra_admaif_pm_ops = {
 
 static struct platform_driver tegra_admaif_driver = {
 	.probe = tegra_admaif_probe,
-	.remove_new = tegra_admaif_remove,
+	.remove = tegra_admaif_remove,
 	.driver = {
 		.name = "tegra210-admaif",
 		.of_match_table = tegra_admaif_of_match,
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index d2530443a221..109f763fe211 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -532,7 +532,7 @@ static struct platform_driver tegra210_adx_driver = {
 		.pm = &tegra210_adx_pm_ops,
 	},
 	.probe = tegra210_adx_platform_probe,
-	.remove_new = tegra210_adx_platform_remove,
+	.remove = tegra210_adx_platform_remove,
 };
 module_platform_driver(tegra210_adx_driver);
 
diff --git a/sound/soc/tegra/tegra210_ahub.c b/sound/soc/tegra/tegra210_ahub.c
index ab3c6b2544d2..1920b996e9aa 100644
--- a/sound/soc/tegra/tegra210_ahub.c
+++ b/sound/soc/tegra/tegra210_ahub.c
@@ -1416,7 +1416,7 @@ static const struct dev_pm_ops tegra_ahub_pm_ops = {
 
 static struct platform_driver tegra_ahub_driver = {
 	.probe = tegra_ahub_probe,
-	.remove_new = tegra_ahub_remove,
+	.remove = tegra_ahub_remove,
 	.driver = {
 		.name = "tegra210-ahub",
 		.of_match_table = tegra_ahub_of_match,
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 91e405909e0f..38a2d6ec033b 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -589,7 +589,7 @@ static struct platform_driver tegra210_amx_driver = {
 		.pm = &tegra210_amx_pm_ops,
 	},
 	.probe = tegra210_amx_platform_probe,
-	.remove_new = tegra210_amx_platform_remove,
+	.remove = tegra210_amx_platform_remove,
 };
 module_platform_driver(tegra210_amx_driver);
 
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index e53c0278ae9a..d9b577f146dc 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -559,7 +559,7 @@ static struct platform_driver tegra210_dmic_driver = {
 		.pm = &tegra210_dmic_pm_ops,
 	},
 	.probe = tegra210_dmic_probe,
-	.remove_new = tegra210_dmic_remove,
+	.remove = tegra210_dmic_remove,
 };
 module_platform_driver(tegra210_dmic_driver)
 
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index e93ceb7afb4c..a3908b15dfdc 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -1019,7 +1019,7 @@ static struct platform_driver tegra210_i2s_driver = {
 		.pm = &tegra210_i2s_pm_ops,
 	},
 	.probe = tegra210_i2s_probe,
-	.remove_new = tegra210_i2s_remove,
+	.remove = tegra210_i2s_remove,
 };
 module_platform_driver(tegra210_i2s_driver)
 
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 024614f6ec0b..e07e2f1d2f70 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -674,7 +674,7 @@ static struct platform_driver tegra210_mixer_driver = {
 		.pm = &tegra210_mixer_pm_ops,
 	},
 	.probe = tegra210_mixer_platform_probe,
-	.remove_new = tegra210_mixer_platform_remove,
+	.remove = tegra210_mixer_platform_remove,
 };
 module_platform_driver(tegra210_mixer_driver);
 
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index b89f5edafa03..4ead52564ab6 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -766,7 +766,7 @@ static struct platform_driver tegra210_mvc_driver = {
 		.pm = &tegra210_mvc_pm_ops,
 	},
 	.probe = tegra210_mvc_platform_probe,
-	.remove_new = tegra210_mvc_platform_remove,
+	.remove = tegra210_mvc_platform_remove,
 };
 module_platform_driver(tegra210_mvc_driver)
 
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 136ed17f3650..e2bc604e8b79 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -407,7 +407,7 @@ static struct platform_driver tegra210_ope_driver = {
 		.pm = &tegra210_ope_pm_ops,
 	},
 	.probe = tegra210_ope_probe,
-	.remove_new = tegra210_ope_remove,
+	.remove = tegra210_ope_remove,
 };
 module_platform_driver(tegra210_ope_driver)
 
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index 028747c44f37..e16bbb44cc77 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -3631,7 +3631,7 @@ static struct platform_driver tegra210_sfc_driver = {
 		.pm = &tegra210_sfc_pm_ops,
 	},
 	.probe = tegra210_sfc_platform_probe,
-	.remove_new = tegra210_sfc_platform_remove,
+	.remove = tegra210_sfc_platform_remove,
 };
 module_platform_driver(tegra210_sfc_driver)
 
diff --git a/sound/soc/tegra/tegra30_ahub.c b/sound/soc/tegra/tegra30_ahub.c
index d2e8078e444a..c9b52f54cea8 100644
--- a/sound/soc/tegra/tegra30_ahub.c
+++ b/sound/soc/tegra/tegra30_ahub.c
@@ -608,7 +608,7 @@ static const struct dev_pm_ops tegra30_ahub_pm_ops = {
 
 static struct platform_driver tegra30_ahub_driver = {
 	.probe = tegra30_ahub_probe,
-	.remove_new = tegra30_ahub_remove,
+	.remove = tegra30_ahub_remove,
 	.driver = {
 		.name = DRV_NAME,
 		.of_match_table = tegra30_ahub_of_match,
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index a8ff51d12edb..0d3badfbe143 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -560,7 +560,7 @@ static struct platform_driver tegra30_i2s_driver = {
 		.pm = &tegra30_i2s_pm_ops,
 	},
 	.probe = tegra30_i2s_platform_probe,
-	.remove_new = tegra30_i2s_platform_remove,
+	.remove = tegra30_i2s_platform_remove,
 };
 module_platform_driver(tegra30_i2s_driver);
 
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index feba9d42bbc5..8b48813c2c59 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -248,7 +248,7 @@ static struct platform_driver tegra_audio_graph_card = {
 		.of_match_table = graph_of_tegra_match,
 	},
 	.probe = tegra_audio_graph_probe,
-	.remove_new = simple_util_remove,
+	.remove = simple_util_remove,
 };
 module_platform_driver(tegra_audio_graph_card);
 
diff --git a/sound/soc/ti/ams-delta.c b/sound/soc/ti/ams-delta.c
index 76bda188e992..94645f275495 100644
--- a/sound/soc/ti/ams-delta.c
+++ b/sound/soc/ti/ams-delta.c
@@ -595,7 +595,7 @@ static struct platform_driver ams_delta_driver = {
 		.name = DRV_NAME,
 	},
 	.probe = ams_delta_probe,
-	.remove_new = ams_delta_remove,
+	.remove = ams_delta_remove,
 };
 
 module_platform_driver(ams_delta_driver);
diff --git a/sound/soc/ti/davinci-i2s.c b/sound/soc/ti/davinci-i2s.c
index 0f15a743c798..d682b98d6848 100644
--- a/sound/soc/ti/davinci-i2s.c
+++ b/sound/soc/ti/davinci-i2s.c
@@ -920,7 +920,7 @@ MODULE_DEVICE_TABLE(of, davinci_i2s_match);
 
 static struct platform_driver davinci_mcbsp_driver = {
 	.probe		= davinci_i2s_probe,
-	.remove_new	= davinci_i2s_remove,
+	.remove		= davinci_i2s_remove,
 	.driver		= {
 		.name	= "davinci-mcbsp",
 		.of_match_table = of_match_ptr(davinci_i2s_match),
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 2b1ed91a736c..a0b8cca31cba 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2535,7 +2535,7 @@ static const struct dev_pm_ops davinci_mcasp_pm_ops = {
 
 static struct platform_driver davinci_mcasp_driver = {
 	.probe		= davinci_mcasp_probe,
-	.remove_new	= davinci_mcasp_remove,
+	.remove		= davinci_mcasp_remove,
 	.driver		= {
 		.name	= "davinci-mcasp",
 		.pm     = &davinci_mcasp_pm_ops,
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index 2110ffe5281c..411970399271 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -1430,7 +1430,7 @@ static struct platform_driver asoc_mcbsp_driver = {
 	},
 
 	.probe = asoc_mcbsp_probe,
-	.remove_new = asoc_mcbsp_remove,
+	.remove = asoc_mcbsp_remove,
 };
 
 module_platform_driver(asoc_mcbsp_driver);
diff --git a/sound/soc/uniphier/aio-ld11.c b/sound/soc/uniphier/aio-ld11.c
index 01cc3b961999..a041ce8e23a4 100644
--- a/sound/soc/uniphier/aio-ld11.c
+++ b/sound/soc/uniphier/aio-ld11.c
@@ -347,7 +347,7 @@ static struct platform_driver uniphier_aio_driver = {
 		.of_match_table = of_match_ptr(uniphier_aio_of_match),
 	},
 	.probe    = uniphier_aio_probe,
-	.remove_new = uniphier_aio_remove,
+	.remove = uniphier_aio_remove,
 };
 module_platform_driver(uniphier_aio_driver);
 
diff --git a/sound/soc/uniphier/aio-pxs2.c b/sound/soc/uniphier/aio-pxs2.c
index fba13a212bdb..889f64b2c01f 100644
--- a/sound/soc/uniphier/aio-pxs2.c
+++ b/sound/soc/uniphier/aio-pxs2.c
@@ -256,7 +256,7 @@ static struct platform_driver uniphier_aio_driver = {
 		.of_match_table = of_match_ptr(uniphier_aio_of_match),
 	},
 	.probe    = uniphier_aio_probe,
-	.remove_new = uniphier_aio_remove,
+	.remove = uniphier_aio_remove,
 };
 module_platform_driver(uniphier_aio_driver);
 
diff --git a/sound/soc/uniphier/evea.c b/sound/soc/uniphier/evea.c
index d90b3e4b0104..662e45882c90 100644
--- a/sound/soc/uniphier/evea.c
+++ b/sound/soc/uniphier/evea.c
@@ -560,7 +560,7 @@ static struct platform_driver evea_codec_driver = {
 		.of_match_table = of_match_ptr(evea_of_match),
 	},
 	.probe  = evea_probe,
-	.remove_new = evea_remove,
+	.remove = evea_remove,
 };
 module_platform_driver(evea_codec_driver);
 
diff --git a/sound/soc/ux500/mop500.c b/sound/soc/ux500/mop500.c
index e0ab4534fe3e..ae6d326167d1 100644
--- a/sound/soc/ux500/mop500.c
+++ b/sound/soc/ux500/mop500.c
@@ -157,7 +157,7 @@ static struct platform_driver snd_soc_mop500_driver = {
 		.of_match_table = snd_soc_mop500_match,
 	},
 	.probe = mop500_probe,
-	.remove_new = mop500_remove,
+	.remove = mop500_remove,
 };
 
 module_platform_driver(snd_soc_mop500_driver);
diff --git a/sound/soc/ux500/ux500_msp_dai.c b/sound/soc/ux500/ux500_msp_dai.c
index 3fd13e8dd110..a2dd739fdf2d 100644
--- a/sound/soc/ux500/ux500_msp_dai.c
+++ b/sound/soc/ux500/ux500_msp_dai.c
@@ -816,7 +816,7 @@ static struct platform_driver msp_i2s_driver = {
 		.of_match_table = ux500_msp_i2s_match,
 	},
 	.probe = ux500_msp_drv_probe,
-	.remove_new = ux500_msp_drv_remove,
+	.remove = ux500_msp_drv_remove,
 };
 module_platform_driver(msp_i2s_driver);
 
diff --git a/sound/soc/xilinx/xlnx_formatter_pcm.c b/sound/soc/xilinx/xlnx_formatter_pcm.c
index 158fc21a86c1..17ef05309469 100644
--- a/sound/soc/xilinx/xlnx_formatter_pcm.c
+++ b/sound/soc/xilinx/xlnx_formatter_pcm.c
@@ -713,7 +713,7 @@ MODULE_DEVICE_TABLE(of, xlnx_formatter_pcm_of_match);
 
 static struct platform_driver xlnx_formatter_pcm_driver = {
 	.probe	= xlnx_formatter_pcm_probe,
-	.remove_new = xlnx_formatter_pcm_remove,
+	.remove = xlnx_formatter_pcm_remove,
 	.driver	= {
 		.name	= DRV_NAME,
 		.of_match_table	= xlnx_formatter_pcm_of_match,
diff --git a/sound/soc/xilinx/xlnx_spdif.c b/sound/soc/xilinx/xlnx_spdif.c
index d52d5fc7b5b8..7febb3830dc2 100644
--- a/sound/soc/xilinx/xlnx_spdif.c
+++ b/sound/soc/xilinx/xlnx_spdif.c
@@ -325,7 +325,7 @@ static struct platform_driver xlnx_spdif_driver = {
 		.of_match_table = xlnx_spdif_of_match,
 	},
 	.probe = xlnx_spdif_probe,
-	.remove_new = xlnx_spdif_remove,
+	.remove = xlnx_spdif_remove,
 };
 module_platform_driver(xlnx_spdif_driver);
 
diff --git a/sound/soc/xtensa/xtfpga-i2s.c b/sound/soc/xtensa/xtfpga-i2s.c
index 6e2b72d7a65d..4eaa9011405f 100644
--- a/sound/soc/xtensa/xtfpga-i2s.c
+++ b/sound/soc/xtensa/xtfpga-i2s.c
@@ -635,7 +635,7 @@ static const struct dev_pm_ops xtfpga_i2s_pm_ops = {
 
 static struct platform_driver xtfpga_i2s_driver = {
 	.probe   = xtfpga_i2s_probe,
-	.remove_new = xtfpga_i2s_remove,
+	.remove = xtfpga_i2s_remove,
 	.driver  = {
 		.name = "xtfpga-i2s",
 		.of_match_table = of_match_ptr(xtfpga_i2s_of_match),

base-commit: 100cc857359b5d731407d1038f7e76cd0e871d94
-- 
2.45.2

