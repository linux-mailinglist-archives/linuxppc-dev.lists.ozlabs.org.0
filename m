Return-Path: <linuxppc-dev+bounces-9971-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9AAEF43F
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 12:02:52 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWdr94Cxvz2yqn;
	Tue,  1 Jul 2025 20:02:49 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751364169;
	cv=none; b=Lfi42QBvS7rvg6pzuTHm/Yzee9cA0/y5yDvoX6bbB2FEfNyC2Qf+q6RBWqkl7AjhbLpSE0SDQNQHhHylkTlfxkodCkOnxYTgGGYrN+wc+c7+jS30T6po3tB7S+N1ViDrC3I4roRvSzyp/FRGgQsDghMIuvBg4CP3BH7DABlz52a9IkyEaUJUQ7WdWKR/a0L6uvbBFzPmJbnh8tw+k26brtMSOT6RunuDrqj9DzLVzNdBj33AtFV6aLPWVme5+oF5oFtrPMUvdoLYM3Xr3TwsvfdFh6J+oy/ay9L6mBQNRy4tpinMN5OK+gAqYwINH1uBEZv9Xdzu9pG5usfYYP/Dcg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751364169; c=relaxed/relaxed;
	bh=f3SHUBXDE7b2cL32PsfHmk/IPfjLCqgNx6V4kjxRwyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PO3Y4P/hQD26/1kx6kj5Be6jkLZs0gFCD50MRhdm1Jtexcgcj/F4sr2UfbVCRIFhiBH1nRwXubPEX3XMGnjekVMugbfw7dQ/r7bx6yMYMv5DPFGOGlFnzpMz62X0gLrkZRm+wpLaqUzKNqYUVs+ffK6108+cv/q+fhuVc1FxkKLO7RtKF31k0owhFf5NmMpvvNqDpVDIQ1T9KRrshgc3IWwIvB+1K0w+bZwvdCUwVK1acOWOWB98es+Zz7SWgRmDurEXFvuJZdlIntH32f9eD71i6tc1eD59OvscUZ7vQWME305mE9HxHTJx3yQ8DQY6Y2liifOMc7pasVjxyypwYA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iR1QUz5K; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnuwPodT; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=iR1QUz5K;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NnuwPodT;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWdr83Jhlz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 20:02:48 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364165;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f3SHUBXDE7b2cL32PsfHmk/IPfjLCqgNx6V4kjxRwyc=;
	b=iR1QUz5Kts5kCIT6PfbUBvORzsSJGaXB60AcTimtljyqAC2JzOte7+vEbhAZja2FFDU53o
	1eCIXQdg17L+VKXz+yCJ/NqNa4FP0tBSwc/jhH54MDqDQzPToe8GeWshCDIsVVWnKtcnXV
	E50PuekyIe3OcCQZW+9zE18QFIIlbWc=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751364166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f3SHUBXDE7b2cL32PsfHmk/IPfjLCqgNx6V4kjxRwyc=;
	b=NnuwPodTCcOfB5pgl2nvhpA1zoObDVFh/i0paQxv4Oxvm4Sb4jY0j3qw0/uBYIrbOrOFcR
	La8X4ddYQCJsg3uNuhOPzbY7EuheuuycO2izp7BNPeSkpVwwYcMekxFLjVnQbEq6FiVzF2
	bubhQFiWLD6auamc9zhQdbl7123A+zg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-615-X7UXyKQFN9S0lZGZkoiBWg-1; Tue, 01 Jul 2025 06:02:44 -0400
X-MC-Unique: X7UXyKQFN9S0lZGZkoiBWg-1
X-Mimecast-MFC-AGG-ID: X7UXyKQFN9S0lZGZkoiBWg_1751364163
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4536962204aso12150825e9.3
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 03:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364163; x=1751968963;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f3SHUBXDE7b2cL32PsfHmk/IPfjLCqgNx6V4kjxRwyc=;
        b=ns1UmN4drGhM6ZyZaKamFTxGc+MCZjaTY6oCKunWAGrnecTbH3MvyfkJDJWKlX3Kw9
         vvM3ytMoperPfnEr/X6R7y90xIZTUloy4YwjL/h41wU482RfJbEYbb8d6JOObJDqVaVs
         iW9o/QpA4Z2ddhq/qxmZwsgHw3laWOlEPv8olJV2bC1C33ZtvxBVlwhqk7pT1ij8TLeQ
         9kXWkTe225gogZkcmRfeDpMXflfGzaPCBIVLqy+O1sr43f2VRh3qy4HlM539+ESp/ZP2
         /36CuYH9Kmu9i7Q6H9fasiDZ6AhICGR6HHiUEThGTNygDlCRWTd2AZ4ayeFzF0ABFDnj
         rYew==
X-Forwarded-Encrypted: i=1; AJvYcCVwhZr/svXSQZ2z+hMyyoPUSg9sRI7dM6A/D+mEFamoqihMs2V7MJMimYxC1CJi+eCjDugPhzdeanpxNGQ=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YxhSce9NWsWcDgw+RrUBDwYCEmcKohYRgvr4zCor9ifoWi/1uFn
	4ADK/C9NGAnki75VaOS11wW53hkiQ7OMlrYcj6/Xc3GMTdZBEKsMKv5eDv17URyEZqSwCOLF8xN
	pfiJSz7do7xlxXWIZ5LPlt3uZFe575AuS9AwNuoRPnWlKy48VVebO9HHKZPY6pIr7KVU=
