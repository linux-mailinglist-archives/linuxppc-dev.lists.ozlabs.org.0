Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6DB3B2E29
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 13:49:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G9dhR11llz2xts
	for <lists+linuxppc-dev@lfdr.de>; Thu, 24 Jun 2021 21:49:11 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=cnBL/cs5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=will@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=cnBL/cs5; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G9dgx4ghLz3060
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 24 Jun 2021 21:48:45 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E399761185;
 Thu, 24 Jun 2021 11:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624535321;
 bh=tIEzJbFyzrkVCHoPFZv7EiSn5eGdWcktY1hM7567WC4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cnBL/cs5jq0gzsWpdW01qPqR4FhnbZYA5FARUzRbfbTnReSUvqYZg/5d7fMfMzzLB
 Yi5ocgI40U2CdP0yPBgaSH4aMAy6kTVPwJQovsDfnM8E0ctEFfmI50PYyqPNdilEHT
 wiHUoLZz+z5T3P7Nu0n1FHp0CT0+Mpa9kCcUzUXOGKpJLUcEA7B6eF0lhIA1fVOD2N
 8hTi4ZzKBg0KOAPGGETjH9KnPn8WseTFQmhg5QfTMY6mH9TlCuMS+A5EiYaVCFxL1+
 hxLlyRsIfAlqe3aZtbbg/Ry8xq+FvG9CW/Y0YZqD103SdYwufpVGkDaukfSWqnEWQs
 pjV7QbcyVw3Kw==
Date: Thu, 24 Jun 2021 12:48:30 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH v14 06/12] swiotlb: Use is_swiotlb_force_bounce for
 swiotlb data bouncing
Message-ID: <20210624114829.GB1382@willie-the-truck>
References: <20210619034043.199220-1-tientzu@chromium.org>
 <20210619034043.199220-7-tientzu@chromium.org>
 <76c3343d-72e5-9df3-8924-5474ee698ef4@quicinc.com>
 <20210623183736.GA472@willie-the-truck>
 <19d4c7a2-744d-21e0-289c-a576e1f0e6f3@quicinc.com>
 <20210624054315.GA25381@lst.de>
 <CALiNf288ZLMhY3E8E3N+z9rkwi1viWNLm1wwMEwT4rNwh3FfwQ@mail.gmail.com>
 <364e6715-eafd-fc4a-e0af-ce2a042756b4@arm.com>
 <20210624111855.GA1382@willie-the-truck>
 <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <452155d2-c98e-23f6-86d6-3a2ff2e74783@arm.com>
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
Cc: heikki.krogerus@linux.intel.com,
 linux-devicetree <devicetree@vger.kernel.org>, peterz@infradead.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Jianxiong Gao <jxgao@google.com>, Stefano Stabellini <sstabellini@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Dan Williams <dan.j.williams@intel.com>, matthew.auld@intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, thomas.hellstrom@linux.intel.com,
 Jim Quinlan <james.quinlan@broadcom.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 intel-gfx@lists.freedesktop.org, maarten.lankhorst@linux.intel.com,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 airlied@linux.ie, Thierry Reding <treding@nvidia.com>,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Qian Cai <quic_qiancai@quicinc.com>, lkml <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, xypron.glpk@gmx.de,
 Tom Lendacky <thomas.lendacky@amd.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 24, 2021 at 12:34:09PM +0100, Robin Murphy wrote:
> On 2021-06-24 12:18, Will Deacon wrote:
> > On Thu, Jun 24, 2021 at 12:14:39PM +0100, Robin Murphy wrote:
> > > On 2021-06-24 07:05, Claire Chang wrote:
> > > > On Thu, Jun 24, 2021 at 1:43 PM Christoph Hellwig <hch@lst.de> wrote:
> > > > > 
> > > > > On Wed, Jun 23, 2021 at 02:44:34PM -0400, Qian Cai wrote:
> > > > > > is_swiotlb_force_bounce at /usr/src/linux-next/./include/linux/swiotlb.h:119
> > > > > > 
> > > > > > is_swiotlb_force_bounce() was the new function introduced in this patch here.
> > > > > > 
> > > > > > +static inline bool is_swiotlb_force_bounce(struct device *dev)
> > > > > > +{
> > > > > > +     return dev->dma_io_tlb_mem->force_bounce;
> > > > > > +}
> > > > > 
> > > > > To me the crash looks like dev->dma_io_tlb_mem is NULL.  Can you
> > > > > turn this into :
> > > > > 
> > > > >           return dev->dma_io_tlb_mem && dev->dma_io_tlb_mem->force_bounce;
> > > > > 
> > > > > for a quick debug check?
> > > > 
> > > > I just realized that dma_io_tlb_mem might be NULL like Christoph
> > > > pointed out since swiotlb might not get initialized.
> > > > However,  `Unable to handle kernel paging request at virtual address
> > > > dfff80000000000e` looks more like the address is garbage rather than
> > > > NULL?
> > > > I wonder if that's because dev->dma_io_tlb_mem is not assigned
> > > > properly (which means device_initialize is not called?).
> > > 
> > > What also looks odd is that the base "address" 0xdfff800000000000 is held in
> > > a couple of registers, but the offset 0xe looks too small to match up to any
> > > relevant structure member in that dereference chain :/
> > 
> > FWIW, I've managed to trigger a NULL dereference locally when swiotlb hasn't
> > been initialised but we dereference 'dev->dma_io_tlb_mem', so I think
> > Christoph's suggestion is needed regardless.
> 
> Ack to that - for SWIOTLB_NO_FORCE, io_tlb_default_mem will remain NULL. The
> massive jump in KernelCI baseline failures as of yesterday looks like every
> arm64 machine with less than 4GB of RAM blowing up...

Ok, diff below which attempts to tackle the offset issue I mentioned as
well. Qian Cai -- please can you try with these changes?

Will

--->8

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 175b6c113ed8..39284ff2a6cd 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -116,7 +116,9 @@ static inline bool is_swiotlb_buffer(struct device *dev, phys_addr_t paddr)
 
 static inline bool is_swiotlb_force_bounce(struct device *dev)
 {
-       return dev->dma_io_tlb_mem->force_bounce;
+       struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
+
+       return mem && mem->force_bounce;
 }
 
 void __init swiotlb_exit(void);
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 44be8258e27b..0ffbaae9fba2 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -449,6 +449,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
                dma_get_min_align_mask(dev) & ~(IO_TLB_SIZE - 1);
        unsigned int nslots = nr_slots(alloc_size), stride;
        unsigned int index, wrap, count = 0, i;
+       unsigned int offset = swiotlb_align_offset(dev, orig_addr);
        unsigned long flags;
 
        BUG_ON(!nslots);
@@ -497,7 +498,7 @@ static int swiotlb_find_slots(struct device *dev, phys_addr_t orig_addr,
        for (i = index; i < index + nslots; i++) {
                mem->slots[i].list = 0;
                mem->slots[i].alloc_size =
-                       alloc_size - ((i - index) << IO_TLB_SHIFT);
+                       alloc_size - (offset + ((i - index) << IO_TLB_SHIFT));
        }
        for (i = index - 1;
             io_tlb_offset(i) != IO_TLB_SEGSIZE - 1 &&
