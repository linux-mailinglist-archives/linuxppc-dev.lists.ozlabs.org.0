Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C89E77064A0
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 11:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLpM756Gxz3fGn
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 19:53:07 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Moy7LgUQ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=claudiu.beznea@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=Moy7LgUQ;
	dkim-atps=neutral
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLpKX14j6z3f80
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 19:51:43 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684317104; x=1715853104;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vC49oAg5//44c2RdG1ra3PQEuUZQdVtv1rjI27JT7w0=;
  b=Moy7LgUQAoxZGf12NP+684Q5y5L5nUN6qaHQFqLaa3nsxmmbXnTfm2HC
   MHQhjc7E3KOzgbOHyNitNGuUgIQh7iUi8M5dWMFhtvVK7GtNlCaOOD0zj
   Qm1YJb+NRT3DIS5kRIg/czHPOGnbrgt1N7ldgbG27erhC0tS0F8IooFOi
   HzJOIUc+tkvPI8Uv1QrmyMR8LVK3zaZLR5ftKz7GViaa4uiQk3NBwe/Ax
   F4Dm1YuZOOxZ1nQXptk/EV+3Ie4cArebycjFdBxbuxf+UqqRCG1dRokiG
   7QAlit37o/TTpOX1WuCfEukphr7FQZXiALAdWKpsuVaFsX217MjFWDwPT
   A==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="scan'208";a="215854697"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 02:50:37 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 02:50:36 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 02:50:20 -0700
From: Claudiu Beznea <claudiu.beznea@microchip.com>
To: <perex@perex.cz>, <tiwai@suse.com>, <lgirdwood@gmail.com>,
	<broonie@kernel.org>, <oder_chiou@realtek.com>, <shengjiu.wang@gmail.com>,
	<Xiubo.Lee@gmail.com>, <festevam@gmail.com>, <nicoleotsuka@gmail.com>,
	<shawnguo@kernel.org>, <s.hauer@pengutronix.de>, <kernel@pengutronix.de>,
	<linux-imx@nxp.com>, <cezary.rojewski@intel.com>,
	<pierre-louis.bossart@linux.intel.com>, <peter.ujfalusi@linux.intel.com>,
	<yung-chuan.liao@linux.intel.com>, <ranjani.sridharan@linux.intel.com>,
	<kai.vehmanen@linux.intel.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <srinivas.kandagatla@linaro.org>,
	<bgoswami@quicinc.com>, <vkoul@kernel.org>, <daniel.baluta@nxp.com>,
	<thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
	<jarkko.nikula@bitmer.com>
Subject: [PATCH v2 1/2] ASoC: do not include pm_runtime.h if not used
Date: Wed, 17 May 2023 12:49:02 +0300
Message-ID: <20230517094903.2895238-2-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
References: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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
Cc: alsa-devel@alsa-project.org, patches@opensource.cirrus.com, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, sound-open-firmware@alsa-project.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Do not include pm_runtime.h header in files where APIs exported by
pm_runtime.h are not used.

Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Acked-by: Jarkko Nikula <jarkko.nikula@bitmer.com> # for omap-mcbsp-st.c
---
 sound/hda/hdac_regmap.c                                   | 1 -
 sound/pci/hda/hda_bind.c                                  | 1 -
 sound/soc/amd/acp/acp-pci.c                               | 1 -
 sound/soc/amd/acp/acp-platform.c                          | 1 -
 sound/soc/codecs/max98090.c                               | 1 -
 sound/soc/codecs/pcm186x.c                                | 1 -
 sound/soc/codecs/rk3328_codec.c                           | 1 -
 sound/soc/codecs/rt5682-i2c.c                             | 1 -
 sound/soc/codecs/rt5682s.c                                | 1 -
 sound/soc/codecs/tas2562.c                                | 1 -
 sound/soc/codecs/tas5720.c                                | 1 -
 sound/soc/codecs/tas6424.c                                | 1 -
 sound/soc/codecs/wm_adsp.c                                | 1 -
 sound/soc/fsl/imx-audmix.c                                | 1 -
 sound/soc/intel/atom/sst/sst_acpi.c                       | 1 -
 sound/soc/intel/atom/sst/sst_ipc.c                        | 1 -
 sound/soc/intel/atom/sst/sst_loader.c                     | 1 -
 sound/soc/intel/atom/sst/sst_pci.c                        | 1 -
 sound/soc/intel/atom/sst/sst_stream.c                     | 1 -
 sound/soc/mediatek/mt8186/mt8186-afe-control.c            | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c | 1 -
 sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c  | 1 -
 sound/soc/mediatek/mt8192/mt8192-afe-control.c            | 2 --
 sound/soc/soc-compress.c                                  | 1 -
 sound/soc/soc-pcm.c                                       | 1 -
 sound/soc/sof/intel/hda-loader-skl.c                      | 1 -
 sound/soc/sof/intel/hda-stream.c                          | 1 -
 sound/soc/sof/intel/skl.c                                 | 1 -
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c                | 1 -
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c                | 1 -
 sound/soc/tegra/tegra20_ac97.c                            | 1 -
 sound/soc/ti/omap-mcbsp-st.c                              | 1 -
 32 files changed, 33 deletions(-)

