Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67DD228D74
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 00:53:27 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4594Y02R2MzDqWB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 May 2019 08:53:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=gmail.com
 (client-ip=2607:f8b0:4864:20::543; helo=mail-pg1-x543.google.com;
 envelope-from=nicoleotsuka@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAsZi7nZ"; 
 dkim-atps=neutral
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4594Wd4rg5zDqQK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 May 2019 08:52:13 +1000 (AEST)
Received: by mail-pg1-x543.google.com with SMTP id a3so3889760pgb.3
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 May 2019 15:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=6sNQBO0ShsOiyXm56ZAi0h5L7rJJmlpKkNelQHUJj+w=;
 b=HAsZi7nZ8gveH237kWeKnke3dDxr+y2gwyQ7UKnpPqhx9d5PwmMZdVn7AXJnbNNKxS
 ePDFO1IpN8iZHALaZ59urWJKkwTEjRYeKIbeaa5XlK6YazplFpVh3yQoNM2SreXoytPY
 btxUuPLWLnazqWiEtgybRKS/JgvW7Ksg6tagpdJUc2j9vKOTSJ7wYNlwfPPVjGSV974J
 8KoWA9zxDazLNvw1zkaTwiMaMQcUGxh/ANi8nkvxE5Fa1teN6vQn88J0xnGyo/nrpr4m
 imIzmRVIX8eS7v6OXmI02YsKDallHF64R30gSIuSWrHTWujRe7yWJmNXLOOIOAJsBNSa
 npYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=6sNQBO0ShsOiyXm56ZAi0h5L7rJJmlpKkNelQHUJj+w=;
 b=m8C6gnluFL9UcEHAMekQ5KL6mRiXUEgWxvRI4T0bPvYG6QDPDXhTjVeECqwm5fZlvS
 byAw9vgM1sHK9VSFvxnA2DuLkt9jqXpbdj7oFiko+C6Y0s2hyeEbqyo5ZpRtyRPfjZGl
 oXagz6PpDEW1mx9W3iCtnwOLYPM8m33oDeY8MMmkxSeaTIyyNhgd0yyigZOx/4MVlail
 oZxSw+kqCitf7tBEcgTnmPDS0kf4QxLA1NnWR9IJr+r3QQ4mnFmDXk2vJKASj4hwT4K4
 UInUknEZTAcUoja4lMm37dsPMownWrau04M3LKhN4JdFUVvzPdxNFB+MasysR2E8xRqs
 BeHA==
X-Gm-Message-State: APjAAAXHVeBuGXMtrJuCRZPWvXICTcb2ULWYF19/iIRFsA+/kBBjejta
 3ghOzXkFx3fxZSkKDKL9q6g=
X-Google-Smtp-Source: APXvYqyuBQiscdYr7VRVcYBJKBnh5BshxJM8AvZKv6cszmjJhESCIjuXtoiy1ZJAGyWPkAkAtziQ5w==
X-Received: by 2002:a62:2506:: with SMTP id l6mr107019907pfl.250.1558651929550; 
 Thu, 23 May 2019 15:52:09 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
 [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id x17sm341603pgh.47.2019.05.23.15.52.09
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 May 2019 15:52:09 -0700 (PDT)
Date: Thu, 23 May 2019 15:50:52 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: "broonie@kernel.org" <broonie@kernel.org>,
 "S.j. Wang" <shengjiu.wang@nxp.com>
Subject: Re: [PATCH] ASoC: fsl_esai: fix the channel swap issue after xrun
Message-ID: <20190523225052.GA29562@Asurada-Nvidia.nvidia.com>
References: <VE1PR04MB6479FF8E1B55E9BE67E7B0ECE3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <VE1PR04MB6479FF8E1B55E9BE67E7B0ECE3010@VE1PR04MB6479.eurprd04.prod.outlook.com>
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
Cc: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "timur@kernel.org" <timur@kernel.org>,
 "Xiubo.Lee@gmail.com" <Xiubo.Lee@gmail.com>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 23, 2019 at 11:04:03AM +0000, S.j. Wang wrote:
> > On Thu, May 23, 2019 at 09:53:42AM +0000, S.j. Wang wrote:
> > > > > +     /*
> > > > > +      * Add fifo reset here, because the regcache_sync will
> > > > > +      * write one more data to ETDR.
> > > > > +      * Which will cause channel shift.
> > > >
> > > > Sounds like a bug to me...should fix it first by marking the data
> > > > registers as volatile.
> > > >
> > > The ETDR is a writable register, it is not volatile. Even we change it
> > > to Volatile, I don't think we can't avoid this issue. for the
> > > regcache_sync Just to write this register, it is correct behavior.
> > 
> > Is that so? Quoting the comments of regcache_sync():
> > "* regcache_sync - Sync the register cache with the hardware.
> >  *
> >  * @map: map to configure.
> >  *
> >  * Any registers that should not be synced should be marked as
> >  * volatile."
> > 
> > If regcache_sync() does sync volatile registers too as you said, I don't mind
> > having this FIFO reset WAR for now, though I think this mismatch between
> > the comments and the actual behavior then should get people's attention.
> > 
> > Thank you
> 
> ETDR is not volatile,  if we mark it is volatile, is it correct?

Well, you have a point -- it might not be ideally true, but it sounds
like a correct fix to me according to this comments.

We can wait for Mark's comments or just send a patch to the mail list 
for review.

Thanks you
