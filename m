Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AC41C841F9B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 10:34:24 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q2hjl6pI;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QA9z029D;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPKkQ4ZdGz3cVV
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 20:34:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Q2hjl6pI;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QA9z029D;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=redhat.com (client-ip=170.10.129.124; helo=us-smtp-delivery-124.mimecast.com; envelope-from=david@redhat.com; receiver=lists.ozlabs.org)
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPKjh6Dcvz3bqx
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 20:33:43 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706607220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r8m7uPOH6IrpXxOx1GhKy9Dm1H+TruM8yPB84uxSQyo=;
	b=Q2hjl6pIRJrzDxEOM9l/LDK7KMZf+bBh9qiKQpIwq8pMz41KNgt+8Qh7Y8hO6iPya0Ab8c
	7y3ifleiLVgUosz3FOtXwpjs/hhnJSTSB+6OvUrcbIve26Ot2ViewAq9lnG6P38vAfjZcO
	i1OVcRERlrzZDn+wMWK5qfRJkufADEQ=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706607221;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=r8m7uPOH6IrpXxOx1GhKy9Dm1H+TruM8yPB84uxSQyo=;
	b=QA9z029DvgXSNgX+iu0rmyUQIpQI4DVuiqCHhQTKl/2WZXb9l8nUPKtbD9/OuigbQaQaY9
	bdqCD9ZoWmF2DLJ8lFGElZ5FRFOW3k7+OTp3u+ynzkgTHudcYZmDCGXy2nkfihmgm7teUv
	K1JEA48Q8MaSZJupj2CHXnzy8bf3+Fc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-381-EdlLp-8YOhKf0a3DYSWTMg-1; Tue, 30 Jan 2024 04:33:38 -0500
X-MC-Unique: EdlLp-8YOhKf0a3DYSWTMg-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-40e478693bcso22912435e9.1
        for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 01:33:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706607217; x=1707212017;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r8m7uPOH6IrpXxOx1GhKy9Dm1H+TruM8yPB84uxSQyo=;
        b=TlbcMHQGTkQhtFZBEzfG6h9wbkHG1UbW0ajp2DFExnKi9qqrvSY6eJVHb6jBvG9ICK
         XZ9aWocdE9yQzMoXW3UVQMLQAh2quKPHjVR6lkxZi/Js1RSFoFTl8AntMbQNX0qKiIAk
         XDeoXmWb1OAvTLO0sz4v9z37TwZvOhUR+F/AazRPkZj32i7T02uv6YvstBwM8yHRIaAW
         hoQJgbJ+8WLtZpBeSCh15ArXUbWNgb1ymES5QEbWonBF5tCpwVEFmrhRnOqNHcSDO3eB
         wwYA/3mVlLVJCphXE7dXGyBk+nQP1JWDk+FG5qzirkIoqSeKGy4Hff5WEECmlxElhcg7
         vIVQ==
X-Gm-Message-State: AOJu0Yzq7RXPP6/SKfPvPioUQz76m0f7VyJcM2LKHU9tMMwnQI4PLxsj
	D8/XOvvQKmP+ISvi5hlPKAGWPYLnBGLmJIaoKYrQoXEr8cBOSTzfiBxgLmtVnFkV2pQg8E+MLzY
	4LqD6Fziqnp9m0AyR7aRbrvyaMZzsAej5YoQq68wokISJY3KIRYfP4yDhLVtN+aQ=
X-Received: by 2002:a05:600c:3b29:b0:40f:a661:d2b with SMTP id m41-20020a05600c3b2900b0040fa6610d2bmr357986wms.13.1706607217269;
        Tue, 30 Jan 2024 01:33:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHo+KOR5lw3BrW72Ij0NfPypWhmMPY/4ZK+I4aQGqcJQVUJ42v4Bg58uAsBy+D89KjoZDWwDQ==
