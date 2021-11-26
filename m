Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7708345F335
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 Nov 2021 18:56:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4J12VK2VjGz3cVr
	for <lists+linuxppc-dev@lfdr.de>; Sat, 27 Nov 2021 04:56:09 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4J12Tv1cdyz307l
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 27 Nov 2021 04:55:44 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4J12Tn1bH3z9sSM;
 Fri, 26 Nov 2021 18:55:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Bu5lUS5MaXUO; Fri, 26 Nov 2021 18:55:41 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4J12Tn0jGJz9sSL;
 Fri, 26 Nov 2021 18:55:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 08E818B781;
 Fri, 26 Nov 2021 18:55:41 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id F85HcYsrT7oE; Fri, 26 Nov 2021 18:55:40 +0100 (CET)
Received: from [192.168.204.6] (unknown [192.168.204.6])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6C3EB8B763;
 Fri, 26 Nov 2021 18:55:40 +0100 (CET)
Message-ID: <9b7ffc7d-bd35-8d99-0c8f-1801988c5551@csgroup.eu>
Date: Fri, 26 Nov 2021 18:55:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] powerpc/mm: Use refcount_t for refcount
Content-Language: fr-FR
To: Michael Ellerman <mpe@ellerman.id.au>, Chuhong Yuan <hslester96@gmail.com>
References: <20190808071808.6531-1-hslester96@gmail.com>
 <87y302segw.fsf@concordia.ellerman.id.au>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87y302segw.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org, Paul Mackerras <paulus@samba.org>,
 linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 09/08/2019 à 14:36, Michael Ellerman a écrit :
> Chuhong Yuan <hslester96@gmail.com> writes:
>> Reference counters are preferred to use refcount_t instead of
>> atomic_t.
>> This is because the implementation of refcount_t can prevent
>> overflows and detect possible use-after-free.
>> So convert atomic_t ref counters to refcount_t.
>>
>> Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
> 
> Thanks.
> 
> We don't have a fast implementation of refcount_t, so I'm worried this
> could cause a measurable performance regression.

Fast implementations have been removed by commit 
https://github.com/linuxppc/linux/commit/fb041bb7c0a918b95c6889fc965cdc4a75b4c0ca

It's now considered that the generic implementation is good enough for 
everybody.

However, this series doesn't apply anymore and needs rebase:

Applying: powerpc/mm: Use refcount_t for refcount
Using index info to reconstruct a base tree...
M	arch/powerpc/mm/book3s64/mmu_context.c
M	arch/powerpc/mm/book3s64/pgtable.c
M	arch/powerpc/mm/pgtable-frag.c
M	include/linux/mm_types.h
Falling back to patching base and 3-way merge...
Auto-merging include/linux/mm_types.h
CONFLICT (content): Merge conflict in include/linux/mm_types.h
Auto-merging arch/powerpc/mm/pgtable-frag.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/pgtable-frag.c
Auto-merging arch/powerpc/mm/book3s64/pgtable.c
CONFLICT (content): Merge conflict in arch/powerpc/mm/book3s64/pgtable.c
Auto-merging arch/powerpc/mm/book3s64/mmu_context.c
Patch failed at 0001 powerpc/mm: Use refcount_t for refcount
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Thanks
Christophe


