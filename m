Return-Path: <linuxppc-dev+bounces-7222-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8E3A6974B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 19 Mar 2025 19:01:18 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4ZHxN31WdPz2yf3;
	Thu, 20 Mar 2025 05:01:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.146
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1742407267;
	cv=none; b=echPkHvlaQnF7PEJgBVEp/dc9+HVY7zklIkK89GM51ka2D35sFG8K3zEzcW5p3EgI4F0Fto4MD1Nh3cEvf9bCN3X4c8I9txaaVrt9W20pZI8yHvwkdXexXEkBSAjOR8L6uc9mKd7K0uKkCUfN8/UKQssv1/SBxn550K68OHeJghRNTug4/6x6jxEpHM+HTQ7ih+PTWBoFeehHTIdVXVuwRjYcF+cRP5dkItA70y/Nv4u/20jxJDNCSWOAhXmy3hctjJG83qYjWRuet5q3OWL9JsyhSycqTL4GVLycndI2p/vAk6E9C8Kn7OHWBFMdfTIXzH3Ea/oiicu9ARXqB06BQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1742407267; c=relaxed/relaxed;
	bh=j99UzkzYeukgqfDcLgt4KhNLxDXupQ030jBL4aidb8o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Fxb0zUKnDSiXrqILPWS+JzcUS5kXoV7crtuO9ibn90nen/QHNWvig0j/H12Vkm3H4uwk+gL3O1h1dXBDx8M84G1/xaTJEPaJskYhciGQwh88aKPRP/9MaHOTNtY60gizAiZMDuLlygSFWFFcbc1ektG6hObpLtuG2XC6NuoLvlgokpoYVD29hPGNWjooulJvF/0pDBd8YslLWTbhqVK05/RVTIz3PWkoLRbkQf9kZrG/8gQxQpceEFOFGF1aIaLka9KVTeXBI9K6HVpyvquSnN8b8xhzId3kuzk41es2sIKvLxUglYEnKflDp7nXO3OBMB5CkUdAPv/TRX13Sq2J4Q==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=FbSGEu3C; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TjaJZZc2; dkim-atps=neutral; spf=pass (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=FbSGEu3C;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=TjaJZZc2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.146; helo=fout-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b3-smtp.messagingengine.com (fout-b3-smtp.messagingengine.com [202.12.124.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4ZHxMx5Rz6z2yKr
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 Mar 2025 05:01:01 +1100 (AEDT)
Received: from phl-compute-07.internal (phl-compute-07.phl.internal [10.202.2.47])
	by mailfout.stl.internal (Postfix) with ESMTP id 1D0BF11401E0;
	Wed, 19 Mar 2025 14:00:56 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-07.internal (MEProxy); Wed, 19 Mar 2025 14:00:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1742407255;
	 x=1742493655; bh=j99UzkzYeukgqfDcLgt4KhNLxDXupQ030jBL4aidb8o=; b=
	FbSGEu3CIQBpoEJoirAJ2MfRpG5rbf2zHGEoiCTAg31byGXw7+teD0TKvExK84ag
	oqTl1bt+hGDz8wgAgV+5QgxCJ+eJdDFY7fLz6S3yencZxQTlGD3N3Tg9rEFEEnIZ
	YRkoRD0RaoGOSQf+BwKIfERiFuJN7/yHoDHEyhcqL/NQiNehzLTZoapa2etxWSMS
	QgH84pf+krZkYMx5Lu/xZdepLAVEiGauPMuK0qkbZC3pc6JBZmIwgAEdBP+2FLay
	aV3G89q6WQZcE9EAzIXSBZXE6fzFpI+yiFKheR2slpakXkHaBaWGNsnAtdBCslKQ
	EfDLOjSEMsNAPtB5kbtoXA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1742407255; x=
	1742493655; bh=j99UzkzYeukgqfDcLgt4KhNLxDXupQ030jBL4aidb8o=; b=T
	jaJZZc2k7rC9S6YtmLq/HJuwIyHXcsvfEGuviA8nC/HiWTszI/dcqLUgF2jGnL2R
	aOrZSBRB4io+RYJcuzwdp56sCSEiW9eUK6LqxfcpRCMsjRurcwzirk9sygbAajlu
	Pt83RPpGd+2Px39LEHtUdL/nxfFEQawxU36tkTQ0dRhnUhNeq6ag2dsojzTCEwPL
	0zB6n4orCsxCuRfPSntaiQ6XD6bhhrqFcitFlo0c1rvPCt2DO9pE/3QlEShXJrme
	8zdDVFU64JF2fOZKCmMoLnBvYP0KRXARu641Y29LPuh0nVRnCHyGwmclxsv50hwW
	3zvcOv76yjY0i7txh+2/Q==
X-ME-Sender: <xms:UwbbZxP2v_SaigJNOEBSkT0dkBU4TiRBeD7eFVboRNfhxJ_uyrYd2w>
    <xme:UwbbZz_0Skhbp8ER6JcXggtH9DQteCBjUEhG0od4UVOMDG4GZgdpna6gA9MhBrit9
    xEhebv8IF1BLUClFPs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddugeehleelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertder
    tddtnecuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnug
    gsrdguvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeet
    fefggfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohep
    vdejpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehtshgsohhgvghnugesrghlph
    hhrgdrfhhrrghnkhgvnhdruggvpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhlvghr
    ohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopehmphgvsegvlhhlvghrmhgrnhdrih
    gurdgruhdprhgtphhtthhopehmrghtthhsthekkeesghhmrghilhdrtghomhdprhgtphht
    thhopehnphhighhgihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepuggvlhhlvghrse
    hgmhigrdguvgdprhgtphhtthhopegshhgvlhhgrggrshesghhoohhglhgvrdgtohhmpdhr
    tghpthhtohepjhgrmhgvshdrsghothhtohhmlhgvhieshhgrnhhsvghnphgrrhhtnhgvrh
    hshhhiphdrtghomhdprhgtphhtthhopegrrhhnugeskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:UwbbZwTxzuKSvSyP8RM379AOft0Rk4Jy2WQ7ZMWRjRLwCUknj9sN5A>
    <xmx:UwbbZ9uiOWvUS1afndJibPBDe3wEilMotJE1tvKpBJ4uQ4fkHmw86w>
    <xmx:UwbbZ5fdArhPuVQ5nQoDvNxoUYMMRI2tSN-7JzvkCsS8570toN2aig>
    <xmx:UwbbZ52faKbdcNpcTKIV4DaxYpqTI51kcdj_27qn3FmZ3hJs1NWYag>
    <xmx:VwbbZ8zY-873YsqHPj8zmjcaXCvqPik0f9dGmrjFufKN6xZdOUEl9Kb5>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id BE1882220072; Wed, 19 Mar 2025 14:00:51 -0400 (EDT)
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
X-ThreadId: T334a9a9a7e89e162
Date: Wed, 19 Mar 2025 19:00:11 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nathan Chancellor" <nathan@kernel.org>
Cc: "Arnd Bergmann" <arnd@kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Greg Ungerer" <gerg@linux-m68k.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
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
Message-Id: <d7ebdbf9-1385-44fc-8db4-2ce6c73e25de@app.fastmail.com>
In-Reply-To: <20250319173010.GA84652@ax162>
References: <20250315105907.1275012-1-arnd@kernel.org>
 <20250315105907.1275012-6-arnd@kernel.org> <20250318203906.GA4089579@ax162>
 <5b2779f8-573d-401e-817e-979e02f811d3@app.fastmail.com>
 <20250319173010.GA84652@ax162>
Subject: Re: [PATCH 5/6] mips: drop GENERIC_IOMAP wrapper
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Mar 19, 2025, at 18:30, Nathan Chancellor wrote:
> On Tue, Mar 18, 2025 at 10:13:35PM +0100, Arnd Bergmann wrote:
>> Thanks for the report, I missed that the generic ioport_map() function
>> is missing the PCI_IOBASE macro, we should probably remove that from
>> the asm-generic/io.h header and require architectures to define it
>> themselves, since the NULL fallback is pretty much always wrong.
>> 
>> There is also a type mismatch between the MIPS
>> PCI_IOBASE/mips_io_port_base and the one that asm-generic/io.h
>> expects, so I had to add a couple of extra typecasts, which
>> makes it rather ugly, but the change below seems to work.
>
> Thanks, that does make the -Wnull-pointer-arithmetic warnings disappear.
> That build still fails in next-20250319 (which includes that change) at
> the end with:
>
>   $ make -skj"$(nproc)" ARCH=mips CROSS_COMPILE=mips-linux- mrproper 
> malta_defconfig all
>   ERROR: modpost: "pci_iounmap" 
> [drivers/net/wireless/intel/ipw2x00/ipw2100.ko] undefined!
>
> which appears related to this original change.

Right, I had seen and fixed a problem like this in an earlier
version, but forgot the EXPORT_SYMBOL on the legacy host version.

Fixed it better now.

      Arnd

