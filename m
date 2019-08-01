Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BE127E07F
	for <lists+linuxppc-dev@lfdr.de>; Thu,  1 Aug 2019 18:46:26 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45zx5B1h1dzDqgC
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 02:46:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=198.145.29.99; helo=mail.kernel.org; envelope-from=will@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.b="1vCYTqrW"; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45zx2p5GdczDqHH
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 02:44:18 +1000 (AEST)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id A272C20838;
 Thu,  1 Aug 2019 16:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564677856;
 bh=luxeEe+sNcMiUEJZddOmw2LCtZnw/7cP+2BTlvtj75g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=1vCYTqrWNpzwy70+mDDkDyYbXSINihdTQt827ZNZ38BqrocpuTP/5twuQPWb+gghN
 +bl+z5TixFmhDdNjnDx+Eh8sSH8KshmaqVzUor7b7NSq1e0PiUUaxnmgdxPhdn1229
 Armf1YNDTLI9lVu8j9VV+a1Qdb+UMV3aZU2PBKDY=
Date: Thu, 1 Aug 2019 17:44:12 +0100
From: Will Deacon <will@kernel.org>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
References: <20190801142118.21225-1-hch@lst.de>
 <20190801142118.21225-2-hch@lst.de>
 <20190801162305.3m32chycsdjmdejk@willie-the-truck>
 <20190801163457.GB26588@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801163457.GB26588@lst.de>
User-Agent: NeoMutt/20170113 (1.7.2)
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
Cc: Shawn Anastasio <shawn@anastas.io>, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Catalin Marinas <catalin.marinas@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2019 at 06:34:57PM +0200, Christoph Hellwig wrote:
> On Thu, Aug 01, 2019 at 05:23:06PM +0100, Will Deacon wrote:
> > > -	if (!dev_is_dma_coherent(dev) || (attrs & DMA_ATTR_WRITE_COMBINE))
> > > -		return pgprot_writecombine(prot);
> > > -	return prot;
> > > +	return pgprot_writecombine(prot);
> > >  }
> > 
> > Seems like a sensible cleanup to me:
> > 
> > Acked-by: Will Deacon <will@kernel.org>
> > 
> > Although arch_dma_mmap_pgprot() is a bit of a misnomer now that it only
> > gets involved in the non-coherent case.
> 
> A better name is welcome.

How about arch_dma_noncoherent_mmap_pgprot() ? Too long?

> My other idea would be to just remove it entirely and do something like:
> 
> #ifndef pgprot_dmacoherent
> #define pgprot_dmacoherent pgprot_noncached
> #endif
> 
> pgprot_t dma_mmap_pgprot(struct device *dev, pgprot_t prot, unsigned long attrs)
> {
> 	if (dev_is_dma_coherent(dev) || (attrs & DMA_ATTR_NON_CONSISTENT))
> 		return prot;
> #ifdef pgprot_writecombine
> 	if (attrs & DMA_ATTR_WRITE_COMBINE)
> 		return pgprot_writecombine(prot);
> #endif
> 	return pgprot_dmacoherent(prot);
> }

Oh, I prefer that!

> But my worry is how this interacts with architectures that have an
> uncached segment (mips, nios2, microblaze, extensa) where we'd have
> the kernel access DMA_ATTR_WRITE_COMBINE mappigns using the uncached
> segment, and userspace mmaps using pgprot_writecombine, which could
> lead to aliasing issues.  But then again mips already supports
> DMA_ATTR_WRITE_COMBINE, so this must be ok somehow.  I guess I'll
> need to field that question to the relevant parties.

Or it's always been busted and happens to work out in practice...

Will
