Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D58388FA0A
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 09:33:37 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZI+74/pc;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZI+74/pc;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4V4xdV6lqgz3vgW
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Mar 2024 19:33:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZI+74/pc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ZI+74/pc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=bhe@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4V4xck3T3Rz3vYH
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 28 Mar 2024 19:32:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711614770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YU98x6HKPS4cGaJBRCphv0qa0ztW8Hkud3KMpoGM99k=;
	b=ZI+74/pctXFNa6WO8YAbdAb3gXtbEk87hsx9wAH0UKrqFhYKtkUnur36MOK+9RaIQSPOdA
	iE9EvzGyl0Ly4MK5U6f2dBh0YDJCUk0R0ITx8U5uy4JD3IuBKkRsHF8GB0Z22W4/phVeSk
	Cp7dK7KVTXJ7lGz0DGkh09NuAVLe5Xs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1711614770;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=YU98x6HKPS4cGaJBRCphv0qa0ztW8Hkud3KMpoGM99k=;
	b=ZI+74/pctXFNa6WO8YAbdAb3gXtbEk87hsx9wAH0UKrqFhYKtkUnur36MOK+9RaIQSPOdA
	iE9EvzGyl0Ly4MK5U6f2dBh0YDJCUk0R0ITx8U5uy4JD3IuBKkRsHF8GB0Z22W4/phVeSk
	Cp7dK7KVTXJ7lGz0DGkh09NuAVLe5Xs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-252-Jahxg1_oOjKaLrJVe7kmLQ-1; Thu, 28 Mar 2024 04:32:46 -0400
X-MC-Unique: Jahxg1_oOjKaLrJVe7kmLQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0B332852000;
	Thu, 28 Mar 2024 08:32:46 +0000 (UTC)
Received: from localhost (unknown [10.72.116.12])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4F752C01600;
	Thu, 28 Mar 2024 08:32:45 +0000 (UTC)
Date: Thu, 28 Mar 2024 16:32:38 +0800
From: Baoquan He <bhe@redhat.com>
To: linux-mm@kvack.org
Subject: Re: [PATCH v2 4/6] mm/mm_init.c: remove meaningless calculation of
 zone->managed_pages in free_area_init_core()
Message-ID: <ZgUrJuatQqAT0QA1@MiWiFi-R3L-srv>
References: <20240325145646.1044760-1-bhe@redhat.com>
 <20240325145646.1044760-5-bhe@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325145646.1044760-5-bhe@redhat.com>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
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
Cc: akpm@linux-foundation.org, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, rppt@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 03/25/24 at 10:56pm, Baoquan He wrote:
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
> (zone->present_pages - memmap_pages), initialize zone->managed_pages as 0
> which reflect its actual value because no any page is added into buddy
> system right now. It will be reset in mem_init().
> 
> And also remove the assignment of nr_all_pages and nr_kernel_pages in
> free_area_init_core(). Instead, call the newly added calc_nr_kernel_pages()
> to count up all free but not reserved memory in memblock and assign to
> nr_all_pages and nr_kernel_pages. The counting excludes memmap_pages,
> and other kernel used data, which is more accurate than old way and
> simpler, and can also cover the ppc required arch_reserved_kernel_pages()
> case.
> 
> And also clean up the outdated code comment above free_area_init_core().
> And free_area_init_core() is easy to understand now, no need to add
> words to explain.
> 
> Signed-off-by: Baoquan He <bhe@redhat.com>
> ---
>  mm/mm_init.c | 46 +++++-----------------------------------------
>  1 file changed, 5 insertions(+), 41 deletions(-)
> 
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index c57a7fc97a16..7f71e56e83f3 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1565,15 +1565,6 @@ void __ref free_area_init_core_hotplug(struct pglist_data *pgdat)
>  }
>  #endif
>  
> -/*
> - * Set up the zone data structures:
> - *   - mark all pages reserved
> - *   - mark all memory queues empty
> - *   - clear the memory bitmaps
> - *
> - * NOTE: pgdat should get zeroed by caller.
> - * NOTE: this function is only called during early init.
> - */
>  static void __init free_area_init_core(struct pglist_data *pgdat)
>  {
>  	enum zone_type j;
> @@ -1584,41 +1575,13 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
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
> +		 * Initialize zone->managed_pages as 0 , it will be reset
> +		 * when memblock allocator frees pages into buddy system.
>  		 */
> -		zone_init_internals(zone, j, nid, freesize);
> +		zone_init_internals(zone, j, nid, 0);

Here, we should initialize zone->managed_pages as zone->present_pages
because later page_group_by_mobility_disabled need be set according to
zone->managed_pages. Otherwise page_group_by_mobility_disabled will be
set to 1 always. I will sent out v3.

From a17b0921b4bd00596330f61ee9ea4b82386a9fed Mon Sep 17 00:00:00 2001
From: Baoquan He <bhe@redhat.com>
Date: Thu, 28 Mar 2024 16:20:15 +0800
Subject: [PATCH] mm/mm_init.c: set zone's ->managed_pages as ->present_pages
 for now
Content-type: text/plain

Because page_group_by_mobility_disabled need be set according to zone's
managed_pages later.

Signed-off-by: Baoquan He <bhe@redhat.com>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index cc24e7958c0c..dd875f943cbb 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1561,7 +1561,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
 		 * Initialize zone->managed_pages as 0 , it will be reset
 		 * when memblock allocator frees pages into buddy system.
 		 */
-		zone_init_internals(zone, j, nid, 0);
+		zone_init_internals(zone, j, nid, zone->present_pages);
 
 		if (!size)
 			continue;
-- 
2.41.0


>  
>  		if (!size)
>  			continue;
> @@ -1915,6 +1878,7 @@ void __init free_area_init(unsigned long *max_zone_pfn)
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

