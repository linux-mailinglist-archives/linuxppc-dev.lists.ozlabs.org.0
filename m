Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DC45D83755
	for <lists+linuxppc-dev@lfdr.de>; Tue,  6 Aug 2019 18:53:04 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46310Z0DdmzDr6t
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 02:53:02 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (mailfrom) smtp.mailfrom=armlinux.org.uk
 (client-ip=2001:4d48:ad52:3201:214:fdff:fe10:1be6;
 helo=pandora.armlinux.org.uk;
 envelope-from=linux+linuxppc-dev=lists.ozlabs.org@armlinux.org.uk;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none)
 header.from=armlinux.org.uk
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=armlinux.org.uk header.i=@armlinux.org.uk
 header.b="AY0UMJb+"; dkim-atps=neutral
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk
 [IPv6:2001:4d48:ad52:3201:214:fdff:fe10:1be6])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4630yR3QqZzDr0l
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  7 Aug 2019 02:51:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L8Qsi9HRlyoVoGH2S+hSRi65LltiNgW4vXbUSsBYNjo=; b=AY0UMJb+iW++EBhB14ReL07/6
 b0pFwP1ANs8Ey7rLTMwawQUMPdUAgfQRQVnZ/OR7JKCYpuel75mq1XkvJI3943Z3MQqQqQhkmdhxO
 gMiRvM5UopNJOrzm9fVvISbh1BDxrhypglyOjuUgab1W+soP+Y92sFkPmzHVACpr+/u106dEpfBCi
 WoNn1LreZ4+hkZCRMYbGZ1hOFo9APnQctrKosgfefHdeyXB6/JMXLVG9ifNeovhlGxV0lw0W8ajJ3
 1igtLNju1aD0Nr45s4CdgQBE/9z4vnCe4JZPjGxIYq1S39XMDc/p6GxbFVUBCrhp5yKR6Z534S6qB
 7mcKWkceQ==;
Received: from shell.armlinux.org.uk
 ([2002:4e20:1eda:1:5054:ff:fe00:4ec]:49226)
 by pandora.armlinux.org.uk with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <linux@armlinux.org.uk>)
 id 1hv2aC-0000SB-Ab; Tue, 06 Aug 2019 17:45:08 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.92)
 (envelope-from <linux@shell.armlinux.org.uk>)
 id 1hv2a7-0000fh-Ka; Tue, 06 Aug 2019 17:45:03 +0100
Date: Tue, 6 Aug 2019 17:45:03 +0100
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190806164503.GD1330@shell.armlinux.org.uk>
References: <20190801142118.21225-1-hch@lst.de>
 <20190801142118.21225-2-hch@lst.de>
 <20190801162305.3m32chycsdjmdejk@willie-the-truck>
 <20190801163457.GB26588@lst.de>
 <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
 <20190802081441.GA9725@lst.de>
 <20190802103803.3qrbhqwxlasojsco@willie-the-truck>
 <20190803064812.GA29746@lst.de>
 <20190806160854.htk67msiyadlrl4m@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190806160854.htk67msiyadlrl4m@willie-the-truck>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Catalin Marinas <catalin.marinas@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 06, 2019 at 05:08:54PM +0100, Will Deacon wrote:
> On Sat, Aug 03, 2019 at 08:48:12AM +0200, Christoph Hellwig wrote:
> > On Fri, Aug 02, 2019 at 11:38:03AM +0100, Will Deacon wrote:
> > > 
> > > So this boils down to a terminology mismatch. The Arm architecture doesn't have
> > > anything called "write combine", so in Linux we instead provide what the Arm
> > > architecture calls "Normal non-cacheable" memory for pgprot_writecombine().
> > > Amongst other things, this memory type permits speculation, unaligned accesses
> > > and merging of writes. I found something in the architecture spec about
> > > non-cachable memory, but it's written in Armglish[1].
> > > 
> > > pgprot_noncached(), on the other hand, provides what the architecture calls
> > > Strongly Ordered or Device-nGnRnE memory. This is intended for mapping MMIO
> > > (i.e. PCI config space) and therefore forbids speculation, preserves access
> > > size, requires strict alignment and also forces write responses to come from
> > > the endpoint.
> > > 
> > > I think the naming mismatch is historical, but on arm64 we wanted to use the
> > > same names as arm32 so that any drivers using these things directly would get
> > > the same behaviour.
> > 
> > That all makes sense, but it totally needs a comment.  I'll try to draft
> > one based on this.  I've also looked at the arm32 code a bit more, and
> > it seems arm always (?) supported Normal non-cacheable attribute, but
> > Linux only optionally uses it for arm v6+ because of fears of drivers
> > missing barriers.
> 
> I think it was also to do with aliasing, but I don't recall all of the
> details.