X-Received: by 2002:a05:600c:3b29:b0:40f:a661:d2b with SMTP id m41-20020a05600c3b2900b0040fa6610d2bmr357962wms.13.1706607216838;
        Tue, 30 Jan 2024 01:33:36 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:2700:bdf6:739b:9f9d:862f? (p200300cbc7082700bdf6739b9f9d862f.dip0.t-ipconnect.de. [2003:cb:c708:2700:bdf6:739b:9f9d:862f])
        by smtp.gmail.com with ESMTPSA id v9-20020a05600c470900b0040d87100733sm12550857wmo.39.2024.01.30.01.33.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jan 2024 01:33:36 -0800 (PST)
Message-ID: <38ec930c-7175-4bd4-a364-527fcf583148@redhat.com>
Date: Tue, 30 Jan 2024 10:33:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 7/9] mm/mmu_gather: add __tlb_remove_folio_pages()
To: Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-8-david@redhat.com>
 <e4c7c6a3-b641-4e92-b782-68d90917795f@arm.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e4c7c6a3-b641-4e92-b782-68d90917795f@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, Vasily Gorbik <gor@linux.ibm.com>, Peter Zijlstra <peterz@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org, Matthew Wilcox <willy@infradead.org>, linux-mm@kvack.org, Nick Piggin <npiggin@gmail.com>, Catalin Marinas <catalin.marinas@arm.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, Heiko Carstens <hca@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 30.01.24 10:21, Ryan Roberts wrote:
