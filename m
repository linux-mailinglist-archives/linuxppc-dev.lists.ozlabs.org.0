Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 544DD7B6EF2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:49:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mG+RrTcB;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0P1711QDz3vd7
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:49:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=mG+RrTcB;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Nvc3LdBz3c7q
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:44:28 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CC379CE1911;
	Tue,  3 Oct 2023 16:44:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 98AF2C433C9;
	Tue,  3 Oct 2023 16:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696351464;
	bh=1fhFNaK2WH2pkPl7h+crfgki4FfK9rnrCDk4oOUVcZ0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mG+RrTcBBDgE9/hljuhBKjDfzIQ9bEKzjZ4fXkH3+xcdHIyPmqjKySz4jMXra/mBh
	 oeTLOOMZbL/7/PC65MWSRR5OPciulVbdoF3ihCfUu0n2Y3D0GxKxLXSwT0Aupjjc3p
	 ejl4LvCTto5gHQVSneF+dtwiYQG44DzXbhOsCA/2OVz7nrYIbeT4DrplmI5kQDqYBB
	 OALidimynfqh/jAaSpnKdeFK/OOahI5lHtS8nBglhPQNvJ1fpwKIorXnBiSXpE2vBs
	 BK27w2MpMGaY+Go9jLwdUxXZ3pg1jZQXzWkwcNOqA4TU5BLtwDY4PlHcyZbu8ihxHW
	 uHcx6r+Jel7IQ==
Received: (nullmailer pid 783959 invoked by uid 1000);
	Tue, 03 Oct 2023 16:43:40 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 03 Oct 2023 11:43:07 -0500
Subject: [PATCH 1/5] ASoC: Explicitly include correct DT includes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-dt-asoc-header-cleanups-v1-1-308666806378@kernel.org>
References: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Support Opensource <support.opensource@diasemi.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, Shengjiu Wang <shengjiu.wang@
 gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <r
 anjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
X-Mailer: b4 0.13-dev
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
Cc: patches@opensource.cirrus.com, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

The DT of_device.h and of_platform.h date back to the separate
of_platform_bus_type before it was merged into the regular platform bus.
As part of that merge prepping Arm DT support 13 years ago, they
"temporarily" include each other. They also include platform_device.h
and of.h. As a result, there's a pretty much random mix of those include
files used throughout the tree. In order to detangle these headers and
replace the implicit includes with struct declarations, users need to
explicitly include the correct includes.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/atmel/atmel_wm8904.c                             | 1 -
 sound/soc/atmel/mchp-i2s-mcc.c                             | 2 +-
 sound/soc/atmel/tse850-pcm5142.c                           | 1 -
 sound/soc/bcm/cygnus-ssp.c                                 | 2 +-
 sound/soc/codecs/adau1701.c                                | 1 -
 sound/soc/codecs/adau1977-spi.c                            | 1 -
 sound/soc/codecs/ak4104.c                                  | 2 +-
 sound/soc/codecs/ak4118.c                                  | 2 +-
 sound/soc/codecs/ak4375.c                                  | 2 +-
 sound/soc/codecs/ak4458.c                                  | 2 +-
 sound/soc/codecs/ak4613.c                                  | 2 +-
 sound/soc/codecs/ak4642.c                                  | 2 +-
 sound/soc/codecs/ak5558.c                                  | 2 +-
 sound/soc/codecs/cs35l32.c                                 | 2 +-
 sound/soc/codecs/cs35l33.c                                 | 2 --
 sound/soc/codecs/cs35l34.c                                 | 2 +-
 sound/soc/codecs/cs35l35.c                                 | 3 +--
 sound/soc/codecs/cs35l36.c                                 | 3 +--
 sound/soc/codecs/cs35l41-i2c.c                             | 2 +-
 sound/soc/codecs/cs35l41.c                                 | 1 -
 sound/soc/codecs/cs4270.c                                  | 2 +-
 sound/soc/codecs/cs42l42.c                                 | 1 -
 sound/soc/codecs/cs42l56.c                                 | 2 +-
 sound/soc/codecs/cs42xx8-i2c.c                             | 2 +-
 sound/soc/codecs/cs43130.c                                 | 3 +--
 sound/soc/codecs/cs4349.c                                  | 2 +-
 sound/soc/codecs/da7213.c                                  | 2 +-
 sound/soc/codecs/da7219.c                                  | 2 +-
 sound/soc/codecs/da9055.c                                  | 1 -
 sound/soc/codecs/es8328.c                                  | 1 -
 sound/soc/codecs/gtm601.c                                  | 2 +-
 sound/soc/codecs/lpass-macro-common.c                      | 2 +-
 sound/soc/codecs/mt6351.c                                  | 2 +-
 sound/soc/codecs/mt6358.c                                  | 2 +-
 sound/soc/codecs/mt6359-accdet.c                           | 4 ----
 sound/soc/codecs/mt6359.c                                  | 2 +-
 sound/soc/codecs/nau8540.c                                 | 2 +-
 sound/soc/codecs/pcm1681.c                                 | 2 --
 sound/soc/codecs/rt715.c                                   | 2 --
 sound/soc/codecs/sgtl5000.c                                | 2 +-
 sound/soc/codecs/sma1303.c                                 | 2 +-
 sound/soc/codecs/sta32x.c                                  | 3 +--
 sound/soc/codecs/sta350.c                                  | 3 +--
 sound/soc/codecs/tas571x.c                                 | 2 +-
 sound/soc/codecs/uda1334.c                                 | 2 +-
 sound/soc/codecs/wm8510.c                                  | 2 +-
 sound/soc/codecs/wm8523.c                                  | 2 +-
 sound/soc/codecs/wm8524.c                                  | 2 +-
 sound/soc/codecs/wm8580.c                                  | 2 +-
 sound/soc/codecs/wm8711.c                                  | 2 +-
 sound/soc/codecs/wm8728.c                                  | 2 +-
 sound/soc/codecs/wm8731-i2c.c                              | 2 +-
 sound/soc/codecs/wm8731-spi.c                              | 2 +-
 sound/soc/codecs/wm8737.c                                  | 2 +-
 sound/soc/codecs/wm8741.c                                  | 2 +-
 sound/soc/codecs/wm8750.c                                  | 2 +-
 sound/soc/codecs/wm8753.c                                  | 2 +-
 sound/soc/codecs/wm8770.c                                  | 2 +-
 sound/soc/codecs/wm8776.c                                  | 2 +-
 sound/soc/codecs/wm8804.c                                  | 1 -
 sound/soc/fsl/efika-audio-fabric.c                         | 4 ++--
 sound/soc/fsl/fsl_aud2htx.c                                | 3 +--
 sound/soc/fsl/fsl_mqs.c                                    | 2 +-
 sound/soc/fsl/fsl_rpmsg.c                                  | 3 +--
 sound/soc/fsl/fsl_sai.c                                    | 3 +--
 sound/soc/fsl/fsl_spdif.c                                  | 4 +---
 sound/soc/fsl/imx-audmux.c                                 | 1 -
 sound/soc/fsl/imx-card.c                                   | 3 +--
 sound/soc/fsl/imx-rpmsg.c                                  | 3 ++-
 sound/soc/fsl/mpc5200_dma.c                                | 4 ++--
 sound/soc/fsl/mpc5200_psc_ac97.c                           | 3 +--
 sound/soc/fsl/mpc5200_psc_i2s.c                            | 3 +--
 sound/soc/fsl/mpc8610_hpcd.c                               | 2 +-
 sound/soc/fsl/p1022_ds.c                                   | 2 +-
 sound/soc/fsl/p1022_rdk.c                                  | 2 +-
 sound/soc/fsl/pcm030-audio-fabric.c                        | 3 +--
 sound/soc/generic/audio-graph-card.c                       | 2 --
 sound/soc/generic/audio-graph-card2.c                      | 2 --
 sound/soc/generic/simple-card.c                            | 2 +-
 sound/soc/generic/test-component.c                         | 2 +-
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c                 | 2 --
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c         | 2 +-
 sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c  | 2 +-
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c   | 2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c                  | 2 +-
 sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c    | 2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c                  | 2 +-
 sound/soc/mxs/mxs-saif.c                                   | 1 -
 sound/soc/mxs/mxs-sgtl5000.c                               | 1 -
 sound/soc/qcom/apq8096.c                                   | 2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                           | 2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                           | 2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c                  | 1 -
 sound/soc/qcom/qdsp6/q6routing.c                           | 3 +--
 sound/soc/qcom/sc7180.c                                    | 2 +-
 sound/soc/qcom/sc7280.c                                    | 2 +-
 sound/soc/qcom/sc8280xp.c                                  | 2 +-
 sound/soc/qcom/sdm845.c                                    | 2 +-
 sound/soc/qcom/sm8250.c                                    | 2 +-
 sound/soc/rockchip/rockchip_i2s_tdm.c                      | 4 +---
 sound/soc/rockchip/rockchip_max98090.c                     | 3 +--
 sound/soc/rockchip/rockchip_pdm.c                          | 1 -
 sound/soc/samsung/aries_wm8994.c                           | 1 -
 sound/soc/samsung/arndale.c                                | 2 +-
 sound/soc/samsung/i2s.c                                    | 2 --
 sound/soc/samsung/midas_wm1811.c                           | 2 --
 sound/soc/samsung/odroid.c                                 | 1 -
 sound/soc/samsung/smdk_wm8994.c                            | 1 -
 sound/soc/samsung/snow.c                                   | 1 -
 sound/soc/sh/fsi.c                                         | 1 -
 sound/soc/sh/rcar/core.c                                   | 1 +
 sound/soc/sh/rcar/rsnd.h                                   | 4 +---
 sound/soc/sh/rcar/src.c                                    | 1 +
 sound/soc/sh/rcar/ssi.c                                    | 2 ++
 sound/soc/sh/rz-ssi.c                                      | 1 -
 sound/soc/sunxi/sun4i-codec.c                              | 4 ----
 sound/soc/sunxi/sun4i-i2s.c                                | 2 +-
 sound/soc/sunxi/sun4i-spdif.c                              | 3 +--
 sound/soc/sunxi/sun50i-codec-analog.c                      | 3 +--
 sound/soc/sunxi/sun50i-dmic.c                              | 2 +-
 sound/soc/sunxi/sun8i-codec-analog.c                       | 1 -
 sound/soc/sunxi/sun8i-codec.c                              | 2 +-
 sound/soc/tegra/tegra186_asrc.c                            | 3 +--
 sound/soc/tegra/tegra186_dspk.c                            | 2 +-
 sound/soc/tegra/tegra20_spdif.c                            | 2 +-
 sound/soc/tegra/tegra210_adx.c                             | 3 +--
 sound/soc/tegra/tegra210_amx.c                             | 3 +--
 sound/soc/tegra/tegra210_dmic.c                            | 2 +-
 sound/soc/tegra/tegra210_i2s.c                             | 2 +-
 sound/soc/tegra/tegra210_mixer.c                           | 3 +--
 sound/soc/tegra/tegra210_mvc.c                             | 3 +--
 sound/soc/tegra/tegra210_ope.c                             | 3 +--
 sound/soc/tegra/tegra210_peq.c                             | 1 -
 sound/soc/tegra/tegra210_sfc.c                             | 1 -
 sound/soc/tegra/tegra30_i2s.c                              | 1 -
 sound/soc/tegra/tegra_asoc_machine.c                       | 1 -
 sound/soc/tegra/tegra_audio_graph_card.c                   | 2 +-
 sound/soc/ti/omap-dmic.c                                   | 2 +-
 sound/soc/ti/omap-mcpdm.c                                  | 2 +-
 140 files changed, 109 insertions(+), 181 deletions(-)

