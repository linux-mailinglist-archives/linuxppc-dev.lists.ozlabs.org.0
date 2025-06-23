Return-Path: <linuxppc-dev+bounces-9663-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 235F2AE491D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 23 Jun 2025 17:47:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bQssj73vsz30W9;
	Tue, 24 Jun 2025 01:47:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1750693657;
	cv=none; b=kMDEiD7PznrvQqHa0llqUtkjyaR0zB8XWIIT3fqOpYmYQtgdbgGrv00s+BjqJ9EghWSGfsc+Wo4KhOE+VXvmU4PwKwU9AFwUXTG9jT5MeIZ0zSGbPGSPrYAw3WBn6Xpyiea82Azz/o8jzJwmlTqM7clmNkYZXXdiWwsGEQYVsuw9wTb/yfCwpOPaMbLQ19d6mAQ3ZUCOBhjZQaKrErVwISMK/ErCAJAH/oUZeY1rLG+5OciyT+vBeuYJXipaKrWKOZ3elGoAMBbUrd2OQVnYobZ+3b85ZNsQW6GF/4WePvenc++eBJVESMJUjO2jC+JgeSYjzEwN5RWjGpUqSNjmVw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1750693657; c=relaxed/relaxed;
	bh=GiAjHcBAXD9a3mz8FRd2NO1NhckLiGKv82XFpmw/3HY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OBElgG6/t4fSHGXB/w90OEoTjfPoae8pKLjKe147S6brLDxr+mVWKlHkOpGYtGvrudw9PDCipXFsgZitQSvzwKjCuVc8GJsERbY/heVR5WGjHsVWztruOt76pTjN0aEV8Pt0sawzEoYbw9N/2eTET4frRG8ZFphvWXTE0FFSjel2ajIKRrK2B/hLuRwEhiVnIRC9/KwpjMr6JWDO4ldlbrVb6OR7sfcHa0pxDRkbq4BUMC9hwS5uYxvskOdySjO12dFeo0Ctom7n+/0+GL1JyiDPSlrC8aLHqiMQGYAiY4hP30R+dKgm/5dFneyWyynb1B/SgULVE6Oi+IY4xRuf4g==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VKx+jyuc; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VKx+jyuc; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VKx+jyuc;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=VKx+jyuc;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bQssj18ksz30W5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 24 Jun 2025 01:47:36 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750693653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GiAjHcBAXD9a3mz8FRd2NO1NhckLiGKv82XFpmw/3HY=;
	b=VKx+jyucExg7P+DJ1UKWK3Ecf29vwZBlbqYWzwpCuYiQxxBGsRD0e6cCkCs3tVZEHnd210
	etdrH6gnRbEhQrmvhQ4PzuJ0AYW/7WT7fzPS1yIDSR+mFq0W6s+ldiqHLdt54IcSCa+c34
	Z6ukWnu/vEYa4MeUjG2w4VktlG0aclI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750693653;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GiAjHcBAXD9a3mz8FRd2NO1NhckLiGKv82XFpmw/3HY=;
	b=VKx+jyucExg7P+DJ1UKWK3Ecf29vwZBlbqYWzwpCuYiQxxBGsRD0e6cCkCs3tVZEHnd210
	etdrH6gnRbEhQrmvhQ4PzuJ0AYW/7WT7fzPS1yIDSR+mFq0W6s+ldiqHLdt54IcSCa+c34
	Z6ukWnu/vEYa4MeUjG2w4VktlG0aclI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-312-RSZih7wEOvWzonzKSZFg0g-1; Mon, 23 Jun 2025 11:47:32 -0400
