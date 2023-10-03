Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F2CA7B70A2
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 20:16:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yf1Ix/bp;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0QxS2HHtz3vds
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 05:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yf1Ix/bp;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=srs0=fdhd=fr=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0QtS6Ymrz3cGk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 05:13:36 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3D567CE1997;
	Tue,  3 Oct 2023 18:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DA3C433CD;
	Tue,  3 Oct 2023 18:13:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696356814;
	bh=bt5J5fh5JDF9Qn4xoTeao+osiheqHYKP1EfCbyh3YY4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Yf1Ix/bpZe+VMXS6FL37MVUsc6INuRN/hTturC6eWMKqzGpplFoS8T1uxg89FHhlh
	 PWWL98sqWkwfUPFQqJojgPyw3yIPs0JzTqM1CpLqjfX32rMHJoeI6OioFJlby5+CRu
	 zqsAp3PgPg+SCfF/rtFcoyLF4OCNb8gxjDt7/XnPaORIGWYymJHamYgtCe9LJAfXGh
	 MFxiJM0+pqkaNCHQFLLjo8/ig8fOHLxgDUD4m/TttPqMF9sCpTD6ZvM6/o+T+pSa1O
	 KmRjVXKz0kieC3csciiwD8zksA4XN1WJQLhfLaCBvx1stsuFIn25Dnvcpk5ZbLSVRA
	 R80WbuO9g7afw==
Received: (nullmailer pid 1020043 invoked by uid 1000);
	Tue, 03 Oct 2023 18:13:14 -0000
From: Rob Herring <robh@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>, Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Peter Rosin <peda@axentia.se>, Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, Lars-Peter Clausen <lars@metafoo.de>, =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Support Opensource <support.opensource@diasemi.com>, Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, Shengjiu Wang <shengjiu.wang@
 gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Heiko Stuebner <heiko@sntech.de>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Ban Tao <fengzheng923@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <r
 anjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH RESEND 4/5] ASoC: qcom/lpass: Constify struct lpass_variant
Date: Tue,  3 Oct 2023 13:13:13 -0500
Message-Id: <20231003-dt-asoc-header-cleanups-v1-4-05b5d6447e5a@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
References: <20231003-dt-asoc-header-cleanups-v1-0-05b5d6447e5a@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.13-dev
Content-Transfer-Encoding: 8bit
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

'struct lpass_variant' is used for driver match data which is supposed to
be constant. It's not modified anywhere, so it's just a matter of adding
'const' everywhere.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/qcom/lpass-apq8016.c  |  6 +++---
 sound/soc/qcom/lpass-cdc-dma.c  |  2 +-
 sound/soc/qcom/lpass-cpu.c      | 28 ++++++++++++++--------------
 sound/soc/qcom/lpass-ipq806x.c  |  2 +-
 sound/soc/qcom/lpass-platform.c | 36 ++++++++++++++++++------------------
 sound/soc/qcom/lpass-sc7180.c   |  6 +++---
 sound/soc/qcom/lpass-sc7280.c   |  6 +++---
 sound/soc/qcom/lpass.h          |  2 +-
 8 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/sound/soc/qcom/lpass-apq8016.c b/sound/soc/qcom/lpass-apq8016.c
