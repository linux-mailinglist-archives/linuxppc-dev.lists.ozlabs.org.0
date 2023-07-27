Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A987276433C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 03:08:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnMhty9U;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RBCM44KTFz3cmw
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jul 2023 11:08:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=HnMhty9U;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=andi.shyti@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RBBk53zySz2ytG;
	Thu, 27 Jul 2023 10:39:57 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0CE4261CEB;
	Thu, 27 Jul 2023 00:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DAFE0C433C7;
	Thu, 27 Jul 2023 00:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690418394;
	bh=hjLR4NUeMP4IVUC9ETRe2AQg79Rs8N5wqjGvIEE1P00=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HnMhty9UoZVYTW2+QGN9V5v0VmCGklzjGs/NcHhcqmP7o5s77N+NrhxYytPNdPYSz
	 cPvttFygDUPA6wFU6n0bunWdzCfsZvDk7ZNUOMkqL4S776tkebPFD7MIggAXnpqnVS
	 ID2FI1GaiZFtfsX5LoixIIXJP0jJpftfK7jHAQ/hHona7EIP8lGMLtH2ggAAMd5L/e
	 vlrk6qsAP/CjTn6GpLjsG7fkWifsXMd/j4O7ahabsR9ZQJrqhGnyNi+TsWLjwVq6E2
	 eDci/Cd+dvSGavZJBkJmF3gLVVOIs3vxRy7nD3xFF0RN+iCspjMdqfe+NKdpZDhMVf
	 THCzdK9MIDqnw==
Date: Thu, 27 Jul 2023 02:39:51 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] I2C: Explicitly include correct DT includes
Message-ID: <20230727003951.q7vyps26t4kjfwmm@intel.intel>
References: <20230714174619.4057577-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714174619.4057577-1-robh@kernel.org>
X-Mailman-Approved-At: Thu, 27 Jul 2023 11:04:55 +1000
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Tomer Maimon <tmaimon77@gmail.com>, Jean-Marie Verdun <verdun@hpe.com>, Tali Perry <tali.perry1@gmail.com>, Paul Cercueil <paul@crapouillou.net>, Wolfram Sang <wsa+renesas@sang-engineering.com>, Chris Brandt <chris.brandt@renesas.com>, Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org, Alim Akhtar <alim.akhtar@samsung.com>, Dmitry Osipenko <digetx@gmail.com>, Stefan Roese <sr@denx.de>, Fabio Estevam <festevam@gmail.com>, linux-kernel@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, linux-samsung-soc@vger.kernel.org, Benjamin Fair <benjaminfair@google.com>, Florian Fainelli <florian.fainelli@broadcom.com>, Peter Rosin <peda@axentia.se>, Kevin Hilman <khilman@baylibre.com>, Bartosz Golaszewski <brgl@bgdev.pl>, Khalil Blaiech <kblaiech@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nancy Yuen <yuenn@google.com>, Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, NXP Linux Tea
 m <linux-imx@nxp.com>, Orson Zhai <orsonzhai@gmail.com>, Codrin Ciubotariu <codrin.ciubotariu@microchip.com>, linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Asmaa Mnebhi <asmaa@nvidia.com>, Michael Hennerich <michael.hennerich@analog.com>, Manivannan Sadhasivam <mani@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Ray Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, Vladimir Zapolskiy <vz@mleia.com>, Chris Packham <chris.packham@alliedtelesis.co.nz>, linux-mediatek@lists.infradead.org, linux-rpi-kernel@lists.infradead.org, Nick Hawkins <nick.hawkins@hpe.com>, Chunyan Zhang <zhang.lyra@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, linux-amlogic@lists.infradead.org, Qii Wang <qii.wang@mediatek.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Dong Aisheng <aisheng.dong@nxp.com>, Nei
 l Armstrong <neil.armstrong@linaro.org>, Baolin Wang <baolin.wang@linux.alibaba.com>, Scott Branden <sbranden@broadcom.com>, Avi Fishman <avifishman70@gmail.com>, Patrick Venture <venture@google.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, Oleksij Rempel <linux@rempel-privat.de>, linux-renesas-soc@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Laxman Dewangan <ldewangan@nvidia.com>, linux-actions@lists.infradead.org, Pengutronix Kernel Team <kernel@pengutronix.de>, Andreas =?utf-8?Q?F=C3=A4rber?= <afaerber@suse.de>, Shawn Guo <shawnguo@kernel.org>, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Rob,

On Fri, Jul 14, 2023 at 11:46:16AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>

I went through all of the changes and they look fine to me.

Reviewed-by: Andi Shyti <andi.shyti@kernel.org> 

Thanks,
Andi
