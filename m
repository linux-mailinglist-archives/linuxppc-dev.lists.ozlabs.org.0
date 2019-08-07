Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F41AD85473
	for <lists+linuxppc-dev@lfdr.de>; Wed,  7 Aug 2019 22:21:22 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 463jZQ6jPTzDqwC
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 06:21:18 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="KTQQgedC"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 463jXZ0mbLzDqsQ
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 06:19:39 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 463jXP6c4Vz9vBLT;
 Wed,  7 Aug 2019 22:19:33 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=KTQQgedC; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id vkZg1hjmxe6j; Wed,  7 Aug 2019 22:19:33 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 463jXP5Y4Yz9vBLS;
 Wed,  7 Aug 2019 22:19:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1565209173; bh=57DtjlRxMDPWdcwxXXws0HEAdpUFobNq2eg6TQP36p4=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=KTQQgedC+gxwirF06Rh57pVWCmqw3bwxJkqsbvF9xGRHzcvNcuvxw4dR0LSNRupUL
 MR7NUheLsK+Vl/PmGhXtXWKNjwWlwdDmR6YRf9AidlDzxAuZ4um38fLfw6kBjo/bh6
 M0SULw5xPKoa4S3wpgQhZL4IB03uQeovr97ZDgvg=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9EF38B83A;
 Wed,  7 Aug 2019 22:19:33 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Xlnv674J6NDN; Wed,  7 Aug 2019 22:19:33 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C0EB48B839;
 Wed,  7 Aug 2019 22:19:32 +0200 (CEST)
Subject: Re: [PATCH 1/4] kasan: allow arches to provide their own early shadow
 setup
To: Daniel Axtens <dja@axtens.net>, aneesh.kumar@linux.ibm.com,
 bsingharora@gmail.com
References: <20190806233827.16454-1-dja@axtens.net>
 <20190806233827.16454-2-dja@axtens.net>
 <023863f0-0aa5-17f5-41c9-88acfc9a786b@c-s.fr>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <64256206-7c95-7f3c-f601-c688316ef680@c-s.fr>
Date: Wed, 7 Aug 2019 22:19:32 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <023863f0-0aa5-17f5-41c9-88acfc9a786b@c-s.fr>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: linuxppc-dev@lists.ozlabs.org, kasan-dev@googlegroups.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 07/08/2019 à 17:14, Christophe Leroy a écrit :
> 
> 
> Le 07/08/2019 à 01:38, Daniel Axtens a écrit :
>> powerpc supports several different MMUs. In particular, book3s
>> machines support both a hash-table based MMU and a radix MMU.
>> These MMUs support different numbers of entries per directory
>> level: the PTES_PER_* defines evaluate to variables, not constants.
>> This leads to complier errors as global variables must have constant
>> sizes.
>>
>> Allow architectures to manage their own early shadow variables so we
>> can work around this on powerpc.
> 
> This seems rather strange to move the early shadow tables out of 
> mm/kasan/init.c allthough they are used there still.
> 
> What about doing for all what is already done for 
> kasan_early_shadow_p4d[], in extenso define constant max sizes 
> MAX_PTRS_PER_PTE, MAX_PTRS_PER_PMD and MAX_PTRS_PER_PUD ?

