Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3C2589E0
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 09:57:28 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BgfYc508JzDqWG
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Sep 2020 17:57:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::1042;
 helo=mail-pj1-x1042.google.com; envelope-from=nicoleotsuka@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20161025 header.b=pFCuT3VF; dkim-atps=neutral
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BgfVJ312CzDqRX
 for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Sep 2020 17:54:32 +1000 (AEST)
Received: by mail-pj1-x1042.google.com with SMTP id g6so224994pjl.0
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Sep 2020 00:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7jGjGUK8hwkcJIJuEkpJ1L3GK78KMzt4UEGzm9C/+9A=;
 b=pFCuT3VFAxeR4pUSxmgW6PUf9vY9952hHQbglWQSJvUrV36XaxiVUOT4j2gXMEVEyX
 hyi4WhFVMdiuAL334LmxATm2GsvkL2zUX0NkAdPBvUl1pOksNHHzp6R3Z61aCeASWLUd
 VcJ6DWrJNxnIZ46JY3oB7irUk4vbMCfMWMMcdkQgQYt4FpC1jZ9ji5GRZTyYBP64fgff
 JGVkvH2VNpw5tSBPVLdmFTViuqKhiIwC7uiCvPhruNhhbRcCksDhoInof0pSriW/4THC
 gnfvIhuyQ5FBHEwZyELTXZdBxBhD3IMa5z3MYZfnH3LZapFh8Teca1kgFYDOT4xO6lcz
 RdaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=7jGjGUK8hwkcJIJuEkpJ1L3GK78KMzt4UEGzm9C/+9A=;
 b=HDL6U8vG2mh2SHzzAIy7HFLR4fSLx5qjVTzAXgM8oJDuuM2PGmjS/Sxjt4uJ9EUiA5
 QP1tziCNOW/5OIO174cc9/2y7ZkVewsxD6g4LLS/Pth1aLd0884yQ20aQPeFb8RUBIHM
 Fec3WyzyqlDt1mmvN1uX4LswVWsZIpYMYpAK5n6qzU9yQyYoGzLmPq1v39zoQmZlP1j+
 8t92i0NSmJLNdXl0agBFJH3JEYmn69rv44AJg0WApNX5FXNWBqC7uqSYbM+Um2N9aT9K
 zjh6OLWhS+VnQB4YQONiJlp+wABOJG3l0U8geftLeox9tO4FkpVHS3jJYshcJ2BFk1z1
 iggQ==
X-Gm-Message-State: AOAM5329+cXK4A5T1OVmZZTRv4ufNE8TCiLpE+UVKZkCCicFQdt7Jv+O
 XEekyfO4fDtq6iQ+EKXUhvs=
X-Google-Smtp-Source: ABdhPJx6/GpkX8jjV0dE5E7lET9GFIzoMfNZc+Zwt55BOscCTpLCiCIcsImNL6fpf6770IWflxbdgg==
X-Received: by 2002:a17:902:8c84:: with SMTP id t4mr308447plo.99.1598946868982; 
 Tue, 01 Sep 2020 00:54:28 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
 by smtp.gmail.com with ESMTPSA id 205sm774947pfz.14.2020.09.01.00.54.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 01 Sep 2020 00:54:28 -0700 (PDT)
Date: Tue, 1 Sep 2020 00:54:01 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Christoph Hellwig <hch@lst.de>
Subject: Re: [RESEND][PATCH 0/7] Avoid overflow at boundary_size
Message-ID: <20200901075401.GA5667@Asurada-Nvidia>
References: <20200831203811.8494-1-nicoleotsuka@gmail.com>
 <20200901073623.GA30418@lst.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200901073623.GA30418@lst.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
