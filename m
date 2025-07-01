Return-Path: <linuxppc-dev+bounces-9993-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 02991AEF8EE
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:41:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWjM3135Jz2xPc;
	Tue,  1 Jul 2025 22:41:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751373679;
	cv=none; b=KbcE7eGHsoHKfAzhSD0AmVvymybNQdMM/fOMYu+hTNJjL5OmWshxBmnkXH2HPJxKcL35AYQAMy/K4JvcBhR9krS9TQRaDT2C5hksZG1Cvbq7lUOCkRB6mItZLoi0DPqxAf4sMUnGBWL7nKuEVoMy81ZtXRFNGf8qFCzeSjJuwvoDKdS9DeDjdYX4mh6ohh/xbMnXHOUrXBCCDIMFnMOD6wRiEY3/iyA81a5hD3BpjikF1fh8GVQeM/jkDB79XiSUtlgERJTiFoTy51g3aoqxkPbFbj04+7jGFsEMHVkmIQS3abKzWEt9lP/tRRg/oGLBaCoH5VmaEL+aEGwJvOC5AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751373679; c=relaxed/relaxed;
	bh=Oze5knNhHgerWyspgYSAhDKX+wWribF6uN8V8VOABbQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G2wjvWLlQy3YzRR91h/B36Xu5SH0Byisl1qBZgMpxyjilFT6GyhYirrh/1z1q9ZTtQF8IKQ39g/zM2aiYJIyrJkbYei19abGH9UWUHBvHDtHOOck1Xyvh94qVxF2DE+q+4m9/L1hQtAv4LF53B4arQzqfElHEQZuxfhsn4UqE5q7a+EjzU72lNlF1K3JgXqBAKQs4DU1XepACZRlrkNEEbAhVud9SynPQnPL31c4CofzYQ2swLeuMMyqTypeqwQ4WWk9Gzw7Um5ifIcQBoEPFxUChBYoMkMDXNyFfokC5G8ddhImyuM+VEJd7s5zFLN2fdx+USOZYo1+0g+gQgcVdg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjYdTRQg; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjYdTRQg; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjYdTRQg;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OjYdTRQg;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWjM04x01z2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:41:15 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Oze5knNhHgerWyspgYSAhDKX+wWribF6uN8V8VOABbQ=;
	b=OjYdTRQg0Yfu/9aO/JoqrFONU606IsTBeORXEcuTKoaXGi9E5pma7AWjlZJ9J6DNo3Ncd2
	B0JeoKOgZpzWOhm1RBVG+XdfkD+JYpZiVNxWIKpn2KxA1MfhDyiB3alPAW7CRbe3TS7mkg
	CQv+NoS8ULAT+RladUzqnuPqiL/ci2o=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373672;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Oze5knNhHgerWyspgYSAhDKX+wWribF6uN8V8VOABbQ=;
	b=OjYdTRQg0Yfu/9aO/JoqrFONU606IsTBeORXEcuTKoaXGi9E5pma7AWjlZJ9J6DNo3Ncd2
	B0JeoKOgZpzWOhm1RBVG+XdfkD+JYpZiVNxWIKpn2KxA1MfhDyiB3alPAW7CRbe3TS7mkg
	CQv+NoS8ULAT+RladUzqnuPqiL/ci2o=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-FhSoKv_PMt2WTuBj7tf6nw-1; Tue, 01 Jul 2025 08:41:09 -0400
