Return-Path: <linuxppc-dev+bounces-5650-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F24BA21228
	for <lists+linuxppc-dev@lfdr.de>; Tue, 28 Jan 2025 20:24:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YjFbP0XLBz306J;
	Wed, 29 Jan 2025 06:24:33 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=pass smtp.remote-ip=85.215.255.52 arc.chain=strato.com
ARC-Seal: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738076893;
	cv=pass; b=JkbVDl5vknu0XGIa8u2MJOOesyvs3YYEmOZtPi0OTN9ZrLlgWqVX+yCTGTOpGOifO+nBoMgbhhwuKbalS8KqqnrHYHTbcw4ACvXK7/dr7PWHcvVAVbEkYPz9nU+jTVQX7HVJHopp5xyQdhiALEEKn36rKbcB7XG3zUHRKxoo+YdZAu+v1cg91tMztqrnL7T+7qNHYjX4TODWXzQQxpTm1Ug3vQNsUUeW10rBQajyUZ5N9+jV64EyaCdrf+sDxTsZybguF7pEDn9Rn7F+H4Zc2DZxRjgv5LnEWqZzsm34UP68pyHD7K1XMR6/3SUdnTptZHffZrO6p1WNBHEjcrD22Q==
ARC-Message-Signature: i=2; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738076893; c=relaxed/relaxed;
	bh=k1hpW395twfgxrUZKuBtcG4bsKQnq9Y5eIRAEwTWI7A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UsysQkoz1fridEzJ7JYnBOWFXbfguM8WQsG/6siCfqvEndNC7pmzgiGDnKizfPfM9O4yGe7+x+dhY4hp0QQcVBvA94tfFVbKr7wh4x+28jCS/mjGqO1iZcTeAAR7fVLOpXogCljwXvleD9YN/fCiwPZIP7Am5SUE2Lq2RTvB83HzbF4Nrfrw7UnMw2tSouXFGWX2/XI9ryKN8kwvEhEyA4S8ObRLKsT+ACx6xXRl5zmg7ZvvPHH5pLa+7uFGbqY+4z5qPb9WGRUDd73beTky+9pHeigJFfI2XdyyIee9WUjE0j53JzPv4UwFOJxGsd6X9i/6ggUNAq2CwLO3FZuZYw==
ARC-Authentication-Results: i=2; lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org; dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=j2InN5mx; dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=nsrffby5; dkim-atps=neutral; spf=pass (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org) smtp.helo=mo4-p01-ob.smtp.rzone.de
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=outer-limits.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=outer-limits.org header.i=@outer-limits.org header.a=rsa-sha256 header.s=strato-dkim-0002 header.b=j2InN5mx;
	dkim=pass header.d=outer-limits.org header.i=@outer-limits.org header.a=ed25519-sha256 header.s=strato-dkim-0003 header.b=nsrffby5;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.helo=mo4-p01-ob.smtp.rzone.de (client-ip=85.215.255.52; helo=mo4-p01-ob.smtp.rzone.de; envelope-from=julian@outer-limits.org; receiver=lists.ozlabs.org)
