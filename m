Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C14D25A799
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 10:18:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BhGzN08wQzDqbD
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Sep 2020 18:18:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BhGqT658qzDqTv
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Sep 2020 18:11:33 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BhGqL3C3xz9vCyG;
 Wed,  2 Sep 2020 10:11:26 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id E0RZ90cem4bM; Wed,  2 Sep 2020 10:11:26 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BhGqL2Pdyz9vBnC;
 Wed,  2 Sep 2020 10:11:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 6958E8B7A3;
 Wed,  2 Sep 2020 10:11:27 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LF3wCfD47HqP; Wed,  2 Sep 2020 10:11:27 +0200 (CEST)
Received: from [10.25.210.31] (unknown [10.25.210.31])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2C76D8B784;
 Wed,  2 Sep 2020 10:11:27 +0200 (CEST)
Subject: Re: [PATCH] powerpc: Fix random segfault when freeing hugetlb range
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>
References: <f0cb2a5477cd87d1eaadb128042e20aeb2bc2859.1598860677.git.christophe.leroy@csgroup.eu>
 <875z8weua7.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <96409d24-c8bf-7f3a-0a81-0830174d6bcc@csgroup.eu>
Date: Wed, 2 Sep 2020 10:11:23 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <875z8weua7.fsf@linux.ibm.com>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 02/09/2020 à 05:23, Aneesh Kumar K.V a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> The following random segfault is observed from time to time with
>> map_hugetlb selftest:
>>
>> root@localhost:~# ./map_hugetlb 1 19
>> 524288 kB hugepages
>> Mapping 1 Mbytes
>> Segmentation fault
>>
>> [   31.219972] map_hugetlb[365]: segfault (11) at 117 nip 77974f8c lr 779a6834 code 1 in ld-2.23.so[77966000+21000]
>> [   31.220192] map_hugetlb[365]: code: 9421ffc0 480318d1 93410028 90010044 9361002c 93810030 93a10034 93c10038
>> [   31.220307] map_hugetlb[365]: code: 93e1003c 93210024 8123007c 81430038 <80e90004> 814a0004 7f443a14 813a0004
>> [   31.221911] BUG: Bad rss-counter state mm:(ptrval) type:MM_FILEPAGES val:33
>> [   31.229362] BUG: Bad rss-counter state mm:(ptrval) type:MM_ANONPAGES val:5
>>
>> This fault is due to hugetlb_free_pgd_range() freeing page tables
>> that are also used by regular pages.
>>
>> As explain in the comment at the beginning of
>> hugetlb_free_pgd_range(), the verification done in free_pgd_range()
>> on floor and ceiling is not done here, which means
>> hugetlb_free_pte_range() can free outside the expected range.
>>
>> As the verification cannot be done in hugetlb_free_pgd_range(), it
>> must be done in hugetlb_free_pte_range().
>>
> 
> Reviewed-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>
> 
>> Fixes: b250c8c08c79 ("powerpc/8xx: Manage 512k huge pages as standard pages.")
>> Cc: stable@vger.kernel.org
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/mm/hugetlbpage.c | 18 ++++++++++++++++--
>>   1 file changed, 16 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/powerpc/mm/hugetlbpage.c b/arch/powerpc/mm/hugetlbpage.c
>> index 26292544630f..e7ae2a2c4545 100644
>> --- a/arch/powerpc/mm/hugetlbpage.c
>> +++ b/arch/powerpc/mm/hugetlbpage.c
>> @@ -330,10 +330,24 @@ static void free_hugepd_range(struct mmu_gather *tlb, hugepd_t *hpdp, int pdshif
>>   				 get_hugepd_cache_index(pdshift - shift));
>>   }
>>   
>> -static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd, unsigned long addr)
>> +static void hugetlb_free_pte_range(struct mmu_gather *tlb, pmd_t *pmd,
>> +				   unsigned long addr, unsigned long end,
>> +				   unsigned long floor, unsigned long ceiling)
>>   {
>> +	unsigned long start = addr;
>>   	pgtable_t token = pmd_pgtable(*pmd);
>>   
>> +	start &= PMD_MASK;
>> +	if (start < floor)
>> +		return;
>> +	if (ceiling) {
>> +		ceiling &= PMD_MASK;
>> +		if (!ceiling)
>> +			return;
>> +	}
>> +	if (end - 1 > ceiling - 1)
>> +		return;
>> +
> 
> We do repeat that for pud/pmd/pte hugetlb_free_range. Can we consolidate
> that with comment explaining we are checking if the pgtable entry is
> mapping outside the range?

I was thinking about refactoring that into a helper and add all the 
necessary comments to explain what it does.

Will do that in a followup series if you are OK. This patch is a bug fix 
and also have to go through stable.

Christophe
