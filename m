Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B3CC697CB4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Feb 2023 14:06:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PGyy21qHfz3fYd
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Feb 2023 00:06:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PPD6X7vd;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Tp/P1vDt;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=PPD6X7vd;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=Tp/P1vDt;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PGyx01qZPz3c6d
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 16 Feb 2023 00:05:23 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 2D40B582003;
	Wed, 15 Feb 2023 08:05:20 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Wed, 15 Feb 2023 08:05:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1676466320; x=1676473520; bh=NzdIn9sEy/
	TdUrl/ZdBVY4dMEk2Tnlph7NyUne+YOMM=; b=PPD6X7vdu8v5pQCFFeEkwZ+xGH
	hQxkzIm/THMwEiH6lmaNEBYbBzt3pargJVOdi2J1QMA6KHvLC9K1XeMABvJeeUMa
	lTPgSxuAXiTHnvnPs7+H7Vr/fKIWrN+XZApp3CpAC5yE5WgT9W327fh6++AuDJlF
	B9gywk5zLcSwCMvFm6irNxbf5/UMEQOklyQcP+yNMbxqWsOqNEYHAAgGHFLNZqZS
	WLgt7CmsFbv+vqD/Mh8pW6i09fttS8BnRngWkrvO1YOvB+eqJf9YBCzB8hRdQL8g
	Zrmyq7fkrOXYnHgcPd99guxknzQGmfAMstEvWh3k4ZTVkZadU+R5weMlaG7A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1676466320; x=1676473520; bh=NzdIn9sEy/TdUrl/ZdBVY4dMEk2T
	nlph7NyUne+YOMM=; b=Tp/P1vDtiwaXsxOOvmxonT9LDeiFaEudeIfZX0AV5xmw
	X3ENq+2GlESFOAR7xURKTITb3Q9/bLEcQhyKkak30WygkBgQXOUwH+1TEYwAnfSW
	VN79grgOoloKlVxQxKg9d/GE/aNuuNhUwV2IHK4xpJLpSY9XO1XpwbGHxBbR0DF/
	IjnWEESEaF5s9xx5Zj0yYZVtiwtJOFrRCp6Vfpm8unxAKwLTF76Egia3fqB+SRTf
	HhmCGeRY4V0PNJ2mo3ZpzkurciWsN1Fx3VZnNvLG3nNn/NwNqCwiyIzXTWlmQOpN
	G3WAp6KoO5IxE4n9w+AW7QNxTKU5fRGQe3g4//HLhw==
X-ME-Sender: <xms:jdjsY_Wh-8LcQ3nmLEwGZ7X-cUO_UZrmKOzBi9pl67XX_YGZ0IXNyA>
    <xme:jdjsY3kveCSQ-Laj-6oAgDyXLkBUjq7fx_C7UYY5m4XU_HQAFhNFJiZGPFSylztsR
    Jx6pcGWaR_WFw62yQQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudeihedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:jdjsY7ZEvyr4y1ulYt1S1iPqX3mkImnPSdU2AD0rfL5VPKqJb7xP1w>
    <xmx:jdjsY6Ux13tFNHeawURlV0JH7DjSnY4lgf_B232j8MtUR1dl7xMefQ>
    <xmx:jdjsY5klmieqtEjUAp2jmIMBcwIQHQA6TF9wkqBiRc9-j4DSJjfhdQ>
    <xmx:kNjsY5_DeMdprgdbaWkVv0vgYRqpvs9Cxn7CSU6n-WZIW-e7MJJXrA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 79450B60086; Wed, 15 Feb 2023 08:05:17 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-156-g081acc5ed5-fm-20230206.001-g081acc5e
Mime-Version: 1.0
Message-Id: <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
In-Reply-To: <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
 <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
Date: Wed, 15 Feb 2023 14:04:59 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>,
 "Alexandre Ghiti" <alexghiti@rivosinc.com>
Subject: Re: [PATCH v3 03/24] arm: Remove COMMAND_LINE_SIZE from uapi
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com
 >, linux-xtensa@linux-xtensa.org, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
> On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>> From: Palmer Dabbelt <palmer@rivosinc.com>
>> 
>> As far as I can tell this is not used by userspace and thus should not
>> be part of the user-visible API.
>> 
>> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> Looks good to me. What's the merge plan for this?

The easiest way is probably if I merge it through the whole
series through the asm-generic tree. The timing is a bit
unfortunate as we're just ahead of the merge window, so unless
we really need this in 6.3, I'd suggest that Alexandre resend
the series to me in two weeks with the Acks added in and I'll
pick it up for 6.4.

     Arnd
