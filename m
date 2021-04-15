Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D621C3606DC
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 12:15:31 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FLZwd5z0Bz3c06
	for <lists+linuxppc-dev@lfdr.de>; Thu, 15 Apr 2021 20:15:29 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FLZwJ1HFYz2y0G
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 15 Apr 2021 20:15:10 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FLZwB4FyBz9vBnJ;
 Thu, 15 Apr 2021 12:15:06 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id rcoeU3mDmQki; Thu, 15 Apr 2021 12:15:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FLZwB2lctz9vBms;
 Thu, 15 Apr 2021 12:15:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FDFB8B7F6;
 Thu, 15 Apr 2021 12:15:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id bnAPqr2_fOiT; Thu, 15 Apr 2021 12:15:07 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D265A8B7F2;
 Thu, 15 Apr 2021 12:15:06 +0200 (CEST)
Subject: Re: linux-next: manual merge of the akpm-current tree with the
 powerpc tree
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Andrew Morton <akpm@linux-foundation.org>,
 Michael Ellerman <mpe@ellerman.id.au>,
 PowerPC <linuxppc-dev@lists.ozlabs.org>
References: <20210415194417.498e71b7@canb.auug.org.au>
 <20210415195814.0dc4ced9@canb.auug.org.au>
 <9bc1b8fd-8051-54ed-b9d8-198fe1f4c348@csgroup.eu>
 <1d3b44a8-f19c-b52b-ce44-20c5e5b706ad@csgroup.eu>
Message-ID: <84b0cc04-8c9a-7a18-848c-acfe727b1e8c@csgroup.eu>
Date: Thu, 15 Apr 2021 12:15:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <1d3b44a8-f19c-b52b-ce44-20c5e5b706ad@csgroup.eu>
Content-Type: text/plain; charset=windows-1252; format=flowed
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/04/2021 à 12:08, Christophe Leroy a écrit :
> 
> 
> Le 15/04/2021 à 12:07, Christophe Leroy a écrit :
>>
>>
>> Le 15/04/2021 à 11:58, Stephen Rothwell a écrit :
>>> Hi all,
>>>
>>> On Thu, 15 Apr 2021 19:44:17 +1000 Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>>>>
>>>> Today's linux-next merge of the akpm-current tree got a conflict in:
>>>>
>>>>    arch/powerpc/kernel/module.c
>>>>
>>>> between commit:
>>>>
>>>>    2ec13df16704 ("powerpc/modules: Load modules closer to kernel text")
>>>>
>>>> from the powerpc tree and commit:
>>>>
>>>>    4930ba789f8d ("powerpc/64s/radix: enable huge vmalloc mappings")
>>>>
>>>> from the akpm-current tree.
>>>>
>>>> I fixed it up (I think - see below) and can carry the fix as
>>>> necessary. This is now fixed as far as linux-next is concerned, but any
>>>> non trivial conflicts should be mentioned to your upstream maintainer
>>>> when your tree is submitted for merging.  You may also want to consider
>>>> cooperating with the maintainer of the conflicting tree to minimise any
>>>> particularly complex conflicts.
>>>>
>>>> -- 
>>>> Cheers,
>>>> Stephen Rothwell
>>>>
>>>> diff --cc arch/powerpc/kernel/module.c
>>>> index fab84024650c,cdb2d88c54e7..000000000000
>>>> --- a/arch/powerpc/kernel/module.c
>>>> +++ b/arch/powerpc/kernel/module.c
>>>> @@@ -88,29 -88,26 +89,42 @@@ int module_finalize(const Elf_Ehdr *hdr
>>>>        return 0;
>>>>    }
>>>> - #ifdef MODULES_VADDR
>>>>   -void *module_alloc(unsigned long size)
>>>>   +static __always_inline void *
>>>>   +__module_alloc(unsigned long size, unsigned long start, unsigned long end)
>>>>    {
>>>>   -    unsigned long start = VMALLOC_START;
>>>>   -    unsigned long end = VMALLOC_END;
>>>>   -
>>>>   -#ifdef MODULES_VADDR
>>>>   -    BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>>>>   -    start = MODULES_VADDR;
>>>>   -    end = MODULES_END;
>>>>   -#endif
>>>>   -
>>>> +     /*
>>>> +      * Don't do huge page allocations for modules yet until more testing
>>>> +      * is done. STRICT_MODULE_RWX may require extra work to support this
>>>> +      * too.
>>>> +      */
>>>> +
>>>>        return __vmalloc_node_range(size, 1, start, end, GFP_KERNEL,
>>>> -                     PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>>>> +                     PAGE_KERNEL_EXEC,
>>>> +                     VM_NO_HUGE_VMAP | VM_FLUSH_RESET_PERMS,
>>>> +                     NUMA_NO_NODE,
>>>>                        __builtin_return_address(0));
>>>>    }
>>>>   +
>>>> ++
>>>>   +void *module_alloc(unsigned long size)
>>>>   +{
>>>> ++    unsigned long start = VMALLOC_START;
>>>> ++    unsigned long end = VMALLOC_END;
>>>>   +    unsigned long limit = (unsigned long)_etext - SZ_32M;
>>>>   +    void *ptr = NULL;
>>>>   +
>>>> ++#ifdef MODULES_VADDR
>>>>   +    BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>>>> ++    start = MODULES_VADDR;
>>>> ++    end = MODULES_END;
>>
>> The #endif should be here.
>>
>>
>>>>   +
>>>>   +    /* First try within 32M limit from _etext to avoid branch trampolines */
>>>>   +    if (MODULES_VADDR < PAGE_OFFSET && MODULES_END > limit)
> 
> Should also use start and end here instead of MODULES_VADDR  and MODULES_END


The cleanest however should be to define MODULES_VADDR and MODULES_END all the time with a fallback 
to VMALLOC_START/VMALLOC_END, to avoid the #ifdef.

The #ifdef was OK when we wanted to define modules_alloc() only when module area was different from 
vmalloc area, but now that we want modules_alloc() at all time, MODULES_VADDR and MODULES_END should 
be defined all the time.


> 
>>>> -         ptr = __module_alloc(size, limit, MODULES_END);
>>>> ++        ptr = __module_alloc(size, limit, end);
>>>>   +
>>>>   +    if (!ptr)
>>>> -         ptr = __module_alloc(size, MODULES_VADDR, MODULES_END);
>>>> ++#endif
>>>> ++        ptr = __module_alloc(size, start, end);
>>>>   +
>>>>   +    return ptr;
>>>>   +}
>>>> - #endif
>>>
>>> Unfortunately, it also needs this:
>>
>> Before the #endif is too far.
>>
>>>
>>> From: Stephen Rothwell <sfr@canb.auug.org.au>
>>> Date: Thu, 15 Apr 2021 19:53:58 +1000
>>> Subject: [PATCH] merge fix up for powerpc merge fix
>>>
>>> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
>>> ---
>>>   arch/powerpc/kernel/module.c | 2 ++
>>>   1 file changed, 2 insertions(+)
>>>
>>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>>> index d8ab1ad2eb05..c060f99afd4d 100644
>>> --- a/arch/powerpc/kernel/module.c
>>> +++ b/arch/powerpc/kernel/module.c
>>> @@ -110,7 +110,9 @@ void *module_alloc(unsigned long size)
>>>   {
>>>       unsigned long start = VMALLOC_START;
>>>       unsigned long end = VMALLOC_END;
>>> +#ifdef MODULES_VADDR
>>>       unsigned long limit = (unsigned long)_etext - SZ_32M;
>>> +#endif
>>>       void *ptr = NULL;
>>>   #ifdef MODULES_VADDR
>>>
