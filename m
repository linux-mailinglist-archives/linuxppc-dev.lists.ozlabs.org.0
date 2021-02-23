Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 04FBA32238D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 02:22:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dl1Wc0Tr6z3cTN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Feb 2021 12:22:52 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=qT9uEWGJ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=sstabellini@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=qT9uEWGJ; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Dl1WB2jxfz30N6
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Feb 2021 12:22:30 +1100 (AEDT)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A8BC86023B;
 Tue, 23 Feb 2021 01:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614043347;
 bh=QyNsljerVpDiDO+K9/ltiFTkhVqcxc/0Ay2CXZ1z8vI=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=qT9uEWGJgqYzpURFhCR6u+Wbw6bbsJzfvEpXt+qOvRpZBeHHsRUnipN3HQHDDB3E3
 gCjXrJz0oOmy8eLfkAtbzisTgVdrdP8aPT65rPgULTDiPO+qGgU3kXayVSCi7szBX/
 MfxWKKRGZmJ1Y0ya3KFks5fDwYLPA+LP36j6egOWcx+zZZlUCQVI7We8WcL7pgLfTc
 aFyNR7YKXv/dZO9DLIrqsrZIWF99Xag6MDO0N1HuYflfFdk0rqJHeOrj3VhyML8MHz
 tVChYYBBryvSqBDuB2Mo5J/NvyYzT12d/wTuwUUZX0GTHVvNU/omP5eYzJ827lYJXw
 ABjqJ4JGM8RZA==
Date: Mon, 22 Feb 2021 17:22:24 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
Subject: Re: [PATCH RFC v1 5/6] xen-swiotlb: convert variables to arrays
In-Reply-To: <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
Message-ID: <alpine.DEB.2.21.2102221511360.3234@sstabellini-ThinkPad-T480s>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-6-dongli.zhang@oracle.com>
 <20210204084023.GA32328@lst.de> <20210207155601.GA25111@lst.de>
 <YDAgT2ZIdncNwNlf@Konrads-MacBook-Pro.local>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, joonas.lahtinen@linux.intel.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 paulus@samba.org, hpa@zytor.com, Christoph Hellwig <hch@lst.de>,
 m.szyprowski@samsung.com, sstabellini@kernel.org, adrian.hunter@intel.com,
 Dongli Zhang <dongli.zhang@oracle.com>, x86@kernel.org, joe.jin@oracle.com,
 mingo@kernel.org, peterz@infradead.org, mingo@redhat.com, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, bhelgaas@google.com,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, chris@chris-wilson.co.uk,
 jgross@suse.com, tsbogend@alpha.franken.de, nouveau@lists.freedesktop.org,
 robin.murphy@arm.com, linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, tglx@linutronix.de, bauerman@linux.ibm.com,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, 19 Feb 2021, Konrad Rzeszutek Wilk wrote:
> On Sun, Feb 07, 2021 at 04:56:01PM +0100, Christoph Hellwig wrote:
> > On Thu, Feb 04, 2021 at 09:40:23AM +0100, Christoph Hellwig wrote:
> > > So one thing that has been on my mind for a while:  I'd really like
> > > to kill the separate dma ops in Xen swiotlb.  If we compare xen-swiotlb
> > > to swiotlb the main difference seems to be:
> > > 
> > >  - additional reasons to bounce I/O vs the plain DMA capable
> > >  - the possibility to do a hypercall on arm/arm64
> > >  - an extra translation layer before doing the phys_to_dma and vice
> > >    versa
> > >  - an special memory allocator
> > > 
> > > I wonder if inbetween a few jump labels or other no overhead enablement
> > > options and possibly better use of the dma_range_map we could kill
> > > off most of swiotlb-xen instead of maintaining all this code duplication?
> > 
> > So I looked at this a bit more.
> > 
> > For x86 with XENFEAT_auto_translated_physmap (how common is that?)
> 
> Juergen, Boris please correct me if I am wrong, but that XENFEAT_auto_translated_physmap
> only works for PVH guests?

ARM is always XENFEAT_auto_translated_physmap


> > pfn_to_gfn is a nop, so plain phys_to_dma/dma_to_phys do work as-is.
> > 
> > xen_arch_need_swiotlb always returns true for x86, and
> > range_straddles_page_boundary should never be true for the
> > XENFEAT_auto_translated_physmap case.
> 
> Correct. The kernel should have no clue of what the real MFNs are
> for PFNs.

On ARM, Linux knows the MFNs because for local pages MFN == PFN and for
foreign pages it keeps track in arch/arm/xen/p2m.c. More on this below.

xen_arch_need_swiotlb only returns true on ARM in rare situations where
bouncing on swiotlb buffers is required. Today it only happens on old
versions of Xen that don't support the cache flushing hypercall but
there could be more cases in the future.


> > 
> > So as far as I can tell the mapping fast path for the
> > XENFEAT_auto_translated_physmap can be trivially reused from swiotlb.
> > 
> > That leaves us with the next more complicated case, x86 or fully cache
> > coherent arm{,64} without XENFEAT_auto_translated_physmap.  In that case
> > we need to patch in a phys_to_dma/dma_to_phys that performs the MFN
> > lookup, which could be done using alternatives or jump labels.
> > I think if that is done right we should also be able to let that cover
> > the foreign pages in is_xen_swiotlb_buffer/is_swiotlb_buffer, but
> > in that worst case that would need another alternative / jump label.
> > 
> > For non-coherent arm{,64} we'd also need to use alternatives or jump
> > labels to for the cache maintainance ops, but that isn't a hard problem
> > either.

With the caveat that ARM is always XENFEAT_auto_translated_physmap, what
you wrote looks correct. I am writing down a brief explanation on how
swiotlb-xen is used on ARM.


pfn: address as seen by the guest, pseudo-physical address in ARM terminology
mfn (or bfn): real address, physical address in ARM terminology


On ARM dom0 is auto_translated (so Xen sets up the stage2 translation
in the MMU) and the translation is 1:1. So pfn == mfn for Dom0.

However, when another domain shares a page with Dom0, that page is not
1:1. Swiotlb-xen is used to retrieve the mfn for the foreign page at
xen_swiotlb_map_page. It does that with xen_phys_to_bus -> pfn_to_bfn.
It is implemented with a rbtree in arch/arm/xen/p2m.c.

In addition, swiotlb-xen is also used to cache-flush the page via
hypercall at xen_swiotlb_unmap_page. That is done because dev_addr is
really the mfn at unmap_page and we don't know the pfn for it. We can do
pfn-to-mfn but we cannot do mfn-to-pfn (there are good reasons for it
unfortunately). The only way to cache-flush by mfn is by issuing a
hypercall. The hypercall is implemented in arch/arm/xen/mm.c.

The pfn != bfn and pfn_valid() checks are used to detect if the page is
local (of dom0) or foreign; they work thanks to the fact that Dom0 is
1:1 mapped.


Getting back to what you wrote, yes if we had a way to do MFN lookups in
phys_to_dma, and a way to call the hypercall at unmap_page if the page
is foreign (e.g. if it fails a pfn_valid check) then I think we would be
good from an ARM perspective. The only exception is when
xen_arch_need_swiotlb returns true, in which case we need to actually
bounce on swiotlb buffers.
