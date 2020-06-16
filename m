Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C061D1FA64C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 04:09:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mBTc1xGGzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Jun 2020 12:09:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::641;
 helo=mail-pl1-x641.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=Hdho9rnv; dkim-atps=neutral
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com
 [IPv6:2607:f8b0:4864:20::641])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mBFr2bk7zDqYX
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 11:59:12 +1000 (AEST)
Received: by mail-pl1-x641.google.com with SMTP id n9so7688972plk.1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 15 Jun 2020 18:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=c6qSOHXQD4hhumQbZikXxSVaWTqHQyHgmFGcIGOztbI=;
 b=Hdho9rnvhEUVTmAqgZmwWYS8RzOIXPvCmcrdiHoWOSSv9gOV6MjCV5xh7IZtx9ItbZ
 +O4XLUz0sei1/nC+7CPDSozGf6Tgl7lIF96q91XBCfc99Ye6Fi9Jq4d1qxK44UiZhgWT
 6ez7hLSLyQ27AEpC5O/kOv48zLGAqLBArsXn3NjIxmVeEFt/YPJfzgKVXoMWCtoRgcFk
 ysl/KEbk3PSvoy3O+Gwxsqw4LBMpFsoMqjgCu540Za/JDS0WBv58gISlJION8NOnAwCG
 L0bOtLmIY/AUpg4/pIQOfqCHp19HnSWOQ/Y2cNSN1sSHXwTYkle7vTBCppaVG7xYNpPe
 zXrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=c6qSOHXQD4hhumQbZikXxSVaWTqHQyHgmFGcIGOztbI=;
 b=f63NdL9HfKyF+pUwtuTQaMXjj7BVTiqLmENYSCCiDdma44Ycvgo1TcAaLE/7oo+WWO
 Z/fu/ViJ+NqPGQs8EuYjLR+wT+2QpQSWZoXJ36lLBlK+rSYOmTCj9rKtHRg4LvJcnKCn
 F7a815uFWBIoiB6cn9cRBHxSbMtXEA5MXN6T9dzIBMk/4C08z+RTLlwJ5ABFQZME9eU5
 7xD8dflJoWaamiGfBSzDnkGA0O2qXArBQu3vKnqw6BbNBPBi1FuDuS5tHbbhrBRMVIu9
 +i753fZ/sZxByJ9DhovN2OEZVmEhqDaETe9uJ6zvNFS9nrC7xTVLaZhRg3SW5g2onvLb
 8CYg==
X-Gm-Message-State: AOAM531yOk9g4Pr5Dq7tecSH65pABum1CRMqnug6s37FJRoff2PcKO/K
 RU2El8ykLUy55lRLQCTy1nw=
X-Google-Smtp-Source: ABdhPJwQspXhDL8ZeLiPXsByuB95kCv+TZO5QCOae6ToeEXyIPt0N78KWSViGNui3IvFDCRG0fVYLA==
X-Received: by 2002:a17:90a:336c:: with SMTP id
 m99mr502352pjb.168.1592272748269; 
 Mon, 15 Jun 2020 18:59:08 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id x1sm683125pju.3.2020.06.15.18.59.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 15 Jun 2020 18:59:07 -0700 (PDT)
Date: Mon, 15 Jun 2020 18:58:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl_ssi: Fix bclk calculation for mono channel
Message-ID: <20200616015851.GA23235@Asurada-Nvidia>
References: <b5cf5e3cc39c62f6bb3660b7588b037ffc57f780.1592200690.git.shengjiu.wang@nxp.com>
 <20200615230912.GA16681@Asurada-Nvidia>
 <CAA+D8ANK079rFL-_kwYKkn=nvrsBJPHW8bWMTwNCwDVzHt0PdA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANK079rFL-_kwYKkn=nvrsBJPHW8bWMTwNCwDVzHt0PdA@mail.gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 16, 2020 at 09:48:39AM +0800, Shengjiu Wang wrote:
