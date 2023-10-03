Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BD8F87B6EE3
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Oct 2023 18:47:18 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8spIlXW;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0Nyr4lb6z3vgB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 03:47:16 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=O8spIlXW;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=robh@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0NvJ4Dvcz3cb8
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 03:44:12 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 8B818B81B1A;
	Tue,  3 Oct 2023 16:44:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5921C433C7;
	Tue,  3 Oct 2023 16:44:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696351448;
	bh=4rrnrq07QQ7mg3jVhwP3uG1o5PbTor7aJsxbpbknuWQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=O8spIlXWkzl4liaZdSq7cgvDLyssraN6LGu+LotDYpVXG25fSXPtypRduBz5CcwhO
	 qdYogJypcRDBH5NS1x/FjUb6QKXmWK2ekXbGj+EE2wqSjoPdEySk6SZD1U8I3jqWws
	 T+iIb87PKXcB28CV1yguvYPyOgJqyj0gurLSAU6MrV89cqk6AUtfXr+Agf9LdL8HOL
	 iPLnlqAO1SYjEKldeLux5a9221uj/NxTWph4HuIBnZy5fuIkOY84CGHlRD+FVvMY5U
	 12HlXP+75zVS6SWgoch5l5bg6efntcVm3S/QEE+psfrFQmoYiu8Stb7tU7+lRB/SDC
	 FhOOSTYlVdFyA==
Received: (nullmailer pid 783961 invoked by uid 1000);
	Tue, 03 Oct 2023 16:43:40 -0000
From: Rob Herring <robh@kernel.org>
Date: Tue, 03 Oct 2023 11:43:08 -0500
Subject: [PATCH 2/5] ASoC: Drop unnecessary of_match_device() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-dt-asoc-header-cleanups-v1-2-308666806378@kernel.org>
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

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/codecs/ak5386.c  |  7 ++-----
 sound/soc/codecs/cs4271.c  | 22 ++++++----------------
 sound/soc/codecs/tas5086.c |  6 +-----
 3 files changed, 9 insertions(+), 26 deletions(-)

diff --git a/sound/soc/codecs/ak5386.c b/sound/soc/codecs/ak5386.c
index 0c5e00679c7d..21a44476f48d 100644
--- a/sound/soc/codecs/ak5386.c
+++ b/sound/soc/codecs/ak5386.c
@@ -10,7 +10,6 @@
 #include <linux/slab.h>
 #include <linux/of.h>
 #include <linux/of_gpio.h>
-#include <linux/of_device.h>
 #include <linux/regulator/consumer.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
@@ -168,7 +167,6 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (!priv)
 		return -ENOMEM;
 
-	priv->reset_gpio = -EINVAL;
 	dev_set_drvdata(dev, priv);
 
 	for (i = 0; i < ARRAY_SIZE(supply_names); i++)
@@ -179,9 +177,8 @@ static int ak5386_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	if (of_match_device(of_match_ptr(ak5386_dt_ids), dev))
-		priv->reset_gpio = of_get_named_gpio(dev->of_node,
-						      "reset-gpio", 0);
+	priv->reset_gpio = of_get_named_gpio(dev->of_node,
+					     "reset-gpio", 0);
 
 	if (gpio_is_valid(priv->reset_gpio))
 		if (devm_gpio_request_one(dev, priv->reset_gpio,
diff --git a/sound/soc/codecs/cs4271.c b/sound/soc/codecs/cs4271.c
index 188b8b43c524..9e6f8a048dd5 100644
--- a/sound/soc/codecs/cs4271.c
+++ b/sound/soc/codecs/cs4271.c
@@ -15,7 +15,6 @@
 #include <linux/delay.h>
 #include <linux/gpio.h>
 #include <linux/of.h>
-#include <linux/of_device.h>
 #include <linux/of_gpio.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm.h>
@@ -563,19 +562,12 @@ static int cs4271_component_probe(struct snd_soc_component *component)
 	struct cs4271_private *cs4271 = snd_soc_component_get_drvdata(component);
 	struct cs4271_platform_data *cs4271plat = component->dev->platform_data;
 	int ret;
-	bool amutec_eq_bmutec = false;
+	bool amutec_eq_bmutec;
 
-#ifdef CONFIG_OF
-	if (of_match_device(cs4271_dt_ids, component->dev)) {
-		if (of_get_property(component->dev->of_node,
-				     "cirrus,amutec-eq-bmutec", NULL))
-			amutec_eq_bmutec = true;
-
-		if (of_get_property(component->dev->of_node,
-				     "cirrus,enable-soft-reset", NULL))
-			cs4271->enable_soft_reset = true;
-	}
-#endif
+	amutec_eq_bmutec = of_property_read_bool(component->dev->of_node,
+						 "cirrus,amutec-eq-bmutec");
+	cs4271->enable_soft_reset = of_property_read_bool(component->dev->of_node,
+							  "cirrus,enable-soft-reset");
 
 	ret = regulator_bulk_enable(ARRAY_SIZE(cs4271->supplies),
 				    cs4271->supplies);
@@ -655,9 +647,7 @@ static int cs4271_common_probe(struct device *dev,
 	if (!cs4271)
 		return -ENOMEM;
 
-	if (of_match_device(cs4271_dt_ids, dev))
-		cs4271->gpio_nreset =
-			of_get_named_gpio(dev->of_node, "reset-gpio", 0);
+	cs4271->gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
 
 	if (cs4271plat)
 		cs4271->gpio_nreset = cs4271plat->gpio_nreset;
diff --git a/sound/soc/codecs/tas5086.c b/sound/soc/codecs/tas5086.c
index 60e59e993ba6..f52c14b43f28 100644
--- a/sound/soc/codecs/tas5086.c
+++ b/sound/soc/codecs/tas5086.c
@@ -940,11 +940,7 @@ static int tas5086_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, priv);
 
-	if (of_match_device(of_match_ptr(tas5086_dt_ids), dev)) {
-		struct device_node *of_node = dev->of_node;
-		gpio_nreset = of_get_named_gpio(of_node, "reset-gpio", 0);
-	}
-
+	gpio_nreset = of_get_named_gpio(dev->of_node, "reset-gpio", 0);
 	if (gpio_is_valid(gpio_nreset))
 		if (devm_gpio_request(dev, gpio_nreset, "TAS5086 Reset"))
 			gpio_nreset = -EINVAL;

-- 
2.40.1

