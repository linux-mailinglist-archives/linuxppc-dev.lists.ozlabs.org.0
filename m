Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F9ED452D67
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 09:59:20 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Htg3V2jMZz2yQ5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 19:59:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GKPrXl6v;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=GKPrXl6v;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=216.205.24.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=GKPrXl6v; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=GKPrXl6v; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Htg2j72VJz2xB4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 19:58:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637053110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4284vAzYHLAxGcEEtHPUG4T3Bgo3Ms3nj1In/yM7t9U=;
 b=GKPrXl6vwiwXzO03/cBEZCev0l9+HPVzGI+vuHZcwXA5HhtoAq8mvtvdotCXOqGeB4C8XO
 bmTeAj7fRz3gpzkqB4Rnb6fu72Pe75hfRSLusAGlXUqMrj+GBjsWLiaytwaqZzGyixheAl
 WO2y/K+BUz/8a5c91o4DYkMUrGhneNE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637053110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4284vAzYHLAxGcEEtHPUG4T3Bgo3Ms3nj1In/yM7t9U=;
 b=GKPrXl6vwiwXzO03/cBEZCev0l9+HPVzGI+vuHZcwXA5HhtoAq8mvtvdotCXOqGeB4C8XO
 bmTeAj7fRz3gpzkqB4Rnb6fu72Pe75hfRSLusAGlXUqMrj+GBjsWLiaytwaqZzGyixheAl
 WO2y/K+BUz/8a5c91o4DYkMUrGhneNE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-TTXk8DRbNXOSqgT-XpDSHg-1; Tue, 16 Nov 2021 03:58:26 -0500
X-MC-Unique: TTXk8DRbNXOSqgT-XpDSHg-1
Received: by mail-wr1-f69.google.com with SMTP id
 d7-20020a5d6447000000b00186a113463dso4290642wrw.10
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Nov 2021 00:58:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=4284vAzYHLAxGcEEtHPUG4T3Bgo3Ms3nj1In/yM7t9U=;
 b=CBZ87V5IcNuyrJuaOFArJmVQk9Ofca9VdIEbyLArmMGjltLKPbL/KIGAWBGQZ52LId
 ntUOQEMVor8Srio8LAdISN4+l+0rBcPXWcuvYhrz2wxlX5D+hFFQkFWolbFaKRfkXjDx
 SNqreDBIhM+uUpFIcpiGWP5Ood1ZBaY7KIw0OZ7na7M1GOWvuQ2i/HqBHt2dnzRvHjOn
 noFGYtE5vfjWPpg3gAoe3FQbQDh6Q/KeORcrcr+JNnFu8l4ZcQRvHlhNVzeEfWVdX0Oz
 lljbKMdB/USle6/2OwkN3lPapPCXG/QmDgsj/eJ1LtgjZU1O7UaJDPb8y0w6zbqTncMS
 MlGw==
X-Gm-Message-State: AOAM532czx5E95bgsUy3U1tiuIm6pfEFrQEDnZnGMy55dsdTMQnXP6Dh
 RGhsWiaGKGmA6fKdG1it2xOSGRGv1LqCB+ZJCst2a+jGlew+zkBXQh3BXOZbehtu4BgrZjg7/UD
 C7yPN2V4Y6cYX1cHFongxQ+gVBQ==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr7111267wrn.135.1637053105602; 
 Tue, 16 Nov 2021 00:58:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNnhYnmoiEKmhWbgITaAMbH06RYzALBRVXN/xZ5keEiGtxNnsHeJdzCkwXHAfqWjFKt7cxCw==
X-Received: by 2002:adf:e8c8:: with SMTP id k8mr7111233wrn.135.1637053105277; 
 Tue, 16 Nov 2021 00:58:25 -0800 (PST)
Received: from [192.168.3.132] (p4ff23d3a.dip0.t-ipconnect.de. [79.242.61.58])
 by smtp.gmail.com with ESMTPSA id
 r17sm2015005wmq.11.2021.11.16.00.58.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 00:58:24 -0800 (PST)
Message-ID: <d19fb078-cb9b-f60f-e310-fdeea1b947d2@redhat.com>
Date: Tue, 16 Nov 2021 09:58:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20211115193725.737539-1-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [RFC PATCH 0/3] Use pageblock_order for cma and
 alloc_contig_range alignment.
In-Reply-To: <20211115193725.737539-1-zi.yan@sent.com>
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
Cc: Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 15.11.21 20:37, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> Hi David,

Hi,

thanks for looking into this.

> 
> You suggested to make alloc_contig_range() deal with pageblock_order instead of
> MAX_ORDER - 1 and get rid of MAX_ORDER - 1 dependency in virtio_mem[1]. This
> patchset is my attempt to achieve that. Please take a look and let me know if
> I am doing it correctly or not.
> 
> From what my understanding, cma required alignment of
> max(MAX_ORDER - 1, pageblock_order), because when MIGRATE_CMA was introduced,
> __free_one_page() does not prevent merging two different pageblocks, when
> MAX_ORDER - 1 > pageblock_order. But current __free_one_page() implementation
> does prevent that. It should be OK to just align cma to pageblock_order.
> alloc_contig_range() relies on MIGRATE_CMA to get free pages, so it can use
> pageblock_order as alignment too.

I wonder if that's sufficient. Especially the outer_start logic in
alloc_contig_range() might be problematic. There are some ugly corner
cases with free pages/allocations spanning multiple pageblocks and we
only isolated a single pageblock.


Regarding CMA, we have to keep the following cases working:

