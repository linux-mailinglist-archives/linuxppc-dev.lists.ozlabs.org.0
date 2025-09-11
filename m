Return-Path: <linuxppc-dev+bounces-12027-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 28E64B52AAA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Sep 2025 09:55:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cMqcV68D4z304f;
	Thu, 11 Sep 2025 17:55:54 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757577354;
	cv=none; b=nR4p6WATMqDkCAyH/SMXa12LF41xxnzhcR3Q4ETO+Ttn2agRvKw6/aqDeaJrW/TzxuznCl2hbNP4mrTLhNX02ezDxreHb5PUtJCDrGdLtTIIKToq1aBlRjYQshfB/fxLUq0vhPotKgTMlZtI6eShg8QvYY0LxQXvHX+U525c/u0N59yIHXu11tgR1fGc9y8eey8PahtDLd0EgTYyAocDMiG4snbHMOe6JLZEDOhpb2FEdAzI5PBQysFEHATWSdVBEu8FzwYD+h76ycFNkpuP4l7tQbcNONQHAjjP3JQLBpcYizM+TRGVCg2LUmAKoq7DhbE8B8hYpDvl0RtU1qRHsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757577354; c=relaxed/relaxed;
	bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=Lwf3y3J2GAebBuqNIYfmmT281k0TAn+NbHIAKJEX+GxEmajxHJihK2RW8e0coZzX6KLxG9Dxhc+a93IeS9IBR1zYXMslMIRaE/Z1CmADDOvGKJGuDOYN2bKM0AIReKssLFIjdM3wi4qOqOxgEfkKHP74QaI/qM7wAOHXB4hnMBv4nDe4QHQug1fGsB0IHc+ifSZqRDUTLbYjxBm4ILFP+BhCFL/xX2js6tHWtouqTW/Vji5PEzHpxk/eWYhmBNY/sm9gLz+7gv6BYu7Q5XnSyKCcuvZfOL7fhJGndRMozgAmu4yI1oJfZHsZA6wer1BtwO/0kz/H5YPAbowL9jylGw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Iu/xuWao; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XIlM4cTN; dkim-atps=neutral; spf=pass (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Iu/xuWao;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=XIlM4cTN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.153; helo=fhigh-a2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cMqcR3KnXz302g
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Sep 2025 17:55:50 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 612031400147;
	Thu, 11 Sep 2025 03:55:48 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 11 Sep 2025 03:55:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757577348;
	 x=1757663748; bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=; b=
	Iu/xuWaoII7KNzuVcloK0wQmhd56+d5wX0Bleltp/a1sZa3XhGzX/yG9JsPSkl/7
	2cu0Mu9lmvGcmqeKU6/KrMP/1aCgzIef4N/ewbqrmGkduxdjqLHlEalPav5le4TA
	+jbgQ1Z+mvU5GokUwPzbGIhEj3HxlMneK0jBDzXQV6kMI00VxiXlnhook7P+C5Y7
	UriP1BgBZbVa1zMIyagjnMw+2sY7iskhAR0+3srbSjSH0y3Yg7G1I2wCRXsEXXYs
	8KS2JECjFLMhfIZNMjx0egOaiCksw2shqo/EvFx/UtUO1SZUtqDZzPy4b136cHwy
	fnHZvT9pGYqsuKxHDCD1Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757577348; x=
	1757663748; bh=xezEPREPJQkkrl73Yff7UEqumVCaWAif9r9fc2gAvZU=; b=X
	IlM4cTNCufTDuTwE3rh5KIXiSVCwiy8YX9A8fo53sWQ4p2TKGrlQ/9DVCBOHTBG0
	ffEsLPh+36l9na0nrD2CgxP/dy96GoNkRtEQRzG5aK6nn56aYQGtYTO9P7Y8UiUs
	an20A9oCUfkbsypc1JODoplvQuBjF8st8s1x31lQ2U0SYE4Jn1XlEMxhnjGHJwJg
	CNtYItDmOsxdBDmvbtNp8EHZzfn0AGkDnlRRUoNT54QTlsnpmjuslvLqJymldyuB
	7h+E3hJYEoPPv37Hpq0Dkh4acaBuHq9oAPE4oR1s4jxxyqb8Wde0k9toW89TrDKm
	U4uNM1J+ErI42a2u/TYQg==
X-ME-Sender: <xms:goDCaKLlbLhafX1ItUb5fO7F7xQAPgD71xlygMsk3wgbEP7eJM2VEQ>
    <xme:goDCaCJu-9GwvmuDVC8Y37QomJEPe0pHbKXVqPPiqeh9QFxf908KEUF8un4MQt4Yp
    DHkwlYQwPBqiaQ5cv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvheeivdcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:g4DCaPln0xPi_AdWtVR-mPv6uC8M-3Q_mjf16Kd5LjcVVSzFRbJ7CA>
    <xmx:g4DCaDlZzyLWYRlZII_JRVLfe6viWHF9oK_S1UNgWncQPOR1vmL64w>
    <xmx:g4DCaJdy81733zjxS4Q3r5w2j6PHhciLt1QMfw2trLXRldoMsUuYcw>
    <xmx:g4DCaJIi6RXGIaczaDEPnKMDiC-8AkssR85-snNhqeii8rn1LFIfJA>
    <xmx:hIDCaH7vVqOM0fbJf4funeExzGloqdRoMAB7v2eOhCknP0mHQleXCcBx>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D083E700065; Thu, 11 Sep 2025 03:55:46 -0400 (EDT)
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
Date: Thu, 11 Sep 2025 09:53:45 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Andreas Larsson" <andreas@gaisler.com>, ksummit@lists.linux.dev
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
 "Sergio Paracuellos" <sergio.paracuellos@gmail.com>
Message-Id: <363853cd-7f10-4aa9-8850-47eee6d516b9@app.fastmail.com>
In-Reply-To: <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <5d2fec2b-8e59-417e-b9e6-12c6e27dd5f0@gaisler.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Sep 11, 2025, at 07:38, Andreas Larsson wrote:
>
> We have a upcoming SoC with support for up to 16 GiB of DRAM. When that is
> used in LEON sparc32 configuration (using 36-bit physical addressing), a
> removed CONFIG_HIGHMEM would be a considerable limitation, even after an
> introduction of different CONFIG_VMSPLIT_* options for sparc32.

I agree that without highmem that chip is going to be unusable from Linux,
but I wonder if there is a chance to actually use it even with highmem,
for a combination of reasons:

- sparc32 has 36-bit addressing in the MMU, but Linux apparently never
  supported a 64-bit phys_addr_t here, which would be required.
  This is probably the easiest part and I assume you already have patches
  for it.

- As far as I can tell, the current lowmem area is 192MB, which would
  be ok(-ish) on a 512MB maxed-out SPARCstation, but for anything bigger
  you likely run out of lowmem long before being able to touch the
  all highmem pages. This obviously depends a lot on the workload.

- If you come up with patches to extend lowmem to 2GB at the expense
  of a lower TASK_SIZE, you're still  looking at a ration of 7:1 with
  14GB of highmem on the maxed-out configuration, so many workloads
  would still struggle to actually use that memory for page cache.

- If we remove HIGHPTE (as discussed in this thread) but keep HIGHMEM,
  you probably still lose on the 16GB configuration. On 4GB configurations,
  HIGHPTE is not really a requirement, but for workloads with many
  concurrent tasks using a lot of virtual address space, you would
  likely want to /add/ HIGHPTE support on sparc32 first.

When you say "used in LEON sparc32 configuration", does that mean
you can also run Linux in some other confuration like an rv64
kernel on a NOEL-V core on that chip?

Aside from the upcoming SoC and whatever happens to that, what is
the largest LEON Linux memory configuration that you know is used
in production today and still requires kernel updates beyond ~2029?

      Arnd

