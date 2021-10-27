Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BF9A43C1C6
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 06:40:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HfGFb1wR3z3bWq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 27 Oct 2021 15:40:03 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HfGDv0qw0z2xXr
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 27 Oct 2021 15:39:25 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HfGDm3WfKz9sSp;
 Wed, 27 Oct 2021 06:39:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Icct1xCAegu7; Wed, 27 Oct 2021 06:39:20 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HfGDm2KTkz9sSX;
 Wed, 27 Oct 2021 06:39:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 325108B76D;
 Wed, 27 Oct 2021 06:39:20 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BCzKBFszAYKY; Wed, 27 Oct 2021 06:39:20 +0200 (CEST)
Received: from [192.168.203.162] (unknown [192.168.203.162])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 932158B763;
 Wed, 27 Oct 2021 06:39:19 +0200 (CEST)
Message-ID: <8e2c89a4-e2e9-e441-b75d-f27bd75221fc@csgroup.eu>
Date: Wed, 27 Oct 2021 06:39:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 1/3] powerpc/nohash: Fix __ptep_set_access_flags() and
 ptep_set_wrprotect()
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Paul Mackerras <paulus@samba.org>
References: <922bdab3a220781bae2360ff3dd5adb7fe4d34f1.1635226743.git.christophe.leroy@csgroup.eu>
 <1635308538.6vye6lbbh8.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <1635308538.6vye6lbbh8.astroid@bobo.none>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 27/10/2021 à 06:23, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of October 26, 2021 3:39 pm:
>> Commit 26973fa5ac0e ("powerpc/mm: use pte helpers in generic code")
>> changed those two functions to use pte helpers to determine which
>> bits to clear and which bits to set.
>>
>> This change was based on the assumption that bits to be set/cleared
>> are always the same and can be determined by applying the pte
>> manipulation helpers on __pte(0).
>>
>> But on platforms like book3e, the bits depend on whether the page
>> is a user page or not.
>>
>> For the time being it more or less works because of _PAGE_EXEC being
>> used for user pages only and exec right being set at all time on
>> kernel page. But following patch will clean that and output of
>> pte_mkexec() will depend on the page being a user or kernel page.
>>
>> Instead of trying to make an even more complicated helper where bits
>> would become dependent on the final pte value, come back to a more
>> static situation like before commit 26973fa5ac0e ("powerpc/mm: use
>> pte helpers in generic code"), by introducing an 8xx specific
>> version of __ptep_set_access_flags() and ptep_set_wrprotect().
> 
> What is this actually fixing? Does it change anything itself, or
> just a preparation patch?

Just a preparation patch I think.

I didn't flag it for stable.

Once patch 2 is applied, __ptep_set_access_flags() doesn't work anymore 
without this patch, because then pte_mkexec(__pte(0)) sets SX and clears 
UX while pte_mkexec(__pte(~0)) sets UX and clears SX

Christophe


> 
> Thanks,
> Nick
> 
>>
>> Fixes: 26973fa5ac0e ("powerpc/mm: use pte helpers in generic code")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>> v3: No change
>> v2: New
>> ---
>>   arch/powerpc/include/asm/nohash/32/pgtable.h | 17 +++++++--------
>>   arch/powerpc/include/asm/nohash/32/pte-8xx.h | 22 ++++++++++++++++++++
>>   2 files changed, 30 insertions(+), 9 deletions(-)
>>
>> diff --git a/arch/powerpc/include/asm/nohash/32/pgtable.h b/arch/powerpc/include/asm/nohash/32/pgtable.h
>> index 34ce50da1850..11c6849f7864 100644
>> --- a/arch/powerpc/include/asm/nohash/32/pgtable.h
>> +++ b/arch/powerpc/include/asm/nohash/32/pgtable.h
>> @@ -306,30 +306,29 @@ static inline pte_t ptep_get_and_clear(struct mm_struct *mm, unsigned long addr,
>>   }
>>   
>>   #define __HAVE_ARCH_PTEP_SET_WRPROTECT
>> +#ifndef ptep_set_wrprotect
>>   static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr,
>>   				      pte_t *ptep)
>>   {
>> -	unsigned long clr = ~pte_val(pte_wrprotect(__pte(~0)));
>> -	unsigned long set = pte_val(pte_wrprotect(__pte(0)));
>> -
>> -	pte_update(mm, addr, ptep, clr, set, 0);
>> +	pte_update(mm, addr, ptep, _PAGE_RW, 0, 0);
>>   }
>> +#endif
>>   
>> +#ifndef __ptep_set_access_flags
>>   static inline void __ptep_set_access_flags(struct vm_area_struct *vma,
>>   					   pte_t *ptep, pte_t entry,
>>   					   unsigned long address,
>>   					   int psize)
>>   {
>> -	pte_t pte_set = pte_mkyoung(pte_mkdirty(pte_mkwrite(pte_mkexec(__pte(0)))));
>> -	pte_t pte_clr = pte_mkyoung(pte_mkdirty(pte_mkwrite(pte_mkexec(__pte(~0)))));
>> -	unsigned long set = pte_val(entry) & pte_val(pte_set);
>> -	unsigned long clr = ~pte_val(entry) & ~pte_val(pte_clr);
>> +	unsigned long set = pte_val(entry) &
>> +			    (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_RW | _PAGE_EXEC);
>>   	int huge = psize > mmu_virtual_psize ? 1 : 0;
>>   
>> -	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
>> +	pte_update(vma->vm_mm, address, ptep, 0, set, huge);
>>   
>>   	flush_tlb_page(vma, address);
>>   }
>> +#endif
>>   
>>   static inline int pte_young(pte_t pte)
>>   {
>> diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> index fcc48d590d88..1a89ebdc3acc 100644
>> --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
>> @@ -136,6 +136,28 @@ static inline pte_t pte_mkhuge(pte_t pte)
>>   
>>   #define pte_mkhuge pte_mkhuge
>>   
>> +static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, pte_t *p,
>> +				     unsigned long clr, unsigned long set, int huge);
>> +
>> +static inline void ptep_set_wrprotect(struct mm_struct *mm, unsigned long addr, pte_t *ptep)
>> +{
>> +	pte_update(mm, addr, ptep, 0, _PAGE_RO, 0);
>> +}
>> +#define ptep_set_wrprotect ptep_set_wrprotect
>> +
>> +static inline void __ptep_set_access_flags(struct vm_area_struct *vma, pte_t *ptep,
>> +					   pte_t entry, unsigned long address, int psize)
>> +{
>> +	unsigned long set = pte_val(entry) & (_PAGE_DIRTY | _PAGE_ACCESSED | _PAGE_EXEC);
>> +	unsigned long clr = ~pte_val(entry) & _PAGE_RO;
>> +	int huge = psize > mmu_virtual_psize ? 1 : 0;
>> +
>> +	pte_update(vma->vm_mm, address, ptep, clr, set, huge);
>> +
>> +	flush_tlb_page(vma, address);
>> +}
>> +#define __ptep_set_access_flags __ptep_set_access_flags
>> +
>>   static inline unsigned long pgd_leaf_size(pgd_t pgd)
>>   {
>>   	if (pgd_val(pgd) & _PMD_PAGE_8M)
>> -- 
>> 2.31.1
>>
>>
