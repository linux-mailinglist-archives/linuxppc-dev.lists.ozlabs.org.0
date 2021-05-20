Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F0D0389D76
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 08:03:46 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Flzh00Blwz3bsb
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 May 2021 16:03:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Flzgd0smGz2yXT
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 20 May 2021 16:03:22 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FlzgW0LM9z9sVQ;
 Thu, 20 May 2021 08:03:19 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A2vskfS63jyI; Thu, 20 May 2021 08:03:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FlzgV6QFFz9sVN;
 Thu, 20 May 2021 08:03:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id BF32E8B804;
 Thu, 20 May 2021 08:03:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id I9UCos7Ppmre; Thu, 20 May 2021 08:03:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 586078B7E0;
 Thu, 20 May 2021 08:03:18 +0200 (CEST)
Subject: Re: [RFC PATCH kernel] powerpc: Fix early setup to make early_ioremap
 work
To: Alexey Kardashevskiy <aik@ozlabs.ru>, linuxppc-dev@lists.ozlabs.org
References: <20210520032919.358935-1-aik@ozlabs.ru>
 <467a5a5f-7fab-b6b1-e81f-85518378f4b8@csgroup.eu>
 <db846a8e-bc75-244f-5e4a-513e762a875f@ozlabs.ru>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <47b5c941-3c29-4109-e546-c788856bec51@csgroup.eu>
Date: Thu, 20 May 2021 08:03:17 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <db846a8e-bc75-244f-5e4a-513e762a875f@ozlabs.ru>
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
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 20/05/2021 à 07:52, Alexey Kardashevskiy a écrit :
> 
> 
> On 20/05/2021 15:46, Christophe Leroy wrote:
>>
>>
>> Le 20/05/2021 à 05:29, Alexey Kardashevskiy a écrit :
>>> The immediate problem is that after
>>> 0bd3f9e953bd ("powerpc/legacy_serial: Use early_ioremap()")
>>> the kernel silently reboots. The reason is that early_ioremap() returns
>>> broken addresses as it uses slot_virt[] array which initialized with
>>> offsets from FIXADDR_TOP == IOREMAP_END+FIXADDR_SIZE ==
>>> KERN_IO_END- FIXADDR_SIZ + FIXADDR_SIZE == __kernel_io_end which is 0
>>> when early_ioremap_setup() is called. __kernel_io_end is initialized
>>> little bit later in early_init_mmu().
>>>
>>> This fixes the initialization by swapping early_ioremap_setup and
>>> early_init_mmu.
>>
>> Hum ... Chris tested it on a T2080RDB, that must be a book3e.
>>
>> So we missed it. I guess your fix is right.
> 
> 
> Oh cool.

I forgot, your patch should include Fixes: tags.

Fixes: 265c3491c4bc ("powerpc: Add support for GENERIC_EARLY_IOREMAP")

If you still change the FIXADDR_SIZE, then it must also have:

Fixes: 9ccba66d4d2a ("powerpc/64: Fix the definition of the fixmap area")

> 
>>>
>>> This also fixes IOREMAP_END to use FIXADDR_SIZE defined just next to it,
>>> seems to make sense, unless there is some weird logic with redefining
>>> FIXADDR_SIZE as the compiling goes.
>>
>> Well, I don't think the order of defines matters, the change should be kept out of the fix.
> 
> When I see this:
> 
> #define IOREMAP_END    (KERN_IO_END - FIXADDR_SIZE)
> #define FIXADDR_SIZE    SZ_32M
> 
> 
> ... I have to think harder what FIXADDR_SIZE was in the first macro and in what order the 
> preprocessor expands them.
> 
> 
>> But if you want it anyway, then I'd suggest to move it before IOREMAP_BASE in order to keep the 3 
>> IOREMAP_xxx together.
> 
> Up to Michael, I guess.
> 
> 
>>
>>>
>>> Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
>>
>> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>>
>>> ---
>>>   arch/powerpc/include/asm/book3s/64/pgtable.h | 2 +-
>>>   arch/powerpc/kernel/setup_64.c               | 3 ++-
>>>   2 files changed, 3 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/book3s/64/pgtable.h 
>>> b/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> index a666d561b44d..54a06129794b 100644
>>> --- a/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> +++ b/arch/powerpc/include/asm/book3s/64/pgtable.h
>>> @@ -325,8 +325,8 @@ extern unsigned long pci_io_base;
>>>   #define  PHB_IO_END    (KERN_IO_START + FULL_IO_SIZE)
>>>   #define IOREMAP_BASE    (PHB_IO_END)
>>>   #define IOREMAP_START    (ioremap_bot)
>>> -#define IOREMAP_END    (KERN_IO_END - FIXADDR_SIZE)
>>>   #define FIXADDR_SIZE    SZ_32M
>>> +#define IOREMAP_END    (KERN_IO_END - FIXADDR_SIZE)
>>>   /* Advertise special mapping type for AGP */
>>>   #define HAVE_PAGE_AGP
>>> diff --git a/arch/powerpc/kernel/setup_64.c b/arch/powerpc/kernel/setup_64.c
>>> index b779d25761cf..ce09fe5debf4 100644
>>> --- a/arch/powerpc/kernel/setup_64.c
>>> +++ b/arch/powerpc/kernel/setup_64.c
>>> @@ -369,11 +369,12 @@ void __init early_setup(unsigned long dt_ptr)
>>>       apply_feature_fixups();
>>>       setup_feature_keys();
>>> -    early_ioremap_setup();
>>>       /* Initialize the hash table or TLB handling */
>>>       early_init_mmu();
>>> +    early_ioremap_setup();
>>> +
>>>       /*
>>>        * After firmware and early platform setup code has set things up,
>>>        * we note the SPR values for configurable control/performance
>>>
> 
