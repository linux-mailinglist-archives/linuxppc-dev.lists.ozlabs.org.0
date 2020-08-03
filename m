Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 23987239D39
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 03:29:52 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BKgKk6jMZzDqGq
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 Aug 2020 11:29:46 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::844;
 helo=mail-qt1-x844.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=fEdiU72r; dkim-atps=neutral
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com
 [IPv6:2607:f8b0:4864:20::844])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BKgHz0yqhzDqS1
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Aug 2020 11:28:14 +1000 (AEST)
Received: by mail-qt1-x844.google.com with SMTP id w9so27167055qts.6
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 02 Aug 2020 18:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZdPTwt6GzaEE8ypkWcyEAGla3ExjJ1L9xlPLjdJjECo=;
 b=fEdiU72rgYUFv9VxZJS1kvdK2VZZ3oV8HbXncHDDjA5BQ65BZMi8GwdFhXl1Ye4PpZ
 bI1ijchagYxkSM4OfR2b6qC7gI4oNsmp9TcwMT80BR6lleR9ee9i7WFxeCVdvfuvSqLu
 UHltGgZaXzD77Vy6L32svJpXEJvmaB0fTCbw4JubQ2ny2imbJtgqROPHQyU2A7xfvrxs
 6n780V50p67eQizGGpyIKfBpqyIVN9iNtvGYaML06s2jMGegknEJIFwJkCfoSABhJba+
 +0zBty3ts1Q/agn7DV2tT6YXAfZFPp8/5OX+J35KOQdo+w55Gr6sS5hy+RTcU9Pacz82
 1f2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZdPTwt6GzaEE8ypkWcyEAGla3ExjJ1L9xlPLjdJjECo=;
 b=axI67lc05TKWxisEs+Ih28JKeokzcW9SpqBeMjzze4Nw+1wvRptFdIWn5biT3kQqYQ
 jasyhx7Lp1jWQgik7KOFb3Y1sPW42yW+WsX1MGNI4plAsfo5V83vysFN9G0Cq0yjR0eB
 GesjFz9Ql5Le7B9ueXYBmEm7gAcdeUraitJmT+AW1NZIeBn0hmPtKgqS85DghJ4a7j+S
 S7QNUp2BhHw9zS70iDH6P4aGS5tFFDqqiweFbbg9deecglbOkV+w1GyRNGJ+r9Lh1iux
 8+MjYDWrX7Zazrv4cutWQC95JIh/qwZG5oA5kOf6mQavzZFkVEdMkmRpBT/pmIFnbdtd
 bU9g==
X-Gm-Message-State: AOAM5305hMa76EGM6Vi1nw1X1fX7/ZT88CgWQMFch8SCUj4mZPEnUCeq
 yVe9IrjYASvaeb4GkHyeoEHWkjD8H6y7K8+M64w=
X-Google-Smtp-Source: ABdhPJwocfcyQPliB369D5sk19qV1NbUk9jBsxi7F2QFFlJFuMT6+0u0s+7ZI7bqi/ttnQcjQ9O5aO+qWGK5SbuojF0=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr14208849qtt.121.1596418092106; 
 Sun, 02 Aug 2020 18:28:12 -0700 (PDT)
MIME-Version: 1.0
References: <1596102422-14010-1-git-send-email-shengjiu.wang@nxp.com>
 <20200801075954.GA19629@Asurada-Nvidia>
 <CAA+D8AMM90bt_WbPCny6C=R=dv6gXXh49p59yng2vH7DDuD2PQ@mail.gmail.com>
 <20200802064351.GA24213@Asurada-Nvidia>
In-Reply-To: <20200802064351.GA24213@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 3 Aug 2020 09:28:01 +0800
Message-ID: <CAA+D8APexk_-o91B=u1bthVxXr_+gUL9Yq4UA5zscLfP3Xsa6Q@mail.gmail.com>
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

On Sun, Aug 2, 2020 at 2:44 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sun, Aug 02, 2020 at 10:22:35AM +0800, Shengjiu Wang wrote:
>
> > > > +     /* Specific configuration for PLL */
> > > > +     if (codec_priv->pll_id && codec_priv->fll_id) {
> > > > +             if (priv->sample_format == SNDRV_PCM_FORMAT_S24_LE)
> > > > +                     pll_out = priv->sample_rate * 384;
> > > > +             else
> > > > +                     pll_out = priv->sample_rate * 256;
> > > > +
> > > > +             ret = snd_soc_dai_set_pll(asoc_rtd_to_codec(rtd, 0),
> > > > +                                       codec_priv->pll_id,
> > > > +                                       codec_priv->mclk_id,
> > > > +                                       codec_priv->mclk_freq, pll_out);
> > > > +             if (ret) {
> > > > +                     dev_err(dev, "failed to start FLL: %d\n", ret);
> > > > +                     goto out;
> > > > +             }
> > > > +
> > > > +             ret = snd_soc_dai_set_sysclk(asoc_rtd_to_codec(rtd, 0),
> > > > +                                          codec_priv->fll_id,
> > > > +                                          pll_out, SND_SOC_CLOCK_IN);
> > >
> > > Just came into my mind: do we need some protection here to prevent
> > > PLL/SYSCLK reconfiguration if TX/RX end up with different values?
> > >
> > Sorry,  not really catching your point. could you please elaborate?
> > Why do TX/RX end up with different values?
>
> If TX and RX run concurrently but in different sample rates or
> sample formats, pll_out would be overwritten to PLL/SYSCLK?
>
> I remember imx-wm8962 uses SSI, having symmetric flags for rates/
> channels/samplebits, but fsl-asoc-card might have (or will have)
> other use case.
>
> If all existing combinations don't have any problem, we can add
> a protection later when we need.

Good point. Current cases should be ok, as the boards with
wm8960 and wm8962 are all designed as synchronous mode.

Agree to add protection when needed in the future.

I will fix the nits and send v3.

best regards
wang shengjiu
