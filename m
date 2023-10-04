Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0097B845B
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 17:59:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q3saF6ms;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0zsk0Pj7z3cPm
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Oct 2023 02:59:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Q3saF6ms;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1; helo=ams.source.kernel.org; envelope-from=srs0=zsur=fs=robh_at_kernel.org=rob@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0zqz6rzgz3cCS
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Oct 2023 02:58:23 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id A3F17B81EDD;
	Wed,  4 Oct 2023 15:58:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BF73C433C8;
	Wed,  4 Oct 2023 15:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696435100;
	bh=2U2BCkPOgUTh6aGnzeLvyBJcHFywZosekocMB8Uj2zs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Q3saF6msnn3X/eguqT5pPEIrhAEM46UQcwHA/rFDHm7H2EFzblIRdI5n0B6mjXqzz
	 3YjysyPXf7/Qgr8mTcV3z3GGhjVHdj7cv6dPoefS1al9EiOjEr7T11n6KrDYrDmSl6
	 OWJJbQS8r+TvqADnnSl/25eij2qZ92UePLoVD10uVk3Y2Ggf1xBq8N2DLIaaGbtwjg
	 7zRrN/YAyCG0NgXMUIJQDlJVdGX8RSOThH2xRm9e5IOZn2z7ZdlfMI5zcc6ChQOBUt
	 1pGsmn2T4JvvPVgyB6XYI4u4/axHslMh2N6XngYCH7XX+/81Cl3WEDfT+pKJnoMBXx
	 jsdL7Ur3dRr5w==
Received: (nullmailer pid 3222237 invoked by uid 1000);
	Wed, 04 Oct 2023 15:58:09 -0000
From: Rob Herring <robh@kernel.org>
To: Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Peter Rosin <peda@axentia.se>, Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Ban Tao <fengz
 heng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Jarkko Nikula <jarkko.nikula@bitmer.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, Bard Liao <yung-chuan.liao@linux.intel.com>, Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>
Subject: [PATCH v2 2/5] ASoC: Drop unnecessary of_match_device() calls
Date: Wed,  4 Oct 2023 10:58:06 -0500
Message-Id: <20231004-dt-asoc-header-cleanups-v2-2-e77765080cbc@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
References: <20231004-dt-asoc-header-cleanups-v2-0-e77765080cbc@kernel.org>
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
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

If probe is reached, we've already matched the device and in the case of
DT matching, the struct device_node pointer will be set. Therefore, there
is no need to call of_match_device() in probe.

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>
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

