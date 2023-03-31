Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 285386D21FF
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 16:01:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp25P3QXGz3fVl
	for <lists+linuxppc-dev@lfdr.de>; Sat,  1 Apr 2023 01:01:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=REpduR9C;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=i3D+2hFU;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=REpduR9C;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=i3D+2hFU;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp24Q3Vw3z3f99
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  1 Apr 2023 01:00:36 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 567AF58268C;
	Fri, 31 Mar 2023 10:00:32 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 10:00:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680271232; x=1680278432; bh=N4
	WD590DO+hPCMhWnriCpuvGtJsGQmYQ3+9FXgeZTtc=; b=REpduR9CC3w/0FF9Iv
	EBH9KHHpZAkRv+W9aThRognDHqxxXErt1hEf262htgmfU1y7J8I/og12pQbF1QY9
	z/0+3+/Bf2oK+XUqQ1up2zoCUTbBItrTDBxbm/DdhVRyQkbfie0xE3OFe/uFVR+g
	bks9fZAGQKmrcGDNEtLT86tfn4Wms5mpNyxZklg1B0YWQfy7g9hvGDntPvsCkCeJ
	wLqLsQR9c7xNiHy3PDZ3zK2RyfRwh8d+h+Q+id4O9QFBuDiG38QiGwFwY4W/6byQ
	pNhd/J6qIoDVk9dy/Mdw+8Tf65QdzUWqpPIiUv5wn3AR7WW2l24R3SQbLghgPyUF
	F7gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680271232; x=1680278432; bh=N4WD590DO+hPC
	MhWnriCpuvGtJsGQmYQ3+9FXgeZTtc=; b=i3D+2hFUqX2bGpzs9rCNqcr3CpE2N
	rt7cbXlRcTHCWGo/szfA6As2ip+aj8s1suA1RYGH89iU3g1ca7fdoQJNHyYwLXNr
	WC1WRAlkGPS93OO7BATELyF5zFYGJWHyOuPym1F/LtRkCwUjFR6xo7so3vFgV9vY
	IVCo8mq7pf1tL4yq8LWAbqZdlON6KFVL3Sapxm6koAA4gN8G5B28UEccNxYiAtHQ
	dvIbN7+ejsM+GITaw6ebr/XqJrMfO1ez3Qm4YcHOOMz99mIsNZvq856hdCwflb78
	BjnKIQ+2qfc2YpkHszA6wodj1J2AgunOKqhhPHInMSpLYh9uMkriYgwXQ==
X-ME-Sender: <xms:fecmZCPw2k0WFSiszAjxauKOayaTiHCGBi32kM44TXaFV2BHsjDyMA>
    <xme:fecmZA_NMdzB6aDZzwfF-uMmNEuqPyfkq2LjSDyiaL-SuJ9PAODPdoOWMVJQGZfSu
    RbTsP31nEFUHDqIAlg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddgieejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:fecmZJQhpIILzpcdD_xrCsjH7l6FjkrLtyxwa_ai5mBKaMgvipDDUw>
    <xmx:fecmZCuwYKd2Df_H4rBh_fLvS9zA0ETUOaGqv1ZZCjcnlhkXxmP3UA>
    <xmx:fecmZKdoWRB2Q6l5_A5sNhUbdy-jv6JeyG7Yd6afjSO5tFxo2aX65Q>
    <xmx:gOcmZNdii8AAZvnO0o6gFFummVS7dXiShnWCiEYYWDOp-MlzOf1x5w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 2063AB60092; Fri, 31 Mar 2023 10:00:29 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <df6340c8-6ac2-4459-a9e5-c411020962d6@app.fastmail.com>
In-Reply-To: <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-21-arnd@kernel.org>
 <cb9367fb-0897-244d-15b6-fdfafde2a1c0@arm.com>
Date: Fri, 31 Mar 2023 16:00:07 +0200
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

On Mon, Mar 27, 2023, at 14:48, Robin Murphy wrote:
> On 2023-03-27 13:13, Arnd Bergmann wrote:
>> 
>> [ HELP NEEDED: can anyone confirm that it is a correct assumption
>>    on arm that a cache-coherent device writing to a page always results
>>    in it being in a PG_dcache_clean state like on ia64, or can a device
>>    write directly into the dcache?]
>
> In AMBA at least, if a snooping write hits in a cache then the data is 
> most likely going to get routed directly into that cache. If it has 
> write-back write-allocate attributes it could also land in any cache 
> along its normal path to RAM; it wouldn't have to go all the way.
>
> Hence all the fun we have where treating a coherent device as 
> non-coherent can still be almost as broken as the other way round :)

Ok, thanks for the information. I'm still not sure whether this can
result in the situation where PG_dcache_clean is wrong though.

Specifically, the question is whether a DMA to a coherent buffer
can end up in a dirty L1 dcache of one core and require to write
back the dcache before invalidating the icache for that page.

On ia64, this is not the case, the optimization here is to
only flush the icache after a coherent DMA into an executable
user page, while Arm only does this for noncoherent DMA but not
coherent DMA.

From your explanation it sounds like this might happen,
even though that would mean that "coherent" DMA is slightly
less coherent than it is elsewhere.

To be on the safe side, I'd have to pass a flag into
arch_dma_mark_clean() about coherency, to let the arm
implementation still require the extra dcache flush
for coherent DMA, while ia64 can ignore that flag.

    Arnd
