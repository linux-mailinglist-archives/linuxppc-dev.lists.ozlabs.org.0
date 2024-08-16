Return-Path: <linuxppc-dev+bounces-140-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE929553CF
	for <lists+linuxppc-dev@lfdr.de>; Sat, 17 Aug 2024 01:40:17 +0200 (CEST)
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=127.0.0.1
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=0CuhUKid;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wlz4b2pRgz2xxx;
	Sat, 17 Aug 2024 09:40:15 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a03:3b40:fe:2d4::1"
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=0CuhUKid;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tesarici.cz (client-ip=2a03:3b40:fe:2d4::1; helo=bee.tesarici.cz; envelope-from=petr@tesarici.cz; receiver=lists.ozlabs.org)
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wll2v57CKz2ymc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 17 Aug 2024 00:37:58 +1000 (AEST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id B57A21E37A1;
	Fri, 16 Aug 2024 16:37:48 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1723819068; bh=YTsjo9xdLYhs/JNEPkM0QFjPK5lYJCTAZFLJJQCw3FU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=0CuhUKidl4+XHrz9gNPtjDuzk4+GJznh4ZajAJYkkbkaai6FjEG05RWi5joRvMBnO
	 SAxoRmfGHhXqGGAkVlaHgfo3F6Mb5gfntXIwmAXHFvCKKYLP5rL0kXNH5ih7NPGjG+
	 p9H0lHBrjCXd3RrzPRDfFb5cqT00vgdtwO/3YHQR+24ZP8erEXTrerbpapKZgw8SgK
	 cngJSDf1OEDWEw4kHFQj1c9Hlj40xeiKFOM0xv6EEq+RxXpHLTahgsUHDxa3oJdzDu
	 GC4wCcJ5Yu/NxHoAGUXCOfrsFtjxrECGQpyakRb4NBv/5KGoqrrnsfCKpzMkXUdefO
	 OEv46M2PYXh9g==
Date: Fri, 16 Aug 2024 16:37:43 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Will Deacon <will@kernel.org>
Cc: Baruch Siach <baruch@tkos.co.il>, Christoph Hellwig <hch@lst.de>, Marek
 Szyprowski <m.szyprowski@samsung.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-s390@vger.kernel.org, Ramon Fried <ramon@neureality.ai>, Elad Nachman
 <enachman@marvell.com>
Subject: Re: [PATCH v6 RESED 1/2] dma: replace zone_dma_bits by
 zone_dma_limit
Message-ID: <20240816163743.16028508@mordecai.tesarici.cz>
In-Reply-To: <20240816115246.GA24137@willie-the-truck>
References: <cover.1723359916.git.baruch@tkos.co.il>
	<17c067618b93e5d71f19c37826d54db4299621a3.1723359916.git.baruch@tkos.co.il>
	<20240816115246.GA24137@willie-the-truck>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 16 Aug 2024 12:52:47 +0100
Will Deacon <will@kernel.org> wrote:

> On Sun, Aug 11, 2024 at 10:09:35AM +0300, Baruch Siach wrote:
> > From: Catalin Marinas <catalin.marinas@arm.com>
> > 
> > Hardware DMA limit might not be power of 2. When RAM range starts above
> > 0, say 4GB, DMA limit of 30 bits should end at 5GB. A single high bit
> > can not encode this limit.
> > 
> > Use plain address for DMA zone limit.
> > 
> > Since DMA zone can now potentially span beyond 4GB physical limit of
> > DMA32, make sure to use DMA zone for GFP_DMA32 allocations in that case.
> > 
> > Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> > Co-developed-by: Baruch Siach <baruch@tkos.co.il>
> > Signed-off-by: Baruch Siach <baruch@tkos.co.il>
> > ---
> >  arch/arm64/mm/init.c       | 30 +++++++++++++++---------------
> >  arch/powerpc/mm/mem.c      |  5 ++++-
> >  arch/s390/mm/init.c        |  2 +-
> >  include/linux/dma-direct.h |  2 +-
> >  kernel/dma/direct.c        |  6 +++---
> >  kernel/dma/pool.c          |  4 ++--
> >  kernel/dma/swiotlb.c       |  6 +++---
> >  7 files changed, 29 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> > index 9b5ab6818f7f..c45e2152ca9e 100644
> > --- a/arch/arm64/mm/init.c
> > +++ b/arch/arm64/mm/init.c
> > @@ -115,35 +115,35 @@ static void __init arch_reserve_crashkernel(void)
> >  }
> >  
> >  /*
> > - * Return the maximum physical address for a zone accessible by the given bits
> > - * limit. If DRAM starts above 32-bit, expand the zone to the maximum
> > + * Return the maximum physical address for a zone given its limit.
> > + * If DRAM starts above 32-bit, expand the zone to the maximum
> >   * available memory, otherwise cap it at 32-bit.
> >   */
> > -static phys_addr_t __init max_zone_phys(unsigned int zone_bits)
> > +static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
> >  {
> > -	phys_addr_t zone_mask = DMA_BIT_MASK(zone_bits);
> >  	phys_addr_t phys_start = memblock_start_of_DRAM();
> >  
> >  	if (phys_start > U32_MAX)
> > -		zone_mask = PHYS_ADDR_MAX;
> > -	else if (phys_start > zone_mask)
> > -		zone_mask = U32_MAX;
> > +		zone_limit = PHYS_ADDR_MAX;
> > +	else if (phys_start > zone_limit)
> > +		zone_limit = U32_MAX;
> >  
> > -	return min(zone_mask, memblock_end_of_DRAM() - 1) + 1;
> > +	return min(zone_limit, memblock_end_of_DRAM() - 1) + 1;  
> 
> Why do we need to adjust +-1 now that we're no longer using a mask?

Subtracting 1 is needed to get the highest valid DRAM address so it can
be compared to the highest address in the zone (zone_limit). Adding 1
is necessary to get the lowest address beyond the zone.

AFAICT this is the right thing here:

	arm64_dma_phys_limit = max_zone_phys(zone_dma_bits);
	max_zone_pfns[ZONE_DMA] = PFN_DOWN(arm64_dma_phys_limit);

max_zone_pfns[] max values are exclusive, i.e. the lowest PFN which is
_not_ within the zone.

It is also the right thing when arm64_dma_phys_limit is passed to
dma_contiguous_reserve().

It would be subtly broken if phys_addr_t could be a 32-bit integer, but
that's not possible on arm64.

In short, LGTM.

Petr T

