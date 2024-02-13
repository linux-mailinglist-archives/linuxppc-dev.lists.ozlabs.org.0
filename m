Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C1689853692
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 17:49:50 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6kN5FGkz3vXh
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 03:49:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ6jz62WFz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 03:49:26 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4E6F9DA7;
	Tue, 13 Feb 2024 08:49:36 -0800 (PST)
Received: from [10.1.36.184] (XHFQ2J9959.cambridge.arm.com [10.1.36.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4EA173F5A1;
	Tue, 13 Feb 2024 08:48:51 -0800 (PST)
Message-ID: <aaf2bc8e-3fe3-4d41-ab5b-fca99b33c8a4@arm.com>
Date: Tue, 13 Feb 2024 16:48:50 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 21/25] arm64/mm: Implement new
 [get_and_]clear_full_ptes() batch APIs
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-22-ryan.roberts@arm.com>
 <ZcucHyb1OBG677gx@FVFF77S0Q05N.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <ZcucHyb1OBG677gx@FVFF77S0Q05N.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, x86@kernel.org, David Hildenbrand <david@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Yang Shi <shy828301@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>, Alistair Popple <apopple@nvidia.com>, Barry Song <21cnbao@gmail.com>, Matthew Wilcox <willy@infradead.org>, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, Zi Yan <ziy@nvidia.com>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, John Hubbard <jhubbard@nvidia.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 13/02/2024 16:43, Mark Rutland wrote:
> On Fri, Feb 02, 2024 at 08:07:52AM +0000, Ryan Roberts wrote:
>> Optimize the contpte implementation to fix some of the
>> exit/munmap/dontneed performance regression introduced by the initial
>> contpte commit. Subsequent patches will solve it entirely.
>>
>> During exit(), munmap() or madvise(MADV_DONTNEED), mappings must be
>> cleared. Previously this was done 1 PTE at a time. But the core-mm
>> supports batched clear via the new [get_and_]clear_full_ptes() APIs. So
>> let's implement those APIs and for fully covered contpte mappings, we no
>> longer need to unfold the contpte. This significantly reduces unfolding
>> operations, reducing the number of tlbis that must be issued.
>>
>> Tested-by: John Hubbard <jhubbard@nvidia.com>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 67 ++++++++++++++++++++++++++++++++
>>  arch/arm64/mm/contpte.c          | 17 ++++++++
>>  2 files changed, 84 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index c07f0d563733..ad04adb7b87f 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -965,6 +965,37 @@ static inline pte_t __ptep_get_and_clear(struct mm_struct *mm,
>>  	return pte;
>>  }
>>  
>> +static inline void __clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, unsigned int nr, int full)
>> +{
>> +	for (;;) {
>> +		__ptep_get_and_clear(mm, addr, ptep);
>> +		if (--nr == 0)
>> +			break;
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +	}
>> +}
> 
> The loop construct is a bit odd; can't this be:

I found it a little odd at first, but its avoiding the ptep and addr increments
the last time through the loop. Its the preferred pattern for these functions in
core-mm. See default set_ptes(), wrprotect_ptes(), clear_full_ptes() in
include/linux/pgtable.h.

So I'd prefer to leave it as is so that we match them. What do you think?

