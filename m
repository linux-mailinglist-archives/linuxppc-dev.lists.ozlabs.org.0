Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3D714045D
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 08:13:25 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47zXN266bPzDqk5
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jan 2020 18:13:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::741;
 helo=mail-qk1-x741.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=lK/A5QUc; dkim-atps=neutral
Received: from mail-qk1-x741.google.com (mail-qk1-x741.google.com
 [IPv6:2607:f8b0:4864:20::741])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47zXKl37G7zDqkg
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jan 2020 18:11:19 +1100 (AEDT)
Received: by mail-qk1-x741.google.com with SMTP id x129so21759153qke.8
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 23:11:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dD+bqe0OboIvDe7Tfhggx1v6hI7fKblqWVn9MXd+wok=;
 b=lK/A5QUcLvbmKiyXEH4Kgl3BRQ0Bkz311hk3/Hmc5ukQy/WYQLXsiyxcpola18hAcv
 tWWhk96wVTGiHmv7M8lX2JVfMkU72C9/VsKywzEfMgtIXPixPNRB5tYrwmJNd/m9PKx2
 t3sC3KkpG4fU79UK3gnN+BJ3miybwpjHv0mbl2Yt8rWbLcxOocN8RqumOk9xx5NPYW/n
 vSumxTygoymB2HvT6vaA11GglQlXbKc4WLF5LxpkxUeUk6tyjM50Wa5S1bORS2kknIsm
 1zwitC4hg7oRXqvj9fao+OsaExHr9o78IDI+hEl90ND2xDWUbFC+2lBpQdRjvWOpPxyh
 X9HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dD+bqe0OboIvDe7Tfhggx1v6hI7fKblqWVn9MXd+wok=;
 b=mtKHkfxiatxl153FTzezmQPt8PRtuVyTpgUMbxqiWrcWROdoxVdsDGDWzQr0188o8P
 LaGL8WIofDAYT+RaeWHL/JgNh+X8DdNAvXE8RGy65E9HkpPZ52N6/pB/BSBjAyNybrYp
 Bg++FQNh3kfhgaZknI4+9ZydUeZES2HMlvnrCzDJ4yljmeaBblxAzPsFliK4YDRvg770
 jOlQeNks7o58t6VdnjP5c83L1ixXCImB74Sob7yT8HRUqxfAspAr0x5lSCRGGkYkDiNs
 w+rrSgWrVSY+Mt6ShM8W0wB7wW4U7t4fT+4UN+aJpyBnbl2ePfa1QL0lZWjiypvuw+Ea
 7ITQ==
X-Gm-Message-State: APjAAAVhKZfZV71vSE1np98Fj9AmfbBdeGN5fWaFCZxkhckMCMhnJl5F
 /kI34vzcVlfx3Om3ZP7J7I3J0e8KFhjb6psOvT0=
X-Google-Smtp-Source: APXvYqyjRZTGLo6wmcBob/iiFfwd3I+O6iRUPciXoph4+LN6FFWL7ri4y46ZvGr8nD5GWauJEepPSlWLvsegq97lPm4=
X-Received: by 2002:a05:620a:166a:: with SMTP id
 d10mr36014901qko.37.1579245075683; 
 Thu, 16 Jan 2020 23:11:15 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
 <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
 <CANcMJZCuU_-Xii=YT5Rp5DAyxboptJCrpp51jForuYUpeMuhmQ@mail.gmail.com>
