Return-Path: <linuxppc-dev+bounces-4840-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCFDA0590F
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Jan 2025 12:03:42 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YSlQg6bVBz30Ts;
	Wed,  8 Jan 2025 22:03:39 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.143
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736334219;
	cv=none; b=R/5MF6GWB8cHyBNilJYWa0jXw0+YFVXI526Wl27z7avSA+Z5d9tvJS/yp7wIOkXvdQGPwmoWZOiPDX1lMbLPXlkXtwlRuxz/i3A5n2Yry7CgIlRgMMdgKw107mpSRPvTfvOJa53VlgRMXkTIKvR/Lwaf6TbXGuMakEISahy+YM4l8fxHgnTHISstu6AKF+jtESSHpUqXpaYpew/WXJWhqhTPeuX1cjja+5KnGNsJJ0i2Z3xN75J2a7rnAgeqcwkt+uTo4y2NQRPKNytTxcfh565aacxEJdfpy1WuLq1oCjLMcFrNIQS+ScdyXhSsc3Sm06ubj1PHjIT6GANh+BSt0A==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736334219; c=relaxed/relaxed;
	bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=duHg0b3vx+Ki8ZoL/vGt1qyuI/aZhXfEQ/FNUFj8w/WCEJNDbBCAePZ9BBh+IV5gmnvLFoZLG405CB5OX2+EIWpMPXr1nV5AEz4kPQkweFjrPNtJzim9BHhVQqPIGTHWHd27p60GiTTVfp5G/VUwbgudectDL2F2GPX2E9yaWKbtE404/fNVUmx4YWG14VXv2Ocq5zGkNmT4YnCiBhpMeMUJrb2XilPWHALLWXVm1QmM0shFkU8PsEAOKc87o+8oREtGFXPkY7JprsWVVzsjHzppeT6VEZbtK0Fd9TG8UlP8QRfHXQsoFs1j0Fd0k4zuIJHIoM8hCo/iguMBq6QKMQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=WtLL9WZ2; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/vtRZnO; dkim-atps=neutral; spf=pass (client-ip=103.168.172.143; helo=flow-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=WtLL9WZ2;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=J/vtRZnO;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.143; helo=flow-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YSlQf4mP3z30Ss
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Jan 2025 22:03:38 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id 9F498200F91;
	Wed,  8 Jan 2025 06:03:36 -0500 (EST)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Wed, 08 Jan 2025 06:03:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1736334216;
	 x=1736341416; bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=; b=
	WtLL9WZ2meLEVZxmli00VbYv11fhuBGMZp6eU19+LeFOehXBLGesRZh6foqHtbE0
	V/ZqVr7QGvKNjvIMaFOQQl8fHSHaAhWG2taHOBszb/Sq7XFaSAS+D+pLnhXcVEEG
	9uyMw7CSg+NAiw+pzvO8CUfpXLlE91al0J72AFbo+shTsoaTlWzfYiYt52iZtCKH
	nmg1mZoSHgDk3xnOd214hOZwMr6vTagL9xQJIQro8s2DanAm9Tm63iTfM6HbNZuz
	uvBZuyu1aKoZY4Uun5qOYSYCCWF8j7+i6EXN0AHyCHvZTaUYT731+4yKtq/aCUfm
	vzKDj0eDWfWNK9Xi1Q5X1Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1736334216; x=
	1736341416; bh=USnfbtjdzJEK9gukpGljvTqxb7I/7Fqgvuzbz7iTWaM=; b=J
	/vtRZnOn2Upyqb3fRTIONUj6WwtelA9l+iJ/3kKR44BHYQB+0BEXpQDFHZyObWkP
	WAI69mXSkRadmsk3gdtGfGutrxvwKpm7uTeYZ8OfHgEZmNiAr20tkfybv2hbmcMp
	aGCFu/i+Ze/nNBT79BvaUZG5iO8ATI+xCjkaIojCFJEUB/7yV9OHAgWXIR4vHoyv
	svnP73yQR2D5DdJaECwwSduJJlJgwyl/c0Zm0q7/p4v9C+QOc0wDTt3BMFKIhm5o
	n6C8ZNGXDcfQcxNUDnSJGxVA5j4AZN+g3Y0WW5RuLPEuRofwDLvI0w4bNYthI1rB
	XcXmK6Drrgsa42Eogsk9g==
X-ME-Sender: <xms:h1t-Z__aAxWAhva-MdllhQ4BYUgmBfsyRApbSzOtiprXyT60uQomkg>
    <xme:h1t-Z7t0b7azrzS4uz3CDbALYqcojYJUUGAsBpI_lmF6nYqjDu3CEvB0twds3feyy
    SsqYy99WQypcV1T2Hc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeggedgvdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddt
    necuhfhrohhmpedftehrnhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrd
    guvgeqnecuggftrfgrthhtvghrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefg
    gfevudegudevledvkefhvdeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpe
    hmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohepgedv
    pdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehkvghvihhnrdgsrhhoughskhihse
    grrhhmrdgtohhmpdhrtghpthhtoheprhihrghnrdhrohgsvghrthhssegrrhhmrdgtohhm
    pdhrtghpthhtohepiihhvghnghhqihdrrghrtghhsegshihtvggurghntggvrdgtohhmpd
    hrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhmpdhrtghpthhtoheprghn
    ughrvggrshesghgrihhslhgvrhdrtghomhdprhgtphhtthhopegrlhgvgiesghhhihhtih
    drfhhrpdhrtghpthhtohepnhhpihhgghhinhesghhmrghilhdrtghomhdprhgtphhtthho
    pehvihhshhgrlhdrmhhoohhlrgesghhmrghilhdrtghomhdprhgtphhtthhopehhuhhghh
    gusehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:iFt-Z9ANGY5phHCQP5q9aptFJBex2r8tUUEtjidE_xfb4AaP55hNrg>
    <xmx:iFt-Z7ctt2NWtfyYsEgjYqKKIrHn67L1tyZAg4XMHhOyiTzOECL22Q>
    <xmx:iFt-Z0OlCBsb26nhU66OvTEdGpRVGIW5IfVb2Uu5QIznryJY6Y1lyw>
    <xmx:iFt-Z9kr0zvBfse9P3OqsbaaksL8J3gNd0JxqpmXi6zyClNfGpiDVw>
    <xmx:iFt-Z8U-rzqfWoWAKZ4Q8n6ifXS3RNJxGRb6sdxgxo5Zg4md0Aao1UvA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D26632220072; Wed,  8 Jan 2025 06:03:35 -0500 (EST)
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
Date: Wed, 08 Jan 2025 12:03:15 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Qi Zheng" <zhengqi.arch@bytedance.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Kevin Brodsky" <kevin.brodsky@arm.com>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "David Hildenbrand" <david@redhat.com>, "Jann Horn" <jannh@google.com>,
 "Hugh Dickins" <hughd@google.com>, "Yu Zhao" <yuzhao@google.com>,
 "Matthew Wilcox" <willy@infradead.org>,
 "Muchun Song" <muchun.song@linux.dev>, vbabka@kernel.org,
 "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
 "Andrew Morton" <akpm@linux-foundation.org>,
 "David Rientjes" <rientjes@google.com>, vishal.moola@gmail.com,
 "Will Deacon" <will@kernel.org>, aneesh.kumar@kernel.org,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Mike Rapoport" <rppt@kernel.org>, "Ryan Roberts" <ryan.roberts@arm.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-kernel@vger.kernel.org, x86@kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, loongarch@lists.linux.dev,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-sh@vger.kernel.org, linux-um@lists.infradead.org
Message-Id: <2f93708c-9816-4214-ae61-1e6b9f68cdc4@app.fastmail.com>
In-Reply-To: 
 <ea372633d94f4d3f9f56a7ec5994bf050bf77e39.1736317725.git.zhengqi.arch@bytedance.com>
References: <cover.1736317725.git.zhengqi.arch@bytedance.com>
 <ea372633d94f4d3f9f56a7ec5994bf050bf77e39.1736317725.git.zhengqi.arch@bytedance.com>
Subject: Re: [PATCH v5 14/17] mm: pgtable: introduce generic __tlb_remove_table()
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Jan 8, 2025, at 07:57, Qi Zheng wrote:
> Several architectures (arm, arm64, riscv and x86) define exactly the
> same __tlb_remove_table(), just introduce generic __tlb_remove_table() to
> eliminate these duplications.
>
> The s390 __tlb_remove_table() is nearly the same, so also make s390
> __tlb_remove_table() version generic.
>
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Acked-by: Andreas Larsson <andreas@gaisler.com> # sparc
> Acked-by: Alexander Gordeev <agordeev@linux.ibm.com> # s390

Acked-by: Arnd Bergmann <arnd@arndb.de> # asm-generic

