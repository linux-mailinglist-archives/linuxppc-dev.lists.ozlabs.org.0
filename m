Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id DBB276D2077
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 14:34:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Pp08b5wMQz3fTQ
	for <lists+linuxppc-dev@lfdr.de>; Fri, 31 Mar 2023 23:34:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=iuNZAdk6;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NI3JQqrb;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arndb.de (client-ip=66.111.4.221; helo=new1-smtp.messagingengine.com; envelope-from=arnd@arndb.de; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=arndb.de header.i=@arndb.de header.a=rsa-sha256 header.s=fm1 header.b=iuNZAdk6;
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=NI3JQqrb;
	dkim-atps=neutral
Received: from new1-smtp.messagingengine.com (new1-smtp.messagingengine.com [66.111.4.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Pp07d0gXQz3fQW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Mar 2023 23:33:14 +1100 (AEDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailnew.nyi.internal (Postfix) with ESMTP id 47574582093;
	Fri, 31 Mar 2023 08:33:08 -0400 (EDT)
Received: from imap51 ([10.202.2.101])
  by compute6.internal (MEProxy); Fri, 31 Mar 2023 08:33:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm1; t=1680265988; x=1680273188; bh=I/
	XjvTAePbFVwUGfSz8rPi8M5dxtpkHpG1vd7Vude4c=; b=iuNZAdk6Ya9vr/N/zU
	3t/+cX/F0A+q88l6Qahs7Uj1CYoWxSa8Eu5OD+Ct23B44MXMq4BCsnbr8qUNSlk5
	jOx6no330KaPyJVwkdA64ngV79uiGX4UVSt+8qLYU6x8k0skGKkacFHXFT+4yVoK
	U6XKaO/Jy3YZOjfH4+/yenwfGReew2hQQUQdhH3RVkckJOXJo94KR5LwOWh0szbZ
	rPwvnmbdKdguGaVvbONliIgg4m+CeTJ1KZaQyfX90PeptO2l+WyXh9qslgcvFuPX
	Oxcm45KxbnA9f0abON8VinWMCFl5E/z/tMyvRgEoCdXBCyvxtdEaPao0ugezvcUU
	k6fg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1680265988; x=1680273188; bh=I/XjvTAePbFVw
	UGfSz8rPi8M5dxtpkHpG1vd7Vude4c=; b=NI3JQqrb1FRHMe5nE5wfinxBX/1mQ
	nSGlERt9dUU3gRApIGMeDzB0UgHLLw2CCn9bpKLbHeusGMHpb1gpqCiZUb7Mmlu1
	i7qaXzWNCMRng9IBx99SAXpy98tdrD1OPcWbT56cyhuOCHD89yiyIPu/LCbN+8Ml
	fMxrCXWxuL3U9gM29T5yHdqMB82p4V+cMY8Fo5XGNuifGCMGxu99hnO1/9hv7xAp
	jzQqG1ouRlprhg0SGGHemyAUBb4ojTyQUgeSmG3grpwp5zlg4UBG9K1BgHnUh36W
	mnZAPYAc3Wj9DISiZL6YQw+vJ+t6oquGLuctAR/f7srdAHn7lZQgZRLyA==
X-ME-Sender: <xms:AdMmZIBbatqXGeNOMfbC2yM1UTEHf5t1O_Ny6GHrJYaymaPARYQseA>
    <xme:AdMmZKgRdC-oO_hhRg07gpiVNMqHiAwC2zW1iahhdyz4W42oovQyay3b9s-8VtDak
    XIDpt5T1CbMQPswLyU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdeiuddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehr
    nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
    htvghrnhepffehueegteeihfegtefhjefgtdeugfegjeelheejueethfefgeeghfektdek
    teffnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprg
    hrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:AdMmZLnMiGrKVuUtaQVRQlRtHYW58JiQ9P0q9APMOT9CJJRyl8hHmA>
    <xmx:AdMmZOzMnLFjNaRcp14svdP1B-JrKpp5unv7qIoHJ5lDmFpc_UcSVg>
    <xmx:AdMmZNQMs00AiqBUxbeFx4D4RhVdyZ0OwbnhjcjVis5DY3KkimzZhQ>
    <xmx:BNMmZDBgsPHtCy93eTqu2EUN111zCpLg0yHlOaE6A-yvIMj2UhorKQ>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id D0239B6008F; Fri, 31 Mar 2023 08:33:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.9.0-alpha0-238-g746678b8b6-fm-20230329.001-g746678b8
Mime-Version: 1.0
Message-Id: <709bcaf5-4dfd-4562-b34b-ea833690c0b8@app.fastmail.com>
In-Reply-To: <ZCa/FlTVT/GSl1af@shell.armlinux.org.uk>
References: <20230327121317.4081816-1-arnd@kernel.org>
 <20230327121317.4081816-16-arnd@kernel.org>
 <ZCai0FmZiOqsMkzc@shell.armlinux.org.uk>
 <ZCapXlrqMOpRxkSu@shell.armlinux.org.uk>
 <a8a90181-a003-47a1-8257-fcbf55752249@app.fastmail.com>
 <ZCa/FlTVT/GSl1af@shell.armlinux.org.uk>
Date: Fri, 31 Mar 2023 14:32:44 +0200
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Russell King" <linux@armlinux.org.uk>
Subject: Re: [PATCH 15/21] ARM: dma-mapping: always invalidate WT caches before DMA
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
Cc: Rich Felker <dalias@libc.org>, linux-sh@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Linus Walleij <linus.walleij@linaro.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, linux-mips@vger.kernel.org, Max Filippov <jcmvbkbc@gmail.com>, "Conor.Dooley" <conor.dooley@microchip.com>, guoren <guoren@kernel.org>, "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, Helge Deller <deller@gmx.de>, Geert Uytterhoeven <geert@linux-m68k.org>, Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org, Neil Armstrong <neil.armstrong@linaro.org>, "Lad,
 Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-m68k@lists.linux-m68k.org, Paul Walmsley <paul.walmsley@sifive.com>, Stafford Horne <shorne@gmail.com>, linux-arm-kernel@lists.infradead.org, Brian Cain <bcain@quicinc.com>, Arnd Bergmann <arnd@kernel.org>, Michal Simek <monstr@monstr.eu>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org, "linux-openrisc@vger.kernel.org" <linux-openrisc@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, linux-hexagon@vger.kernel.org, "linux-oxnas@groups.io" <linux-oxnas@groups.io>, Robin Murphy <robin.murphy@arm.com>, "David S . Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Mar 31, 2023, at 13:08, Russell King (Oracle) wrote:
> On Fri, Mar 31, 2023 at 12:38:45PM +0200, Arnd Bergmann wrote:
>> On Fri, Mar 31, 2023, at 11:35, Russell King (Oracle) wrote:
>> > On Fri, Mar 31, 2023 at 10:07:28AM +0100, Russell King (Oracle) wrote:
>> >> On Mon, Mar 27, 2023 at 02:13:11PM +0200, Arnd Bergmann wrote:
>> >> > From: Arnd Bergmann <arnd@arndb.de>
>> >> > 
>> >> > Most ARM CPUs can have write-back caches and that require
>> >> > cache management to be done in the dma_sync_*_for_device()
>> >> > operation. This is typically done in both writeback and
>> >> > writethrough mode.
>> >> > 
>> >> > The cache-v4.S (arm720/740/7tdmi/9tdmi) and cache-v4wt.S
>> >> > (arm920t, arm940t) implementations are the exception here,
>> >> > and only do the cache management after the DMA is complete,
>> >> > in the dma_sync_*_for_cpu() operation.
>> >> > 
>> >> > Change this for consistency with the other platforms. This
>> >> > should have no user visible effect.
>> >> 
>> >> NAK...So t
>> >> 
>> >> The reason we do cache management _after_ is to ensure that there
>> >> is no stale data. The kernel _has_ (at the very least in the past)
>> >> performed DMA to data structures that are embedded within other
>> >> data structures, resulting in cache lines being shared. If one of
>> >> those cache lines is touched while DMA is progressing, then we
>> >> must to cache management _after_ the DMA operation has completed.
>> >> Doing it before is no good.
>> 
>> What I'm trying to address here is the inconsistency between
>> implementations. If we decide that we always want to invalidate
>> after FROM_DEVICE, I can do that as part of the series, but then
>> I have to change most of the other arm implementations.
>
> Why?
>
> First thing to say is that DMA to buffers where the cache lines are
> shared with data the CPU may be accessing need to be outlawed - they
> are a recipe for data corruption - always have been. Sadly, some folk
> don't see it that way because of a passed "x86 just works and we demand
> that all architectures behave like x86!" attitude. The SCSI sense
> buffer has historically been a big culpret for that.

I think that part is pretty much agree by everyone, the difference
between architectures is to what extend they try to work around
drivers that get it wrong.

> For WT, FROM_DEVICE, invalidating after DMA is the right thing to do,
> because we want to ensure that the DMA'd data is properly readable upon
> completion of the DMA. If overlapping cache lines haveDoes that mean you take back you NAK on this patch tehn? been touched
> while DMA is proSo tgressing, and we invalidate before DMA, then the cache
> will contain stale data that will remain in the cache after DMA has
> completed. Invalidating a WT cache does not destroy any data, so is
> safe to do. So the safest approach is to invalidate after DMA has
> completed in this instance.

> For WB, FROM_DEVICE, we have the problem of dirty cache lines which
> we have to get rid of. For the overlapping cache lines, we have to
> clean those before DMA begins to ensure that data written to the
> non-DMA-buffer part is preserved. All other cache lines need to be
> invalidated before DMA begins to ensure that writebacks do not
> corrupt data from the device. Hence why it's different.

I don't see how WB and Wt caches being different implies that we
should give extra guarantees to (broken) drivers when WT caches on
other architectures. Always doing it first in the absence of
prefetching avoids a special case in the generic implementation
and makes the driver interface on Arm/sparc32/xtensa WT caches
no different from what everything provides.

The writeback before DMA_FROM_DEVICE is another issue that we
have to address at some point, as there are clearly incompatible
expectations here. It makes no sense that a device driver can
rely on the entire to be written back on a 64-bit arm kernel
but not on a 32-bit kernel.

> And hence why the ARM implementation is based around buffer ownership.
> And hence why they're called dma_map_area()/dma_unmap_area() rather
> than the cache operations themselves. This is an intentional change,
> one that was done when ARMv6 came along.

The bit that has changed in the meantime though is that the buffer
ownership interfaces has moved up in the stack and is now handled
mostly in the common kernel/dma/*.c that multiplexes between the
direct/iommu/swiotlb dma_map_ops, except for the bit about
noncoherent devices. Right now, we have 37 implementations that
are mostly identical, and all the differences are either bugs
or disagreements about the API guarantees but not related to
architecture specific requirements.

>> OTOH, most machines that are actually in use today (armv6+,
>> powerpc, later mips, microblaze, riscv, nios2) also have to
>> deal with speculative accesses, so they end up having to
>> invalidate or flush both before and after a DMA_FROM_DEVICE
>> and DMA_BIDIRECTIONAL.
>
> Again, these are implementation details of the cache, and this is
> precisely why having the map/unmap interface is so much better than
> having generic code explicitly call "clean" and "invalidate"
> interfaces into arch code.
>
> If we treat everything as a speculative cache, then we're doing
> needless extra work for those caches that aren't speculative. So,
> ARM would have to step through every cache line for every DMA
> buffer at 32-byte intervals performing cache maintenance whether
> the cache is speculative or not. That is expensive, and hurts
> performance.

Dop that mean that you agree with this patch 15 then after all?

If you think we don't need an invalidation after DMA_FROM_DEVICE
on non-speculating CPUs, it should be fine to make the WT case
consistent with the rest.

      Arnd
