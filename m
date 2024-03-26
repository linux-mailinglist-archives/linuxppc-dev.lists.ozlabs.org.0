Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A2B1D88BAA6
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 07:45:35 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D0c1jH74;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V3gKn2nGFz3dRJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Mar 2024 17:45:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=D0c1jH74;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.73.55; helo=sin.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V3gK54frbz2xKQ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Mar 2024 17:44:57 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1D1D5CE1E86;
	Tue, 26 Mar 2024 06:44:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDC90C433C7;
	Tue, 26 Mar 2024 06:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711435493;
	bh=3CyPtQL/V1IOnl6rwkcMU6bxDU1vSxf5XUjUQAShHFQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D0c1jH74lsUlDSMa3ELkDTKijMkqveJm6LsL81Sx0ma+ccTrHUXrcHMegPgew044d
	 iHcoNpWTVW9Tkb+KjBc+wjuiql254mwWnFH+IEE6JTyzWP69iALX4w2WXu9arsnVTX
	 KLPiskp39LfseoJhfHX/TJ3W859qKlr3qWYamIyVEjiKoUBrmM0vO3DjzURvmv4lC/
	 darEIMfVk+HuS/rcSTqIB05xbymnlelCexgKHmoWGf3MdT5O3cnggk6ZVmRONOtf7q
	 CCF9JLf4pC40PBjg7pRxuCL2lYk5TdfyaluGh4yRCT3oEwBfvalvFyyEdDZE2VBrWK
	 7ornIKdTuapAw==
Date: Tue, 26 Mar 2024 08:44:11 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH v2 1/6] x86: remove unneeded memblock_find_dma_reserve()
Message-ID: <ZgJuuwcM4lXsnyX7@kernel.org>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-2-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-2-bhe@redhat.com>
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
Cc: linux-mm@kvack.org, akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Mar 25, 2024 at 10:56:41PM +0800, Baoquan He wrote:
> Variable dma_reserve and its usage was introduced in commit 0e0b864e069c
> ("[PATCH] Account for memmap and optionally the kernel image as holes").
> Its original purpose was to accounting for the reserved pages in DMA
> zone to make DMA zone's watermarks calculation more accurate on x86.
> 
> However, currently there's zone->managed_pages to account for all
> available pages for buddy, zone->present_pages to account for all
> present physical pages in zone. What is more important, on x86,
> calculating and setting the zone->managed_pages is a temporary move,
> all zone's managed_pages will be zeroed out and reset to the actual
> value according to how many pages are added to buddy allocator in
> mem_init(). Before mem_init(), no buddy alloction is requested. And
> zone's pcp and watermark setting are all done after mem_init(). So,
> no need to worry about the DMA zone's setting accuracy during
> free_area_init().
> 
> Hence, remove memblock_find_dma_reserve() to stop calculating and
> setting dma_reserve.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>

Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>

> ---
>  arch/x86/include/asm/pgtable.h |  1 -
>  arch/x86/kernel/setup.c        |  2 --
>  arch/x86/mm/init.c             | 47 ----------------------------------
>  3 files changed, 50 deletions(-)
> 
> diff --git a/arch/x86/include/asm/pgtable.h b/arch/x86/include/asm/pgtable.h
> index 315535ffb258..cefc7a84f7a4 100644
> --- a/arch/x86/include/asm/pgtable.h
> +++ b/arch/x86/include/asm/pgtable.h
> @@ -1200,7 +1200,6 @@ static inline int pgd_none(pgd_t pgd)
>  extern int direct_gbpages;
>  void init_mem_mapping(void);
>  void early_alloc_pgt_buf(void);
> -extern void memblock_find_dma_reserve(void);
>  void __init poking_init(void);
>  unsigned long init_memory_mapping(unsigned long start,
>  				  unsigned long end, pgprot_t prot);
> diff --git a/arch/x86/kernel/setup.c b/arch/x86/kernel/setup.c
> index ef206500ed6f..74873bd04ad1 100644
> --- a/arch/x86/kernel/setup.c
> +++ b/arch/x86/kernel/setup.c
> @@ -1106,8 +1106,6 @@ void __init setup_arch(char **cmdline_p)
>  	 */
>  	arch_reserve_crashkernel();
>  
> -	memblock_find_dma_reserve();
> -
>  	if (!early_xdbc_setup_hardware())
>  		early_xdbc_register_console();
>  
> diff --git a/arch/x86/mm/init.c b/arch/x86/mm/init.c
> index 679893ea5e68..615f0bf4bda6 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -990,53 +990,6 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
>  }
>  #endif
>  
> -/*
> - * Calculate the precise size of the DMA zone (first 16 MB of RAM),
> - * and pass it to the MM layer - to help it set zone watermarks more
> - * accurately.
> - *
> - * Done on 64-bit systems only for the time being, although 32-bit systems
> - * might benefit from this as well.
> - */
> -void __init memblock_find_dma_reserve(void)
> -{
> -#ifdef CONFIG_X86_64
> -	u64 nr_pages = 0, nr_free_pages = 0;
> -	unsigned long start_pfn, end_pfn;
> -	phys_addr_t start_addr, end_addr;
> -	int i;
> -	u64 u;
> -
> -	/*
> -	 * Iterate over all memory ranges (free and reserved ones alike),
> -	 * to calculate the total number of pages in the first 16 MB of RAM:
> -	 */
> -	nr_pages = 0;
> -	for_each_mem_pfn_range(i, MAX_NUMNODES, &start_pfn, &end_pfn, NULL) {
> -		start_pfn = min(start_pfn, MAX_DMA_PFN);
> -		end_pfn   = min(end_pfn,   MAX_DMA_PFN);
> -
> -		nr_pages += end_pfn - start_pfn;
> -	}
> -
> -	/*
> -	 * Iterate over free memory ranges to calculate the number of free
> -	 * pages in the DMA zone, while not counting potential partial
> -	 * pages at the beginning or the end of the range:
> -	 */
> -	nr_free_pages = 0;
> -	for_each_free_mem_range(u, NUMA_NO_NODE, MEMBLOCK_NONE, &start_addr, &end_addr, NULL) {
> -		start_pfn = min_t(unsigned long, PFN_UP(start_addr), MAX_DMA_PFN);
> -		end_pfn   = min_t(unsigned long, PFN_DOWN(end_addr), MAX_DMA_PFN);
> -
> -		if (start_pfn < end_pfn)
> -			nr_free_pages += end_pfn - start_pfn;
> -	}
> -
> -	set_dma_reserve(nr_pages - nr_free_pages);
> -#endif
> -}
> -
>  void __init zone_sizes_init(void)
>  {
>  	unsigned long max_zone_pfns[MAX_NR_ZONES];
> -- 
> 2.41.0
> 

-- 
Sincerely yours,
Mike.