In-Reply-To: <CANcMJZCuU_-Xii=YT5Rp5DAyxboptJCrpp51jForuYUpeMuhmQ@mail.gmail.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 17 Jan 2020 15:11:04 +0800
Message-ID: <CAA+D8AP39bo6EsHvWhVXvAYAho_xMnWmePPAK6dBsOh5wsz48Q@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH V6 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams
To: John Stultz <john.stultz@linaro.org>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 lars@metafoo.de, Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Mark Brown <broonie@kernel.org>, linuxppc-dev@lists.ozlabs.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Thu, Jan 16, 2020 at 1:56 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Jan 8, 2020 at 8:58 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> > >
> > > When set the runtime hardware parameters, we may need to query
> > > the capability of DMA to complete the parameters.
> > >
> > > This patch is to Extract this operation from
> > > dmaengine_pcm_set_runtime_hwparams function to a separate function
> > > snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> > > which need this feature can call this function.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
> >
> > As a heads up, this patch seems to be causing a regression on the HiKey board.
> >
> > On boot up I'm seeing:
> > [   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
> > f7118000.i2s: -6
> >
> > And HDMI audio isn't working. With this patch reverted, audio works again.
> >
> >
> > > diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> > > index 89a05926ac73..5749a8a49784 100644
> > > --- a/sound/core/pcm_dmaengine.c
> > > +++ b/sound/core/pcm_dmaengine.c
> > > @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
> > ...
> > > +       ret = dma_get_slave_caps(chan, &dma_caps);
> > > +       if (ret == 0) {
> > > +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > > +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > > +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > > +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> > > +
> > > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > > +                       addr_widths = dma_caps.dst_addr_widths;
> > > +               else
> > > +                       addr_widths = dma_caps.src_addr_widths;
> > > +       }
> >
> > It seems a failing ret from dma_get_slave_caps() here is being returned...
> >
> > > +
> > > +       /*
> > > +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> > > +        * hw.formats set to 0, meaning no restrictions are in place.
> > > +        * In this case it's the responsibility of the DAI driver to
> > > +        * provide the supported format information.
> > > +        */
> > > +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> > > +               /*
> > > +                * Prepare formats mask for valid/allowed sample types. If the
> > > +                * dma does not have support for the given physical word size,
> > > +                * it needs to be masked out so user space can not use the
> > > +                * format which produces corrupted audio.
> > > +                * In case the dma driver does not implement the slave_caps the
> > > +                * default assumption is that it supports 1, 2 and 4 bytes
> > > +                * widths.
> > > +                */
> > > +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> > > +                       int bits = snd_pcm_format_physical_width(i);
> > > +
> > > +                       /*
> > > +                        * Enable only samples with DMA supported physical
> > > +                        * widths
> > > +                        */
> > > +                       switch (bits) {
> > > +                       case 8:
> > > +                       case 16:
> > > +                       case 24:
> > > +                       case 32:
> > > +                       case 64:
> > > +                               if (addr_widths & (1 << (bits / 8)))
> > > +                                       hw->formats |= pcm_format_to_bits(i);
> > > +                               break;
> > > +                       default:
> > > +                               /* Unsupported types */
> > > +                               break;
> > > +                       }
> > > +               }
> > > +
> > > +       return ret;
> >
> > ... down here.
> >
> > Where as in the old code...
> >
> > > diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> > > index 748f5f641002..b9f147eaf7c4 100644
> > > --- a/sound/soc/soc-generic-dmaengine-pcm.c
> > > +++ b/sound/soc/soc-generic-dmaengine-pcm.c
> >
> > > @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
> > >         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
> > >                 hw.info |= SNDRV_PCM_INFO_BATCH;
> > >
> > > -       ret = dma_get_slave_caps(chan, &dma_caps);
> > > -       if (ret == 0) {
> > > -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > > -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > > -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > > -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> > > -
> > > -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > > -                       addr_widths = dma_caps.dst_addr_widths;
> > > -               else
> > > -                       addr_widths = dma_caps.src_addr_widths;
> > > -       }
> >
> > ...the ret from dma_get_slave_caps()  checked above, but is not
> > actually returned.
> >
> > Suggestions on how to sort this out?
>
> Just wanted to check in on this, as I'm still seeing this regression with -rc6.
>
Compare with the old code. it seems that we shouldn't check the return value.

Could you help to test below changes?

--- a/sound/soc/soc-generic-dmaengine-pcm.c
+++ b/sound/soc/soc-generic-dmaengine-pcm.c
@@ -138,12 +138,10 @@ dmaengine_pcm_set_runtime_hwparams(struct
snd_soc_component *component,
        if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
                hw.info |= SNDRV_PCM_INFO_BATCH;

-       ret = snd_dmaengine_pcm_refine_runtime_hwparams(substream,
+       snd_dmaengine_pcm_refine_runtime_hwparams(substream,
                                                        dma_data,
                                                        &hw,
                                                        chan);
-       if (ret)
-               return ret;

        return snd_soc_set_runtime_hwparams(substream, &hw);
 }

Best regards
Shengjiu Wang
