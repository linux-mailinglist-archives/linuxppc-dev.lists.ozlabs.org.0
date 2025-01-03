Return-Path: <linuxppc-dev+bounces-4635-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F3CA0096E
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 13:44:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPjvH64bNz30Tw;
	Fri,  3 Jan 2025 23:44:27 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735908267;
	cv=none; b=XDU6lYWN7hK9czRgDwnlbLolh4rI70qgPjWtdZWxtOSzifmVpAET5ahkdpNEdbcIAupj78pdxbNJ8EYenqRL+sxhcAQKryFyBegx6WLdqMppULzSpDhQjX0LvSisN6IQ4wISlYMKfXhyKNb4yZlQcsaqYtevGTE1HZIi1vHCSuZbEWvSQNDr5Qj1ToT4EYRcneIqSVQ4YB5V59WpzI5gHO+5qDS8N2F9ftRQEQLuA9C0zaKiuXdmqVNORRPj/kju1WHP4OX9pPbEVRQS/ILIYwqlDv6eSElrk9ZvpFSTr6pIxLcXlG6UepyJ0CsUiIBWKf8Y2OSu1+ptPDoPKnHEPg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735908267; c=relaxed/relaxed;
	bh=sFSHBiXr+7Q7NZLBB84wQqXg2IVnkZZZFm8HrX7/q20=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NI4kNOhkZc3bC6gH8rADU5qioL2FvIVw8OiLKtGN2Pe6wk90uzCxjoh7z3TZExzUcJhDJo9+1JvHDp2wy9aGLfoi5x7owFAVI+WNcfGTGMFrbp4luOTf54XA47Nk3Cnr0vK3ZW7uJB1r8kCQdjO1luWalIg8EDmwqZwYlF2SVZISi/VoaatpFfl486P8aUJObpkbwn0NdiCg9j02MmhY3ghRZSKAhSwIp63bdbRG6ZZfWNMwSudb39/yo/iLoz8Eyn+n4ea4uWB75sKSmersB6e9qE6TLlfTB6OGJDfvA9dOFFQ6NPnXBe5IDjX9d60do8Fvn4keEOmKjy43t9r21A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Amk3ElBJ; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=Amk3ElBJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPjvG2nv9z30Tk
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 23:44:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=sFSHBiXr+7Q7NZLBB84wQqXg2IVnkZZZFm8HrX7/q20=;
	t=1735908266; x=1737117866; b=Amk3ElBJi0EBn4tkqgj2uOT/OKioXsWlkTCgkq5gNLy4sfe
	pjVNM+FIUGlPAqv2T51zJ/0WUsnqSYVQDco7sMYQYj0kGgTtqad8X8xA9oa5qjNGcp3kr5O6SKPcm
	QufzOMfzaVlS5Yk3qfMQe/fDVYdzXWyedMlXKm2TYR6c0jvJA2JyPntQfdg8y1qSRcNZkTTU+nMmG
	T9zrZJZux11cXI7RlZRPI9fbgr+XjsZOINS8gcJ76+cJfuMv3VPfyyEKaTnqVL9GvcS7Y0vOTWnr6
	yJo8tmTcyKuQQLidHCp0sQfcghD+oN/TEiNDLyWvmM2sAAqrwR4+SLTS2qGxpkWQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tTh29-00000002YNn-36Sj;
	Fri, 03 Jan 2025 13:44:09 +0100
Message-ID: <8414fd0c552de87b3471468665f7fc540b9bfa69.camel@sipsolutions.net>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove
 driver using deprecated API wext
From: Johannes Berg <johannes@sipsolutions.net>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, Simon
 Horman	 <horms@kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jeff Johnson	 <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>, Stanislaw
 Gruszka <stf_xl@wp.pl>,  Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Arnd
 Bergmann	 <arnd@arndb.de>, Stefan Lippers-Hollmann <s.l-h@gmx.de>
Date: Fri, 03 Jan 2025 13:44:08 +0100
In-Reply-To: <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
	 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
	 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.54.2 (3.54.2-1.fc41) 
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, 2025-01-03 at 07:44 +0100, Philipp Hortmann wrote:
>=20
> One of my big fears is the hand over to the next generation maintainers=
=20
> and developers. The less code and the less exceptions due to old=20
> interfaces the easier it will be. We loose maintainers and developers=20
> for many reasons, like: retirement, burnout, embargos or simply because=
=20
> they are not paid and need to earn money. After giving some support on=
=20
> the staging subsystem I cannot see at all that we can attract so many=20
> talented people as required for a save future beyond 7 years...

