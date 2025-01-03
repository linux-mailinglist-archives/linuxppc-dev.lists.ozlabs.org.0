Return-Path: <linuxppc-dev+bounces-4627-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D35A8A006FE
	for <lists+linuxppc-dev@lfdr.de>; Fri,  3 Jan 2025 10:32:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YPdf04CHPz30Q3;
	Fri,  3 Jan 2025 20:32:40 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a01:4f8:242:246e::2"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1735896760;
	cv=none; b=RHe50fdn4bAaPpRgPQAXCxhtOfjFCRt3jvXKKndSHPcGHuoEA92UceWw0FPRNJvfga0mpChs4+1z31WA+b+OdvQV9aE4DjMspWGF1HwgRecLf7D2TAmFVJbrCEm22WcV9UNy8bqLKYRghXAvdRQkL+BUu6B8GLUIThFlw7AR+PnPwdDeKkAJfl2klDwEf4e5mxdMetqnl59xb911TChulrMEwkDf9dHSAhyEIED7RWXr89641sq6ByplaTXk75IMly+tdNMR0PPGeTOpaWEoiyxsxbY7ZYJHaNa9Oy08g4x0bVqIuhvNWPM34SklvNC09KXb9bVUoRBJK22OEMsreQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1735896760; c=relaxed/relaxed;
	bh=ns/LDV0S2a9mmpzFjocIineirzbQRti0e980RrsKsG4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CY++/wZMEoeROP3B25ZScAJALxV6t1JsH1r7ddR9LbGBj44qGG/0hiQcigFv8LafMhpCw75/wpcLjJ4Sqhif5Pry+T7nM2igu0BfernwuavFg5jW0LL/24yXRVLJFvPlemaVL4fbxtIITBY8wptFOPKQW8YdCGpaTwng20ocP3KNaN4igCxpoYaPeD445K91osx421nW7mq4adaWI9BjhJq540sFbBdN6/sr+BAYVeHvNJ9nQeTOK37rw1BLiJi8/2iyxgh1YYZUHbeMUQb7/xG2FmSGredmhwmN053MhR5xQ4OUTrTC0b9QclvnidhXyj8K6h6tPN27kweI75VoQA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=DhcibKcu; dkim-atps=neutral; spf=pass (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org) smtp.mailfrom=sipsolutions.net
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=sipsolutions.net header.i=@sipsolutions.net header.a=rsa-sha256 header.s=mail header.b=DhcibKcu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=sipsolutions.net (client-ip=2a01:4f8:242:246e::2; helo=sipsolutions.net; envelope-from=johannes@sipsolutions.net; receiver=lists.ozlabs.org)
Received: from sipsolutions.net (s3.sipsolutions.net [IPv6:2a01:4f8:242:246e::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YPddz1Xydz30PH
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  3 Jan 2025 20:32:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=ns/LDV0S2a9mmpzFjocIineirzbQRti0e980RrsKsG4=;
	t=1735896759; x=1737106359; b=DhcibKcukHXgmZ2aSD8donl+WLnvSJJ0cTE+epiKGbEE/lE
	HW8ndiePnaCy19XryCo0S/qdSfp5xvYn55btjpSX4UUGZZByI40GyeAZr4akFz+ObNSZdRNuBueAD
	Fwt0Cb1Gb2zYI3ayLj38D+39WqdcHf+szGamjmdSJTKta31Rlk/pHd/PA4ToJPgXCHKfPwzQ5F0bf
	Gfjr2tTMXUduSv///8CiA3ePAVGPBPiZ8u+uZXlCiooKReLQyT9F1Cf0tkXi1ehLRjnbP3ixdepRC
	NDWWxeWJbzHUpV1xjf2tasc0SRPQHLfV/n/ZpUVvzWVUQX/jN2pUhO6mlsg8cMEQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tTe2O-00000002St6-2Pxg;
	Fri, 03 Jan 2025 10:32:12 +0100
Message-ID: <eaa12e5d58cb61b5a8acda7e889d4c4549bacc79.camel@sipsolutions.net>
Subject: Re: [PATCH] net: ethernet: toshiba: ps3_gelic_wireless: Remove
 driver using deprecated API wext
From: Johannes Berg <johannes@sipsolutions.net>
To: Geert Uytterhoeven <geert@linux-m68k.org>, David Woodhouse
	 <dwmw2@infradead.org>
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>, Andrew Lunn	
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet	 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni	 <pabeni@redhat.com>, Geoff Levand <geoff@infradead.org>, Simon
 Horman	 <horms@kernel.org>, Alexander Lobakin
 <aleksander.lobakin@intel.com>, 	netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,  Alexandre
 Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 Larry Finger <Larry.Finger@lwfinger.net>, Nicolas Ferre
 <nicolas.ferre@microchip.com>, Pavel Machek	 <pavel@ucw.cz>, Stanislaw
 Gruszka <stf_xl@wp.pl>, linuxppc-dev	 <linuxppc-dev@lists.ozlabs.org>,
 linux-staging@lists.linux.dev, 	linux-wireless@vger.kernel.org, Arnd
 Bergmann <arnd@arndb.de>, Stefan Lippers-Hollmann	 <s.l-h@gmx.de>,
 Christoph Hellwig <hch@lst.de>
Date: Fri, 03 Jan 2025 10:32:11 +0100
In-Reply-To: <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
References: <20241224080755.194508-1-philipp.g.hortmann@gmail.com>
	 <b811d4af6a634d61389dfefacd49853c0e77f1d7.camel@sipsolutions.net>
	 <39256db9-3d73-4e86-a49b-300dfd670212@gmail.com>
	 <CAMuHMdVGdpVqkdvoFxu84YgBh_0fsAKeBhWFEg+nDyGLwbruig@mail.gmail.com>
	 <11ae0b7362284d4828021068b05b38a280a9cee5.camel@infradead.org>
	 <CAMuHMdXPSK-6_bMoiJyAsV4nhfW7HytZpOpf7Odg-4YKYNZfEA@mail.gmail.com>
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

On Fri, 2025-01-03 at 10:25 +0100, Geert Uytterhoeven wrote:
>=20
> I was also considering it from the side of the wireless access point:
> if you have to provide an non-secure access point just for your PS3,

It supports WPA2/PSK (~2004) which is plenty secure. It's not "non-
secure", it's just "not secure per WPA3 (2018) standard". Many other
drivers in tree don't support WPA3 for one reason or the other (mostly
lack of management frame protection support.)

johannes

