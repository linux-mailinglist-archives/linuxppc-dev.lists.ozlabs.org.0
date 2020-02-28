Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1F7173136
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 07:41:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TKhL0cyFzDrHn
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 17:41:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::443;
 helo=mail-pf1-x443.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=cUNucea0; dkim-atps=neutral
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TKfZ144TzDr5d
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 17:40:19 +1100 (AEDT)
Received: by mail-pf1-x443.google.com with SMTP id x185so1211740pfc.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 22:40:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=6jLyDf7HA1xjI2cZ4/f5NFCTmMji2H18M6eJIfWLIio=;
 b=cUNucea0ep9rRh4qhvCRUETrPpzkdl6LG35PtOFQM5BNV+zzYrhbJIb+v/2enqZjlb
 wcq94TO7o1VPlARsPE9s2/bj5AyOkFq1DXyYl7IR/IkmkflhSFKnPeTYsncfw0Fv7VwJ
 C6MG8BNhaqckcKv7WktCQiR6NWeyo6abFbX9o6YCefEdTHq+SSOEK8wAcrO61oTRzrko
 nXMFkTTxJLRSPLMJ5MNQT2FTQAtLvZ+b0W5/EFeLsyDiC+xHHZ7hly4FOCftRgp3Tcsn
 npJDw3lRZco6at1H4Hn8nKv+YCvg8ACIHJM4TlVgo43hbvaWB4/HrkQHxOp2PCL7AC0r
 ufug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6jLyDf7HA1xjI2cZ4/f5NFCTmMji2H18M6eJIfWLIio=;
 b=LGW4gBYVsiiSPFBXjpyeLM5qUGDksWnhYkXNJU0tZnk1AsnPIJm2HLe5kyCrYQ2pBP
 ccKalXQ1rsCvNotjZJLHewDV+S0cJeDMbSqLbRprUaDXNGYpTAEtKFP7s+emBIwAmraN
 O/KHE+nknNF29amBpegI5L16Rlr/RUCBRp2xaKvCZOwqe6BqYF3iI2woxoe8bG41fKvl
 uH8Ez3w6/+5HhVTQBiGEUTTm6a+fDW3F0UK0IOwIKtIjYKGodbJJl76AZ56Gl5t1aZBg
 3mj2WAoSFtZsAYTD1WvMh3jHzdfV1IuWh4m8+gInKUaJI+UQyMnB9UKP2JiVZV8lqw+d
 a+mA==
X-Gm-Message-State: APjAAAXi/UhBAMjxi8/QhMZqHxufO2ZhI4HnghZPDNWDLWfpEAUSGlXW
 5AFO7tj1XjJdUa+lQ+P58FI=
X-Google-Smtp-Source: APXvYqw2E+Kw7R0gNcvM5/xBp+Mo7r/IZp42jhZvRCSqeJUpfX2x+jEWuRWEd+uGspE5Km1km0p/6Q==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr3010846pgd.357.1582872015725; 
 Thu, 27 Feb 2020 22:40:15 -0800 (PST)
Received: from NICOLINC-LT.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 13sm8609829pgo.13.2020.02.27.22.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2020 22:40:15 -0800 (PST)
Date: Thu, 27 Feb 2020 22:40:09 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
Message-ID: <20200228063958.GA473@NICOLINC-LT.nvidia.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
 <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
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
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Feb 28, 2020 at 10:54:02AM +0800, Shengjiu Wang wrote:
> Hi
> 
> On Fri, Feb 28, 2020 at 1:45 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> > > On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > > >
> > > > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > > > asrc_format is more inteligent variable, which is align
> > > > > with the alsa definition snd_pcm_format_t.
> > > > >
> > > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > > ---
> > > > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > > > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > > > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > > > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > > > >
> > > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > > index 0dcebc24c312..2b6a1643573c 100644
> > > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > > >
> > > > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > > > >
> > > > >       pair->config = &config;
> > > > >
> > > > > -     if (asrc_priv->asrc_width == 16)
> > > > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > > > -     else
> > > > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> > > >
> > > > It feels better to me that we have format settings in hw_params().
> > > >
> > > > Why not let fsl_easrc align with this? Any reason that I'm missing?
> > >
> > > because the asrc_width is not formal,  in the future we can direct
> >
> > Hmm..that's our DT binding. And I don't feel it is a problem
> > to be ASoC irrelative.
> >
> > > input the format from the dts. format involve the info about width.
> >
> > Is there such any formal ASoC binding? I don't see those PCM
> > formats under include/dt-bindings/ folder. How are we going
> > to involve those formats in DT?
> 
> There is no formal binding of this case.
> 
> I think it is not good to convert width to format, because, for example

The thing is that fsl_easrc does the conversion too... It just
does in the probe instead of hw_params(), and then copies them
in the hw_params(). So I don't see obvious benefit by doing so.

> width = 24,  there is two option, we can select format S24_LE,  or
> format S24_3LE,  width is ambiguous for selecting.
> 
> In EASRC, it support other two 24bit format U24_LE, U24_3LE .

I understood the reason here, but am not seeing the necessity,
at this point.

> if we use the format in DT, then it is clear for usage in driver.

I think this is the thing that we should address first. If we
have such a binding being added with the new fsl_easrc driver,
I'd love to see the old driver aligning with the new one.

Otherwise, we can keep the old way, and change it when the new
binding is ready.
