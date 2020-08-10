Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F46624039F
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 10:52:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BQ8q73qP3zDqSs
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Aug 2020 18:52:19 +1000 (AEST)
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
 header.s=20161025 header.b=de+5jf2K; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BQ8mz5JXNzDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 18:50:26 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id v22so6146035qtq.8
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Aug 2020 01:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nd+KGdIV03ZDNVLVq/+Q/ATX3ww0wvxrVThg94dncCE=;
 b=de+5jf2K1ZqwDSsbSIkMiHfDdBuBPN1wwq2KpeqVKD3Dn8C++08xSBeuzhqHRqsh3k
 A//1yK1EsW31DJmZQg8bOZfon/fjhmRXanUEY81Nd+9akPoto21VQQFBH+5ySmgasI8v
 6O1mIDiPj1QpwalGOW1HlLJCva8THeH7PcceRnSnH3OHEKgvJWV8AXR8D3nz6bhvo9V6
 1S+n+IMWxrUWwbrDnPdsOlYiw7pX6UikVtIqgzqHJdyrGDuQmdIiXyr6KS3ICvA3SF2Q
 0Um8jB4/ps3KjbdgcNMbxXrkeW64BxD+atuwdFxHO7d2KQ9R75OJ+HIfLu4QpXR61Vfs
 U+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nd+KGdIV03ZDNVLVq/+Q/ATX3ww0wvxrVThg94dncCE=;
 b=h9rpdnGbX/FnlS5zUGT1RtG3Mb7vD3yqMQ+E//6dKV2XcRCre3Ag155sH3yRRgesKU
 lHYPEamlHWTGn+W57pfzEhpsDHa4xsYZZZNsD1nC0n27mjkOyCjZZ3AVURDEnIdTT8KA
 fkD1I3Huu4qVDU4dTDZ8DFeCasnuHe9Ytrsfo/PT3/eogsjZT2NVdoBQoeszRWXPpS8B
 OpTKNKp+lwIbaEH4UluAv97V75Qv7Yet1WdhDH2/lvelXYJv2ll1/B2uGXGhoR8Nph+w
 5OpHVN3dVJUPvrpKByDq2IREGsllICP05Ur0BmC0rqYbARz7dOMS4O0OOz1CUN7QhSaO
 g+7w==
X-Gm-Message-State: AOAM530BW9xYl3xmNFXul5tfsaS+suSvbGER1lrpSq9RkwkNBlTbFVwZ
 V1OMPMIR89c8Y7vILW2lz1TB06XN77tp6JbmmeM=
X-Google-Smtp-Source: ABdhPJwQZN3wjUk9e2RerROvjSA6KbTeAzJFLgIrN6bfeIV50G58IGJM27E6joMW6fVh+7DW7jJ1yMB19OH8aYMwSRo=
X-Received: by 2002:ac8:6d0f:: with SMTP id o15mr25763620qtt.121.1597049421042; 
 Mon, 10 Aug 2020 01:50:21 -0700 (PDT)
MIME-Version: 1.0
References: <1597047103-6863-1-git-send-email-shengjiu.wang@nxp.com>
 <20200810083728.GA7560@Asurada-Nvidia>
In-Reply-To: <20200810083728.GA7560@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 10 Aug 2020 16:50:10 +0800
Message-ID: <CAA+D8ANmEMnRR1N4QRh7y4=+XUpKYnXRQ4LRKw6VG=totd8rwA@mail.gmail.com>
Subject: Re: [PATCH v2] ASoC: fsl-asoc-card: Get "extal" clock rate by
 clk_get_rate
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

On Mon, Aug 10, 2020 at 4:39 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Aug 10, 2020 at 04:11:43PM +0800, Shengjiu Wang wrote:
> > On some platform(.e.g. i.MX8QM MEK), the "extal" clock is different
> > with the mclk of codec, then the clock rate is also different.
> > So it is better to get clock rate of "extal" rate by clk_get_rate,
> > don't reuse the clock rate of mclk.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> > changes in v2
> > - add defer probe handler
> >
> >  sound/soc/fsl/fsl-asoc-card.c | 11 +++++++++++
> >  1 file changed, 11 insertions(+)
> >
> > diff --git a/sound/soc/fsl/fsl-asoc-card.c b/sound/soc/fsl/fsl-asoc-card.c
> > index 52adedc03245..32f8f756e6bb 100644
> > --- a/sound/soc/fsl/fsl-asoc-card.c
> > +++ b/sound/soc/fsl/fsl-asoc-card.c
> > @@ -696,6 +696,17 @@ static int fsl_asoc_card_probe(struct platform_device *pdev)
> >                       goto asrc_fail;
> >               }
> >       } else if (of_node_name_eq(cpu_np, "esai")) {
> > +             struct clk *esai_clk = clk_get(&cpu_pdev->dev, "extal");
> > +
> > +             if (!IS_ERR(esai_clk)) {
> > +                     priv->cpu_priv.sysclk_freq[TX] = clk_get_rate(esai_clk);
> > +                     priv->cpu_priv.sysclk_freq[RX] = clk_get_rate(esai_clk);
>
> Will it break existing imx-audio-cs42888 on older i.MX platforms?
> 'cause it overwrites cpu_priv.sysclk_freq[] that are set in "card
> configurations" section.

Tested,  no break for imx6.

best regards
wang shengjiu