diff --git a/sound/soc/atmel/atmel_wm8904.c b/sound/soc/atmel/atmel_wm8904.c
index 01e944fa1148..b7f16ea0cdfc 100644
--- a/sound/soc/atmel/atmel_wm8904.c
+++ b/sound/soc/atmel/atmel_wm8904.c
@@ -10,7 +10,6 @@
 #include <linux/clk.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
 #include <sound/soc.h>
 
diff --git a/sound/soc/atmel/mchp-i2s-mcc.c b/sound/soc/atmel/mchp-i2s-mcc.c
index 25ed0b953bfd..193dd7acceb0 100644
--- a/sound/soc/atmel/mchp-i2s-mcc.c
+++ b/sound/soc/atmel/mchp-i2s-mcc.c
@@ -16,7 +16,7 @@
 #include <linux/clk.h>
 #include <linux/mfd/syscon.h>
 #include <linux/lcm.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/atmel/tse850-pcm5142.c b/sound/soc/atmel/tse850-pcm5142.c
index c809b121037f..611da23325d3 100644
--- a/sound/soc/atmel/tse850-pcm5142.c
+++ b/sound/soc/atmel/tse850-pcm5142.c
@@ -38,7 +38,6 @@
 #include <linux/gpio.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 
diff --git a/sound/soc/bcm/cygnus-ssp.c b/sound/soc/bcm/cygnus-ssp.c
index 8638bf22ef5c..90088516fed0 100644
--- a/sound/soc/bcm/cygnus-ssp.c
+++ b/sound/soc/bcm/cygnus-ssp.c
@@ -5,7 +5,7 @@
 #include <linux/init.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/adau1701.c b/sound/soc/codecs/adau1701.c
index 94831aad7ac6..d1392d9abccd 100644
--- a/sound/soc/codecs/adau1701.c
+++ b/sound/soc/codecs/adau1701.c
@@ -13,7 +13,6 @@
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/adau1977-spi.c b/sound/soc/codecs/adau1977-spi.c
index 207c5c95f35a..e7e95e5d1911 100644
--- a/sound/soc/codecs/adau1977-spi.c
+++ b/sound/soc/codecs/adau1977-spi.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/spi/spi.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/codecs/ak4104.c b/sound/soc/codecs/ak4104.c
index ce99f30b4613..a33cb329865c 100644
--- a/sound/soc/codecs/ak4104.c
+++ b/sound/soc/codecs/ak4104.c
@@ -5,10 +5,10 @@
  * Copyright (c) 2009 Daniel Mack <daniel@caiaq.de>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/spi/spi.h>
-#include <linux/of_device.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <sound/asoundef.h>
diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index e34e5533765c..74a10108c1d4 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -8,7 +8,7 @@
 #include <linux/i2c.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/ak4375.c b/sound/soc/codecs/ak4375.c
index f287acb98646..3ee5a5c3c5fe 100644
--- a/sound/soc/codecs/ak4375.c
+++ b/sound/soc/codecs/ak4375.c
@@ -9,7 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 77678f85ad94..73cf482f104f 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -9,7 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
diff --git a/sound/soc/codecs/ak4613.c b/sound/soc/codecs/ak4613.c
index 619a817ee91c..73fb35560e51 100644
--- a/sound/soc/codecs/ak4613.c
+++ b/sound/soc/codecs/ak4613.c
@@ -99,7 +99,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/ak4642.c b/sound/soc/codecs/ak4642.c
index 8a40c6b3f4d8..fe035d2fc913 100644
--- a/sound/soc/codecs/ak4642.c
+++ b/sound/soc/codecs/ak4642.c
@@ -24,7 +24,7 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
 #include <sound/soc.h>