Cc: linux-ia64@vger.kernel.org, James.Bottomley@HansenPartnership.com,
 paulus@samba.org, hpa@zytor.com, sparclinux@vger.kernel.org,
 sfr@canb.auug.org.au, deller@gmx.de, x86@kernel.org, borntraeger@de.ibm.com,
 mingo@redhat.com, mattst88@gmail.com, fenghua.yu@intel.com, gor@linux.ibm.com,
 schnelle@linux.ibm.com, hca@linux.ibm.com, ink@jurassic.park.msu.ru,
 tglx@linutronix.de, gerald.schaefer@linux.ibm.com, rth@twiddle.net,
 tony.luck@intel.com, linux-parisc@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-alpha@vger.kernel.org, bp@alien8.de,
 linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Christoph,

On Tue, Sep 01, 2020 at 09:36:23AM +0200, Christoph Hellwig wrote:
> I really don't like all the open coded smarts in the various drivers.
> What do you think about a helper like the one in the untested patch

A helper function will be actually better. I was thinking of
one yet not very sure about the naming and where to put it.

> below (on top of your series).  Also please include the original
> segment boundary patch with the next resend so that the series has
> the full context.

I will use your change instead and resend with the ULONG_MAX
change. But in that case, should I make separate changes for
different files like this series, or just one single change
like yours?

Asking this as I was expecting that those changes would get
applied by different maintainers. But now it feels like you
will merge it to your tree at once?

Thanks
Nic

