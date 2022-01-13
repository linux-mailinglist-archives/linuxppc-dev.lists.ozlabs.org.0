Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C53B48D7ED
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 13:29:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JZNyh68cBz3bSx
	for <lists+linuxppc-dev@lfdr.de>; Thu, 13 Jan 2022 23:29:00 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Ip5xELiB;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=TL7hThfy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256
 header.s=mimecast20190719 header.b=Ip5xELiB; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.a=rsa-sha256 header.s=mimecast20190719 header.b=TL7hThfy; 
 dkim-atps=neutral
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4JZNxx6CNpz2xXy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 23:28:19 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642076895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnfVK2fyY9BtL+cahlLSPFYi/lDkJGG3ZpACsVHPbRc=;
 b=Ip5xELiBEHUKiYPVrIoC3pU9Z/VdsZP/Ndu+CaLS8NmmuiBVqmYRtTKxh3ZOzKgeBK4ZD9
 BXrdIpcfU8xyXxGzWOgybyIE+Y+4OksWe8NbK0Msw89j4cz5Y6M/+Ci7etCjwj3F2Hu668
 NWVtjvQupIg2STvodZ0P/ecMKizzKR4=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642076896;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hnfVK2fyY9BtL+cahlLSPFYi/lDkJGG3ZpACsVHPbRc=;
 b=TL7hThfyjyBwXiO0dGTq2AMANpW8P5G+xERe7lLWciKIhDveB7YGEjpc8Kzwir0q3TihLk
 cT5FWk3ihV0BIz3Xfxk8BAKJchU9fu4+ZAchHgS8Q8be7AYp8mycnja3Z/PVPDRViYpCSu
 /NoSVMosJjzzZDIGsfJP6aX+TTSHTNk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-439-6_vWg4ziNh2iSYM4thz5cw-1; Thu, 13 Jan 2022 07:28:14 -0500
X-MC-Unique: 6_vWg4ziNh2iSYM4thz5cw-1
Received: by mail-ed1-f70.google.com with SMTP id
 i9-20020a05640242c900b003fe97faab62so5167632edc.9
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 13 Jan 2022 04:28:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=hnfVK2fyY9BtL+cahlLSPFYi/lDkJGG3ZpACsVHPbRc=;
 b=tyDWj6UBUD4jCrH3/wvaw13IDfcLIJoHMT9bqxXRxo8ou6QW4Cp5IwzDXpCen5fRoZ
 02FffT4Wf/hGiHQ5xjCV8ooKuwpGSM3e8IdbEj4H0nwwkqSuvHSDWeg8U5pz2cSA3rsT
 /WBT03O746J0SfjNnuuZZk+UpjMj/1fpmaAPrkGHgBcz2iBx84sYd4Z4bUdPisgZSFjL
 q4M6tsc+9ZFRUxAqzvCKuW//84Y0mCgPVrSmlNfVXsdjNjduB51hCJMzi9d5YqwDsEmK
 dnN1R42nhVUhWUmQGtmutbOqnMO2bgxIcydmNKBHcirR4TAUQEoGffH6FO3llh5jnhju
 32yw==
X-Gm-Message-State: AOAM532KpP6XdT9UPgbMaiZKmm+70WgjxUS9YmV6je2MmpiTEHfm+1on
 3wsgdPrtooqxBPj9htnvC62JdAwv/BzMkpxa+vm3kJNtZ+peh11J9W1Mx9v/uNNb55L1Nl7xZlu
 BDcJczuS4kNfqzkgxOfyhVgqZ8g==
X-Received: by 2002:a50:8d16:: with SMTP id s22mr3857828eds.141.1642076893362; 
 Thu, 13 Jan 2022 04:28:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyzDUme++gR+E7EfrqgLj1iyeR0r4RpB81KvaPod0mEHW3Q7ncqa9lY+1sUM8bAVvrgQ/bdNg==
X-Received: by 2002:a50:8d16:: with SMTP id s22mr3857806eds.141.1642076893116; 
 Thu, 13 Jan 2022 04:28:13 -0800 (PST)