diff --git a/sound/soc/codecs/ak5558.c b/sound/soc/codecs/ak5558.c
index 442e2cb42df4..6c767609f95d 100644
--- a/sound/soc/codecs/ak5558.c
+++ b/sound/soc/codecs/ak5558.c
@@ -9,7 +9,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
diff --git a/sound/soc/codecs/cs35l32.c b/sound/soc/codecs/cs35l32.c
index 6e658bb16fb0..138040618438 100644
--- a/sound/soc/codecs/cs35l32.c
+++ b/sound/soc/codecs/cs35l32.c
@@ -19,7 +19,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/cs35l33.c b/sound/soc/codecs/cs35l33.c
index 9968c2e189e6..4010a2d33a33 100644
--- a/sound/soc/codecs/cs35l33.c
+++ b/sound/soc/codecs/cs35l33.c
@@ -30,8 +30,6 @@
 #include <linux/regulator/machine.h>
 #include <linux/of_gpio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
 
 #include "cs35l33.h"
 #include "cirrus_legacy.h"
diff --git a/sound/soc/codecs/cs35l34.c b/sound/soc/codecs/cs35l34.c
index 6974dd461410..e5871736fa29 100644
--- a/sound/soc/codecs/cs35l34.c
+++ b/sound/soc/codecs/cs35l34.c
@@ -19,7 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regulator/machine.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_irq.h>
 #include <sound/core.h>
diff --git a/sound/soc/codecs/cs35l35.c b/sound/soc/codecs/cs35l35.c
index 0a4b5aa78185..63a538f747d3 100644
--- a/sound/soc/codecs/cs35l35.c
+++ b/sound/soc/codecs/cs35l35.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
@@ -29,7 +29,6 @@
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l35.h>
-#include <linux/of_irq.h>
 #include <linux/completion.h>
 
 #include "cs35l35.h"
diff --git a/sound/soc/codecs/cs35l36.c b/sound/soc/codecs/cs35l36.c
index 20084c7d3acb..f2fde6e652b9 100644
--- a/sound/soc/codecs/cs35l36.c
+++ b/sound/soc/codecs/cs35l36.c
@@ -17,7 +17,7 @@
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
@@ -29,7 +29,6 @@
 #include <sound/initval.h>
 #include <sound/tlv.h>
 #include <sound/cs35l36.h>
-#include <linux/of_irq.h>
 #include <linux/completion.h>
 
 #include "cs35l36.h"
diff --git a/sound/soc/codecs/cs35l41-i2c.c b/sound/soc/codecs/cs35l41-i2c.c
index 96414ee35285..a0c457c0d04b 100644
--- a/sound/soc/codecs/cs35l41-i2c.c
+++ b/sound/soc/codecs/cs35l41-i2c.c
@@ -13,7 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/sound/soc/codecs/cs35l41.c b/sound/soc/codecs/cs35l41.c
index 4bc64ba71cd6..d0e9128ac6d0 100644
--- a/sound/soc/codecs/cs35l41.c
+++ b/sound/soc/codecs/cs35l41.c
@@ -13,7 +13,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
 #include <sound/initval.h>
diff --git a/sound/soc/codecs/cs4270.c b/sound/soc/codecs/cs4270.c
index 3df567214952..3bbb90c827f2 100644
--- a/sound/soc/codecs/cs4270.c
+++ b/sound/soc/codecs/cs4270.c
@@ -21,6 +21,7 @@
  * - Power management is supported
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -30,7 +31,6 @@
 #include <linux/delay.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
 
 #define CS4270_FORMATS (SNDRV_PCM_FMTBIT_S8      | SNDRV_PCM_FMTBIT_S16_LE  | \
 			SNDRV_PCM_FMTBIT_S18_3LE | SNDRV_PCM_FMTBIT_S20_3LE | \
diff --git a/sound/soc/codecs/cs42l42.c b/sound/soc/codecs/cs42l42.c
index 2961340f15e2..94bcab812629 100644
--- a/sound/soc/codecs/cs42l42.c
+++ b/sound/soc/codecs/cs42l42.c
@@ -24,7 +24,6 @@
 #include <linux/property.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/cs42l56.c b/sound/soc/codecs/cs42l56.c
index 1714857594fb..3e3a86dab4fc 100644
--- a/sound/soc/codecs/cs42l56.c
+++ b/sound/soc/codecs/cs42l56.c
@@ -20,7 +20,7 @@
 #include <linux/workqueue.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/cs42xx8-i2c.c b/sound/soc/codecs/cs42xx8-i2c.c
index 9028c0f0fe77..ecaebf8e1c8f 100644
--- a/sound/soc/codecs/cs42xx8-i2c.c
+++ b/sound/soc/codecs/cs42xx8-i2c.c
@@ -12,7 +12,7 @@
 
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/pm_runtime.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/codecs/cs43130.c b/sound/soc/codecs/cs43130.c
index 3292405024bc..0b40fdfb1825 100644
--- a/sound/soc/codecs/cs43130.c
+++ b/sound/soc/codecs/cs43130.c
@@ -16,7 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
@@ -29,7 +29,6 @@
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_irq.h>
 #include <linux/completion.h>
 #include <linux/mutex.h>
 #include <linux/workqueue.h>
diff --git a/sound/soc/codecs/cs4349.c b/sound/soc/codecs/cs4349.c
index ef08e51901b5..9083228495d4 100644
--- a/sound/soc/codecs/cs4349.c
+++ b/sound/soc/codecs/cs4349.c
@@ -7,6 +7,7 @@
  * Authors: Tim Howe <Tim.Howe@cirrus.com>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -17,7 +18,6 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <sound/core.h>
diff --git a/sound/soc/codecs/da7213.c b/sound/soc/codecs/da7213.c
index 49d97627abc6..37db1b5e20a6 100644
--- a/sound/soc/codecs/da7213.c
+++ b/sound/soc/codecs/da7213.c
@@ -9,7 +9,7 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
diff --git a/sound/soc/codecs/da7219.c b/sound/soc/codecs/da7219.c
index 600c2db58756..311ea7918b31 100644
--- a/sound/soc/codecs/da7219.c
+++ b/sound/soc/codecs/da7219.c
@@ -12,7 +12,7 @@
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/property.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/da9055.c b/sound/soc/codecs/da9055.c
index ae20086777b5..c8a34572965d 100644
--- a/sound/soc/codecs/da9055.c
+++ b/sound/soc/codecs/da9055.c
@@ -15,7 +15,6 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
diff --git a/sound/soc/codecs/es8328.c b/sound/soc/codecs/es8328.c
index 0bd9ba5a11b4..97cfa0c8e81b 100644
--- a/sound/soc/codecs/es8328.c
+++ b/sound/soc/codecs/es8328.c
@@ -9,7 +9,6 @@
 
 #include <linux/clk.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
 #include <linux/module.h>
 #include <linux/pm.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/gtm601.c b/sound/soc/codecs/gtm601.c
index c6b1e77ffccd..1f165e46701f 100644
--- a/sound/soc/codecs/gtm601.c
+++ b/sound/soc/codecs/gtm601.c
@@ -13,7 +13,7 @@
 #include <linux/slab.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/initval.h>
