Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB129260C4
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 14:45:34 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nmgAGu9Q;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WDfdS089Dz3dBX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  3 Jul 2024 22:45:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=cirrus.com header.i=@cirrus.com header.a=rsa-sha256 header.s=PODMain02222019 header.b=nmgAGu9Q;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=opensource.cirrus.com (client-ip=67.231.152.168; helo=mx0b-001ae601.pphosted.com; envelope-from=prvs=4914b47104=rf@opensource.cirrus.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 4334 seconds by postgrey-1.37 at boromir; Wed, 03 Jul 2024 22:44:54 AEST
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WDfck37rLz3cbg
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  3 Jul 2024 22:44:52 +1000 (AEST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4636mxjt003511;
	Wed, 3 Jul 2024 06:31:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=f37i3vEXbnh14lMCwflrH5FfWLKGacpcQ9pw+V8X0GM=; b=
	nmgAGu9QNNUy+G+YvJbJdLDq3r5Fy6Tlvw22gJFuOhC/HUVavm2zyhCYI2OsrfAU
	mDwZcEl1Ie0x2Rgl8iIhzLQtM75dpvKeYlXQz4E9/9wzgMOiW1NBymVDkVs0cTmu
	JrK/H/3DummtYV3aHM2KFCYbKNXUwvtz7SG9OT4cRFAPBEILdNBAos0jQqGiEr3t
	oi7Em/CxuTdS52KqxbQqLFHVuvcJjnJJi1ZWq5PU7lS2UOXmy0Q0EPAGOj1qBR7M
	lZ91HcM0b6ZMw/944h0ilF+OF6+f/+KyPnSZdWznrzM0Dnba7pZz4Xv9KWNq0Kg6
	bSGAR7m1b6TnrBo5lsVPKg==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 402epjd9kx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jul 2024 06:31:30 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 3 Jul 2024
 12:31:29 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 3 Jul 2024 12:31:29 +0100
Received: from [198.90.208.18] (ediswws06.ad.cirrus.com [198.90.208.18])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id E8801820244;
	Wed,  3 Jul 2024 11:31:28 +0000 (UTC)
Message-ID: <0796b481-3eec-4618-b92e-a372b7da5381@opensource.cirrus.com>
Date: Wed, 3 Jul 2024 12:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 17/20] ASoC: arizona: convert to
 of_property_for_each_u32_new()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Miguel Ojeda
	<ojeda@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan
	<saravanak@google.com>,
        Nathan Chancellor <nathan@kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, "Tony
 Lindgren" <tony@atomide.com>,
        Bjorn Andersson <andersson@kernel.org>,
        =?UTF-8?Q?Emilio_L=C3=B3pez?= <emilio@elopez.com.ar>,
        Chen-Yu Tsai
	<wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland
	<samuel@sholland.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Daniel Lezcano
	<daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Florian
 Fainelli" <florian.fainelli@broadcom.com>,
        "Broadcom internal kernel review
 list" <bcm-kernel-feedback-list@broadcom.com>,
        Linus Walleij
	<linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        "Jonathan
 Cameron" <jic23@kernel.org>, Lee Jones <lee@kernel.org>,
        Shawn Guo
	<shawnguo@kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        "Richard
 Leitner" <richard.leitner@linux.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>,
        Damien Le Moal <dlemoal@kernel.org>
References: <20240703-of_property_for_each_u32-v1-0-42c1fc0b82aa@bootlin.com>
 <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
Content-Language: en-GB
From: Richard Fitzgerald <rf@opensource.cirrus.com>
In-Reply-To: <20240703-of_property_for_each_u32-v1-17-42c1fc0b82aa@bootlin.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: CFz_RdAJOFjMU2QBvo3bIc4bvB6lzh5q
X-Proofpoint-ORIG-GUID: CFz_RdAJOFjMU2QBvo3bIc4bvB6lzh5q
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org, "Peng Fan \(OSS\)" <peng.fan@oss.nxp.com>, linux-pwm@vger.kernel.org, linux-iio@vger.kernel.org, linux-arm-msm@vger.kernel.org, llvm@lists.linux.dev, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, linux-sunxi@lists.linux.dev, linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, linux-usb@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-serial@vger.kernel.org, linux-riscv@lists.infradead.org, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/07/2024 11:37, Luca Ceresoli wrote:
> Simplify code using of_property_for_each_u32_new() as the two additional
> parameters in of_property_for_each_u32() are not used here.
> 
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   sound/soc/codecs/arizona.c | 12 +++++-------
>   1 file changed, 5 insertions(+), 7 deletions(-)
> 
> diff --git a/sound/soc/codecs/arizona.c b/sound/soc/codecs/arizona.c
> index 7434aeeda292..1a64b9815809 100644
> --- a/sound/soc/codecs/arizona.c
> +++ b/sound/soc/codecs/arizona.c
> @@ -2786,15 +2786,13 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
>   {
>   	struct arizona_pdata *pdata = &arizona->pdata;
>   	struct device_node *np = arizona->dev->of_node;
> -	struct property *prop;
> -	const __be32 *cur;
>   	u32 val;
>   	u32 pdm_val[ARIZONA_MAX_PDM_SPK];
>   	int ret;
>   	int count = 0;
>   
>   	count = 0;
> -	of_property_for_each_u32(np, "wlf,inmode", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "wlf,inmode", val) {
>   		if (count == ARRAY_SIZE(pdata->inmode))
>   			break;
>   
> @@ -2803,7 +2801,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
>   	}
>   
>   	count = 0;
> -	of_property_for_each_u32(np, "wlf,dmic-ref", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "wlf,dmic-ref", val) {
>   		if (count == ARRAY_SIZE(pdata->dmic_ref))
>   			break;
>   
> @@ -2812,7 +2810,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
>   	}
>   
>   	count = 0;
> -	of_property_for_each_u32(np, "wlf,out-mono", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "wlf,out-mono", val) {
>   		if (count == ARRAY_SIZE(pdata->out_mono))
>   			break;
>   
> @@ -2821,7 +2819,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
>   	}
>   
>   	count = 0;
> -	of_property_for_each_u32(np, "wlf,max-channels-clocked", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "wlf,max-channels-clocked", val) {
>   		if (count == ARRAY_SIZE(pdata->max_channels_clocked))
>   			break;
>   
> @@ -2830,7 +2828,7 @@ int arizona_of_get_audio_pdata(struct arizona *arizona)
>   	}
>   
>   	count = 0;
> -	of_property_for_each_u32(np, "wlf,out-volume-limit", prop, cur, val) {
> +	of_property_for_each_u32_new(np, "wlf,out-volume-limit", val) {
>   		if (count == ARRAY_SIZE(pdata->out_vol_limit))
>   			break;
>   
> 
Reviewed-by: Richard Fitzgerald <rf@opensource.cirrus.com>
