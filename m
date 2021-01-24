Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B067301CEF
	for <lists+linuxppc-dev@lfdr.de>; Sun, 24 Jan 2021 16:10:27 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DNxJH1l15zDqCT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 Jan 2021 02:10:23 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record)
 smtp.mailfrom=casper.srs.infradead.org (client-ip=2001:8b0:10b:1236::1;
 helo=casper.infradead.org;
 envelope-from=batv+340bc88fe697da228867+6363+infradead.org+hch@casper.srs.infradead.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=casper.20170209 header.b=BaxCQ4JE; 
 dkim-atps=neutral
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DNxG25rcYzDqbr
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 Jan 2021 02:08:26 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=dqC43SexXCFMHHthuyPfm6btpOzYB4LGWqFz9yXsqsE=; b=BaxCQ4JETgnTSdx5ZJfhAASEhz
 esJxRvOHbYrbto7O+p7uVv9HyRKOsua3l0BNbionSzcJZYiFYGlrrsKktY3c1b+BZT6Jvi4bMVnRh
 YMM5aTMq54Usa7gYS+B5up/PU+FCWP3uGZdJvgC/xWqtrcQP4J8ijpnrxV6i9kRC8XIps5RoOeeP7
 xH3mTPg9YiPd6SrCb0IQ1Y/ggPND+C8Nd3UP3F4wna0oB6yS4GH2gtr7whM8eUD+xOYQmfHa6lvGt
 ZqumIqBYwteZOy+D5Nbx7ifw1DVDCsylJstsUAgx/MVfCAuQO1amZqC/E6lkCNtIT42NvJUAofeaS
 M/wnOpuA==;
Received: from hch by casper.infradead.org with local (Exim 4.94 #2 (Red Hat
 Linux)) id 1l3gzB-0035uS-SZ; Sun, 24 Jan 2021 15:07:31 +0000
Date: Sun, 24 Jan 2021 15:07:29 +0000
From: Christoph Hellwig <hch@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH v10 11/12] mm/vmalloc: Hugepage vmalloc mappings
Message-ID: <20210124150729.GC733865@infradead.org>
References: <20210124082230.2118861-1-npiggin@gmail.com>
 <20210124082230.2118861-12-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210124082230.2118861-12-npiggin@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
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
Cc: linux-arch@vger.kernel.org, Ding Tianhong <dingtianhong@huawei.com>,
 linux-kernel@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 linux-mm@kvack.org, Zefan Li <lizefan@huawei.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sun, Jan 24, 2021 at 06:22:29PM +1000, Nicholas Piggin wrote:
> diff --git a/arch/Kconfig b/arch/Kconfig
> index 24862d15f3a3..f87feb616184 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -724,6 +724,16 @@ config HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
>  config HAVE_ARCH_HUGE_VMAP
>  	bool
>  
> +config HAVE_ARCH_HUGE_VMALLOC
> +	depends on HAVE_ARCH_HUGE_VMAP
> +	bool
> +	help
> +	  Archs that select this would be capable of PMD-sized vmaps (i.e.,
> +	  arch_vmap_pmd_supported() returns true), and they must make no
> +	  assumptions that vmalloc memory is mapped with PAGE_SIZE ptes. The
> +	  VM_NOHUGE flag can be used to prohibit arch-specific allocations from
> +	  using hugepages to help with this (e.g., modules may require it).

help texts don't make sense for options that aren't user visible.

More importantly, is there any good reason to keep the option and not
just go the extra step and enable huge page vmalloc for arm64 and x86
as well?

> +static inline bool is_vm_area_hugepages(const void *addr)
> +{
> +	/*
> +	 * This may not 100% tell if the area is mapped with > PAGE_SIZE
> +	 * page table entries, if for some reason the architecture indicates
> +	 * larger sizes are available but decides not to use them, nothing
> +	 * prevents that. This only indicates the size of the physical page
> +	 * allocated in the vmalloc layer.
> +	 */
> +	return (find_vm_area(addr)->page_order > 0);

No need for the braces here.

>  }
>  
> +static int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages, unsigned int page_shift)
> +{
> +	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
> +
> +	WARN_ON(page_shift < PAGE_SHIFT);
> +
> +	if (page_shift == PAGE_SHIFT)
> +		return vmap_small_pages_range_noflush(addr, end, prot, pages);

This begs for a IS_ENABLED check to disable the hugepage code for
architectures that don't need it.

> +int map_kernel_range_noflush(unsigned long addr, unsigned long size,
> +			     pgprot_t prot, struct page **pages)
> +{
> +	return vmap_pages_range_noflush(addr, addr + size, prot, pages, PAGE_SHIFT);
> +}

Please just kill off map_kernel_range_noflush and map_kernel_range
off entirely in favor of the vmap versions.

> +	for (i = 0; i < area->nr_pages; i += 1U << area->page_order) {

Maybe using a helper that takes the vm_area_struct and either returns
area->page_order or always 0 based on IS_ENABLED?
