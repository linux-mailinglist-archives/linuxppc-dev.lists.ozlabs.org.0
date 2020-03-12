Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C9F0182761
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 04:18:37 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48dDYk263vzDqQn
	for <lists+linuxppc-dev@lfdr.de>; Thu, 12 Mar 2020 14:18:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48dDX95wg7zDqFC
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 12 Mar 2020 14:17:13 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none)
 header.from=ellerman.id.au
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=OSD8Lyx3; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 48dDX763dwz9sPR;
 Thu, 12 Mar 2020 14:17:11 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ellerman.id.au;
 s=201909; t=1583983033;
 bh=NYSOgErceRZJLp/xhjanawo/XQMAhfY+yiI337uW+Qk=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=OSD8Lyx3xrxhWAEI+wgWyFt6E/eO4ACheAw4shLgaOJKkqc+Z/pfVN7Ehxkv+w4yH
 KiWqQYV0mxii7ZiLPQn5dqs8DXSML59RcWEDJqop/j2OSfcfxUoIoFoHZBqPx084+Y
 /weP1HgNFxOYNoVnTO7JT9CxQb8zv1gAXZA8YCV8OsWgocTc+uj3cL9eX9yNfekE8f
 Rrwh1sKZU8N0xC8PHFZOddHIRY8zZlziOoQMB0TOhOJpv0b8mW913Ttes0q59JebZ2
 G7Wzi2FrKuLuXKyNMnuqDEUSDiclYKun0MiEl7+DOgnyFPBlsBX58JVL9I714kdMI4
 mvRU/zLWRN5og==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Dan Williams <dan.j.williams@intel.com>, linux-nvdimm@lists.01.org
Subject: Re: [PATCH v4 1/5] mm/memremap_pages: Introduce
 memremap_compat_align()
In-Reply-To: <158328768844.2223916.3587427265166021149.stgit@dwillia2-desk3.amr.corp.intel.com>
References: <158328768294.2223916.16551505954326988623.stgit@dwillia2-desk3.amr.corp.intel.com>
 <158328768844.2223916.3587427265166021149.stgit@dwillia2-desk3.amr.corp.intel.com>
Date: Thu, 12 Mar 2020 14:17:09 +1100
Message-ID: <87o8t2i7nu.fsf@mpe.ellerman.id.au>
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
Cc: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 linux-kernel@vger.kernel.org, Jeff Moyer <jmoyer@redhat.com>,
 Paul Mackerras <paulus@samba.org>, vishal.l.verma@intel.com,
 linuxppc-dev@lists.ozlabs.org
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
>
> Link: http://lore.kernel.org/r/CAPcyv4gBGNP95APYaBcsocEa50tQj9b5h__83vgngjq3ouGX_Q@mail.gmail.com
> Reported-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Paul Mackerras <paulus@samba.org>
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> Signed-off-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  arch/powerpc/Kconfig      |    1 +
>  arch/powerpc/mm/ioremap.c |   21 +++++++++++++++++++++
>  drivers/nvdimm/pfn_devs.c |    2 +-
>  include/linux/memremap.h  |    8 ++++++++
>  include/linux/mmzone.h    |    1 +
>  lib/Kconfig               |    3 +++
>  mm/memremap.c             |   23 +++++++++++++++++++++++
>  7 files changed, 58 insertions(+), 1 deletion(-)
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
> index fc669643ce6a..b1a0aebe8c48 100644
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
> @@ -97,3 +98,23 @@ void __iomem *do_ioremap(phys_addr_t pa, phys_addr_t offset, unsigned long size,
>  
>  	return NULL;
>  }
> +
> +#ifdef CONFIG_ZONE_DEVICE
> +/*
> + * Override the generic version in mm/memremap.c.
> + *
> + * With hash translation, the direct-map range is mapped with just one
> + * page size selected by htab_init_page_sizes(). Consult
> + * mmu_psize_defs[] to determine the minimum page size alignment.
> +*/
> +unsigned long memremap_compat_align(void)
> +{
> +	unsigned int shift = mmu_psize_defs[mmu_linear_psize].shift;
> +
> +	if (radix_enabled())
> +		return SUBSECTION_SIZE;
> +	return max(SUBSECTION_SIZE, 1UL << shift);
> +
> +}
> +EXPORT_SYMBOL_GPL(memremap_compat_align);
> +#endif

LGTM.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers
