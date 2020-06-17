Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C40DD1FC4CE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 05:45:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49mrYZ07kZzDr09
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Jun 2020 13:45:06 +1000 (AEST)
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
 header.s=20161025 header.b=rLXf0FXm; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49mrWg31vZzDqwN
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Jun 2020 13:43:26 +1000 (AEST)
Received: by mail-qk1-x744.google.com with SMTP id w3so794630qkb.6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Jun 2020 20:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0vu+NO376NKYI1jWLgdkbjWwFJw4rHiE2cx4A9CRwj8=;
 b=rLXf0FXmhfaJqwRhe7pzmFH+I+5Jzl+4mGdC8v2m0Lm3iaDGlAH3hqj8lfuKZH8obQ
 SRV1JMUu0z5+zc2o19KWm6yO8G1kgZ50kIc+3naYW/anOSrAwoEac5sA2keGAK/W102h
 qxCUwKnNcV5tfpStRlLLA2V49N18kqd6rPVDQ4T7Q6EY7W3p3TqRfdV6NEbeRxb9ROZd
 x7Xw3OyEQ4JiY/LGYSbJ7jRR/86tBZWNItSDIX1v2cnl0fF5hqwrE0zA6Xt9R7jQEbZX
 yaLVuBpMHhd5R9p0xoVsMyZ7+EXwMdJgxtLXQ/FjnTbvPBmyqY12rwTJNOWZaP/UWf9d
 5+Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0vu+NO376NKYI1jWLgdkbjWwFJw4rHiE2cx4A9CRwj8=;
 b=GtKEg9/5IiOFHVrxAhCmHQxN/xu3ZHIybA65k2j7WtDq2t/EYckQzvJHAXZiXHpu2Z
 /5YXmY/T/1myNtbKR/B1pGs+UlZDqWRDpu5BQZFi/+x7rEKhTzYHxNiTdiKH59uEtmUR
 Z2Gun9JvjHmeMgSTEDZ5I+SvtsfBlfvWVLb/J318/9Jfe6kyTItTUtp35gwp89LlFmYC
 AP7L3T0aKC5onFjWmNgW+AI9tb4kC4OzVR0gYbLlHEzOmdEFvbXNzIcCYuNUHBqUPWc4
 ywqC+d1a9qR6cC+RSGqcmYQNU3FhLuKXvZe/B5NSwIuX1Q9u29fc9WTk0fqrSY3+A3BO
 +nNA==
X-Gm-Message-State: AOAM532IkasoxGCRjETRH13m3n8htMUrq9Ok54IdF1m+4r4w0sD+A/zu
 cCGyzzVrnv3aiZF4BeDeYn+iJNgF2CNyCueO/LM=
X-Google-Smtp-Source: ABdhPJzTnuBuNJC6PfYb8KsQOFkrB783WazcWiNJ7FUK4rjhj/lk+ZuGwVKuHA9gkQzAAjPETCxduLPoj1SRbaYHNHc=
X-Received: by 2002:a37:b50:: with SMTP id 77mr23894892qkl.152.1592365402625; 
 Tue, 16 Jun 2020 20:43:22 -0700 (PDT)
MIME-Version: 1.0
References: <1592289761-29118-1-git-send-email-shengjiu.wang@nxp.com>
 <1592289761-29118-2-git-send-email-shengjiu.wang@nxp.com>
 <20200616232810.GA19896@Asurada-Nvidia>
In-Reply-To: <20200616232810.GA19896@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 17 Jun 2020 11:43:11 +0800
Message-ID: <CAA+D8AMv0EW+zUbT8bA7H+hWB8t_DQdWR=cWuYhFZA2z3F-twg@mail.gmail.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_spdif: Add support for imx6sx platform
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

On Wed, Jun 17, 2020 at 7:30 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Tue, Jun 16, 2020 at 02:42:41PM +0800, Shengjiu Wang wrote:
> > The one difference on imx6sx platform is that the root clock
> > is shared with ASRC module, so we add a new flags "ind_root_clk"
> > which means the root clock is independent, then we will not
> > do the clk_set_rate and clk_round_rate to avoid impact ASRC
> > module usage.
> >
> > As add a new flags, we include the soc specific data struct.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_spdif.c | 43 +++++++++++++++++++++++++++++++++++----
> >  1 file changed, 39 insertions(+), 4 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_spdif.c b/sound/soc/fsl/fsl_spdif.c
> > index 1b2e516f9162..00e06803d32f 100644
> > --- a/sound/soc/fsl/fsl_spdif.c
> > +++ b/sound/soc/fsl/fsl_spdif.c
> > @@ -42,6 +42,17 @@ static u8 srpc_dpll_locked[] = { 0x0, 0x1, 0x2, 0x3, 0x4, 0xa, 0xb };
> >
> >  #define DEFAULT_RXCLK_SRC    1
> >
> > +/**
> > + * struct fsl_spdif_soc_data: soc specific data
> > + *
> > + * @imx: for imx platform
> > + * @ind_root_clk: flag for round clk rate
> > + */
> > +struct fsl_spdif_soc_data {
> > +     bool imx;
> > +     bool ind_root_clk;
>
> "ind" doesn't look very straightforward; maybe "shared_root_clock"?
>
> And for its comments:
>         * @shared_root_clock: flag of sharing a clock source with others;
>         *                     so the driver shouldn't set root clock rate
>
> > +};
> > +
> >  /*
> >   * SPDIF control structure
> >   * Defines channel status, subcode and Q sub
> > @@ -93,6 +104,7 @@ struct fsl_spdif_priv {
> >       struct snd_soc_dai_driver cpu_dai_drv;
> >       struct platform_device *pdev;
> >       struct regmap *regmap;
> > +     const struct fsl_spdif_soc_data *soc;
>
> Looks better if we move it to the top of the list :)
>
> > @@ -421,7 +448,7 @@ static int spdif_set_sample_rate(struct snd_pcm_substream *substream,
> >       sysclk_df = spdif_priv->sysclk_df[rate];
> >
> >       /* Don't mess up the clocks from other modules */
> > -     if (clk != STC_TXCLK_SPDIF_ROOT)
> > +     if (clk != STC_TXCLK_SPDIF_ROOT || !spdif_priv->soc->ind_root_clk)
> >               goto clk_set_bypass;
> >
> >       /* The S/PDIF block needs a clock of 64 * fs * txclk_df */
> > @@ -1186,7 +1213,8 @@ static int fsl_spdif_probe_txclk(struct fsl_spdif_priv *spdif_priv,
> >                       continue;
> >
> >               ret = fsl_spdif_txclk_caldiv(spdif_priv, clk, savesub, index,
> > -                                          i == STC_TXCLK_SPDIF_ROOT);
> > +                                          i == STC_TXCLK_SPDIF_ROOT &&
> > +                                          spdif_priv->soc->ind_root_clk);
>
> Having more than one place that checks the condition, we can add:
>
> /* Check if clk is a root clock that does not share clock source with others */
> static inline bool fsl_spdif_can_set_clk_rate(struct fsl_spdif_priv *spdif, int clk)
> {
>         return (clk == STC_TXCLK_SPDIF_ROOT) && !spdif->soc->shared_root_clock;
> }

will update them in v2

best regards
wang shengjiu
