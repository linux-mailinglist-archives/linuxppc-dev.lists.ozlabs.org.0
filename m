Return-Path: <linuxppc-dev+bounces-11993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9640AB51B25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 10 Sep 2025 17:14:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMPNz1WFWz3dFw;
	Thu, 11 Sep 2025 01:14:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.159
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757517267;
	cv=none; b=QMOemojRlk9HqRdILAarpYhucDxAU69CDt7HqKXqaWdMlJX7UPT0vMWy27pMbqkFwD/QxS7+D9FKiKO0hprQzM+C8Mio8sEmeVQKXaTCxaEkcOYmmhPtPPeu2uL9PfkNGr/upagNn8Xqe76GSN3Gd3vmqtv4+zIg5MIhQxTEOiN6dj9FsSPV7u18Lbf5jLVtkzfkpMiewT/X6vttoKnTUVsbsG8zUp95dLJ+VtHt00bdwIrrGlwF8cibMvXMsmpaH+Tm7d9huFIbmTn/x4W+YLZi7jMdjzic1xuCu6fUG6WosYG/dp8w73p69Mlx47u7bG4ILUwDUpWkFMHInz+eSA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757517267; c=relaxed/relaxed;
	bh=lsUUzVSssKb2ZuGuZgzggTzESfnxgxP19f0NGhCBk2A=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=DZXwzYT197N8KpsBbUXReLR76wPyQfQsQiLo1fyeIk6AIBCslNDVGEXHAewH0puh0zaXU1uPAtmGZzqfzWJN6JJU68q45TgNWMl8C0POfZBnd8ZnpaQxjGtBkVJ+/HBhLdS1SyPZL8+981LoonTPef7stT7cwR/LgiULSZyNEMEWtZywf0aAmqHL6crdShXF46evZGhF1huYtS7p3VFikJO4ENdJpdzKFfCXVk+YICk0It5aTF5pVTID/IgiD+LL8GJq1VovEVroWMRrLnzYq/gO1K64p4g3a5V4ObDSfFZGAVLwNAqiIdiVz+Bzis90+VuxR/wG7rXd67Nn0nBr8g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Wt3vFLdg; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H/gMzN7T; dkim-atps=neutral; spf=pass (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Wt3vFLdg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=H/gMzN7T;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.159; helo=fhigh-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a8-smtp.messagingengine.com (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMPNv6B8cz3dDp
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 01:14:23 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id C49A01400375;
	Wed, 10 Sep 2025 11:14:19 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Wed, 10 Sep 2025 11:14:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757517259;
	 x=1757603659; bh=lsUUzVSssKb2ZuGuZgzggTzESfnxgxP19f0NGhCBk2A=; b=
	Wt3vFLdgaWOIw3mFFTO8HkI+FL3aLrAvk1XZkFPK029w4p9kIsmeNNXR2doMLfc2
	NQaimD6tWSMhyd9vrBwpPql7GPen65eFUN6bOfqTcjaYKQTvFwR3Tilc07C6ExJ8
	jmxdK+IoR3hnYmXzQTnYg/t2INRTwDKScAAC5Zh97EJg6FK42wOtjxbJQG0rbqtx
	vb435sW48hCiGaDmkSb48ej0GWsn5+SI3ezoINWNC9Mi29MHlc2MYgDudDq3vQpI
	E3JHV5FX9Je89nP69A4JyLOdFZEUPLOsF/5GLJ2vjV5NifsecRQsRhBZHOY5Wy9x
	jt6rDjYilo0TVNJQvnJkTg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757517259; x=
	1757603659; bh=lsUUzVSssKb2ZuGuZgzggTzESfnxgxP19f0NGhCBk2A=; b=H
	/gMzN7TnwJd0vg/MTYVl/pyoe/hmyfwJF4mtR5JWM0w21EGmDqzYq1IsTdotAh60
	Fmd1Vg+SdRbChBFHMrAKmV4sr5AgLPgZE/hNEG3iugSyvyKHaye+uflCyTVZE7eW
	y5OXjXOMEmKkObNDMRZmLutp1NrnRb+HXmB/4TDEu05TLasJXe4OYpexHWqlypFG
	f5UGmGv6/ug4tXqoJzn54aHwEZlvC1X/XhFICwEees+qOB1PMhCXSGFdzGOeVRCA
	AmHdT3PYzk6ROQA/RcaMy/7tVU36ZMliytCzRpQYn6smIPsw/Gu6lhjsbjgbm1PQ
	nnukP2hsdOVcW4iab733Q==
X-ME-Sender: <xms:yZXBaDXOlmIombO1szwOlmpXbQqLOdZRNKdHj8DHhLwnjgybvVtD3Q>
    <xme:yZXBaLmGS84fPQjmk21XEVQnEGpISmEP8_Uye0ca4ReQR3HPDWjwuZEIYxBFYNeqB
    zTGP6WvYL_gjS6k-qc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvkedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:yZXBaESgMqAfocAh5WwsNKvYXczfu7UTStKzoEZ_LOyYB88gFCsczQ>
    <xmx:ypXBaMq8oJRxVm5-KPXU3p6LapKK9VSGtugiiL7OXrTltECusc88CQ>
    <xmx:ypXBaCy-TVZZI6VvKyzbCn9-qbN6vjLZQvQ8eH7rWv4q8MqywpKQ7Q>
    <xmx:ypXBaPDeWwsS_0RafF3IO58JfOjBv4WASYIgwgXNH9S2I7eVRXv1Nw>
    <xmx:y5XBaNu8n69vsZmygvax3BlNn5O-QH6oHbeKtp693EevppGTS0Ykwx7j>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D18B3700065; Wed, 10 Sep 2025 11:14:17 -0400 (EDT)
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
X-ThreadId: AmcCJOTBQ5ho
Date: Wed, 10 Sep 2025 17:13:57 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Matthew Wilcox" <willy@infradead.org>,
 "Linus Walleij" <linus.walleij@linaro.org>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Richard Weinberger" <richard@nod.at>,
 "Lucas Stach" <l.stach@pengutronix.de>,
 "Geert Uytterhoeven" <geert+renesas@glider.be>,
 "Ankur Arora" <ankur.a.arora@oracle.com>,
 "David Hildenbrand" <david@redhat.com>,
 "Mike Rapoport" <rppt@kernel.org>,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
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
Message-Id: <55cbc329-4b14-4f62-90bb-1e1007cc1152@app.fastmail.com>
In-Reply-To: <aMGFhuHyQwtwyF7B@casper.infradead.org>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <CACRpkdb=E-_6fZ+4mX5FJas9C5Njp3Gwrygs-cAfWNdbP594cw@mail.gmail.com>
 <aMGFhuHyQwtwyF7B@casper.infradead.org>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025, at 16:04, Matthew Wilcox wrote:
> On Wed, Sep 10, 2025 at 03:10:05PM +0200, Linus Walleij wrote:
>> 
>> This in practice means the area 0xf1000000-0xffffffff
>> which also includes the high exception vectors that must for
>> natural reasons also be kept in the mapping.
>> What we have mapped today (all of the time) is
>> 0xc0000000-0xffffffff.
>> 
>> A minimal 256 MB mapping from 0xf0000000-0xffffffff
>> should be able to cover this.
>
> Can I ask where the MMIO (PCI?) window lives?

That 256MB area is shared by anything the kernel can access
directly, other than the linear map: vmlinux, modules, vmalloc,
ioremap, vmap-stack, etc.

This is mostly unchanged from the tradtitional layout on
arm32 that has the same ~256MB limitation, though it does
get a little tighter because .text/.data is now also
mapped into this space instead of executed from the linear
map.

      ARnd

