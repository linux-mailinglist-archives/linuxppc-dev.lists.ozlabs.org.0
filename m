Return-Path: <linuxppc-dev+bounces-1821-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F1199443B
	for <lists+linuxppc-dev@lfdr.de>; Tue,  8 Oct 2024 11:28:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XN9fp6b64z2y66;
	Tue,  8 Oct 2024 20:28:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.141
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728379682;
	cv=none; b=Sz12j5eRyX8EyVm+GaRzD1+2eIksmo9PtYKKLY9WI7PubJDJkPtz2XHVbILwhHL3qaRlsldscxadxyWtkE3k11o9srELhmxXQbOTsLZCVLLQQ1hp0UztPUUU+AzeR4yLBbGeFYU3GqFD1gha82j+fUVC+V9eKUYHUkQtZY8TSDfzKuhkO/tFtHXWmHZm/PimmLRAwMj2Wz0Hf8fferWOYkdlizxlj86Uo1HhpzeJrZoisHROk0s2Mi+VIjYxKjFU/QuuXOI8IxZrEdRqFR6fYcG99pQz+rzzgfYHvcOSKeOVHv/kXf1fH37YbKwPzHKKRi6wVwM348RW9Nd4l0rnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728379682; c=relaxed/relaxed;
	bh=vXVXlSmeQt3lDbjU6nzfzfDoQAW9RRomvBadp2xogcw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=XVXa7KTw/D3J1hs1VYsDif0z0KzhAArr5JpNEGXCyKzTb8m6J+P8ABfWu/HtgDhCEUu3uMymRvW3OKNOaAdQtVW6kXybyCAPOygzYh+ci0tqYySuU8K6xQJMgswf5cgHa/Swu56aEJK2OYehxQrDQ4jBKQfN3Q2eAhv0U5+VAaULRpVFDCOrz3FENzOPrUH4JMPRzytLlwBt9faYu9L6I9gE5P+FcaHA0hOwo3UlzBrpHta08fFeb7zpHWsVpXmLk+1A7WotModDyjHTv9tZKdIH8b6a6YaWm6/iPogSoYyGMxXj1lj2XkaQs1seYUt+vf48//PjIySjuhaQRGRj5w==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=bjNgc0cU; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=psOjcXwi; dkim-atps=neutral; spf=pass (client-ip=103.168.172.141; helo=flow-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=bjNgc0cU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=psOjcXwi;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.141; helo=flow-a6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a6-smtp.messagingengine.com (flow-a6-smtp.messagingengine.com [103.168.172.141])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XN9fk6cF6z2xy0
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  8 Oct 2024 20:27:57 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 51CC0200791;
	Tue,  8 Oct 2024 05:27:54 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Tue, 08 Oct 2024 05:27:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728379674;
	 x=1728386874; bh=vXVXlSmeQt3lDbjU6nzfzfDoQAW9RRomvBadp2xogcw=; b=
	bjNgc0cUBA4uZdH1q47ixH6gx6ApEG2i+6J6MPi8YvLMk08HDLdfZy8hT8Zg6yKe
	2NNW+K4vM+BLpVDgWKXQdLIKSYik0I3IB7tJont13em6PzKvSbkr1B06qXFqKd2M
	d0ejs6pFeYw/YXyhY+Lcf2huo4OyJRBX1xHiNcSNQmv5p+6ZX+wr7Pd1lBixTgNN
	hy3ySSe4YK4xve31mXcvCM9P9Iw3LCUZGsP9K1m9N7p5Xb7ubYL9XZcAEES2eqKH
	q4Bj/X1CPUurJVbo5pIPpwwN0hbRGOj6w0V/7h1MK76aEfaffRgEVf3txqnhVsaH
	NQLl8GS7yuUNX9Q5G2TmCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728379674; x=
	1728386874; bh=vXVXlSmeQt3lDbjU6nzfzfDoQAW9RRomvBadp2xogcw=; b=p
	sOjcXwit6BXpazNlyHcp7RQtet3ms/ShGIHVtIXjHH7z2u/WnegtOxGTuiQ548AQ
	+QeNCeOEnTuopzDdr6d1WJbi0tqer+OAMlHpYNMA4rKYXQSYp8xhdFdowZELsMYk
	mPiA+7k1yhl45NYwlOZiplxm5RqztnqU39N1c1aWbEv2VrChje997BHNId6Fidh8
	f/66rTIRr/Rf8m4bRDMcg+3Et00AosDHyah9nBj+ZrujjgTGAUXfWePzzlS94iIY
	R0idMtIh3pgHEw8KwMyxu5rrZ+cNSTvxzSNz15dfdF6tlWKdZbu29sjFAq+ca8xW
	Sb+T7NjbiudHSJhRasvgA==
