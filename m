Return-Path: <linuxppc-dev+bounces-14178-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92A40C5C377
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Nov 2025 10:20:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7BSj2mRDz301X;
	Fri, 14 Nov 2025 20:20:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1763112037;
	cv=none; b=F91Wbcz84aYDyPDOkWXWG1njY6F3ufXCM/qPvH6UpvNQmxDWZc5luT5AEs5QveT/LRXuZGmz/8aFtHff0lZwkj3G3AoFoIzubZrb+IkElKle1MkfKZIwKPGay2b5u5qWPUn/v3o1IhCBmQS8AsPBXpLpn8VXQGlXDMNevBNMdvC7oLFt5nqYV4IaTGnPLnoYrmBISZm+eXn8K+l39EZvUajLAl16T1ILKGmx1vukZLLSYb1rBdOCHiMwy3qSTjlFIWMRqDOJ8Iv7i9lBwDxcmY3yq6O/O85F6N1X5c19oX/zYIcWVq58SUjtuaa3ySoXnNIQ1qV6USi23+pkAfJSUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1763112037; c=relaxed/relaxed;
	bh=gvVwQtNmEG4qHvjk2UdZPy13MIVA2z73/Z45yxgoHa0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QNa4l49HnHYB3nLBjj8x/1YnF8vqDJOWX6ywXq41YYbzd+hFCkGRWKzLm8Z3dbu31F3IxU0whVcDthFoQSRuyq3qgJee1MwDbEyzbsbXgUtsaFh7sah9cnFko++6mo6zK2/vB2UX21GHiuVp31kGaXt36UQxWyuDlLx13AOtbLeaT3D59w6ZGgK2vdrkcfi6izxuHYLQGEAe3a4NeOfjEPxSFAXheTVW+9n4s379wZiB+9kOF0Y80xnWeP3Jh57tuU3yOnbjoQPyp+bt/uln0mPAJQ4pnSv/cc2b9hu5UCm/UItrc8KBMEFQD7G59Vh/sFXE3R9K/E9uTgZdZ3VHPQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4d7BSh2Cmyz2yx8
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Nov 2025 20:20:35 +1100 (AEDT)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7B3S6g5lz9sSm;
	Fri, 14 Nov 2025 10:02:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jh3Mqk4UdkM3; Fri, 14 Nov 2025 10:02:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7B3P5h7Hz9sSt;
	Fri, 14 Nov 2025 10:02:09 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 940058B770;
	Fri, 14 Nov 2025 10:02:09 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id WOt_dcMEhEst; Fri, 14 Nov 2025 10:02:09 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DCFEA8B76E;
	Fri, 14 Nov 2025 10:02:07 +0100 (CET)
Message-ID: <83cdd7e8-51a7-4989-b270-93cec301cde7@csgroup.eu>
Date: Fri, 14 Nov 2025 10:02:07 +0100
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
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 10/14] powerpc: Convert to physical address DMA mapping
To: Leon Romanovsky <leon@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, Russell King <linux@armlinux.org.uk>,
 Juergen Gross <jgross@suse.com>, Stefano Stabellini
 <sstabellini@kernel.org>,
 Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Matt Turner <mattst88@gmail.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Geoff Levand <geoff@infradead.org>, "David S. Miller" <davem@davemloft.net>,
 Andreas Larsson <andreas@gaisler.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, xen-devel@lists.xenproject.org,
 linux-alpha@vger.kernel.org, linux-mips@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 sparclinux@vger.kernel.org
References: <20251015-remove-map-page-v5-0-3bbfe3a25cdf@kernel.org>
 <20251015-remove-map-page-v5-10-3bbfe3a25cdf@kernel.org>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251015-remove-map-page-v5-10-3bbfe3a25cdf@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 15/10/2025 à 11:12, Leon Romanovsky a écrit :
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Adapt PowerPC DMA to use physical addresses in order to prepare code
> to removal .map_page and .unmap_page.
> 
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

Non fatal comments below.