To illustrate my suggestion, see commit c65e774fb3f6af21 ("x86/mm: Make 
PGDIR_SHIFT and PTRS_PER_P4D variable")

The same principle should apply on all variable powerpc PTRS_PER_XXX.

Christophe

> 
> With a set of the following, it would remain transparent for other arches.
> #ifndef MAX_PTRS_PER_PXX
> #define MAX_PTRS_PER_PXX PTRS_PER_PXX
> #endif
> 
> Then you would just need to do the following for Radix:
> 
> #define MAX_PTRS_PER_PTE        (1 << RADIX_PTE_INDEX_SIZE)
> #define MAX_PTRS_PER_PMD        (1 << RADIX_PMD_INDEX_SIZE)
> #define MAX_PTRS_PER_PUD        (1 << RADIX_PUD_INDEX_SIZE)
> 
> 
> For the kasan_early_shadow_page[], I don't think we have variable 
> PAGE_SIZE, have we ?
> 
> Christophe
> 
> 
>>
>> Signed-off-by: Daniel Axtens <dja@axtens.net>
>>
>> ---
>> Changes from RFC:
>>
>>   - To make checkpatch happy, move ARCH_HAS_KASAN_EARLY_SHADOW from
>>     a random #define to a config option selected when building for
>>     ppc64 book3s
>> ---
>>   include/linux/kasan.h |  2 ++
>>   lib/Kconfig.kasan     |  3 +++
>>   mm/kasan/init.c       | 10 ++++++++++
>>   3 files changed, 15 insertions(+)
>>
>> diff --git a/include/linux/kasan.h b/include/linux/kasan.h
>> index ec81113fcee4..15933da52a3e 100644
>> --- a/include/linux/kasan.h
>> +++ b/include/linux/kasan.h
>> @@ -14,11 +14,13 @@ struct task_struct;
>>   #include <asm/kasan.h>
>>   #include <asm/pgtable.h>
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   extern unsigned char kasan_early_shadow_page[PAGE_SIZE];
>>   extern pte_t kasan_early_shadow_pte[PTRS_PER_PTE];
>>   extern pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD];
>>   extern pud_t kasan_early_shadow_pud[PTRS_PER_PUD];
>>   extern p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D];
>> +#endif
>>   int kasan_populate_early_shadow(const void *shadow_start,
>>                   const void *shadow_end);
>> diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
>> index a320dc2e9317..0621a0129c04 100644
>> --- a/lib/Kconfig.kasan
>> +++ b/lib/Kconfig.kasan
>> @@ -9,6 +9,9 @@ config HAVE_ARCH_KASAN_SW_TAGS
>>   config    HAVE_ARCH_KASAN_VMALLOC
>>       bool
>> +config ARCH_HAS_KASAN_EARLY_SHADOW
>> +    bool
>> +
>>   config CC_HAS_KASAN_GENERIC
>>       def_bool $(cc-option, -fsanitize=kernel-address)
>> diff --git a/mm/kasan/init.c b/mm/kasan/init.c
>> index ce45c491ebcd..7ef2b87a7988 100644
>> --- a/mm/kasan/init.c
>> +++ b/mm/kasan/init.c
>> @@ -31,10 +31,14 @@
>>    *   - Latter it reused it as zero shadow to cover large ranges of 
>> memory
>>    *     that allowed to access, but not handled by kasan 
>> (vmalloc/vmemmap ...).
>>    */
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   unsigned char kasan_early_shadow_page[PAGE_SIZE] __page_aligned_bss;
>> +#endif
>>   #if CONFIG_PGTABLE_LEVELS > 4
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   p4d_t kasan_early_shadow_p4d[MAX_PTRS_PER_P4D] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_p4d_table(pgd_t pgd)
>>   {
>>       return pgd_page(pgd) == 
>> virt_to_page(lm_alias(kasan_early_shadow_p4d));
>> @@ -46,7 +50,9 @@ static inline bool kasan_p4d_table(pgd_t pgd)
>>   }
>>   #endif
>>   #if CONFIG_PGTABLE_LEVELS > 3
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pud_t kasan_early_shadow_pud[PTRS_PER_PUD] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_pud_table(p4d_t p4d)
>>   {
>>       return p4d_page(p4d) == 
>> virt_to_page(lm_alias(kasan_early_shadow_pud));
>> @@ -58,7 +64,9 @@ static inline bool kasan_pud_table(p4d_t p4d)
>>   }
>>   #endif
>>   #if CONFIG_PGTABLE_LEVELS > 2
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pmd_t kasan_early_shadow_pmd[PTRS_PER_PMD] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_pmd_table(pud_t pud)
>>   {
>>       return pud_page(pud) == 
>> virt_to_page(lm_alias(kasan_early_shadow_pmd));
>> @@ -69,7 +77,9 @@ static inline bool kasan_pmd_table(pud_t pud)
>>       return false;
>>   }
>>   #endif
>> +#ifndef CONFIG_ARCH_HAS_KASAN_EARLY_SHADOW
>>   pte_t kasan_early_shadow_pte[PTRS_PER_PTE] __page_aligned_bss;
>> +#endif
>>   static inline bool kasan_pte_table(pmd_t pmd)
>>   {
>>
