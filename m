Return-Path: <linuxppc-dev+bounces-5633-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 93594A20D9A
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 16:50:08 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8qx74qhz3041;
	Wed, 29 Jan 2025 02:50:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738079405;
	cv=none; b=O4U5B0+yjMqvRy6Ql7ZNpEn1LmoCuupfBYjhb0PVUKkS8KvxYqtzU4fhEjniUWGtEm8zmhv+5LGErm1owO2H18WWNsX/SO7twks2gPi2cx+2e7yuRtURCcvzjOCr0phKRBabTnUjLB9bsnDxVltf/PphyQocbK5z38pnapPg+0+UTwTKNxSdDgFUKq0AuO1AwLPNPE0tFxolmNS1TEfS/dHvtcFrda20fsoQOfrfJ7CjLZtG1OUt9iZsUsHAgmfmlTms99To9MxPgIG7XIE6MarXT9LSL5W4v2jcBuDUp8VAD0ew3BvOMkUDHH0Rer+tihcCG+rdzB/KqFiJgCcb6w==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738079405; c=relaxed/relaxed;
	bh=BWJNdo7AA4cQMRuB0+ANu9aGtDAGPZW6st+VytqKL2o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RabB4+L66erePTTzgWGHVHrPC4SIKCHMBFx9nCdcSVZThNAmSzeapQNYvNxFKmjL7Owry9b50SAX9JfMqzkhcPO+uh6mNlBAsyx5BYxMLdIi7YWwNc9Rcpa8h4fulTGDFTSl787qP+dXm1XZIB48vjY2XKYN7TWXy5IYptDty1EB6pBa1vta3zt7+DAlSpY8A7FzJ1S7wV1bO2n4zwKkYOc8PyvNUurj7qII2V7fInWorK2Me5GBCvC0ZwxMsMy3b0P6Aomc1xJhJGCMbGGeDhyGtf2IgAJYbVYSnM2Yo6rRCkXf4yd9zQ9aq27tkuiAUdwjHwZZfVWZM0dc3PcuKw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Yj8qx0khZz2yXY
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:50:04 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Yj8GJ02Vrz9sTD;
	Tue, 28 Jan 2025 16:24:24 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ESV36a5BhAvE; Tue, 28 Jan 2025 16:24:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Yj8Fz6NQdz9sTk;
	Tue, 28 Jan 2025 16:24:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id CB3EE8B76C;
	Tue, 28 Jan 2025 16:24:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 6ToQVNIjR5TM; Tue, 28 Jan 2025 16:24:07 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 557E08B763;
	Tue, 28 Jan 2025 16:24:07 +0100 (CET)
Message-ID: <e785c98f-4bf9-48ab-a102-dc531623b378@csgroup.eu>
Date: Tue, 28 Jan 2025 16:24:07 +0100
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
Subject: Re: [PATCH] powerpc: Remove eieio in _memcpy_fromio
To: Julian Vetter <julian@outer-limits.org>, Arnd Bergmann <arnd@arndb.de>,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250128135711.1625747-1-julian@outer-limits.org>
 <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
 <b335d035-07a4-457d-99ea-8b7597782fd9@outer-limits.org>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <b335d035-07a4-457d-99ea-8b7597782fd9@outer-limits.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 28/01/2025 à 16:07, Julian Vetter a écrit :
> [Vous ne recevez pas souvent de courriers de julian@outer-limits.org. 
> Découvrez pourquoi ceci est important à https://aka.ms/ 
> LearnAboutSenderIdentification ]
> 
> On 1/28/25 15:16, Christophe Leroy wrote:
>>
>>
>> Le 28/01/2025 à 14:57, Julian Vetter a écrit :
>>> Remove the eieio() calls in _memcpy_fromio, to bring its implementation
>>> closer to the one from lib/iomem_copy.c. These eieio() calls don't seem
>>> to be necessary, because the _memcpy_toio completely omits them. Also
>>> the legacy code from ppc was not doing them.
>>
>> What do you mean exactly by "legacy code" ?
>>
>> As far as I can see they were already there before commit 68a64357d15a
>> ("[POWERPC] Merge 32 and 64 bits asm-powerpc/io.h"):
>>
> 
> With 'ppc' I was refering to 'include/asm-ppc/io.h'. But you're right,
> when going back a bit, in the 'include/asm-powerpc/io.h' there are two
> cases, one (eeh_memcpy_fromio) which does the the 'eieio', and a second,
> i.e., 'iSeries_memcpy_fromio' which does a byte-wise copy. But in the
> ppc code ('include/asm-ppc/io.h') there is a simple memcpy. I was
> referring to this one. But my description is not very clear. Sorry for 
> that.

