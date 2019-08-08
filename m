Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 530A585D0D
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 10:41:30 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46420Q40F5zDqdW
	for <lists+linuxppc-dev@lfdr.de>; Thu,  8 Aug 2019 18:41:26 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4641yP34dhzDqS7
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Aug 2019 18:39:41 +1000 (AEST)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id E49C46160CF7EB186C3B;
 Thu,  8 Aug 2019 16:39:37 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 8 Aug 2019
 16:39:27 +0800
Subject: Re: [PATCH v5 10/10] powerpc/fsl_booke/kaslr: dump out kernel offset
 information on panic
To: Michael Ellerman <mpe@ellerman.id.au>, <linuxppc-dev@lists.ozlabs.org>,
 <diana.craciun@nxp.com>, <christophe.leroy@c-s.fr>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190807065706.11411-1-yanaijie@huawei.com>
 <20190807065706.11411-11-yanaijie@huawei.com>
 <87zhklt9eg.fsf@concordia.ellerman.id.au>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <9113cc5b-0e89-f423-712a-79220af82b92@huawei.com>
Date: Thu, 8 Aug 2019 16:39:26 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <87zhklt9eg.fsf@concordia.ellerman.id.au>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
 jingxiangfeng@huawei.com, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 2019/8/7 21:03, Michael Ellerman wrote:
> Jason Yan <yanaijie@huawei.com> writes:
>> When kaslr is enabled, the kernel offset is different for every boot.
>> This brings some difficult to debug the kernel. Dump out the kernel
>> offset when panic so that we can easily debug the kernel.
> 
> Some of this is taken from the arm64 version right? Please say so when
> you copy other people's code.
> 

No problem. Architectures like x86 or arm64 or s390 both have this
similar code. I guess x86 is the first one.

>> diff --git a/arch/powerpc/kernel/machine_kexec.c b/arch/powerpc/kernel/machine_kexec.c
>> index c4ed328a7b96..078fe3d76feb 100644
>> --- a/arch/powerpc/kernel/machine_kexec.c
>> +++ b/arch/powerpc/kernel/machine_kexec.c
>> @@ -86,6 +86,7 @@ void arch_crash_save_vmcoreinfo(void)
>>   	VMCOREINFO_STRUCT_SIZE(mmu_psize_def);
>>   	VMCOREINFO_OFFSET(mmu_psize_def, shift);
>>   #endif
>> +	vmcoreinfo_append_str("KERNELOFFSET=%lx\n", kaslr_offset());
>>   }
> 
> There's no mention of that in the commit log.
> 
> Please split it into a separate patch and describe what you're doing and
> why.

OK

> 
>> diff --git a/arch/powerpc/kernel/setup-common.c b/arch/powerpc/kernel/setup-common.c
>> index 1f8db666468d..064075f02837 100644
>> --- a/arch/powerpc/kernel/setup-common.c
>> +++ b/arch/powerpc/kernel/setup-common.c
>> @@ -715,12 +715,31 @@ static struct notifier_block ppc_panic_block = {
>>   	.priority = INT_MIN /* may not return; must be done last */
>>   };
>>   
>> +/*
>> + * Dump out kernel offset information on panic.
>> + */
>> +static int dump_kernel_offset(struct notifier_block *self, unsigned long v,
>> +			      void *p)
>> +{
>> +	pr_emerg("Kernel Offset: 0x%lx from 0x%lx\n",
>> +		 kaslr_offset(), KERNELBASE);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct notifier_block kernel_offset_notifier = {
>> +	.notifier_call = dump_kernel_offset
>> +};
>> +
>>   void __init setup_panic(void)
>>   {
>>   	/* PPC64 always does a hard irq disable in its panic handler */
>>   	if (!IS_ENABLED(CONFIG_PPC64) && !ppc_md.panic)
>>   		return;
>>   	atomic_notifier_chain_register(&panic_notifier_list, &ppc_panic_block);
> 
>> +	if (IS_ENABLED(CONFIG_RANDOMIZE_BASE) && kaslr_offset() > 0)
>> +		atomic_notifier_chain_register(&panic_notifier_list,
>> +					       &kernel_offset_notifier);
> 
> Don't you want to do that before the return above?
> 

Eagle eye. This should not affected by the conditions above.

>>   }
> 
> cheers
> 
> .
> 

