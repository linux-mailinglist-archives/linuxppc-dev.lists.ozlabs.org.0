Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 96600869AA7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 16:41:48 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Rtc0sWpG;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JW9+Yjqu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkhYQ23ZZz3vXc
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Feb 2024 02:41:46 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=Rtc0sWpG;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=JW9+Yjqu;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.230; helo=new4-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
Received: from new4-smtp.messagingengine.com (new4-smtp.messagingengine.com [66.111.4.230])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkhXY3VB4z30PD
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Feb 2024 02:41:00 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailnew.nyi.internal (Postfix) with ESMTP id C50BC581673;
	Tue, 27 Feb 2024 10:40:56 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 10:40:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709048456; x=1709055656; bh=lT/5Xxdnqx
	5CMYADxupUohV9DQkUzUShK5fUq//vk/8=; b=Rtc0sWpGwr1a2ypPut3gLf8atr
	meNXRUSYs2A6Hh4w7+CTYSB6z44OoztdFsDfwmRhAuSRfZs+txW0KNRVDfs+K3n+
	odTYi2ZQlT7s+E0LFaLC7ar/Z4FD+HK9HhZAJiOw+OgQPbgrBWz8VJ+exLNnlzg+
	1LS7GuIOq0sceldQ44JsIMlow7bhpI2GxOgAzs3axuijpISknEFSGq7x6bvtwoC+
	p+hQROmI2qyGkEqbTnYhToPicndBF1DMV0pOJj+WFtfKtWpYwdWnSRNn3VI0XYSw
	rKIYecBNWF5GYiJ7+9wJ1D3mIc0crUYWjJ9ATjE3f1mVy8Wvhr2QzIYBlkWg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709048456; x=1709055656; bh=lT/5Xxdnqx5CMYADxupUohV9DQkU
	zUShK5fUq//vk/8=; b=JW9+YjquNnm7o12jdkN5mfx60FJfx8wDhr9OmpbxP3lG
	9cvvv30icSLXu5LQ2wzCYFyfyb71a46fbn1t+Z0Lu9+GBDCOFSjqELt0zbOxC6LZ
	0Oeyvvkzv1yTBIDAKFYI7PqcjoiiSe9lBeKab9Hr2IQZf1E7+rdWITwKMv3VJPUX
	HOIlG6q95Nc7cZjs/HAVbRcvsDMGhIzcU4s1QIiv8t6ivmDQ0zZnnJNBNUH5JMQx
	Rei8lc492TZG3LNU8wmSjCzIoHONeOUx/0Pws8OKhYkcghtRvGS0r7pTxdDkbIu5
	HBIHtV8YNK4lNwxjhk9MOg2xf2TnRvLmW0T6J9Bz5A==
X-ME-Sender: <xms:hgLeZWfF-qbqrdbj0IagYAhSiOEfi5UCEmS_u4yoNDvztXrTURK7_Q>
    <xme:hgLeZQOzCvuUNg6EuvevTGxYCQO8msOkil0RbDijwSzGYe7psl9pT8BWvheUEhZ7C
    Pdo_I4MBhOfPArk7QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeehgdehhecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:hgLeZXhChxgS4QEqTAxLAOZKAoZBKHRRZvGb10gAMk9IE2OsKRsW-w>
    <xmx:hgLeZT-J0pIyrYHvMmgFCCI0MMwJYL79LAConhB9Au0fTd7J2iLO_A>
    <xmx:hgLeZSvOSg8KjmfvYvE-AbxbFQDQ5C9PhmVFAKv9zOm-h-ZQxjKSYA>
    <xmx:iALeZfob0-nwdlhgZy11nclfVztI8phtznS1Je_w6icjY0iJt68yOA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id CBF71B6008D; Tue, 27 Feb 2024 10:40:54 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <83450530-c908-4abc-bab7-88c50a3143ff@app.fastmail.com>
In-Reply-To: <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-2-arnd@kernel.org>
 <764fafb0-2206-4ab1-84ea-ebb7848c8ff2@sifive.com>
Date: Tue, 27 Feb 2024 16:40:34 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Samuel Holland" <samuel.holland@sifive.com>,
 "Arnd Bergmann" <arnd@kernel.org>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Vincenzo Frascino" <vincenzo.frascino@arm.com>,
 "Kees Cook" <keescook@chromium.org>,
 "Anna-Maria Gleixner" <anna-maria@linutronix.de>