a) Different pageblock types (MIGRATE_CMA and !MIGRATE_CMA) in MAX_ORDER
   - 1 page:
   [       MAX_ ORDER - 1     ]
   [ pageblock 0 | pageblock 1]

Assume either pageblock 0 is MIGRATE_CMA or pageblock 1 is MIGRATE_CMA,
but not both. We have to make sure alloc_contig_range() keeps working
correctly. This should be the case even with your change, as we won't
merging pages accross differing migratetypes.

b) Migrating/freeing a MAX_ ORDER - 1 page while partially isolated:
   [       MAX_ ORDER - 1     ]
   [ pageblock 0 | pageblock 1]

Assume both are MIGRATE_CMA. Assume we want to either allocate from
pageblock 0 or pageblock 1. Especially, assume we want to allocate from
pageblock 1. While we would isolate pageblock 1, we wouldn't isolate
pageblock 0.

What happens if we either have a free page spanning the MAX_ORDER - 1
range already OR if we have to migrate a MAX_ORDER - 1 page, resulting
in a free MAX_ORDER - 1 page of which only the second pageblock is
isolated? We would end up essentially freeing a page that has mixed
pageblocks, essentially placing it in !MIGRATE_ISOLATE free lists ... I
might be wrong but I have the feeling that this would be problematic.

c) Concurrent allocations:
    [       MAX_ ORDER - 1     ]
    [ pageblock 0 | pageblock 1]

Assume b) but we have two concurrent CMA allocations to pageblock 0 and
pageblock 1, which would now be possible as start_isolate_page_range()
isolate would succeed on both.


Regarding virtio-mem, we care about the following cases:

a) Allocating parts from completely movable MAX_ ORDER - 1 page:
   [       MAX_ ORDER - 1     ]
   [ pageblock 0 | pageblock 1]

Assume pageblock 0 and pageblock 1 are either free or contain only
movable pages. Assume we allocated pageblock 0. We have to make sure we
can allocate pageblock 1. The other way around, assume we allocated
pageblock 1, we have to make sure we can allocate pageblock 0.

Free pages spanning both pageblocks might be problematic.

b) Allocate parts of partially movable MAX_ ORDER - 1 page:
   [       MAX_ ORDER - 1     ]
   [ pageblock 0 | pageblock 1]

Assume pageblock 0 contains unmovable data but pageblock 1 not: we have
to make sure we can allocate pageblock 1. Similarly, assume pageblock 1
contains unmovable data but pageblock 0 no: we have to make sure we can
allocate pageblock 1. has_unmovable_pages() might allow for that.

But, we want to fail early in case we want to allocate a single
pageblock but it contains unmovable data. This could be either directly
or indirectly.

If we have an unmovable (compound) MAX_ ORDER - 1 and we'd try isolating
pageblock 1, has_unmovable_pages() would always return "false" because
we'd simply be skiping over any tail pages, and not detect the
un-movability.

c) Migrating/freeing a MAX_ ORDER - 1 page while partially isolated:

Same concern as for CMA b)


So the biggest concern I have is dealing with migrating/freeing >
pageblock_order pages while only having isolated a single pageblock.

> 
> In terms of virtio_mem, if I understand correctly, it relies on
> alloc_contig_range() to obtain contiguous free pages and offlines them to reduce
> guest memory size. As the result of alloc_contig_range() alignment change,
> virtio_mem should be able to just align PFNs to pageblock_order.

For virtio-mem it will most probably be desirable to first try
allocating the MAX_ORDER -1 range if possible and then fallback to
pageblock_order. But that's an additional change on top in virtio-mem code.



My take to teach alloc_contig_range() to properly handle would be the
following:

a) Convert MIGRATE_ISOLATE into a separate pageblock flag

We would want to convert MIGRATE_ISOLATE into a separate pageblock
flags, such that when we isolate a page block we preserve the original
migratetype. While start_isolate_page_range() would set that bit,
undo_isolate_page_range() would simply clear that bit. The buddy would
use a single MIGRATE_ISOLATE queue as is: the original migratetype is
only used for restoring the correct migratetype. This would allow for
restoring e.g., MIGRATE_UNMOVABLE after isolating an unmovable pageblock
(below) and not simply setting all such pageblocks to MIGRATE_MOVABLE
when un-isolating.

Ideally, we'd get rid of the "migratetype" parameter for
alloc_contig_range(). However, even with the above change we have to
make sure that memory offlining and ordinary alloc_contig_range() users
will fail on MIGRATE_CMA pageblocks (has_unmovable_page() checks that as
of today). We could achieve that differently, though (e.g., bool
cma_alloc parameter instead).


b) Allow isolating pageblocks with unmovable pages

We'd pass the actual range of interest to start_isolate_page_range() and
rework the code to check has_unmovable_pages() only on the range of
interest, but considering overlapping larger allocations. E.g., if we
stumble over a compound page, lookup the head an test if that page is
movable/unmovable.

c) Change alloc_contig_range() to not "extend" the range of interest to
include pageblock of different type. Assume we're isolating a
MIGRATE_CMA pageblock, only isolate a neighboring MIGRATE_CMA pageblock,
not other pageblocks.


So we'd keep isolating complete MAX_ORDER - 1 pages unless c) prevents
it. We'd allow isolating even pageblocks that contain unmovable pages on
ZONE_NORMAL, and check via has_unmovable_pages() only if the range of
interest contains unmovable pages, not the whole MAX_ORDER -1 range or
even the whole pageblock. We'd not silently overwrite the pageblock type
when restoring but instead restore the old migratetype.

-- 
Thanks,

David / dhildenb

