Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 42EF4471E54
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:49:31 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0FP0Vmgz3ckf
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:49:29 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=f9zXHqfl;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::42b;
 helo=mail-pf1-x42b.google.com; envelope-from=renzhengeek@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=f9zXHqfl; dkim-atps=neutral
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9NT11DN2z2yHM
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 18:53:56 +1100 (AEDT)
Received: by mail-pf1-x42b.google.com with SMTP id i12so7757310pfd.6
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 23:53:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=ijVBfG1KG/aW/R5+/Gi9cb70eNCVtOkQHVClSlu2XwQ=;
 b=f9zXHqflj7w8rm18C9SRhCSZ0h8uljnpXHk4Vjg37Ib9U6eihTWF8OGGbBbjwovGIt
 WdIAiNb9SNj9vX3/WkE92YG6UOQugvY0wWCTFxfzKL15NKrL4ZQ0uOJvhbWqYEwCfDb+
 G8NUmHY1ychu8qM/0vvRjYBeLSJ92mS9HJ+K6eFJUgLaoCZeHFNNzpVRLU20oxHAz7oL
 6XRb0fJAxHVDdAaUw2xEE3YbeilVIptXXXfmGnzvQKXqOs4PEgYz5Y26V3rag1Fz5q70
 NwCHGKIS6EwduXaYhhahvciWp9RERZCsFd5bJ93Wmf7yqZ3CPDLzKlK7t5ozokyrtfAg
 Jh6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=ijVBfG1KG/aW/R5+/Gi9cb70eNCVtOkQHVClSlu2XwQ=;
 b=lOF6lgYFpVeMLu6J53pmNAppObRfzHC8sMINDMfvo5ELb/chBpLYnXrasW+rWmMG6H
 TkwSKuTA2vi7crxJ/y19C66Yq1s3a15REa5T09Qj0blK3yNQs5paTAq5B/3ctMR5k9U9
 jyOhEdghr9QNklxkh0Gou2bPuIyRdfnMhqw+d4NTLCqtUHlrXGDtWW5pKjEQH5afIEXz
 Hn+U9HbDL0cF1a5rKuD4oLb1tecKilmjprEzOBoVXdceLX2mpWF8yh9DS23g1jLuV/Ml
 WkV5mnvOeEhIuJJheoasG9m6ibtRM0C3BhE0Wr5BZ42YpKg5iQcuKvPcc4tyHgxyzHOT
 ZPQA==
X-Gm-Message-State: AOAM530BdHcZmvADBuUQ2myiA5MOaBc5EDOGWdaeKJ6zvZXBDb1zYDFs
 x2wzasKbWaawbmw5FzQhbtU=
X-Google-Smtp-Source: ABdhPJwiYQdsfZBv/0L8jEVNhWHsAYR27PUBucnpzzQOeWrnW8MMFcsmzH8CePs6w6mAE1aeqGTsGw==
X-Received: by 2002:a65:5c82:: with SMTP id a2mr39036759pgt.370.1639122833431; 
 Thu, 09 Dec 2021 23:53:53 -0800 (PST)
Received: from [30.240.98.4] ([205.204.117.108])
 by smtp.gmail.com with ESMTPSA id bt2sm1733596pjb.57.2021.12.09.23.53.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 23:53:52 -0800 (PST)
Message-ID: <84807a03-f7d1-83cb-16df-bacc58de4529@gmail.com>
Date: Fri, 10 Dec 2021 15:53:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [RFC PATCH v2 3/7] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
References: <20211209230414.2766515-1-zi.yan@sent.com>
 <20211209230414.2766515-4-zi.yan@sent.com>
From: Eric Ren <renzhengeek@gmail.com>
In-Reply-To: <20211209230414.2766515-4-zi.yan@sent.com>
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
> alloc_migration_target() is used by alloc_contig_range() and non-LRU
> movable compound pages can be migrated. Current code does not allocate the
> right page size for such pages. Check THP precisely using
> is_transparent_huge() and add allocation support for non-LRU compound
> pages.
Could you elaborate on why the current code doesn't get the right size?  
how this patch fixes it.

The description sounds like it's an existing bug, if so, the patch 
subject should be changed to
"Fixes ..."?

>
> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>   mm/migrate.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/mm/migrate.c b/mm/migrate.c
> index d487a399253b..2ce3c771b1de 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -1563,7 +1563,7 @@ struct page *alloc_migration_target(struct page *page, unsigned long private)
>   		return alloc_huge_page_nodemask(h, nid, mtc->nmask, gfp_mask);
>   	}
>   
> -	if (PageTransHuge(page)) {
> +	if (is_transparent_hugepage(page)) {
>   		/*
>   		 * clear __GFP_RECLAIM to make the migration callback
>   		 * consistent with regular THP allocations.
> @@ -1572,13 +1572,17 @@ struct page *alloc_migration_target(struct page *page, unsigned long private)
if (PageTransHuge(page)) {  // just give more code context
...
>   		gfp_mask |= GFP_TRANSHUGE;
>   		order = HPAGE_PMD_ORDER;
order assigned here
>   	}
> +	if (PageCompound(page)) {
> +		gfp_mask |= __GFP_COMP;
> +		order = compound_order(page);
re-assinged again as THP is a compound page?

Thanks,
Eric
> +	}
>   	zidx = zone_idx(page_zone(page));
>   	if (is_highmem_idx(zidx) || zidx == ZONE_MOVABLE)
>   		gfp_mask |= __GFP_HIGHMEM;
>   
>   	new_page = __alloc_pages(gfp_mask, order, nid, mtc->nmask);
>   
> -	if (new_page && PageTransHuge(new_page))
> +	if (new_page && is_transparent_hugepage(page))
>   		prep_transhuge_page(new_page);
>   
>   	return new_page;

