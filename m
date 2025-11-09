Return-Path: <linuxppc-dev+bounces-13977-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AAD67C44221
	for <lists+linuxppc-dev@lfdr.de>; Sun, 09 Nov 2025 17:16:14 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d4HwX1xZ2z300F;
	Mon, 10 Nov 2025 03:16:12 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.157
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762704972;
	cv=none; b=nX30Sx3yD45PGujzfFkBBETXF8E2PodNASLwdKUbgvN3Fm3IzVsdqMguuPjiZff4lfJ7cxhnKqKurHml6o5gafSbVkS+LjuoUDnKml10qFrkyXD3XfMDFqqSlWXCWXaaw0AQlhoNrj2SR4ZUSUF5yySRKU0qyEOA5D0dxXpaLBUscD9MLP+4YtfWwtIaNYBrtmocfIo26owz2cWmkmNL+ltl1Ns8XKahsVWCYgoXvJHYV605N/ZTXD/M4kg9g/haXFMCtnIbdfVNTgS+LONm3slCxJBEEnOKDfmtWgkToLZZB4C0zsde33sLfOluDZFIiE1SK+Na/yea7t5KXhdt6g==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762704972; c=relaxed/relaxed;
	bh=JEE330ySaodkvhl3xDjKL/tIDsvMEMAgBil3ykH1mCk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=V2PKAYd+EczUi1uvqfuL4VS1B7N2tPyd/mPDGllspnIwmp6Q0v1ZRRQt1+59FPF8R6NJkpLil7ealolkMXfN6IaL3MlX6pX+u8ZeQGXqd+ufJi8Bw3sliZhJ582s6Spo5sv2BOWbUc70/Acm/dNkrTPXPpFYzclpOq2tRDZeTVUiueacTg6fu2CzOfpOsLpG1TUnaFIgk6/NN3newVTgUUNud/2lLQdHW3fRJctYL+uF+Wwh/QNDs/xRT8dGJiJQtCtfiwGv+3nkAKzi4DV5WnKIPinLvS40g83wpkNf1qtcurYru5FZvgBuLRklE9radlV4Zf9WJt9Ml23b6cgSEw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=drlx4Ujx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tZpxlF53; dkim-atps=neutral; spf=pass (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=drlx4Ujx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=tZpxlF53;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.157; helo=fhigh-b6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 415 seconds by postgrey-1.37 at boromir; Mon, 10 Nov 2025 03:16:06 AEDT
Received: from fhigh-b6-smtp.messagingengine.com (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d4HwQ5DNzz2xlQ
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Nov 2025 03:16:06 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 0F2AE7A001C;
	Sun,  9 Nov 2025 11:09:05 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Sun, 09 Nov 2025 11:09:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1762704544;
	 x=1762790944; bh=JEE330ySaodkvhl3xDjKL/tIDsvMEMAgBil3ykH1mCk=; b=
	drlx4UjxHBc4BK+/NVJU89mFSbrfOcSM+lHamYWdL3egMM8mGQLm5jNme0hu1Rht
	17ASKVfJ7qjrdeREn5wXdwvevseHMNdIxD0PLDg/GrY1oY17B5NGgz3QCVs9Pnsz
	aahHFTPIvSg43oGQ2ldcMf2dKJQHda9YZyk4beeBQMqHa1wOoEsDdp8OH73q/niD
	tTNdsiAq8d93OLEXExNoNy/umBFvSyfKYpAnKgph7sAtxtYFuv86g7XcY8RAZQgp
	BmojD/4751TwCgFscyQZhmNeuhm+uTXFZqJY/dgVY/QfR0icOlnF2vwKeEC6o3TE
	46IziJYcsvKnY8cp5l5B1g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1762704544; x=
	1762790944; bh=JEE330ySaodkvhl3xDjKL/tIDsvMEMAgBil3ykH1mCk=; b=t
	ZpxlF53AtCgpy5zaK9XzTSw0xrnZE1DatfrBFVrRSWYxl4bTI1mCGnn4BeoQ6Vkr
	aSauWlGgVMFTjq2hv7v9iIaAQyMrEsAFY7HaXSKggaScjCukiDUkQWSf3tAAGtw2
	AmtNmi21+TxMlkCYr+9Y564q0KWWdQn4rlJ5/iE14Hs24g0LqxSziFK37Wtoxgd5
	NFycR8/vwa/SrwPiiOY2f6yL33vU9cT9pa5eaF0D3zAxC0gN2JGYElrjix4QM/Te
	we1M6Ll2YjybsX3J6FAVqONqELdi7WGpVpm69bFae9MG4L6YJgHEyUngPIOi1VEv
	ZUoV7zykJiqiClh9ZBgNg==
X-ME-Sender: <xms:m7wQactHBjhGmjaME3x7l_Ip111ypE856jTimBmaUzpicZxXSdM4Gg>
    <xme:m7wQaUTH35MNFb2EDVu2u28sHYMVINxJnL9VcKPxRLHkM-u6vBuuEhaURZtWqYabf
    fb5Jj6sU20jG9W9VKa9yd0plFCkDu5W1TfCGBQ6md7a_7udFru3QcI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleehkeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfeuvedugedugfeiffdvtdettdeifeevfffghfefvefhvdehlefhheehjedvfffg
    necuffhomhgrihhnpegsohhothhlihhnrdgtohhmnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghr
    tghpthhtohepfeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvg
    hnugesrghlphhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptggrthgrlhhinhdr
    mhgrrhhinhgrshesrghrmhdrtghomhdprhgtphhtthhopehvihhntggvnhiiohdrfhhrrg
    hstghinhhosegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhig
    rdhorhhgrdhukhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsgh
    hrohhuphdrvghupdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdp
    rhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrihgurdgruhdprhgtphhtthhopegrnh
    gurhgvrghssehgrghishhlvghrrdgtohhmpdhrtghpthhtohepnhhpihhgghhinhesghhm
    rghilhdrtghomh
X-ME-Proxy: <xmx:m7wQabmF_YIbNBgdxFoevoHFJQ1eWu4ZnJ4xjCJtw66W2L-ukr0JXw>
    <xmx:m7wQaRuILS_f_EquuhHZJAzhvti4hsBgThcJkmS8fwUn49V9jbw22Q>
    <xmx:m7wQaSfVAsPMMG454n8tzXbzRCt1S_kSbiI9XIhUfh8Gag9s5h-lcw>
    <xmx:m7wQaVahZheDTpO_ctNR7LNi3EgQoe8W4r0T2kpj8H5LbqG5RtGjRw>
    <xmx:oLwQaSCuGOvbyudIA1SYvS95j7wbQLvk3z0UJxxth9q7U_J_OZSGmf0i>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AB7B8700026; Sun,  9 Nov 2025 11:08:59 -0500 (EST)
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
Date: Sun, 09 Nov 2025 17:08:27 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "Andy Lutomirski" <luto@kernel.org>,
 =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
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
 "Shannon Nelson" <sln@onemain.com>,
 "Linux Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 sparclinux@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 loongarch@lists.linux.dev, linux-mips@vger.kernel.org,
 linux-s390@vger.kernel.org, "Arnd Bergmann" <arnd@kernel.org>
Message-Id: <7eb1a661-e5bf-45cb-a3cf-7337fb0c4173@app.fastmail.com>
In-Reply-To: <alpine.DEB.2.21.2511090221080.25436@angie.orcam.me.uk>
References: <20251106-vdso-sparc64-generic-2-v5-0-97ff2b6542f7@linutronix.de>
 <b870aa47-5ed4-4dcf-a407-eca83d1733d8@app.fastmail.com>
 <6452c785-872a-4fe7-90e1-8138d73c6218@app.fastmail.com>
 <alpine.DEB.2.21.2511090221080.25436@angie.orcam.me.uk>
Subject: Re: [PATCH v5 00/34] sparc64: vdso: Switch to the generic vDSO library
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Sun, Nov 9, 2025, at 04:23, Maciej W. Rozycki wrote:
> On Sat, 8 Nov 2025, Arnd Bergmann wrote:
>
>> On other architectures, I see that parisc (always aliasing) has stubbed
>> out the vdso functions, while mips/loongson has limited the page size
>> selection to never alias. A few other mips platforms can theoretically
>> enable both small pages and vdso, but my guess is that in practice
>> they don't use the vdso (mips32/ath79) or they use 16KB pages
>> (rm, dec, ip22) based on the defconfig settings.
>
>  Umm, I'd have to dive into the details (and I hardly have the resources 
> at hand), but quite a bunch of MIPS microarchitectures suffer from cache 
> aliases; some even have VIVT caches.

I was going with this list:

$ git grep define.cpu_has_dc_aliases arch/mips/
arch/mips/include/asm/cpu-features.h:#define cpu_has_dc_aliases (cpu_data[0].dcache.flags & MIPS_CACHE_ALIASES)
arch/mips/include/asm/mach-ath79/cpu-feature-overrides.h:#define cpu_has_dc_aliases     1
arch/mips/include/asm/mach-au1x00/cpu-feature-overrides.h:#define cpu_has_dc_aliases            0
arch/mips/include/asm/mach-bcm63xx/cpu-feature-overrides.h:#define cpu_has_dc_aliases           0
arch/mips/include/asm/mach-cavium-octeon/cpu-feature-overrides.h:#define cpu_has_dc_aliases     0
arch/mips/include/asm/mach-dec/cpu-feature-overrides.h:#define cpu_has_dc_aliases               0
arch/mips/include/asm/mach-dec/cpu-feature-overrides.h:#define cpu_has_dc_aliases               (PAGE_SIZE < 0x4000)
arch/mips/include/asm/mach-ingenic/cpu-feature-overrides.h:#define cpu_has_dc_aliases   0
arch/mips/include/asm/mach-ip22/cpu-feature-overrides.h:#define cpu_has_dc_aliases      (PAGE_SIZE < 0x4000)
arch/mips/include/asm/mach-ip27/cpu-feature-overrides.h:#define cpu_has_dc_aliases              0
arch/mips/include/asm/mach-ip28/cpu-feature-overrides.h:#define cpu_has_dc_aliases      0 /* see probe_pcache() */
arch/mips/include/asm/mach-ip30/cpu-feature-overrides.h:#define cpu_has_dc_aliases              0
arch/mips/include/asm/mach-loongson2ef/cpu-feature-overrides.h:#define cpu_has_dc_aliases       (PAGE_SIZE < 0x4000)
arch/mips/include/asm/mach-loongson64/cpu-feature-overrides.h:#define cpu_has_dc_aliases        (PAGE_SIZE < 0x4000)
arch/mips/include/asm/mach-malta/cpu-feature-overrides.h:/* #define cpu_has_dc_aliases  ? */
arch/mips/include/asm/mach-malta/cpu-feature-overrides.h:/* #define cpu_has_dc_aliases  ? */
arch/mips/include/asm/mach-ralink/mt7621/cpu-feature-overrides.h:#define cpu_has_dc_aliases     0
arch/mips/include/asm/mach-rm/cpu-feature-overrides.h:#define cpu_has_dc_aliases        (PAGE_SIZE < 0x4000)
arch/mips/include/asm/mach-sibyte/cpu-feature-overrides.h:#define cpu_has_dc_aliases    0

which for many platforms seems to come up with a compile-time
constant value. I hadn't checked the exact conditions for
the runtime MIPS_CACHE_ALIASES flag, but I see that the kernel
has a fairly centralized detection function in probe_pcache()
https://elixir.bootlin.com/linux/v6.17.7/source/arch/mips/mm/c-r4k.c#L1251

which is used for the 'generic' platform and those that don't set
a compile-time constant (ath25, bcm47xx, bmips, cobalt, ip32, malta,
pic32, rc32434 and tx49xx).

> (see the figures at the bottom; uptime quoted for an idea of the rate, 
> though the system hasn't been heavily loaded).  It is possible with the 
> aid of S$, which is inclusive and PIPT.

I now found commit 0f02cfbc3d9e ("MIPS: VDSO: Match data page
cache colouring when D$ aliases"), which probably does everything
necessary to just make it work reliably on mips, and should
be portable to sparc as Andy suggested as well.

     Arnd

