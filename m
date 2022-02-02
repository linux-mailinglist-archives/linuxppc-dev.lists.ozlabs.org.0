Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CDD64A70BB
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 13:26:26 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JpgyS0NBKz3cD1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Feb 2022 23:26:24 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4SWGD+b;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4SWGD+b;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.133.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=O4SWGD+b; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=O4SWGD+b; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Jpgxd0wPsz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Feb 2022 23:25:38 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643804733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Riry/Ie+x1sinW7wNxc+GkihNaf8lfeZqesrgvEVnb0=;
 b=O4SWGD+b/2ln9MnRfZhsEpgO0IVa0dPrOXW5i/TtBfjqvj0EeDNWCgvji+c/Cfb8HLZvGH
 9QewEbyg+IVd1a4MtzPOXaZQrLWkE8bZVrDqagt86Ylvnp7HSyUeuh/UDG5B1KY0dSkfdq
 KN8Z96Ysti+adfIlW9J7nDDiIOMN0V8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643804733;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Riry/Ie+x1sinW7wNxc+GkihNaf8lfeZqesrgvEVnb0=;
 b=O4SWGD+b/2ln9MnRfZhsEpgO0IVa0dPrOXW5i/TtBfjqvj0EeDNWCgvji+c/Cfb8HLZvGH
 9QewEbyg+IVd1a4MtzPOXaZQrLWkE8bZVrDqagt86Ylvnp7HSyUeuh/UDG5B1KY0dSkfdq
 KN8Z96Ysti+adfIlW9J7nDDiIOMN0V8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618-BDoXDr9EN266HVqbGmy1Cw-1; Wed, 02 Feb 2022 07:25:31 -0500
X-MC-Unique: BDoXDr9EN266HVqbGmy1Cw-1
Received: by mail-ej1-f72.google.com with SMTP id
 ky6-20020a170907778600b0068e4bd99fd1so8043023ejc.15
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 02 Feb 2022 04:25:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=Riry/Ie+x1sinW7wNxc+GkihNaf8lfeZqesrgvEVnb0=;
 b=fQOvhE6eIIYx/Mu7/15wRCm6PpMhtip/5ULRQZHL5IYrHoJzSi8xDQ1OUvzyhHIIHF
 tj9R5/p6PYSTgKM5vBAsrSzzou8A85Nz/WcwrqsSPgl7UfGnpHfqpoELaPhSI+KNXixZ
 OHZbGp1CLJ4Vom/dizkKCxHGJegD0xZcnMJYxcdsbSJcNbRcx9Xe87tEM8V6Tjdr3jfo
 FQ0ioamgTbnmugEfoaRQVD1oh9xSOP4gz0sHrhlO5Vt4d5JCXqcYbHc13WUfluu9ZhAZ
 OEOYvmbHYd0dmyS+Dl0WIGeS/5OGQH0IiD4h5hJBmC2AiU0RcugW5gADzOD/T4dFWpna
 7lbA==
X-Gm-Message-State: AOAM531FNuo9AYi/BVU4pLNUt9sylK0m6Bggh+avMRxnmddmYQlnvo9F
 XnzoB/iat/B7kHhUohp3a2k8uU1uE+rxXxlnJyqIxmXyqo2ude2FB8LsHVW58Z66Y3w8/WXeoAi
 EPZYqGX6zrWq2Y6RsA47+aQ9gZw==
X-Received: by 2002:a05:6402:7d0:: with SMTP id
 u16mr30060272edy.9.1643804730536; 
 Wed, 02 Feb 2022 04:25:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxgTNVg4PsKEjgBZhYvXrFMFKGRSAUL0S3jbEcFB9ylZ3e4FOsTEFQdbkPIWl6zZX7rsjy0bA==
X-Received: by 2002:a05:6402:7d0:: with SMTP id
 u16mr30060236edy.9.1643804730176; 
 Wed, 02 Feb 2022 04:25:30 -0800 (PST)
Received: from ?IPV6:2003:cb:c709:f800:a55c:e484:3cd9:3632?
 (p200300cbc709f800a55ce4843cd93632.dip0.t-ipconnect.de.
 [2003:cb:c709:f800:a55c:e484:3cd9:3632])
 by smtp.gmail.com with ESMTPSA id f6sm20889436edy.18.2022.02.02.04.25.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 04:25:29 -0800 (PST)
Message-ID: <21c196f8-18ca-d720-4241-00c9461854d3@redhat.com>
Date: Wed, 2 Feb 2022 13:25:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
To: Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>
References: <20220119190623.1029355-1-zi.yan@sent.com>
 <20220119190623.1029355-4-zi.yan@sent.com>
 <Yfp2rv0K6d3cNmwg@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 3/7] mm: page_isolation: check specified range for
 unmovable pages
In-Reply-To: <Yfp2rv0K6d3cNmwg@localhost.localdomain>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-mm@kvack.org, iommu@lists.linux-foundation.org,
 Eric Ren <renzhengeek@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 Christoph Hellwig <hch@lst.de>, Vlastimil Babka <vbabka@suse.cz>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 02.02.22 13:18, Oscar Salvador wrote:
> On Wed, Jan 19, 2022 at 02:06:19PM -0500, Zi Yan wrote:
>> From: Zi Yan <ziy@nvidia.com>
>>
>> Enable set_migratetype_isolate() to check specified sub-range for
>> unmovable pages during isolation. Page isolation is done
>> at max(MAX_ORDER_NR_PAEGS, pageblock_nr_pages) granularity, but not all
>> pages within that granularity are intended to be isolated. For example,
>> alloc_contig_range(), which uses page isolation, allows ranges without
>> alignment. This commit makes unmovable page check only look for
>> interesting pages, so that page isolation can succeed for any
>> non-overlapping ranges.
> 
> Another thing that came to my mind.
> Prior to this patch, has_unmovable_pages() was checking on pageblock
> granularity, starting at pfn#0 of the pageblock.
> With this patch, you no longer check on pageblock granularity, which
> means you might isolate a pageblock, but some pages that sneaked in
> might actually be unmovable.
> 
> E.g:
> 
> Let's say you have a pageblock that spans (pfn#512,pfn#1024),
> and you pass alloc_contig_range() (pfn#514,pfn#1024).
> has_unmovable_pages() will start checking the pageblock at pfn#514,
> and so it will mis pfn#512 and pfn#513. Isn't that a problem, if those
> pfn turn out to be actually unmovable?

That's the whole idea for being able to allocate parts of an unmovable
pageblock that are movable.

If the first part is unmovable but the second part is movable, nothing
should stop us from trying to allocate the second part.

Of course, we want to remember the original migratetype of the
pageblock, to restore that after isolation -- otherwise we'll end up
converting all such pageblocks to MIGRATE_MOVABLE. The next patch does
that IIRC.

However, devil is in the detail, and I still have to review those parts
of this series.


Note that there are no current users of alloc_contig_range() that
allocate < MAX_ORDER - 1 -- except CMA, but for CMA we immediately exit
has_unmovable_pages() either way.

-- 
Thanks,

David / dhildenb

