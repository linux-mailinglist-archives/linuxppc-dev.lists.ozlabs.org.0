Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAE8746C2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 08:04:17 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vM9V4tPHzDqQH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 16:04:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::444; helo=mail-wr1-x444.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="tjDMGaLu"; 
 dkim-atps=neutral
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vM7f2dW8zDqHW
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 16:02:38 +1000 (AEST)
Received: by mail-wr1-x444.google.com with SMTP id g17so49326690wrr.5
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pU+mAWOKuT+1icWHPxBVuENuKDz0OQKOsIOlqLtN9d4=;
 b=tjDMGaLuEFwmnP5PNPyUU25EqT5kbEnRrw6KDGkV6Gb97e+iP5mC5KKgA/9r+l4VJf
 VzlSPmG+ybqde7hYfyiy8wQ15slKfYBqHc8co2TKeF5bNk29sNEiSCuIxIe8RmiMtckl
 ruT832weiB0FIxU08Z056Z5OTH0fbtYlNsfC7zBvhggV2X5Cd6Ep4w2ty6eTQo4qn6Mw
 TNoqdzn/0fNab2feocd7K0N9ekjF4zwAVTIa2IzxaUhlUDE4lTANZnmzQaFqbd3IWljy
 88lR2KUYkwMOQS6i3w+XqHHBBQE7raT55qqJKS5V4zfYicQPto5wOsmF4FiwyV1MUQs2
 Di8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pU+mAWOKuT+1icWHPxBVuENuKDz0OQKOsIOlqLtN9d4=;
 b=uRqugg40Rvyo+tuQzJVQBRu7kxcxH+VCeiM94qUaB/RgTB7uKKJPek9BvGtSG/bBaj
 i6D89btEt9mEo7nPNEINVoWJnKx+5ZcL2D8GViJEfx0YDenalVg9RqOh9k9Lwan7z8lP
 vXA+cwWDbvToSTcmnrPMbf4gth1EPu5rimk323ls06GYfRdUsx3Zj40z8jZFhs0r1g5v
 qYWu8jW2RntseictBJ+hd0/yPGRYnumLB1sAjkOT1UyJdntVelbEmXtPQaLIQfdQiTVM
 29zkAcgVkd8objyhC56VONUWDyQIpwtDK4pFYb6Dm49c8iaunYc31T9cnDyHPWWbEbex
 IycQ==
X-Gm-Message-State: APjAAAUk8WI9N84BBKZAmS7ofT8b3qkxtKRFFMxXl4WD+U4dp/x02tRB
 QKxZOXDsF7MS01RAQ3utiCRfbIXrFl7+KP8O0Sc=
X-Google-Smtp-Source: APXvYqyyHKiyF0F/r/FwIu7Qxo19mAVSEFeS5FNJ3bM5+0ZtoFzpwVF+0XlzchviCc8j+UG6zqtZKP7V/9kKChSpYiA=
X-Received: by 2002:adf:c70e:: with SMTP id k14mr95081636wrg.201.1564034554176; 
 Wed, 24 Jul 2019 23:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-9-daniel.baluta@nxp.com>
 <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724232209.GC6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:02:22 +0300
Message-ID: <CAEnQRZBW7LNZ7=c_h_ef4ZDcbFzEt61h4VAJSLo2Fb80kBqtpw@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 08/10] ASoC: dt-bindings: Document fcomb_mode
 property
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>,
 Fabio Estevam <festevam@gmail.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Timur Tabi <timur@kernel.org>,
 Xiubo Li <Xiubo.Lee@gmail.com>, Daniel Baluta <daniel.baluta@nxp.com>,
 "S.j. Wang" <shengjiu.wang@nxp.com>,
 "Angus Ainslie \(Purism\)" <angus@akkea.ca>, Takashi Iwai <tiwai@suse.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 Viorel Suman <viorel.suman@nxp.com>, linuxppc-dev@lists.ozlabs.org,
 Lucas Stach <l.stach@pengutronix.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jul 25, 2019 at 2:22 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:31PM +0300, Daniel Baluta wrote:
> > This allows combining multiple-data-line FIFOs into a
> > single-data-line FIFO.
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 4 ++++
>
> This should be sent to devicetree mail-list also.
>
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 59f4d965a5fb..ca27afd840ba 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -54,6 +54,10 @@ Optional properties:
> >                         represents first data line, bit 1 represents second
> >                         data line and so on. Data line is enabled if
> >                         corresponding bit is set to 1.
> > +  - fsl,fcomb_mode   : list of two integers (first for RX, second for TX)
> > +                       representing FIFO combine mode. Possible values for
> > +                       combined mode are: 0 - disabled, 1 - Rx/Tx from shift
> > +                       registers, 2 - Rx/Tx by software, 3 - both.
>
> Looks like a software configuration to me, instead of a device
> property. Is this configurable by user case, or hard-coded by
> SoC/hardware design?

Indeed this is a software configuration and configurable by user case.
Will think of a another way to specify it.
