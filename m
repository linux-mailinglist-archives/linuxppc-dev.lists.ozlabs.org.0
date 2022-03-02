Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCFE4C9B9D
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 03:56:33 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4K7dzy55lFz3c3Y
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Mar 2022 13:56:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Yz8AyEKV;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=2604:1380:4601:e00::1;
 helo=ams.source.kernel.org; envelope-from=sstabellini@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=Yz8AyEKV; 
 dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4K7dzF5dTSz30Q9
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Mar 2022 13:55:53 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8666B81D71;
 Wed,  2 Mar 2022 02:55:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CC18C340EE;
 Wed,  2 Mar 2022 02:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646189749;
 bh=+9ELN9vs62ISIoM03rj0HMh2JUdciOzBOCDhQI6QFPc=;
 h=Date:From:To:cc:Subject:In-Reply-To:References:From;
 b=Yz8AyEKVJasXFNiZ8rmTZeX76EMZyQ9CVYri7P9h7/S6WH9S/TTWf9kmuC58xl0bP
 mus56AWm7bIQY4S0dK37bXzdJOBeuDInue9pq0+mJyGOgcGtQIEnZx+s+LXo23HRDZ
 /PEi9o40pO8LM0kcvJs9PBB1dZRgZszDafnAf7iGlSdzQZcvH2k+svZKIJTdAs+/KZ
 hXm39T9r/qhKfL/Pz2mDOxaOXNjAFXBV3zv0efwV5hO5pCIVKQk+xft7XixOHGVUnB
 ZdypAI3gDK0oWKrimsGXDtsXlzWMDbUxd3xqxDtM+7nBlpjzO31ACN1Qpfy1nPC0WO
 6tKIbg7mY2UFw==
Date: Tue, 1 Mar 2022 18:55:47 -0800 (PST)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@ubuntu-linux-20-04-desktop
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH 11/12] swiotlb: merge swiotlb-xen initialization into
 swiotlb
In-Reply-To: <20220301105311.885699-12-hch@lst.de>
Message-ID: <alpine.DEB.2.22.394.2203011720150.3261@ubuntu-linux-20-04-desktop>
References: <20220301105311.885699-1-hch@lst.de>
 <20220301105311.885699-12-hch@lst.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
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
Cc: linux-hyperv@vger.kernel.org, x86@kernel.org, linux-ia64@vger.kernel.org,
 linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, Stefano Stabellini <sstabellini@kernel.org>,
 Joerg Roedel <joro@8bytes.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 tboot-devel@lists.sourceforge.net, xen-devel@lists.xenproject.org,
 David Woodhouse <dwmw2@infradead.org>, Tom Lendacky <thomas.lendacky@amd.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>,
 linux-arm-kernel@lists.infradead.org, Juergen Gross <jgross@suse.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
 Lu Baolu <baolu.lu@linux.intel.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, 1 Mar 2022, Christoph Hellwig wrote:
> Allow to pass a remap argument to the swiotlb initialization functions
> to handle the Xen/x86 remap case.  ARM/ARM64 never did any remapping
> from xen_swiotlb_fixup, so we don't even need that quirk.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/arm/xen/mm.c               |  23 +++---
>  arch/x86/include/asm/xen/page.h |   5 --
>  arch/x86/kernel/pci-dma.c       |  19 +++--
>  arch/x86/pci/sta2x11-fixup.c    |   2 +-
>  drivers/xen/swiotlb-xen.c       | 128 +-------------------------------
>  include/linux/swiotlb.h         |   7 +-
>  include/xen/arm/page.h          |   1 -
>  include/xen/swiotlb-xen.h       |   8 +-
>  kernel/dma/swiotlb.c            | 120 +++++++++++++++---------------
>  9 files changed, 96 insertions(+), 217 deletions(-)
> 
> diff --git a/arch/arm/xen/mm.c b/arch/arm/xen/mm.c
> index a7e54a087b802..58b40f87617d3 100644
> --- a/arch/arm/xen/mm.c
> +++ b/arch/arm/xen/mm.c
> @@ -23,22 +23,20 @@
>  #include <asm/xen/hypercall.h>
>  #include <asm/xen/interface.h>
>  
> -unsigned long xen_get_swiotlb_free_pages(unsigned int order)
> +static gfp_t xen_swiotlb_gfp(void)
>  {
>  	phys_addr_t base;
> -	gfp_t flags = __GFP_NOWARN|__GFP_KSWAPD_RECLAIM;
>  	u64 i;
>  
>  	for_each_mem_range(i, &base, NULL) {
>  		if (base < (phys_addr_t)0xffffffff) {
>  			if (IS_ENABLED(CONFIG_ZONE_DMA32))
> -				flags |= __GFP_DMA32;
> -			else
> -				flags |= __GFP_DMA;
> -			break;
> +				return __GFP_DMA32;
> +			return __GFP_DMA;
>  		}
>  	}
> -	return __get_free_pages(flags, order);
> +
> +	return GFP_KERNEL;
>  }

