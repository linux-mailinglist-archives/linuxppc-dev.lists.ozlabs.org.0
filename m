Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5D0398F22
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Jun 2021 17:44:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FwCy609d9z308S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Jun 2021 01:44:30 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20161025 header.b=VstgI3Ch;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::132;
 helo=mail-lf1-x132.google.com; envelope-from=festevam@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=VstgI3Ch; dkim-atps=neutral
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FwCxf3yVwz2xZ9
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Jun 2021 01:44:06 +1000 (AEST)
Received: by mail-lf1-x132.google.com with SMTP id a2so4079834lfc.9
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Jun 2021 08:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OBblrHGCs55cViW00rNijqacDYoorI2gMf91bLN8H6A=;
 b=VstgI3Ch9IUJL9QEJ7w2wz1Y5FqrOIB5LeLRPYhI+Y+BW3jN0++iSF7+3gaFX0A/sD
 RKgw8wEnssMKzm8dlJHQYhh2CRYsTi1G3Mid27IGhB34PujdNlv2V5DXn0LJPRiaVfYh
 Zk93v5k0AldhWQ6prr+RBo9gkfik8nlv7GFHFPfjnrAMuH74yHNILeeDTwhmkq4DKVba
 +ZtthrbaGwljl5F0ZDVVw6qLajvIPWu38YgA35tvnX6sCE2+LE6Njxw6N28L7t6OqYx/
 ruHTrgpVUz9kgqtx6Pw2ExDIOOyhOGBfMnpM7g/3adZgEoPgVWR3Pewt51pfjCiHn3qT
 oY8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OBblrHGCs55cViW00rNijqacDYoorI2gMf91bLN8H6A=;
 b=rEFrNM91N1EzNno9M0x0wyMDeXvRNRbg+ligJkM1mmBDsoh4gwqKHhJxx0PXLCFttW
 k34rNHtwp6MrI7uvUy5gAJsv3vd2H1rPPLt6gt4TutXBbWpWNgkYSMZymdC9x7hfe03J
 77Wr8LV6YCCGpH3YKmo9unKs2dalI0b40skzIwnqfdmIsdynOFKOz8bfX6wl1O5nNZ0p
 O54wKskWt5BhGWaUxUpxh8IdK1BSyZEHuRNP0N/T1kmHWDSbRyButy7j93XY5QHDQh2o
 OFfItnNZ1eR4cUmid3lY/F8lY/7jJA2m8gx4SfjhpJw5SqCbXxB3uxj8nwZBuB5yjXgU
 L/nw==
X-Gm-Message-State: AOAM5312AH0OpvghaflXh325Pf2DDROB4999YaVyeJ9HPp0/6SUNDqMs
 flAOwDXvbET/i7K9P/6bv8ayt3GdpQ690tGYeow=
X-Google-Smtp-Source: ABdhPJzdK7pAHWYASLkeaOmnuhJjmfN6soue4SZRfA3dMZz+X3wo1Jhzd9myvH2AuzGDmUg82lgYxpIsOTh6tU5E6hg=
X-Received: by 2002:ac2:51a9:: with SMTP id f9mr5025625lfk.223.1622648641044; 
 Wed, 02 Jun 2021 08:44:01 -0700 (PDT)
MIME-Version: 1.0
References: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
In-Reply-To: <1622616132-10391-1-git-send-email-shengjiu.wang@nxp.com>
From: Fabio Estevam <festevam@gmail.com>
Date: Wed, 2 Jun 2021 12:43:49 -0300
Message-ID: <CAOMZO5An-v0mLAvjofiWLc4ufJiE4EzG1b4NDwToPSvgODrHjQ@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl-asoc-card: change dev_err to dev_dbg for defer
 probe
To: Shengjiu Wang <shengjiu.wang@nxp.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Shengjiu,

On Wed, Jun 2, 2021 at 3:59 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Don't need to print error message for defer probe
...
>         if (!fsl_asoc_card_is_ac97(priv) && !codec_dev) {
> -               dev_err(&pdev->dev, "failed to find codec device\n");
> +               dev_dbg(&pdev->dev, "failed to find codec device\n");

You may consider using dev_err_probe() here, which fits exactly this purpose.
