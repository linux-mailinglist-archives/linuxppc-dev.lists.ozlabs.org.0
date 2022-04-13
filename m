Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBFF4FEFC4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 08:23:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdXZr3C0Mz3bpQ
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 16:23:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KdXZQ5lBPz2x9T
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 16:22:37 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1BB61150C;
 Tue, 12 Apr 2022 23:22:06 -0700 (PDT)
Received: from [10.163.39.141] (unknown [10.163.39.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A73273F70D;
 Tue, 12 Apr 2022 23:22:00 -0700 (PDT)
Message-ID: <e0efde60-625c-fa58-79c4-5e8a86ddf203@arm.com>
Date: Wed, 13 Apr 2022 11:52:36 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V6 4/7] sparc/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 khalid.aziz@oracle.com
References: <20220413055840.392628-1-anshuman.khandual@arm.com>
 <20220413055840.392628-5-anshuman.khandual@arm.com>
 <c3619877-32db-aaa3-5dd9-4917c067bc42@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <c3619877-32db-aaa3-5dd9-4917c067bc42@csgroup.eu>
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
 Christoph Hellwig <hch@infradead.org>, Khalid Aziz <khalid.aziz@oracle.com>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/13/22 11:43, Christophe Leroy wrote:
> 
> 
> Le 13/04/2022 à 07:58, Anshuman Khandual a écrit :
>> This defines and exports a platform specific custom vm_get_page_prot() via
>> subscribing ARCH_HAS_VM_GET_PAGE_PROT. It localizes arch_vm_get_page_prot()
>> as sparc_vm_get_page_prot() and moves near vm_get_page_prot().
>>
>> Cc: "David S. Miller" <davem@davemloft.net>
>> Cc: Khalid Aziz <khalid.aziz@oracle.com>
>> Cc: sparclinux@vger.kernel.org
>> Cc: linux-kernel@vger.kernel.org
>> Reviewed-by: Khalid Aziz <khalid.aziz@oracle.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   arch/sparc/Kconfig            |  1 +
>>   arch/sparc/include/asm/mman.h |  6 ------
>>   arch/sparc/mm/init_64.c       | 13 +++++++++++++
>>   3 files changed, 14 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/sparc/Kconfig b/arch/sparc/Kconfig
>> index 9200bc04701c..85b573643af6 100644
>> --- a/arch/sparc/Kconfig
>> +++ b/arch/sparc/Kconfig
>> @@ -84,6 +84,7 @@ config SPARC64
>>   	select PERF_USE_VMALLOC
>>   	select ARCH_HAVE_NMI_SAFE_CMPXCHG
>>   	select HAVE_C_RECORDMCOUNT
>> +	select ARCH_HAS_VM_GET_PAGE_PROT
>>   	select HAVE_ARCH_AUDITSYSCALL
>>   	select ARCH_SUPPORTS_ATOMIC_RMW
>>   	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
>> diff --git a/arch/sparc/include/asm/mman.h b/arch/sparc/include/asm/mman.h
>> index 274217e7ed70..af9c10c83dc5 100644
>> --- a/arch/sparc/include/asm/mman.h
>> +++ b/arch/sparc/include/asm/mman.h
>> @@ -46,12 +46,6 @@ static inline unsigned long sparc_calc_vm_prot_bits(unsigned long prot)
>>   	}
>>   }
>>   
>> -#define arch_vm_get_page_prot(vm_flags) sparc_vm_get_page_prot(vm_flags)
>> -static inline pgprot_t sparc_vm_get_page_prot(unsigned long vm_flags)
>> -{
>> -	return (vm_flags & VM_SPARC_ADI) ? __pgprot(_PAGE_MCD_4V) : __pgprot(0);
>> -}
>> -
>>   #define arch_validate_prot(prot, addr) sparc_validate_prot(prot, addr)
>>   static inline int sparc_validate_prot(unsigned long prot, unsigned long addr)
>>   {
>> diff --git a/arch/sparc/mm/init_64.c b/arch/sparc/mm/init_64.c
>> index 8b1911591581..dcb17763c1f2 100644
>> --- a/arch/sparc/mm/init_64.c
>> +++ b/arch/sparc/mm/init_64.c
>> @@ -3184,3 +3184,16 @@ void copy_highpage(struct page *to, struct page *from)
>>   	}
>>   }
>>   EXPORT_SYMBOL(copy_highpage);
>> +
>> +static pgprot_t sparc_vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	return (vm_flags & VM_SPARC_ADI) ? __pgprot(_PAGE_MCD_4V) : __pgprot(0);
>> +}
>> +
>> +pgprot_t vm_get_page_prot(unsigned long vm_flags)
>> +{
>> +	return __pgprot(pgprot_val(protection_map[vm_flags &
>> +			(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
>> +			pgprot_val(sparc_vm_get_page_prot(vm_flags)));
>> +}
>> +EXPORT_SYMBOL(vm_get_page_prot);
> 
> 
> sparc is now the only one with two functions. You can most likely do 
> like you did for ARM and POWERPC: merge into a single function:

I was almost about to do this one as well but as this patch has already been
reviewed with a tag, just skipped it. I will respin the series once more :)

Khalid,

Could I keep your review tag after the following change ?

> 
> pgprot_t vm_get_page_prot(unsigned long vm_flags)
> {
> 	unsigned long prot = pgprot_val(protection_map[vm_flags &
> 		(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
> 
> 	if (vm_flags & VM_SPARC_ADI)
> 		prot |= _PAGE_MCD_4V;
> 
> 	return __pgprot(prot);
> }
> EXPORT_SYMBOL(vm_get_page_prot);

- Anshuman
