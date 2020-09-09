Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8A7262AAA
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 10:43:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BmbCR6sy1zDqTW
	for <lists+linuxppc-dev@lfdr.de>; Wed,  9 Sep 2020 18:43:47 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4Bmb6Y0QHLzDqRK
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  9 Sep 2020 18:39:31 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2AAA11FB;
 Wed,  9 Sep 2020 01:39:30 -0700 (PDT)
Received: from [10.163.71.250] (unknown [10.163.71.250])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1F9E33F66E;
 Wed,  9 Sep 2020 01:39:26 -0700 (PDT)
Subject: Re: [PATCH v4 00/13] mm/debug_vm_pgtable fixes
To: Gerald Schaefer <gerald.schaefer@linux.ibm.com>
References: <20200902114222.181353-1-aneesh.kumar@linux.ibm.com>
 <bb0f3427-e2bd-f713-3ea8-d264be0e690b@arm.com>
 <20200904172647.002113d3@thinkpad> <20200904180115.07ee5f00@thinkpad>
 <20200904195346.6d57ff9f@thinkpad>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <c6f4857e-4523-ad32-cbc1-fee417fc3f37@arm.com>
Date: Wed, 9 Sep 2020 14:08:55 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200904195346.6d57ff9f@thinkpad>
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
Cc: "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org,
 Vineet Gupta <vgupta@synopsys.com>, akpm@linux-foundation.org,
 "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>,
 linuxppc-dev@lists.ozlabs.org, linux-riscv <linux-riscv@lists.infradead.org>,
 Gerald Schaefer <gerald.schaefer@de.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 09/04/2020 11:23 PM, Gerald Schaefer wrote:
