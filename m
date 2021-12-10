Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC477471E52
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:48:52 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Df5Blbz3cYw
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:48:50 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=eG+dAPNp;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42f;
 helo=mail-pf1-x42f.google.com; envelope-from=renzhengeek@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=eG+dAPNp; dkim-atps=neutral
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9NFd75WMz3076
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 18:44:05 +1100 (AEDT)
Received: by mail-pf1-x42f.google.com with SMTP id p13so7762095pfw.2
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 23:44:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=FYFBhmavOHQihQEBX9qGXsO80PWaXrVj26hswLpne0s=;
 b=eG+dAPNpmN++zkv+fyWyJm9db2yzcXdaxWLsIDeNrM9/yL83hTHf9VWSkbOQK7h6hM
 Wlj/u3dtTGGsr1WM3qnBX5p59ibJ2UWj0/j+XWpG/tEacNWRzkoWytB17nxhlXdNVC2y
 RnNAYGMHaxEvW5WS7jDhS/fK+O5Gq63015sDuBfT8AfK5aOhuV3Ic3GuiN4JvVgC/x7i
 eec5AQFzLkkQkv9h4mhe2Rh7QcMiJbAxca73e5nrylXCYayDnebl2aF/Brekj2CjFD0F
 t1I3tDGsE7w3AKpWWqUALBve87HRS41uV7DfVDpOdl2CYYpeNu0XyfLRmLT0MDs/BoQi
 Lflw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FYFBhmavOHQihQEBX9qGXsO80PWaXrVj26hswLpne0s=;
 b=ENzIiMH43KTN2pYQzNoUQG6z2XOR0ndJOA0KmfGeKbHGdUObcQD/Ac7RK6NL47Dj+8
 ATa6LzyJ/ajErWbu97WKW5IDlnQ308u3/W2fh3+UFSsn9xCvahYgC6qweCEia2UnEP0T
 DHpzQKpabWAEsk5MdsGAwYwKolDZz85Zmk4dw+DVx4YpIgrFmHfxoDsEqHFcHQWRlYzk
 1XZa3M8MN1gYWB+YUfMGmDj2llbHILkMW14VU6VNejV15tcLp76cYeE+nX/K5mQA/t4A
 7SgcBWujHu7Te+PmUj/qFVFGg3rp995XuhxojxwknxFPES3mwPtk0pZKv7ZsxcnhnknC
 /mBw==
X-Gm-Message-State: AOAM532bth4Sw/BxdRTtGNwSDLWug8MdkVzkkFRwppMfW/iG5tM45Zep
 mm0JHXzbJOz8bXrgrXt70c8=
X-Google-Smtp-Source: ABdhPJwBPXWYkvIGUGnrjWv+j12lBB8kMdBIkbohxceo7qPeZwVXgp1O9cfcTUiYk9mgFRMURfHLMw==
X-Received: by 2002:a62:790e:0:b0:4af:e9c0:3322 with SMTP id
 u14-20020a62790e000000b004afe9c03322mr8145425pfc.86.1639122242728; 
 Thu, 09 Dec 2021 23:44:02 -0800 (PST)
Received: from [30.240.98.4] ([205.204.117.108])
 by smtp.gmail.com with ESMTPSA id a26sm1908458pfh.161.2021.12.09.23.43.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 23:44:02 -0800 (PST)
Message-ID: <2926b360-5204-45f5-e1a0-e260214f8dbf@gmail.com>
Date: Fri, 10 Dec 2021 15:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [RFC PATCH v2 1/7] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-2-zi.yan@sent.com>
From: Eric Ren <renzhengeek@gmail.com>
In-Reply-To: <20211209230414.2766515-2-zi.yan@sent.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 13 Dec 2021 09:47:48 +1100
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
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

On 2021/12/10 07:04, Zi Yan wrote:
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
>   include/linux/mmzone.h |  6 ++++++
>   mm/page_alloc.c        | 28 ++++++++++++++++++----------
>   2 files changed, 24 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 58e744b78c2c..b925431b0123 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -83,6 +83,12 @@ static inline bool is_migrate_movable(int mt)
>   	return is_migrate_cma(mt) || mt == MIGRATE_MOVABLE;
>   }
>   
> +/* See fallbacks[MIGRATE_TYPES][3] in page_alloc.c */
> +static inline bool migratetype_has_fallback(int mt)
> +{
> +	return mt < MIGRATE_PCPTYPES;
> +}
> +

I would suggest spliting the patch into 2 parts.  The first part: no 
functioning change, just introduce migratetype_has_fallback()
and replace where it applys to.

