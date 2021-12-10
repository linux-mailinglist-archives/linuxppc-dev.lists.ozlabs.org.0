Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA1F4708F8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 10 Dec 2021 19:37:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J9flK4rJ9z3cQ8
	for <lists+linuxppc-dev@lfdr.de>; Sat, 11 Dec 2021 05:37:17 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6NhXiAs;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6NhXiAs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=h6NhXiAs; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=h6NhXiAs; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J9fkZ1YSPz3bXV
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 11 Dec 2021 05:36:35 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639161392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuZMXUxnRYoJ6fczszwwZGhWUdbXILWisTJH5f1GF3o=;
 b=h6NhXiAshx8h8AMhcEyh3d83NUqUTc3SmcpEn9D/1fotKZTJDAhrUEBFZcmGXn6gJtY7jh
 4VQ4adoG4pSeupPe7G/RAT8PRGQgHnzvhDOqQIjGMkSPxM30LQTBlDb7kUrbJpVjbvmEa5
 1cTohojE+8jZ45ix+/DCBS4+vG0nGNo=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639161392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UuZMXUxnRYoJ6fczszwwZGhWUdbXILWisTJH5f1GF3o=;
 b=h6NhXiAshx8h8AMhcEyh3d83NUqUTc3SmcpEn9D/1fotKZTJDAhrUEBFZcmGXn6gJtY7jh
 4VQ4adoG4pSeupPe7G/RAT8PRGQgHnzvhDOqQIjGMkSPxM30LQTBlDb7kUrbJpVjbvmEa5
 1cTohojE+8jZ45ix+/DCBS4+vG0nGNo=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-340-fuoobdtSP8KDsf4oCIP-pA-1; Fri, 10 Dec 2021 13:36:31 -0500
X-MC-Unique: fuoobdtSP8KDsf4oCIP-pA-1
Received: by mail-wm1-f70.google.com with SMTP id
 g81-20020a1c9d54000000b003330e488323so3304297wme.0
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 10 Dec 2021 10:36:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=UuZMXUxnRYoJ6fczszwwZGhWUdbXILWisTJH5f1GF3o=;
 b=EaH9mArEKcbx2NsJDB5SPJmBZni/gfjzjLAcNJ5UEXkhyVyRlJHA9Bq9pRnJpTePd6
 DWbXdNwO460NRCQTHHdOVYHgElabNNXywWcv6cDBjV80YRN3AfNvYM4qei+0uDdakt8N
 uE9Hi9laB6duKT7MQGdv8kvb/DLYkL/X23nwSfFLiUtqCuSmpK1BLg8LRDsJGVrIFGyf
 GS4dgWS3uFi7vjUNEIG6Wx0lKXLTfvCmgp1377D4TW8VyaA9nHitiCUJIhC/IC1x7q2k
 ftcphQxtJPqfQqiJwFQR4FWXFQZtfcr7jdBmVxaHL0fH4UM28Z2EHH8VXtxZq4MmJY1S
 DeJw==
X-Gm-Message-State: AOAM531Dq0XJv9mTvI5r2FTdhKHqVQyvEEHdvwcX7SvWHWpY8Uyygp59
 wkAKtIH8gfNLWMaDDXW9onwSQmf7G6vPdAfO/RsvnhnBYDolevdohps2ndn0w2aDUxdxkdPSTRa
 D3MVwyCkVseIeYjI9LKM4cWLJrw==
X-Received: by 2002:a1c:2397:: with SMTP id
 j145mr18630565wmj.113.1639161389938; 
 Fri, 10 Dec 2021 10:36:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxnE6mECpT6/x+6acEXXbzAagez4dMgCo4uhwD9w2DwYFQ/4FPaugRFXQx4gh8a1gwW+xf9tQ==
X-Received: by 2002:a1c:2397:: with SMTP id
 j145mr18630532wmj.113.1639161389702; 
 Fri, 10 Dec 2021 10:36:29 -0800 (PST)
Received: from [192.168.3.132] (p5b0c60f8.dip0.t-ipconnect.de. [91.12.96.248])
 by smtp.gmail.com with ESMTPSA id
 v8sm3098510wrd.84.2021.12.10.10.36.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Dec 2021 10:36:29 -0800 (PST)
Message-ID: <19404189-3bee-c02a-a596-2e5564e0f8f5@redhat.com>
Date: Fri, 10 Dec 2021 19:36:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 0/7] Use pageblock_order for cma and
 alloc_contig_range alignment.
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20211209230414.2766515-1-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20211209230414.2766515-1-zi.yan@sent.com>
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

On 10.12.21 00:04, Zi Yan wrote:
> From: Zi Yan <ziy@nvidia.com>
> 
> Hi all,

Hi,

thanks for working on that!

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
> 2. but saves the pageblock migratetypes outside the specified range of
>    alloc_contig_range() and restores them after all pages within the range
>    become free after __alloc_contig_migrate_range();
> 3. splits free pages spanning multiple pageblocks at the beginning and the end
>    of the range and puts the split pages to the right migratetype free lists
>    based on the pageblock migratetypes;
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
>    range during isolation to increase successful rate of alloc_contig_range().

The issue with virtio-mem is that we'll need that as soon as we change
the granularity to pageblocks, because otherwise, you can heavily
degrade unplug reliably in sane setups:

Previous:
* Try unplug free 4M range (2 pageblocks): succeeds

Now:
* Try unplug 2M range (first pageblock): succeeds.
* Try unplug next 2M range (second pageblock): fails because first
contains unmovable allcoations.

-- 
Thanks,

David / dhildenb

