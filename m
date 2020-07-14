Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13C7C21FFD0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 14 Jul 2020 23:17:11 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B5tcz73cHzDqd2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 07:17:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::542;
 helo=mail-pg1-x542.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=c4g5l41v; dkim-atps=neutral
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B5tZr0Vr1zDqQH
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 07:15:13 +1000 (AEST)
Received: by mail-pg1-x542.google.com with SMTP id t6so8316468pgq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 14:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=gUsxgEIbOCPN/g+dhdnfdWC6Rsm4WcdiQ4zDxdYgS80=;
 b=c4g5l41vPTzdfvBku6Gyyd9dtF0BOhHeYH39FPISi5h5zu/7m0KQBQAauU6DRWwCNI
 aJFxK5Oqe96j7ceibK0CyVHiTNei10p4jHaC3l7OVoXMCCEeHsi/Q8ezd90xrh3x8oJ6
 UwDEyUiPh3Ja1sl8MrwnF5+o4DsaE+nx8NDmDwYw98Nea3ZKmlTfZx3CCP800NIM0SOY
 CXa3j3AUDNMdDH2KvVLhkxmyCWqXWjSov+f1nxIO31O0Gx6YS7hwxXt8puB0/xHjTd2f
 u1Y3X+ybA8mclQRcyyvl59frNzSpsGVtHfR6Mbi41HgC+bFjI9xSl+k3C4ePbPUODuiP
 oeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=gUsxgEIbOCPN/g+dhdnfdWC6Rsm4WcdiQ4zDxdYgS80=;
 b=e/YbMAtrLLOtJICH1E3nhWLWC6uyV/f8v2TESnyGB4Qx6k46TdX1ybeFPUH/AYbPPp
 VEwXa0YbEXy66mPvazglWmwll4zN44WFZUvduM/qPxDJFLcZELKpR2+zUxJCcKXBJCbB
 8dyHVGKXri+Xi3lV5cgJ+nd4Ooq/z6sG8UVjOn1YmS/P5SEBIIJsWz96i2LAZxE6f5W+
 0IKQ5vtkwkJUTVGMGSG3xSE5z36K07kKrpFrzeBEZVHNvBEoZrmrnim41+hWjwGOJKrt
 d5ZuUnspqoYlWzRxvF0uxHS+f3rBXLt/USVlApJA7/G6cuoQ+eSHO8wV4FfC8Fjc3r5b
 bFhw==
X-Gm-Message-State: AOAM53398lKWV9Hmi1u6Sy3MG1mGp8n5d8a6DhHb/64O/PjhRlvT+Qws
 j+avo17jnatURb7vC9XMZ+o=
X-Google-Smtp-Source: ABdhPJwsRQ9mKCwSTE8ucb75FPjtcLbouSD8dQj1J5mA3EExVAJ2tJ3R4hWiETcAhJVqwmV+N1o7rA==
X-Received: by 2002:a63:441c:: with SMTP id r28mr4965134pga.372.1594761309828; 
 Tue, 14 Jul 2020 14:15:09 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id y17sm105760pfe.30.2020.07.14.14.15.08
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 14:15:09 -0700 (PDT)
Date: Tue, 14 Jul 2020 14:14:45 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and
 Microphone Jack detection
Message-ID: <20200714211432.GA10818@Asurada-Nvidia>
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
 linuxppc-dev@lists.ozlabs.org, timur@kernel.org,
 kuninori.morimoto.gx@renesas.com, samuel@sholland.org, katsuhiro@katsuster.net,
 linux-kernel@vger.kernel.org, Xiubo.Lee@gmail.com, lgirdwood@gmail.com,
 robh+dt@kernel.org, tiwai@suse.com, broonie@kernel.org, perex@perex.cz,
 festevam@gmail.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

The whole series looks good to me. Just a couple of small
questions inline:

On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> Use asoc_simple_init_jack function from simple card to implement
> the Headphone and Microphone detection.
> Register notifier to disable Speaker when Headphone is plugged in
> and enable Speaker when Headphone is unplugged.
> Register notifier to disable Digital Microphone when Analog Microphone
> is plugged in and enable DMIC when Analog Microphone is unplugged.
> 
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> ---
>  sound/soc/fsl/Kconfig         |  1 +
>  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
>  2 files changed, 68 insertions(+), 2 deletions(-)

>  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
>  {
>  	struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
>  	snd_soc_card_set_drvdata(&priv->card, priv);
>  
>  	ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> -	if (ret && ret != -EPROBE_DEFER)
> -		dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> +	if (ret) {
> +		if (ret != -EPROBE_DEFER)
> +			dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);

I think we may move this EPROBE_DEFER to the asrc_fail label.

> +		goto asrc_fail;
> +	}
> +
> +	if (of_property_read_bool(np, "hp-det-gpio")) {

Could we move this check inside asoc_simple_init_jack? There's no
problem with doing it here though, yet I got a bit confused by it
as I thought it's a boolean type property, which would be against
the DT bindings until I saw asoc_simple_init_jack() uses the same
string to get the GPIO. Just it probably would be a bit tricky as
we need it to be optional here.

Otherwise, I think we may add a line of comments to indicate that
the API would use the same string to get the GPIO.

> +		ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> +					    1, NULL, "Headphone Jack");
> +		if (ret)
> +			goto asrc_fail;
> +
> +		snd_soc_jack_notifier_register(&priv->hp_jack.jack, &hp_jack_nb);
> +	}
