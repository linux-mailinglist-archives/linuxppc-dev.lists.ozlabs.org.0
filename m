Return-Path: <linuxppc-dev+bounces-14864-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8452ACCBBD9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 18 Dec 2025 13:12:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dX8fn5p1Rz2xrM;
	Thu, 18 Dec 2025 23:12:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=172.234.252.31
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766059921;
	cv=none; b=IJZI55LvdGC9CeCfOW1uihfq5ZR6KnRRpZfl4RVK7I/ciegSPyCyR6TxfG1a1wlQQgljlah4DtSHB2xyReI07yf9ZR+taWNriEI5RlLc/KkoYvpQg87ublE4uRmw2hNtKJCKGnNIcADAg8R2Ey2j02PUpSZVteoTecjBqEzOdvYJjAVPk/APYFB0nAlkeG5uulf0pnHYsgsDj26nfSF4fRzanG+XSdTzwV5ITvIcX5oUf+caO9BrVMz5B/A7vk1dgC3opE6ZlPWH0OykKjJhIkCZyhuhqN1pMstT8FMTNJcGZ2u1uderHZzmVWL9LPni2Y90X7hSoc0/zae+/cRuWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766059921; c=relaxed/relaxed;
	bh=GyebNfzeCgpKC74F6qdDfkAx0zKHrIp7zs6SdWi0Lzk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=gW8Ie6pSm4FDl71XzUSJRoXJ8r/EoXsYwV/X7dI0nDW98wbQthICffKTfrP0SQaqIhu1FhQ6DyX/VM9a/QVLBgczBGS0Q6fbMMeV8VcRgMjEQb2WZS9doXMvRMu5JQgMpmQVq0WDSJk3JuSPtyVBr74H13uXR8xnEPHzxnuU/LyawMH9HR1Ae60GQF5ZH/vnMOHu0k9gjAK9xjk8MwUKah5H8hv/9zD8IUj7n74K8+Ml7GmvgTAX7lVDXatO8f6q86Q7KnsX2VSOgFrg8EfUaM6POU8kTmaAM5LUN+Vg1vnONFhxsGrgettODApI0ysb5HS7pgCnlVrQ+YyPh7n+Eg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org; dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pbfm1N29; dkim-atps=neutral; spf=pass (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org) smtp.mailfrom=kernel.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Pbfm1N29;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=172.234.252.31; helo=sea.source.kernel.org; envelope-from=leon@kernel.org; receiver=lists.ozlabs.org)
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dX8fm6c7Pz2xqm
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 18 Dec 2025 23:12:00 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D786E43F57;
	Thu, 18 Dec 2025 12:11:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0079C116B1;
	Thu, 18 Dec 2025 12:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766059918;
	bh=XGQ+7SgEew4iClGYURs+C9L0stXJTBsZbjZ2oG7UIc0=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Pbfm1N29OV600qM6UTmHFrWBgKAAPaEIi8H31U8/D7Fy4/yQH7DtTr8fjL1JU2ZGr
	 6nwz3dwH1V2m2ot6sPml3YHiTkco7la+c2nu+l+SxzciJta8kjjah21YI0wd4vAeV1
	 isA2l1yKhqypiDWu4LQeHt4ykcmpaBp/ImSwyvJVre9a3pRs4GXVsIRHvw6x+1fCZ3
	 aTjQTA27ccRELqk9h2L0kraeNtbMTR5EzRmpbnJomxT+NeArdctTyUhXcuNcwN7S86
	 MwPNLvKu3CLTwt2KbzjkGo2I4spjFwLzTY0Numflrkc7wTVrfPPFNtqzCFaA++T+6a
	 inlbyNZVWvrqA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id BD61AF40069;
	Thu, 18 Dec 2025 07:11:56 -0500 (EST)
Received: from phl-imap-08 ([10.202.2.84])
  by phl-compute-04.internal (MEProxy); Thu, 18 Dec 2025 07:11:56 -0500
X-ME-Sender: <xms:jO9DafeY02D3zYoswm455JApvwyXo9N__fUotOJi51wAZtuEx-h72w>
    <xme:jO9DaQDfyGYFoXV11b_RfSRExwBkMCEzZBimiIe7NMQwesYYigYemrJGclZL6-nUN
    5nH6_xmiiK7evyXwi9tI-nHYYwNuyJSE2e3okgtOjc_KJ6UT8WLB40>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheeflecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefoggffhffvvefkjghfufgtgfesthejredtredttdenucfhrhhomhepfdfnvghonhcu
    tfhomhgrnhhovhhskhihfdcuoehlvghonheskhgvrhhnvghlrdhorhhgqeenucggtffrrg
    htthgvrhhnpeekgfduveffueffveduleefgfejhfevfeduueeiueetleeugeeivdfhfedv
    geeuhfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
    eptdenucfrrghrrghmpehmrghilhhfrhhomheplhgvohhnodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduvdeftdehfeelkeegqddvjeejleejjedvkedqlhgvohhnpe
    epkhgvrhhnvghlrdhorhhgsehlvghonhdrnhhupdhnsggprhgtphhtthhopeefiedpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepsghpsegrlhhivghnkedruggvpdhrtghpth
    htohepthhssghoghgvnhgusegrlhhphhgrrdhfrhgrnhhkvghnrdguvgdprhgtphhtthho
    pehrohgsihhnrdhmuhhrphhhhiesrghrmhdrtghomhdprhgtphhtthhopehlihhnuhigse
    grrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhishhtohhphhgvrdhl
    vghrohihsegtshhgrhhouhhprdgvuhdprhgtphhtthhopegurghvvghmsegurghvvghmlh
    hofhhtrdhnvghtpdhrtghpthhtohepmhhpvgesvghllhgvrhhmrghnrdhiugdrrghupdhr
    tghpthhtohepohhlvghkshgrnhgurhgpthihshhhtghhvghnkhhosegvphgrmhdrtghomh
    dprhgtphhtthhopegrnhgurhgvrghssehgrghishhlvghrrdgtohhm
