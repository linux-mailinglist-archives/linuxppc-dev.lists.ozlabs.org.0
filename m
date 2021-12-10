Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCDA471E50
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Dec 2021 23:48:16 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JC0Cw0zR7z3bVC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 13 Dec 2021 09:48:12 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=gqnhaZdO;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::632;
 helo=mail-pl1-x632.google.com; envelope-from=renzhengeek@gmail.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20210112 header.b=gqnhaZdO; dkim-atps=neutral
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9Mxm0l3Hz2xsX
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 18:30:17 +1100 (AEDT)
Received: by mail-pl1-x632.google.com with SMTP id y8so5723984plg.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 09 Dec 2021 23:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:to:cc:references
 :from:in-reply-to:content-transfer-encoding;
 bh=kqdwZyEU31KaNW+cOFp1dor6RRAOvhH6zrtcJuFenfA=;
 b=gqnhaZdO12ibnFTEUYTRcyNDsVi4fZjKWuF1d+1IX2QtK+zXEl/CleEzgCXcZCKWk4
 DeGXeYahXgF25toJDTBvItitvosjjzyrdtCOfzBPXJUv2sNA46FGCrVbWvzev5Gqa7Ak
 meZ3c5sCNkdjOENTF0nlgXWFhqmZAwIOkT71xtM4OT2BCJb5l3qSGmgij0kaSHc39jlT
 lz+NQj74lZEDNXhnwDnJm6MBPftfgIEvxzLs37o6722DhjM05TgsyYdxT05vxKbTRo5c
 paO1XE+hWA5qYswHrUze+qL1vRsNsy/KmrR7y+w/OwTPs4iJXL+3vAPXn7Z6f5NDhlEr
 bj6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :to:cc:references:from:in-reply-to:content-transfer-encoding;
 bh=kqdwZyEU31KaNW+cOFp1dor6RRAOvhH6zrtcJuFenfA=;
 b=2FD4E9wwKMpuIcr6YzuoYA6fcEUAEysI9TdQiRXDcXyWc45NZC4bEU9nHr06E1C3i3
 cr/HCdwejLlJgyVe/sEuZriRoBPQM524vYHrbQ2StrXAym/V7AOR/y7dGgJ7wDvCHUrn
 xScuB6Sbu4XSjInBj1TGf3fx32vYpIsPwe97/8C1KnpBaRDMySZMZoAnBlSgirQHJbbC
 eoBo5qmxq/VAKe8XTMpMeiVDKkACLpHIR0yOBht9PWMDg1rwA6uJRYWjWmMiq/7YtgGZ
 Ewryzt+WW1lZXo1S4Rmjs/kOu1z6HV6l9FJPx79guq1o5XvL5dUx+K9DCpp6w7jGt0+Y
 crbw==
X-Gm-Message-State: AOAM533Al+/pDZcNexPu9LC6B90RmYns+eisVnJ4lBhZNs+1diBVrIq/
 hW+YkUO6wtD8qL3PZGL3t48=
X-Google-Smtp-Source: ABdhPJxRm9ttF7FhbBeprnb6+zsZD1lD+fI51oOUlTadE/AU/yNXP9DA3iOR8FWZWbadxSA9RFDXLw==
X-Received: by 2002:a17:902:f687:b0:141:cf6b:fee7 with SMTP id
 l7-20020a170902f68700b00141cf6bfee7mr71919578plg.75.1639121413466; 
 Thu, 09 Dec 2021 23:30:13 -0800 (PST)
Received: from [30.240.98.4] ([205.204.117.108])
 by smtp.gmail.com with ESMTPSA id c17sm185764pfc.163.2021.12.09.23.30.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 09 Dec 2021 23:30:13 -0800 (PST)
Message-ID: <07f11dfc-f491-3b08-a2cb-3c8f5a8102d3@gmail.com>
Date: Fri, 10 Dec 2021 15:30:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.2.1
Subject: Re: [RFC PATCH v2 0/7] Use pageblock_order for cma and
 alloc_contig_range alignment.
