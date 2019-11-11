Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 92938F748D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Nov 2019 14:10:28 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47BWSx6s0yzF4DM
	for <lists+linuxppc-dev@lfdr.de>; Tue, 12 Nov 2019 00:10:25 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2a00:1450:4864:20::443;
 helo=mail-wr1-x443.google.com; envelope-from=daniel.baluta@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="gQIErTu0"; 
 dkim-atps=neutral
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 47BWF13fWmzF4Pm
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 12 Nov 2019 00:00:04 +1100 (AEDT)
Received: by mail-wr1-x443.google.com with SMTP id w9so7739629wrr.0
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Nov 2019 05:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gEDRS3N08vMM5wC2R3aZvV9f5xQTSZhcB9bk4IB+bq0=;
 b=gQIErTu0/oszN8lDTz1psUNEDcAdWbU40K8KqpgGYE1+FklD6DWKZARx4jvikbe8hI
 IUbjoTaI7RCucaVZnq9rr+j5jZLuDrtmXsUZ9BjPrKScB1qgY6eLW1z4JLxu/dm2lv2/
 W4vok6LKeW+En4DLuNrPzcUwt48cyFCOmyuko9OkG3X0dRsdhoVovl1BFuzxIh2ydWB8
 tIU7Ygpzc6KjprZLKofyo2NkgvMsjaS7NQ0y81q/kdqNQihyTqzvSiYS64Ys/GRpmbDS
 2Z5q3nwlkf58Hrj2efnLn2nz/0P5TeevFXbfciBBR7nI2Z1xegr1gfkNjIEyflKNDXtc
 lw6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gEDRS3N08vMM5wC2R3aZvV9f5xQTSZhcB9bk4IB+bq0=;
 b=YnXj/fL+9ypArTpvIIJvfM38Z6Uj7gFewWpVoJ4XQgiay0g3UnApXW8lbbN4QWit/f
 Pvt6TXLKiKbQt4wRs507LQGZvMs2vMl1dO8iuQlz0DjGOhwiQ1z8OP0ZPe7rN2akd2Y1
 3ixvqStsG+VL9W2VpNPLOcV07Q/ru7HOQUQjW7jhENcEkt+A19DE5JoTl1uXn3ztO4rD
 xt05fMsQiIEu8zUco/k04FOqTedMEszCqq0IXGvdlSf8pou3b2+mZPPX/K2teJeV21Fb
 zIwMTwWY5aTgmsEBl/8WQhsB0oX8zr/Sz+1g76M2OuUxiJkzUuXeH4yXvIkhajQ4uH6L
 RerQ==
X-Gm-Message-State: APjAAAXTMI16eulQNQEwtV7A6zK1HW89jvM64nvHpZiqr/6vcaExfDMD
 Vp/cYwFcLWDTI4SwOyOtSSCyVFRFuHDhn8KizPo=
X-Google-Smtp-Source: APXvYqxJ8vep/IViuTx4QDVZatw0xHW0xWFo1DYsgxKISpGkP73DqHjKUsinqUDVA+MkD9zjNn8i2eYD0XNxvyZ4khk=
X-Received: by 2002:a5d:5306:: with SMTP id e6mr18900931wrv.187.1573477200508; 
 Mon, 11 Nov 2019 05:00:00 -0800 (PST)
MIME-Version: 1.0
References: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
In-Reply-To: <AM0PR04MB6468D4D15E471940B1906344E3780@AM0PR04MB6468.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Mon, 11 Nov 2019 14:59:49 +0200
Message-ID: <CAEnQRZBfOCH-R-QmY2gB5jEehea1Cn+RnyOkOhMj8=ZJoOADBg@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH] ASoC: fsl_audmix: Add spin lock to protect
 tdms
To: "S.j. Wang" <shengjiu.wang@nxp.com>
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
 Xiubo Li <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 Fabio Estevam <festevam@gmail.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Nov 7, 2019 at 8:54 AM S.j. Wang <shengjiu.wang@nxp.com> wrote:
>
> Hi
> >
> > Hi Shengjiu,
> >
> > Comments inline.
> >
> > On Wed, Nov 6, 2019 at 9:30 AM Shengjiu Wang <shengjiu.wang@nxp.com>
> > wrote:
> > >
> > > Audmix support two substream, When two substream start to run, the
> > > trigger function may be called by two substream in same time, that the
> > > priv->tdms may be updated wrongly.
> > >
> > > The expected priv->tdms is 0x3, but sometimes the result is 0x2, or
> > > 0x1.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_audmix.c | 6 ++++++  sound/soc/fsl/fsl_audmix.h | 1
> > > +
> > >  2 files changed, 7 insertions(+)
> > >
> > > diff --git a/sound/soc/fsl/fsl_audmix.c b/sound/soc/fsl/fsl_audmix.c
> > > index c7e4e9757dce..a1db1bce330f 100644
> > > --- a/sound/soc/fsl/fsl_audmix.c
> > > +++ b/sound/soc/fsl/fsl_audmix.c
> > > @@ -286,6 +286,7 @@ static int fsl_audmix_dai_trigger(struct
> > snd_pcm_substream *substream, int cmd,
> > >                                   struct snd_soc_dai *dai)  {
> > >         struct fsl_audmix *priv = snd_soc_dai_get_drvdata(dai);
> > > +       unsigned long lock_flags;
> > >
> > >         /* Capture stream shall not be handled */
> > >         if (substream->stream == SNDRV_PCM_STREAM_CAPTURE)
> > > @@ -295,12 +296,16 @@ static int fsl_audmix_dai_trigger(struct
> > snd_pcm_substream *substream, int cmd,
> > >         case SNDRV_PCM_TRIGGER_START:
> > >         case SNDRV_PCM_TRIGGER_RESUME:
> > >         case SNDRV_PCM_TRIGGER_PAUSE_RELEASE:
> > > +               spin_lock_irqsave(&priv->lock, lock_flags);
> >
> > Why do we need to disable interrupts here? I assume that lock is only
> > used in process context.
> >
> It is in atomic context, so I think it is ok to disable interrupt.

All right thanks for the explanation. Added my Reviewed-by to v2.
