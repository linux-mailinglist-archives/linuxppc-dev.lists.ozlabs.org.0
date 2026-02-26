Return-Path: <linuxppc-dev+bounces-17305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oI3fAfhroGk3jgQAu9opvQ
	(envelope-from <linuxppc-dev+bounces-17305-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>)
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:51:20 +0100
X-Original-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB82C1A91D2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 26 Feb 2026 16:51:17 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4fMGCR18tTz3c5y;
	Fri, 27 Feb 2026 02:51:15 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.143
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1772121075;
	cv=none; b=EW7HJ9MhH3bNznBHqLsdXe4IQKsYARnNq70lWQ5DuJ/+SQjZLCjwSsrMTRfv9SdVcNpDhlnXRI0dnj1R37bH2PXURXLhWy0t92eKvKgvIRNYIzy4zYpVE5sSOaVSXT2r0vAPVxNqi8TqkORt+bjjPwhNx1Kx0Z4QeuMZXQsSWRBVFUTt8BwYZUwVYbrEfaV9J7GvwPm1L5qidkv45+jlsp7co3HhUw2ynGI3bV10Q6UPsMDKR3Z9GtYStPujv546TXYO6Nx1qUKaxtIEEsqPtBcOvuK8qIxfUlxRrCCg31t93NeuirLHyx8SsUruxTmGznNOMhOteo53iAKo2dvGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1772121075; c=relaxed/relaxed;
	bh=5NKb8s5uQsJxGoQ2AVBEtObpQ/CvaKcz4OqTIpIkbmc=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=BHziSPdNefeTirTaucQzr+pkyivi0oeukCtDphwxnLJsGA93usxY0HUq0XjhEBzgFi8mx5Wfhhb07fafobGhBYwlTGN9kJ2X+C2aFB3Fy9raYqJwzfg+s4CDCudsDmARj/kFSA54X7HVRd5jdaEOJf3uwuv2oI00uZ9HJdbZ4Wt5Tm3hjJiT4dVuDAl6+Yqj/k84ShHJI8KxiZXSyb6cnoLbszHE7pjN2CMBZaHfA0ZkIIJEVEA5/bvbKZemAeCyNM4o5mBFqWeBkoiSfFIIHQ3b6iKh4LqN+2IO4znphFHgOT0Li9GIt19FRsvfndpaeMkQUTh6bo63gHiXKgNl7g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=BFOz5yqx; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fc2ByHch; dkim-atps=neutral; spf=pass (client-ip=103.168.172.143; helo=flow-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=BFOz5yqx;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=Fc2ByHch;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.143; helo=flow-a8-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 432 seconds by postgrey-1.37 at boromir; Fri, 27 Feb 2026 02:51:11 AEDT
Received: from flow-a8-smtp.messagingengine.com (flow-a8-smtp.messagingengine.com [103.168.172.143])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4fMGCM6rspz3bf8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 27 Feb 2026 02:51:11 +1100 (AEDT)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailflow.phl.internal (Postfix) with ESMTP id 702FC1380BA9;
	Thu, 26 Feb 2026 10:43:55 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-04.internal (MEProxy); Thu, 26 Feb 2026 10:43:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1772120635;
	 x=1772127835; bh=5NKb8s5uQsJxGoQ2AVBEtObpQ/CvaKcz4OqTIpIkbmc=; b=
	BFOz5yqxSmg9S50IsSdLRGyQHw6zGY1eOdKa+Po1ZziBbN2GJ+4j9GfSK2vBzpb8
	jke/0DjjeJ1N27rCrrDV17hYarBNm1Yv5Ef3DpswEsW5lXmy5P2MpCy6/j4n03oF
	6AXtPA/NP2OgKRV62bfh5y074ZgZyuVK80kBotJiI5viaax3nK4TDXtsz7/fmWKi
	Idb44puvspjnRxIVW8rRiXroKSe3UOJgw6SBDrDW/b4nrdVt9gRrGH0VYyTCCFI+
	MaLql0ByGC1lAPGvtsNQy7knHDrJrYmiw6Z0TH7LP/fMQ/mbjchvlBUub+fpzM0z
	AwgDVPMDWtHsSHNybdc70Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1772120635; x=
	1772127835; bh=5NKb8s5uQsJxGoQ2AVBEtObpQ/CvaKcz4OqTIpIkbmc=; b=F
	c2ByHch3ij59MUwgdS2tUPIb02ImNYf+PdWdDaqtx5ATw62eUpliVMY8iV5D7hR3
	wYi0CHEzfkgh/mmBuCbJYAChbEOC/Yi8PJeN5l62Iy2psmFsZrqPUq0n/+vZEsQO
	qYjytQD72iqh1ghXwEeBJ+WUnvc4Fp1Jeo/4mgECJRniva5kBNFlm6iANF8sqab6
	oNPUlMV1dQUyv+GQi7/PfCZFIvgRRn3B9r6NcepO1/wYvQBeHCR1LEsGxh1+Og4p
	FYPE0U4hjheq9evedYJAexwrwIPKQjOD7fllTYCzxyIBPwHANOFBQd6w9WsyZAmJ
	opoR4yIXQlrQwxqExmjlA==
X-ME-Sender: <xms:N2qgaaQjbD4lDTTpYYJW04n5-N_REynhDJNOjDcAsLpq8XoFDTIP1Q>
    <xme:N2qgaalYz6oAwIkXti0ilmTZ4SAWzxEhI78J-NBiOcz8jBnpIMTvnyc8aM72hc_ES
    ARSAHBEQvzfvqva9WEslWopqCs96M2xP3m79vrzlriTC5w2htjwEyM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvgeeigeefucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhephfdthfdvtdefhedukeetgefggffhjeeggeetfefggfevudegudevledvkefhvdei
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnh
    gusegrrhhnuggsrdguvgdpnhgspghrtghpthhtohephedtpdhmohguvgepshhmthhpohhu
    thdprhgtphhtthhopegsphesrghlihgvnhekrdguvgdprhgtphhtthhopegtrghtrghlih
    hnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugiesrghrmhhl
    ihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegrnhhtohhnrdhivhgrnhhovhestggrmh
    gsrhhiughgvghgrhgvhihsrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggv
    lhhtrdgtohhmpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprh
    gtphhtthhopegrohhusegvvggtshdrsggvrhhkvghlvgihrdgvughupdhrtghpthhtohep
    mhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtghpthhtoheptghlmhesfhgsrdgtoh
    hm
X-ME-Proxy: <xmx:N2qgaUJWUEXUlLEjkxtJWtWBvZvargLkJYDYLT1WCObuQQIhrpl4jg>
    <xmx:N2qgabuNvv7e3NmdoP0u_IPqZN1TMDnyqD0tO35lBUa_NaOCzbSmCg>
    <xmx:N2qgaRqz5OOPUoSW-rsw8dZEHVicCLZG3p0s42DHReFDaNuct761aw>
    <xmx:N2qgafV0jsQUaX0mdJgZVSo50cBCHJXR9outsNs-5KBrOO1PzPsRXw>
    <xmx:O2qgafUJmIOfDaRuA5FfQ3utukV1YK4slK3UAvn21GEOucPhAX52tGfc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id A0F9D700065; Thu, 26 Feb 2026 10:43:51 -0500 (EST)
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
X-ThreadId: AQu7KcbS869J
Date: Thu, 26 Feb 2026 16:40:21 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@lst.de>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Magnus Lindholm" <linmag7@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <chleroy@kernel.org>,
 "Paul Walmsley" <pjw@kernel.org>, "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>,
 "Heiko Carstens" <hca@linux.ibm.com>,
 "Vasily Gorbik" <gor@linux.ibm.com>,
 "Alexander Gordeev" <agordeev@linux.ibm.com>,
 "Christian Borntraeger" <borntraeger@linux.ibm.com>,
 "Sven Schnelle" <svens@linux.ibm.com>,
 "David S . Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Richard Weinberger" <richard@nod.at>,
 "Anton Ivanov" <anton.ivanov@cambridgegreys.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "Thomas Gleixner" <tglx@kernel.org>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>,
 "Herbert Xu" <herbert@gondor.apana.org.au>,
 "Dan Williams" <dan.j.williams@intel.com>, "Chris Mason" <clm@fb.com>,
 "David Sterba" <dsterba@suse.com>, "Song Liu" <song@kernel.org>,
 "Yu Kuai" <yukuai@fnnas.com>, "Li Nan" <linan122@huawei.com>,
 linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-btrfs@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>,
 linux-raid@vger.kernel.org
Message-Id: <29afa24a-f659-481b-b5a8-7b8b9e009755@app.fastmail.com>
In-Reply-To: <20260226151106.144735-10-hch@lst.de>
References: <20260226151106.144735-1-hch@lst.de>
 <20260226151106.144735-10-hch@lst.de>
Subject: Re: [PATCH 09/25] xor: move generic implementations out of asm-generic/xor.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.20 / 15.00];
	ARC_ALLOW(-1.00)[lists.ozlabs.org:s=201707:i=1];
	DMARC_POLICY_ALLOW(-0.50)[arndb.de,none];
	R_SPF_ALLOW(-0.20)[+ip6:2404:9400:21b9:f100::1];
	R_DKIM_ALLOW(-0.20)[arndb.de:s=fm3,messagingengine.com:s=fm3];
	MAILLIST(-0.20)[generic];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[linuxppc-dev@lists.ozlabs.org];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-17305-lists,linuxppc-dev=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	FREEMAIL_CC(0.00)[linaro.org,gmail.com,armlinux.org.uk,arm.com,kernel.org,xen0n.name,linux.ibm.com,ellerman.id.au,dabbelt.com,eecs.berkeley.edu,ghiti.fr,davemloft.net,gaisler.com,nod.at,cambridgegreys.com,sipsolutions.net,redhat.com,alien8.de,linux.intel.com,zytor.com,gondor.apana.org.au,intel.com,fb.com,suse.com,fnnas.com,huawei.com,vger.kernel.org,lists.infradead.org,lists.linux.dev,lists.ozlabs.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:akpm@linux-foundation.org,m:richard.henderson@linaro.org,m:mattst88@gmail.com,m:linmag7@gmail.com,m:linux@armlinux.org.uk,m:catalin.marinas@arm.com,m:will@kernel.org,m:chenhuacai@kernel.org,m:kernel@xen0n.name,m:maddy@linux.ibm.com,m:mpe@ellerman.id.au,m:npiggin@gmail.com,m:chleroy@kernel.org,m:pjw@kernel.org,m:palmer@dabbelt.com,m:aou@eecs.berkeley.edu,m:alex@ghiti.fr,m:hca@linux.ibm.com,m:gor@linux.ibm.com,m:agordeev@linux.ibm.com,m:borntraeger@linux.ibm.com,m:svens@linux.ibm.com,m:davem@davemloft.net,m:andreas@gaisler.com,m:richard@nod.at,m:anton.ivanov@cambridgegreys.com,m:johannes@sipsolutions.net,m:tglx@kernel.org,m:mingo@redhat.com,m:bp@alien8.de,m:dave.hansen@linux.intel.com,m:x86@kernel.org,m:hpa@zytor.com,m:herbert@gondor.apana.org.au,m:dan.j.williams@intel.com,m:clm@fb.com,m:dsterba@suse.com,m:song@kernel.org,m:yukuai@fnnas.com,m:linan122@huawei.com,m:linux-alpha@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists
 .infradead.org,m:loongarch@lists.linux.dev,m:linuxppc-dev@lists.ozlabs.org,m:linux-riscv@lists.infradead.org,m:linux-s390@vger.kernel.org,m:sparclinux@vger.kernel.org,m:linux-um@lists.infradead.org,m:linux-crypto@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:linux-arch@vger.kernel.org,m:linux-raid@vger.kernel.org,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:133159, ipnet:2404:9400:2000::/36, country:AU];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linuxppc-dev@lists.ozlabs.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[arnd@arndb.de,linuxppc-dev@lists.ozlabs.org];
	DKIM_TRACE(0.00)[arndb.de:+,messagingengine.com:+];
	RCPT_COUNT_GT_50(0.00)[54];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linuxppc-dev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,app.fastmail.com:mid,messagingengine.com:dkim,arndb.de:email,arndb.de:dkim,lists.ozlabs.org:helo,lists.ozlabs.org:rdns]
X-Rspamd-Queue-Id: EB82C1A91D2
X-Rspamd-Action: no action

On Thu, Feb 26, 2026, at 16:10, Christoph Hellwig wrote:
> Move the generic implementations from asm-generic/xor.h to
> per-implementaion .c files in lib/raid.
>
> Note that this would cause the second xor_block_8regs instance created by
> arch/arm/lib/xor-neon.c to be generated instead of discarded as dead
> code, so add a NO_TEMPLATE symbol to disable it for this case.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: Arnd Bergmann <arnd@arndb.de> # for asm-generic
> 
> -#pragma GCC diagnostic ignored "-Wunused-variable"
> -#include <asm-generic/xor.h>
> +#define NO_TEMPLATE
> +#include "../../../lib/raid/xor/xor-8regs.c"

The #include is slightly ugly, but I see it gets better in a later patch,
and is clearly worth it either way.

The rest of the series looks good to me as well. I had a brief
look at each patch, but nothing to complain about.

     Arnd