Received: from mo4-p01-ob.smtp.rzone.de (mo4-p01-ob.smtp.rzone.de [85.215.255.52])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Yj7vZ2WKtz2yG9
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 29 Jan 2025 02:08:08 +1100 (AEDT)
ARC-Seal: i=1; a=rsa-sha256; t=1738076876; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=MXac8AKc3ew22evFR4BuNWdmOJrPrJFNgFdFkYIoCcEA8/9SdgmTXT/Kpo5OAaQ5O8
    2jfa4GP4uRHXf3zz4Bf7x5DocNXJ1/+c1sHWo9Fmt4P3XLz/rYQGNC4drdUekiifm1Si
    95csREv+nyOwzCRHw0lKYLx+fGz9bT44EQnHfX63C6obKCY2GkwM3GaSnAvvL/ELSbjk
    N2GbMllKn7lvTQV+EPA2LqoXVzVjf1lZnS8TZPXPpX2A3x+SK2csCrYKQXiE0GLIl84y
    dTCpyjLZJaHwOIgDhM86goh3DAIquj/Fw0BvP+i1nQYSZcNOYYRDxvDgPaHi7XrN5ipj
    6lEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1738076876;
    s=strato-dkim-0002; d=strato.com;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=k1hpW395twfgxrUZKuBtcG4bsKQnq9Y5eIRAEwTWI7A=;
    b=nt1ealIRQhrICd6NpSGegff3q7RQsMieu8Dl40LwoldE5EL5lMopWUtmxga5t4t/5Z
    h997UpZecXWnO3tmmDYB2zpgxBbsJIMgac86fzz0jjEx625sLq3DNxn+qTjq+RW38X4B
    iI5DjpTeW191BURpEI221gwuMLvO4KgbWGWBHkuaB3Tlk5TEDRW9L1m4QHJBlVbm7ztM
    G0l4Dmt85CiminXquOmhwdKMJcUo39REd1gqi3v+cHNC6F7XdnVG1jnmXlYf5x+F7p7g
    pTCSWAElnNsHgxtkTdFeo/KiNutosLnr8oa1ze1h08W2Ow1e+5IcGKz71HtKIIvwk4Di
    /H3Q==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo01
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1738076876;
    s=strato-dkim-0002; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=k1hpW395twfgxrUZKuBtcG4bsKQnq9Y5eIRAEwTWI7A=;
    b=j2InN5mxYRbxBhan0bbLZ5k1yKBZow84gJBXrtXpKd96dhONeROQ1qfN+O5uvT9MJs
    2+QGiWwK9ERUvUhIfC8AVBDeV34MRyYVeanszk+gsfm4TExPR5U27qosHl/mVpFqC6zK
    4Ji8bckq9jD7MyRjmVQUu5cQXzUfeh18c6ybcKmX3AFgpQWuGAennCGUeo7mSE3zlwhG
    QIVJrYS0AF66SBixTZilhFYXnksDkF0Dlt+wRj9ShwnQAWSAeLgon9G4uWUYBJu82po1
    3Weo2ptRLDZoL511p3WE+tj9rV401NPTcwcHLnGZVkvTeR74IhsNf2F6riTJCbM4+1x1
    Kq8Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1738076876;
    s=strato-dkim-0003; d=outer-limits.org;
    h=In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Cc:Date:
    From:Subject:Sender;
    bh=k1hpW395twfgxrUZKuBtcG4bsKQnq9Y5eIRAEwTWI7A=;
    b=nsrffby5AVWvhjSuMaKNjxSi7zEyqymca1F+1ja1/208hy3KkdtCcs65NwlTYsZl6Y
    jvfEAFWeCC/XInTaF4DA==
X-RZG-AUTH: ":JnkIfEGmW/AMJS6HttH4FbRVwc4dHlPLCp4e/IoHo8zEMMHAgwTfqBEHcVJSv9P5mRTGd2ImeA=="
Received: from [192.168.37.162]
    by smtp.strato.de (RZmta 51.2.17 AUTH)
    with ESMTPSA id J1a25110SF7t52b
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Tue, 28 Jan 2025 16:07:55 +0100 (CET)
Message-ID: <b335d035-07a4-457d-99ea-8b7597782fd9@outer-limits.org>
Date: Tue, 28 Jan 2025 16:07:55 +0100
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
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Arnd Bergmann <arnd@arndb.de>, Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Naveen N Rao <naveen@kernel.org>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
References: <20250128135711.1625747-1-julian@outer-limits.org>
 <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
Content-Language: en-US
From: Julian Vetter <julian@outer-limits.org>
In-Reply-To: <81ee3098-1e43-4b88-975a-d223bc2338e8@csgroup.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=ARC_SIGNED,ARC_VALID,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
	SPF_HELO_PASS,SPF_NONE autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 1/28/25 15:16, Christophe Leroy wrote:
> 
> 
> Le 28/01/2025 à 14:57, Julian Vetter a écrit :
>> Remove the eieio() calls in _memcpy_fromio, to bring its implementation
>> closer to the one from lib/iomem_copy.c. These eieio() calls don't seem
>> to be necessary, because the _memcpy_toio completely omits them. Also
>> the legacy code from ppc was not doing them.
> 
> What do you mean exactly by "legacy code" ?
> 
> As far as I can see they were already there before commit 68a64357d15a 
> ("[POWERPC] Merge 32 and 64 bits asm-powerpc/io.h"):
>

