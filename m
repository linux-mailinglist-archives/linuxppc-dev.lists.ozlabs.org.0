Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E056E9839
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Apr 2023 17:22:41 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Q2Lxq5nP7z3fV2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Apr 2023 01:22:39 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UcgeEMtO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Q2Lx05DX6z3c8F
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Apr 2023 01:21:56 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=UcgeEMtO;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Q2Lwy3Tw9z4wgq;
	Fri, 21 Apr 2023 01:21:54 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1682004114;
	bh=h3SxPhUzmHsWbs5PrOyBL05+AzAxJen9yDDWwFWGrJg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=UcgeEMtOu5gCE3xnZ8yL7EhvVi56TJH/mXtgir2ZUYL6hwHySD+gGrMdxEqdiOR9Y
	 uCk2Fot9lnib5bX3lv6c+GhgxRHAnaKPtWjkSmEfrNxE/a8gnbn+B+FyQXcBWzFS/D
	 DTjPiKSEeqjyPPSKSFkTIU8g2rQREwxbOvOEjceH1bRy6J8mC/QHom1Ul0kCmK8qZ0
	 j6bnr1Lx1uMNRUUEmDuGKI0VT296rCc1rKZ2m3Ym8HbLoH/5gkr7xr+tEBEvxMRN/B
	 /wVsqVUt8NEU7X2/fA8fBTa7kJKlX+BGUW81m5zS590QjzJgpVxB8eDM900ZWUZe/a
	 ZyuYe11FsZ5Bg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Gaurav Batra <gbatra@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] powerpc/iommu: DMA address offset is incorrectly
 calculated with 2MB TCEs
In-Reply-To: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
References: <20230419152623.26439-1-gbatra@linux.vnet.ibm.com>
Date: Fri, 21 Apr 2023 01:21:51 +1000
Message-ID: <87leimfuk0.fsf@mail.concordia>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Brian King <brking@linux.vnet.ibm.com>, linuxppc-dev@lists.ozlabs.org, Greg Joyce <gjoyce@linux.vnet.ibm.com>, Gaurav Batra <gbatra@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Gaurav Batra <gbatra@linux.vnet.ibm.com> writes:
> When DMA window is backed by 2MB TCEs, the DMA address for the mapped
> page should be the offset of the page relative to the 2MB TCE. The code
> was incorrectly setting the DMA address to the beginning of the TCE
> range.
>
> Mellanox driver is reporting timeout trying to ENABLE_HCA for an SR-IOV
> ethernet port, when DMA window is backed by 2MB TCEs.

I assume this is similar or related to the bug Srikar reported?

  https://lore.kernel.org/linuxppc-dev/20230323095333.GI1005120@linux.vnet.ibm.com/

In that thread Alexey suggested a patch, have you tried his patch? He
suggested rounding up the allocation size, rather than adjusting the
dma_handle.

> Fixes: 3872731187141d5d0a5c4fb30007b8b9ec36a44d

That's not the right syntax, it's described in the documentation how to
generate it.

It should be:

  Fixes: 387273118714 ("powerps/pseries/dma: Add support for 2M IOMMU page size")

cheers

> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index ee95937bdaf1..ca57526ce47a 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -517,7 +517,7 @@ int ppc_iommu_map_sg(struct device *dev, struct iommu_table *tbl,
>  		/* Convert entry to a dma_addr_t */
>  		entry += tbl->it_offset;
>  		dma_addr = entry << tbl->it_page_shift;
> -		dma_addr |= (s->offset & ~IOMMU_PAGE_MASK(tbl));
> +		dma_addr |= (vaddr & ~IOMMU_PAGE_MASK(tbl));
>  
>  		DBG("  - %lu pages, entry: %lx, dma_addr: %lx\n",
>  			    npages, entry, dma_addr);
> @@ -904,6 +904,7 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>  	unsigned int order;
>  	unsigned int nio_pages, io_order;
>  	struct page *page;
> +	int tcesize = (1 << tbl->it_page_shift);
>  
>  	size = PAGE_ALIGN(size);
>  	order = get_order(size);
> @@ -930,7 +931,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>  	memset(ret, 0, size);
>  
>  	/* Set up tces to cover the allocated range */
> -	nio_pages = size >> tbl->it_page_shift;
> +	nio_pages = IOMMU_PAGE_ALIGN(size, tbl) >> tbl->it_page_shift;
> +
>  	io_order = get_iommu_order(size, tbl);
>  	mapping = iommu_alloc(dev, tbl, ret, nio_pages, DMA_BIDIRECTIONAL,
>  			      mask >> tbl->it_page_shift, io_order, 0);
> @@ -938,7 +940,8 @@ void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>  		free_pages((unsigned long)ret, order);
>  		return NULL;
>  	}
> -	*dma_handle = mapping;
> +
> +	*dma_handle = mapping | ((u64)ret & (tcesize - 1));
>  	return ret;
>  }
>  
> -- 