diff --git a/sound/soc/codecs/lpass-macro-common.c b/sound/soc/codecs/lpass-macro-common.c
index f54baaad54d4..da1b422250b8 100644
--- a/sound/soc/codecs/lpass-macro-common.c
+++ b/sound/soc/codecs/lpass-macro-common.c
@@ -4,7 +4,7 @@
 #include <linux/export.h>
 #include <linux/module.h>
 #include <linux/init.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/codecs/mt6351.c b/sound/soc/codecs/mt6351.c
index d2cf4847eead..2a5e963fb2b5 100644
--- a/sound/soc/codecs/mt6351.c
+++ b/sound/soc/codecs/mt6351.c
@@ -8,8 +8,8 @@
 #include <linux/dma-mapping.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/delay.h>
 
 #include <sound/core.h>
diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index d7b157ddc9a8..0284e29c11d3 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -6,8 +6,8 @@
 // Author: KaiChieh Chuang <kaichieh.chuang@mediatek.com>
 
 #include <linux/platform_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/delay.h>
 #include <linux/kthread.h>
 #include <linux/sched.h>
diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 7f624854948c..ed34cc15b80e 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -6,11 +6,7 @@
 // Author: Argus Lin <argus.lin@mediatek.com>
 //
 
-#include <linux/of_gpio.h>
 #include <linux/of.h>
-#include <linux/of_irq.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
 #include <linux/input.h>
 #include <linux/kthread.h>
 #include <linux/io.h>
diff --git a/sound/soc/codecs/mt6359.c b/sound/soc/codecs/mt6359.c
index 30690479ec17..0b76a55664b0 100644
--- a/sound/soc/codecs/mt6359.c
+++ b/sound/soc/codecs/mt6359.c
@@ -9,7 +9,7 @@
 #include <linux/kthread.h>
 #include <linux/mfd/mt6397/core.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/sched.h>
diff --git a/sound/soc/codecs/nau8540.c b/sound/soc/codecs/nau8540.c
index 2174a89772fc..5cf28d034f09 100644
--- a/sound/soc/codecs/nau8540.c
+++ b/sound/soc/codecs/nau8540.c
@@ -16,7 +16,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/pcm1681.c b/sound/soc/codecs/pcm1681.c
index 735e1942b530..316ad53bc66a 100644
--- a/sound/soc/codecs/pcm1681.c
+++ b/sound/soc/codecs/pcm1681.c
@@ -13,8 +13,6 @@
 #include <linux/i2c.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index b59230c8fd32..ed0af0213d60 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -20,8 +20,6 @@
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/sgtl5000.c b/sound/soc/codecs/sgtl5000.c
index b22ba95bd0c0..2f468f41b94d 100644
--- a/sound/soc/codecs/sgtl5000.c
+++ b/sound/soc/codecs/sgtl5000.c
@@ -13,11 +13,11 @@
 #include <linux/i2c.h>
 #include <linux/clk.h>
 #include <linux/log2.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/driver.h>
 #include <linux/regulator/machine.h>
 #include <linux/regulator/consumer.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/tlv.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/sma1303.c b/sound/soc/codecs/sma1303.c
index 7b9abbc1bd94..61072e7574a0 100644
--- a/sound/soc/codecs/sma1303.c
+++ b/sound/soc/codecs/sma1303.c
@@ -7,6 +7,7 @@
 // Auther: Gyuhwa Park <gyuhwa.park@irondevice.com>
 //         Kiseok Jo <kiseok.jo@irondevice.com>
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -21,7 +22,6 @@
 #include <sound/soc.h>
 #include <sound/initval.h>
 #include <sound/tlv.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <asm/div64.h>
 
diff --git a/sound/soc/codecs/sta32x.c b/sound/soc/codecs/sta32x.c
index 34ffd32ab9dc..fcf0dbfbbbca 100644
--- a/sound/soc/codecs/sta32x.c
+++ b/sound/soc/codecs/sta32x.c
@@ -21,8 +21,7 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
diff --git a/sound/soc/codecs/sta350.c b/sound/soc/codecs/sta350.c
index e4a9e9241c60..612cc1d7eafe 100644
--- a/sound/soc/codecs/sta350.c
+++ b/sound/soc/codecs/sta350.c
@@ -22,8 +22,7 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/gpio/consumer.h>
diff --git a/sound/soc/codecs/tas571x.c b/sound/soc/codecs/tas571x.c
index a220342c3d77..f249e93e2a4e 100644
--- a/sound/soc/codecs/tas571x.c
+++ b/sound/soc/codecs/tas571x.c
@@ -20,7 +20,7 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/stddef.h>
diff --git a/sound/soc/codecs/uda1334.c b/sound/soc/codecs/uda1334.c
index eace96533600..296caad5d026 100644
--- a/sound/soc/codecs/uda1334.c
+++ b/sound/soc/codecs/uda1334.c
@@ -4,13 +4,13 @@
 //
 // Based on WM8523 ALSA SoC Audio driver written by Mark Brown
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8510.c b/sound/soc/codecs/wm8510.c
index 6636a70f3895..0e671cce8447 100644
--- a/sound/soc/codecs/wm8510.c
+++ b/sound/soc/codecs/wm8510.c
@@ -7,6 +7,7 @@
  * Author: Liam Girdwood <lrg@slimlogic.co.uk>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -16,7 +17,6 @@
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/wm8523.c b/sound/soc/codecs/wm8523.c
index ea87cd3cc0d6..41b14538b03c 100644
--- a/sound/soc/codecs/wm8523.c
+++ b/sound/soc/codecs/wm8523.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -16,7 +17,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8524.c b/sound/soc/codecs/wm8524.c
index b56dcac60244..fa9942a08927 100644
--- a/sound/soc/codecs/wm8524.c
+++ b/sound/soc/codecs/wm8524.c
@@ -8,13 +8,13 @@
  * Based on WM8523 ALSA SoC Audio driver written by Mark Brown
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8580.c b/sound/soc/codecs/wm8580.c
index 28c0ba348634..73a8edc797fb 100644
--- a/sound/soc/codecs/wm8580.c
+++ b/sound/soc/codecs/wm8580.c
@@ -15,6 +15,7 @@
  *  the secondary audio interfaces are not.
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
@@ -25,7 +26,6 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/wm8711.c b/sound/soc/codecs/wm8711.c
index 916f297164de..7d339cc65208 100644
--- a/sound/soc/codecs/wm8711.c
+++ b/sound/soc/codecs/wm8711.c
@@ -9,6 +9,7 @@
  * Based on wm8731.c by Richard Purdie
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -18,7 +19,6 @@
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8728.c b/sound/soc/codecs/wm8728.c
index 0c943e7d4159..d9cc78fbf1ea 100644
--- a/sound/soc/codecs/wm8728.c
+++ b/sound/soc/codecs/wm8728.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -17,7 +18,6 @@
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8731-i2c.c b/sound/soc/codecs/wm8731-i2c.c
index c39e637d813d..7f68ad0380e0 100644
--- a/sound/soc/codecs/wm8731-i2c.c
+++ b/sound/soc/codecs/wm8731-i2c.c
@@ -11,8 +11,8 @@
  */
 
 #include <linux/i2c.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 
 #include "wm8731.h"
 
diff --git a/sound/soc/codecs/wm8731-spi.c b/sound/soc/codecs/wm8731-spi.c
index 542ed097d89a..c02086afa7fb 100644
--- a/sound/soc/codecs/wm8731-spi.c
+++ b/sound/soc/codecs/wm8731-spi.c
@@ -11,8 +11,8 @@
  */
 
 #include <linux/spi/spi.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 
 #include "wm8731.h"
 
