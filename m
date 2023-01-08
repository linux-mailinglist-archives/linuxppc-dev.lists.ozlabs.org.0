Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7EA66144F
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 10:31:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqWzs2g0Kz3cGC
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 20:31:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=OMBp7D4Q;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=1bH+enBd;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=2a02:2350:5:404::1; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=OMBp7D4Q;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=1bH+enBd;
	dkim-atps=neutral
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqWyt0sMmz3bNw
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Jan 2023 20:30:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Oybl0kFzJk1OHKBfarCPAX+ldUYM8qIDtwFbpLc8Wqg=;
	b=OMBp7D4Q1taCLAC26KHZDvW1MnN8LDDXjmMIinVqeHcS40c2e/r5bEtpEA1YOrQKsE8uJwyy+dzX1
	 4JKIKJwtxexTCDBai/T/gN1pQFF6GZA/r8/jGnp3ACvSRRpcV8FriJldv+JY/8nNw3PBeN3zBHgAQS
	 gqwLkZC+F6kFgl05fAfdYG8tRkpCGkZwSL5dkqVYiQSgQQ/aMCdQHrSn/VegiB4aoijKO5TFJ9bump
	 HWqdwba3Kn4ZlYTE9d0fRPV50RONoQmTzzLdRTRPjJ82VVzJsAfRc4taGrrIqPH/zeF2yTJogJvsBY
	 Akt7pBD48e76OSMuArRnMD0vHtnM3jw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=Oybl0kFzJk1OHKBfarCPAX+ldUYM8qIDtwFbpLc8Wqg=;
	b=1bH+enBd3Rzx4lTdU2Ew/3w4RNpW2B4i5DDhzGEZCxhwTP59EcA+tuKMI2XuhVP+RWekbgj/wgKSQ
	 SVYt0YTBw==
X-HalOne-ID: f2a3e065-8f36-11ed-9179-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id f2a3e065-8f36-11ed-9179-7703b0afff57;
	Sun, 08 Jan 2023 09:29:30 +0000 (UTC)
Date: Sun, 8 Jan 2023 10:29:29 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Robin van der Gracht <robin@protonic.nl>
Subject: Re: [PATCH 12/15] auxdisplay: ht16k33: Introduce
 backlight_get_brightness()
Message-ID: <Y7qM+ZlG5gQiOW4K@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-12-1bd9bafb351f@ravnborg.org>
 <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiq72mFMJuec+r=T6xYtLpuU+a1rOrAhrHiecy_1Jpj2m4J=g@mail.gmail.com>
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-staging@lists.linux.dev, Stephen Kitt <steve@sk2.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>, Daniel Thompson <daniel.thompson@linaro.org>, Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>, Geert Uytterhoeven <geert@linux-m68k.org>, Miguel Ojeda <ojeda@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Robin van der Gracht <robin@protonic.nl>, Nicolas Ferre <nicolas.ferre@microchip.com>, Jingoo Han <jingoohan1@gmail.com>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Robin.

On Sat, Jan 07, 2023 at 10:02:38PM +0100, Miguel Ojeda wrote:
> On Sat, Jan 7, 2023 at 7:26 PM Sam Ravnborg via B4 Submission Endpoint
> <devnull+sam.ravnborg.org@kernel.org> wrote:
> >
> > Introduce backlight_get_brightness() to simplify logic
> > and avoid direct access to backlight properties.
> 
> Note: Stephen sent this one too a while ago (with some more details in
> the commit message, which is always nice); and then he sent yesterday
> v2 [1] (to mention the functional change with `BL_CORE_SUSPENDED`
> [2]).
Thanks for the pointers. I will try to move forward with Stephen's
patches.
> 
> Anyway, if it goes via drm-misc, feel free to have my:
> 
>     Acked-by: Miguel Ojeda <ojeda@kernel.org>
> 
> Though it would be nice to have Robin test the change.

Robin - can I get your ack to apply Stephen's original v2 patch to
drm-misc?

	Sam

> 
> Thanks!
> 
> [1] https://lore.kernel.org/lkml/20230106143002.1434266-1-steve@sk2.org/
> [2] https://lore.kernel.org/lkml/CANiq72kRhmT37H1FAGYGny83ONYXeqJuO8ZPbym0ajQOWKY4Kw@mail.gmail.com/
> 
> Cheers,
> Miguel