> On Tue, Jun 16, 2020 at 7:11 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Mon, Jun 15, 2020 at 01:56:18PM +0800, Shengjiu Wang wrote:
> > > For mono channel, SSI will switch to Normal mode.
> > >
> > > In Normal mode and Network mode, the Word Length Control bits
> > > control the word length divider in clock generator, which is
> > > different with I2S Master mode (the word length is fixed to
> > > 32bit), it should be the value of params_width(hw_params).
> > >
> > > The condition "slots == 2" is not good for I2S Master mode,
> > > because for Network mode and Normal mode, the slots can also
> > > be 2. Then we need to use (ssi->i2s_net & SSI_SCR_I2S_MODE_MASK)
> > > to check if it is I2S Master mode.
> >
> > The fsl_ssi_set_bclk is only called when fsl_ssi_is_i2s_master,
> > though I agree that that line of comments sounds confusing now.
> 
> Actually I think fsl_ssi_is_i2s_master is not accurate, it just checks
> the Master mode,  but didn't check the I2S mode.
> 
> >
> > > So we refine the famula for mono channel, otherwise there
> >
> > famula => formula?
> >
> > > will be sound issue for S24_LE.
> > >
> > > Fixes: b0a7043d5c2c ("ASoC: fsl_ssi: Caculate bit clock rate using slot number and width")
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > > changes in v2
> > > - refine patch for Network mode and Normal mode.
> > >
> > >  sound/soc/fsl/fsl_ssi.c | 15 +++++++++++----
> > >  1 file changed, 11 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/sound/soc/fsl/fsl_ssi.c b/sound/soc/fsl/fsl_ssi.c
> > > index bad89b0d129e..cbf67d132fda 100644
> > > --- a/sound/soc/fsl/fsl_ssi.c
> > > +++ b/sound/soc/fsl/fsl_ssi.c
> > > @@ -678,7 +678,8 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > >       struct regmap *regs = ssi->regs;
> > >       u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> > >       unsigned long clkrate, baudrate, tmprate;
> > > -     unsigned int slots = params_channels(hw_params);
> > > +     unsigned int channels = params_channels(hw_params);
> > > +     unsigned int slots;
> > >       unsigned int slot_width = 32;
> > >       u64 sub, savesub = 100000;
> > >       unsigned int freq;
> > > @@ -688,9 +689,15 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> > >       /* Override slots and slot_width if being specifically set... */
> > >       if (ssi->slots)
> > >               slots = ssi->slots;
> > > -     /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > > -     if (ssi->slot_width && slots != 2)
> > > -             slot_width = ssi->slot_width;
> > > +     else
> > > +             /* Apply two slots for mono channel, because DC = 2 */
> > > +             slots = (channels == 1) ? 2 : channels;
> > > +
> > > +     /* ...but keep 32 bits if I2S Master mode */
> > > +     if ((ssi->i2s_net & SSI_SCR_I2S_MODE_MASK) != SSI_SCR_I2S_MODE_MASTER ||
> > > +         channels == 1)
> > > +             slot_width = ssi->slot_width ? ssi->slot_width :
> >
> > This looks very complicated...can you review and try mine?
> > (Basically, take 32-bit out of default but force it later)
> >
> > @@ -678,8 +678,9 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >         struct regmap *regs = ssi->regs;
> >         u32 pm = 999, div2, psr, stccr, mask, afreq, factor, i;
> >         unsigned long clkrate, baudrate, tmprate;
> > -       unsigned int slots = params_channels(hw_params);
> > -       unsigned int slot_width = 32;
> > +       unsigned int channels = params_channels(hw_params);
> > +       unsigned int slot_width = params_width(hw_params);
> > +       unsigned int slots = 2;
> >         u64 sub, savesub = 100000;
> >         unsigned int freq;
> >         bool baudclk_is_used;
> > @@ -688,10 +689,16 @@ static int fsl_ssi_set_bclk(struct snd_pcm_substream *substream,
> >         /* Override slots and slot_width if being specifically set... */
> >         if (ssi->slots)
> >                 slots = ssi->slots;
> > -       /* ...but keep 32 bits if slots is 2 -- I2S Master mode */
> > -       if (ssi->slot_width && slots != 2)
> > +       if (ssi->slot_width)
> >                 slot_width = ssi->slot_width;
> >
> > +       /*
> > +        * ...but force 32 bits for stereo audio. Note that mono audio is also
> > +        * sent in 2 slots via NORMAL mode, so check both slots and channels.
> > +        */
> > +       if (slots == 2 && channels == 2)
> > +               slot_width = 32;
> 
> slots ==2 && channels ==2 does not mean the I2S Master mode.
> For LEFT_J, it is also slots =2 & channels = 2, then the slot_width
> should be params_width(hw_params).
> and DSP_A/B also supports stereo.

I think you have a point. Then would this condition work?

+       /* ...but force 32 bits for stereo audio using I2S Master Mode */
+	if (channels == 2 &&
+	    ssi->i2s_net & SSI_SCR_I2S_MODE_MASK == SSI_SCR_I2S_MODE_MASTER)

Similar to yours but the code above it could look straightforward.
