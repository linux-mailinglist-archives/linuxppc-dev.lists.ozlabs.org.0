Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3FF7B7AB0
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 10:51:55 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FkPSHjHT;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0pMZ1YXvz3ccQ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 19:51:38 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=FkPSHjHT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5641f542b1=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1290 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 19:50:50 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0pLf24fwz30Q4
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 19:50:49 +1100 (AEDT)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3948ScCJ021667;
	Wed, 4 Oct 2023 03:28:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=cx4j1u2cB/RSNNO
	JLWI4IUS4jJGgAFRWe5mxjA6ot+c=; b=FkPSHjHTRZJ7+JgSxFK8tXOclrwQk6D
	erGe55nCKmcgwS4pjnCa7kx1t0KIUQRtp6DiLVx44+462zqwJ8IHQxXw3IZS3qCK
	dgoVBaX0bfhZaQm0BRHVtj0P6703R28AQy9Moikhz0h1Hk5FfaFO+6kD95DFY1n4
	6OV+Nm6qkRSYAlc/A3eMbDBImbyhazxV2Ob1kCGGe1jsAo342KW2wxFmjc9kfXI5
	uZVCADBJlHGRF/5hjD2uAdYyKdiCYm2rPazpPjo5nz/x5wiAxgTj0cBQUhiTkISf
	HLO6AcCL2/hwACfFWus/kRMLo9mY4pCvdBfYY9IzNGhz9DH3nUAvmNQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3teg3k55km-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 03:28:38 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 4 Oct
 2023 09:28:36 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 4 Oct 2023 09:28:36 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 6973611AA;
	Wed,  4 Oct 2023 08:28:36 +0000 (UTC)
Date: Wed, 4 Oct 2023 08:28:36 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 1/5] ASoC: Explicitly include correct DT includes
Message-ID: <20231004082836.GP103419@ediswmail.ad.cirrus.com>
References: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
 <20231003-dt-asoc-header-cleanups-v1-1-308666806378@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-1-308666806378@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-GUID: jGlpUZphMoUFhGT30mAikeonWPxMmR74
X-Proofpoint-ORIG-GUID: jGlpUZphMoUFhGT30mAikeonWPxMmR74
X-Proofpoint-Spam-Reason: safe
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
Cc: Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Heiko Stuebner <heiko@sntech.de>, Bard Liao <yung-chuan.liao@linux.intel.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Cezary Rojewski <cezary.rojewski@intel.com>, Takashi Iwai <tiwai@suse.com>, Kevin Lu <kevin-lu@ti.com>, Thierry Reding <thierry.reding@gmail.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Fabio Estevam <festevam@gmail.com>, Kai Vehmanen <kai.vehmanen@linux.intel.com>, Lars-Peter
 Clausen <lars@metafoo.de>, Ban Tao <fengzheng923@gmail.com>, Samuel Holland <samuel@sholland.org>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Shengjiu Wang <shengjiu.wang@gmail.com>, Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Nicolas Frattaroli <frattaroli.nicolas@gmail.com>, Chen-Yu Tsai <wens@csie.org>, NXP Linux Team <linux-imx@nxp.com>, Olivier Moysan <olivier.moysan@foss.st.com>, Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, Banajit Goswami <bgoswami@quicinc.com>, alsa-devel@alsa-project.org, Ray
 Jui <rjui@broadcom.com>, Sascha Hauer <s.hauer@pengutronix.de>, linuxppc-dev@lists.ozlabs.org, Shenghao Ding <shenghao-ding@ti.com>, James Schulman <james.schulman@cirrus.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, Mark Brown <broonie@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Oder Chiou <oder_chiou@realtek.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Support Opensource <support.opensource@diasemi.com>, Scott Branden <sbranden@broadcom.com>, Shawn Guo <shawnguo@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, Kiseok Jo <kiseok.jo@irondevice.com>, Peter Ujfalusi <peter.ujfalusi@gmail.com>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, patches@opensource.cirrus.com, Ranjani Sridharan <r.anjani.sridharan@linux.intel.com>, Kevin Cernekee <cernekee@chromium.org>, David Rhodes <david.rhodes@cirrus.com>, Peter Rosin <peda@axentia.se>, Jarkko Nikula <jarkko.nikula@bitmer.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 03, 2023 at 11:43:07AM -0500, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it was merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

For the Wolfson/Cirrus bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
