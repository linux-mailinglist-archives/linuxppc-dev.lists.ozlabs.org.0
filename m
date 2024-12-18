Return-Path: <linuxppc-dev+bounces-4336-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A739F6B4D
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Dec 2024 17:36:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YCzpm0rS0z30V3;
	Thu, 19 Dec 2024 03:36:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.138
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1734539808;
	cv=none; b=hFIBzN25hnID7/IDGkfx8fb3hpdMzPuxYJoqBxQ5/PAAe99pBrI8wXWuEkuupihUiMgZsl43BeHe/AoX6n6Law1JWTPAznrXYHNXuSZ0dNlFvAbbS/bNEkTZ8dXgQ/9ncltPlME1AZZUgmdRELPgvDMNM5eKUO37mfXD41dauCZ9al0xZRp7c6Sxk6S3QIiyH/4/YK7zqnGQ0y3f/MeLfcgHc5vA3Ls19yg4cictSYKrzbsAizAwK17pWq3SRy6LF9fFyaUQPGghsR3eKeOe1lbvJ6PrKxOZ19LNyx2l6vRK5VwRqD2VAggiw9kKkMaDoU1BJhcRioqqLZTcr3oznw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1734539808; c=relaxed/relaxed;
	bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Dqh2sO+NdnIbURfc6X8rCgtKk5IRQiUcbVClKV/J7It3GGn1zoOeu4O05gxTdA1f4/KqV6CIVvjlEAjxWGM+uyd4ZWJZ5Ts4/Ha9BIvHKBA4rRzPhl8kdRcXhHWnGPWTL2xSjMjw1/yvJnZ7h1Ud94EzTyyJDucpcTnGRiIYHDTOsxNIlTwxzW9HGsk/VcPEe4U5OIpVHZN9rC9h0cw78xSD07xfjBtKhBnWB27N+wh1LpY2xu1lmBgom2D12nxmDJ8X+ZFAU6qqcjoGOdqjK3/NhwRg69veqqII73XQiPDObVJKJflsz/g2APw/h+m7MWpk91VbyLU0+o1XkIYFhw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ZBQAOqwW; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KqJZWQVI; dkim-atps=neutral; spf=pass (client-ip=202.12.124.138; helo=flow-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ZBQAOqwW;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=KqJZWQVI;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.138; helo=flow-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-b3-smtp.messagingengine.com (flow-b3-smtp.messagingengine.com [202.12.124.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YCzpf2VS2z30TJ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 19 Dec 2024 03:36:41 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.stl.internal (Postfix) with ESMTP id 604441D40442;
	Wed, 18 Dec 2024 11:36:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 18 Dec 2024 11:36:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1734539796;
	 x=1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=
	ZBQAOqwWg2K05L5uK2bYuwdACrxkLsoc2PIgD0cQgiEZ7YYzhpCxLlGgVZW3DVx6
	RnHtDGYZacvkFOApE5i8PpEKXJJGSLMPZi1/7zYeCxngLwFiuC9mIs0r1MfRf1d7
	ljvkEfr+wDzKKBBc+aurNSqkpq8ZRtQDdq0HUTxnfOR5XzEt97aJE7dwOdFVZ/hQ
	G7NwA6xY0dgZ+/xg4YILY7/7WbCEybiUYNzp0z8/igRlYf8NVwKiJsF4kOTG+iqu
	JyrXPLjrjW44Sllz4+cRSo0lIJniQhepEl9dIW9Ha7JzvHs7+IVaGL96wRRmTQVz
	/xIay+l60aHEAef4QHVc4w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1734539796; x=
	1734546996; bh=nfvIer0zFabb2CSH4FYG5+b3Q6Xz7yeeSWmQEgNJheM=; b=K
	qJZWQVI8dLKjsLZD5P9G0J1qUuKhEEsdqq+hKLVZma8PcO0rePXvzMeh3Gx+vBOD
	4nrPDtjhBHF33PiCb2oLKtLN8BuhIxgjeQHXotN9690yJVqb/PXCqLhFT2gY2knP
	SHOoAC5zDrv2o7AYcQSL9H9AgGMdlkVSHmV5ZjLFwBX52jgdNDzgyVppGNX1wod9
	7ttZ7ZLraiTYPJxQ1MR/SR1x3wO/EGPAqJ0WFhEdeVI7D2KnDKbbNvBechT+mDuz
	cpPDpxvu0YbekmHfrUlPuFeXsXgCSELupq6HK7beqkIp0QrURFeBQbSN0zMiN8me
	L7v+l+rQqTjKGKfPI+cXQ==
X-ME-Sender: <xms:EPpiZ2PhewnaDdeTezsY7UHZ-8MZHheQgg2o6m05zEshehzpenow1A>
    <xme:EPpiZ08FeD-PHv9DfxkMbyU44Z2agIt5ndVb5bJvAT7p7tClm27qKJ2TH4eLJ14WB
    FQJfPGZ_sMFiMW81M0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrleekgdeltdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdpuffr
    tefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnth
    hsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeen
    ucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdrug
    gvqeenucggtffrrghtthgvrhhnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeej
    vdefhedtgeegveehfeeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmh
    grihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeegiedp
    mhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtg
    hpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphht
    thhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtohepvh
    hinhgtvghniihordhfrhgrshgtihhnohesrghrmhdrtghomhdprhgtphhtthhopehlihhn
    uhigsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphh
    gvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehprghlmhgvrhesuggr
    sggsvghlthdrtghomhdprhgtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrd
    gvughupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghu
X-ME-Proxy: <xmx:EPpiZ9SUEzmB8m4BWTnSvNTtSXRoY8pckW1eK5W5rKnWC0lS5naOKQ>
    <xmx:EPpiZ2tCYDXsXEJFpJcBW2DlzBqmukOXYouat3DqxhmhFciRrpQLMQ>
    <xmx:EPpiZ-ctkHakbRRswX0-1x3fLnbcgCLh6ogHHQVM_Yz1HDnHdPdaLw>
    <xmx:EPpiZ62xeygOoJZVhzcxu1Lkfiip8AzfGhxGF4meBhl3PD_5MD0-1Q>
    <xmx:FPpiZ3eUuVl_kIXn3EabUXk14dEdg5IU1747WEAAdir6NevQA5VhmJtW>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5B4AC2220075; Wed, 18 Dec 2024 11:36:32 -0500 (EST)
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
Date: Wed, 18 Dec 2024 17:35:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
 "Conor Dooley" <conor@kernel.org>
Cc: "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Andy Lutomirski" <luto@kernel.org>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>,
 "Frederic Weisbecker" <frederic@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Theodore Ts'o" <tytso@mit.edu>,
 "Jason A . Donenfeld" <Jason@zx2c4.com>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Russell King" <linux@armlinux.org.uk>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Ingo Molnar" <mingo@redhat.com>, "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, linux-parisc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
 linux-s390@vger.kernel.org, linux-mips@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, Linux-Arch <linux-arch@vger.kernel.org>,
 "Nam Cao" <namcao@linutronix.de>
Message-Id: <137c0594-e178-4c91-bc8b-5f99b3ddb2f0@app.fastmail.com>
In-Reply-To: 
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
References: <20241216-vdso-store-rng-v1-0-f7aed1bdb3b2@linutronix.de>
 <20241216-vdso-store-rng-v1-7-f7aed1bdb3b2@linutronix.de>
 <20241218-action-matchbook-571b597b7f55@spud>
 <20241218162031-ee920684-db10-4f17-b1cb-50373d7ea954@linutronix.de>
Subject: Re: [PATCH 07/17] riscv: vdso: Switch to generic storage implementation
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Dec 18, 2024, at 16:46, Thomas Wei=C3=9Fschuh wrote:
> On Wed, Dec 18, 2024 at 03:08:28PM +0000, Conor Dooley wrote:
>> On Mon, Dec 16, 2024 at 03:10:03PM +0100, Thomas Wei=C3=9Fschuh wrote:

>> Might be a clang thing, allmodconfig with clang doesn't build either.
>
> The proposed generic storage infrastructure currently expects that all
> its users also use HAVE_GENERIC_VDSO.
> I missed rv32 when checking this assumption.
>
> I can add a bunch of ifdefs into the storage code to handle this.
>
> Or we re-add the time vDSO functions which were removed in commit
> d4c08b9776b3 ("riscv: Use latest system call ABI").
> Today there are upstream ports of musl and glibc which can use them.
> (currently musl even tries to use __vdso_clock_gettime() as 64-bit only
> on rv32 due to a copy-and-paste error from its rv64 code)

Adding back __vdso_clock_gettime() wouldn't work on rv32 because there
is no fallback syscall for it, and it wouldn't really help since
there is no existing userspace that uses time32 structures.

> There is precedence in providing 64bit only vDSO functions, for example
> __vdso_clock_gettime64() in arm.
> I do have a small, so far untested, proof-of-concept patch for it.
> This would even be less code than the ifdefs.
>
> What do you think about it?

Yes, simply exposing the normal time64 syscalls through vdso
should be fine. I think this currently works on everything except
rv32 and sparc32, probably because neither of them have actual
users that are able to test.

       Arnd

