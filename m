Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 419FF804C4
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 08:50:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 460vm430yCzDr1q
	for <lists+linuxppc-dev@lfdr.de>; Sat,  3 Aug 2019 16:49:56 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 460vkG3qT5zDrBm
 for <linuxppc-dev@lists.ozlabs.org>; Sat,  3 Aug 2019 16:48:20 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 3208868BFE; Sat,  3 Aug 2019 08:48:13 +0200 (CEST)
Date: Sat, 3 Aug 2019 08:48:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Will Deacon <will@kernel.org>
Subject: Re: [PATCH] dma-mapping: fix page attributes for dma_mmap_*
Message-ID: <20190803064812.GA29746@lst.de>
References: <20190801142118.21225-1-hch@lst.de>
 <20190801142118.21225-2-hch@lst.de>
 <20190801162305.3m32chycsdjmdejk@willie-the-truck>
 <20190801163457.GB26588@lst.de>
 <20190801164411.kmsl4japtfkgvzxe@willie-the-truck>
 <20190802081441.GA9725@lst.de>
 <20190802103803.3qrbhqwxlasojsco@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190802103803.3qrbhqwxlasojsco@willie-the-truck>
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

On Fri, Aug 02, 2019 at 11:38:03AM +0100, Will Deacon wrote:
> 
> So this boils down to a terminology mismatch. The Arm architecture doesn't have
> anything called "write combine", so in Linux we instead provide what the Arm
> architecture calls "Normal non-cacheable" memory for pgprot_writecombine().
> Amongst other things, this memory type permits speculation, unaligned accesses
> and merging of writes. I found something in the architecture spec about
> non-cachable memory, but it's written in Armglish[1].
> 
> pgprot_noncached(), on the other hand, provides what the architecture calls
> Strongly Ordered or Device-nGnRnE memory. This is intended for mapping MMIO
> (i.e. PCI config space) and therefore forbids speculation, preserves access
> size, requires strict alignment and also forces write responses to come from
> the endpoint.
> 
> I think the naming mismatch is historical, but on arm64 we wanted to use the
> same names as arm32 so that any drivers using these things directly would get
> the same behaviour.

That all makes sense, but it totally needs a comment.  I'll try to draft
one based on this.  I've also looked at the arm32 code a bit more, and
it seems arm always (?) supported Normal non-cacheable attribute, but
Linux only optionally uses it for arm v6+ because of fears of drivers
missing barriers.  The other really weird things is that in arm32
pgprot_dmacoherent incudes the L_PTE_XN bit, which from my understanding
is the no-execture bit, but pgprot_writecombine does not.  This seems to
not very unintentional.  So minus that the whole DMA_ATTR_WRITE_COMBІNE
seems to be about flagging old arm specific drivers as having the proper
barriers in places and otherwise is a no-op.

Here is my tentative plan:

 - respin this patch with a small fix to handle the
   DMA_ATTR_NON_CONSISTENT (as in ignore it unless actually supported),
   but keep the name as-is to avoid churn.  This should allow 5.3
   inclusion and backports
 - remove DMA_ATTR_WRITE_COMBINE support from mips, probably also 5.3
   material.
 - move all architectures but arm over to just define
   pgprot_dmacoherent, including a comment with the above explanation
   for arm64.
 - make DMA_ATTR_WRITE_COMBINE a no-op and schedule it for removal,
   thus removing the last instances of arch_dma_mmap_pgprot
