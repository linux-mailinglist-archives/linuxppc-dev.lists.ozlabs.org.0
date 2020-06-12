Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7FD1F7227
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 04:19:08 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jktd4rMVzDqvV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 12:19:05 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::742;
 helo=mail-qk1-x742.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=m3NBZX4Q; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jkrg1YVMzDqr6
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 12:17:22 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id c12so7641457qkk.13
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 19:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9AwsOvFeGYp6NGCe8GmFLKt3hED/xVphzYjoNYXlY+g=;
 b=m3NBZX4QtxOhokB1FZa/N7cxSs25LTtNV0th3cvTDIxZNMKZN51g2bguF6oKSZBN4A
 uPMFdPlUCQ5BkifwcFVuc2jsiI5+/yjB5loVdoVczD96/3NT3YczROG6TqTcGOZKKzp0
 er2q4kt40pUZVJwOpGPeVSLmYhbLVzEj0U0yeriYN4cDyb3R9AXTQQ98BYqrMNQCKWRu
 doxIDPHBbFxBroV3GdMYjTOI84piB8V80PGl1B6FkhIR5mV1Jdofw9GVG8xpQ0PHkXDM
 1JQZa4JAk0ADOSBOhQhoc40ua80bT2ktQ+NjpXPlBlUZh7dsSgSvEPjrOu8IE6xqwUSC
 ch+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9AwsOvFeGYp6NGCe8GmFLKt3hED/xVphzYjoNYXlY+g=;
 b=dowrlapzYmZoih21gVGYwaS1K9k8IK16NUuKXKtMgeLBvhHkYTSvL/q7Fb1cKOhgGK
 u7xjtHcKvvEU1bawInNPphKfOxLA6ncijrEhemIQSfV4zs32Imjlkn5GYJfBxcMSebQt
 ZXf9untU5XOi66bT3QGOmoSSZUI2IrKF3pYJZC7bO8s4ukqWap5Ui8iyNtSCeV+0tfjO
 F/ZaMUedBSys4rTv66KZ83rRiFfg2UZ7SkDIloXnxrITtxNRg8u/3z55nx7DPc2eSsBw
 JqggMozhzqBBW9jJyXrB9G6e8NIkcy7zS2lnIEb6yQljzOJKChsMNDH9VkRTDx+5kXyl
 hw3A==
X-Gm-Message-State: AOAM532fb+g2+SZ7CGh93CZSWhwsEYzRZzYysL0ax94n9g6mYOA/0bw0
 fbQIijIOrix7IBJNkXK6gvt3I5psf/5EXGZ5te4=
X-Google-Smtp-Source: ABdhPJxrC1bQgM3YcZ+2CKhu92r8JL+ZMaJo+TzqeI+K4bPntwcSoPbgwZW+/IXYDa9j5iS2+4tN8Kkh2Wkh4VxSomQ=
X-Received: by 2002:a37:9f44:: with SMTP id i65mr930286qke.103.1591928239341; 
 Thu, 11 Jun 2020 19:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
 <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
 <20200612003103.GA28228@Asurada-Nvidia>
