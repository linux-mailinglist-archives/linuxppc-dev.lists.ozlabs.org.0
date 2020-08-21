Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A248224D079
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 10:22:36 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BXvdh67D7zDqMV
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Aug 2020 18:22:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4BXvbt4fxNzDqd7
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Aug 2020 18:20:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 051C230E;
 Fri, 21 Aug 2020 01:20:55 -0700 (PDT)
Received: from [10.163.67.49] (unknown [10.163.67.49])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 46EDE3F66B;
 Fri, 21 Aug 2020 01:20:53 -0700 (PDT)
Subject: Re: [PATCH v2 07/13] mm/debug_vm_pgtable/set_pte/pmd/pud: Don't use
 set_*_at to update an existing pte entry
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20200819130107.478414-1-aneesh.kumar@linux.ibm.com>
 <20200819130107.478414-8-aneesh.kumar@linux.ibm.com>
 <b21d1dbb-7439-d317-8516-94c80f333e92@csgroup.eu>
 <3d966519-0a6b-3ccb-fd21-b7f06c8e4df7@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <5a7f6dd1-eb13-d942-6fab-80265cd421fc@arm.com>
Date: Fri, 21 Aug 2020 13:50:22 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <3d966519-0a6b-3ccb-fd21-b7f06c8e4df7@linux.ibm.com>
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



On 08/21/2020 12:44 PM, Aneesh Kumar K.V wrote:
> On 8/20/20 8:02 PM, Christophe Leroy wrote:
>>
>>
>> Le 19/08/2020 à 15:01, Aneesh Kumar K.V a écrit :
>>> set_pte_at() should not be used to set a pte entry at locations that
>>> already holds a valid pte entry. Architectures like ppc64 don't do TLB
>>> invalidate in set_pte_at() and hence expect it to be used to set locations
>>> that are not a valid PTE.
>>>
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   mm/debug_vm_pgtable.c | 35 +++++++++++++++--------------------
>>>   1 file changed, 15 insertions(+), 20 deletions(-)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index 76f4c713e5a3..9c7e2c9cfc76 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -74,15 +74,18 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>>>   {
>>>       pte_t pte = pfn_pte(pfn, prot);
>>> +    /*
>>> +     * Architectures optimize set_pte_at by avoiding TLB flush.
>>> +     * This requires set_pte_at to be not used to update an
>>> +     * existing pte entry. Clear pte before we do set_pte_at
>>> +     */
>>> +
>>>       pr_debug("Validating PTE advanced\n");
>>>       pte = pfn_pte(pfn, prot);
>>>       set_pte_at(mm, vaddr, ptep, pte);
>>>       ptep_set_wrprotect(mm, vaddr, ptep);
>>>       pte = ptep_get(ptep);
>>>       WARN_ON(pte_write(pte));
>>> -
>>> -    pte = pfn_pte(pfn, prot);
>>> -    set_pte_at(mm, vaddr, ptep, pte);
>>>       ptep_get_and_clear(mm, vaddr, ptep);
>>>       pte = ptep_get(ptep);
>>>       WARN_ON(!pte_none(pte));
>>> @@ -96,13 +99,11 @@ static void __init pte_advanced_tests(struct mm_struct *mm,
>>>       ptep_set_access_flags(vma, vaddr, ptep, pte, 1);
>>>       pte = ptep_get(ptep);
>>>       WARN_ON(!(pte_write(pte) && pte_dirty(pte)));
>>> -
>>> -    pte = pfn_pte(pfn, prot);
>>> -    set_pte_at(mm, vaddr, ptep, pte);
>>>       ptep_get_and_clear_full(mm, vaddr, ptep, 1);
>>>       pte = ptep_get(ptep);
>>>       WARN_ON(!pte_none(pte));
>>> +    pte = pfn_pte(pfn, prot);
>>>       pte = pte_mkyoung(pte);
>>>       set_pte_at(mm, vaddr, ptep, pte);
>>>       ptep_test_and_clear_young(vma, vaddr, ptep);
>>> @@ -164,9 +165,6 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>>       pmdp_set_wrprotect(mm, vaddr, pmdp);
>>>       pmd = READ_ONCE(*pmdp);
>>>       WARN_ON(pmd_write(pmd));
>>> -
>>> -    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>> -    set_pmd_at(mm, vaddr, pmdp, pmd);
>>>       pmdp_huge_get_and_clear(mm, vaddr, pmdp);
>>>       pmd = READ_ONCE(*pmdp);
>>>       WARN_ON(!pmd_none(pmd));
>>> @@ -180,13 +178,11 @@ static void __init pmd_advanced_tests(struct mm_struct *mm,
>>>       pmdp_set_access_flags(vma, vaddr, pmdp, pmd, 1);
>>>       pmd = READ_ONCE(*pmdp);
>>>       WARN_ON(!(pmd_write(pmd) && pmd_dirty(pmd)));
>>> -
>>> -    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>> -    set_pmd_at(mm, vaddr, pmdp, pmd);
>>>       pmdp_huge_get_and_clear_full(vma, vaddr, pmdp, 1);
>>>       pmd = READ_ONCE(*pmdp);
>>>       WARN_ON(!pmd_none(pmd));
>>> +    pmd = pmd_mkhuge(pfn_pmd(pfn, prot));
>>>       pmd = pmd_mkyoung(pmd);
>>>       set_pmd_at(mm, vaddr, pmdp, pmd);
>>>       pmdp_test_and_clear_young(vma, vaddr, pmdp);
>>> @@ -283,18 +279,10 @@ static void __init pud_advanced_tests(struct mm_struct *mm,
>>>       WARN_ON(pud_write(pud));
>>>   #ifndef __PAGETABLE_PMD_FOLDED
>>
>> Same as below, once set_put_at() is gone, I don't think this #ifndef __PAGETABLE_PMD_FOLDED is still need, should be possible to replace by 'if (mm_pmd_folded())'
> 
> I would skip that change in this series because I still haven't worked out what it means to have FOLDED PMD with CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD.
> 
> 
> We should probably push that as a cleanup later and somebody who can test that config can do that? Currently i can't boot ppc64 with DBUG_VM_PGTABLE enabled on ppc64 because it is all buggy w.r.t rules.

Agreed. I think its OK not address these changes/improvements in this particular
series which is trying to modify the test to make it run on ppc64 platform. I will
probably look into that later.
