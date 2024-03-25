Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7477C88958D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 09:31:14 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQYGwCwg;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V35k81VfSz3vh3
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Mar 2024 19:31:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GQYGwCwg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=linux.intel.com (client-ip=198.175.65.19; helo=mgamail.intel.com; envelope-from=jarkko.nikula@linux.intel.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 63 seconds by postgrey-1.37 at boromir; Mon, 25 Mar 2024 18:55:15 AEDT
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V34wg5q2vz2xdg;
	Mon, 25 Mar 2024 18:55:15 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711353316; x=1742889316;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=G9pVMPBkGeSCKm7GL4349gPmBncBHLw8Di6BWoQcag0=;
  b=GQYGwCwguWSFTSN+jX2YZU1tBmUYhMJblIWluQKfZitlBidq26jjCEoo
   RYwAlE3HiGPStaIRcBDdryNh8NjEJC4Mo0foKGZKns8+DAS659gSByrRd
   zoSkSPZtOaRmuwOp6O0gsCRmrjBGoScIHKNcSgFRVKnySnwpd8moiJn5L
   abw7+/g1LYog2CBRrUKDQdm6Hiz4Y0bl6C3Hc+TvieDqbOCnMWp6ugCsO
   VTwuTlxKSFpxpvZwRUOV23lqiX/wyZBONbiTeozjYUuEqbcw/jHpksRMN
   j/APESYFc+JRUYoYTvofvUaSRwVhPWuD42AUAUwz+JS3X1t878kfZGCiO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11023"; a="6199192"
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="6199192"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2024 00:54:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,152,1708416000"; 
   d="scan'208";a="16197266"
Received: from marquiz-s-2.fi.intel.com (HELO [10.237.72.58]) ([10.237.72.58])
  by orviesa008.jf.intel.com with ESMTP; 25 Mar 2024 00:53:46 -0700
Message-ID: <1f1e59a4-359e-4679-8ea9-3d915a930e91@linux.intel.com>
Date: Mon, 25 Mar 2024 09:53:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 64/64] i2c: reword i2c_algorithm in drivers according to
 newest specification
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-i2c@vger.kernel.org
References: <20240322132619.6389-1-wsa+renesas@sang-engineering.com>
 <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Language: en-US
From: Jarkko Nikula <jarkko.nikula@linux.intel.com>
In-Reply-To: <20240322132619.6389-65-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Mon, 25 Mar 2024 19:29:51 +1100
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
Cc: Andrew Lunn <andrew@lunn.ch>, Shyam Sundar S K <shyam-sundar.s-k@amd.com>, Tomer Maimon <tmaimon77@gmail.com>, Ajay Gupta <ajayg@nvidia.com>, Viresh Kumar <viresh.kumar@linaro.org>, Linus Walleij <linus.walleij@linaro.org>, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, linux-stm32@st-md-mailman.stormreply.com, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Robert Foss <rfoss@kernel.org>, Aaro Koskinen <aaro.koskinen@iki.fi>, Khalil Blaiech <kblaiech@nvidia.com>, Oleksij Rempel <o.rempel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Nicholas Piggin <npiggin@gmail.com>, linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Yicong Yang <yangyicong@hisilicon.com>, Laxman Dewangan <ldewangan@nvidia.com>, Guenter Roeck <groeck@chromium.org>, chrome-platform@lists.linux.dev, Fabio Estevam <festevam@gmail.com>, Jonathan H
 unter <jonathanh@nvidia.com>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Alain Volmat <alain.volmat@foss.st.com>, Andi Shyti <andi.shyti@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-arm-msm@vger.kernel.org, Nicolas Ferre <nicolas.ferre@microchip.com>, Fabrizio Castro <fabrizio.castro.jz@renesas.com>, Nick Hawkins <nick.hawkins@hpe.com>, linux-amlogic@lists.infradead.org, Mika Westerberg <mika.westerberg@linux.intel.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Hector Martin <marcan@marcan.st>, linux-renesas-soc@vger.kernel.org, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Kevin Hilman <khilman@baylibre.com>, linux-mediatek@lists.infradead.org, imx@lists.linux.dev, Jean-Marie Verdun <verdun@hpe.com>, linux-tegra@vger.kernel.org, Elie Morisse <syniurge@gmail.com>, Krzysztof Adamski <krzysztof.adamski@nokia.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Peter Korsgaard <peter@korsgaard.com>, Benjamin Fair <be
 njaminfair@google.com>, Michal Simek <michal.simek@amd.com>, Nancy Yuen <yuenn@google.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, Robert Richter <rric@kernel.org>, Asmaa Mnebhi <asmaa@nvidia.com>, Vladimir Zapolskiy <vz@mleia.com>, Conghui Chen <conghui.chen@intel.com>, Benson Leung <bleung@chromium.org>, Qii Wang <qii.wang@mediatek.com>, Avi Fishman <avifishman70@gmail.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Konrad Dybcio <konrad.dybcio@linaro.org>, Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, Vignesh R <vigneshr@ti.com>, Tony Lindgren <tony@atomide.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Jan Dabros <jsd@semihalf.com>, openbmc@lists.ozlabs.org, Janusz Krzysztofik <jmkrzyszt@gmail.com>, Sven Peter <sven@svenpeter.dev>, virtualization@lists.linux.dev, Pierre-Yves MORDRET <pi
 erre-yves.mordret@foss.st.com>, Matthias Brugger <matthias.bgg@gmail.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Loic Poulain <loic.poulain@linaro.org>, Patrick Venture <venture@google.com>, Bjorn Andersson <andersson@kernel.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 3/22/24 3:25 PM, Wolfram Sang wrote:
