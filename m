Return-Path: <linuxppc-dev+bounces-1155-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DF1970A79
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Sep 2024 00:39:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4X24fD3vyfz2xfP;
	Mon,  9 Sep 2024 08:39:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.139
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1725795373;
	cv=none; b=nCsAuvkFyrl+dOAElX873gOqF2KWAKCloQ5JquwcWczD5lmSe470W+JefYW0hFDI97Kq2BJH3QcohZP3IW//e0r3X3F79QTr3PVylQmjVlyLaX9Tk5XlFMBSiDNfN8GH2h7yz2izCsgarRn1+sgpLxztM84WgJ6648TNR48cJUx4c318yoODa7BLBPcMi6Pm7W50nYWx6uDD1f8nVqiBZhBMtSrv+3zaU5r0vJpGwvGIohwVnT/xG8+zzex9dcBMgOLH4tYc1w72LgR0C+8oHeix4fq5EgvyLpRYT+aL4xFOUeJxvm3KsNetZhzfFTxxNA6Gr4Tbc7mgZy1DDd1+Fg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1725795373; c=relaxed/relaxed;
	bh=XEUlxjTawgkGJUbuV5995m7w7A2+JrHLDxzMf66rOFU=;
	h=DKIM-Signature:DKIM-Signature:MIME-Version:Date:From:To:Cc:
	 Message-Id:In-Reply-To:References:Subject:Content-Type; b=GEclWn2FEl432PScK6bsf6lKt/ths2/lOs0NmdOGzgycmHMn4aSbptBSbmTfZ/7L4UMw+1Ugq5uKuBmMHFArFn+Z30MKYPkWuLqsALuijZzqc4Rln5p+ApFP1cWltyHUhfr99Th804hTRnpWSKdOucsNi5eZkZlt3gF64sBwGwQzBznHu+GbmtGAg+7YqrKXuECEmwZl97jC1NooGBwj7aFahY08GyiFq4c7aCnrDLkpcPnt7MSl8yfIvq6UQ4+XYlhEoILvt8Ru4LHU9HTvCjFbGDUNQ+S4+aa9y5NFbIpQBDGrbGLURJkOwCzXxnYQrMHLtOso+7b1LW8pFkrF/A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=flygoat.com; dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=1RqsBYWn; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Cdsqc3O9; dkim-atps=neutral; spf=pass (client-ip=103.168.172.139; helo=flow4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=lists.ozlabs.org) smtp.mailfrom=flygoat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=flygoat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=flygoat.com header.i=@flygoat.com header.a=rsa-sha256 header.s=fm2 header.b=1RqsBYWn;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Cdsqc3O9;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=flygoat.com (client-ip=103.168.172.139; helo=flow4-smtp.messagingengine.com; envelope-from=jiaxun.yang@flygoat.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 574 seconds by postgrey-1.37 at boromir; Sun, 08 Sep 2024 21:36:11 AEST
Received: from flow4-smtp.messagingengine.com (flow4-smtp.messagingengine.com [103.168.172.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4X1nwW6Sylz2xHp
	for <linuxppc-dev@lists.ozlabs.org>; Sun,  8 Sep 2024 21:36:11 +1000 (AEST)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailflow.phl.internal (Postfix) with ESMTP id 7520620010F;
	Sun,  8 Sep 2024 07:26:33 -0400 (EDT)
Received: from phl-imap-12 ([10.202.2.86])
  by phl-compute-09.internal (MEProxy); Sun, 08 Sep 2024 07:26:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1725794793;
	 x=1725801993; bh=XEUlxjTawgkGJUbuV5995m7w7A2+JrHLDxzMf66rOFU=; b=
	1RqsBYWnwT4FfoKwD8HOSHteOOT9ciPyjmBQqMyvcr6+a49w9ITDGHReCqlKQ2QA
	w6LflN5n1R32xrU1xq2pIQUhw2YtNSZPREepgs7fFh/JiqskWgBI2q1oyrafoAoX
	OXv3Od7eW2mwOR/prATgt5rOF/YnKFqclBTHKg1I7fgB/KzYIhNfna0/I1Kkkkix
	Cw/j32+Ac/ao6JT1NOKot7uC14h4ncceMxC0oG8lad9utiOysG+JubQG2QCO42FN
	aaB/C7qy6BW/s3Y/XAsoNS4kMzEF8v05z3j3XR2ciLA88taJPIrCv19JmVh4IYaC
	e/1tkYDVneKs0oixOgexAg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1725794793; x=
	1725801993; bh=XEUlxjTawgkGJUbuV5995m7w7A2+JrHLDxzMf66rOFU=; b=C
	dsqc3O9g9+P1uvJEQHGHAFH+WsHowmjhRVy+cqRNjQG++7x02Zs6YEtS3Z8WE9Q7
	aU7Iyt8RK34PG634m7GdOLdc65TjyLlQ1FMnVcQDrKU1vzx9ZRt7CF5ubdgXZ5hD
	LICkHzbR+VU5TW8gyNRRA+8tUrQ1gyDD4AgYcSft7m1DT4wa5iXfOq6TFoHseKlc
	ZKKjp2fzBKD4C5Vg6N/L2WyPaWaSk/D/xDvTo+QbGyz1c5LwQ598Z1zUm1qYi2TI
	Yo/X4zL4wxVl7PWyB6MPPrBNBLnV9cGyPZwCbCyxnslwXC+24EdDff0OvF6bpxbo
	vqgoQPXgllSGln8FDDRng==
X-ME-Sender: <xms:5ondZv4zT1mzhUMUTQzG10IJfddGHJ0zWNQriMXqeMVE9T6_YZ50HA>
    <xme:5ondZk5zjak4Ydo9XQEC5_iAquMrOd_atPoKQ96BVfMT2YYDx9vqgHiwWixrtNewg
    G1Ny6-v0uoneFUa_bQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrudeihedgfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtqhertdertdej
    necuhfhrohhmpedflfhirgiguhhnucgjrghnghdfuceojhhirgiguhhnrdihrghnghesfh
    hlhihgohgrthdrtghomheqnecuggftrfgrthhtvghrnhepjeehfeduvddtgffgvdffkeet
    hefhlefgvdevvdekuefffeekheehgeevhfevteejnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghesfhhlhihgohgr
    thdrtghomhdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhuthdprhgtph
    htthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopehtshgsohhgvghnugesrghl
    phhhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheplhhinhhugiesrghrmhhlihhnuh
    igrdhorhhgrdhukhdprhgtphhtthhopegrrhhnugesrghrnhgusgdruggvpdhrtghpthht
    oheptghhrhhishhtohhphhgvrdhlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtth
    hopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghl
    lhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheprghnughrvggrshesghgrihhslhgvrh
    drtghomhdprhgtphhtthhopegthhhrihhsrdhtohhrvghksehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:5ondZmeEGi7Zphdy-TIo3rqIOR8NdWAWLW97nTHVkixQm2hr7zi_lg>
    <xmx:5ondZgJWFhoAhESpgoV8HqH0WSt1SGQGzDYdrSWWUBYB0eOSXRYfyg>
    <xmx:5ondZjIv5G778Hr5ut3xkDDBdWEw4LkqLddMC19cVit9ESab8p1oRA>
    <xmx:5ondZpygjZgzfq9YzCe6vFMmqD7cPQFQugI3PiJsvCSf-xhZMXrz0w>
    <xmx:6YndZpZiu9HbuzT5oVUkok3yUEmNCf2gNYQHj65nIEn4Qe-iJ9a104zM>
Feedback-ID: ifd894703:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 900D51C20065; Sun,  8 Sep 2024 07:26:30 -0400 (EDT)
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
Date: Sun, 08 Sep 2024 12:26:09 +0100
From: "Jiaxun Yang" <jiaxun.yang@flygoat.com>
To: "Charlie Jenkins" <charlie@rivosinc.com>,
 "Arnd Bergmann" <arnd@arndb.de>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>, "Vineet Gupta" <vgupta@kernel.org>,
 "Russell King" <linux@armlinux.org.uk>, "Guo Ren" <guoren@kernel.org>,
 "Huacai Chen" <chenhuacai@kernel.org>, "Xuerui Wang" <kernel@xen0n.name>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Gerald Schaefer" <gerald.schaefer@linux.ibm.com>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, "Andy Lutomirski" <luto@kernel.org>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Shuah Khan" <shuah@kernel.org>, "Christoph Hellwig" <hch@infradead.org>,
 "Michal Hocko" <mhocko@suse.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 "Chris Torek" <chris.torek@gmail.com>
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-alpha@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 loongarch@lists.linux.dev,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 sparclinux@vger.kernel.org, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, linux-abi-devel@lists.sourceforge.net
Message-Id: <53384dc9-38c9-4d05-bcde-a3552fbed7ac@app.fastmail.com>
In-Reply-To: 
 <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
References: <20240905-patches-below_hint_mmap-v3-0-3cd5564efbbb@rivosinc.com>
Subject: Re: [PATCH RFC v3 0/2] mm: Introduce ADDR_LIMIT_47BIT personality flag
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



=E5=9C=A82024=E5=B9=B49=E6=9C=885=E6=97=A5=E4=B9=9D=E6=9C=88 =E4=B8=8B=E5=
=8D=8810:15=EF=BC=8CCharlie Jenkins=E5=86=99=E9=81=93=EF=BC=9A
> Some applications rely on placing data in free bits addresses allocated
> by mmap. Various architectures (eg. x86, arm64, powerpc) restrict the
> address returned by mmap to be less than the 48-bit address space,
> unless the hint address uses more than 47 bits (the 48th bit is reserv=
ed
> for the kernel address space).
>
> The riscv architecture needs a way to similarly restrict the virtual
> address space. On the riscv port of OpenJDK an error is thrown if
> attempted to run on the 57-bit address space, called sv57 [1].  golang
> has a comment that sv57 support is not complete, but there are some
> workarounds to get it to mostly work [2].
>
> These applications work on x86 because x86 does an implicit 47-bit
> restriction of mmap() address that contain a hint address that is less
> than 48 bits.
>
> Instead of implicitly restricting the address space on riscv (or any
> current/future architecture), provide a flag to the personality syscall
> that can be used to ensure an application works in any arbitrary VA
> space. A similar feature has already been implemented by the personali=
ty
> syscall in ADDR_LIMIT_32BIT.
>
> This flag will also allow seemless compatibility between all
> architectures, so applications like Go and OpenJDK that use bits in a
> virtual address can request the exact number of bits they need in a
> generic way. The flag can be checked inside of vm_unmapped_area() so
> that this flag does not have to be handled individually by each
> architecture.=20

Tested-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Tested on MIPS VA 48 system, fixed pointer tagging on mozjs!

Thanks!

[...]
--=20
- Jiaxun

