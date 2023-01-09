Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B241F662B31
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 17:29:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NrKD04Pdhz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Jan 2023 03:29:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=EOIf6mOn;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=6W6KcsOY;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=2a02:2350:5:404::1; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=EOIf6mOn;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=6W6KcsOY;
	dkim-atps=neutral
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NrKBz3zdLz2x9T
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Jan 2023 03:28:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dTBh2Be6Q1A/kCwcp9I8OjPATYhgdC0pFQ07Wxod3+Y=;
	b=EOIf6mOnKkwHLtxJfgBg+c8bPYu10/CKQBjGac1w8zAfMoPxooFOFujSC2ijxczH4uOtY0Bvbr2DB
	 dOfgp/+5vh+TdYJ9/gS2dW0oSa9EK9kwH08Gq6W7zHk+zYtXjrMB5o85CSGzKR/qu4SxRHIkB3YjhJ
	 nK33nuOn8mS58pgxZ/8KZOujIXPLA8gEzLXSCWI63CwTYgbSjeYf3V9Aez9KhtnTgwWvhq865DJmyl
	 OegDyOeMmkzrZLPHNHiOW8GLRLIFT2s4E6jlU9Z8KUTOcuTJzwVr7O4P+N+b3pvZOFVL9/CY1/0CS7
	 UyPxebBNy3HMfqddcSX+d0Qa+M9j2aQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=dTBh2Be6Q1A/kCwcp9I8OjPATYhgdC0pFQ07Wxod3+Y=;
	b=6W6KcsOY9JYk9b8jg6LJ3hg3GFrer/Pt34tm0RAXXpZTaoIrXrRW9qNshWIWd8BH9aKUo8XvraB9r
	 XpoLe/SAQ==
X-HalOne-ID: 8af36721-903a-11ed-b86b-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 8af36721-903a-11ed-b86b-7703b0afff57;
	Mon, 09 Jan 2023 16:27:45 +0000 (UTC)
Date: Mon, 9 Jan 2023 17:27:44 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y7xAgHgg0sfh32Ga@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y7v1OxdowGdxgvUj@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7v1OxdowGdxgvUj@aspen.lan>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>, Antonino Daplas <adaplas@gmail.com>, Robin van der Gracht <robin@protonic.nl>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Jingoo Han <jingoohan1@gmail.com>, Paul Mackerras <paulus@samba.org>, linux-fbdev@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, linux-omap@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Daniel.

On Mon, Jan 09, 2023 at 11:06:35AM +0000, Daniel Thompson wrote:
> On Sat, Jan 07, 2023 at 07:26:29PM +0100, Sam Ravnborg via B4 Submission Endpoint wrote:
> > From: Sam Ravnborg <sam@ravnborg.org>
> >
> > With all users gone remove the deprecated fb_blank member in
> > backlight_properties.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> 
> 
> Reviewed-by: Daniel Thompson <daniel.thompson@linaro.org>

Thanks for the follow-up on all the backlight related patches.

> 
> 
> PS Please don't treat this like a maintainer Acked-by: and merge it
>    (Lee's not on holiday so work with Lee to figure out the merge
>    strategy ;-) ).
Nope, I am aware that the usual pattern here and wait for Lee to show
up.
For this patch there is a bug as I need to update a comment.
I will fix this when I resend after all the patches in flight has
landed. So likely after the next merge window,

	Sam