> Match the wording in i2c_algorithm in I2C drivers wrt. the newest I2C
> v7, SMBus 3.2, I3C specifications and replace "master/slave" with more
> appropriate terms. For some drivers, this means no more conversions are
> needed. For the others more work needs to be done but this will be
> performed incrementally along with API changes/improvements. All these
> changes here are simple search/replace results.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>   drivers/i2c/busses/i2c-amd-mp2-plat.c      |  2 +-
>   drivers/i2c/busses/i2c-at91-master.c       |  2 +-
>   drivers/i2c/busses/i2c-at91-slave.c        |  8 ++++----
>   drivers/i2c/busses/i2c-axxia.c             | 10 +++++-----
>   drivers/i2c/busses/i2c-cros-ec-tunnel.c    |  2 +-
>   drivers/i2c/busses/i2c-designware-master.c |  2 +-
>   drivers/i2c/busses/i2c-designware-slave.c  |  8 ++++----
>   drivers/i2c/busses/i2c-diolan-u2c.c        |  2 +-
>   drivers/i2c/busses/i2c-exynos5.c           |  4 ++--
>   drivers/i2c/busses/i2c-gxp.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-hisi.c              |  4 ++--
>   drivers/i2c/busses/i2c-img-scb.c           |  2 +-
>   drivers/i2c/busses/i2c-imx.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-jz4780.c            |  2 +-
>   drivers/i2c/busses/i2c-kempld.c            |  2 +-
>   drivers/i2c/busses/i2c-meson.c             |  4 ++--
>   drivers/i2c/busses/i2c-mlxbf.c             |  8 ++++----
>   drivers/i2c/busses/i2c-mt65xx.c            |  2 +-
>   drivers/i2c/busses/i2c-mxs.c               |  2 +-
>   drivers/i2c/busses/i2c-nomadik.c           |  2 +-
>   drivers/i2c/busses/i2c-npcm7xx.c           | 12 ++++++------
>   drivers/i2c/busses/i2c-nvidia-gpu.c        |  4 ++--
>   drivers/i2c/busses/i2c-ocores.c            |  8 ++++----
>   drivers/i2c/busses/i2c-octeon-platdrv.c    |  2 +-
>   drivers/i2c/busses/i2c-omap.c              |  4 ++--
>   drivers/i2c/busses/i2c-opal.c              |  4 ++--
>   drivers/i2c/busses/i2c-pasemi-core.c       |  2 +-
>   drivers/i2c/busses/i2c-pnx.c               |  2 +-
>   drivers/i2c/busses/i2c-pxa.c               | 12 ++++++------
>   drivers/i2c/busses/i2c-qcom-cci.c          |  2 +-
>   drivers/i2c/busses/i2c-qcom-geni.c         |  2 +-
>   drivers/i2c/busses/i2c-robotfuzz-osif.c    |  2 +-
>   drivers/i2c/busses/i2c-rzv2m.c             |  8 ++++----
>   drivers/i2c/busses/i2c-s3c2410.c           |  4 ++--
>   drivers/i2c/busses/i2c-stm32f7.c           | 14 +++++++-------
>   drivers/i2c/busses/i2c-tegra-bpmp.c        |  4 ++--
>   drivers/i2c/busses/i2c-tegra.c             |  4 ++--
>   drivers/i2c/busses/i2c-thunderx-pcidrv.c   |  2 +-
>   drivers/i2c/busses/i2c-virtio.c            |  2 +-
>   drivers/i2c/busses/i2c-wmt.c               |  2 +-
>   drivers/i2c/busses/i2c-xiic.c              |  2 +-
>   41 files changed, 95 insertions(+), 95 deletions(-)
> 

> diff --git a/drivers/i2c/busses/i2c-designware-master.c b/drivers/i2c/busses/i2c-designware-master.c
> index c7e56002809a..14c61b31f877 100644
> --- a/drivers/i2c/busses/i2c-designware-master.c
> +++ b/drivers/i2c/busses/i2c-designware-master.c
> @@ -832,7 +832,7 @@ i2c_dw_xfer(struct i2c_adapter *adap, struct i2c_msg msgs[], int num)
>   }
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
> -	.master_xfer = i2c_dw_xfer,
> +	.xfer = i2c_dw_xfer,
>   	.functionality = i2c_dw_func,
>   };
>   
> diff --git a/drivers/i2c/busses/i2c-designware-slave.c b/drivers/i2c/busses/i2c-designware-slave.c
> index 2e079cf20bb5..b47ad6b16814 100644
> --- a/drivers/i2c/busses/i2c-designware-slave.c
> +++ b/drivers/i2c/busses/i2c-designware-slave.c
> @@ -58,7 +58,7 @@ static int i2c_dw_init_slave(struct dw_i2c_dev *dev)
>   	return 0;
>   }
>   
> -static int i2c_dw_reg_slave(struct i2c_client *slave)
> +static int i2c_dw_reg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -83,7 +83,7 @@ static int i2c_dw_reg_slave(struct i2c_client *slave)
>   	return 0;
>   }
>   
> -static int i2c_dw_unreg_slave(struct i2c_client *slave)
> +static int i2c_dw_unreg_target(struct i2c_client *slave)
>   {
>   	struct dw_i2c_dev *dev = i2c_get_adapdata(slave->adapter);
>   
> @@ -214,8 +214,8 @@ static irqreturn_t i2c_dw_isr_slave(int this_irq, void *dev_id)
>   
>   static const struct i2c_algorithm i2c_dw_algo = {
>   	.functionality = i2c_dw_func,
> -	.reg_slave = i2c_dw_reg_slave,
> -	.unreg_slave = i2c_dw_unreg_slave,
> +	.reg_target = i2c_dw_reg_target,
> +	.unreg_target = i2c_dw_unreg_target,
>   };

Acked-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