diff --git a/sound/hda/hdac_regmap.c b/sound/hda/hdac_regmap.c
index fe3587547cfe..7cfaa908ff57 100644
--- a/sound/hda/hdac_regmap.c
+++ b/sound/hda/hdac_regmap.c
@@ -17,7 +17,6 @@
 #include <linux/regmap.h>
 #include <linux/export.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/hdaudio.h>
 #include <sound/hda_regmap.h>
diff --git a/sound/pci/hda/hda_bind.c b/sound/pci/hda/hda_bind.c
index 890c2f7c33fc..b7ca2a83fbb0 100644
--- a/sound/pci/hda/hda_bind.c
+++ b/sound/pci/hda/hda_bind.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/export.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/hda_codec.h>
 #include "hda_local.h"
diff --git a/sound/soc/amd/acp/acp-pci.c b/sound/soc/amd/acp/acp-pci.c
index a0c84cd07fde..8154fbfd1229 100644
--- a/sound/soc/amd/acp/acp-pci.c
+++ b/sound/soc/amd/acp/acp-pci.c
@@ -15,7 +15,6 @@
 #include <linux/interrupt.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/module.h>
 
 #include "amd.h"
diff --git a/sound/soc/amd/acp/acp-platform.c b/sound/soc/amd/acp/acp-platform.c
index 447612a7a762..f220378ec20e 100644
--- a/sound/soc/amd/acp/acp-platform.c
+++ b/sound/soc/amd/acp/acp-platform.c
@@ -18,7 +18,6 @@
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
 #include <sound/soc-dai.h>
-#include <linux/pm_runtime.h>
 #include <linux/dma-mapping.h>
 
 #include "amd.h"
diff --git a/sound/soc/codecs/max98090.c b/sound/soc/codecs/max98090.c
index ad417d80691f..7bc463910d4f 100644
--- a/sound/soc/codecs/max98090.c
+++ b/sound/soc/codecs/max98090.c
@@ -10,7 +10,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/codecs/pcm186x.c b/sound/soc/codecs/pcm186x.c
index dd21803ba13c..451a8fd8fac5 100644
--- a/sound/soc/codecs/pcm186x.c
+++ b/sound/soc/codecs/pcm186x.c
@@ -12,7 +12,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/regulator/consumer.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
diff --git a/sound/soc/codecs/rk3328_codec.c b/sound/soc/codecs/rk3328_codec.c
index 1d523bfd9d84..9697aefc6e03 100644
--- a/sound/soc/codecs/rk3328_codec.c
+++ b/sound/soc/codecs/rk3328_codec.c
@@ -11,7 +11,6 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/mfd/syscon.h>
 #include <sound/dmaengine_pcm.h>
diff --git a/sound/soc/codecs/rt5682-i2c.c b/sound/soc/codecs/rt5682-i2c.c
index d0041ba1e627..a88fcf507386 100644
--- a/sound/soc/codecs/rt5682-i2c.c
+++ b/sound/soc/codecs/rt5682-i2c.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
diff --git a/sound/soc/codecs/rt5682s.c b/sound/soc/codecs/rt5682s.c
index 81163b026b9e..cc12df15ee86 100644
--- a/sound/soc/codecs/rt5682s.c
+++ b/sound/soc/codecs/rt5682s.c
@@ -11,7 +11,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/i2c.h>
 #include <linux/platform_device.h>
 #include <linux/spi/spi.h>
diff --git a/sound/soc/codecs/tas2562.c b/sound/soc/codecs/tas2562.c
index 2012d6f0071d..962c2cdfa017 100644
--- a/sound/soc/codecs/tas2562.c
+++ b/sound/soc/codecs/tas2562.c
@@ -8,7 +8,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/gpio/consumer.h>
diff --git a/sound/soc/codecs/tas5720.c b/sound/soc/codecs/tas5720.c
index b07c51dc3f72..6dd6c0896eff 100644
--- a/sound/soc/codecs/tas5720.c
+++ b/sound/soc/codecs/tas5720.c
@@ -11,7 +11,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
diff --git a/sound/soc/codecs/tas6424.c b/sound/soc/codecs/tas6424.c
index a07cd1e016e0..da89e8c681dd 100644
--- a/sound/soc/codecs/tas6424.c
+++ b/sound/soc/codecs/tas6424.c
@@ -11,7 +11,6 @@
 #include <linux/errno.h>
 #include <linux/device.h>
 #include <linux/i2c.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/regulator/consumer.h>
