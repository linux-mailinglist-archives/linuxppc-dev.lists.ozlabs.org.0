Return-Path: <linuxppc-dev+bounces-4655-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B4535A0123A
	for <lists+linuxppc-dev@lfdr.de>; Sat,  4 Jan 2025 05:16:15 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YQ6ZN3QYGz2yjR;
	Sat,  4 Jan 2025 15:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.142
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735964172;
	cv=none; b=bWml0/hyvZKqh0UV8JdRPmF8AZj8LHHlSSU1Mv5kdatN8xVLPQ+eNk8zwj85k7h8pCeb5IN7qUpOMs+npVwubqkJYO44uYiaTZW6Qo405s/TCuac8tJOtIvz99smoHFOknL6APJMQebqctEVxIdhRDQ8Cq/bMRo+q3jxMqsDe4ncE3ploMxE5D3FmC2UFNSTk9ynZCebnqmR3MwDympnpBhlj5RE8OjpID1d7xPtK1CnCUJYP0aBZjco7tjXW/UBRNI6MzXmtpCxM6bihMugW4ypgegC0hbdDQhiq6gItAEhiIfavUR8tc9KZzDZBlFFiEZxvdDyMOcx7zke9eEkuA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735964172; c=relaxed/relaxed;
	bh=DIwzYoQakaoN0iG+JoxRQfAa6GbWsfiZ3NXHQ7aMpA0=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=hrY/NT/fS3Xuh7RyD4xedWi3syFSRCeHYaOqLgvXTsDeU9A+SwVLixepaCWClzoDODc5gpVTuAztvV5hBJMQHDHIjLSFucW3iF0NirUesD/z6KFWtxVGzl+BvRgKetQ4PE2jpOMbGBTOISefbbpeLEg4dFSK6Gvvj7y73e/fjbUz0aQ0pk6f9faPLOUbS/gTPvskuYQbSQ8YzyBtSdKYwfmb8taRY5iKZTAWHtQxwkG5oDOI+/pM0GLekIXRWXhvyKdWyHOuvOIJf9etwOm4Aavx1/4hYUbIrise77z5MMrtoKqh6JAocsOUmwjACXgMzhAIH0MUyxOTcgTDwGnz5Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=GMEMyQYA; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=E7DvbuOG; dkim-atps=neutral; spf=pass (client-ip=103.168.172.142; helo=flow-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=GMEMyQYA;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=E7DvbuOG;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.142; helo=flow-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a7-smtp.messagingengine.com (flow-a7-smtp.messagingengine.com [103.168.172.142])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YQ6ZG3dxjz2ygY
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  4 Jan 2025 15:16:05 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id AC616200B16;
	Fri,  3 Jan 2025 23:16:00 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Fri, 03 Jan 2025 23:16:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1735964160;
	 x=1735971360; bh=DIwzYoQakaoN0iG+JoxRQfAa6GbWsfiZ3NXHQ7aMpA0=; b=
	GMEMyQYAFSaSUwWygS2vECgDVuP7zSrNouAJs3qm8a0NFQuITjSdl+z2twIBgx/Z
	FUdFOlQI+GemGfdQRRKF6Ef3VAjXDmy0OODq0hEQOgGMDG7kDHyz9rwtGERbZfxl
	waIO0DQabDFsiJqBSIqtrF+HA0bgp8vYHCHKGKc+Fis3GVPbMPtpKm2mYNdlM6M5
	90IPJOsZgmWhw1nCD/8ofZAp0I0Mc88NDljDvpNkn90YJZCsJIOPJ28MeuUBvC8d
	omo8Bs8YiEO/y0pIQrrYkHB4x8bkAONZ0ldxv1rEpneDkS8B4TLuwRqvqCAp6FkM
	yIKOTax/ppHaoAyhnbyVfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1735964160; x=
	1735971360; bh=DIwzYoQakaoN0iG+JoxRQfAa6GbWsfiZ3NXHQ7aMpA0=; b=E
	7DvbuOGySklujsR/gjBzIQphQOIqqnzbTzir/05VZONXaU7z0TgtWAXqAMuWiv+n
	GcDjbQlM4YODM2Sh1o9aKY2v00lzC3QfUftTRRvKg+5+9hFCFIWYoblo6k3Ex2kT
	Y3C8C8GRgvE0Hrqy9OJsEWuxGun4v/KXs5VG1vWK0Xsottr7rwH26IU2p4XGeeow
	xJ1FCyeiuZBmWLTtNH0wZ351H5FLHwrLk9veqUsj0DjV9j1B5HSm6zRgWGOPrhvi
	McxCuYgI2NgVFmAST5EJtC7dsmDoGpRQfeVAib4gmXsGwLHdJyRpAN4Ivxb8u2zd
	bKKOnYS9qD3eVguW0uI2A==
X-ME-Sender: <xms:_7V4Z45PUDOtgfZb6EVQs313heRmVpXrRhI8NbWpGCDS3UhyMeZK4g>
    <xme:_7V4Z56PicMtWYAzT-PnZGddshlIDVLH5ooSJ377wGdn1UyzwoiHfFF0JeG-Z1dAY
    wfXoDlLxe_52DyASiM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudefhedgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepvdej
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghllh
    honhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhl
    ohhfthdrnhgvthdprhgtphhtthhopehphhhilhhiphhprdhgrdhhohhrthhmrghnnhesgh
    hmrghilhdrtghomhdprhgtphhtthhopehsrdhlqdhhsehgmhigrdguvgdprhgtphhtthho
    pegvughumhgriigvthesghhoohhglhgvrdgtohhmpdhrtghpthhtohepghgvohhffhesih
    hnfhhrrgguvggrugdrohhrghdprhgtphhtthhopegrlhgvkhhsrghnuggvrhdrlhhosggr
    khhinhesihhnthgvlhdrtghomhdprhgtphhtthhopehgrhgvghhorhihrdhgrhgvvghnmh
    grnhesihhnthgvlhdrtghomhdprhgtphhtthhopehhohhrmhhssehkvghrnhgvlhdrohhr
    gh
X-ME-Proxy: <xmx:_7V4Z3dyojkJ9ODKVdYcVuqNfigKRzv8PnDKtuHQTCn-Ar7xXkF2aw>
    <xmx:_7V4Z9ISmXm-gEtKrCtUEbBJYl-V0GKc4EGVWjifIQQ8_GJ42zOkdQ>
    <xmx:_7V4Z8Jz8f6nkDCcC-179FaK57zPH3EK3fbOCRESQ2TJXuectB3oCg>
    <xmx:_7V4Z-wxje4mDrPVVyIRYkPsMfDddCpkSjBLlmspmhAwfkZcs9BKkw>
    <xmx:ALZ4Z5amlO25XqjN_HFsMeoazF3Sd-ZMtpY_PAJZUZKZF8zXVs8CU9m0>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EAAF32220072; Fri,  3 Jan 2025 23:15:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
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
Date: Sat, 04 Jan 2025 05:15:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Johannes Berg" <johannes@sipsolutions.net>,
 "Philipp Hortmann" <philipp.g.hortmann@gmail.com>,
 "Andrew Lunn" <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>,
 "Eric Dumazet" <edumazet@google.com>, "Jakub Kicinski" <kuba@kernel.org>,
 "Paolo Abeni" <pabeni@redhat.com>, "Geoff Levand" <geoff@infradead.org>,
 "Simon Horman" <horms@kernel.org>,
 "Alexander Lobakin" <aleksander.lobakin@intel.com>,
 Netdev <netdev@vger.kernel.org>, linux-kernel@vger.kernel.org
Cc: "Kalle Valo" <kvalo@kernel.org>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Larry Finger" <Larry.Finger@lwfinger.net>,
 "Nicolas Ferre" <nicolas.ferre@microchip.com>, "Pavel Machek" <pavel@ucw.cz>,
 "Stanislaw Gruszka" <stf_xl@wp.pl>,
 "Gregory Greenman" <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, linux-staging@lists.linux.dev,
 linux-wireless@vger.kernel.org, "Stefan Lippers-Hollmann" <s.l-h@gmx.de>
Message-Id: <cecd584c-46c0-4c0b-b3fb-b5cee4bbfd12@app.fastmail.com>
In-Reply-To: 
 <8414fd0c552de87b3471468665f7fc540b9bfa69.camel@sipsolutions.net>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
 <8414fd0c552de87b3471468665f7fc540b9bfa69.camel@sipsolutions.net>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove driver using
 deprecated API wext
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Fri, Jan 3, 2025, at 13:44, Johannes Berg wrote:
> On Fri, 2025-01-03 at 07:44 +0100, Philipp Hortmann wrote:
>> 
>> One of my big fears is the hand over to the next generation maintainers 
>> and developers. The less code and the less exceptions due to old 
>> interfaces the easier it will be. We loose maintainers and developers 
>> for many reasons, like: retirement, burnout, embargos or simply because 
>> they are not paid and need to earn money. After giving some support on 
>> the staging subsystem I cannot see at all that we can attract so many 
>> talented people as required for a save future beyond 7 years...
>
> I wouldn't say that's necessarily a wrong sentiment, but I feel future
> maintainers can also make that decision, and if it's "years" in the
> future the relevance will only go down anyway.
>
> We just started putting some pressure into the system for removal of
> wext and nl80211 support (with WiFi7 devices no longer supporting wext)
> so chances are at least here the situation will change, and anyway wext
> stuff will become less relevant, perhaps to the point that other tools
> will drop support for it anyway. Not wpa_supplicant though, I suppose :)

I would assume that once removing CFG80211_WEXT becomes an option, we
can just put the remaining parts of net/wireless/wext-*.c into both
ps3_gelic and ipw2x00, duplicating and then simplifying the
implementation. As far as I can tell, there is very little that is
actually shared between the two anyway.

     Arnd

