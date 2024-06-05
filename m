Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4428FD9C1
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 00:17:15 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acnorfEw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vvhf01NqMz3cWN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Jun 2024 08:17:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=acnorfEw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=192.198.163.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VvhbW0fsGz30Tm
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Jun 2024 08:15:02 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717625704; x=1749161704;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=63lwAsrH3yEqgf9hu/onZGx64FbB48uMxCRykvXnJXo=;
  b=acnorfEwahilloHGSr3d/R23fsSFJhLWXp63jTyfsyyOMx8n57o6drMf
   /0O9R7eNkhEHBF3e8SVdEM6DdV/OO0YKXdyUxL3ZvXN2EEnCrNsGQil6h
   G7c9Sj19geGata8esBAwOe6qrfURLz85fM3g4q6zjEgJy066QN7vI7ztI
   eDa7h12YNlFZE0gq1+RnTWwIQ5mt692HTLpWIbzVEwIsHwsc65bLdAgc+
   WQHxKKTO2JBY0PXIFftr3FgrCk+ayxOHtvBUYVICQaAqX6sTXXP6Iczyu
   ScZif0okWw+MUZvhCqbZw1auFOC5ESwSe3n079Ee4PydbNlFHJOHlXnuJ
   g==;
X-CSE-ConnectionGUID: gh861p+0TJyXkBwlkteh8Q==
X-CSE-MsgGUID: xfDbES+rTiax/H5OZ91fcw==
X-IronPort-AV: E=McAfee;i="6600,9927,11094"; a="24895481"
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="24895481"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2024 15:15:01 -0700
X-CSE-ConnectionGUID: 5XXek5vnT86MD8jAGLoXlg==
X-CSE-MsgGUID: FJnPPeaySs2QywiV33rbDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,217,1712646000"; 
   d="scan'208";a="38168541"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa006.jf.intel.com with ESMTP; 05 Jun 2024 15:14:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id A8EA6F7; Thu, 06 Jun 2024 01:14:47 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Charles Keepax <ckeepax@opensource.cirrus.com>,
	Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linux-arm-msm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 1/6] ASoC: codecs: Remove unused of_gpio.h
Date: Thu,  6 Jun 2024 00:27:24 +0300
Message-ID: <20240605221446.2624964-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
In-Reply-To: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
References: <20240605221446.2624964-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>, Baojun Xu <baojun.xu@ti.com>, Heiko Stuebner <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

of_gpio.h is deprecated and subject to remove. The drivers in question
don't use it, simply remove the unused header.

Reviewed-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 sound/soc/codecs/ak4118.c        | 1 -
 sound/soc/codecs/ak4458.c        | 1 -
 sound/soc/codecs/aw88399.c       | 2 +-
 sound/soc/codecs/cs53l30.c       | 1 -
 sound/soc/codecs/max98390.c      | 1 -
 sound/soc/codecs/pcm3168a.c      | 1 -
 sound/soc/codecs/rk817_codec.c   | 1 -
 sound/soc/codecs/tas2552.c       | 1 -
 sound/soc/codecs/tas2764.c       | 1 -
 sound/soc/codecs/tas2770.c       | 1 -
 sound/soc/codecs/tas2780.c       | 1 -
 sound/soc/codecs/tlv320adc3xxx.c | 1 -
 sound/soc/codecs/tlv320adcx140.c | 1 -
 sound/soc/codecs/tlv320aic31xx.c | 1 -
 sound/soc/codecs/ts3a227e.c      | 1 -
 sound/soc/codecs/wsa883x.c       | 1 -
 16 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/sound/soc/codecs/ak4118.c b/sound/soc/codecs/ak4118.c
index 9a43235e6a11..23e868e4e3fb 100644
--- a/sound/soc/codecs/ak4118.c
+++ b/sound/soc/codecs/ak4118.c
@@ -9,7 +9,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 
diff --git a/sound/soc/codecs/ak4458.c b/sound/soc/codecs/ak4458.c
index 73cf482f104f..32cb802ad635 100644
--- a/sound/soc/codecs/ak4458.c
+++ b/sound/soc/codecs/ak4458.c
@@ -10,7 +10,6 @@
 #include <linux/i2c.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/reset.h>
diff --git a/sound/soc/codecs/aw88399.c b/sound/soc/codecs/aw88399.c
index 9fcb805bf971..df6d52a1cfef 100644
--- a/sound/soc/codecs/aw88399.c
+++ b/sound/soc/codecs/aw88399.c
@@ -10,7 +10,7 @@
 #include <linux/crc32.h>
 #include <linux/i2c.h>
 #include <linux/firmware.h>
-#include <linux/of_gpio.h>
+#include <linux/of_gpio.h> 
 #include <linux/regmap.h>
 #include <sound/soc.h>
 #include "aw88399.h"
