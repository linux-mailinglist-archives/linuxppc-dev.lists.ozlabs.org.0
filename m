Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1433648DB07
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 16:51:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZTSF71qzz30Ld
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jan 2022 02:51:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/jPNk5g;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/jPNk5g;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=e/jPNk5g; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=e/jPNk5g; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZTRX2D0Bz2ynQ
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jan 2022 02:50:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642089042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RQ3puUcYuHO/5UfsU4Xhhp2Gu/t2oxOAbK9fU144eE=;
 b=e/jPNk5gjuw13qCFd5Ck9QiAlJwHNKGLj5uxT4dLaZAYUejfIkfTssIthjIv4sInqYZtZS
 qoPm/c1Eyt3bvNcyhbJlzJqiAHLZfRnQextrjn/VzBBUBZAB6/sBmXxbg51pkSstAcvPbT
 OaIdQx0tUwcAh/Q7kgbuFr8GKcS7NSA=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642089042;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0RQ3puUcYuHO/5UfsU4Xhhp2Gu/t2oxOAbK9fU144eE=;
 b=e/jPNk5gjuw13qCFd5Ck9QiAlJwHNKGLj5uxT4dLaZAYUejfIkfTssIthjIv4sInqYZtZS
 qoPm/c1Eyt3bvNcyhbJlzJqiAHLZfRnQextrjn/VzBBUBZAB6/sBmXxbg51pkSstAcvPbT
 OaIdQx0tUwcAh/Q7kgbuFr8GKcS7NSA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-169-umCE4kdSPFimDdzCvAtvAw-1; Thu, 13 Jan 2022 10:50:40 -0500
X-MC-Unique: umCE4kdSPFimDdzCvAtvAw-1
Received: by mail-ed1-f70.google.com with SMTP id
 g11-20020a056402090b00b003f8fd1ac475so5757173edz.1
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 07:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=0RQ3puUcYuHO/5UfsU4Xhhp2Gu/t2oxOAbK9fU144eE=;
 b=pxxQ1EnjFvH/Qe+ruQ1arKT/0LKmPULQ0WXbdImmV0YjxHxQjRGJgsqkO/KJAjRYfF
 nrao11ekDe5iISqZaEC0g1gCvUvHmNwkBcFejk0Mbv5pdmT6WYhmDzUj1QZfLmoNgZZx
 Wuhdo0zCf4sJGNZLFuKB2L6A2XHXP8RYH+s5RDL2c8BgcKX/+4qFW7/OEm0WNoeFKmiP
 2T9kaF078NAYlxs88Mucqv8hlAhyitEROOr6wH7EjjhRUWqRJuNsSSKco+Bk2JIkA03c
 MVD3gARNgr0Fy4prhClqhaErxFqdj3YX8OfIzXSHo3Ul9KTkRD/XVNL/XAOJJTziqbqn
 nhpg==
X-Gm-Message-State: AOAM533gJoaB3lTix+PNZnXPrYBhBKDPBLOfoREv1UDEokIsgN36ESrK
 wZFVcKJA1NI6lJzlVRgYpoDSyIdTeqTuXg1T5crjV7hoMDOq4rkoB7zoNPEm3Ah8i3rxeq6xPUC
 W8iVE9hfBol/AIXU7bUOJ6HkUFg==
X-Received: by 2002:a05:6402:3588:: with SMTP id
 y8mr4824680edc.147.1642089039282; 
 Thu, 13 Jan 2022 07:50:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwNFlqW+90z8MqJGfmQJtPI4aVOG3CgxuC8pcaaa86GGnEzwNl0A4gvDtrNM26vya8mfn/rVA==
X-Received: by 2002:a05:6402:3588:: with SMTP id
 y8mr4824671edc.147.1642089039121; 
 Thu, 13 Jan 2022 07:50:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id qw4sm1026745ejc.55.2022.01.13.07.50.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 07:50:38 -0800 (PST)
Message-ID: <5da2e9ae-24bc-a146-053d-a43063bad73e@redhat.com>
Date: Thu, 13 Jan 2022 16:50:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 3/8] mm: migrate: allocate the right size of non
 hugetlb or THP compound pages.
To: Zi Yan <ziy@nvidia.com>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-4-zi.yan@sent.com>
 <970ca2a4-416d-7e8f-37c7-510c5b050f4b@redhat.com>
 <15E26B9B-8AE2-4916-94E7-D0BBB2491B1B@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <15E26B9B-8AE2-4916-94E7-D0BBB2491B1B@nvidia.com>
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

On 13.01.22 16:46, Zi Yan wrote:
> On 12 Jan 2022, at 6:04, David Hildenbrand wrote:
> 
>> On 05.01.22 22:47, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> alloc_migration_target() is used by alloc_contig_range() and non-LRU
>>> movable compound pages can be migrated. Current code does not allocate the
>>> right page size for such pages. Check THP precisely using
>>> is_transparent_huge() and add allocation support for non-LRU compound
>>> pages.
>>
>> IIRC, we don't have any non-lru migratable pages that are coumpound
>> pages. Read: not used and not supported :)
> 
> OK, but nothing prevents one writing a driver that allocates compound
> pages and provides address_space->migratepage() and address_space->isolate_page().
> 
> Actually, to test this series, I write a kernel module that allocates
> an order-10 page, gives it a fake address_space with migratepage() and
> isolate_page(), __SetPageMovable() on it, then call alloc_contig_range()
> on the page range. Apparently, my kernel module is not supported by
> the kernel, thus, I added this patch.
> 
> Do you have an alternative test to my kernel module, so that I do not
> even need this patch myself?
> 
>> Why is this required in the context of this series?
> 
> It might not be required. I will drop it.

That's why I think it would be best dropping it. If you need it in
different context, better submit it in different context.

Makes this series easier to digest :)


-- 
Thanks,

David / dhildenb

