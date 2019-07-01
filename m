Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B1ED5B752
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 10:58:20 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45ch9P4FvfzDqWZ
	for <lists+linuxppc-dev@lfdr.de>; Mon,  1 Jul 2019 18:58:17 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=softfail (mailfrom) smtp.mailfrom=kernel.org
 (client-ip=195.135.220.15; helo=mx1.suse.de; envelope-from=mhocko@kernel.org;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45ch2p4pp1zDqWc
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  1 Jul 2019 18:52:34 +1000 (AEST)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id AE529AD23;
 Mon,  1 Jul 2019 08:52:31 +0000 (UTC)
Date: Mon, 1 Jul 2019 10:52:31 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v3 11/11] mm/memory_hotplug: Remove "zone" parameter from
 sparse_remove_one_section
Message-ID: <20190701085231.GK6376@dhcp22.suse.cz>
References: <20190527111152.16324-1-david@redhat.com>
 <20190527111152.16324-12-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527111152.16324-12-david@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-s390@vger.kernel.org, linux-ia64@vger.kernel.org,
 linux-sh@vger.kernel.org, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Igor Mammedov <imammedo@redhat.com>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Dan Williams <dan.j.williams@intel.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon 27-05-19 13:11:52, David Hildenbrand wrote:
> The parameter is unused, so let's drop it. Memory removal paths should
> never care about zones. This is the job of memory offlining and will
> require more refactorings.
> 
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  include/linux/memory_hotplug.h | 2 +-
>  mm/memory_hotplug.c            | 2 +-
>  mm/sparse.c                    | 4 ++--
>  3 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 2f1f87e13baa..1a4257c5f74c 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -346,7 +346,7 @@ extern void move_pfn_range_to_zone(struct zone *zone, unsigned long start_pfn,
>  extern bool is_memblock_offlined(struct memory_block *mem);
>  extern int sparse_add_one_section(int nid, unsigned long start_pfn,
>  				  struct vmem_altmap *altmap);
> -extern void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
> +extern void sparse_remove_one_section(struct mem_section *ms,
>  		unsigned long map_offset, struct vmem_altmap *altmap);
>  extern struct page *sparse_decode_mem_map(unsigned long coded_mem_map,
>  					  unsigned long pnum);
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 82136c5b4c5f..e48ec7b9dee2 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -524,7 +524,7 @@ static void __remove_section(struct zone *zone, struct mem_section *ms,
>  	start_pfn = section_nr_to_pfn((unsigned long)scn_nr);
>  	__remove_zone(zone, start_pfn);
>  
> -	sparse_remove_one_section(zone, ms, map_offset, altmap);
> +	sparse_remove_one_section(ms, map_offset, altmap);
>  }
>  
>  /**
> diff --git a/mm/sparse.c b/mm/sparse.c
> index d1d5e05f5b8d..1552c855d62a 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -800,8 +800,8 @@ static void free_section_usemap(struct page *memmap, unsigned long *usemap,
>  		free_map_bootmem(memmap);
>  }
>  
> -void sparse_remove_one_section(struct zone *zone, struct mem_section *ms,
> -		unsigned long map_offset, struct vmem_altmap *altmap)
> +void sparse_remove_one_section(struct mem_section *ms, unsigned long map_offset,
> +			       struct vmem_altmap *altmap)
>  {
>  	struct page *memmap = NULL;
>  	unsigned long *usemap = NULL;
> -- 
> 2.20.1

-- 
Michal Hocko
SUSE Labs
