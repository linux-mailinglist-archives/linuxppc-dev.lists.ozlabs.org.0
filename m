Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC6F7BC010
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 22:11:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2KLj1FBKz3vs4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 07:11:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.51; helo=mail-ot1-f51.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2KK14bJtz3dK7
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 07:09:41 +1100 (AEDT)
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-6c620883559so1626942a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 13:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696622979; x=1697227779;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZZOch+WDqofN+3QITjE4l0oM3GunXyt8y2cN5QknfSQ=;
        b=dk99bHzzLHJkfIaYm3lTuScV38yGhZA4qNtkgUJGa9zAAIkWXTcVs7k0wZKmryQzQm
         B0xqhvDXep4hIE0HhwC16mSTj6VeT/QfS4gF8IHDKcbPiy6fWIVeswF/dqQqym9azhv4
         pyYgI670p5+vJAixiC++ZADwu2f+zCQ1RuuJ2125oWOqGSMWVa/1C+5OHXePFvPsnhQe
         GQf0m0kZs0o4jZCdoRhPNnNH5aLUrIRpKBAspshZ5AW7KIN9y6L59cwnzs4l55V4ITq7
         Z4tmUl+4yvKVEurBHDQ1cKracEvOZc34CVVamLnRwC/ADSB31U7vJA6lPVQbgCKeCmmn
         Tb5w==
X-Gm-Message-State: AOJu0Yw7Y0rEhKjCFnW4uioakSuyq1ioLZ2g+SSKsxtwLTdQrdD6Vudh
	HQzcF+QoO0/FuGbdNhnFMg==
X-Google-Smtp-Source: AGHT+IGlhmgo7yquRzHz8M2m6pzvj+CYN/Z9jgOwsiNpGDYXWkYoHfsIGQEmIBaY1D94644RsG3PAA==
X-Received: by 2002:a9d:6210:0:b0:6b9:b0f6:eab8 with SMTP id g16-20020a9d6210000000b006b9b0f6eab8mr9353110otj.5.1696622979060;
        Fri, 06 Oct 2023 13:09:39 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id r12-20020a9d750c000000b006c61c098d38sm680849otk.21.2023.10.06.13.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:09:38 -0700 (PDT)
Received: (nullmailer pid 229127 invoked by uid 1000);
	Fri, 06 Oct 2023 20:09:30 -0000
From: Rob Herring <robh@kernel.org>
Date: Fri, 06 Oct 2023 15:09:11 -0500
Subject: [PATCH v3 2/5] ASoC: Drop unnecessary of_match_device() calls
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-dt-asoc-header-cleanups-v3-2-13a4f0f7fee6@kernel.org>
References: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
In-Reply-To: <20231006-dt-asoc-header-cleanups-v3-0-13a4f0f7fee6@kernel.org>
To: Mark Brown <broonie@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Peter Rosin <peda@axentia.se>, 
	Lars-Peter Clausen <lars@metafoo.de>, nuno.sa@analog.com, 
	James Schulman <james.schulman@cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
	Oder Chiou <oder_chiou@realtek.com>, Fabio Estevam <festevam@gmail.com>, 
	Kiseok Jo <kiseok.jo@irondevice.com>, Kevin Cernekee <cernekee@chromium.org>, 
	Shengjiu Wang <shengjiu.wang@gmail.com>, Xiubo Li <Xiubo.Lee@gmail.com>, 
	Nicolin Chen <nicoleotsuka@gmail.com>, 
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, 
	Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Sylwester Nawrocki <s.nawrocki@samsung.com>, 
	Ban Tao <fengzheng923@gmail.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
	Jarkko Nikula <jarkko.nikula@bitmer.com>, Cezary Rojewski <cezary.rojewski@intel.com>, 
	Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, 
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, 
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>, 
	Kai Vehmanen <kai.vehmanen@linux.intel.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>
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
Cc: Charles Keepax <ckeepax@opensource.cirrus.com>, alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
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

