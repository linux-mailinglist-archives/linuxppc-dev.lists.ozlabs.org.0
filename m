Return-Path: <linuxppc-dev+bounces-4690-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAB9A02036
	for <lists+linuxppc-dev@lfdr.de>; Mon,  6 Jan 2025 09:07:00 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YRRbj33fWz304x;
	Mon,  6 Jan 2025 19:06:57 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736150817;
	cv=none; b=Uups1LZUKbTAcGDc+8WYRIULS+Z+Q4plndvFvUuFzR8ThgXK5Pj5Fix2ybCwBtZCfzu/T0rM14etvIyVGeOmzZsusrf48wzqT7WlL3s2qsW8uBlAx0Yg6Uax91l08mtSXaE4oCpLyyI+rNHIYKjeH/CZhsM69XKNeW8/YM/v0DuG8n8nxEigGGAfxkLZmuoOhzUd9VgtnvYaXRTGVX2Itq3wx5Q9mJe+TtQr9CZvd6HRxpf+z94ogaeSgzFXhaMKo7othhJAS0tdVXL4b5vPfvHw8LiZfVadEyuw2b0h2OWtUqT6VIQiZSSuG1zTAK0jqtS91ANWOJjN92UUMntP0g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736150817; c=relaxed/relaxed;
	bh=UOjMZRVKEF8pAw+QVhlAmTbkMlSLTFrv44rO0QDuaHI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Pn5xFZTw7P0QfA7pslkem+CnhVESt1wAvVseOi36KHlcCNPlItzeos6umGeVkuWm14bR5z8MaRa64g+r0/2iS2ZXYfWI+i1OCKQxv8Kig3hjbVoyA6oRh6f3CgImlkaEuuS384kRWAlzOEpBKzgtqjQp93RhXmpnD0C4kNxh/z8x/f/tdZZlTLcIcigJbDwf5IZ7pgDpQaYg829mSIJrssvKINnrnZJG7ElJ9rjqGf7RnOx9+DjDTti924CzU5wtzvExLq2pIMYjdaEfwUhy3nDEX9d0/I03AwfCp2lHBUMCUp0cOVDY/r8eSb2tQ+igcjVhAonsEtyU7EBhzLprHA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=UIVRguAU; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=UIVRguAU;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YRRbg5qyfz2ywy
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  6 Jan 2025 19:06:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=UOjMZRVKEF8pAw+QVhlAmTbkMlSLTFrv44rO0QDuaHI=;
	t=1736150815; x=1737360415; b=UIVRguAUFTgDu1moEt5UAwHt16fWtktTyYMxwEMq3FEb57d
	c5LSStPmGyiGxw4XrsxKXXitd8nJHTlqhbSlEbj30S2rUHqsZCGGxpfzGO5+lIKTFeQkl1sMQ8+hi
	OP8jq6cFswllBjJ4U8yIX9suS3MAJHGMO6zdG6Y4ln0Jfw1CHcNXMgeTTU3OciRDak6HOJt9wrl3e
	8W9R6gRa+0QOYNWBmTUmZqKYr3wel5fxOxMC5EamFa6MkPryGOzdt+tmj4WAdFf/zLrGv1pCP9pnC
	Hw6PxxzG5vvLPl87ylN9DpQwxx65hzygVeAR+RnkZFksdd1CS3oWmwxzKa6JVCIA==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tUi7e-00000005muW-0BHU;
	Mon, 06 Jan 2025 09:06:02 +0100
Message-ID: <edc31a6341e810e23c342f1e90776a3e764c4924.camel@sipsolutions.net>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove
 driver using deprecated API wext
From: Johannes Berg <johannes@sipsolutions.net>
To: Arnd Bergmann <arnd@arndb.de>, Philipp Hortmann	
 <philipp.g.hortmann@gmail.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David
 S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Geoff
 Levand <geoff@infradead.org>, Simon Horman <horms@kernel.org>,  Alexander
 Lobakin <aleksander.lobakin@intel.com>, Netdev <netdev@vger.kernel.org>,
 linux-kernel@vger.kernel.org
Cc: Kalle Valo <kvalo@kernel.org>, Alexandre Belloni	
 <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>,
  Geert Uytterhoeven <geert@linux-m68k.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Jeff Johnson	 <quic_jjohnson@quicinc.com>,
 Larry Finger <Larry.Finger@lwfinger.net>,  Nicolas Ferre
 <nicolas.ferre@microchip.com>, Pavel Machek <pavel@ucw.cz>, Stanislaw
 Gruszka <stf_xl@wp.pl>,  Gregory Greenman <gregory.greenman@intel.com>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
	linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Stefan
 Lippers-Hollmann	 <s.l-h@gmx.de>
Date: Mon, 06 Jan 2025 09:06:00 +0100
In-Reply-To: <cecd584c-46c0-4c0b-b3fb-b5cee4bbfd12@app.fastmail.com>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
	 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
	 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
	 <8414fd0c552de87b3471468665f7fc540b9bfa69.camel@sipsolutions.net>
	 <cecd584c-46c0-4c0b-b3fb-b5cee4bbfd12@app.fastmail.com>
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

On Sat, 2025-01-04 at 05:15 +0100, Arnd Bergmann wrote:
>=20
> I would assume that once removing CFG80211_WEXT becomes an option, we
> can just put the remaining parts of net/wireless/wext-*.c into both
> ps3_gelic and ipw2x00, duplicating and then simplifying the
> implementation. As far as I can tell, there is very little that is
> actually shared between the two anyway.

Indeed.

Note that net/wireless/wext-{core,proc,priv}.c are not even related to
CFG80211_WEXT (wext-{compat,sme}.c are), and just form the core wext
code that can be treated completely orthogonal and independent of
cfg80211. This driver doesn't even use CFG80211_WEXT code at all.

johannes

