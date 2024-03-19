Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0E468801E0
	for <lists+linuxppc-dev@lfdr.de>; Tue, 19 Mar 2024 17:18:54 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z1gFlxcw;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TzcNX3hjkz3dd4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 20 Mar 2024 03:18:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Z1gFlxcw;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=2604:1380:4641:c500::1; helo=dfw.source.kernel.org; envelope-from=rppt@kernel.org; receiver=lists.ozlabs.org)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TzcMq3pXKz2xcs
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 20 Mar 2024 03:18:15 +1100 (AEDT)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9178560F21;
	Tue, 19 Mar 2024 16:18:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 183B0C433F1;
	Tue, 19 Mar 2024 16:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710865093;
	bh=d0rUTsfB2PCFWi1NwKDB0tLU9VzNlX5I7JRarfxcQ3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z1gFlxcwZtWV6mPCa6DoyMtNy+ryKBDf7VvGjK1BHFSa7zvNqAfMh0onxw6Esp6QA
	 PdtPaEq244NK/VR1baqWWmr8Jm5lRiiOFlxLy2BJ7+L/3dh8ky56lsuVQ8qPWv9USw
	 Fwx2xeEIeFlW+EmLzc4lDe+1kcdZz9NegjmvJzwVdrcqyAomgfUR+EfajNg58N06A/
	 pR9Q+uxTUj59w9eCDo3wfS4g4NZHs3j3oXAv+Xuzc/pGvsiAM6GhhJFfnju+oGBDou
	 nnbyNOrGIxWsBdHElN/Q4Dk6etROiiRyPNGkSwzuM6j7bLC4/rAgVHGYdzoj9yHVFI
	 BOLZTacLYrKLA==
Date: Tue, 19 Mar 2024 18:17:07 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Baoquan He <bhe@redhat.com>
Subject: Re: [PATCH 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <Zfm6gzhKUehLwM5-@kernel.org>
References: <20240318142138.783350-1-bhe@redhat.com>
 <20240318142138.783350-5-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240318142138.783350-5-bhe@redhat.com>
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

On Mon, Mar 18, 2024 at 10:21:36PM +0800, Baoquan He wrote:
> Currently, in free_area_init_core(), when initialize zone's field, a
> rough value is set to zone->managed_pages. That value is calculated by
> (zone->present_pages - memmap_pages).
> 
> In the meantime, add the value to nr_all_pages and nr_kernel_pages which
> represent all free pages of system (only low memory or including HIGHMEM
> memory separately). Both of them are gonna be used in
> alloc_large_system_hash().
> 
> However, the rough calculation and setting of zone->managed_pages is
> meaningless because
>   a) memmap pages are allocated on units of node in sparse_init() or
>      alloc_node_mem_map(pgdat); The simple (zone->present_pages -
>      memmap_pages) is too rough to make sense for zone;
>   b) the set zone->managed_pages will be zeroed out and reset with
>      acutal value in mem_init() via memblock_free_all(). Before the
>      resetting, no buddy allocation request is issued.
> 
> Here, remove the meaningless and complicated calculation of
> (zone->present_pages - memmap_pages), directly set zone->present_pages to
> zone->managed_pages. It will be adjusted in mem_init().

Do you mean "set zone->managed_pages to zone->present_pages"?

I think we can just set zone->managed_pages to 0 in free_area_init_core().
Anyway it will be reset before the first use.
 
> And also remove the assignment of nr_all_pages and nr_kernel_pages in
> free_area_init_core(). Instead, call the newly added calc_nr_kernel_pages()
> to count up all free but not reserved memory in memblock and assign to
> nr_all_pages and nr_kernel_pages. The counting excludes memmap_pages,
> and other kernel used data, which is more accurate than old way and
> simpler, and can also cover the ppc required arch_reserved_kernel_pages()
> case.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/mm_init.c | 38 ++++++--------------------------------
>  1 file changed, 6 insertions(+), 32 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index c57a7fc97a16..55a2b886b7a6 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1584,41 +1584,14 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>  
>  	for (j = 0; j < MAX_NR_ZONES; j++) {
>  		struct zone *zone = pgdat->node_zones + j;
> -		unsigned long size, freesize, memmap_pages;
> -
> -		size = zone->spanned_pages;
> -		freesize = zone->present_pages;
> -
> -		/*
> -		 * Adjust freesize so that it accounts for how much memory
> -		 * is used by this zone for memmap. This affects the watermark
> -		 * and per-cpu initialisations
> -		 */
> -		memmap_pages = calc_memmap_size(size, freesize);
> -		if (!is_highmem_idx(j)) {
> -			if (freesize >= memmap_pages) {
> -				freesize -= memmap_pages;
> -				if (memmap_pages)
> -					pr_debug("  %s zone: %lu pages used for memmap\n",
> -						 zone_names[j], memmap_pages);
> -			} else
> -				pr_warn("  %s zone: %lu memmap pages exceeds freesize %lu\n",
> -					zone_names[j], memmap_pages, freesize);
> -		}
> -
> -		if (!is_highmem_idx(j))
> -			nr_kernel_pages += freesize;
> -		/* Charge for highmem memmap if there are enough kernel pages */
> -		else if (nr_kernel_pages > memmap_pages * 2)
> -			nr_kernel_pages -= memmap_pages;
> -		nr_all_pages += freesize;
> +		unsigned long size = zone->spanned_pages;
>  
>  		/*
> -		 * Set an approximate value for lowmem here, it will be adjusted
> -		 * when the bootmem allocator frees pages into the buddy system.
> -		 * And all highmem pages will be managed by the buddy system.
> +		 * Set the zone->managed_pages as zone->present_pages roughly, it
> +		 * be zeroed out and reset when memblock allocator frees pages into
> +		 * buddy system.
>  		 */
> -		zone_init_internals(zone, j, nid, freesize);
> +		zone_init_internals(zone, j, nid, zone->present_pages);
>  
>  		if (!size)
>  			continue;
> @@ -1915,6 +1888,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
>  		check_for_memory(pgdat);
>  	}
>  
> +	calc_nr_kernel_pages();
>  	memmap_init();
>  
>  	/* disable hash distribution for systems with a single node */
> -- 
> 2.41.0
> 

-- 
Sincerely yours,
Mike.
