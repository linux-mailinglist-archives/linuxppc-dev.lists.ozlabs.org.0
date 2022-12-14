Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C758564C874
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 12:54:47 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NXDLY4gnwz3cKq
	for <lists+linuxppc-dev@lfdr.de>; Wed, 14 Dec 2022 22:54:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NXDL13zLkz3bgZ
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 14 Dec 2022 22:54:15 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4NXDKw135Vz9smn;
	Wed, 14 Dec 2022 12:54:12 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ojaz9sUupUKv; Wed, 14 Dec 2022 12:54:12 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4NXDKw0DBMz9smj;
	Wed, 14 Dec 2022 12:54:12 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id ECFD38B773;
	Wed, 14 Dec 2022 12:54:11 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 3MGulrEuBQ_f; Wed, 14 Dec 2022 12:54:11 +0100 (CET)
Received: from [192.168.7.109] (unknown [192.168.7.109])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A98798B766;
	Wed, 14 Dec 2022 12:54:11 +0100 (CET)
Message-ID: <4540d5de-d922-9bff-788d-7c4925d12cca@csgroup.eu>
Date: Wed, 14 Dec 2022 12:54:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] powerpc/64: Implement arch_within_stack_frames
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Nicholas Piggin <npiggin@gmail.com>,
 Nicholas Miehlbradt <nicholas@linux.ibm.com>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>
References: <20221214044252.1910657-1-nicholas@linux.ibm.com>
 <0dfbaab8-c962-9127-b56d-8f9989c095d8@csgroup.eu>
 <CP1IFJNCTTZ4.33ROBE5VAFAKM@bobo>
 <9fb5aedd-0a6a-8fb2-eeed-82d291455cf9@csgroup.eu>
In-Reply-To: <9fb5aedd-0a6a-8fb2-eeed-82d291455cf9@csgroup.eu>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 14/12/2022 à 12:48, Christophe Leroy a écrit :
> 
> 
> Le 14/12/2022 à 12:39, Nicholas Piggin a écrit :
>> On Wed Dec 14, 2022 at 6:39 PM AEST, Christophe Leroy wrote:
>>>
>>>
>>> Le 14/12/2022 à 05:42, Nicholas Miehlbradt a écrit :
>>>> Walks the stack when copy_{to,from}_user address is in the stack to
>>>> ensure that the object being copied is entirely within a single stack
>>>> frame.
>>>>
>>>> Substatially similar to the x86 implementation except using the back
>>>> chain to traverse the stack and identify stack frame boundaries.
>>>>
>>>> Signed-off-by: Nicholas Miehlbradt <nicholas@linux.ibm.com>
>>>> ---
>>>>    arch/powerpc/Kconfig                   |  1 +
>>>>    arch/powerpc/include/asm/thread_info.h | 38 
>>>> ++++++++++++++++++++++++++
>>>>    2 files changed, 39 insertions(+)
>>>>
>>>> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
>>>> index 2ca5418457ed..4c59d139ea83 100644
>>>> --- a/arch/powerpc/Kconfig
>>>> +++ b/arch/powerpc/Kconfig
>>>> @@ -198,6 +198,7 @@ config PPC
>>>>        select HAVE_ARCH_KASAN_VMALLOC        if HAVE_ARCH_KASAN
>>>>        select HAVE_ARCH_KFENCE            if 
>>>> ARCH_SUPPORTS_DEBUG_PAGEALLOC
>>>>        select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>>> +    select HAVE_ARCH_WITHIN_STACK_FRAMES    if PPC64
>>>
>>> Why don't you do something that works for both PPC32 and PPC64 ?
>>
>> +1
>>
>>>>        select HAVE_ARCH_KGDB
>>>>        select HAVE_ARCH_MMAP_RND_BITS
>>>>        select HAVE_ARCH_MMAP_RND_COMPAT_BITS    if COMPAT
>>>> diff --git a/arch/powerpc/include/asm/thread_info.h 
>>>> b/arch/powerpc/include/asm/thread_info.h
>>>> index af58f1ed3952..efdf39e07884 100644
>>>> --- a/arch/powerpc/include/asm/thread_info.h
>>>> +++ b/arch/powerpc/include/asm/thread_info.h
>>>> @@ -186,6 +186,44 @@ static inline bool 
>>>> test_thread_local_flags(unsigned int flags)
>>>>    #define is_elf2_task() (0)
>>>>    #endif
>>>> +#ifdef CONFIG_PPC64
>>>> +
>>>> +#ifdef CONFIG_PPC64_ELF_ABI_V1
>>>> +#define PARAMETER_SAVE_OFFSET 48
>>>> +#else
>>>> +#define PARAMETER_SAVE_OFFSET 32
>>>> +#endif
>>>
>>> Why not use STACK_INT_FRAME_REGS, defined in asm/ptrace.h ?
>>
>> I think use a STACK_FRAME prefixed define in asm/ptrace.h, but maybe
>> avoid overloading the STACK_INT_ stuff for this.
>>
> 
> Maybe I should have written _already_ defined :
> 
> $ git grep -n STACK_INT_FRAME_REGS arch/powerpc/include/asm/
> arch/powerpc/include/asm/ptrace.h:126:#define STACK_INT_FRAME_REGS 
> (STACK_FRAME_MIN_SIZE + 16)
> arch/powerpc/include/asm/ptrace.h:138:#define STACK_INT_FRAME_REGS 
> STACK_FRAME_MIN_SIZE
> arch/powerpc/include/asm/ptrace.h:155:#define STACK_INT_FRAME_REGS 
> STACK_FRAME_MIN_SIZE
> 

Looks like I misread STACK_FRAME_MIN_SIZE.

So yes, we need a new macro for it.

What about STACK_FRAME_PARAMS ?