X-MC-Unique: RSZih7wEOvWzonzKSZFg0g-1
X-Mimecast-MFC-AGG-ID: RSZih7wEOvWzonzKSZFg0g_1750693651
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso26813445e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Mon, 23 Jun 2025 08:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750693651; x=1751298451;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GiAjHcBAXD9a3mz8FRd2NO1NhckLiGKv82XFpmw/3HY=;
        b=Cbyt9odl0sTmD4Xo855Dw2Z/gqDVoeyBSjs+DUmkmM7/A8GvzRWeWz1IzGkyIm53S/
         foG/DYmwYw6LvCzTjbLjLtxOXsq+0j8vkh0nWAT6m0Eycj+xpO/nTreODtEcX/chdt03
         qfFG6N3mcXWOxhv181b/CdMhSK3CaERTRZG5Byi2ps4dZnglWHKTJ/GaXDkymIgn30dm
         VvLDQBJ4xXw4aeGqeZ3RW+9qKsaaryt2hE7AzGIB5HvGp1NTT/jgzTBgbO0gZW7chLSB
         e2HrGFVzelTnM+uKnm21CQYHH+74ngTv+mgC9WPfxdcIKj/XrSpNlomUSz7KvTpaJj+D
         8gyA==
X-Forwarded-Encrypted: i=1; AJvYcCXufDgJsVwFLwN0YsSsNMSvv1N+pjWC02/bqqwNJfaO+pBZ4Q6CUKLxRPmVrT+eluByhtQ4nqCob+LzMN4=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YwEWA4xClV2T36VYmy99kudolyUMzdu87gYerIeGJ6++Y8BNR8r
	boxnSABwSI9y0dtdwRtYrAyax/iC5EQIzEqyYkoj2R7FFaBgrCxIYYbQ0xBFLlXHz1tR6DOuIG5
	6xShjKCLW+Hq1w9TcU/u63wDugu+r+7lO2fGlIW/YkWO8NsiFlImNMnVfLWnrO+Ndn2M=
X-Gm-Gg: ASbGnctIAFbLdumDBOASqnkfaDowCtszKxjyBRZhVV3Nd12GJiCgDG9GvfRNH8Ovp1w
	6X2KY4YOqQ1KwcX/UlO8LEpvHVcWiY6KBQJiLwQ392faLB2ZhbByhWs/5Mhmi6Q+UeG2gFahHBV
	U+x6RDGCZh4mMW+obQRkqLodu9i9kwH8KMOAb1Cx2/PLwpwhI/jP+SCdNVRaltjAKzODPs+5F0m
	zdVel9RcfRVPKAnJqO29nLuIiN7TprZFRVKLbR7GROXO85HSQ6ChEwJDo5s0zYl40h3x9NNKXnF
	jzZEOeUHij8IlDEKoqMZox2GActHGGRLdOqGD3zBF3E4ZHG4WFXhrQnFaSSy3h0zhUsDMgG4WZF
	y+j7miKhsrdwBNZrnKqgd/R41e8xzqSbbLaH8W7n8kx7jhKr9nw==
X-Received: by 2002:a05:6000:40da:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a6d13242f0mr9661349f8f.37.1750693650725;
        Mon, 23 Jun 2025 08:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBbzh6rLRiE5JaILdTM7jhp0Rp9pGuiB9PpXQvKHMRuXqyueW+S30S6ZgK14mTl9LJ6P93/g==
X-Received: by 2002:a05:6000:40da:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a6d13242f0mr9661316f8f.37.1750693650228;
        Mon, 23 Jun 2025 08:47:30 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1d91bsm9608094f8f.42.2025.06.23.08.47.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 08:47:28 -0700 (PDT)
Message-ID: <d6208fab-9ab5-485e-9cc3-94256fef2e1b@redhat.com>
Date: Mon, 23 Jun 2025 17:47:26 +0200
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 16/29] mm: rename __PageMovable() to
 page_has_movable_ops()
