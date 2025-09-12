Return-Path: <linuxppc-dev+bounces-12075-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03CD1B549DD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 Sep 2025 12:31:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cNW1j4PtLz3d1B;
	Fri, 12 Sep 2025 20:31:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=202.12.124.144
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757673097;
	cv=none; b=m7na1zMdT3MNtULnaSc4ar5u7fpAwt68NkbydB9cgW7IDGYMVE88TAmWtagW/Yp6b5e+U9ctL4p4/3ib+GmIaoF70FtkwfBKB0VCj8Hcv0bGJNS9hFnupvCAoWWyJo+dU4d3y7cf7vkFK/XN7BXQu3KaiAmp6q3RcgwI+/ZqLAWM9QCOlz1NyELK4rsgsAXewvmk2T8LW2J9ECa5LTJjYmCtkoPMMBlk9k8R7m5mTA2N9APUnJdTqBGKxWkMP8YTyl+dRSZtC6lfcsQfCKDBzaHxVIp/wC3lsA1Pe6YNmGh0pOBeZyyP/WV+TmH2uMDwGpclVAL4/3Lrb26wnZbQAg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757673097; c=relaxed/relaxed;
	bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=on/LWn8vBiGLMSDgvEPCW04GVyEzfh3KrZGsYs9OytyjFB77wlsdqSXV4VD91QrrEMrn+x0hkGo26HfRW/vJH5bNEb5+5/SbtM33Hkh5EoL/yLtJLB1hMOEEUbo5+3inmOI77tFhgF+siVP8ERxpOLtJmJX0FqBX8RGkmUbHu//BY9oWgwdkmkmkSVqaF883sj3BrMJkI7DxtYt7YQ18KycgQQ8U5VeRiGLzErAxS9eP8ZofXbnYfmTOWP/vFjzrXrja7v/cOyZZeY5Ifa3lRyLs3onGE3QsLGwk0FyJTFyhXp40XkmRJT3JNiuUupKUS7hoIuaz7SKzQJ1NqH2NdA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=jT0WwhhK; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=k1vyC6rj; dkim-atps=neutral; spf=pass (client-ip=202.12.124.144; helo=fout-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=jT0WwhhK;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=k1vyC6rj;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=202.12.124.144; helo=fout-b1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from fout-b1-smtp.messagingengine.com (fout-b1-smtp.messagingengine.com [202.12.124.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cNW1g6hdFz3cnZ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 Sep 2025 20:31:35 +1000 (AEST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfout.stl.internal (Postfix) with ESMTP id AED0D1D003A5;
	Fri, 12 Sep 2025 06:31:32 -0400 (EDT)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-05.internal (MEProxy); Fri, 12 Sep 2025 06:31:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1757673092;
	 x=1757759492; bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=; b=
	jT0WwhhKNltNjX6oy1wi2+oKiJaYylL7esPneJwhFB9N0maSA8KhckfKJ6NnZQXz
	bYSKUzEJ1WD8GBoOttQ4k4McWa7PUuOpoj8s0jC70raXwNw+Joio585FI3WnZjbl
	x3pSTwt/PxqKxJ9lJ31N1oKIcXKJBT4zXz+pCyvFVjV9Kraw9dayg9sb9jRwV+Nw
	ZCwIvDwoMDizk5Oy4w5Fq4PGMoCfY9L/WG+9W9or8bVbia9mvqlXoeo2P0NR+JgN
	5c355lhHhH91mQkZARqOAP1UqOJCYuCPS9yuex3K/8pU9ahBPN8OBiub5LCVDUWa
	qZJfE07pcyZBzcIZ+mGBAQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757673092; x=
	1757759492; bh=ZnTz2gc51WJkMzlk/mlrEsU7FqUmmq3NOjbYK7bSYp4=; b=k
	1vyC6rj2xmNIeSXoxg3bvnTWj9wX83aGkU2Em5DF79HTuHrMRkI/xWw7759LQ+5B
	bkcvjmV9Qcxb5zeuIlTgRw5J7nFj1ieCipA/jEvNGwd6HN40RiueQR16QHBzDb8h
	VtUVL9bF9ugklG9UPWPwK1OXzf1y5zcSOVT/aIDSE7/tpO+qIxlm036IloNQ38vX
	GYO835wCXejsuEjw7jRJxt+JFUijm5OA7IcHo9Ic5uxJrBm8P5nGWjGtURshGLI/
	Jm0wr8SJkFo/frJJBMF0lfIbNHl9FUpWia57G4LZzDDKNpmKp6M9YMb4iODMRpV9
	KmdcZMWP9FzP3F+KYOnRg==
