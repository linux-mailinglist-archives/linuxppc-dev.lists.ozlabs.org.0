Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90842116DBB
	for <lists+linuxppc-dev@lfdr.de>; Mon,  9 Dec 2019 14:12:34 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 47WkBP6kVrzDqQJ
	for <lists+linuxppc-dev@lfdr.de>; Tue, 10 Dec 2019 00:12:29 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=steven.price@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 47Wk3d27jKzDqKf
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 10 Dec 2019 00:06:34 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D6538328;
 Mon,  9 Dec 2019 05:06:30 -0800 (PST)
Received: from [10.1.194.43] (e112269-lin.cambridge.arm.com [10.1.194.43])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E43BF3F718;
 Mon,  9 Dec 2019 05:06:27 -0800 (PST)
Subject: Re: [PATCH v16 06/25] powerpc: mm: Add p?d_leaf() definitions
To: Michael Ellerman <mpe@ellerman.id.au>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org
References: <20191206135316.47703-1-steven.price@arm.com>
 <20191206135316.47703-7-steven.price@arm.com>
 <875ziprc27.fsf@mpe.ellerman.id.au>
From: Steven Price <steven.price@arm.com>
Message-ID: <6dec1a22-963a-226e-c7c8-c445daa35d29@arm.com>
Date: Mon, 9 Dec 2019 13:06:26 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <875ziprc27.fsf@mpe.ellerman.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: Mark Rutland <Mark.Rutland@arm.com>, Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, Will Deacon <will@kernel.org>, "Liang,
 Kan" <kan.liang@linux.intel.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 kvm-ppc@vger.kernel.org, =?UTF-8?B?SsOpcsO0bWUgR2xpc3Nl?= <jglisse@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/12/2019 11:08, Michael Ellerman wrote:
> Steven Price <steven.price@arm.com> writes:
>> walk_page_range() is going to be allowed to walk page tables other than
>> those of user space. For this it needs to know when it has reached a
>> 'leaf' entry in the page tables. This information is provided by the
>> p?d_leaf() functions/macros.
>>
>> For powerpc pmd_large() already exists and does what we want, so hoist
>> it out of the CONFIG_TRANSPARENT_HUGEPAGE condition and implement the
>> other levels. Macros are used to provide the generic p?d_leaf() names.
>>
>> CC: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> CC: Paul Mackerras <paulus@samba.org>
>> CC: Michael Ellerman <mpe@ellerman.id.au>
>> CC: linuxppc-dev@lists.ozlabs.org
>> CC: kvm-ppc@vger.kernel.org
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>  arch/powerpc/include/asm/book3s/64/pgtable.h | 30 ++++++++++++++------
>>  1 file changed, 21 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> index b01624e5c467..3dd7b6f5edd0 100644
>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>> @@ -923,6 +923,12 @@ static inline int pud_present(pud_t pud)
>>  	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PRESENT));
>>  }
>>  
>> +#define pud_leaf	pud_large
>> +static inline int pud_large(pud_t pud)
>> +{
>> +	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
>> +}
> 
> We already have:
> 
> #define pud_is_leaf pud_is_leaf
> static inline bool pud_is_leaf(pud_t pud)
> {
> 	return !!(pud_raw(pud) & cpu_to_be64(_PAGE_PTE));
> }
> 
> And so on.
> 
> These went in relatively recently in:
> 
>   d6eacedd1f0e ("powerpc/book3s: Use config independent helpers for page table walk")
> 
> 
> Assuming those all work for you, maybe your patch in this series should
> just do:
> 
> #define pud_leaf pud_is_leaf
> 
> And so on. And then we can do a patch later to change the arch/powerpc
> code to use pud_leaf() etc. directly and drop the "is" versions.

Thanks for pointing this out - these didn't exist when I started this
patch series, but yes it would be a good idea to make use of them now.
Followed by cleaning up to use the shorter p?d_leaf() versions in a
later patch.

Thanks,

Steve

> cheers
> 
> 
>> @@ -966,6 +972,12 @@ static inline int pgd_present(pgd_t pgd)
>>  	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PRESENT));
>>  }
>>  
>> +#define pgd_leaf	pgd_large
>> +static inline int pgd_large(pgd_t pgd)
>> +{
>> +	return !!(pgd_raw(pgd) & cpu_to_be64(_PAGE_PTE));
>> +}
>> +
>>  static inline pte_t pgd_pte(pgd_t pgd)
>>  {
>>  	return __pte_raw(pgd_raw(pgd));
>> @@ -1133,6 +1145,15 @@ static inline bool pmd_access_permitted(pmd_t pmd, bool write)
>>  	return pte_access_permitted(pmd_pte(pmd), write);
>>  }
>>  
>> +#define pmd_leaf	pmd_large
>> +/*
>> + * returns true for pmd migration entries, THP, devmap, hugetlb
>> + */
>> +static inline int pmd_large(pmd_t pmd)
>> +{
>> +	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
>> +}
>> +
>>  #ifdef CONFIG_TRANSPARENT_HUGEPAGE
>>  extern pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot);
>>  extern pmd_t mk_pmd(struct page *page, pgprot_t pgprot);
>> @@ -1159,15 +1180,6 @@ pmd_hugepage_update(struct mm_struct *mm, unsigned long addr, pmd_t *pmdp,
>>  	return hash__pmd_hugepage_update(mm, addr, pmdp, clr, set);
>>  }
>>  
>> -/*
>> - * returns true for pmd migration entries, THP, devmap, hugetlb
>> - * But compile time dependent on THP config
>> - */
>> -static inline int pmd_large(pmd_t pmd)
>> -{
>> -	return !!(pmd_raw(pmd) & cpu_to_be64(_PAGE_PTE));
>> -}
>> -
>>  static inline pmd_t pmd_mknotpresent(pmd_t pmd)
>>  {
>>  	return __pmd(pmd_val(pmd) & ~_PAGE_PRESENT);
>> -- 
>> 2.20.1
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
> 

