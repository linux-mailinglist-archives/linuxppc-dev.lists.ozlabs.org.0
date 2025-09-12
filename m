Return-Path: <linuxppc-dev+bounces-12098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5CA1B55815
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 23:10:01 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNnBH2kYRz2yPS;
	Sat, 13 Sep 2025 07:09:59 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757711399;
	cv=none; b=iz/qkb08hg4iabPZ5hvoS4PrcjcloKVRAJPmwo4iPZW0eXTJ59RbpzDz1Ng5za/X5kIMAGysHdFfDolmMpjmHmzpvG8xRVSKiVLn7UrGFsyCvNdiiaFT+qUO7E8eWJEXg/Efn3q1vLfMgrg4i7as82V0TmIaWbSmYDYDWhh0G9MV3Y9huMKK/BD+7w2duAacxWo8hAXoD0yt9N9cIApDesLs6Ke1qzlCEvlrwj6Vwo+mRj3hMTPBtlnR9aIjLmzNoWDcJUh0wVF+DzUVQK7q8ZflM7E5JZeZIZmtqjDbv3+/LGYus2DIpId89pg1S69brGP6xbhhy9RiP89tIMMaOg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757711399; c=relaxed/relaxed;
	bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=kiWdcJH6ZdCoMOBlCHBQoZVWROKhmZTXBMKAD0C3zt95SEeezxqKAOahtN0x7o3hYfojEah+Jz0spSJOxQd5W8utldJa1r8uJGta78KTCtt6B9ZNoI9i1QoCJT/Pt+scBHbn8WFgfSCVblQqrkLqd/ct/4/2D/Cl+4lajSpkWpia8oHC0e3ih9NsWUVL6VeePqez3yYe+3xsjZsY7qUOW2H6wReag2thqJTUbegzIKPs5SVK4sl/1kfaGF9mJp11Gr6Rm21p/Ga6ywL6T7Lr+j4SxCa2qagFB2trF54zuY6SXrQN7Yr0mbbdAknStk/0zqmGMoHdzcSoYpTbeGpwjA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=GI4t6+q5; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Hg+efwLE; dkim-atps=neutral; spf=pass (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=GI4t6+q5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Hg+efwLE;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.159; helo=fhigh-b8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-b8-smtp.messagingengine.com (fhigh-b8-smtp.messagingengine.com [202.12.124.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNnBD4frGz2yD5
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Sep 2025 07:09:55 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 128BF7A01CD;
	Fri, 12 Sep 2025 17:09:50 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 17:09:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757711389;
	 x=1757797789; bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=; b=
	GI4t6+q5kXjCO6cruisFBrxlfYspQdyR2nSwyVUifQzM7VEMrmYCNyjAVYjNhTgm
	WqCqX8kZdK2deNSwLTBVJ3N8pSl0NhU5c9HH2kyD2VdFMzafqFVFH9hpDeIJNrzj
	g4Qa7RVKOklHp6T9//Fk2QqJOmtlyMcvCzaPH7vzB72i03nMdNbtRdOZjHzQ4h/L
	ftry70985VVJ0JC8deKiZyhzurfBwKKn5fmc5YLwZO9NW0AWFO9cbhr6Oa1pnc8X
	IbeXUCwwcUmmLw1JIdKGv7tJjqaUU7L6MH1vAFkSQFJ8ZQ5CrDw16pFxmTMYZ3b4
	iRfechyn/kmAf/3LIGcGLw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757711389; x=
	1757797789; bh=CLqRBKVf5IvTh800HM+2y42LrS7XFT+UlQoEp2IAPso=; b=H
	g+efwLEojmMZRq8iZwYjjIYprH/XYxRGz4gmpycxwdhPe1s8+YfTor2bbGv0c0B2
	RLsa8YQz2KykS1Kzwhrjk5vc4sNyX55mlyEc/YPCTF+a+h5XGA1P5EP0qMtntlaW
	glaOlh/Kn+XcHwMTpuhR2UrjWZGj35jBvgxWwqm5OAUbjTj6+VnIzZ7ANky9E3Wz
	IpurPFx3x7zuk4nsRKyP70Og/99u4DsemcafNS5R+S7aIEm+gzBBWkmSBQ6mFI6Z
	sZlMDN5oUpNr0X2A2oOZa95CyTZTboiXtWUjzqMltgruej+lvRP5fnsTfi9FdrWx
	iwGev+FnsPgCi2tPWVfjQ==
X-ME-Sender: <xms:GozEaJ7WVeaEI1J4FNYCAeFSe1bMurC67OT_BB0Jbhk6PWXzJbvBLQ>
    <xme:GozEaG5x_FaTJVZFNRf7pkhjUFbOGrPCkzZW9DKjVtpsq9dK8yfY--QfEjU7m0KIT
    _ceh86DRDz2N8UZEKI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeftddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpeevhfelgeefleefgedttefhgfffieejkefghfeghffhheelieeivdduteevhedvgeen
    ucffohhmrghinheplhifnhdrnhgvthenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthho
    peefvddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheptghhvghsthgvrhdrrgdruh
    hnrghlsegrrhhinhgtledrtghomhdprhgtphhtthhopegrlhgvgigrnhgurhgvrdgsvghl
    lhhonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheptghhrhhishhtohhphhgvrd
    hlvghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegrnhgurhgvrghssehgrghi
    shhlvghrrdgtohhmpdhrtghpthhtohepghgvvghrthdorhgvnhgvshgrshesghhlihguvg
    hrrdgsvgdprhgtphhtthhopegrlhgvgigrnhguvghrrdhsvhgvrhgulhhinhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehsvghrghhiohdrphgrrhgrtghuvghllhhoshesghhmrg
    hilhdrtghomhdprhgtphhtthhopehsuhhrvghnsgesghhoohhglhgvrdgtohhmpdhrtghp
    thhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:GozEaDU9e-ltO4GjQuBQZhofb5Kj9EDyPaq1nCnmbW-klx59mcvMXA>
    <xmx:GozEaKDK4yJBaHtkl_LHlcH0jkKXOLdoeoxqmFBWV2JzvB84rcbpfw>
    <xmx:GozEaCC2WD64DUi7GSydM1X-85yv-7hi6n4v8g8ii_kFrgTh92XlXw>
    <xmx:GozEaJphW--h3lZUWi9M-TVTnM42xRnish8dD4tvsnrWGtNkHbKeKA>
    <xmx:HYzEaKn6J5RHAuH4Qzhj_HsWd61NA-XKIndTEYj5XMySXeVQsv1vmoqt>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id AFA80C40077; Fri, 12 Sep 2025 17:09:46 -0400 (EDT)
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
Date: Fri, 12 Sep 2025 23:09:22 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Ferre" <nicolas.ferre@microchip.com>, ksummit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
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
 "Andreas Larsson" <andreas@gaisler.com>,
 "Mihai.Sain" <Mihai.Sain@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
 "Claudiu Beznea" <claudiu.beznea@tuxon.dev>
Message-Id: <1d58fc51-b921-4669-b6e2-f9a71d1eda58@app.fastmail.com>
In-Reply-To: <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <f931da29-5f10-494a-acc0-309bd805d41a@microchip.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Sep 12, 2025, at 18:49, Nicolas Ferre wrote:
> Arnd,
>
> On 09/09/2025 at 23:23, Arnd Bergmann wrote:
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason.
>
> We have 1GB of memory on our latest Cortex-A7 SAMA7D65 evaluation boards 
> [1] (full production announced beg. 2025). The wide range of DDR types 
> supported make some of these types interesting to use at such density.
> Both our Cortex-A7 SoCs don't have IOMMU; core and DMAs can address the 
> full range of the 32 bit address space, so we're quite 
> standard/simplistic in this area. We use CMA with large chunks as our 
> camera or display interfaces address "modern-ish" resolutions (~1080p).
>
> We use CONFIG_HIGHMEM and activated it for simplicity, conformance to 
> usual user-space workloads and planned to add it to our sama7_defconfig 
> [2]. I understand that we might reconsider this "by default" choice and 
> move to one of the solutions you highlighted in your message, lwn.net 
> article or recent talk at ELC-E.

Hi Nicolas,

Thanks for your summary! I think with 1GB, you'll be mostly on the safe
side in general. I would definitely recommend using VMSPLIT_3G_OPT
as the default in the long run and turn off highmem on those.

My expectation is that VMSPLIT_3G_OPT may uncover application bugs, but
those should be fixed anyway, while using highmem is safer but makes
everything slightly worse through the added runtime overhead and
increased fragmentation risk. The 1GB case has caused additional bugs
because it has a very small highmem area on CONFIG_VMSPLIT_3G and
that can make it run out of highmem first. 

> Of course we plan to maintain these boards and keep updating our kernel 
> "offer" once a year for those associated SoCs (with maintaining 
> upstream, as usual). As you said, being ARMv7, we're quite confident for 
> now.
>
> As you mentioned, we've recently released one ARMv5te arm926ejs-based 
> soc: the SAM9x75 family. But we don't have the intention to use too big 
> memory sizes on them, even if they do address large screens, with LVDS 
> and MIPI or modern camera interfaces...
>
> I don't have too much info about our customer's use cases as they are 
> very, very diverse, but don't hesitate to reach out to me if you have 
> questions about a particular combination of use.
> Thanks for your regular update on these topics.

I'm curious about the AT91RM9200 part, which I think is the oldest 
SoC with Linux support that is still advertised as "in production".
I understand that Microchip hardly ever discontinues parts, and there is
clearly no need to stop supporting it as long as you maintain the SAM9
family, but I wonder how many users are still buying this part or
running the latest kernel on it. 

    Arnd