In-Reply-To: <20200612003103.GA28228@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Fri, 12 Jun 2020 10:17:08 +0800
Message-ID: <CAA+D8ANbr-nAzY436-AFPOzwGb2LBaZSb40VwoEQrYScKr=0NA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/3] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 12, 2020 at 8:33 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Wed, Jun 10, 2020 at 06:05:49PM +0800, Shengjiu Wang wrote:
> > The dma channel has been requested by Back-End cpu dai driver already.
> > If fsl_asrc_dma requests dma chan with same dma:tx symlink, then
> > there will be below warning with SDMA.
> >
> > [   48.174236] fsl-esai-dai 2024000.esai: Cannot create DMA dma:tx symlink
> >
> > or with EDMA the request operation will fail for EDMA channel
> > can only be requested once.
> >
> > So If we can reuse the dma channel of Back-End, then the issue can be
> > fixed.
> >
> > In order to get the dma channel which is already requested in Back-End.
> > we use the exported two functions (snd_soc_lookup_component_nolocked
> > and soc_component_to_pcm). If we can get the dma channel, then reuse it,
> > if can't, then request a new one.
> >
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > ---
> >  sound/soc/fsl/fsl_asrc_common.h |  2 ++
> >  sound/soc/fsl/fsl_asrc_dma.c    | 52 +++++++++++++++++++++++++--------
> >  2 files changed, 42 insertions(+), 12 deletions(-)
>
> > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h
> > index 77665b15c8db..09512bc79b80 100644
> > --- a/sound/soc/fsl/fsl_asrc_common.h
> > +++ b/sound/soc/fsl/fsl_asrc_common.h
> > @@ -32,6 +32,7 @@ enum asrc_pair_index {
> >   * @dma_chan: inputer and output DMA channels
> >   * @dma_data: private dma data
> >   * @pos: hardware pointer position
> > + * @req_dma_chan_dev_to_dev: flag for release dev_to_dev chan
>
> Since we only have dma_request call for back-end only:
> + * @req_dma_chan: flag to release back-end dma chan

I prefer to use the description "flag to release dev_to_dev chan"
because we won't release the dma chan of the back-end. if the chan
is from the back-end, it is owned by the back-end component.

>
> > diff --git a/sound/soc/fsl/fsl_asrc_dma.c b/sound/soc/fsl/fsl_asrc_dma.c
> > index d6a3fc5f87e5..5ecb77d466d3 100644
> > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > @@ -160,6 +161,9 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> >               substream_be = snd_soc_dpcm_get_substream(be, stream);
> >               dma_params_be = snd_soc_dai_get_dma_data(dai, substream_be);
> >               dev_be = dai->dev;
> > +             component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
> > +             if (component_be)
> > +                     tmp_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
>
> Should we use substream_be->stream or just substream->stream?

substream_be->stream should be better.

>
> And would be better to add these lines right before we really use
> tmp_chan because there's still some distance till it reaches that
> point. And would be better to have a line of comments too.

ok.

>
> > @@ -205,10 +209,14 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> >        */
> >       if (!asrc->use_edma) {
> >               /* Get DMA request of Back-End */
> > -             tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > +             if (!tmp_chan) {
> > +                     tmp_chan_new = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > +                     tmp_chan = tmp_chan_new;
>
> This is a bit confusing...though I finally got it :)
> So probably better to have a line of comments.

ok.

>
> > @@ -220,9 +228,26 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> >
> >               pair->dma_chan[dir] =
> >                       dma_request_channel(mask, filter, &pair->dma_data);
> > +             pair->req_dma_chan_dev_to_dev = true;
> >       } else {
> > -             pair->dma_chan[dir] =
> > -                     asrc->get_dma_channel(pair, dir);
> > +             /*
> > +              * With EDMA, there is two dma channels can be used for p2p,
> > +              * one is from ASRC, one is from another peripheral
> > +              * (ESAI or SAI). Previously we select the dma channel of ASRC,
> > +              * but find an issue for ideal ratio case, there is no control
> > +              * for data copy speed, the speed is faster than sample
> > +              * frequency.
> > +              *
> > +              * So we switch to use dma channel of peripheral (ESAI or SAI),
> > +              * that copy speed of DMA is controlled by data consumption
> > +              * speed in the peripheral FIFO.
> > +              */
>
> This sounds like a different issue and should be fixed separately?
> If you prefer not to, better to move this one to commit log, other
> than having a changelog here, in my opinion.

ok, will move it in commit log.

>
> Since it no longer uses get_dma_channel() for EDMA case, we should
> update the comments at the top as well.
>
> > +             pair->req_dma_chan_dev_to_dev = false;
> > +             pair->dma_chan[dir] = tmp_chan;
> > +             if (!pair->dma_chan[dir]) {
> > +                     pair->dma_chan[dir] = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > +                     pair->req_dma_chan_dev_to_dev = true;
> > +             }
> >       }
>
> Now there are some duplicated lines between these if-else routines, so
> combining my previous comments, we can do (sample change, not tested):

ok, will try yours.

>
> @@ -197,18 +199,29 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>         dma_cap_set(DMA_SLAVE, mask);
>         dma_cap_set(DMA_CYCLIC, mask);
>
> +       /*
> +        * The Back-End device might have already requested a DMA channel,
> +        * so try to reuse it first, and then request a new one upon NULL.
> +        */
> +       component_be = snd_soc_lookup_component_nolocked(dev_be, SND_DMAENGINE_PCM_DRV_NAME);
> +       if (component_be)       // should probably error out if !component_be?
> +               tmp_chan = be_chan = soc_component_to_pcm(component_be)->chan[substream->stream];
> +       if (!tmp_chan)
> +               tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> +
>         /*
>          * An EDMA DEV_TO_DEV channel is fixed and bound with DMA event of each
>          * peripheral, unlike SDMA channel that is allocated dynamically. So no
> -        * need to configure dma_request and dma_request2, but get dma_chan via
> -        * dma_request_slave_channel directly with dma name of Front-End device
> +        * need to configure dma_request and dma_request2, but get dma_chan of
> +        * Back-End device directly via dma_request_slave_channel.
>          */
>         if (!asrc->use_edma) {
>                 /* Get DMA request of Back-End */
> -               tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
>                 tmp_data = tmp_chan->private;
>                 pair->dma_data.dma_request = tmp_data->dma_request;
> -               dma_release_channel(tmp_chan);
> +               /* Do not release tmp_chan if we are reusing the Back-End one */
> +               if (!be_chan)
> +                       dma_release_channel(tmp_chan);
>
>                 /* Get DMA request of Front-End */
>                 tmp_chan = asrc->get_dma_channel(pair, dir);
> @@ -220,9 +233,11 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
>
>                 pair->dma_chan[dir] =
>                         dma_request_channel(mask, filter, &pair->dma_data);
> +               pair->req_dma_chan = true;
>         } else {
> -               pair->dma_chan[dir] =
> -                       asrc->get_dma_channel(pair, dir);
> +               pair->dma_chan[dir] = tmp_chan;
> +               /* Do not flag to release if we are reusing the Back-End one */
> +               pair->req_dma_chan = !be_chan;
>         }
>
>         if (!pair->dma_chan[dir]) {
>
> > @@ -273,19 +299,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> >  static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
> >                               struct snd_pcm_substream *substream)
> >  {
> > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> >       struct snd_pcm_runtime *runtime = substream->runtime;
> >       struct fsl_asrc_pair *pair = runtime->private_data;
> > +     u8 dir = tx ? OUT : IN;
> >
> >       snd_pcm_set_runtime_buffer(substream, NULL);
> >
> > -     if (pair->dma_chan[IN])
> > -             dma_release_channel(pair->dma_chan[IN]);
> > +     if (pair->dma_chan[!dir])
> > +             dma_release_channel(pair->dma_chan[!dir]);
> >
> > -     if (pair->dma_chan[OUT])
> > -             dma_release_channel(pair->dma_chan[OUT]);
> > +     if (pair->dma_chan[dir] && pair->req_dma_chan_dev_to_dev)
> > +             dma_release_channel(pair->dma_chan[dir]);
>
> Why we only apply this to one direction?

if the chan is from the back-end, it is owned by the back-end
component, so it should be released by the back-end component,
not here. That's why I added the flag "req_dma_chan".
