Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 705DB919EE3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 07:45:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W8nbY2T9Dz3dSk
	for <lists+linuxppc-dev@lfdr.de>; Thu, 27 Jun 2024 15:45:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=lst.de (client-ip=213.95.11.211; helo=verein.lst.de; envelope-from=hch@lst.de; receiver=lists.ozlabs.org)
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W8nb769jGz3cWS
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 27 Jun 2024 15:45:02 +1000 (AEST)
Received: by verein.lst.de (Postfix, from userid 2407)
	id 70CDD68AFE; Thu, 27 Jun 2024 07:44:55 +0200 (CEST)
Date: Thu, 27 Jun 2024 07:44:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alistair Popple <apopple@nvidia.com>
Subject: Re: [PATCH 10/13] fs/dax: Properly refcount fs dax pages
Message-ID: <20240627054455.GF14837@lst.de>
References: <cover.66009f59a7fe77320d413011386c3ae5c2ee82eb.1719386613.git-series.apopple@nvidia.com> <afcfa4f164e5642c4f629c75acf794838c2ac9aa.1719386613.git-series.apopple@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afcfa4f164e5642c4f629c75acf794838c2ac9aa.1719386613.git-series.apopple@nvidia.com>
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
Cc: linmiaohe@huawei.com, nvdimm@lists.linux.dev, jack@suse.cz, david@redhat.com, djwong@kernel.org, dave.hansen@linux.intel.com, david@fromorbit.com, peterx@redhat.com, linux-mm@kvack.org, will@kernel.org, hch@lst.de, dave.jiang@intel.com, vishal.l.verma@intel.com, linux-doc@vger.kernel.org, willy@infradead.org, jgg@ziepe.ca, catalin.marinas@arm.com, linux-ext4@vger.kernel.org, ira.weiny@intel.com, jhubbard@nvidia.com, npiggin@gmail.com, linux-cxl@vger.kernel.org, bhelgaas@google.com, dan.j.williams@intel.com, linux-arm-kernel@lists.infradead.org, tytso@mit.edu, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org, logang@deltatee.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

> diff --git a/drivers/dax/device.c b/drivers/dax/device.c
> index eb61598..b7a31ae 100644
> --- a/drivers/dax/device.c
> +++ b/drivers/dax/device.c
> @@ -126,11 +126,11 @@ static vm_fault_t __dev_dax_pte_fault(struct dev_dax *dev_dax,
>  		return VM_FAULT_SIGBUS;
>  	}
>  
> -	pfn = phys_to_pfn_t(phys, PFN_DEV|PFN_MAP);
> +	pfn = phys_to_pfn_t(phys, 0);
>  
>  	dax_set_mapping(vmf, pfn, fault_size);
>  
> -	return vmf_insert_mixed(vmf->vma, vmf->address, pfn);
> +	return dax_insert_pfn(vmf->vma, vmf->address, pfn, vmf->flags & FAULT_FLAG_WRITE);

Plenty overly long lines here and later.

Q: hould dax_insert_pfn take a vm_fault structure instead of the vma?
Or are the potential use cases that aren't from the fault path?
similar instead of the bool write passing the fault flags might actually
make things more readable than the bool.

Also at least currently it seems like there are no modular users despite
the export, or am I missing something?

> +		blk_queue_flag_set(QUEUE_FLAG_DAX, q);

Just as a heads up, setting of these flags has changed a lot in
linux-next.

>  {
> +	/*
> +	 * Make sure we flush any cached data to the page now that it's free.
> +	 */
> +	if (PageDirty(page))
> +		dax_flush(NULL, page_address(page), page_size(page));
> +

Adding the magic dax_dev == NULL case to dax_flush and going through it
vs just calling arch_wb_cache_pmem directly here seems odd.

But I also don't quite understand how it is related to the rest
of the patch anyway.

> --- a/mm/mlock.c
> +++ b/mm/mlock.c
> @@ -373,6 +373,8 @@ static int mlock_pte_range(pmd_t *pmd, unsigned long addr,
>  	unsigned long start = addr;
>  
>  	ptl = pmd_trans_huge_lock(pmd, vma);
> +	if (vma_is_dax(vma))
> +		ptl = NULL;
>  	if (ptl) {

This feels sufficiently magic to warrant a comment.

>  		if (!pmd_present(*pmd))
>  			goto out;
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index b7e1599..f11ee0d 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1016,7 +1016,8 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  	 */
>  	if (pgmap->type == MEMORY_DEVICE_PRIVATE ||
>  	    pgmap->type == MEMORY_DEVICE_COHERENT ||
> -	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA)
> +	    pgmap->type == MEMORY_DEVICE_PCI_P2PDMA ||
> +	    pgmap->type == MEMORY_DEVICE_FS_DAX)
>  		set_page_count(page, 0);
>  }

So we'll skip this for MEMORY_DEVICE_GENERIC only.  Does anyone remember
if that's actively harmful or just not needed?  If the latter it might
be simpler to just set the page count unconditionally here.

