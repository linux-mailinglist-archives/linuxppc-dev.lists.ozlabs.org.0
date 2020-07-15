Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 109F5220341
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 06:16:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4B63wm3sBCzDqVs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jul 2020 14:16:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::842;
 helo=mail-qt1-x842.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=K1HTY9Dw; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4B63tM3rVMzDqW3
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jul 2020 14:14:17 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id w34so719519qte.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 14 Jul 2020 21:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=foDNNdgIp5gEZxCFX16NjXsSXtzimT2AqP9s4DUPnRU=;
 b=K1HTY9DwxKkwlxnhxfdiEyaM+jc4pxAHsm3ZoHLNf46o0NPweVzUmsjJtWpbSuLE+5
 lvihYceaJxRcEpAn5Y7EIeZe/uvSunAtgqS9kNlEQiAGK00zW7tqpXxTeSY/4j+aQStZ
 dmrHIkiZe+s8yH734YCb8MWgS9ATNCn5XMcrXihLhLhW4cwiabHZHBVUHd1gjGLW4Q1k
 a0OvsQS95Pvuit+60T/5UuMN5I0UHd0X5zOBO38F201gGpVLceSzNqKd3aGWubrmj2EM
 Mn2jFZoMXI7qVziDUAk642VoUW2CExUIyYCmfbb46N7N3LTCKRJRuW2yeEO85s+bRLIn
 UHIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=foDNNdgIp5gEZxCFX16NjXsSXtzimT2AqP9s4DUPnRU=;
 b=JMHvId16sqSpxG/jK97xDj4CpiLyyDy3rqHHamtazVmwtgQ0JmFdNK6W05ynAAtCoD
 DWOzFiwoVtNdBGx3iWfYMbW+ZYl/dQq/ur90kJK7WaQMdbq7XBnriHVC6txfa9C1a/Im
 uACyrbkyz4kYpWjYyLJJN2A5TLyQOJ6LNsNBi78+3HLyqVxkGRvps3eYvh7ee8cQ0MJB
 VK8dt5mQdp9m4osHhZlKi3jVkhuOML9yTsHoJKT+skabt3K42XVEKB9Jt2gOrgBLS0zV
 JYFz2G+2iCwZcgE6m0NMgL835jVGLoz+OyCLb7J2K5Z3HBKYb33bXTSpQZ6dBdM+uyNy
 81lA==
X-Gm-Message-State: AOAM532LgBXJnBBb/H5hd1y6msDMMCammPYDejN2gP8luOhplLnoYRc1
 iTMTWUPHm3KNeDRcQNoRb15irH4eYWqxM1uwacI=
X-Google-Smtp-Source: ABdhPJz9uu3YAldIkZ25DwFl7GQTjr4Q/2qWdCJALV+nDYpRz3j+ggBoJDewGFe15ct9g6o4fvRHNE0l6dRRFxn2zpM=
X-Received: by 2002:ac8:41c6:: with SMTP id o6mr8114697qtm.292.1594786452616; 
 Tue, 14 Jul 2020 21:14:12 -0700 (PDT)
MIME-Version: 1.0
References: <1594717536-5188-1-git-send-email-shengjiu.wang@nxp.com>
 <1594717536-5188-4-git-send-email-shengjiu.wang@nxp.com>
 <20200714211432.GA10818@Asurada-Nvidia>
In-Reply-To: <20200714211432.GA10818@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 15 Jul 2020 12:14:01 +0800
Message-ID: <CAA+D8ANQ_B9jJUhLYQnKxKJcVrmvakxPo58h433QqFhdu2nRPA@mail.gmail.com>
Subject: Re: [PATCH 3/3] ASoC: fsl-asoc-card: Support Headphone and Microphone
 Jack detection
To: Nicolin Chen <nicoleotsuka@gmail.com>
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

On Wed, Jul 15, 2020 at 5:16 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi Shengjiu,
>
> The whole series looks good to me. Just a couple of small
> questions inline:
>
> On Tue, Jul 14, 2020 at 05:05:36PM +0800, Shengjiu Wang wrote:
> > Use asoc_simple_init_jack function from simple card to implement
> > the Headphone and Microphone detection.
> > Register notifier to disable Speaker when Headphone is plugged in
> > and enable Speaker when Headphone is unplugged.
> > Register notifier to disable Digital Microphone when Analog Microphone
> > is plugged in and enable DMIC when Analog Microphone is unplugged.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/Kconfig         |  1 +
> >  sound/soc/fsl/fsl-asoc-card.c | 69 ++++++++++++++++++++++++++++++++++-
> >  2 files changed, 68 insertions(+), 2 deletions(-)
>
> >  static int fsl_asoc_card_late_probe(struct snd_soc_card *card)
> >  {
> >       struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(card);
> > @@ -745,8 +789,29 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       snd_soc_card_set_drvdata(&priv->card, priv);
> >
> >       ret = devm_snd_soc_register_card(&pdev->dev, &priv->card);
> > -     if (ret && ret != -EPROBE_DEFER)
> > -             dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
> > +     if (ret) {
> > +             if (ret != -EPROBE_DEFER)
> > +                     dev_err(&pdev->dev, "snd_soc_register_card failed (%d)\n", ret);
>
> I think we may move this EPROBE_DEFER to the asrc_fail label.

If we move this to asrc_fail label, then it will be hard to define the
error message.
There are many places that goto asrc_fail.

>
> > +             goto asrc_fail;
> > +     }
> > +
> > +     if (of_property_read_bool(np, "hp-det-gpio")) {
>
> Could we move this check inside asoc_simple_init_jack? There's no
> problem with doing it here though, yet I got a bit confused by it
> as I thought it's a boolean type property, which would be against
> the DT bindings until I saw asoc_simple_init_jack() uses the same
> string to get the GPIO. Just it probably would be a bit tricky as
> we need it to be optional here.
>
> Otherwise, I think we may add a line of comments to indicate that
> the API would use the same string to get the GPIO.

In asoc_simple_init_jack, gpio_is_valid() will be invalid when there is
no "hp-det-gpio" property, and asoc_simple_init_jack will return 0.

The reason why I add a check here is mostly for
snd_soc_jack_notifier_register().
when there is no jack created, there will be a kernel dump.

or I can use this code:

-       if (of_property_read_bool(np, "hp-det-gpio")) {
-               ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
-                                           1, NULL, "Headphone Jack");
-               if (ret)
-                       goto asrc_fail;
+       ret = asoc_simple_init_jack(&priv->card, &priv->hp_jack,
+                                   1, NULL, "Headphone Jack");
+       if (ret)
+               goto asrc_fail;

+       if (priv->hp_jack.jack.jack)
                snd_soc_jack_notifier_register(&priv->hp_jack.jack,
&hp_jack_nb);
-       }

what do you think?

best regards
wang shengjiu
