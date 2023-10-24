Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC2D17D4C63
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 11:31:25 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dby9AI0p;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SF6JB5jgSz3cSS
	for <lists+linuxppc-dev@lfdr.de>; Tue, 24 Oct 2023 20:31:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Dby9AI0p;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=kvalo@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SF6HM1Zjtz2xqH
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Oct 2023 20:30:39 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D61BC62ADE;
	Tue, 24 Oct 2023 09:30:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EABCC433C8;
	Tue, 24 Oct 2023 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698139836;
	bh=CB0uZasGotH3WSQ2XD6CQGludeAGY3f8w17TrzekeQU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Dby9AI0p83lKR7U5CCjg2W7DpqRQqyb59zNfumlkY8ts8VHFwcff/XFzqbRKMY55Q
	 RPEGb17YmlSQo+XND8ZEqC7yXRo+6kDE9s3zllgDm+XX6xUwEB5Z4wXMl+4sx4O02e
	 HlDNnlnAG9UftAcKGoZHxSGp4zKOqPsYGiLTNoVQbiaXrsshmAYMv0FyYHYIOOaS0K
	 FNXQGox4XxUgAWUtTfAGwv5zHAnOri9VwXtnN3WXrk66gXQ6NM2RfYSYo+eyHFUIRd
	 CbCvNJqEy1WbUgxeM336II3ysCBIN6XpQjlNUkpd2/EQUjF31mxQmi6Kk7gjMRduMv
	 TE0I45NGqEfNA==
From: Kalle Valo <kvalo@kernel.org>
To: Stefan Lippers-Hollmann <s.l-h@gmx.de>
Subject: Re: [PATCH 10/10] [RFC] wifi: remove ipw2100/ipw2200 drivers
References: <20231023131953.2876682-1-arnd@kernel.org>
	<20231023131953.2876682-11-arnd@kernel.org>
	<20231024014302.0a0b79b0@mir>
Date: Tue, 24 Oct 2023 12:30:29 +0300
In-Reply-To: <20231024014302.0a0b79b0@mir> (Stefan Lippers-Hollmann's message
	of "Tue, 24 Oct 2023 01:43:02 +0200")
Message-ID: <875y2wz7t6.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Jeff Johnson <quic_jjohnson@quicinc.com>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Stanislaw Gruszka <stf_xl@wp.pl>, linux-staging@lists.linux.dev, Linux Wireless <ilw@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Jakub Kicinski <kuba@kernel.org>, Stanislav Yakovlev <stas.yakovlev@gmail.com>, Arnd Bergmann <arnd@arndb.de>, Nicolas Ferre <nicolas.ferre@microchip.com>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, "David
 S . Miller" <davem@davemloft.net>, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Stefan Lippers-Hollmann <s.l-h@gmx.de> writes:

> On 2023-10-23, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> These two drivers were used for the earliest "Centrino" branded Intel
>> laptops during the late 32-bit Pentium-M era, roughly 2003 to 2005, which
>> probably makes it the most modern platform that still uses the wireless
>> extension interface instead of cfg80211. Unlike the other drivers that
>> are suggested for removal, this one is still officially maintained.
>>
>> According to Johannes Berg, there was an effort to finish the move away
>> from wext in the past, but the last evidence of this that I could find
>> is from commit a3caa99e6c68f ("libipw: initiate cfg80211 API conversion
>> (v2)") in 2009.
>>
>> Link: https://lore.kernel.org/all/87fs2fgals.fsf@kernel.org/
>> Cc: Stanislav Yakovlev <stas.yakovlev@gmail.com>
>> Cc: Linux Wireless <ilw@linux.intel.com>
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> I'm not convinced this should be in the same set of drivers as the
>> rest, since this is clearly less obsolete than the other hardware
>> that I would remove support for.
>
> These have indeed been very common back in the day, I'm still using
> a 2003-vintage 1.5 GHz Pentium-M 'Banias' Acer Travelmate 292LMi
> notebook using ipw2200 (and have two spare ipw2200 mini-PCI cards).
> Works still fine using v6.5.8-rc1 and WPA2PSK/ CCMP (sadly it does
> not do WPA3) and I do use it semi-regularly (running the latest
> stable- or stable-rc kernel of the day).
>
> While it would be nice to replace it with an ath5k based card (to
> get WPA3 support), the card isn't that easy to reach in the notebook,
> so it would be sad to see this go.

Wow, I'm very surprised that ipw2200 still works after 20 years. Thanks
for the report, I think it's best that we still keep the ipw2x00 driver
in the kernel.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
