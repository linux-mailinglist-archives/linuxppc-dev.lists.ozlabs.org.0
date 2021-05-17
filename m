Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EEC9382A3D
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 12:53:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkGFH1KlXz3bnR
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 20:53:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4FkGDr1Gltz2xv6
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 17 May 2021 20:52:42 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 508461042;
 Mon, 17 May 2021 03:52:39 -0700 (PDT)
Received: from [192.168.0.130] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1ABA73F719;
 Mon, 17 May 2021 03:52:37 -0700 (PDT)
Subject: Re: Fwd: [Bug 213069] New: kernel BUG at
 arch/powerpc/include/asm/book3s/64/hash-4k.h:147! Oops: Exception in kernel
 mode, sig: 5 [#1]
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <bug-213069-206035@https.bugzilla.kernel.org/>
 <4deb5cd5-c713-b020-9143-c74a031e3fd5@csgroup.eu>
 <a8841b4e-3bff-f600-eac7-501f78ced54b@arm.com>
 <7ebc28ad-61e3-ef43-d670-9b80a61268c4@csgroup.eu>
 <e9558e0a-314e-ddfd-6776-84c1bfe6f01f@linux.ibm.com>
 <c6372bac-c8c4-6f67-45e9-4deb062d303e@arm.com>
 <e0d2093d-56ec-5c7a-6887-22eecc5142b7@linux.ibm.com>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <18508d23-3884-af84-ce8f-65b31ac83192@arm.com>
Date: Mon, 17 May 2021 16:23:18 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e0d2093d-56ec-5c7a-6887-22eecc5142b7@linux.ibm.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 5/17/21 1:14 PM, Aneesh Kumar K.V wrote:
> On 5/17/21 12:55 PM, Anshuman Khandual wrote:
>>
>>
>> On 5/17/21 11:25 AM, Aneesh Kumar K.V wrote:
>>> On 5/17/21 11:17 AM, Christophe Leroy wrote:
>>>> +aneesh
>>>> +linuxppc-dev list
>>>>
>>>> Le 17/05/2021 à 07:44, Anshuman Khandual a écrit :
>>>>> Hello Christophe,
>>>>>
>>>>> DEBUG_VM_PGTABLE has now been re-enabled on powerpc recently ? was not
>>>>> aware about this. From the error log, it failed explicitly on 4K page
>>>>> size hash config.
>>>>>
>>>>> static inline pmd_t hash__pmd_mkhuge(pmd_t pmd)
>>>>> {
>>>>>           BUG();        ------> Failed
>>>>>           return pmd;
>>>>> }
>>>>>
>>>>> static inline pmd_t __pmd_mkhuge(pmd_t pmd)
>>>>> {
>>>>>           if (radix_enabled())
>>>>>                   return radix__pmd_mkhuge(pmd);
>>>>>           return hash__pmd_mkhuge(pmd);
>>>>> }
>>>>>
>>>>> pmd_t pfn_pmd(unsigned long pfn, pgprot_t pgprot)
>>>>> {
>>>>>           unsigned long pmdv;
>>>>>
>>>>>           pmdv = (pfn << PAGE_SHIFT) & PTE_RPN_MASK;
>>>>>
>>>>>           return __pmd_mkhuge(pmd_set_protbits(__pmd(pmdv), pgprot));
>>>>> }
>>>>>
>>>>> It seems like on powerpc, where pfn_pmd() makes a huge page but which
>>>>> is not supported on 4K hash config thus triggering the BUG(). But all
>>>>> pfn_pmd() call sites inside the debug_vm_pgtable() test are protected
>>>>> with CONFIG_TRANSPARENT_HUGEPAGE. IIUC unlike powerpc, pfn_pmd() does
>>>>> not directly make a huge page on other platforms.
>>>>>
>>>>> Looking at arch/powerpc/include/asm/book3s/64/hash-4k.h, all relevant
>>>>> THP helpers has BUG() or 0 which indicates THP might not be supported
>>>>> on 4K page size hash config ?
>>>>>
>>>>> But looking at arch/powerpc/platforms/Kconfig.cputype, it seems like
>>>>> HAVE_ARCH_TRANSPARENT_HUGEPAGE is invariably selected on PPC_BOOK3S_64
>>>>> platforms which I assume includes 4K page size hash config as well.
>>>>>
>>>>> Is THP some how getting enabled on this 4K page size hash config where
>>>>> it should not be (thus triggering the BUG) ? OR am I missing something
>>>>> here.
>>>>>
>>>>
>>>
>>> We should put those  pfn_pmd()  and pfn_pud() after
>>>
>>>      if (!has_transparent_hugepage())
>>>          return;
>>>
>>>
>>> On hash with 4K page size, we can't support leaf page table entry and PMD and PUD level. Hence we don't support THP for them.
>>
>> But could CONFIG_TRANSPARENT_HUGEPAGE be enabled on such configs ?
>> Otherwise, wondering how the BUG() just got triggered there.
>>
> 
> yes. We do support THP with radix translation and 4K page size.

I was actually wondering about whether 4K page size in hash config
supports THP and could enable CONFIG_TRANSPARENT_HUGEPAGE ? But as
there is a BUG() trigger on hash__pmd_mkhuge(), it seems like THP
config should not have been enabled for such platforms but it does
for some reason. Could not we disable it ?
