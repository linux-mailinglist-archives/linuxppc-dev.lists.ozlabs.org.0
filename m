Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B8802F5202
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 19:29:20 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DGGDs0dJxzDrVN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 05:29:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=robin.murphy@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4DGGC15FSdzDrTH
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 05:27:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 938921FB;
 Wed, 13 Jan 2021 10:27:38 -0800 (PST)
Received: from [10.57.56.43] (unknown [10.57.56.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 992EC3F66E;
 Wed, 13 Jan 2021 10:27:09 -0800 (PST)
Subject: Re: [RFC PATCH v3 4/6] swiotlb: Add restricted DMA alloc/free support.
To: Christoph Hellwig <hch@lst.de>, Claire Chang <tientzu@chromium.org>
References: <20210106034124.30560-1-tientzu@chromium.org>
 <20210106034124.30560-5-tientzu@chromium.org> <20210113124847.GC1383@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <82bb75bc-11e6-ac94-9d24-7c896e3aae98@arm.com>
Date: Wed, 13 Jan 2021 18:27:08 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113124847.GC1383@lst.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
 joro@8bytes.org, rafael.j.wysocki@intel.com, bgolaszewski@baylibre.com,
 xen-devel@lists.xenproject.org, treding@nvidia.com, devicetree@vger.kernel.org,
 will@kernel.org, konrad.wilk@oracle.com, dan.j.williams@intel.com,
 robh+dt@kernel.org, boris.ostrovsky@oracle.com,
 andriy.shevchenko@linux.intel.com, jgross@suse.com, drinkcat@chromium.org,
 gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, tfiga@chromium.org,
 iommu@lists.linux-foundation.org, xypron.glpk@gmx.de,
 linuxppc-dev@lists.ozlabs.org, bauerman@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2021-01-13 12:48, Christoph Hellwig wrote:
>> +#ifdef CONFIG_SWIOTLB
>> +	if (unlikely(dev->dma_io_tlb_mem))
>> +		return swiotlb_alloc(dev, size, dma_handle, attrs);
>> +#endif
> 
> Another place where the dma_io_tlb_mem is useful to avoid the ifdef.
> 
>> -phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t orig_addr,
>> -		size_t mapping_size, size_t alloc_size,
>> -		enum dma_data_direction dir, unsigned long attrs)
>> +static int swiotlb_tbl_find_free_region(struct device *hwdev,
>> +					dma_addr_t tbl_dma_addr,
>> +					size_t alloc_size,
>> +					unsigned long attrs)
> 
>> +static void swiotlb_tbl_release_region(struct device *hwdev, int index,
>> +				       size_t size)
> 
> This refactoring should be another prep patch.
> 
> 
>> +void *swiotlb_alloc(struct device *dev, size_t size, dma_addr_t *dma_handle,
>> +		    unsigned long attrs)
> 
> I'd rather have the names convey there are for the per-device bounce
> buffer in some form.
> 
>> +	struct io_tlb_mem *mem = dev->dma_io_tlb_mem;
> 
> While we're at it I wonder if the io_tlb is something we could change
> while we're at it.  Maybe replace io_tlb_mem with struct swiotlb
> and rename the field in struct device to dev_swiotlb?
> 
>> +	int index;
>> +	void *vaddr;
>> +	phys_addr_t tlb_addr;
>> +
>> +	size = PAGE_ALIGN(size);
>> +	index = swiotlb_tbl_find_free_region(dev, mem->start, size, attrs);
>> +	if (index < 0)
>> +		return NULL;
>> +
>> +	tlb_addr = mem->start + (index << IO_TLB_SHIFT);
>> +	*dma_handle = phys_to_dma_unencrypted(dev, tlb_addr);
>> +
>> +	if (!dev_is_dma_coherent(dev)) {
>> +		unsigned long pfn = PFN_DOWN(tlb_addr);
>> +
>> +		/* remove any dirty cache lines on the kernel alias */
>> +		arch_dma_prep_coherent(pfn_to_page(pfn), size);
> 
> Can we hook in somewhat lower level in the dma-direct code so that all
> the remapping in dma-direct can be reused instead of duplicated?  That
> also becomes important if we want to use non-remapping uncached support,
> e.g. on mips or x86, or the direct changing of the attributes that Will
> planned to look into for arm64.

Indeed, AFAICS this ought to boil down to a direct equivalent of 
__dma_direct_alloc_pages() - other than the address there should be no 
conceptual difference between pages from the restricted pool and those 
from the regular page allocator, so this probably deserves to be plumbed 
in as an alternative to that.

Robin.
