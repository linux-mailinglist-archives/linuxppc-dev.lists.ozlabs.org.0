Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AF58F7B6ED5
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:45:29 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRzVJ8q6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Nwl4Jrwz3vYc
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:45:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=pRzVJ8q6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0Nv26bS0z3cL0
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:43:58 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 00B45B8189E;
	Tue,  3 Oct 2023 16:43:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38FF8C433CB;
	Tue,  3 Oct 2023 16:43:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696351434;
	bh=udaKZLIi1CYObfyyh2v53zS71KdRSemhW+CCyu9kXBA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pRzVJ8q6Rb5uiqU+dnQJEpdNWgphcVDvSeQQcUOR2iixRAyI5OtOF6tmz8muII4kC
	 XyYnU71T03jKBiE/bFUeb64Z3oGsYQoj8Vg1yae94aBeVClHI247g0b/ivMNvRv7R5
	 OQ6Mt9hZDfx9ryBBXvAOruH/M+sXm4QJPR7F1dgCch5Y8opvwr9qnVfE0CtQO1WEjA
	 mMFDzi5vdxueFwNglRpwtRlE1bVGTL3tZGcrveOlGW+vx7N0CaOwaIah2K6iXz8XPo
	 MSbJWu5TQuX/YuP7M8A/Ece2v/V+7NRk7SygsZapKn4gjwrKCAAankcMKOHcRYV9zv
	 eX1li6P/M7+xg==
Received: (nullmailer pid 783967 invoked by uid 1000);
	Tue, 03 Oct 2023 16:43:40 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 03 Oct 2023 11:43:11 -0500
Subject: [PATCH 5/5] ASoC: Use device_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-dt-asoc-header-cleanups-v1-5-308666806378@kernel.org>
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

Use preferred device_get_match_data() instead of of_match_device() to
get the driver match data. With this, adjust the includes to explicitly
include the correct headers.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/intel/keembay/kmb_platform.c | 13 +------------
 sound/soc/qcom/lpass-cpu.c             | 15 +++++----------
 sound/soc/rockchip/rockchip_i2s.c      |  8 +++-----
 sound/soc/rockchip/rockchip_i2s_tdm.c  | 20 +++++++-------------
 sound/soc/rockchip/rockchip_pdm.c      |  6 +-----
 sound/soc/samsung/smdk_wm8994.c        | 27 +++------------------------
 sound/soc/stm/stm32_i2s.c              |  7 ++-----
 sound/soc/stm/stm32_sai.c              |  8 ++++----
 sound/soc/stm/stm32_sai_sub.c          |  6 +-----
 sound/soc/stm/stm32_spdifrx.c          |  8 ++------
 sound/soc/tegra/tegra210_amx.c         |  7 +------
 sound/soc/ti/davinci-evm.c             |  7 ++-----
 sound/soc/ti/davinci-mcasp.c           |  9 ++++-----
 sound/soc/ti/omap-mcbsp.c              | 10 ++++------
 14 files changed, 40 insertions(+), 111 deletions(-)

diff --git a/sound/soc/intel/keembay/kmb_platform.c b/sound/soc/intel/keembay/kmb_platform.c
index e929497a5eb5..37ea2e1d2e92 100644
--- a/sound/soc/intel/keembay/kmb_platform.c
+++ b/sound/soc/intel/keembay/kmb_platform.c
@@ -11,7 +11,6 @@
 #include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/dmaengine_pcm.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -820,7 +819,6 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_dai_driver *kmb_i2s_dai;
-	const struct of_device_id *match;
 	struct device *dev = &pdev->dev;
 	struct kmb_i2s_info *kmb_i2s;
 	struct resource *res;
@@ -831,16 +829,7 @@ static int kmb_plat_dai_probe(struct platform_device *pdev)
 	if (!kmb_i2s)
 		return -ENOMEM;
 
