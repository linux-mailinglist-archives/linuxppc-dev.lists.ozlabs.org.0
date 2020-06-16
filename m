Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 140C91FA5BF
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 03:50:50 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mB465S08zDqkj
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 11:50:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=X0b+d+p0; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mB1y5dZvzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 11:48:54 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id d82so604741qkc.10
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 18:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u39E1LRrzCgMjU0O0Sb+j+YNM1W21dC73lEMxQ1Nkk4=;
 b=X0b+d+p0yRaEoImOfb10lbGhdmGfwUbYyTgUQLPymmole9zr7N5Ifz/RPoVX+hKW67
 ThlRaD0xNIhqfWhEorglmF0IHhgLHAQRZzdZRGsy8AXBsQcKCJ+YNsxSgKuT4Ke4z5fZ
 fuCOZ0rOwxh7qUxktLJJll/oWHG99UDKTntOjFVBcYevefZT6rEehvAvUVb5DYRfTkRN
 EHZCcEjhzkKOVElCtklv4kOXr7NeUMfH7Dd9jhUwqdtI41NZx0uwg4nk/CaAwmyqP4y5
 Elh8u4O6s5WyDuJfBUu+uCNJPpBZ/nWdQ4DKTTtndfbLW5+YEEp2iWCts6j04x8s5p7w
 xxgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u39E1LRrzCgMjU0O0Sb+j+YNM1W21dC73lEMxQ1Nkk4=;
 b=GJNPZKJeHNjlsNMQkzgc52pgmaKX5XHs2eyxD/wcIjB4AgHsRUhBWrElDqrJCu70Ty
 PY3q93X9ecghzu4uQnhsXIWVWDFj4enqcq6mrcp7KfLMPA/fJRE5El0BYQbtUp/1C5wM
 eCoFFg1ImqLE2/dUmly/t73If/EWtHM8F10AJskh2irzFB3ngmtv/kVvTQICyuSe7vrE
 EFym/3L3X/r1wYHUsdB8nvWhrXKGh1IIJjWUQC6jNxM2PldpSndcWFwCMVkEOJlvuC3Q
 oVU8VBbsUj5Gje4/9TxyCKh8ZSejlAO8xVn3fRhTsF/xnUMR3HOhttNY4Yz3yJ5I5a28
 q8vQ==
X-Gm-Message-State: AOAM531Zwoj1ISxfrKM82TM55u8uPNb7wtnF9Wr7Eels+FPx+BltfU4Q
 9Hxz+2ri9ZjPQu0HwD3df/6POHbtC4eHzu1SXUY=
X-Google-Smtp-Source: ABdhPJxUShOl3senI5evzMaIEbkeYfSdHaFU3btpJUGX2lUgo8jR8CctqYgFxkr/oCvPrixqJqyTtt/+71x7W8C6AXE=
X-Received: by 2002:a37:8a43:: with SMTP id m64mr17567223qkd.37.1592272130680; 
 Mon, 15 Jun 2020 18:48:50 -0700 (PDT)
MIME-Version: 1.0
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
 <20200615230912.GA16681@Asurada-Nvidia>
In-Reply-To: <20200615230912.GA16681@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 16 Jun 2020 09:48:39 +0800
Message-ID: <CAA+D8ANK079rFL-_kwYKkn=nvrsBJPHW8bWMTwNCwDVzHt0PdA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 16, 2020 at 7:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> > For mono channel, SSI will switch to Normal mode.
> >
> > In Normal mode and Network mode, the Word Length Control bits
> > control the word length divider in clock generator, which is
> > different with I2S Master mode (the word length is fixed to
> > 32bit), it should be the value of params_width(hw_params).
> >
> > The condition "slots == 2" is not good for I2S Master mode,
> > because for Network mode and Normal mode, the slots can also
> > be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> > to check if it is I2S Master mode.
>
> The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
> though I agree that that line of comments sounds confusing now.

Actually I think fsl_ssi_is_i2s_master is not accurate, it just checks
the Master mode,  but didn't check the I2S mode.

>
> > So we refine the famula for mono channel, otherwise there
>
> famula => formula?
>
> > will be sound issue for S24_LE.
> >
> > Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - refine patch for Network mode and Normal mode.
> >
> >  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
> >  1 file changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> > index bad89b0d129e..cbf67d132fda 100644
> > --- a/sound/soc/fsl/fsl_ssi.c
> > +++ b/sound/soc/fsl/fsl_ssi.c
> > @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >       struct regmap *regs = ssi->regs;
> >       u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> >       unsigned long clkrate, baudrate, tmprate;
> > -     unsigned int slots = params_channels(hw_params);
> > +     unsigned int channels = params_channels(hw_params);
> > +     unsigned int slots;
> >       unsigned int slot_width = 32;
> >       u64 sub, savesub = 100000;
> >       unsigned int freq;
> > @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >       /* Override slots and slot_width if being specifically set... */
> >       if (ssi->slots)
> >               slots = ssi->slots;
> > -     /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > -     if (ssi->slot_width && slots != 2)
> > -             slot_width = ssi->slot_width;
> > +     else
> > +             /* Apply two slots for mono channel, because DC = 2 */
> > +             slots = (channels == 1) ? 2 : channels;
> > +
> > +     /* ...but keep 32 bits if I2S Master mode */
> > +     if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> > +         channels == 1)
> > +             slot_width = ssi->slot_width ? ssi->slot_width :
>
> This looks very complicated...can you review and try mine?
> (Basically, take 32-bit out of default but force it later)
>
> @@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>         struct regmap *regs = ssi->regs;
>         u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
>         unsigned long clkrate, baudrate, tmprate;
> -       unsigned int slots = params_channels(hw_params);
> -       unsigned int slot_width = 32;
> +       unsigned int channels = params_channels(hw_params);
> +       unsigned int slot_width = params_width(hw_params);
> +       unsigned int slots = 2;
>         u64 sub, savesub = 100000;
>         unsigned int freq;
>         bool baudclk_is_used;
> @@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
>         /* Override slots and slot_width if being specifically set... */
>         if (ssi->slots)
>                 slots = ssi->slots;
> -       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> -       if (ssi->slot_width && slots != 2)
> +       if (ssi->slot_width)
>                 slot_width = ssi->slot_width;
>
> +       /*
> +        * ...but force 32 bits for stereo audio. Note that mono audio is also
> +        * sent in 2 slots via NORMAL mode, so check both slots and channels.
> +        */
> +       if (slots == 2 && channels == 2)
> +               slot_width = 32;

slots ==2 && channels ==2 does not mean the I2S Master mode.
For LEFT_J, it is also slots =2 & channels = 2, then the slot_width
should be params_width(hw_params).
and DSP_A/B also supports stereo.
