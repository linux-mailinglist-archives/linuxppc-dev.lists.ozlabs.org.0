Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F747B1830
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 12:22:56 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C07hz1x9;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rx8gf5MCdz3cjV
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Sep 2023 20:22:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=C07hz1x9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=vkoul@kernel.org; receiver=lists.ozlabs.org)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rx5GT2nKyz2ytV
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Sep 2023 17:49:21 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D8092B81A6E;
	Thu, 28 Sep 2023 07:49:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A57C433C8;
	Thu, 28 Sep 2023 07:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695887357;
	bh=Gs6aFP7wkoeloUPjh3P+7ZqWXKrUV+lmRvPOXvjf8Ds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=C07hz1x9ZBOot13NmBg/w+8/7UOMHZqam5kdmBhRs0FIMx+p817yeI0/AwYqADdFf
	 LyROsByfc7udfgvzO+iVFxt40scEHqiTsEuBV2anPvz2pvOqA5rNaglngGFVYkDqNi
	 8llzR1bKPikKnXdUU/UiExt0M1sNhonfI2Tg9VWZ4Ep2jjWHYlWMlubIYLpGAoPemh
	 /llBuONh0YVRMZh24Aia4Qvo0KfHmtLVm+XDoqoKF4CTK02whHvixcoVQ+egWgMk7x
	 FTO4SCB3n9ecoNHU2OdnjDnT9Gq59BrqP6Jgw3zOEG+2pLxraJj4zpxQ8BtWBKRvcG
	 KuqZYg3uAID5g==
Date: Thu, 28 Sep 2023 13:19:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Subject: Re: [PATCH 00/59] dma: Convert to platform remove callback returning
 void
Message-ID: <ZRUv+WgkovPotwIr@matsya>
References: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230919133207.1400430-1-u.kleine-koenig@pengutronix.de>
X-Mailman-Approved-At: Thu, 28 Sep 2023 20:21:23 +1000
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
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, linux-arm-msm@vger.kernel.org, Brian Xu <brian.xu@amd.com>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Paul Cercueil <paul@crapouillou.net>, Biju Das <biju.das.jz@bp.renesas.com>, Chen-Yu Tsai <wens@csie.org>, Laxman Dewangan <ldewangan@nvidia.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>, Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>, Swati Agarwal <swati.agarwal@amd.com>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>, Lars-Peter Clausen <lars@metafoo.de>, Florian Fainelli <florian.fainelli@broadcom.com>, Samuel Holland <samuel@sholland.org>, Green Wan <green.wan@sifive.com>, Viresh Kumar <vireshk@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Sinan Kaya <okaya@kernel.org>, Ludovic Desroches <ludovic.desroches@microchip.com>, Peter Ujfalusi <peter.ujfalu
 si@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, Zhang Wei <zw@zh-kernel.org>, Tudor Ambarus <tudor.ambarus@linaro.org>, Andy Gross <agross@kernel.org>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Team <linux-imx@nxp.com>, ye xingchen <ye.xingchen@zte.com.cn>, Olivier Dautricourt <olivierdautricourt@gmail.com>, Yangtao Li <frank.li@vivo.com>, Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>, Patrice Chotard <patrice.chotard@foss.st.com>, linux-tegra@vger.kernel.org, Kees Cook <keescook@chromium.org>, Sven Peter <sven@svenpeter.dev>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@mediatek.com>, linux-actions@lists.infradead.org, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Haojian Zhuang <haojian.zhuang@gmail.com>, Liu Shixin <liushixin2@huawei.com>, Robert Jarzmik <robert.jarzmik@free.fr>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Baolin Wang <baolin.wang@
 linux.alibaba.com>, Orson Zhai <orsonzhai@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, Raj Kumar Rampelli <raj.kumar.rampelli@amd.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Michal Simek <michal.simek@amd.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Harini Katakam <harini.katakam@amd.com>, Lizhi Hou <lizhi.hou@amd.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Hector Martin <marcan@marcan.st>, linux-mips@vger.kernel.org, Li Yang <leoyang.li@nxp.com>, Konrad Dybcio <konrad.dybcio@linaro.org>, linux-sunxi@lists.linux.dev, Thierry Reding <thierry.reding@gmail.com>, asahi@lists.linux.dev, kernel@pengutronix.de, Pavel Machek <pavel@denx.de>, dmaengine@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>, Daniel Mack <daniel@z
 onque.org>, Hien Huynh <hien.huynh.px@renesas.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 19-09-23, 15:31, Uwe Kleine-König wrote:
> Hello,
> 
> this series convert nearly all platform drivers below drivers/dma to use
> .remove_new(). The motivation is to get rid of an integer return code
> that is (mostly) ignored by the platform driver core and error prone on
> the driver side.

I have applied this, with change of subsystem to dmaengine: xxx
> 
> See commit 5c5a7680e67b ("platform: Provide a remove callback that
> returns no value") for an extended explanation and the eventual goal.
> 
> There are 4 drivers I didn't convert in this series:
> 
> 	drivers/dma/milbeaut-hdmac.c
> 	drivers/dma/milbeaut-xdmac.c
> 	drivers/dma/uniphier-mdmac.c
> 	drivers/dma/uniphier-xdmac.c
> 
> These all might return early in .remove() if dmaengine_terminate_sync()
> fails. I only looked deeper into the first one, and this shows exactly
> the error that is easy to make with .remove() returning an int: When
> returning early from .remove(), some cleanup (here:
> dma_async_device_unregister()) is skipped. So the dma device stays
> known, but the device is still unregistered and the devm allocated stuff
> (here e.g. *mdev) is freed. So it can probably easily happen, that
> something tries to use the dma device and this will likely result in an
> oops.

We should convert these too, thanks for your work for the conversion

-- 
~Vinod
