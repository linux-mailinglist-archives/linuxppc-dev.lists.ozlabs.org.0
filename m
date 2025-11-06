Return-Path: <linuxppc-dev+bounces-13894-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E2CBC3CD92
	for <lists+linuxppc-dev@lfdr.de>; Thu, 06 Nov 2025 18:31:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d2TkV6VKZz30MY;
	Fri,  7 Nov 2025 04:31:14 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.147
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762450274;
	cv=none; b=Z7tKuM17z2ieYEDwXSMS4jGY9GIa5MiLm4WCKguFERElDlP2Ve6WflwKFOn+x6A3ReIyFm2FMgOzlmZ2sMm5G1tiR1s0NaajuzlBhii8KoVEE+9cHC8h5n0KgridbiFNjCsZIIpw4pgUCHLQI6EKE2mlqNbVgoitkauaMQ/OggyeeyeG3o705K1hhY5aQtIwMQnzu97Mo4lFNiRJJab/Q0ebg+Usi+MLI9p/NhprJ2GxZh91dU2OTC/miXBh8/ftcpnX3EIZ3CqxwKOv6meIK2XmifX7PqaBqL7AAfGMEw6alXKn2r0Wsjg161+a+fsba/ESATzCihk8Qe0vDszR9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762450274; c=relaxed/relaxed;
	bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dTUDlteQuJVpb+3mjI+EuHwzYkpw2wDOqxR7sv1ze58Nls4S2vm6JjYLIV8OTtHcQYH+coj41Ysl+CDC4FSIezLsZeNT9yrBdq5sfVgbsPsiylKDGEiYiyO/pjAxQG7i87nCbhx2BQwIx/BAdZAdx22DbluNHQVU5lkXuUMF22Hb1y0CcqerGEWDoP+p48/gcj9Koc3+12QmV0UdLKwkVnSEpwd79axm7DnSCwSf/m0r4zEUBxIPf2OPLBsCaMSMTx4rZXHGlYfi2vL8hrgRpwX/d8ch+iW6oN37Zt1dekLvMGyFD7g4mI9q91uk8lCUBNKKoNaJryXlU11yz93G7Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PtsuK0f3; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2I7NVcIl; dkim-atps=neutral; spf=pass (client-ip=103.168.172.147; helo=fout-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=PtsuK0f3;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=2I7NVcIl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.147; helo=fout-a4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 540 seconds by postgrey-1.37 at boromir; Fri, 07 Nov 2025 04:31:10 AEDT
Received: from fout-a4-smtp.messagingengine.com (fout-a4-smtp.messagingengine.com [103.168.172.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d2TkQ0XZXz300F
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  7 Nov 2025 04:31:10 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfout.phl.internal (Postfix) with ESMTP id 7131AEC025B;
	Thu,  6 Nov 2025 12:22:07 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 06 Nov 2025 12:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762449727;
	 x=1762536127; bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=; b=
	PtsuK0f319LO45lQah6VIlHKcBebKDpwzs+8+S63Ih2uA1rnN8V+VHZwIo2IR6gE
	UotFl2nTxcby+j5R8f+Vmuhxgv4Hm5O90ixA7ZgJVMPMdu/irmAXQa3pHZxYlZUc
	Y3f3UI4bGgKxUqnYTCJr8stJZjZ49rN3UUh+m/DZ2yRbXZ06n5E35cbZ7jN2ns4R
	YE4x8CAbK0h4ChU4SWLti5Pf+Q+ujzQi+QAQehiYOzJbLeI8TuzyVsoRzZGYGEV2
	A792tJTOa9P3sKs4bNkVl89ferrG8+rQk6iKTByyeeLSfS2GncgY4E+R048EQ6c8
	OuiDEnH515NYfsukF4a9Ig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762449727; x=
	1762536127; bh=TQ4GgdM8KMjiFNoveJBSCQRm3uDbF8oZgBhhE89LoX4=; b=2
	I7NVcIlWD2z3AfmYy/yeycsO4xGBqfCc1aJomcwzCoFur0AJ2uwG5Pxj9ZVMWP/P
	3fkJnC+MlLYdb1437+n4JwWje2YGCl5TBbkERKxQek8I3DXRTHm2Ov/xL3gU1AUH
	lP25GALiK/8YCJS8GJQMXZISwykI/bvZzMQbD6IqleeaQ1xHQk/pf4XLW8a89ZNv
	OX95Ffje2Bgdlk2/B9QwfyYmnNd/eTvKG06IuZyVGFox9K+C6ON4INyUtY+B4P7i
	/U1aaoL3jCfy65gUg/S0o/6AqzGuFurnw9i9bJjp27E1jQXjw2J61Znbq74l6Sdk
	spCFNTas3qBD8tC8Dw+Jw==
X-ME-Sender: <xms:PNkMaZMO1lPn7wub_x6RJYgXvPR-dmuVBOLe0MmQ3izKbD81hs6pnA>
    <xme:PNkMaWwaT8hRBGLxXu_WTAWlI-HdBAVJFL4oRJhvE5E1lv6zloisZkL9eWoT0SWaT
    IBdHg99pY-IDRQaDME0mJ54bwa48zwh-Mbn5smpD0W0gHaoCVNujIo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukeejfeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdejnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepkedvuefhiedtueeijeevtdeiieejfeelvefffeelkeeiteejffdvkefgteeuhffg
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgt
    phhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepthhssghoghgvnh
    gusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthhopegtrghtrghlihhnrdhm
    rghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvhhinhgtvghniihordhfrhgrsh
    gtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigsegrrhhmlhhinhhugidr
    ohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrh
    houhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhr
    tghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheprghnug
    hrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehnphhighhgihhnsehgmhgr
    ihhlrdgtohhm
X-ME-Proxy: <xmx:PNkMaVUYfrmc5te1EUxSvgQ8TRVDaDGzRierkf5jayA311IlXx5ADA>
    <xmx:PNkMabX_DlTmYrLzD_sdL2tXkJ4F4s076mdaMi8qr6vq8DbuWNylbw>
    <xmx:PNkMaYMfKmo2E2B0ITXYRv6LyemjW9LOLDP3wOmyt7voffmGNPYxVA>
    <xmx:PNkMafizk25mJNDFFaNeFGIdB428VC0-WvGeQMoXVrdUlnXuPgrPYA>
    <xmx:P9kMaUCgmYPQKJzxhj8GAva_-VVQifLJ9oCwH3jMqxAHtW82r16n0xOk>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 78838700054; Thu,  6 Nov 2025 12:22:04 -0500 (EST)
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
Precedence: list
MIME-Version: 1.0
X-ThreadId: AisJtzLZ_1Kg
Date: Thu, 06 Nov 2025 18:20:36 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Nick Alcock" <nick.alcock@oracle.com>,
 "John Stultz" <jstultz@google.com>, "Stephen Boyd" <sboyd@kernel.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 shuah <shuah@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Shannon Nelson" <sln@onemain.com>
Cc: linux-kernel@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 linux-mips@vger.kernel.org, linux-s390@vger.kernel.org,
 "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <95430a56-1ee4-46e2-814e-01a8cd074a48@app.fastmail.com>
In-Reply-To: 
 <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO library
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Nov 6, 2025, at 11:01, Thomas Wei=C3=9Fschuh wrote:
> The generic vDSO provides a lot common functionality shared between
> different architectures. SPARC is the last architecture not using it,
> preventing some necessary code cleanup.
>
> Make use of the generic infrastructure.
>
> Follow-up to and replacement for Arnd's SPARC vDSO removal patches:
> https://lore.kernel.org/lkml/20250707144726.4008707-1-arnd@kernel.org/
>
> SPARC64 can not map .bss into userspace, so the vDSO datapages are
> switched over to be allocated dynamically. This requires changes to the
> s390 and random subsystem vDSO initialization as preparation.
> The random subsystem changes in turn require some cleanup of the vDSO
> headers to not end up as ugly #ifdef mess.
>
> Tested on a Niagara T4 and QEMU.
>
> This has a semantic conflict with my series "vdso: Reject absolute
> relocations during build" [0]. The last patch of this series expects a=
ll
> users of the generic vDSO library to use the vdsocheck tool.
> This is not the case (yet) for SPARC64. I do have the patches for the
> integration, the specifics will depend on which series is applied firs=
t.
>
> Based on v6.18-rc1.

I had a look at this version and everything looks fine to me.

Acked-by: Bergmann <arnd@arndb.de>

I see that you have sent the series 'to' a lot of people, so
I'm not sure who you expect to merge it. I assume this will all
go through the tip/timers/vdso branch, unless you need me to
pick it up through the asm-generic tree instead.

     Arnd

