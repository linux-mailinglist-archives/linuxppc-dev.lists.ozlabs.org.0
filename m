Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 33495663D90
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 11:10:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Nrmlb0dz2z3cBy
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 21:10:19 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XKJ7hEZZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=XKJ7hEZZ;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Nrmkf2mV4z3c73
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 21:09:30 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C07F561588;
	Tue, 10 Jan 2023 10:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB743C433D2;
	Tue, 10 Jan 2023 10:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673345366;
	bh=wbyd3dtAWj+DS0fcJULsfdTl+t+d2B5Uw2ZuQAp6tpM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKJ7hEZZUPaCSNrB26CzNsDjquQbBentUhlmtWHZJjjl5ajSRsc2cY1J6TlsbuK52
	 UoeGdRXnxLZ8mTjHgbPSqEmh732Odonfjc467CustS3+5wXOJ8G7sxPOOj5OmOUNRy
	 w0kKUTLk2m70RapGM9Y4KlCXmcVOjK/OPWsBagysaySfqoZm82qlsKdYmxswDYrer+
	 TbB8sWFTiUPd3iYuGD/0RfH2xQw1GdiwwQtq6XoVkDXuGvwSpzZu+xjIKPR/5OQlxm
	 16rTc6Mfdvm4x7QdvW8p5nVL1YDBiVFkf6NsLekUIa2pYUR8HMFXdeiKexpKNRNiyO
	 ttG8j2EPjTphQ==
Date: Tue, 10 Jan 2023 10:09:18 +0000
From: Lee Jones <lee@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y705TvBPWkHzeMrp@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y7v1OxdowGdxgvUj@aspen.lan>
 <Y7xAgHgg0sfh32Ga@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y7xAgHgg0sfh32Ga@ravnborg.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>, Stephen Kitt <steve@sk2.org>, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, 09 Jan 2023, Sam Ravnborg wrote:

> Hi Daniel.
> 
> On Mon, Jan 09, 2023 at 11:06:35AM +0000, Daniel Thompson wrote:
> > On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > >
> > > With all users gone remove the deprecated fb_blank member in
> > > backlight_properties.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > 
> > 
> > Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>
> 
> Thanks for the follow-up on all the backlight related patches.
> 
> > 
> > 
> > PS Please don't treat this like a maintainer Acked-by: and merge it
> >    (Lee's not on holiday so work with Lee to figure out the merge
> >    strategy ;-) ).
> Nope, I am aware that the usual pattern here and wait for Lee to show
> up.

It's on the list.  Only 50 more reviews in the backlog now!

> For this patch there is a bug as I need to update a comment.
> I will fix this when I resend after all the patches in flight has
> landed. So likely after the next merge window,

-- 
Lee Jones [李琼斯]
