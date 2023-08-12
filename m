Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A1FB3779DEF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 09:35:59 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=dCGtWjTq;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DP2DRRCS;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RNCBj42sqz3cM3
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Aug 2023 17:35:57 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=dCGtWjTq;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=DP2DRRCS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.27; helo=out3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4RNC9k52CWz2yt0
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Aug 2023 17:35:04 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 421FA5C010A;
	Sat, 12 Aug 2023 03:34:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Sat, 12 Aug 2023 03:34:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1691825698; x=1691912098; bh=WqC8jR6InInnZuzJ+EysqTz0wUT8dxSKNcu
	7C0/3HeM=; b=dCGtWjTqROLM6UxVFCraHYHQ93peZaX+KBPrAxD6DxzW1Fz8A43
	e7Ed4i4hlKEuwz0SnKpQSkkLEFoAq6fb3JEM4Jd4ColFKfP7hLoYxneRg/oycL8u
	xmXbouGul7Br09wVApRftWd/ooRKHGNo4ApWziU5Nnk7bk78pCdTsb/CZK7DVMhC
	CibmlPP5nI2gP4QQjcWiF+fk7W7hyNgcPbGoXOENXr63LGGixBZ+5YgNKOWeriqg
	3+iC74fliRCBa0B5W8mBIylmvv6Fy43b/HQXdp5lp1uiN3p3TBKrrhfbh17C4+F6
	ysRly1L/Ow8754uhJnKUIAfaTS3vF2ZYYcA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:sender:subject:subject:to:to:x-me-proxy
	:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
	1691825698; x=1691912098; bh=WqC8jR6InInnZuzJ+EysqTz0wUT8dxSKNcu
	7C0/3HeM=; b=DP2DRRCSYCmH5Vfp2ZXKBFUrGaDAQPGRPgl+FNYDOEdieS0SE19
	JNP/ODsMQJaoU/LJBkTUAFXGRy5vC8B38YVhYrgJeEOYd6V53ZzyVuYMEXTSoFNg
	D3Fc7q2cYgIw7mo8HtkJJroZ0lUO7j7HEyNqYb7oVusQIdHriGmXyNZ4Yv+77upG
	DsU5zmiivJlulALcRScuDvmuHdvkv1skAEJ4bRYQCrsGTf3MXAmSOLP4UUFaMtT4
	S86UN40x9tOGMXbNVVFNDcTd+bsJ8jCNZoc2jERdPV9RRKguotvYY7cdlIUcjg50
	d34/pnmq4Kml5cagBF+Vi40bIyXUDl+x6Qg==
X-ME-Sender: <xms:IDbXZPRqug4D5loXD9mqZwGG01r8_DF4jp6JMEyUv3YNuWMVCp91Ww>
    <xme:IDbXZAzeXDrYMSyeEcktmCocCqNijokzQFVaeobj9F0v3sO8Mccih9cLrokD7gWmm
    ELYlEQN21wGsA7ZOdk>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrleelgdduudelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
    gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:IDbXZE2reVts5QORz11lIuYb0ri67D5pxZ0Lxz86Zt6H-MC0BYus2A>
    <xmx:IDbXZPCJlDjCa7sT1zk_P8UtlsBICHZZbS-XgxPowKHUnVywGFSu8g>
    <xmx:IDbXZIgfsBCSiRk7Z6sGqJRPxgYvC50Uv9WhLXMZb7zdluX1d_V5Pw>
    <xmx:IjbXZGNwGwINM4cV6nu9MlZ27AA4Y36mzxWPvUPjn28DmeE2U-bY5A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 44DDAB60089; Sat, 12 Aug 2023 03:34:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-624-g7714e4406d-fm-20230801.001-g7714e440
Mime-Version: 1.0
Message-Id: <fbaf6de9-e1cc-4290-9016-46be21863ff5@app.fastmail.com>
In-Reply-To:  <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
References: <20230810141947.1236730-1-arnd@kernel.org>
 <20230810141947.1236730-3-arnd@kernel.org>
 <CAK7LNAQo5hri-9JmS_kot1mQ6WHCWAeu+SnW19daWMC1YK5BWA@mail.gmail.com>
Date: Sat, 12 Aug 2023 09:34:34 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Masahiro Yamada" <masahiroy@kernel.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 02/17] [RESEND] irq_work: consolidate arch_irq_work_raise
 prototypes
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-BeenThere: linuxppc-dev@lists.ozlabs.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on PowerPC Developers Mail List <linuxppc-dev.lists.ozlabs.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/linuxppc-dev>,
 <mailto:linuxppc-dev-request@lists.ozlabs.org?subject=subscribe>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, Palmer Dabbelt <palmer@rivosinc.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, x86@kernel.org, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 12, 2023, at 00:10, Masahiro Yamada wrote:
> On Fri, Aug 11, 2023 at 10:00=E2=80=AFAM Arnd Bergmann <arnd@kernel.or=
g> wrote:
>>
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The prototype was hidden on x86, which causes a warning:
>
>
> What do you mean by "hidden on x86"?
>
> arch_irq_work_raise() was declared on 7 architectures,
> including x86.
>

I meant hidden in some configurations. Specifically, x86
only declares the function when it overrides it for
CONFIG_X86_LOCAL_APIC, while without that option the generic
stub still gets compiled but is never declared.

    Arnd
