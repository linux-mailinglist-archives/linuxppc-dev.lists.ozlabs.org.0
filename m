Return-Path: <linuxppc-dev+bounces-11803-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49096B45E1B
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 18:27:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJMFC6F2Jz3dK8;
	Sat,  6 Sep 2025 02:27:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757089631;
	cv=none; b=OhCsuyRPy7qE2hJsADkzjLjMHCTLYG38tcu04aqNM2kN1av3mKZPPKhlYVfWOp57J7i39ItKI+W6BAYURHPF88wYPiYfk2lAdY+CETnfLNe7eJYndUjFdoeHlO5A2IGcwKAju5Hm8hEzAi+5FWIfrbfypFaW7wJzdmemzx6m9h02eFZEGk0l5YiL8fbHRyVOMaoOpdk6Ry+HuBu4R/tlKl/QM6CR/pYm0Amqq0XXQsHGtjALnLoQbyHDRvVqZ7vzY2eo+W4HhsaK5hwRwMxiDtUaxrOqgGNz/SjGOUuGioFNQvDjlZkrvIIOHF3/x0eK3wXNBacT7vzSc9CGv0l+wg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757089631; c=relaxed/relaxed;
	bh=JratdkJhfp1iQGSSFRxxu72lgWMqyE2NX54DSFPZHRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=KnIsUCUz7Ivo1t7xuImFZ/PEdWg6FQBaSNAPLK/RMEGSyDxR8KAURi/cMO4qcFWzE1TzGL25grk/T8zXLRe5F/Zz8eNU09hJsJQKR5eFhFVODOQBn9ZVR9s/1xcrstPUJCOJX8LLyggAHx2OS2keZcrUT7FPwZtLqm1OSYrD8OLiGNfQHtnY/9hon+uOb6AbfXI8i5gfl4IWKmtPROuzRkmxGgS8aZjdYKXjY38AxdXaedfpRXpMBam9FKl4QRuePsH6KpByk1tX3DPlWsATueehMDlcSXX//g3fPMrnHgwCfNtgdikjNYBGphvGjy8wfwFAoN9ge6n+u2M03utgmg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com; dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k7Zmm/l4; dkim-atps=neutral; spf=pass (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org) smtp.mailfrom=samsung.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=k7Zmm/l4;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=samsung.com (client-ip=210.118.77.12; helo=mailout2.w1.samsung.com; envelope-from=m.szyprowski@samsung.com; receiver=lists.ozlabs.org)
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4cJMF95CxCz3dK4
	for <linuxppc-dev@lists.ozlabs.org>; Sat,  6 Sep 2025 02:27:08 +1000 (AEST)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250905162659euoutp0209439914e512e98f87c7003f3b7cb2ad~ib7L2Tvq02121121211euoutp02j;
	Fri,  5 Sep 2025 16:26:59 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250905162659euoutp0209439914e512e98f87c7003f3b7cb2ad~ib7L2Tvq02121121211euoutp02j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757089619;
	bh=JratdkJhfp1iQGSSFRxxu72lgWMqyE2NX54DSFPZHRY=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=k7Zmm/l4ml+LB1qItvZOEqZY+Sox4+FPDDVEoRVLzx1Wvrm8UN4/WmasRnz/XdrC4
	 Uz3NPTnr8v6KtMSyeOqg/plUlqcNjUQLJ68wa1aVQkIC0f+6gNInm3vAulUU4bbtBs
	 bFH/HZYMbbkZGGDU62q/7lnZ1i5322h/6rAkdcfU=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250905162658eucas1p1a568426150516afc440f0b45dae6597c~ib7LZwBNr2591525915eucas1p15;
	Fri,  5 Sep 2025 16:26:58 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250905162656eusmtip2af2311515d499a88f1b631068b965d1d~ib7JPIWTy2564625646eusmtip2E;
	Fri,  5 Sep 2025 16:26:56 +0000 (GMT)
Message-ID: <afcd9cd4-d563-41c3-9e50-7440365b9152@samsung.com>
Date: Fri, 5 Sep 2025 18:26:55 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 03/16] dma-debug: refactor to use physical addresses
 for page mapping
To: Leon Romanovsky <leon@kernel.org>
Cc: Leon Romanovsky <leonro@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Alexander Potapenko
	<glider@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, Andrew Morton
	<akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>, Danilo
	Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, Jason Wang
	<jasowang@redhat.com>, Jens Axboe <axboe@kernel.dk>, Joerg Roedel
	<joro@8bytes.org>, Jonathan Corbet <corbet@lwn.net>, Juergen Gross
	<jgross@suse.com>, kasan-dev@googlegroups.com, Keith Busch
	<kbusch@kernel.org>, linux-block@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-nvme@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
	linux-trace-kernel@vger.kernel.org, Madhavan Srinivasan
	<maddy@linux.ibm.com>, Masami Hiramatsu <mhiramat@kernel.org>, Michael
	Ellerman <mpe@ellerman.id.au>, "Michael S. Tsirkin" <mst@redhat.com>, Miguel
	Ojeda <ojeda@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	rust-for-linux@vger.kernel.org, Sagi Grimberg <sagi@grimberg.me>, Stefano
	Stabellini <sstabellini@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	virtualization@lists.linux.dev, Will Deacon <will@kernel.org>,
	xen-devel@lists.xenproject.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <478d5b7135008b3c82f100faa9d3830839fc6562.1755624249.git.leon@kernel.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20250905162658eucas1p1a568426150516afc440f0b45dae6597c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250819173739eucas1p104ee9e80546f92ef250115edd799fc6d
X-EPHeader: CA
X-CMS-RootMailID: 20250819173739eucas1p104ee9e80546f92ef250115edd799fc6d
References: <cover.1755624249.git.leon@kernel.org>
	<CGME20250819173739eucas1p104ee9e80546f92ef250115edd799fc6d@eucas1p1.samsung.com>
	<478d5b7135008b3c82f100faa9d3830839fc6562.1755624249.git.leon@kernel.org>
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 19.08.2025 19:36, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
>
> Convert the DMA debug infrastructure from page-based to physical address-based
> mapping as a preparation to rely on physical address for DMA mapping routines.
>
> The refactoring renames debug_dma_map_page() to debug_dma_map_phys() and
> changes its signature to accept a phys_addr_t parameter instead of struct page
> and offset. Similarly, debug_dma_unmap_page() becomes debug_dma_unmap_phys().
> A new dma_debug_phy type is introduced to distinguish physical address mappings
> from other debug entry types. All callers throughout the codebase are updated
> to pass physical addresses directly, eliminating the need for page-to-physical
> conversion in the debug layer.
>
> This refactoring eliminates the need to convert between page pointers and
> physical addresses in the debug layer, making the code more efficient and
> consistent with the DMA mapping API's physical address focus.
>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

This change needs to be based on top of this patch 
https://lore.kernel.org/all/20250828-dma-debug-fix-noncoherent-dma-check-v1-1-76e9be0dd7fc@oss.qualcomm.com 
so the easiest way would be to rebase this patchset onto 
https://web.git.kernel.org/pub/scm/linux/kernel/git/mszyprowski/linux.git/log/?h=dma-mapping-fixes 
branch (resolving conflicts is trivial) for the next version.