Subject: Re: [PATCH 1/4] arch: consolidate existing CONFIG_PAGE_SIZE_*KB definitions
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-arm-kernel@lists.i
 nfradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Feb 26, 2024, at 17:55, Samuel Holland wrote:
> On 2024-02-26 10:14 AM, Arnd Bergmann wrote:
>>  
>> +config HAVE_PAGE_SIZE_4KB
>> +	bool
>> +
>> +config HAVE_PAGE_SIZE_8KB
>> +	bool
>> +
>> +config HAVE_PAGE_SIZE_16KB
>> +	bool
>> +
>> +config HAVE_PAGE_SIZE_32KB
>> +	bool
>> +
>> +config HAVE_PAGE_SIZE_64KB
>> +	bool
>> +
>> +config HAVE_PAGE_SIZE_256KB
>> +	bool
>> +
>> +choice
>> +	prompt "MMU page size"
>
> Should this have some generic help text (at least a warning about 
> compatibility)?

Good point. I've added some of this now, based on the mips
text with some generalizations for other architectures:

config PAGE_SIZE_4KB
        bool "4KiB pages" 
        depends on HAVE_PAGE_SIZE_4KB
        help 
          This option select the standard 4KiB Linux page size and the only
          available option on many architectures. Using 4KiB page size will
          minimize memory consumption and is therefore recommended for low
          memory systems.
          Some software that is written for x86 systems makes incorrect
          assumptions about the page size and only runs on 4KiB pages.

config PAGE_SIZE_8KB
        bool "8KiB pages"
        depends on HAVE_PAGE_SIZE_8KB
        help
          This option is the only supported page size on a few older
          processors, and can be slightly faster than 4KiB pages.

config PAGE_SIZE_16KB
        bool "16KiB pages"
        depends on HAVE_PAGE_SIZE_16KB
        help 
          This option is usually a good compromise between memory
          consumption and performance for typical desktop and server
          workloads, often saving a level of page table lookups compared
          to 4KB pages as well as reducing TLB pressure and overhead of
          per-page operations in the kernel at the expense of a larger
          page cache. 

config PAGE_SIZE_32KB
        bool "32KiB pages"
        depends on HAVE_PAGE_SIZE_32KB
          Using 32KiB page size will result in slightly higher performance
          kernel at the price of higher memory consumption compared to
          16KiB pages.  This option is available only on cnMIPS cores.
          Note that you will need a suitable Linux distribution to
          support this.

config PAGE_SIZE_64KB
        bool "64KiB pages"
        depends on HAVE_PAGE_SIZE_64KB
          Using 64KiB page size will result in slightly higher performance
          kernel at the price of much higher memory consumption compared to
          4KiB or 16KiB pages.
          This is not suitable for general-purpose workloads but the
          better performance may be worth the cost for certain types of
          supercomputing or database applications that work mostly with
          large in-memory data rather than small files.

config PAGE_SIZE_256KB
        bool "256KiB pages"
        depends on HAVE_PAGE_SIZE_256KB
        help
          256KB pages have little practical value due to their extreme
          memory usage.

>> diff --git a/arch/hexagon/Kconfig b/arch/hexagon/Kconfig
>> index a880ee067d2e..aac46ee1a000 100644
>> --- a/arch/hexagon/Kconfig
>> +++ b/arch/hexagon/Kconfig
>> @@ -8,6 +8,11 @@ config HEXAGON
>>  	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>>  	select ARCH_NO_PREEMPT
>>  	select DMA_GLOBAL_POOL
>> +	select FRAME_POINTER
>
> Looks like a paste error.
>

Fixed, thanks! I think that happened during a rebase.

>>  #ifdef CONFIG_PAGE_SIZE_1MB
>> -#define PAGE_SHIFT 20
>>  #define HEXAGON_L1_PTE_SIZE __HVM_PDE_S_1MB
>>  #endif
>
> The corresponding Kconfig option does not exist (and did not exist before this
> patch).

Yes, I noticed that as well. It's clearly harmless.

     Arnd