To: Zi Yan <ziy@nvidia.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 virtualization@lists.linux.dev, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Jerrin Shaji George <jerrin.shaji-george@broadcom.com>,
 Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, =?UTF-8?Q?Eugenio_P=C3=A9rez?=
 <eperezma@redhat.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Minchan Kim <minchan@kernel.org>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Brendan Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, Xu Xin <xu.xin16@zte.com.cn>,
 Chengming Zhou <chengming.zhou@linux.dev>, Miaohe Lin
 <linmiaohe@huawei.com>, Naoya Horiguchi <nao.horiguchi@gmail.com>,
 Oscar Salvador <osalvador@suse.de>, Rik van Riel <riel@surriel.com>,
 Harry Yoo <harry.yoo@oracle.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>
References: <20250618174014.1168640-1-david@redhat.com>
 <20250618174014.1168640-17-david@redhat.com>
 <DAA0D876-D5A4-4E54-9BD3-363E34D8B3F3@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <DAA0D876-D5A4-4E54-9BD3-363E34D8B3F3@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qdag8pPTB6pPJEBeVBl82bGcG4A3Xp4_4zNTAFQxZYM_1750693651
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 20.06.25 22:37, Zi Yan wrote:
> On 18 Jun 2025, at 13:39, David Hildenbrand wrote:
> 
>> Let's make it clearer that we are talking about movable_ops pages.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   include/linux/migrate.h    |  2 +-
>>   include/linux/page-flags.h |  2 +-
>>   mm/compaction.c            |  7 ++-----
>>   mm/memory-failure.c        |  4 ++--
>>   mm/memory_hotplug.c        |  8 +++-----
>>   mm/migrate.c               |  8 ++++----
>>   mm/page_alloc.c            |  2 +-
>>   mm/page_isolation.c        | 10 +++++-----
>>   8 files changed, 19 insertions(+), 24 deletions(-)
>>
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index 204e89eac998f..c575778456f97 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -115,7 +115,7 @@ static inline void __SetPageMovable(struct page *page,
>>   static inline
>>   const struct movable_operations *page_movable_ops(struct page *page)
>>   {
>> -	VM_BUG_ON(!__PageMovable(page));
>> +	VM_BUG_ON(!page_has_movable_ops(page));
>>
>>   	return (const struct movable_operations *)
>>   		((unsigned long)page->mapping - PAGE_MAPPING_MOVABLE);
>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> index 4fe5ee67535b2..c67163b73c5ec 100644
>> --- a/include/linux/page-flags.h
>> +++ b/include/linux/page-flags.h
>> @@ -750,7 +750,7 @@ static __always_inline bool __folio_test_movable(const struct folio *folio)
>>   			PAGE_MAPPING_MOVABLE;
>>   }
>>
>> -static __always_inline bool __PageMovable(const struct page *page)
>> +static __always_inline bool page_has_movable_ops(const struct page *page)
>>   {
>>   	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
>>   				PAGE_MAPPING_MOVABLE;
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index 5c37373017014..f8b7c09e2e48c 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -1056,11 +1056,8 @@ isolate_migratepages_block(struct compact_control *cc, unsigned long low_pfn,
>>   		 * Skip any other type of page
>>   		 */
>>   		if (!PageLRU(page)) {
>> -			/*
>> -			 * __PageMovable can return false positive so we need
>> -			 * to verify it under page_lock.
>> -			 */
>> -			if (unlikely(__PageMovable(page)) &&
>> +			/* Isolation will grab the page lock. */
> 
> I feel that the removed comment should stay, since the current comment
> makes no sense when I read it alone.

Well, talking about the page lock is moot either way. The thing is, 
anything can change while we don't hold a page reference. So should we 
change the comment to

/* isolation code will deal with any races. */

... or drop it completely?

> 
> In addition, why is __PageMovable() is renamed to page_has_movable_ops() but
> __SetPageMovable() stays the same? page_has_movable_ops() and __SetPageMovable()
> are functions for checking and setting PAGE_MAPPING_MOVABLE. The naming just
> does not look symmetric.

See follow-up commits where __SetPageMovable() is cleaned up.

-- 
Cheers,

David / dhildenb