With 'ppc' I was refering to 'include/asm-ppc/io.h'. But you're right, 
when going back a bit, in the 'include/asm-powerpc/io.h' there are two 
cases, one (eeh_memcpy_fromio) which does the the 'eieio', and a second, 
i.e., 'iSeries_memcpy_fromio' which does a byte-wise copy. But in the 
ppc code ('include/asm-ppc/io.h') there is a simple memcpy. I was 
referring to this one. But my description is not very clear. Sorry for that.

> -static inline void eeh_memcpy_fromio(void *dest, const volatile void 
> __iomem *src,
> +static inline void eeh_memcpy_fromio(void *dest, const
> +                     volatile void __iomem *src,
>                        unsigned long n)
>   {
> -    void *vsrc = (void __force *) src;
> -    void *destsave = dest;
> -    unsigned long nsave = n;
> -
> -    __asm__ __volatile__ ("sync" : : : "memory");
> -    while(n && (!EEH_CHECK_ALIGN(vsrc, 4) || !EEH_CHECK_ALIGN(dest, 4))) {
> -        *((u8 *)dest) = *((volatile u8 *)vsrc);
> -        __asm__ __volatile__ ("eieio" : : : "memory");
> -        vsrc++;
> -        dest++;
> -        n--;
> -    }
> -    while(n > 4) {
> -        *((u32 *)dest) = *((volatile u32 *)vsrc);
> -        __asm__ __volatile__ ("eieio" : : : "memory");
> -        vsrc += 4;
> -        dest += 4;
> -        n -= 4;
> -    }
> -    while(n) {
> -        *((u8 *)dest) = *((volatile u8 *)vsrc);
> -        __asm__ __volatile__ ("eieio" : : : "memory");
> -        vsrc++;
> -        dest++;
> -        n--;
> -    }
> -    __asm__ __volatile__ ("sync" : : : "memory");
> +    _memcpy_fromio(dest, src, n);
> 
>       /* Look for ffff's here at dest[n].  Assume that at least 4 bytes
>        * were copied. Check all four bytes.
>        */
> -    if ((nsave >= 4) &&
> -        (EEH_POSSIBLE_ERROR((*((u32 *) destsave+nsave-4)), u32))) {
> -        eeh_check_failure(src, (*((u32 *) destsave+nsave-4)));
> -    }
> +    if (n >= 4 && EEH_POSSIBLE_ERROR(*((u32 *)(dest + n - 4)), u32))
> +        eeh_check_failure(src, *((u32 *)(dest + n - 4)));
>   }
> 
> 
> 
>>
>> Signed-off-by: Julian Vetter <julian@outer-limits.org>
>> ---
>>   arch/powerpc/kernel/io.c | 3 ---
>>   1 file changed, 3 deletions(-)
>>
>> diff --git a/arch/powerpc/kernel/io.c b/arch/powerpc/kernel/io.c
>> index 6af535905984..81e5d54260a1 100644
>> --- a/arch/powerpc/kernel/io.c
>> +++ b/arch/powerpc/kernel/io.c
>> @@ -155,21 +155,18 @@ void _memcpy_fromio(void *dest, const volatile 
>> void __iomem *src,
>>          __asm__ __volatile__ ("sync" : : : "memory");
>>          while(n && (!IO_CHECK_ALIGN(vsrc, 4) || !IO_CHECK_ALIGN(dest, 
>> 4))) {
>>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
>> -               eieio();
>>                  vsrc++;
>>                  dest++;
>>                  n--;
>>          }
>>          while(n >= 4) {
>>                  *((u32 *)dest) = *((volatile u32 *)vsrc);
>> -               eieio();
>>                  vsrc += 4;
>>                  dest += 4;
>>                  n -= 4;
>>          }
>>          while(n) {
>>                  *((u8 *)dest) = *((volatile u8 *)vsrc);
>> -               eieio();
>>                  vsrc++;
>>                  dest++;
>>                  n--;
>> -- 
>> 2.34.1
>>
> 

