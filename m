Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 366747BCA87
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 01:41:00 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=permerror header.d=arndb.de header.i=@arndb.de header.a=rsa-sha1 header.s=fm2 header.b=omPecccg;
	dkim=permerror header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha1 header.s=fm2 header.b=B//wub1a;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4S31yL0qLpz3vdK
	for <lists+linuxppc-dev@lfdr.de>; Sun,  8 Oct 2023 10:40:58 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm2 header.b=omPecccg;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=B//wub1a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4S2KmS56Qlz3cmK
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  7 Oct 2023 07:30:00 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id F0AFA580189;
	Fri,  6 Oct 2023 16:29:56 -0400 (EDT)
Received: from imap50 ([10.202.2.100])
  by compute5.internal (MEProxy); Fri, 06 Oct 2023 16:29:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1696624196; x=1696631396; bh=BV
	WEu9N65Klz9zi6Gx/GBcHI5219Lk7Ewdrm46HwRAI=; b=omPecccgnOwKKqkgkh
	fXaQbvuxDrNgtA0Fclg0Qav7KkGDwqJo4MUk5a4bIXeKPAUFffAhW5bTk5lWIZ4J
	FZ/sYP0LIkckXlFBpbKyUucWaj+2FXXCyMdOkQ508Xtl1yc6x/8RcAUe5RIcqQK0
	BvwVU23ocFfQIKHIRy67i0+lV6PEQXGXK46KfHHPo4+vCI6KOzcmWd8r2xDj0IkS
	6emTCcuHN85dAOlF7GtL5pzwrITagf7qIj6jotxIhC0VdPPCLYJB62QndDxqvy++
	P98JjOj3Evc5z5dUgs/dTF1CV/x0dKHj+31NxnRgNPYo0hZlFXuYEQjMfQPOtmNZ
	B0WA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1696624196; x=1696631396; bh=BVWEu9N65Klz9
	zi6Gx/GBcHI5219Lk7Ewdrm46HwRAI=; b=B//wub1a8aWIVbQHcPyg1L2Vo+aHy
	6HnaNtW3kxNZHPNNURAs42vjI5Oge/4/672MKqI6cNh+b+yEmTOiMBjuBgECoQFi
	Yyp8ka0zAXE8Nu7WKWyUQfMOv7TZvYy03gqXk6usbF5IWZZmE2dWCDmI1QjPErxZ
	9RJmU92BHh97nqDyWfZkiw7XwS4RAlZvcqfraSQRIyeNCfGNUDzV35rj/1sUzhDo
	lNkh0gOaK+prBEjE+zcflLPiIohuGQFjOjj9jm98/ARIQujR5wzb1Y/+n14E3qp6
	W6IjrUFHljQdH81+zUP1NLC8VzHpvwDDwvvUaxS8y7H7Wu40XR0QHv+/w==
X-ME-Sender: <xms:QW4gZTa3cNl67fqLKQRADDd1fjb9SyD3FkWpuubpQTvvqRWSWyQNlA>
    <xme:QW4gZSaiVtvX42rVgpGqYkntDuhATH6PzD5fBBLwcOFOK4MmKRfnhhIOlXl-Ea5R5
    KIV2caTtPTqqtmUdbY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrgeeigddugeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:Qm4gZV-G-Z_NUxjVDne1z0PRyjPRZAefw5FdMYDKMi_yaUqY19Lfjw>
    <xmx:Qm4gZZr8btK_0uekt1uxPu676Y_Jv6c_dLVQtmb7w52FBxKToOQR1A>
    <xmx:Qm4gZeqtb_ZvR8W-To1Y-EmiB0SrR3R4tL2KcNWXZ3G0drsxPfyC4w>
    <xmx:RG4gZay2kbKLMuzGt87T6u4wwrRjylvwHM0azqtv77JMnaVGEOXcWg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id A7E4B1700093; Fri,  6 Oct 2023 16:29:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-958-g1b1b911df8-fm-20230927.002-g1b1b911d
