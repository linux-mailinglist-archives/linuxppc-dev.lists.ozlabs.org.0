Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 372F31DB1EE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 13:38:34 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49RrNk4BdPzDqNv
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 May 2020 21:38:30 +1000 (AEST)
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
 header.s=20161025 header.b=LzRhD8IV; dkim-atps=neutral
Received: from mail-qk1-x742.google.com (mail-qk1-x742.google.com
 [IPv6:2607:f8b0:4864:20::742])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49Rr2X6TdfzDqPS
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 21:22:44 +1000 (AEST)
Received: by mail-qk1-x742.google.com with SMTP id 142so3098252qkl.6
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 May 2020 04:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=LzRhD8IVgnmIVQzzoYcQc9SGvryKW9AvjBv+5xt1U5TlXPqkgWZYhhLZ+fDOiIMJVE
 j8fn5+fABxBNdukYPVM+l0vF16UvWxzpEJBJLKCW56Z4DkC5xa0rvUGkgFzj9G0Agcbl
 CR4ePEwCrdO65XTKv1Q7qKPo1V5T2jQjs+MOPyTun845of6hg3kQqItmtboNDlREjJcu
 Z2pKrl+oLt5umJH0Z+pIMp+EXFb7tOaN6BDew0UWwQ+/7bg+moQfUGPSduuzZJPyI5/X
 2YFdC3nAFQopV7V8BMDEMRy8CAn1JlcOebH4yDfMrImRBq3nMNW49Dcoe93t2TjTRQsi
 5qvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZjqVhvVauJwxzdubRCxzpwyDgNZsr/jK/zmF2UGqkm0=;
 b=jwke02MMumN5ZWsTBZpUQFG+wckEEnaRJ7bb3XfFiTh7J04Td2JPe14AGu1Sv/zOdW
 esgCwR+k48k8nFwrwgYTzP7sTXbfF6nHgrp1dvCutniWeC31v7pToDqWf5iUeqqaknC3
 //Muh2IPZmH6fSRhtpsBFXtgjC4nE/9T+YV920UvxYEPapzRT1Tjro7OTkR+EMTtGjtS
 vEOMadp+6YuPtVwWjjDcPXcyh0z1wwWH52JbZBfye5sV0/VKgqe0foGCoBnAgCbVbsPI
 IbrSRx/+t10e0HfzM1bmi4yATddAjfV5DvONzUF/i32M8hU2Ku0nAC53lbnOWeWOey7I
 RFXA==
X-Gm-Message-State: AOAM5330R4Gu6CQNiq+ti5bfZ3JD2ndld3n67NYJDOSFQpJeh7pdvpU7
 qb0X2LPXf77n/ztPOC+4656VwayyfzoJnGRt9oI=
X-Google-Smtp-Source: ABdhPJxBdmgJNCR88xlbXPGclNlO2GaIwRkfV+dyapGMbu4Q9RuUthOHvMqPP4yv8y1KdCvdCmqnj7BHtLVZZI62f64=
X-Received: by 2002:a37:a50d:: with SMTP id o13mr4087174qke.121.1589973760794; 
 Wed, 20 May 2020 04:22:40 -0700 (PDT)
MIME-Version: 1.0
References: <1589881301-4143-1-git-send-email-shengjiu.wang@nxp.com>
 <0866cd8cdb0c22f0b2a6814c4dafa29202aad5f3.camel@pengutronix.de>
 <CAA+D8APhHvA39wmCayeCsAEKmOJ0n7qOQiT1tZmFHr4+yASgTw@mail.gmail.com>
 <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
In-Reply-To: <53258cd99caaf1199036737f8fad6cc097939567.camel@pengutronix.de>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 20 May 2020 19:22:19 +0800
Message-ID: <CAA+D8APAMRwtVneqFsuBgAhozmQo3R0AQi0bVdUCQO4Af4xVfw@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl: imx-pcm-dma: Don't request dma channel in probe
To: Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: sumit.semwal@linaro.org, linaro-mm-sig@lists.linaro.org,
 Linux-ALSA <alsa-devel@alsa-project.org>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel <linux-kernel@vger.kernel.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 perex@perex.cz, Nicolin Chen <nicoleotsuka@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, s.hauer@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi

On Wed, May 20, 2020 at 5:42 PM Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Mittwoch, den 20.05.2020, 16:20 +0800 schrieb Shengjiu Wang:
> > Hi
> >
> > On Tue, May 19, 2020 at 6:04 PM Lucas Stach <l.stach@pengutronix.de> wr=
ote:
> > > Am Dienstag, den 19.05.2020, 17:41 +0800 schrieb Shengjiu Wang:
> > > > There are two requirements that we need to move the request
> > > > of dma channel from probe to open.
> > >
> > > How do you handle -EPROBE_DEFER return code from the channel request =
if
> > > you don't do it in probe?
> >
> > I use the dma_request_slave_channel or dma_request_channel instead
> > of dmaengine_pcm_request_chan_of. so there should be not -EPROBE_DEFER
> > return code.
>
> This is a pretty weak argument. The dmaengine device might probe after
> you try to get the channel. Using a function to request the channel
> that doesn't allow you to handle probe deferral is IMHO a bug and
> should be fixed, instead of building even more assumptions on top of
> it.
>

I see some driver also request dma channel in open() or hw_params().
how can they avoid the defer probe issue?
for example=EF=BC=9A
sound/arm/pxa2xx-pcm-lib.c
sound/soc/sprd/sprd-pcm-dma.c

> > > > - When dma device binds with power-domains, the power will
> > > > be enabled when we request dma channel. If the request of dma
> > > > channel happen on probe, then the power-domains will be always
> > > > enabled after kernel boot up,  which is not good for power
> > > > saving,  so we need to move the request of dma channel to .open();
> > >
> > > This is certainly something which could be fixed in the dmaengine
> > > driver.
> >
> > Dma driver always call the pm_runtime_get_sync in
> > device_alloc_chan_resources, the device_alloc_chan_resources is
> > called when channel is requested. so power is enabled on channel
> > request.
>
> So why can't you fix the dmaengine driver to do that RPM call at a
> later time when the channel is actually going to be used? This will
> allow further power savings with other slave devices than the audio
> PCM.
>
> Regards,
> Lucas
>

It seems the best place for calling pm_runtime_get_sync is the
device_alloc_chan_resources, and calling pm_runtime_put_sync
in the .device_free_chan_resources

For the slave_sg mode, the .device_prep_slave_sg and
.device_issue_pending  will be called many times after
.device_alloc_chan_resources. so it is not good to call
pm_runtime_get_sync in .device_prep_slave_sg or
.device_issue_pending

best regards
wang shengjiu
