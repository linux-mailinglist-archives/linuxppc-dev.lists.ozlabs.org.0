Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC17371160
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 07:57:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FYXM73vWfz30Cr
	for <lists+linuxppc-dev@lfdr.de>; Mon,  3 May 2021 15:57:55 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FYXLm1Ks0z2xff
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  3 May 2021 15:57:32 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FYXLd0Syqz9sTL;
 Mon,  3 May 2021 07:57:29 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZQENZ8tgPJlM; Mon,  3 May 2021 07:57:28 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FYXLc6Ygrz9sTK;
 Mon,  3 May 2021 07:57:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C55158B775;
 Mon,  3 May 2021 07:57:28 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id gpW4DUO6ChHV; Mon,  3 May 2021 07:57:28 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 855798B763;
 Mon,  3 May 2021 07:57:28 +0200 (CEST)
Subject: Re: [PATCH v11 3/9] powerpc: Always define MODULES_{VADDR,END}
To: Jordan Niethe <jniethe5@gmail.com>
References: <20210429031602.2606654-1-jniethe5@gmail.com>
 <20210429031602.2606654-4-jniethe5@gmail.com>
 <111c8736-fff9-ba0a-4749-f9388b32c9bf@csgroup.eu>
 <CACzsE9q1QoSMVZD7yoE=3pHaRc-i14X2++ewFbBxSeZn-2u78A@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6fa81d25-4313-5f15-23d9-06b314bb7d02@csgroup.eu>
Date: Mon, 3 May 2021 07:57:27 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <CACzsE9q1QoSMVZD7yoE=3pHaRc-i14X2++ewFbBxSeZn-2u78A@mail.gmail.com>
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
Cc: ajd@linux.ibm.com, Nicholas Piggin <npiggin@gmail.com>, cmr@codefail.de,
 "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>, naveen.n.rao@linux.ibm.com,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 03/05/2021 à 07:39, Jordan Niethe a écrit :
> On Thu, Apr 29, 2021 at 3:04 PM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 29/04/2021 à 05:15, Jordan Niethe a écrit :
>>> If MODULES_{VADDR,END} are not defined set them to VMALLOC_START and
>>> VMALLOC_END respectively. This reduces the need for special cases. For
>>> example, powerpc's module_alloc() was previously predicated on
>>> MODULES_VADDR being defined but now is unconditionally defined.
>>>
>>> This will be useful reducing conditional code in other places that need
>>> to allocate from the module region (i.e., kprobes).
>>>
>>> Signed-off-by: Jordan Niethe <jniethe5@gmail.com>
>>> ---
>>> v10: New to series
>>> v11: - Consider more places MODULES_VADDR was being used
>>> ---
>>>    arch/powerpc/include/asm/pgtable.h    | 11 +++++++++++
>>>    arch/powerpc/kernel/module.c          |  5 +----
>>>    arch/powerpc/mm/kasan/kasan_init_32.c | 10 +++++-----
>>>    arch/powerpc/mm/ptdump/ptdump.c       |  4 ++--
>>>    4 files changed, 19 insertions(+), 11 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>>> index c6a676714f04..882fda779648 100644
>>> --- a/arch/powerpc/include/asm/pgtable.h
>>> +++ b/arch/powerpc/include/asm/pgtable.h
>>> @@ -39,6 +39,17 @@ struct mm_struct;
>>>    #define __S110      PAGE_SHARED_X
>>>    #define __S111      PAGE_SHARED_X
>>>
>>> +#ifndef MODULES_VADDR
>>> +#define MODULES_VADDR VMALLOC_START
>>> +#define MODULES_END VMALLOC_END
>>> +#endif
>>> +
>>> +#if defined(CONFIG_PPC_BOOK3S_32) && defined(CONFIG_STRICT_KERNEL_RWX)
>>
>> No no.
>>
>> TASK_SIZE > MODULES_VADDR is ALWAYS wrong, for any target, in any configuration.
>>
>> Why is it a problem to leave the test as a BUILD_BUG_ON() in module_alloc() ?
> On ppc64s, MODULES_VADDR is __vmalloc_start (a variable)  and
> TASK_SIZE depends on current.
> Also for nohash like 44x, MODULES_VADDR is defined based on high_memory.
> If I put it back in module_alloc() and wrap it with #ifdef
> CONFIG_PPC_BOOK3S_32 will that be fine?

Thinking about it once more, I think the best approach is the one taken by Nick in 
https://patchwork.ozlabs.org/project/linuxppc-dev/patch/20210502110050.324953-1-npiggin@gmail.com/

Use MODULES_VADDR/MODULES_END when it exists, use VMALLOC_START/VMALLOC_END otherwise.

I know I suggested to always define MODULES_VADDR, but maybe that's not the best solution at the end.

For kprobes, is there a way to re-use functions from modules.c in alloc_insn_page() ?

Christophe
