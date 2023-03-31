Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D45C86D220C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:07:48 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp2Df4rJzz3fR7
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 01:07:46 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Pc8kv25V;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ThX+0gPl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=Pc8kv25V;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=ThX+0gPl;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp2Cp5dByz3bnM
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 01:07:02 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 9922258268E;
	Fri, 31 Mar 2023 10:07:00 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 10:07:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680271620; x=1680278820; bh=+r
	gNhiMMjEW6BpggDCxFKA75rbxQmdy0+ukYIJ3bDgk=; b=Pc8kv25VKXGtVL8XCr
	3j3OyLGuWT6fYZF4NiwCRSt2tF6Fvv+TvuB3E6vCgJxcx8jtprcWN7JhJIb5bFg2
	QjX2dTkxS7vu8lEIMWBWsDYl97OCtsdbMeLBYqYod6LmrQLwz6X9dnEM2DC3RbsF
	l+ZrPpgYIJwpYnZsWOD+D8D4vZfa7BzCpk20Wm+5tpjxuWKtCea7CNOxLGjwN0Kf
	tlV2osHlUJtCPxStVVsWCouRtYd6oC6yvc/82UQkegFPtfh4i+a9vmrPlD8S2nco
	JEOtyi3Nvv+b2bMF5uVMQVu4rR5BYDFXTTi+56wXtT9zHrrAZPk25XyVk4fpD22v
	vd9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680271620; x=1680278820; bh=+rgNhiMMjEW6B
	pggDCxFKA75rbxQmdy0+ukYIJ3bDgk=; b=ThX+0gPluUf21axDbewoG8ZUb9ZCI
	i0OKuY8x6SHo5JLyVpBW3rfjzSmDSVxilv/zSCMWNE0tgR8m2qZm4mnm4gkcNxqW
	89SKN3kk2vmevNs9sy5Kin7GMD4yD/ekmbdf34GqKCe/l/8lxcLL+vnuWz2lChpu
	3Zo8zTUwiUedMCRG088mBVfUHI7lup/3rDF5eNQz44ieRjCxaj4W8DPGoIIHa2BK
	9H7CKIM4HDqOkN7mS+DGINLbPX/RDhPjOasY3gx1JgWz7gfW05X4V3TRJlnwK7zt
	CFRZet/VpBWg0mniTU4O4BNc6kUxm9MTbMy8MEEXngy5TEIuOKVwamwPw==
X-ME-Sender: <xms:A-kmZN-NQK8nhMUyRf5ekRpQt0SQLm794OnAliR37Fz0V0Y8EubhUw>
    <xme:A-kmZBvefBGt64uw2QC6BFb3pDKvRP2O2N2W7bHCv7CCsaZwEMxJX6w17qlRvc42h
    tCPMuFp7jIPctCc6j0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgieelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:A-kmZLAr-8NrhylOVBIyMvPHI_UWEvFUIf9K_uEA1HijTRWrHwB1pA>
    <xmx:A-kmZBcmVUZ5C14t-tmZlAihuZ8BKuZ2UIRi3q9MCBvTIumo_qQHsg>
    <xmx:A-kmZCOm8b2LG_LernyD1ipDqx2PMx3LjSdvpU7uuZXZS7AUbOvhIA>
    <xmx:BOkmZOPEbwROHyknFwRDsQrWLZqsYSuvISFZMaO-MvqpTgjoh6bLGA>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id F0E1DB60092; Fri, 31 Mar 2023 10:06:58 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <1be05746-9deb-49cb-b106-71b2db8318cd@app.fastmail.com>
In-Reply-To: <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <ZCGv18wnEtoFvtfM@shell.armlinux.org.uk>
Date: Fri, 31 Mar 2023 16:06:37 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>, "Arnd Bergmann" <arnd@kernel.org>
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Brian Cain <bcain@quicinc.com>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 27, 2023, at 17:01, Russell King (Oracle) wrote:
> On Mon, Mar 27, 2023 at 02:13:16PM +0200, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The arm version of the arch_sync_dma_for_cpu() function annotates pages as
>> PG_dcache_clean after a DMA, but no other architecture does this here.
>
> ... because this is an arm32 specific feature. Generically, it's
> PG_arch_1, which is a page flag free for architecture use. On arm32
> we decided to use this to mark whether we can skip dcache writebacks
> when establishing a PTE - and thus it was decided to call it
> PG_dcache_clean to reflect how arm32 decided to use that bit.
>
> This isn't just a DMA thing, there are other places that we update
> the bit, such as flush_dcache_page() and copy_user_highpage().
>
> So thinking that the arm32 PG_dcache_clean is something for DMA is
> actually wrong.
>
> Other architectures are free to do their own other optimisations
> using that bit, and their implementations may be DMA-centric.

The flag is used the same way on most architectures, though some
use the opposite polarity and call it PG_dcache_dirty. The only
other architecture that uses it for DMA is ia64, with the difference
being that this also marks the page as clean even for coherent
DMA, not just when doing a flush as part of noncoherent DMA.

Based on Robin's reply it sounds that this is not a valid assumption
on Arm, if a coherent DMA can target a dirty dcache line without
cleaning it.

     Arnd
