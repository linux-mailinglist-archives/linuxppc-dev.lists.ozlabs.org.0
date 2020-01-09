Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1977D135250
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 06:00:09 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47tYnw652TzDqY7
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Jan 2020 16:00:04 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::341;
 helo=mail-wm1-x341.google.com; envelope-from=johnstul.lkml@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256
 header.s=google header.b=ag8nqYeW; dkim-atps=neutral
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47tYmF0jMKzDqWY
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Jan 2020 15:58:31 +1100 (AEDT)
Received: by mail-wm1-x341.google.com with SMTP id 20so1304745wmj.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 08 Jan 2020 20:58:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/VMi5RKokSD1bSLba837QPSe93h6ZNWDgrRnva2rnDU=;
 b=ag8nqYeWGk2pLTA0jJLgOeLPs6j/8VzJrYnQflUrxpAuHEVC545WyJuOXttmHNsluR
 2ZH1X28E9gpXSqn3YiRnWsqI1l5a4IhoFaMKgH2WI8DjxScbecbQm4qB9TN3Wdi4pXSN
 zOl7Tn/UsEHSTnZEl1pQhc5Swjg1eW7aWK1ayjVqOTck9E8bGRamt65sOZCNXcQaD/53
 IO0RwTVbet55WKsk3d696k0Ite+YoCHee/1AP5OuScjTBQh7c+JKQ5+QgMJuKz/paBD0
 gK5CJ4Biuo94bkQquF3KhJiAdb5aL3zDPDJ4Fve8sdy/x6liyacgigvgwia0FqOrI6yD
 ybaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/VMi5RKokSD1bSLba837QPSe93h6ZNWDgrRnva2rnDU=;
 b=nOmKuBFykwWToCcoBFlxaiEmXGGv6XIJdIwCANRL4xMYrwllk0kk8Yc2NjlTTqtkWu
 fRJLS+qiJXWycWdBsG8URPwdgQSKQLqa6JbELeRzBKI5lM+jTnQRhFO6xyU3h98Xajdj
 wfXShb6YZVuyvTV3dJ9ntsv0zuDEPKLvjqQTyv0pbFSTsScoemsk5urbe+sM5uqf5bxM
 g3Oxj9ZmdwBaV5mhEQAXUOwvdyEA+7AQgJyxNcmuCGXAW5ANG7wv91q/ZTR6WO7vuRUh
 S8/0u++uAzfCNgwCCDCJOVY0KQ+D75kzMA7w9+KchvT2bT45ZisCQ3pFe14qKVF/aW52
 AEnQ==
X-Gm-Message-State: APjAAAXkqc5dF9jthrb8R+9vv/Q1mGz9f1Qhc3VGrWH+1t5+JkvvG9zT
 +49vsNsSJ7giK5elYPkXrcgye8V3scS5MUP9OvY=
X-Google-Smtp-Source: APXvYqwYFA/wMpc6nvrIl61VRVfUPbN3ir93M5LfqjI+X4VbbeKgVjzJrn0QKex0Xjtz1VOP6CJpnivX1VhkTpB4cnc=
X-Received: by 2002:a1c:488a:: with SMTP id v132mr2154030wma.153.1578545906700; 
 Wed, 08 Jan 2020 20:58:26 -0800 (PST)
MIME-Version: 1.0
References: <cover.1569493933.git.shengjiu.wang@nxp.com>
 <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
In-Reply-To: <d728f65194e9978cbec4132b522d4fed420d704a.1569493933.git.shengjiu.wang@nxp.com>
From: John Stultz <john.stultz@linaro.org>
Date: Wed, 8 Jan 2020 20:58:15 -0800
Message-ID: <CANcMJZBy=yH+4YgZWwphiE-PO6d4hzhFK3XFtpN677ZAv_N4WQ@mail.gmail.com>
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

On Thu, Sep 26, 2019 at 6:50 PM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> When set the runtime hardware parameters, we may need to query
> the capability of DMA to complete the parameters.
>
> This patch is to Extract this operation from
> dmaengine_pcm_set_runtime_hwparams function to a separate function
> snd_dmaengine_pcm_refine_runtime_hwparams, that other components
> which need this feature can call this function.
>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Reviewed-by: Nicolin Chen <nicoleotsuka@gmail.com>

