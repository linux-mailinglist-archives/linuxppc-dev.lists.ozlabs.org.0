Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 580EA94A93A
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 15:59:18 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfBcN1WlDz3ddX
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 23:59:16 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=cmarinas@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfBc056CQz2y8X
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2024 23:58:56 +1000 (AEST)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0E6D161007;
	Wed,  7 Aug 2024 13:58:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555DAC32781;
	Wed,  7 Aug 2024 13:58:51 +0000 (UTC)
Date: Wed, 7 Aug 2024 14:58:49 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v5 1/3] dma: improve DMA zone selection
Message-ID: <ZrN9mRoQj2lTo6L5@arm.com>
References: <cover.1722578375.git.baruch@tkos.co.il>
 <5200f289af1a9b80dfd329b6ed3d54e1d4a02876.1722578375.git.baruch@tkos.co.il>
 <8230985e-1581-411f-895c-b49065234520@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8230985e-1581-411f-895c-b49065234520@arm.com>
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
Cc: linux-s390@vger.kernel.org, Baruch Siach <baruch@tkos.co.il>, Ramon Fried <ramon@neureality.ai>, Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, iommu@lists.linux.dev, Elad Nachman <enachman@marvell.com>, Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Thanks Robin for having a look.

On Wed, Aug 07, 2024 at 02:13:06PM +0100, Robin Murphy wrote:
> On 2024-08-02 7:03 am, Baruch Siach wrote:
> > When device DMA limit does not fit in DMA32 zone it should use DMA zone,
> > even when DMA zone is stricter than needed.
> > 
> > Same goes for devices that can't allocate from the entire normal zone.
> > Limit to DMA32 in that case.
> 
> Per the bot report this only works for CONFIG_ARCH_KEEP_MEMBLOCK,

Yeah, I just noticed.

> however
> the whole concept looks wrong anyway. The logic here is that we're only
> forcing a particular zone if there's *no* chance of the higher zone being
> usable. For example, ignoring offsets for simplicity, if we have a 40-bit
> DMA mask then we *do* want to initially try allocating from ZONE_NORMAL even
> if max_pfn is above 40 bits, since we still might get a usable allocation
> from between 32 and 40 bits, and if we don't, then we'll fall back to
> retrying from the DMA zone(s) anyway.

Ah, I did not read the code further down in __dma_direct_alloc_pages(),
it does fall back to a GFP_DMA allocation if !dma_coherent_ok().
Similarly with swiotlb_alloc_tlb(), it keeps retrying until the
allocation fails.

So yes, this patch can be dropped.

-- 
Catalin
