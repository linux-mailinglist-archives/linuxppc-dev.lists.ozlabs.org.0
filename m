Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 189C616F552
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 02:53:39 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48RzNc3YmGzDqdS
	for <lists+linuxppc-dev@lfdr.de>; Wed, 26 Feb 2020 12:53:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::744;
 helo=mail-qk1-x744.google.com; envelope-from=shengjiu.wang@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=tb0I8cSF; dkim-atps=neutral
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com
 [IPv6:2607:f8b0:4864:20::744])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48RzLj0kGfzDqRx
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 26 Feb 2020 12:51:54 +1100 (AEDT)
Received: by mail-qk1-x744.google.com with SMTP id u124so1145443qkh.13
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Feb 2020 17:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ExNh/gghsj1ImBILJ0ozb3ysT/hRkbhT4G0voLUZVgI=;
 b=tb0I8cSFTYgT7uR05Z3XcyQJudBEyylDCJtGYxlyf+qKYaSVvQWf55BjyB0khyCpLk
 URIaKz8zV1v01cmlqTYofRQsyBn8Q5Xt2rQEalI+Bp/hZVGA+FiZ+yRld1QP6kbZoWGJ
 7Gj0IK6HUXHNGltU2GzHzrFP3clFdNNN+0OktaNn9k/nST5HQ3mzbSEIY+czvohawaQD
 MAhSbkhjjugNTm+rbJ245lRRzWZKczZJpSiFeufw6NQb6WrEVegjDueb6bBFi4UeBGyu
 c6Jc6g0+n6samzd3DBCYRm9UKYyRa0j4nQ79StvG/C232fibx7lajHhp71iMwm8podbN
 axzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ExNh/gghsj1ImBILJ0ozb3ysT/hRkbhT4G0voLUZVgI=;
 b=IRwI6stqULgsR0RtAaQUBh0UTuboj6NBDjXTcVzd1UnnHH94Y7wioWffEIJSEJNMav
 eqcLrPnhz0j4XQIW4bzDojDKYSlhq+zpRzb+4nYkOcN9nDOsWdIpHjFzCujjtMLMouaT
 nJzYKNtiveNNnSI2jgloaAspl6FTRj+oTdjmC7v+Gvlo6AaebjuNp7jv58XX8wnlMiLi
 tCB4urNbE77kflKBUcmnW5XvoASAWfKh78K6dnq761d2aN5EY2tyB8ISlNqQBEPEDgqx
 pkToCsxeEga3eKIHhJ4jmPdeXkLCuoiCOAzr1NzFCyVgmVo3xXqub9223XcA2Ni/61bx
 Ik7A==
X-Gm-Message-State: APjAAAWQDEBnJIXb3MHDDN4dkTwa7w/VU+MXscckGEfSx6QVqB6n7A4E
 ui29r0m19ed31SOUiLBoRbL1UtetTAcHCazRbow=
X-Google-Smtp-Source: APXvYqyynmPK9+Rdbdj6+s+AmVwrzFwMwUtQnyhXObjLlWE28j9mHJIWKxFk9yjPuy5ceKsGuAuF/TUUtksL5KcdvEY=
X-Received: by 2002:a37:5c9:: with SMTP id 192mr2480838qkf.103.1582681910840; 
 Tue, 25 Feb 2020 17:51:50 -0800 (PST)
MIME-Version: 1.0
References: <VE1PR04MB6479BCA376502F6F1251602BE3EC0@VE1PR04MB6479.eurprd04.prod.outlook.com>
 <20200225080350.GA11332@Asurada>
In-Reply-To: <20200225080350.GA11332@Asurada>
From: Shengjiu Wang <shengjiu.wang@gmail.com>
Date: Wed, 26 Feb 2020 09:51:39 +0800
Message-ID: <CAA+D8AMFzDs8uXiR-N8harRVmhC+3i8p9HdO2CgxOCX8WVfXAw@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: fsl_easrc: Add EASRC ASoC CPU DAI and
 platform drivers
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>, "S.j. Wang" <shengjiu.wang@nxp.com>,
 "tiwai@suse.com" <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 25, 2020 at 4:05 PM Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> On Mon, Feb 24, 2020 at 08:53:25AM +0000, S.j. Wang wrote:
> > Hi
> >
> > > >
> > > > Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
> > > > ---
> > > >  sound/soc/fsl/Kconfig           |   10 +
> > > >  sound/soc/fsl/Makefile          |    2 +
> > > >  sound/soc/fsl/fsl_asrc_common.h |    1 +
> > > >  sound/soc/fsl/fsl_easrc.c       | 2265 +++++++++++++++++++++++++++++++
> > > >  sound/soc/fsl/fsl_easrc.h       |  668 +++++++++
> > > >  sound/soc/fsl/fsl_easrc_dma.c   |  440 ++++++
> > >
> > > I see a 90% similarity between fsl_asrc_dma and fsl_easrc_dma files.
> > > Would it be possible reuse the existing code? Could share structures from
> > > my point of view, just like it reuses "enum asrc_pair_index", I know
> > > differentiating "pair" and "context" is a big point here though.
> > >
> > > A possible quick solution for that, off the top of my head, could be:
> > >
> > > 1) in fsl_asrc_common.h
> > >
> > >         struct fsl_asrc {
> > >                 ....
> > >         };
> > >
> > >         struct fsl_asrc_pair {
> > >                 ....
> > >         };
> > >
> > > 2) in fsl_easrc.h
> > >
> > >         /* Renaming shared structures */
> > >         #define fsl_easrc fsl_asrc
> > >         #define fsl_easrc_context fsl_asrc_pair
> > >
> > > May be a good idea to see if others have some opinion too.
> > >
> >
> > We need to modify the fsl_asrc and fsl_asrc_pair, let them
> > To be used by both driver,  also we need to put the specific
> > Definition for each module to same struct, right?
>
> Yea. A merged structure if that doesn't look that bad. I see most
> of the fields in struct fsl_asrc are being reused by in fsl_easrc.
>
> > >
> > > > +static const struct regmap_config fsl_easrc_regmap_config = {
> > > > +     .readable_reg = fsl_easrc_readable_reg,
> > > > +     .volatile_reg = fsl_easrc_volatile_reg,
> > > > +     .writeable_reg = fsl_easrc_writeable_reg,
> > >
> > > Can we use regmap_range and regmap_access_table?
> > >
> >
> > Can the regmap_range support discontinuous registers?  The
> > reg_stride = 4.
>
> I think it does. Giving an example here:
> https://github.com/torvalds/linux/blob/master/drivers/mfd/da9063-i2c.c

The register in this i2c driver are continuous,  from 0x00, 0x01, 0x02...

But our case is 0x00, 0x04, 0x08, does it work?

best regards
wang shengjiu
