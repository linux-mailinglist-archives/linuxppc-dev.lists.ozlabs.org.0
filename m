Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 845726A68F8
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 09:34:02 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRSFN2jg9z3cLs
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Mar 2023 19:34:00 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4PRSDl3P9bz3c3N
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Mar 2023 19:33:24 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A9F72F4;
	Wed,  1 Mar 2023 00:33:35 -0800 (PST)
Received: from [10.162.41.9] (unknown [10.162.41.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 71C0F3F99C;
	Wed,  1 Mar 2023 00:32:48 -0800 (PST)
Message-ID: <10b92874-222a-6f4d-2542-092c5a5e72db@arm.com>
Date: Wed, 1 Mar 2023 14:02:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH V2] mm: Merge pte_mkhuge() call into arch_make_huge_pte()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>
References: <1643860669-26307-1-git-send-email-anshuman.khandual@arm.com>
 <1ea45095-0926-a56a-a273-816709e9075e@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <1ea45095-0926-a56a-a273-816709e9075e@csgroup.eu>
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
Cc: Catalin Marinas <catalin.marinas@arm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Paul Mackerras <paulus@samba.org>, "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, "David S. Miller" <davem@davemloft.net>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, Mike Kravetz <mike.kravetz@oracle.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 3/1/23 12:26, Christophe Leroy wrote:
> Hi,
> 
> Le 03/02/2022 à 04:57, Anshuman Khandual a écrit :
>> Each call into pte_mkhuge() is invariably followed by arch_make_huge_pte().
>> Instead arch_make_huge_pte() can accommodate pte_mkhuge() at the beginning.
>> This updates generic fallback stub for arch_make_huge_pte() and available
>> platforms definitions. This makes huge pte creation much cleaner and easier
>> to follow.
> 
> I can't remember, what was the reason for not doing it in 
> remove_migration_pte() as well ?
> Looking at it, I have the feeling that we now have a redundant 
> pte_mkhuge() there.

I guess it just got missed out, but you are right, there seems to be a redundant
pte_mkhuge() in remove_migration_pte(), I will send out a patch dropping it off.

> 
> Also, could we get rid of the one in mm/debug_vm_pgtable.c ?

After this patch, arch_make_huge_pte() should be used instead in generic MM for
all cases. So you are suggesting arch_make_huge_pte() should be tested instead ?

diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
index c631ade3f1d2..15ee86034ddc 100644
--- a/mm/debug_vm_pgtable.c
+++ b/mm/debug_vm_pgtable.c
@@ -909,7 +909,7 @@ static void __init hugetlb_basic_tests(struct pgtable_debug_args *args)
 #ifdef CONFIG_ARCH_WANT_GENERAL_HUGETLB
        pte = pfn_pte(args->fixed_pmd_pfn, args->page_prot);
 
-       WARN_ON(!pte_huge(pte_mkhuge(pte)));
+       WARN_ON(!pte_huge(arch_make_huge_pte(pte)));
 #endif /* CONFIG_ARCH_WANT_GENERAL_HUGETLB */
 }
 #else  /* !CONFIG_HUGETLB_PAGE */

> 
> Also, shouldn't arch_make_huge_pte() be documented in 
> Documentation/vm/arch_pgtable_helpers.rst instead of pte_mkhuge() ?

diff --git a/Documentation/mm/arch_pgtable_helpers.rst b/Documentation/mm/arch_pgtable_helpers.rst
index fd2a19df884e..07a0618f84de 100644
--- a/Documentation/mm/arch_pgtable_helpers.rst
+++ b/Documentation/mm/arch_pgtable_helpers.rst
@@ -216,7 +216,7 @@ HugeTLB Page Table Helpers
 +---------------------------+--------------------------------------------------+
 | pte_huge                  | Tests a HugeTLB                                  |
 +---------------------------+--------------------------------------------------+
-| pte_mkhuge                | Creates a HugeTLB                                |
+| arch_make_huge_pte        | Creates a HugeTLB                                |
 +---------------------------+--------------------------------------------------+
 | huge_pte_dirty            | Tests a dirty HugeTLB                            |
 +---------------------------+--------------------------------------------------+

I will send out a patch implementing the above changes. I guess pte_mkhuge() now
will just be a platform helper, which can be folded into arch_make_huge_pte() if
and when required.

- Anshuman