> 
> 	while (nr--) {
> 		__ptep_get_and_clear(mm, addr, ptep);
> 		ptep++;
> 		addr += PAGE_SIZE;
> 	}
> 
> ... or:
> 
> 	do {
> 		__ptep_get_and_clear(mm, addr, ptep);
> 		ptep++;
> 		addr += PAGE_SIZE;
> 	} while (--nr);
> 
> ... ?
> 
> Otherwise, this looks good to me.
> 
> Mark.
> 
>> +
>> +static inline pte_t __get_and_clear_full_ptes(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep,
>> +				unsigned int nr, int full)
>> +{
>> +	pte_t pte, tmp_pte;
>> +
>> +	pte = __ptep_get_and_clear(mm, addr, ptep);
>> +	while (--nr) {
>> +		ptep++;
>> +		addr += PAGE_SIZE;
>> +		tmp_pte = __ptep_get_and_clear(mm, addr, ptep);
>> +		if (pte_dirty(tmp_pte))
>> +			pte = pte_mkdirty(pte);
>> +		if (pte_young(tmp_pte))
>> +			pte = pte_mkyoung(pte);
>> +	}
>> +	return pte;
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  #define __HAVE_ARCH_PMDP_HUGE_GET_AND_CLEAR
>>  static inline pmd_t pmdp_huge_get_and_clear(struct mm_struct *mm,
>> @@ -1167,6 +1198,11 @@ extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
>>  extern pte_t contpte_ptep_get_lockless(pte_t *orig_ptep);
>>  extern void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
>>  				pte_t *ptep, pte_t pte, unsigned int nr);
>> +extern void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, unsigned int nr, int full);
>> +extern pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep,
>> +				unsigned int nr, int full);
>>  extern int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>  				unsigned long addr, pte_t *ptep);
>>  extern int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
>> @@ -1254,6 +1290,35 @@ static inline void pte_clear(struct mm_struct *mm,
>>  	__pte_clear(mm, addr, ptep);
>>  }
>>  
>> +#define clear_full_ptes clear_full_ptes
>> +static inline void clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, unsigned int nr, int full)
>> +{
>> +	if (likely(nr == 1)) {
>> +		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +		__clear_full_ptes(mm, addr, ptep, nr, full);
>> +	} else {
>> +		contpte_clear_full_ptes(mm, addr, ptep, nr, full);
>> +	}
>> +}
>> +
>> +#define get_and_clear_full_ptes get_and_clear_full_ptes
>> +static inline pte_t get_and_clear_full_ptes(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep,
>> +				unsigned int nr, int full)
>> +{
>> +	pte_t pte;
>> +
>> +	if (likely(nr == 1)) {
>> +		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>> +		pte = __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
>> +	} else {
>> +		pte = contpte_get_and_clear_full_ptes(mm, addr, ptep, nr, full);
>> +	}
>> +
>> +	return pte;
>> +}
>> +
>>  #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
>>  static inline pte_t ptep_get_and_clear(struct mm_struct *mm,
>>  				unsigned long addr, pte_t *ptep)
>> @@ -1338,6 +1403,8 @@ static inline int ptep_set_access_flags(struct vm_area_struct *vma,
>>  #define set_pte					__set_pte
>>  #define set_ptes				__set_ptes
>>  #define pte_clear				__pte_clear
>> +#define clear_full_ptes				__clear_full_ptes
>> +#define get_and_clear_full_ptes			__get_and_clear_full_ptes
>>  #define __HAVE_ARCH_PTEP_GET_AND_CLEAR
>>  #define ptep_get_and_clear			__ptep_get_and_clear
>>  #define __HAVE_ARCH_PTEP_TEST_AND_CLEAR_YOUNG
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index c85e64baf03b..80346108450b 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -207,6 +207,23 @@ void contpte_set_ptes(struct mm_struct *mm, unsigned long addr,
>>  }
>>  EXPORT_SYMBOL(contpte_set_ptes);
>>  
>> +void contpte_clear_full_ptes(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, unsigned int nr, int full)
>> +{
>> +	contpte_try_unfold_partial(mm, addr, ptep, nr);
>> +	__clear_full_ptes(mm, addr, ptep, nr, full);
>> +}
>> +EXPORT_SYMBOL(contpte_clear_full_ptes);
>> +
>> +pte_t contpte_get_and_clear_full_ptes(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep,
>> +				unsigned int nr, int full)
>> +{
>> +	contpte_try_unfold_partial(mm, addr, ptep, nr);
>> +	return __get_and_clear_full_ptes(mm, addr, ptep, nr, full);
>> +}
>> +EXPORT_SYMBOL(contpte_get_and_clear_full_ptes);
>> +
>>  int contpte_ptep_test_and_clear_young(struct vm_area_struct *vma,
>>  					unsigned long addr, pte_t *ptep)
>>  {
>> -- 
>> 2.25.1
>>