X-ME-Proxy: <xmx:jO9DaW3ei8lQ9gcPxNPUeQZve5kN2H4YDdliFX36bDRD9uMeDsZ4KA>
    <xmx:jO9DaUpMFxuOPj7_hGyyy_s579il17M-kR5TgcqcXniyOzdDRg_9ow>
    <xmx:jO9DaWJBfSyOkp-S-guhU4sCQMQj21t9ZeDTKlB6MTu_eAniobrx8g>
    <xmx:jO9DaQMmPwxjAIxGEGDyRXW1Dza8HIb57oy-5TquwYRW4FNWdPdjfg>
    <xmx:jO9DaU3nohCadRXkzPkJY71Xjbbz3hpclv3AJ-2YED3d89Ht1quCx0PH>
Feedback-ID: i927946fb:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 7DD622CE0072; Thu, 18 Dec 2025 07:11:56 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
X-ThreadId: AsrGuGndWMm3
Date: Thu, 18 Dec 2025 14:11:35 +0200
From: "Leon Romanovsky" <leon@kernel.org>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "Marek Szyprowski" <m.szyprowski@samsung.com>,
 "Robin Murphy" <robin.murphy@arm.com>,
 "Russell King" <linux@armlinux.org.uk>,
 "Juergen Gross" <jgross@suse.com>,
 "Stefano Stabellini" <sstabellini@kernel.org>,
 "Oleksandr Tyshchenko" <oleksandr_tyshchenko@epam.com>,
 "Richard Henderson" <richard.henderson@linaro.org>,
 "Matt Turner" <mattst88@gmail.com>,
 "Thomas Bogendoerfer" <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Helge Deller" <deller@gmx.de>,
 "Madhavan Srinivasan" <maddy@linux.ibm.com>,
 "Michael Ellerman" <mpe@ellerman.id.au>,
 "Nicholas Piggin" <npiggin@gmail.com>,
 "Christophe Leroy" <christophe.leroy@csgroup.eu>,
 "Geoff Levand" <geoff@infradead.org>,
 "David Miller" <davem@davemloft.net>,
 "Andreas Larsson" <andreas@gaisler.com>,
 "Thomas Gleixner" <tglx@linutronix.de>, "Ingo Molnar" <mingo@redhat.com>,
 "Borislav Petkov" <bp@alien8.de>,
 "Dave Hansen" <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, iommu@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 xen-devel@lists.xenproject.org, linux-alpha@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org,
 "Jason Gunthorpe" <jgg@ziepe.ca>, "Jason Gunthorpe" <jgg@nvidia.com>
Message-Id: <77e73a01-9f7e-475b-a810-278f931910ed@app.fastmail.com>
In-Reply-To: <20251218084002.GD39046@unreal>
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-9-3bbfe3a25cdf@kernel.org>
 <b184f1bf-96dc-4546-8512-9cba5ecb58f7@roeck-us.net>
 <20251218084002.GD39046@unreal>
Subject: Re: [PATCH v5 09/14] parisc: Convert DMA map_page to map_phys interface [qemu
 test failure]
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On Thu, Dec 18, 2025, at 10:40, Leon Romanovsky wrote:
> On Wed, Dec 17, 2025 at 04:17:38AM -0800, Guenter Roeck wrote:
>> Hi,
>> 
>> On Wed, Oct 15, 2025 at 12:12:55PM +0300, Leon Romanovsky wrote:
>> > From: Leon Romanovsky <leonro@nvidia.com>
>> > 
>> > Perform mechanical conversion from .map_page to .map_phys callback.
>> > 
>> > Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
>> > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>> 
>> This patch causes all my 32-bit parisc qemu tests with C3700 machine
>> to fail. Network interface tests fail, and all boot attempts from
>> any kind of hard drive (scsi, usb) fail with this patch in the tree.
>
> Thanks for the report. I have a fix ready; I'll clean it up and send it out
> by EOD.

The fix is available here
https://lore.kernel.org/all/20251218-fix-parisc-conversion-v1-1-4a04d26b0168@nvidia.com/T/#u

Thanks

>
>> 
>> Guenter

