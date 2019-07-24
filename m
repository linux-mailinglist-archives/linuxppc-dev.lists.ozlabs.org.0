Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A814972AEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 11:00:15 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45tq7028WwzDqL7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jul 2019 19:00:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gKSuVhkA"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45tq4r2XnZzDqD5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 18:58:19 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id y4so46067696wrm.2
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 01:58:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+RGbZm1eciu20PQ8K6tF6H+QNRIWNrVYIPAsS3IZOGw=;
 b=gKSuVhkAPXEHjSfyv7hCFaAwcimAC12QQb//SoVNMVfDYgdlJh0/u6za13CaJi1KNK
 Yhe88wKGs1Fbw0gsRtEV6VwOjTePgaWP/LBYhE4HSiflOGU6ocw7DnSkFBw1tJ2s0VSx
 tEydSi1ZE1R1YiURro6utx0GyKHQRRMB0pLSWCLDMj9Qyx6eY+pyAW1J5EfnmGFYg3bF
 SrnWQ9tzbl4Kj2f79Yhig7nDPqX6Dnvre4xtHcPQyGLjuYeL78NLKifDFMaFaJUSHVOw
 RK/dqeONWggH88EXgWfSIM15ssSrMYL82V7or3/mdcA2sb8ZPv5NlG+UwtSmYOB0Mxhd
 bZMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+RGbZm1eciu20PQ8K6tF6H+QNRIWNrVYIPAsS3IZOGw=;
 b=A+dbrLU2RS2zETNcJSC979PRAfSANJdzbrPT2tuCjVvm57DBtnqCWe5vmXILGirWoG
 iIP5nTdekw2Lftv88GjglM5PbYLC0UrqqzO97CDsaLBAU1CN/hFJed+tqaUS/bIIH+MB
 V/blzRuQXyhU/kw5EdVaOCJj+qLvybdTsnCyBzD0q2w8Nyz1EiqFf+jFZHsHDtfowhDQ
 QGs/llMFH+bZTzXEtX6B0Xq3smOfEGe2FtiKMXwVMNNdGvCzpIYIDMauRupphtNM/43E
 OoMbB4nGtjBcVcqBpRb33nv9TIG7FDg8tZw87cnHLESKjR50m0gdRVZvd9b21r2qn++6
 WEoQ==
X-Gm-Message-State: APjAAAWSN7IOpYekrAPZQn+lsczaJ9AFDLHjtrZU7gjpZqYR8LsVfaUe
 07y2+dc0Yl5x1RRk7bgJQ+nT/rWWeUJLwvP9xNU=
X-Google-Smtp-Source: APXvYqyPfV+wRoNminVBPIYU0k3mTByronNa0d5GsaFz0875MLgxFgsfvzSD0QjUkklYPTRcf4r/DD3UHxMnXvpGh2w=
X-Received: by 2002:adf:db46:: with SMTP id f6mr35916182wrj.212.1563958695456; 
 Wed, 24 Jul 2019 01:58:15 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-6-daniel.baluta@nxp.com>
 <1563800148.2311.9.camel@pengutronix.de>
In-Reply-To: <1563800148.2311.9.camel@pengutronix.de>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Wed, 24 Jul 2019 11:58:04 +0300
Message-ID: <CAEnQRZB+g0pmv_Kkf37Vj_Ln_gPSc6cq77yAZQQ+9yUzhhMT5A@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 05/10] ASoC: fsl_sai: Add support to enable
 multiple data lines
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 dl-linux-imx <linux-imx@nxp.com>, Viorel Suman <viorel.suman@nxp.com>,
 Daniel Baluta <daniel.baluta@nxp.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 22, 2019 at 3:58 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Montag, den 22.07.2019, 15:48 +0300 schrieb Daniel Baluta:
> > SAI supports up to 8 Rx/Tx data lines which can be enabled
> > using TCE/RCE bits of TCR3/RCR3 registers.
> >
> > Data lines to be enabled are read from DT fsl,dl_mask property.
> > By default (if no DT entry is provided) only data line 0 is enabled.
> >
> > Note:
> > We can only enable consecutive data lines starting with data line #0.
>
> Why is the property a bitmask then? To me this sounds like we want to
> have the number of lanes in the DT and convert to the bitmask inside
> the driver.

Actually my comment might be wrong. I have read the documentation again
and it seems that: We can only enable consecutive data lines
*ONLY* if combine mode is enabled.

Thus, if combine mode is disabled we can independently enable any data
line. I will clarify this with IP owner and correct the patch accordingly.

>
> > > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 10 +++++++++-
> >  sound/soc/fsl/fsl_sai.h |  6 ++++--
> >  2 files changed, 13 insertions(+), 3 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 768341608695..d0fa02188b7c 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -601,7 +601,7 @@ static int fsl_sai_startup(struct snd_pcm_substream *substream,
> >
> > >     regmap_update_bits(sai->regmap, FSL_SAI_xCR3(tx),
> > >                        FSL_SAI_CR3_TRCE_MASK,
> > > -                      FSL_SAI_CR3_TRCE);
> > > +                      FSL_SAI_CR3_TRCE(sai->soc_data->dl_mask[tx]);
> >
> > >     ret = snd_pcm_hw_constraint_list(substream->runtime, 0,
> > >                     SNDRV_PCM_HW_PARAM_RATE, &fsl_sai_rate_constraints);
> > @@ -887,6 +887,14 @@ static int fsl_sai_probe(struct platform_device *pdev)
> > >             }
> > >     }
> >
> > > +   /* active data lines mask for TX/RX, defaults to 1 (only the first
> > > +    * data line is enabled
> > +      */
>
> Comment style not in line with Linux coding style.

Will fix. Thanks Lucas for review.
Should be like this, right?
/*
 * comment
 */

checkpatch.pl warned me only about the end of the comment :).
