Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C02784454
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 08:15:46 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463Lpl5ql2zDrCp
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 16:15:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463Lmv6YfrzDqhF
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 16:14:07 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 55DB268B05; Wed,  7 Aug 2019 08:14:02 +0200 (CEST)
Date: Wed, 7 Aug 2019 08:14:02 +0200
From: Christoph Hellwig <hch@lst.de>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190807061402.GE6627@lst.de>
References: <20190801142118.21225-1-hch@lst.de>
 <20190801142118.21225-2-hch@lst.de>
 <20190801162305.3m32chycsdjmdejk@willie-the-truck>
 <20190801163457.GB26588@lst.de>
 <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
 <20190802081441.GA9725@lst.de>
 <20190802103803.3qrbhqwxlasojsco@willie-the-truck>
 <20190803064812.GA29746@lst.de>
 <20190806160854.htk67msiyadlrl4m@willie-the-truck>
 <20190806164503.GD1330@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190806164503.GD1330@shell.armlinux.org.uk>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
Cc: Shawn Anastasio <shawn@anastas.io>,
 Catalin Marinas <catalin.marinas@arm.com>, linuxppc-dev@lists.ozlabs.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Will Deacon <will@kernel.org>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2019 at 05:45:03PM +0100, Russell King - ARM Linux admin wrote:
> We could have used a different approach, making all IO writes contain
> a "drain write buffer" instruction, and map DMA memory as "buffered",
> but as there were no Linux barriers defined to order memory accesses
> to DMA memory (so, for example, ring buffers can be updated in the
> correct order) back in those days, using the uncached/unbuffered mode
> was the sanest and most reliable solution.

Absolutely makes sense so far.

> > > The other really weird things is that in arm32
> > > pgprot_dmacoherent incudes the L_PTE_XN bit, which from my understanding
> > > is the no-execture bit, but pgprot_writecombine does not.  This seems to
> > > not very unintentional.  So minus that the whole DMA_ATTR_WRITE_COMBІNE
> > > seems to be about flagging old arm specific drivers as having the proper
> > > barriers in places and otherwise is a no-op.
> > 
> > I think it only matters for Armv7 CPUs, but yes, we should probably be
> > setting L_PTE_XN for both of these memory types.
> 
> Conventionally, pgprot_writecombine() has only been used to change
> the memory type and not the permissions.  Since writecombine memory
> is still capable of being executed, I don't see any reason to set XN
> for it.
> 
> If the user wishes to mmap() using PROT_READ|PROT_EXEC, then is there
> really a reason for writecombine to set XN overriding the user?
> 
> That said, pgprot_writecombine() is mostly used for framebuffers, which
> arguably shouldn't be executable anyway - but who'd want to mmap() the
> framebuffer with PROT_EXEC?

Well, I was mostly taking about DMA_ATTR_WRITE_COMBINE, which really
should include the NX bit even if pgprot_writecombine doesn't, right?

> > >  - make DMA_ATTR_WRITE_COMBINE a no-op and schedule it for removal,
> > >    thus removing the last instances of arch_dma_mmap_pgprot
> > 
> > All sounds good to me, although I suppose 32-bit Arm platforms without
> > CONFIG_ARM_DMA_MEM_BUFFERABLE may run into issues if DMA_ATTR_WRITE_COMBINE
> > disappears. Only one way to find out...
> 
> Looking at the results of grep, I think only OMAP2+ and Exynos may be
> affected.

As you mentioned later we also have the dma_alloc_wc wrapper, and a
single instance of dma_alloc_writecombine.

Exynos looks like purely ARM v7 from Kconfig, so it shouldn't even be
affected.

> However, removing writecombine support from the DMA API is going to
> have a huge impact for framebuffers on earlier ARMs - that's where we
> do expect framebuffers to be mapped "uncached/buffered" for performance
> reasons and not "uncached/unbuffered".  It's quite literally the
> difference between console scrolling being usable and totally unusable.
> 
> Given what I've said above, switching to using buffered mode for normal
> DMA mappings is data-corrupting risky - as in your filesystem could get
> fried.  I don't think we should play fast and loose with people's data
> by randomly changing that "because we'd like to", and I don't see that
> screwing the console is really an option either.

Oh well.   If we can't make dma_alloc_wc generally safe I fear we'll
have to keep it, but maybe literally limit it to the pre ARM v6
platforms.  While pretty much all callers seems platform specific,
there actually are a decent number that can only work on ARM v7 or
arm64.
