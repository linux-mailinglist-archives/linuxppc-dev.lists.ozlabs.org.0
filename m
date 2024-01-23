Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C80839A82
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 Jan 2024 21:45:03 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKJxT1flSz3cX6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Jan 2024 07:45:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TKJwy6Z20z3brm
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Jan 2024 07:44:32 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F4471FB;
	Tue, 23 Jan 2024 12:44:44 -0800 (PST)
Received: from [10.57.77.165] (unknown [10.57.77.165])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 526623F73F;
	Tue, 23 Jan 2024 12:43:55 -0800 (PST)
Message-ID: <f9eb630a-f0f8-4219-b74f-109c51f31eb4@arm.com>
Date: Tue, 23 Jan 2024 20:43:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 00/11] mm/memory: optimize fork() with PTE-mapped THP
Content-Language: en-GB
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
References: <20240122194200.381241-1-david@redhat.com>
 <56bee384-461e-4167-b7e9-4dd60666dd66@arm.com>
 <fa9425e8-f489-48d0-9bf5-98d1b46b6d1a@redhat.com>
 <7d92d27a-44f6-47d0-8eab-3f80bd7bd75d@arm.com>
 <33cf54a9-b855-4d2d-9926-a4936fc9068b@redhat.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <33cf54a9-b855-4d2d-9926-a4936fc9068b@redhat.com>
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

On 23/01/2024 20:14, David Hildenbrand wrote:
> On 23.01.24 20:43, Ryan Roberts wrote:
>> On 23/01/2024 19:33, David Hildenbrand wrote:
>>> On 23.01.24 20:15, Ryan Roberts wrote:
>>>> On 22/01/2024 19:41, David Hildenbrand wrote:
>>>>> Now that the rmap overhaul[1] is upstream that provides a clean interface
>>>>> for rmap batching, let's implement PTE batching during fork when processing
>>>>> PTE-mapped THPs.
>>>>>
>>>>> This series is partially based on Ryan's previous work[2] to implement
>>>>> cont-pte support on arm64, but its a complete rewrite based on [1] to
>>>>> optimize all architectures independent of any such PTE bits, and to
>>>>> use the new rmap batching functions that simplify the code and prepare
>>>>> for further rmap accounting changes.
>>>>>
>>>>> We collect consecutive PTEs that map consecutive pages of the same large
>>>>> folio, making sure that the other PTE bits are compatible, and (a) adjust
>>>>> the refcount only once per batch, (b) call rmap handling functions only
>>>>> once per batch and (c) perform batch PTE setting/updates.
>>>>>
>>>>> While this series should be beneficial for adding cont-pte support on
>>>>> ARM64[2], it's one of the requirements for maintaining a total mapcount[3]
>>>>> for large folios with minimal added overhead and further changes[4] that
>>>>> build up on top of the total mapcount.
>>>>
>>>> I'm currently rebasing my contpte work onto this series, and have hit a
>>>> problem.
>>>> I need to expose the "size" of a pte (pte_size()) and skip forward to the start
>>>> of the next (cont)pte every time through the folio_pte_batch() loop. But
>>>> pte_next_pfn() only allows advancing by 1 pfn; I need to advance by nr pfns:
>>>>
>>>>
>>>> static inline int folio_pte_batch(struct folio *folio, unsigned long addr,
>>>>          pte_t *start_ptep, pte_t pte, int max_nr, bool *any_writable)
>>>> {
>>>>      unsigned long folio_end_pfn = folio_pfn(folio) + folio_nr_pages(folio);
>>>>      const pte_t *end_ptep = start_ptep + max_nr;
>>>>      pte_t expected_pte = __pte_batch_clear_ignored(pte_next_pfn(pte));
>>>> -    pte_t *ptep = start_ptep + 1;
>>>> +    pte_t *ptep = start_ptep;
>>>> +    int vfn, nr, i;
>>>>      bool writable;
>>>>
>>>>      if (any_writable)
>>>>          *any_writable = false;
>>>>
>>>>      VM_WARN_ON_FOLIO(!pte_present(pte), folio);
>>>>
>>>> +    vfn = addr >> PAGE_SIZE;
>>>> +    nr = pte_size(pte);
>>>> +    nr = ALIGN_DOWN(vfn + nr, nr) - vfn;
>>>> +    ptep += nr;
>>>> +
>>>>      while (ptep != end_ptep) {
>>>> +        pte = ptep_get(ptep);
>>>>          nr = pte_size(pte);
>>>>          if (any_writable)
>>>>              writable = !!pte_write(pte);
>>>>          pte = __pte_batch_clear_ignored(pte);
>>>>
>>>>          if (!pte_same(pte, expected_pte))
>>>>              break;
>>>>
>>>>          /*
>>>>           * Stop immediately once we reached the end of the folio. In
>>>>           * corner cases the next PFN might fall into a different
>>>>           * folio.
>>>>           */
>>>> -        if (pte_pfn(pte) == folio_end_pfn)
>>>> +        if (pte_pfn(pte) >= folio_end_pfn)
>>>>              break;
>>>>
>>>>          if (any_writable)
>>>>              *any_writable |= writable;
>>>>
>>>> -        expected_pte = pte_next_pfn(expected_pte);
>>>> -        ptep++;
>>>> +        for (i = 0; i < nr; i++)
>>>> +            expected_pte = pte_next_pfn(expected_pte);
>>>> +        ptep += nr;
>>>>      }
>>>>
>>>>      return ptep - start_ptep;
>>>> }
>>>>
>>>>
>>>> So I'm wondering if instead of enabling pte_next_pfn() for all the arches,
>>>> perhaps its actually better to expose pte_pgprot() for all the arches. Then we
>>>> can be much more flexible about generating ptes with pfn_pte(pfn, pgprot).
>>>>
>>>> What do you think?
>>>
>>> The pte_pgprot() stuff is just nasty IMHO.
>>
>> I dunno; we have pfn_pte() which takes a pfn and a pgprot. It seems reasonable
>> that we should be able to do the reverse.
> 
> But pte_pgprot() is only available on a handful of architectures, no? It would
> be nice to have a completely generic pte_next_pfn() / pte_advance_pfns(), though.
> 
> Anyhow, this is all "easy" to rework later. Unless I am missing something, the
> low hanging fruit is simply using PFN_PTE_SHIFT for now that exists on most
> archs already.
> 
>>
>>>
>>> Likely it's best to simply convert pte_next_pfn() to something like
>>> pte_advance_pfns(). The we could just have
>>>
>>> #define pte_next_pfn(pte) pte_advance_pfns(pte, 1)
>>>
>>> That should be fairly easy to do on top (based on PFN_PTE_SHIFT). And only 3
>>> archs (x86-64, arm64, and powerpc) need slight care to replace a hardcoded "1"
>>> by an integer we pass in.
>>
>> I thought we agreed powerpc was safe to just define PFN_PTE_SHIFT? But, yeah,
>> the principle works I guess. I guess I can do this change along with my series.
> 
> It is, if nobody insists on that micro-optimization on powerpc.
> 
> If there is good reason to invest more time and effort right now on the
> pte_pgprot approach, then please let me know :)
> 

No I think you're right. I thought pte_pgprot() was implemented by more arches,
but there are 13 without it, so clearly a lot of effort to plug that gap. I'll
take the approach you suggest with pte_advance_pfns(). It'll just require mods
to x86 and arm64, +/- ppc.

