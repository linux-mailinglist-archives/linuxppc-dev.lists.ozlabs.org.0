Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E4DE51F7344
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 07:04:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49jpYT2FMBzDqtQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Jun 2020 15:04:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1043;
 helo=mail-pj1-x1043.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=q01Sv3tA; dkim-atps=neutral
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com
 [IPv6:2607:f8b0:4864:20::1043])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49jpWn3LMyzDqC8
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Jun 2020 15:03:01 +1000 (AEST)
Received: by mail-pj1-x1043.google.com with SMTP id q24so3372322pjd.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Jun 2020 22:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=AQb3my+JsHlPPhTUgek4A/JfdbCiC4/wHqfCQrXHjrU=;
 b=q01Sv3tAmgbAnD8CpTMm/o03irTJ7C9U+SvSNziUnrthARWPJYAHa+QPqOIvkTh6QR
 no4O2hrQdkvUupP2diATC+WeE8zHFg5Z7B2bRDjTf1OHqN1lk9NsKfdNlQObU1InoXUw
 2A4MuUdDhIMNhy8XZYAZb6Nedh0e7AxbreTaiJr/him4Edt1Q345hVImR/g8Kbbc+Uym
 u0evKTdygrq7aUwfb/rkAxmVz0ZIDw++Z3xruuZc4cwf3IzIzQAMXpLnppl51Jc40Ove
 kI9LCyxnPeCzAoB1Eo3kkJlxAQ6o/5/HrUpoluPDcm2kg4ysQZPTDnOHRYs4UAKmkXBw
 bQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=AQb3my+JsHlPPhTUgek4A/JfdbCiC4/wHqfCQrXHjrU=;
 b=Ay4IQ81lXq8G+cSl/96YdgdZ7D4jbFf9oS5fXqaep0ziZ0UJXEOxgsHDDqMUJjtnQJ
 dslu8mGE+RqY4luokzYeWcxwBgios+0KmNUSLrnsHtt7ZVVznLPPFoP8rKtjPksBt8HY
 iAxZVtiLRxStE80/VjzlAJbk3R6CesoLNx+9DenmVfcBj1rAxPNd1Y89e6UIu2CZoukK
 GqrsdhcsY55FlQXUM10RpxVg+QWwY1JDT6O+pB9FFl/i8anfb6fRctZg4n3pEv2uHNeF
 RJCZC99qfj3C+51EVmRpGQBZAdV1AMMbG7OAh9wNfDiL3qCIy9VaSCaGLF2WL4aNkOvv
 +gvA==
X-Gm-Message-State: AOAM530Xo6m+ardwTd/Q+gVCLq5Dq1AKR//1HqsujHk5yTt0GSUMX8/7
 fwOTOAiF+ayHppltXDo+BDk=
X-Google-Smtp-Source: ABdhPJwjToNwD3VazGS7MHp3JaSxFxVaFsE6O2sMauxx8tbjvDPH4tb7qxRuOF0NFqhRYZWr3cMqNw==
X-Received: by 2002:a17:902:9f8d:: with SMTP id
 g13mr9910233plq.292.1591938177195; 
 Thu, 11 Jun 2020 22:02:57 -0700 (PDT)
Received: from Asurada-Nvidia (searspoint.nvidia.com. [216.228.112.21])
 by smtp.gmail.com with ESMTPSA id n4sm4088751pjt.48.2020.06.11.22.02.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 11 Jun 2020 22:02:56 -0700 (PDT)
Date: Thu, 11 Jun 2020 22:02:46 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [RFC PATCH v2 3/3] ASoC: fsl_asrc_dma: Reuse the dma channel if
 available in Back-End
Message-ID: <20200612050245.GA18921@Asurada-Nvidia>
References: <cover.1591783089.git.shengjiu.wang@nxp.com>
 <0473d4191ae04ab711d63c5c875e47f45f598137.1591783089.git.shengjiu.wang@nxp.com>
 <20200612003103.GA28228@Asurada-Nvidia>
 <CAA+D8ANbr-nAzY436-AFPOzwGb2LBaZSb40VwoEQrYScKr=0NA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANbr-nAzY436-AFPOzwGb2LBaZSb40VwoEQrYScKr=0NA@mail.gmail.com>
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, lars@metafoo.de,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, linux-kernel <linux-kernel@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 12, 2020 at 10:17:08AM +0800, Shengjiu Wang wrote:

> > > diff --git a/sound/soc/fsl/fsl_asrc_common.h b/sound/soc/fsl/fsl_asrc_common.h

> > > + * @req_dma_chan_dev_to_dev: flag for release dev_to_dev chan
> >
> > Since we only have dma_request call for back-end only:
> > + * @req_dma_chan: flag to release back-end dma chan
> 
> I prefer to use the description "flag to release dev_to_dev chan"
> because we won't release the dma chan of the back-end. if the chan
> is from the back-end, it is owned by the back-end component.

TBH, it just looks too long. But I wouldn't have problem if you
insist so.

> > > @@ -273,19 +299,21 @@ static int fsl_asrc_dma_hw_params(struct snd_soc_component *component,
> > >  static int fsl_asrc_dma_hw_free(struct snd_soc_component *component,
> > >                               struct snd_pcm_substream *substream)
> > >  {
> > > +     bool tx = substream->stream == SNDRV_PCM_STREAM_PLAYBACK;
> > >       struct snd_pcm_runtime *runtime = substream->runtime;
> > >       struct fsl_asrc_pair *pair = runtime->private_data;
> > > +     u8 dir = tx ? OUT : IN;
> > >
> > >       snd_pcm_set_runtime_buffer(substream, NULL);
> > >
> > > -     if (pair->dma_chan[IN])
> > > -             dma_release_channel(pair->dma_chan[IN]);
> > > +     if (pair->dma_chan[!dir])
> > > +             dma_release_channel(pair->dma_chan[!dir]);
> > >
> > > -     if (pair->dma_chan[OUT])
> > > -             dma_release_channel(pair->dma_chan[OUT]);
> > > +     if (pair->dma_chan[dir] && pair->req_dma_chan_dev_to_dev)
> > > +             dma_release_channel(pair->dma_chan[dir]);
> >
> > Why we only apply this to one direction?
> 
> if the chan is from the back-end, it is owned by the back-end
> component, so it should be released by the back-end component,
> not here. That's why I added the flag "req_dma_chan".

Ah...I forgot the IN and OUT is for front-end and back-end. The
naming isn't very good indeed. Probably we should add a line of
comments somewhere as a reminder.

Thanks