diff --git a/sound/soc/codecs/wm8737.c b/sound/soc/codecs/wm8737.c
index 0d231c289ef3..a0ba1e7dee98 100644
--- a/sound/soc/codecs/wm8737.c
+++ b/sound/soc/codecs/wm8737.c
@@ -7,6 +7,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
@@ -17,7 +18,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8741.c b/sound/soc/codecs/wm8741.c
index 19e8fc4062c7..a0848774427b 100644
--- a/sound/soc/codecs/wm8741.c
+++ b/sound/soc/codecs/wm8741.c
@@ -14,10 +14,10 @@
 #include <linux/pm.h>
 #include <linux/i2c.h>
 #include <linux/spi/spi.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8750.c b/sound/soc/codecs/wm8750.c
index 2d2feaf95e49..b8d76cd001da 100644
--- a/sound/soc/codecs/wm8750.c
+++ b/sound/soc/codecs/wm8750.c
@@ -15,10 +15,10 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/wm8753.c b/sound/soc/codecs/wm8753.c
index b5d8290c37d9..f42ed24314f3 100644
--- a/sound/soc/codecs/wm8753.c
+++ b/sound/soc/codecs/wm8753.c
@@ -26,13 +26,13 @@
  * an alsa kcontrol. This allows the PCM to remain open.
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/wm8770.c b/sound/soc/codecs/wm8770.c
index 2469f4f3bea3..38376b605201 100644
--- a/sound/soc/codecs/wm8770.c
+++ b/sound/soc/codecs/wm8770.c
@@ -7,11 +7,11 @@
  * Author: Dimitris Papastamos <dp@opensource.wolfsonmicro.com>
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
 #include <linux/pm.h>
 #include <linux/spi/spi.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/codecs/wm8776.c b/sound/soc/codecs/wm8776.c
index 0673bbd32bab..166e00fcd11d 100644
--- a/sound/soc/codecs/wm8776.c
+++ b/sound/soc/codecs/wm8776.c
@@ -9,13 +9,13 @@
  * TODO: Input ALC/limiter support
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
 #include <linux/regmap.h>
 #include <linux/spi/spi.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/wm8804.c b/sound/soc/codecs/wm8804.c
index bbb4b6e3b41c..cfa78e4d8b73 100644
--- a/sound/soc/codecs/wm8804.c
+++ b/sound/soc/codecs/wm8804.c
@@ -14,7 +14,6 @@
 #include <linux/delay.h>
 #include <linux/pm.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
 #include <sound/core.h>
diff --git a/sound/soc/fsl/efika-audio-fabric.c b/sound/soc/fsl/efika-audio-fabric.c
index 8f6396faec9b..de17b103a4cf 100644
--- a/sound/soc/fsl/efika-audio-fabric.c
+++ b/sound/soc/fsl/efika-audio-fabric.c
@@ -15,8 +15,8 @@
 #include <linux/interrupt.h>
 #include <linux/device.h>
 #include <linux/delay.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
 #include <linux/dma-mapping.h>
 
 #include <sound/core.h>
diff --git a/sound/soc/fsl/fsl_aud2htx.c b/sound/soc/fsl/fsl_aud2htx.c
index fc56f6ade368..ee2f6ad1f800 100644
--- a/sound/soc/fsl/fsl_aud2htx.c
+++ b/sound/soc/fsl/fsl_aud2htx.c
@@ -5,9 +5,8 @@
 #include <linux/clk-provider.h>
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/fsl/fsl_mqs.c b/sound/soc/fsl/fsl_mqs.c
index 49ae7f6267d3..f2d74ec05cdf 100644
--- a/sound/soc/fsl/fsl_mqs.c
+++ b/sound/soc/fsl/fsl_mqs.c
@@ -10,7 +10,7 @@
 #include <linux/moduleparam.h>
 #include <linux/mfd/syscon.h>
 #include <linux/mfd/syscon/imx6q-iomuxc-gpr.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
 #include <linux/pm.h>
diff --git a/sound/soc/fsl/fsl_rpmsg.c b/sound/soc/fsl/fsl_rpmsg.c
index abe19a8a7aa7..5c5c04ce9db7 100644
--- a/sound/soc/fsl/fsl_rpmsg.c
+++ b/sound/soc/fsl/fsl_rpmsg.c
@@ -6,8 +6,7 @@
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_address.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/rpmsg.h>
 #include <linux/slab.h>
diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
index 8a9a30dd31e2..79e7c6b98a75 100644
--- a/sound/soc/fsl/fsl_sai.c
+++ b/sound/soc/fsl/fsl_sai.c
@@ -8,8 +8,7 @@
 #include <linux/delay.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_qos.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
index d42cc2f55baa..a63121c888e0 100644
--- a/sound/soc/fsl/fsl_spdif.c
+++ b/sound/soc/fsl/fsl_spdif.c
@@ -12,9 +12,7 @@
 #include <linux/bitrev.h>
 #include <linux/clk.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/pm_runtime.h>
 
diff --git a/sound/soc/fsl/imx-audmux.c b/sound/soc/fsl/imx-audmux.c
index be003a117b39..747ab2f1aae3 100644
--- a/sound/soc/fsl/imx-audmux.c
+++ b/sound/soc/fsl/imx-audmux.c
@@ -13,7 +13,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/sound/soc/fsl/imx-card.c b/sound/soc/fsl/imx-card.c
index f71b3c134001..cb8723965f2f 100644
--- a/sound/soc/fsl/imx-card.c
+++ b/sound/soc/fsl/imx-card.c
@@ -5,9 +5,8 @@
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/i2c.h>
-#include <linux/of_gpio.h>
 #include <linux/clk.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/fsl/imx-rpmsg.c b/sound/soc/fsl/imx-rpmsg.c
index a9324712e3fa..a0c5c35817dd 100644
--- a/sound/soc/fsl/imx-rpmsg.c
+++ b/sound/soc/fsl/imx-rpmsg.c
@@ -2,8 +2,9 @@
 // Copyright 2017-2020 NXP
 
 #include <linux/module.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 #include <linux/of_reserved_mem.h>
+#include <linux/platform_device.h>
 #include <linux/i2c.h>
 #include <linux/of_gpio.h>
 #include <linux/slab.h>
diff --git a/sound/soc/fsl/mpc5200_dma.c b/sound/soc/fsl/mpc5200_dma.c
index 866a533fec83..4b45e24274fa 100644
--- a/sound/soc/fsl/mpc5200_dma.c
+++ b/sound/soc/fsl/mpc5200_dma.c
@@ -7,12 +7,12 @@
 // Copyright (C) 2009 Jon Smirl, Digispeaker
 
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/dma-mapping.h>
 #include <linux/slab.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
 #include <linux/of_irq.h>
-#include <linux/of_platform.h>
+#include <linux/platform_device.h>
 
 #include <sound/soc.h>
 
diff --git a/sound/soc/fsl/mpc5200_psc_ac97.c b/sound/soc/fsl/mpc5200_psc_ac97.c
index 1671bcd4ee3d..0423cf43c7a0 100644
--- a/sound/soc/fsl/mpc5200_psc_ac97.c
+++ b/sound/soc/fsl/mpc5200_psc_ac97.c
@@ -5,9 +5,8 @@
 // Copyright (C) 2009 Jon Smirl, Digispeaker
 // Author: Jon Smirl <jonsmirl@gmail.com>
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/delay.h>
 #include <linux/time.h>
 
