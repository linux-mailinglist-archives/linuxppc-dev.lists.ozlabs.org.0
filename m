Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B7BD07BC01A
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Oct 2023 22:12:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S2KNb4H2Lz3w90
	for <lists+linuxppc-dev@lfdr.de>; Sat,  7 Oct 2023 07:12:47 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=209.85.210.47; helo=mail-ot1-f47.google.com; envelope-from=robherring2@gmail.com; receiver=lists.ozlabs.org)
Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2KKB233Dz3vZF
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 07:09:50 +1100 (AEDT)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6c7b3adbeb6so1707579a34.0
        for <linuxppc-dev@lists.ozlabs.org>; Fri, 06 Oct 2023 13:09:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696622987; x=1697227787;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=A+OCongk6Hb4BlpU4QfeNnEcgzo8GaBxo0N0PgFWYnw=;
        b=Uo9AHG695V0+NxL99IMdMbeNmRUZaRWOoqo8EUgHlHoi5/3SAJR4X5ylxa4Bhj0Ovx
         QY+hZW4W0xswdXOhzfPIhx6/Zk3kYs/+/+Pts/nuUd3LIB328gTspVHrTwIg6KnvPic+
         L9qlal3wtkwePD88RV+Y7GPsws2RhW0WKpzP6E7LpTJlxIxNzWVg4zpj84KZHA2H0ZrT
         AcOHvkWA5tKjSNf+OOTaP5eP+JxfVCveU/PKdReO0xLYDqusVXD9gOBPimfFX2elyLDD
         B0QnmfVqB+8wQ2Nsohe+0vKJJGs0RBJCrlb+1955vs+GwzvmZo9OIy/d8+khC1tzcrdb
         Jb+w==
X-Gm-Message-State: AOJu0YxmQbVSayfmrhbMr0IjCKg4mE11t9yhojFRC4q74b/2HIZ5Na8q
	56zgYliYyKyW/9BkrqtlZQ==
X-Google-Smtp-Source: AGHT+IH7p3RI8WF5mlWccwSKg4dOKG/CNbO8ToEojOS1DN/EOweO0LBTKMQmzqXXejIioJEYMYtiWA==
X-Received: by 2002:a05:6830:1502:b0:6bf:1f5f:ed18 with SMTP id k2-20020a056830150200b006bf1f5fed18mr8505526otp.1.1696622987671;
        Fri, 06 Oct 2023 13:09:47 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v8-20020a9d7d08000000b006c4be829aa8sm679959otn.44.2023.10.06.13.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Oct 2023 13:09:47 -0700 (PDT)
Received: (nullmailer pid 229129 invoked by uid 1000);
	Fri, 06 Oct 2023 20:09:30 -0000
From: Rob Herring <robh@kernel.org>
Date: Fri, 06 Oct 2023 15:09:12 -0500
Subject: [PATCH v3 3/5] ASoC: da7218: Use i2c_get_match_data()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231006-dt-asoc-header-cleanups-v3-3-13a4f0f7fee6@kernel.org>
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
Cc: alsa-devel@alsa-project.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Use preferred i2c_get_match_data() instead of of_match_device() and
i2c_match_id() to get the driver match data. With this, adjust the
includes to explicitly include the correct headers.

Avoid using 0 for enum da7218_dev_id so that no match data can be
distinguished.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 sound/soc/codecs/da7218.c | 29 ++---------------------------
 sound/soc/codecs/da7218.h |  2 +-
 2 files changed, 3 insertions(+), 28 deletions(-)

diff --git a/sound/soc/codecs/da7218.c b/sound/soc/codecs/da7218.c
index 3f456b08b809..8aacd7350798 100644
--- a/sound/soc/codecs/da7218.c
+++ b/sound/soc/codecs/da7218.c
@@ -9,7 +9,7 @@
 
 #include <linux/clk.h>
 #include <linux/i2c.h>
-#include <linux/of_device.h>
+#include <linux/of.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/pm.h>
@@ -2285,16 +2285,6 @@ static const struct of_device_id da7218_of_match[] = {
 };
 MODULE_DEVICE_TABLE(of, da7218_of_match);
 
-static inline int da7218_of_get_id(struct device *dev)
-{
-	const struct of_device_id *id = of_match_device(da7218_of_match, dev);
-
-	if (id)
-		return (uintptr_t)id->data;
-	else
-		return -EINVAL;
-}
-
 static enum da7218_micbias_voltage
 	da7218_of_micbias_lvl(struct snd_soc_component *component, u32 val)
 {
@@ -3253,18 +3243,6 @@ static const struct regmap_config da7218_regmap_config = {
  * I2C layer
  */
 
-static const struct i2c_device_id da7218_i2c_id[];
-
-static inline int da7218_i2c_get_id(struct i2c_client *i2c)
-{
-	const struct i2c_device_id *id = i2c_match_id(da7218_i2c_id, i2c);
-
-	if (id)
-		return (uintptr_t)id->driver_data;
-	else
-		return -EINVAL;
-}
-
 static int da7218_i2c_probe(struct i2c_client *i2c)
 {
 	struct da7218_priv *da7218;
@@ -3276,10 +3254,7 @@ static int da7218_i2c_probe(struct i2c_client *i2c)
 
 	i2c_set_clientdata(i2c, da7218);
 
-	if (i2c->dev.of_node)
-		da7218->dev_id = da7218_of_get_id(&i2c->dev);
-	else
-		da7218->dev_id = da7218_i2c_get_id(i2c);
+	da7218->dev_id = (uintptr_t)i2c_get_match_data(i2c);
 
 	if ((da7218->dev_id != DA7217_DEV_ID) &&
 	    (da7218->dev_id != DA7218_DEV_ID)) {
diff --git a/sound/soc/codecs/da7218.h b/sound/soc/codecs/da7218.h
index 9ac2892092b5..7f6a4aea2c7a 100644
--- a/sound/soc/codecs/da7218.h
+++ b/sound/soc/codecs/da7218.h
@@ -1369,7 +1369,7 @@ enum da7218_sys_clk {
 };
 
 enum da7218_dev_id {
-	DA7217_DEV_ID = 0,
+	DA7217_DEV_ID = 1,
 	DA7218_DEV_ID,
 };
 

-- 
2.40.1