>   #define for_each_migratetype_order(order, type) \
>   	for (order = 0; order < MAX_ORDER; order++) \
>   		for (type = 0; type < MIGRATE_TYPES; type++)
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index edfd6c81af82..107a5f186d3b 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -1041,6 +1041,12 @@ buddy_merge_likely(unsigned long pfn, unsigned long buddy_pfn,
>   	return page_is_buddy(higher_page, higher_buddy, order + 1);
>   }
>   
> +static inline bool has_non_fallback_pageblock(struct zone *zone)
> +{
> +	return has_isolate_pageblock(zone) || zone_cma_pages(zone) != 0 ||
> +		zone->nr_reserved_highatomic != 0;

Make zone->nr_reserved_highatomic != 0 a helper as zone_cma_pages()?
> +}
> +
>   /*
>    * Freeing function for a buddy system allocator.
>    *
> @@ -1116,14 +1122,15 @@ static inline void __free_one_page(struct page *page,
>   	}
>   	if (order < MAX_ORDER - 1) {
>   		/* If we are here, it means order is >= pageblock_order.
> -		 * We want to prevent merge between freepages on isolate
> -		 * pageblock and normal pageblock. Without this, pageblock
> -		 * isolation could cause incorrect freepage or CMA accounting.
> +		 * We want to prevent merge between freepages on pageblock
> +		 * without fallbacks and normal pageblock. Without this,
> +		 * pageblock isolation could cause incorrect freepage or CMA
> +		 * accounting or HIGHATOMIC accounting.
>   		 *
>   		 * We don't want to hit this code for the more frequent
>   		 * low-order merging.
>   		 */
> -		if (unlikely(has_isolate_pageblock(zone))) {
> +		if (unlikely(has_non_fallback_pageblock(zone))) {
I'm not familiar with the code details, just wondering if this change 
would has side effects on cma
pageblock merging as it the condition stronger?

Thanks,
Eric
>   			int buddy_mt;
>   
>   			buddy_pfn = __find_buddy_pfn(pfn, order);
> @@ -1131,8 +1138,8 @@ static inline void __free_one_page(struct page *page,
>   			buddy_mt = get_pageblock_migratetype(buddy);
>   
>   			if (migratetype != buddy_mt
> -					&& (is_migrate_isolate(migratetype) ||
> -						is_migrate_isolate(buddy_mt)))
> +					&& (!migratetype_has_fallback(migratetype) ||
> +						!migratetype_has_fallback(buddy_mt)))
>   				goto done_merging;
>   		}
>   		max_order = order + 1;
> @@ -2483,6 +2490,7 @@ static int fallbacks[MIGRATE_TYPES][3] = {
>   	[MIGRATE_UNMOVABLE]   = { MIGRATE_RECLAIMABLE, MIGRATE_MOVABLE,   MIGRATE_TYPES },
>   	[MIGRATE_MOVABLE]     = { MIGRATE_RECLAIMABLE, MIGRATE_UNMOVABLE, MIGRATE_TYPES },
>   	[MIGRATE_RECLAIMABLE] = { MIGRATE_UNMOVABLE,   MIGRATE_MOVABLE,   MIGRATE_TYPES },
> +	[MIGRATE_HIGHATOMIC] = { MIGRATE_TYPES }, /* Never used */
>   #ifdef CONFIG_CMA
>   	[MIGRATE_CMA]         = { MIGRATE_TYPES }, /* Never used */
>   #endif
> @@ -2794,8 +2802,8 @@ static void reserve_highatomic_pageblock(struct page *page, struct zone *zone,
>   
>   	/* Yoink! */
>   	mt = get_pageblock_migratetype(page);
> -	if (!is_migrate_highatomic(mt) && !is_migrate_isolate(mt)
> -	    && !is_migrate_cma(mt)) {
> +	/* Only reserve normal pageblock */
> +	if (migratetype_has_fallback(mt)) {
>   		zone->nr_reserved_highatomic += pageblock_nr_pages;
>   		set_pageblock_migratetype(page, MIGRATE_HIGHATOMIC);
>   		move_freepages_block(zone, page, MIGRATE_HIGHATOMIC, NULL);
> @@ -3544,8 +3552,8 @@ int __isolate_free_page(struct page *page, unsigned int order)
>   		struct page *endpage = page + (1 << order) - 1;
>   		for (; page < endpage; page += pageblock_nr_pages) {
>   			int mt = get_pageblock_migratetype(page);
> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
> -			    && !is_migrate_highatomic(mt))
> +			/* Only change normal pageblock */
> +			if (migratetype_has_fallback(mt))
>   				set_pageblock_migratetype(page,
>   							  MIGRATE_MOVABLE);
>   		}

