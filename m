Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C757B6ED1
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:44:39 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RWfbPtUb;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Nvn6Jcbz3d81
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:44:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=RWfbPtUb;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:40e1:4800::1; helo=sin.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Ntt46hpz3c1L
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:43:50 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA5BCCE18AE;
	Tue,  3 Oct 2023 16:43:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3198AC433C7;
	Tue,  3 Oct 2023 16:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696351426;
	bh=vzJyPQ4la8Uva0RyTDQxJAb+vC82s0238Vy1+sHxYfg=;
	h=From:Subject:Date:To:Cc:From;
	b=RWfbPtUbaUJ53FD7x1A5dQyb31S7x2QWv7GtESKU5XA/BIRsowCC67bc0OkP1I1nA
	 3uJH+nTg9xws9EYU4HrtDe4zwCElJzjBAHcwyMk28aZbTEHaescEPyKsVO+BOUHDLb
	 xRkSACHDz9zvn57Iyy9oOrXbwL7yJE9Koa0c1nsHVwGHi2zbGSZGtCYhWvLM0Wr6r3
	 Us+/QKfvgZ4qIvhMksh+c/N2I89qgr/tAUofIGP/u0vUzUB+SeK1iUQdsrI6cBChlz
	 ciiozEBQnACRZQQ1ThEVZus/FxpoGKQadLwpCOKQ2/7G/AaWITqmKZXCZeSdX8INN6
	 PfEuWWXddZFeA==
Received: (nullmailer pid 783956 invoked by uid 1000);
	Tue, 03 Oct 2023 16:43:40 -0000
From: Rob Herring <robh@kernel.org>
Subject: [PATCH 0/5] ASoC: DT matching and header cleanups
Date: Tue, 03 Oct 2023 11:43:06 -0500
Message-Id: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJpEHGUC/x2N0QrCMAwAf2Xk2UDXMRR/RXzI0tQWSjYaJ8LYv
 xt8vIPjDjDpVQzuwwFdPtXqqg7jZQAupC/BmpwhhjiNIUyY3ki2MhahJB25Cem+Gd6uOXKeKcY
 wg9cLmeDSSbl4r3trLrcuuX7/u8fzPH+HQfwNfgAAAA==
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

This is a series is part of ongoing clean-ups related to device 
matching and DT related implicit includes. Essentially of_device.h has 
a bunch of implicit includes and generally isn't needed any nore except 
for of_match_device(). As we also generally want to get rid of 
of_match_device() as well, I've done that so we're not updating the 
includes twice.

