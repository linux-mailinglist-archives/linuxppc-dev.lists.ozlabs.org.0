Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 872734A9285
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 03:58:19 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4JqgG124Czz3bV0
	for <lists+linuxppc-dev@lfdr.de>; Fri,  4 Feb 2022 13:58:17 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4JqgFW3Kg5z2yPV
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  4 Feb 2022 13:57:48 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 24FFF1435;
 Thu,  3 Feb 2022 18:57:45 -0800 (PST)
Received: from [10.163.45.195] (unknown [10.163.45.195])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 981FE3F774;
 Thu,  3 Feb 2022 18:57:41 -0800 (PST)
Subject: Re: [RFC V1 04/31] powerpc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
To: Mike Rapoport <rppt@kernel.org>
References: <1643029028-12710-1-git-send-email-anshuman.khandual@arm.com>
 <1643029028-12710-5-git-send-email-anshuman.khandual@arm.com>
 <Yfwbz5qu20bjFZOP@kernel.org>
From: Anshuman Khandual <anshuman.khandual@arm.com>
Message-ID: <46e15116-78fb-e6fe-e0f0-fe776f9348c3@arm.com>
Date: Fri, 4 Feb 2022 08:27:37 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Yfwbz5qu20bjFZOP@kernel.org>
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
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, akpm@linux-foundation.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2/3/22 11:45 PM, Mike Rapoport wrote:
> On Mon, Jan 24, 2022 at 06:26:41PM +0530, Anshuman Khandual wrote:
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
>> macros can be dropped which are no longer needed. While here, this also
>> localizes arch_vm_get_page_prot() as powerpc_vm_get_page_prot().
>>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/powerpc/Kconfig               |  1 +
>>  arch/powerpc/include/asm/mman.h    |  3 +-
>>  arch/powerpc/include/asm/pgtable.h | 19 ------------
>>  arch/powerpc/mm/mmap.c             | 47 ++++++++++++++++++++++++++++++
>>  4 files changed, 49 insertions(+), 21 deletions(-)
>>
>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>> index b779603978e1..ddb4a3687c05 100644
>> --- a/arch/powerpc/Kconfig
>> +++ b/arch/powerpc/Kconfig
>> @@ -135,6 +135,7 @@ config PPC
>>  	select ARCH_HAS_TICK_BROADCAST		if GENERIC_CLOCKEVENTS_BROADCAST
>>  	select ARCH_HAS_UACCESS_FLUSHCACHE
>>  	select ARCH_HAS_UBSAN_SANITIZE_ALL
>> +	select ARCH_HAS_VM_GET_PAGE_PROT
>>  	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>  	select ARCH_KEEP_MEMBLOCK
>>  	select ARCH_MIGHT_HAVE_PC_PARPORT
>> diff --git a/arch/powerpc/include/asm/mman.h b/arch/powerpc/include/asm/mman.h
>> index 7cb6d18f5cd6..7b10c2031e82 100644
>> --- a/arch/powerpc/include/asm/mman.h
>> +++ b/arch/powerpc/include/asm/mman.h
>> @@ -24,7 +24,7 @@ static inline unsigned long arch_calc_vm_prot_bits(unsigned long prot,
>>  }
>>  #define arch_calc_vm_prot_bits(prot, pkey) arch_calc_vm_prot_bits(prot, pkey)
>>  
>> -static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
>> +static inline pgprot_t powerpc_vm_get_page_prot(unsigned long vm_flags)
>>  {
>>  #ifdef CONFIG_PPC_MEM_KEYS
>>  	return (vm_flags & VM_SAO) ?
>> @@ -34,7 +34,6 @@ static inline pgprot_t arch_vm_get_page_prot(unsigned long vm_flags)
>>  	return (vm_flags & VM_SAO) ? __pgprot(_PAGE_SAO) : __pgprot(0);
>>  #endif
>>  }
>> -#define arch_vm_get_page_prot(vm_flags) arch_vm_get_page_prot(vm_flags)
>>  
>>  static inline bool arch_validate_prot(unsigned long prot, unsigned long addr)
>>  {
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index d564d0ecd4cd..3cbb6de20f9d 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -20,25 +20,6 @@ struct mm_struct;
>>  #include <asm/nohash/pgtable.h>
>>  #endif /* !CONFIG_PPC_BOOK3S */
>>  
>> -/* Note due to the way vm flags are laid out, the bits are XWR */
>> -#define __P000	PAGE_NONE
>> -#define __P001	PAGE_READONLY
>> -#define __P010	PAGE_COPY
>> -#define __P011	PAGE_COPY
>> -#define __P100	PAGE_READONLY_X
>> -#define __P101	PAGE_READONLY_X
>> -#define __P110	PAGE_COPY_X
>> -#define __P111	PAGE_COPY_X
>> -
>> -#define __S000	PAGE_NONE
>> -#define __S001	PAGE_READONLY
>> -#define __S010	PAGE_SHARED
>> -#define __S011	PAGE_SHARED
>> -#define __S100	PAGE_READONLY_X
>> -#define __S101	PAGE_READONLY_X
>> -#define __S110	PAGE_SHARED_X
>> -#define __S111	PAGE_SHARED_X
>> -
>>  #ifndef __ASSEMBLY__
>>  
>>  #ifndef MAX_PTRS_PER_PGD
>> diff --git a/arch/powerpc/mm/mmap.c b/arch/powerpc/mm/mmap.c
>> index c475cf810aa8..7f05e7903bd2 100644
>> --- a/arch/powerpc/mm/mmap.c
>> +++ b/arch/powerpc/mm/mmap.c
>> @@ -254,3 +254,50 @@ void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
>>  		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
>>  	}
>>  }
>> +
>> +static inline pgprot_t __vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
>> +	case VM_NONE:
>> +		return PAGE_NONE;
>> +	case VM_READ:
>> +		return PAGE_READONLY;
>> +	case VM_WRITE:
>> +		return PAGE_COPY;
>> +	case VM_READ | VM_WRITE:
>> +		return PAGE_COPY;
>> +	case VM_EXEC:
>> +		return PAGE_READONLY_X;
>> +	case VM_EXEC | VM_READ:
>> +		return PAGE_READONLY_X;
>> +	case VM_EXEC | VM_WRITE:
>> +		return PAGE_COPY_X;
>> +	case VM_EXEC | VM_READ | VM_WRITE:
>> +		return PAGE_COPY_X;
>> +	case VM_SHARED:
>> +		return PAGE_NONE;
>> +	case VM_SHARED | VM_READ:
>> +		return PAGE_READONLY;
>> +	case VM_SHARED | VM_WRITE:
>> +		return PAGE_SHARED;
>> +	case VM_SHARED | VM_READ | VM_WRITE:
>> +		return PAGE_SHARED;
>> +	case VM_SHARED | VM_EXEC:
>> +		return PAGE_READONLY_X;
>> +	case VM_SHARED | VM_EXEC | VM_READ:
>> +		return PAGE_READONLY_X;
>> +	case VM_SHARED | VM_EXEC | VM_WRITE:
>> +		return PAGE_SHARED_X;
>> +	case VM_SHARED | VM_EXEC | VM_READ | VM_WRITE:
>> +		return PAGE_SHARED_X;
>> +	default:
>> +		BUILD_BUG();
>> +	}
>> +}
>> +
>> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	return __pgprot(pgprot_val(__vm_get_page_prot(vm_flags)) |
>> +	       pgprot_val(powerpc_vm_get_page_prot(vm_flags)));
> Any reason to keep powerpc_vm_get_page_prot() rather than open code it
> here?
> 
> This applies to other architectures that implement arch_vm_get_page_prot()
> and/or arch_filter_pgprot() as well.

Just to minimize the code churn ! But I will be happy to open code them
here (and in other platforms) if that will be preferred.