As a heads up, this patch seems to be causing a regression on the HiKey board.

On boot up I'm seeing:
[   17.721424] hi6210_i2s f7118000.i2s: ASoC: can't open component
f7118000.i2s: -6

And HDMI audio isn't working. With this patch reverted, audio works again.


> diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
> index 89a05926ac73..5749a8a49784 100644
> --- a/sound/core/pcm_dmaengine.c
> +++ b/sound/core/pcm_dmaengine.c
> @@ -369,4 +369,87 @@ int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream)
...
> +       ret = dma_get_slave_caps(chan, &dma_caps);
> +       if (ret == 0) {
> +               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> +                       hw->info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> +               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> +                       hw->info |= SNDRV_PCM_INFO_BATCH;
> +
> +               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> +                       addr_widths = dma_caps.dst_addr_widths;
> +               else
> +                       addr_widths = dma_caps.src_addr_widths;
> +       }

It seems a failing ret from dma_get_slave_caps() here is being returned...

> +
> +       /*
> +        * If SND_DMAENGINE_PCM_DAI_FLAG_PACK is set keep
> +        * hw.formats set to 0, meaning no restrictions are in place.
> +        * In this case it's the responsibility of the DAI driver to
> +        * provide the supported format information.
> +        */
> +       if (!(dma_data->flags & SND_DMAENGINE_PCM_DAI_FLAG_PACK))
> +               /*
> +                * Prepare formats mask for valid/allowed sample types. If the
> +                * dma does not have support for the given physical word size,
> +                * it needs to be masked out so user space can not use the
> +                * format which produces corrupted audio.
> +                * In case the dma driver does not implement the slave_caps the
> +                * default assumption is that it supports 1, 2 and 4 bytes
> +                * widths.
> +                */
> +               for (i = SNDRV_PCM_FORMAT_FIRST; i <= SNDRV_PCM_FORMAT_LAST; i++) {
> +                       int bits = snd_pcm_format_physical_width(i);
> +
> +                       /*
> +                        * Enable only samples with DMA supported physical
> +                        * widths
> +                        */
> +                       switch (bits) {
> +                       case 8:
> +                       case 16:
> +                       case 24:
> +                       case 32:
> +                       case 64:
> +                               if (addr_widths & (1 << (bits / 8)))
> +                                       hw->formats |= pcm_format_to_bits(i);
> +                               break;
> +                       default:
> +                               /* Unsupported types */
> +                               break;
> +                       }
> +               }
> +
> +       return ret;

... down here.

Where as in the old code...

> diff --git a/sound/soc/soc-generic-dmaengine-pcm.c b/sound/soc/soc-generic-dmaengine-pcm.c
> index 748f5f641002..b9f147eaf7c4 100644
> --- a/sound/soc/soc-generic-dmaengine-pcm.c
> +++ b/sound/soc/soc-generic-dmaengine-pcm.c

> @@ -145,56 +140,12 @@ static int dmaengine_pcm_set_runtime_hwparams(struct snd_pcm_substream *substrea
>         if (pcm->flags & SND_DMAENGINE_PCM_FLAG_NO_RESIDUE)
>                 hw.info |= SNDRV_PCM_INFO_BATCH;
>
> -       ret = dma_get_slave_caps(chan, &dma_caps);
> -       if (ret == 0) {
> -               if (dma_caps.cmd_pause && dma_caps.cmd_resume)
> -                       hw.info |= SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME;
> -               if (dma_caps.residue_granularity <= DMA_RESIDUE_GRANULARITY_SEGMENT)
> -                       hw.info |= SNDRV_PCM_INFO_BATCH;
> -
> -               if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK)
> -                       addr_widths = dma_caps.dst_addr_widths;
> -               else
> -                       addr_widths = dma_caps.src_addr_widths;
> -       }

...the ret from dma_get_slave_caps()  checked above, but is not
actually returned.

Suggestions on how to sort this out?

thanks
-john