diff --git a/sound/soc/codecs/wm_adsp.c b/sound/soc/codecs/wm_adsp.c
index 216120b68b64..20d64fe216be 100644
--- a/sound/soc/codecs/wm_adsp.c
+++ b/sound/soc/codecs/wm_adsp.c
@@ -15,7 +15,6 @@
 #include <linux/firmware.h>
 #include <linux/list.h>
 #include <linux/pm.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/slab.h>
diff --git a/sound/soc/fsl/imx-audmix.c b/sound/soc/fsl/imx-audmix.c
index efbcd4a65ca8..c93616e50f4d 100644
--- a/sound/soc/fsl/imx-audmix.c
+++ b/sound/soc/fsl/imx-audmix.c
@@ -15,7 +15,6 @@
 #include <linux/clk.h>
 #include <sound/soc.h>
 #include <sound/soc-dapm.h>
-#include <linux/pm_runtime.h>
 #include "fsl_sai.h"
 #include "fsl_audmix.h"
 
diff --git a/sound/soc/intel/atom/sst/sst_acpi.c b/sound/soc/intel/atom/sst/sst_acpi.c
index d3973936426a..29d44c989e5f 100644
--- a/sound/soc/intel/atom/sst/sst_acpi.c
+++ b/sound/soc/intel/atom/sst/sst_acpi.c
@@ -15,7 +15,6 @@
 #include <linux/io.h>
 #include <linux/platform_device.h>
 #include <linux/firmware.h>
-#include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <linux/dmi.h>
 #include <linux/acpi.h>
diff --git a/sound/soc/intel/atom/sst/sst_ipc.c b/sound/soc/intel/atom/sst/sst_ipc.c
index 4e039c7173d8..3fc2c9a6c44d 100644
--- a/sound/soc/intel/atom/sst/sst_ipc.c
+++ b/sound/soc/intel/atom/sst/sst_ipc.c
@@ -15,7 +15,6 @@
 #include <linux/firmware.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
diff --git a/sound/soc/intel/atom/sst/sst_loader.c b/sound/soc/intel/atom/sst/sst_loader.c
index eea889001c24..bf4ba6bcc429 100644
--- a/sound/soc/intel/atom/sst/sst_loader.c
+++ b/sound/soc/intel/atom/sst/sst_loader.c
@@ -20,7 +20,6 @@
 #include <linux/sched.h>
 #include <linux/firmware.h>
 #include <linux/dmaengine.h>
-#include <linux/pm_runtime.h>
 #include <linux/pm_qos.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index 5862fe968083..4058b4f80a0c 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -15,7 +15,6 @@
 #include <linux/pci.h>
 #include <linux/fs.h>
 #include <linux/firmware.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/soc.h>
 #include <asm/platform_sst_audio.h>
diff --git a/sound/soc/intel/atom/sst/sst_stream.c b/sound/soc/intel/atom/sst/sst_stream.c
index ea1ef8a61fa6..862a19ae5429 100644
--- a/sound/soc/intel/atom/sst/sst_stream.c
+++ b/sound/soc/intel/atom/sst/sst_stream.c
@@ -15,7 +15,6 @@
 #include <linux/firmware.h>
 #include <linux/sched.h>
 #include <linux/delay.h>
-#include <linux/pm_runtime.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/soc.h>
diff --git a/sound/soc/mediatek/mt8186/mt8186-afe-control.c b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
index d714e9641571..55edf6374578 100644
--- a/sound/soc/mediatek/mt8186/mt8186-afe-control.c
+++ b/sound/soc/mediatek/mt8186/mt8186-afe-control.c
@@ -6,7 +6,6 @@
 // Author: Jiaxin Yu <jiaxin.yu@mediatek.com>
 
 #include "mt8186-afe-common.h"
