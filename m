Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CC9C7B7AC1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 10:52:28 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MKm1hEnL;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S0pNV1h7nz3cVd
	for <lists+linuxppc-dev@lfdr.de>; Wed,  4 Oct 2023 19:52:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=MKm1hEnL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=5641f542b1=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 974 seconds by postgrey-1.37 at boromir; Wed, 04 Oct 2023 19:51:01 AEDT
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S0pLs2vznz3c8n
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  4 Oct 2023 19:51:01 +1100 (AEDT)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 39461LK5031802;
	Wed, 4 Oct 2023 03:33:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	date:from:to:cc:subject:message-id:references:mime-version
	:content-type:in-reply-to; s=PODMain02222019; bh=C03Kz69TBbxck4h
	yYh7pZ/332ziUW1qlTgjfP8Qf2Tg=; b=MKm1hEnLBCfTn8s5VJjtjUgmfX/JTvm
	+OrRe1LWGGwQbaoNRf2GWfGYSjE6o45VTn1nyuudObMD4lODrlfjwrOlZtVOx6Qh
	37dHacwtaXA6jLq+M2WNBVm7MVHRQldFk2ZTFgTKQLNtyASpRXzz9EnpGq5mzSc1
	mIMYUabBH9Wst4ROoD5x0QVA1i/N1k5SpI3r8ACY7STWH5NcYwovm835M+4Z/TW8
	KlIAE8jw8j9AiyEpmE+APRK5qiC22T5sHotstaVVs1Lm9quG99MahE/rVrK66KPe
	3huRn/gK94po0HHXw77W4HccUrAoZSUK4itBjTrTuVLYFTYwHrdWGyw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3th2dt85sm-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Oct 2023 03:33:35 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Wed, 4 Oct
 2023 09:33:32 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.2.1118.37 via Frontend
 Transport; Wed, 4 Oct 2023 09:33:32 +0100
Received: from ediswmail.ad.cirrus.com (ediswmail.ad.cirrus.com [198.61.86.93])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 4BC2AB06;
	Wed,  4 Oct 2023 08:33:32 +0000 (UTC)
Date: Wed, 4 Oct 2023 08:33:32 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH 2/5] ASoC: Drop unnecessary of_match_device() calls
Message-ID: <20231004083332.GQ103419@ediswmail.ad.cirrus.com>
References: <20231003-dt-asoc-header-cleanups-v1-0-308666806378@kernel.org>
 <20231003-dt-asoc-header-cleanups-v1-2-308666806378@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20231003-dt-asoc-header-cleanups-v1-2-308666806378@kernel.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Proofpoint-ORIG-GUID: cvmrx7nPMYCDUdYHAhx7anCT9XLT2sn8
X-Proofpoint-GUID: cvmrx7nPMYCDUdYHAhx7anCT9XLT2sn8
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

On Tue, Oct 03, 2023 at 11:43:08AM -0500, Rob Herring wrote:
> If probe is reached, we've already matched the device and in the case of
> DT matching, the struct device_node pointer will be set. Therefore, there
> is no need to call of_match_device() in probe.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---

For the cirrus bits:

Acked-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
