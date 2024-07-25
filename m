Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EEAF593C137
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 13:57:13 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=bizVwSo2;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WV8WW6b5dz3d2n
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 Jul 2024 21:57:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tkos.co.il
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tkos.co.il header.i=@tkos.co.il header.a=rsa-sha256 header.s=default header.b=bizVwSo2;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tkos.co.il (client-ip=84.110.109.230; helo=mail.tkos.co.il; envelope-from=baruch@tkos.co.il; receiver=lists.ozlabs.org)
X-Greylist: delayed 446 seconds by postgrey-1.37 at boromir; Thu, 25 Jul 2024 21:56:34 AEST
Received: from mail.tkos.co.il (mail.tkos.co.il [84.110.109.230])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WV8Vp5HGyz2xWZ
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 25 Jul 2024 21:56:34 +1000 (AEST)
Received: from localhost (unknown [10.0.8.2])
	by mail.tkos.co.il (Postfix) with ESMTP id 284E14404C3;
	Thu, 25 Jul 2024 14:47:51 +0300 (IDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tkos.co.il;
	s=default; t=1721908071;
	bh=yE1dvBcrEBKnorpECP4pOnlN7nPfgUokWU3jR2HlwE8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=bizVwSo2WQmGu0wUpHnYrd0vmUJZSj2EFi5MQvsuSsHcUPIlfFUeav8XA1ADfxEht
	 swspOZXXy6Ab7EMunaOnm8NHsgOT9449191hCTw2/CpoAtwSwSaAwbieaI7844BSro
	 ptDyP9e+pI/vXYmBCpx+M0RmTU+Lr81JVG8wPU3ZSwi4+YXygklxhz7lCo6Gusy58K
	 seXAU/M/7An4QuSEy4KgL1CDRjrevZeRuLYxoakcQey6W84qW98DoLWlQoXDC09PaI
	 4x/s1EdCLdeCgMg6IPGd80vPUq/70SWVPgWUFJSRDxadbEb9i2o8jR+4Mi0NXSi22V
	 /YANXGITTzdfw==
From: Baruch Siach <baruch@tkos.co.il>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH RFC v2 2/5] of: get dma area lower limit
In-Reply-To: <ZnH-VU2iz9Q2KLbr@arm.com> (Catalin Marinas's message of "Tue, 18
	Jun 2024 22:38:29 +0100")
References: <cover.1712642324.git.baruch@tkos.co.il>
	<230ea13ef8e9f576df849e1b03406184ca890ba8.1712642324.git.baruch@tkos.co.il>
	<ZnH-VU2iz9Q2KLbr@arm.com>
Date: Thu, 25 Jul 2024 14:49:01 +0300
Message-ID: <87cyn1k7yq.fsf@tarshish>
MIME-Version: 1.0
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
Cc: Rob Herring <robh@kernel.org>, linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Saravana Kannan <saravanak@google.com>, devicetree@vger.kernel.org, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Catalin,

On Tue, Jun 18 2024, Catalin Marinas wrote:
> On Tue, Apr 09, 2024 at 09:17:55AM +0300, Baruch Siach wrote:
>> of_dma_get_max_cpu_address() returns the highest CPU address that
>> devices can use for DMA. The implicit assumption is that all CPU
>> addresses below that limit are suitable for DMA. However the
>> 'dma-ranges' property this code uses also encodes a lower limit for DMA
>> that is potentially non zero.
>> 
>> Rename to of_dma_get_cpu_limits(), and extend to retrieve also the lower
>> limit for the same 'dma-ranges' property describing the high limit.
>
> I don't understand the reason for the lower limit. The way the Linux
> zones work is that ZONE_DMA always starts from the start of the RAM. It
> doesn't matter whether it's 0 or not, you'd not allocate below the start
> of RAM anyway. If you have a device that cannot use the bottom of the
> RAM, it is pretty broken and not supported by Linux.

I won't argue with that assertion. My target system RAM happens to start
at that the lower end of devices DMA zone, so I'm fine with skipping
this patch.

Just curious. What is the inherent limitation that prevents Linux from
supporting DMA zone with lower limit above RAM start?

Thanks,
baruch

-- 
                                                     ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch@tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
