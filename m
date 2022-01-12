Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93DD848C294
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 11:56:51 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYkyn3JW5z3bTN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 21:56:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ani8MIHj;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ani8MIHj;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=ani8MIHj; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=ani8MIHj; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYkxy4R9Vz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 21:56:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641984964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nXDaBEqSwcubb9UAlItnBJ/49dksDZCXM8chYBVKNM=;
 b=ani8MIHjiEHxxwtCZTgfsP5Y4ODXmp49m/JwBphn5uzuka5C3KnQoohb2ql2mQ8W/AE1S/
 GNGi/xvgX+ZNmdIRGBA2o2m8I/gByeYz3U3MU7NpuryBVjGK0Vg6BnhYnooMg7E4KUm0cG
 h3W6yvJGGAXLDL5t/6gvg/Tyi77q9BM=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641984964;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1nXDaBEqSwcubb9UAlItnBJ/49dksDZCXM8chYBVKNM=;
 b=ani8MIHjiEHxxwtCZTgfsP5Y4ODXmp49m/JwBphn5uzuka5C3KnQoohb2ql2mQ8W/AE1S/
 GNGi/xvgX+ZNmdIRGBA2o2m8I/gByeYz3U3MU7NpuryBVjGK0Vg6BnhYnooMg7E4KUm0cG
 h3W6yvJGGAXLDL5t/6gvg/Tyi77q9BM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-145-BLqZBWZQNoO7TPozUebT-A-1; Wed, 12 Jan 2022 05:54:52 -0500
X-MC-Unique: BLqZBWZQNoO7TPozUebT-A-1
Received: by mail-ed1-f69.google.com with SMTP id
 x19-20020a05640226d300b003f8b80f5729so1901589edd.13
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 02:54:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=1nXDaBEqSwcubb9UAlItnBJ/49dksDZCXM8chYBVKNM=;
 b=Gtcj215fmIOI3qJWrxCXc2/L9MJGTWrojqbGJR+RWg00tMATIMYBwBGInvS5mXdhm0
 6b31brX3pKbe0MCCKfIKKnry/Pmaw7ByTN1QoHpbaxV0clmloU44syLAzNQlD4HQ692+
 MRlRKiNZGRfqYY6W6jS6SXXjPe5Q2JoKPN7QROXJqXRdufud++Cdk7WUav3oY8ZHN1Bn
 Nv3HtaIwvkopEQXr2yi7cw9HuDAr3B8lWGjkynBBTOgoKx1FQN7cjI7BEGdp59OfQemk
 bkY1CLqnSNrVrlzlmc3Z/529o03FcZrjG4SClyaLR0CEJ3864T7GQ8CpUjfP/27+Rbes
 saKg==
X-Gm-Message-State: AOAM532+FQKpW6S6xjn04Q56qGZsRdcPDCnSBb1gu9/gyKuiWAaIIOVZ
 6NCWjCykf8d3WDizrYCtEEwlVZewvVWFKRgKWhFSX9fRc4+7UhC2hjNUR0s7anaGZHNclA9fIfo
 7dEfvV6m1BfKvAzuCjNuOFAUKCQ==
X-Received: by 2002:a17:906:3052:: with SMTP id
 d18mr7112120ejd.675.1641984891159; 
 Wed, 12 Jan 2022 02:54:51 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyn5fswqQ0dOEoBSWPUJo6KSN9+8h4kCBAhgFotHJOoSPil79OW088szvXQNfhv7fsGVeMxSQ==
X-Received: by 2002:a17:906:3052:: with SMTP id
 d18mr7112100ejd.675.1641984890940; 
 Wed, 12 Jan 2022 02:54:50 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id hc40sm1981993ejc.72.2022.01.12.02.54.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 02:54:50 -0800 (PST)
Message-ID: <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
Date: Wed, 12 Jan 2022 11:54:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-2-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH v3 1/8] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
In-Reply-To: <20220105214756.91065-2-zi.yan@sent.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: Mel Gorman <mgorman@techsingularity.net>,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Eric Ren <renzhengeek@gmail.com>,
 virtualization@lists.linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 05.01.22 22:47, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.
