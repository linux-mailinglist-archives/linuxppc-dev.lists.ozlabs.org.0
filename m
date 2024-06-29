Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A769791CF2B
	for <lists+linuxppc-dev@lfdr.de>; Sat, 29 Jun 2024 23:16:47 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lGD4HYeM;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pttxMWzJ;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WBQ981LTwz3cX9
	for <lists+linuxppc-dev@lfdr.de>; Sun, 30 Jun 2024 07:16:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=arndb.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=lGD4HYeM;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=pttxMWzJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=64.147.123.157; helo=wfhigh6-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 593 seconds by postgrey-1.37 at boromir; Sun, 30 Jun 2024 07:16:01 AEST
Received: from wfhigh6-smtp.messagingengine.com (wfhigh6-smtp.messagingengine.com [64.147.123.157])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WBQ8K2HG8z30Wd
	for <linuxppc-dev@lists.ozlabs.org>; Sun, 30 Jun 2024 07:16:01 +1000 (AEST)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfhigh.west.internal (Postfix) with ESMTP id 82CAF1800099;
	Sat, 29 Jun 2024 17:06:01 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Sat, 29 Jun 2024 17:06:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1719695161; x=1719781561; bh=GZ6e31l0eU
	0HBfpZN9NPc8YVWdePfL7XMhkPKJ3qUo8=; b=lGD4HYeMu3zX2B6rMUxsNDmkx9
	doj+1na9uH7lXIG/u9ZQAJqYbbXz73dRr4UpodsQfspJDFsUobxr9eGHmlkACxam
	C9QR5vMZjr+P/Jfunb0+vW6XHwuz6/R/B8rRdEzFAx6V9sfkBVl/X2PJKSaZS7w7
	QALZ2IVSAzHZ/Rp5pZvOSQ+ReI0qS7+67UnLR1DxTiaIAJRtO8WhfIELir13Wt8s
	KowmEiOSnNltszVjkhLPRDrvLE2lIcrTNAmIYfgoIsQ82Bzf705R7K98kV5uWPRC
	rkR6zyzur/prHHn25+4Q4cC7MiumgMVqejTK8vBd9QmbOmq+av4D4j25cgFg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1719695161; x=1719781561; bh=GZ6e31l0eU0HBfpZN9NPc8YVWdeP
	fL7XMhkPKJ3qUo8=; b=pttxMWzJvDFMeJBUdzP3EtaS84eFVNzpH1fN/+TngLjx
	ZvfzebXM9uXNRF6iUrLBsUMkgQ2ZlV2GLzmMteHcQQCyuxAaznLHE1gcCZgc7f1R
	HJEEIlai6wwfCvlb8qkWaBw9zRn+bYE6873TAUZDCG6Ctby4zTdy8tjbqEOjCAbB
	x+GkhJ2vfBDFfbUGo3fKLjDwGNfQ5we5hmQ/fOJVhE4rLOdoQ3iFa0ChftPLGZ5K
	gFC6eRlYvq4fW6VNllWQspF2ioUbPjd2ViMAed0wVEOOqDwH3MbpBJWkVkSJAYKp
	msCkmhNAwXk8klLnCjTL5AHIqxHBVsjKJjCiCkaevQ==
X-ME-Sender: <xms:NneAZqgo27T24kaZCuGdcWmHY3T_lXiB2CE7frpx3k62jXmNovK2uQ>
    <xme:NneAZrBbrVr5saMIB7ghju2LiK0F_uqCccw_VQfZO3TSZHgjDXf8y7jrL3IfN5IPz
    TY6_qJGsdudJQvM2t8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrtdelgdduheekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepvefhffeltdegheeffffhtdegvdehjedtgfekueevgfduffettedtkeekueef
    hedunecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
    dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:NneAZiGC0HnTL2v7O8hJldRxxvy926gchW6ck74sSIX6qimfzzny1A>
    <xmx:NneAZjR6AAwezTX448A3OWJgbZecfzHh21QspyW5LAQC7Hp-aDKaKQ>
    <xmx:NneAZnyEMoamDQzK2PrFjvRyOd73uDwFc05XS_xFb-IoSS1S_kxwSA>
    <xmx:NneAZh5twLHAdNMekV7VhtIMtWXM1C-KwuF8aZ08c7bxOMj92W1SLQ>
    <xmx:OXeAZg-nhJZW9uSqHFfkndVr8i2R3r4TNMu05gKV0KZ2EnvccAfHILal>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AB781B6008D; Sat, 29 Jun 2024 17:05:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-538-g1508afaa2-fm-20240616.001-g1508afaa
MIME-Version: 1.0
Message-Id: <d1408856-1d06-4aae-8b44-06e73ac001f8@app.fastmail.com>
In-Reply-To: <a913c77e-1abb-409f-86b9-8805c1451988@roeck-us.net>
References: <20240624163707.299494-1-arnd@kernel.org>
 <20240624163707.299494-7-arnd@kernel.org>
 <a913c77e-1abb-409f-86b9-8805c1451988@roeck-us.net>
Date: Sat, 29 Jun 2024 23:05:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH v2 06/13] parisc: use generic sys_fanotify_mark implementation
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
Cc: Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, linux-kernel@vger.kernel.org, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-hexagon@vger.kernel.org, Helge Deller <deller@gmx.de>, linux-sh@vger.kernel.org, Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, "musl@lists.openwall.com" <musl@lists.openwall.com>, Nicholas Piggin <npiggin@gmail.com>, Alexander Viro <viro@zeniv.linux.org.uk>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Brian Cain <bcain@quicinc.com>, Christian Brauner <brauner@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Xi Ruoyao <libc-alpha@sourceware.org>, linux-parisc@vger.kernel.org, linux-mips@vger.kernel.org, Adhemerval Zanella Netto <adhemerval.zanella@linaro.org>, linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Jun 29, 2024, at 19:46, Guenter Roeck wrote:

> Building parisc:allmodconfig ... failed
> --------------
> Error log:
> In file included from fs/notify/fanotify/fanotify_user.c:14:
> include/linux/syscalls.h:248:25: error: conflicting types for 
> 'sys_fanotify_mark'; have 'long int(int,  unsigned int,  u32,  u32,  
> int,  const char *)' {aka 'long int(int,  unsigned int,  unsigned int,  
> unsigned int,  int,  const char *)'}
>   248 |         asmlinkage long 
> sys##name(__MAP(x,__SC_DECL,__VA_ARGS__))       \
>       |                         ^~~
> include/linux/syscalls.h:234:9: note: in expansion of macro 
> '__SYSCALL_DEFINEx'
>   234 |         __SYSCALL_DEFINEx(x, sname, __VA_ARGS__)
>       |         ^~~~~~~~~~~~~~~~~

Thanks for the report, this has escaped my build testing
since I had fanotify disabled on the parisc build.

Sent a fix now and queued it as a fix in the asm-generic
tree:

https://lore.kernel.org/lkml/20240629210359.94426-1-arnd@kernel.org/T/#u

     Arnd
