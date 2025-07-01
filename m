Return-Path: <linuxppc-dev+bounces-9992-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 32964AEF8B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 14:36:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWjFS2rTqz2xk5;
	Tue,  1 Jul 2025 22:36:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751373388;
	cv=none; b=Xe1/Ipg4UuwfimE/DYVJn+o1lDBAoKhzReMAv0SGR7rzEAd6cIoNODEl+HGoTM9YjXphg6iKA0i96OSXd+uE4aB4Y5CRw83NCUznk1xQNvVsg/KWMEWZA/awqw6/lgwEF4w0YE2pjy3xQsNDoGnUhcS12guUY2IElfInyhs8cq+ssSoQ0mqWAABVweNoEoiuqUIUpC6Yxc9u2eISJOzqYD5G4mXGZvqEodzEBkSpgn0X9CB4Ajei7jv5mSd4TxScZB280IKePazkehgXurjec2GiclMoR0zA0wH2zrLChzD7zsot2MnnaTmz3rol9df3rQDNENEzXCdCWNTE9HtOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751373388; c=relaxed/relaxed;
	bh=BWUS58/xuFehV84IBP/7jugiRMD3VIiL2+WOvgSmr/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WgFWTDNkVbndfgLQWFlhXt2WOXZpyb2FbQWwFlqyJS2hycsmwy8WMeUaRdHH0XN1lUS5HtdUEKh1fM8BiWJnysrdDcAEGRRC+8VKxXehCSlrqrO7QvpOh5mLT8abgfdYuV3YycEBh4fbmuZMEa4zodROTe8rCD7aa6LfdCZMpPDei0z76XDEfj1ynh1WrfY4Q7Hk31gUctaspppjWhCP8rqq8IBRxuvoC/Vcma9v6mUvpJFjw80Sd3MqzfBgHhL4ulHQTTYDRMSsIuiiA0bv0Uz0QVNEwoisqgx8hXVrGBdYmJdVj8COqiTGWthXPLwOP4KF3DxZXY2EVyhDkpv3Lg==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOsvUrpJ; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOsvUrpJ; dkim-atps=neutral; spf=pass (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOsvUrpJ;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=eOsvUrpJ;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.133.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWjFR2Nrjz2xCd
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 22:36:26 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BWUS58/xuFehV84IBP/7jugiRMD3VIiL2+WOvgSmr/U=;
	b=eOsvUrpJ0LOALtwLN0WKD0VCHfgjZuKZDMRrr3VNyIeZz9lNb9PT1kY6KBkExBHb9PlTsS
	kxfvU9XEbT87u5GwdNoCuosF7MSLTuLeDFTfhfG6qDKBOKqghg5QasveGGUHEne5Ry6Tvo
	cE5NwaBY1GJ5AMXNXYv5L5qsufDvEcU=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751373384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BWUS58/xuFehV84IBP/7jugiRMD3VIiL2+WOvgSmr/U=;
	b=eOsvUrpJ0LOALtwLN0WKD0VCHfgjZuKZDMRrr3VNyIeZz9lNb9PT1kY6KBkExBHb9PlTsS
	kxfvU9XEbT87u5GwdNoCuosF7MSLTuLeDFTfhfG6qDKBOKqghg5QasveGGUHEne5Ry6Tvo
	cE5NwaBY1GJ5AMXNXYv5L5qsufDvEcU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-eo4QfUj2M6-jYoPA7vdLAw-1; Tue, 01 Jul 2025 08:36:23 -0400
X-MC-Unique: eo4QfUj2M6-jYoPA7vdLAw-1
X-Mimecast-MFC-AGG-ID: eo4QfUj2M6-jYoPA7vdLAw_1751373382
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a4f65a705dso1953131f8f.2
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 05:36:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751373382; x=1751978182;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BWUS58/xuFehV84IBP/7jugiRMD3VIiL2+WOvgSmr/U=;
        b=GfvhW7Jpxw/MU/UesQcKoyzwCBvMgBRLQrcqKF3zc6MiwOkSv3FqXQX/tE4v+FMfXN
         TtW+ehuehSv8VOdouHBRn7b8IzVj+UTp8sg57rWPaDE2ieB54/OT8owTUX9DmsswmR32
         r+iDnny9730d4G5eBbzl9qNW/TdYJKlwJ25JNZmdEq1kni9abNPMnbsfxL73mThQseKJ
         ZjWVyV1/aW6IyX5EscONXZIMSez25mWvOVVuQG9oeHXQl5QKE81qHAJLNsNR6/f2De5C
         g+g0pJaZjFMHM0gKPKfzxomEWnOOQxHPjzagt+iteu6cVE/kZBjXkR9HsyQUaksLXBNp
         F81g==
X-Forwarded-Encrypted: i=1; AJvYcCVYgFsTeLUdehAvit5PKwDJclrGV+ujZfbgcfbLyditDuHF5snciA9JTlnr+AMPa0nepl75bcuiwLKciuw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YzJRS22gMhe0Qt44O5VnrIpoemiprSb2rU0XtqGZJ29ASaz3ney
	AljI+T1dbGEANOQAxfnWlcm5d4dK87AFdIKUk2Dui0qt86jcO/wzewH2eE0ky6PWBsmEmvGz1sw
	7hBd+oCbvQqMxFJ7HJy50sE+Q69ukJAQKjK1BaIPLT+eIMKxpves44KvQGpeQ+GrH8BI=
X-Gm-Gg: ASbGncscO9Uml2MwCN1SoWDlK71e0srwh94gIPnrxZFnRJIgjxj8k7IxTcrEeT4YldQ
	89daaNNjZOmKYabrLS2XrHtrgWYE+Jfe+khx+wJCNB0CfcOjWQ9DMfsBjiqO41qiPf/iWGjlLWO
	5HgP2taFFLs1rtCzvRiBCso9Zo6j17NGpMAwFGYC4sMcEV+FgGx7IjqvqukymJ7nCupRjjOiM0j
	RJ0PlwgFUZ5aselAK2r1FIEmmtWI9pTdPJqGVpreO2m9VaCxLYGjIufF/i1AUwbpYbCkVXTAIgQ
	/IwPht5JXqsFvOVq4nqEODcBCQtEgndOpaL2bWejXYHbSL0neZGuFcWBjd2fhK85nFMGtHq2NCz
	hjwRXf+VuPPZYZx26PfitiSyTkdd5T4BqfOHvykU77iCxZmGbGg==
X-Received: by 2002:adf:a21a:0:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3a8fe79c8e3mr10444933f8f.48.1751373381299;
        Tue, 01 Jul 2025 05:36:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEqIR1BDJyK8ZRp8F0lL2pM8FI7W8fcFCGvncPeyeTD2kfxRgbkByPh+KE/B8iSSRVeA4M/aQ==
X-Received: by 2002:adf:a21a:0:b0:3a5:88cf:479e with SMTP id ffacd0b85a97d-3a8fe79c8e3mr10444867f8f.48.1751373380689;
        Tue, 01 Jul 2025 05:36:20 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm13174236f8f.0.2025.07.01.05.36.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:36:20 -0700 (PDT)
Message-ID: <9af55241-8348-46a1-8f72-5ad7e61bcd84@redhat.com>
Date: Tue, 1 Jul 2025 14:36:17 +0200
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
Subject: Re: [PATCH v1 18/29] mm: remove __folio_test_movable()
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
 <20250630130011.330477-19-david@redhat.com>
 <6e067746-9d18-4d04-a60a-536d5fee6b87@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6e067746-9d18-4d04-a60a-536d5fee6b87@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: sPdqDKCK6BYnqQp55JHORX_MTrenrnPV9WeUb2YOtgw_1751373382
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

>> ---
>>   include/linux/page-flags.h |  6 ------
>>   mm/migrate.c               | 43 ++++++++++++--------------------------
>>   mm/vmscan.c                |  6 ++++--
>>   3 files changed, 17 insertions(+), 38 deletions(-)
>>
>> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
>> index c67163b73c5ec..4c27ebb689e3c 100644
>> --- a/include/linux/page-flags.h
>> +++ b/include/linux/page-flags.h
>> @@ -744,12 +744,6 @@ static __always_inline bool PageAnon(const struct page *page)
>>   	return folio_test_anon(page_folio(page));
>>   }
>>
>> -static __always_inline bool __folio_test_movable(const struct folio *folio)
>> -{
>> -	return ((unsigned long)folio->mapping & PAGE_MAPPING_FLAGS) ==
>> -			PAGE_MAPPING_MOVABLE;
>> -}
>> -
> 
> Woah, wait, does this mean we can remove PAGE_MAPPING_MOVABLE??

