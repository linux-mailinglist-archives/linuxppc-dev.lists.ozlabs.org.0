Return-Path: <linuxppc-dev+bounces-9953-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDC3AEF0B6
	for <lists+linuxppc-dev@lfdr.de>; Tue,  1 Jul 2025 10:17:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4bWbVc1phdz2yqn;
	Tue,  1 Jul 2025 18:17:28 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1751357847;
	cv=none; b=lSV+99PExI/lav/qtIG0IIJZBbh186px481q4X3hCWTq+QWLcfai9bqnxHT/B0qImHxx42zpHrSDP27dPb2Jw0LTL6papIR6WzI5Iy82Axu6kDQTF1alQR9F5XbYHuMhLkfArOEuWVzEjyZ7xb18lHW59BrSMIkxfs423dua/0dvtkhWXZsEqvlWrzrwF5T/+k2PyHqJ3UVCnfpcylOQ3QdDpzTtiadjuRUmAyfazTsC3f4Drm33VBTDv0yTx0YUiFT97Mu+x7rCVcGkixoZ7nDZ1WH/Ft9ctqS1xC5JfZny03p2o+cWq50DzaaYnAg1GakWU3DNoBON8YbOA8TCXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1751357847; c=relaxed/relaxed;
	bh=K8bPxYBe4mprhdcI39oiC8vcqiTtmEpc5GUJmK2gTGs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpMxNOzYBN2WRgTRfNSxHiOj/Epqn4K10lJG3XrNxyHRVHMT6umY3CmRmgWtsnuDkTcxJnsDyGwnxsxhse6GwmbEHFVD1MU4j7GPqoG5lreew/4wcJSwlEAzQsSOfxnHpsV+/ExY8rsl5gelAIqvlSPkZF1OvB82s34C2ymp81SbdA9cuCaOXW4fo6xWc15gU+1hd7BViZhAfpkGiQSE2OwLolK8ZffbXSWmBUu5sijxqX17uIpWwMqlZS8Ib1QvT8M4GEBnv/xxfQZqdhSS/zwub4XOREr4RxcuJfR0Z1Rp7/YrtrzhMwRQq0ES0dh0ROq7cTBrS2TD3ORrfJ34MQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ec0Yv/QF; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ec0Yv/QF; dkim-atps=neutral; spf=pass (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org) smtp.mailfrom=redhat.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ec0Yv/QF;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=ec0Yv/QF;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4bWbVZ4Rrgz2xHT
	for <linuxppc-dev@lists.ozlabs.org>; Tue,  1 Jul 2025 18:17:25 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8bPxYBe4mprhdcI39oiC8vcqiTtmEpc5GUJmK2gTGs=;
	b=ec0Yv/QFGDbC7FkwetscPaERsEdw9C3beE6fJbpM4d7/UwA0ZxKP5D4m5cYGI9N6efnuAJ
	XV3WFjBeU+qEOSoaodJpBVnfpjqZaHXN2K0XtlMF8gcE6ciOUz5p5r+LjbvLEakNuetJe9
	7mqw5OfENQxvvtQ1VijzWZLNDKvdCYE=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751357840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=K8bPxYBe4mprhdcI39oiC8vcqiTtmEpc5GUJmK2gTGs=;
	b=ec0Yv/QFGDbC7FkwetscPaERsEdw9C3beE6fJbpM4d7/UwA0ZxKP5D4m5cYGI9N6efnuAJ
	XV3WFjBeU+qEOSoaodJpBVnfpjqZaHXN2K0XtlMF8gcE6ciOUz5p5r+LjbvLEakNuetJe9
	7mqw5OfENQxvvtQ1VijzWZLNDKvdCYE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-LBlDXvMXMqO2QtIPtkaa3A-1; Tue, 01 Jul 2025 04:17:18 -0400
X-MC-Unique: LBlDXvMXMqO2QtIPtkaa3A-1
X-Mimecast-MFC-AGG-ID: LBlDXvMXMqO2QtIPtkaa3A_1751357837
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so2500925f8f.0
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 01 Jul 2025 01:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751357837; x=1751962637;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=K8bPxYBe4mprhdcI39oiC8vcqiTtmEpc5GUJmK2gTGs=;
        b=I588vE0tpGHg9VbGO5MYj6AM8oLJolqvLlFfvxf09ZrKDecye5RrDVGqxh4rq5yvox
         gPtQR+qKEgh7zhAWVjvmdYt7k5n6cCFT9YB2Y6ICCMqsmQWa7ZWaxkAGdQ2iig5ubv3U
         nZtd+yczGcMA/FZMNnAWfyHEbfMX20m/nyN8TkYZLqVjGmeA8Jaot83lKR9adPRVHqUH
         FOUkVIC+lQ4avqyxwShPVxVFvXEm/BdCWhIbDHDB6c8w3CYYI3tNQ+WF2p0CMXnN7wse
         8UEzdLnrFQ2vqmllnWfJyJVhXoqH3ZnA95KgyUxdeuIhQbXDIl7xLfoqGLWFnjFoSHch
         +WOw==
