Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B526FC2FA
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 11:39:10 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QFtQh5Mgfz3fQ9
	for <lists+linuxppc-dev@lfdr.de>; Tue,  9 May 2023 19:39:08 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=I4f00STf;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=irqHQQNU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.24; helo=wout1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=I4f00STf;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=irqHQQNU;
	dkim-atps=neutral
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QFtPk6xsSz3cKV
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  9 May 2023 19:38:18 +1000 (AEST)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.west.internal (Postfix) with ESMTP id 510B53200909;
	Tue,  9 May 2023 05:38:09 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Tue, 09 May 2023 05:38:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1683625088; x=1683711488; bh=JI
	GYjICWF1iIfi0CDhSvRnlPKKVSNYNlDX65zfQiumM=; b=I4f00STfLlF/8uXCTH
	3QpblrayO3QWqay0XoJFyDhSGixH93u1NpebSFNfjNuzTOvoj8liVXfe1F94W5Rf
	OkSrKPsHW5CuU0O1n0k6mggu+GTBSI/aou3nmMYv4bopXJdWnRpImUuuJczssOQ+
	nlk+zQ5fWguXF4QyfgIy+yXeh/fUk1+OamDH2mE02AK2FeEVzFdjp/ZkYF3f7WIC
	LIwJOvrGNIHyMm3GfL+mc2A3QpjuHP/knTB/o3RrDaqIa6igFFLXbN2J2tS7W0OZ
	O9Wt51WwuNP4vEqULDQIoB4aLzCG2tEy390anoUON9826Lqxxh2mvRVv16wDWwRA
	CvaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm3; t=1683625088; x=1683711488; bh=JIGYjICWF1iIf
	i0CDhSvRnlPKKVSNYNlDX65zfQiumM=; b=irqHQQNUKUqvUAWpf1VIoKg/G9Bt6
	oINt/vqLIbTfVMwG9Hc5BS3wM0rbLNDlp9dyFIk+K8+Yg+w4CyaCBkMNIzxaClt2
	5hKEmXIfTpuX0D57VxY0NRbGmHgrdfX9LgmsqsHxxYojoy6cFD/h297xpqpZ2dCm
	lgjUpyY5EApgsYS6fgKw+ibdPJPY3SWVhfBScpbBw297KiqjtIpYFOEKWx6uVBZE
	b0R51rMZ6QfJDFCbYlMztsHMKOUmxxlKnwnj3kyD0ejAc+LApjOXTCP8sFBPBWbp
	FSJfhVLzSwOexCHMh/u/lmkpf2d0AvcvV0c/5voSuhOmrHueXeXY33A2Q==
X-ME-Sender: <xms:fxRaZA_Ub9iK8xWlXqyIcc6uOkdIYRFhQ2MO1HuoJ9dmIsXEFLaf3w>
    <xme:fxRaZIvg7GcdRQOpg1jMA0HvMPQftuRhcyc5ZSdsuVGpbWVIflp8kq4JY9m-G-ZJV
    SnIqkn0V04I_3L7-qg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeegtddgudejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepheekfeduteffkeegieekvdffkedtkeeftefhfeejkeejgefhleekhfelheff
    vdetnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpshhouhhrtggvfigrrhgvrdhorh
    hgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghr
    nhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:fxRaZGDVHJPv_8wICJO5UOx_vULOMBKmGMOLmO0DbqAHdDw2Qx8Sgg>
    <xmx:fxRaZAeGXsQCwZusXvgF1StxgPbYalneVgw_y3tnkrhLFMC_jy3rjA>
    <xmx:fxRaZFMfYWVflVj5rOKIcutKIF5dLbPvZi1Iw7dHO-fYBDC-s9lWkg>
    <xmx:gBRaZCcVsH6XHVXaai7iby-iCY4PxFduF5s1msWOAJRYZEdcbjifDA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 85FE3B60086; Tue,  9 May 2023 05:38:07 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-415-gf2b17fe6c3-fm-20230503.001-gf2b17fe6
Mime-Version: 1.0
Message-Id: <b9624545-2c80-49a1-ac3c-39264a591f7b@app.fastmail.com>
In-Reply-To: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
References: <1683615903-10862-1-git-send-email-yangtiezhu@loongson.cn>
Date: Tue, 09 May 2023 11:37:46 +0200
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
Cc: Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, llvm@lists.linux.dev, linux-ia64@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-parisc@vger.kernel.org, x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, loongarch@lists.linux.dev, linux-alpha@vger.kernel.org, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org, bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org, loongson-kernel@lists.loongnix.cn
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, May 9, 2023, at 09:05, Tiezhu Yang wrote:
> Now we specify the minimal version of GCC as 5.1 and Clang/LLVM as 11.0.0
> in Documentation/process/changes.rst, __CHAR_BIT__ and __SIZEOF_LONG__ are
> usable, just define __BITS_PER_LONG as (__CHAR_BIT__ * __SIZEOF_LONG__) in
> asm-generic uapi bitsperlong.h, simpler, works everywhere.
>
> Remove all the arch specific uapi bitsperlong.h which will be generated as
> arch/*/include/generated/uapi/asm/bitsperlong.h.
>
> Suggested-by: Xi Ruoyao <xry111@xry111.site>
> Link: 
> https://lore.kernel.org/all/d3e255e4746de44c9903c4433616d44ffcf18d1b.camel@xry111.site/
> Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>

I originally introduced the bitsperlong.h header, and I'd love to
see it removed if it's no longer needed. Your patch certainly
seems like it does this well.

There is one minor obstacle to this, which is that the compiler
requirements for uapi headers are not the same as for kernel
internal code. In particular, the uapi headers may be included
by user space code that is built with an older compiler version,
or with a compiler that is not gcc or clang.

I think we are completely safe on the architectures that were
added since the linux-3.x days (arm64, riscv, csky, openrisc,
loongarch, nios2, and hexagon), but for the older ones there
is a regression risk. Especially on targets that are not that
actively maintained (sparc, alpha, ia64, sh, ...) there is
a good chance that users are stuck on ancient toolchains.

It's probably also a safe assumption that anyone with an older
libc version won't be using the latest kernel headers, so
I think we can still do this across architectures if both
glibc and musl already require a compiler that is new enough,
or alternatively if we know that the kernel headers require
a new compiler for other reasons and nobody has complained.

For glibc, it looks the minimum compiler version was raised
from gcc-5 to gcc-8 four years ago, so we should be fine.

In musl, the documentation states that at least gcc-3.4 or
clang-3.2 are required, which probably predate the
__SIZEOF_LONG__ macro. On the other hand, musl was only
released in 2011, and building musl itself explicitly
does not require kernel uapi headers, so this may not
be too critical.

There is also uClibc, but I could not find any minimum
supported compiler version for that. Most commonly, this
one is used for cross-build environments, so it's also
less likely to have libc/gcc/headers being wildly out of
sync. Not sure.

      Arnd

[1] https://sourceware.org/pipermail/libc-alpha/2019-January/101010.html
