Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F2B2C67D117
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Jan 2023 17:14:05 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4P2m3v5fN6z3fD7
	for <lists+linuxppc-dev@lfdr.de>; Fri, 27 Jan 2023 03:14:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=Qus+ZU4R;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=52qvCSVo;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=2a02:2350:5:404::1; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=Qus+ZU4R;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=52qvCSVo;
	dkim-atps=neutral
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4P2m2v6tBWz2xH6
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Jan 2023 03:13:08 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
	b=Qus+ZU4RfOcNTS5rGnxfoQBcYpzPyF+aRz3PIQVZfjvTUjFpmtXeWmvp4rw3S7WD4kIU1isAjNCvI
	 qUFaf54lfngcQlsAyzn24QB3jg6dJQZkwRy6ly958KbRgFoeCt50M1sQ+1V2A0na3zKwfSSZ+BYCfi
	 svYtBApqryHA65/AytjF3mjQIlcOArwXu3tumrruNQocjmqLszEyWasAT29despRAzu0aObcNzXFBK
	 v0ytzr0e6G8s8tDhyint0ydbcValxEsn4ABDRtgPQ0br5+OrWW6rVQPIsnBDgzQ8nRQ8WiuKVDc8U0
	 nHkv92BxdqWcfXVuUnCtBBmCycCDUXg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=YwsGbP8UqP9PCAPALAZHuxiR6vSJEQg7mBCwK/505D4=;
	b=52qvCSVoaxzKZeZmgUDnZYFeQCCVuo6KfDcOqqSiktTnnPsDDyAxqd+8jTSlziHCfI76MLtMpL0Iy
	 vITTQDACA==
X-HalOne-ID: 27718327-9d94-11ed-b665-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 27718327-9d94-11ed-b665-7703b0afff57;
	Thu, 26 Jan 2023 16:11:58 +0000 (UTC)
Date: Thu, 26 Jan 2023 17:11:56 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Lee Jones <lee@kernel.org>
Subject: Re: [PATCH 15/15] backlight: backlight: Drop the deprecated fb_blank
 property
Message-ID: <Y9KmTFl5YbypgMZy@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-15-1bd9bafb351f@ravnborg.org>
 <Y9KNziZJxMjCffbs@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y9KNziZJxMjCffbs@google.com>
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

Hi Lee,
On Thu, Jan 26, 2023 at 02:27:26PM +0000, Lee Jones wrote:
> On Sat, 07 Jan 2023, Sam Ravnborg via B4 Submission Endpoint wrote:
> 
> > From: Sam Ravnborg <sam@ravnborg.org>
> > 
> > With all users gone remove the deprecated fb_blank member in
> > backlight_properties.
> > 
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Lee Jones <lee@kernel.org>
> > Cc: Daniel Thompson <daniel.thompson@linaro.org>
> > Cc: Jingoo Han <jingoohan1@gmail.com>
> > ---
> >  drivers/video/backlight/backlight.c |  2 --
> >  include/linux/backlight.h           | 22 ----------------------
> >  2 files changed, 24 deletions(-)
> 
> Applied, thanks

Some of the dependent patches in this series are not yet applied.
I have them queued up for processing this weekend, but I missed the -rc6
window for drm-misc so they will likely not hit upstream in the upcoming
merge window.
I can try to expedite it.

But if you have not yet pushed it, please revert this patch.
Then I will resend only when the remaining patches are upstream.

	Sam
