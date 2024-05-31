Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 303F58D65D1
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 17:32:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YT+9jQg6;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrRvq2ws0z3ftZ
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 01:32:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=YT+9jQg6;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.17; helo=mgamail.intel.com; envelope-from=andriy.shevchenko@linux.intel.com; receiver=lists.ozlabs.org)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrRsW04Dgz3fmT
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 01:30:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717169455; x=1748705455;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=hsjA0x6Srt7WNltFPQm36M1XEQClgGGCUWLHMkEXdTw=;
  b=YT+9jQg6ROLiTIR2loc+gu467/qFCoLB+476yFr805YZDnr0VN6K/X0p
   klDTAbX4S4ZydlBmfDKNR+0iIOXLFhKVdqwVO6qhqu8wsyTcP4tMFDT1m
   nTidGRln19bVBDwb2TnH7zUZ04LC3xL0fwANSQK9nfuXpzDei5DzAXCV4
   6AngJDqIqVubArMxz24GSWqydv91S7IBmjCKzMiAusyZT5lyVRJ+5/Kiz
   TpYARsJItwZg+1wahSROCSj+c7R/MCkkgeeEklpzGvvsbL55lGeR8mDJu
   i589FVSV6QpKdRRsn1coVX70qfzixkCD6ZlskosUIyMbUBW3DiT3NyUFi
   Q==;
X-CSE-ConnectionGUID: Zw7YksInTIipNHsiBzixOw==
X-CSE-MsgGUID: FH35cM4tQQq6hR0c8ccLBg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="13839583"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="13839583"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2024 08:30:50 -0700
X-CSE-ConnectionGUID: rj6obq2ERMO5QDiPGyKZ2g==
X-CSE-MsgGUID: q2N5xO0fShaiM6SvMI6SaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; 
   d="scan'208";a="40627259"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa003.fm.intel.com with ESMTP; 31 May 2024 08:30:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
	id 8ED9F228; Fri, 31 May 2024 18:30:39 +0300 (EEST)
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
	linuxppc-dev@lists.ozlabs.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org
Subject: [PATCH v2 0/6] ASoC: Drop or replace of_gpio.h
Date: Fri, 31 May 2024 18:29:27 +0300
Message-ID: <20240531153038.1590171-1-andriy.shevchenko@linux.intel.com>
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
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, Fabio Estevam <festevam@gmail.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Liam Girdwood <lgirdwood@gmail.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Sascha Hauer <s.hauer@pengutronix.de>, Xiubo Li <Xiubo.Lee@gmail.com>, Takashi Iwai <tiwai@suse.com>, David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Banajit Goswami <bgoswami@quicinc.com>, Shawn Guo <shawnguo@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Jaroslav Kysela <perex@perex.cz>, Baojun Xu <baojun.xu@ti.com>, Heiko Stuebner <heiko@sntech.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Replace or drop the legacy header that is subject to remove.
Not all of them were compile-tested, the series might have
hidden compilation errors.

In v2:
- added tags (Kuninori, Charles)
- ripped out TAS2781 (it's a mess from GPIO handling perspective)

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
 23 files changed, 4 insertions(+), 24 deletions(-)

-- 
2.43.0.rc1.1336.g36b5255a03ac