-	kmb_i2s_dai = devm_kzalloc(dev, sizeof(*kmb_i2s_dai), GFP_KERNEL);
-	if (!kmb_i2s_dai)
-		return -ENOMEM;
-
-	match = of_match_device(kmb_plat_of_match, &pdev->dev);
-	if (!match) {
-		dev_err(&pdev->dev, "Error: No device match found\n");
-		return -ENODEV;
-	}
-	kmb_i2s_dai = (struct snd_soc_dai_driver *) match->data;
+	kmb_i2s_dai = (struct snd_soc_dai_driver *)device_get_match_data(&pdev->dev);
 
 	/* Prepare the related clocks */
 	kmb_i2s->clk_apb = devm_clk_get(dev, "apb_clk");
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 18aff2654f89..ac0feb89b458 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -9,7 +9,6 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/platform_device.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1106,7 +1105,6 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	struct resource *res;
 	const struct lpass_variant *variant;
 	struct device *dev = &pdev->dev;
-	const struct of_device_id *match;
 	int ret, i, dai_id;
 
 	dsp_of_node = of_parse_phandle(pdev->dev.of_node, "qcom,adsp", 0);
@@ -1121,17 +1119,14 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	platform_set_drvdata(pdev, drvdata);
 
-	match = of_match_device(dev->driver->of_match_table, dev);
-	if (!match || !match->data)
+	variant = device_get_match_data(dev);
+	if (!variant)
 		return -EINVAL;
 
-	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016")) {
-		dev_warn(dev, "%s compatible is deprecated\n",
-			 match->compatible);
-	}
+	if (of_device_is_compatible(dev->of_node, "qcom,lpass-cpu-apq8016"))
+		dev_warn(dev, "qcom,lpass-cpu-apq8016 compatible is deprecated\n");
 
-	drvdata->variant = (struct lpass_variant *)match->data;
-	variant = drvdata->variant;
+	drvdata->variant = variant;
 
 	of_lpass_cpu_parse_dai_data(dev, drvdata);
 
diff --git a/sound/soc/rockchip/rockchip_i2s.c b/sound/soc/rockchip/rockchip_i2s.c
index 74e7d6ee0f28..b0c3ef030e06 100644
--- a/sound/soc/rockchip/rockchip_i2s.c
+++ b/sound/soc/rockchip/rockchip_i2s.c
@@ -10,8 +10,8 @@
 #include <linux/module.h>
 #include <linux/mfd/syscon.h>
 #include <linux/delay.h>
+#include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_device.h>
 #include <linux/clk.h>
 #include <linux/pinctrl/consumer.h>
 #include <linux/pm_runtime.h>
