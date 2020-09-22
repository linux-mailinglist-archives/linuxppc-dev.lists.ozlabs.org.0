Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A1AB274284
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 14:56:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BwhC62jkyzDqB5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Sep 2020 22:56:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=pengutronix.de (client-ip=2001:67c:670:201:290:27ff:fe1d:cc33;
 helo=metis.ext.pengutronix.de; envelope-from=pza@pengutronix.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=pengutronix.de
X-Greylist: delayed 1071 seconds by postgrey-1.36 at bilbo;
 Tue, 22 Sep 2020 22:27:30 AEST
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BwgYZ59TnzDqT3
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Sep 2020 22:27:23 +1000 (AEST)
Received: from dude02.hi.pengutronix.de ([2001:67c:670:100:1d::28])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1kKh6P-0007EV-MR; Tue, 22 Sep 2020 14:08:57 +0200
Received: from pza by dude02.hi.pengutronix.de with local (Exim 4.92)
 (envelope-from <pza@pengutronix.de>)
 id 1kKh6M-0003wj-DL; Tue, 22 Sep 2020 14:08:54 +0200
Date: Tue, 22 Sep 2020 14:08:54 +0200
From: Philipp Zabel <pza@pengutronix.de>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Subject: Re: [PATCH v2 1/2] ASoC: fsl_xcvr: Add XCVR ASoC CPU DAI driver
Message-ID: <20200922120854.GA15104@pengutronix.de>
References: <1600715292-28529-1-git-send-email-viorel.suman@oss.nxp.com>
 <1600715292-28529-2-git-send-email-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1600715292-28529-2-git-send-email-viorel.suman@oss.nxp.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-IRC: #ptxdist @freenode
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-Uptime: 14:07:31 up 213 days, 23:24, 242 users,  load average: 0.15, 0.91,
 2.62
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::28
X-SA-Exim-Mail-From: pza@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linuxppc-dev@lists.ozlabs.org
X-Mailman-Approved-At: Tue, 22 Sep 2020 22:54:27 +1000
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Shengjiu Wang <shengjiu.wang@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Rob Herring <robh+dt@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, NXP Linux Team <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, Viorel Suman <viorel.suman@gmail.com>,
 Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>,
 Jaroslav Kysela <perex@perex.cz>, Fabio Estevam <festevam@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 21, 2020 at 10:08:11PM +0300, Viorel Suman (OSS) wrote:
> From: Viorel Suman <viorel.suman@nxp.com>
> 
> XCVR (Audio Transceiver) is a on-chip functional module found
> on i.MX8MP. It support HDMI2.1 eARC, HDMI1.4 ARC and SPDIF.
> 
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>
> ---
>  sound/soc/fsl/Kconfig    |   10 +
>  sound/soc/fsl/Makefile   |    2 +
>  sound/soc/fsl/fsl_xcvr.c | 1343 ++++++++++++++++++++++++++++++++++++++++++++++
>  sound/soc/fsl/fsl_xcvr.h |  266 +++++++++
>  4 files changed, 1621 insertions(+)
>  create mode 100644 sound/soc/fsl/fsl_xcvr.c
>  create mode 100644 sound/soc/fsl/fsl_xcvr.h
> 
> diff --git a/sound/soc/fsl/Kconfig b/sound/soc/fsl/Kconfig
> index 3f76ff7..d04b64d 100644
> --- a/sound/soc/fsl/Kconfig
> +++ b/sound/soc/fsl/Kconfig
> @@ -95,6 +95,16 @@ config SND_SOC_FSL_EASRC
>  	  destination sample rate. It is a new design module compare with the
>  	  old ASRC.
>  
> +config SND_SOC_FSL_XCVR
> +	tristate "NXP Audio Transceiver (XCVR) module support"
> +	select REGMAP_MMIO
> +	select SND_SOC_IMX_PCM_DMA if SND_IMX_SOC != n
> +	select SND_SOC_GENERIC_DMAENGINE_PCM
> +	help
> +	  Say Y if you want to add Audio Transceiver (XCVR) support for NXP
> +	  iMX CPUs. XCVR is a digital module that supports HDMI2.1 eARC,
> +	  HDMI1.4 ARC and SPDIF.
> +
>  config SND_SOC_FSL_UTILS
>  	tristate
>  
> diff --git a/sound/soc/fsl/Makefile b/sound/soc/fsl/Makefile
> index b835eeb..1d2231f 100644
> --- a/sound/soc/fsl/Makefile
> +++ b/sound/soc/fsl/Makefile
> @@ -25,6 +25,7 @@ snd-soc-fsl-utils-objs := fsl_utils.o
>  snd-soc-fsl-dma-objs := fsl_dma.o
>  snd-soc-fsl-mqs-objs := fsl_mqs.o
>  snd-soc-fsl-easrc-objs := fsl_easrc.o
> +snd-soc-fsl-xcvr-objs := fsl_xcvr.o
>  
>  obj-$(CONFIG_SND_SOC_FSL_AUDMIX) += snd-soc-fsl-audmix.o
>  obj-$(CONFIG_SND_SOC_FSL_ASOC_CARD) += snd-soc-fsl-asoc-card.o
> @@ -38,6 +39,7 @@ obj-$(CONFIG_SND_SOC_FSL_UTILS) += snd-soc-fsl-utils.o
>  obj-$(CONFIG_SND_SOC_FSL_MQS) += snd-soc-fsl-mqs.o
>  obj-$(CONFIG_SND_SOC_FSL_EASRC) += snd-soc-fsl-easrc.o
>  obj-$(CONFIG_SND_SOC_POWERPC_DMA) += snd-soc-fsl-dma.o
> +obj-$(CONFIG_SND_SOC_FSL_XCVR) += snd-soc-fsl-xcvr.o
>  
>  # MPC5200 Platform Support
>  obj-$(CONFIG_SND_MPC52xx_DMA) += mpc5200_dma.o
> diff --git a/sound/soc/fsl/fsl_xcvr.c b/sound/soc/fsl/fsl_xcvr.c
> new file mode 100644
> index 00000000..7391bca
> --- /dev/null
> +++ b/sound/soc/fsl/fsl_xcvr.c
> @@ -0,0 +1,1343 @@
[...]
> +static int fsl_xcvr_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	const struct of_device_id *of_id;
> +	struct fsl_xcvr *xcvr;
> +	struct resource *ram_res, *regs_res, *rx_res, *tx_res;
> +	void __iomem *regs;
> +	int ret, irq;
> +
> +	of_id = of_match_device(fsl_xcvr_dt_ids, dev);
> +	if (!of_id)
> +		return -EINVAL;
> +
> +	xcvr = devm_kzalloc(dev, sizeof(*xcvr), GFP_KERNEL);
> +	if (!xcvr)
> +		return -ENOMEM;
> +
> +	xcvr->pdev = pdev;
> +	xcvr->ipg_clk = devm_clk_get(dev, "ipg");
> +	if (IS_ERR(xcvr->ipg_clk)) {
> +		dev_err(dev, "failed to get ipg clock\n");
> +		return PTR_ERR(xcvr->ipg_clk);
> +	}
> +
> +	xcvr->phy_clk = devm_clk_get(dev, "phy");
> +	if (IS_ERR(xcvr->phy_clk)) {
> +		dev_err(dev, "failed to get phy clock\n");
> +		return PTR_ERR(xcvr->phy_clk);
> +	}
> +
> +	xcvr->spba_clk = devm_clk_get(dev, "spba");
> +	if (IS_ERR(xcvr->spba_clk)) {
> +		dev_err(dev, "failed to get spba clock\n");
> +		return PTR_ERR(xcvr->spba_clk);
> +	}
> +
> +	xcvr->pll_ipg_clk = devm_clk_get(dev, "pll_ipg");
> +	if (IS_ERR(xcvr->pll_ipg_clk)) {
> +		dev_err(dev, "failed to get pll_ipg clock\n");
> +		return PTR_ERR(xcvr->pll_ipg_clk);
> +	}
> +
> +	ram_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ram");
> +	xcvr->ram_addr = devm_ioremap_resource(dev, ram_res);
> +	if (IS_ERR(xcvr->ram_addr))
> +		return PTR_ERR(xcvr->ram_addr);
> +
> +	regs_res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "regs");
> +	regs = devm_ioremap_resource(dev, regs_res);
> +	if (IS_ERR(regs))
> +		return PTR_ERR(regs);
> +
> +	xcvr->regmap = devm_regmap_init_mmio_clk(dev, NULL, regs,
> +						 &fsl_xcvr_regmap_cfg);
> +	if (IS_ERR(xcvr->regmap)) {
> +		dev_err(dev, "failed to init XCVR regmap: %ld\n",
> +			PTR_ERR(xcvr->regmap));
> +		return PTR_ERR(xcvr->regmap);
> +	}
> +
> +	xcvr->reset = of_reset_control_get(np, NULL);

Please use devm_reset_control_get_exclusive().

[...]
> +static __maybe_unused int fsl_xcvr_runtime_resume(struct device *dev)
> +{
> +	struct fsl_xcvr *xcvr = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = clk_prepare_enable(xcvr->ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start IPG clock.\n");
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->pll_ipg_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PLL IPG clock.\n");
> +		goto stop_ipg_clk;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->phy_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start PHY clock: %d\n", ret);
> +		goto stop_pll_ipg_clk;
> +	}
> +
> +	ret = clk_prepare_enable(xcvr->spba_clk);
> +	if (ret) {
> +		dev_err(dev, "failed to start SPBA clock.\n");
> +		goto stop_phy_clk;
> +	}
> +
> +	regcache_cache_only(xcvr->regmap, false);
> +	regcache_mark_dirty(xcvr->regmap);
> +	ret = regcache_sync(xcvr->regmap);
> +
> +	if (ret) {
> +		dev_err(dev, "failed to sync regcache.\n");
> +		goto stop_spba_clk;
> +	}
> +
> +	reset_control_assert(xcvr->reset);
> +	reset_control_deassert(xcvr->reset);

No delay required between the two?

regards
Philipp