> On Fri, 4 Sep 2020 18:01:15 +0200
> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
> 
>> On Fri, 4 Sep 2020 17:26:47 +0200
>> Gerald Schaefer <gerald.schaefer@linux.ibm.com> wrote:
>>
>>> On Fri, 4 Sep 2020 12:18:05 +0530
>>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>
>>>>
>>>>
>>>> On 09/02/2020 05:12 PM, Aneesh Kumar K.V wrote:
>>>>> This patch series includes fixes for debug_vm_pgtable test code so that
>>>>> they follow page table updates rules correctly. The first two patches introduce
>>>>> changes w.r.t ppc64. The patches are included in this series for completeness. We can
>>>>> merge them via ppc64 tree if required.
>>>>>
>>>>> Hugetlb test is disabled on ppc64 because that needs larger change to satisfy
>>>>> page table update rules.
>>>>>
>>>>> These tests are broken w.r.t page table update rules and results in kernel
>>>>> crash as below. 
>>>>>
>>>>> [   21.083519] kernel BUG at arch/powerpc/mm/pgtable.c:304!
>>>>> cpu 0x0: Vector: 700 (Program Check) at [c000000c6d1e76c0]
>>>>>     pc: c00000000009a5ec: assert_pte_locked+0x14c/0x380
>>>>>     lr: c0000000005eeeec: pte_update+0x11c/0x190
>>>>>     sp: c000000c6d1e7950
>>>>>    msr: 8000000002029033
>>>>>   current = 0xc000000c6d172c80
>>>>>   paca    = 0xc000000003ba0000   irqmask: 0x03   irq_happened: 0x01
>>>>>     pid   = 1, comm = swapper/0
>>>>> kernel BUG at arch/powerpc/mm/pgtable.c:304!
>>>>> [link register   ] c0000000005eeeec pte_update+0x11c/0x190
>>>>> [c000000c6d1e7950] 0000000000000001 (unreliable)
>>>>> [c000000c6d1e79b0] c0000000005eee14 pte_update+0x44/0x190
>>>>> [c000000c6d1e7a10] c000000001a2ca9c pte_advanced_tests+0x160/0x3d8
>>>>> [c000000c6d1e7ab0] c000000001a2d4fc debug_vm_pgtable+0x7e8/0x1338
>>>>> [c000000c6d1e7ba0] c0000000000116ec do_one_initcall+0xac/0x5f0
>>>>> [c000000c6d1e7c80] c0000000019e4fac kernel_init_freeable+0x4dc/0x5a4
>>>>> [c000000c6d1e7db0] c000000000012474 kernel_init+0x24/0x160
>>>>> [c000000c6d1e7e20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
>>>>>
>>>>> With DEBUG_VM disabled
>>>>>
>>>>> [   20.530152] BUG: Kernel NULL pointer dereference on read at 0x00000000
>>>>> [   20.530183] Faulting instruction address: 0xc0000000000df330
>>>>> cpu 0x33: Vector: 380 (Data SLB Access) at [c000000c6d19f700]
>>>>>     pc: c0000000000df330: memset+0x68/0x104
>>>>>     lr: c00000000009f6d8: hash__pmdp_huge_get_and_clear+0xe8/0x1b0
>>>>>     sp: c000000c6d19f990
>>>>>    msr: 8000000002009033
>>>>>    dar: 0
>>>>>   current = 0xc000000c6d177480
>>>>>   paca    = 0xc00000001ec4f400   irqmask: 0x03   irq_happened: 0x01
>>>>>     pid   = 1, comm = swapper/0
>>>>> [link register   ] c00000000009f6d8 hash__pmdp_huge_get_and_clear+0xe8/0x1b0
>>>>> [c000000c6d19f990] c00000000009f748 hash__pmdp_huge_get_and_clear+0x158/0x1b0 (unreliable)
>>>>> [c000000c6d19fa10] c0000000019ebf30 pmd_advanced_tests+0x1f0/0x378
>>>>> [c000000c6d19fab0] c0000000019ed088 debug_vm_pgtable+0x79c/0x1244
>>>>> [c000000c6d19fba0] c0000000000116ec do_one_initcall+0xac/0x5f0
>>>>> [c000000c6d19fc80] c0000000019a4fac kernel_init_freeable+0x4dc/0x5a4
>>>>> [c000000c6d19fdb0] c000000000012474 kernel_init+0x24/0x160
>>>>> [c000000c6d19fe20] c00000000000cbd0 ret_from_kernel_thread+0x5c/0x6c
>>>>>
>>>>> Changes from v3:
>>>>> * Address review feedback
>>>>> * Move page table depost and withdraw patch after adding pmdlock to avoid bisect failure.
>>>>
>>>> This version
>>>>
>>>> - Builds on x86, arm64, s390, arc, powerpc and riscv (defconfig with DEBUG_VM_PGTABLE)
>>>> - Runs on arm64 and x86 without any regression, atleast nothing that I have noticed
>>>> - Will be great if this could get tested on s390, arc, riscv, ppc32 platforms as well
>>>
>>> When I quickly tested v3, it worked fine, but now it turned out to
>>> only work fine "sometimes", both v3 and v4. I need to look into it
>>> further, but so far it seems related to the hugetlb_advanced_tests().
>>>
>>> I guess there was already some discussion on this test, but we did
>>> not receive all of the thread(s). Please always add at least
>>> linux-s390@vger.kernel.org and maybe myself and Vasily Gorbik <gor@linux.ibm.com>
>>> for further discussions.
>>
>> BTW, with myself I mean the new address gerald.schaefer@linux.ibm.com.
>> The old gerald.schaefer@de.ibm.com seems to work (again), but is not
>> very reliable.
>>
>> BTW2, a quick test with this change (so far) made the issues on s390
>> go away:
>>
>> @@ -1069,7 +1074,7 @@ static int __init debug_vm_pgtable(void)
>>         spin_unlock(ptl);
>>
>>  #ifndef CONFIG_PPC_BOOK3S_64
>> -       hugetlb_advanced_tests(mm, vma, ptep, pte_aligned, vaddr, prot);
>> +       hugetlb_advanced_tests(mm, vma, (pte_t *) pmdp, pmd_aligned, vaddr, prot);
>>  #endif
>>
>>         spin_lock(&mm->page_table_lock);
>>
>> That would more match the "pte_t pointer" usage for hugetlb code,
>> i.e. just cast a pmd_t pointer to it. Also changed to pmd_aligned,
>> but I think the root cause is the pte_t pointer.
>>
>> Not entirely sure though if that would really be the correct fix.
>> I somehow lost whatever little track I had about what these tests
>> really want to check, and if that would still be valid with that
>> change.
> 
> Another potential issue, apparently not for s390, but maybe for
> others, is that the vaddr passed to hugetlb_advanced_tests() is
> also not pmd/pud size aligned, like you did in pmd/pud_advanced_tests().
> 
> I guess for the hugetlb_advanced_tests() you need to choose if
> you want to test pmd or pud hugepages, and accordingly prepare
> the *ptep, pfn and vaddr input. If you only check for CONFIG_HUGETLB_PAGE,
> then probably only pmd hugepages would be safe, there might be
> architectures only supporting one hugepage size.

I guess preparing for PMD based HugeTLB tests should be sufficient
for now, which can be improved later on to cover other levels.

> 
> So, for s390, at least the ptep input value is a problem. Still
> need to better understand how it goes wrong, but it seems to be
> fixed when using proper pmdp, and also works with pudp.
> 
> For others, especially the apparent issues on ppc64, the other
> non-hugepage aligned input pfn and vaddr might also be an issue,
> e.g. power at least seems to use the vaddr in its set_huge_pte_at()
> implementation for some pmd_off(mm, addr) calculation.
> 
> Again, sorry if this was already discussed, I missed most of it
> and honestly didn't properly look at the scarce mails that we did
> receive...

Sure, will consider these points and try improve tests afterwards.
