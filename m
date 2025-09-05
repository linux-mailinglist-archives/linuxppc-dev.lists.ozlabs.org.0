Return-Path: <linuxppc-dev+bounces-11761-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC43B44D35
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 Sep 2025 07:20:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ4S53sNbz30Tf;
	Fri,  5 Sep 2025 15:20:37 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1757049637;
	cv=none; b=TVV7pPaVHEYgVnK5ww0ZIBmbkGhG0QzHpyMGOyLLot49RYQ4zmiOZOR+CQJhUx73mg7RzhgDPmfqAWa0Ayl94xV2S3G+ubWrHrFS6XaLH0tbDxmDYt8VIpX3WIYHNEat2OVvN9+RreE3IF12O0kcFZwtwhrXpFflpmDQN1UQ9V3HTS6ImY6zSSNVuJNT3XgF1dAjBvZbMTLocXEAZeKtn1xCdcbDtzaXujmlmjOEgdUFxzLPs9pJCPI9wbKzN/19jMGceqLe1PUoCjK/GhsG9Thzgj/ZBHw2v1q1YhgfwD55d4Wg2vBzycMzW0qdPrDddx9xZAGEKD6pWxRVoD3OUA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1757049637; c=relaxed/relaxed;
	bh=4NgAuw7ixJYCIXKpqN+FFIFB/TsEKeOxMQo46dIf0EA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fZlXhZtEtHHbKFeXmq5vY341ZFr7EBoYARF2EdoAkbSXt5DtkYSjoFEf03U/EIYWfPexgl7CuuUSPpvOjoFlFJA5gOo7BMd7fVAjc3LVQHxm2xQmFkU2KXbV/x+5XeqvDf0FrEkzIKcKyrdRraiFUBMqrZHn9r1LQWoQOXY4UPEuMV+8KBgHQszRfaWaO6jRVBwx8WdAunGUeCa6dG0+z6StUNx76KxWDaLk28GyxFZnjpDfNnCXjLIGd/U/9sqbHFVdVQoTKAYNKm5mBWNsOOoFacbZiwMthI6iFz0k9DZXOPaLOhhJhuaXYbZRjiNdmtciBB7mdUopTRH8Gt6wpQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by lists.ozlabs.org (Postfix) with ESMTP id 4cJ4S45l0pz30T8
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 Sep 2025 15:20:35 +1000 (AEST)
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cJ49T6rBWz9sS8;
	Fri,  5 Sep 2025 07:07:57 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H2prVwxcUqBz; Fri,  5 Sep 2025 07:07:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cJ49T5lfZz9sRy;
	Fri,  5 Sep 2025 07:07:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A74128B774;
	Fri,  5 Sep 2025 07:07:56 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id Oc7jo1la4Whs; Fri,  5 Sep 2025 07:07:56 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 292148B773;
	Fri,  5 Sep 2025 07:07:56 +0200 (CEST)
Message-ID: <7b3c83c1-bdf1-4778-948f-223ef0bce2a0@csgroup.eu>
Date: Fri, 5 Sep 2025 07:07:55 +0200
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc/32: Remove PAGE_KERNEL_TEXT to fix startup
 failure
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 Andrew Donnellan <ajd@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 Erhard Furtner <erhard_f@mailbox.org>
References: <342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org>
 <4b5e6eb281d7b1ea77619bee17095f905a125168.1757003584.git.christophe.leroy@csgroup.eu>
 <68ba6bee.170a0220.3b821b.ca9d@mx.google.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <68ba6bee.170a0220.3b821b.ca9d@mx.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=3.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