MIME-Version: 1.0
Message-Id: <5d397fe4-a520-4336-b966-29bc5b798236@app.fastmail.com>
In-Reply-To: <3bd9a85c6f10279af6372cf17064978ad38c18b3.camel@intel.com>
References: <20230914185804.2000497-1-sohil.mehta@intel.com>
 <487836fc-7c9f-2662-66a4-fa5e3829cf6b@intel.com>
 <231994b0-ca11-4347-8d93-ce66fdbe3d25@app.fastmail.com>
 <622b95d8-f8ad-5bd4-0145-d6aed2e3c07d@intel.com>
 <3bd9a85c6f10279af6372cf17064978ad38c18b3.camel@intel.com>
Date: Fri, 06 Oct 2023 22:29:32 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Rick Edgecombe" <rick.p.edgecombe@intel.com>,
 "Sohil Mehta" <sohil.mehta@intel.com>,
 "Dave Hansen" <dave.hansen@linux.intel.com>,
 "Ingo Molnar" <mingo@redhat.com>, Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-api@vger.kernel.org" <linux-api@vger.kernel.org>
Subject: Re: [PATCH v2] arch: Reserve map_shadow_stack() syscall number for all
 architectures
Content-Type: text/plain
X-Mailman-Approved-At: Sun, 08 Oct 2023 10:36:54 +1100
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Rich Felker <dalias@libc.org>, "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>, "linux-sh@vger.kernel.org" <linux-sh@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, Adrian Hunter <adrian.hunter@intel.com>, "James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, Max Filippov <jcmvbkbc@gmail.com>, Andreas Schwab <schwab@linux-m68k.org>, "H. Peter Anvin" <hpa@zytor.com>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, Sven Schnelle <svens@linux.ibm.com>, Helge Deller <deller@gmx.de>, "x86@kernel.org" <x86@kernel.org>, Russell King <linux@armlinux.org.uk>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Geert Uytterhoeven <geert@linux-m68k.org>, Lu
 kas Bulwahn <lukas.bulwahn@gmail.com>, Matt Turner <mattst88@gmail.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Sergei Trofimovich <slyich@gmail.com>, "gor@linux.ibm.com" <gor@linux.ibm.com>, Brian Gerst <brgerst@gmail.com>, Heiko Carstens <hca@linux.ibm.com>, Richard Henderson <richard.henderson@linaro.org>, Nicholas Piggin <npiggin@gmail.com>, "linux-m68k@lists.linux-m68k.org" <linux-m68k@lists.linux-m68k.org>, Mark Brown <broonie@kernel.org>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Arnaldo Carvalho de Melo <acme@kernel.org>, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Deepak Gupta <debug@rivosinc.com>, "chris@zankel.net" <chris@zankel.net>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, "linux-parisc@vger.kernel.org" <linux-parisc@
 vger.kernel.org>, Rohan McLure <rmclure@linux.ibm.com>, Randy Dunlap <rdunlap@infradead.org>, "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-perf-users@vger.kernel.org" <linux-perf-users@vger.kernel.org>, "Eric W. Biederman" <ebiederm@xmission.com>, Jiri Olsa <jolsa@kernel.org>, "linux-alpha@vger.kernel.org" <linux-alpha@vger.kernel.org>, Borislav Petkov <bp@alien8.de>, Andrew Morton <akpm@linux-foundation.org>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Oct 6, 2023, at 22:01, Edgecombe, Rick P wrote:
> On Tue, 2023-10-03 at 10:18 -0700, Sohil Mehta wrote:
>> > If you like, I can pick this up for 6.7 through the asm-generic
>> > tree. If you think this should be part of 6.6, I would suggest
>> > to merge it through the tree that originally contained the
>> > syscall code.
>> > 
>> 
>> Dave, Ingo, would you prefer to take this patch through 6.6 or defer
>> it
>> until 6.7?
>> 
>> It's not necessarily a fix but it does help finish up the shstk
>> syscall
>> added with 6.6. Also, it might help reduce some merge conflicts later
>> if
>> newer syscalls are being added during the 6.7 window.
>
> Hi Arnd,
>
> It doesn't look like anyone is pouncing on the syscall number in linux-
> next currently. It might be nice to have this patch go through linux-
> next since it touches so many architectures. And it sounds like x86
> folk are ok with this, so if you could pick it up for 6.7 that would be
> great. Thanks!

Ok, I picked it up now, should be in linux-next starting next week.

     Arnd
