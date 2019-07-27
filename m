Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 54F6D779D3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Jul 2019 17:12:39 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45wqFH2qn0zDqKV
	for <lists+linuxppc-dev@lfdr.de>; Sun, 28 Jul 2019 01:12:35 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.32; helo=huawei.com; envelope-from=yuehaibing@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45wq9Z3mxKzDqHk
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 28 Jul 2019 01:09:18 +1000 (AEST)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 40F02F258955C599E725;
 Sat, 27 Jul 2019 23:09:12 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Sat, 27 Jul 2019
 23:09:06 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <lgirdwood@gmail.com>, <broonie@kernel.org>, <perex@perex.cz>,
 <tiwai@suse.com>, <eric@anholt.net>, <wahrenst@gmx.net>,
 <f.fainelli@gmail.com>, <rjui@broadcom.com>, <sbranden@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <paul@crapouillou.net>,
 <timur@kernel.org>, <nicoleotsuka@gmail.com>, <Xiubo.Lee@gmail.com>,
 <festevam@gmail.com>, <shawnguo@kernel.org>, <s.hauer@pengutronix.de>,
 <kernel@pengutronix.de>, <linux-imx@nxp.com>, <matthias.bgg@gmail.com>,
 <jbrunet@baylibre.com>, <khilman@baylibre.com>, <daniel@zonque.org>,
 <haojian.zhuang@gmail.com>, <robert.jarzmik@free.fr>, <baohua@kernel.org>,
 <olivier.moysan@st.com>, <arnaud.pouliquen@st.com>,
 <mcoquelin.stm32@gmail.com>, <alexandre.torgue@st.com>, <mripard@kernel.org>, 
 <wens@csie.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
 <yamada.masahiro@socionext.com>, <michal.simek@xilinx.com>,
 <jcmvbkbc@gmail.com>
Subject: [PATCH -next 00/34] ASoC: use devm_platform_ioremap_resource() to
 simplify code
Date: Sat, 27 Jul 2019 23:07:04 +0800
Message-ID: <20190727150738.54764-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
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
Cc: linux-xtensa@linux-xtensa.org, alsa-devel@alsa-project.org,
 gregkh@linuxfoundation.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

devm_platform_ioremap_resource() internally have platform_get_resource()
and devm_ioremap_resource() in it. So instead of calling them separately
use devm_platform_ioremap_resource() directly.

YueHaibing (34):
  ASoC: tegra20_das: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: tegra: use devm_platform_ioremap_resource() to simplify code
  ASoC: rockchip: use devm_platform_ioremap_resource() to simplify code
  ASoC: ep93xx-i2s: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: mt8173: use devm_platform_ioremap_resource() to simplify code
  ASoC: mt6797: use devm_platform_ioremap_resource() to simplify code
  ASoC: imx-audmux: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: fsl_audmix: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: bcm2835-i2s: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: sirf: use devm_platform_ioremap_resource() to simplify code
  ASoC: mxs-saif: use devm_platform_ioremap_resource() to simplify code
  ASoC: spear: use devm_platform_ioremap_resource() to simplify code
  ASoC: kirkwood-i2s: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: xtfpga-i2s: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: stm32: sai: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: codecs: msm8916-wcd: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: codecs: jz4725b: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: mmp-sspa: use devm_platform_ioremap_resource() to simplify code
  ASoC: jz4740: use devm_platform_ioremap_resource() to simplify code
  ASoC: inno_rk3036: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: uniphier: evea: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: uniphier: aio-dma: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: psc-ac97: use devm_platform_ioremap_resource() to simplify code
  ASoC: au1x: psc-i2s: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: meson: g12a-tohdmitx: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: meson: axg-tdm-formatter: use devm_platform_ioremap_resource()
    to simplify code
  ASoC: meson: axg-pdm: use devm_platform_ioremap_resource() to simplify
    code
  ASoC: meson: axg-spdifin: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: meson: axg-spdifout: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: meson: axg-fifo: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: xlnx: use devm_platform_ioremap_resource() to simplify code
  ASoC: sun8i-codec-analog: use devm_platform_ioremap_resource() to
    simplify code
  ASoC: sunxi: sun50i-codec-analog: use devm_platform_ioremap_resource()
    to simplify code
  ASoC: sun8i-codec: use devm_platform_ioremap_resource() to simplify
    code

 sound/soc/au1x/psc-ac97.c                  | 5 ++---
 sound/soc/au1x/psc-i2s.c                   | 5 ++---
 sound/soc/bcm/bcm2835-i2s.c                | 4 +---
 sound/soc/cirrus/ep93xx-i2s.c              | 4 +---
 sound/soc/codecs/inno_rk3036.c             | 4 +---
 sound/soc/codecs/jz4725b.c                 | 4 +---
 sound/soc/codecs/jz4740.c                  | 4 +---
 sound/soc/codecs/msm8916-wcd-digital.c     | 4 +---
 sound/soc/codecs/rk3328_codec.c            | 4 +---
 sound/soc/fsl/fsl_audmix.c                 | 4 +---
 sound/soc/fsl/imx-audmux.c                 | 4 +---
 sound/soc/kirkwood/kirkwood-i2s.c          | 4 +---
 sound/soc/mediatek/mt6797/mt6797-afe-pcm.c | 5 +----
 sound/soc/mediatek/mt8173/mt8173-afe-pcm.c | 4 +---
 sound/soc/meson/axg-fifo.c                 | 4 +---
 sound/soc/meson/axg-pdm.c                  | 4 +---
 sound/soc/meson/axg-spdifin.c              | 4 +---
 sound/soc/meson/axg-spdifout.c             | 4 +---
 sound/soc/meson/axg-tdm-formatter.c        | 4 +---
 sound/soc/meson/g12a-tohdmitx.c            | 4 +---
 sound/soc/mxs/mxs-saif.c                   | 5 +----
 sound/soc/pxa/mmp-sspa.c                   | 4 +---
 sound/soc/sirf/sirf-usp.c                  | 4 +---
 sound/soc/spear/spdif_in.c                 | 5 ++---
 sound/soc/stm/stm32_sai.c                  | 4 +---
 sound/soc/sunxi/sun50i-codec-analog.c      | 4 +---
 sound/soc/sunxi/sun8i-codec-analog.c       | 4 +---
 sound/soc/sunxi/sun8i-codec.c              | 4 +---
 sound/soc/tegra/tegra20_das.c              | 4 +---
 sound/soc/tegra/tegra30_i2s.c              | 4 +---
 sound/soc/uniphier/aio-dma.c               | 4 +---
 sound/soc/uniphier/evea.c                  | 4 +---
 sound/soc/xilinx/xlnx_i2s.c                | 4 +---
 sound/soc/xilinx/xlnx_spdif.c              | 3 +--
 sound/soc/xtensa/xtfpga-i2s.c              | 4 +---
 35 files changed, 38 insertions(+), 106 deletions(-)

-- 
2.7.4


