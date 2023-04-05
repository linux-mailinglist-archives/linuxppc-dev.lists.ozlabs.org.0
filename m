Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D62006D8898
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Apr 2023 22:32:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PsGXW4nWWz3fHC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Apr 2023 06:32:43 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OkqCZBl+;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=geihRaK6;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=OkqCZBl+;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=geihRaK6;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PsGWh4bTDz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Apr 2023 06:32:00 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 4BC55582365;
	Wed,  5 Apr 2023 16:31:58 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 05 Apr 2023 16:31:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1680726718; x=1680733918; bh=xf
	daTsCHqQK0cfzJzYIzL0UBOi13djzmqCvgs31u5gk=; b=OkqCZBl+YcgCNi2zCF
	z+S6GrwBuIl6Ybb/60B7UTSZ+Pdl6SMPl6F3mCMD/ygiBAoVDmjO6iZbgG+BvZqP
	FJp56qultp3KLcNVD7I6T6SbFuumt9wmECk/dUaR17cR4GQpGkoEBAh2WI/LHnEs
	tRtdYFHZ4NMBoWYMYmvFaMBg7GD3x5xpvmK3U0V/x0pOHxJc4bkLKjN7Y9aXdD4b
	9PZZEqgvLzpxA8clvAMppQKJpGlzRCmqOnerwJkqZ521LgD/e9+I0pKOZ+X47cEr
	IOwPqu0LneXOw6vgvQli/4q9wkrwsFQF822kZhouO9JGBEdW9sOjWe1N5IPSWW04
	51GA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680726718; x=1680733918; bh=xfdaTsCHqQK0c
	fzJzYIzL0UBOi13djzmqCvgs31u5gk=; b=geihRaK61byXChNC3DahtZt2Xv2RS
	FFhZDdc0yLbZ9E+bnHVb+fFtY2FiPoHzIXRVzoG5Dii4ZbiRMdAbmcY/lNFU52Qd
	X40CSDb7sDMsJLMccoAsBE7gT+JLUNJkKBgExf5hT5ogC7MAhwtFw/0ef0okhqgb
	236ZS33ng4gzR+Q2VbQcqRhD+wXY0PdL/qaZGmr1CwMhA58qBzKhc1/EzCQUfHpJ
	8bH8S4rUoDN1iFVaohbfwhHbejxPHSnwexuqKa4wzcZ25fDcaUzCN8iD66iaRY7C
	fwRTIL8hs7/xBJLA4QnHM5GOh/xqucxyyEN8EbDhNy0n3ocmjgTGCbRrQ==
X-ME-Sender: <xms:vNotZL2rVs5vYYsltqIjxMRlwwqq7r0ixk7m58SpKVF8JpAXeltCLw>
    <xme:vNotZKEJZTkBpe-wMj6niDJNGHJ2Y7RAxYbhdVfzFbTmjZ2nWszRUD5WTgx_YXUjh
    soOygI5TVtcO06JATs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdejuddgudehvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:vNotZL4XeKwHiy4r0o9mWeskWnUMysMGMsQ82HMerZolxSBFl61-sg>
    <xmx:vNotZA08gkBwqv90O_DvolWnBDtX38kj41F6yPZ19Oa-l9Jxj9czMA>
    <xmx:vNotZOEDp1efziCATEabMkJv1HT074qDn_11pWRj-XRnLmqlATcH2Q>
    <xmx:vtotZMeI-2ERhe0SC7q5dOCu4GDnvH-Bz5saurM0-QNV6B_aMGzhXg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id C4228B60089; Wed,  5 Apr 2023 16:31:56 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-334-g8c072af647-fm-20230330.001-g8c072af6
Mime-Version: 1.0
Message-Id: <d8686aaf-f12e-446b-9a80-335bb4266a4d@app.fastmail.com>
In-Reply-To: <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
References: <20230323163354.1454196-1-schnelle@linux.ibm.com>
 <248a41a536d5a3c9e81e8e865b34c5bf74cd36d4.camel@linux.ibm.com>
 <B1EC1AC7-6BB5-4B66-B171-24687C3CBFB3@zytor.com>
Date: Wed, 05 Apr 2023 22:31:33 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "H. Peter Anvin" <hpa@zytor.com>,
 "Niklas Schnelle" <schnelle@linux.ibm.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Ivan Kokshaysky" <ink@jurassic.park.msu.ru>,
 "Matt Turner" <mattst88@gmail.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Will Deacon" <will@kernel.org>, "Huacai Chen" <chenhuacai@kernel.org>,
 "WANG Xuerui" <kernel@xen0n.name>,
 "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Michal Simek" <monstr@monstr.eu>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>,
 "Helge Deller" <deller@gmx.de>, "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Paul Walmsley" <paul.walmsley@sifive.com>,
 "Palmer Dabbelt" <palmer@dabbelt.com>,
 "Albert Ou" <aou@eecs.berkeley.edu>,
 "Yoshinori Sato" <ysato@users.osdn.me>, "Rich Felker" <dalias@libc.org>,
 "John Paul Adrian Glaubitz" <glaubitz@physik.fu-berlin.de>,
 "David S . Miller" <davem@davemloft.net>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org
Subject: Re: [PATCH v4] Kconfig: introduce HAS_IOPORT option and select it as necessary
Content-Type: text/plain
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
Cc: linux-m68k@vger.kernel.org, linux-ia64@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org, linux-mips@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-sh@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, loongarch@lists.linux.dev, Bjorn Helgaas <bhelgaas@google.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, linux-parisc@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 5, 2023, at 22:00, H. Peter Anvin wrote:
> On April 5, 2023 8:12:38 AM PDT, Niklas Schnelle <schnelle@linux.ibm.com> wrote:
>>On Thu, 2023-03-23 at 17:33 +0100, Niklas Schnelle wrote:
>>> We introduce a new HAS_IOPORT Kconfig option to indicate support for I/O
>>> Port access. In a future patch HAS_IOPORT=n will disable compilation of
>>> the I/O accessor functions inb()/outb() and friends on architectures
>>> which can not meaningfully support legacy I/O spaces such as s390.
>>> >>
>>Gentle ping. As far as I can tell this hasn't been picked to any tree
>>sp far but also hasn't seen complains so I'm wondering if I should send
>>a new version of the combined series of this patch plus the added
>>HAS_IOPORT dependencies per subsystem or wait until this is picked up.
>
> You need this on a system supporting not just ISA but also PCI.
>
> Typically on non-x86 architectures this is simply mapped into a memory window.

I'm pretty confident that the list is correct here, as the HAS_IOPORT
symbol is enabled exactly for the architectures that have a way to
map the I/O space. PCIe generally works fine without I/O space, the
only exception are drivers for devices that were around as early PCI.

      Arnd