I wouldn't say that's necessarily a wrong sentiment, but I feel future
maintainers can also make that decision, and if it's "years" in the
future the relevance will only go down anyway.

We just started putting some pressure into the system for removal of
wext and nl80211 support (with WiFi7 devices no longer supporting wext)
so chances are at least here the situation will change, and anyway wext
stuff will become less relevant, perhaps to the point that other tools
will drop support for it anyway. Not wpa_supplicant though, I suppose :)

> People who evolved with the kernel development do not have a good sense=
=20
> how difficult it can be to join nowadays.
>=20
> A friend just bought two servers. One with a paid OS and one planned=20
> with Linux as OS. The difference was over 12000 =E2=82=AC due to licenses=
. What=20
> would be the price when we do not have a choice? Do not feel save=20
> because of today. We need to fight for tomorrow.

Not sure I see how that's related. This stuff really isn't in the way
now. If it were, I might have killed it already like the staging
driver(s).

> Where do you want to invest your time? Into the new technologies to keep=
=20
> up at the front edge or to keep old stuff running that is not productive=
=20
> anymore. But there might be someone who can pull the hardware once every=
=20
> two month out of the shelf and ask why this is not working. Should this=
=20
> really stop us from progress?

Again, I don't see the correlation, much less causation. Keeping the
wext stuff working for now is a promise for stable APIs for existing
things anyway. IMHO progress isn't achieved by removing old things
gratuitously but by offering better ways and moving things over. Which
_is_ happening, just that this particular driver is a hold-out because
progress happened in a direction that didn't add support for it.

> Partial, for me more important was the try to remove all wext drivers in=
=20
> October 2023 by Arnd Bergmann.
> [PATCH] [RFC] wireless: move obsolete drivers to staging
> https://lore.kernel.org/linux-staging/20231010155444.858483-1-arnd@kernel=
.org/

I don't think this was really all that much about "remove wext" rather
than "remove obsolete stuff".

> I was not able to use the WLAN on T2 Linux. I just tested the Ethernet=
=20
> connection as I know that the developer of T2 is using it. The reason=20
> why I bought the PS3 is to see if Linux on it is really a use case. But=
=20
> all I found is that it is only a test vehicle to say T2 is working on=20
> Power PC architecture.

Power is vastly more than PS3, the SPU/cell architecture was more the
interesting part of PS3 rather than anything else.

> At the time the PS3 WLAN driver was added to the mainline kernel it was=
=20
> really cool stuff. But nowadays it is just a high Power consuming device=
=20
> with a noisy fan and not enough RAM to do anything (256MB). The=20
> powerfull GPU is not supported by the kernel.
>=20
> Do I need to find out why the WLAN is not working under T2 on PS3 to=20
> convince you? The WLAN is working under redribbon Linux with Kernel 3.5=
=20
> on the PS3.

That's a whole different argument, so you're saying it wasn't working
_anyway_? Your whole original patch/argument seemed to be centered
around a whole lot of other things, but if it's not working anyway and=20

> T2 is working but to make this happen the T2 Author has an own repo for=
=20
> patches to apply. In the following video he publishes his view on how=20
> well the ps3disk is maintained and tested by the linux kernel community.=
=20
> My impression of this is that ps3disk is not tested on hardware at all.
> You can find this in a youtube video: =E2=80=9CI can't believe VIP Linux =
kernel=20
> developer BROKE PS3 support=E2=80=9D but watch out that you are in a good=
 mood=20
> otherwise it is pulling you down like me...

That's on him, things get broken all the time. I guess rants sell better
*shrug*.

> The following points are also in the list of reasons:
> - This driver has a maximum 54MBit/s as it supports only 802.11 b/g.
> - Using this hardware is security wise not state of the art as WPA3 is
>    not supported.

Neither of those is really all that relevant, there are plenty other
11g-only drivers and/or without WPA3, and WPA3 anyway isn't all that
critical. Crypto in WPA2 isn't broken (in fact it's mostly the same as
WPA3), it's just (slightly) less susceptible to DOS attacks due to MFP.


Anyway ... if it's broken it _would_ be nice to know why, just to know
how long ago that was I guess, but we can also remove it with that
argument. I just think that's a completely different argument ("it's
broken and nobody cared in a few years") than what your patch now
implies ("it's working but too old".)

johannes

