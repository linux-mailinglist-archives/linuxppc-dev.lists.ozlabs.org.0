Return-Path: <linuxppc-dev+bounces-13691-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B13F9C2A4FA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 03 Nov 2025 08:26:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d0NRv46HJz30RJ;
	Mon,  3 Nov 2025 18:26:19 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762154779;
	cv=none; b=Z8fDYuEDpT1mtlhySpwytnI/TKs/0dQa6plj+Tj/DpSEtebOu7XMPrdkwPH6XmcE3SM/AUNgzA8lzrhUKYSfzLei9rGSIrJmbLX54M/ocnHQ2XN3G6eQMoYMSwN9d4p1YsejkwxlCHqbolubHMK+Ul5KIeXVNnRCsIpGUAU/2ZH0/ykccZ6uNvjuQb94g0mL+qLtyU9OsE4jCf2LjxgRvAvmjJ8eLtPcm7yybbukdCVgyvcvhiOnk6k8ONjaovexvTPn9nPqhtoAbtDOnqh3pwPH5VLBusVyRURJN/Suf/dwibWQbHLG9RrPd3MEFUEMCwGAwn3bbKJSL0NreaCCDw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762154779; c=relaxed/relaxed;
	bh=PX5prZmahrgIhU+JbpH47LcMvc0AFM9ySNdraK9Ud/c=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=mkeB2ilEsTDiiHFHo+Qxn2UNMWFaJ/lW6DfMToIvvJ+F3MasOypgFiOTtK4cbD4Eo0hYNroTWuWqEG4hxUe97Wkl5PRVgAnHkI2rUwcy4mKxLijQoKlkHQZP5YVaA46lo1OVq4e/R+9M+8+IS+pa2170R11fpE1mLVboErH+81CtLrmGdNIJkBWrD3Toi7EpT7oUqQoL3atilnVp7nDn+iPhBYEJc7ul2AI2QKEuIMaaGmO6XdOvo024gQPYe02zzbT802IBs1s24pQF9XaYkMyzg01OleS477avKB2s8uIPZ+ZmK/cn/rOYds2JgBTmEwRBcVtgnDyC/P/K6GOKVg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JKhQo3Yo; dkim-atps=neutral; spf=pass (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-a1-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=JKhQo3Yo;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-a1-smtp.messagingengine.com (client-ip=103.168.172.144; helo=fout-a1-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout-a1-smtp.messagingengine.com (fout-a1-smtp.messagingengine.com [103.168.172.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d0NRs0RFHz2xR4
	for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 Nov 2025 18:26:15 +1100 (AEDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfout.phl.internal (Postfix) with ESMTP id E7772EC00A3;
	Mon,  3 Nov 2025 02:26:12 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 03 Nov 2025 02:26:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762154772; x=1762241172; bh=PX5prZmahrgIhU+JbpH47LcMvc0AFM9ySNd
	raK9Ud/c=; b=JKhQo3YoXbYZpttHEkp/VzRzZ+zsA4JJPVBjTs9ObI96ELmjiXJ
	3bgZaO7IO28F7ZxAR4p/3gvJ5w94dcpYmpRHRFsqbYvPExECiloT2MHBwCtzQ2QN
	Zo+r081EFl0oEkmbFfv/9EFTKbKuQe/x3Mzi5IQTRsDyfvUwvET6ihul5I7sOXjS
	LaB9duP/puZKFuyvmWQDVpe64dCRLbdQCk9sSowrnUtgAAqLCryn+X6MhfWGwr93
	j5OUHy6TlbKVsYZGN3DJQF3oiHHMuYizx/nRLTH85P9YQMWuy51E5rniW/XWxnKI
	QF8582XslPwikLYYRLorSeOI2rZmimpEECQ==
X-ME-Sender: <xms:E1kIaYl8JOPjS-j3yFMlOJK7JOiIplv4c80tVxwFlQL4nom9cl9uVw>
    <xme:E1kIaTqH6dfYtsVTb5eOXY5Y0tqsjec8yQd6D-z338uUWSEerbHPJZsjKxdw7uqRo
    LT7NWXsqOEFh7BoCVwUnzXRgnf69T6qZ715cDjFLqMmFMhiPzQkxLg>
X-ME-Received: <xmr:E1kIaSDptXscHynC45OT4jocW6HYUEL9KWtXBkapk922NtkulIOYWYi2ZwuxlupiZ0-XS55Dil5zUS2XyBvN4t5dNFHnmssyb7Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddujeejheefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevufgjkfhfgggtsehttdertddttddvnecuhfhrohhmpefhihhnnhcuvfhh
    rghinhcuoehfthhhrghinheslhhinhhugidqmheikehkrdhorhhgqeenucggtffrrghtth
    gvrhhnpeelueehleehkefgueevtdevteejkefhffekfeffffdtgfejveekgeefvdeuheeu
    leenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehfth
    hhrghinheslhhinhhugidqmheikehkrdhorhhgpdhnsggprhgtphhtthhopeduuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhinhhugiesthhrvggslhhighdrohhrgh
    dprhgtphhtthhopehushgvrhhmheejseihrghhohhordgtohhmpdhrtghpthhtohepmhhp
    vgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtohepnhhpihhgghhinhesghhmrg
    hilhdrtghomhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhr
    ohhuphdrvghupdhrtghpthhtohepshgrmhesrhgrvhhnsghorhhgrdhorhhgpdhrtghpth
    htohepsggvnhhhsehkvghrnhgvlhdrtghrrghshhhinhhgrdhorhhgpdhrtghpthhtohep
    lhhinhhugihpphgtqdguvghvsehlihhsthhsrdhoiihlrggsshdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:E1kIaeE_FfgsNskovQSA7E_VFEENGQ6iM_wWINonI8A0PYjrkEli0w>
    <xmx:E1kIaU3vZgDv1anx4lcTGSu7HrfwcWAPtrytRL9fD4yXVachoZ_xHw>
    <xmx:E1kIaXPjzTI_L1FdaVTDQPLzVzitx9urVxiD45ks-7jCDGoKO1hvmQ>
    <xmx:E1kIacY3oM0B64yU5wJxmfSCYXfjDPEcGweelGfldRYrRVQwec4y_A>
    <xmx:FFkIafGIA-HvFZtAdfZFwMZLMrcjjkmS59C5w6p5uUC0V112cuUfGRJT>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 3 Nov 2025 02:26:08 -0500 (EST)
Date: Mon, 3 Nov 2025 18:26:16 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>
Subject: Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <aQgJ95Y3pA-8GdbP@gallifrey>
Message-ID: <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey> <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org> <aQgJ95Y3pA-8GdbP@gallifrey>
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
Content-Type: text/plain; charset=us-ascii
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_NONE autolearn=disabled
	version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 3 Nov 2025, Dr. David Alan Gilbert wrote:

> 
> > Anyway, I imagine that the problem with your patch was that it relies 
> > on font data from a different (read only) section, which is 
> > unavailable for some reason (MMU not fully configured yet?)
> > 
> > So I've asked Stan to test a patch that simply removes the relevant 
> > 'const' keywords. It's not a solution, but might narrow-down the 
> > search.
> 

Stan tested my patch to remove 'const' from the font_desc and font_data 
structs but it did not help. (There goes that theory.)

> I wonder if this is a compiler-flag-ism;  I see 
> arch/powerpc/kernel/Makefile has a pile of special flags, and for 
> btext.o it has a -fPIC (as well as turning off some other flags). I 
> wonder if bodging those in lib/fonts/Makefile for 
> lib/fonts/font_sun8x16.c fixes it? But... this is data - there's no code 
> is there - are any of those flags relevant for data only?
> 

I don't know. But I'm sure Stan would be willing to test a patch for you.

> > 
> > The BootX bootloader doesn't work on New World systems, which is 
> > probably why we don't see this regression on anything newer than a 
> > Wallstreet.
> > 
> > It's likely that other Old World systems are also affected, if they 
> > are using BootX. We don't yet know whether the regression also affects 
> > Old World systems using the iQUIK bootloader instead of BootX.
> 
> OK, remember I don't think I've ever tried PPC via MacOS booting, so not 
> familiar with it.
> 

I will try to set up a MacOS guest in QEMU, to see if the hang can be 
reproduced that way.

