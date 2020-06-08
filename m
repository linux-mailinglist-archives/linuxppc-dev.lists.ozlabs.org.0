Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FBA1F189B
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 14:17:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49gXLl42v3zDqSk
	for <lists+linuxppc-dev@lfdr.de>; Mon,  8 Jun 2020 22:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=arm.com
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 49gXJj5BJGzDqSF
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  8 Jun 2020 22:15:32 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C7E461FB;
 Mon,  8 Jun 2020 05:15:29 -0700 (PDT)
Received: from [10.163.79.100] (unknown [10.163.79.100])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E8E4C3F52E;
 Mon,  8 Jun 2020 05:15:27 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] mm/debug_vm_pgtable: Fix kernel crash with page table
 validate
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, linux-mm@kvack.org
References: <20200608062739.378902-1-aneesh.kumar@linux.ibm.com>
 <2497c7b7-b5cf-8df4-dc82-efefe2fb6f5a@arm.com>
 <c5c48970-714b-271f-1242-b789be801d9b@linux.ibm.com>
Message-ID: <a105f0d5-bb3d-593e-7fe7-89b6eeed86c7@arm.com>
Date: Mon, 8 Jun 2020 17:45:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <c5c48970-714b-271f-1242-b789be801d9b@linux.ibm.com>
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
Cc: akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 06/08/2020 04:46 PM, Aneesh Kumar K.V wrote:
> On 6/8/20 4:31 PM, Anshuman Khandual wrote:
>> Hi Aneesh,
>>
>> On 06/08/2020 11:57 AM, Aneesh Kumar K.V wrote:
>>> Architectures can have CONFIG_TRANSPARENT_HUGEPAGE enabled but
>>> no THP support enabled based on platforms. For ex: with 4K
>>> PAGE_SIZE ppc64 supports THP only with radix translation.
>>
>> Good catch, never hit this before.
>>
>>>
>>> This results in below crash when running with hash translation and
>>> 4K PAGE_SIZE.
>>>
>>> kernel BUG at arch/powerpc/include/asm/book3s/64/hash-4k.h:140!
>>> cpu 0x61: Vector: 700 (Program Check) at [c000000ff948f860]
>>>      pc: c0000000018810f8: debug_vm_pgtable+0x480/0x8b0
>>>      lr: c0000000018810ec: debug_vm_pgtable+0x474/0x8b0
>>> ...
>>> [c000000ff948faf0] c000000001880fec debug_vm_pgtable+0x374/0x8b0 (unreliable)
>>> [c000000ff948fbf0] c000000000011648 do_one_initcall+0x98/0x4f0
>>> [c000000ff948fcd0] c000000001843928 kernel_init_freeable+0x330/0x3fc
>>> [c000000ff948fdb0] c0000000000122ac kernel_init+0x24/0x148
>>> [c000000ff948fe20] c00000000000cc44 ret_from_kernel_thread+0x5c/0x78
>>>
>>> Check for THP support correctly
>>
>> Makes sense, is this the only configuration which hit the problem ?
> 
> 4K hash ppc64 is the only config i guess.

Okay.

> 
>>
>>>
>>> Cc: anshuman.khandual@arm.com
>>> Fixes: 399145f9eb6c ("mm/debug: add tests validating architecture page table helpers")
>>> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
>>> ---
>>>   mm/debug_vm_pgtable.c | 3 +++
>>>   1 file changed, 3 insertions(+)
>>>
>>> diff --git a/mm/debug_vm_pgtable.c b/mm/debug_vm_pgtable.c
>>> index 188c18908964..e60151c5e997 100644
>>> --- a/mm/debug_vm_pgtable.c
>>> +++ b/mm/debug_vm_pgtable.c
>>> @@ -61,6 +61,9 @@ static void __init pmd_basic_tests(unsigned long pfn, pgprot_t prot)
>>>   {
>>>       pmd_t pmd = pfn_pmd(pfn, prot);
>>>   +    if (!has_transparent_hugepage())
>>> +        return;
>>> +
>>
>> We should also add this check to pud_basic_tests() as well.
> 
> 
> Do we have a function that check for runtime support for pud level THP? ppc64 don't do pud level THP yet. So  we have 
> CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD=n

I believe, we dont have such a generic function. Please correct me, if I am
missing something here.

> 
> are you suggesting we do the same check for pud level THP too?

Yes. Because regardless CONFIG_HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD, could there
be any THP at PUD level when has_transparent_hugepage() returns negative ? The
current dependency between THP and PUD THP configs seems some what confusing
but having this check at PUD level should protect against similar problems. A
quick test (after adding this check to PUD level) on x86 does not indicate any
problem on the normal path.

> 
> 
>>
>>>       WARN_ON(!pmd_same(pmd, pmd));
>>>       WARN_ON(!pmd_young(pmd_mkyoung(pmd_mkold(pmd))));
>>>       WARN_ON(!pmd_dirty(pmd_mkdirty(pmd_mkclean(pmd))));
>>>
>>
>> The subject line here should mention about correct THP support
>> detection which fixes the problem. Probably something like this
>> or similar ("Fix kernel crash with correct THP support check").
> 
> 
> Not sure about that. This fix a kernel crash with page table validate code.

What this fixes is very clear from the prefix itself - "mm/debug_vm_pgtable:",
making "page table validate" some what bit redundant. Instead, it could just
accommodate method of the fix i.e "via correct THP support check". Nonetheless,
it is just a small nit.