X-ME-Sender: <xms:g_bDaJkb4BCSIXaN20hGGvDbpq_uYHUfXJVkDOB_mVGTfxamBLbrCg>
    <xme:g_bDaE1SOe8uQM2xOpAvalLtJNFp4-tFiBJJg00LzpboZKgRb_HiWpnQAMxIFtxov
    Y9ewlkME-ye5_zj9pk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvkeekudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthhqredtredtjeenucfhrhhomhepfdetrhhnugcu
    uegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtthgvrh
    hnpedvhfdvkeeuudevfffftefgvdevfedvleehvddvgeejvdefhedtgeegveehfeeljeen
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
X-ME-Proxy: <xmx:g_bDaFXJUTCPg8Gg2uXGQ5RgMU0uaHD5VVXSZgwboz-q7ftAYqBd_A>
    <xmx:g_bDaH89g0FuTDFfLJztpjIor2KN7O4LrVLiR6mLfjS9st6ed4KczQ>
    <xmx:g_bDaKpKyJokmXH4ARM6vTbfA_Kk9jW9MQRMrRlbx2LKjFb1x4w1Wg>
    <xmx:g_bDaLcx1abt47vng-9Brf4PakpSJA5ATOGTsoYy2HXs2gu4PoxW_w>
    <xmx:hPbDaDl4p91INzeg69byU-AorUJTlq5vFDDCdsqCRc1puYq7VFqbSjGD>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 9ED19700065; Fri, 12 Sep 2025 06:31:31 -0400 (EDT)
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
Date: Fri, 12 Sep 2025 12:30:59 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Richard Weinberger" <richard@nod.at>, "Dave Hansen" <dave@sr71.net>
Cc: ksummit <ksummit@lists.linux.dev>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 linux-mips <linux-mips@vger.kernel.org>, linux-mm <linux-mm@kvack.org>,
 imx <imx@lists.linux.dev>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
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
Message-Id: <4fcd272f-81e3-4729-922b-588ad144e39b@app.fastmail.com>
In-Reply-To: <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
References: <4ff89b72-03ff-4447-9d21-dd6a5fe1550f@app.fastmail.com>
 <497308537.21756.1757513073548.JavaMail.zimbra@nod.at>
 <dec53524-97ee-4e56-8795-c7549c295fac@sr71.net>
 <640041197.22387.1757536385810.JavaMail.zimbra@nod.at>
Subject: Re: [TECH TOPIC] Reaching consensus on CONFIG_HIGHMEM phaseout
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Wed, Sep 10, 2025, at 22:33, Richard Weinberger wrote:
> ----- Urspr=C3=BCngliche Mail -----
>> Von: "Dave Hansen" <dave@sr71.net>
>>> Even with a new memory split, which could utilize most of the
>>> available memory, I expect there to be issues with various
>>> applications and FPGA device drivers.

I also remember driver problems on older Marvell NAS systems, which
we never fully figured out, my best guess in retrospect is that these
had devices with DMA address restrictions, and if lowmem is small
enough it would always work, but any lowmem allocation above the
hardware DMA address limit would cause data corruption.

A similar restriction exists on Raspberry Pi, which can run
both 32-bit and 64-bit kernels. The workaround in this case is
a combination of:

- correctly representing the DMA limits in the devicetree, using
  the 'dma-ranges' property.
- enabling SWIOTLB (which is not enabled by default on 32-bit
  Arm without LPAE).
- Using GFP_DMA or dma_alloc_noncoherent() allocations for
  streaming buffers if possible, to avoid extra bounces

(documenting this here, in case someone tries out VMSPLIT_2G
and runs into a similar bug on other hardware, I expect there
may be a few more of these, though most hardware should be fine)

>> I'd be really curious what the _actual_ issues would be with a
>> non-standard split. There are a lot of "maybe" problems and solutions
>> here, but it's hard to move forward without known practical problems =
to
>> tackle.
>>=20
>> Has anybody run into actual end user visible problems when using one =
of
>> weirdo PAGE_OFFSET configs?
>
> In the past I saw that programs such as the Java Runtime (JRE) ran into
> address space limitations due to a 2G/2G split on embedded systems.
> Reverting to a 3G/1G split fixed the problems.

Right, that makes sense, given the tricks they likely play on the
virtual address space. Are the 2GB devices you maintain using a JRE,
or was this on other embedded hardware? How common is Java still in
this type of workload?

Another type of software that I've seen mentioned struggling with
VMSPLIT_2G is web browsers, but I don't know if that is a similar
problem with a V8/spidermonkey JIT managing its own address space,
or more about general bloat exceeding 2GB of user addresses.

      Arnd

