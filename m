Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 38E67F7477
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 14:04:24 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BWKw35BvzF41m
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 00:04:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::444;
 helo=mail-wr1-x444.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O8TpWEM1"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BWDG5ZBwzF3xP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 23:59:25 +1100 (AEDT)
Received: by mail-wr1-x444.google.com with SMTP id p4so14520016wrm.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 04:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h4ubUXtKB+J2uUhFjOOYE/2DGaUw76V9ImU/UoPSd30=;
 b=O8TpWEM1zGN5JwYiXACyejO7elmVd/iwBpF91Bd2ZnSE+j/HHDU/insUNU7DnLKpdZ
 oUkOs5qn4NpTMYIuMsOcYJ2GmJak18C1L7ZRfiVxRNZFaGRLqvEzSbz+xd1ObzBHdvDn
 WBrjSXpX8bXvWgL+wKqCudksk8dnwZqRqvpj0HnFJUI4NLTQl2HO46mfISiZ5Db4oEwt
 2IL+Z51y6+8Yy56FzJWIBynCj0zC7+4Wtpb4fp6FBsCWWcg3MuaDARwwVxLtuoNtIaVB
 rdT0kH7QgZpbZCQ+6lqlWmPGpVtdpdBn+Le1aorzrinqEiVlCGM6SBAnBQdKRJxjB9/d
 k2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h4ubUXtKB+J2uUhFjOOYE/2DGaUw76V9ImU/UoPSd30=;
 b=hHIG3SKq7CcXVakPcE0gMa69+8Slia31mcKzk+2WBfVcXRjE6SUBUobmombyMzMT7J
 cfNsKLfXdt+AwQmK6cX+k9S4fbD6k5uW44Lrnzxz/PaoResO4XrZeOffOkeoQnd/pcBD
 g04d8/7pt/omegjQUflptGoGFfRN6qKXcSIHJwbyw9yFM/VHdx47veOlNvjALxQywNJP
 vOccTF43rwk6E/XHu9LQRLcVvVAzdPtJHxLVUVVz3jFrHTtYRHsKjFLjJ0YZaECNeONe
 nZqBvBPt+1Phb+nuJrxz8RAsGuIp6EUKIu9NqbWk3CGmVQ7iWtd0wpegcxhQTWWs0bOG
 Sp8Q==
X-Gm-Message-State: APjAAAWwJpaPxTd76Pt1nSaBA8XwhQ+k6etJ59A3HiUoTkhPyojg2tsS
 U+7fUk8cQwFJQGp3+WtqztbuYwDjZiS1lziN3Z0=
X-Google-Smtp-Source: APXvYqwCXiI2RgOZKsqVZVpR+X3dtB+xlXATxh/NM04aXvEKxz+b9oxnwC+Y0L+gQ1sWGTP9xIkuxWq/fm1g0fHzUWE=
X-Received: by 2002:a05:6000:1181:: with SMTP id
 g1mr21673345wrx.131.1573477158306; 
 Mon, 11 Nov 2019 04:59:18 -0800 (PST)
MIME-Version: 1.0
References: <1e706afe53fdd1fbbbc79277c48a98f8416ba873.1573458378.git.shengjiu.wang@nxp.com>
In-Reply-To: <1e706afe53fdd1fbbbc79277c48a98f8416ba873.1573458378.git.shengjiu.wang@nxp.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 11 Nov 2019 14:59:07 +0200
Message-ID: <CAEnQRZAVpF39PPDQyoquWv8s=EhcJ1a4Nn+fCvuq_b9kHUiGOA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH V2] ASoC: fsl_audmix: Add spin lock to
 protect tdms
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
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 11, 2019 at 9:53 AM Shengjiu Wang <shengjiu.wang@nxp.com> wrote:
>
> Audmix support two substream, When two substream start
> to run, the trigger function may be called by two substream
> in same time, that the priv->tdms may be updated wrongly.
>
> The expected priv->tdms is 0x3, but sometimes the
> result is 0x2, or 0x1.
>
> Fixes: be1df61cf06e ("ASoC: fsl: Add Audio Mixer CPU DAI driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Reviewed-by: Daniel Baluta <daniel.baluta@nxp.com>

> ---
> Change in v2
> -add Fixes, Cc stable, and Acked-by.
>
>  sound/soc/fsl/fsl_audmix.c | 6 ++++++
>  sound/soc/fsl/fsl_audmix.h | 1 +
>  2 files changed, 7 insertions(+)
>
> diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> index c7e4e9757dce..a1db1bce330f 100644
> --- a/sound/soc/fsl/fsl_audmix.c
> +++ b/sound/soc/fsl/fsl_audmix.c
> @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>                                   struct snd_soc_dai *dai)
>  {
>         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> +       unsigned long lock_flags;
>
>         /* Capture stream shall not be handled */
>         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct snd_pcm_substream *substream, int cmd,
>         case SNDRV_PCM_TRIGGER_START:
>         case SNDRV_PCM_TRIGGER_RESUME:
>         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> +               spin_lock_irqsave(&priv->lock, lock_flags);
>                 priv->tdms |= BIT(dai->driver->id);
> +               spin_unlock_irqrestore(&priv->lock, lock_flags);
>                 break;
>         case SNDRV_PCM_TRIGGER_STOP:
>         case SNDRV_PCM_TRIGGER_SUSPEND:
>         case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
> +               spin_lock_irqsave(&priv->lock, lock_flags);
>                 priv->tdms &= ~BIT(dai->driver->id);
> +               spin_unlock_irqrestore(&priv->lock, lock_flags);
>                 break;
>         default:
>                 return -EINVAL;
> @@ -491,6 +496,7 @@ static int fsl_audmix_probe(struct platform_device *pdev)
>                 return PTR_ERR(priv->ipg_clk);
>         }
>
> +       spin_lock_init(&priv->lock);
>         platform_set_drvdata(pdev, priv);
>         pm_runtime_enable(dev);
>
> diff --git a/sound/soc/fsl/fsl_audmix.h b/sound/soc/fsl/fsl_audmix.h
> index 7812ffec45c5..479f05695d53 100644
> --- a/sound/soc/fsl/fsl_audmix.h
> +++ b/sound/soc/fsl/fsl_audmix.h
> @@ -96,6 +96,7 @@ struct fsl_audmix {
>         struct platform_device *pdev;
>         struct regmap *regmap;
>         struct clk *ipg_clk;
> +       spinlock_t lock; /* Protect tdms */
>         u8 tdms;
>  };
>
> --
> 2.21.0
>
> _______________________________________________
> Alsa-devel mailing list
> Alsa-devel@alsa-project.org
> https://mailman.alsa-project.org/mailman/listinfo/alsa-devel
