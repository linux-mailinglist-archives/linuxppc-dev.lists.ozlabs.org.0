Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF7088011C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 16:51:13 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GhsftalN;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzbmZ0yhXz3dd4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 02:51:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=GhsftalN;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tzblp1bNTz2xct
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 02:50:30 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2087560E2C;
	Tue, 19 Mar 2024 15:50:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 749F8C43390;
	Tue, 19 Mar 2024 15:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710863425;
	bh=apyBLSMY17l5k6YmL7tgRw2duWfuFRcprZhgOcvDx3U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GhsftalN+s41C0DoGW2lRZ49nObKvR14d7JIS8aFWR3rzkuY2+Zpu6QTzkRkCDGiV
	 D8vwJOePyyu65N3VDgupFhy1/U/JqfI1I0oFo5YftYtp8LwboRYl0OD0xbH5IOSIq+
	 5AuBuACNWUmCc9vmgoONrHeDDNdQkDd17u7+6yeylmST3y4pTYrE5E7f77np/rN7Tb
	 dum6Ntxc1qsM20Ra+kbucPT4ORsI8QJ7UQVkOZDG1kCeJadUlW8c12K9WSJka5dZQD
	 NjwEFpKTJQuYe8jKAmV5R480Sta75swVTBGOo8Mn/FTrKu1aHj5G8vrv6w8iTLx3Xl
	 RpnOyaP5pxPRg==
Date: Tue, 19 Mar 2024 17:49:19 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 2/6] x86: remove memblock_find_dma_reserve()
Message-ID: <Zfmz_1sbbvSWMj9C@kernel.org>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-3-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318142138.783350-3-bhe@redhat.com>
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

Hi Baoquan,

On Mon, Mar 18, 2024 at 10:21:34PM +0800, Baoquan He wrote:
> This is not needed any more.

I'd swap this and the first patch, so that the first patch would remove
memblock_find_dma_reserve() and it's changelog will explain why it's not
needed and then the second patch will simply drop unused set_dma_reserve()

> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  arch/x86/include/asm/pgtable.h |  1 -
>  arch/x86/kernel/setup.c        |  2 --
>  arch/x86/mm/init.c             | 45 ----------------------------------
>  3 files changed, 48 deletions(-)
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
> index 3e1e96efadfe..5aa00938051f 100644
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
> index 5209549e8192..615f0bf4bda6 100644
> --- a/arch/x86/mm/init.c
> +++ b/arch/x86/mm/init.c
> @@ -990,51 +990,6 @@ void __init free_initrd_mem(unsigned long start, unsigned long end)
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
