Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A70E746E7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 08:10:56 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45vMK73qy0zDqF6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2019 16:10:51 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2a00:1450:4864:20::441; helo=mail-wr1-x441.google.com;
 envelope-from=daniel.baluta@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="YHuUocaS"; 
 dkim-atps=neutral
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45vMGS3Z9PzDqKD
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2019 16:08:32 +1000 (AEST)
Received: by mail-wr1-x441.google.com with SMTP id n9so24255985wrr.4
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jul 2019 23:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=latsD49SbH6+14WTREJoq/H2WKuYcXOmWv0v0lWZfMo=;
 b=YHuUocaSQuBDb4/+my9nanv/AIgj+H3gXw2FWCnDH18O9Sxm/qfJ9hBycuupuqsSyr
 Q2hxlHfOF6YK5++nJOuJ8DLpjgJGuNXVTDmwX/x5y+LW/6V58NoDGh0T01lHBL+NYZ78
 vVuL+uUhoUtrI4C1goiEMpKcZSb3X15aPhKzXl/3m/LwQJXBld/2BmTftSa0eZepVxSE
 W/Gh62II2Zc3TIErxNyRyA9hVZXru9veJ5Hg3red1HKi6ClYcvoOaatdWlTX8HXduuHJ
 XaXgyLk4oLHkdPQhyKzBjIRfv+UgBBf5AetkBMThgK3FIuXommwlOf7PS4DNf+YZZmXW
 Nr7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=latsD49SbH6+14WTREJoq/H2WKuYcXOmWv0v0lWZfMo=;
 b=YhIsgETr+yJoXDUFz9fxbwe3oJsAgQUeMP0Xv/tuVXnKhlrSkot70r90Y0n1UnN8d+
 4m0XK3AozOxipNK+t2+fJPInIk566YXEDYIZbjr0C8N7MuoaoOu0JhzeYTwqLaZvrvwA
 TWmBYhwqpf+7xKWuOwz2w/UHQmRHAyJ2y/12WIWXyIO/qSDSZLiDwjZs2XeOt0G05bgP
 cUYjeEHKTRT8LLLCHqXn3mt2x0tR+7ZDlchppG+m6piJvOwZD5MZB4u5gt0OCfUkofz7
 nE/7vpFyWxI0ShwKvDP+DGzVpN3/GbhpRNCcLHAq1fl+SDaPOrEjQEc95oQRQL61v4iG
 CGDw==
X-Gm-Message-State: APjAAAWBialJu5rTeYQ8cgUYUe8TyXRdRkIXdNW9uLwRnNR5LCsgUpgH
 EuJAiFG5Q/QqLHb4p96Ay4rWs2yXn7vbmXFr/Pw=
X-Google-Smtp-Source: APXvYqygKTZcpAUad4xCLhuwEwjXgMEOhsMCmrgBhao93Fa2kJ6wTZaNsdznhI1yMHhycn2/c4/j+qf52ggAwTcXS60=
X-Received: by 2002:adf:f450:: with SMTP id f16mr60328116wrp.335.1564034909544; 
 Wed, 24 Jul 2019 23:08:29 -0700 (PDT)
MIME-Version: 1.0
References: <20190722124833.28757-1-daniel.baluta@nxp.com>
 <20190722124833.28757-7-daniel.baluta@nxp.com>
 <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
In-Reply-To: <20190724231342.GB6859@Asurada-Nvidia.nvidia.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 25 Jul 2019 09:08:18 +0300
Message-ID: <CAEnQRZDt7b54YAu7w6vbGi9=OXk6rRv2k2y0tjL_GN4j1m3XdA@mail.gmail.com>
Subject: Re: [alsa-devel] [PATCH 06/10] ASoC: dt-bindings: Document dl_mask
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

On Thu, Jul 25, 2019 at 2:14 AM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Jul 22, 2019 at 03:48:29PM +0300, Daniel Baluta wrote:
> > SAI supports up to 8 data lines. This property let the user
> > configure how many data lines should be used per transfer
> > direction (Tx/Rx).
> >
> > Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> > ---
> >  Documentation/devicetree/bindings/sound/fsl-sai.txt | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/sound/fsl-sai.txt b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > index 2e726b983845..59f4d965a5fb 100644
> > --- a/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > +++ b/Documentation/devicetree/bindings/sound/fsl-sai.txt
> > @@ -49,6 +49,11 @@ Optional properties:
>
> > +  - fsl,dl_mask              : list of two integers (bitmask, first for RX, second
>
> Not quite in favor of the naming here; And this patch should
> be sent to the devicetree maillist and add DT maintainers --
> they would give some good naming advice.
>
> From my point of view, I feel, since data lines are enabled
> consecutively, probably it'd be clear just to have something
> like "fsl,num-datalines = <2 2>", corresponding to "dl_mask
> = <0x3 0x3>". I believe there're examples in the existing DT
> bindings, so let's see how others suggest.
>

Your suggestion looks good to me. Anyhow, after reading again the
documentation it seems that datalines are not always required to
be consecutive.

The need to be consecutive only when FIFO combine mode is enabled.
Will fix the documentation in the next version.