diff --git a/sound/soc/codecs/cs53l30.c b/sound/soc/codecs/cs53l30.c
index c0893146423b..2ee13d885fdc 100644
--- a/sound/soc/codecs/cs53l30.c
+++ b/sound/soc/codecs/cs53l30.c
@@ -12,7 +12,6 @@
 #include <linux/delay.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/gpio/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/max98390.c b/sound/soc/codecs/max98390.c
index 57fa2db1e148..1bae253618fd 100644
--- a/sound/soc/codecs/max98390.c
+++ b/sound/soc/codecs/max98390.c
@@ -13,7 +13,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/i2c.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/time.h>
diff --git a/sound/soc/codecs/pcm3168a.c b/sound/soc/codecs/pcm3168a.c
index 9d6431338fb7..3c0e0fdbfc5c 100644
--- a/sound/soc/codecs/pcm3168a.c
+++ b/sound/soc/codecs/pcm3168a.c
@@ -11,7 +11,6 @@
 #include <linux/delay.h>
 #include <linux/gpio/consumer.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 
diff --git a/sound/soc/codecs/rk817_codec.c b/sound/soc/codecs/rk817_codec.c
index d4da98469f8b..5fea600bc3a4 100644
--- a/sound/soc/codecs/rk817_codec.c
+++ b/sound/soc/codecs/rk817_codec.c
@@ -10,7 +10,6 @@
 #include <linux/mfd/rk808.h>
 #include <linux/module.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <sound/core.h>
diff --git a/sound/soc/codecs/tas2552.c b/sound/soc/codecs/tas2552.c
index a7ed59ec49a6..9e68afc09897 100644
--- a/sound/soc/codecs/tas2552.c
+++ b/sound/soc/codecs/tas2552.c
@@ -13,7 +13,6 @@
 #include <linux/device.h>
 #include <linux/i2c.h>
 #include <linux/gpio.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/tas2764.c b/sound/soc/codecs/tas2764.c
index 1dc719d726ab..5eaddf07aadc 100644
--- a/sound/soc/codecs/tas2764.c
+++ b/sound/soc/codecs/tas2764.c
@@ -15,7 +15,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2770.c b/sound/soc/codecs/tas2770.c
index 67bc1c8b0131..5601fba17c96 100644
--- a/sound/soc/codecs/tas2770.c
+++ b/sound/soc/codecs/tas2770.c
@@ -20,7 +20,6 @@
 #include <linux/firmware.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tas2780.c b/sound/soc/codecs/tas2780.c
index a18ccf5fb7ad..6902bfef185b 100644
--- a/sound/soc/codecs/tas2780.c
+++ b/sound/soc/codecs/tas2780.c
@@ -11,7 +11,6 @@
 #include <linux/gpio/consumer.h>
 #include <linux/regmap.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <sound/soc.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
diff --git a/sound/soc/codecs/tlv320adc3xxx.c b/sound/soc/codecs/tlv320adc3xxx.c
index e100cc9f5c19..eb180df9a72a 100644
--- a/sound/soc/codecs/tlv320adc3xxx.c
+++ b/sound/soc/codecs/tlv320adc3xxx.c
@@ -25,7 +25,6 @@
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/cdev.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tlv320adcx140.c b/sound/soc/codecs/tlv320adcx140.c
index 41342b340680..d594bf166c0e 100644
--- a/sound/soc/codecs/tlv320adcx140.c
+++ b/sound/soc/codecs/tlv320adcx140.c
@@ -12,7 +12,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/codecs/tlv320aic31xx.c b/sound/soc/codecs/tlv320aic31xx.c
index 4d7c5a80c6ed..2f94cfda0e33 100644
--- a/sound/soc/codecs/tlv320aic31xx.c
+++ b/sound/soc/codecs/tlv320aic31xx.c
@@ -23,7 +23,6 @@
 #include <linux/regulator/consumer.h>
 #include <linux/acpi.h>
 #include <linux/of.h>
-#include <linux/of_gpio.h>
 #include <linux/slab.h>
 #include <sound/core.h>
 #include <sound/jack.h>
diff --git a/sound/soc/codecs/ts3a227e.c b/sound/soc/codecs/ts3a227e.c
index dbf448dd8864..b9eb59e3bfa0 100644
--- a/sound/soc/codecs/ts3a227e.c
+++ b/sound/soc/codecs/ts3a227e.c
@@ -10,7 +10,6 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/regmap.h>
 #include <linux/acpi.h>
 
diff --git a/sound/soc/codecs/wsa883x.c b/sound/soc/codecs/wsa883x.c
index a2e86ef7d18f..8abce2160d65 100644
--- a/sound/soc/codecs/wsa883x.c
+++ b/sound/soc/codecs/wsa883x.c
@@ -9,7 +9,6 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
-#include <linux/of_gpio.h>
 #include <linux/pm_runtime.h>
 #include <linux/printk.h>
 #include <linux/regmap.h>
-- 
2.43.0.rc1.1336.g36b5255a03ac

