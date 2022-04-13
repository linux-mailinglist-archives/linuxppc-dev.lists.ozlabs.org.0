Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D18784FEDCC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 05:53:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KdTG06JmZz3c7F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Apr 2022 13:53:12 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=anshuman.khandual@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4KdTFc74kQz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 13 Apr 2022 13:52:52 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 29EA713D5;
 Tue, 12 Apr 2022 20:52:21 -0700 (PDT)
Received: from [10.163.39.141] (unknown [10.163.39.141])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 56BE53F73B;
 Tue, 12 Apr 2022 20:52:15 -0700 (PDT)
Message-ID: <20e0b53c-03a3-78ec-7f3e-eb38d9e91ce6@arm.com>
Date: Wed, 13 Apr 2022 09:22:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH V5 6/7] mm/mmap: Drop arch_filter_pgprot()
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>
References: <20220412043848.80464-1-anshuman.khandual@arm.com>
 <20220412043848.80464-7-anshuman.khandual@arm.com>
 <71fe7ac2-0b10-56a5-e530-3bcbc60f0e63@csgroup.eu>
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <71fe7ac2-0b10-56a5-e530-3bcbc60f0e63@csgroup.eu>
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
 Christoph Hellwig <hch@infradead.org>,
 "sparclinux@vger.kernel.org" <sparclinux@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 4/12/22 17:59, Christophe Leroy wrote:
> 
> 
> Le 12/04/2022 à 06:38, Anshuman Khandual a écrit :
>> There are no platforms left which subscribe ARCH_HAS_FILTER_PGPROT. Hence
>> drop generic arch_filter_pgprot() and also config ARCH_HAS_FILTER_PGPROT.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>   mm/Kconfig | 3 ---
>>   mm/mmap.c  | 9 +--------
>>   2 files changed, 1 insertion(+), 11 deletions(-)
>>
>> diff --git a/mm/Kconfig b/mm/Kconfig
>> index b1f7624276f8..3f7b6d7b69df 100644
>> --- a/mm/Kconfig
>> +++ b/mm/Kconfig
>> @@ -762,9 +762,6 @@ config ARCH_HAS_CURRENT_STACK_POINTER
>>   	  register alias named "current_stack_pointer", this config can be
>>   	  selected.
>>   
>> -config ARCH_HAS_FILTER_PGPROT
>> -	bool
>> -
>>   config ARCH_HAS_VM_GET_PAGE_PROT
>>   	bool
>>   
>> diff --git a/mm/mmap.c b/mm/mmap.c
>> index 87cb2eaf7e1a..edf2a5e38f4d 100644
>> --- a/mm/mmap.c
>> +++ b/mm/mmap.c
>> @@ -107,20 +107,13 @@ pgprot_t protection_map[16] __ro_after_init = {
>>   };
>>   
>>   #ifndef CONFIG_ARCH_HAS_VM_GET_PAGE_PROT
>> -#ifndef CONFIG_ARCH_HAS_FILTER_PGPROT
>> -static inline pgprot_t arch_filter_pgprot(pgprot_t prot)
>> -{
>> -	return prot;
>> -}
>> -#endif
>> -
>>   pgprot_t vm_get_page_prot(unsigned long vm_flags)
>>   {
>>   	pgprot_t ret = __pgprot(pgprot_val(protection_map[vm_flags &
>>   				(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
>>   			pgprot_val(arch_vm_get_page_prot(vm_flags)));
>>   
>> -	return arch_filter_pgprot(ret);
>> +	return ret;
> 
> You can drop 'ret' and directly do:
> 
> 	return  __pgprot(pgprot_val(protection_map[vm_flags &
> 			(VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]) |
> 			pgprot_val(arch_vm_get_page_prot(vm_flags)));

Sure, will do.

> 
> 
>>   }
>>   EXPORT_SYMBOL(vm_get_page_prot);
>>   #endif	/* CONFIG_ARCH_HAS_VM_GET_PAGE_PROT */
