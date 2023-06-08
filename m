Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C44A7280BC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 14:57:54 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QcPQ80RMVz3f05
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Jun 2023 22:57:52 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ZeX8L7pU;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=U6XRVjfP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.20; helo=wout4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=ZeX8L7pU;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=U6XRVjfP;
	dkim-atps=neutral
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com [64.147.123.20])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QcPP91wSDz3cKW
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jun 2023 22:57:00 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 54C02320090B;
	Thu,  8 Jun 2023 08:56:52 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 08 Jun 2023 08:56:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1686229011; x=1686315411; bh=87
	pYxZKtAnGH9oKy6pFHT1xHGz/WCvjygA8bIAeiKlA=; b=ZeX8L7pUZ5UIpOMY9M
	9g1j8HgG7+kWRpcbfg5uyET+fH7MKKs1mmJd5GiTBtyG3e4Kb2S8oySTp2FMKVD5
	6cPeO3EdjyqNf0z8ONTk7Y4xvff+IrOd/IEXcnucUJGHtunt79pl/8nMv5FddrAG
	uQycTyVPowhwXFFmqqICRAUW8Rc8su6sZcA/n9xK4gkWZLq4FLGKG2+b/ofZFCuf
	AMrvTTYFhxmA+huvu4Cjp75ap2Sf7MJK9JQ3pOVGdml0Q2jBbC5ggWY9QzN5MNkV
	6Cu7hWpbrBfBHGI32iWeZ+txnWuzY/rdQ0nguYoFIEmTdH+KuW0pvhtt0TNXW/yQ
	JP2A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1686229011; x=1686315411; bh=87pYxZKtAnGH9
	oKy6pFHT1xHGz/WCvjygA8bIAeiKlA=; b=U6XRVjfP+EHUDQvBv8cPL9pD/KGwo
	iw0KnKWmDepSUXHsue7XYEEv3jSKmc5VneLRFAnbB7bjvWnjZAFimwr1xI3aZ2r2
	RdXIfnuvROK2EFMWjCfwC3PBH93ikfGkGtdqsK5mas70L80DoSDFO8TKCaTh4eHz
	K+ZspG/2pADrn/0PYTVFOIEgwbfucSZzMW91caxx97W+pzHbK9rkgf+0+vkf4oDD
	jH5hLErq64lWlh17sXL7u3Td79LGnkb4UvXKtQw37hle5MqhD6Sfrp8G6cLyNfqi
	QTut/2emZSYLnRuBAzk7rDPI0a305yR06UG65WJAnPVfPk2TBPYkBuvMA==
X-ME-Sender: <xms:EtCBZE-D_kjWYp3ANnherykbAzIjPaixWoyhxXwJLmuQI-kmX5DxFw>
    <xme:EtCBZMv-IJXp1mQnNzIiUM2AEt48SGWGnXLai4h_XUzypiLIXrG4wXRCGc1U27CR_
    sWJ2VBCAcRl0hKP7ME>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrgedtiedgheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepkeehtefguddvleejvdeileeifffhueevgedvheeiudfhueevgfehkeeitedu
    keeknecuffhomhgrihhnpehsohhurhgtvgifrghrvgdrohhrghenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:EtCBZKA2ewgTjhAvvYw7qmycGR9cVe-qDicg_oFDY4J69jtsZIvlug>
    <xmx:EtCBZEdu7a-GJfOfcHAOiHAuoCAzbOXNlKWUPk55Fe3Mbg8D-CEnpQ>
    <xmx:EtCBZJOC47AwohdFIRwPvxQhiJzPrz-2u8vWBLIbN9yK_NXQPYV6NQ>
    <xmx:E9CBZGcuZlRzBuBBOm-YYYm5GycL4W2eCqAow4fI1BtYmFRYOd5HOA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9B111B60086; Thu,  8 Jun 2023 08:56:50 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-447-ge2460e13b3-fm-20230525.001-ge2460e13
Mime-Version: 1.0
Message-Id: <a3a4f48a-07d4-4ed9-bc53-5d383428bdd2@app.fastmail.com>
In-Reply-To: <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
 <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
 <76d3be65-91df-7969-5303-38231a7df926@loongson.cn>
Date: Thu, 08 Jun 2023 14:56:30 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Tiezhu Yang" <yangtiezhu@loongson.cn>
Subject: Re: [RFC PATCH] asm-generic: Unify uapi bitsperlong.h
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org, loongarch@lists.linux.dev, linux-parisc@vger.kernel.org, llvm@lists.linux.dev, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 8, 2023, at 09:04, Tiezhu Yang wrote:
> On 05/09/2023 05:37 PM, Arnd Bergmann wrote:
>> On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
>>
>> I think we are completely safe on the architectures that were
>> added since the linux-3.x days (arm64, riscv, csky, openrisc,
>> loongarch, nios2, and hexagon), but for the older ones there
>> is a regression risk. Especially on targets that are not that
>> actively maintained (sparc, alpha, ia64, sh, ...) there is
>> a good chance that users are stuck on ancient toolchains.
>> It's probably also a safe assumption that anyone with an older
>> libc version won't be using the latest kernel headers, so
>> I think we can still do this across architectures if both
>> glibc and musl already require a compiler that is new enough,
>> or alternatively if we know that the kernel headers require
>> a new compiler for other reasons and nobody has complained.
>>
>> For glibc, it looks the minimum compiler version was raised
>> from gcc-5 to gcc-8 four years ago, so we should be fine.
>>
>> In musl, the documentation states that at least gcc-3.4 or
>> clang-3.2 are required, which probably predate the
>> __SIZEOF_LONG__ macro. On the other hand, musl was only
>> released in 2011, and building musl itself explicitly
>> does not require kernel uapi headers, so this may not
>> be too critical.
>>
>> There is also uClibc, but I could not find any minimum
>> supported compiler version for that. Most commonly, this
>> one is used for cross-build environments, so it's also
>> less likely to have libc/gcc/headers being wildly out of
>> sync. Not sure.
>>
>>       Arnd
>>
>> [1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
>>
>
> Thanks Arnd for the detailed reply.
> Any more comments? What should I do in the next step?

I think the summary is "it's probably fine", but I don't know
for sure, and it may not be worth the benefit.

Maybe you can prepare a v2 that only does this for the newer
architectures I mentioned above, with and an explanation and
link to my above reply in the file comments?

      Arnd