> 
> Christophe
> 
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Mike Kravetz <mike.kravetz@oracle.com>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> This applies on v5.17-rc2
>>
>> Changes in V2:
>>
>> - Direct PTE encode in arch_make_huge_pte() on powerpc platform per Christophe
>>
>> Changes in V1:
>>
>> https://lore.kernel.org/all/1643780286-18798-1-git-send-email-anshuman.khandual@arm.com/
>>
>>   arch/arm64/mm/hugetlbpage.c                      | 1 +
>>   arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h | 4 ++--
>>   arch/sparc/mm/hugetlbpage.c                      | 1 +
>>   include/linux/hugetlb.h                          | 2 +-
>>   mm/hugetlb.c                                     | 3 +--
>>   mm/vmalloc.c                                     | 1 -
>>   6 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
>> index ffb9c229610a..228226c5fa80 100644
>> --- a/arch/arm64/mm/hugetlbpage.c
>> +++ b/arch/arm64/mm/hugetlbpage.c
>> @@ -347,6 +347,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>>   {
>>   	size_t pagesize = 1UL << shift;
>>   
>> +	entry = pte_mkhuge(entry);
>>   	if (pagesize == CONT_PTE_SIZE) {
>>   		entry = pte_mkcont(entry);
>>   	} else if (pagesize == CONT_PMD_SIZE) {
>> diff --git a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
>> index 64b6c608eca4..de092b04ee1a 100644
>> --- a/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
>> +++ b/arch/powerpc/include/asm/nohash/32/hugetlb-8xx.h
>> @@ -71,9 +71,9 @@ static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags
>>   	size_t size = 1UL << shift;
>>   
>>   	if (size == SZ_16K)
>> -		return __pte(pte_val(entry) & ~_PAGE_HUGE);
>> +		return __pte(pte_val(entry) | _PAGE_SPS);
>>   	else
>> -		return entry;
>> +		return __pte(pte_val(entry) | _PAGE_SPS | _PAGE_HUGE);
>>   }
>>   #define arch_make_huge_pte arch_make_huge_pte
>>   #endif
>> diff --git a/arch/sparc/mm/hugetlbpage.c b/arch/sparc/mm/hugetlbpage.c
>> index 0f49fada2093..d8e0e3c7038d 100644
>> --- a/arch/sparc/mm/hugetlbpage.c
>> +++ b/arch/sparc/mm/hugetlbpage.c
>> @@ -181,6 +181,7 @@ pte_t arch_make_huge_pte(pte_t entry, unsigned int shift, vm_flags_t flags)
>>   {
>>   	pte_t pte;
>>   
>> +	entry = pte_mkhuge(entry);
>>   	pte = hugepage_shift_to_tte(entry, shift);
>>   
>>   #ifdef CONFIG_SPARC64
>> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
>> index d1897a69c540..52c462390aee 100644
>> --- a/include/linux/hugetlb.h
>> +++ b/include/linux/hugetlb.h
>> @@ -754,7 +754,7 @@ static inline void arch_clear_hugepage_flags(struct page *page) { }
>>   static inline pte_t arch_make_huge_pte(pte_t entry, unsigned int shift,
>>   				       vm_flags_t flags)
>>   {
>> -	return entry;
>> +	return pte_mkhuge(entry);
>>   }
>>   #endif
>>   
>> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
>> index 61895cc01d09..5ca253c1b4e4 100644
>> --- a/mm/hugetlb.c
>> +++ b/mm/hugetlb.c
>> @@ -4637,7 +4637,6 @@ static pte_t make_huge_pte(struct vm_area_struct *vma, struct page *page,
>>   					   vma->vm_page_prot));
>>   	}
>>   	entry = pte_mkyoung(entry);
>> -	entry = pte_mkhuge(entry);
>>   	entry = arch_make_huge_pte(entry, shift, vma->vm_flags);
>>   
>>   	return entry;
>> @@ -6172,7 +6171,7 @@ unsigned long hugetlb_change_protection(struct vm_area_struct *vma,
>>   			unsigned int shift = huge_page_shift(hstate_vma(vma));
>>   
>>   			old_pte = huge_ptep_modify_prot_start(vma, address, ptep);
>> -			pte = pte_mkhuge(huge_pte_modify(old_pte, newprot));
>> +			pte = huge_pte_modify(old_pte, newprot);
>>   			pte = arch_make_huge_pte(pte, shift, vma->vm_flags);
>>   			huge_ptep_modify_prot_commit(vma, address, ptep, old_pte, pte);
>>   			pages++;
>> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
>> index 4165304d3547..d0b14dd73adc 100644
>> --- a/mm/vmalloc.c
>> +++ b/mm/vmalloc.c
>> @@ -118,7 +118,6 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>   		if (size != PAGE_SIZE) {
>>   			pte_t entry = pfn_pte(pfn, prot);
>>   
>> -			entry = pte_mkhuge(entry);
>>   			entry = arch_make_huge_pte(entry, ilog2(size), 0);
>>   			set_huge_pte_at(&init_mm, addr, pte, entry);
>>   			pfn += PFN_DOWN(size);
