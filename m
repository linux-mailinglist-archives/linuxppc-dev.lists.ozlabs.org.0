Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 26BD91A0EFF
	for <lists+linuxppc-dev@lfdr.de>; Tue,  7 Apr 2020 16:17:01 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48xTxQ1F4NzDqXS
	for <lists+linuxppc-dev@lfdr.de>; Wed,  8 Apr 2020 00:16:58 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=209.85.221.66; helo=mail-wr1-f66.google.com;
 envelope-from=mstsxfx@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=fail (p=none dis=none) header.from=kernel.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48xTZp26VgzDqLL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  8 Apr 2020 00:00:49 +1000 (AEST)
Received: by mail-wr1-f66.google.com with SMTP id h9so4011922wrc.8
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 07 Apr 2020 07:00:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=85uYzIYLpB2MYaLC8rzrAx+z7Cwj0As1rWHW278xDPo=;
 b=pfFl04T9T6e02/spfBWKtSE8fc47ddfTKSwtvoNeDiaQlt2eWCjt/of9hPuNr9IT5x
 +GOmmk2tveAwHOA6jinXwpaMm8XMehbZa6lxvR8eMhDsONBIz2l3sn+eGJ93mvH/Bany
 yXoOxLkBYaqoLcBKHQ0q5R0np1etEKR72J/MlFPLoYKO6ws/7m4W8GpF6lOyY9DLcaHE
 Iw++PzkPSiqtQO/a1EGjielrKohvxE76WQ79mMD5u9koCDcIuRmG6FWS4FgIcBJNkIbI
 q8oz3LXVhzuSGjFhBfVX+2deOiHr4NmQfqM/HSXviziZhNw6CwkkBSFxesL66Gjh0ksZ
 aY4Q==
X-Gm-Message-State: AGi0Puab2sYDZsGLOMMjK/WmwI5OtaZ0yDTCfnmbdwUuv1ixT3oM+2iS
 O5xYT2m6Ro6JufRQ3mkrQq8=
X-Google-Smtp-Source: APiQypImQFPPXUMgFY6K5WDlmtafD7U+zunnmfuk3kzE+z1nl24TQB9VD0Ss3D+cVVp8jxutcNevsQ==
X-Received: by 2002:adf:ce90:: with SMTP id r16mr3047177wrn.237.1586268045808; 
 Tue, 07 Apr 2020 07:00:45 -0700 (PDT)
Received: from localhost (ip-37-188-180-223.eurotel.cz. [37.188.180.223])
 by smtp.gmail.com with ESMTPSA id c6sm5637232wrm.0.2020.04.07.07.00.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 07:00:45 -0700 (PDT)
Date: Tue, 7 Apr 2020 16:00:44 +0200
From: Michal Hocko <mhocko@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH v1 2/2] mm/memory_hotplug: remove
 is_mem_section_removable()
Message-ID: <20200407140044.GR18914@dhcp22.suse.cz>
References: <20200407135416.24093-1-david@redhat.com>
 <20200407135416.24093-3-david@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407135416.24093-3-david@redhat.com>
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
Cc: Baoquan He <bhe@redhat.com>, linux-kernel@vger.kernel.org,
 Wei Yang <richard.weiyang@gmail.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org,
 Oscar Salvador <osalvador@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue 07-04-20 15:54:16, David Hildenbrand wrote:
> Fortunately, all users of is_mem_section_removable() are gone. Get rid of
> it, including some now unnecessary functions.
> 
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Michal Hocko <mhocko@suse.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Oscar Salvador <osalvador@suse.de>
> Cc: Baoquan He <bhe@redhat.com>
> Cc: Wei Yang <richard.weiyang@gmail.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>

Acked-by: Michal Hocko <mhocko@suse.com>

> ---
>  include/linux/memory_hotplug.h |  7 ----
>  mm/memory_hotplug.c            | 75 ----------------------------------

\o/

Thanks!

