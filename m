Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 255F213D404
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 06:57:51 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47ytlG5Gk4zDqWj
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jan 2020 16:57:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::441;
 helo=mail-wr1-x441.google.com; envelope-from=johnstul.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=FAPgEX95; dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47ythF49hlzDqWx
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Jan 2020 16:55:08 +1100 (AEDT)
Received: by mail-wr1-x441.google.com with SMTP id y11so17843075wrt.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jan 2020 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=NGGRCbRsjloWfYF2cHg3taqwmJTEu8ejz3Fhy/MiNIg=;
 b=FAPgEX95Okm1PYWx+lYdAYkeQZFYdkQpx4INTn3yuTeEPggTIkb+SSmpiN1DrTzTMR
 F8YAzV3LpIE8v/+DzLESZGFiolINqohluQXIo5pP4qfGoAv4WuvIl09MTLyH/FgA1uED
 xrvzH0NNnXsLoP7bi/MMapp889FaW2xsFrvqd9tgZSywMra+//L2O3Mv0Qxb5MadOSHP
 jz223DZjqzt/Nu4ZBN1vXyCUZyN/lHZMeD3lyK1qC5WaiY3J1zUCz+M5X+Kbrc/ZBLL7
 l6i3rSH3TITt2pQsDv9MJNDyHG9uJQQzOv14/uixxkDS9KoFz7btgVg7iRx2X6f/H1vU
 VCaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=NGGRCbRsjloWfYF2cHg3taqwmJTEu8ejz3Fhy/MiNIg=;
 b=acXbuIAGzkCO0dNA9Us7CAUte5s+QM+z7yQbzR21RdeQ9Qx48Bcl9Avtnuu2It/5Sh
 hYcJmXymCh2O6yCLdx8grwb8H24mIHawR8ldKFK7+7748znD5nVCWhBbFC+SRPxafX99
 kzkRJ2rG0lkl/GXWLlJ6BdR8pTMNSRKmcrhtml8QpwozccABmPkuQgERwDuGzvdN4dvD
 WfoHXaI3/u1wj0vOBAKaez/hbcwskDVQq0nkSRvq0alE9rJAtBfxd2y6JW7ulXiggA99
 OGIg6ncA2HzNFEfi+yWQJ/YxXUKa1RjIlgYZoyaqOP2c4MejkwIErovmChfEUU4/EsKh
 BRtA==
X-Gm-Message-State: APjAAAVCzoflYpQXmkynzJaG6t4F3R9YTcV6CE2COnHXxE+2plUge/iA
 w7kfMKH/nQbxvmxbaDvLkqrtcTShaChluqp7FrU=
X-Google-Smtp-Source: APXvYqygaiL9IxcZBDeOlGW0IjTYd9QUt9aNCyzyH/CPff3tMmmEB2RiYIW6FqMd9/9j6NWJe0bNxet3KikGqZP6xRw=
X-Received: by 2002:adf:d850:: with SMTP id k16mr1193679wrl.96.1579154104574; 
 Wed, 15 Jan 2020 21:55:04 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
 <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
In-Reply-To: <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 15 Jan 2020 21:54:54 -0800
Message-ID: <CANcMJZCuU_-Xii=YT5Rp5DAyxboptJCrpp51jForuYUpeMuhmQ@mail.gmail.com>
Subject: Re: [PATCH V6 3/4] ASoC: pcm_dmaengine: Extract
 snd_dmaengine_pcm_refine_runtime_hwparams
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 alsa-devel@alsa-project.org, lars@metafoo.de, timur@kernel.org,
 Xiubo.Lee@gmail.com, linuxppc-dev@lists.ozlabs.org, tiwai@suse.com,
 lgirdwood@gmail.com, Rob Herring <robh+dt@kernel.org>, perex@perex.cz,
 nicoleotsuka@gmail.com, broonie@kernel.org, festevam@gmail.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 8, 2020 at 8:58 PM John Stultz <john.stultz@linaro.org> wrote:
> On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
> >
> > When set the runtime hardware parameters, we may need to query
> > the capability of DMA to complete the parameters.
> >
> > This patch is to Extract this operation from
> > dmaengine_pcm_set_runtime_hwparams function to a separate function
> > snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> > which need this feature can call this function.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> As a heads up, this patch seems to be causing a regression on the HiKey board.
>
> On boot up I'm seeing:
> [   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
> f7118000.i2s: -6
>
> And HDMI audio isn't working. With this patch reverted, audio works again.
>
>
> > diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> > index 89a05926ac73..5749a8a49784 100644
> > --- a/sound/core/pcm_dmaengine.c
> > +++ b/sound/core/pcm_dmaengine.c
> > @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
> ...
> > +       ret = dma_get_slave_caps(chan, &dma_caps);
> > +       if (ret == 0) {
> > +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> > +
> > +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > +                       addr_widths = dma_caps.dst_addr_widths;
> > +               else
> > +                       addr_widths = dma_caps.src_addr_widths;
> > +       }
>
> It seems a failing ret from dma_get_slave_caps() here is being returned...
>
> > +
> > +       /*
> > +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> > +        * hw.formats set to 0, meaning no restrictions are in place.
> > +        * In this case it's the responsibility of the DAI driver to
> > +        * provide the supported format information.
> > +        */
> > +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> > +               /*
> > +                * Prepare formats mask for valid/allowed sample types. If the
> > +                * dma does not have support for the given physical word size,
> > +                * it needs to be masked out so user space can not use the
> > +                * format which produces corrupted audio.
> > +                * In case the dma driver does not implement the slave_caps the
> > +                * default assumption is that it supports 1, 2 and 4 bytes
> > +                * widths.
> > +                */
> > +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> > +                       int bits = snd_pcm_format_physical_width(i);
> > +
> > +                       /*
> > +                        * Enable only samples with DMA supported physical
> > +                        * widths
> > +                        */
> > +                       switch (bits) {
> > +                       case 8:
> > +                       case 16:
> > +                       case 24:
> > +                       case 32:
> > +                       case 64:
> > +                               if (addr_widths & (1 << (bits / 8)))
> > +                                       hw->formats |= pcm_format_to_bits(i);
> > +                               break;
> > +                       default:
> > +                               /* Unsupported types */
> > +                               break;
> > +                       }
> > +               }
> > +
> > +       return ret;
>
> ... down here.
>
> Where as in the old code...
>
> > diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> > index 748f5f641002..b9f147eaf7c4 100644
> > --- a/sound/soc/soc-generic-dmaengine-pcm.c
> > +++ b/sound/soc/soc-generic-dmaengine-pcm.c
>
> > @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
> >         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
> >                 hw.info |= SNDRV_PCM_INFO_BATCH;
> >
> > -       ret = dma_get_slave_caps(chan, &dma_caps);
> > -       if (ret == 0) {
> > -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> > -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> > -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> > -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> > -
> > -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> > -                       addr_widths = dma_caps.dst_addr_widths;
> > -               else
> > -                       addr_widths = dma_caps.src_addr_widths;
> > -       }
>
> ...the ret from dma_get_slave_caps()  checked above, but is not
> actually returned.
>
> Suggestions on how to sort this out?

Just wanted to check in on this, as I'm still seeing this regression with -rc6.

thanks
-john