X-MC-Unique: FhSoKv_PMt2WTuBj7tf6nw-1
X-Mimecast-MFC-AGG-ID: FhSoKv_PMt2WTuBj7tf6nw_1751373668
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eb6fcd88so2476046f8f.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 05:41:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373668; x=1751978468;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Oze5knNhHgerWyspgYSAhDKX+wWribF6uN8V8VOABbQ=;
        b=gNiwAXsenOPDb/zJZgTJlz5zD5tI1laLQk/zXaeukvL8WeeK5fSmFSTf5EEjA0nfcN
         JT3u8eaVAP7cePEBtxPgPqNY2DtN/YuIdXp8iivNLo2XVOTJNYVOxCL/tw7YgQ6yqb/q
         Ay9rQjztxFC+IMEKdsgs4etqJ6YFHk5fMQsPuCLy3HoZOGBuZxWUxqo6DQ4z/IFjAkqR
         PWIAauky+27YsHRtljZw/E42pLlhIUhBby27uBuz3d4qqzuHqSUtubcft1Zn0wF5mLVI
         G6hk3fF8Dbur193FGqE+kuVD509DnAt2TGcAqTzOT7Ww0YxE9IdW6rLtt7mGZCxbZbSw
         A8gg==
X-Forwarded-Encrypted: i=1; AJvYcCWjY+oZzp1dqRtQig1DrUAyrDJnnWUAyWU0IQ4GLp6xA3xJna+Il+vHOTqonRxQA4z4WEVPYuaj/Z2RARo=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyBDf042FlkpmpSCWob86ngNGdOfc0nz9Kxx2z7s6xxAr1jJJJH
	XI/Lact6LDbzbNKAAXERe56fI14xNA/1XaXVblLj7YsCM4sva2ePLmkWMMNM8MR+buUO2oehwcK
	e9n5pArV7eup2+zIzgV0b47C1T1oiJqJvEG6EujD+RxTO3K7ASKfajbuaJvCGsOrsdg0=
X-Gm-Gg: ASbGncsLc/nMtS36T1efVzG/23EaE9KNgAnnanHhGAoZRPMuPXDMeqYkBAbaeoEkq23
	M12ZtwHM5Cr/WBvDP+/ju0h6K6eTmhRTt61Jo/8H10KSIM4dDzy1Ex1zO+on/U7/TWUvMFH+dBC
	oS7qeX3Hzx7qtrACmOmIo9B4W/YOAftG8HxHWOAkN52/lmaghLtQ1tmrN2LiHhIDB5wsx7NOz4n
	4uwLs2wzmaPdlGMvyZ4qQIuuW6jBhh1WEOROWmsHdKrPzyXAeqxTgo/1FP6ZCCx0Je1s9pw7+la
	no6Ed2bskIug0zM0YvNalA53NeO5WL1SM2xvZNPXdtuNhuTnysWooIWwSWrk0HRv8cVWc94ssMB
	VPuQ8zu1xlK6ton8guCTzefuimkq2Dzbamo3+Oj4vw0pn/nXNkA==
X-Received: by 2002:a05:6000:643:b0:3a6:c7f6:3c56 with SMTP id ffacd0b85a97d-3a8f435e45fmr11503411f8f.11.1751373667897;
        Tue, 01 Jul 2025 05:41:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoCHt09MvkW9qgMnvENnZnK57arLhcDT0RB6QnVv3xUTfSdMsPnxZEnoOc3CnsnDJ2z4ma6g==
X-Received: by 2002:a05:6000:643:b0:3a6:c7f6:3c56 with SMTP id ffacd0b85a97d-3a8f435e45fmr11503351f8f.11.1751373667368;
        Tue, 01 Jul 2025 05:41:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823b913esm191229535e9.33.2025.07.01.05.41.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:41:06 -0700 (PDT)
