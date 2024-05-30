Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EF5D18D55F3
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 01:04:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WLlLjl7V;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Vr1zn16Cyz3fpD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 09:04:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WLlLjl7V;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.11; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Vr1wS3KWgz3dX1
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 May 2024 09:02:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717110122; x=1748646122;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/9NwactfLrDdcsSkAc55CTXJmcNkzXYPFHItVyZLdX0=;
  b=WLlLjl7VkyrYJC5qsTaB5QXj4YfWjeqqkp2LnZwcO7Zc1+68Ka3mGm4b
   9Q6d0gUwWNrOUvEZKkzobD7LvP8+xNxY2SuY0j+xld3VqZmBoEwjHw7i/
   M+4N29D59+qAIBenAIRZT0rx/nK6+Cvo3aMSnxoxxDbYTkHdajnMGATHk
   oZqizr7xZ2L8X/ArwRlzx/eieVe2hmByiWeZ12OI0hmY/leK5hM/I1RFh
   ynJNa+mu2rT2DQScxgV9NPOu8qjQs8mQNjx9ARPsh3J3lvnMC76KsQeX0
   LwyUfRHMs5OW+h0i0QKBjE25FLAkAIbGA/5+ADiXmOee4b7b826t5xjXh
   Q==;
X-CSE-ConnectionGUID: d+K4VtshR2q4YSsxQJUqIA==
X-CSE-MsgGUID: babuBeB3SH6SoGYmC3/y8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="24195290"
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="24195290"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2024 16:00:51 -0700
X-CSE-ConnectionGUID: oJBYKXTMS6y/WfORsCy0/A==
X-CSE-MsgGUID: eLPKab+gQAunLOPngcKojQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,202,1712646000"; 
   d="scan'208";a="40895193"
Received: from black.fi.intel.com ([10.237.72.28])
  by orviesa003.jf.intel.com with ESMTP; 30 May 2024 16:00:41 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id E52A11A3; Fri, 31 May 2024 02:00:39 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Rob Herring <robh@kernel.org>,
	Weidong Wang <wangweidong.a@awinic.com>,
	Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Alper Nebi Yasak <alpernebiyasak@gmail.com>,
	Chancel Liu <chancel.liu@nxp.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	alsa-devel@alsa-project.org,
	patches@opensource.cirrus.com,
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v1 0/6] ASoC: Drop or replace of_gpio.h
Date: Fri, 31 May 2024 01:58:46 +0300
Message-ID: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.43.0.rc1.1336.g36b5255a03ac
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, James Schulman <james.schulman@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Jaroslav Kysela <perex@perex.cz>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, David Rhodes <david.rhodes@cirrus.com>, Baojun Xu <baojun.xu@ti.com>, Heiko Stuebner <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace or drop the legacy header that is subject to remove.
Not all of them were compile-tested, the series might have
hidden compilation errors.

Andy Shevchenko (6):
  ASoC: codecs: Remove unused of_gpio.h
  ASoC: fsl: Remove unused of_gpio.h
  ASoC: rockchip: Remove unused of_gpio.h
  ASoC: codecs: Replace of_gpio.h by proper one
  ASoC: generic: Replace of_gpio.h by proper one
  ASoC: samsung: Replace of_gpio.h by proper one

 sound/soc/codecs/ak4118.c                           | 1 -
 sound/soc/codecs/ak4458.c                           | 1 -
 sound/soc/codecs/aw88395/aw88395.c                  | 2 +-
 sound/soc/codecs/aw88399.c                          | 1 -
 sound/soc/codecs/cs53l30.c                          | 1 -
 sound/soc/codecs/max98390.c                         | 1 -
 sound/soc/codecs/pcm3168a.c                         | 1 -
 sound/soc/codecs/rk817_codec.c                      | 1 -
 sound/soc/codecs/tas2552.c                          | 1 -
 sound/soc/codecs/tas2764.c                          | 1 -
 sound/soc/codecs/tas2770.c                          | 1 -
 sound/soc/codecs/tas2780.c                          | 1 -
 sound/soc/codecs/tas2781-comlib.c                   | 1 -
 sound/soc/codecs/tas2781-fmwlib.c                   | 1 -
 sound/soc/codecs/tas2781-i2c.c                      | 1 -
 sound/soc/codecs/tlv320adc3xxx.c                    | 1 -
 sound/soc/codecs/tlv320adcx140.c                    | 1 -
 sound/soc/codecs/tlv320aic31xx.c                    | 1 -
 sound/soc/codecs/ts3a227e.c                         | 1 -
 sound/soc/codecs/wsa883x.c                          | 1 -
 sound/soc/fsl/imx-es8328.c                          | 1 -
 sound/soc/fsl/imx-rpmsg.c                           | 2 --
 sound/soc/generic/audio-graph-card2-custom-sample.c | 3 ++-
 sound/soc/rockchip/rockchip_i2s.c                   | 1 -
 sound/soc/rockchip/rockchip_spdif.c                 | 1 -
 sound/soc/samsung/aries_wm8994.c                    | 2 +-
 26 files changed, 4 insertions(+), 27 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