-#include <linux/pm_runtime.h>
 
 enum {
 	MTK_AFE_RATE_8K = 0,
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
index cdf54d1eb50d..0432f9d89020 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-da7219-max98357.c
@@ -10,7 +10,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/soc.h>
diff --git a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
index 7538274641fd..9c11016f032c 100644
--- a/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
+++ b/sound/soc/mediatek/mt8186/mt8186-mt6366-rt1019-rt5682s.c
@@ -12,7 +12,6 @@
 #include <linux/input.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
-#include <linux/pm_runtime.h>
 #include <sound/jack.h>
 #include <sound/pcm_params.h>
 #include <sound/rt5682.h>
diff --git a/sound/soc/mediatek/mt8192/mt8192-afe-control.c b/sound/soc/mediatek/mt8192/mt8192-afe-control.c
index 9163e05e54e1..d01b62e10088 100644
--- a/sound/soc/mediatek/mt8192/mt8192-afe-control.c
+++ b/sound/soc/mediatek/mt8192/mt8192-afe-control.c
@@ -6,8 +6,6 @@
 // Author: Shane Chien <shane.chien@mediatek.com>
 //
 
-#include <linux/pm_runtime.h>
-
 #include "mt8192-afe-common.h"
 
 enum {
diff --git a/sound/soc/soc-compress.c b/sound/soc/soc-compress.c
index d8715db5e415..02fdb683f75f 100644
--- a/sound/soc/soc-compress.c
+++ b/sound/soc/soc-compress.c
@@ -20,7 +20,6 @@
 #include <sound/initval.h>
 #include <sound/soc-dpcm.h>
 #include <sound/soc-link.h>
-#include <linux/pm_runtime.h>
 
 static int snd_soc_compr_components_open(struct snd_compr_stream *cstream)
 {
diff --git a/sound/soc/soc-pcm.c b/sound/soc/soc-pcm.c
index adb69d7820a8..6365ad8ca7ef 100644
--- a/sound/soc/soc-pcm.c
+++ b/sound/soc/soc-pcm.c
@@ -14,7 +14,6 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/pinctrl/consumer.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/workqueue.h>
 #include <linux/export.h>
diff --git a/sound/soc/sof/intel/hda-loader-skl.c b/sound/soc/sof/intel/hda-loader-skl.c
index 69fdef8f89ae..1e77ca936f80 100644
--- a/sound/soc/sof/intel/hda-loader-skl.c
+++ b/sound/soc/sof/intel/hda-loader-skl.c
@@ -15,7 +15,6 @@
 #include <linux/mm.h>
 #include <linux/module.h>
 #include <linux/pci.h>
-#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/sof.h>
diff --git a/sound/soc/sof/intel/hda-stream.c b/sound/soc/sof/intel/hda-stream.c
index 8de422604ad5..b13acb959653 100644
--- a/sound/soc/sof/intel/hda-stream.c
+++ b/sound/soc/sof/intel/hda-stream.c
@@ -15,7 +15,6 @@
  * Hardware interface for generic Intel audio DSP HDA IP
  */
 
-#include <linux/pm_runtime.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/hda_register.h>
 #include <sound/sof.h>
diff --git a/sound/soc/sof/intel/skl.c b/sound/soc/sof/intel/skl.c
index 13efdb94d071..d24e64e71b58 100644
--- a/sound/soc/sof/intel/skl.c
+++ b/sound/soc/sof/intel/skl.c
@@ -19,7 +19,6 @@
 #include <linux/module.h>
 #include <linux/slab.h>
 #include <linux/pci.h>
-#include <linux/pm_runtime.h>
 #include <sound/hdaudio_ext.h>
 #include <sound/pcm_params.h>
 #include <sound/sof.h>
diff --git a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
index 2df3b7ae1c6f..cb2ab5884b8c 100644
--- a/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
+++ b/sound/soc/sof/mediatek/mt8186/mt8186-clk.c
@@ -8,7 +8,6 @@
 // Hardware interface for mt8186 DSP clock
 
 #include <linux/clk.h>
-#include <linux/pm_runtime.h>
 #include <linux/io.h>
 
 #include "../../sof-audio.h"
diff --git a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
index 9ef08e43aa38..7cffcad00f9b 100644
--- a/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
+++ b/sound/soc/sof/mediatek/mt8195/mt8195-clk.c
@@ -7,7 +7,6 @@
 // Hardware interface for mt8195 DSP clock
 
 #include <linux/clk.h>
-#include <linux/pm_runtime.h>
 #include <linux/io.h>
 #include "mt8195.h"
 #include "mt8195-clk.h"
diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac97.c
index c498145e76e0..a4073a746ae3 100644
--- a/sound/soc/tegra/tegra20_ac97.c
+++ b/sound/soc/tegra/tegra20_ac97.c
@@ -19,7 +19,6 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/platform_device.h>
-#include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
diff --git a/sound/soc/ti/omap-mcbsp-st.c b/sound/soc/ti/omap-mcbsp-st.c
index 8163f453bf36..b047add5d887 100644
--- a/sound/soc/ti/omap-mcbsp-st.c
+++ b/sound/soc/ti/omap-mcbsp-st.c
@@ -19,7 +19,6 @@
 #include <linux/delay.h>
 #include <linux/io.h>
 #include <linux/slab.h>
-#include <linux/pm_runtime.h>
 
 #include "omap-mcbsp.h"
 #include "omap-mcbsp-priv.h"
-- 
2.34.1

