Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 235911A61B8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 05:19:23 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 490v3q4JkZzDqLv
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Apr 2020 13:19:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::743;
 helo=mail-qk1-x743.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=rN69rysV; dkim-atps=neutral
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com
 [IPv6:2607:f8b0:4864:20::743])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 490v0w5f6wzDqSH
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Apr 2020 13:16:46 +1000 (AEST)
Received: by mail-qk1-x743.google.com with SMTP id j4so8210240qkc.11
 for <linuxppc-dev@lists.ozlabs.org>; Sun, 12 Apr 2020 20:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8E/j11TZfH7UZNApZvH4fEyzZjBApgpFuNvhfzAcUS4=;
 b=rN69rysVCPRtDzu9ocDB8luGscQ5EDAzFC2HUPBZoBmnadjkGd12CRKaUx5KCEmflo
 EjTtB+OZ2lBX7RZXRvyzxIqvKtDx/jgPV82ukKk4l3qRTVFmtWCScuIAIcWvHi+zUDww
 Cr7BAtYsbLMGPjM0IFFZx87NZcQUYIBsEaRTJDmxyRFWGIvQVX6iAisWS93MSXj07hrA
 FB3kyYhKxDxDChLwsHTilLFCicvIZSSBv1ehw6yEG2MMLACgwMJp58iqUHb7TfI55Qa4
 BVMIvw8KomziBHrkvm29KOnA7a6RWsgHHxhSdNWqrbO+XAg9rtixBd9DVRkw73jbvwkJ
 7/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8E/j11TZfH7UZNApZvH4fEyzZjBApgpFuNvhfzAcUS4=;
 b=SS//wlpORisrtSKUkPW1qVuWNFujaI5eItFwHFGvu9vOsEPQ6Nwk3FRMHeCz1k1c3Z
 SpGk1MHOu+F4bemalk7pFlwStUAixqUBHu60sRRjWwSj4OVwAP6LSRKI/8z7PyV1naGi
 VuSRW9nDK5EOPANNenkDtZeCuZK6C9sE7HeuqzjRFBhoPHF4oPzffkX4ceg02IZcndDC
 G3JYlMPjtICy3j0mRqdVLFitO4+z+RAyDwwz6PgXAtLbXQ0wP8oKnLJwYjvm8AS1za6A
 E1CE7iMEKwz1qQdGdfFteCCBFY2tKpuAlaTcUlNsHB4LNeio+XXf23aSqomnGYjjYXB2
 9CvQ==
X-Gm-Message-State: AGi0PubtEOnfBGhSvYCnT6kADrjciXstTtTARW2I9pGTwffK/tU6AgsB
 u863LpAXRhbRp9XJUMCWmPKqr+vTvl5rXtTehaU=
X-Google-Smtp-Source: APiQypItGHPXPnsy1S/7ewXviLIp7ovweo1JzQvp+pRla6x2SM0Xc5ae+Mid29m10MeNtKBNayczigkmHxXihCVcmM0=
X-Received: by 2002:a37:4fd0:: with SMTP id
 d199mr14522999qkb.121.1586747802796; 
 Sun, 12 Apr 2020 20:16:42 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1585726761.git.shengjiu.wang@nxp.com>
 <93531963f028aabf9176173de3c6038a200acb89.1585726761.git.shengjiu.wang@nxp.com>
 <20200406234819.GB20945@Asurada-Nvidia.nvidia.com>
 <CAA+D8AM69bhorQKikQGwwFRqgBYN8V2pXBW5JLZyFCVHWKkNGg@mail.gmail.com>
 <20200412020814.GA5984@Asurada>
In-Reply-To: <20200412020814.GA5984@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Mon, 13 Apr 2020 11:16:31 +0800
Message-ID: <CAA+D8AOapHbw_AREcJmef2tnM4aNiU11FLacW3HS7CXQThs80Q@mail.gmail.com>
Subject: Re: [PATCH v6 5/7] ASoC: fsl_asrc: Move common definition to
 fsl_asrc_common
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

On Sun, Apr 12, 2020 at 10:08 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Sat, Apr 11, 2020 at 01:49:43PM +0800, Shengjiu Wang wrote:
>
> > > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > > > index b15946e03380..5cf0468ce6e3 100644
> > > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > >
> > > > @@ -311,11 +311,12 @@ static int fsl_asrc_dma_startup(struct snd_soc_component *component,
> > > >               return ret;
> > > >       }
> > > >
> > > > -     pair = kzalloc(sizeof(struct fsl_asrc_pair), GFP_KERNEL);
> > > > +     pair = kzalloc(sizeof(struct fsl_asrc_pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
> > >
> > > If we only use the PAIR_PRIVATE_SIZE here, maybe we can put the
> > > define in this file too, rather than in the header file.
> > >
> > > And could fit 80 characters:
> > >
> > > +       pair = kzalloc(sizeof(*pair) + PAIR_PRIVAT_SIZE, GFP_KERNEL);
>
> > I will use a function pointer
> >     int (*get_pair_priv_size)(void)
>
> Since it's the size of pair or cts structure, could be just a
> size_t variable?

Yes, should be "size_t (*get_pair_priv_size)(void)"

best regards
wang shengjiu
