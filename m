Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C919894B1A3
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2024 22:54:58 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=i65GwrEa;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WfMr05TJ1z3dKb
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2024 06:54:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=tesarici.cz header.i=@tesarici.cz header.a=rsa-sha256 header.s=mail header.b=i65GwrEa;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=tesarici.cz (client-ip=37.205.15.56; helo=bee.tesarici.cz; envelope-from=petr@tesarici.cz; receiver=lists.ozlabs.org)
X-Greylist: delayed 400 seconds by postgrey-1.37 at boromir; Thu, 08 Aug 2024 00:19:46 AEST
Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WfC420yqYz30TQ
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2024 00:19:46 +1000 (AEST)
Received: from mordecai.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-3010-3bd6-8521-caf1.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:3010:3bd6:8521:caf1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 581DA1D4827;
	Wed,  7 Aug 2024 16:19:43 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1723040383; bh=XLWRMbtGcTsuduq8sYIgOj2Fv5+dhfpUSVkhtNTwEKs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=i65GwrEaWJJSMm99frEtR7SuRGEX3gN1vzFXh2M8PBIgW+RsOaMIeqQVp9+tWaGD8
	 /YNoeYcOzMnMmVYXGfa4/im2fp+jFdGFBjLaB6/wg4YlBgNs87dbzwtqDoB3iboUMQ
	 uknhZZbif8Mx36WsiJPi/ciX025KxDJDtfHQvCaScDK7UjvtnQ+wcvWLFasyNPbiXx
	 4nf7jgzre9eFkJWXAo3rcRvI2k6Pdic8/+K6elXZgoJ8rXB6Zykhp5b9yMcQvENf/9
	 rr/4NtWBGu7ADNh76DtVGevak4OOLyst1aitj0NfgEMtoYlN8XmKbm7/MrBkRa1vW4
	 1fOsAT735pwMQ==
Date: Wed, 7 Aug 2024 16:19:38 +0200
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH v5 2/3] dma: replace zone_dma_bits by zone_dma_limit
Message-ID: <20240807161938.5729b656@mordecai.tesarici.cz>
In-Reply-To: <Zqyo4qjPRHUeUfS5@arm.com>
References: <cover.1722578375.git.baruch@tkos.co.il>
	<5821a1b2eb82847ccbac0945da040518d6f6f16b.1722578375.git.baruch@tkos.co.il>
	<Zqyo4qjPRHUeUfS5@arm.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Thu, 08 Aug 2024 06:54:21 +1000
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

On Fri, 2 Aug 2024 10:37:38 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Fri, Aug 02, 2024 at 09:03:47AM +0300, Baruch Siach wrote:
> > diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> > index 3b4be4ca3b08..62b36fda44c9 100644
> > --- a/kernel/dma/direct.c
> > +++ b/kernel/dma/direct.c
> > @@ -20,7 +20,7 @@
> >   * it for entirely different regions. In that case the arch code needs to
> >   * override the variable below for dma-direct to work properly.
> >   */
> > -unsigned int zone_dma_bits __ro_after_init = 24;
> > +u64 zone_dma_limit __ro_after_init = DMA_BIT_MASK(24);  
> 
> u64 here makes sense even if it may be larger than phys_addr_t. It
> matches the phys_limit type in the swiotlb code. The compilers should no
> longer complain.

FTR I have never quite understood why phys_limit is u64, but u64 was
already used all around the place when I first looked into swiotlb.

> > diff --git a/kernel/dma/pool.c b/kernel/dma/pool.c
> > index d10613eb0f63..7b04f7575796 100644
> > --- a/kernel/dma/pool.c
> > +++ b/kernel/dma/pool.c
> > @@ -70,9 +70,9 @@ static bool cma_in_zone(gfp_t gfp)
> >  	/* CMA can't cross zone boundaries, see cma_activate_area() */
> >  	end = cma_get_base(cma) + size - 1;
> >  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp & GFP_DMA))
> > -		return end <= DMA_BIT_MASK(zone_dma_bits);
> > +		return end <= zone_dma_limit;
> >  	if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp & GFP_DMA32))
> > -		return end <= DMA_BIT_MASK(32);
> > +		return end <= max(DMA_BIT_MASK(32), zone_dma_limit);
> >  	return true;
> >  }
> >  
> > diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> > index 043b0ecd3e8d..bb51bd5335ad 100644
> > --- a/kernel/dma/swiotlb.c
> > +++ b/kernel/dma/swiotlb.c
> > @@ -450,9 +450,9 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> >  	if (!remap)
> >  		io_tlb_default_mem.can_grow = true;
> >  	if (IS_ENABLED(CONFIG_ZONE_DMA) && (gfp_mask & __GFP_DMA))
> > -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(zone_dma_bits);
> > +		io_tlb_default_mem.phys_limit = zone_dma_limit;
> >  	else if (IS_ENABLED(CONFIG_ZONE_DMA32) && (gfp_mask & __GFP_DMA32))
> > -		io_tlb_default_mem.phys_limit = DMA_BIT_MASK(32);
> > +		io_tlb_default_mem.phys_limit = max(DMA_BIT_MASK(32), zone_dma_limit);
> >  	else
> >  		io_tlb_default_mem.phys_limit = virt_to_phys(high_memory - 1);
> >  #endif  
> 
> These two look correct to me now and it's the least intrusive (the
> alternative would have been a zone_dma32_limit). The arch code, however,
> needs to ensure that zone_dma_limit can always support 32-bit devices
> even if it is above 4GB (with the relevant dma offsets in place for such
> devices).

Just to make sure, the DMA zone (if present) must map to at most 32-bit
bus address space (possibly behind a bridge). Is that what you're
saying?

Petr T
