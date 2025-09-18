Return-Path: <linuxppc-dev+bounces-12367-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A77CB84C13
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Sep 2025 15:13:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cSGL14nHnz2yGM;
	Thu, 18 Sep 2025 23:13:45 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.156
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1758201225;
	cv=none; b=mgaET6+MIUw0UfRF77niSKPyfaJhF442ZxTO6oJ7UGK0JfMCOXRNdGyeYEGIjYKdgj6dUiuwzJSBovYOwJ2btnHQXbNzDOB9NT6uWHjuJgCRhFKnPTcWyfUvDIjE3m5LbAZqQ1g+qq1vKNrlGRch+fq/ZdthL5vcUdFmq4b+MvEC8DguiuzP+SXKHArpFtdh6275ZmieH2rHr3dDCvcEId+9s5B03Qx7I2LvVzmjU3st2J57bTZRzLNPzqVu1iA1Gftyxhy9k1pE5pLR9eYpSocqCQoGn5Nq+Fy19SjK8QwDNtFRPD97AFKN6awFzKeCkVpTEBQQfGt7SKdrzYSJJg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1758201225; c=relaxed/relaxed;
	bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=EFacJj8laBYIr+tIjfuejp1CKuNKp/3iz+Jetev5THHPs1B3vq1rgB/AnqrDfCtna4HDrbEGxKJLBpBtHFuyEUiuthQ4vJZJ3C1M/EUG/KaNucQDkMGXkD6FgTkzhGwBZHU+6AC4xCfWrXgTKlp1eOptDDZmnV9EtmWVVaWxVMCcApkSboRocziYqK3J7wL4So+H2hiNSXX7UmVhEPadjWl70eyIEaA1t7K019ZH71e/KdVC3VdXZ+PaEBlT7RmVX1LqoisRpAFnnmCZNQ9JXE/B9CQzl3hmbEdMxbgK081UXcR46qxXkYzIwETbJNf3JS1uuR79t5C+clOdBu5QsA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=1ak7ojNe; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N58W3tD5; dkim-atps=neutral; spf=pass (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=1ak7ojNe;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=N58W3tD5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.156; helo=fhigh-a5-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fhigh-a5-smtp.messagingengine.com (fhigh-a5-smtp.messagingengine.com [103.168.172.156])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cSGKy5ndDz2xlR
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Sep 2025 23:13:42 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 4D4921400123;
	Thu, 18 Sep 2025 09:13:40 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Thu, 18 Sep 2025 09:13:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1758201220;
	 x=1758287620; bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=; b=
	1ak7ojNef1e3g67ZCzGe8Cr86CQBJ+FtYUUdZ98wga8fH+3vuc+RwkTppRISmifj
	TUQF2YYM9tYsbtzlw4/SjUUoGGdmMBn5Tx06zjVUjlInz+zUP3GqpAoEjzvsx869
	wddDDt+HjXSiHs17uF5aM1hYdPjyFfy6k5SzRR6jWICdWQiEVv359WWJgj132jJJ
	07v99j6h/aqeBEffHIyXve8yXE+JF2yzFo9WhjAf903RFRHGDj74a+pThncDZ43U
	cChz0t8T2JlvSu/bhlxR1hPt7TnIjh7DK2BI84tuHaRAr5IdA5Jn/e/MNKeBZUvX
	Ow885bcZSVPcmIgNRzukfQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1758201220; x=
	1758287620; bh=pLSf0bVUw5MCqJYDkX+vxsx4UdqQkDXJOmyg/3GZX6I=; b=N
	58W3tD5qawBw1eKsBN+kr6ZcUHb/ofQFbLKmLhZdv+qguzRhHYAyDLKSfwESXhrf
	aIY6l97xj+oglomqiNtEG7VTMJ9wGTjdZMtSQXPvA0EL9TgggVm3rQC5HzIiRV2m
	5xDJYwe8g7qsIUc9Kj38PQcYSOITY0LVGaKueq50doFP6bW244OFrN22sPeENXIY
	jA1EycAhUpQLSIWjFRVFE+zrgWjqWlsWl40HCwEKhwWQaCWvW/njRnEmJDgdvYsK
	zw0up4/m7eOD9/kuy1jxPa2+IOIk6ItpAJZUa8eKMXOtJiiJT+cAySSGyZ4hEycm
	gElUUMqK3gL3+zK38/pmw==
X-ME-Sender: <xms:ggXMaPqxmIxuS57jlyxuYXMmHn12czYQdlZwV1PqJq6k9KYeiwbKhQ>
    <xme:ggXMaJp_WDMqihTWUxA0KZ9pJgwdVmKsCp-Vn1fdREcdFTwl75fs0leTwW73akmHR
    JcpMICm3hi5jq9-VNY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdegieegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpefhtdfhvddtfeehudekteeggffghfejgeegteefgffgvedugeduveelvdekhfdvieen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnug
    esrghrnhgusgdruggvpdhnsggprhgtphhtthhopedvledpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhvghsthgvrhdrrgdruhhnrghlsegrrhhinhgtledrtghomhdprh
    gtphhtthhopegthhhrihhsthhophhhvgdrlhgvrhhohiestghsghhrohhuphdrvghupdhr
    tghpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopehgvg
    gvrhhtodhrvghnvghsrghssehglhhiuggvrhdrsggvpdhrtghpthhtoheprghlvgigrghn
    uggvrhdrshhvvghrughlihhnsehgmhgrihhlrdgtohhmpdhrtghpthhtohepshgvrhhgih
    hordhprghrrggtuhgvlhhlohhssehgmhgrihhlrdgtohhmpdhrtghpthhtohepshhurhgv
    nhgssehgohhoghhlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrg
    gurdhorhhgpdhrtghpthhtohepihhrrgdrfigvihhnhiesihhnthgvlhdrtghomh
X-ME-Proxy: <xmx:ggXMaPyueOXB7yEQObwBgenAb7JQTgJqnB9NOI6UKzHpBn4i9VSQEg>
    <xmx:ggXMaOPqe_O8XUcPksli8MZC-GvW0FcpQCzBR-ts3xEmFaWKO-kRlw>
    <xmx:ggXMaPyfz-9UNPjw4MTfZh2k7kwzHQF2IHlbqQH8wuFNANzoleY-xA>
    <xmx:ggXMaICP5uqRm6gPGSMpHGW8PXzZmSwLVbGztYAkXSxcjxhxDrjnJw>
    <xmx:hAXMaDehpAP39-4S3Q408oZS3Swdc4rSB0uIxx1VQvIAhJfZ8ILlFImQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 85F7270006B; Thu, 18 Sep 2025 09:13:38 -0400 (EDT)
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
Date: Thu, 18 Sep 2025 15:12:46 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Jason Gunthorpe" <jgg@nvidia.com>
Cc: ksummit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-mips@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev,
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
Message-Id: <02b0f383-1c43-4eeb-a76f-830c2970b833@app.fastmail.com>
In-Reply-To: <20250917125951.GA1390993@nvidia.com>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <20250917125951.GA1390993@nvidia.com>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 17, 2025, at 14:59, Jason Gunthorpe wrote:
> On Tue, Sep 09, 2025 at 11:23:37PM +0200, Arnd Bergmann wrote:
>
>> I'm still collecting information about which of the remaining highmem
>> users plan to keep updating their kernels and for what reason. 
>
> On this topic of removing some parts of highmem, can we say goodbye to
> kmap_high_get()? Only ARM uses it and only for
> !cache_is_vipt_nonaliasing() systems.

Good idea. I think we are almost there, just need to verify that
there is actually no impact for existing users. I already knew
that there is very little highmem usage on ARMv6 and earlier, but
I tried to recheck all platforms that might be affected:

* As you say (and contrary to what the code comments suggest),
  all ARMv7 and most ARMv6 systems have non-aliasing VIPT or
  PIPT caches, so kmap_high_get() does nothing, and we could
  just turn it off for those configurations.

* ARMv6 with aliasing VIPT caches exist but are fairly rare,
  and I think there are no ARMv6 machines left that actually
  use highmem. AST2500 is commonly used and has aliasing
  caches, but I only see machines with 512MB or less, and
  its aspeed_v5_defconfig enables CONFIG_SMP (for AST2600).
  OMAP2 and realview are in the same category but less
  important. imx3, s3c64xx and bcm2835 are non-aliasing
  (and don't have highmem either).

* VIVT caches are used on all ARMv5 and earlier, so removing
  kmap_high_get() would effectively break highmem these.
  Most ARMv5 use very small amounts of memory (<256M) in
  a single physical address range, so they are unaffected,
  we just have to go through the ones that are left.

* Intel IOP (armv5 xscale) certainly had highmem but was
  removed a while ago.

* Marvell mv78xx0 and kirkwood (armv5 pj1) were fairly
  powerful in 2008 and could support at least 1GB of RAM,
  but I only found one machine (OpenBlocks A7) that does
  this. It's unclear if anyone is still updating kernels
  on this machine, but they could /probably/ use
  VMSPLIT_3G_OPT if they do.

* Microchip SAM9x7 is the newest ARMv5 chip, clearly does
  get kernel updates, and the only one I can think of with
  DDR3 support, but seems to be limited to 256MB total memory.

* The Gemini (ARMv4) platform enabled highmem as part of
  commit c12d7e9fe9af ("ARM: defconfig: Update Gemini defconfig"),
  but I don't see why, as the machine cited there only has
  128MB of RAM in a contiguous chunk.

* A few ARMv4/v5 machines (omap1, davinci, ep93xx, clps71xx,
  sa1100, riscpc) used to select CONFIG_ARCH_HAS_HOLES_MEMORYMODEL
  or SPARSEMEM, which would indicate that they might need
  highmem even for <1GB configurations if their memory banks are
  far apart in physical memory. I checked those and as far
  as I can tell, they are always within 768MB or less.

     Arnd

