Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABC44FEE0F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 06:05:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdTWl0mKdz3bmW
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 14:05:07 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KdTWL6R4Fz2x9B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 14:04:45 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2791A13D5;
 Tue, 12 Apr 2022 21:04:14 -0700 (PDT)
Received: from [10.163.39.141] (unknown [10.163.39.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9FE6B3F73B;
 Tue, 12 Apr 2022 21:04:09 -0700 (PDT)
Message-ID: <78d9bb56-19ae-ea00-cb66-8d1f4baf4f68@arm.com>
Date: Wed, 13 Apr 2022 09:34:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 2/7] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20220412043848.80464-1-anshuman.khandual@arm.com>
 <20220412043848.80464-3-anshuman.khandual@arm.com>
 <bc1a9e40-7625-3d22-e72e-9100aca1a523@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <bc1a9e40-7625-3d22-e72e-9100aca1a523@csgroup.eu>
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
Cc: "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Christoph Hellwig <hch@infradead.org>, Paul Mackerras <paulus@samba.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/12/22 17:57, Christophe Leroy wrote:
> 
> 
> Le 12/04/2022 à 06:38, Anshuman Khandual a écrit :
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. While here, this also localizes
>> arch_vm_get_page_prot() as __vm_get_page_prot() and moves it near
>> vm_get_page_prot().
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/powerpc/Kconfig               |  1 +
>>   arch/powerpc/include/asm/mman.h    | 12 ------------
>>   arch/powerpc/mm/book3s64/pgtable.c | 20 ++++++++++++++++++++
>>   3 files changed, 21 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index 174edabb74fa..69e44358a235 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -140,6 +140,7 @@ config PPC
>>   	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>>   	select ARCH_HAS_UACCESS_FLUSHCACHE
>>   	select ARCH_HAS_UBSAN_SANITIZE_ALL
>> +	select ARCH_HAS_VM_GET_PAGE_PROT	if PPC_BOOK3S_64
>>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>   	select ARCH_KEEP_MEMBLOCK
>>   	select ARCH_MIGHT_HAVE_PC_PARPORT
>> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
>> index 7cb6d18f5cd6..1b024e64c8ec 100644
>> --- a/arch/powerpc/include/asm/mman.h
>> +++ b/arch/powerpc/include/asm/mman.h
>> @@ -24,18 +24,6 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>>   }
>>   #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>>   
>> -static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
>> -{
>> -#ifdef CONFIG_PPC_MEM_KEYS
>> -	return (vm_flags & VM_SAO) ?
>> -		__pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
>> -		__pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
>> -#else
>> -	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
>> -#endif
>> -}
>> -#define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
>> -
>>   static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
>>   {
>>   	if (prot & ~(PROT_READ | PROT_WRITE | PROT_EXEC | PROT_SEM | PROT_SAO))
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 052e6590f84f..d0319524e27f 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -7,6 +7,7 @@
>>   #include <linux/mm_types.h>
>>   #include <linux/memblock.h>
>>   #include <linux/memremap.h>
>> +#include <linux/pkeys.h>
>>   #include <linux/debugfs.h>
>>   #include <misc/cxl-base.h>
>>   
>> @@ -549,3 +550,22 @@ unsigned long memremap_compat_align(void)
>>   }
>>   EXPORT_SYMBOL_GPL(memremap_compat_align);
>>   #endif
>> +
>> +static pgprot_t __vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +#ifdef CONFIG_PPC_MEM_KEYS
>> +	return (vm_flags & VM_SAO) ?
>> +		__pgprot(_PAGE_SAO | vmflag_to_pte_pkey_bits(vm_flags)) :
>> +		__pgprot(0 | vmflag_to_pte_pkey_bits(vm_flags));
>> +#else
>> +	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
>> +#endif
>> +}
>> +
>> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	return __pgprot(pgprot_val(protection_map[vm_flags &
>> +			(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
>> +			pgprot_val(__vm_get_page_prot(vm_flags)));
>> +}
>> +EXPORT_SYMBOL(vm_get_page_prot);
> 
> This looks functionnaly OK, but I think we could go in the same 
> direction as ARM and try to integrate __vm_get_page_prot() inside 
> vm_get_page_prot() to get something simpler and cleaner:
> 
> Something like below (untested):
> 
> pgprot_t vm_get_page_prot(unsigned long vm_flags)
> {
> 	unsigned long prot = pgprot_val(protection_map[vm_flags &
> 				 (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> 
> 	if (vm_flags & VM_SAO)
> 		prot |= _PAGE_SAO
> 
> #ifdef CONFIG_PPC_MEM_KEYS
> 	prot |= vmflag_to_pte_pkey_bits(vm_flags);
> #endif
> 
> 	return __pgprot(prot);
> }

Okay, will integrate these functions into vm_get_page_prot() as suggested.
