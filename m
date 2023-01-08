Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25542661948
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Jan 2023 21:26:29 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NqpWQ73Jsz3c73
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Jan 2023 07:26:26 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=a3Tr/5TH;
	dkim=fail reason="signature verification failed" header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=kycKAXjH;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=ravnborg.org (client-ip=2a02:2350:5:404::1; helo=mailrelay5-1.pub.mailoutpod2-cph3.one.com; envelope-from=sam@ravnborg.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ravnborg.org header.i=@ravnborg.org header.a=rsa-sha256 header.s=rsa2 header.b=a3Tr/5TH;
	dkim=pass header.d=ravnborg.org header.i=@ravnborg.org header.a=ed25519-sha256 header.s=ed2 header.b=kycKAXjH;
	dkim-atps=neutral
Received: from mailrelay5-1.pub.mailoutpod2-cph3.one.com (mailrelay5-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:404::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NqpVR5C86z3bPL
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  9 Jan 2023 07:25:32 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=9OaC5fUVjOcmXpBQANWBWYj1FAjD2dw4nLoh5knK1rQ=;
	b=a3Tr/5THw9+sAm+Z+Gy/e4LPnpKQjtoLtN8tz6vefonrvI2Pg0DkrGp7CRZv9nUmr2A1eqptG9QOW
	 1f/HZoXSd3iAonj5rqD6hm8MfIqs+HGA74YZTEWBqQ8zPgFaXkRXZXdnxCyMaH5GiAqtxqK9Df6AX9
	 3m+LbJKf5IvUctgd9+rBTMF5HCdyq41ptarJEFEIxZnSoPgNbm9JF71Uqwz6qa4eukWv6jkTxzMAYs
	 0ekB9siEZdEjgGlQRCnZjJI9Gm+DPZrbVZFfhiiBbLrw2rGTdikvsqCerKtoliTSrMwPUfeZ8oSV+u
	 SlL0aFFxR/YyVglkXoExkwRnS6zazdA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed2;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=9OaC5fUVjOcmXpBQANWBWYj1FAjD2dw4nLoh5knK1rQ=;
	b=kycKAXjH4J9Dm+t0vV22ddvwFXvBpt2IbPP9ed4AbUh/FX4raML677FAsMHuNHPU0gcasnEY0VNwR
	 z0AhnIABQ==
X-HalOne-ID: 6e82c542-8f92-11ed-a2f5-7703b0afff57
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay5 (Halon) with ESMTPSA
	id 6e82c542-8f92-11ed-a2f5-7703b0afff57;
	Sun, 08 Jan 2023 20:24:21 +0000 (UTC)
Date: Sun, 8 Jan 2023 21:24:20 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH 01/15] video: fbdev: atmel_lcdfb: Rework backlight
 handling
Message-ID: <Y7smdFs2xgJwwVQO@ravnborg.org>
References: <20230107-sam-video-backlight-drop-fb_blank-v1-0-1bd9bafb351f@ravnborg.org>
 <20230107-sam-video-backlight-drop-fb_blank-v1-1-1bd9bafb351f@ravnborg.org>
 <553AE999-CAF1-4E59-9F3F-68591ED192DE@sk2.org>
 <Y7nb2q6SDota/rTU@ravnborg.org>
 <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <366FC0B8-21E2-4642-A5A5-CF4B6AB046B0@sk2.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Lee Jones <lee@kernel.org>, Antonino Daplas <adaplas@gmail.com>, linux-omap@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Helge Deller <deller@gmx.de>, linux-staging@lists.linux.dev, linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Paul Mackerras <paulus@samba.org>, Robin van der Gracht <robin@protonic.nl>, Miguel Ojeda <ojeda@kernel.org>, Sam Ravnborg via B4 Submission Endpoint <devnull+sam.ravnborg.org@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Claudiu Beznea <claudiu.beznea@microchip.com>, linux-arm-kernel@lists.infradead.org, Nicolas Ferre <nicolas.ferre@microchip.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Stephen.

 
> Here are my pending patches from last June on lore:
> 

All patches are handled I think except this:
> * https://lore.kernel.org/lkml/20220608205623.2106113-1-steve@sk2.org/

Can I ask you to drop the assignment that is not needed, and resend with
the collected acks/r-b.

With this, then all fbdev patches are handled.

	Sam
