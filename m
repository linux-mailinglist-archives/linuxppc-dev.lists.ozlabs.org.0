Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD5B3664B4
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 07:14:49 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FQ7yr1przz301g
	for <lists+linuxppc-dev@lfdr.de>; Wed, 21 Apr 2021 15:14:44 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FQ7yV3Z49z2y0B
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 21 Apr 2021 15:14:21 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4FQ7yL2dCDzB09Zn;
 Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id KCUpcni_iUb8; Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4FQ7yL1TKtzB09Zm;
 Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D9C8A8B814;
 Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id YaSirhPo2dqs; Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 32E448B770;
 Wed, 21 Apr 2021 07:14:18 +0200 (CEST)
Subject: Re: [PATCH v10 03/10] powerpc: Always define MODULES_{VADDR,END}
To: Jordan Niethe <jniethe5@gmail.com>
References: <20210330045132.722243-1-jniethe5@gmail.com>
 <20210330045132.722243-4-jniethe5@gmail.com>
 <c4977cfb-6d9d-063e-b74b-ba0ffd9feaeb@csgroup.eu>
 <CACzsE9oNQuymvv5FRUvzQ9uiytvFOcke5RsXA_urfKS1mtMnLg@mail.gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <8e0e850d-79b5-03ab-56c7-3d92ec72c7dc@csgroup.eu>
Date: Wed, 21 Apr 2021 07:14:15 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACzsE9oNQuymvv5FRUvzQ9uiytvFOcke5RsXA_urfKS1mtMnLg@mail.gmail.com>
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
 naveen.n.rao@linux.ibm.com, linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 Daniel Axtens <dja@axtens.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 21/04/2021 à 04:46, Jordan Niethe a écrit :
> On Fri, Apr 2, 2021 at 12:36 AM Christophe Leroy
> <christophe.leroy@csgroup.eu> wrote:
>>
>>
>>
>> Le 30/03/2021 à 06:51, Jordan Niethe a écrit :
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
>>> ---
>>>    arch/powerpc/include/asm/pgtable.h | 5 +++++
>>>    arch/powerpc/kernel/module.c       | 5 +----
>>
>> You probably also have changes to do in kernel/ptdump.c
>>
>> In mm/book3s32/mmu.c and mm/kasan/kasan_init_32.c as well allthough that's harmless here.
>>
>>>    2 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/arch/powerpc/include/asm/pgtable.h b/arch/powerpc/include/asm/pgtable.h
>>> index 4eed82172e33..014c2921f26a 100644
>>> --- a/arch/powerpc/include/asm/pgtable.h
>>> +++ b/arch/powerpc/include/asm/pgtable.h
>>> @@ -167,6 +167,11 @@ struct seq_file;
>>>    void arch_report_meminfo(struct seq_file *m);
>>>    #endif /* CONFIG_PPC64 */
>>>
>>> +#ifndef MODULES_VADDR
>>> +#define MODULES_VADDR VMALLOC_START
>>> +#define MODULES_END VMALLOC_END
>>> +#endif
>>> +
>>>    #endif /* __ASSEMBLY__ */
>>>
>>>    #endif /* _ASM_POWERPC_PGTABLE_H */
>>> diff --git a/arch/powerpc/kernel/module.c b/arch/powerpc/kernel/module.c
>>> index a211b0253cdb..f1fb58389d58 100644
>>> --- a/arch/powerpc/kernel/module.c
>>> +++ b/arch/powerpc/kernel/module.c
>>> @@ -14,6 +14,7 @@
>>>    #include <asm/firmware.h>
>>>    #include <linux/sort.h>
>>>    #include <asm/setup.h>
>>> +#include <linux/mm.h>
>>>
>>>    static LIST_HEAD(module_bug_list);
>>>
>>> @@ -87,13 +88,9 @@ int module_finalize(const Elf_Ehdr *hdr,
>>>        return 0;
>>>    }
>>>
>>> -#ifdef MODULES_VADDR
>>>    void *module_alloc(unsigned long size)
>>>    {
>>> -     BUILD_BUG_ON(TASK_SIZE > MODULES_VADDR);
>>> -
>>
>> The above check is needed somewhere, if you remove it from here you have to perform the check
>> somewhere else.
> 
> This also introduces this warning:
> fs/proc/kcore.c:626:52: warning: self-comparison always evaluates to
> false [-Wtautological-compare]
>    626 |  if (MODULES_VADDR != VMALLOC_START && MODULES_END != VMALLOC_END) {
> I might leave this patch out of this series and use an #ifdef for now
> and make this change separately as a follow up.

x86/32 at least does the same (see 
https://elixir.bootlin.com/linux/v5.12-rc8/source/arch/x86/include/asm/pgtable_32_areas.h#L47)

They probably also get the warning, so I think would shouldn't bother.
One day someone will fix fs/proc/kcore.c , that's not a powerpc problem.

> 
>>
>>>        return __vmalloc_node_range(size, 1, MODULES_VADDR, MODULES_END, GFP_KERNEL,
>>>                                    PAGE_KERNEL_EXEC, VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
>>>                                    __builtin_return_address(0));
>>>    }
>>> -#endif
>>>
