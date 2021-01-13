Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC5A2F4AAD
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 12:55:38 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG5VY5WjLzDrTM
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 22:55:33 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG5P94n1MzDrSq
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Jan 2021 22:50:38 +1100 (AEDT)
Received: by verein.lst.de (Postfix, from userid 2407)
 id AA26B68AFE; Wed, 13 Jan 2021 12:50:31 +0100 (CET)
Date: Wed, 13 Jan 2021 12:50:31 +0100
From: Christoph Hellwig <hch@lst.de>
To: Claire Chang <tientzu@chromium.org>
Subject: Re: [RFC PATCH v3 1/6] swiotlb: Add io_tlb_mem struct
Message-ID: <20210113115031.GA29376@lst.de>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-2-tientzu@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210106034124.30560-2-tientzu@chromium.org>
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
Cc: heikki.krogerus@linux.intel.com, peterz@infradead.org, grant.likely@arm.com,
 paulus@samba.org, frowand.list@gmail.com, mingo@kernel.org,
 m.szyprowski@samsung.com, sstabellini@kernel.org, saravanak@google.com,
 joro@8bytes.org, rafael.j.wysocki@intel.com, hch@lst.de,
 bgolaszewski@baylibre.com, xen-devel@lists.xenproject.org, treding@nvidia.com,
 devicetree@vger.kernel.org, will@kernel.org, konrad.wilk@oracle.com,
 dan.j.williams@intel.com, linuxppc-dev@lists.ozlabs.org, robh+dt@kernel.org,
 boris.ostrovsky@oracle.com, andriy.shevchenko@linux.intel.com, jgross@suse.com,
 drinkcat@chromium.org, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, xypron.glpk@gmx.de, robin.murphy@arm.com,
 bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Jan 06, 2021 at 11:41:19AM +0800, Claire Chang wrote:
> Added a new struct, io_tlb_mem, as the IO TLB memory pool descriptor and
> moved relevant global variables into that struct.
> This will be useful later to allow for restricted DMA pool.

I like where this is going, but a few comments.

Mostly I'd love to be able to entirely hide io_tlb_default_mem
and struct io_tlb_mem inside of swiotlb.c.

> --- a/arch/powerpc/platforms/pseries/svm.c
> +++ b/arch/powerpc/platforms/pseries/svm.c
> @@ -55,8 +55,8 @@ void __init svm_swiotlb_init(void)
>  	if (vstart && !swiotlb_init_with_tbl(vstart, io_tlb_nslabs, false))
>  		return;
>  
> -	if (io_tlb_start)
> -		memblock_free_early(io_tlb_start,
> +	if (io_tlb_default_mem.start)
> +		memblock_free_early(io_tlb_default_mem.start,
>  				    PAGE_ALIGN(io_tlb_nslabs << IO_TLB_SHIFT));

I think this should switch to use the local vstart variable in
prep patch.

>  	panic("SVM: Cannot allocate SWIOTLB buffer");
>  }
> diff --git a/drivers/xen/swiotlb-xen.c b/drivers/xen/swiotlb-xen.c
> index 2b385c1b4a99..4d17dff7ffd2 100644
> --- a/drivers/xen/swiotlb-xen.c
> +++ b/drivers/xen/swiotlb-xen.c
> @@ -192,8 +192,8 @@ int __ref xen_swiotlb_init(int verbose, bool early)
>  	/*
>  	 * IO TLB memory already allocated. Just use it.
>  	 */
> -	if (io_tlb_start != 0) {
> -		xen_io_tlb_start = phys_to_virt(io_tlb_start);
> +	if (io_tlb_default_mem.start != 0) {
> +		xen_io_tlb_start = phys_to_virt(io_tlb_default_mem.start);
>  		goto end;

xen_io_tlb_start is interesting. It is used only in two functions:

 1) is_xen_swiotlb_buffer, where I think we should be able to just use
    is_swiotlb_buffer instead of open coding it with the extra
    phys_to_virt/virt_to_phys cycle.
 2) xen_swiotlb_init, where except for the assignment it only is used
    locally for the case not touched above and could this be replaced
    with a local variable.

Konrad, does this make sense to you?

>  static inline bool is_swiotlb_buffer(phys_addr_t paddr)
>  {
> -	return paddr >= io_tlb_start && paddr < io_tlb_end;
> +	struct io_tlb_mem *mem = &io_tlb_default_mem;
> +
> +	return paddr >= mem->start && paddr < mem->end;

We'd then have to move this out of line as well.
