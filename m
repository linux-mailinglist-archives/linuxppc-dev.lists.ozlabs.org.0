Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 60935171002
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 06:12:44 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Sgls4xc7zDqq3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 16:12:41 +1100 (AEDT)
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
 header.s=20161025 header.b=H4jCUaLf; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48SgjS2SSfzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 16:10:35 +1100 (AEDT)
Received: by mail-qt1-x843.google.com with SMTP id l16so1415502qtq.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 21:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pivyxHSyqwryDPI9Gp60bBQcqgh4EowGAu7KJlQgz8E=;
 b=H4jCUaLfJYUfLLqA3eJUJTu4b5XveFIshSWzC8Y9ln+QPHPxLUrzmrpESy/4akroJp
 Z1nDx07X+MlLtNHzVPHE0eRY5Ki3r78WV31qoXhY51kbpvG/tDwciXC480UedUkCVCLI
 CfSE9KcQk9zWNnCwGGaiXi0+XGAOA+cUPGSLF1Kl8WM911mYZ5WBeZjtQ4p7/trNAmiG
 lee0S5ks436Q82ah/K+yp4MxHyjN4E9/4sbSeYHC8ECGGPVvAIYYtbLsEKwL6P41B1Jg
 5juA7vU9RxBBlarCdwpP1F6wZhIcVRvZZ8LOzUBwNwcutzQsS1no+Zbav7A+e8MY9XBO
 f9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pivyxHSyqwryDPI9Gp60bBQcqgh4EowGAu7KJlQgz8E=;
 b=bSyUyrpXk4Ss4jcP8WDNcWW16yAyd/ubvcJ+x7Yvwfajz9BBv4Kw8Xue++N1fa6cvG
 MGjis5TCXni84PhtrdV3WgRHdKEW3bkZw+z2NmKg85VqVtRTcP1Ytxgm4ULWWq3ZO4K/
 QACdeXGV+ZgXlmclny135ZYiW5nLHK8qciwzprMgTNB+kgl3C4tVE3ZAFT0K+vVJESFg
 dcaE1HUowrF5eQt/xKvZxDikvqLso/gv2N+H45H2IcGPjcyDOtGXSANFSEv4RZnKGj/+
 XwYPQeuTyRiU2VAj1P4jGfvdRXkcHqL1vt/glxXb/Ye0qEdltSbkDxegnslhBPUBUkcP
 imYw==
X-Gm-Message-State: APjAAAVD9uRheS7xilkg5uwp/1OB6wQZQ6YqieuZhIywwf7LyqNeV8v6
 FjNYJqtA2SCVCy0XHHdhkHUCtYjM9rHXe/rLPrU=
X-Google-Smtp-Source: APXvYqycq8WwBFtqjVUYzXazfM0rpHuJEyxghtCnM5oaWtr3OyjFzAOxbLU+lLoU9oiDrDjLlu176P4wnMzSmLHlnG0=
X-Received: by 2002:ac8:5298:: with SMTP id s24mr2831317qtn.54.1582780230751; 
 Wed, 26 Feb 2020 21:10:30 -0800 (PST)
MIME-Version: 1.0
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 27 Feb 2020 13:10:19 +0800
Message-ID: <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
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

On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > asrc_format is more inteligent variable, which is align
> > with the alsa definition snd_pcm_format_t.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> >  3 files changed, 14 insertions(+), 15 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > index 0dcebc24c312..2b6a1643573c 100644
> > --- a/sound/soc/fsl/fsl_asrc.c
> > +++ b/sound/soc/fsl/fsl_asrc.c
>
> > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> >
> >       pair->config = &config;
> >
> > -     if (asrc_priv->asrc_width == 16)
> > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > -     else
> > -             format = SNDRV_PCM_FORMAT_S24_LE;
>
> It feels better to me that we have format settings in hw_params().
>
> Why not let fsl_easrc align with this? Any reason that I'm missing?

because the asrc_width is not formal,  in the future we can direct
input the format from the dts. format involve the info about width.

best regards
wang shengjiu