X-ME-Sender: <xms:FvsEZxj4OSOJO5R_iNsz2YcNkoHn0yLCSkYK6NBW46UzHpbVeaOylw>
    <xme:FvsEZ2BOquKh3Ly6rs2-r88YflJwtYbElvZlqzUDwQxS0vX2aRowkRAfJok_DDP9J
    pVcVjM_bJaqf2Jtc-M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefuddgudeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedt
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegtrghtrghlihhnrdhmrghrihhnrg
    hssegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuhigrdhorhhg
    rdhukhdprhgtphhtthhopehmihhquhgvlhdrrhgrhihnrghlsegsohhothhlihhnrdgtoh
    hmpdhrtghpthhtoheprghnthhonhdrihhvrghnohhvsegtrghmsghrihgughgvghhrvgih
    shdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhroh
    huphdrvghupdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghp
    thhtohepmhgrthhtshhtkeeksehgmhgrihhlrdgtohhmpdhrtghpthhtohepnhhpihhggh
    hinhesghhmrghilhdrtghomhdprhgtphhtthhopeguvghllhgvrhesghhmgidruggv
X-ME-Proxy: <xmx:FvsEZxH3zfzkJa8RVVsQJZoKvnwBlHYLBK33c0RZVMnXZVlSu1AFqQ>
    <xmx:FvsEZ2TkOnb2xmY6R_aU2VmL8HDxOWOBk8tgzBsUripCRCPzrK9zmw>
    <xmx:FvsEZ-zauMDlD6bC6qkUsSUnHXG1P0xy_37njpHP8yhxpPZjQln2mQ>
    <xmx:FvsEZ87a2x1N0-w1vvIsh6Lf1hOcJGqvGuZ7q-fy_-iHchmecU6CvA>
    <xmx:GvsEZ3DPdeCYlhTq-fZUHLeUnTw2J7FWdf8IfVzPa0rAh4jeq3MQ4aNK>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id C545D2220071; Tue,  8 Oct 2024 05:27:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Tue, 08 Oct 2024 09:27:20 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Julian Vetter" <jvetter@kalrayinc.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, guoren <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "WANG Xuerui" <kernel@xen0n.name>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Manivannan Sadhasivam" <manivannan.sadhasivam@linaro.org>,
 "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Vignesh Raghavendra" <vigneshr@ti.com>,
 "Jaroslav Kysela" <perex@perex.cz>, "Takashi Iwai" <tiwai@suse.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
 linux-alpha@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org,
 Linux-Arch <linux-arch@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, mhi@lists.linux.dev,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-sound@vger.kernel.org, "Yann Sionneau" <ysionneau@kalrayinc.com>
Message-Id: <a9fa56b4-b00c-4941-8c8c-1d3b58b573e2@app.fastmail.com>
In-Reply-To: <20241008075023.3052370-2-jvetter@kalrayinc.com>
References: <20241008075023.3052370-1-jvetter@kalrayinc.com>
 <20241008075023.3052370-2-jvetter@kalrayinc.com>
Subject: Re: [PATCH v8 01/14] Consolidate IO memcpy/memset into iomap_copy.c
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Tue, Oct 8, 2024, at 07:50, Julian Vetter wrote:
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index 80de699bf6af..f14655ed4d9d 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -102,6 +102,12 @@ static inline void log_post_read_mmio(u64 val, u8 
> width, const volatile void __i
> 
>  #endif /* CONFIG_TRACE_MMIO_ACCESS */
> 
> +extern void memcpy_fromio(void *to, const volatile void __iomem *from,
> +			  size_t count);
> +extern void memcpy_toio(volatile void __iomem *to, const void *from,
> +			size_t count);
> +extern void memset_io(volatile void __iomem *dst, int c, size_t count);
> +

I think having this globally visible is the reason you are running
into the mismatched prototypes. The patches to change the architecture
specific implementations are all good, but I would instead add
#ifdef checks around the prototypes the same way you do for the
implementation, to make the series bisectible and shorter.

 include/asm-generic/io.h |  58 ++----------------
 lib/iomap_copy.c         | 127 +++++++++++++++++++++++++++++++++++++++

Along the same lines, I would change lib/Makefile to build
this file unconditionally even on architectures that don't
set CONFIG_HAS_IOMEM. Again, strengthening the driver dependencies
is good, but it feels like a distraction here when we just need the
common implementation to be available.

       Arnd