diff --git a/sound/soc/fsl/mpc5200_psc_i2s.c b/sound/soc/fsl/mpc5200_psc_i2s.c
index 22bde475e935..af8b9d098d2d 100644
--- a/sound/soc/fsl/mpc5200_psc_i2s.c
+++ b/sound/soc/fsl/mpc5200_psc_i2s.c
@@ -7,8 +7,7 @@
 // Copyright (C) 2009 Jon Smirl, Digispeaker
 
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/fsl/mpc8610_hpcd.c b/sound/soc/fsl/mpc8610_hpcd.c
index a635e08f14ce..52fb9e7bcca4 100644
--- a/sound/soc/fsl/mpc8610_hpcd.c
+++ b/sound/soc/fsl/mpc8610_hpcd.c
@@ -9,8 +9,8 @@
 #include <linux/module.h>
 #include <linux/interrupt.h>
 #include <linux/fsl/guts.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/fsl/p1022_ds.c b/sound/soc/fsl/p1022_ds.c
index db09e8366944..6f5eecf6d88c 100644
--- a/sound/soc/fsl/p1022_ds.c
+++ b/sound/soc/fsl/p1022_ds.c
@@ -9,8 +9,8 @@
 #include <linux/module.h>
 #include <linux/fsl/guts.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/fsl/p1022_rdk.c b/sound/soc/fsl/p1022_rdk.c
index 2d7350204095..18d129c21648 100644
--- a/sound/soc/fsl/p1022_rdk.c
+++ b/sound/soc/fsl/p1022_rdk.c
@@ -16,8 +16,8 @@
 #include <linux/module.h>
 #include <linux/fsl/guts.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/fsl/pcm030-audio-fabric.c b/sound/soc/fsl/pcm030-audio-fabric.c
index d24c02e90878..2bab0fc1de59 100644
--- a/sound/soc/fsl/pcm030-audio-fabric.c
+++ b/sound/soc/fsl/pcm030-audio-fabric.c
@@ -9,8 +9,7 @@
 #include <linux/init.h>
 #include <linux/module.h>
 #include <linux/device.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
+#include <linux/of.h>
 
 #include <sound/soc.h>
 
diff --git a/sound/soc/generic/audio-graph-card.c b/sound/soc/generic/audio-graph-card.c
index e4a9420bba85..704f32bda24d 100644
--- a/sound/soc/generic/audio-graph-card.c
+++ b/sound/soc/generic/audio-graph-card.c
@@ -13,8 +13,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
diff --git a/sound/soc/generic/audio-graph-card2.c b/sound/soc/generic/audio-graph-card2.c
index 5d856942bcae..1344e1adfc67 100644
--- a/sound/soc/generic/audio-graph-card2.c
+++ b/sound/soc/generic/audio-graph-card2.c
@@ -12,8 +12,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/of_graph.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
diff --git a/sound/soc/generic/simple-card.c b/sound/soc/generic/simple-card.c
index b95b86315502..048357ae7ae6 100644
--- a/sound/soc/generic/simple-card.c
+++ b/sound/soc/generic/simple-card.c
@@ -9,7 +9,7 @@
 #include <linux/device.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
+#include <linux/of_platform.h>
 #include <linux/platform_device.h>
 #include <linux/string.h>
 #include <sound/simple_card.h>
diff --git a/sound/soc/generic/test-component.c b/sound/soc/generic/test-component.c
index 8c3eb4424efc..e4967540a2e1 100644
--- a/sound/soc/generic/test-component.c
+++ b/sound/soc/generic/test-component.c
@@ -6,7 +6,7 @@
 // Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
 
 #include <linux/slab.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/module.h>
 #include <linux/workqueue.h>
diff --git a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
index 86885117f7f7..6a17deb874df 100644
--- a/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
+++ b/sound/soc/mediatek/mt2701/mt2701-afe-pcm.c
@@ -12,8 +12,6 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 
 #include "mt2701-afe-common.h"
diff --git a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
index a0b4eeece9b7..acaf81fd6c9b 100644
--- a/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c
@@ -8,7 +8,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
index 1771c26b0445..bb6df056a878 100644
--- a/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
+++ b/sound/soc/mediatek/mt8183/mt8183-mt6358-ts3a227-max98357.c
@@ -7,7 +7,7 @@
 // Author: Shunli Wang <shunli.wang@mediatek.com>
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pinctrl/consumer.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index f795190f92a2..d86dc45be30c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -9,7 +9,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 6be33892be0a..8e216e92c142 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -11,7 +11,7 @@
 #include <linux/gpio/consumer.h>
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/rt5682.h>
diff --git a/sound/soc/mediatek/mt8188/mt8188-mt6359.c b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
index 1564eaa1b290..ed487c14f268 100644
--- a/sound/soc/mediatek/mt8188/mt8188-mt6359.c
+++ b/sound/soc/mediatek/mt8188/mt8188-mt6359.c
@@ -9,7 +9,7 @@
 #include <linux/bitfield.h>
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
index fe3562ea83ce..5bd6addd1450 100644
--- a/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
+++ b/sound/soc/mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c
@@ -9,7 +9,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/mediatek/mt8195/mt8195-mt6359.c b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
index 9138f38861ff..4feb9fb76967 100644
--- a/sound/soc/mediatek/mt8195/mt8195-mt6359.c
+++ b/sound/soc/mediatek/mt8195/mt8195-mt6359.c
@@ -10,7 +10,7 @@
 
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/mxs/mxs-saif.c b/sound/soc/mxs/mxs-saif.c
index ac761d3a01c0..3e3a62df3d7e 100644
--- a/sound/soc/mxs/mxs-saif.c
+++ b/sound/soc/mxs/mxs-saif.c
@@ -6,7 +6,6 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/dma-mapping.h>
diff --git a/sound/soc/mxs/mxs-sgtl5000.c b/sound/soc/mxs/mxs-sgtl5000.c
index 01cb5c5e72fe..310e3ac77424 100644
--- a/sound/soc/mxs/mxs-sgtl5000.c
+++ b/sound/soc/mxs/mxs-sgtl5000.c
@@ -6,7 +6,6 @@
 #include <linux/module.h>
 #include <linux/device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
diff --git a/sound/soc/qcom/apq8096.c b/sound/soc/qcom/apq8096.c
index cddeb47dbcf2..7ee6df02b906 100644
--- a/sound/soc/qcom/apq8096.c
+++ b/sound/soc/qcom/apq8096.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 739856a00017..b799ac724627 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -4,6 +4,7 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
@@ -12,7 +13,6 @@
 #include <sound/pcm.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
 #include <sound/pcm_params.h>
 #include "q6apm.h"
 
diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 5e14cd0a38de..0f4a7523a923 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -5,6 +5,7 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
@@ -14,7 +15,6 @@
 #include <sound/compress_driver.h>
 #include <asm/dma.h>
 #include <linux/dma-mapping.h>
-#include <linux/of_device.h>
 #include <sound/pcm_params.h>
 #include "q6asm.h"
 #include "q6routing.h"
diff --git a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
index 4613867d1133..e758411603be 100644
--- a/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c
@@ -8,7 +8,6 @@
 #include <linux/device.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <dt-bindings/sound/qcom,q6dsp-lpass-ports.h>
 #include "q6dsp-lpass-clocks.h"