Le 05/09/2025 à 05:55, Ritesh Harjani a écrit :
> Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> 
>> PAGE_KERNEL_TEXT is an old macro that is used to tell kernel whether
>> kernel text has to be mapped read-only or read-write based on build
>> time options.
>>
>> But nowadays, with functionnalities like jump_labels, static links,
>> etc ... more only less all kernels need to be read-write at some
>> point, and some combinations of configs failed to work due to
>> innacurate setting of PAGE_KERNEL_TEXT. On the other hand, today
>> we have CONFIG_STRICT_KERNEL_RWX which implements a more controlled
>> access to kernel modifications.
>>
>> Instead of trying to keep PAGE_KERNEL_TEXT accurate with all
>> possible options that may imply kernel text modification, always
>> set kernel text read-write at startup and rely on
>> CONFIG_STRICT_KERNEL_RWX to provide accurate protection.
>>
>> Reported-by: Erhard Furtner <erhard_f@mailbox.org>
>> Closes: https://lore.kernel.org/all/342b4120-911c-4723-82ec-d8c9b03a8aef@mailbox.org/
>> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
>> ---
>>   arch/powerpc/include/asm/pgtable.h | 12 ------------
>>   arch/powerpc/mm/book3s32/mmu.c     |  4 ++--
>>   arch/powerpc/mm/pgtable_32.c       |  2 +-
>>   3 files changed, 3 insertions(+), 15 deletions(-)
>>
> 
> AFAIU - mmu_mark_initmem_nx gets called during kernel_init() which is
> way after static call initialization correct? i.e.
> 
> start_kernel
>    ...
>    jump_label_init()
>    static_call_init()
>    ...
>    ...
>    rest_init()      /* Do the rest non-__init'ed, we're now alive */
>      kernel_init()
>        free_initmem() -> mark_initmem_nx() -> __mark_initmem_nx -> mmu_mark_initmem_nx()
>        mark_readonly()
>          if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX) && rodata_enabled) {
>             jump_label_init_ro()
>             mark_rodata_ro() -> ....
>             ...
>          ...
> 
> Then I guess we mainly only need __mapin_ram_chunk() to be PAGE_KERNEL_X (RWX)
> instead of PAGE_KERNEL_TEXT (ROX), isn't it?
> 
> Let me quickly validate it...
> ...Ok, so I was able to get just this diff to be working.
> 
> Thoughts?

setibat() doesn't take into account whether it is RO or RW. Only X or NX 
is taken into account, so it doesn't matter whether it is X or ROX.

Then allthough you are right in principle, once the PAGE_KERNEL_TEXT is 
removed from __mapin_ram_chunk() it becomes completely useless, so 
better get rid of PAGE_KERNEL_TEXT completely.

> 
> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
> index 15276068f657..0c9ef705803e 100644
> --- a/arch/powerpc/mm/pgtable_32.c
> +++ b/arch/powerpc/mm/pgtable_32.c
> @@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
>          p = memstart_addr + s;
>          for (; s < top; s += PAGE_SIZE) {
>                  ktext = core_kernel_text(v);
> -               map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
> +               map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
>                  v += PAGE_SIZE;
>                  p += PAGE_SIZE;
>          }
> 
> -ritesh
> 
> 
> 
>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>> index 93d77ad5a92f..d8f944a5a037 100644
>> --- a/arch/powerpc/include/asm/pgtable.h
>> +++ b/arch/powerpc/include/asm/pgtable.h
>> @@ -20,18 +20,6 @@ struct mm_struct;
>>   #include <asm/nohash/pgtable.h>
>>   #endif /* !CONFIG_PPC_BOOK3S */
>>   
>> -/*
>> - * Protection used for kernel text. We want the debuggers to be able to
>> - * set breakpoints anywhere, so don't write protect the kernel text
>> - * on platforms where such control is possible.
>> - */
>> -#if defined(CONFIG_KGDB) || defined(CONFIG_XMON) || defined(CONFIG_BDI_SWITCH) || \
>> -	defined(CONFIG_KPROBES) || defined(CONFIG_DYNAMIC_FTRACE)
>> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_X
>> -#else
>> -#define PAGE_KERNEL_TEXT	PAGE_KERNEL_ROX
>> -#endif
>> -
>>   /* Make modules code happy. We don't set RO yet */
>>   #define PAGE_KERNEL_EXEC	PAGE_KERNEL_X
>>   
>> diff --git a/arch/powerpc/mm/book3s32/mmu.c b/arch/powerpc/mm/book3s32/mmu.c
>> index be9c4106e22f..c42ecdf94e48 100644
>> --- a/arch/powerpc/mm/book3s32/mmu.c
>> +++ b/arch/powerpc/mm/book3s32/mmu.c
>> @@ -204,7 +204,7 @@ int mmu_mark_initmem_nx(void)
>>   
>>   	for (i = 0; i < nb - 1 && base < top;) {
>>   		size = bat_block_size(base, top);
>> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
>> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>>   		base += size;
>>   	}
>>   	if (base < top) {
>> @@ -215,7 +215,7 @@ int mmu_mark_initmem_nx(void)
>>   				pr_warn("Some RW data is getting mapped X. "
>>   					"Adjust CONFIG_DATA_SHIFT to avoid that.\n");
>>   		}
>> -		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_TEXT);
>> +		setibat(i++, PAGE_OFFSET + base, base, size, PAGE_KERNEL_X);
>>   		base += size;
>>   	}
>>   	for (; i < nb; i++)
>> diff --git a/arch/powerpc/mm/pgtable_32.c b/arch/powerpc/mm/pgtable_32.c
>> index 15276068f657..0c9ef705803e 100644
>> --- a/arch/powerpc/mm/pgtable_32.c
>> +++ b/arch/powerpc/mm/pgtable_32.c
>> @@ -104,7 +104,7 @@ static void __init __mapin_ram_chunk(unsigned long offset, unsigned long top)
>>   	p = memstart_addr + s;
>>   	for (; s < top; s += PAGE_SIZE) {
>>   		ktext = core_kernel_text(v);
>> -		map_kernel_page(v, p, ktext ? PAGE_KERNEL_TEXT : PAGE_KERNEL);
>> +		map_kernel_page(v, p, ktext ? PAGE_KERNEL_X : PAGE_KERNEL);
>>   		v += PAGE_SIZE;
>>   		p += PAGE_SIZE;
>>   	}
>> -- 
>> 2.49.0


