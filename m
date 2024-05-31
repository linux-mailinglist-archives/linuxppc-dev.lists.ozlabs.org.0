Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C38D6590
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 May 2024 17:17:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cgV8psTi;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4VrRYg1BgBz3flr
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Jun 2024 01:17:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=cgV8psTi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.149.25; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=38813a1e1d=ckeepax@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1078 seconds by postgrey-1.37 at boromir; Sat, 01 Jun 2024 01:16:33 AEST
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4VrRXx0bvjz3flb
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Jun 2024 01:16:31 +1000 (AEST)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44V9Swso003313;
	Fri, 31 May 2024 09:58:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=PODMain02222019; bh=hxGvSEqlUm/4Gr1/Y7
	FisaucBu8jAHnTKI/Obg6VI9c=; b=cgV8psTiVp2etlgNlYKT/Xz5UTa72Adwnp
	Mz2p1O9qHqFUPa15bt9k4vOaw0BFh7bPfJ1p4wP2ArTWshr7L1GtTFZWa18VmbEX
	efyhNCr7LGDVTGEkFIdZ0+fQ7lrmWR08B7gFutkTdq4gik7dVbbMx17C3hPbsiqX
	FCCs7+w31Fz3cjSd/vTp8fxiOXlBH0SixpDYUeNAgOZyC/WqXTvNGN/y23eabUCD
	5uteqKIcoNKlQlCxYfRo5l/rbU0dUpjor+W6lYVOnFoOCyW4y/NdaGcm+icIdEzg
	FzQyVFTV5U46MBSRn9vkeAmsXDfnV3tfBs9CiTKaysNGvNIL1WOg==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3ybdcwwwuu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 31 May 2024 09:58:06 -0500 (CDT)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 31 May
 2024 15:58:04 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Fri, 31 May 2024 15:58:04 +0100
Received: from opensource.cirrus.com (ediswmail9.ad.cirrus.com [198.61.86.93])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTPS id 05CBE820244;
	Fri, 31 May 2024 14:58:04 +0000 (UTC)
Date: Fri, 31 May 2024 14:58:02 +0000
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/6] ASoC: codecs: Remove unused of_gpio.h
Message-ID: <ZlnleuSae2C6/WRU@opensource.cirrus.com>
References: <20240530230037.1156253-1-andriy.shevchenko@linux.intel.com>
 <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20240530230037.1156253-2-andriy.shevchenko@linux.intel.com>
X-Proofpoint-GUID: QOHrrhhsAlL1BvB8LD1NFqOZRJaPkXqI
X-Proofpoint-ORIG-GUID: QOHrrhhsAlL1BvB8LD1NFqOZRJaPkXqI
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
Cc: imx@lists.linux.dev, alsa-devel@alsa-project.org, Heiko Stuebner <heiko@sntech.de>, Kuninori
 Morimoto <kuninori.morimoto.gx@renesas.com>, Xiubo Li <Xiubo.Lee@gmail.com>, Marco Felsch <m.felsch@pengutronix.de>, David Rhodes <david.rhodes@cirrus.com>, Kevin Lu <kevin-lu@ti.com>, Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Shawn Guo <shawnguo@kernel.org>, Shengjiu Wang <shengjiu.wang@gmail.com>, Rob Herring <robh@kernel.org>, Fabio Estevam <festevam@gmail.com>, Takashi Iwai <tiwai@suse.com>, Richard Fitzgerald <rf@opensource.cirrus.com>, linux-rockchip@lists.infradead.org, Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>, Baojun Xu <baojun.xu@ti.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Sascha Hauer <s.hauer@pengutronix.de>, Shenghao Ding <shenghao-ding@ti.com>, James
 Schulman <james.schulman@cirrus.com>, Nicolin Chen <nicoleotsuka@gmail.com>, Alper Nebi Yasak <alpernebiyasak@gmail.com>, Mark Brown <broonie@kernel.org>, linux-sound@vger.kernel.org, Jaroslav Kysela <perex@perex.cz>, linux-arm-kernel@lists.infradead.org, Weidong Wang <wangweidong.a@awinic.com>, Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org, Chancel Liu <chancel.liu@nxp.com>, Banajit Goswami <bgoswami@quicinc.com>, patches@opensource.cirrus.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, May 31, 2024 at 01:58:47AM +0300, Andy Shevchenko wrote:
> of_gpio.h is deprecated and subject to remove. The drivers in question
> don't use it, simply remove the unused header.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  sound/soc/codecs/cs53l30.c        | 1 -

Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Thanks,
Charles
