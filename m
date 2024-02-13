Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC93085396C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 13 Feb 2024 19:06:10 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ8QS6JcNz3dW4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Feb 2024 05:06:08 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=ryan.roberts@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TZ8Q33htYz3c5f
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Feb 2024 05:05:46 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C4011FB;
	Tue, 13 Feb 2024 10:05:56 -0800 (PST)
Received: from [10.1.36.184] (XHFQ2J9959.cambridge.arm.com [10.1.36.184])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 08BDE3F766;
	Tue, 13 Feb 2024 10:05:10 -0800 (PST)
Message-ID: <5b4ab6d9-1078-4834-91c4-8715c27b861f@arm.com>
Date: Tue, 13 Feb 2024 18:05:09 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/25] arm64/mm: Automatically fold contpte mappings
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
References: <20240202080756.1453939-1-ryan.roberts@arm.com>
 <20240202080756.1453939-26-ryan.roberts@arm.com>
 <Zcuqd9e359L0SVPC@FVFF77S0Q05N.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Zcuqd9e359L0SVPC@FVFF77S0Q05N.cambridge.arm.com>
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

On 13/02/2024 17:44, Mark Rutland wrote:
> On Fri, Feb 02, 2024 at 08:07:56AM +0000, Ryan Roberts wrote:
>> There are situations where a change to a single PTE could cause the
>> contpte block in which it resides to become foldable (i.e. could be
>> repainted with the contiguous bit). Such situations arise, for example,
>> when user space temporarily changes protections, via mprotect, for
>> individual pages, such can be the case for certain garbage collectors.
>>
>> We would like to detect when such a PTE change occurs. However this can
>> be expensive due to the amount of checking required. Therefore only
>> perform the checks when an indiviual PTE is modified via mprotect
>> (ptep_modify_prot_commit() -> set_pte_at() -> set_ptes(nr=1)) and only
>> when we are setting the final PTE in a contpte-aligned block.
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
>> ---
>>  arch/arm64/include/asm/pgtable.h | 26 +++++++++++++
>>  arch/arm64/mm/contpte.c          | 64 ++++++++++++++++++++++++++++++++
>>  2 files changed, 90 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
>> index cdc310880a3b..d3357fe4eb89 100644
>> --- a/arch/arm64/include/asm/pgtable.h
>> +++ b/arch/arm64/include/asm/pgtable.h
>> @@ -1192,6 +1192,8 @@ void vmemmap_update_pte(unsigned long addr, pte_t *ptep, pte_t pte);
>>   * where it is possible and makes sense to do so. The PTE_CONT bit is considered
>>   * a private implementation detail of the public ptep API (see below).
>>   */
>> +extern void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>> +				pte_t *ptep, pte_t pte);
>>  extern void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>  				pte_t *ptep, pte_t pte);
>>  extern pte_t contpte_ptep_get(pte_t *ptep, pte_t orig_pte);
>> @@ -1213,6 +1215,29 @@ extern int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>>  				unsigned long addr, pte_t *ptep,
>>  				pte_t entry, int dirty);
>>  
>> +static __always_inline void contpte_try_fold(struct mm_struct *mm,
>> +				unsigned long addr, pte_t *ptep, pte_t pte)
>> +{
>> +	/*
>> +	 * Only bother trying if both the virtual and physical addresses are
>> +	 * aligned and correspond to the last entry in a contig range. The core
>> +	 * code mostly modifies ranges from low to high, so this is the likely
>> +	 * the last modification in the contig range, so a good time to fold.
>> +	 * We can't fold special mappings, because there is no associated folio.
>> +	 */
>> +
>> +	const unsigned long contmask = CONT_PTES - 1;
>> +	bool valign = ((addr >> PAGE_SHIFT) & contmask) == contmask;
>> +
>> +	if (unlikely(valign)) {
>> +		bool palign = (pte_pfn(pte) & contmask) == contmask;
>> +
>> +		if (unlikely(palign &&
>> +		    pte_valid(pte) && !pte_cont(pte) && !pte_special(pte)))
>> +			__contpte_try_fold(mm, addr, ptep, pte);
>> +	}
>> +}
>> +
>>  static __always_inline void contpte_try_unfold(struct mm_struct *mm,
>>  				unsigned long addr, pte_t *ptep, pte_t pte)
>>  {
>> @@ -1287,6 +1312,7 @@ static __always_inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>>  	if (likely(nr == 1)) {
>>  		contpte_try_unfold(mm, addr, ptep, __ptep_get(ptep));
>>  		__set_ptes(mm, addr, ptep, pte, 1);
>> +		contpte_try_fold(mm, addr, ptep, pte);
>>  	} else {
>>  		contpte_set_ptes(mm, addr, ptep, pte, nr);
>>  	}
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index 80346108450b..2c7dafd0552a 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
>> @@ -67,6 +67,70 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
>>  	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
>>  }
>>  
>> +void __contpte_try_fold(struct mm_struct *mm, unsigned long addr,
>> +			pte_t *ptep, pte_t pte)
>> +{
>> +	/*
>> +	 * We have already checked that the virtual and pysical addresses are
>> +	 * correctly aligned for a contpte mapping in contpte_try_fold() so the
>> +	 * remaining checks are to ensure that the contpte range is fully
>> +	 * covered by a single folio, and ensure that all the ptes are valid
>> +	 * with contiguous PFNs and matching prots. We ignore the state of the
>> +	 * access and dirty bits for the purpose of deciding if its a contiguous
>> +	 * range; the folding process will generate a single contpte entry which
>> +	 * has a single access and dirty bit. Those 2 bits are the logical OR of
>> +	 * their respective bits in the constituent pte entries. In order to
>> +	 * ensure the contpte range is covered by a single folio, we must
>> +	 * recover the folio from the pfn, but special mappings don't have a
>> +	 * folio backing them. Fortunately contpte_try_fold() already checked
>> +	 * that the pte is not special - we never try to fold special mappings.
>> +	 * Note we can't use vm_normal_page() for this since we don't have the
>> +	 * vma.
>> +	 */
>> +
>> +	unsigned long folio_saddr, folio_eaddr;
>> +	unsigned long cont_saddr, cont_eaddr;
>> +	pte_t expected_pte, subpte;
>> +	struct folio *folio;
>> +	struct page *page;
>> +	unsigned long pfn;
>> +	pte_t *orig_ptep;
>> +	pgprot_t prot;
>> +
>> +	int i;
>> +
>> +	if (!mm_is_user(mm))
>> +		return;
>> +
>> +	page = pte_page(pte);
>> +	folio = page_folio(page);
>> +	folio_saddr = addr - (page - &folio->page) * PAGE_SIZE;
>> +	folio_eaddr = folio_saddr + folio_nr_pages(folio) * PAGE_SIZE;
>> +	cont_saddr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
>> +	cont_eaddr = cont_saddr + CONT_PTE_SIZE;
> 
> I assume that the 's' in *_sddar is for "start", and the 'e' in *_eaddr is for
> "end". Could we use "start" and "end" directly, e.g. folio_start, folio_end?

ACK; will fix.

> 
>> +
>> +	if (folio_saddr > cont_saddr || folio_eaddr < cont_eaddr)
>> +		return;
>> +
>> +	pfn = pte_pfn(pte) - ((addr - cont_saddr) >> PAGE_SHIFT);
> 
> IIUC this should be the same as:
> 
> 	pfn = ALIGN_DOWN(pte_pfn(pte), NR_CONT_PTES);
> 
> ... which would align with the way we generate 'cont_saddr' above.

ACK; will fix.

> 
> Otherwise, this looks good to me.

Great thanks!

I'll get these changes done and rebase onto mm-unstable once David's zap
batching series is in, retest and re-post (hopefully in the next couple of days!)

> 
> Mark.
> 
>> +	prot = pte_pgprot(pte_mkold(pte_mkclean(pte)));
>> +	expected_pte = pfn_pte(pfn, prot);
>> +	orig_ptep = ptep;
>> +	ptep = contpte_align_down(ptep);
>> +
>> +	for (i = 0; i < CONT_PTES; i++) {
>> +		subpte = pte_mkold(pte_mkclean(__ptep_get(ptep)));
>> +		if (!pte_same(subpte, expected_pte))
>> +			return;
>> +		expected_pte = pte_advance_pfn(expected_pte, 1);
>> +		ptep++;
>> +	}
>> +
>> +	pte = pte_mkcont(pte);
>> +	contpte_convert(mm, addr, orig_ptep, pte);
>> +}
>> +EXPORT_SYMBOL(__contpte_try_fold);
>> +
>>  void __contpte_try_unfold(struct mm_struct *mm, unsigned long addr,
>>  			pte_t *ptep, pte_t pte)
>>  {
>> -- 
>> 2.25.1
>>