> diff --git a/arch/alpha/kernel/pci_iommu.c b/arch/alpha/kernel/pci_iommu.c
> index 1ef2c647bd3ec2..6f7de4f4e191e7 100644
> --- a/arch/alpha/kernel/pci_iommu.c
> +++ b/arch/alpha/kernel/pci_iommu.c
> @@ -141,10 +141,7 @@ iommu_arena_find_pages(struct device *dev, struct pci_iommu_arena *arena,
>  	unsigned long boundary_size;
>  
>  	base = arena->dma_base >> PAGE_SHIFT;
> -
> -	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (boundary_size >> PAGE_SHIFT) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, PAGE_SHIFT);
>  
>  	/* Search forward for the first mask-aligned sequence of N free ptes */
>  	ptes = arena->ptes;
> diff --git a/arch/ia64/hp/common/sba_iommu.c b/arch/ia64/hp/common/sba_iommu.c
> index 945954903bb0ba..b49b73a95067d2 100644
> --- a/arch/ia64/hp/common/sba_iommu.c
> +++ b/arch/ia64/hp/common/sba_iommu.c
> @@ -485,8 +485,7 @@ sba_search_bitmap(struct ioc *ioc, struct device *dev,
>  	ASSERT(((unsigned long) ioc->res_hint & (sizeof(unsigned long) - 1UL)) == 0);
>  	ASSERT(res_ptr < res_end);
>  
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (dma_get_seg_boundary(dev) >> iovp_shift) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, iovp_shift);
>  
>  	BUG_ON(ioc->ibase & ~iovp_mask);
>  	shift = ioc->ibase >> iovp_shift;
> diff --git a/arch/powerpc/kernel/iommu.c b/arch/powerpc/kernel/iommu.c
> index c01ccbf8afdd42..cbc2e62db597cf 100644
> --- a/arch/powerpc/kernel/iommu.c
> +++ b/arch/powerpc/kernel/iommu.c
> @@ -236,11 +236,7 @@ static unsigned long iommu_range_alloc(struct device *dev,
>  		}
>  	}
>  
> -	/* 4GB boundary for iseries_hv_alloc and iseries_hv_map */
> -	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
> -
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (boundary_size >> tbl->it_page_shift) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, tbl->it_page_shift);
>  
>  	n = iommu_area_alloc(tbl->it_map, limit, start, npages, tbl->it_offset,
>  			     boundary_size, align_mask);
> diff --git a/arch/s390/pci/pci_dma.c b/arch/s390/pci/pci_dma.c
> index ecb067acc6d532..4a37d8f4de9d9d 100644
> --- a/arch/s390/pci/pci_dma.c
> +++ b/arch/s390/pci/pci_dma.c
> @@ -261,13 +261,11 @@ static unsigned long __dma_alloc_iommu(struct device *dev,
>  				       unsigned long start, int size)
>  {
>  	struct zpci_dev *zdev = to_zpci(to_pci_dev(dev));
> -	unsigned long boundary_size;
>  
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (dma_get_seg_boundary(dev) >> PAGE_SHIFT) + 1;
>  	return iommu_area_alloc(zdev->iommu_bitmap, zdev->iommu_pages,
>  				start, size, zdev->start_dma >> PAGE_SHIFT,
> -				boundary_size, 0);
> +				dma_get_seg_boundary_nr_pages(dev, PAGE_SHIFT),
> +				0);
>  }
>  
>  static dma_addr_t dma_alloc_address(struct device *dev, int size)
> diff --git a/arch/sparc/kernel/iommu-common.c b/arch/sparc/kernel/iommu-common.c
> index 843e71894d0482..e6139c99762e11 100644
> --- a/arch/sparc/kernel/iommu-common.c
> +++ b/arch/sparc/kernel/iommu-common.c
> @@ -166,10 +166,6 @@ unsigned long iommu_tbl_range_alloc(struct device *dev,
>  		}
>  	}
>  
> -	boundary_size = dev ? dma_get_seg_boundary(dev) : U32_MAX;
> -
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (boundary_size >> iommu->table_shift) + 1;
>  	/*
>  	 * if the skip_span_boundary_check had been set during init, we set
>  	 * things up so that iommu_is_span_boundary() merely checks if the
> @@ -178,7 +174,11 @@ unsigned long iommu_tbl_range_alloc(struct device *dev,
>  	if ((iommu->flags & IOMMU_NO_SPAN_BOUND) != 0) {
>  		shift = 0;
>  		boundary_size = iommu->poolsize * iommu->nr_pools;
> +	} else {
> +		boundary_size = dma_get_seg_boundary_nr_pages(dev,
> +					iommu->table_shift);
>  	}
> +
>  	n = iommu_area_alloc(iommu->map, limit, start, npages, shift,
>  			     boundary_size, align_mask);
>  	if (n == -1) {
> diff --git a/arch/sparc/kernel/iommu.c b/arch/sparc/kernel/iommu.c
> index d981c37305ae31..c3e4e2df26a8b8 100644
> --- a/arch/sparc/kernel/iommu.c
> +++ b/arch/sparc/kernel/iommu.c
> @@ -472,8 +472,7 @@ static int dma_4u_map_sg(struct device *dev, struct scatterlist *sglist,
>  	outs->dma_length = 0;
>  
>  	max_seg_size = dma_get_max_seg_size(dev);
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	seg_boundary_size = (dma_get_seg_boundary(dev) >> IO_PAGE_SHIFT) + 1;
> +	seg_boundary_size = dma_get_seg_boundary_nr_pages(dev, IO_PAGE_SHIFT);
>  	base_shift = iommu->tbl.table_map_base >> IO_PAGE_SHIFT;
>  	for_each_sg(sglist, s, nelems, i) {
>  		unsigned long paddr, npages, entry, out_entry = 0, slen;
> diff --git a/arch/sparc/kernel/pci_sun4v.c b/arch/sparc/kernel/pci_sun4v.c
> index 233fe8a20cec33..6b92dd51c0026f 100644
> --- a/arch/sparc/kernel/pci_sun4v.c
> +++ b/arch/sparc/kernel/pci_sun4v.c
> @@ -508,8 +508,7 @@ static int dma_4v_map_sg(struct device *dev, struct scatterlist *sglist,
>  	iommu_batch_start(dev, prot, ~0UL);
>  
>  	max_seg_size = dma_get_max_seg_size(dev);
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	seg_boundary_size = (dma_get_seg_boundary(dev) >> IO_PAGE_SHIFT) + 1;
> +	seg_boundary_size = dma_get_seg_boundary_nr_pages(dev, IO_PAGE_SHIFT);
>  
>  	mask = *dev->dma_mask;
>  	if (!iommu_use_atu(iommu, mask))
> diff --git a/arch/x86/kernel/amd_gart_64.c b/arch/x86/kernel/amd_gart_64.c
> index 7fa0bb490065a1..bccc5357bffd6c 100644
> --- a/arch/x86/kernel/amd_gart_64.c
> +++ b/arch/x86/kernel/amd_gart_64.c
> @@ -96,8 +96,7 @@ static unsigned long alloc_iommu(struct device *dev, int size,
>  
>  	base_index = ALIGN(iommu_bus_base & dma_get_seg_boundary(dev),
>  			   PAGE_SIZE) >> PAGE_SHIFT;
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (dma_get_seg_boundary(dev) >> PAGE_SHIFT) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, PAGE_SHIFT);
>  
>  	spin_lock_irqsave(&iommu_bitmap_lock, flags);
>  	offset = iommu_area_alloc(iommu_gart_bitmap, iommu_pages, next_bit,
> diff --git a/drivers/parisc/ccio-dma.c b/drivers/parisc/ccio-dma.c
> index c667d6aba7646e..ba16b7f8f80612 100644
> --- a/drivers/parisc/ccio-dma.c
> +++ b/drivers/parisc/ccio-dma.c
> @@ -356,8 +356,7 @@ ccio_alloc_range(struct ioc *ioc, struct device *dev, size_t size)
>  	** ggg sacrifices another 710 to the computer gods.
>  	*/
>  
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (dma_get_seg_boundary(dev) >> IOVP_SHIFT) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, IOVP_SHIFT);
>  
>  	if (pages_needed <= 8) {
>  		/*
> diff --git a/drivers/parisc/sba_iommu.c b/drivers/parisc/sba_iommu.c
> index 96bc2c617cbd19..959bda193b9603 100644
> --- a/drivers/parisc/sba_iommu.c
> +++ b/drivers/parisc/sba_iommu.c
> @@ -342,8 +342,7 @@ sba_search_bitmap(struct ioc *ioc, struct device *dev,
>  	unsigned long shift;
>  	int ret;
>  
> -	/* Overflow-free shortcut for: ALIGN(b + 1, 1 << s) >> s */
> -	boundary_size = (dma_get_seg_boundary(dev) >> IOVP_SHIFT) + 1;
> +	boundary_size = dma_get_seg_boundary_nr_pages(dev, IOVP_SHIFT);
>  
>  #if defined(ZX1_SUPPORT)
>  	BUG_ON(ioc->ibase & ~IOVP_MASK);
> diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
> index 52635e91143b25..7477a164500adb 100644
> --- a/include/linux/dma-mapping.h
> +++ b/include/linux/dma-mapping.h
> @@ -632,6 +632,25 @@ static inline unsigned long dma_get_seg_boundary(struct device *dev)
>  	return DMA_BIT_MASK(32);
>  }
>  
> +/**
> + * dma_get_seg_boundary_nr_pages - return the segment boundary in "page" units
> + * @dev: device to guery the boundary for
> + * @page_shift: ilog() of the the IOMMU page size
> + *
> + * Return the segment boundary in IOMMU page units (which may be different from
> + * the CPU page size) for the passed in device.
> + *
> + * If @dev is NULL a boundary of U32_MAX is assumed, this case is just for
> + * non-DMA API callers.
> + */
> +static inline unsigned long dma_get_seg_boundary_nr_pages(struct device *dev,
> +		unsigned int page_shift)
> +{
> +	if (!dev)
> +		return (U32_MAX >> page_shift) + 1;
> +	return (dma_get_seg_boundary(dev) >> page_shift) + 1;
> +}
> +
>  static inline int dma_set_seg_boundary(struct device *dev, unsigned long mask)
>  {
>  	if (dev->dma_parms) {
