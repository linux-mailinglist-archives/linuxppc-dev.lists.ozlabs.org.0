Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CEFE9849
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 09:40:48 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47323J4BCGzF3tx
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Oct 2019 19:40:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::442;
 helo=mail-pf1-x442.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="O0eRAHdD"; 
 dkim-atps=neutral
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4732113VtdzF3gs
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 19:38:42 +1100 (AEDT)
Received: by mail-pf1-x442.google.com with SMTP id 3so1070897pfb.10
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Oct 2019 01:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=v2hRD77Xa+8VszcX+WELl2gUUJHpsHwPoC3bm/BbZJM=;
 b=O0eRAHdD3DBS5qT2uOGdJxD2ejyrVV4ujntxZVDXHK2ooTcUnKP/k7bUbI0NaeUM1u
 YdR7lGqW/eh/55fHGUltUpJYU583TNyN5vHE2+2RMDKHOhEJLyHilGDL7KR8Bt4N0iJg
 YXUQQ6iF3vSXDedenuRHCs6BVYYKCd2PAPbJvDtwVLgafZ82mnpo5yazIPYEjo5+0ESQ
 QTvFjFmodYnnwwZzV/mkcPJDMrgCHFfn9yPlsg27NkywsIll1sk0i4eWYlZb+HazgjpP
 1rPrIafhLPFMcndMvBiGq3ANbJxOMBZcimO8VkU0ZFyMePGUEZ1ygvBIM91Ik+Ezq07A
 arCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=v2hRD77Xa+8VszcX+WELl2gUUJHpsHwPoC3bm/BbZJM=;
 b=ZdzOI+womzZpZK7WyrTL3owZ3nIIhFvxirbXzl7BrUW/tHWHkCf5WGv9HVTEQdG63b
 fJpAVgDPXrQhEi/aNszq6GI3b4cpBCxwSNNHocalpnDlrsax6tHEmzjIK0WWZK4Mb/za
 qslUwIwyuvcwQ35xC1pOzr4JaIeaiIqVhsuLcFzNoqaKlV1bJrxUDE8cMDxz4u2fln9h
 cZLGhvwro79GakjNrAWpZpJeH6iYuGH243ACI53/lmbFdQT5LEV3Y7bRafrlm3VC3OUn
 t7k8GkAUCbGr33Te0sy7v65VaTXI2Dfah8fUNwvq1Phn+s9W0L5/KGX7JeeP/7Mg/WlM
 2DPA==
X-Gm-Message-State: APjAAAVqXtxOEDqSi5ykoL9r8qZPwWSJUdNvaE9bzftlKLp6C5umosQ8
 DZ2uK2J9oIJUUnt+FCNDZPk=
X-Google-Smtp-Source: APXvYqwahN/PAT9+SXrRtJkw50qD6UZNdHbCE8Z8QKgQmJfmTZRDGvMaddupYSRIAemYyM1TezVClw==
X-Received: by 2002:a65:6713:: with SMTP id u19mr5515149pgf.358.1572424716728; 
 Wed, 30 Oct 2019 01:38:36 -0700 (PDT)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 b26sm1617680pfo.179.2019.10.30.01.38.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 30 Oct 2019 01:38:36 -0700 (PDT)
Date: Wed, 30 Oct 2019 01:38:13 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH 2/2] ASoC: fsl_asrc: Add support for imx8qm
Message-ID: <20191030083813.GA9924@Asurada>
References: <VE1PR04MB64795758EBC0C898FBFFB3A5E3600@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB64795758EBC0C898FBFFB3A5E3600@VE1PR04MB6479.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, "perex@perex.cz" <perex@perex.cz>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Oct 30, 2019 at 03:20:35AM +0000, S.j. Wang wrote:
> Hi
> 
> > 
> > On Tue, Oct 29, 2019 at 05:17:09PM +0800, Shengjiu Wang wrote:
> > > There are two asrc module in imx8qm, each module has different clock
> > > configuration, and the DMA type is EDMA.
> > >
> > > So in this patch, we define the new clocks, refine the clock map, and
> > > include struct fsl_asrc_soc_data for different soc usage.
> > >
> > > The EDMA channel is fixed with each dma request, one dma request
> > > corresponding to one dma channel. So we need to request dma channel
> > > with dma request of asrc module.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  sound/soc/fsl/fsl_asrc.c     | 91 +++++++++++++++++++++++++++++-------
> > >  sound/soc/fsl/fsl_asrc.h     | 65 +++++++++++++++++++++++++-
> > >  sound/soc/fsl/fsl_asrc_dma.c | 39 ++++++++++++----
> > >  3 files changed, 167 insertions(+), 28 deletions(-)
> > 
> > > diff --git a/sound/soc/fsl/fsl_asrc_dma.c
> > > b/sound/soc/fsl/fsl_asrc_dma.c index d6146de9acd2..dbb07a486504
> > 100644
> > > --- a/sound/soc/fsl/fsl_asrc_dma.c
> > > +++ b/sound/soc/fsl/fsl_asrc_dma.c
> > > @@ -199,19 +199,40 @@ static int fsl_asrc_dma_hw_params(struct
> > > snd_soc_component *component,
> > >
> > >       /* Get DMA request of Back-End */
> > >       tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
> > > -     tmp_data = tmp_chan->private;
> > > -     pair->dma_data.dma_request = tmp_data->dma_request;
> > > -     dma_release_channel(tmp_chan);
> > > +     /* tmp_chan may be NULL for it is already allocated by Back-End */
> > > +     if (tmp_chan) {
> > > +             tmp_data = tmp_chan->private;
> > > +             if (tmp_data)
> > > +                     pair->dma_data.dma_request =
> > > + tmp_data->dma_request;
> > 
> > If this patch is supposed to add a !tmp_chan case for EDMA, we probably
> > shouldn't mute the !tmp_data case because dma_request will be NULL,
> > although the code previously didn't have a check either. I mean we might
> > need to error-out for !tmp_chan. Or...
> > is this intentional?
> > 
> 
> Yes, intentional. May be we can change to 
> 
>         if (!asrc_priv->soc->use_edma) {
>                 /* Get DMA request of Back-End */
>                 tmp_chan = dma_request_slave_channel(dev_be, tx ? "tx" : "rx");
>                 tmp_data = tmp_chan->private;
>                 pair->dma_data.dma_request = tmp_data->dma_request;
>                 dma_release_channel(tmp_chan);
> 
>                 /* Get DMA request of Front-End */
>                 tmp_chan = fsl_asrc_get_dma_channel(pair, dir);
>                 tmp_data = tmp_chan->private;
>                 pair->dma_data.dma_request2 = tmp_data->dma_request;
>                 pair->dma_data.peripheral_type = tmp_data->peripheral_type;
>                 pair->dma_data.priority = tmp_data->priority;
>                 dma_release_channel(tmp_chan);
>         }

Oh...now I understand..yea, I think this would be better.

Would you please change it in v2?

I am fine with other places, so may add:

Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thanks
