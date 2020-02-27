Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F221C17257C
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Feb 2020 18:48:56 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48T0XP3qXXzDr3G
	for <lists+linuxppc-dev@lfdr.de>; Fri, 28 Feb 2020 04:48:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::543;
 helo=mail-pg1-x543.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=WrLlidHp; dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48T0Ss16qxzDr2h
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 28 Feb 2020 04:45:48 +1100 (AEDT)
Received: by mail-pg1-x543.google.com with SMTP id 6so77801pgk.0
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Feb 2020 09:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=aavjJ+Z/Os0zHnsfY4LhrQa/kjKKVPycfJnfRrQ9Zao=;
 b=WrLlidHpJQHENIo9YAPAEQekykxM5HD2YXi3IVdH2pDlg6yOsqQeAnBHuInus8IGYC
 T+Llicheka6t83Av1G7fnGQK8N8t/+ARqHcr7lEyinMjtYM47yBrjkl2uEcRsEZ4vjUz
 pAjZPbsFEKwx29NM8eVxoOKBbOhAa5Ss0rhJpdsluzAbqfyGiQnGG/Zp0NAiBrgbAbt0
 jfF0riqJcV8+RHgdQPpeLHStGSeazOIOy4Dlp0oY3js8i23wr6q2uHDBiIWHOaJsg9t8
 1ZOC6VPeEyYaQraK7qW+s5OLWdodWJnu6yrWH8xyJEc1DQGF4Yy9unxmzfeJW8N2YDjq
 /lIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=aavjJ+Z/Os0zHnsfY4LhrQa/kjKKVPycfJnfRrQ9Zao=;
 b=bQgaPKpfmCxiF/O2Vu1xR8GRfaEAKGiIdsftdJf+mRe9bf1dl81ynmhR6Gocbx+D8M
 e6no18UwOo4oKHd8RyMVNAROza+/c9mWbySQdry8qzup8ktaSSAKauNG7oZXWT/aJVCS
 Kd6KrZCDFile1vdErm9IvNJNSZOAXisCPF2n3XVd+I4QFYN/Vya/XUQ/M1a0z2tG3pRf
 oBT2OQ8Li8kQWi71NB5bEfXGkiOXEeQMwd6b68Gi9kTbwcgMD4CXz2ZpO6+lGq+KVKTG
 2bOOszZCkcwkeGkGjVuvHpBY5921ASQCGvOVa9HQn+PfkJKvMUNhbuszfWPoBV+0IQdn
 EStA==
X-Gm-Message-State: APjAAAWeD1Hy58sf/cbCgHIhhb5MYu5gWY6uuG5k2hH2+4ofdOfDBGEw
 7auC5/F9XaxMKGXrDqfpLOY=
X-Google-Smtp-Source: APXvYqxLesXxb5FW6sTnMiGiGe5CN/UVKj1bBr36Rl2QBzPtHaPhoQYlUWdpilUa7ohjuvvcuvc2jw==
X-Received: by 2002:a62:7c96:: with SMTP id x144mr114879pfc.7.1582825543344;
 Thu, 27 Feb 2020 09:45:43 -0800 (PST)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id m16sm7712623pfh.60.2020.02.27.09.45.42
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 27 Feb 2020 09:45:43 -0800 (PST)
Date: Thu, 27 Feb 2020 09:45:41 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v3 1/4] ASoC: fsl_asrc: Change asrc_width to asrc_format
Message-ID: <20200227174540.GA17040@Asurada-Nvidia.nvidia.com>
References: <cover.1582770784.git.shengjiu.wang@nxp.com>
 <ffd5ff2fd0e8ad03a97f6a640630cff767d73fa7.1582770784.git.shengjiu.wang@nxp.com>
 <20200227034121.GA20540@Asurada-Nvidia.nvidia.com>
 <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8AMzqpC35_CR2dCG6a_h4FzvZ6orXkPSYh_1o1d8hv+BMg@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, Feb 27, 2020 at 01:10:19PM +0800, Shengjiu Wang wrote:
> On Thu, Feb 27, 2020 at 11:43 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
> >
> > On Thu, Feb 27, 2020 at 10:41:55AM +0800, Shengjiu Wang wrote:
> > > asrc_format is more inteligent variable, which is align
> > > with the alsa definition snd_pcm_format_t.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_asrc.c     | 23 +++++++++++------------
> > >  sound/soc/fsl/fsl_asrc.h     |  4 ++--
> > >  sound/soc/fsl/fsl_asrc_dma.c |  2 +-
> > >  3 files changed, 14 insertions(+), 15 deletions(-)
> > >
> > > diff --git a/sound/soc/fsl/fsl_asrc.c b/sound/soc/fsl/fsl_asrc.c
> > > index 0dcebc24c312..2b6a1643573c 100644
> > > --- a/sound/soc/fsl/fsl_asrc.c
> > > +++ b/sound/soc/fsl/fsl_asrc.c
> >
> > > @@ -600,11 +599,6 @@ static int fsl_asrc_dai_hw_params(struct snd_pcm_substream *substream,
> > >
> > >       pair->config = &config;
> > >
> > > -     if (asrc_priv->asrc_width == 16)
> > > -             format = SNDRV_PCM_FORMAT_S16_LE;
> > > -     else
> > > -             format = SNDRV_PCM_FORMAT_S24_LE;
> >
> > It feels better to me that we have format settings in hw_params().
> >
> > Why not let fsl_easrc align with this? Any reason that I'm missing?
> 
> because the asrc_width is not formal,  in the future we can direct

Hmm..that's our DT binding. And I don't feel it is a problem
to be ASoC irrelative.

> input the format from the dts. format involve the info about width.

Is there such any formal ASoC binding? I don't see those PCM
formats under include/dt-bindings/ folder. How are we going
to involve those formats in DT?
