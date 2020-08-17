Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE69246460
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 12:22:35 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BVVTz4hxZzDqQx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 Aug 2020 20:22:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=lst.de
 (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=lst.de
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BVVRc2SqYzDqMr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 Aug 2020 20:20:27 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 46FC568B05; Mon, 17 Aug 2020 12:20:21 +0200 (CEST)
Date: Mon, 17 Aug 2020 12:20:20 +0200
From: Christoph Hellwig <hch@lst.de>
To: Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: Re: [PATCH] swiotlb: Allow allocating buffer anywhere in memory
Message-ID: <20200817102020.GD25336@lst.de>
References: <20200815204536.663801-1-bauerman@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200815204536.663801-1-bauerman@linux.ibm.com>
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
Cc: Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 Robin Murphy <robin.murphy@arm.com>, Ram Pai <linuxram@us.ibm.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Mike Rapoport <rppt@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Aug 15, 2020 at 05:45:36PM -0300, Thiago Jung Bauermann wrote:
> POWER secure guests (i.e., guests which use the Protection Execution
> Facility) need to use SWIOTLB to be able to do I/O with the hypervisor, but
> they don't need the SWIOTLB memory to be in low addresses since the
> hypervisor doesn't have any addressing limitation.
> 
> This solves a SWIOTLB initialization problem we are seeing in secure guests
> with 128 GB of RAM: they are configured with 4 GB of crashkernel reserved
> memory, which leaves no space for SWIOTLB in low addresses.

What about just open coding the allocation and using
swiotlb_init_with_tbl?

> 
> Signed-off-by: Thiago Jung Bauermann <bauerman@linux.ibm.com>
> ---
>  arch/powerpc/mm/mem.c   |  7 ++++++-
>  include/linux/swiotlb.h |  8 +++++++-
>  kernel/dma/swiotlb.c    | 10 +++++++---
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> Normally I would split changes like this into one patch touching generic
> code and another for the arch-specific part, but in this case I thought it
> would be unneeded complexity. I can split though if people prefer it that
> way.
> 
> diff --git a/arch/powerpc/mm/mem.c b/arch/powerpc/mm/mem.c
> index c2c11eb8dcfc..13f2e3aff8b5 100644
> --- a/arch/powerpc/mm/mem.c
> +++ b/arch/powerpc/mm/mem.c
> @@ -50,6 +50,7 @@
>  #include <asm/swiotlb.h>
>  #include <asm/rtas.h>
>  #include <asm/kasan.h>
> +#include <asm/svm.h>
>  
>  #include <mm/mmu_decl.h>
>  
> @@ -290,7 +291,11 @@ void __init mem_init(void)
>  	 * back to to-down.
>  	 */
>  	memblock_set_bottom_up(true);
> -	swiotlb_init(0);
> +	/*
> +	 * SVM guests can use the SWIOTLB wherever it is in memory,
> +	 * even if not DMA-able.
> +	 */
> +	swiotlb_init_anywhere(0, is_secure_guest());
>  #endif
>  
>  	high_memory = (void *) __va(max_low_pfn * PAGE_SIZE);
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 046bb94bd4d6..433f3dbb35b5 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -29,7 +29,13 @@ enum swiotlb_force {
>   */
>  #define IO_TLB_SHIFT 11
>  
> -extern void swiotlb_init(int verbose);
> +void __init swiotlb_init_anywhere(int verbose, bool allocate_anywhere);
> +
> +static inline void swiotlb_init(int verbose)
> +{
> +	swiotlb_init_anywhere(verbose, false);
> +}
> +
>  int swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose);
>  extern unsigned long swiotlb_nr_tbl(void);
>  unsigned long swiotlb_size_or_default(void);
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index c19379fabd20..27070aa59e34 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -244,7 +244,7 @@ int __init swiotlb_init_with_tbl(char *tlb, unsigned long nslabs, int verbose)
>   * structures for the software IO TLB used to implement the DMA API.
>   */
>  void  __init
> -swiotlb_init(int verbose)
> +swiotlb_init_anywhere(int verbose, bool allocate_anywhere)
>  {
>  	size_t default_size = IO_TLB_DEFAULT_SIZE;
>  	unsigned char *vstart;
> @@ -257,8 +257,12 @@ swiotlb_init(int verbose)
>  
>  	bytes = io_tlb_nslabs << IO_TLB_SHIFT;
>  
> -	/* Get IO TLB memory from the low pages */
> -	vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	if (allocate_anywhere)
> +		vstart = memblock_alloc(PAGE_ALIGN(bytes), PAGE_SIZE);
> +	else
> +		/* Get IO TLB memory from the low pages */
> +		vstart = memblock_alloc_low(PAGE_ALIGN(bytes), PAGE_SIZE);
> +
>  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, verbose))
>  		return;
>  
---end quoted text---
