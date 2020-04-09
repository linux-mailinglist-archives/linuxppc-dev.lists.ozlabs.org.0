Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4225C1A2D33
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 03:08:14 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48yNLM2t1CzDr6L
	for <lists+linuxppc-dev@lfdr.de>; Thu,  9 Apr 2020 11:08:11 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 48yNJl26g9zDr45
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  9 Apr 2020 11:06:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 371301FB;
 Wed,  8 Apr 2020 18:06:43 -0700 (PDT)
Received: from [10.163.1.2] (unknown [10.163.1.2])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16C383F73D;
 Wed,  8 Apr 2020 18:06:32 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH V2 0/3] mm/debug: Add more arch page table helper tests
To: Gerald Schaefer <gerald.schaefer@de.ibm.com>
References: <1585027375-9997-1-git-send-email-anshuman.khandual@arm.com>
 <20200331143059.29fca8fa@thinkpad>
 <e3e35885-6852-16aa-3889-e22750a0cc87@arm.com>
 <20200407175440.41cc00a5@thinkpad>
 <253cf5c8-e43e-5737-24e8-3eda3b6ba7b3@arm.com>
 <20200408141500.75b2e1a7@thinkpad>
Message-ID: <b35210ec-7084-9c77-bdf5-820cfc7f96bc@arm.com>
Date: Thu, 9 Apr 2020 06:36:23 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200408141500.75b2e1a7@thinkpad>
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
Cc: linux-doc@vger.kernel.org, Heiko Carstens <heiko.carstens@de.ibm.com>,
 linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>,
 "H. Peter Anvin" <hpa@zytor.com>, linux-riscv@lists.infradead.org,
 Will Deacon <will@kernel.org>, linux-arch@vger.kernel.org,
 linux-s390@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, linux-snps-arc@lists.infradead.org,
 Vasily Gorbik <gor@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A . Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Vineet Gupta <vgupta@synopsys.com>, linux-kernel@vger.kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 04/08/2020 05:45 PM, Gerald Schaefer wrote:
> On Wed, 8 Apr 2020 12:41:51 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
> [...]
>>>   
>>>>
>>>> Some thing like this instead.
>>>>
>>>> pte_t pte = READ_ONCE(*ptep);
>>>> pte = pte_mkhuge(__pte((pte_val(pte) | RANDOM_ORVALUE) & PMD_MASK));
>>>>
>>>> We cannot use mk_pte_phys() as it is defined only on some platforms
>>>> without any generic fallback for others.  
>>>
>>> Oh, didn't know that, sorry. What about using mk_pte() instead, at least
>>> it would result in a present pte:
>>>
>>> pte = pte_mkhuge(mk_pte(phys_to_page(RANDOM_ORVALUE & PMD_MASK), prot));  
>>
>> Lets use mk_pte() here but can we do this instead
>>
>> paddr = (__pfn_to_phys(pfn) | RANDOM_ORVALUE) & PMD_MASK;
>> pte = pte_mkhuge(mk_pte(phys_to_page(paddr), prot));
>>
> 
> Sure, that will also work.
> 
> BTW, this RANDOM_ORVALUE is not really very random, the way it is
> defined. For s390 we already changed it to mask out some arch bits,
> but I guess there are other archs and bits that would always be
> set with this "not so random" value, and I wonder if/how that would
> affect all the tests using this value, see also below.

RANDOM_ORVALUE is a constant which was added in order to make sure
that the page table entries should have some non-zero value before
getting called with pxx_clear() and followed by a pxx_none() check.
This is currently used only in pxx_clear_tests() tests. Hence there
is no impact for the existing tests.

> 
>>>
>>> And if you also want to do some with the existing value, which seems
>>> to be an empty pte, then maybe just check if writing and reading that
>>> value with set_huge_pte_at() / huge_ptep_get() returns the same,
>>> i.e. initially w/o RANDOM_ORVALUE.
>>>
>>> So, in combination, like this (BTW, why is the barrier() needed, it
>>> is not used for the other set_huge_pte_at() calls later?):  
>>
>> Ahh missed, will add them. Earlier we faced problem without it after
>> set_pte_at() for a test on powerpc (64) platform. Hence just added it
>> here to be extra careful.
>>
>>>
>>> @@ -733,24 +733,28 @@ static void __init hugetlb_advanced_test
>>>         struct page *page = pfn_to_page(pfn);
>>>         pte_t pte = READ_ONCE(*ptep);
>>>  
>>> -       pte = __pte(pte_val(pte) | RANDOM_ORVALUE);
>>> +       set_huge_pte_at(mm, vaddr, ptep, pte);
>>> +       WARN_ON(!pte_same(pte, huge_ptep_get(ptep)));
>>> +
>>> +       pte = pte_mkhuge(mk_pte(phys_to_page(RANDOM_ORVALUE & PMD_MASK), prot));
>>>         set_huge_pte_at(mm, vaddr, ptep, pte);
>>>         barrier();
>>>         WARN_ON(!pte_same(pte, huge_ptep_get(ptep)));
>>>
>>> This would actually add a new test "write empty pte with
>>> set_huge_pte_at(), then verify with huge_ptep_get()", which happens
>>> to trigger a warning on s390 :-)  
>>
>> On arm64 as well which checks for pte_present() in set_huge_pte_at().
>> But PTE present check is not really present in each set_huge_pte_at()
>> implementation especially without __HAVE_ARCH_HUGE_SET_HUGE_PTE_AT.
>> Hence wondering if we should add this new test here which will keep
>> giving warnings on s390 and arm64 (at the least).
> 
> Hmm, interesting. I forgot about huge swap / migration, which is not
> (and probably cannot be) supported on s390. The pte_present() check
> on arm64 seems to check for such huge swap / migration entries,
> according to the comment.
> 
> The new test "write empty pte with set_huge_pte_at(), then verify
> with huge_ptep_get()" would then probably trigger the
> WARN_ON(!pte_present(pte)) in arm64 code. So I guess "writing empty
> ptes with set_huge_pte_at()" is not really a valid use case in practice,
> or else you would have seen this warning before. In that case, it
> might not be a good idea to add this test.

Got it.

> 
> I also do wonder now, why the original test with
> "pte = __pte(pte_val(pte) | RANDOM_ORVALUE);"
> did not also trigger that warning on arm64. On s390 this test failed
> exactly because the constructed pte was not present (initially empty,
> or'ing RANDOM_ORVALUE does not make it present for s390). I guess this
> just worked by chance on arm64, because the bits from RANDOM_ORVALUE
> also happened to mark the pte present for arm64.

That is correct. RANDOM_ORVALUE has got PTE_PROT_NONE bit set that makes
the PTE test for pte_present().

On arm64 platform,

#define pte_present(pte)  (!!(pte_val(pte) & (PTE_VALID | PTE_PROT_NONE)))

> 
> This brings us back to the question above, regarding the "randomness"
> of RANDOM_ORVALUE. Not really sure what the intention behind that was,
> but maybe it would make sense to restrict this RANDOM_ORVALUE to
> non-arch-specific bits, i.e. only bits that would be part of the
> address value within a page table entry? Or was it intentionally
> chosen to also mess with other bits?

As mentioned before, RANDOM_ORVALUE just helped make a given page table
entry contain non-zero values before getting cleared. AFAICS we should
not need RANDOM_ORVALUE for HugeTLB test here. I believe the following
'paddr' construct will just be fine instead.

paddr = __pfn_to_phys(pfn) & PMD_MASK;
pte = pte_mkhuge(mk_pte(phys_to_page(paddr), prot));

> 
> Regards,
> Gerald
> 
> 
