Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A18EF706499
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 11:52:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QLpLD49lMz3fDJ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 May 2023 19:52:20 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=XlTGI1OJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=microchip.com (client-ip=68.232.154.123; helo=esa.microchip.iphmx.com; envelope-from=claudiu.beznea@microchip.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.a=rsa-sha256 header.s=mchp header.b=XlTGI1OJ;
	dkim-atps=neutral
X-Greylist: delayed 63 seconds by postgrey-1.36 at boromir; Wed, 17 May 2023 19:51:34 AEST
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QLpKL13ymz3bfw
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 May 2023 19:51:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684317094; x=1715853094;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Mtw2/tREMJ9jAsgNoVakn6fr09xbBwzqX6/cCqtFuL4=;
  b=XlTGI1OJX5d6O2lUBcPTHWq/1t7RslewU1Z8X+PRiBpceKDed3pUafbD
   CjAUsQvxroVrq1wzxavoQx2YAThFiPG3vzqXwIXMeCJU5rJGRfqUJbNeM
   X1Uuqev2kXnbL4Q4LHMBMI/6l3wVBBVATbqyYsK+j8qoK5jpoIQjWStIl
   z/o0HZDMT9vR+AKZiGOJcDprfu25M+EWwZHOo2dmLk3NKMhTDOdv7FZrI
   2uZ6BdNY1sXtgapo7YqENDLYW/1FhfyWMxuUAANR8Z+K1rJGDLUpJSo+j
   MoJ7DBtvaZ1wZC9jn/I/8RVmHoFMauHIgUfKWssiM+DHu2RwzIcYBrNMB
   w==;
X-IronPort-AV: E=Sophos;i="5.99,281,1677567600"; 
   d="scan'208";a="215854634"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 May 2023 02:50:22 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 17 May 2023 02:50:19 -0700
Received: from m18063-ThinkPad-T460p.mchp-main.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 17 May 2023 02:50:09 -0700
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
Subject: [PATCH v2 0/2] ASoC: do not include runtime_pm.h if not needed
Date: Wed, 17 May 2023 12:49:01 +0300
Message-ID: <20230517094903.2895238-1-claudiu.beznea@microchip.com>
X-Mailer: git-send-email 2.34.1
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

Hi,

Series removes the pm_runtime.h inclusion in files where
APIs exported though pm_runtime.h are not used. In case
of files that make use of pm.h which comes form pm_runtime.h
added patch 2/2.

Changes were built with allmodconfig on ARM and x86_64 and checked
all the changed files were built at least once.

Thank you,
Claudiu Beznea

Changes in v2:
- removed cs35l45 handling
- changed a bit commit description
- added patch 2/2
- collected Jarkko Nikula's tag

Claudiu Beznea (2):
  ASoC: do not include pm_runtime.h if not used
  ASoC: use pm.h instead of runtime_pm.h

 sound/hda/hdac_regmap.c                                   | 1 -
 sound/pci/hda/hda_bind.c                                  | 1 -
 sound/soc/amd/acp/acp-pci.c                               | 1 -
 sound/soc/amd/acp/acp-platform.c                          | 1 -
 sound/soc/codecs/max98090.c                               | 1 -
 sound/soc/codecs/max98373-i2c.c                           | 2 +-
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
 sound/soc/qcom/lpass-sc7180.c                             | 2 +-
 sound/soc/qcom/lpass-sc7280.c                             | 2 +-
 sound/soc/soc-compress.c                                  | 1 -
 sound/soc/soc-pcm.c                                       | 1 -
 sound/soc/sof/intel/hda-loader-skl.c                      | 1 -
 sound/soc/sof/intel/hda-stream.c                          | 1 -
 sound/soc/sof/intel/skl.c                                 | 1 -
 sound/soc/sof/mediatek/mt8186/mt8186-clk.c                | 1 -
 sound/soc/sof/mediatek/mt8195/mt8195-clk.c                | 1 -
 sound/soc/tegra/tegra20_ac97.c                            | 1 -
 sound/soc/ti/omap-mcbsp-st.c                              | 1 -
 35 files changed, 3 insertions(+), 36 deletions(-)

-- 
2.34.1

