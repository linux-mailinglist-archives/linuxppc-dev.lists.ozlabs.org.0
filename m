Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7B215CCCD
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Feb 2020 22:01:31 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48JTT4711wzDqWX
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Feb 2020 08:01:28 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=205.139.110.120;
 helo=us-smtp-1.mimecast.com; envelope-from=jmoyer@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=i/QifI3f; 
 dkim-atps=neutral
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48JTQh6f6GzDqLt
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Feb 2020 07:59:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581627559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CsVqx+kyd9Ql+81DltyyZW5LFYl4/Tko9hU86AVRTT8=;
 b=i/QifI3foFvOag/As7Cul0nJOvwzrsBSuZraNq5pevEmkC++AqtjGCVwIAvOIXm9bcEydX
 ns+NR1hmONrVxi10K0PrYOaWE11g2vXzRkFxg/oHYEqfclNSELVC4VQBZ6oAOXsJSQR2ta
 TeNid4pO43llLGJCD4+erQkxebQdnqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-101-NpHPUwgpMoqKZVVBz_ghvg-1; Thu, 13 Feb 2020 11:57:56 -0500
X-MC-Unique: NpHPUwgpMoqKZVVBz_ghvg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F0BE48010DF;
 Thu, 13 Feb 2020 16:57:54 +0000 (UTC)
Received: from segfault.boston.devel.redhat.com
 (segfault.boston.devel.redhat.com [10.19.60.26])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00C2960C05;
 Thu, 13 Feb 2020 16:57:52 +0000 (UTC)
From: Jeff Moyer <jmoyer@redhat.com>
To: Dan Williams <dan.j.williams@intel.com>
Subject: Re: [PATCH v2 1/4] mm/memremap_pages: Introduce
 memremap_compat_align()
