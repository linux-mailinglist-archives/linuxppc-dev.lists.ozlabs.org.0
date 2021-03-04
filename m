Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E1CE32DACC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Mar 2021 21:05:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Ds20n1dTGz3d4G
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Mar 2021 07:05:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z/ZCNH1i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=robh@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Z/ZCNH1i; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Ds20K2Hhzz3cP2
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Mar 2021 07:05:04 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 70E2A64F73
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Mar 2021 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614888300;
 bh=RUOa+jhAmK+h73T8EOU9DsvhCI2E8Dn8FH/Ia3vJc3g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Z/ZCNH1ifsYXMOqxSS+vwP879iLQBcDXyn1H/7QusIM5zsOkA7artXq5whqVPK460
 7A8gdRsO3HwpoqhfpDCn9iGRqzvTMilw5fXHzT0b3HmP24fJAfw30dabM/sqJQvBs1
 fFLMfhAu/Y34199XaYjzJcW8aJAwpR2Br+UMtU0KVQC0ZEQFbZXvMaUivSNKE0uO2p
 VjkgHAjNRqucjOwH4H1+d5MljrZ1OLodWXPUpx7JFxjcmivEpct/YbbN5rw83bDZPQ
 gJSXGku2c6Yn+AWwWafPqIIrHgnsrKILLqyJIqjZShQRaHDng7AjPyJpHk7RJOku0+
 WT8qKoRn+iwKg==
Received: by mail-ed1-f41.google.com with SMTP id dm26so13023467edb.12
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 Mar 2021 12:05:00 -0800 (PST)
X-Gm-Message-State: AOAM532UG60dzA/x+TIXOwG6lyQgEWr6M+E7h5MKViK7Cpm6Q5wjCE8k
 QzQVxjDzxHUmnJvbkzicwl9mofEq7xz5thuHnw==
X-Google-Smtp-Source: ABdhPJyT+WJus7T3jwrxrdTRd/Zm7drWY1Nq415cI9il3xyb1hXROafInBX/zusYrRdtrHQ0uWkFNttElXzFgzzJpBM=
X-Received: by 2002:aa7:d3d8:: with SMTP id o24mr6306044edr.165.1614888299086; 
 Thu, 04 Mar 2021 12:04:59 -0800 (PST)
MIME-Version: 1.0
References: <1612693435-31418-1-git-send-email-shengjiu.wang@nxp.com>
 <1612693435-31418-8-git-send-email-shengjiu.wang@nxp.com>
 <20210210221704.GA2894134@robh.at.kernel.org>
 <CAA+D8ANOv91jr4381Acz1B2mZ6=Mx2J_2CMTGXmPKztv7bMjPA@mail.gmail.com>
In-Reply-To: <CAA+D8ANOv91jr4381Acz1B2mZ6=Mx2J_2CMTGXmPKztv7bMjPA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 4 Mar 2021 14:04:33 -0600
X-Gmail-Original-Message-ID: <CAL_JsqK1uc82hfdE4yj0ye-D6vygiqWkDVW96NOb-8kEFVqHMg@mail.gmail.com>
Message-ID: <CAL_JsqK1uc82hfdE4yj0ye-D6vygiqWkDVW96NOb-8kEFVqHMg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ASoC: dt-bindings: imx-rpmsg: Add binding doc for
 rpmsg machine driver
To: Shengjiu Wang <shengjiu.wang@gmail.com>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Linux-ALSA <alsa-devel@alsa-project.org>,
 Timur Tabi <timur@kernel.org>, Xiubo Li <Xiubo.Lee@gmail.com>,
 Fabio Estevam <festevam@gmail.com>, Shengjiu Wang <shengjiu.wang@nxp.com>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Nicolin Chen <nicoleotsuka@gmail.com>, Mark Brown <broonie@kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 18, 2021 at 1:23 AM Shengjiu Wang <shengjiu.wang@gmail.com> wrote:
>
> On Thu, Feb 11, 2021 at 6:18 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Feb 07, 2021 at 06:23:55PM +0800, Shengjiu Wang wrote:
> > > Imx-rpmsg is a new added machine driver for supporting audio on Cortex-M
> > > core. The Cortex-M core will control the audio interface, DMA and audio
> > > codec, setup the pipeline, the audio driver on Cortex-A core side is just
> > > to communitcate with M core, it is a virtual sound card and don't touch
> > > the hardware.
> >
> > I don't understand why there are 2 nodes for this other than you happen
> > to want to split this into 2 Linux drivers. It's 1 h/w thing.
>
> This one is for the sound card machine driver.  Another one is
> for the sound card cpu dai driver. so there are 2 nodes.

You are explaining this to me in terms of drivers. Explain it in terms
of h/w blocks.

Rob