> 
> Did you benchmark it at all?
> 
> cheers
> 
>> diff --git a/arch/powerpc/mm/book3s64/mmu_context.c b/arch/powerpc/mm/book3s64/mmu_context.c
>> index 2d0cb5ba9a47..f836fd5a6abc 100644
>> --- a/arch/powerpc/mm/book3s64/mmu_context.c
>> +++ b/arch/powerpc/mm/book3s64/mmu_context.c
>> @@ -231,7 +231,7 @@ static void pmd_frag_destroy(void *pmd_frag)
>>   	/* drop all the pending references */
>>   	count = ((unsigned long)pmd_frag & ~PAGE_MASK) >> PMD_FRAG_SIZE_SHIFT;
>>   	/* We allow PTE_FRAG_NR fragments from a PTE page */
>> -	if (atomic_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
>> +	if (refcount_sub_and_test(PMD_FRAG_NR - count, &page->pt_frag_refcount)) {
>>   		pgtable_pmd_page_dtor(page);
>>   		__free_page(page);
>>   	}
>> diff --git a/arch/powerpc/mm/book3s64/pgtable.c b/arch/powerpc/mm/book3s64/pgtable.c
>> index 7d0e0d0d22c4..40056896ce4e 100644
>> --- a/arch/powerpc/mm/book3s64/pgtable.c
>> +++ b/arch/powerpc/mm/book3s64/pgtable.c
>> @@ -277,7 +277,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>>   		return NULL;
>>   	}
>>   
>> -	atomic_set(&page->pt_frag_refcount, 1);
>> +	refcount_set(&page->pt_frag_refcount, 1);
>>   
>>   	ret = page_address(page);
>>   	/*
>> @@ -294,7 +294,7 @@ static pmd_t *__alloc_for_pmdcache(struct mm_struct *mm)
>>   	 * count.
>>   	 */
>>   	if (likely(!mm->context.pmd_frag)) {
>> -		atomic_set(&page->pt_frag_refcount, PMD_FRAG_NR);
>> +		refcount_set(&page->pt_frag_refcount, PMD_FRAG_NR);
>>   		mm->context.pmd_frag = ret + PMD_FRAG_SIZE;
>>   	}
>>   	spin_unlock(&mm->page_table_lock);
>> @@ -317,8 +317,7 @@ void pmd_fragment_free(unsigned long *pmd)
>>   {
>>   	struct page *page = virt_to_page(pmd);
>>   
>> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
>> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>> +	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
>>   		pgtable_pmd_page_dtor(page);
>>   		__free_page(page);
>>   	}
>> diff --git a/arch/powerpc/mm/pgtable-frag.c b/arch/powerpc/mm/pgtable-frag.c
>> index a7b05214760c..4ef8231b677f 100644
>> --- a/arch/powerpc/mm/pgtable-frag.c
>> +++ b/arch/powerpc/mm/pgtable-frag.c
>> @@ -24,7 +24,7 @@ void pte_frag_destroy(void *pte_frag)
>>   	/* drop all the pending references */
>>   	count = ((unsigned long)pte_frag & ~PAGE_MASK) >> PTE_FRAG_SIZE_SHIFT;
>>   	/* We allow PTE_FRAG_NR fragments from a PTE page */
>> -	if (atomic_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
>> +	if (refcount_sub_and_test(PTE_FRAG_NR - count, &page->pt_frag_refcount)) {
>>   		pgtable_page_dtor(page);
>>   		__free_page(page);
>>   	}
>> @@ -71,7 +71,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>>   			return NULL;
>>   	}
>>   
>> -	atomic_set(&page->pt_frag_refcount, 1);
>> +	refcount_set(&page->pt_frag_refcount, 1);
>>   
>>   	ret = page_address(page);
>>   	/*
>> @@ -87,7 +87,7 @@ static pte_t *__alloc_for_ptecache(struct mm_struct *mm, int kernel)
>>   	 * count.
>>   	 */
>>   	if (likely(!pte_frag_get(&mm->context))) {
>> -		atomic_set(&page->pt_frag_refcount, PTE_FRAG_NR);
>> +		refcount_set(&page->pt_frag_refcount, PTE_FRAG_NR);
>>   		pte_frag_set(&mm->context, ret + PTE_FRAG_SIZE);
>>   	}
>>   	spin_unlock(&mm->page_table_lock);
>> @@ -110,8 +110,7 @@ void pte_fragment_free(unsigned long *table, int kernel)
>>   {
>>   	struct page *page = virt_to_page(table);
>>   
>> -	BUG_ON(atomic_read(&page->pt_frag_refcount) <= 0);
>> -	if (atomic_dec_and_test(&page->pt_frag_refcount)) {
>> +	if (refcount_dec_and_test(&page->pt_frag_refcount)) {
>>   		if (!kernel)
>>   			pgtable_page_dtor(page);
>>   		__free_page(page);
>> diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
>> index 3a37a89eb7a7..7fe23a3faf95 100644
>> --- a/include/linux/mm_types.h
>> +++ b/include/linux/mm_types.h
>> @@ -14,6 +14,7 @@
>>   #include <linux/uprobes.h>
>>   #include <linux/page-flags-layout.h>
>>   #include <linux/workqueue.h>
>> +#include <linux/refcount.h>
>>   
>>   #include <asm/mmu.h>
>>   
>> @@ -147,7 +148,7 @@ struct page {
>>   			unsigned long _pt_pad_2;	/* mapping */
>>   			union {
>>   				struct mm_struct *pt_mm; /* x86 pgds only */
>> -				atomic_t pt_frag_refcount; /* powerpc */
>> +				refcount_t pt_frag_refcount; /* powerpc */
>>   			};
>>   #if ALLOC_SPLIT_PTLOCKS
>>   			spinlock_t *ptl;
>> -- 
>> 2.20.1
