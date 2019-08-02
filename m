Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B8A97EE95
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 10:16:47 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460Kkh4rdczDqg5
	for <lists+linuxppc-dev@lfdr.de>; Fri,  2 Aug 2019 18:16:44 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460KhV0Xp8zDqg5
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  2 Aug 2019 18:14:47 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F17E68B05; Fri,  2 Aug 2019 10:14:41 +0200 (CEST)
Date: Fri, 2 Aug 2019 10:14:41 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190802081441.GA9725@lst.de>
References: <20190801142118.21225-1-hch@lst.de>
 <20190801142118.21225-2-hch@lst.de>
 <20190801162305.3m32chycsdjmdejk@willie-the-truck>
 <20190801163457.GB26588@lst.de>
 <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
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
Cc: Shawn Anastasio <shawn@anastas.io>, linuxppc-dev@lists.ozlabs.org,
 Russell King <linux@armlinux.org.uk>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Catalin Marinas <catalin.marinas@arm.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 01, 2019 at 05:44:12PM +0100, Will Deacon wrote:
> > > Although arch_dma_mmap_pgprot() is a bit of a misnomer now that it only
> > > gets involved in the non-coherent case.
> > 
> > A better name is welcome.
> 
> How about arch_dma_noncoherent_mmap_pgprot() ? Too long?

Sounds a little long yes.  And doesn't fix the additional problem that
we don't just it for mmap but also for the in-kernel remapping these
days.

> > But my worry is how this interacts with architectures that have an
> > uncached segment (mips, nios2, microblaze, extensa) where we'd have
> > the kernel access DMA_ATTR_WRITE_COMBINE mappigns using the uncached
> > segment, and userspace mmaps using pgprot_writecombine, which could
> > lead to aliasing issues.  But then again mips already supports
> > DMA_ATTR_WRITE_COMBINE, so this must be ok somehow.  I guess I'll
> > need to field that question to the relevant parties.
> 
> Or it's always been busted and happens to work out in practice...

I've sent a ping to the mips folks.  While we'are at it:  arm64
and arm32 (optionally) map dma coherent allocations as write combine.
I suspect this hasn't always just been busted but intentional (of course!),
but is there any chance to get a quote from the arm architecture spec
on why this is fine as it looks rather confusion?

Also if we assume mips is buggy DMA_ATTR_WRITE_COMBINE really just seems
to be there for old arm platforms, which makes the scope pretty limited.
