Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A00A6D2691
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 19:21:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp6XC3jlCz3fXl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 04:21:31 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=NzNnOxCF;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=U+cgwONx;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.224; helo=new2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=NzNnOxCF;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=U+cgwONx;
	dkim-atps=neutral
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp6WG6QS1z3c4B
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 04:20:41 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id ED12F5825B1;
	Fri, 31 Mar 2023 13:20:37 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 13:20:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680283237; x=1680290437; bh=Io
	6Y2nZvpWRrWXAKol5WpEbEU7vs4k1dMfq+xXU6ebw=; b=NzNnOxCFwRCxKTIhBp
	UkTdA1QrJ0VBJBAssHPYnFLTEc20QImZBr+yhF1WHFOwiVQ/TkKmYOFyeYEr7/8r
	GD1FXZ+DOdP4irwH+qJns8z0e3B/ONHZgjzpSHCzaPaMhJFZzUPm3TK2xUS0BQlh
	V9VtSyul+J/OV+r3iY3+NHZkA/eHv3BHVJqTGYmRGB+AKO62xQhh3c/bffk1QrCL
	4R0Dy4NdEfwvXMfOXe9abUeXxvUMNzrGZC+L2sJKtKN5Y24hiaazrc9fhLwyYNrz
	RuUulKg1j4ExMX9feY2TsdjGjqZMe6J9bcUYIHHFkMRYqyDd5msKT4MskvSGpcAG
	21NA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680283237; x=1680290437; bh=Io6Y2nZvpWRrW
	XAKol5WpEbEU7vs4k1dMfq+xXU6ebw=; b=U+cgwONxidqWgKBVF4Cwme9zOzYI2
	GHfNWmF7faOn2hpYWAXr9uCaB+kRfx8x+If9o7AiJRQdXmZzrLTIx+01XlSobpGj
	tx/B80EyyvLzhr0jS+WvKCsZENulYL7m5wPMUTdJb7/jnKnzVYJe9r53sFvFdoUS
	ORJ0wKGqlFZ/gnR1aDkea3h9mr+spOIyBw2wQ5ta5IE5aJ2ENRQn77Ui1q5LYroG
	Ey/jSpqL6OllDKNAU05Fmyz8Di7Du486u0d4ZaTD/TXHw+8DPr0T0wqs2W1r3ODK
	XNS0I4c5ax7vZ0LR3yLyhzXIyKPFJT8esJCNqFzAmfFa35y/YQvJUZmdw==
X-ME-Sender: <xms:YxYnZFHZks67OPDKgqM3qNN1TrlveZNOuQOJuwJ7nkUmBpfYrB4jOA>
    <xme:YxYnZKVpZ8DtZm9lpeqkdhWozXvOOYyLLHmXUbWyTH7ZHAbHnlhCIWBJyqSHtQL49
    neyAs4_hbX1694_koU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdet
    rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
    htthgvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedt
    keetffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:YxYnZHKRbkbB-44_TpVFkjPVaYYSIMc47ok1I9ZYEBlajcxJz7OEbg>
    <xmx:YxYnZLHFu4lfS71F1yqzdUx9_eqZeQ-f2fZ0nfGecguxlfzUs5YbfQ>
    <xmx:YxYnZLX2_1EWxKGOoANqHtihIaHICg9c9O-TrgOS4Ld0OigXHrR5FQ>
    <xmx:ZRYnZO0TSJVIJiVIXYibXzBAOoD0hgjOerlHiYWlfC4-7fTTbUhOEQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id AD8E3B60092; Fri, 31 Mar 2023 13:20:35 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <f32d19da-8f33-4707-8be2-65dc060f4a78@app.fastmail.com>
In-Reply-To: <cc3a78b6-b126-226f-b41a-061716aacd15@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
 <df6340c8-6ac2-4459-a9e5-c411020962d6@app.fastmail.com>
 <cc3a78b6-b126-226f-b41a-061716aacd15@arm.com>
Date: Fri, 31 Mar 2023 19:20:10 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Robin Murphy" <robin.murphy@arm.com>, "Arnd Bergmann" <arnd@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 20/21] ARM: dma-mapping: split out arch_dma_mark_clean() helper
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal 
 Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, linuxppc-dev@lists.ozlabs.org, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023, at 17:12, Robin Murphy wrote:
> On 31/03/2023 3:00 pm, Arnd Bergmann wrote:
>> On Mon, Mar 27, 2023, at 14:48, Robin Murphy wrote:
>> 
>> To be on the safe side, I'd have to pass a flag into
>> arch_dma_mark_clean() about coherency, to let the arm
>> implementation still require the extra dcache flush
>> for coherent DMA, while ia64 can ignore that flag.
>
> Coherent DMA on Arm is assumed to be inner-shareable, so a coherent DMA 
> write should be pretty much equivalent to a coherent write by another 
> CPU (or indeed the local CPU itself) - nothing says that it *couldn't* 
> dirty a line in a data cache above the level of unification, so in 
> general the assumption must be that, yes, if coherent DMA is writing 
> data intended to be executable, then it's going to want a Dcache clean 
> to PoU and an Icache invalidate to PoU before trying to execute it. By 
> comparison, a non-coherent DMA transfer will inherently have to 
> invalidate the Dcache all the way to PoC in its dma_unmap, thus cannot 
> leave dirty data above the PoU, so only the Icache maintenance is 
> required in the executable case.

Ok, makes sense. I've already started reworking my patch for it.

> (FWIW I believe the Armv8 IDC/DIC features can safely be considered 
> irrelevant to 32-bit kernels)
>
> I don't know a great deal about IA-64, but it appears to be using its 
> PG_arch_1 flag in a subtly different manner to Arm, namely to optimise 
> out the *Icache* maintenance. So if anything, it seems IA-64 is the 
> weirdo here (who'd have guessed?) where DMA manages to be *more* 
> coherent than the CPUs themselves :)

I checked this in the ia64 manual, and as far as I can tell, it originally
only had one cacheflush instruction that flushes the dcache and invalidates
the icache at the same time. So flush_icache_range() actually does
both and flush_dcache_page() instead just marks the page as dirty to
ensure flush_icache_range() does not get skipped after a writing a
page from the kernel.

On later Itaniums, there is apparently a separate icache flush
instruction that gets used in flush_icache_range(), but that
still works for the DMA case that is allowed to skip the flush.

> This is all now making me think we need some careful consideration of 
> whether the benefits of consolidating code outweigh the confusion of 
> conflating multiple different meanings of "clean" together...

The difference in usage of PG_dcache_clean/PG_dcache_dirty/PG_arch_1
across architectures is certainly big enough that we can't just
define a a common arch_dma_mark_clean() across architectures, but
I think the idea of having a common entry point for
arch_dma_mark_clean() to be called from the dma-mapping code
to do something architecture specific after a DMA is clean still
makes sense, 

     Arnd