X-Forwarded-Encrypted: i=1; AJvYcCU6EnMKKNqYzyj01Js7yhpy6wZhUr5pHC7hrbYhXvGVC67+3xD7XPM8BNAM9CVs6SO5FYOZHrQid4wRMbw=@lists.ozlabs.org
X-Gm-Message-State: AOJu0YyB5rz58NjRsD+44JqZodaeUaZvghW1bU58q51mX3htS7m7zk8t
	VCbjsr5/Mvl9BcpzIkaD/Z7Uei0hNPus2egwKbbg+vUR4ZJKb//6AODttG52O5AixnCXYjQnPN6
	nfOpbq9S49hOthHnJwyMUP6WDCNqPqaJ+fQvZqiUQYmWl1ptqD/OBAMOiD90WjAh5F7M=
X-Gm-Gg: ASbGncsS8gTFIRU9X/jC6LS1ej0U82nXyKvMaH3XgH+8hCM+mmtydrrkvnuA6LlV1Z4
	FiIVLmVoJ+FoSQQZtH7sJF/ImJx7V6pNoikGzkNu0r5HnWd2Has20EmPQjqbhSKB5yds+6MZ9X/
	mwzUbCZuMPlmNwiP3srczw5nTS2ZCTzMqg/O68CkkOV3JhsH8bR38Tuj4ap+C8s0BEm4vd2KrVO
	Bsifk3pARZymjFm2xDqnTLTvsnPAPyc0AUP3g19X92QCj19OEejBi9DixiAA7hooUDG5ZFtsg9X
	8uB22+iEONWajIEd1XbIv7ZOeazylI+fEjQRDo2/stkEx1smsy1TBSbV//4SykZlT6JhvliicDY
	gs3AkkxZfuDLYefw6w6MwyES/2r5TS9fMcEcmeFrX+3JDkJ1v8w==
X-Received: by 2002:a05:6000:2d09:b0:3a5:5298:ce28 with SMTP id ffacd0b85a97d-3a8fdb2a72fmr10414472f8f.4.1751357837369;
        Tue, 01 Jul 2025 01:17:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IERLTCKBmcbHu7zgy5EThqO5Z94lv8XJhhKMgPqWhai691qAKiOAkty7NG8qpu22orfEJT0Zw==
X-Received: by 2002:a05:6000:2d09:b0:3a5:5298:ce28 with SMTP id ffacd0b85a97d-3a8fdb2a72fmr10414417f8f.4.1751357836794;
        Tue, 01 Jul 2025 01:17:16 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e528a9sm12735286f8f.60.2025.07.01.01.17.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 01:17:16 -0700 (PDT)
Message-ID: <d4d8b891-008d-4cbc-950f-2e44c4445904@redhat.com>
Date: Tue, 1 Jul 2025 10:17:13 +0200
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
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8c5392d6-372c-4d5d-8446-6af48fba4548@lucifer.local>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: QmoY4AFVY7scriwiKcUo6G3b99UJSJP1LcmR7dhQBC4_1751357837
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On 30.06.25 17:27, Lorenzo Stoakes wrote:
> On Mon, Jun 30, 2025 at 02:59:45PM +0200, David Hildenbrand wrote:
>> Currently, any user of page types must clear that type before freeing
>> a page back to the buddy, otherwise we'll run into mapcount related
>> sanity checks (because the page type currently overlays the page
>> mapcount).
>>
>> Let's allow for not clearing the page type by page type users by letting
>> the buddy handle it instead.
>>
>> We'll focus on having a page type set on the first page of a larger
>> allocation only.
>>
>> With this change, we can reliably identify typed folios even though
>> they might be in the process of getting freed, which will come in handy
>> in migration code (at least in the transition phase).
>>
>> In the future we might want to warn on some page types. Instead of
>> having an "allow list", let's rather wait until we know about once that
>> should go on such a "disallow list".
> 
> Is the idea here to get this to show up on folio dumps or?

As part of the netmem_desc series, there was a discussion about removing 
the mystical PP checks -- page_pool_page_is_pp() in page_alloc.c and 
replacing them by a proper page type check.

In that case, we would probably want to warn in case we get such a 
netmem page unexpectedly freed.

But, that page type does not exist yet in code, so the sanity check must 
be added once introduced.

> 
>>
>> Reviewed-by: Zi Yan <ziy@nvidia.com>
>> Acked-by: Harry Yoo <harry.yoo@oracle.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/page_alloc.c | 3 +++
>>   1 file changed, 3 insertions(+)
>>
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index 858bc17653af9..44e56d31cfeb1 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -1380,6 +1380,9 @@ __always_inline bool free_pages_prepare(struct page *page,
>>   			mod_mthp_stat(order, MTHP_STAT_NR_ANON, -1);
>>   		page->mapping = NULL;
>>   	}
>> +	if (unlikely(page_has_type(page)))
>> +		page->page_type = UINT_MAX;
> 
> Feels like this could do with a comment!

/* Reset the page_type -> _mapcount to -1 */

-- 
Cheers,

David / dhildenb


