Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AFA694BEC0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 15:47:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfpJC4RW8z2yt0
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 23:47:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfpHp1mGhz2xFr
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 23:47:02 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 669C461528;
	Thu,  8 Aug 2024 13:46:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDA35C32782;
	Thu,  8 Aug 2024 13:46:56 +0000 (UTC)
Date: Thu, 8 Aug 2024 14:46:54 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Subject: Re: [PATCH v5 2/3] dma: replace zone_dma_bits by zone_dma_limit
Message-ID: <ZrTMTrjTwpuHDgnU@arm.com>
References: <cover.1722578375.git.baruch@tkos.co.il>
 <5821a1b2eb82847ccbac0945da040518d6f6f16b.1722578375.git.baruch@tkos.co.il>
 <Zqyo4qjPRHUeUfS5@arm.com>
 <20240807161938.5729b656@mordecai.tesarici.cz>
 <ZrO5okGUljTc9E7N@arm.com>
 <20240808113501.4fde4cb0@mordecai.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240808113501.4fde4cb0@mordecai.tesarici.cz>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, Will Deacon <will@kernel.org>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 08, 2024 at 11:35:01AM +0200, Petr Tesařík wrote:
> On Wed, 7 Aug 2024 19:14:58 +0100
> Catalin Marinas <catalin.marinas@arm.com> wrote:
> > With ZONE_DMA32, since all the DMA code assumes that ZONE_DMA32 ends at
> > 4GB CPU address, it doesn't really work for such platforms. If there are
> > 32-bit devices with a corresponding CPU address offset, ZONE_DMA32
> > should end at 36GB on Baruch's platform. But to simplify things, we just
> > ignore this on arm64 and make ZONE_DMA32 empty.
> 
> Ah. That makes sense. It also seems to support my theory that Linux
> memory zones are an obsolete concept and should be replaced by a
> different mechanism.

I agree, they are too coarse-grained. From an API perspective, what we
need is an alloc_pages() that takes a DMA mask or phys address limit,
maybe something similar to memblock_alloc_range_nid(). OTOH, an
advantage of the zones is that by default you keep the lower memory free
by using ZONE_NORMAL as default, you have free lists per zone. Maybe
with some alternative data structures we could efficiently search free
pages based on phys ranges or bitmasks and get rid of the zones but I
haven't put any thoughts into it.

We'd still need some boundaries like *_dma_get_max_cpu_address() to at
least allocate an swiotlb buffer that's suitable for all devices.

> > In some cases where we have the device structure we could instead do a
> > dma_to_phys(DMA_BIT_MASK(32)) but not in the two cases above. I guess if
> > we really want to address this properly, we'd need to introduce a
> > zone_dma32_limit that's initialised by the arch code. For arm64, I'm
> > happy with just having an empty ZONE_DMA32 on such platforms.
> 
> The obvious caveat is that zone boundaries are system-wide, but the
> mapping between bus addresses and CPU addresses depends on the device
> structure. After all, that's why dma_to_phys takes the device as a
> parameter... In fact, a system may have multiple busses behind
> different bridges with a different offset applied by each.

Indeed, and as Robin mentioned, the ACPI/DT code already handle this.

> FYI I want to make more people aware of these issues at this year's
> Plumbers, see https://lpc.events/event/18/contributions/1776/

Looking forward to this. I'll dial in, unfortunately can't make Plumbers
in person this year.

In the meantime, I think this series is a good compromise ;).

-- 
Catalin
