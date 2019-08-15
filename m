Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7718F29F
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Aug 2019 19:55:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 468Yyr0yJXzDr83
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Aug 2019 03:55:48 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 468Ywg5nzbzDqRC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Aug 2019 03:53:54 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E3BED68AFE; Thu, 15 Aug 2019 19:53:46 +0200 (CEST)
Date: Thu, 15 Aug 2019 19:53:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Rob Clark <robdclark@chromium.org>
Subject: Re: [PATCH 0/6] drm+dma: cache support for arm, etc
Message-ID: <20190815175346.GA19839@lst.de>
References: <20190814220011.26934-1-robdclark@gmail.com>
 <20190815065117.GA23761@lst.de>
 <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJs_Fx4bS64s7+xQqsead3N80ZQpofqegFQu+tT=b3wcGd_2pA@mail.gmail.com>
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>,
 "Maciej W. Rozycki" <macro@linux-mips.org>, Eric Biggers <ebiggers@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Imre Deak <imre.deak@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>,
 Masahiro Yamada <yamada.masahiro@socionext.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Emil Velikov <emil.velikov@collabora.com>,
 Deepak Sharma <deepak.sharma@amd.com>, Paul Burton <paul.burton@mips.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 "moderated list:ARM64 PORT \(AARCH64 ARCHITECTURE\)"
 <linux-arm-kernel@lists.infradead.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 "open list:MIPS" <linux-mips@vger.kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Joerg Roedel <jroedel@suse.de>, Arnd Bergmann <arnd@arndb.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Hauke Mehrtens <hauke@hauke-m.de>, Jesper Dangaard Brouer <brouer@redhat.com>,
 "Wolfram Sang \(Renesas\)" <wsa+renesas@sang-engineering.com>,
 "open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\)"
 <linuxppc-dev@lists.ozlabs.org>, Alexios Zavras <alexios.zavras@intel.com>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Doug Anderson <armlinux@m.disordat.com>, Thomas Gleixner <tglx@linutronix.de>,
 Sean Paul <sean@poorly.run>, Allison Randal <allison@lohutok.net>,
 Enrico Weigelt <info@metux.net>, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Souptick Joarder <jrdr.linux@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 christian.koenig@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Aug 15, 2019 at 06:54:39AM -0700, Rob Clark wrote:
> On Wed, Aug 14, 2019 at 11:51 PM Christoph Hellwig <hch@lst.de> wrote:
> >
> > As said before I don't think these low-level helpers are the
> > right API to export, but even if they did you'd just cover a tiny
> > subset of the architectures.
> 
> Are you thinking instead something like:
> 
> void dma_sync_sg_for_{cpu,device}(struct device *dev, struct scatterlist *sgl,
>                                   int nents, enum dma_data_direction dir)
> {
>     for_each_sg(sgl, sg, nents, i) {
>         arch_sync_dma_for_..(dev, sg_phys(sg), sg->length, dir);
>     }
> }
> EXPORT_SYMBOL_GPL(dma_sync_sg_for_..)
> 
> or did you have something else in mind?

No.  We really need an interface thay says please give me uncached
memory (for some definition of uncached that includes that grapics
drivers call write combine), and then let the architecture do the right
thing.  Basically dma_alloc_coherent with DMA_ATTR_NO_KERNEL_MAPPING
is superficially close to what you want, except that the way the drm
drivers work you can't actually use it.

The reason for that is if we can we really need to not create another
uncachable alias, but instead change the page attributes in place.
On x86 we can and must do that for example, and based on the
conversation with Will arm64 could do that fairly easily.  arm32 can
right now only do that for CMA, though.

The big question is what API do we want.  I had a pretty similar
discussion with Christian on doing such an allocation for amdgpu,
where the device normally is cache coherent, but they actually want
to turn it into non-coherent by using PCIe unsnooped transactions.

Here is my high level plan, which still has a few lose end:

 (1) provide a new API:

	struct page *dma_alloc_pages(struct device *dev, unsigned nr_pages,
			gfp_t gfp, unsigned long flags);
	void dma_free_pages(struct device *dev, unsigned nr_pages,
			unsigned long flags);

     These give you back page backed memory that is guaranteed to be
     addressable by the device (no swiotlb or similar).  The memory can
     then be mapped using dma_map*, including unmap and dma_sync to
     bounce ownership around.  This is the replacement for the current
     dma_alloc_attrs with DMA_ATTR_NON_CONSISTENT API, that is rather
     badly defined.

 (2) Add support for DMA_ATTR_NO_KERNEL_MAPPING to this new API instead
     of dma_alloc_attrs.  The initial difference with that flag is just
     that we allow highmem, but in the future we could also unmap this
     memory from the kernel linear mapping entirely on architectures
     where we can easily do that.

 (3) Add a dma_pages_map/dma_pages_unmap or similar API that allows you
     to get a kernel mapping for parts or all of a
     DMA_ATTR_NO_KERNEL_MAPPING allocation.  This is to replace things
     like your open-coded vmap in msm (or similarly elsewhere in dma-buf
     providers).

 (4) Add support for a DMA_ATTR_UNCACHABLE flags (or similar) to the new
     API, that maps the pages as uncachable iff they have a kernel
     mapping, including invalidating the caches at time of this page
     attribute change (or creation of a new mapping).  This API will fail
     if the architecture does not allow in-place remapping.  Note that for
     arm32 we could always dip into the CMA pool if one is present to not
     fail.  We'll also need some helper to map from the DMA_ATTR_* flags
     to a pgprot for mapping the page to userspace.  There is also a few
     other weird bits here, e.g. on architectures like mips that use an
     uncached segment we'll have to fail use with the plain
     DMA_ATTR_UNCACHABLE flag, but it could be supported with
     DMA_ATTR_UNCACHABLE | DMA_ATTR_NO_KERNEL_MAPPING.

I was hoping to get most of this done for this merge window, but I'm
probably lucky if I get at least parts done.  Too much distraction.

> Hmm, not entirely sure why.. you should be on the cc list for each
> individual patch.

They finally made it, although even with the delay they only ended up
in the spam mailbox.  I still can't see them on the various mailing
lists.
