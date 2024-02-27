Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDC4869746
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 15:19:51 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lPUTGKxS;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NPNMT8iD;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tkfks5Hb8z3vb5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 01:19:49 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=lPUTGKxS;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=NPNMT8iD;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tkfk11zBcz2yNf
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 01:19:04 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id 8717758176A;
	Tue, 27 Feb 2024 09:19:00 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 09:19:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1709043540;
	 x=1709050740; bh=lgwXV027qrMgBZRGGg484htOjeaxN2ck0Zcve0Dmzhs=; b=
	lPUTGKxSZWT3KviA8nwQtQixUNSRKDoofN2NivSWKtva1+uopGcYEEr4RC46c0a4
	vwDyryLlG3/SO1o0IgHaIAKElGDgOIftHdg/t1LowfBfp6kWJ/02DSeWOd9gO01Y
	i2xNDAt65lcr61a9rbStiacnnPLSzVXxNfz+qirJEOwE6l4Mjsb9FPSq6beDfONs
	IfFnZ9bxqqqY3xHHTJ0xelGfB0mkN5vK/R1PlQWSfAeazO2LUPLczof7Is+mk4YY
	dS7xeAUB8mFbzZwvSoSrgsd+tbYj/Jm83Sm5bzumIEzMe8eZVlLb2zqJj5ACbn1Q
	xHdhr1utw0PFFSmpN8T17A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1709043540; x=
	1709050740; bh=lgwXV027qrMgBZRGGg484htOjeaxN2ck0Zcve0Dmzhs=; b=N
	PNMT8iDaqBhcmripVnSD6nS3Lv42kN3UYBW99FRUWa3TpEGbwqC5etBXkzZPJQ97
	b46+HgX1sO+sVYOqI7WWoftMMpP1d6mFgSc+COHXzownsJ7ep9c7luzipVKN/JSm
	WvBS91t32eqhnz4okM6kGJHX7ja6nxAsDWD2f8/n1iyXi5CXN1O8cRQmzdP0MN3P
	lXLGSaSOyRMNG2Klv5JGjNbEL+jZ99PzUXZkK0dRYXnY7Sh9tCeVVIPOdKairDq/
	hVJllB8wVwsQCnLlNf4DWkeeaaUPJ42yyj0cK8PqRkYPiog+0wCNiowoUDAfMSZ0
	TxOSo3YO5XIRZlykzYViQ==
X-ME-Sender: <xms:Uu_dZWjk9CPDDtuHUq0spRBOyt_ieWSB_NQxrFGLmr24EkUFHc8YHg>
    <xme:Uu_dZXDMUFx8ZF-9sPWppPSzjc83i6I1db9CmveKWGMIeJFPSdAeNSa88BpcqoNFB
    jVJuLbK_PRbbcnDDkw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdefkecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepgeefjeehvdelvdffieejieejiedvvdfhleeivdelveehjeelteegudektdfg
    jeevnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Uu_dZeEDtHRL9UWe85NwoKrx0otX3SNqDfDiZ5hOf70Z6GsgUqDdIw>
    <xmx:Uu_dZfQ4cWIo6G3rC1HFzafsQ2XymenYLV7MaNYtE0ltPhY45Lm3AA>
    <xmx:Uu_dZTw8lPg-bwLBWej0tpp3R0mNAVRklOB_4I0L7nRbPx69459aug>
    <xmx:VO_dZbOruGZOL_Pr3S4l_raiy6WMSNlORBuJgrWys66FFVcptlS8dQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 8FBCAB6008D; Tue, 27 Feb 2024 09:18:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <7b62e73d-d3fa-4432-807d-c2e667814b17@app.fastmail.com>
In-Reply-To:  <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
 <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
 <CAMuHMdXQYPtL0J4Phm81S1qWpi7no=1r4uStbLd8zbjn7fcWQw@mail.gmail.com>
Date: Tue, 27 Feb 2024 15:18:38 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Greg Ungerer <gerg@linux-m68k.org>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Brian Cain <bcain@quicinc.com>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutom
 irski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024, at 12:12, Geert Uytterhoeven wrote:
> On Tue, Feb 27, 2024 at 11:59=E2=80=AFAM Arnd Bergmann <arnd@arndb.de>=
 wrote:
>> On Tue, Feb 27, 2024, at 09:54, Geert Uytterhoeven wrote:
>> I was a bit unsure about how to best do this since there
>> is not really a need for a fixed page size on nommu kernels,
>> whereas the three MMU configs clearly tie the page size to
>> the MMU rather than the platform.
>>
>> There should be no reason for coldfire to have a different
>> page size from dragonball if neither of them actually uses
>> hardware pages, so one of them could be changed later.
>
> Indeed, in theory, PAGE_SIZE doesn't matter for nommu, but the concept
> of pages is used all over the place in Linux.
>
> I'm mostly worried about some Coldfire code relying on the actual value
> of PAGE_SIZE in some other context. e.g. for configuring non-cacheable
> regions.

Right, any change here would have to be carefully tested. I would
expect that a 4K page size would reduce memory consumption even on
NOMMU systems that should have the same tradeoffs for representing
files in the page cache and in mem_map[].

> And does this impact running nommu binaries on a system with MMU?
> I.e. if nommu binaries were built with a 4 KiB PAGE_SIZE, do they
> still run on MMU systems with an 8 KiB PAGE_SIZE (coldfire and sun3),
> or are there some subtleties to take into account?

As far as I understand, binaries have to be built and linked for
the largest page size they can run on, so running them on a kernel
with smaller page size usually works.

One notable exception is sys_mmap2(), which on most architectures
takes units of 4KiB but on m68k is actually written to take
PAGE_SIZE units. As Al pointed out in f8b7256096a2 ("Unify
sys_mmap*"), it has always been wrong on sun3, presumably
because users of that predate modern glibc. Running coldfire
nommu binaries on coldfire mmu kernels would run into the same
bug if either of them changes PAGE_SIZE. If you can run
coldfire nommu binaries on classic m68k, that is already
broken in the same way.

      Arnd
