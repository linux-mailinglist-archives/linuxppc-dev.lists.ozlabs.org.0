Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 823CF1FC4BB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 05:34:00 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mrJj4dnYzDr08
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 13:33:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=ftQAHhnW; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mrGj4wMMzDqwF
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 13:32:13 +1000 (AEST)
Received: by mail-qt1-x841.google.com with SMTP id u17so520982qtq.1
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nzA+ElcDbnifqfzX8lfOg2mPfYscDQJ4/Xb5PE+7lMg=;
 b=ftQAHhnW0hzD4YpGdWc0LllO2OMD/jfP3C4MQqdKOT5C7eeHNFuf4K+O4toru/tGfa
 M0ivB23w/gyeywiGVuCZ3kCavIsEUJxW2YyS/g0DOG4+iW+DvSMZLCj5gblEB0Co3h93
 O5KmfqxvIQC+AZFf7dtDsayhkTtx4Gjtpik3xLJbdQ47I/AO2eQqNDg04oYiDPxo4zF5
 wvphcCLw4AsFpffOfDBt2aD5MeJ8v8EDC6Zz/XhkBL3rvmf7ktHDmE4tH4D8JkXS6fU2
 qvJz80e1pU8aBXdOeY3q4NtoHG9yuQorBt2J57jYGQumcjXumzorN4FSkwDG8AlEhqBC
 2MgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nzA+ElcDbnifqfzX8lfOg2mPfYscDQJ4/Xb5PE+7lMg=;
 b=hZHdRACNWv2AM9P9MlXDI9P4oivxb3vc6oMf7vGgJnSH3VBu+Bb8d8RoAQvDoivQwN
 23zZ2EXBSGgFAkMM75uzhfSBushrTwQrwgigMtzqCqyvEtn0wbiYg5ZO+5+5RadSMzPM
 7inII+bS+P9t3VNTLoTrY4PlSUvwhDGp68s6vZnLrvU8PYt1SaXbczPXQiF3t3eejXf6
 tbXUtYTibpVNuy/n0qOAPFDPmab5i4Cab/9F1c9Yi+l+LeWkAZgowyzRmrFR0a3vbpVX
 FQ8jRRPmNkiiKkHlO8azoHulEEZXbeTgRZey+JeRvcbkCZSwK5wOnJOPVOKm9IEI3q41
 NmWw==
X-Gm-Message-State: AOAM532TPvH7akbfy5mxY3njy2VoevonNilt4q1CLGxfTf3F3+S5q5DZ
 KbBijb1gmiFv+Syyi7b06nEDXhkZiQpdkQLlvwE=
X-Google-Smtp-Source: ABdhPJyDsNi9Q52RPZTC9rfPswpXtaMmRaUOjgRU4MMGl6dorrqU82mtSiCqR9s3ZZfHZZvEgOKG74qt9+Wv16UivMo=
X-Received: by 2002:ac8:f47:: with SMTP id l7mr24311236qtk.292.1592364729462; 
 Tue, 16 Jun 2020 20:32:09 -0700 (PDT)
MIME-Version: 1.0
References: <1592292637-25734-1-git-send-email-shengjiu.wang@nxp.com>
 <1592292637-25734-2-git-send-email-shengjiu.wang@nxp.com>
 <20200617004845.GB19896@Asurada-Nvidia>