@@ -736,7 +736,6 @@ static int rockchip_i2s_init_dai(struct rk_i2s_dev *i2s, struct resource *res,
 static int rockchip_i2s_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	struct rk_i2s_dev *i2s;
 	struct snd_soc_dai_driver *dai;
 	struct resource *res;
@@ -752,11 +751,10 @@ static int rockchip_i2s_probe(struct platform_device *pdev)
 
 	i2s->grf = syscon_regmap_lookup_by_phandle(node, "rockchip,grf");
 	if (!IS_ERR(i2s->grf)) {
-		of_id = of_match_device(rockchip_i2s_match, &pdev->dev);
-		if (!of_id || !of_id->data)
+		i2s->pins = device_get_match_data(&pdev->dev);
+		if (!i2s->pins)
 			return -EINVAL;
 
-		i2s->pins = of_id->data;
 	}
 
 	/* try to prepare related clocks */
diff --git a/sound/soc/rockchip/rockchip_i2s_tdm.c b/sound/soc/rockchip/rockchip_i2s_tdm.c
index 111740166449..7e996550d1df 100644
--- a/sound/soc/rockchip/rockchip_i2s_tdm.c
+++ b/sound/soc/rockchip/rockchip_i2s_tdm.c
@@ -73,7 +73,7 @@ struct rk_i2s_tdm_dev {
 	struct snd_dmaengine_dai_dma_data playback_dma_data;
 	struct reset_control *tx_reset;
 	struct reset_control *rx_reset;
-	struct rk_i2s_soc_data *soc_data;
+	const struct rk_i2s_soc_data *soc_data;
 	bool is_master_mode;
 	bool io_multiplex;
 	bool mclk_calibrate;
@@ -1275,21 +1275,21 @@ static const struct txrx_config rv1126_txrx_config[] = {
 	{ 0xff800000, 0x10260, RV1126_I2S0_CLK_TXONLY, RV1126_I2S0_CLK_RXONLY },
 };
 
-static struct rk_i2s_soc_data px30_i2s_soc_data = {
+static const struct rk_i2s_soc_data px30_i2s_soc_data = {
 	.softrst_offset = 0x0300,
 	.configs = px30_txrx_config,
 	.config_count = ARRAY_SIZE(px30_txrx_config),
 	.init = common_soc_init,
 };
 
-static struct rk_i2s_soc_data rk1808_i2s_soc_data = {
+static const struct rk_i2s_soc_data rk1808_i2s_soc_data = {
 	.softrst_offset = 0x0300,
 	.configs = rk1808_txrx_config,
 	.config_count = ARRAY_SIZE(rk1808_txrx_config),
 	.init = common_soc_init,
 };
 
-static struct rk_i2s_soc_data rk3308_i2s_soc_data = {
+static const struct rk_i2s_soc_data rk3308_i2s_soc_data = {
 	.softrst_offset = 0x0400,
 	.grf_reg_offset = 0x0308,
 	.grf_shift = 5,
@@ -1298,14 +1298,14 @@ static struct rk_i2s_soc_data rk3308_i2s_soc_data = {
 	.init = common_soc_init,
 };
 
-static struct rk_i2s_soc_data rk3568_i2s_soc_data = {
+static const struct rk_i2s_soc_data rk3568_i2s_soc_data = {
 	.softrst_offset = 0x0400,
 	.configs = rk3568_txrx_config,
 	.config_count = ARRAY_SIZE(rk3568_txrx_config),
 	.init = common_soc_init,
 };
 
-static struct rk_i2s_soc_data rv1126_i2s_soc_data = {
+static const struct rk_i2s_soc_data rv1126_i2s_soc_data = {
 	.softrst_offset = 0x0300,
 	.configs = rv1126_txrx_config,
 	.config_count = ARRAY_SIZE(rv1126_txrx_config),
@@ -1542,7 +1542,6 @@ static int rockchip_i2s_tdm_rx_path_prepare(struct rk_i2s_tdm_dev *i2s_tdm,
 static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	struct rk_i2s_tdm_dev *i2s_tdm;
 	struct resource *res;
 	void __iomem *regs;
@@ -1554,13 +1553,8 @@ static int rockchip_i2s_tdm_probe(struct platform_device *pdev)
 
 	i2s_tdm->dev = &pdev->dev;
 
-	of_id = of_match_device(rockchip_i2s_tdm_match, &pdev->dev);
-	if (!of_id)
-		return -EINVAL;
-
 	spin_lock_init(&i2s_tdm->lock);
-	i2s_tdm->soc_data = (struct rk_i2s_soc_data *)of_id->data;
-
+	i2s_tdm->soc_data = device_get_match_data(&pdev->dev);
 	i2s_tdm->frame_width = 64;
 
 	i2s_tdm->clk_trcm = TRCM_TXRX;
diff --git a/sound/soc/rockchip/rockchip_pdm.c b/sound/soc/rockchip/rockchip_pdm.c
index 93048ed937e4..d16a4a67a6a2 100644
--- a/sound/soc/rockchip/rockchip_pdm.c
+++ b/sound/soc/rockchip/rockchip_pdm.c
@@ -571,7 +571,6 @@ static int rockchip_pdm_path_parse(struct rk_pdm_dev *pdm, struct device_node *n
 static int rockchip_pdm_probe(struct platform_device *pdev)
 {
 	struct device_node *node = pdev->dev.of_node;
-	const struct of_device_id *match;
 	struct rk_pdm_dev *pdm;
 	struct resource *res;
 	void __iomem *regs;
@@ -581,10 +580,7 @@ static int rockchip_pdm_probe(struct platform_device *pdev)
 	if (!pdm)
 		return -ENOMEM;
 
-	match = of_match_device(rockchip_pdm_match, &pdev->dev);
-	if (match)
-		pdm->version = (uintptr_t)match->data;
-
+	pdm->version = (enum rk_pdm_version)device_get_match_data(&pdev->dev);
 	if (pdm->version == RK_PDM_RK3308) {
 		pdm->reset = devm_reset_control_get(&pdev->dev, "pdm-m");
 		if (IS_ERR(pdm->reset))
diff --git a/sound/soc/samsung/smdk_wm8994.c b/sound/soc/samsung/smdk_wm8994.c
index 271735253425..def92cc09f9c 100644
--- a/sound/soc/samsung/smdk_wm8994.c
+++ b/sound/soc/samsung/smdk_wm8994.c
@@ -31,15 +31,6 @@
 /* SMDK has a 16.934MHZ crystal attached to WM8994 */
 #define SMDK_WM8994_FREQ 16934000
 
-struct smdk_wm8994_data {
-	int mclk1_rate;
-};
-
-/* Default SMDKs */
-static struct smdk_wm8994_data smdk_board_data = {
-	.mclk1_rate = SMDK_WM8994_FREQ,
-};
-
 static int smdk_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params)
 {
@@ -135,8 +126,8 @@ static struct snd_soc_card smdk = {
 	.num_links = ARRAY_SIZE(smdk_dai),
 };
 
-static const struct of_device_id samsung_wm8994_of_match[] __maybe_unused = {
-	{ .compatible = "samsung,smdk-wm8994", .data = &smdk_board_data },
+static const struct of_device_id samsung_wm8994_of_match[] = {
+	{ .compatible = "samsung,smdk-wm8994" },
 	{},
 };
 MODULE_DEVICE_TABLE(of, samsung_wm8994_of_match);
@@ -146,15 +137,9 @@ static int smdk_audio_probe(struct platform_device *pdev)
 	int ret;
 	struct device_node *np = pdev->dev.of_node;
 	struct snd_soc_card *card = &smdk;
-	struct smdk_wm8994_data *board;
-	const struct of_device_id *id;
 
 	card->dev = &pdev->dev;
 
-	board = devm_kzalloc(&pdev->dev, sizeof(*board), GFP_KERNEL);
-	if (!board)
-		return -ENOMEM;
-
 	if (np) {
 		smdk_dai[0].cpus->dai_name = NULL;
 		smdk_dai[0].cpus->of_node = of_parse_phandle(np,
@@ -170,12 +155,6 @@ static int smdk_audio_probe(struct platform_device *pdev)
 		smdk_dai[0].platforms->of_node = smdk_dai[0].cpus->of_node;
 	}
 
-	id = of_match_device(samsung_wm8994_of_match, &pdev->dev);
-	if (id)
-		*board = *((struct smdk_wm8994_data *)id->data);
-
-	platform_set_drvdata(pdev, board);
-
 	ret = devm_snd_soc_register_card(&pdev->dev, card);
 
 	if (ret)
@@ -187,7 +166,7 @@ static int smdk_audio_probe(struct platform_device *pdev)
 static struct platform_driver smdk_audio_driver = {
 	.driver		= {
 		.name	= "smdk-audio-wm8994",
-		.of_match_table = of_match_ptr(samsung_wm8994_of_match),
+		.of_match_table = samsung_wm8994_of_match,
 		.pm	= &snd_soc_pm_ops,
 	},
 	.probe		= smdk_audio_probe,
diff --git a/sound/soc/stm/stm32_i2s.c b/sound/soc/stm/stm32_i2s.c
index 06a42130f5e4..46098e111142 100644
--- a/sound/soc/stm/stm32_i2s.c
+++ b/sound/soc/stm/stm32_i2s.c
@@ -1024,7 +1024,6 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 			      struct stm32_i2s_data *i2s)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	struct reset_control *rst;
 	struct resource *res;
 	int irq, ret;
@@ -1032,10 +1031,8 @@ static int stm32_i2s_parse_dt(struct platform_device *pdev,
 	if (!np)
 		return -ENODEV;
 
-	of_id = of_match_device(stm32_i2s_ids, &pdev->dev);
-	if (of_id)
-		i2s->regmap_conf = (const struct regmap_config *)of_id->data;
-	else
+	i2s->regmap_conf = device_get_match_data(&pdev->dev);
+	if (!i2s->regmap_conf)
 		return -EINVAL;
 
 	i2s->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
diff --git a/sound/soc/stm/stm32_sai.c b/sound/soc/stm/stm32_sai.c
index 8e21e6f886fc..b45ee7e24f22 100644
--- a/sound/soc/stm/stm32_sai.c
+++ b/sound/soc/stm/stm32_sai.c
@@ -151,8 +151,8 @@ static int stm32_sai_set_sync(struct stm32_sai_data *sai_client,
 static int stm32_sai_probe(struct platform_device *pdev)
 {
 	struct stm32_sai_data *sai;
+	const struct stm32_sai_conf *conf;
 	struct reset_control *rst;
-	const struct of_device_id *of_id;
 	u32 val;
 	int ret;
 
@@ -164,9 +164,9 @@ static int stm32_sai_probe(struct platform_device *pdev)
 	if (IS_ERR(sai->base))
 		return PTR_ERR(sai->base);
 
-	of_id = of_match_device(stm32_sai_ids, &pdev->dev);
-	if (of_id)
-		memcpy(&sai->conf, (const struct stm32_sai_conf *)of_id->data,
+	conf = device_get_match_data(&pdev->dev);
+	if (conf)
+		memcpy(&sai->conf, (const struct stm32_sai_conf *)conf,
 		       sizeof(struct stm32_sai_conf));
 	else
 		return -EINVAL;
diff --git a/sound/soc/stm/stm32_sai_sub.c b/sound/soc/stm/stm32_sai_sub.c
index 8bcb98d9b64e..ad2492efb1cd 100644
--- a/sound/soc/stm/stm32_sai_sub.c
+++ b/sound/soc/stm/stm32_sai_sub.c
@@ -1506,7 +1506,6 @@ static int stm32_sai_sub_parse_of(struct platform_device *pdev,
 static int stm32_sai_sub_probe(struct platform_device *pdev)
 {
 	struct stm32_sai_sub_data *sai;
-	const struct of_device_id *of_id;
 	const struct snd_dmaengine_pcm_config *conf = &stm32_sai_pcm_config;
 	int ret;
 
@@ -1514,10 +1513,7 @@ static int stm32_sai_sub_probe(struct platform_device *pdev)
 	if (!sai)
 		return -ENOMEM;
 
-	of_id = of_match_device(stm32_sai_sub_ids, &pdev->dev);
-	if (!of_id)
-		return -EINVAL;
-	sai->id = (uintptr_t)of_id->data;
+	sai->id = (uintptr_t)device_get_match_data(&pdev->dev);
 
 	sai->pdev = pdev;
 	mutex_init(&sai->ctrl_lock);
diff --git a/sound/soc/stm/stm32_spdifrx.c b/sound/soc/stm/stm32_spdifrx.c
index a359b528b26b..9eed3c57e3f1 100644
--- a/sound/soc/stm/stm32_spdifrx.c
+++ b/sound/soc/stm/stm32_spdifrx.c
@@ -908,17 +908,13 @@ static int stm32_spdifrx_parse_of(struct platform_device *pdev,
 				  struct stm32_spdifrx_data *spdifrx)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *of_id;
 	struct resource *res;
 
 	if (!np)
 		return -ENODEV;
 
-	of_id = of_match_device(stm32_spdifrx_ids, &pdev->dev);
-	if (of_id)
-		spdifrx->regmap_conf =
-			(const struct regmap_config *)of_id->data;
-	else
+	spdifrx->regmap_conf = device_get_match_data(&pdev->dev);
+	if (!spdifrx->regmap_conf)
 		return -EINVAL;
 
 	spdifrx->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
diff --git a/sound/soc/tegra/tegra210_amx.c b/sound/soc/tegra/tegra210_amx.c
index 95816f6007bd..dd1a2c77c6ea 100644
--- a/sound/soc/tegra/tegra210_amx.c
+++ b/sound/soc/tegra/tegra210_amx.c
@@ -535,18 +535,13 @@ static int tegra210_amx_platform_probe(struct platform_device *pdev)
 	struct tegra210_amx *amx;
 	void __iomem *regs;
 	int err;
-	const struct of_device_id *match;
 	struct tegra210_amx_soc_data *soc_data;
 
-	match = of_match_device(tegra210_amx_of_match, dev);
-
-	soc_data = (struct tegra210_amx_soc_data *)match->data;
-
 	amx = devm_kzalloc(dev, sizeof(*amx), GFP_KERNEL);
 	if (!amx)
 		return -ENOMEM;
 
-	amx->soc_data = soc_data;
+	amx->soc_data = device_get_match_data(dev);
 
 	dev_set_drvdata(dev, amx);
 
diff --git a/sound/soc/ti/davinci-evm.c b/sound/soc/ti/davinci-evm.c
index ae7fdd761a7a..1bf333d2740d 100644
--- a/sound/soc/ti/davinci-evm.c
+++ b/sound/soc/ti/davinci-evm.c
@@ -175,20 +175,17 @@ static struct snd_soc_card evm_soc_card = {
 static int davinci_evm_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	const struct of_device_id *match;
 	struct snd_soc_dai_link *dai;
 	struct snd_soc_card_drvdata_davinci *drvdata = NULL;
 	struct clk *mclk;
 	int ret = 0;
 
-	match = of_match_device(of_match_ptr(davinci_evm_dt_ids), &pdev->dev);
-	if (!match) {
+	dai = (struct snd_soc_dai_link *) device_get_match_data(&pdev->dev);
+	if (!dai) {
 		dev_err(&pdev->dev, "Error: No device match found\n");
 		return -ENODEV;
 	}
 
-	dai = (struct snd_soc_dai_link *) match->data;
-
 	evm_soc_card.dai_link = dai;
 
 	dai->codecs->of_node = of_parse_phandle(np, "ti,audio-codec", 0);
diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index 7e7d665a5504..b892d66f7847 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -21,8 +21,6 @@
 #include <linux/clk.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_platform.h>
-#include <linux/of_device.h>
 #include <linux/platform_data/davinci_asp.h>
 #include <linux/math64.h>
 #include <linux/bitmap.h>
@@ -1882,9 +1880,10 @@ static bool davinci_mcasp_have_gpiochip(struct davinci_mcasp *mcasp)
 static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 				    struct platform_device *pdev)
 {
-	const struct of_device_id *match = of_match_device(mcasp_dt_ids, &pdev->dev);
 	struct device_node *np = pdev->dev.of_node;
 	struct davinci_mcasp_pdata *pdata = NULL;
+	const struct davinci_mcasp_pdata *match_pdata =
+		device_get_match_data(&pdev->dev);
 	const u32 *of_serial_dir32;
 	u32 val;
 	int i;
@@ -1893,8 +1892,8 @@ static int davinci_mcasp_get_config(struct davinci_mcasp *mcasp,
 		pdata = pdev->dev.platform_data;
 		pdata->dismod = DISMOD_LOW;
 		goto out;
-	} else if (match) {
-		pdata = devm_kmemdup(&pdev->dev, match->data, sizeof(*pdata),
+	} else if (match_pdata) {
+		pdata = devm_kmemdup(&pdev->dev, match_pdata, sizeof(*pdata),
 				     GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
diff --git a/sound/soc/ti/omap-mcbsp.c b/sound/soc/ti/omap-mcbsp.c
index bfe51221f541..7643a54592f5 100644
--- a/sound/soc/ti/omap-mcbsp.c
+++ b/sound/soc/ti/omap-mcbsp.c
@@ -13,7 +13,6 @@
 #include <linux/device.h>
 #include <linux/pm_runtime.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1360,23 +1359,22 @@ MODULE_DEVICE_TABLE(of, omap_mcbsp_of_match);
 static int asoc_mcbsp_probe(struct platform_device *pdev)
 {
 	struct omap_mcbsp_platform_data *pdata = dev_get_platdata(&pdev->dev);
+	const struct omap_mcbsp_platform_data *match_pdata =
+		device_get_match_data(&pdev->dev);
 	struct omap_mcbsp *mcbsp;
-	const struct of_device_id *match;
 	int ret;
 
-	match = of_match_device(omap_mcbsp_of_match, &pdev->dev);
-	if (match) {
+	if (match_pdata) {
 		struct device_node *node = pdev->dev.of_node;
 		struct omap_mcbsp_platform_data *pdata_quirk = pdata;
 		int buffer_size;
 
-		pdata = devm_kzalloc(&pdev->dev,
+		pdata = devm_kmemdup(&pdev->dev, match_pdata,
 				     sizeof(struct omap_mcbsp_platform_data),
 				     GFP_KERNEL);
 		if (!pdata)
 			return -ENOMEM;
 
-		memcpy(pdata, match->data, sizeof(*pdata));
 		if (!of_property_read_u32(node, "ti,buffer-size", &buffer_size))
 			pdata->buffer_size = buffer_size;
 		if (pdata_quirk)

-- 
2.40.1

