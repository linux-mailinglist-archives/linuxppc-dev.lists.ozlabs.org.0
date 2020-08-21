Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E2A024CC98
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 06:22:29 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXpJd3mjKzDqN0
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 14:22:25 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BXpGx09L9zDr31
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 14:20:55 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AD4431B;
 Thu, 20 Aug 2020 21:20:54 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 64AA13F6CF;
 Thu, 20 Aug 2020 21:20:52 -0700 (PDT)
Subject: Re: [PATCH v2 00/13] mm/debug_vm_pgtable fixes
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <87tuwyvjei.fsf@linux.ibm.com> <856eb6d7-9c09-728e-b374-d787145ac052@arm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <59e02206-6056-6272-cc89-cc7e4588c69b@arm.com>
Date: Fri, 21 Aug 2020 09:50:21 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <856eb6d7-9c09-728e-b374-d787145ac052@arm.com>
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



On 08/21/2020 09:03 AM, Anshuman Khandual wrote:
> 
> 
> On 08/19/2020 07:15 PM, Aneesh Kumar K.V wrote:
>> "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com> writes:
>>
>>> This patch series includes fixes for debug_vm_pgtable test code so that
>>> they follow page table updates rules correctly. The first two patches introduce
>>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
>>> merge them via ppc64 tree if required.
>>>
>>> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
>>> page table update rules.
>>>
>>> Changes from V1:
>>> * Address review feedback
>>> * drop test specific pfn_pte and pfn_pmd.
>>> * Update ppc64 page table helper to add _PAGE_PTE 
>>>
>>> Aneesh Kumar K.V (13):
>>>   powerpc/mm: Add DEBUG_VM WARN for pmd_clear
>>>   powerpc/mm: Move setting pte specific flags to pfn_pte
>>>   mm/debug_vm_pgtable/ppc64: Avoid setting top bits in radom value
>>>   mm/debug_vm_pgtables/hugevmap: Use the arch helper to identify huge
>>>     vmap support.
>>>   mm/debug_vm_pgtable/savedwrite: Enable savedwrite test with
>>>     CONFIG_NUMA_BALANCING
>>>   mm/debug_vm_pgtable/THP: Mark the pte entry huge before using
>>>     set_pmd/pud_at
>>>   mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use set_*_at to update an
>>>     existing pte entry
>>>   mm/debug_vm_pgtable/thp: Use page table depost/withdraw with THP
>>>   mm/debug_vm_pgtable/locks: Move non page table modifying test together
>>>   mm/debug_vm_pgtable/locks: Take correct page table lock
>>>   mm/debug_vm_pgtable/pmd_clear: Don't use pmd/pud_clear on pte entries
>>>   mm/debug_vm_pgtable/hugetlb: Disable hugetlb test on ppc64
>>>   mm/debug_vm_pgtable: populate a pte entry before fetching it
>>>
>>>  arch/powerpc/include/asm/book3s/64/pgtable.h |  29 +++-
>>>  arch/powerpc/include/asm/nohash/pgtable.h    |   5 -
>>>  arch/powerpc/mm/book3s64/pgtable.c           |   2 +-
>>>  arch/powerpc/mm/pgtable.c                    |   5 -
>>>  include/linux/io.h                           |  12 ++
>>>  mm/debug_vm_pgtable.c                        | 151 +++++++++++--------
>>>  6 files changed, 127 insertions(+), 77 deletions(-)
>>>
>>
>> BTW I picked a wrong branch when sending this. Attaching the diff
>> against what I want to send.  pfn_pmd() no more updates _PAGE_PTE
>> because that is handled by pmd_mkhuge().
>>
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 3b4da7c63e28..e18ae50a275c 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -141,7 +141,7 @@ pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>  	unsigned long pmdv;
>>  
>>  	pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>> -	return __pmd(pmdv | pgprot_val(pgprot) | _PAGE_PTE);
>> +	return pmd_set_protbits(__pmd(pmdv), pgprot);
>>  }
>>  
>>  pmd_t mk_pmd(struct page *page, pgprot_t pgprot)
>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>> index 7d9f8e1d790f..cad61d22f33a 100644
>> --- a/mm/debug_vm_pgtable.c
>> +++ b/mm/debug_vm_pgtable.c
>> @@ -229,7 +229,7 @@ static void __init pmd_huge_tests(pmd_t *pmdp, unsigned long pfn, pgprot_t prot)
>>  
>>  static void __init pmd_savedwrite_tests(unsigned long pfn, pgprot_t prot)
>>  {
>> -	pmd_t pmd = pfn_pmd(pfn, prot);
>> +	pmd_t pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>  
>>  	if (!IS_ENABLED(CONFIG_NUMA_BALANCING))
>>  		return;
>>
> 
> Cover letter does not mention which branch or tag this series applies on.
> Just assumed it to be 5.9-rc1. Should the above changes be captured as a
> pre-requisite patch ?
> 
> Anyways, the series fails to be build on arm64.
> 
> A) Without CONFIG_TRANSPARENT_HUGEPAGE
> 
> mm/debug_vm_pgtable.c: In function ‘debug_vm_pgtable’:
> mm/debug_vm_pgtable.c:1045:2: error: too many arguments to function ‘pmd_advanced_tests’
>   pmd_advanced_tests(mm, vma, pmdp, pmd_aligned, vaddr, prot, saved_ptep);
>   ^~~~~~~~~~~~~~~~~~
> mm/debug_vm_pgtable.c:366:20: note: declared here
>  static void __init pmd_advanced_tests(struct mm_struct *mm,
>                     ^~~~~~~~~~~~~~~~~~
> 
> B) As mentioned previously, this should be solved by including <linux/io.h>
> 
> mm/debug_vm_pgtable.c: In function ‘pmd_huge_tests’:
> mm/debug_vm_pgtable.c:215:7: error: implicit declaration of function ‘arch_ioremap_pmd_supported’; did you mean ‘arch_disable_smp_support’? [-Werror=implicit-function-declaration]
>   if (!arch_ioremap_pmd_supported())
>        ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Please make sure that the series builds on all enabled platforms i.e x86,
> arm64, ppc32, ppc64, arc, s390 along with selectively enabling/disabling
> all the features that make various #ifdefs in the test.
> 
> - Anshuman

Here is another build failure on x86.

mm/debug_vm_pgtable.c: In function ‘pud_advanced_tests’:
mm/debug_vm_pgtable.c:306:31: error: passing argument 1 of ‘pudp_huge_get_and_clear_full’ from incompatible pointer type [-Werror=incompatible-pointer-types]
  pudp_huge_get_and_clear_full(vma, vaddr, pudp, 1);
                               ^~~
In file included from ./include/linux/mm.h:33:0,
                 from ./include/linux/highmem.h:8,
                 from mm/debug_vm_pgtable.c:14:
./include/linux/pgtable.h:294:21: note: expected ‘struct mm_struct *’ but argument is of type ‘struct vm_area_struct *’
 static inline pud_t pudp_huge_get_and_clear_full(struct mm_struct *mm,
