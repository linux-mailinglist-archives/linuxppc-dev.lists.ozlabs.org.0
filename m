Return-Path: <linuxppc-dev+bounces-1956-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 516CE997EA7
	for <lists+linuxppc-dev@lfdr.de>; Thu, 10 Oct 2024 10:04:55 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XPMjx12Mjz3bpP;
	Thu, 10 Oct 2024 19:04:53 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=103.168.172.136
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1728547493;
	cv=none; b=G85KRmPGKGaFf5ZKXaijgibOEC4JUXzYn1T6KUcXKEhw+v/dklFiMSVKvVJ825k18Tr2H732auyEv68WH0Bf7x5QBN+6OQndMHbL3nsYh9K7v+fxacS4NTqPWn5ESWTqqB7aocUOFs8D3VGMXqfQSJCgxQ+Qqg24ov6CWBpIB3Pz5kiZ5Cj5HjF3OnYf6WHlZwNJuqnoNrcpA9DTbNCx5JVc574Mm791brp9+874jJRv2BhJ3ZEe5TkiDMRj8UgGWBdPDJMbK6EQLC+8guMULQ9Ew0/WfheDUdaRtQZiSdYuBvvzjvE1Rpa92MLblDR/9l5/XgINH2Lq5Ptxh+SeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1728547493; c=relaxed/relaxed;
	bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=O2Fv1Di+Ib0u9UfMUI990CLLg44D+dmHuBzWUVm6PonXwn9bMFVUzERORqJ+HpeOKyyguO8cxgOzxFu7z0Z0fvrdMI3QE+Pps/6hhYOrxIY6O6z59VV7V0fL7M32GLpsC01vFYKPdpCFezjdRqw0jTiY9rTch7o2cAp3PCe5NhRLKxGTvvGoD6NKzJJ++aN75PWrPA/usFRd6rt+anvsaqR5kPaJIBNuUIMBvl+qs7FW6rZEcIyP4Wf5o9vjaTRGSaWKAtpU6fJT4WkPZYn5BIdoEnuONhvyxHztwJUvCAJdryOcy5UjgQLrdctDSC8JokyiM9tB8VkKIYzV6w3vxg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de; dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Uq033xlP; dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Nj9Aq3SQ; dkim-atps=neutral; spf=pass (client-ip=103.168.172.136; helo=flow-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org) smtp.mailfrom=arndb.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Uq033xlP;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=Nj9Aq3SQ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.136; helo=flow-a1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from flow-a1-smtp.messagingengine.com (flow-a1-smtp.messagingengine.com [103.168.172.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XPMjr41CYz3blF
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 10 Oct 2024 19:04:48 +1100 (AEDT)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailflow.phl.internal (Postfix) with ESMTP id C3AA3200A98;
	Thu, 10 Oct 2024 04:04:44 -0400 (EDT)
Received: from phl-imap-11 ([10.202.2.101])
  by phl-compute-10.internal (MEProxy); Thu, 10 Oct 2024 04:04:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1728547484;
	 x=1728554684; bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=; b=
	Uq033xlPTV7M/2uADh7Kio9qjd66ffU4q3GcfraER8vEa/TBgbChQu94tgVW0uaK
	pXY7jozzVwbQ8Ya36E7u9iUkDuo5YKVHqAZ8bHnde4FQoignkUnpk3n4zM1Ow7W7
	pqkYrDZJUqyVDWnJ/e/orVEawEFi2NxcxOe913glChgeWvLRHFRCYg7PLmzNjjTS
	eSePOXQiJ2tCm9PNXyY7XJEA1kK+QuyoayK9ccHLMT9vYJQf1obOma6+WcgoQiTZ
	rCO/F2/Av72l6mSdBDEcAONo4x3AsOj40QNPpgTyYIxpD0N35b0FMfAq0nEvPIBl
	9rL8hDdfC/9PQ9TN9ntljg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728547484; x=
	1728554684; bh=NOnTXEDf/afk98+qld6jjp5+THx/CJ1WRioKL/FDWFo=; b=N
	j9Aq3SQVxi0yJVoBcl9i4fPvQOr9zt3y3795lzIArZwRKLf5/Q4w5GwQVfCcJjw2
	fHBLG+SEwHxA6W6BHiC/PPRnfw/euhehOZaf1xv113bZQ6zyMXXYbDK6HO5DfYdH
	Eibe00/t7mBIfHVB6NfWSDQPb17/YR6D9/nYP8ncvwtzg1w0SRhao1eVbOXUQoCD
	BQ+bgHLpleoD/Ofkz0V77beK07p6f9+Z/PpeHiddKV5esYAsuKTALWIUlHtErlpZ
	nSRNyhpVsNrMAg/4A5we5y/Ae60B3fLfum5QuK2YeIDPuniByaQX2mlXBuk9KrEB
	oU607EYkl/nEhh1Im4Dyg==
X-ME-Sender: <xms:mIoHZxVyt1tzNiI4VJY1hNYpmWyw-lXg-LHPAPcu29enEAwaGYpqdA>
    <xme:mIoHZxmN7IaxN68cMSMreDSNvBHBsgqtLH3A4g9n2w8VJYGvEAjgnDn4AOFyZU_QE
    vsBIt0UiYw5NwZFtgA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdefgedguddvkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdetrhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusg
    druggvqeenucggtffrrghtthgvrhhnpefhtdfhvddtfeehudekteeggffghfejgeegteef
    gffgvedugeduveelvdekhfdvieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggvpdhnsggprhgtphhtthhopeeh
    tddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpd
    hrtghpthhtohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgt
    phhtthhopegtrghtrghlihhnrdhmrghrihhnrghssegrrhhmrdgtohhmpdhrtghpthhtoh
    epmhgrrhhkrdhruhhtlhgrnhgusegrrhhmrdgtohhmpdhrtghpthhtoheplhhinhhugies
    rghrmhhlihhnuhigrdhorhhgrdhukhdprhgtphhtthhopegthhhrihhsthhophhhvgdrlh
    gvrhhohiestghsghhrohhuphdrvghupdhrtghpthhtohepphgrlhhmvghrsegurggssggv
    lhhtrdgtohhmpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhrtg
    hpthhtoheprghnughrvggrshesghgrihhslhgvrhdrtghomh
X-ME-Proxy: <xmx:mYoHZ9bh6LF6KTO2BKN2BnO9EXila2P_h8xeEQcBucXDkGl-bl9M-A>
    <xmx:mYoHZ0XYOQUAKIkavDKienaDsb5i4U1ta4trA0rVHTXe2DqfK7yLqQ>
    <xmx:mYoHZ7nXzqM8PLVuQ-B9brlPZ_nY2zs1QH5-EF9GuGkQq2-TUCF-GQ>
    <xmx:mYoHZxesVGLkHmAI7smOEC31KKa8BnCQ7b4ijWZBlvNC6nhTWQi3Ig>
    <xmx:nIoHZ80_2WZbSEQjfuSnNnJS_LZIqjsOIz7pD44c1pM-ycg_PtUcKHaT>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id D17622220071; Thu, 10 Oct 2024 04:04:40 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Date: Thu, 10 Oct 2024 08:04:19 +0000
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Mike Rapoport" <rppt@kernel.org>,
 "Andrew Morton" <akpm@linux-foundation.org>
Cc: "Andreas Larsson" <andreas@gaisler.com>,
 "Andy Lutomirski" <luto@kernel.org>, "Ard Biesheuvel" <ardb@kernel.org>,
 "Borislav Petkov" <bp@alien8.de>, "Brian Cain" <bcain@quicinc.com>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Christoph Hellwig" <hch@infradead.org>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Dinh Nguyen" <dinguyen@kernel.org>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>, guoren <guoren@kernel.org>,
 "Helge Deller" <deller@gmx.de>, "Huacai Chen" <chenhuacai@kernel.org>,
 "Ingo Molnar" <mingo@redhat.com>,
 "Johannes Berg" <johannes@sipsolutions.net>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "Kent Overstreet" <kent.overstreet@linux.dev>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 "Luis Chamberlain" <mcgrof@kernel.org>,
 "Mark Rutland" <mark.rutland@arm.com>,
 "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Matt Turner" <mattst88@gmail.com>, "Max Filippov" <jcmvbkbc@gmail.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Michal Simek" <monstr@monstr.eu>, "Oleg Nesterov" <oleg@redhat.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Peter Zijlstra" <peterz@infradead.org>,
 "Richard Weinberger" <richard@nod.at>,
 "Russell King" <linux@armlinux.org.uk>, "Song Liu" <song@kernel.org>,
 "Stafford Horne" <shorne@gmail.com>,
 "Steven Rostedt" <rostedt@goodmis.org>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "Thomas Gleixner" <tglx@linutronix.de>,
 "Uladzislau Rezki (Sony)" <urezki@gmail.com>,
 "Vineet Gupta" <vgupta@kernel.org>, "Will Deacon" <will@kernel.org>,
 bpf@vger.kernel.org, linux-alpha@vger.kernel.org,
 Linux-Arch <linux-arch@vger.kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 linux-hexagon@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-modules@vger.kernel.org,
 "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>,
 linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sh@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-trace-kernel@vger.kernel.org, linux-um@lists.infradead.org,
 linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
 sparclinux@vger.kernel.org, x86@kernel.org
Message-Id: <e1ba5ab2-a7e2-4f2c-8e2d-4788656ef695@app.fastmail.com>
In-Reply-To: <20241009180816.83591-4-rppt@kernel.org>
References: <20241009180816.83591-1-rppt@kernel.org>
 <20241009180816.83591-4-rppt@kernel.org>
Subject: Re: [PATCH v5 3/8] asm-generic: introduce text-patching.h
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.9 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On Wed, Oct 9, 2024, at 18:08, Mike Rapoport wrote:
> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Several architectures support text patching, but they name the header
> files that declare patching functions differently.
>
> Make all such headers consistently named text-patching.h and add an empty
> header in asm-generic for architectures that do not support text patching.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>

Acked-by: Arnd Bergmann <arnd@arndb.de>