X-Gm-Gg: ASbGnctM6zUs/eCfIhlOZNXBIuy0+e9e6o7dukGEFtCeWdGOEf2zyBvAjQJV0hvUfGu
	iyXpL+jsexKK7CyO/RWdU5bXouLAsi9yfrmGkv6uK1jS1Z7G+wAw9gzk5snk55ngqNxj6ObBFtU
	kNcWwR/HU5b0MVDeGoj9wLmO0EirWkCamg6QdZxEGQVsTwGIqpUUDYVP3zJ/XlHUQIEgxInYewK
	uD6L4Z6hq1H9BxzQJG+eRVPgSczkWmpxZVW9zMvX+axqReQ6erX+dnRRpkNsSMvLQ7qHCNqVqZK
	OWv24exwKDLM3MEqr3Iv97L0b/QZ151KY9WLepGKH/mFoDd2Zig7Dv7u4ccXJeexUtDhwpmz1/i
	KxfPDckudp9kCBDXZ/LFA51FIIsbNG3xMgteLGkcC1wQlDaFxIQ==
X-Received: by 2002:a05:600c:c09b:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-4538ee3344amr145818225e9.2.1751364163063;
        Tue, 01 Jul 2025 03:02:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEFgAwnBW5J05+aCYFKVRcwfsiMjpcnNtgBSBoK6tfZW90o8f6wyDtCBqB3s9LfsUKyHTpToQ==
X-Received: by 2002:a05:600c:c09b:b0:450:d3b9:4ba4 with SMTP id 5b1f17b1804b1-4538ee3344amr145817895e9.2.1751364162437;
        Tue, 01 Jul 2025 03:02:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm172377615e9.21.2025.07.01.03.02.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 03:02:41 -0700 (PDT)
Message-ID: <38c64eec-0350-4e94-a115-76a569f4b934@redhat.com>
Date: Tue, 1 Jul 2025 12:02:39 +0200
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
Subject: Re: [PATCH v1 04/29] mm/page_alloc: let page freeing clear any set
 page type
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
 <20250630130011.330477-5-david@redhat.com>
 <8c5392d6-372c-4d5d-8446-6af48fba4548@lucifer.local>
 <d4d8b891-008d-4cbc-950f-2e44c4445904@redhat.com>
 <06e260cf-9b63-4d7c-809c-a9f2cda58939@lucifer.local>
 <84e1eeeb-c78f-4735-a6d2-4bb15ea1fbce@redhat.com>
 <b0069788-2940-4634-ada1-224b927154dd@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b0069788-2940-4634-ada1-224b927154dd@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XaA19Dtdthq9ZIo7GNiG-qQILMH37jpM3elXEH7zyEA_1751364163
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 01.07.25 10:37, Lorenzo Stoakes wrote:
> On Tue, Jul 01, 2025 at 10:34:33AM +0200, David Hildenbrand wrote:
>>>>>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>>>>>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>>>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Based on discussion below, I'm good with this now with the comment change, so
> feel free to add:
> 
> Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> 
>>>>>> ---
>>>>>>     mm/page_alloc.c | 3 +++
>>>>>>     1 file changed, 3 insertions(+)
>>>>>>
>>>>>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>>>>>> index 858bc17653af9..44e56d31cfeb1 100644
>>>>>> --- a/mm/page_alloc.c
>>>>>> +++ b/mm/page_alloc.c
>>>>>> @@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
>>>>>>     			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
>>>>>>     		page->mapping = NULL;
>>>>>>     	}
>>>>>> +	if (unlikely(page_has_type(page)))
>>>>>> +		page->page_type = UINT_MAX;
>>>>>
>>>>> Feels like this could do with a comment!
>>>>
>>>> /* Reset the page_type -> _mapcount to -1 */
>>>
>>> Hm this feels like saying 'the reason we set it to -1 is to set it to -1' :P
>>
>> Bingo! Guess why I didn't add a comment in the first place :P
>>
>>>
>>> I'd be fine with something simple like
>>>
>>> /* Set page_type to reset value */
>>
>> "Reset the page_type (which overlays _mapcount)"
>>
>> ?
> 
> Sounds good thanks, have an R-b above on the basis of this change.
> 
>>
>>>> But... Can't we just put a #define somewhere here to make life easy?
>> Like:
>>
>> Given that Willy will change all that soon, I'm not in favor of doing that
>> in this series.
> 
> Ah is he? I mean of course he is :))) this does seem like a prime target for the
> ongoing memdesc/foliofication efforts.

Right. According to the plans I know, the type will be stored as part of 
the memdesc pointer.

Clearing the type (where to clear, what to clear, when to clear) is 
probably the interesting bit in the future: probably it will be cleared 
as part of freeing any memdesc (thereby, invalidating the pointer).

-- 
Cheers,

David / dhildenb


