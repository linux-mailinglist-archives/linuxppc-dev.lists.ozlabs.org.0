Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7458F67D1A7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:32:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2mSc2YNKz3fGc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:32:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1ecaBNc;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=lee@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=h1ecaBNc;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2mRf2mxzz3bT4
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:31:10 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E7077618A8;
	Thu, 26 Jan 2023 16:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F28DCC4339B;
	Thu, 26 Jan 2023 16:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1674750667;
	bh=Tm20dHbAFf/pXPytexrgAnAHrgWKBBgE48u5vZAscGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h1ecaBNcHoRmufYHj10lOotbnn0rWIQC85lVIDoK4Jm1+YCHjDUbSzDYa1M7Lb2eZ
	 5zKnI4ZD6kA0Sx3frT3CCnQhLrRlyTcK2v/Tysoqavyjp2/XGir4/+wORpaH9Di7NP
	 X875HViKzvPZ4wp3hh21NVyv8azAYawVFTzXj5WBkP6ScuV/NFaipOxjxoZMEsvPow
	 Oq80oSIW4Ng994V3as2N1R37s7/KdSBZOK0qTummzoIvwhx2VMaA342NYcdZtQ0Voa
	 OpSYzhQrqciYSeDQvRYwJ5vY24jDZatfR0MgTeoqE4uP/w0LRqaHYBANBXcRT02F7w
	 D7Osl9C/KWIdQ==
Date: Thu, 26 Jan 2023 16:30:59 +0000
From: Lee Jones <lee@kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9Kqw7ey6I7rQuZu@google.com>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y9KNziZJxMjCffbs@google.com>
 <Y9KmTFl5YbypgMZy@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y9KmTFl5YbypgMZy@ravnborg.org>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-omap@vger.kernel.org, Stephen Kitt <steve@sk2.org>, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, 26 Jan 2023, Sam Ravnborg wrote:

> Hi Lee,
> On Thu, Jan 26, 2023 at 02:27:26PM +0000, Lee Jones wrote:
> > On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:
> > 
> > > From: Sam Ravnborg <sam@ravnborg.org>
> > > 
> > > With all users gone remove the deprecated fb_blank member in
> > > backlight_properties.
> > > 
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > Cc: Lee Jones <lee@kernel.org>
> > > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > > Cc: Jingoo Han <jingoohan1@gmail.com>
> > > ---
> > >  drivers/video/backlight/backlight.c |  2 --
> > >  include/linux/backlight.h           | 22 ----------------------
> > >  2 files changed, 24 deletions(-)
> > 
> > Applied, thanks
> 
> Some of the dependent patches in this series are not yet applied.
> I have them queued up for processing this weekend, but I missed the -rc6
> window for drm-misc so they will likely not hit upstream in the upcoming
> merge window.
> I can try to expedite it.
> 
> But if you have not yet pushed it, please revert this patch.
> Then I will resend only when the remaining patches are upstream.

Thanks for the info.  Dropped.

-- 
Lee Jones [李琼斯]
