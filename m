Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93EFE177038
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 08:40:20 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Wpns2KdQzDqX0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  3 Mar 2020 18:40:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::441;
 helo=mail-pf1-x441.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=N2hhA1DH; dkim-atps=neutral
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48WplT2tLFzDqW7
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  3 Mar 2020 18:38:11 +1100 (AEDT)
Received: by mail-pf1-x441.google.com with SMTP id q9so1034910pfs.5
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 02 Mar 2020 23:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=lp++SjSydgt9rFdJFF3CB/lDlkmkywlwzPGaMF0zRlA=;
 b=N2hhA1DHJRr48b03MdRwK7wZT+y/IIbu0elhvz7gKyVzfWBwfAl0mdXhHechKW3w5h
 wBxpbplnqcGuRCe2aCyqhLZ2wpo+o2zcRsqCG1KdGYHdSJxY32PohGGlo4aMczuoJHna
 CMWMl9Exwvu57I8hyLPt/3Q4RBQTH5w67lBRMPCFvGriXxlrcvaH322RGt4kpMoBHUxh
 3E4JEzdChP8g3QMeRMTmn351CirQyx390iw1AbTyvsytm9dZSNigQYXyPmQAa74sAYIC
 Pj+UjOdxqIfBRBpzjWssycX5jwrJViK8MAIoJf3vZquhGT10/uKK0BZsNZxEY15fRJdw
 35Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=lp++SjSydgt9rFdJFF3CB/lDlkmkywlwzPGaMF0zRlA=;
 b=MPbRSHatP2nloRcpGxY6W530I9ydrFmLfRW7cRkrJZQs8iWouuI42gVEM3DNHV3DOO
 v+MiIIN+s3WoqlbZMQ3vgPIUFNztEEXHO5xwLPD5HSBhCLYBvD2fHV7Z21rVPdneDFD5
 blipXTH0RQi6AqALndClBGglp2YQ+PZ2NPTeEFWromcn5U8ZmeQfn4ODB9I3yCvQxxhR
 6GeSxqNhjYTdO6ypBIjDAM3OvtcZU30Rw+qwayX1V3oPlEDRlfwyZYnVHMERC1kzj+mf
 xK3kssKDimshunyOVkMyAwhf1kJq/35iLl1jUcxFuyiRbw82MYK4mn/yNR/Ti3iXfG0T
 8TZg==
X-Gm-Message-State: ANhLgQ1PK6K92FTnRBK0Xbt4z2rMvmyrgmcaDFM72AAhulDaCaKGtep7
 zOsGm9zVTTbKN81iZ+Imzxc=
X-Google-Smtp-Source: ADFU+vvzwWp+30x2055lNCAa+QhYWY8R2yyZZoSUjWYJZln5Koehw7RijTiQ1fkyuH3SDxsLzC7qTQ==
X-Received: by 2002:aa7:8582:: with SMTP id w2mr2820931pfn.89.1583221088207;
 Mon, 02 Mar 2020 23:38:08 -0800 (PST)
Received: from Asurada (c-73-162-191-63.hsd1.ca.comcast.net. [73.162.191.63])
 by smtp.gmail.com with ESMTPSA id
 p94sm1516093pjp.15.2020.03.02.23.38.07
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 02 Mar 2020 23:38:07 -0800 (PST)
Date: Mon, 2 Mar 2020 23:37:46 -0800
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Shengjiu Wang <shengjiu.wang@gmail.com>
Subject: Re: [PATCH v4 1/8] ASoC: dt-bindings: fsl_asrc: Change asrc-width to
 asrc-format
Message-ID: <20200303073745.GA2868@Asurada>
References: <cover.1583039752.git.shengjiu.wang@nxp.com>
 <872c2e1082de6348318e14ccd31884d62355c282.1583039752.git.shengjiu.wang@nxp.com>
 <20200303014133.GA24596@bogus>
 <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAA+D8ANgECaz=tRtRwNP=jMXBD0XciAE0HUYROH8uuo03iDejg@mail.gmail.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Timur Tabi <timur@kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, shawnguo@kernel.org,
 Shengjiu Wang <shengjiu.wang@nxp.com>, Xiubo Li <Xiubo.Lee@gmail.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Takashi Iwai <tiwai@suse.com>,
 Mark Brown <broonie@kernel.org>, linux-imx@nxp.com, kernel@pengutronix.de,
 Fabio Estevam <festevam@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 s.hauer@pengutronix.de, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 03, 2020 at 11:59:30AM +0800, Shengjiu Wang wrote:
> Hi
> 
> On Tue, Mar 3, 2020 at 9:43 AM Rob Herring <robh@kernel.org> wrote:
> >
> > On Sun, Mar 01, 2020 at 01:24:12PM +0800, Shengjiu Wang wrote:
> > > asrc_format is more inteligent, which is align with the alsa
> > > definition snd_pcm_format_t, we don't need to convert it to
> > > format in driver, and it can distinguish S24_LE & S24_3LE.
> > >
> > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > ---
> > >  Documentation/devicetree/bindings/sound/fsl,asrc.txt | 4 +++-
> > >  1 file changed, 3 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/sound/fsl,asrc.txt b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > index cb9a25165503..0cbb86c026d5 100644
> > > --- a/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > +++ b/Documentation/devicetree/bindings/sound/fsl,asrc.txt
> > > @@ -38,7 +38,9 @@ Required properties:
> > >
> > >     - fsl,asrc-rate   : Defines a mutual sample rate used by DPCM Back Ends.
> > >
> > > -   - fsl,asrc-width  : Defines a mutual sample width used by DPCM Back Ends.
> > > +   - fsl,asrc-format : Defines a mutual sample format used by DPCM Back
> > > +                       Ends. The value is one of SNDRV_PCM_FORMAT_XX in
> > > +                       "include/uapi/sound/asound.h"
> >
> > You can't just change properties. They are an ABI.
> 
> I have updated all the things related with this ABI in this patch series.
> What else should I do?

You probably should add one beside the old one. And all
the existing drivers would have to continue to support
"fsl,asrc-width", even if they start to support the new
"fsl,asrc-format". The ground rule here is that a newer
kernel should be able to work with an old DTB, IIRC.

One more concern here is about the format value. Though
I don't think those values, defined in asound.h, would
be changed, yet I am not sure if it's legit to align DT
bindings to a subsystem header file -- I only know that
usually we keep shared macros under include/dt-bindings
folder. I won't have any problem, if either Rob or Mark
has no objection.