In-Reply-To: <20200617004845.GB19896@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2020 11:31:58 +0800
Message-ID: <CAA+D8AN_Djr_OTXBWJbymtUY7pjTV_VKKiqwRBqQ8cxo4USgCg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl-asoc-card: Add MQS support
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
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jun 17, 2020 at 8:50 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Jun 16, 2020 at 03:30:37PM +0800, Shengjiu Wang wrote:
> > The MQS codec isn't an i2c device, so add a new platform device for it.
> >
> > MQS only support playback, so add a new audio map.
> >
> > Add there maybe "model" property or no "audio-routing" property insertions
>
> "Add" => "And"
>
> > devicetree, so add some enhancement for these two property.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl-asoc-card.c | 70 ++++++++++++++++++++++++++---------
> >  1 file changed, 52 insertions(+), 18 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 00be73900888..2ac8cb9ddd10 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
>
> > @@ -482,6 +489,7 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >  {
> >       struct device_node *cpu_np, *codec_np, *asrc_np;
> >       struct device_node *np = pdev->dev.of_node;
> > +     struct platform_device *codec_pdev = NULL; /* used for non i2c device*/
>
> Having both codec_pdev and codec_dev duplicates things. Actually
> only a couple of places really need "codec_dev" -- most of them
> need codec_dev->dev pointer instead. So we could have a cleanup:
>
> -       struct i2c_client *codec_dev;
> +       struct device *codec_dev = NULL;
>
> > @@ -512,10 +520,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       }
> >
> >       codec_np = of_parse_phandle(np, "audio-codec", 0);
> > -     if (codec_np)
> > +     if (codec_np) {
> >               codec_dev = of_find_i2c_device_by_node(codec_np);
> > -     else
> > +             if (!codec_dev)
> > +                     codec_pdev = of_find_device_by_node(codec_np);
> > +     } else {
> >               codec_dev = NULL;
> > +     }
>
> Here can have something like (feel free to simplify):
>
>         if (codec_np) {
>                 struct platform_device *codec_pdev;
>                 struct i2c_client *codec_i2c;
>
>                 codec_i2c = of_find_i2c_device_by_node(codec_np);
>                 if (codec_i2c)
>                         codec_dev = &codec_i2c->dev;
>
>                 if (!codec_dev) {
>                         codec_pdev = of_find_device_by_node(codec_np);
>                         codec_dev = &codec_pdev->dev;
>                 }
>         }
> >       asrc_np = of_parse_phandle(np, "audio-asrc", 0);
> >       if (asrc_np)
> > @@ -525,6 +536,13 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       if (codec_dev) {
> >               struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
>
> Then here:
>
> -               struct clk *codec_clk = clk_get(&codec_dev->dev, NULL);
> +               struct clk *codec_clk = clk_get(codec_dev, NULL);
>
> > @@ -538,6 +556,11 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >       /* Assign a default DAI format, and allow each card to overwrite it */
> >       priv->dai_fmt = DAI_FMT_BASE;
> >
> > +     memcpy(priv->dai_link, fsl_asoc_card_dai,
> > +            sizeof(struct snd_soc_dai_link) * ARRAY_SIZE(priv->dai_link));
>
> > @@ -573,13 +596,25 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >               codec_dai_name = "ac97-hifi";
> >               priv->card.set_bias_level = NULL;
> >               priv->dai_fmt = SND_SOC_DAIFMT_AC97;
> > +             priv->card.dapm_routes = audio_map_ac97;
> > +             priv->card.num_dapm_routes = ARRAY_SIZE(audio_map_ac97);
> > +     } else if (of_device_is_compatible(np, "fsl,imx-audio-mqs")) {
> > +             codec_dai_name = "fsl-mqs-dai";
> > +             priv->card.set_bias_level = NULL;
> > +             priv->dai_fmt = SND_SOC_DAIFMT_LEFT_J |
> > +                             SND_SOC_DAIFMT_CBS_CFS |
> > +                             SND_SOC_DAIFMT_NB_NF;
> > +             priv->dai_link[1].dpcm_playback = 1;
> > +             priv->dai_link[2].dpcm_playback = 1;
>
> dpcm_playback = 1? That's the default value in fsl_asoc_card_dai.

ah,  should be dpcm_capture = 0.

>
> > @@ -601,19 +636,18 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >               priv->cpu_priv.sysclk_id[0] = FSL_SAI_CLK_MAST1;
> >       }
> >
> > -     snprintf(priv->name, sizeof(priv->name), "%s-audio",
> > -              fsl_asoc_card_is_ac97(priv) ? "ac97" :
> > -              codec_dev->name);
> > -
> >       /* Initialize sound card */
> >       priv->pdev = pdev;
> >       priv->card.dev = &pdev->dev;
> > -     priv->card.name = priv->name;
> > +     ret = snd_soc_of_parse_card_name(&priv->card, "model");
> > +     if (ret) {
> > +             snprintf(priv->name, sizeof(priv->name), "%s-audio",
> > +                      fsl_asoc_card_is_ac97(priv) ? "ac97" :
> > +                      (codec_dev ? codec_dev->name : codec_pdev->name));
>
> We can just use dev_name() if codec_dev is struct device *
> Or having a codec_dev_name to cache codec_pdev/i2c->name.
>
> > -     ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> > -     if (ret) {
> > -             dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> > -             goto asrc_fail;
> > +     if (of_property_read_bool(np, "audio-routing")) {
> > +             ret = snd_soc_of_parse_audio_routing(&priv->card, "audio-routing");
> > +             if (ret) {
> > +                     dev_err(&pdev->dev, "failed to parse audio-routing: %d\n", ret);
> > +                     goto asrc_fail;
>
> Hmm...audio-routing is a required property in DT binding doc.
> So you might need to update that too.

will update them in v2.

best regards
wang shengjiu