> ---
>   arch/powerpc/include/asm/iommu.h         |  8 ++++----
>   arch/powerpc/kernel/dma-iommu.c          | 22 ++++++++++-----------
>   arch/powerpc/kernel/iommu.c              | 14 +++++++-------
>   arch/powerpc/platforms/ps3/system-bus.c  | 33 ++++++++++++++++++--------------
>   arch/powerpc/platforms/pseries/ibmebus.c | 15 ++++++++-------
>   arch/powerpc/platforms/pseries/vio.c     | 21 +++++++++++---------
>   6 files changed, 60 insertions(+), 53 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/iommu.h b/arch/powerpc/include/asm/iommu.h
> index b410021ad4c6..eafdd63cd6c4 100644
> --- a/arch/powerpc/include/asm/iommu.h
> +++ b/arch/powerpc/include/asm/iommu.h
> @@ -274,12 +274,12 @@ extern void *iommu_alloc_coherent(struct device *dev, struct iommu_table *tbl,
>   				  unsigned long mask, gfp_t flag, int node);
>   extern void iommu_free_coherent(struct iommu_table *tbl, size_t size,
>   				void *vaddr, dma_addr_t dma_handle);
> -extern dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
> -				 struct page *page, unsigned long offset,
> -				 size_t size, unsigned long mask,
> +extern dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
> +				 phys_addr_t phys, size_t size,
> +				 unsigned long mask,
>   				 enum dma_data_direction direction,
>   				 unsigned long attrs);

'extern' is pointless for function prototypes.

Report from checkpatch:

CHECK: extern prototypes should be avoided in .h files
#31: FILE: arch/powerpc/include/asm/iommu.h:277:
+extern dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table 
*tbl,


> -extern void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
> +extern void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
>   			     size_t size, enum dma_data_direction direction,
>   			     unsigned long attrs);

Same:

CHECK: extern prototypes should be avoided in .h files
#37: FILE: arch/powerpc/include/asm/iommu.h:282:
+extern void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t 
dma_handle,



