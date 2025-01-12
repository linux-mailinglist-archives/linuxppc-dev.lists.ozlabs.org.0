Return-Path: <linuxppc-dev+bounces-5098-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 13ADBA0AB8B
	for <lists+linuxppc-dev@lfdr.de>; Sun, 12 Jan 2025 19:50:12 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWPb36yzfz30WM;
	Mon, 13 Jan 2025 05:50:07 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1736707807;
	cv=none; b=bqsHjtwflzsJlz+6UWWtBlEV3+f3Bq1Fl/HR7QpoUpe7T0BrTi/2yhmYZ3/Qq3L9E1JKedlPs6zaFj9H2+aA8GGyPdSO6NfuXJBZJ/AecWIo7Cx/LCfMVHHVG9JAGpzSgxtRHTjnVHYsFe4CjNe5rbqPmq9VFSmcWgPrT0S1w4ZQpdF1oqzw2GagVsz3l1QtoErM5PGAeRd0KaFy6r0GCh1QzoH1vh/saGUgIwR+JB3KYy/OEwo48nr+e5lS1ZOIjwbfrGfEO4E9ZvaTLcCjvGQc+84NAAKFicf8FMYyHTCqw3bCmNRFJdTHGYpoQybnC45VNXKVSpdu0fZB+vNFaw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1736707807; c=relaxed/relaxed;
	bh=/O+9lIfNMOYHtqT4Lx5OGKPHJjKELI7V3CIGTydv/gU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NYvsg/B/byfWP03G8Tmzl7Hk8yce447QOie3ZHLEUHedbjmOEtwrMEXJhzDvJlUko2eDH89w9SOw/5JdRFn6WqOrRSs2S16wOxqxk5abTiozq9ULBRk8hQoabCVEHid1g2HCgDYWuThEXgBhfAtpnDDNwDmG1mKiG172FzI4DIi3MSJNuaejH7PYanDB4lSvkwqKqidKMfkcxFzcxbysNvFIJdZpGStJ+BFRsxyqAkHOBSFY+TkJusIVghIvkR3sdyqNzYqLcT/GEfcZn+Wo/9m7ckxYLPJyM1Z5+qeiNqTjl/7hsNvrfJbYPcTXkSOpcz7P8gaU1YgUMLhHnzGiWA==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YWPb250MSz30WC
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 13 Jan 2025 05:50:05 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YWP3F727wz9sRr;
	Sun, 12 Jan 2025 19:26:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FbcUDswDlTnR; Sun, 12 Jan 2025 19:26:01 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YWP3F69zyz9sRk;
	Sun, 12 Jan 2025 19:26:01 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C32E98B764;
	Sun, 12 Jan 2025 19:26:01 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id sr6VeL2WyUD6; Sun, 12 Jan 2025 19:26:01 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 517808B763;
	Sun, 12 Jan 2025 19:26:01 +0100 (CET)
Message-ID: <e896ced5-f43f-478f-a55c-68a49f0492d9@csgroup.eu>
Date: Sun, 12 Jan 2025 19:26:00 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/64s: Rewrite __real_pte() as a static inline
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 kernel test robot <lkp@intel.com>
References: <06750dbc7bf961e3ea7ef7a89d5c220972465ea5.1736331264.git.christophe.leroy@csgroup.eu>
 <87o70duvuf.fsf@gmail.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <87o70duvuf.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 11/01/2025 à 18:03, Ritesh Harjani a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> Rewrite __real_pte() as a static inline in order to avoid
>> following warning/error when building with 4k page size:
>>
>> 	  CC      arch/powerpc/mm/book3s64/hash_tlb.o
>> 	arch/powerpc/mm/book3s64/hash_tlb.c: In function 'hpte_need_flush':
>> 	arch/powerpc/mm/book3s64/hash_tlb.c:49:16: error: variable 'offset' set but not used [-Werror=unused-but-set-variable]
>> 	   49 |         int i, offset;
>> 	      |                ^~~~~~
>> 	cc1: all warnings being treated as errors
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202501081741.AYFwybsq-lkp@intel.com/
> 
> Great. Why not fix the other warning as well which is reported in above
> link, which is...

Just because .... I overlooked the report and missed the second error.

Sent v2 with both fixes now.


> 
> --
>     arch/powerpc/mm/book3s64/hash_native.c: In function 'native_flush_hash_range':
>>> arch/powerpc/mm/book3s64/hash_native.c:786:29: warning: variable 'index' set but not used [-Wunused-but-set-variable]
>       786 |         unsigned long hash, index, hidx, shift, slot;
> --
> 
> ...similar to how we fixed this warning by making the macro as static
> inline? That means something like this (not tested)?
> 
> -#define __rpte_to_hidx(r,index)        (pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
> +static inline unsigned long __rpte_to_hidx(real_pte_t r, unsigned long index)
> +{
> +       return pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT;
> +}
> 
> 
> -ritesh
> 
> 
>> Fixes: ff31e105464d ("powerpc/mm/hash64: Store the slot information at the right offset for hugetlb")
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/book3s/64/hash-4k.h | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/include/asm/book3s/64/hash-4k.h b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> index c3efacab4b94..a7a68ba9c71b 100644
>> --- a/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> +++ b/arch/powerpc/include/asm/book3s/64/hash-4k.h
>> @@ -77,7 +77,10 @@
>>   /*
>>    * With 4K page size the real_pte machinery is all nops.
>>    */
>> -#define __real_pte(e, p, o)		((real_pte_t){(e)})
>> +static inline real_pte_t __real_pte(pte_t pte, pte_t *ptep, int offset)
>> +{
>> +	return (real_pte_t){pte};
>> +}
>>   #define __rpte_to_pte(r)	((r).pte)
>>   #define __rpte_to_hidx(r,index)	(pte_val(__rpte_to_pte(r)) >> H_PAGE_F_GIX_SHIFT)
>>   
>> -- 
>> 2.47.0


