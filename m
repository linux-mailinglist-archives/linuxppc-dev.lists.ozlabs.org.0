Return-Path: <linuxppc-dev+bounces-12419-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBECEB89E03
	for <lists+linuxppc-dev@lfdr.de>; Fri, 19 Sep 2025 16:23:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSvqV0zdZz30HB;
	Sat, 20 Sep 2025 00:23:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.154
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758291781;
	cv=none; b=oakM6h+cEsC1CZZc04j8fC5yoGW+7a1g4JvxTV76HKqJ/gn+HRBl3KAVKoipT3+HG5Q5tgLc+Q7aTkf2HXIpmwn4u74wWV7dZuCsKYLokRXUGghfhQrdGAk7+wK+pZ/GnAD1qk0AgVqme+wv4rDq6L//AOxxUtZLXh1X9sJs/x0IZyhvCiA8HZfNKLSOf2VhMSqNpWO7WXWF1T1Wm0WXpZNJo9e0rqbu+UFWqtCoWdKJE9gZFQmkJLHZj0ZM2UcfSwzi0JoFjDlPh57Gt8fsBEh1SYL+5p8IfP12Te4WPA9Bjc4pWbZswMRC7GA9+fl4uTMyyc6hGPwiN0Jj0697Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758291781; c=relaxed/relaxed;
	bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=CiRj3H65699OzGWbrJNeRT9g97565cyooTTWYefcVXRqt9pBCSydaxAZlMmDo1bUkVPE5V7Jb2IafEGlekbnpWPVEcBZvapEgl4nKDHXrDAWNwJmM66hc9TSDvpBAUVQICfj8yMXTCak9azgq2rgLZaR+VgUAOslmv/2hhcYjsdawIiuwNVHW4Z4RSro/FY+lmKpCBeIzeYDU/o8ELLfSv4X6fmOT8zJ2i+Wilq990buuV6XN+yi9Oz+uuNgIq0KXjM+dEbyhWl3CiaP3gIXyAG1BbnYWQj3NuSX6IBd0EBk4IsCd4owTfiGamShyNLniTtf2uEnwZVFst3HInqZbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=3P7vtOxX; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NwEFh+Eh; dkim-atps=neutral; spf=pass (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=3P7vtOxX;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NwEFh+Eh;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.154; helo=fhigh-b3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSvqQ5n7qz2xpn
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 20 Sep 2025 00:22:57 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 3BC477A0068;
	Fri, 19 Sep 2025 10:22:53 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 19 Sep 2025 10:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758291773;
	 x=1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=
	3P7vtOxXTlRKZGWlZLsRFVQlQg4bj5SvQvb5v1zmryo4PCz5xUCZ/fSZUuL33qsW
	2XFxpoh130HNWVqUH00GYFR2OLcWx0fbXjhyeBAR8yseNvBXLhN/0OOMJL6U3cy9
	NOxQGScNJsPb3WM84wfJPFb4rdhDXJNr0eUbkkBFZAqgCNYQVkp1Eolbo7eGfx6T
	UIhoCwGZmmCD2l9Vdt05U1amomaUxFZDiopcE8Uiha2UPEfSrnPL/cBLPrd/w2SK
	AOAYXKR8GES89WQNC+kxfLcj7gP5oZndIPzi3FtUM0Qapm2gqlAC8zK00Iux7Czt
	u3Hzk4X0b7bccGPCfsVDGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758291773; x=
	1758378173; bh=DGBIXWoQfciFg5TTWblokxBsiewcOE1bszsE8YzDKWM=; b=N
	wEFh+Ehq8I5Ne8BUFO132THoMndwZ6szg6zS6b+qZvszYrP+sSryFfqlrr++t+re
	52mUZjJS/MqYpcQK4IrqneI3Q+QV87n44m8BdrbXyltTFUsKqWVoFc7LxhztSzR1
	/CyOnK6h4cAgGvOrrvZPqQ+kytQaKCIBFxaNl1m4svOmCOmwcwS8Yq4fdKJu928x
	+iYoSc2Dwk0r2zFgWPLHA2uWyYEEbO2I/L1Q2EIYz5f60VEk6QPi921HwITH7WAh
	xpt1386OGSe7LQJ7/CDBPPYMPl7W+ZdVVK91Q5wl7+/wWjKCPzRy6B5d7I5vClBH
	kLIZeQgRg6fEx8N/FKj5Q==
X-ME-Sender: <xms:O2fNaHPZsDEluqQ3K1xXVYzEPxMOHfVlGvrDBsZCIGFfPOnh7MIMIw>
    <xme:O2fNaB8EpINHV6429QucyQqOJUWdlBgZRzftFfr0w1fqno7OIhXeVkca9g9sUwCxx
    WJ4lzYGsR2mwvafSTA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegleeggecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeftddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:O2fNaLcxJAwbyL7fF-hDxzqk5CnB_5srfmblzDObKefDa2_Yw3Nu9Q>
    <xmx:O2fNaI_XmRHiAy2z_8UrPdVkq5oq8nmdQ4T2W7CdP781TiN2_pBACw>
    <xmx:O2fNaJixEsf2I4UZLqtJvoBDqXbeFMrBT42lISbnoEN9uVt68m1a8w>
    <xmx:O2fNaE_oeBhVK0r7xewR08-ipIjEJmwOjKy_oXBB5MOm1ZA557kJ_A>
    <xmx:PWfNaL2dV5R9mOO8RHYelr4frobgiBB2zH1lISJhguP3OD7Lp1pVdNvG>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 04B80700098; Fri, 19 Sep 2025 10:22:51 -0400 (EDT)
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
X-ThreadId: AneuvEk2E7Kg
Date: Fri, 19 Sep 2025 16:22:20 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>, ksummit@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Linus Walleij" <linus.walleij@linaro.org>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Vlastimil Babka" <vbabka@suse.cz>,
 "Suren Baghdasaryan" <surenb@google.com>,
 "Ira Weiny" <ira.weiny@intel.com>, "Nishanth Menon" <nm@ti.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 "Alexander Sverdlin" <alexander.sverdlin@gmail.com>,
 "Chester A. Unal" <chester.a.unal@arinc9.com>,
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>,
 "Andreas Larsson" <andreas@gaisler.com>
Message-Id: <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
In-Reply-To: 
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 19, 2025, at 09:17, Geert Uytterhoeven wrote:
> On Thu, 18 Sept 2025 at 15:13, Arnd Bergmann <arnd@arndb.de> wrote:
>> On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
>> > On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>
>> * Microchip SAM9x7 is the newest ARMv5 chip, clearly does
>>   get kernel updates, and the only one I can think of with
>>   DDR3 support, but seems to be limited to 256MB total memory.
>
> Are they limited to DDR3?
>
> IIRC, someone (you? ;-) told me at ELCE that Microchip keeps on spinning
> new variants of old SoCs, to accommodate the changing DDR landscape
> and market.  So perhaps they also accept larger RAM sizes?

Yes, that was me. The previous SAM9x60 was released in 2020
and I think that one was an upgrade to a smaller process node,
raising the clock frequency to 600MHz and adding more modern
peripherals, but I see now that this used the same SDRAM/LPDDR/DDR2
memory controller as previous chips, with a limit of 128MB
total DRAM.

SAM9X7 in 2023 added DDR3 mode with up to 256MB according to
the datasheet, no idea why they chose not to support more,
since a 32-bit wide DDR3 bus should allow up to 1GB with two
256Mbit x16 chips that are widely available, or even more using
expensive 512Mbit x16 or 1Gbit x8 chips.

       Arnd

