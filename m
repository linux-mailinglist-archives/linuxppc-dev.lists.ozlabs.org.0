Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2552A361973
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 07:49:08 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FM4yp0Gr5z3bnd
	for <lists+linuxppc-dev@lfdr.de>; Fri, 16 Apr 2021 15:49:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FM4yR6bKfz2yZK
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 16 Apr 2021 15:48:45 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FM4yL18bxzB09bL;
 Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id y8gfrr0M5iy9; Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FM4yK6ptpzB09bK;
 Fri, 16 Apr 2021 07:48:41 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C3C238B81C;
 Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GFphMEGbTxDw; Fri, 16 Apr 2021 07:48:42 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BFF598B81A;
 Fri, 16 Apr 2021 07:48:41 +0200 (CEST)
Subject: Re: [PATCH v1 1/5] mm: pagewalk: Fix walk for hugepage tables
To: Daniel Axtens <dja@axtens.net>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
 <877dl3184l.fsf@dja-thinkpad.axtens.net>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <56d4c630-ac1e-6b75-39a5-7b5bfbd5b1aa@csgroup.eu>
Date: Fri, 16 Apr 2021 07:48:41 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <877dl3184l.fsf@dja-thinkpad.axtens.net>
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
Cc: linux-arch@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 16/04/2021 à 00:43, Daniel Axtens a écrit :
> Hi Christophe,
> 
>> Pagewalk ignores hugepd entries and walk down the tables
>> as if it was traditionnal entries, leading to crazy result.
>>
>> Add walk_hugepd_range() and use it to walk hugepage tables.
>>
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   mm/pagewalk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++------
>>   1 file changed, 48 insertions(+), 6 deletions(-)
>>
>> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
>> index e81640d9f177..410a9d8f7572 100644
>> --- a/mm/pagewalk.c
>> +++ b/mm/pagewalk.c
>> @@ -58,6 +58,32 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>>   	return err;
>>   }
>>   
>> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
>> +			     unsigned long end, struct mm_walk *walk, int pdshift)
>> +{
>> +	int err = 0;
>> +#ifdef CONFIG_ARCH_HAS_HUGEPD
>> +	const struct mm_walk_ops *ops = walk->ops;
>> +	int shift = hugepd_shift(*phpd);
>> +	int page_size = 1 << shift;
>> +
>> +	if (addr & (page_size - 1))
>> +		return 0;
>> +
>> +	for (;;) {
>> +		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
>> +
>> +		err = ops->pte_entry(pte, addr, addr + page_size, walk);
>> +		if (err)
>> +			break;
>> +		if (addr >= end - page_size)
>> +			break;
>> +		addr += page_size;
>> +	}
> 
> Initially I thought this was a somewhat unintuitive way to structure
> this loop, but I see it parallels the structure of walk_pte_range_inner,
> so I think the consistency is worth it.
> 
> I notice the pte walking code potentially takes some locks: does this
> code need to do that?
> 
> arch/powerpc/mm/hugetlbpage.c says that hugepds are protected by the
> mm->page_table_lock, but I don't think we're taking it in this code.

I'll add it, thanks.

> 
>> +#endif
>> +	return err;
>> +}
>> +
>>   static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>>   			  struct mm_walk *walk)
>>   {
>> @@ -108,7 +134,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>>   				goto again;
>>   		}
>>   
>> -		err = walk_pte_range(pmd, addr, next, walk);
>> +		if (is_hugepd(__hugepd(pmd_val(*pmd))))
>> +			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
>> +		else
>> +			err = walk_pte_range(pmd, addr, next, walk);
>>   		if (err)
>>   			break;
>>   	} while (pmd++, addr = next, addr != end);
>> @@ -157,7 +186,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>>   		if (pud_none(*pud))
>>   			goto again;
>>   
>> -		err = walk_pmd_range(pud, addr, next, walk);
>> +		if (is_hugepd(__hugepd(pud_val(*pud))))
>> +			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
>> +		else
>> +			err = walk_pmd_range(pud, addr, next, walk);
> 
> I'm a bit worried you might end up calling into walk_hugepd_range with
> ops->pte_entry == NULL, and then jumping to 0.

You are right, I missed it.
I'll bail out of walk_hugepd_range() when ops->pte_entry is NULL.


> 
> static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
> 			  struct mm_walk *walk)
> {
> ...
>          pud = pud_offset(p4d, addr);
> 	do {
>                  ...
>                  if ((!walk->vma && (pud_leaf(*pud) || !pud_present(*pud))) ||
> 		    walk->action == ACTION_CONTINUE ||
> 		    !(ops->pmd_entry || ops->pte_entry)) <<< THIS CHECK
> 			continue;
>                  ...
> 		if (is_hugepd(__hugepd(pud_val(*pud))))
> 			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
> 		else
> 			err = walk_pmd_range(pud, addr, next, walk);
> 		if (err)
> 			break;
> 	} while (pud++, addr = next, addr != end);
> 
> walk_pud_range will proceed if there is _either_ an ops->pmd_entry _or_
> an ops->pte_entry, but walk_hugepd_range will call ops->pte_entry
> unconditionally.
> 
> The same issue applies to walk_{p4d,pgd}_range...
> 
> Kind regards,
> Daniel
> 

Thanks
Christophe
