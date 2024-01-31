Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 994E1843CCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 11:32:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPyzS44tZz3cXQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 21:32:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPyz35Ky5z2ykn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 21:32:30 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A3E8FDA7;
	Wed, 31 Jan 2024 02:32:42 -0800 (PST)
Received: from [10.57.79.60] (unknown [10.57.79.60])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A65A23F5A1;
	Wed, 31 Jan 2024 02:31:53 -0800 (PST)
Message-ID: <424115a2-a924-4c28-8027-32db6ab9278d@arm.com>
Date: Wed, 31 Jan 2024 10:31:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 9/9] mm/memory: optimize unmap/zap with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240129143221.263763-1-david@redhat.com>
 <20240129143221.263763-10-david@redhat.com>
 <bec84017-b1c9-48e7-a206-c4c8a651ee83@arm.com>
 <cf9adefc-8508-49a4-a7f0-784e345c5d80@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <cf9adefc-8508-49a4-a7f0-784e345c5d80@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

On 31/01/2024 10:21, David Hildenbrand wrote:
> 
>>> +
>>> +#ifndef clear_full_ptes
>>> +/**
>>> + * clear_full_ptes - Clear PTEs that map consecutive pages of the same folio.
>>
>> I know its implied from "pages of the same folio" (and even more so for the
>> above variant due to mention of access/dirty), but I wonder if its useful to
>> explicitly state that "all ptes being cleared are present at the time of the
>> call"?
> 
> "Clear PTEs" -> "Clear present PTEs" ?
> 
> That should make it clearer.

Works for me.

> 
> [...]
> 
>>>       if (!delay_rmap) {
>>> -        folio_remove_rmap_pte(folio, page, vma);
>>> +        folio_remove_rmap_ptes(folio, page, nr, vma);
>>> +
>>> +        /* Only sanity-check the first page in a batch. */
>>>           if (unlikely(page_mapcount(page) < 0))
>>>               print_bad_pte(vma, addr, ptent, page);
>>
>> Is there a case for either removing this all together or moving it into
>> folio_remove_rmap_ptes()? It seems odd to only check some pages.
>>
> 
> I really wanted to avoid another nasty loop here.
> 
> In my thinking, for 4k folios, or when zapping subpages of large folios, we
> still perform the exact same checks. Only when batching we don't. So if there is
> some problem, there are ways to get it triggered. And these problems are barely
> ever seen.
> 
> folio_remove_rmap_ptes() feels like the better place -- especially because the
> delayed-rmap handling is effectively unchecked. But in there, we cannot
> "print_bad_pte()".
> 
> [background: if we had a total mapcount -- iow cheap folio_mapcount(), I'd check
> here that the total mapcount does not underflow, instead of checking per-subpage]

All good points... perhaps extend the comment to describe how this could be
solved in future with cheap total_mapcount()? Or in the commit log if you prefer?

> 
>>
>>>       }
>>> -    if (unlikely(__tlb_remove_page(tlb, page, delay_rmap))) {
>>> +    if (unlikely(__tlb_remove_folio_pages(tlb, page, nr, delay_rmap))) {
>>>           *force_flush = true;
>>>           *force_break = true;
>>>       }
>>>   }
>>>   -static inline void zap_present_pte(struct mmu_gather *tlb,
>>> +/*
>>> + * Zap or skip one present PTE, trying to batch-process subsequent PTEs that
>>> map
>>
>> Zap or skip *at least* one... ?
> 
> Ack
> 

