Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9B43EEE81
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Aug 2021 16:29:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GpthQ0L5Bz3cR8
	for <lists+linuxppc-dev@lfdr.de>; Wed, 18 Aug 2021 00:29:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gptgy6xl0z308G
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 18 Aug 2021 00:29:00 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4Gptgs09cHz9sVN;
 Tue, 17 Aug 2021 16:28:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FxDszkv28sce; Tue, 17 Aug 2021 16:28:56 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4Gptgr6GlNz9sV9;
 Tue, 17 Aug 2021 16:28:56 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B33FB8B7C3;
 Tue, 17 Aug 2021 16:28:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BOBEQnvExfp9; Tue, 17 Aug 2021 16:28:56 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 24ABF8B7A9;
 Tue, 17 Aug 2021 16:28:56 +0200 (CEST)
Subject: Re: [PATCH] powerpc/mm: Fix set_memory_*() against concurrent accesses
To: Fabiano Rosas <farosas@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@lists.ozlabs.org
References: <20210817132552.3375738-1-mpe@ellerman.id.au>
 <87sfz8tam3.fsf@linux.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c0d5f61b-e0cb-dcfb-3159-8d9dd02214d8@csgroup.eu>
Date: Tue, 17 Aug 2021 16:28:54 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <87sfz8tam3.fsf@linux.ibm.com>
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
Cc: lvivier@redhat.com, jniethe5@gmail.com, npiggin@gmail.com,
 aneesh.kumar@linux.ibm.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 17/08/2021 à 16:21, Fabiano Rosas a écrit :
> Michael Ellerman <mpe@ellerman.id.au> writes:
> 
> Hi, I already mentioned these things in private, but I'll post here so
> everyone can see:
> 
>> Because pte_update() takes the set of PTE bits to set and clear we can't
>> use our existing helpers, eg. pte_wrprotect() etc. and instead have to
>> open code the set of flags. We will clean that up somehow in a future
>> commit.
> 
> I tested the following on P9 and it seems to work fine. Not sure if it
> works for CONFIG_PPC_8xx, though.
> 
> 
>   static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   {
>   	long action = (long)data;
>   	pte_t pte;
>   
>   	spin_lock(&init_mm.page_table_lock);
> -
> -	/* invalidate the PTE so it's safe to modify */
> -	pte = ptep_get_and_clear(&init_mm, addr, ptep);
> -	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +	pte = *ptep;

Maybe using ptep_get() is better.

>   
>   	/* modify the PTE bits as desired, then apply */
>   	switch (action) {
> @@ -59,11 +42,9 @@ static int change_page_attr(pte_t *ptep, unsigned long addr, void *data)
>   		break;
>   	}
>   
> -	set_pte_at(&init_mm, addr, ptep, pte);
> +	pte_update(&init_mm, addr, ptep, ~0UL, pte_val(pte), 0);

Good simple idea, indeed yes it should work with much more effort.


> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>   
> -	/* See ptesync comment in radix__set_pte_at() */
> -	if (radix_enabled())
> -		asm volatile("ptesync": : :"memory");
>   	spin_unlock(&init_mm.page_table_lock);
>   
>   	return 0;
> ---
> 
> For reference, the full patch is here:
> https://github.com/farosas/linux/commit/923c95c84d7081d7be9503bf5b276dd93bd17036.patch
> 
>>
>> [1]: https://lore.kernel.org/linuxppc-dev/87y318wp9r.fsf@linux.ibm.com/
>>
>> Fixes: 1f9ad21c3b38 ("powerpc/mm: Implement set_memory() routines")
>> Reported-by: Laurent Vivier <lvivier@redhat.com>
>> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
>> ---
> 
> ...
> 
>> -	set_pte_at(&init_mm, addr, ptep, pte);
>> +	pte_update(&init_mm, addr, ptep, clear, set, 0);
>>   
>>   	/* See ptesync comment in radix__set_pte_at() */
>>   	if (radix_enabled())
>>   		asm volatile("ptesync": : :"memory");
>> +
>> +	flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> 
> I think there's an optimization possible here, when relaxing access, to
> skip the TLB flush. Would still need the ptesync though. Similar to what
> Nick did in e5f7cb58c2b7 ("powerpc/64s/radix: do not flush TLB when
> relaxing access"). It is out of scope for this patch but maybe worth
> thinking about.
> 
>> +
>>   	spin_unlock(&init_mm.page_table_lock);
>>   
>>   	return 0;
>>
>> base-commit: cbc06f051c524dcfe52ef0d1f30647828e226d30
