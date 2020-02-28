Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 01ED9172EEF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 03:56:57 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48TDhk2RVyzDrBv
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 13:56:54 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::841;
 helo=mail-qt1-x841.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=TBD1vGhu; dkim-atps=neutral
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com
 [IPv6:2607:f8b0:4864:20::841])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48TDdk2X3XzDr84
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 13:54:18 +1100 (AEDT)
Received: by mail-qt1-x841.google.com with SMTP id e20so1027210qto.5
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 18:54:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=22hz3EXYq0SzN1Wu2fonmhGKwST6HFX0P3UPEDmpwXo=;
 b=TBD1vGhuloKu8RtFPWQxFgHHziYiJYOdde1353qzy2LmcoeF0TiDjDX1vZWq4i+I1G
 PxOGEuwdm3jskEG8pUt/6K0JSYZJ0j+CUnc9p9tBIyyk6ljb/P7YZkENFlOKudEIAHIz
 lYZu3V4cVEiJhkcItpRev2T8F2Xv+xbwvQMzSApqjce7q0xJzmAlfnCRx7iznMqtFpMw
 D9hPjaUJnzrxXvBACyVYK5QgZxg449iJK2ULaQ3hg4IfAgfp2YuQsaC0pP09+/AMME+N
 e7XkK8nJFvXHADovHj3sQyLpUp4qgFKouUF/Xr15HR9gMjka5EcBntqIZbCRQm7aoS9P
 Mm+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=22hz3EXYq0SzN1Wu2fonmhGKwST6HFX0P3UPEDmpwXo=;
 b=ngQVQJy5XjtL0PSQ0Uco//v2Z6FbOQMxyxQRvwUpzRz2qDOPcPckm8bK9C0QoBYgwa
 SjJsCdNoy+eE9Kyk3KRJQSP2vt3toHmvjuRLTCvO5WLAvrixz90vvz+zT3prxmh3Kvql
 2NdftfdG9CDyB/gCQIRkDPFPWPZKYIYmOoMzAG1GE02JJqKxDsTThCwsT+rYo7nFiVDS
 TqmWuiPFjcFNQ9zhS8yQpN2BL4M9AwU84aKJ9RbjL9Pa/214jj/yL2ydNRG4JVfXTMHl
 jfpe+JxHl+t1dcb+u+Lpj258UQzH98z7sKgvV+isyGCzYybVNjfwFu1BIDNETjpukuxt
 CQ8w==
X-Gm-Message-State: APjAAAX1FpyekjrqwUosvbIK4em0k8sj7I955xb50OJ4Bpwb2zIDJpyc
 ofMYV3p8xRntJhKLYwnnPlk/PI7Pmi6nTJGsrd0=
X-Google-Smtp-Source: APXvYqx40ohLVeMfivRLcPCJq0RBwQ9BYmvFVQpKE5DzCFxMCXj1+DIF7ZrkDxeYve2lklZXhdcB7wpqqqroi1Qjtfk=
X-Received: by 2002:ac8:7b45:: with SMTP id m5mr2482318qtu.360.1582858453803; 
 Thu, 27 Feb 2020 18:54:13 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
 <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 28 Feb 2020 10:54:02 +0800
Message-ID: <CAA+D8AM6t79cPoNmt-8HbGwTSM9bfXSW8g76HtkCF7eauL_Xmw@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
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

Hi

On Fri, Feb 28, 2020 at 1:45 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> > On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> > >
> > > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > > asrc_format is more inteligent variable, which is align
> > > > with the alsa definition snd_pcm_format_t.
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > > index 0dcebc24c312..2b6a1643573c 100644
> > > > --- a/sound/soc/fsl/fsl_asrc.c
> > > > +++ b/sound/soc/fsl/fsl_asrc.c
> > >
> > > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > > >
> > > >       pair->config = &config;
> > > >
> > > > -     if (asrc_priv->asrc_width == 16)
> > > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > > -     else
> > > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> > >
> > > It feels better to me that we have format settings in hw_params().
> > >
> > > Why not let fsl_easrc align with this? Any reason that I'm missing?
> >
> > because the asrc_width is not formal,  in the future we can direct
>
> Hmm..that's our DT binding. And I don't feel it is a problem
> to be ASoC irrelative.
>
> > input the format from the dts. format involve the info about width.
>
> Is there such any formal ASoC binding? I don't see those PCM
> formats under include/dt-bindings/ folder. How are we going
> to involve those formats in DT?

There is no formal binding of this case.

I think it is not good to convert width to format, because, for example
width = 24,  there is two option, we can select format S24_LE,  or
format S24_3LE,  width is ambiguous for selecting.

In EASRC, it support other two 24bit format U24_LE, U24_3LE .

if we use the format in DT, then it is clear for usage in driver.


best regards
wang shengjiu