Jup :)

> 
> Nice!
> 
>>   static __always_inline bool page_has_movable_ops(const struct page *page)
>>   {
>>   	return ((unsigned long)page->mapping & PAGE_MAPPING_FLAGS) ==
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 587af35b7390d..15d3c1031530c 100644
>> --- a/mm/migrate.c
>> +++ b/mm/migrate.c
>> @@ -219,12 +219,7 @@ void putback_movable_pages(struct list_head *l)
>>   			continue;
>>   		}
>>   		list_del(&folio->lru);
>> -		/*
>> -		 * We isolated non-lru movable folio so here we can use
>> -		 * __folio_test_movable because LRU folio's mapping cannot
>> -		 * have PAGE_MAPPING_MOVABLE.
>> -		 */
> 
> So hate these references to 'LRU' as in meaning 'pages that could be on the
> LRU'.

Yeah, it's a historical thing.

But for anything we isolated, it had to be an LRU folio (PageLRU) 
because that's how we were even able to isolate it ... from the LRU.

[...]

>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index 098bcc821fc74..103dfc729a823 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -1658,9 +1658,11 @@ unsigned int reclaim_clean_pages_from_list(struct zone *zone,
>>   	unsigned int noreclaim_flag;
>>
>>   	list_for_each_entry_safe(folio, next, folio_list, lru) {
>> +		/* TODO: these pages should not even appear in this list. */
>> +		if (page_has_movable_ops(&folio->page))
> 
> VM_WARN_ON_ONCE()?

Well, no, it can currently still happen. But really, movable_ops pages 
are not folios that could ever be reclaimed that way.

So the TODO highlights that movable_ops pages should never even be put 
in a list (page->lru will go away).

-- 
Cheers,

David / dhildenb


