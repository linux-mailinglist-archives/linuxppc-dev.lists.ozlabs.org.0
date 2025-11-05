Return-Path: <linuxppc-dev+bounces-13781-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9294CC33EBA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 05 Nov 2025 05:13:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d1X461Vnrz2yjp;
	Wed,  5 Nov 2025 15:13:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.148
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1762315990;
	cv=none; b=e2rXHZqZHgScaSXv18EeLcXR7+X7J5jJHC9qh1b0UgUf0XZlB67wz2seGFkTfbHaFKuKIMXolK+nCH6BMZHNqe6BQkX1g3l0SnUfjIbxQTUBxVjH1G6yoi8KZJRPo8Ar71SDP2JnI6R9O0OFYfTtXd0r50E7daEX1Rc7q67K5GdohDHSu7aTvxvynALB/NJa1Frx3mE+UxQROGn5nyLein26CQTmv5QUG6Tp9KyQBwTYygZbfEVHw48GjBa8WkDebu0eW4AgGtjasERilUNCHPbgfhORaf/+0MafLelRk7nFVsZs7aKKiEKEjCAUvU8HEt0e3bXoDLzuuiGqUY9DMw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1762315990; c=relaxed/relaxed;
	bh=J8MSnqb9oJ8hOyo/Cuc0Lahe+ACYy1X7u4c6Cmkf0Ec=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CyXTD3OmwcLdo6cmDNpMEF/BHM3B3tb/pmCWZMpfLea4kBu/2gM8AJTdTsQGTK2gb/mammST62XTUxoYBHJ5SEJGUQfskED7ISwLSHm4tqf8p7uiSs20OxHjEl1/jT8SaJOjaVlLVSn/1ZV/jrjiRA1mzq0glJENzOKBn2Z5SNryAcPjCsURwpSs6AfMXwWKtQ4BO0uar+aVnA7V4FiX4doHeMt6uMyXuOvQhFwWwjLTuo+ZC1FcUa194dtZ9A0W9py4rCVRteICRgX1lq3vWHoHmlsf4tYM1pXcev51HNLBK9/f+eUZGfiSwUcDCx3/OaAKKQDYeW4ndQK4w5A6Tw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=me5sjNZ3; dkim-atps=neutral; spf=pass (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org) smtp.helo=fout-a5-smtp.messagingengine.com
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=me5sjNZ3;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=fout-a5-smtp.messagingengine.com (client-ip=103.168.172.148; helo=fout-a5-smtp.messagingengine.com; envelope-from=fthain@linux-m68k.org; receiver=lists.ozlabs.org)
Received: from fout-a5-smtp.messagingengine.com (fout-a5-smtp.messagingengine.com [103.168.172.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4d1X435yGsz2ySP
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Nov 2025 15:13:06 +1100 (AEDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 55858EC0213;
	Tue,  4 Nov 2025 23:13:02 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 04 Nov 2025 23:13:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1762315982; x=1762402382; bh=J8MSnqb9oJ8hOyo/Cuc0Lahe+ACYy1X7u4c
	6Cmkf0Ec=; b=me5sjNZ3cOuy9BjgUmaJtcG4W0KHRF35S9yNi0PjDrGQkc7il31
	F5G2V/B2YbkIzvxej1bhcMOUcWGrf40Plw1YRsHGepdF6Z2pJUUObLfRoai1m/dv
	/ypUwxuYfrI2CWkVpGKspS1uvrt+k6eUJgrq3889dC8czyCWgMeMQFNjA2ulgW/z
	Fnv1DTZ3PoJ1NsjYB/+qiHfRQYQzEcaJS7By1ocwQ96AuK7zLau1efeG4EXgcjTt
	VcafHWSYUU3xZ26LGu18uvzJf+Y6aDZpHWcFWY3MjjFZPhbeuB0FSUyfFj6wJ9HL
	bjBYau+rWv8dFVY2nBctC8hNlBKVaGZYR2w==
X-ME-Sender: <xms:zM4KaR0l1OxErxWXaygApfF_9BONM9C2pMz07CzuU3Teevzpux5yww>
    <xme:zM4KaT5GmYkH6L3Hc_d_O-twnq6TDZQVj2sviQ1d8XNEE5V7sxMdiQWeaEkuM7fg5
    nhh1SJYkHiRNs_7XXSaIb2SpEzMN4hRq7OI9IFkVJPV-X03a6IAwbo>
X-ME-Received: <xmr:zM4KadTV15gR_oE47J17283eElwFXqEAHdAhnnDeImIib6dLrRyPhK-Wb_T2vXS6kXYmEPaBi9kt_6XHuPi0KhhFzqzib9yu1GE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddukedvleduucetufdoteggodetrf
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
X-ME-Proxy: <xmx:zM4KaYXAICgnitXLRix7RN-xOnsznBzZtbi6Oqh2k_pBrDpMkSzeOw>
    <xmx:zM4KaSENEJpWEIxaOlbbiV9NSjRqK1DurtvOrl66jqRPyoMUAkOS8A>
    <xmx:zM4KabcODOifgDuXFQVlqpGVTuhMs0g6SaXjf5HKiTk68eW4_vxOpA>
    <xmx:zM4Kabq7p643LGzplcMHhsBzAlsyP2aWZicZVnJ0IAOHnnQEMjKu9Q>
    <xmx:zs4KacX86euGDMYc27_IarFDd8axj6mdTHAG8SuD5NUBok2K_O5qdOP1>
Feedback-ID: i58a146ae:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 4 Nov 2025 23:12:57 -0500 (EST)
Date: Wed, 5 Nov 2025 15:13:09 +1100 (AEDT)
From: Finn Thain <fthain@linux-m68k.org>
To: "Dr. David Alan Gilbert" <linux@treblig.org>
cc: Stan Johnson <userm57@yahoo.com>, mpe@ellerman.id.au, npiggin@gmail.com, 
    christophe.leroy@csgroup.eu, sam@ravnborg.org, benh@kernel.crashing.org, 
    linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
    rdunlap@infradead.org, Cedar Maxwell <cedarmaxwell@mac.com>
Subject: QEMU limitations, was Re: [PATCH v4] powerpc: Use shared font data
In-Reply-To: <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
Message-ID: <492c13c9-666c-9578-6c66-0eb8fefc93dc@linux-m68k.org>
References: <20230825142754.1487900-1-linux@treblig.org> <d81ddca8-c5ee-d583-d579-02b19ed95301@yahoo.com> <aQeQYNANzlTqJZdR@gallifrey> <20108eef-b7cf-3f23-264a-5d97021f9ffa@linux-m68k.org> <aQgJ95Y3pA-8GdbP@gallifrey>
 <797f0a13-350f-e26d-f1ef-876419e1c013@linux-m68k.org>
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
X-Spam-Status: No, score=0.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org


On Mon, 3 Nov 2025, Finn Thain wrote:

> > OK, remember I don't think I've ever tried PPC via MacOS booting, so 
> > not familiar with it.
> > 
> 
> I will try to set up a MacOS guest in QEMU, to see if the hang can be 
> reproduced that way.
> 

QEMU appears to be incompatible with the Old World ROM from the Beige G3. 
'qemu-system-ppc -M g3beige -bios 78F57389.ROM -serial stdio' drops into a 
ROM diagnostic menu and won't boot.

I did get 'qemu-system-ppc -M mac99 ...' to boot into MacOS 9, by using 
OpenBIOS instead of Apple firmware. Unforunately, BootX is not compatible 
with this configuration, so it won't help.

BootX is compatible with beige powermacs, but 'qemu-system-ppc -M g3beige' 
with OpenBIOS fails to boot MacOS 9 ("MacOS: unable to find an interrupt 
controller node").

OpenBIOS wouldn't boot a MacOS 8.1 CD-ROM either, but for different 
reasons: both mac99 and g3beige failed with "No valid state has been set 
by load or init-program".

