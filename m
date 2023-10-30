Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2117DB773
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 11:08:17 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RKBHp/8H;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B3MRq1ue;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4SJpqz32gNz3cTp
	for <lists+linuxppc-dev@lfdr.de>; Mon, 30 Oct 2023 21:08:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=RKBHp/8H;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=B3MRq1ue;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.18; helo=wnew4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from wnew4-smtp.messagingengine.com (wnew4-smtp.messagingengine.com [64.147.123.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4SJpq20D4Qz30Nr
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 30 Oct 2023 21:07:24 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.west.internal (Postfix) with ESMTP id 3E9DC2B00124;
	Mon, 30 Oct 2023 06:07:19 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Mon, 30 Oct 2023 06:07:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1698660438; x=1698667638; bh=C0
	spIghu26RS2wSePnhlO3VNbIZSADnovwnCABmc7C4=; b=RKBHp/8HXI5MdxTLUG
	sjTD10H5ter+kClY+aYdpwooyGy5f8IwRe3HkozWNFbKQ6hY0uC4rY/abuASM/Ts
	gbxcuEWLVJU0uf4lk6xr0VuixzVQHiexvztu4A/nIOEY7f4jWFJIWkxl31POeGkW
	+b4/QuqzYnQvJRXlfpfYfRvAte9fGj6yL5rLJnb1TY6Hk+j1Z60oCeb3eAAMmJCC
	RRGII1IK5P5SHtegyPe7hfhOsVmHQQPPVLkeTJ26zDJXakEJdWAei1+IL5dELo36
	BDIOG+oy4YmZoYViF/yWWBbcfz70oqDx7b2hgBh55rf5/zbusVe7BBo4vx5Cup8/
	GpAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1698660438; x=1698667638; bh=C0spIghu26RS2
	wSePnhlO3VNbIZSADnovwnCABmc7C4=; b=B3MRq1ue/dMlkLetdRiRUouN8zJPR
	L3B1Jb4D9iwtRemN46QOwk1kBy8Tpz6C3dJ2008xf578SsD/i4540hST/jBxDNBq
	waEkDOnmtLvV2RFDcL2g8xNC2tnVHMR18cltuM1DTDrCyo6hDDoZNx54N/fO8Eo3
	/imKNfNbQEFHzD6iZQ431tL7Xwa81EJdOdogA37vkQBUwmTnvFB4n3W/wVJfv90Y
	TEBXlxhlPDqJ3+Kz6myadXrYb3QOrEIy6XT+5kJrlP46M4kiyeCZDlZHihs2b5Ui
	772WvO6QsJ9ImSUKbcWcWu6tQrC/1xDDOAw7Sy0OZhCvd/22ACkgAoUOw==
X-ME-Sender: <xms:VYA_ZdLUSl_zQ27EJdpf---UOQdzZS7hrufqr4yiNwC0WPvANVGHyQ>
    <xme:VYA_ZZJln2PErRZpqhTdikK2ex6pB2UCBIVJWLotFavPrt3wcPJa24uR9PWWFZLpy
    vyW1i7p4ohWwK7AKG8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedruddttddguddtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:VYA_ZVvDF9ZPLgxZ4RQWSEeEbbISJbhSluKsCJVlXC36i5EI3QSj0Q>
    <xmx:VYA_ZeZbaci_WsO4NVcQR2LUZqoQMrCwbRHao8dkMSV7tGqCPle4Tg>
    <xmx:VYA_ZUaJuGU4ElrPPnwQfbIuiLPWd2QvhcqomOoIuTaaSGBTItwvkQ>
    <xmx:VoA_ZRR556ZzlQwwmRgvxHGug2eDFRSR_DbcAJMx9k6Z8L4HV2vi88gFrtc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id B405FB6008D; Mon, 30 Oct 2023 06:07:17 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-1048-g9229b632c5-fm-20231019.001-g9229b632
MIME-Version: 1.0
Message-Id: <052ea479-9965-45d0-b1a5-3e8079ffb0ab@app.fastmail.com>
In-Reply-To: <20231030071922.233080-1-glaubitz@physik.fu-berlin.de>
References: <20231023131953.2876682-1-arnd@kernel.org>
 <20231030071922.233080-1-glaubitz@physik.fu-berlin.de>
Date: Mon, 30 Oct 2023 11:06:55 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 00/10] Remove obsolete and orphaned wifi drivers
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
Cc: Stanislaw Gruszka <stf_xl@wp.pl>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linuxppc-dev@lists.ozlabs.org, Geoff Levand <geoff@infradead.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kalle Valo <kvalo@kernel.org>, linux-staging@lists.linux.dev, linux-wireless@vger.kernel.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-kernel@vger.kernel.org, Geert Uytterhoeven <geert@linux-m68k.org>, Pavel Machek <pavel@ucw.cz>, Gregory Greenman <gregory.greenman@intel.com>, Jakub Kicinski <kuba@kernel.org>, Johannes Berg <johannes@sipsolutions.net>, Jeff Johnson <quic_jjohnson@quicinc.com>, "David S . Miller" <davem@davemloft.net>, linux-arm-kernel@lists.infradead.org, Larry Finger <Larry.Finger@lwfinger.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Oct 30, 2023, at 08:19, John Paul Adrian Glaubitz wrote:
> Hi Arnd!
>
> There is some non-x86 hardware like the Amiga that still uses 
> PCMCIA-style networking
> cards on machines like the A600 and A1200. So, unless these drivers are 
> actually causing
> problems, I would rather not see them go yet.

Do you know of any systems other than the Amiga that are still
in use with new kernels and that rely on PCMCIA networking?

I know that Amiga has its own simple CONFIG_AMIGA_PCMCIA
implementation that is incompatible with CONFIG_PCMCIA device
drivers, so it is not affected by this.

For the few ARM systems that still support a CF card slot,
these tend to be used for IDE type storage cards because their
internal flash is too limited otherwise.

       Arnd