To: Zi Yan <ziy@nvidia.com>, David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org
References: <20211209230414.2766515-1-zi.yan@sent.com>
From: Eric Ren <renzhengeek@gmail.com>
In-Reply-To: <20211209230414.2766515-1-zi.yan@sent.com>
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

Hi Zi Yan,

On 2021/12/10 07:04, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
>
> Hi all,
>
> This patchset tries to remove the MAX_ORDER - 1 alignment requirement for CMA
> and alloc_contig_range(). It prepares for my upcoming changes to make MAX_ORDER
> adjustable at boot time[1].
>
> The MAX_ORDER - 1 alignment requirement comes from that alloc_contig_range()
> isolates pageblocks to remove free memory from buddy allocator but isolating
> only a subset of pageblocks within a page spanning across multiple pageblocks
> causes free page accounting issues. Isolated page might not be put into the
> right free list, since the code assumes the migratetype of the first pageblock
> as the whole free page migratetype. This is based on the discussion at [2].
>
> To remove the requirement, this patchset:
> 1. still isolates pageblocks at MAX_ORDER - 1 granularity;
Then, unplug fails if either pageblock of the  MAX_ORDER - 1 page has 
unmovable page, right?

Thanks,
Eric
> 2. but saves the pageblock migratetypes outside the specified range of
>     alloc_contig_range() and restores them after all pages within the range
>     become free after __alloc_contig_migrate_range();
> 3. splits free pages spanning multiple pageblocks at the beginning and the end
>     of the range and puts the split pages to the right migratetype free lists
>     based on the pageblock migratetypes;
> 4. returns pages not in the range as it did before this patch.
>
> Isolation needs to happen at MAX_ORDER - 1 granularity, because otherwise
> 1) extra code is needed to detect pages (free, PageHuge, THP, or PageCompound)
> to make sure all pageblocks belonging to a single page are isolated together
> and later pageblocks outside the range need to have their migratetypes restored;
> or 2) extra logic will need to be added during page free time to split a free
> page with multi-migratetype pageblocks.
>
> Two optimizations might come later:
> 1. only check unmovable pages within the range instead of MAX_ORDER - 1 aligned
>     range during isolation to increase successful rate of alloc_contig_range().
> 2. make MIGRATE_ISOLATE a separate bit to avoid saving and restoring existing
>     migratetypes before and after isolation respectively.
>
> Feel free to give comments and suggestions. Thanks.
>
>
> [1] https://lore.kernel.org/linux-mm/20210805190253.2795604-1-zi.yan@sent.com/
> [2] https://lore.kernel.org/linux-mm/d19fb078-cb9b-f60f-e310-fdeea1b947d2@redhat.com/
>
>
> Zi Yan (7):
>    mm: page_alloc: avoid merging non-fallbackable pageblocks with others.
>    mm: compaction: handle non-lru compound pages properly in
>      isolate_migratepages_block().
>    mm: migrate: allocate the right size of non hugetlb or THP compound
>      pages.
>    mm: make alloc_contig_range work at pageblock granularity
>    mm: cma: use pageblock_order as the single alignment
>    drivers: virtio_mem: use pageblock size as the minimum virtio_mem
>      size.
>    arch: powerpc: adjust fadump alignment to be pageblock aligned.
>
>   arch/powerpc/include/asm/fadump-internal.h |   4 +-
>   drivers/virtio/virtio_mem.c                |   6 +-
>   include/linux/mmzone.h                     |  11 +-
>   kernel/dma/contiguous.c                    |   2 +-
>   mm/cma.c                                   |   6 +-
>   mm/compaction.c                            |  10 +-
>   mm/migrate.c                               |   8 +-
>   mm/page_alloc.c                            | 203 +++++++++++++++++----
>   8 files changed, 196 insertions(+), 54 deletions(-)
>