References: <158155489850.3343782.2687127373754434980.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158155490379.3343782.10305190793306743949.stgit@dwillia2-desk3.amr.corp.intel.com>
X-PGP-KeyID: 1F78E1B4
X-PGP-CertKey: F6FE 280D 8293 F72C 65FD  5A58 1FF8 A7CA 1F78 E1B4
Date: Thu, 13 Feb 2020 11:57:52 -0500
In-Reply-To: <158155490379.3343782.10305190793306743949.stgit@dwillia2-desk3.amr.corp.intel.com>
 (Dan Williams's message of "Wed, 12 Feb 2020 16:48:23 -0800")
Message-ID: <x498sl677cf.fsf@segfault.boston.devel.redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
Cc: linux-nvdimm@lists.01.org, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Paul Mackerras <paulus@samba.org>,
 vishal.l.verma@intel.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Dan Williams <dan.j.williams@intel.com> writes:

> The "sub-section memory hotplug" facility allows memremap_pages() users
> like libnvdimm to compensate for hardware platforms like x86 that have a
> section size larger than their hardware memory mapping granularity.  The
> compensation that sub-section support affords is being tolerant of
> physical memory resources shifting by units smaller (64MiB on x86) than
> the memory-hotplug section size (128 MiB). Where the platform
> physical-memory mapping granularity is limited by the number and
> capability of address-decode-registers in the memory controller.
>
> While the sub-section support allows memremap_pages() to operate on
> sub-section (2MiB) granularity, the Power architecture may still
> require 16MiB alignment on "!radix_enabled()" platforms.
>
> In order for libnvdimm to be able to detect and manage this per-arch
> limitation, introduce memremap_compat_align() as a common minimum
> alignment across all driver-facing memory-mapping interfaces, and let
> Power override it to 16MiB in the "!radix_enabled()" case.
>
> The assumption / requirement for 16MiB to be a viable
> memremap_compat_align() value is that Power does not have platforms
> where its equivalent of address-decode-registers never hardware remaps a
> persistent memory resource on smaller than 16MiB boundaries. Note that I
> tried my best to not add a new Kconfig symbol, but header include
> entanglements defeated the #ifndef memremap_compat_align design pattern
> and the need to export it defeats the __weak design pattern for arch
> overrides.
>
> Based on an initial patch by Aneesh.

I have just a couple of questions.

First, can you please add a comment above the generic implementation of
memremap_compat_align describing its purpose, and why a platform might
want to override it?

Second, I will take it at face value that the power architecture
requires a 16MB alignment, but it's not clear to me why mmu_linear_psize
was chosen to represent that.  What's the relationship, there, and can
we please have a comment explaining it?

Thanks!
Jeff

>
> Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/powerpc/Kconfig      |    1 +
>  arch/powerpc/mm/ioremap.c |   12 ++++++++++++
>  drivers/nvdimm/pfn_devs.c |    2 +-
>  include/linux/memremap.h  |    8 ++++++++
>  include/linux/mmzone.h    |    1 +
>  lib/Kconfig               |    3 +++
>  mm/memremap.c             |   13 +++++++++++++
>  7 files changed, 39 insertions(+), 1 deletion(-)
>
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 497b7d0b2d7e..e6ffe905e2b9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -122,6 +122,7 @@ config PPC
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_KCOV
>  	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
> +	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN
>  	select ARCH_HAS_MMIOWB			if PPC64
>  	select ARCH_HAS_PHYS_TO_DMA
>  	select ARCH_HAS_PMEM_API
> diff --git a/arch/powerpc/mm/ioremap.c b/arch/powerpc/mm/ioremap.c
> index fc669643ce6a..38b5ba7d3e2d 100644
> --- a/arch/powerpc/mm/ioremap.c
> +++ b/arch/powerpc/mm/ioremap.c
> @@ -2,6 +2,7 @@
>  
>  #include <linux/io.h>
>  #include <linux/slab.h>
> +#include <linux/mmzone.h>
>  #include <linux/vmalloc.h>
>  #include <asm/io-workarounds.h>
>  
> @@ -97,3 +98,14 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
>  
>  	return NULL;
>  }
> +
> +#ifdef CONFIG_ZONE_DEVICE
> +/* override of the generic version in mm/memremap.c */
> +unsigned long memremap_compat_align(void)
> +{
> +       if (radix_enabled())
> +               return SUBSECTION_SIZE;
> +       return (1UL << mmu_psize_defs[mmu_linear_psize].shift);
> +}
> +EXPORT_SYMBOL_GPL(memremap_compat_align);
> +#endif
> diff --git a/drivers/nvdimm/pfn_devs.c b/drivers/nvdimm/pfn_devs.c
> index b94f7a7e94b8..a5c25cb87116 100644
> --- a/drivers/nvdimm/pfn_devs.c
> +++ b/drivers/nvdimm/pfn_devs.c
> @@ -750,7 +750,7 @@ static int nd_pfn_init(struct nd_pfn *nd_pfn)
>  	start = nsio->res.start;
>  	size = resource_size(&nsio->res);
>  	npfns = PHYS_PFN(size - SZ_8K);
> -	align = max(nd_pfn->align, (1UL << SUBSECTION_SHIFT));
> +	align = max(nd_pfn->align, SUBSECTION_SIZE);
>  	end_trunc = start + size - ALIGN_DOWN(start + size, align);
>  	if (nd_pfn->mode == PFN_MODE_PMEM) {
>  		/*
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 6fefb09af7c3..8af1cbd8f293 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -132,6 +132,7 @@ struct dev_pagemap *get_dev_pagemap(unsigned long pfn,
>  
>  unsigned long vmem_altmap_offset(struct vmem_altmap *altmap);
>  void vmem_altmap_free(struct vmem_altmap *altmap, unsigned long nr_pfns);
> +unsigned long memremap_compat_align(void);
>  #else
>  static inline void *devm_memremap_pages(struct device *dev,
>  		struct dev_pagemap *pgmap)
> @@ -165,6 +166,12 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
>  		unsigned long nr_pfns)
>  {
>  }
> +
> +/* when memremap_pages() is disabled all archs can remap a single page */
> +static inline unsigned long memremap_compat_align(void)
> +{
> +	return PAGE_SIZE;
> +}
>  #endif /* CONFIG_ZONE_DEVICE */
>  
>  static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
> @@ -172,4 +179,5 @@ static inline void put_dev_pagemap(struct dev_pagemap *pgmap)
>  	if (pgmap)
>  		percpu_ref_put(pgmap->ref);
>  }
> +
>  #endif /* _LINUX_MEMREMAP_H_ */
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 462f6873905a..6b77f7239af5 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -1170,6 +1170,7 @@ static inline unsigned long section_nr_to_pfn(unsigned long sec)
>  #define SECTION_ALIGN_DOWN(pfn)	((pfn) & PAGE_SECTION_MASK)
>  
>  #define SUBSECTION_SHIFT 21
> +#define SUBSECTION_SIZE (1UL << SUBSECTION_SHIFT)
>  
>  #define PFN_SUBSECTION_SHIFT (SUBSECTION_SHIFT - PAGE_SHIFT)
>  #define PAGES_PER_SUBSECTION (1UL << PFN_SUBSECTION_SHIFT)
> diff --git a/lib/Kconfig b/lib/Kconfig
> index 0cf875fd627c..17dbc7bd3895 100644
> --- a/lib/Kconfig
> +++ b/lib/Kconfig
> @@ -618,6 +618,9 @@ config ARCH_HAS_PMEM_API
>  config MEMREGION
>  	bool
>  
> +config ARCH_HAS_MEMREMAP_COMPAT_ALIGN
> +	bool
> +
>  # use memcpy to implement user copies for nommu architectures
>  config UACCESS_MEMCPY
>  	bool
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 09b5b7adc773..a6905d28fe91 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -7,6 +7,7 @@
>  #include <linux/mm.h>
>  #include <linux/pfn_t.h>
>  #include <linux/swap.h>
> +#include <linux/mmzone.h>
>  #include <linux/swapops.h>
>  #include <linux/types.h>
>  #include <linux/wait_bit.h>
> @@ -14,6 +15,18 @@
>  
>  static DEFINE_XARRAY(pgmap_array);
>  
> +/*
> + * Minimum compatible alignment of the resource (start, end) across
> + * memremap interfaces (i.e. memremap + memremap_pages)
> + */
> +#ifndef CONFIG_ARCH_HAS_MEMREMAP_COMPAT_ALIGN
> +unsigned long memremap_compat_align(void)
> +{
> +	return SUBSECTION_SIZE;
> +}
> +EXPORT_SYMBOL_GPL(memremap_compat_align);
> +#endif
> +
>  #ifdef CONFIG_DEV_PAGEMAP_OPS
>  DEFINE_STATIC_KEY_FALSE(devmap_managed_key);
>  EXPORT_SYMBOL(devmap_managed_key);