>  2 files changed, 82 deletions(-)
> 
> diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
> index 93d9ada74ddd..7dca9cd6076b 100644
> --- a/include/linux/memory_hotplug.h
> +++ b/include/linux/memory_hotplug.h
> @@ -314,19 +314,12 @@ static inline void pgdat_resize_init(struct pglist_data *pgdat) {}
>  
>  #ifdef CONFIG_MEMORY_HOTREMOVE
>  
> -extern bool is_mem_section_removable(unsigned long pfn, unsigned long nr_pages);
>  extern void try_offline_node(int nid);
>  extern int offline_pages(unsigned long start_pfn, unsigned long nr_pages);
>  extern int remove_memory(int nid, u64 start, u64 size);
>  extern void __remove_memory(int nid, u64 start, u64 size);
>  
>  #else
> -static inline bool is_mem_section_removable(unsigned long pfn,
> -					unsigned long nr_pages)
> -{
> -	return false;
> -}
> -
>  static inline void try_offline_node(int nid) {}
>  
>  static inline int offline_pages(unsigned long start_pfn, unsigned long nr_pages)
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 47cf6036eb31..4d338d546d52 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1112,81 +1112,6 @@ int add_memory(int nid, u64 start, u64 size)
>  EXPORT_SYMBOL_GPL(add_memory);
>  
>  #ifdef CONFIG_MEMORY_HOTREMOVE
> -/*
> - * A free page on the buddy free lists (not the per-cpu lists) has PageBuddy
> - * set and the size of the free page is given by page_order(). Using this,
> - * the function determines if the pageblock contains only free pages.
> - * Due to buddy contraints, a free page at least the size of a pageblock will
> - * be located at the start of the pageblock
> - */
> -static inline int pageblock_free(struct page *page)
> -{
> -	return PageBuddy(page) && page_order(page) >= pageblock_order;
> -}
> -
> -/* Return the pfn of the start of the next active pageblock after a given pfn */
> -static unsigned long next_active_pageblock(unsigned long pfn)
> -{
> -	struct page *page = pfn_to_page(pfn);
> -
> -	/* Ensure the starting page is pageblock-aligned */
> -	BUG_ON(pfn & (pageblock_nr_pages - 1));
> -
> -	/* If the entire pageblock is free, move to the end of free page */
> -	if (pageblock_free(page)) {
> -		int order;
> -		/* be careful. we don't have locks, page_order can be changed.*/
> -		order = page_order(page);
> -		if ((order < MAX_ORDER) && (order >= pageblock_order))
> -			return pfn + (1 << order);
> -	}
> -
> -	return pfn + pageblock_nr_pages;
> -}
> -
> -static bool is_pageblock_removable_nolock(unsigned long pfn)
> -{
> -	struct page *page = pfn_to_page(pfn);
> -	struct zone *zone;
> -
> -	/*
> -	 * We have to be careful here because we are iterating over memory
> -	 * sections which are not zone aware so we might end up outside of
> -	 * the zone but still within the section.
> -	 * We have to take care about the node as well. If the node is offline
> -	 * its NODE_DATA will be NULL - see page_zone.
> -	 */
> -	if (!node_online(page_to_nid(page)))
> -		return false;
> -
> -	zone = page_zone(page);
> -	pfn = page_to_pfn(page);
> -	if (!zone_spans_pfn(zone, pfn))
> -		return false;
> -
> -	return !has_unmovable_pages(zone, page, MIGRATE_MOVABLE,
> -				    MEMORY_OFFLINE);
> -}
> -
> -/* Checks if this range of memory is likely to be hot-removable. */
> -bool is_mem_section_removable(unsigned long start_pfn, unsigned long nr_pages)
> -{
> -	unsigned long end_pfn, pfn;
> -
> -	end_pfn = min(start_pfn + nr_pages,
> -			zone_end_pfn(page_zone(pfn_to_page(start_pfn))));
> -
> -	/* Check the starting page of each pageblock within the range */
> -	for (pfn = start_pfn; pfn < end_pfn; pfn = next_active_pageblock(pfn)) {
> -		if (!is_pageblock_removable_nolock(pfn))
> -			return false;
> -		cond_resched();
> -	}
> -
> -	/* All pageblocks in the memory block are likely to be hot-removable */
> -	return true;
> -}
> -
>  /*
>   * Confirm all pages in a range [start, end) belong to the same zone (skipping
>   * memory holes). When true, return the zone.
> -- 
> 2.25.1
> 

-- 
Michal Hocko
SUSE Labs
