Return-Path: <linuxppc-dev+bounces-12528-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8404AB935D8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 22 Sep 2025 23:23:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cVx0s19plz2yxN;
	Tue, 23 Sep 2025 07:23:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.150
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758576189;
	cv=none; b=jVTLa/TTRkHPpnEzSdyvOCyAcpSEvciOQ/tcwx+naNlg86iShnUeLGIK60HhyzqAskcFry2/r+9AfPGLrlc/Sl/Bav2BIjViPdkJVdzH3Ad2pM14rrfz4AoeghiILVSxetOUWfKwp/l3hj9q6J5yuRyV0xLMONjdibOAasBm4xXIHMVkRYqN3qZj7nHOs3j2eEqA3ekZ/dHGJBkTND/2tHwrHxwLdzvjE/rfaUv7IYFNpoiZUE3Bmd9lcvvL2V//4rDBvffJYGNTgjVpv6Y+shtZkp3xbLdiT8RvGhuPNVhQpRp6vtu1ySVC/Q9t5T8jAxPzXQsL7ISQwsH/PRRr4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758576189; c=relaxed/relaxed;
	bh=Di8U+yHpW9PWxGMprMpa0qfyAiwc5nChUHQPZxjrHH8=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Dui/bN2+1gDXd8yFsUX8bjepTKNb3OqHRTe/cam/WPliVJNcHScNpAs8MyBtvV7XFZxN/+hMGNIl/ckhaa4ONScv2sgpK93E2oXLmlQ9sqHHR3laVlDHif5kS5gpODYVSdKi9S1KqpmuaM5nv9/K+kV6KHP7X2tKKFpiUKFWHKC5MVd7AIxSPVQN0U9SrajQRzy62eMhyX3zJF8veIWa4vYz6Ens9tybmp2BiD1/pZOy90H4q2YPl1wSHszmaOS4YWdzlZoSHhSPfMAPiRvttT80a3iut31q7ahFTl4A9U8SelmVftfuGwk44xJ3c0geI7qdxDGZSHGFB+Kv6uGjPg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=BOU6mVcT; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gmHBoxtT; dkim-atps=neutral; spf=pass (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=BOU6mVcT;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=gmHBoxtT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.150; helo=fout-a7-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-a7-smtp.messagingengine.com (fout-a7-smtp.messagingengine.com [103.168.172.150])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cVx0p325tz2xnt
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Sep 2025 07:23:05 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.phl.internal (Postfix) with ESMTP id 97915EC0301;
	Mon, 22 Sep 2025 17:23:03 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Mon, 22 Sep 2025 17:23:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758576183;
	 x=1758662583; bh=Di8U+yHpW9PWxGMprMpa0qfyAiwc5nChUHQPZxjrHH8=; b=
	BOU6mVcToMxa6qFUiC6cht0bV05a8ANyKR5ukskNj74Kgap+DqTUaWSu+IKdFe3l
	WRpUM30Wu3H0Q7A2y/voOAEVMz1ItWGdFd+w1g29YJ7Tjl2aT+hQdsIjBYzOSRat
	P6tosIN336s/ecXEeQ/mGTufNXrxc6oPikF3ykV/4Wx5E6r8XKZkcW5rH07dbYAi
	hVS+ZWgjs+wGKwhWw9MlR/A61u1V4gi072jORA/RDnj7Nu/QRBfiadbi2FwamY3C
	z1g3eaCmC+6ZV0VO36eJ9rA4ai9KBUyUl+kX8rwbdvVby3ynOJZk+yOUH9dNivMj
	J6BkZ2jlIo5ZNgAXnGA8VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758576183; x=
	1758662583; bh=Di8U+yHpW9PWxGMprMpa0qfyAiwc5nChUHQPZxjrHH8=; b=g
	mHBoxtTQev5hHzzjS7DzOG6LjQc2O42dSxLb4L6WQb2WlRSURFQb5PpcuBN2HTms
	62d99pLVtJPUCF7OT5ICVSqlboyOqdGHXJIUax+oI0O3IgOolDGEnOWayvlw19bk
	GTctlMrBtCTrn15fz5C78bks5N4t7sTFyuHhpbp7bypfTbN9jsFm7miJXebzUTbu
	GkBm5/mf2z9Lam8hkmNkaZhD/Aa8ufZ9KIVP69Ld+kkRg/FCv7kH/PRqbJ/kSgjT
	Ys/j3Va2f5abW1fJBGV59q3b0QcV6n8w4sBB+Pm5+Jpany6I0MqmylWHR2hKS/7W
	p6MNsjIRV0fcgvwbafw5Q==
X-ME-Sender: <xms:Nb7RaHIv0elNNGqKqz2hq59PlbQ1WvH3PQekoKoYN6GHdrkbplcdZg>
    <xme:Nb7RaF9zWPO1z0eI-85xdehQcHCJ4U-ixtIweYwspyjZNwYzs6sJyQVkn2QKVroo2
    tuHZCnZ7Y6hRCAk3yvZYtO1xCbsZ8geow9JBfeHT6Z-a8qAnaICeO8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdehkeelvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopeefuddpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtohepnhhstghhihgthhgrnhesfhhrvggvsghogidrfhhrpdhrtghpthhtoheprg
    hnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvggvrhhtodhrvghn
    vghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghnuggvrhdrshhvvg
    hrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgihhordhprghrrggt
    uhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgvnhgssehgohhogh
    hlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:Nb7RaHyj4-U5cmLtj8aV6Obmj2wE8qDHFtnv04wApvnSKRdpvOTwyQ>
    <xmx:Nb7RaPNEf6QOHCcg2sOwG2YcDZEDgMATtieOS7b2v4iNsq7NAARQhg>
    <xmx:Nb7RaM7LJ7xoeWbjkfv203dQeqEDMpWgwtURBYX5yI5dIc7-dM-KOA>
    <xmx:Nb7RaGcvvcBerj7e35_eqxKXMQdHMfkXoSuoEeKpoVO0WLLALUm55w>
    <xmx:N77RaF-PoW2bovyuykM0k5mv84evTeZMjlxPQrSMV7i2vSrQZNKLFHZX>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 2385C70006A; Mon, 22 Sep 2025 17:23:01 -0400 (EDT)
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
Date: Mon, 22 Sep 2025 23:22:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Nicolas Schichan" <nschichan@freebox.fr>
Cc: "Jason Gunthorpe" <jgg@nvidia.com>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, ksummit@lists.linux.dev,
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
Message-Id: <598ab56d-7dd0-4adb-b0fe-30ad5cf24335@app.fastmail.com>
In-Reply-To: 
 <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
 <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
 <CAMuHMdVecUeLZ2LPpa457C0a=uduvDhQ4KZJx-++dEFJraRi3w@mail.gmail.com>
 <547dcb81-434d-4910-aa7c-1d69019fcb3d@app.fastmail.com>
 <20250919143436.GC2132010@nvidia.com>
 <44f910bf-ac2c-4b2f-8e50-5cfc7dd0761a@app.fastmail.com>
 <CAHNNwZCsBY+ta2-OqD40K0-C8N25PLMYfOJowiVeaEMotqR1nQ@mail.gmail.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Mon, Sep 22, 2025, at 19:05, Nicolas Schichan wrote:
>> On Fri, Sep 19, 2025, at 16:34, Jason Gunthorpe wrote:
>> > On Fri, Sep 19, 2025 at 04:22:20PM +0200, Arnd Bergmann wrote:
>>
>> I did get an email from Nicolas Schichan (added to Cc here),
>> and he is still supporting a widely deployed Kirkwood based
>> platform that uses 1GB RAM configurations. He should get
>> a chance to test that with CONFIG_VMSPLIT_3G_OPT, but I
>> would expect that to continue working, possibly with minor
>> bugfixes.
>
> We don't use HIGMEM on our Kirkwood platform, we are happy using a
> 2G/2G WMSPLIT. We don't need a lot of virtual address space for
> userland, and with the 2G split we don't waste physical memory.

Ok, good.

> I'm happy to test your patch serie with VMSPLIT_3G_OPT and see if it
> still boots with it once you send it.

The patches I did for turning off HIGHMEM on ARMv5 won't have
any effect if you are already running without highmem, so I
don't think we need to wait for your tests specifically.
Any testing would be useful of course just to check that
everything still works.

Jason, I think we can go ahead with your suggestion. I can
post my patches for review once I've done some testing on
them.

     Arnd