ARMv6+ is where the architecture significantly changed to introduce
the idea of [Normal, Device, Strongly Ordered] where Normal has the
cache attributes.

Before that, we had just "uncached/unbuffered, uncached/buffered,
cached/unbuffered, cached/buffered" modes.

The write buffer (enabled by buffered modes) has no architected
guarantees about how long writes will sit in it, and there is only
the "drain write buffer" instruction to push writes out.

Up to and including ARMv5, we took the easy approach of just using
the "uncached/unbuffered" mode since that is (a) the safest, and (b)
avoids write buffers that alias when there are multiple different
mappings.

We could have used a different approach, making all IO writes contain
a "drain write buffer" instruction, and map DMA memory as "buffered",
but as there were no Linux barriers defined to order memory accesses
to DMA memory (so, for example, ring buffers can be updated in the
correct order) back in those days, using the uncached/unbuffered mode
was the sanest and most reliable solution.

> 
> > The other really weird things is that in arm32
> > pgprot_dmacoherent incudes the L_PTE_XN bit, which from my understanding
> > is the no-execture bit, but pgprot_writecombine does not.  This seems to
> > not very unintentional.  So minus that the whole DMA_ATTR_WRITE_COMBІNE
> > seems to be about flagging old arm specific drivers as having the proper
> > barriers in places and otherwise is a no-op.
> 
> I think it only matters for Armv7 CPUs, but yes, we should probably be
> setting L_PTE_XN for both of these memory types.

Conventionally, pgprot_writecombine() has only been used to change
the memory type and not the permissions.  Since writecombine memory
is still capable of being executed, I don't see any reason to set XN
for it.

If the user wishes to mmap() using PROT_READ|PROT_EXEC, then is there
really a reason for writecombine to set XN overriding the user?

That said, pgprot_writecombine() is mostly used for framebuffers, which
arguably shouldn't be executable anyway - but who'd want to mmap() the
framebuffer with PROT_EXEC?

> 
> > Here is my tentative plan:
> > 
> >  - respin this patch with a small fix to handle the
> >    DMA_ATTR_NON_CONSISTENT (as in ignore it unless actually supported),
> >    but keep the name as-is to avoid churn.  This should allow 5.3
> >    inclusion and backports
> >  - remove DMA_ATTR_WRITE_COMBINE support from mips, probably also 5.3
> >    material.
> >  - move all architectures but arm over to just define
> >    pgprot_dmacoherent, including a comment with the above explanation
> >    for arm64.
> 
> That would be great, thanks.
> 
> >  - make DMA_ATTR_WRITE_COMBINE a no-op and schedule it for removal,
> >    thus removing the last instances of arch_dma_mmap_pgprot
> 
> All sounds good to me, although I suppose 32-bit Arm platforms without
> CONFIG_ARM_DMA_MEM_BUFFERABLE may run into issues if DMA_ATTR_WRITE_COMBINE
> disappears. Only one way to find out...

Looking at the results of grep, I think only OMAP2+ and Exynos may be
affected.

However, removing writecombine support from the DMA API is going to
have a huge impact for framebuffers on earlier ARMs - that's where we
do expect framebuffers to be mapped "uncached/buffered" for performance
reasons and not "uncached/unbuffered".  It's quite literally the
difference between console scrolling being usable and totally unusable.

Given what I've said above, switching to using buffered mode for normal
DMA mappings is data-corrupting risky - as in your filesystem could get
fried.  I don't think we should play fast and loose with people's data
by randomly changing that "because we'd like to", and I don't see that
screwing the console is really an option either.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line in suburbia: sync at 12.1Mbps down 622kbps up
According to speedtest.net: 11.9Mbps down 500kbps up
