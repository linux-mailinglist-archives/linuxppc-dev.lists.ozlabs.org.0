Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BDE1020ED98
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 07:33:56 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49wtM54KSdzDqkp
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jun 2020 15:33:53 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::843;
 helo=mail-qt1-x843.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=H/Y2LEm0; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49wtJM2g2YzDqjc
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jun 2020 15:31:30 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id h23so14756704qtr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jun 2020 22:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RQ4+/e636DjU53ZutFkneDCxV7N9AiA63WewmD4xQRo=;
 b=H/Y2LEm0lur0oZA8cMF+qOfMdmDEufwHt8gopg4rg6MJFdWZkdZjG5EJjRH3nfkJDF
 DKMJqCadNNnqvKBtaN3rHZkQVyKtfXSz4U90upgH1YbAExNl/mdq46fT9HMq7Wd9JQjY
 0kx7V1ODrnNe93ASuiXATDjIk8RNPyGXqBDgrrEwUKHITq9bmkpjSfcpBWjJi6o7mR8L
 MFMgZGfxkogIeoUm2AsGug0PM1LeGfBhG4P9xC3agZ0WkGRyLxJiPRPKjl4nIW5pjQSM
 M4+K92DwUmXuiwAOKUFqO0Vf1wnCac1Gynjv5OLh30l+ftlAydyu9xSZj5WJGqxFcfXS
 o46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQ4+/e636DjU53ZutFkneDCxV7N9AiA63WewmD4xQRo=;
 b=doZylhZOf6jUalL1aozM7Zg3UsR1nYGyFl8z0s6XovmhVNR6SbnOIju2dybkhjd1KN
 1TPCCyiHVlbb3o2dIFpBW/UhyVJ7nARHFodzesGR4HBCzx0t8HpHMbGMH1nhQ3bEbyX/
 KHBu8I7yp9cNWuw37efCLGxmorn11+1v4nTK94QLP5ExAUVP48IbgB1OtTgKSRsjO5jy
 mIC/XEf/vdOKh010Wb8RB2qkF0jTGO5r8EQnGU8NGZJU61einUZvWL3nVlHlEF+B8NM7
 jzn36jJZ8y5+33nm5RP5MezNVEMBhch9kdeQZTz4Vl3LYWBKYCxNXNMTJ/1b7M6ar6Ys
 ChCg==
X-Gm-Message-State: AOAM531GN/YLXbnwrOpCoqP4Rj+8ERLsjSkdDg2h7DnIVehn/0BVHr2c
 ixkPV+cVVAvggO6DresoKbASobePXxKmLiJtHTA=
X-Google-Smtp-Source: ABdhPJw/wlWIPyYhzzU13zpDaxH5qYo/b+CmHKJa4nXgPZmta/pNIYYI8YVXbPlxwfzKQtXmUfA37/tLflAUu6/Nsac=
X-Received: by 2002:ac8:33d7:: with SMTP id d23mr19287396qtb.204.1593495086854; 
 Mon, 29 Jun 2020 22:31:26 -0700 (PDT)
MIME-Version: 1.0
References: <1593439115-19282-1-git-send-email-shengjiu.wang@nxp.com>
 <20200629200813.GB27967@Asurada-Nvidia>
In-Reply-To: <20200629200813.GB27967@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Tue, 30 Jun 2020 13:31:15 +0800
Message-ID: <CAA+D8APOd2MxO08nnK9UE03bMj25fyMfMnF-neBzdyoykbjAKA@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_asrc: Add an option to select internal ratio
 mode
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

On Tue, Jun 30, 2020 at 4:09 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jun 29, 2020 at 09:58:35PM +0800, Shengjiu Wang wrote:
> > The ASRC not only supports ideal ratio mode, but also supports
> > internal ratio mode.
> >
> > For internal rato mode, the rate of clock source should be divided
> > with no remainder by sample rate, otherwise there is sound
> > distortion.
> >
> > Add function fsl_asrc_select_clk() to find proper clock source for
> > internal ratio mode, if the clock source is available then internal
> > ratio mode will be selected.
> >
> > With change, the ideal ratio mode is not the only option for user.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
>
> > +static int fsl_asrc_select_clk(struct fsl_asrc_priv *asrc_priv,
> > +                            struct fsl_asrc_pair *pair,
> > +                            int in_rate,
> > +                            int out_rate)
> > +{
> > +     struct fsl_asrc_pair_priv *pair_priv = pair->private;
> > +     struct asrc_config *config = pair_priv->config;
> > +     int rate[2], select_clk[2]; /* Array size 2 means IN and OUT */
> > +     int clk_rate, clk_index;
> > +     int i = 0, j = 0;
> > +     bool clk_sel[2];
> > +
> > +     rate[0] = in_rate;
> > +     rate[1] = out_rate;
> > +
> > +     /* Select proper clock source for internal ratio mode */
> > +     for (j = 0; j < 2; j++) {
> > +             for (i = 0; i < ASRC_CLK_MAP_LEN; i++) {
> > +                     clk_index = asrc_priv->clk_map[j][i];
> > +                     clk_rate = clk_get_rate(asrc_priv->asrck_clk[clk_index]);
>
> +                       /* Only match a perfect clock source with no remainder */
>
> > +                     if (clk_rate != 0 && (clk_rate / rate[j]) <= 1024 &&
> > +                         (clk_rate % rate[j]) == 0)
> > +                             break;
> > +             }
> > +
> > +             if (i == ASRC_CLK_MAP_LEN) {
> > +                     select_clk[j] = OUTCLK_ASRCK1_CLK;
> > +                     clk_sel[j] = false;
> > +             } else {
> > +                     select_clk[j] = i;
> > +                     clk_sel[j] = true;
> > +             }
> > +     }
> > +
> > +     /* Switch to ideal ratio mode if there is no proper clock source */
> > +     if (!clk_sel[IN] || !clk_sel[OUT])
> > +             select_clk[IN] = INCLK_NONE;
>
> Could get rid of clk_set:
>
>         for (j) {
>                 for (i) {
>                         if (match)
>                                 break;
>                 }
>
>                 clk[j] = i;
>         }
>
>         if (clk[IN] == ASRC_CLK_MAP_LEN || clk[OUT] == ASRC_CLK_MAP_LEN)
>
> And it only overrides clk[IN] setting but leaving clk[OUT] to
> to the searching result. This means that clk[OUT] may be using
> a clock source other than OUTCLK_ASRCK1_CLK if sel[IN] happens
> to be false while sel[OUT] happens to be true. Not sure if it
> is intended...but I feel it would probably be safer to use the
> previous settings: INCLK_NONE + OUTCLK_ASRCK1_CLK?

ok, will update the patch.

best regards
wang shengjiu