But then is your change still valid ? Isn't there some corner case that 
still need it ? Is it a valid argument that because memcpy_toio() 
doesn't need it memcpy_fromio() doesn't need it either ?

> 
>> -static inline void eeh_memcpy_fromio(void *dest, const volatile void
>> __iomem *src,
>> +static inline void eeh_memcpy_fromio(void *dest, const
>> +                     volatile void __iomem *src,
>>                        unsigned long n)
>>   {
>> -    void *vsrc = (void __force *) src;
>> -    void *destsave = dest;
>> -    unsigned long nsave = n;
>> -
>> -    __asm__ __volatile__ ("sync" : : : "memory");
>> -    while(n && (!EEH_CHECK_ALIGN(vsrc, 4) || !EEH_CHECK_ALIGN(dest, 
>> 4))) {
>> -        *((u8 *)dest) = *((volatile u8 *)vsrc);
>> -        __asm__ __volatile__ ("eieio" : : : "memory");
>> -        vsrc++;
>> -        dest++;
>> -        n--;
>> -    }
>> -    while(n > 4) {
>> -        *((u32 *)dest) = *((volatile u32 *)vsrc);
>> -        __asm__ __volatile__ ("eieio" : : : "memory");
>> -        vsrc += 4;
>> -        dest += 4;
>> -        n -= 4;
>> -    }
>> -    while(n) {
>> -        *((u8 *)dest) = *((volatile u8 *)vsrc);
>> -        __asm__ __volatile__ ("eieio" : : : "memory");
>> -        vsrc++;
>> -        dest++;
>> -        n--;
>> -    }
>> -    __asm__ __volatile__ ("sync" : : : "memory");
>> +    _memcpy_fromio(dest, src, n);
>>
>>       /* Look for ffff's here at dest[n].  Assume that at least 4 bytes
>>        * were copied. Check all four bytes.
>>        */
>> -    if ((nsave >= 4) &&
>> -        (EEH_POSSIBLE_ERROR((*((u32 *) destsave+nsave-4)), u32))) {
>> -        eeh_check_failure(src, (*((u32 *) destsave+nsave-4)));
>> -    }
>> +    if (n >= 4 && EEH_POSSIBLE_ERROR(*((u32 *)(dest + n - 4)), u32))
>> +        eeh_check_failure(src, *((u32 *)(dest + n - 4)));
>>   }
>>
>>
>>
>>>
>>> Signed-off-by: Julian Vetter <julian@outer-limits.org>
>>> ---
>>>   arch/powerpc/kernel/io.c | 3 ---
>>>   1 file changed, 3 deletions(-)
>>>
>>> diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
>>> index 6af535905984..81e5d54260a1 100644
>>> --- a/arch/powerpc/kernel/io.c
>>> +++ b/arch/powerpc/kernel/io.c
>>> @@ -155,21 +155,18 @@ void _memcpy_fromio(void *dest, const volatile
>>> void __iomem *src,
>>>          __asm__ __volatile__ ("sync" : : : "memory");
>>>          while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest,
>>> 4))) {
>>>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
>>> -               eieio();
>>>                  vsrc++;
>>>                  dest++;
>>>                  n--;
>>>          }
>>>          while(n >= 4) {
>>>                  *((u32 *)dest) = *((volatile u32 *)vsrc);
>>> -               eieio();
>>>                  vsrc += 4;
>>>                  dest += 4;
>>>                  n -= 4;
>>>          }
>>>          while(n) {
>>>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
>>> -               eieio();
>>>                  vsrc++;
>>>                  dest++;
>>>                  n--;
>>> -- 
>>> 2.34.1
>>>
>>