diff --git a/sound/soc/qcom/qdsp6/q6routing.c b/sound/soc/qcom/qdsp6/q6routing.c
index c583faae3a3e..5e89930d8dca 100644
--- a/sound/soc/qcom/qdsp6/q6routing.c
+++ b/sound/soc/qcom/qdsp6/q6routing.c
@@ -5,11 +5,10 @@
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/of_platform.h>
 #include <linux/bitops.h>
 #include <linux/mutex.h>
-#include <linux/of_device.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/soc.h>
diff --git a/sound/soc/qcom/sc7180.c b/sound/soc/qcom/sc7180.c
index d1fd40e3f7a9..cf1da775e82b 100644
--- a/sound/soc/qcom/sc7180.c
+++ b/sound/soc/qcom/sc7180.c
@@ -8,7 +8,7 @@
 #include <linux/gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
 #include <sound/jack.h>
diff --git a/sound/soc/qcom/sc7280.c b/sound/soc/qcom/sc7280.c
index c23df4c8f341..f636c0d2ca36 100644
--- a/sound/soc/qcom/sc7280.c
+++ b/sound/soc/qcom/sc7280.c
@@ -5,8 +5,8 @@
 // ALSA SoC Machine driver for sc7280
 
 #include <linux/input.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <sound/core.h>
 #include <sound/jack.h>
diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index cfb9c8dbd599..870d7b69465d 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2022, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/qcom/sdm845.c b/sound/soc/qcom/sdm845.c
index 25b964dea6c5..ad65e45644c3 100644
--- a/sound/soc/qcom/sdm845.c
+++ b/sound/soc/qcom/sdm845.c
@@ -3,9 +3,9 @@
  * Copyright (c) 2018, The Linux Foundation. All rights reserved.
  */
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/qcom/sm8250.c b/sound/soc/qcom/sm8250.c
index 6558bf2e14e8..92350e9cc30e 100644
--- a/sound/soc/qcom/sm8250.c
+++ b/sound/soc/qcom/sm8250.c
@@ -1,9 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2020, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
-#include <linux/of_device.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index d3700f3c98e6..111740166449 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -10,9 +10,7 @@
 #include <linux/delay.h>
 #include <linux/mfd/syscon.h>
 #include <linux/module.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/sound/soc/rockchip/rockchip_max98090.c b/sound/soc/rockchip/rockchip_max98090.c
index 17087b504a37..c4d79de5d1aa 100644
--- a/sound/soc/rockchip/rockchip_max98090.c
+++ b/sound/soc/rockchip/rockchip_max98090.c
@@ -6,11 +6,10 @@
  */
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 #include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <sound/core.h>
 #include <sound/jack.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 4756cfc23218..93048ed937e4 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -8,7 +8,6 @@
 #include <linux/module.h>
 #include <linux/clk.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/rational.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/samsung/aries_wm8994.c b/sound/soc/samsung/aries_wm8994.c
index fa7dd04fe94e..a548ac33dd94 100644
--- a/sound/soc/samsung/aries_wm8994.c
+++ b/sound/soc/samsung/aries_wm8994.c
@@ -5,7 +5,6 @@
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/jack.h>
diff --git a/sound/soc/samsung/arndale.c b/sound/soc/samsung/arndale.c
index 80a57bff1d02..f02873b6ce7f 100644
--- a/sound/soc/samsung/arndale.c
+++ b/sound/soc/samsung/arndale.c
@@ -5,7 +5,7 @@
 //  Author: Claude <claude@insginal.co.kr>
 
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/clk.h>
 
diff --git a/sound/soc/samsung/i2s.c b/sound/soc/samsung/i2s.c
index 0d61055ddc59..9552748aea2e 100644
--- a/sound/soc/samsung/i2s.c
+++ b/sound/soc/samsung/i2s.c
@@ -13,8 +13,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 
 #include <sound/soc.h>
diff --git a/sound/soc/samsung/midas_wm1811.c b/sound/soc/samsung/midas_wm1811.c
index bc4214530e95..f31244156ff6 100644
--- a/sound/soc/samsung/midas_wm1811.c
+++ b/sound/soc/samsung/midas_wm1811.c
@@ -10,8 +10,6 @@
 #include <linux/mfd/wm8994/registers.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
-#include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/jack.h>
 #include <sound/soc.h>
diff --git a/sound/soc/samsung/odroid.c b/sound/soc/samsung/odroid.c
index c59273e2da2a..e95f3d3f0401 100644
--- a/sound/soc/samsung/odroid.c
+++ b/sound/soc/samsung/odroid.c
@@ -5,7 +5,6 @@
 #include <linux/clk.h>
 #include <linux/clk-provider.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/module.h>
 #include <sound/soc.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 13fb1bd7f4c9..271735253425 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -5,7 +5,6 @@
 #include <sound/soc.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 
  /*
   * Default CFG switch settings to use this driver:
diff --git a/sound/soc/samsung/snow.c b/sound/soc/samsung/snow.c
index 7de6acb95701..aad0f9b4d4fc 100644
--- a/sound/soc/samsung/snow.c
+++ b/sound/soc/samsung/snow.c
@@ -6,7 +6,6 @@
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 
diff --git a/sound/soc/sh/fsi.c b/sound/soc/sh/fsi.c
index d0931f4c9976..2ef47aa2c778 100644
--- a/sound/soc/sh/fsi.c
+++ b/sound/soc/sh/fsi.c
@@ -13,7 +13,6 @@
 #include <linux/pm_runtime.h>
 #include <linux/io.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/scatterlist.h>
 #include <linux/sh_dma.h>
 #include <linux/slab.h>
diff --git a/sound/soc/sh/rcar/core.c b/sound/soc/sh/rcar/core.c
index dd256bf7cdd4..0b1aa23c1189 100644
--- a/sound/soc/sh/rcar/core.c
+++ b/sound/soc/sh/rcar/core.c
@@ -91,6 +91,7 @@
  */
 
 #include <linux/pm_runtime.h>
+#include <linux/of_graph.h>
 #include "rsnd.h"
 
 #define RSND_RATES SNDRV_PCM_RATE_8000_192000
diff --git a/sound/soc/sh/rcar/rsnd.h b/sound/soc/sh/rcar/rsnd.h
index 43c0d675cc34..da716b1f52e4 100644
--- a/sound/soc/sh/rcar/rsnd.h
+++ b/sound/soc/sh/rcar/rsnd.h
@@ -14,9 +14,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
-#include <linux/of_graph.h>
-#include <linux/of_irq.h>
+#include <linux/of.h>
 #include <linux/sh_dma.h>
 #include <linux/workqueue.h>
 #include <sound/soc.h>
diff --git a/sound/soc/sh/rcar/src.c b/sound/soc/sh/rcar/src.c
index f832165e46bc..3241a1bdc9ea 100644
--- a/sound/soc/sh/rcar/src.c
+++ b/sound/soc/sh/rcar/src.c
@@ -22,6 +22,7 @@
  * #define RSND_DEBUG_NO_IRQ_STATUS 1
  */
 
+#include <linux/of_irq.h>
 #include "rsnd.h"
 
 #define SRC_NAME "src"
diff --git a/sound/soc/sh/rcar/ssi.c b/sound/soc/sh/rcar/ssi.c
index 690ac0d6ef41..0a46aa1975fa 100644
--- a/sound/soc/sh/rcar/ssi.c
+++ b/sound/soc/sh/rcar/ssi.c
@@ -17,6 +17,8 @@
  */
 
 #include <sound/simple_card_utils.h>
+#include <linux/of.h>
+#include <linux/of_irq.h>
 #include <linux/delay.h>
 #include "rsnd.h"
 #define RSND_SSI_NAME_SIZE 16
