Return-Path: <linuxppc-dev+bounces-7313-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53F32A6DD34
	for <lists+linuxppc-dev@lfdr.de>; Mon, 24 Mar 2025 15:40:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZLwhW4NmMz2ygJ;
	Tue, 25 Mar 2025 01:40:43 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.145
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742827243;
	cv=none; b=Miv7CM87hOa16FLMJFtSXTvSgRA4yTEs731mNoLfzxN/5IC2EvfaAxSparr8fWycrzuycC8KjOAL8GD1crAEUkqMc2deyAmixdutNVcngLfgcA+Hdbr1E5mZNVI9Li76YHm5RENYf7ic7Z7NkaifmneKin4hWtDzGH6BcxpckBZ3xiLm0h0OApdoncSfzGDem7p7YI0W+Kcaf6PYzDYaX4+QUPp/0Ut70Sxqzl6YE5Nt0RIqpDKvXfiN4KEhIJjjOtarygz/bcFOYW0DEsGp5L8pXga4Wd2JAka+gOIuokjWFyPM2vUvzev7PTLgj0Jr9Ytc+wk5mC8Flp43SeHfRA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742827243; c=relaxed/relaxed;
	bh=n76Uj10bdEPtDvI3mHeDGPdivbBmYZRpkA5AZkl/TEg=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=N1NUxZzoVSKx3/opaSE+IYAGjxCw/DR2fhXq6wqnzTRIhOn3vtBhASjRQhgydgkOiN2qIn9hazVI6DvRQruPfmbGH6wT1ar9nK59gBJsVIu4z3UkCZV6zAiZ8IUd97Q2O2tRPJ3IcVyAstz7roquXTSi4RWzxD7EnsAw8ysJZfepIuBIxne0QoJEGGb0PZq8nGPaSkbHky6CaQswwtNH+UEXWXHuKKWTah9sGMhVGxNXCLX8QuC9MiWRoKfocSodadw9Jr2GywM7VN7LDlHMF2Sff0fOWUJypU1XCp3OJwGiJHK1VZOPoiLk1MfyFOfqPoB9HgP5A4++0Or6xHFA6g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=TXDFYQ66; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kn0Coouh; dkim-atps=neutral; spf=pass (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=TXDFYQ66;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Kn0Coouh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.145; helo=fout-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a2-smtp.messagingengine.com (fout-a2-smtp.messagingengine.com [103.168.172.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZLwhR3qhGz2yGf
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 25 Mar 2025 01:40:38 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.phl.internal (Postfix) with ESMTP id EBAE61383B18;
	Mon, 24 Mar 2025 10:40:34 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Mon, 24 Mar 2025 10:40:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742827234;
	 x=1742913634; bh=n76Uj10bdEPtDvI3mHeDGPdivbBmYZRpkA5AZkl/TEg=; b=
	TXDFYQ66pGiemkLg+N3hVLyohz+9d+K45Q1eRTdvfkgO+rZDNmva/hGeG7jbCR9t
	h6fVyNu7MLfDa1oAAdoMTqAuX9nSyGjxbtX3K9/Qfi/DzcqE0A3aiOBpy4SvPCsu
	V4CL0TsnpGQBniyn8bss3zfMnHZ/CM6u5kcgpRgx48efo6u9npGwJEb4TyQR82Qf
	zrRzYO2ydN9+1R3hcPHPnI/blDwXDPTksUPiGZEa64bDmu+bED8k4UADMmFIMnjI
	D2TyEyC6jESUgnTE3vMxv41UlB5KoqdTRlfrw6+Uip9AZCVe6lIrKMU9xwln/V2G
	CGG0gXCBudPVHTTt4pWgiQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1742827234; x=
	1742913634; bh=n76Uj10bdEPtDvI3mHeDGPdivbBmYZRpkA5AZkl/TEg=; b=K
	n0Coouh6co6nnWuJMZEo5y1Ha2vMNqs3vbOZUWJswU90Hopfj3MG6rB6FnB2Vli7
	RRZsv8R0TdK713T0/WcXihtphM5LKKeIAw9Wnhe3rXW5OshdOT6HMSoinEFlJV3J
	RXl4QRjCf1k4i0pUEahU7mCpGnmbY1AhwkizG0mvPIw4F49X5V3M/6l3TsX8qFjZ
	Hv8UPukyzgBRnXuSfhwuGKn6oklz1SuYf8nfGIczO3OXo9c7A1k+fn7eVDno2Aj+
	Uav/zqIcpdOPc+KjeDMiNerZDw5Xvjozcla7KSOdFboJy2wu1HUBy6w83YFSiDwT
	8HOTCBWoguGOKQg1Nc8Kg==
X-ME-Sender: <xms:4G7hZ9opzXWYYMMLprNdNZhWR3VnkTXZ5cjbLNjAz-xGqD_KJy2Iew>
    <xme:4G7hZ_rJ4mSpPBo57ulAbHucCMzRBu1qWRrxposD98WEVrCffJOVspkHdvORW_UwU
    SdDQxL4fBBAp4EFuxQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedttdefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlph
    hhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghr
    ohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrih
    gurdgruhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomhdprhgtphht
    thhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrse
    hgmhigrdguvgdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrh
    hshhhiphdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:4G7hZ6Pz3qtnB2guwtcbIMy5BnBXoH5jmsWnq3qulB4EBStql0deXQ>
    <xmx:4G7hZ46a-bVZ0ZEb6b97EFB1c_OoktumAMPu0aFS8LZeRT_m9ZN2Zw>
    <xmx:4G7hZ84mTpfuxjXkjyc9KUpZL_eJTar_uNkNoB9HVp8_V6P9Z9vH1g>
    <xmx:4G7hZwg28o1A40L-m7WKyS3nxEgQr-4Uy9U6SqjG2z0lhXoYf2xJlQ>
    <xmx:4m7hZ3x_r4JGE8fZpLpxh3gan8DRthDVv3ooEN5rzbh5pW5q6SnxmMEt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BC8B02220073; Mon, 24 Mar 2025 10:40:32 -0400 (EDT)
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
X-ThreadId: T53f4a10e7512c522
Date: Mon, 24 Mar 2025 15:40:12 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Greg Ungerer" <gerg@linux-m68k.org>, "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Naveen N Rao" <naveen@kernel.org>,
 "Yoshinori Sato" <ysato@users.sourceforge.jp>,
 "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Julian Vetter" <julian@outer-limits.org>,
 "Bjorn Helgaas" <bhelgaas@google.com>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
Message-Id: <a41f1b20-a76c-43d8-8c36-f12744327a54@app.fastmail.com>
In-Reply-To: <9076d00e-c469-4a05-a686-94e3e55c8389@linux-m68k.org>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-7-arnd@kernel.org>
 <64f226e5-7931-40ba-878a-a28688da82fd@linux-m68k.org>
 <4a31c6a8-7c99-4d8f-8248-92e0e52b8db6@app.fastmail.com>
 <9076d00e-c469-4a05-a686-94e3e55c8389@linux-m68k.org>
Subject: Re: [PATCH 6/6] m68k/nommu: stop using GENERIC_IOMAP
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H5,
	RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Mar 24, 2025, at 14:50, Greg Ungerer wrote:
> On 24/3/25 18:02, Arnd Bergmann wrote:
>> On Mon, Mar 24, 2025, at 02:33, Greg Ungerer wrote:
>>> On 15/3/25 20:59, Arnd Bergmann wrote:
>> 
>> Does this fixup work for you?
>
> Yes, this looks good, works for me.
> Feel free to add this if you like:
>
> Acked-by: Greg Ungerer <gerg@linux-m68k.org>

Added now, thanks!

>> On a related note, I'm curious about how the MCF54xx chips are
>> used in practice, as I see that they are the only coldfire chips
>> with PCI and they all have an MMU. Are there actual users of these
>> chips that have PCI but choose not to use the MMU?
>
> No, I think everyone with these uses them with MMU enabled.
>
> It is probably more of an historical curiosity to use them with
> the MMU disabled. That supported pre-dated mainline kernels having
> full ColdFire MMU support by a good few years.

Ok, good to know. Given that there are no other chips that allow
PCI on !MMU kernels, I wonder if we should just make PCI itself
depend on MMU, and remove the "depends on MMU" for any PCI
drivers that currently have it.

There is no fundamental dependency here, but it is something that
breaks occasionally because of in-kernel interfaces that don't
work as expected on !MMU configurations, and with an extra
dependency we could stop fixing those.

      Arnd