Signed-off-by: Rob Herring <robh@kernel.org>
---
Rob Herring (5):
      ASoC: Explicitly include correct DT includes
      ASoC: Drop unnecessary of_match_device() calls
      ASoC: da7218: Use i2c_get_match_data()
      ASoC: qcom/lpass: Constify struct lpass_variant
      ASoC: Use device_get_match_data()

 sound/soc/atmel/atmel_wm8904.c                     |  1 -
 sound/soc/atmel/mchp-i2s-mcc.c                     |  2 +-
 sound/soc/atmel/tse850-pcm5142.c                   |  1 -
 sound/soc/bcm/cygnus-ssp.c                         |  2 +-
 sound/soc/codecs/adau1701.c                        |  1 -
 sound/soc/codecs/adau1977-spi.c                    |  1 -
 sound/soc/codecs/ak4104.c                          |  2 +-
 sound/soc/codecs/ak4118.c                          |  2 +-
 sound/soc/codecs/ak4375.c                          |  2 +-
 sound/soc/codecs/ak4458.c                          |  2 +-
 sound/soc/codecs/ak4613.c                          |  2 +-
 sound/soc/codecs/ak4642.c                          |  2 +-
 sound/soc/codecs/ak5386.c                          |  7 +---
 sound/soc/codecs/ak5558.c                          |  2 +-
 sound/soc/codecs/cs35l32.c                         |  2 +-
 sound/soc/codecs/cs35l33.c                         |  2 -
 sound/soc/codecs/cs35l34.c                         |  2 +-
 sound/soc/codecs/cs35l35.c                         |  3 +-
 sound/soc/codecs/cs35l36.c                         |  3 +-
 sound/soc/codecs/cs35l41-i2c.c                     |  2 +-
 sound/soc/codecs/cs35l41.c                         |  1 -
 sound/soc/codecs/cs4270.c                          |  2 +-
 sound/soc/codecs/cs4271.c                          | 22 +++--------
 sound/soc/codecs/cs42l42.c                         |  1 -
 sound/soc/codecs/cs42l56.c                         |  2 +-
 sound/soc/codecs/cs42xx8-i2c.c                     |  2 +-
 sound/soc/codecs/cs43130.c                         |  3 +-
 sound/soc/codecs/cs4349.c                          |  2 +-
 sound/soc/codecs/da7213.c                          |  2 +-
 sound/soc/codecs/da7218.c                          | 29 +--------------
 sound/soc/codecs/da7218.h                          |  2 +-
 sound/soc/codecs/da7219.c                          |  2 +-
 sound/soc/codecs/da9055.c                          |  1 -
 sound/soc/codecs/es8328.c                          |  1 -
 sound/soc/codecs/gtm601.c                          |  2 +-
 sound/soc/codecs/lpass-macro-common.c              |  2 +-
 sound/soc/codecs/mt6351.c                          |  2 +-
 sound/soc/codecs/mt6358.c                          |  2 +-
 sound/soc/codecs/mt6359-accdet.c                   |  4 --
 sound/soc/codecs/mt6359.c                          |  2 +-
 sound/soc/codecs/nau8540.c                         |  2 +-
 sound/soc/codecs/pcm1681.c                         |  2 -
 sound/soc/codecs/rt715.c                           |  2 -
 sound/soc/codecs/sgtl5000.c                        |  2 +-
 sound/soc/codecs/sma1303.c                         |  2 +-
 sound/soc/codecs/sta32x.c                          |  3 +-
 sound/soc/codecs/sta350.c                          |  3 +-
 sound/soc/codecs/tas5086.c                         |  6 +--
 sound/soc/codecs/tas571x.c                         |  2 +-
 sound/soc/codecs/uda1334.c                         |  2 +-
 sound/soc/codecs/wm8510.c                          |  2 +-
 sound/soc/codecs/wm8523.c                          |  2 +-
 sound/soc/codecs/wm8524.c                          |  2 +-
 sound/soc/codecs/wm8580.c                          |  2 +-
 sound/soc/codecs/wm8711.c                          |  2 +-
 sound/soc/codecs/wm8728.c                          |  2 +-
 sound/soc/codecs/wm8731-i2c.c                      |  2 +-
 sound/soc/codecs/wm8731-spi.c                      |  2 +-
 sound/soc/codecs/wm8737.c                          |  2 +-
 sound/soc/codecs/wm8741.c                          |  2 +-
 sound/soc/codecs/wm8750.c                          |  2 +-
 sound/soc/codecs/wm8753.c                          |  2 +-
 sound/soc/codecs/wm8770.c                          |  2 +-
 sound/soc/codecs/wm8776.c                          |  2 +-
 sound/soc/codecs/wm8804.c                          |  1 -
 sound/soc/fsl/efika-audio-fabric.c                 |  4 +-
 sound/soc/fsl/fsl_aud2htx.c                        |  3 +-
 sound/soc/fsl/fsl_mqs.c                            |  2 +-
 sound/soc/fsl/fsl_rpmsg.c                          |  3 +-
 sound/soc/fsl/fsl_sai.c                            |  3 +-
 sound/soc/fsl/fsl_spdif.c                          |  4 +-
 sound/soc/fsl/imx-audmux.c                         |  1 -
 sound/soc/fsl/imx-card.c                           |  3 +-
 sound/soc/fsl/imx-rpmsg.c                          |  3 +-
 sound/soc/fsl/mpc5200_dma.c                        |  4 +-
 sound/soc/fsl/mpc5200_psc_ac97.c                   |  3 +-
 sound/soc/fsl/mpc5200_psc_i2s.c                    |  3 +-
 sound/soc/fsl/mpc8610_hpcd.c                       |  2 +-
 sound/soc/fsl/p1022_ds.c                           |  2 +-
 sound/soc/fsl/p1022_rdk.c                          |  2 +-
 sound/soc/fsl/pcm030-audio-fabric.c                |  3 +-
 sound/soc/generic/audio-graph-card.c               |  2 -
 sound/soc/generic/audio-graph-card2.c              |  2 -
 sound/soc/generic/simple-card.c                    |  2 +-
 sound/soc/generic/test-component.c                 |  2 +-
 sound/soc/intel/keembay/kmb_platform.c             | 13 +------
 sound/soc/mediatek/mt2701/mt2701-afe-pcm.c         |  2 -
 sound/soc/mediatek/mt8183/mt8183-da7219-max98357.c |  2 +-
 .../mt8183/mt8183-mt6358-ts3a227-max98357.c        |  2 +-
 .../mt8186/mt8186-mt6366-da7219-max98357.c         |  2 +-
 .../mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c |  2 +-
 sound/soc/mediatek/mt8188/mt8188-mt6359.c          |  2 +-
 .../mediatek/mt8192/mt8192-mt6359-rt1015-rt5682.c  |  2 +-
 sound/soc/mediatek/mt8195/mt8195-mt6359.c          |  2 +-
 sound/soc/mxs/mxs-saif.c                           |  1 -
 sound/soc/mxs/mxs-sgtl5000.c                       |  1 -
 sound/soc/qcom/apq8096.c                           |  2 +-
 sound/soc/qcom/lpass-apq8016.c                     |  6 +--
 sound/soc/qcom/lpass-cdc-dma.c                     |  2 +-
 sound/soc/qcom/lpass-cpu.c                         | 43 ++++++++++------------
 sound/soc/qcom/lpass-ipq806x.c                     |  2 +-
 sound/soc/qcom/lpass-platform.c                    | 36 +++++++++---------
 sound/soc/qcom/lpass-sc7180.c                      |  6 +--
 sound/soc/qcom/lpass-sc7280.c                      |  6 +--
 sound/soc/qcom/lpass.h                             |  2 +-
 sound/soc/qcom/qdsp6/q6apm-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6asm-dai.c                   |  2 +-
 sound/soc/qcom/qdsp6/q6dsp-lpass-clocks.c          |  1 -
 sound/soc/qcom/qdsp6/q6routing.c                   |  3 +-
 sound/soc/qcom/sc7180.c                            |  2 +-
 sound/soc/qcom/sc7280.c                            |  2 +-
 sound/soc/qcom/sc8280xp.c                          |  2 +-
 sound/soc/qcom/sdm845.c                            |  2 +-
 sound/soc/qcom/sm8250.c                            |  2 +-
 sound/soc/rockchip/rockchip_i2s.c                  |  8 ++--
 sound/soc/rockchip/rockchip_i2s_tdm.c              | 24 ++++--------
 sound/soc/rockchip/rockchip_max98090.c             |  3 +-
 sound/soc/rockchip/rockchip_pdm.c                  |  7 +---
 sound/soc/samsung/aries_wm8994.c                   |  1 -
 sound/soc/samsung/arndale.c                        |  2 +-
 sound/soc/samsung/i2s.c                            |  2 -
 sound/soc/samsung/midas_wm1811.c                   |  2 -
 sound/soc/samsung/odroid.c                         |  1 -
 sound/soc/samsung/smdk_wm8994.c                    | 28 ++------------
 sound/soc/samsung/snow.c                           |  1 -
 sound/soc/sh/fsi.c                                 |  1 -
 sound/soc/sh/rcar/core.c                           |  1 +
 sound/soc/sh/rcar/rsnd.h                           |  4 +-
 sound/soc/sh/rcar/src.c                            |  1 +
 sound/soc/sh/rcar/ssi.c                            |  2 +
 sound/soc/sh/rz-ssi.c                              |  1 -
 sound/soc/stm/stm32_i2s.c                          |  7 +---
 sound/soc/stm/stm32_sai.c                          |  8 ++--
 sound/soc/stm/stm32_sai_sub.c                      |  6 +--
 sound/soc/stm/stm32_spdifrx.c                      |  8 +---
 sound/soc/sunxi/sun4i-codec.c                      |  4 --
 sound/soc/sunxi/sun4i-i2s.c                        |  2 +-
 sound/soc/sunxi/sun4i-spdif.c                      |  3 +-
 sound/soc/sunxi/sun50i-codec-analog.c              |  3 +-
 sound/soc/sunxi/sun50i-dmic.c                      |  2 +-
 sound/soc/sunxi/sun8i-codec-analog.c               |  1 -
 sound/soc/sunxi/sun8i-codec.c                      |  2 +-
 sound/soc/tegra/tegra186_asrc.c                    |  3 +-
 sound/soc/tegra/tegra186_dspk.c                    |  2 +-
 sound/soc/tegra/tegra20_spdif.c                    |  2 +-
 sound/soc/tegra/tegra210_adx.c                     |  3 +-
 sound/soc/tegra/tegra210_amx.c                     | 10 +----
 sound/soc/tegra/tegra210_dmic.c                    |  2 +-
 sound/soc/tegra/tegra210_i2s.c                     |  2 +-
 sound/soc/tegra/tegra210_mixer.c                   |  3 +-
 sound/soc/tegra/tegra210_mvc.c                     |  3 +-
 sound/soc/tegra/tegra210_ope.c                     |  3 +-
 sound/soc/tegra/tegra210_peq.c                     |  1 -
 sound/soc/tegra/tegra210_sfc.c                     |  1 -
 sound/soc/tegra/tegra30_i2s.c                      |  1 -
 sound/soc/tegra/tegra_asoc_machine.c               |  1 -
 sound/soc/tegra/tegra_audio_graph_card.c           |  2 +-
 sound/soc/ti/davinci-evm.c                         |  7 +---
 sound/soc/ti/davinci-mcasp.c                       |  9 ++---
 sound/soc/ti/omap-dmic.c                           |  2 +-
 sound/soc/ti/omap-mcbsp.c                          | 10 ++---
 sound/soc/ti/omap-mcpdm.c                          |  2 +-
 162 files changed, 205 insertions(+), 390 deletions(-)
---
base-commit: c9f2baaa18b5ea8f006a2b3a616da9597c71d15e
change-id: 20231003-dt-asoc-header-cleanups-87f2cf5a2205

Best regards,
-- 
Rob Herring <robh@kernel.org>

