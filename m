Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C5A838E8A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 13:29:28 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5xf0T3Pz3vhD
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 23:29:26 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TK5xB54S0z2yVT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 23 Jan 2024 23:29:01 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7B0011FB;
	Tue, 23 Jan 2024 04:29:15 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6882C3F762;
	Tue, 23 Jan 2024 04:28:26 -0800 (PST)
Message-ID: <40112a27-eddb-4c1a-a859-a34e202e6564@arm.com>
Date: Tue, 23 Jan 2024 12:28:25 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 09/11] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <20240122194200.381241-10-david@redhat.com>
 <63be0c3c-bf34-4cbb-b47b-7c9be0e65058@arm.com>
 <31a0661e-fa69-419c-9936-98bfe168d5a7@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <31a0661e-fa69-419c-9936-98bfe168d5a7@redhat.com>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Russell King <linux@armlinux.org.uk>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, Dinh Nguyen <dinguyen@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 23/01/2024 12:19, David Hildenbrand wrote:
> [...]
> 
>>
>> I wrote some documentation for this (based on Matthew's docs for set_ptes() in
>> my version. Perhaps it makes sense to add it here, given this is overridable by
>> the arch.
>>
>> /**
>>   * wrprotect_ptes - Write protect a consecutive set of pages.
>>   * @mm: Address space that the pages are mapped into.
>>   * @addr: Address of first page to write protect.
>>   * @ptep: Page table pointer for the first entry.
>>   * @nr: Number of pages to write protect.
>>   *
>>   * May be overridden by the architecture, else implemented as a loop over
>>   * ptep_set_wrprotect().
>>   *
>>   * Context: The caller holds the page table lock. The PTEs are all in the same
>>   * PMD.
>>   */
>>
> 
> I could have sworn I had a documentation at some point. Let me add some, thanks.
> 
> [...]
> 
>>> +
>>> +    /*
>>> +     * If we likely have to copy, just don't bother with batching. Make
>>> +     * sure that the common "small folio" case stays as fast as possible
>>> +     * by keeping the batching logic separate.
>>> +     */
>>> +    if (unlikely(!*prealloc && folio_test_large(folio) && max_nr != 1)) {
>>> +        nr = folio_pte_batch(folio, addr, src_pte, pte, max_nr);
>>> +        if (folio_test_anon(folio)) {
>>> +            folio_ref_add(folio, nr);
>>> +            if (unlikely(folio_try_dup_anon_rmap_ptes(folio, page,
>>> +                                  nr, src_vma))) {
>>
>> What happens if its not the first page of the batch that fails here? Aren't you
>> signalling that you need a prealloc'ed page for the wrong pte? Shouldn't you
>> still batch copy all the way up to the failing page first? Perhaps it all comes
>> out in the wash and these events are so infrequent that we don't care about the
>> lost batching opportunity?
> 
> I assume you mean the weird corner case that some folio pages in the range have
> PAE set, others don't -- and the folio maybe pinned.
> 
> In that case, we fallback to individual pages, and might have preallocated a
> page although we wouldn't have to preallocate one for processing the next page
> (that doesn't have PAE set).
> 
> It should all work, although not optimized to the extreme, and as it's a corner
> case, we don't particularly care. Hopefully, in the future we'll only have a
> single PAE flag per folio.
> 
> Or am I missing something?

No, your explanation makes sense. Just wanted to check this all definitely
worked, because the flow is slightly different to my previous version that was
doing try_dup_rmap page-by-page.

> 
>>
>>> +                folio_ref_sub(folio, nr);
>>> +                return -EAGAIN;
>>> +            }
>>> +            rss[MM_ANONPAGES] += nr;
>>> +            VM_WARN_ON_FOLIO(PageAnonExclusive(page), folio);
>>> +        } else {
>>> +            folio_ref_add(folio, nr);
>>
>> Perhaps hoist this out to immediately after folio_pte_batch() since you're
>> calling it on both branches?
> 
> Makes sense, thanks.
> 