index f919d46e18ca..8ce75b442b64 100644
--- a/sound/soc/qcom/lpass-apq8016.c
+++ b/sound/soc/qcom/lpass-apq8016.c
@@ -123,7 +123,7 @@ static struct snd_soc_dai_driver apq8016_lpass_cpu_dai_driver[] = {
 static int apq8016_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					   int direction, unsigned int dai_id)
 {
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
 
 	if (direction == SNDRV_PCM_STREAM_PLAYBACK) {
@@ -157,7 +157,7 @@ static int apq8016_lpass_free_dma_channel(struct lpass_data *drvdata, int chan,
 static int apq8016_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
-	struct lpass_variant *variant = drvdata->variant;
+	const struct lpass_variant *variant = drvdata->variant;
 	struct device *dev = &pdev->dev;
 	int ret, i;
 
@@ -223,7 +223,7 @@ static int apq8016_lpass_exit(struct platform_device *pdev)
 }
 
 
-static struct lpass_variant apq8016_data = {
+static const struct lpass_variant apq8016_data = {
 	.i2sctrl_reg_base	= 0x1000,
 	.i2sctrl_reg_stride	= 0x1000,
 	.i2s_ports		= 4,
diff --git a/sound/soc/qcom/lpass-cdc-dma.c b/sound/soc/qcom/lpass-cdc-dma.c
index 8221e2cbe35c..6389c7b6051e 100644
--- a/sound/soc/qcom/lpass-cdc-dma.c
+++ b/sound/soc/qcom/lpass-cdc-dma.c
@@ -37,7 +37,7 @@ static void __lpass_get_dmactl_handle(struct snd_pcm_substream *substream, struc
 	struct lpass_data *drvdata = snd_soc_dai_get_drvdata(dai);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int dai_id = cpu_dai->driver->id;
 
 	switch (dai_id) {
diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 39571fed4001..18aff2654f89 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -44,7 +44,7 @@ static int lpass_cpu_init_i2sctl_bitfields(struct device *dev,
 			struct lpaif_i2sctl *i2sctl, struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 
 	i2sctl->loopback = devm_regmap_field_alloc(dev, map, v->loopback);
 	i2sctl->spken = devm_regmap_field_alloc(dev, map, v->spken);
@@ -463,7 +463,7 @@ static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
 				   const char **dai_name)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	struct lpass_variant *variant = drvdata->variant;
+	const struct lpass_variant *variant = drvdata->variant;
 	int id = args->args[0];
 	int ret = -EINVAL;
 	int i;
@@ -488,7 +488,7 @@ static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->i2s_ports; ++i)
@@ -530,7 +530,7 @@ static bool lpass_cpu_regmap_writeable(struct device *dev, unsigned int reg)
 static bool lpass_cpu_regmap_readable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->i2s_ports; ++i)
@@ -578,7 +578,7 @@ static bool lpass_cpu_regmap_readable(struct device *dev, unsigned int reg)
 static bool lpass_cpu_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->irq_ports; ++i) {
@@ -613,7 +613,7 @@ static struct regmap_config lpass_cpu_regmap_config = {
 static int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int i;
 	struct lpass_hdmi_tx_ctl *tx_ctl;
 	struct regmap_field *legacy_en;
@@ -691,7 +691,7 @@ static int lpass_hdmi_init_bitfields(struct device *dev, struct regmap *map)
 static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
@@ -736,7 +736,7 @@ static bool lpass_hdmi_regmap_writeable(struct device *dev, unsigned int reg)
 static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	if (reg == LPASS_HDMI_TX_CTL_ADDR(v))
@@ -785,7 +785,7 @@ static bool lpass_hdmi_regmap_readable(struct device *dev, unsigned int reg)
 static bool lpass_hdmi_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	if (reg == LPASS_HDMITX_APP_IRQSTAT_REG(v))
@@ -824,7 +824,7 @@ static struct regmap_config lpass_hdmi_regmap_config = {
 static bool __lpass_rxtx_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->rxtx_irq_ports; ++i) {
@@ -890,7 +890,7 @@ static bool lpass_rxtx_regmap_readable(struct device *dev, unsigned int reg)
 static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->rxtx_irq_ports; ++i) {
@@ -915,7 +915,7 @@ static bool lpass_rxtx_regmap_volatile(struct device *dev, unsigned int reg)
 static bool __lpass_va_regmap_accessible(struct device *dev, unsigned int reg, bool rw)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->va_irq_ports; ++i) {
@@ -965,7 +965,7 @@ static bool lpass_va_regmap_readable(struct device *dev, unsigned int reg)
 static bool lpass_va_regmap_volatile(struct device *dev, unsigned int reg)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int i;
 
 	for (i = 0; i < v->va_irq_ports; ++i) {
@@ -1104,7 +1104,7 @@ int asoc_qcom_lpass_cpu_platform_probe(struct platform_device *pdev)
 	struct lpass_data *drvdata;
 	struct device_node *dsp_of_node;
 	struct resource *res;
-	struct lpass_variant *variant;
+	const struct lpass_variant *variant;
 	struct device *dev = &pdev->dev;
 	const struct of_device_id *match;
 	int ret, i, dai_id;
diff --git a/sound/soc/qcom/lpass-ipq806x.c b/sound/soc/qcom/lpass-ipq806x.c
index 2c97f295e394..bbe9f11d7780 100644
--- a/sound/soc/qcom/lpass-ipq806x.c
+++ b/sound/soc/qcom/lpass-ipq806x.c
@@ -108,7 +108,7 @@ static int ipq806x_lpass_free_dma_channel(struct lpass_data *drvdata, int chan,
 	return 0;
 }
 
-static struct lpass_variant ipq806x_data = {
+static const struct lpass_variant ipq806x_data = {
 	.i2sctrl_reg_base	= 0x0010,
 	.i2sctrl_reg_stride	= 0x04,
 	.i2s_ports		= 5,
diff --git a/sound/soc/qcom/lpass-platform.c b/sound/soc/qcom/lpass-platform.c
index 73e3d39bd24c..6569102486e2 100644
--- a/sound/soc/qcom/lpass-platform.c
+++ b/sound/soc/qcom/lpass-platform.c
@@ -100,7 +100,7 @@ static int lpass_platform_alloc_rxtx_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
 	int rval;
 
@@ -128,7 +128,7 @@ static int lpass_platform_alloc_va_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *wr_dmactl;
 
 	wr_dmactl = devm_kzalloc(dev, sizeof(*wr_dmactl), GFP_KERNEL);
@@ -145,7 +145,7 @@ static int lpass_platform_alloc_dmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *rd_dmactl, *wr_dmactl;
 	int rval;
 
@@ -175,7 +175,7 @@ static int lpass_platform_alloc_hdmidmactl_fields(struct device *dev,
 					 struct regmap *map)
 {
 	struct lpass_data *drvdata = dev_get_drvdata(dev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *rd_dmactl;
 
 	rd_dmactl = devm_kzalloc(dev, sizeof(struct lpaif_dmactl), GFP_KERNEL);
@@ -195,7 +195,7 @@ static int lpass_platform_pcmops_open(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int ret, dma_ch, dir = substream->stream;
 	struct lpass_pcm_data *data;
 	struct regmap *map;
@@ -287,7 +287,7 @@ static int lpass_platform_pcmops_close(struct snd_soc_component *component,
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpass_pcm_data *data;
 	unsigned int dai_id = cpu_dai->driver->id;
 
@@ -358,7 +358,7 @@ static int __lpass_get_id(const struct snd_pcm_substream *substream,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int id;
 
 	switch (cpu_dai->driver->id) {
@@ -421,7 +421,7 @@ static int lpass_platform_pcmops_hw_params(struct snd_soc_component *component,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	snd_pcm_format_t format = params_format(params);
 	unsigned int channels = params_channels(params);
 	unsigned int regval;
@@ -574,7 +574,7 @@ static int lpass_platform_pcmops_hw_free(struct snd_soc_component *component,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int reg;
 	int ret;
 	struct regmap *map;
@@ -602,7 +602,7 @@ static int lpass_platform_pcmops_prepare(struct snd_soc_component *component,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *dmactl;
 	struct regmap *map;
 	int ret, id, ch, dir = substream->stream;
@@ -665,7 +665,7 @@ static int lpass_platform_pcmops_trigger(struct snd_soc_component *component,
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	struct lpaif_dmactl *dmactl;
 	struct regmap *map;
 	int ret, ch, id;
@@ -864,7 +864,7 @@ static snd_pcm_uframes_t lpass_platform_pcmops_pointer(
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	struct snd_pcm_runtime *rt = substream->runtime;
 	struct lpass_pcm_data *pcm_data = rt->private_data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int base_addr, curr_addr;
 	int ret, ch, dir = substream->stream;
 	struct regmap *map;
@@ -928,7 +928,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 {
 	struct snd_soc_pcm_runtime *soc_runtime = snd_soc_substream_to_rtd(substream);
 	struct snd_soc_dai *cpu_dai = snd_soc_rtd_to_cpu(soc_runtime, 0);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	irqreturn_t ret = IRQ_NONE;
 	int rv;
 	unsigned int reg, val, mask;
@@ -1020,7 +1020,7 @@ static irqreturn_t lpass_dma_interrupt_handler(
 static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 {
 	struct lpass_data *drvdata = data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	int rv, chan;
 
@@ -1048,7 +1048,7 @@ static irqreturn_t lpass_platform_lpaif_irq(int irq, void *data)
 static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
 {
 	struct lpass_data *drvdata = data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	int rv, chan;
 
@@ -1078,7 +1078,7 @@ static irqreturn_t lpass_platform_hdmiif_irq(int irq, void *data)
 static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
 {
 	struct lpass_data *drvdata = data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	irqreturn_t rv;
 	int chan;
@@ -1103,7 +1103,7 @@ static irqreturn_t lpass_platform_rxtxif_irq(int irq, void *data)
 static irqreturn_t lpass_platform_vaif_irq(int irq, void *data)
 {
 	struct lpass_data *drvdata = data;
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	unsigned int irqs;
 	irqreturn_t rv;
 	int chan;
@@ -1268,7 +1268,7 @@ static const struct snd_soc_component_driver lpass_component_driver = {
 int asoc_qcom_lpass_platform_register(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int ret;
 
 	drvdata->lpaif_irq = platform_get_irq_byname(pdev, "lpass-irq-lpaif");
diff --git a/sound/soc/qcom/lpass-sc7180.c b/sound/soc/qcom/lpass-sc7180.c
index d16c0d83aaad..1b0c04b210ce 100644
--- a/sound/soc/qcom/lpass-sc7180.c
+++ b/sound/soc/qcom/lpass-sc7180.c
@@ -76,7 +76,7 @@ static struct snd_soc_dai_driver sc7180_lpass_cpu_dai_driver[] = {
 static int sc7180_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					   int direction, unsigned int dai_id)
 {
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
 
 	if (dai_id == LPASS_DP_RX) {
@@ -123,7 +123,7 @@ static int sc7180_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, u
 static int sc7180_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
-	struct lpass_variant *variant = drvdata->variant;
+	const struct lpass_variant *variant = drvdata->variant;
 	struct device *dev = &pdev->dev;
 	int ret, i;
 
@@ -179,7 +179,7 @@ static const struct dev_pm_ops sc7180_lpass_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(sc7180_lpass_dev_suspend, sc7180_lpass_dev_resume)
 };
 
-static struct lpass_variant sc7180_data = {
+static const struct lpass_variant sc7180_data = {
 	.i2sctrl_reg_base	= 0x1000,
 	.i2sctrl_reg_stride	= 0x1000,
 	.i2s_ports		= 3,
diff --git a/sound/soc/qcom/lpass-sc7280.c b/sound/soc/qcom/lpass-sc7280.c
index 6b2eb25ed939..7cd3e291382a 100644
--- a/sound/soc/qcom/lpass-sc7280.c
+++ b/sound/soc/qcom/lpass-sc7280.c
@@ -110,7 +110,7 @@ static struct snd_soc_dai_driver sc7280_lpass_cpu_dai_driver[] = {
 static int sc7280_lpass_alloc_dma_channel(struct lpass_data *drvdata,
 					  int direction, unsigned int dai_id)
 {
-	struct lpass_variant *v = drvdata->variant;
+	const struct lpass_variant *v = drvdata->variant;
 	int chan = 0;
 
 	switch (dai_id) {
@@ -196,7 +196,7 @@ static int sc7280_lpass_free_dma_channel(struct lpass_data *drvdata, int chan, u
 static int sc7280_lpass_init(struct platform_device *pdev)
 {
 	struct lpass_data *drvdata = platform_get_drvdata(pdev);
-	struct lpass_variant *variant = drvdata->variant;
+	const struct lpass_variant *variant = drvdata->variant;
 	struct device *dev = &pdev->dev;
 	int ret, i;
 
@@ -252,7 +252,7 @@ static const struct dev_pm_ops sc7280_lpass_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(sc7280_lpass_dev_suspend, sc7280_lpass_dev_resume)
 };
 
-static struct lpass_variant sc7280_data = {
+static const struct lpass_variant sc7280_data = {
 	.i2sctrl_reg_base		= 0x1000,
 	.i2sctrl_reg_stride		= 0x1000,
 	.i2s_ports			= 3,
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index bdfe66ec3314..aab60540563a 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -139,7 +139,7 @@ struct lpass_data {
 	int vaif_irq;
 
 	/* SOC specific variations in the LPASS IP integration */
-	struct lpass_variant *variant;
+	const struct lpass_variant *variant;
 
 	/* bit map to keep track of static channel allocations */
 	unsigned long dma_ch_bit_map;

-- 
2.40.1

