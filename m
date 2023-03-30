Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B37286D009B
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 12:04:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PnJtn0tnYz3fRG
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Mar 2023 21:04:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=JxPZOVxj;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o3ayTuAj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.229; helo=new3-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=JxPZOVxj;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=o3ayTuAj;
	dkim-atps=neutral
Received: from new3-smtp.messagingengine.com (new3-smtp.messagingengine.com [66.111.4.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4PnJsr2Hzsz3ccs
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 30 Mar 2023 21:03:57 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id A6E105821FE;
	Thu, 30 Mar 2023 06:03:53 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Thu, 30 Mar 2023 06:03:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680170633; x=1680177833; bh=gF
	qXqcYMWSKuJaGFIiy50Zf8Mul16NUlD8xgems2xkg=; b=JxPZOVxjXCuuUFnz8g
	uR2No3WKokB1kYnBVGLyuNTT1GHbSx7HcllmOlx7WL73MRjvBNY1Jz63nwSIuXZm
	fARBRkt2EgiPXJLAvasiK+94JN9Rp7qIpeg/c8F9us28ZAmzX4a12l/FSLzGWeAf
	GP7Lhb+lkhGzU3GXPlwLR10V758pcgH1ojqXsjwkdVyUvwtO9WMqdgRyfQ7u3ctM
	W7sU+9bMDjJx0q1aRSpQBmyxejDAdo7VNGKwjccZfKKub+cgQ2ZTm/zkP2y/rRlx
	wYI35VSqJc9OdGsxpiyx9Lz/h6dHQyx/rbychak5+lhcx20ykt8JwaYwQzyk90NH
	m/JA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680170633; x=1680177833; bh=gFqXqcYMWSKuJ
	aGFIiy50Zf8Mul16NUlD8xgems2xkg=; b=o3ayTuAjbuBu4DPifrxB/HOOZRdO1
	xb065wIqst9K32LE2zIFvIgvo3yv5lHodsQ9WEQeJOnQ4UcFBj18pN027eK8euOR
	PtcZaxUi42xyTMd+sbBNtRmY12wtqYj80lCZcTZsq6sg8WYonLY5xmdrshZ5C44/
	jXjWmEhQ68ThFXZ/SV/69f9njMopwi7kUxCVm+NBkbrrBCIP7mBID23rgx/hkVub
	HQT4TO9CRtSmC/0UwEYJhKoIxPA5B3sXRdQjC9d5SuBSM3xeOdM9GqWhROqUG5n+
	6gfH5c9KmTWNqq/meniN7YOfy58761x7eNGJpjVNO+ni0u9AywZLJQEUQ==
X-ME-Sender: <xms:h14lZP2P6-1WML0tnHU0HdMdtZK3G6AdboBJze6kLEnEZTHVfufW-A>
    <xme:h14lZOG421saOUxl3VTrr1QErXRPxmod2xdJenKYhBULtUD7d6J8ovO92D02wTAv1
    7ZDE3mwId6_yOeP8ic>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehkedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:h14lZP41dAmtiVu4ty1E8BBZ-9reNxwryxuQCN8Se8vdMAwQTZcBkg>
    <xmx:h14lZE2dCL5QmCe3baeT7FUMFxbuJwcm88C-9hfhLub0UJvmYVxYPg>
    <xmx:h14lZCHsPaycpm9MVz5soXkltYLZMmnIjjAwPs6W0AlziFmXAZIfJA>
    <xmx:iV4lZI76poFBm_RbGrZvSm-s7BW_iB7cNPqH9WgtDueAW0AKJy54Lg>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 423AFB60086; Thu, 30 Mar 2023 06:03:51 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <6a5bd3a3-87e0-4a24-89ca-d265b0817a95@app.fastmail.com>
In-Reply-To: <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-19-arnd@kernel.org>
 <d7f36a28-0cae-a035-791b-363754aefeee@linaro.org>
Date: Thu, 30 Mar 2023 12:03:16 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Arnd Bergmann" <arnd@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 18/21] ARM: drop SMP support for ARM11MPCore
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Daniel Golle <daniel@makrotopia.org>, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Russell King <linux@armlinux.org.uk>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Mar 30, 2023, at 09:48, Neil Armstrong wrote:
> On 27/03/2023 14:13, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>> 
>> The cache management operations for noncoherent DMA on ARMv6 work
>> in two different ways:
>> 
>>   * When CONFIG_DMA_CACHE_RWFO is set, speculative prefetches on in-flight
>>     DMA buffers lead to data corruption when the prefetched data is written
>>     back on top of data from the device.
>> 
>>   * When CONFIG_DMA_CACHE_RWFO is disabled, a cache flush on one CPU
>>     is not seen by the other core(s), leading to inconsistent contents
>>     accross the system.
>> 
>> As a consequence, neither configuration is actually safe to use in a
>> general-purpose kernel that is used on both MPCore systems and ARM1176
>> with prefetching enabled.
>> 
>> We could add further workarounds to make the behavior more dynamic based
>> on the system, but realistically, there are close to zero remaining
>> users on any ARM11MPCore anyway, and nobody seems too interested in it,
>> compared to the more popular ARM1176 used in BMC2835 and AST2500.
>> 
>> The Oxnas platform has some minimal support in OpenWRT, but most of the
>> drivers and dts files never made it into the mainline kernel, while the
>> Arm Versatile/Realview platform mainly serves as a reference system but
>> is not necessary to be kept working once all other ARM11MPCore are gone.
>
> Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
>
> It's sad but it's the reality, there's no chance full OXNAS support will
> ever come upstream and no real work has been done for years.
>
> I think OXNAS support can be programmed for removal for next release,
> it would need significant work to rework current support to make it acceptable
> before trying to upstream missing bits anyway.

Ok, thanks for your reply!

To clarify, do you think we should plan for removal after the next
stable release (6.3, removed in 6.4), or after the next LTS
release (probably 6.6, removed in 6.7)? As far as I understand,
the next OpenWRT release (23.x) will be based on linux-5.15,
and the one after that (24.x) would likely still use 6.1, unless
they skip an LTS kernel.

     Arnd