Received: from ?IPV6:2003:cb:c703:e200:8511:ed0f:ac2c:42f7?
 (p200300cbc703e2008511ed0fac2c42f7.dip0.t-ipconnect.de.
 [2003:cb:c703:e200:8511:ed0f:ac2c:42f7])
 by smtp.gmail.com with ESMTPSA id la21sm830830ejc.137.2022.01.13.04.28.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 13 Jan 2022 04:28:12 -0800 (PST)
Message-ID: <ae2862a0-c39c-ed2f-23fe-510c6c2fad5c@redhat.com>
Date: Thu, 13 Jan 2022 13:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [RFC PATCH v3 1/8] mm: page_alloc: avoid merging non-fallbackable
 pageblocks with others.
To: Mike Rapoport <rppt@kernel.org>
References: <20220105214756.91065-1-zi.yan@sent.com>
 <20220105214756.91065-2-zi.yan@sent.com>
 <7dc078ef-70f4-159e-b928-34f0fb0ffaea@redhat.com>
 <YeAO0vtyjWWMRliF@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <YeAO0vtyjWWMRliF@kernel.org>
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
Cc: Mel Gorman <mgorman@techsingularity.net>, Eric Ren <renzhengeek@gmail.com>,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 iommu@lists.linux-foundation.org, Zi Yan <ziy@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
 Vlastimil Babka <vbabka@suse.cz>, Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13.01.22 12:36, Mike Rapoport wrote:
> On Wed, Jan 12, 2022 at 11:54:49AM +0100, David Hildenbrand wrote:
>> On 05.01.22 22:47, Zi Yan wrote:
>>> From: Zi Yan <ziy@nvidia.com>
>>>
>>> This is done in addition to MIGRATE_ISOLATE pageblock merge avoidance.
>>> It prepares for the upcoming removal of the MAX_ORDER-1 alignment
>>> requirement for CMA and alloc_contig_range().
>>>
>>> MIGRARTE_HIGHATOMIC should not merge with other migratetypes like
>>> MIGRATE_ISOLATE and MIGRARTE_CMA[1], so this commit prevents that too.
>>> Also add MIGRARTE_HIGHATOMIC to fallbacks array for completeness.
>>>
>>> [1] https://lore.kernel.org/linux-mm/20211130100853.GP3366@techsingularity.net/
>>>
>>> Signed-off-by: Zi Yan <ziy@nvidia.com>
>>> ---
>>>  include/linux/mmzone.h |  6 ++++++
>>>  mm/page_alloc.c        | 28 ++++++++++++++++++----------
>>>  2 files changed, 24 insertions(+), 10 deletions(-)
>>>
> 
> ...
> 
>>> @@ -3545,8 +3553,8 @@ int __isolate_free_page(struct page *page, unsigned int order)
>>>  		struct page *endpage = page + (1 << order) - 1;
>>>  		for (; page < endpage; page += pageblock_nr_pages) {
>>>  			int mt = get_pageblock_migratetype(page);
>>> -			if (!is_migrate_isolate(mt) && !is_migrate_cma(mt)
>>> -			    && !is_migrate_highatomic(mt))
>>> +			/* Only change normal pageblock */
>>> +			if (migratetype_has_fallback(mt))
>>>  				set_pageblock_migratetype(page,
>>>  							  MIGRATE_MOVABLE);
>>>  		}
>>
>> That part is a nice cleanup IMHO. Although the "has fallback" part is a
>> bit imprecise. "migratetype_is_mergable()" might be a bit clearer.
>> ideally "migratetype_is_mergable_with_other_types()". Can we come up
>> with a nice name for that?
> 
> migratetype_is_mergable() kinda implies "_with_other_types", no?
> 
> I like migratetype_is_mergable() more than _has_fallback().
> 
> My $0.02 to bikeshedding :)

:)

Yeah, for me migratetype_is_mergable() would also be good enough. I
think I was at first thinking one could mistake it with a dedicated
migratetype. But such functions are historically called

is_migrate_cma/is_migrate_cma/....

-- 
Thanks,

David / dhildenb