Message-ID: <bdef3652-53b5-4b2c-a544-85b2de00b177@redhat.com>
Date: Tue, 1 Jul 2025 14:41:03 +0200
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
Subject: Re: [PATCH v1 19/29] mm: stop storing migration_ops in page->mapping
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
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
 Zi Yan <ziy@nvidia.com>, Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
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
References: <20250630130011.330477-1-david@redhat.com>
 <20250630130011.330477-20-david@redhat.com>
 <cf92e5be-d9ef-4998-8cfe-023221bb9d5f@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <cf92e5be-d9ef-4998-8cfe-023221bb9d5f@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: rGvb9QrxXA0TIuo6jkb9kGWaMI0m9Q_TM7GByRx5DCg_1751373668
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 14:12, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 03:00:00PM +0200, David Hildenbrand wrote:
>> ... instead, look them up statically based on the page type. Maybe in the
>> future we want a registration interface? At least for now, it can be
>> easily handled using the two page types that actually support page
>> migration.
>>
>> The remaining usage of page->mapping is to flag such pages as actually
>> being movable (having movable_ops), which we will change next.
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> See comment below, this feels iffy in the long run but ok as an interim measure.
> 
> So:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>> ---
>>   include/linux/balloon_compaction.h |  2 +-
>>   include/linux/migrate.h            | 14 ++------------
>>   include/linux/zsmalloc.h           |  2 ++
>>   mm/balloon_compaction.c            |  1 -
>>   mm/compaction.c                    |  5 ++---
>>   mm/migrate.c                       | 23 +++++++++++++++++++++++
>>   mm/zpdesc.h                        |  5 ++---
>>   mm/zsmalloc.c                      |  8 +++-----
>>   8 files changed, 35 insertions(+), 25 deletions(-)
>>
>> diff --git a/include/linux/balloon_compaction.h b/include/linux/balloon_compaction.h
>> index 9bce8e9f5018c..a8a1706cc56f3 100644
>> --- a/include/linux/balloon_compaction.h
>> +++ b/include/linux/balloon_compaction.h
>> @@ -92,7 +92,7 @@ static inline void balloon_page_insert(struct balloon_dev_info *balloon,
>>   				       struct page *page)
>>   {
>>   	__SetPageOffline(page);
>> -	__SetPageMovable(page, &balloon_mops);
>> +	__SetPageMovable(page);
>>   	set_page_private(page, (unsigned long)balloon);
>>   	list_add(&page->lru, &balloon->pages);
>>   }
>> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
>> index e04035f70e36f..6aece3f3c8be8 100644
>> --- a/include/linux/migrate.h
>> +++ b/include/linux/migrate.h
>> @@ -104,23 +104,13 @@ static inline int migrate_huge_page_move_mapping(struct address_space *mapping,
>>   #endif /* CONFIG_MIGRATION */
>>
>>   #ifdef CONFIG_COMPACTION
>> -void __SetPageMovable(struct page *page, const struct movable_operations *ops);
>> +void __SetPageMovable(struct page *page);
>>   #else
>> -static inline void __SetPageMovable(struct page *page,
>> -		const struct movable_operations *ops)
>> +static inline void __SetPageMovable(struct page *page)
>>   {
>>   }
>>   #endif
>>
>> -static inline
>> -const struct movable_operations *page_movable_ops(struct page *page)
>> -{
>> -	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
>> -
>> -	return (const struct movable_operations *)
>> -		((unsigned long)page->mapping - PAGE_MAPPING_MOVABLE);
>> -}
>> -
>>   #ifdef CONFIG_NUMA_BALANCING
>>   int migrate_misplaced_folio_prepare(struct folio *folio,
>>   		struct vm_area_struct *vma, int node);
>> diff --git a/include/linux/zsmalloc.h b/include/linux/zsmalloc.h
>> index 13e9cc5490f71..f3ccff2d966cd 100644
>> --- a/include/linux/zsmalloc.h
>> +++ b/include/linux/zsmalloc.h
>> @@ -46,4 +46,6 @@ void zs_obj_read_end(struct zs_pool *pool, unsigned long handle,
>>   void zs_obj_write(struct zs_pool *pool, unsigned long handle,
>>   		  void *handle_mem, size_t mem_len);
>>
>> +extern const struct movable_operations zsmalloc_mops;
>> +
>>   #endif
>> diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
>> index e4f1a122d786b..2a4a649805c11 100644
>> --- a/mm/balloon_compaction.c
>> +++ b/mm/balloon_compaction.c
>> @@ -253,6 +253,5 @@ const struct movable_operations balloon_mops = {
>>   	.isolate_page = balloon_page_isolate,
>>   	.putback_page = balloon_page_putback,
>>   };
>> -EXPORT_SYMBOL_GPL(balloon_mops);
>>
>>   #endif /* CONFIG_BALLOON_COMPACTION */
>> diff --git a/mm/compaction.c b/mm/compaction.c
>> index 41fd6a1fe9a33..348eb754cb227 100644
>> --- a/mm/compaction.c
>> +++ b/mm/compaction.c
>> @@ -114,11 +114,10 @@ static unsigned long release_free_list(struct list_head *freepages)
>>   }
>>
>>   #ifdef CONFIG_COMPACTION
>> -void __SetPageMovable(struct page *page, const struct movable_operations *mops)
>> +void __SetPageMovable(struct page *page)
>>   {
>>   	VM_BUG_ON_PAGE(!PageLocked(page), page);
>> -	VM_BUG_ON_PAGE((unsigned long)mops & PAGE_MAPPING_MOVABLE, page);
>> -	page->mapping = (void *)((unsigned long)mops | PAGE_MAPPING_MOVABLE);
>> +	page->mapping = (void *)(PAGE_MAPPING_MOVABLE);
>>   }
>>   EXPORT_SYMBOL(__SetPageMovable);
>>
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 15d3c1031530c..c6c9998014ec8 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -43,6 +43,8 @@
>>   #include <linux/sched/sysctl.h>
>>   #include <linux/memory-tiers.h>
>>   #include <linux/pagewalk.h>
>> +#include <linux/balloon_compaction.h>
>> +#include <linux/zsmalloc.h>
>>
>>   #include <asm/tlbflush.h>
>>
>> @@ -51,6 +53,27 @@
>>   #include "internal.h"
>>   #include "swap.h"
>>
>> +static const struct movable_operations *page_movable_ops(struct page *page)
>> +{
>> +	VM_WARN_ON_ONCE_PAGE(!page_has_movable_ops(page), page);
>> +
>> +	/*
>> +	 * If we enable page migration for a page of a certain type by marking
>> +	 * it as movable, the page type must be sticky until the page gets freed
>> +	 * back to the buddy.
>> +	 */
> 
> Ah now this makes more sense...
> 
>> +#ifdef CONFIG_BALLOON_COMPACTION
>> +	if (PageOffline(page))
>> +		/* Only balloon compaction sets PageOffline pages movable. */
>> +		return &balloon_mops;
> 
> So it's certain that if we try to invoke movable ops, and it's the balloon
> compaction case, the page will be offline?

Yes. The page must be marked as having movable_ops by the user. The next 
patch reworks that as well.

A PageOffline page without movable_ops will never end up here 
(page_has_movable_ops() == false).

> 
>> +#endif /* CONFIG_BALLOON_COMPACTION */
>> +#if defined(CONFIG_ZSMALLOC) && defined(CONFIG_COMPACTION)
>> +	if (PageZsmalloc(page))
> 
> And same question only for ZS malloc.

Same thing.

> 
>> +		return &zsmalloc_mops;
>> +#endif /* defined(CONFIG_ZSMALLOC) && defined(CONFIG_COMPACTION) */
>> +	return NULL;
>> +}
> 
> This is kind of sketchy as it's baking in assumptions implicitly, so I hope we
> can find an improved way of doing this later, even if it's about providing
> e.g. is_ballon_movable_ops_page() and is_zsmalloc_movable_ops_page() predicates
> that abstract this code + placing them in the relevant code so it's at least
> obvious to people working on this stuff that this needs to be considered.
> 
> But ok as a means of getting away from having to have the hook object encoded.

Yeah, not sure yet how to clean that up in the future. As I stated 
somewhere, maybe we just want a registration interface to handle a 
specific page type. But for handling the two known in-tree users, this 
should get us going.

Thanks!

-- 
Cheers,

David / dhildenb


