Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 620FF6A09DE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Feb 2023 14:10:41 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PMtgL5VBJz3cND
	for <lists+linuxppc-dev@lfdr.de>; Fri, 24 Feb 2023 00:10:38 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=HxQNx9y5;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RNlma8km;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=HxQNx9y5;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=RNlma8km;
	dkim-atps=neutral
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PMtfL3v02z2xHJ
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 24 Feb 2023 00:09:44 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 22E3A581FE1;
	Thu, 23 Feb 2023 08:09:39 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 23 Feb 2023 08:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to; s=fm3; t=1677157779; x=1677164979; bh=7qpJ4fyuUV
	Fw9F28lxEJyIMUTjdhT7HcNbFM6c+Ezgs=; b=HxQNx9y5lkyPfQ9EucQyFAYeXv
	+wBR4Ci7rIGXcf143C5IPzx2ZqOJaNF3jH5KmZtz7FNxSNa7UoskPstWQeZigMq4
	WxcCQ/z8bM77PvSxe3rqZoHfF3/mUHrwHyZBzZyDjUboQ9PAUWQIgKxeLmPPaybo
	9/oRTW8VDP0nTjfHs0i59PhLTfNd8oWYpFzHOr0hyB1JlkxO557CYUNzTcaySrYq
	HfLz3P47VseG4GU6ljvciKdgu2WLAHI0ASvuTQe3I7jJxJymgUN3BAWU2M5XA1VM
	uz8KTTIcMwkEpMCm/wKVwxs95KyUmVotFEk351GtecxQeN6fTZ8IWLBMqI8Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:in-reply-to:message-id
	:mime-version:references:reply-to:sender:subject:subject:to:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1677157779; x=1677164979; bh=7qpJ4fyuUVFw9F28lxEJyIMUTjdh
	T7HcNbFM6c+Ezgs=; b=RNlma8km1MAuSRNBq9ipJtyRBtTc/ZaAqtJnrMAUd01N
	A3vr/e+h0oVB8QM+EKHuX7FBVUPTgKtTYa2OG7uDKF7mduylXrp7vgdnX2bpO6hn
	LS+Tf+OM77FKRpjy1JUZ2k0z0u/ejvDE6PI/VehVVhk2zuyRoIGqumjHPpY/bmKf
	gvFjjmEnsXN8V98XE2pj0tKi9Raz1zeD5754Phu10AF+P5RZcfvQiwYY0QyK/8IM
	Z39ZZNv3bEYOxSsbpEC/pekLv/VdBZd/iO4Lnr0WCAnTGVKHo4fDKs57IjC2i0EP
	d1qc3PDGC8rYTjrBw1CIt1iMeMmgiwXuDce1d0Oivw==
X-ME-Sender: <xms:kGX3Y3ous26euV3YoyiFJjq3ixwKAGVcNF8YOm8J6PvPHtK-RotuAw>
    <xme:kGX3YxqCegrJEbUNfah7isGKrsvvXcWdV6BiyY6iP9_c7iKPA4gwBe8CDKSxsQmsp
    iSx53Wsw9qCkCqiXG4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudekuddggeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:kGX3Y0MZZfqfcD0VGp9DlsZ1Swf2ynZlE3p_Z8X_FJsHbAIjqOEPMA>
    <xmx:kGX3Y65fZRpBccwKrsV3jr7sAnG0lDQI0aqT_-pKFxlTBQg3DS1ixA>
    <xmx:kGX3Y27Vy6XJ9Ep718BXrLdXAhCs5gSA4QbBN1kcE8ycfHfyCwcofw>
    <xmx:k2X3YyBwHlCTwxFQtAXbLNTtXf_KnKgFaDgG5zL8sv-qdX4Uj_y99g>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 24130B60086; Thu, 23 Feb 2023 08:09:36 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-172-g9a2dae1853-fm-20230213.001-g9a2dae18
Mime-Version: 1.0
Message-Id: <874b8076-b0d1-4aaa-bcd8-05d523060152@app.fastmail.com>
In-Reply-To:  <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
References: <20230214074925.228106-1-alexghiti@rivosinc.com>
 <20230214074925.228106-4-alexghiti@rivosinc.com>
 <Y+zXIgwO5wteLQZ5@shell.armlinux.org.uk>
 <f3e1585c-0d9d-4709-9b21-74a63d8cc9ac@app.fastmail.com>
 <CAHVXubgsvjxGbgM6AcxfsHDsHT0iL2pAemGMr5t8KVLKiqC3RA@mail.gmail.com>
Date: Thu, 23 Feb 2023 14:09:17 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Alexandre Ghiti" <alexghiti@rivosinc.com>
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
Cc: Rich Felker <dalias@libc.org>, linux-ia64@vger.kernel.org, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, linux-mips@vger.kernel.org, "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, WANG Xuerui <kernel@xen0n.name>, Will Deacon <will@kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Linux-Arch <linux-arch@vger.kernel.org>, linux-s390@vger.kernel.org, linux-snps-arc@lists.infradead.org, Yoshinori Sato <ysato@users.sourceforge.jp>, Jonathan Corbet <corbet@lwn.net>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Ingo Molnar <mingo@redhat.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, Christian 
 Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, linux-m68k@lists.linux-m68k.org, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, loongarch@lists.linux.dev, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Chris Zankel <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, linux-alpha@vger.kernel.org, Borislav Petkov <bp@alien8.de>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 23, 2023, at 10:54, Alexandre Ghiti wrote:
> On Wed, Feb 15, 2023 at 2:05 PM Arnd Bergmann <arnd@arndb.de> wrote:
>>
>> On Wed, Feb 15, 2023, at 13:59, Russell King (Oracle) wrote:
>> > On Tue, Feb 14, 2023 at 08:49:04AM +0100, Alexandre Ghiti wrote:
>> >> From: Palmer Dabbelt <palmer@rivosinc.com>
>> >>
>> >> As far as I can tell this is not used by userspace and thus should not
>> >> be part of the user-visible API.
>> >>
>> >> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
>> >
>> > Looks good to me. What's the merge plan for this?
>>
>> The easiest way is probably if I merge it through the whole
>> series through the asm-generic tree. The timing is a bit
>> unfortunate as we're just ahead of the merge window, so unless
>> we really need this in 6.3, I'd suggest that Alexandre resend
>> the series to me in two weeks with the Acks added in and I'll
>> pick it up for 6.4.
>
> Sorry for the response delay, I was waiting to see if Palmer would
> merge my KASAN patchset in 6.3 (which he does): I have to admit that
> fixing the command line size + the KASAN patchset would allow 6.3 to
> run on syzkaller, which would be nice.
>
> If I don't see this merged in 6.3, I'll send another round as you
> suggested in 1 week now :)

Hi Alexandre,

I have no plans to still pick up the series for 6.3. The patches
all look fine to me, but it's clearly too late now. What is the
actual dependency for KASAN, do you just need a longer command
line or something else? If it's just the command line size,
I would suggest that Palmer can still pick up a oneline change
to increase it and refer to this thread in the changelog as a
reference for why it is not an actual UAPI break.

     Arnd
