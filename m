Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC8778D89
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 16:12:25 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y1pt4FS2zDqMC
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jul 2019 00:12:22 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.191; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y1kh4HTXzDqDy
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jul 2019 00:08:44 +1000 (AEST)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 708E9D28CD4E0EF9094B;
 Mon, 29 Jul 2019 22:08:41 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 22:08:32 +0800
Subject: Re: [RFC PATCH 10/10] powerpc/fsl_booke/kaslr: dump out kernel offset
 information on panic
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-11-yanaijie@huawei.com>
 <d10db1e3-6bc4-eaa4-d68e-b7343e35b55f@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <599f9ff9-9799-b57e-4c88-cf9c60b94a46@huawei.com>
Date: Mon, 29 Jul 2019 22:08:30 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <d10db1e3-6bc4-eaa4-d68e-b7343e35b55f@c-s.fr>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.177.96.203]
X-CFilter-Loop: Reflected
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
Cc: wangkefeng.wang@huawei.com, linux-kernel@vger.kernel.org,
 jingxiangfeng@huawei.com, thunder.leizhen@huawei.com, fanchengyang@huawei.com,
 yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


On 2019/7/29 19:43, Christophe Leroy wrote:
> 
> 
> Le 17/07/2019 à 10:06, Jason Yan a écrit :
>> When kaslr is enabled, the kernel offset is different for every boot.
>> This brings some difficult to debug the kernel. Dump out the kernel
>> offset when panic so that we can easily debug the kernel.
>>
>> Signed-off-by: Jason Yan <yanaijie@huawei.com>
>> Cc: Diana Craciun <diana.craciun@nxp.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Christophe Leroy <christophe.leroy@c-s.fr>
>> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>> Cc: Paul Mackerras <paulus@samba.org>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Kees Cook <keescook@chromium.org>
>> ---
>>   arch/powerpc/include/asm/page.h     |  5 +++++
>>   arch/powerpc/kernel/machine_kexec.c |  1 +
>>   arch/powerpc/kernel/setup-common.c  | 23 +++++++++++++++++++++++
>>   3 files changed, 29 insertions(+)
>>
>> diff --git a/arch/powerpc/include/asm/page.h 
>> b/arch/powerpc/include/asm/page.h
>> index 60a68d3a54b1..cd3ac530e58d 100644
>> --- a/arch/powerpc/include/asm/page.h
>> +++ b/arch/powerpc/include/asm/page.h
>> @@ -317,6 +317,11 @@ struct vm_area_struct;
>>   extern unsigned long kimage_vaddr;
>> +static inline unsigned long kaslr_offset(void)
>> +{
>> +    return kimage_vaddr - KERNELBASE;
>> +}
>> +
>>   #include <asm-generic/memory_model.h>
>>   #endif /* __ASSEMBLY__ */
>>   #include <asm/slice.h>
>> diff --git a/arch/powerpc/kernel/machine_kexec.c 
>> b/arch/powerpc/kernel/machine_kexec.c
>> index c4ed328a7b96..078fe3d76feb 100644
>> --- a/arch/powerpc/kernel/machine_kexec.c
>> +++ b/arch/powerpc/kernel/machine_kexec.c
>> @@ -86,6 +86,7 @@ void arch_crash_save_vmcoreinfo(void)
>>       VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
>>       VMCOREINFO_OFFSET(mmu_psize_def, shift);
>>   #endif
>> +    vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
>>   }
>>   /*
>> diff --git a/arch/powerpc/kernel/setup-common.c 
>> b/arch/powerpc/kernel/setup-common.c
>> index 1f8db666468d..49e540c0adeb 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -715,12 +715,35 @@ static struct notifier_block ppc_panic_block = {
>>       .priority = INT_MIN /* may not return; must be done last */
>>   };
>> +/*
>> + * Dump out kernel offset information on panic.
>> + */
>> +static int dump_kernel_offset(struct notifier_block *self, unsigned 
>> long v,
>> +                  void *p)
>> +{
>> +    const unsigned long offset = kaslr_offset();
>> +
>> +    if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && offset > 0)
>> +        pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
>> +             offset, KERNELBASE);
>> +    else
>> +        pr_emerg("Kernel Offset: disabled\n");
> 
> Do we really need that else branch ?
> 
> Why not just make the below atomic_notifier_chain_register() 
> conditionnal to IS_ENABLED(CONFIG_RANDOMIZE_BASE) && offset > 0
> and not print anything otherwise ?
> 

I'm trying to keep the same fashion as x86/arm64 do. But I agree
with you that it's simpler to not print anything else if not randomized.

> Christophe
> 
>> +
>> +    return 0;
>> +}
>> +
>> +static struct notifier_block kernel_offset_notifier = {
>> +    .notifier_call = dump_kernel_offset
>> +};
>> +
>>   void __init setup_panic(void)
>>   {
>>       /* PPC64 always does a hard irq disable in its panic handler */
>>       if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
>>           return;
>>       atomic_notifier_chain_register(&panic_notifier_list, 
>> &ppc_panic_block);
>> +    atomic_notifier_chain_register(&panic_notifier_list,
>> +                       &kernel_offset_notifier);
>>   }
>>   #ifdef CONFIG_CHECK_CACHE_COHERENCY
>>
> 
> .
> 

