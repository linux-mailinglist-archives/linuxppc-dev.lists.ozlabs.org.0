Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 87600220552
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 08:44:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B67CW3zx7zDqkP
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 16:44:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::642;
 helo=mail-pl1-x642.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=alvhxN7Z; dkim-atps=neutral
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B678471wkzDqjd
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 16:41:24 +1000 (AEST)
Received: by mail-pl1-x642.google.com with SMTP id d1so1977556plr.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 23:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=H3GOXsEias8O11m7veg8//yn3qcFVNyaC+qfLEtL+Ng=;
 b=alvhxN7ZMAQKl7g8xDR8IV6PagrJ9Hahmx//vd3jdPyUs04mYsJSaxa0f8L68+OQ+l
 E3+DxH4KmqLcBJpeV9Jtr26IcaITP+oQr6l47Zv8aHE9du2IrS27lUGCdfK6hvhSFm0E
 AnJa4gH3mgO0SYfVUP/lsMRqaZy/c5gUkHzpKYExnEj2d08k0QFoyDyd+gqaYlNKZegr
 d4bihMgLhmzBMDkqnkc2gq+sxeD2jmO6GA5EQrht3RujORiO3efOGCf9/0izJVYJAjLt
 WXryT0azR8FlK9noO8I9iG9LqC1nhEQ8wjDsmCf5ak4sEtEY9j0xzqPHAf3pv+idT7uJ
 yiIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=H3GOXsEias8O11m7veg8//yn3qcFVNyaC+qfLEtL+Ng=;
 b=kZd2RtHLXhHJQWRH0A0xwy5JbUk9MCvq2BWCEpeuW772s9NSYlfpEyBqWdWvVNKnKw
 CKrITDpm42VsaZppWVAQtK7tHi+qP/vBGMnSUg0bBvaURGPu9IxcrLiQS0uSxjdzoez9
 U2gpY1drJffbssExlvsuWvLezWHwHtWmTxKbqme/FLWLcKsw+We54AW8qD+bchkjiuOB
 4lZHlLpasbMxdVNY72covB/5Ze2r1kSqQ30mZYvT23PEAVoEuuon8vZ/U3P87+Ccp3qp
 HRAJCzZvB5dVZWlAxBR8OnzZp8bEoaDlClqHXuuz2SZIf81URWe+TSkZvmnlFE1g98ZE
 Gdlg==
X-Gm-Message-State: AOAM533YJdhmWp6tF6OAsEA3/ovI5zQ/cQsCzcdQN8wbqVKksAtoPjZz
 9WNTFwB7EYz6C6SS2Rfx1sA=
X-Google-Smtp-Source: ABdhPJx7Fa/qDN3qyOdO0QPaUPtwX+pk9Uzy1ivVjam/CKWrJ+m4kN3YIdTdkOkLBa39I3kofrPxrQ==
X-Received: by 2002:a17:90a:1d06:: with SMTP id
 c6mr9005046pjd.194.1594795282729; 
 Tue, 14 Jul 2020 23:41:22 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id bx18sm958690pjb.49.2020.07.14.23.41.21
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 14 Jul 2020 23:41:22 -0700 (PDT)
Date: Tue, 14 Jul 2020 23:40:58 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and
 Microphone Jack detection
Message-ID: <20200715064057.GA14081@Asurada-Nvidia>
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
 <20200714211432.GA10818@Asurada-Nvidia>
 <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 kuninori.morimoto.gx@renesas.com, Timur Tabi <timur@kernel.org>,
 samuel@sholland.org, katsuhiro@katsuster.net,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jul 15, 2020 at 12:14:01PM +0800, Shengjiu Wang wrote:
> On Wed, Jul 15, 2020 at 5:16 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > Hi Shengjiu,
> >
> > The whole series looks good to me. Just a couple of small
> > questions inline:
> >
> > On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> > > Use asoc_simple_init_jack function from simple card to implement
> > > the Headphone and Microphone detection.
> > > Register notifier to disable Speaker when Headphone is plugged in
> > > and enable Speaker when Headphone is unplugged.
> > > Register notifier to disable Digital Microphone when Analog Microphone
> > > is plugged in and enable DMIC when Analog Microphone is unplugged.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/Kconfig         |  1 +
> > >  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 68 insertions(+), 2 deletions(-)
> >
> > >  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
> > >  {
> > >       struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> > > @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> > >       snd_soc_card_set_drvdata(&priv->card, priv);
> > >
> > >       ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> > > -     if (ret && ret != -EPROBE_DEFER)
> > > -             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> > > +     if (ret) {
> > > +             if (ret != -EPROBE_DEFER)
> > > +                     dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> >
> > I think we may move this EPROBE_DEFER to the asrc_fail label.
> 
> If we move this to asrc_fail label, then it will be hard to define the
> error message.
> There are many places that goto asrc_fail.

Oh...good point...

> > > +             goto asrc_fail;
> > > +     }
> > > +
> > > +     if (of_property_read_bool(np, "hp-det-gpio")) {
> >
> > Could we move this check inside asoc_simple_init_jack? There's no
> > problem with doing it here though, yet I got a bit confused by it
> > as I thought it's a boolean type property, which would be against
> > the DT bindings until I saw asoc_simple_init_jack() uses the same
> > string to get the GPIO. Just it probably would be a bit tricky as
> > we need it to be optional here.
> >
> > Otherwise, I think we may add a line of comments to indicate that
> > the API would use the same string to get the GPIO.
> 
> In asoc_simple_init_jack, gpio_is_valid() will be invalid when there is
> no "hp-det-gpio" property, and asoc_simple_init_jack will return 0.
> 
> The reason why I add a check here is mostly for
> snd_soc_jack_notifier_register().
> when there is no jack created, there will be a kernel dump.
> 
> or I can use this code:
> 
> -       if (of_property_read_bool(np, "hp-det-gpio")) {
> -               ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> -                                           1, NULL, "Headphone Jack");
> -               if (ret)
> -                       goto asrc_fail;
> +       ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
> +                                   1, NULL, "Headphone Jack");
> +       if (ret)
> +               goto asrc_fail;
> 
> +       if (priv->hp_jack.jack.jack)
>                 snd_soc_jack_notifier_register(&priv->hp_jack.jack,

It's pretty clean but not very obvious for the "optional" part.
So I think that it'd be slightly better to go for your previous
solution, but with a line of comments to show: these properties
are optional and asoc_simple_init_jack() uses the same strings.

Please add to all three changes once the comments being added:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks
