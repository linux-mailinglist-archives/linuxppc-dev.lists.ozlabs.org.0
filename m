Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id B00DA7AAB62
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 10:02:40 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPrZ4gkpz3dkG
	for <lists+linuxppc-dev@lfdr.de>; Fri, 22 Sep 2023 18:02:38 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4RsPMr4m0vz3dkv
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 22 Sep 2023 17:41:11 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3803DDA7;
	Fri, 22 Sep 2023 00:41:16 -0700 (PDT)
Received: from [10.57.65.11] (unknown [10.57.65.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 65CC23F5A1;
	Fri, 22 Sep 2023 00:40:29 -0700 (PDT)
Message-ID: <3358e732-8df9-4408-8249-384b102f5d75@arm.com>
Date: Fri, 22 Sep 2023 08:40:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 8/8] arm64: hugetlb: Fix set_huge_pte_at() to work with
 all swap entries
Content-Language: en-GB
To: Qi Zheng <zhengqi.arch@bytedance.com>
References: <20230921162007.1630149-1-ryan.roberts@arm.com>
 <20230921162007.1630149-9-ryan.roberts@arm.com>
 <217bb956-b9f6-1057-914b-436d4c775a8b@bytedance.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <217bb956-b9f6-1057-914b-436d4c775a8b@bytedance.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Sep 2023 17:56:48 +1000
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, Peter Xu <peterx@redhat.com>, "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, linux-mm@kvack.org, sparclinux@vger.kernel.org, Alexander Gordeev <agordeev@linux.ibm.com>, Will Deacon <will@kernel.org>, linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Helge Deller <deller@gmx.de>, Christoph Hellwig <hch@infradead.org>, Axel Rasmussen <axelrasmussen@google.com>, Gerald Schaefer <gerald.schaefer@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, Albert Ou <aou@eecs.berkeley.edu>, Arnd Bergmann <arnd@arndb.de>, Anshuman Khandual <anshuman.khandual@arm.com>, Heiko Carstens <hca@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, linux-arm-kernel@lists.infradead.org, SeongJae Park <sj@kernel.org>, Lorenzo Stoakes <lstoakes@gmail.com>, linux-parisc@vger.kernel.org, Muchun Song <muchun.song@linux.dev>, linux-kernel@vger.kernel
 .org, stable@vger.kernel.org, Uladzislau Rezki <urezki@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sven Schnelle <svens@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 22/09/2023 03:54, Qi Zheng wrote:
> Hi Ryan,
> 
> On 2023/9/22 00:20, Ryan Roberts wrote:
>> When called with a swap entry that does not embed a PFN (e.g.
>> PTE_MARKER_POISONED or PTE_MARKER_UFFD_WP), the previous implementation
>> of set_huge_pte_at() would either cause a BUG() to fire (if
>> CONFIG_DEBUG_VM is enabled) or cause a dereference of an invalid address
>> and subsequent panic.
>>
>> arm64's huge pte implementation supports multiple huge page sizes, some
>> of which are implemented in the page table with contiguous mappings. So
>> set_huge_pte_at() needs to work out how big the logical pte is, so that
>> it can also work out how many physical ptes (or pmds) need to be
>> written. It does this by grabbing the folio out of the pte and querying
>> its size.
>>
>> However, there are cases when the pte being set is actually a swap
>> entry. But this also used to work fine, because for huge ptes, we only
>> ever saw migration entries and hwpoison entries. And both of these types
>> of swap entries have a PFN embedded, so the code would grab that and
>> everything still worked out.
>>
>> But over time, more calls to set_huge_pte_at() have been added that set
>> swap entry types that do not embed a PFN. And this causes the code to go
>> bang. The triggering case is for the uffd poison test, commit
>> 99aa77215ad0 ("selftests/mm: add uffd unit test for UFFDIO_POISON"),
>> which sets a PTE_MARKER_POISONED swap entry. But review shows there are
>> other places too (PTE_MARKER_UFFD_WP).
>>
>> So the root cause is due to commit 18f3962953e4 ("mm: hugetlb: kill
>> set_huge_swap_pte_at()"), which aimed to simplify the interface to the
>> core code by removing set_huge_swap_pte_at() (which took a page size
>> parameter) and replacing it with calls to set_huge_swap_pte_at() where
>> the size was inferred from the folio, as descibed above. While that
>> commit didn't break anything at the time, 
> 
> If it didn't break anything at that time, then shouldn't the Fixes tag
> be added to this commit?
> 
>> it did break the interface
>> because it couldn't handle swap entries without PFNs. And since then new
>> callers have come along which rely on this working.
> 
> So the Fixes tag should be added only to the commit that introduces the
> first new callers?

Well I guess it's a matter of point of view; My view is that 18f3962953e4 is the
buggy change because it broke the interface to not be able to handle swap
entries which do not contain PFNs. The fact that there were no callers that used
the interface in this way at the time of the commit is irrelevant in my view.
But I already added 2 fixes tags; one for the buggy commit, and the other for
the commit containing the new user of the interface.

> 
> Other than that, LGTM.

Thanks!

> 
> Thanks,
> Qi
> 
>>
>> Now that we have modified the set_huge_pte_at() interface to pass the
>> vma, we can extract the huge page size from it and fix this issue.
>>
>> I'm tagging the commit that added the uffd poison feature, since that is
>> what exposed the problem, as well as the original change that broke the
>> interface. Hopefully this is valuable for people doing bisect.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> Fixes: 18f3962953e4 ("mm: hugetlb: kill set_huge_swap_pte_at()")
>> Fixes: 8a13897fb0da ("mm: userfaultfd: support UFFDIO_POISON for hugetlbfs")
>> ---
>>   arch/arm64/mm/hugetlbpage.c | 17 +++--------------
>>   1 file changed, 3 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index 844832511c1e..a08601a14689 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -241,13 +241,6 @@ static void clear_flush(struct mm_struct *mm,
>>       flush_tlb_range(&vma, saddr, addr);
>>   }
>>   -static inline struct folio *hugetlb_swap_entry_to_folio(swp_entry_t entry)
>> -{
>> -    VM_BUG_ON(!is_migration_entry(entry) && !is_hwpoison_entry(entry));
>> -
>> -    return page_folio(pfn_to_page(swp_offset_pfn(entry)));
>> -}
>> -
>>   void set_huge_pte_at(struct vm_area_struct *vma, unsigned long addr,
>>                   pte_t *ptep, pte_t pte)
>>   {
>> @@ -258,13 +251,10 @@ void set_huge_pte_at(struct vm_area_struct *vma,
>> unsigned long addr,
>>       unsigned long pfn, dpfn;
>>       pgprot_t hugeprot;
>>   -    if (!pte_present(pte)) {
>> -        struct folio *folio;
>> -
>> -        folio = hugetlb_swap_entry_to_folio(pte_to_swp_entry(pte));
>> -        ncontig = num_contig_ptes(folio_size(folio), &pgsize);
>> +    ncontig = num_contig_ptes(huge_page_size(hstate_vma(vma)), &pgsize);
>>   -        for (i = 0; i < ncontig; i++, ptep++)
>> +    if (!pte_present(pte)) {
>> +        for (i = 0; i < ncontig; i++, ptep++, addr += pgsize)
>>               set_pte_at(mm, addr, ptep, pte);
>>           return;
>>       }
>> @@ -274,7 +264,6 @@ void set_huge_pte_at(struct vm_area_struct *vma, unsigned
>> long addr,
>>           return;
>>       }
>>   -    ncontig = find_num_contig(mm, addr, ptep, &pgsize);
>>       pfn = pte_pfn(pte);
>>       dpfn = pgsize >> PAGE_SHIFT;
>>       hugeprot = pte_pgprot(pte);

