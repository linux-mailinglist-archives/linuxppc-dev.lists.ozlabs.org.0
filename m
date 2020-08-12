Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 266E6242A76
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 15:37:09 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BRW2p2fvPzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Aug 2020 23:37:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BRW0G5130zDqQP
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Aug 2020 23:34:54 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8576131B;
 Wed, 12 Aug 2020 06:34:52 -0700 (PDT)
Received: from [10.163.66.87] (unknown [10.163.66.87])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AF5EB3F70D;
 Wed, 12 Aug 2020 06:34:50 -0700 (PDT)
Subject: Re: [PATCH 14/16] debug_vm_pgtable/hugetlb: Disable hugetlb test on
 ppc64
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-14-aneesh.kumar@linux.ibm.com>
 <d067c278-6391-72f1-75c2-ccbd52909233@arm.com>
 <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <83766a01-6ffb-798c-c5b9-46b2d672f618@arm.com>
Date: Wed, 12 Aug 2020 19:04:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <efc8f8c8-c16d-0826-9401-a45005ecaf62@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 08/12/2020 06:46 PM, Aneesh Kumar K.V wrote:
> On 8/12/20 6:33 PM, Anshuman Khandual wrote:
>>
>>
>> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>>> The seems to be missing quite a lot of details w.r.t allocating
>>> the correct pgtable_t page (huge_pte_alloc()), holding the right
>>> lock (huge_pte_lock()) etc. The vma used is also not a hugetlb VMA.
>>>
>>> ppc64 do have runtime checks within CONFIG_DEBUG_VM for most of these.
>>> Hence disable the test on ppc64.
>>
>> This test is free from any platform specific #ifdefs which should
>> never be broken. If hugetlb_advanced_tests() does not work or is
>> not detailed enough for ppc64, then it would be great if you could
>> suggest some improvements so that it works for all enabled platforms.
>>
>>
> 
> As mentioned the test is broken. For hugetlb, the pgtable_t pages should be allocated by huge_pte_alloc(). We need to hold huget_pte_lock() before  updating huge tlb pte. That takes hugepage size, which is mostly derived out of vma. Hence vma need to be a hugetlb vma. Some of the functions also depend on hstate. Also we should use set_huge_pte_at() when setting up hugetlb pte entries. I was tempted to remove that test completely marking it broken. But avoided that by marking it broken on only PPC64.

The test is not broken, hugetlb helpers on multiple platforms dont complain about
this at all. The tests here emulate 'enough' MM objects required for the helpers
on enabled platforms, to perform the primary task i.e page table transformation it
is expected to do. The test does not claim to emulate a perfect MM environment for
a given subsystem's (like HugeTLB) arch helpers. Now in this case, the MM objects
being emulated for the HugeTLB advanced tests does not seem to be sufficient for
ppc64 but it can be improved. But that does not mean it is broken in it's current
form for other platforms.

> 
> 
> 
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   mm/debug_vm_pgtable.c | 6 +++++-
>>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index 529892b9be2f..3e112d0ba1b2 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -800,6 +800,7 @@ static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot)
>>>   #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
>>>   }
>>>   +#ifndef CONFIG_PPC_BOOK3S_64
>>>   static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>>>                         struct vm_area_struct *vma,
>>>                         pte_t *ptep, unsigned long pfn,
>>> @@ -842,6 +843,7 @@ static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>>>       pte = huge_ptep_get(ptep);
>>>       WARN_ON(!(huge_pte_write(pte) && huge_pte_dirty(pte)));
>>>   }
>>> +#endif
>>>   #else  /* !CONFIG_HUGETLB_PAGE */
>>>   static void __init hugetlb_basic_tests(unsigned long pfn, pgprot_t prot) { }
>>>   static void __init hugetlb_advanced_tests(struct mm_struct *mm,
>>> @@ -1053,7 +1055,9 @@ static int __init debug_vm_pgtable(void)
>>>       pud_populate_tests(mm, pudp, saved_pmdp);
>>>       spin_unlock(ptl);
>>>   -    //hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>> +#ifndef CONFIG_PPC_BOOK3S_64
>>> +    hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>>> +#endif
>>>         spin_lock(&mm->page_table_lock);
>>>       p4d_clear_tests(mm, p4dp);
>>>
> 
> 