> On 29/01/2024 14:32, David Hildenbrand wrote:
>> Add __tlb_remove_folio_pages(), which will remove multiple consecutive
>> pages that belong to the same large folio, instead of only a single
>> page. We'll be using this function when optimizing unmapping/zapping of
>> large folios that are mapped by PTEs.
>>
>> We're using the remaining spare bit in an encoded_page to indicate that
>> the next enoced page in an array contains actually shifted "nr_pages".
>> Teach swap/freeing code about putting multiple folio references, and
>> delayed rmap handling to remove page ranges of a folio.
>>
>> This extension allows for still gathering almost as many small folios
>> as we used to (-1, because we have to prepare for a possibly bigger next
>> entry), but still allows for gathering consecutive pages that belong to the
>> same large folio.
>>
>> Note that we don't pass the folio pointer, because it is not required for
>> now. Further, we don't support page_size != PAGE_SIZE, it won't be
>> required for simple PTE batching.
>>
>> We have to provide a separate s390 implementation, but it's fairly
>> straight forward.
>>
>> Another, more invasive and likely more expensive, approach would be to
>> use folio+range or a PFN range instead of page+nr_pages. But, we should
>> do that consistently for the whole mmu_gather. For now, let's keep it
>> simple and add "nr_pages" only.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   arch/s390/include/asm/tlb.h | 17 +++++++++++
>>   include/asm-generic/tlb.h   |  8 +++++
>>   include/linux/mm_types.h    | 20 ++++++++++++
>>   mm/mmu_gather.c             | 61 +++++++++++++++++++++++++++++++------
>>   mm/swap.c                   | 12 ++++++--
>>   mm/swap_state.c             | 12 ++++++--
>>   6 files changed, 116 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/s390/include/asm/tlb.h b/arch/s390/include/asm/tlb.h
>> index 48df896d5b79..abfd2bf29e9e 100644
>> --- a/arch/s390/include/asm/tlb.h
>> +++ b/arch/s390/include/asm/tlb.h
>> @@ -26,6 +26,8 @@ void __tlb_remove_table(void *_table);
>>   static inline void tlb_flush(struct mmu_gather *tlb);
>>   static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
>>   		struct page *page, bool delay_rmap, int page_size);
>> +static inline bool __tlb_remove_folio_pages(struct mmu_gather *tlb,
>> +		struct page *page, unsigned int nr_pages, bool delay_rmap);
>>   
>>   #define tlb_flush tlb_flush
>>   #define pte_free_tlb pte_free_tlb
>> @@ -52,6 +54,21 @@ static inline bool __tlb_remove_page_size(struct mmu_gather *tlb,
>>   	return false;
>>   }
>>   
>> +static inline bool __tlb_remove_folio_pages(struct mmu_gather *tlb,
>> +		struct page *page, unsigned int nr_pages, bool delay_rmap)
>> +{
>> +	struct encoded_page *encoded_pages[] = {
>> +		encode_page(page, ENCODED_PAGE_BIT_NR_PAGES),
>> +		encode_nr_pages(nr_pages),
>> +	};
>> +
>> +	VM_WARN_ON_ONCE(delay_rmap);
>> +	VM_WARN_ON_ONCE(page_folio(page) != page_folio(page + nr_pages - 1));
>> +
>> +	free_pages_and_swap_cache(encoded_pages, ARRAY_SIZE(encoded_pages));
>> +	return false;
>> +}
>> +
>>   static inline void tlb_flush(struct mmu_gather *tlb)
>>   {
>>   	__tlb_flush_mm_lazy(tlb->mm);
>> diff --git a/include/asm-generic/tlb.h b/include/asm-generic/tlb.h
>> index 2eb7b0d4f5d2..428c3f93addc 100644
>> --- a/include/asm-generic/tlb.h
>> +++ b/include/asm-generic/tlb.h
>> @@ -69,6 +69,7 @@
>>    *
>>    *  - tlb_remove_page() / __tlb_remove_page()
>>    *  - tlb_remove_page_size() / __tlb_remove_page_size()
>> + *  - __tlb_remove_folio_pages()
>>    *
>>    *    __tlb_remove_page_size() is the basic primitive that queues a page for
>>    *    freeing. __tlb_remove_page() assumes PAGE_SIZE. Both will return a
>> @@ -78,6 +79,11 @@
>>    *    tlb_remove_page() and tlb_remove_page_size() imply the call to
>>    *    tlb_flush_mmu() when required and has no return value.
>>    *
>> + *    __tlb_remove_folio_pages() is similar to __tlb_remove_page(), however,
>> + *    instead of removing a single page, remove the given number of consecutive
>> + *    pages that are all part of the same (large) folio: just like calling
>> + *    __tlb_remove_page() on each page individually.
>> + *
>>    *  - tlb_change_page_size()
>>    *
>>    *    call before __tlb_remove_page*() to set the current page-size; implies a
>> @@ -262,6 +268,8 @@ struct mmu_gather_batch {
>>   
>>   extern bool __tlb_remove_page_size(struct mmu_gather *tlb, struct page *page,
>>   		bool delay_rmap, int page_size);
>> +bool __tlb_remove_folio_pages(struct mmu_gather *tlb, struct page *page,
>> +		unsigned int nr_pages, bool delay_rmap);
>>   
>>   #ifdef CONFIG_SMP
>>   /*
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 1b89eec0d6df..198662b7a39a 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -226,6 +226,15 @@ struct encoded_page;
>>   /* Perform rmap removal after we have flushed the TLB. */
>>   #define ENCODED_PAGE_BIT_DELAY_RMAP		1ul
>>   
>> +/*
>> + * The next item in an encoded_page array is the "nr_pages" argument, specifying
>> + * the number of consecutive pages starting from this page, that all belong to
>> + * the same folio. For example, "nr_pages" corresponds to the number of folio
>> + * references that must be dropped. If this bit is not set, "nr_pages" is
>> + * implicitly 1.
>> + */
>> +#define ENCODED_PAGE_BIT_NR_PAGES		2ul
> 
> nit: Perhaps this should be called ENCODED_PAGE_BIT_NR_PAGES_NEXT? There are a
> couple of places where you check for this bit on the current entry and advance
> to the next. So the "_NEXT" might make things clearer?

Yes, makes sense, thanks for the suggestion.

-- 
Cheers,

David / dhildenb