> ---
>   Documentation/core-api/dma-api.rst |  4 ++--
>   kernel/dma/debug.c                 | 28 +++++++++++++++++-----------
>   kernel/dma/debug.h                 | 16 +++++++---------
>   kernel/dma/mapping.c               | 15 ++++++++-------
>   4 files changed, 34 insertions(+), 29 deletions(-)
>
> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 3087bea715ed..ca75b3541679 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -761,7 +761,7 @@ example warning message may look like this::
>   	[<ffffffff80235177>] find_busiest_group+0x207/0x8a0
>   	[<ffffffff8064784f>] _spin_lock_irqsave+0x1f/0x50
>   	[<ffffffff803c7ea3>] check_unmap+0x203/0x490
> -	[<ffffffff803c8259>] debug_dma_unmap_page+0x49/0x50
> +	[<ffffffff803c8259>] debug_dma_unmap_phys+0x49/0x50
>   	[<ffffffff80485f26>] nv_tx_done_optimized+0xc6/0x2c0
>   	[<ffffffff80486c13>] nv_nic_irq_optimized+0x73/0x2b0
>   	[<ffffffff8026df84>] handle_IRQ_event+0x34/0x70
> @@ -855,7 +855,7 @@ that a driver may be leaking mappings.
>   dma-debug interface debug_dma_mapping_error() to debug drivers that fail
>   to check DMA mapping errors on addresses returned by dma_map_single() and
>   dma_map_page() interfaces. This interface clears a flag set by
> -debug_dma_map_page() to indicate that dma_mapping_error() has been called by
> +debug_dma_map_phys() to indicate that dma_mapping_error() has been called by
>   the driver. When driver does unmap, debug_dma_unmap() checks the flag and if
>   this flag is still set, prints warning message that includes call trace that
>   leads up to the unmap. This interface can be called from dma_mapping_error()
> diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
> index e43c6de2bce4..da6734e3a4ce 100644
> --- a/kernel/dma/debug.c
> +++ b/kernel/dma/debug.c
> @@ -39,6 +39,7 @@ enum {
>   	dma_debug_sg,
>   	dma_debug_coherent,
>   	dma_debug_resource,
> +	dma_debug_phy,
>   };
>   
>   enum map_err_types {
> @@ -141,6 +142,7 @@ static const char *type2name[] = {
>   	[dma_debug_sg] = "scatter-gather",
>   	[dma_debug_coherent] = "coherent",
>   	[dma_debug_resource] = "resource",
> +	[dma_debug_phy] = "phy",
>   };
>   
>   static const char *dir2name[] = {
> @@ -1201,9 +1203,8 @@ void debug_dma_map_single(struct device *dev, const void *addr,
>   }
>   EXPORT_SYMBOL(debug_dma_map_single);
>   
> -void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
> -			size_t size, int direction, dma_addr_t dma_addr,
> -			unsigned long attrs)
> +void debug_dma_map_phys(struct device *dev, phys_addr_t phys, size_t size,
> +		int direction, dma_addr_t dma_addr, unsigned long attrs)
>   {
>   	struct dma_debug_entry *entry;
>   
> @@ -1218,19 +1219,24 @@ void debug_dma_map_page(struct device *dev, struct page *page, size_t offset,
>   		return;
>   
>   	entry->dev       = dev;
> -	entry->type      = dma_debug_single;
> -	entry->paddr	 = page_to_phys(page) + offset;
> +	entry->type      = dma_debug_phy;
> +	entry->paddr	 = phys;
>   	entry->dev_addr  = dma_addr;
>   	entry->size      = size;
>   	entry->direction = direction;
>   	entry->map_err_type = MAP_ERR_NOT_CHECKED;
>   
> -	check_for_stack(dev, page, offset);
> +	if (!(attrs & DMA_ATTR_MMIO)) {
> +		struct page *page = phys_to_page(phys);
> +		size_t offset = offset_in_page(page);
>   
> -	if (!PageHighMem(page)) {
> -		void *addr = page_address(page) + offset;
> +		check_for_stack(dev, page, offset);
>   
> -		check_for_illegal_area(dev, addr, size);
> +		if (!PageHighMem(page)) {
> +			void *addr = page_address(page) + offset;
> +
> +			check_for_illegal_area(dev, addr, size);
> +		}
>   	}
>   
>   	add_dma_entry(entry, attrs);
> @@ -1274,11 +1280,11 @@ void debug_dma_mapping_error(struct device *dev, dma_addr_t dma_addr)
>   }
>   EXPORT_SYMBOL(debug_dma_mapping_error);
>   
> -void debug_dma_unmap_page(struct device *dev, dma_addr_t dma_addr,
> +void debug_dma_unmap_phys(struct device *dev, dma_addr_t dma_addr,
>   			  size_t size, int direction)
>   {
>   	struct dma_debug_entry ref = {
> -		.type           = dma_debug_single,
> +		.type           = dma_debug_phy,
>   		.dev            = dev,
>   		.dev_addr       = dma_addr,
>   		.size           = size,
> diff --git a/kernel/dma/debug.h b/kernel/dma/debug.h
> index f525197d3cae..76adb42bffd5 100644
> --- a/kernel/dma/debug.h
> +++ b/kernel/dma/debug.h
> @@ -9,12 +9,11 @@
>   #define _KERNEL_DMA_DEBUG_H
>   
>   #ifdef CONFIG_DMA_API_DEBUG
> -extern void debug_dma_map_page(struct device *dev, struct page *page,
> -			       size_t offset, size_t size,
> -			       int direction, dma_addr_t dma_addr,
> +extern void debug_dma_map_phys(struct device *dev, phys_addr_t phys,
> +			       size_t size, int direction, dma_addr_t dma_addr,
>   			       unsigned long attrs);
>   
> -extern void debug_dma_unmap_page(struct device *dev, dma_addr_t addr,
> +extern void debug_dma_unmap_phys(struct device *dev, dma_addr_t addr,
>   				 size_t size, int direction);
>   
>   extern void debug_dma_map_sg(struct device *dev, struct scatterlist *sg,
> @@ -55,14 +54,13 @@ extern void debug_dma_sync_sg_for_device(struct device *dev,
>   					 struct scatterlist *sg,
>   					 int nelems, int direction);
>   #else /* CONFIG_DMA_API_DEBUG */
> -static inline void debug_dma_map_page(struct device *dev, struct page *page,
> -				      size_t offset, size_t size,
> -				      int direction, dma_addr_t dma_addr,
> -				      unsigned long attrs)
> +static inline void debug_dma_map_phys(struct device *dev, phys_addr_t phys,
> +				      size_t size, int direction,
> +				      dma_addr_t dma_addr, unsigned long attrs)
>   {
>   }
>   
> -static inline void debug_dma_unmap_page(struct device *dev, dma_addr_t addr,
> +static inline void debug_dma_unmap_phys(struct device *dev, dma_addr_t addr,
>   					size_t size, int direction)
>   {
>   }
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index 107e4a4d251d..4c1dfbabb8ae 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -157,6 +157,7 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>   		unsigned long attrs)
>   {
>   	const struct dma_map_ops *ops = get_dma_ops(dev);
> +	phys_addr_t phys = page_to_phys(page) + offset;
>   	dma_addr_t addr;
>   
>   	BUG_ON(!valid_dma_direction(dir));
> @@ -165,16 +166,15 @@ dma_addr_t dma_map_page_attrs(struct device *dev, struct page *page,
>   		return DMA_MAPPING_ERROR;
>   
>   	if (dma_map_direct(dev, ops) ||
> -	    arch_dma_map_page_direct(dev, page_to_phys(page) + offset + size))
> +	    arch_dma_map_page_direct(dev, phys + size))
>   		addr = dma_direct_map_page(dev, page, offset, size, dir, attrs);
>   	else if (use_dma_iommu(dev))
>   		addr = iommu_dma_map_page(dev, page, offset, size, dir, attrs);
>   	else
>   		addr = ops->map_page(dev, page, offset, size, dir, attrs);
>   	kmsan_handle_dma(page, offset, size, dir);
> -	trace_dma_map_page(dev, page_to_phys(page) + offset, addr, size, dir,
> -			   attrs);
> -	debug_dma_map_page(dev, page, offset, size, dir, addr, attrs);
> +	trace_dma_map_page(dev, phys, addr, size, dir, attrs);
> +	debug_dma_map_phys(dev, phys, size, dir, addr, attrs);
>   
>   	return addr;
>   }
> @@ -194,7 +194,7 @@ void dma_unmap_page_attrs(struct device *dev, dma_addr_t addr, size_t size,
>   	else
>   		ops->unmap_page(dev, addr, size, dir, attrs);
>   	trace_dma_unmap_page(dev, addr, size, dir, attrs);
> -	debug_dma_unmap_page(dev, addr, size, dir);
> +	debug_dma_unmap_phys(dev, addr, size, dir);
>   }
>   EXPORT_SYMBOL(dma_unmap_page_attrs);
>   
> @@ -712,7 +712,8 @@ struct page *dma_alloc_pages(struct device *dev, size_t size,
>   	if (page) {
>   		trace_dma_alloc_pages(dev, page_to_virt(page), *dma_handle,
>   				      size, dir, gfp, 0);
> -		debug_dma_map_page(dev, page, 0, size, dir, *dma_handle, 0);
> +		debug_dma_map_phys(dev, page_to_phys(page), size, dir,
> +				   *dma_handle, 0);
>   	} else {
>   		trace_dma_alloc_pages(dev, NULL, 0, size, dir, gfp, 0);
>   	}
> @@ -738,7 +739,7 @@ void dma_free_pages(struct device *dev, size_t size, struct page *page,
>   		dma_addr_t dma_handle, enum dma_data_direction dir)
>   {
>   	trace_dma_free_pages(dev, page_to_virt(page), dma_handle, size, dir, 0);
> -	debug_dma_unmap_page(dev, dma_handle, size, dir);
> +	debug_dma_unmap_phys(dev, dma_handle, size, dir);
>   	__dma_free_pages(dev, size, page, dma_handle, dir);
>   }
>   EXPORT_SYMBOL_GPL(dma_free_pages);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


