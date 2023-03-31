Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E11876D211B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 15:05:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp0rr5qtVz3fWs
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 00:05:32 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=uZNEHaxz;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KUzHmHuP;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=uZNEHaxz;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=KUzHmHuP;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp0qz6BP0z2yNy
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 00:04:47 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id BE5C8582670;
	Fri, 31 Mar 2023 09:04:45 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 09:04:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680267885; x=1680275085; bh=Yf
	6BPXqc5+4lmQ5wl2xtIuAGvUiY5BeudyAFy0EZ0G8=; b=uZNEHaxzYCVqJlOAFe
	QyTGIrtKOzaG3cycJ6z13gjgQTZlhniIOf1HqwjYjO+LKgEQjawzudKts8yI8F6C
	s8uj/7ZqVN8UGH5ZgZFIXMyd5b75HqrmeNrZ8vsEJBVSpi2J3ZWlL4UkN8mHXtQA
	GGAWo9PRgMqmoTCuDthWrNh+w6KhXBpQbLLxMJMKAnJljfVDgqgBdZYQ1YQkl+H6
	LZF9xoMeCYQEcBMHzHxAdJ1E4ywnG504K4JuUFuXrw0flCzwupmtajEoLwVwD19b
	WT1JJ6Nt4Zmjo8gqjmpMMSo4dacmgE9f6vIbQ+V6NrcMdQ2gozhdVyKm6v87HBEM
	ZV+g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680267885; x=1680275085; bh=Yf6BPXqc5+4lm
	Q5wl2xtIuAGvUiY5BeudyAFy0EZ0G8=; b=KUzHmHuPZ/ods4YSgTzEfYrM3rPW4
	wY1sW3YIixU8cPi3ERC0CqbsRY1SanLUJ0aZrBgOR4qWoyaz63HiFfoH3UAybnQT
	l28FyLxSxhC8yvKK0U29T5xndO1MnAOFIprhP3Ccq4nl8DZqPNjxy1R1RtNY8tPM
	10Qj7i/N0QTRDJZBhjBFHWgb2R8ePLqUj5cPixNs1c/I5cS8MzaXIOWn+kPofhss
	o5aXvgsWtBzOhKzG5Xt8hpy17hyFm2BD/GRH9jCAvBdUli4r8v/AMdn17Lkc1Dnf
	2N0OT3xREpdvfAtCeC38I5tHCQLbXD8KwEF4WisGqz7N4lPVjlEATH8EA==
X-ME-Sender: <xms:a9omZJiVtEYr1gohWls37IVQ9CF9nCvR52uadevxUFI1_ahiwQbGsQ>
    <xme:a9omZOBdYFlhmVUP9ZBAqzcVv6dLmbnpmpoT8ZWMWWFuha-Upa5ii3-9dUxiHVJ0i
    DLrKcmmak_QunOyTR0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgheeiucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:a9omZJGQP2SDLfTdlNtHU58KujmMjCCPjp2MYZCkx8VxOoIam26ptg>
    <xmx:a9omZOQ_ghP1D54G9gFIpRX34_QWI9HuBF_xpFDLUfbARzYmsBB3BQ>
    <xmx:a9omZGzQTy4b94FH_vNyNLKxzInd5lNSDOVNKdl-OYMtJ2YLHoMEew>
    <xmx:bdomZGimMTY80mozuQ0VHFtNe8ro8DDcPyeY5KEc4gKNnNfwg49O4A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 6B754B6008D; Fri, 31 Mar 2023 09:04:43 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <f25d74a0-9e61-44df-b4c7-f495462fa648@app.fastmail.com>
In-Reply-To: <20230327222514.GA17904@lst.de>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-22-arnd@kernel.org> <20230327222514.GA17904@lst.de>
Date: Fri, 31 Mar 2023 15:04:23 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Christoph Hellwig" <hch@lst.de>, "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 21/21] dma-mapping: replace custom code with generic implementation
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Mar 28, 2023, at 00:25, Christoph Hellwig wrote:
>> +static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
>>  {
>> +	dma_cache_wback(paddr, size);
>> +}
>>  
>> +static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
>> +{
>> +	dma_cache_inv(paddr, size);
>>  }
>
>> +static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
>>  {
>> +	dma_cache_wback_inv(paddr, size);
>> +}
>
> There are the only calls for the three functions for each of the
> involved functions.  So I'd rather rename the low-level symbols
> (and drop the pointless exports for two of them) rather than adding
> these wrapppers.
>
> The same is probably true for many other architectures.

Ok, done that now.

>> +static inline bool arch_sync_dma_clean_before_fromdevice(void)
>> +{
>> +	return false;
>> +}
>>  
>> +static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
>> +{
>> +	return true;
>>  }
>
> Is there a way to cut down on this boilerplate code by just having
> sane default, and Kconfig options to override them if they are not
> runtime decisions?

I've changed arch_sync_dma_clean_before_fromdevice() to a
Kconfig symbol now, as this is never a runtime decision.

For arch_sync_dma_cpu_needs_post_dma_flush(), I have this
version now in common code, which lets mips and arm have
their own logic and has the same effect elsewhere:

+#ifndef arch_sync_dma_cpu_needs_post_dma_flush
+static inline bool arch_sync_dma_cpu_needs_post_dma_flush(void)
+{
+       return IS_ENABLED(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU);
+}
+#endif

>> +#include <linux/dma-sync.h>
>
> I can't really say I like the #include version here despite your
> rationale in the commit log.  I can probably live with it if you
> think it is absolutely worth it, but I'm really not in favor of it.
>
>> +config ARCH_DMA_MARK_DCACHE_CLEAN
>> +	def_bool y
>
> What do we need this symbol for?  Unless I'm missing something it is
> always enable for arm32, and only used in arm32 code.

This was left over from an earlier draft and accidentally duplicates
the thing that I have in the Arm version for the existing
ARCH_HAS_DMA_MARK_CLEAN. I dropped this one and the
generic copy of the arch_dma_mark_dcache_clean() function
now, but still need to revisit the arm version, as it sounds
like it has slightly different semantics from the ia64 version.

     Arnd
