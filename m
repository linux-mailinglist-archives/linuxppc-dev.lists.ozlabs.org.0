Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E7CC24467F
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 10:32:32 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BScBP20zhzDql2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Aug 2020 18:32:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BSc8C3V4kzDqMF
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Aug 2020 18:30:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E79171063;
 Fri, 14 Aug 2020 01:30:29 -0700 (PDT)
Received: from [10.163.65.227] (unknown [10.163.65.227])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 668623F22E;
 Fri, 14 Aug 2020 01:30:26 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH 16/16] debug_vm_pgtable/ppc64: Add a variant of pfn_pte/pmd
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200812063358.369514-1-aneesh.kumar@linux.ibm.com>
 <20200812063358.369514-16-aneesh.kumar@linux.ibm.com>
 <fe7beb39-97e6-dd7c-59d4-e1a72bab3d71@arm.com>
 <b42822c9-f8b6-55cf-7bc6-6def2faeb378@linux.ibm.com>
Message-ID: <44586359-f3bd-096c-ef5d-38d520eae072@arm.com>
Date: Fri, 14 Aug 2020 13:59:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <b42822c9-f8b6-55cf-7bc6-6def2faeb378@linux.ibm.com>
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



On 08/13/2020 12:07 PM, Aneesh Kumar K.V wrote:
> On 8/13/20 11:00 AM, Anshuman Khandual wrote:
>>
>> On 08/12/2020 12:03 PM, Aneesh Kumar K.V wrote:
>>> The tests do expect _PAGE_PTE bit set by different page table accessors.
>>> This is not true for the kernel. Within the kernel, _PAGE_PTE bits are
>>> usually set by set_pte_at(). To make the below tests work correctly add test
>>> specific pfn_pte/pmd helpers that set _PAGE_PTE bit.
>>>
>>> pte_t pte = pfn_pte(pfn, prot);
>>> WARN_ON(!pte_devmap(pte_mkdevmap(pte)));
>>> WARN_ON(!pte_savedwrite(pte_mk_savedwrite(pte_clear_savedwrite(pte))));
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   mm/debug_vm_pgtable.c | 65 +++++++++++++++++++++++++++----------------
>>>   1 file changed, 41 insertions(+), 24 deletions(-)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index eea62d5e503b..153c925b5273 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -31,6 +31,23 @@
>>>   #include <asm/pgalloc.h>
>>>   #include <asm/tlbflush.h>
>>>   +#ifdef CONFIG_PPC_BOOK3S_64
>>> +static inline pte_t debug_vm_pfn_pte(unsigned long pfn, pgprot_t pgprot)
>>> +{
>>> +    pte_t pte = pfn_pte(pfn, pgprot);
>>> +    return __pte(pte_val(pte) | _PAGE_PTE);
>>> +
>>> +}
>>> +static inline pmd_t debug_vm_pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>> +{
>>> +    pmd_t pmd = pfn_pmd(pfn, pgprot);
>>> +    return __pmd(pmd_val(pmd) | _PAGE_PTE);
>>> +}
>>> +#else
>>> +#define debug_vm_pfn_pte(pfn, pgprot) pfn_pte(pfn, pgprot)
>>> +#define debug_vm_pfn_pmd(pfn, pgprot) pfn_pmd(pfn, pgprot)
>>> +#endif
>>
>> Again, no platform specific constructs please. This defeats the whole purpose of
>> this test. If __PAGE_PTE is required for the helpers, then pfn_pmd/pte() could
>> be modified to accommodate that. We dont see similar issues on other platforms,
>> hence could you please explain why ppc64 is different here.
>>
> 
> It is not platform specific. set_pte_at is the one that set the _PAGE_PTE bit. We don't call that in the test.  The test seems to make the assumption that pfn_pte returns a proper pte which is not true.

'#ifdef CONFIG_PPC_BOOK3S_64' definitely makes it platform specific. Here is how
set_pte_at() updates an entry on other platforms without changing the pte value.
_PAGE_PTE bit update during set_pte_at() on ppc64 seems to be a deviation.

1. set_pte_at() on arm64 directly update the entry after TLB, cache maintenance
2. set_pte_at() on s390 directly updates the entry for !CONFIG_PGSTE
3. set_pte_at() on arc directly updates the entry via set_pte()
4. set_pte_at() on x86 directly update the entry via native_set_pte()

set_pte_at() does take a pte created with pfn_pte().

As an example do_anonymous_page() does the same.

......
entry = mk_pte(page, vma->vm_page_prot);	/* Call pfn_pte() */
entry = pte_sw_mkyoung(entry);
if (vma->vm_flags & VM_WRITE)
	entry = pte_mkwrite(pte_mkdirty(entry));
.....
set_pte_at(vma->vm_mm, vmf->address, vmf->pte, entry);
.....