> It prepares for the upcoming removal of the MAX_ORDER-1 alignment
> requirement for CMA and alloc_contig_range().
> 
> MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
> MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.
> Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
> 
> [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingularity.net/
> 
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  include/linux/mmzone.h |  6 ++++++
>  mm/page_alloc.c        | 28 ++++++++++++++++++----------
>  2 files changed, 24 insertions(+), 10 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index aed44e9b5d89..0aa549653e4e 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -83,6 +83,12 @@ static inline bool is_migrate_movable(int mt)
>  	return is_migrate_cma(mt) || mt == MIGRATE_MOVABLE;
>  }
>  
> +/* See fallbacks[MIGRATE_TYPES][3] in page_alloc.c */
> +static inline bool migratetype_has_fallback(int mt)
> +{
> +	return mt < MIGRATE_PCPTYPES;
> +}
> +
>  #define for_each_migratetype_order(order, type) \
>  	for (order = 0; order < MAX_ORDER; order++) \
>  		for (type = 0; type < MIGRATE_TYPES; type++)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8dd6399bafb5..5193c953dbf8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1042,6 +1042,12 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
>  	return page_is_buddy(higher_page, higher_buddy, order + 1);
>  }
>  
> +static inline bool has_non_fallback_pageblock(struct zone *zone)
> +{
> +	return has_isolate_pageblock(zone) || zone_cma_pages(zone) != 0 ||
> +		zone->nr_reserved_highatomic != 0;
> +}

Due to zone_cma_pages(), the unlikely() below will be very wrong on many
setups. Previously, isolation really was a corner case. CMA and
highatomic are less of a corner case ...

I'm not even sure if this check is worth having around anymore at all,
or if it would be easier and cheaper to just always check the both
migration types unconditionally. Would certainly simplify the code.

Side node: we actually care about has_free_non_fallback_pageblock(), we
can only merge with free pageblocks. But that might not necessarily be
cheaper to test/track/check.

> +
>  /*
>   * Freeing function for a buddy system allocator.
>   *
> @@ -1117,14 +1123,15 @@ static inline void __free_one_page(struct page *page,
>  	}
>  	if (order < MAX_ORDER - 1) {
>  		/* If we are here, it means order is >= pageblock_order.
> -		 * We want to prevent merge between freepages on isolate
> -		 * pageblock and normal pageblock. Without this, pageblock
> -		 * isolation could cause incorrect freepage or CMA accounting.
> +		 * We want to prevent merge between freepages on pageblock
> +		 * without fallbacks and normal pageblock. Without this,
> +		 * pageblock isolation could cause incorrect freepage or CMA
> +		 * accounting or HIGHATOMIC accounting.
>  		 *
>  		 * We don't want to hit this code for the more frequent
>  		 * low-order merging.
>  		 */
> -		if (unlikely(has_isolate_pageblock(zone))) {
> +		if (unlikely(has_non_fallback_pageblock(zone))) {
>  			int buddy_mt;
>  
>  			buddy_pfn = __find_buddy_pfn(pfn, order);
> @@ -1132,8 +1139,8 @@ static inline void __free_one_page(struct page *page,
>  			buddy_mt = get_pageblock_migratetype(buddy);
>  
>  			if (migratetype != buddy_mt
> -					&& (is_migrate_isolate(migratetype) ||
> -						is_migrate_isolate(buddy_mt)))
> +					&& (!migratetype_has_fallback(migratetype) ||
> +						!migratetype_has_fallback(buddy_mt)))
>  				goto done_merging;
>  		}
>  		max_order = order + 1;
> @@ -2484,6 +2491,7 @@ static int fallbacks[MIGRATE_TYPES][3] = {
>  	[MIGRATE_UNMOVABLE]   = { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,   MIGRATE_TYPES },
>  	[MIGRATE_MOVABLE]     = { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE, MIGRATE_TYPES },
>  	[MIGRATE_RECLAIMABLE] = { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,   MIGRATE_TYPES },
> +	[MIGRATE_HIGHATOMIC] = { MIGRATE_TYPES }, /* Never used */
>  #ifdef CONFIG_CMA
>  	[MIGRATE_CMA]         = { MIGRATE_TYPES }, /* Never used */
>  #endif
> @@ -2795,8 +2803,8 @@ static void reserve_highatomic_pageblock(struct page *page, struct zone *zone,
>  
>  	/* Yoink! */
>  	mt = get_pageblock_migratetype(page);
> -	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
> -	    && !is_migrate_cma(mt)) {
> +	/* Only reserve normal pageblock */
> +	if (migratetype_has_fallback(mt)) {
>  		zone->nr_reserved_highatomic += pageblock_nr_pages;
>  		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
>  		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
> @@ -3545,8 +3553,8 @@ int __isolate_free_page(struct page *page, unsigned int order)
>  		struct page *endpage = page + (1 << order) - 1;
>  		for (; page < endpage; page += pageblock_nr_pages) {
>  			int mt = get_pageblock_migratetype(page);
> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
> -			    && !is_migrate_highatomic(mt))
> +			/* Only change normal pageblock */
> +			if (migratetype_has_fallback(mt))
>  				set_pageblock_migratetype(page,
>  							  MIGRATE_MOVABLE);
>  		}

That part is a nice cleanup IMHO. Although the "has fallback" part is a
bit imprecise. "migratetype_is_mergable()" might be a bit clearer.
ideally "migratetype_is_mergable_with_other_types()". Can we come up
with a nice name for that?

-- 
Thanks,

David / dhildenb