Unrelated to this specific patch series: now that I think about it, if
io_tlb_default_mem.nslabs is already allocated by the time xen_mm_init
is called, wouldn't we potentially have an issue with the GFP flags used
for the earlier allocation (e.g. GFP_DMA32 not used)? Maybe something
for another day.


>  static bool hypercall_cflush = false;
> @@ -143,10 +141,15 @@ static int __init xen_mm_init(void)
>  	if (!xen_swiotlb_detect())
>  		return 0;
>  
> -	rc = xen_swiotlb_init();
>  	/* we can work with the default swiotlb */
> -	if (rc < 0 && rc != -EEXIST)
> -		return rc;
> +	if (!io_tlb_default_mem.nslabs) {
> +		if (!xen_initial_domain())
> +			return -EINVAL;

I don't think we need this xen_initial_domain() check. It is all
already sorted out by the xen_swiotlb_detect() check above.

Aside from that the rest looks OK. Also, you can add my:

Tested-by: Stefano Stabellini <sstabellini@kernel.org>


> +		rc = swiotlb_init_late(swiotlb_size_or_default(),
> +				       xen_swiotlb_gfp(), NULL);
> +		if (rc < 0)
> +			return rc;
> +	}
>  
>  	cflush.op = 0;
>  	cflush.a.dev_bus_addr = 0;
> diff --git a/arch/x86/include/asm/xen/page.h b/arch/x86/include/asm/xen/page.h
> index e989bc2269f54..1fc67df500145 100644
> --- a/arch/x86/include/asm/xen/page.h
> +++ b/arch/x86/include/asm/xen/page.h
> @@ -357,9 +357,4 @@ static inline bool xen_arch_need_swiotlb(struct device *dev,
>  	return false;
>  }
>  
> -static inline unsigned long xen_get_swiotlb_free_pages(unsigned int order)
> -{
> -	return __get_free_pages(__GFP_NOWARN, order);
> -}
> -
>  #endif /* _ASM_X86_XEN_PAGE_H */
> diff --git a/arch/x86/kernel/pci-dma.c b/arch/x86/kernel/pci-dma.c
> index e0def4b1c3181..2f2c468acb955 100644
> --- a/arch/x86/kernel/pci-dma.c
> +++ b/arch/x86/kernel/pci-dma.c
> @@ -71,15 +71,12 @@ static inline void __init pci_swiotlb_detect(void)
>  #endif /* CONFIG_SWIOTLB */
>  
>  #ifdef CONFIG_SWIOTLB_XEN
> -static bool xen_swiotlb;
> -
>  static void __init pci_xen_swiotlb_init(void)
>  {
>  	if (!xen_initial_domain() && !x86_swiotlb_enable)
>  		return;
>  	x86_swiotlb_enable = false;
> -	xen_swiotlb = true;
> -	xen_swiotlb_init_early();
> +	swiotlb_init_remap(true, x86_swiotlb_flags, xen_swiotlb_fixup);
>  	dma_ops = &xen_swiotlb_dma_ops;
>  	if (IS_ENABLED(CONFIG_PCI))
>  		pci_request_acs();
> @@ -87,14 +84,16 @@ static void __init pci_xen_swiotlb_init(void)
>  
>  int pci_xen_swiotlb_init_late(void)
>  {
> -	int rc;
> -
> -	if (xen_swiotlb)
> +	if (dma_ops == &xen_swiotlb_dma_ops)
>  		return 0;
>  
> -	rc = xen_swiotlb_init();
> -	if (rc)
> -		return rc;
> +	/* we can work with the default swiotlb */
> +	if (!io_tlb_default_mem.nslabs) {
> +		int rc = swiotlb_init_late(swiotlb_size_or_default(),
> +					   GFP_KERNEL, xen_swiotlb_fixup);
> +		if (rc < 0)
> +			return rc;
> +	}
>  
>  	/* XXX: this switches the dma ops under live devices! */
>  	dma_ops = &xen_swiotlb_dma_ops;
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index c2da3eb4826e8..df8085b50df10 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -104,7 +104,7 @@ static int is_xen_swiotlb_buffer(struct device *dev, dma_addr_t dma_addr)
>  	return 0;
>  }
>  
> -static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
> +int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
>  {
>  	int rc;
>  	unsigned int order = get_order(IO_TLB_SEGSIZE << IO_TLB_SHIFT);
> @@ -130,132 +130,6 @@ static int xen_swiotlb_fixup(void *buf, unsigned long nslabs)
>  	return 0;
>  }
>  
> -enum xen_swiotlb_err {
> -	XEN_SWIOTLB_UNKNOWN = 0,
> -	XEN_SWIOTLB_ENOMEM,
> -	XEN_SWIOTLB_EFIXUP
> -};
> -
> -static const char *xen_swiotlb_error(enum xen_swiotlb_err err)
> -{
> -	switch (err) {
> -	case XEN_SWIOTLB_ENOMEM:
> -		return "Cannot allocate Xen-SWIOTLB buffer\n";
> -	case XEN_SWIOTLB_EFIXUP:
> -		return "Failed to get contiguous memory for DMA from Xen!\n"\
> -		    "You either: don't have the permissions, do not have"\
> -		    " enough free memory under 4GB, or the hypervisor memory"\
> -		    " is too fragmented!";
> -	default:
> -		break;
> -	}
> -	return "";
> -}
> -
> -int xen_swiotlb_init(void)
> -{
> -	enum xen_swiotlb_err m_ret = XEN_SWIOTLB_UNKNOWN;
> -	unsigned long bytes = swiotlb_size_or_default();
> -	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
> -	unsigned int order, repeat = 3;
> -	int rc = -ENOMEM;
> -	char *start;
> -
> -	if (io_tlb_default_mem.nslabs) {
> -		pr_warn("swiotlb buffer already initialized\n");
> -		return -EEXIST;
> -	}
> -
> -retry:
> -	m_ret = XEN_SWIOTLB_ENOMEM;
> -	order = get_order(bytes);
> -
> -	/*
> -	 * Get IO TLB memory from any location.
> -	 */
> -#define SLABS_PER_PAGE (1 << (PAGE_SHIFT - IO_TLB_SHIFT))
> -#define IO_TLB_MIN_SLABS ((1<<20) >> IO_TLB_SHIFT)
> -	while ((SLABS_PER_PAGE << order) > IO_TLB_MIN_SLABS) {
> -		start = (void *)xen_get_swiotlb_free_pages(order);
> -		if (start)
> -			break;
> -		order--;
> -	}
> -	if (!start)
> -		goto exit;
> -	if (order != get_order(bytes)) {
> -		pr_warn("Warning: only able to allocate %ld MB for software IO TLB\n",
> -			(PAGE_SIZE << order) >> 20);
> -		nslabs = SLABS_PER_PAGE << order;
> -		bytes = nslabs << IO_TLB_SHIFT;
> -	}
> -
> -	/*
> -	 * And replace that memory with pages under 4GB.
> -	 */
> -	rc = xen_swiotlb_fixup(start, nslabs);
> -	if (rc) {
> -		free_pages((unsigned long)start, order);
> -		m_ret = XEN_SWIOTLB_EFIXUP;
> -		goto error;
> -	}
> -	rc = swiotlb_late_init_with_tbl(start, nslabs);
> -	if (rc)
> -		return rc;
> -	return 0;
> -error:
> -	if (nslabs > 1024 && repeat--) {
> -		/* Min is 2MB */
> -		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> -		bytes = nslabs << IO_TLB_SHIFT;
> -		pr_info("Lowering to %luMB\n", bytes >> 20);
> -		goto retry;
> -	}
> -exit:
> -	pr_err("%s (rc:%d)\n", xen_swiotlb_error(m_ret), rc);
> -	return rc;
> -}
> -
> -#ifdef CONFIG_X86
> -void __init xen_swiotlb_init_early(void)
> -{
> -	unsigned long bytes = swiotlb_size_or_default();
> -	unsigned long nslabs = bytes >> IO_TLB_SHIFT;
> -	unsigned int repeat = 3;
> -	char *start;
> -	int rc;
> -
> -retry:
> -	/*
> -	 * Get IO TLB memory from any location.
> -	 */
> -	start = memblock_alloc(PAGE_ALIGN(bytes),
> -			       IO_TLB_SEGSIZE << IO_TLB_SHIFT);
> -	if (!start)
> -		panic("%s: Failed to allocate %lu bytes\n",
> -		      __func__, PAGE_ALIGN(bytes));
> -
> -	/*
> -	 * And replace that memory with pages under 4GB.
> -	 */
> -	rc = xen_swiotlb_fixup(start, nslabs);
> -	if (rc) {
> -		memblock_free(start, PAGE_ALIGN(bytes));
> -		if (nslabs > 1024 && repeat--) {
> -			/* Min is 2MB */
> -			nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> -			bytes = nslabs << IO_TLB_SHIFT;
> -			pr_info("Lowering to %luMB\n", bytes >> 20);
> -			goto retry;
> -		}
> -		panic("%s (rc:%d)", xen_swiotlb_error(XEN_SWIOTLB_EFIXUP), rc);
> -	}
> -
> -	if (swiotlb_init_with_tbl(start, nslabs, SWIOTLB_VERBOSE))
> -		panic("Cannot allocate SWIOTLB buffer");
> -}
> -#endif /* CONFIG_X86 */
> -
>  static void *
>  xen_swiotlb_alloc_coherent(struct device *hwdev, size_t size,
>  			   dma_addr_t *dma_handle, gfp_t flags,
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index ee655f2e4d28b..919cf82ed978e 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -34,10 +34,11 @@ struct scatterlist;
>  /* default to 64MB */
>  #define IO_TLB_DEFAULT_SIZE (64UL<<20)
>  
> -int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, unsigned int flags);
>  unsigned long swiotlb_size_or_default(void);
> -extern int swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs);
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask);
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +		int (*remap)(void *tlb, unsigned long nslabs));
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +		int (*remap)(void *tlb, unsigned long nslabs));
>  extern void __init swiotlb_update_mem_attributes(void);
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/include/xen/arm/page.h b/include/xen/arm/page.h
> index ac1b654705631..7e199c6656b90 100644
> --- a/include/xen/arm/page.h
> +++ b/include/xen/arm/page.h
> @@ -115,6 +115,5 @@ static inline bool set_phys_to_machine(unsigned long pfn, unsigned long mfn)
>  bool xen_arch_need_swiotlb(struct device *dev,
>  			   phys_addr_t phys,
>  			   dma_addr_t dev_addr);
> -unsigned long xen_get_swiotlb_free_pages(unsigned int order);
>  #endif /* _ASM_ARM_XEN_PAGE_H */
> diff --git a/include/xen/swiotlb-xen.h b/include/xen/swiotlb-xen.h
> index b3e647f86e3e2..590ceb923f0c8 100644
> --- a/include/xen/swiotlb-xen.h
> +++ b/include/xen/swiotlb-xen.h
> @@ -10,8 +10,12 @@ void xen_dma_sync_for_cpu(struct device *dev, dma_addr_t handle,
>  void xen_dma_sync_for_device(struct device *dev, dma_addr_t handle,
>  			     size_t size, enum dma_data_direction dir);
>  
> -int xen_swiotlb_init(void);
> -void __init xen_swiotlb_init_early(void);
> +#ifdef CONFIG_SWIOTLB_XEN
> +int xen_swiotlb_fixup(void *buf, unsigned long nslabs);
> +#else
> +#define xen_swiotlb_fixup NULL
> +#endif
> +
>  extern const struct dma_map_ops xen_swiotlb_dma_ops;
>  
>  #endif /* __LINUX_SWIOTLB_XEN_H */
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 77cf73dc20a78..128363dc9b5bb 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -234,40 +234,17 @@ static void swiotlb_init_io_tlb_mem(struct io_tlb_mem *mem, phys_addr_t start,
>  	return;
>  }
>  
> -int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs,
> -		unsigned int flags)
> -{
> -	struct io_tlb_mem *mem = &io_tlb_default_mem;
> -	size_t alloc_size;
> -
> -	if (swiotlb_force_disable)
> -		return 0;
> -
> -	/* protect against double initialization */
> -	if (WARN_ON_ONCE(mem->nslabs))
> -		return -ENOMEM;
> -
> -	alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
> -	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
> -	if (!mem->slots)
> -		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> -		      __func__, alloc_size, PAGE_SIZE);
> -
> -	swiotlb_init_io_tlb_mem(mem, __pa(tlb), nslabs, false);
> -	mem->force_bounce = flags & SWIOTLB_FORCE;
> -
> -	if (flags & SWIOTLB_VERBOSE)
> -		swiotlb_print_info();
> -	return 0;
> -}
> -
>  /*
>   * Statically reserve bounce buffer space and initialize bounce buffer data
>   * structures for the software IO TLB used to implement the DMA API.
>   */
> -void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +void __init swiotlb_init_remap(bool addressing_limit, unsigned int flags,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
> -	size_t bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
> +	struct io_tlb_mem *mem = &io_tlb_default_mem;
> +	unsigned long nslabs = default_nslabs;
> +	size_t alloc_size = PAGE_ALIGN(array_size(sizeof(*mem->slots), nslabs));
> +	size_t bytes;
>  	void *tlb;
>  
>  	if (!addressing_limit && !swiotlb_force_bounce)
> @@ -275,23 +252,48 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>  	if (swiotlb_force_disable)
>  		return;
>  
> +	/* protect against double initialization */
> +	if (WARN_ON_ONCE(mem->nslabs))
> +		return;
> +
>  	/*
>  	 * By default allocate the bonuce buffer memory from low memory.
>  	 */
> +retry:
> +	bytes = PAGE_ALIGN(default_nslabs << IO_TLB_SHIFT);
>  	if (flags & SWIOTLB_ANY)
>  		tlb = memblock_alloc(bytes, PAGE_SIZE);
>  	else
>  		tlb = memblock_alloc_low(bytes, PAGE_SIZE);
>  	if (!tlb)
> -		goto fail;
> -	if (swiotlb_init_with_tbl(tlb, default_nslabs, flags))
> -		goto fail_free_mem;
> -	return;
> +		panic("%s: failed to allocate tlb structure\n", __func__);
> +
> +	if (remap && remap(tlb, nslabs) < 0) {
> +		memblock_free(tlb, PAGE_ALIGN(bytes));
> +
> +		/* Min is 2MB */
> +		if (nslabs <= 1024)
> +			panic("%s: Failed to remap %zu bytes\n",
> +			      __func__, bytes);
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> +		goto retry;
> +	}
> +
> +	mem->slots = memblock_alloc(alloc_size, PAGE_SIZE);
> +	if (!mem->slots)
> +		panic("%s: Failed to allocate %zu bytes align=0x%lx\n",
> +		      __func__, alloc_size, PAGE_SIZE);
>  
> -fail_free_mem:
> -	memblock_free(tlb, bytes);
> -fail:
> -	pr_warn("Cannot allocate buffer");
> +	swiotlb_init_io_tlb_mem(mem, __pa(tlb), default_nslabs, false);
> +	mem->force_bounce = flags & SWIOTLB_FORCE;
> +
> +	if (flags & SWIOTLB_VERBOSE)
> +		swiotlb_print_info();
> +}
> +
> +void __init swiotlb_init(bool addressing_limit, unsigned int flags)
> +{
> +	return swiotlb_init_remap(addressing_limit, flags, NULL);
>  }
>  
>  /*
> @@ -299,8 +301,10 @@ void __init swiotlb_init(bool addressing_limit, unsigned int flags)
>   * initialize the swiotlb later using the slab allocator if needed.
>   * This should be just like above, but with some error catching.
>   */
> -int swiotlb_init_late(size_t size, gfp_t gfp_mask)
> +int swiotlb_init_late(size_t size, gfp_t gfp_mask,
> +		int (*remap)(void *tlb, unsigned long nslabs))
>  {
> +	struct io_tlb_mem *mem = &io_tlb_default_mem;
>  	unsigned long nslabs = ALIGN(size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
>  	unsigned long bytes;
>  	unsigned char *vstart = NULL;
> @@ -310,9 +314,14 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  	if (swiotlb_force_disable)
>  		return 0;
>  
> +	/* protect against double initialization */
> +	if (WARN_ON_ONCE(mem->nslabs))
> +		return -ENOMEM;
> +
>  	/*
>  	 * Get IO TLB memory from the low pages
>  	 */
> +retry:
>  	order = get_order(nslabs << IO_TLB_SHIFT);
>  	nslabs = SLABS_PER_PAGE << order;
>  	bytes = nslabs << IO_TLB_SHIFT;
> @@ -333,33 +342,28 @@ int swiotlb_init_late(size_t size, gfp_t gfp_mask)
>  			(PAGE_SIZE << order) >> 20);
>  		nslabs = SLABS_PER_PAGE << order;
>  	}
> -	rc = swiotlb_late_init_with_tbl(vstart, nslabs);
> -	if (rc)
> -		free_pages((unsigned long)vstart, order);
> -
> -	return rc;
> -}
> -
> -int
> -swiotlb_late_init_with_tbl(char *tlb, unsigned long nslabs)
> -{
> -	struct io_tlb_mem *mem = &io_tlb_default_mem;
> -	unsigned long bytes = nslabs << IO_TLB_SHIFT;
>  
> -	if (swiotlb_force_disable)
> -		return 0;
> +	if (remap)
> +		rc = remap(vstart, nslabs);
> +	if (rc) {
> +		free_pages((unsigned long)vstart, order);
>  
> -	/* protect against double initialization */
> -	if (WARN_ON_ONCE(mem->nslabs))
> -		return -ENOMEM;
> +		/* Min is 2MB */
> +		if (nslabs <= 1024)
> +			return rc;
> +		nslabs = max(1024UL, ALIGN(nslabs >> 1, IO_TLB_SEGSIZE));
> +		goto retry;
> +	}
>  
>  	mem->slots = (void *)__get_free_pages(GFP_KERNEL | __GFP_ZERO,
>  		get_order(array_size(sizeof(*mem->slots), nslabs)));
> -	if (!mem->slots)
> +	if (!mem->slots) {
> +		free_pages((unsigned long)vstart, order);
>  		return -ENOMEM;
> +	}
>  
> -	set_memory_decrypted((unsigned long)tlb, bytes >> PAGE_SHIFT);
> -	swiotlb_init_io_tlb_mem(mem, virt_to_phys(tlb), nslabs, true);
> +	set_memory_decrypted((unsigned long)vstart, bytes >> PAGE_SHIFT);
> +	swiotlb_init_io_tlb_mem(mem, virt_to_phys(vstart), nslabs, true);
>  
>  	swiotlb_print_info();
>  	return 0;
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 