>   
> diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
> index 0359ab72cd3b..aa3689d61917 100644
> --- a/arch/powerpc/kernel/dma-iommu.c
> +++ b/arch/powerpc/kernel/dma-iommu.c
> @@ -93,28 +93,26 @@ static void dma_iommu_free_coherent(struct device *dev, size_t size,
>   
>   /* Creates TCEs for a user provided buffer.  The user buffer must be
>    * contiguous real kernel storage (not vmalloc).  The address passed here
> - * comprises a page address and offset into that page. The dma_addr_t
> - * returned will point to the same byte within the page as was passed in.
> + * is a physical address to that page. The dma_addr_t returned will point
> + * to the same byte within the page as was passed in.
>    */
> -static dma_addr_t dma_iommu_map_page(struct device *dev, struct page *page,
> -				     unsigned long offset, size_t size,
> +static dma_addr_t dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
> +				     size_t size,
>   				     enum dma_data_direction direction,
>   				     unsigned long attrs)
>   {
> -	return iommu_map_page(dev, get_iommu_table_base(dev), page, offset,
> -			      size, dma_get_mask(dev), direction, attrs);
> +	return iommu_map_phys(dev, get_iommu_table_base(dev), phys, size,
> +			      dma_get_mask(dev), direction, attrs);
>   }
>   
> -
> -static void dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
> +static void dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
>   				 size_t size, enum dma_data_direction direction,
>   				 unsigned long attrs)
>   {
> -	iommu_unmap_page(get_iommu_table_base(dev), dma_handle, size, direction,
> +	iommu_unmap_phys(get_iommu_table_base(dev), dma_handle, size, direction,
>   			 attrs);
>   }
>   
> -
>   static int dma_iommu_map_sg(struct device *dev, struct scatterlist *sglist,
>   			    int nelems, enum dma_data_direction direction,
>   			    unsigned long attrs)
> @@ -211,8 +209,8 @@ const struct dma_map_ops dma_iommu_ops = {
>   	.map_sg			= dma_iommu_map_sg,
>   	.unmap_sg		= dma_iommu_unmap_sg,
>   	.dma_supported		= dma_iommu_dma_supported,
> -	.map_page		= dma_iommu_map_page,
> -	.unmap_page		= dma_iommu_unmap_page,
> +	.map_phys		= dma_iommu_map_phys,
> +	.unmap_phys		= dma_iommu_unmap_phys,
>   	.get_required_mask	= dma_iommu_get_required_mask,
>   	.mmap			= dma_common_mmap,
>   	.get_sgtable		= dma_common_get_sgtable,
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index 244eb4857e7f..6b5f4b72ce97 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -848,12 +848,12 @@ EXPORT_SYMBOL_GPL(iommu_tce_table_put);
>   
>   /* Creates TCEs for a user provided buffer.  The user buffer must be
>    * contiguous real kernel storage (not vmalloc).  The address passed here
> - * comprises a page address and offset into that page. The dma_addr_t
> - * returned will point to the same byte within the page as was passed in.
> + * is physical address into that page. The dma_addr_t returned will point
> + * to the same byte within the page as was passed in.
>    */
> -dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
> -			  struct page *page, unsigned long offset, size_t size,
> -			  unsigned long mask, enum dma_data_direction direction,
> +dma_addr_t iommu_map_phys(struct device *dev, struct iommu_table *tbl,
> +			  phys_addr_t phys, size_t size, unsigned long mask,
> +			  enum dma_data_direction direction,
>   			  unsigned long attrs)
>   {
>   	dma_addr_t dma_handle = DMA_MAPPING_ERROR;
> @@ -863,7 +863,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
>   
>   	BUG_ON(direction == DMA_NONE);
>   
> -	vaddr = page_address(page) + offset;
> +	vaddr = phys_to_virt(phys);
>   	uaddr = (unsigned long)vaddr;
>   
>   	if (tbl) {
> @@ -890,7 +890,7 @@ dma_addr_t iommu_map_page(struct device *dev, struct iommu_table *tbl,
>   	return dma_handle;
>   }
>   
> -void iommu_unmap_page(struct iommu_table *tbl, dma_addr_t dma_handle,
> +void iommu_unmap_phys(struct iommu_table *tbl, dma_addr_t dma_handle,
>   		      size_t size, enum dma_data_direction direction,
>   		      unsigned long attrs)
>   {
> diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
> index afbaabf182d0..f4f3477d3a23 100644
> --- a/arch/powerpc/platforms/ps3/system-bus.c
> +++ b/arch/powerpc/platforms/ps3/system-bus.c
> @@ -551,18 +551,20 @@ static void ps3_free_coherent(struct device *_dev, size_t size, void *vaddr,
>   
>   /* Creates TCEs for a user provided buffer.  The user buffer must be
>    * contiguous real kernel storage (not vmalloc).  The address passed here
> - * comprises a page address and offset into that page. The dma_addr_t
> - * returned will point to the same byte within the page as was passed in.
> + * is physical address to that hat page. The dma_addr_t returned will point
> + * to the same byte within the page as was passed in.
>    */
>   
> -static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
> -	unsigned long offset, size_t size, enum dma_data_direction direction,
> -	unsigned long attrs)
> +static dma_addr_t ps3_sb_map_phys(struct device *_dev, phys_addr_t phys,
> +	size_t size, enum dma_data_direction direction, unsigned long attrs)

CHECK: Alignment should match open parenthesis
#151: FILE: arch/powerpc/platforms/ps3/system-bus.c:559:
+static dma_addr_t ps3_sb_map_phys(struct device *_dev, phys_addr_t phys,
+	size_t size, enum dma_data_direction direction, unsigned long attrs)



>   {
>   	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
>   	int result;
>   	dma_addr_t bus_addr;
> -	void *ptr = page_address(page) + offset;
> +	void *ptr = phys_to_virt(phys);
> +
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return DMA_MAPPING_ERROR;
>   
>   	result = ps3_dma_map(dev->d_region, (unsigned long)ptr, size,
>   			     &bus_addr,
> @@ -577,8 +579,8 @@ static dma_addr_t ps3_sb_map_page(struct device *_dev, struct page *page,
>   	return bus_addr;
>   }
>   
> -static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
> -				    unsigned long offset, size_t size,
> +static dma_addr_t ps3_ioc0_map_phys(struct device *_dev, phys_addr_t phys,
> +				    size_t size,
>   				    enum dma_data_direction direction,
>   				    unsigned long attrs)
>   {
> @@ -586,7 +588,10 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
>   	int result;
>   	dma_addr_t bus_addr;
>   	u64 iopte_flag;
> -	void *ptr = page_address(page) + offset;
> +	void *ptr = phys_to_virt(phys);
> +
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return DMA_MAPPING_ERROR;
>   
>   	iopte_flag = CBE_IOPTE_M;
>   	switch (direction) {
> @@ -613,7 +618,7 @@ static dma_addr_t ps3_ioc0_map_page(struct device *_dev, struct page *page,
>   	return bus_addr;
>   }
>   
> -static void ps3_unmap_page(struct device *_dev, dma_addr_t dma_addr,
> +static void ps3_unmap_phys(struct device *_dev, dma_addr_t dma_addr,
>   	size_t size, enum dma_data_direction direction, unsigned long attrs)

CHECK: Alignment should match open parenthesis
#193: FILE: arch/powerpc/platforms/ps3/system-bus.c:622:
+static void ps3_unmap_phys(struct device *_dev, dma_addr_t dma_addr,
  	size_t size, enum dma_data_direction direction, unsigned long attrs)



>   {
>   	struct ps3_system_bus_device *dev = ps3_dev_to_system_bus_dev(_dev);
> @@ -690,8 +695,8 @@ static const struct dma_map_ops ps3_sb_dma_ops = {
>   	.map_sg = ps3_sb_map_sg,
>   	.unmap_sg = ps3_sb_unmap_sg,
>   	.dma_supported = ps3_dma_supported,
> -	.map_page = ps3_sb_map_page,
> -	.unmap_page = ps3_unmap_page,
> +	.map_phys = ps3_sb_map_phys,
> +	.unmap_phys = ps3_unmap_phys,
>   	.mmap = dma_common_mmap,
>   	.get_sgtable = dma_common_get_sgtable,
>   	.alloc_pages_op = dma_common_alloc_pages,
> @@ -704,8 +709,8 @@ static const struct dma_map_ops ps3_ioc0_dma_ops = {
>   	.map_sg = ps3_ioc0_map_sg,
>   	.unmap_sg = ps3_ioc0_unmap_sg,
>   	.dma_supported = ps3_dma_supported,
> -	.map_page = ps3_ioc0_map_page,
> -	.unmap_page = ps3_unmap_page,
> +	.map_phys = ps3_ioc0_map_phys,
> +	.unmap_phys = ps3_unmap_phys,
>   	.mmap = dma_common_mmap,
>   	.get_sgtable = dma_common_get_sgtable,
>   	.alloc_pages_op = dma_common_alloc_pages,
> diff --git a/arch/powerpc/platforms/pseries/ibmebus.c b/arch/powerpc/platforms/pseries/ibmebus.c
> index 3436b0af795e..cad2deb7e70d 100644
> --- a/arch/powerpc/platforms/pseries/ibmebus.c
> +++ b/arch/powerpc/platforms/pseries/ibmebus.c
> @@ -86,17 +86,18 @@ static void ibmebus_free_coherent(struct device *dev,
>   	kfree(vaddr);
>   }
>   
> -static dma_addr_t ibmebus_map_page(struct device *dev,
> -				   struct page *page,
> -				   unsigned long offset,
> +static dma_addr_t ibmebus_map_phys(struct device *dev, phys_addr_t phys,
>   				   size_t size,
>   				   enum dma_data_direction direction,
>   				   unsigned long attrs)
>   {
> -	return (dma_addr_t)(page_address(page) + offset);
> +	if (attrs & DMA_ATTR_MMIO)
> +		return DMA_MAPPING_ERROR;
> +
> +	return (dma_addr_t)(phys_to_virt(phys));
>   }
>   
> -static void ibmebus_unmap_page(struct device *dev,
> +static void ibmebus_unmap_phys(struct device *dev,
>   			       dma_addr_t dma_addr,
>   			       size_t size,
>   			       enum dma_data_direction direction,
> @@ -146,8 +147,8 @@ static const struct dma_map_ops ibmebus_dma_ops = {
>   	.unmap_sg           = ibmebus_unmap_sg,
>   	.dma_supported      = ibmebus_dma_supported,
>   	.get_required_mask  = ibmebus_dma_get_required_mask,
> -	.map_page           = ibmebus_map_page,
> -	.unmap_page         = ibmebus_unmap_page,
> +	.map_phys           = ibmebus_map_phys,
> +	.unmap_phys         = ibmebus_unmap_phys,
>   };
>   
>   static int ibmebus_match_path(struct device *dev, const void *data)
> diff --git a/arch/powerpc/platforms/pseries/vio.c b/arch/powerpc/platforms/pseries/vio.c
> index ac1d2d2c9a88..18cffac5468f 100644
> --- a/arch/powerpc/platforms/pseries/vio.c
> +++ b/arch/powerpc/platforms/pseries/vio.c
> @@ -512,18 +512,21 @@ static void vio_dma_iommu_free_coherent(struct device *dev, size_t size,
>   	vio_cmo_dealloc(viodev, roundup(size, PAGE_SIZE));
>   }
>   
> -static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
> -                                         unsigned long offset, size_t size,
> -                                         enum dma_data_direction direction,
> -                                         unsigned long attrs)
> +static dma_addr_t vio_dma_iommu_map_phys(struct device *dev, phys_addr_t phys,
> +					 size_t size,
> +					 enum dma_data_direction direction,
> +					 unsigned long attrs)
>   {
>   	struct vio_dev *viodev = to_vio_dev(dev);
>   	struct iommu_table *tbl = get_iommu_table_base(dev);
>   	dma_addr_t ret = DMA_MAPPING_ERROR;
>   
> +	if (unlikely(attrs & DMA_ATTR_MMIO))
> +		return ret;
> +
>   	if (vio_cmo_alloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl))))
>   		goto out_fail;
> -	ret = iommu_map_page(dev, tbl, page, offset, size, dma_get_mask(dev),
> +	ret = iommu_map_phys(dev, tbl, phys, size, dma_get_mask(dev),
>   			direction, attrs);

CHECK: Alignment should match open parenthesis
#285: FILE: arch/powerpc/platforms/pseries/vio.c:530:
+	ret = iommu_map_phys(dev, tbl, phys, size, dma_get_mask(dev),
  			direction, attrs);


>   	if (unlikely(ret == DMA_MAPPING_ERROR))
>   		goto out_deallocate;
> @@ -536,7 +539,7 @@ static dma_addr_t vio_dma_iommu_map_page(struct device *dev, struct page *page,
>   	return DMA_MAPPING_ERROR;
>   }
>   
> -static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
> +static void vio_dma_iommu_unmap_phys(struct device *dev, dma_addr_t dma_handle,
>   				     size_t size,
>   				     enum dma_data_direction direction,
>   				     unsigned long attrs)
> @@ -544,7 +547,7 @@ static void vio_dma_iommu_unmap_page(struct device *dev, dma_addr_t dma_handle,
>   	struct vio_dev *viodev = to_vio_dev(dev);
>   	struct iommu_table *tbl = get_iommu_table_base(dev);
>   
> -	iommu_unmap_page(tbl, dma_handle, size, direction, attrs);
> +	iommu_unmap_phys(tbl, dma_handle, size, direction, attrs);
>   	vio_cmo_dealloc(viodev, roundup(size, IOMMU_PAGE_SIZE(tbl)));
>   }
>   
> @@ -605,8 +608,8 @@ static const struct dma_map_ops vio_dma_mapping_ops = {
>   	.free              = vio_dma_iommu_free_coherent,
>   	.map_sg            = vio_dma_iommu_map_sg,
>   	.unmap_sg          = vio_dma_iommu_unmap_sg,
> -	.map_page          = vio_dma_iommu_map_page,
> -	.unmap_page        = vio_dma_iommu_unmap_page,
> +	.map_phys          = vio_dma_iommu_map_phys,
> +	.unmap_phys        = vio_dma_iommu_unmap_phys,
>   	.dma_supported     = dma_iommu_dma_supported,
>   	.get_required_mask = dma_iommu_get_required_mask,
>   	.mmap		   = dma_common_mmap,
> 


