Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D62C25BA30
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 07:40:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhqR71njVzDr3P
	for <lists+linuxppc-dev@lfdr.de>; Thu,  3 Sep 2020 15:40:51 +1000 (AEST)
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
 header.s=20161025 header.b=BlG2wNJP; dkim-atps=neutral
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com
 [IPv6:2607:f8b0:4864:20::843])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhqNj4S73zDqdt
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  3 Sep 2020 15:38:45 +1000 (AEST)
Received: by mail-qt1-x843.google.com with SMTP id t20so1063879qtr.8
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Sep 2020 22:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/srxmXOQUdGOTgQu2IuqE2j58tt26cmpQAGEQoUfF/k=;
 b=BlG2wNJPYLR+rFryCKSetR5cKCniB4g/4HijU9okP0ui0rIsM3wxVymFTj14GFBX6q
 pK5+3rG4FJjOIgBAIpAjbQVoXniXWSV0TdHquceFaLdMTu8y7tro9mpkEiFR+UX5OlXU
 FmrMJRd16wseT1va/r33k5gJEc7XwRoD2CVA8REXK0RmYehVgri6Wsm8Wrsw31hc/BAo
 O+Va8jlRuamwJ81xgknpaV/yP8nR2C2oRaC32NUaqJxSUwmLsvx1W0uTxBP7Tv+NOj5Q
 MyLctmJl7IfP+gDw0n0DhQtOdg4Q3DG6Tm/GmE/zgu9UqsqiPeH5aB0lP77qRuuxhuWq
 8lCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/srxmXOQUdGOTgQu2IuqE2j58tt26cmpQAGEQoUfF/k=;
 b=WlmK/FiEq6FrtuFsUA8SYOxUwrrZblalyGY4zZNVaH+Eu2Izz7J0/rU6bDwSKYbfpp
 9qWO+zOVQaKIDUJ2CDTqkGDtezmao2nqnOUk6Pc6KSpzBNNb+NIKQ559Gz8+tyC06nbi
 joIOeq63j9H6sG93xsBoWAdAn2tC6swXfZvoHWy6ZQgPceI9WCId1HmsjmC4P1guarcF
 47Airj0RY9fF6uO9Mlf5FpRdgWjwvl4+flnQIkvtXNSf1No/KUSvv7ZLrEoComM6UbvY
 yDRHWkSmktXEcfUkGlYz63wGgyViCE/xrU6ZNkjNnWPrPNSktCnPhcJuyuylFdt0Fz5+
 d0BA==
X-Gm-Message-State: AOAM531xKijQDZB6i6GXULIAMjzhHq2zwJR8y7wLL4i2JY3OmoVeP3B7
 z1AM4sYaqNJ9ZGri5wIeDMJTva87FGFQoQq+aoE=
X-Google-Smtp-Source: ABdhPJzaK6BoZepXoJ10dK0NPS4TvabWN2zlZEZXM5iY2qiaE4SmYwSpCXEsJMm/APS6kZyYQg8zAMlaCjyRxI4OR/8=
X-Received: by 2002:ac8:67ca:: with SMTP id r10mr1883306qtp.54.1599111521573; 
 Wed, 02 Sep 2020 22:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1599102555-17178-1-git-send-email-shengjiu.wang@nxp.com>
 <20200903034018.GC4517@Asurada-Nvidia>
In-Reply-To: <20200903034018.GC4517@Asurada-Nvidia>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Thu, 3 Sep 2020 13:38:30 +0800
Message-ID: <CAA+D8AOJGH77cpbC9dqaE_BES208sgEPDNPWbZ8HGpfom_FoRg@mail.gmail.com>
Subject: Re: [PATCH] ASoC: fsl_sai: Set SAI Channel Mode to Output Mode
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Sep 3, 2020 at 11:42 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Thu, Sep 03, 2020 at 11:09:15AM +0800, Shengjiu Wang wrote:
> > Transmit data pins will output zero when slots are masked or channels
> > are disabled. In CHMOD TDM mode, transmit data pins are tri-stated when
> > slots are masked or channels are disabled. When data pins are tri-stated,
> > there is noise on some channels when FS clock value is high and data is
> > read while fsclk is transitioning from high to low.
> >
> > Signed-off-by: Cosmin-Gabriel Samoila <cosmin.samoila@nxp.com>
> > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
>
> Acked-by: Nicolin Chen <nicoleotsuka@gmail.com>
>
> Though one nit inline:
>
> > ---
> >  sound/soc/fsl/fsl_sai.c | 12 ++++++++++--
> >  sound/soc/fsl/fsl_sai.h |  2 ++
> >  2 files changed, 12 insertions(+), 2 deletions(-)
> >
> > diff --git a/sound/soc/fsl/fsl_sai.c b/sound/soc/fsl/fsl_sai.c
> > index 62c5fdb678fc..33b194a5c1dc 100644
> > --- a/sound/soc/fsl/fsl_sai.c
> > +++ b/sound/soc/fsl/fsl_sai.c
> > @@ -486,6 +486,12 @@ static int fsl_sai_hw_params(struct snd_pcm_substream *substream,
> >
> >       val_cr4 |= FSL_SAI_CR4_FRSZ(slots);
> >
> > +     /* Output Mode - data pins transmit 0 when slots are masked
> > +      * or channels are disabled
> > +      */
>
> Coding style for multi-line comments. Yet, probably can simplify?
>
>         /* Set to output mode to avoid tri-stated data pins */
Ok, will update in v2.

best regards
wang shengjiu
