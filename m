Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62EA84FB348
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 07:31:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KcHXN2SGmz3bqT
	for <lists+linuxppc-dev@lfdr.de>; Mon, 11 Apr 2022 15:31:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KcHWz25Wkz2xY1
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 11 Apr 2022 15:31:08 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DFB65ED1;
 Sun, 10 Apr 2022 22:30:35 -0700 (PDT)
Received: from [10.163.38.140] (unknown [10.163.38.140])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4C0853F5A1;
 Sun, 10 Apr 2022 22:30:31 -0700 (PDT)
Message-ID: <90cea600-74b8-6c05-b698-23dba01e4889@arm.com>
Date: Mon, 11 Apr 2022 11:01:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V4 2/7] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org,
 akpm@linux-foundation.org
References: <20220407103251.1209606-1-anshuman.khandual@arm.com>
 <20220407103251.1209606-3-anshuman.khandual@arm.com>
 <e860f404-af69-aebc-c5eb-8822a585e653@csgroup.eu>
 <8f1d5ba5-c03e-d222-ffc0-d9a6baea1037@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <8f1d5ba5-c03e-d222-ffc0-d9a6baea1037@csgroup.eu>
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
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 Christoph Hellwig <hch@infradead.org>, Paul Mackerras <paulus@samba.org>,
 sparclinux@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/9/22 17:06, Christophe Leroy wrote:
> 
> 
> Le 08/04/2022 à 14:53, Christophe Leroy a écrit :
>>
>>
>> Le 07/04/2022 à 12:32, Anshuman Khandual a écrit :
>>> This defines and exports a platform specific custom vm_get_page_prot() via
>>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. While here, this also localizes
>>> arch_vm_get_page_prot() as powerpc_vm_get_page_prot() and moves it near
>>> vm_get_page_prot().
>>>
>>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>>> Cc: Paul Mackerras <paulus@samba.org>
>>> Cc: linuxppc-dev@lists.ozlabs.org
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>   arch/powerpc/Kconfig            |  1 +
>>>   arch/powerpc/include/asm/mman.h | 12 ------------
>>>   arch/powerpc/mm/mmap.c          | 26 ++++++++++++++++++++++++++
>>>   3 files changed, 27 insertions(+), 12 deletions(-)
>>>
>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>> index 174edabb74fa..eb9b6ddbf92f 100644
>>> --- a/arch/powerpc/Kconfig
>>> +++ b/arch/powerpc/Kconfig
>>> @@ -140,6 +140,7 @@ config PPC
>>>       select ARCH_HAS_TICK_BROADCAST        if GENERIC_CLOCKEVENTS_BROADCAST
>>>       select ARCH_HAS_UACCESS_FLUSHCACHE
>>>       select ARCH_HAS_UBSAN_SANITIZE_ALL
>>> +    select ARCH_HAS_VM_GET_PAGE_PROT
>>>       select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>>       select ARCH_KEEP_MEMBLOCK
>>>       select ARCH_MIGHT_HAVE_PC_PARPORT
>>> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
>>> index 7cb6d18f5cd6..1b024e64c8ec 100644
>>> --- a/arch/powerpc/include/asm/mman.h
>>> +++ b/arch/powerpc/include/asm/mman.h
>>> @@ -24,18 +24,6 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>>>   }
>>>   #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>>> -static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
>>> -{
>>> -#ifdef CONFIG_PPC_MEM_KEYS
>>> -    return (vm_flags & VM_SAO) ?
>>> -        __pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
>>> -        __pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
>>> -#else
>>> -    return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
>>> -#endif
>>> -}
>>> -#define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
>>> -
>>>   static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
>>>   {
>>>       if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
>>> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
>>> index c475cf810aa8..cd17bd6fa36b 100644
>>> --- a/arch/powerpc/mm/mmap.c
>>> +++ b/arch/powerpc/mm/mmap.c
>>> @@ -254,3 +254,29 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
>>>           mm->get_unmapped_area = arch_get_unmapped_area_topdown;
>>>       }
>>>   }
>>> +
>>> +#ifdef CONFIG_PPC64
>>> +static pgprot_t powerpc_vm_get_page_prot(unsigned long vm_flags)
>>> +{
>>> +#ifdef CONFIG_PPC_MEM_KEYS
>>> +    return (vm_flags & VM_SAO) ?
>>> +        __pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
>>> +        __pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
>>> +#else
>>> +    return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
>>> +#endif
>>> +}
>>> +#else
>>> +static pgprot_t powerpc_vm_get_page_prot(unsigned long vm_flags)
>>> +{
>>> +    return __pgprot(0);
>>> +}
>>> +#endif /* CONFIG_PPC64 */
>>
>> Can we reduce this forest of #ifdefs and make it more readable ?
>>
>> mm/mmap.c is going away with patch https://patchwork.ozlabs.org/project/linuxppc-dev/patch/d6d849621f821af253e777a24eda4c648814a76e.1646847562.git.christophe.leroy@csgroup.eu/
>>
>> So it would be better to add two versions of vm_get_page_prot(), for instance one in mm/pgtable_64.c and one in mm/pgtable_32.c
> 
> Indeed, you don't need anything at all for PPC32. All you need to do is
> 
>     select ARCH_HAS_VM_GET_PAGE_PROT if PPC64
> 
> And in fact it could even be PPC_BOOK3S_64 instead of PPC64 because CONFIG_PPC_MEM_KEYS depends on PPC_BOOK3S_64 and _PAGE_SAO is 0 on nohash/64.
> 
> So you can then put it into arch/powerpc/mm/book3s64/pgtable.c

Would something like the following change work ?

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index eb9b6ddbf92f..69e44358a235 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -140,7 +140,7 @@ config PPC
        select ARCH_HAS_TICK_BROADCAST          if GENERIC_CLOCKEVENTS_BROADCAST
        select ARCH_HAS_UACCESS_FLUSHCACHE
        select ARCH_HAS_UBSAN_SANITIZE_ALL
-       select ARCH_HAS_VM_GET_PAGE_PROT
+       select ARCH_HAS_VM_GET_PAGE_PROT        if PPC_BOOK3S_64
        select ARCH_HAVE_NMI_SAFE_CMPXCHG
        select ARCH_KEEP_MEMBLOCK
        select ARCH_MIGHT_HAVE_PC_PARPORT
diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
index 052e6590f84f..59d235519b44 100644
--- a/arch/powerpc/mm/book3s64/pgtable.c
+++ b/arch/powerpc/mm/book3s64/pgtable.c
@@ -7,6 +7,7 @@
 #include <linux/mm_types.h>
 #include <linux/memblock.h>
 #include <linux/memremap.h>
+#include <linux/pkeys.h>
 #include <linux/debugfs.h>
 #include <misc/cxl-base.h>
 
@@ -549,3 +550,22 @@ unsigned long memremap_compat_align(void)
 }
 EXPORT_SYMBOL_GPL(memremap_compat_align);
 #endif
+
+static pgprot_t __vm_get_page_prot(unsigned long vm_flags)
+{
+#ifdef CONFIG_PPC_MEM_KEYS
+       return (vm_flags & VM_SAO) ?
+               __pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
+               __pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
+#else
+       return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
+#endif
+}
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+       return __pgprot(pgprot_val(protection_map[vm_flags &
+                       (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
+              pgprot_val(__vm_get_page_prot(vm_flags)));
+}
+EXPORT_SYMBOL(vm_get_page_prot);
