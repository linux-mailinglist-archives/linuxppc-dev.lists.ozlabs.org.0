Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DB9868E5A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 12:06:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=KreeJwgJ;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bBO3jySl;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TkZS55J5hz3vXZ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Feb 2024 22:06:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm3 header.b=KreeJwgJ;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm1 header.b=bBO3jySl;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=103.168.172.137; helo=flow2-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=lists.ozlabs.org)
X-Greylist: delayed 393 seconds by postgrey-1.37 at boromir; Tue, 27 Feb 2024 22:06:02 AEDT
Received: from flow2-smtp.messagingengine.com (flow2-smtp.messagingengine.com [103.168.172.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TkZRG0Tvrz30h8
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Feb 2024 22:06:02 +1100 (AEDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailflow.nyi.internal (Postfix) with ESMTP id 78DBA200138;
	Tue, 27 Feb 2024 05:59:24 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Tue, 27 Feb 2024 05:59:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1709031564; x=1709038764; bh=ALe4jRIpXw
	GFVbo3YEKz32tiMZckplvn+7Agjim/VUs=; b=KreeJwgJS47kfteNF0Atm9VoLT
	mRfGs//TxfpC0fFZ9SEmCaC2swxwVrdN/3Ir+9oF+fbHxOtydzs0GOj0O1ITDp51
	ZhOnnsY7S3TnCZ4KCQAKSLYiFfKjoPsBoAlA8dApodL0QZ6nRCISIYBeFh2ul3w/
	q59zfzcWezxy3DWuubch7g8lA2Drw5Ez0jYc9VWGFhZDa2LlhFdeHC7I+E7yatGM
	hJNcDmI6gI3Zx71w11VLK+zKbOxBUMm1nalGz6w7e9Wc1kc8YztPLUVQ8LkOyg65
	8WPuiETbWNlfqV0KEzh2qfROCbOq47LpMKoQbeNARU2PmuDi7KJ3PGB2mQlg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; t=1709031564; x=1709038764; bh=ALe4jRIpXwGFVbo3YEKz32tiMZck
	plvn+7Agjim/VUs=; b=bBO3jySluCJ8iVd9SgGyaduu/7B7YWQLFiJ9Ps7xlapC
	2Lu1jhKLr4XQz6dXwNluypZlvD7ktNGmEBmDx+l/7yB8xrGle+W+vyms/K+FVKb6
	vfmssdRCf1wqieikEjJKlb4PL5URebMEeI7syXqZL8FtQxHCsQt7H3xzRq5ndzoQ
	oZYNOTsMDpvjTL6WgQqY2GdPhVBq45+29NWAcjyYpqxh67E2AyyZ323tgVUDvNzD
	j1qYSIwN2bTbtxvpO5Qnw5eDvGuNoreXZ4SGviyGwWwNwe24kyiKu1PnLoTqm6Hx
	IZfTtcsnJMRwsibpxr+rL7unENDS3lSef9Mi0eR4QA==
X-ME-Sender: <xms:isDdZafoyfIa2slvrGRb4QuGqlhK60arMii6iYL9riKPHpp4cGpkDg>
    <xme:isDdZUM16FrnZSoIWKFKjkea6vNGsbbxm1_XQpYP7hU7n55KtwCjU4HyZXe4xvGnR
    al4oJbACmXVdB8-sZs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrgeeggddvfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeffheeugeetiefhgeethfejgfdtuefggeejleehjeeutefhfeeggefhkedtkeet
    ffenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrh
    hnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:isDdZbg33X-NA4Q4g8hs1l1s2knS3VeDh75_ybtft9UbLAD21da0lQ>
    <xmx:isDdZX91w2MZ5hgE7eH834qgzVQv9GUyFiDnpUSBzy5R9xSTy3NkLA>
    <xmx:isDdZWvlIMVHAGfyORa7V5l8neOSYMEy4LWAa7attify04IxVKQb6Q>
    <xmx:jMDdZVrJHSt9kALdLSyweF2DkUkEC1DI1fmVrfUCTkdSqb87F7HE81ozT4I>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 9822DB6008D; Tue, 27 Feb 2024 05:59:22 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-153-g7e3bb84806-fm-20240215.007-g7e3bb848
MIME-Version: 1.0
Message-Id: <164616c2-94f6-40e8-86e0-850dc8da212e@app.fastmail.com>
In-Reply-To:  <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
References: <20240226161414.2316610-1-arnd@kernel.org>
 <20240226161414.2316610-4-arnd@kernel.org>
 <CAMuHMdWRBQF95fJ+NkPUdvpu5VfRm2WyTnvdqB1Xe7d4vsvY2g@mail.gmail.com>
Date: Tue, 27 Feb 2024 11:59:01 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Geert Uytterhoeven" <geert@linux-m68k.org>,
 "Arnd Bergmann" <arnd@kernel.org>
Subject: Re: [PATCH 3/4] arch: define CONFIG_PAGE_SIZE_*KB on all architectures
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
Cc: x86@kernel.org, loongarch@lists.linux.dev, Andreas Larsson <andreas@gaisler.com>, Catalin Marinas <catalin.marinas@arm.com>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, Vincenzo Frascino <vincenzo.frascino@arm.com>, Jan Kiszka <jan.kiszka@siemens.com>, linux-s390@vger.kernel.org, linux-sh@vger.kernel.org, Richard Weinberger <richard@nod.at>, Helge Deller <deller@gmx.de>, Huacai Chen <chenhuacai@kernel.org>, Russell King <linux@armlinux.org.uk>, Vineet Gupta <vgupta@kernel.org>, Matt Turner <mattst88@gmail.com>, linux-snps-arc@lists.infradead.org, linux-alpha@vger.kernel.org, Kees Cook <keescook@chromium.org>, Kieran Bingham <kbingham@kernel.org>, linux-um@lists.infradead.org, linux-m68k@lists.linux-m68k.org, Andy Lutomirski <luto@kernel.org>, John Paul Adrian Glaubitz <glaubitz@physik.
 fu-berlin.de>, Thomas Gleixner <tglx@linutronix.de>, Anna-Maria Gleixner <anna-maria@linutronix.de>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Feb 27, 2024, at 09:54, Geert Uytterhoeven wrote:
> Hi Arnd,
>> diff --git a/arch/m68k/Kconfig.cpu b/arch/m68k/Kconfig.cpu
>> index 9dcf245c9cbf..c777a129768a 100644
>> --- a/arch/m68k/Kconfig.cpu
>> +++ b/arch/m68k/Kconfig.cpu
>> @@ -30,6 +30,7 @@ config COLDFIRE
>>         select GENERIC_CSUM
>>         select GPIOLIB
>>         select HAVE_LEGACY_CLK
>> +       select HAVE_PAGE_SIZE_8KB if !MMU
>
> .... if you would drop the !MMU-dependency here.
>
>>
>>  endchoice
>>
>> @@ -45,6 +46,7 @@ config M68000
>>         select GENERIC_CSUM
>>         select CPU_NO_EFFICIENT_FFS
>>         select HAVE_ARCH_HASH
>> +       select HAVE_PAGE_SIZE_4KB
>
> Perhaps replace this by
>
>     config M68KCLASSIC
>             bool "Classic M68K CPU family support"
>             select HAVE_ARCH_PFN_VALID
>   +         select HAVE_PAGE_SIZE_4KB if !MMU
>
> so it covers all 680x0 CPUs without MMU?

I was a bit unsure about how to best do this since there
is not really a need for a fixed page size on nommu kernels,
whereas the three MMU configs clearly tie the page size to
the MMU rather than the platform.

There should be no reason for coldfire to have a different
page size from dragonball if neither of them actually uses
hardware pages, so one of them could be changed later.

Let me know if that makes sense to you, or you still
prefer me to change it like you suggested.

      Arnd
