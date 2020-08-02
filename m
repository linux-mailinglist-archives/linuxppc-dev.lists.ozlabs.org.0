Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A42122354DF
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 04:24:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BK4bD2zxvzDqSC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  2 Aug 2020 12:24:24 +1000 (AEST)
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
 header.s=20161025 header.b=GT+DUHoL; dkim-atps=neutral
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BK4YR0GH2zDqQt
 for <linuxppc-dev@lists.ozlabs.org>; Sun,  2 Aug 2020 12:22:50 +1000 (AEST)
Received: by mail-qt1-x842.google.com with SMTP id s23so25917359qtq.12
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 01 Aug 2020 19:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=whOvptctYszI0TUoSb9wHwW4EucWmLnWHPSIiYGN8Wg=;
 b=GT+DUHoLyEtK/qt+Sl6m8Mf+/U/Q8YGwJbZQspRR/1cq9u8FUPWTRWwLNmCNY3JUxP
 1qy9NrIWokY2Vnh7eWIHVvWNN5jtyeXj1JPKyU8nDJI/CCYA68tNtCURbY1tL7UPSc22
 3yQnM1wHR4Oe1023lD3cRY5PbLwT8Y8bxZbGaQSMrfZFWR5vI1is0il6HOs5wNN5daUe
 vO1Qsh5a4CntBIYA5kpBv+7RBsOsRwopAO37ClYQyoNZsx5K78yetewKgHCZehgNRd1k
 ZXThfFVMGKnTMdCRlnBGkrkWCfpcbnow50sw+sjZSScZkiOLCNWLhMd53Pxwj9zNvb52
 idag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=whOvptctYszI0TUoSb9wHwW4EucWmLnWHPSIiYGN8Wg=;
 b=n2tm182KK5l8Wrl2gLCvigUD8Sbj2OtIsDPE1ywp7DmYlF9hZtpqxMcaJS/XZcIGSJ
 cedRsKC4tPgpoV0+LkeZ7ZYQBlicA6md43XK7do7YHciYu4CyoVMPIxqV+QurzjqqqVA
 JktDjJFsZ0vJvtSg8bJcT6yJYEOxCG6VQrZSj1FL3GCgDKwrzW8bA8+MIf1Nhi4579CC
 7SsToYRgjL+zwwMr/tavATZkuGDLp0Da6eBRUnWMJpTL+lC9lDwxwXRM338P2wf68XfC
 1VK7UnC7ccaan20W9h5slplYImbfMCEDN3uxXYtSqC7Bbjihqc0mHQRzLOL9lUsYC97a
 VFZA==
X-Gm-Message-State: AOAM532Ga9U1DbWNJ3SMxiEmppQRjDdTwHay3wUewWZfIM27f0C1/Ty/
 nKwOD0njYpwQcl6704MboBNvI5MjmoWVhWWq15c=
X-Google-Smtp-Source: ABdhPJx+oNY0MJ6Pd5AOYnXI12LGvR++U9v1s05zQk6gTj0oayzG0KE5Co6SYk/c4xn465qVOihcKPEWfsGkyGTJ6ws=
X-Received: by 2002:ac8:450c:: with SMTP id q12mr10542733qtn.292.1596334966873; 
 Sat, 01 Aug 2020 19:22:46 -0700 (PDT)
MIME-Version: 1.0
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
 <20200801075954.GA19629@Asurada-Nvidia>
In-Reply-To: <20200801075954.GA19629@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Sun, 2 Aug 2020 10:22:35 +0800
Message-ID: <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Remove
 fsl_asoc_card_set_bias_level function
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
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 1, 2020 at 4:01 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> Hi,
>
> Having two nits and one question, inline:
>
> On Thu, Jul 30, 2020 at 05:47:02PM +0800, Shengjiu Wang wrote:
> > @@ -182,6 +180,69 @@ static int fsl_asoc_card_hw_params(struct snd_pcm_substream *substream,
> >                                              cpu_priv->slot_width);
> >               if (ret && ret != -ENOTSUPP) {
> >                       dev_err(dev, "failed to set TDM slot for cpu dai\n");
> > +                     goto out;
> > +             }
> > +     }
> > +
> > +     /* Specific configuration for PLL */
> > +     if (codec_priv->pll_id && codec_priv->fll_id) {
> > +             if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> > +                     pll_out = priv->sample_rate * 384;
> > +             else
> > +                     pll_out = priv->sample_rate * 256;
> > +
> > +             ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> > +                                       codec_priv->pll_id,
> > +                                       codec_priv->mclk_id,
> > +                                       codec_priv->mclk_freq, pll_out);
> > +             if (ret) {
> > +                     dev_err(dev, "failed to start FLL: %d\n", ret);
> > +                     goto out;
> > +             }
> > +
> > +             ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> > +                                          codec_priv->fll_id,
> > +                                          pll_out, SND_SOC_CLOCK_IN);
>
> Just came into my mind: do we need some protection here to prevent
> PLL/SYSCLK reconfiguration if TX/RX end up with different values?
>
Sorry,  not really catching your point. could you please elaborate?
Why do TX/RX end up with different values?

best regards
wang shengiu
> > +     return 0;
> > +
> > +out:
> > +     priv->streams &= ~BIT(substream->stream);
> > +     return ret;
>
> Rather than "out:" which doesn't explicitly indicate an error-out,
> "fail:" would be better, following what we used in probe().
>
> > +static int fsl_asoc_card_hw_free(struct snd_pcm_substream *substream)
> > +{
> > +     struct snd_soc_pcm_runtime *rtd = substream->private_data;
> > +     struct fsl_asoc_card_priv *priv = snd_soc_card_get_drvdata(rtd->card);
> > +     struct codec_priv *codec_priv = &priv->codec_priv;
> > +     struct device *dev = rtd->card->dev;
> > +     int ret;
> > +
> > +     priv->streams &= ~BIT(substream->stream);
> > +
>
> > +     if (!priv->streams && codec_priv->pll_id &&
> > +         codec_priv->fll_id) {
>
> This now can fit into single line :)
