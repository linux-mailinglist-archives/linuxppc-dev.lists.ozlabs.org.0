Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id F03EF48C2BE
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 12:02:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JYl595LZVz30DN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Jan 2022 22:02:21 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDKZgegZ;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDKZgegZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=gDKZgegZ; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=gDKZgegZ; 
 dkim-atps=neutral
X-Greylist: delayed 405 seconds by postgrey-1.36 at boromir;
 Wed, 12 Jan 2022 22:01:46 AEDT
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JYl4V0mkZz2x9p
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 22:01:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641985301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/XZEAdk6QhvWrbmCBXkp2EEmuq+KMqsHqxGoGIR2UA=;
 b=gDKZgegZNFgx+n0cfX0mkQlNnH7cGccrxGMkLGvVBKDcR1fLslh/6vpvGhvIuxth4Hi4fg
 z3QQuXp8CxKi+yJg1j2eu/kDo0Zjz9qVQzV0iV5UFNBcxOare7VozVwmqKCz2KWwQfCVWw
 M3rOJl5XITk6jqK16aYeeT4CwQwB2uQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641985301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8/XZEAdk6QhvWrbmCBXkp2EEmuq+KMqsHqxGoGIR2UA=;
 b=gDKZgegZNFgx+n0cfX0mkQlNnH7cGccrxGMkLGvVBKDcR1fLslh/6vpvGhvIuxth4Hi4fg
 z3QQuXp8CxKi+yJg1j2eu/kDo0Zjz9qVQzV0iV5UFNBcxOare7VozVwmqKCz2KWwQfCVWw
 M3rOJl5XITk6jqK16aYeeT4CwQwB2uQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-179-vG5ZIrTCN4-Jm3SCVTQqYw-1; Wed, 12 Jan 2022 06:01:40 -0500
X-MC-Unique: vG5ZIrTCN4-Jm3SCVTQqYw-1
Received: by mail-ed1-f72.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so1971542edz.1
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Jan 2022 03:01:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=8/XZEAdk6QhvWrbmCBXkp2EEmuq+KMqsHqxGoGIR2UA=;
 b=LtGqgMpCKXGJqXquIX+AmwnqaInMoxyKsfpzBErmogD6IwKdYGpTEKDFRuSe0hRZYO
 g7yWGVurom8AgKt1u5HLFvMv0/8Q8rFZ7XPeHCwJquK0TAXtKYxaLh4vb+ges1gGV3ZK
 612k7tuZnnpFF4ig/e5fjepuvGlRl/P4lkjTVldX9TIUPPi57T10s04G3BV4p/4jNeB3
 EuRxuQ4iaA4WDIuOuMkXsngZ2RIPYbRAnhF/ckdPXz0PIELOd73kAtNKMQ91f+cXW5nP
 AKE/999Q5UsKtgeWirWNIRovpjhZoVFpItuNtwCEPeK72vafT6EXJz7q0HkJlXQK9nzm
 ynAQ==
X-Gm-Message-State: AOAM531wjOXK8nDdqMrAAGaTYUMunAGbDqD/yhywgoMSZhjZwZ6u3VFn
 uIxc21FcVuD5FKqFd7/fTW5YWLZbq3jyE9Zi0hoGsO3lGr/eKjxGdEeM8Hc5jT2m74M2l3rHuLW
 xcDup5kJ6MgQ6HtyDM4VhLisAsQ==
X-Received: by 2002:a05:6402:4405:: with SMTP id
 y5mr8374677eda.179.1641985298941; 
 Wed, 12 Jan 2022 03:01:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxWWf+6A4h9fD+VcApry/1ctZSaWE5x9A2DNgQ1rynCwOFlVNP1wLYNq0HbTcp/3NUGR7KzoA==
X-Received: by 2002:a05:6402:4405:: with SMTP id
 y5mr8374660eda.179.1641985298747; 
 Wed, 12 Jan 2022 03:01:38 -0800 (PST)
Received: from ?IPV6:2003:cb:c702:4700:e25f:39eb:3cb8:1dec?
 (p200300cbc7024700e25f39eb3cb81dec.dip0.t-ipconnect.de.
 [2003:cb:c702:4700:e25f:39eb:3cb8:1dec])
 by smtp.gmail.com with ESMTPSA id 13sm4394200ejh.225.2022.01.12.03.01.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jan 2022 03:01:38 -0800 (PST)
Message-ID: <a5e029e8-f646-a414-f4f4-ba573171642f@redhat.com>
Date: Wed, 12 Jan 2022 12:01:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 2/8] mm: compaction: handle non-lru compound pages
 properly in isolate_migratepages_block().
To: Zi Yan <ziy@nvidia.com>, linux-mm@kvack.org
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-3-zi.yan@sent.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220105214756.91065-3-zi.yan@sent.com>
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
> In isolate_migratepages_block(), a !PageLRU tail page can be encountered
> when the page is larger than a pageblock. Use compound head page for the
> checks inside and skip the entire compound page when isolation succeeds.
> 

This will currently never happen, due to the way we always isolate
MAX_ORDER -1 ranges, correct?

Better note that in the patch description, because currently it reads
like it's an actual fix "can be encountered".

> Signed-off-by: Zi Yan <ziy@nvidia.com>
> ---
>  mm/compaction.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/compaction.c b/mm/compaction.c
> index b4e94cda3019..ad9053fbbe06 100644
> --- a/mm/compaction.c
> +++ b/mm/compaction.c
> @@ -979,19 +979,23 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>  		 * Skip any other type of page
>  		 */
>  		if (!PageLRU(page)) {
> +			struct page *head = compound_head(page);
>  			/*
>  			 * __PageMovable can return false positive so we need
>  			 * to verify it under page_lock.
>  			 */
> -			if (unlikely(__PageMovable(page)) &&
> -					!PageIsolated(page)) {
> +			if (unlikely(__PageMovable(head)) &&
> +					!PageIsolated(head)) {
>  				if (locked) {
>  					unlock_page_lruvec_irqrestore(locked, flags);
>  					locked = NULL;
>  				}
>  
> -				if (!isolate_movable_page(page, isolate_mode))
> +				if (!isolate_movable_page(head, isolate_mode)) {
> +					low_pfn += (1 << compound_order(head)) - 1 - (page - head);
> +					page = head;
>  					goto isolate_success;
> +				}
>  			}
>  
>  			goto isolate_fail;


-- 
Thanks,

David / dhildenb