diff --git a/sound/soc/sh/rz-ssi.c b/sound/soc/sh/rz-ssi.c
index f5f102d878c7..14cf1a41fb0d 100644
--- a/sound/soc/sh/rz-ssi.c
+++ b/sound/soc/sh/rz-ssi.c
@@ -10,7 +10,6 @@
 #include <linux/dmaengine.h>
 #include <linux/io.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
 #include <sound/soc.h>
diff --git a/sound/soc/sunxi/sun4i-codec.c b/sound/soc/sunxi/sun4i-codec.c
index ad6336cefaea..a2618ed650b0 100644
--- a/sound/soc/sunxi/sun4i-codec.c
+++ b/sound/soc/sunxi/sun4i-codec.c
@@ -15,10 +15,6 @@
 #include <linux/platform_device.h>
 #include <linux/delay.h>
 #include <linux/slab.h>
-#include <linux/of.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
-#include <linux/of_platform.h>
 #include <linux/clk.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
diff --git a/sound/soc/sunxi/sun4i-i2s.c b/sound/soc/sunxi/sun4i-i2s.c
index 5124b6c9ceb4..a736f632bf0b 100644
--- a/sound/soc/sunxi/sun4i-i2s.c
+++ b/sound/soc/sunxi/sun4i-i2s.c
@@ -10,7 +10,7 @@
 #include <linux/clk.h>
 #include <linux/dmaengine.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/sunxi/sun4i-spdif.c b/sound/soc/sunxi/sun4i-spdif.c
index 199cfee41d31..702386823d17 100644
--- a/sound/soc/sunxi/sun4i-spdif.c
+++ b/sound/soc/sunxi/sun4i-spdif.c
@@ -14,8 +14,7 @@
 #include <linux/kernel.h>
 #include <linux/init.h>
 #include <linux/regmap.h>
-#include <linux/of_address.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/ioport.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
diff --git a/sound/soc/sunxi/sun50i-codec-analog.c b/sound/soc/sunxi/sun50i-codec-analog.c
index e1e5e8de0130..8a32d05e23e1 100644
--- a/sound/soc/sunxi/sun50i-codec-analog.c
+++ b/sound/soc/sunxi/sun50i-codec-analog.c
@@ -13,9 +13,8 @@
 
 #include <linux/io.h>
 #include <linux/kernel.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index 3f6fdab75b5f..c76628bc86c6 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -6,7 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
-#include <linux/of_device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
diff --git a/sound/soc/sunxi/sun8i-codec-analog.c b/sound/soc/sunxi/sun8i-codec-analog.c
index be872eefa61e..445b34141896 100644
--- a/sound/soc/sunxi/sun8i-codec-analog.c
+++ b/sound/soc/sunxi/sun8i-codec-analog.c
@@ -10,7 +10,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 
diff --git a/sound/soc/sunxi/sun8i-codec.c b/sound/soc/sunxi/sun8i-codec.c
index 4c0d0d7d3e58..7b45ddffe990 100644
--- a/sound/soc/sunxi/sun8i-codec.c
+++ b/sound/soc/sunxi/sun8i-codec.c
@@ -13,7 +13,7 @@
 #include <linux/delay.h>
 #include <linux/clk.h>
 #include <linux/io.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/log2.h>
diff --git a/sound/soc/tegra/tegra186_asrc.c b/sound/soc/tegra/tegra186_asrc.c
index 208e2fcefcf2..22af5135d77a 100644
--- a/sound/soc/tegra/tegra186_asrc.c
+++ b/sound/soc/tegra/tegra186_asrc.c
@@ -8,9 +8,8 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra186_dspk.c b/sound/soc/tegra/tegra186_dspk.c
index a0ce7eb11de9..aa37c4ab0adb 100644
--- a/sound/soc/tegra/tegra186_dspk.c
+++ b/sound/soc/tegra/tegra186_dspk.c
@@ -6,9 +6,9 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra20_spdif.c b/sound/soc/tegra/tegra20_spdif.c
index b0670aa4d967..380011233eb1 100644
--- a/sound/soc/tegra/tegra20_spdif.c
+++ b/sound/soc/tegra/tegra20_spdif.c
@@ -10,8 +10,8 @@
 #include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 7d003f0c8d0f..d2530443a221 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -7,9 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 179876949b30..95816f6007bd 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -7,9 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_dmic.c b/sound/soc/tegra/tegra210_dmic.c
index 763b206cd52b..e53c0278ae9a 100644
--- a/sound/soc/tegra/tegra210_dmic.c
+++ b/sound/soc/tegra/tegra210_dmic.c
@@ -7,8 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/math64.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_i2s.c b/sound/soc/tegra/tegra210_i2s.c
index 21724cd3525e..ba7fdd7405ac 100644
--- a/sound/soc/tegra/tegra210_i2s.c
+++ b/sound/soc/tegra/tegra210_i2s.c
@@ -6,8 +6,8 @@
 
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_mixer.c b/sound/soc/tegra/tegra210_mixer.c
index 035e9035b533..024614f6ec0b 100644
--- a/sound/soc/tegra/tegra210_mixer.c
+++ b/sound/soc/tegra/tegra210_mixer.c
@@ -7,9 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_mvc.c b/sound/soc/tegra/tegra210_mvc.c
index 44f465e11bee..b89f5edafa03 100644
--- a/sound/soc/tegra/tegra210_mvc.c
+++ b/sound/soc/tegra/tegra210_mvc.c
@@ -7,9 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_ope.c b/sound/soc/tegra/tegra210_ope.c
index 98e726432615..136ed17f3650 100644
--- a/sound/soc/tegra/tegra210_ope.c
+++ b/sound/soc/tegra/tegra210_ope.c
@@ -7,9 +7,8 @@
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/io.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_peq.c b/sound/soc/tegra/tegra210_peq.c
index 205d956abb42..bd8007cc49e1 100644
--- a/sound/soc/tegra/tegra210_peq.c
+++ b/sound/soc/tegra/tegra210_peq.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra210_sfc.c b/sound/soc/tegra/tegra210_sfc.c
index c2240babd601..028747c44f37 100644
--- a/sound/soc/tegra/tegra210_sfc.c
+++ b/sound/soc/tegra/tegra210_sfc.c
@@ -9,7 +9,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index 81eaece51130..a8ff51d12edb 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -19,7 +19,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 0e75c6d5c0c5..3caadee9584f 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -8,7 +8,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index 27e9f41188b4..8b48813c2c59 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -6,7 +6,7 @@
 
 #include <linux/math64.h>
 #include <linux/module.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <sound/graph_card.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/ti/omap-dmic.c b/sound/soc/ti/omap-dmic.c
index 5b5eccf303ab..fb92bb88eb5c 100644
--- a/sound/soc/ti/omap-dmic.c
+++ b/sound/soc/ti/omap-dmic.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/err.h>
@@ -18,7 +19,6 @@
 #include <linux/io.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/ti/omap-mcpdm.c b/sound/soc/ti/omap-mcpdm.c
index 2b97f2e4f185..1a5d19937c64 100644
--- a/sound/soc/ti/omap-mcpdm.c
+++ b/sound/soc/ti/omap-mcpdm.c
@@ -11,6 +11,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
 #include <linux/interrupt.h>
@@ -19,7 +20,6 @@
 #include <linux/irq.h>
 #include <linux/slab.h>
 #include <linux/pm_runtime.h>
-#include <linux/of_device.h>
 
 #include <sound/core.h>
 #include <sound/pcm.h>

-- 
2.40.1

