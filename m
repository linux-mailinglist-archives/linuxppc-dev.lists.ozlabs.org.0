Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8234782CA73
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 08:41:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TBr1Y5mjcz3cW4
	for <lists+linuxppc-dev@lfdr.de>; Sat, 13 Jan 2024 18:41:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=guozihua@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TBr114vkBz2yVb
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 13 Jan 2024 18:40:33 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4TBr0S6lwPzbbm7;
	Sat, 13 Jan 2024 15:40:08 +0800 (CST)
Received: from dggpemm500024.china.huawei.com (unknown [7.185.36.203])
	by mail.maildlp.com (Postfix) with ESMTPS id E4E451404FE;
	Sat, 13 Jan 2024 15:40:11 +0800 (CST)
Received: from [10.67.110.173] (10.67.110.173) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sat, 13 Jan 2024 15:40:11 +0800
Message-ID: <945b1844-4508-858b-d143-a53b27d3a009@huawei.com>
Date: Sat, 13 Jan 2024 15:40:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] powerpc: Fix preserved memory size for int-vectors
Content-Language: en-US
To: Christophe Leroy <christophe.leroy@csgroup.eu>, "mpe@ellerman.id.au"
	<mpe@ellerman.id.au>
References: <20240109033851.1310455-1-guozihua@huawei.com>
 <1e4cabf5-2d1a-4046-bff9-7f3547abb613@csgroup.eu>
From: "Guozihua (Scott)" <guozihua@huawei.com>
In-Reply-To: <1e4cabf5-2d1a-4046-bff9-7f3547abb613@csgroup.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.110.173]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemm500024.china.huawei.com (7.185.36.203)
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
Cc: "aneesh.kumar@kernel.org" <aneesh.kumar@kernel.org>, "naveen.n.rao@linux.ibm.com" <naveen.n.rao@linux.ibm.com>, "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>, "npiggin@gmail.com" <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On 2024/1/9 17:59, Christophe Leroy wrote:
> 
> 
> Le 09/01/2024 à 04:38, GUO Zihua a écrit :
>> [Vous ne recevez pas souvent de courriers de guozihua@huawei.com. Découvrez pourquoi ceci est important à https://aka.ms/LearnAboutSenderIdentification ]
>>
>> The first 32k of memory is reserved for interrupt vectors, however for
>> powerpc64 this might not be enough. Fix this by reserving the maximum
>> size between 32k and the real size of interrupt vectors.
> 
> You say "this might not be enough". Do you have exemples of when it is 
> not enough, or is it just hypothetycal ?

Hi Christophe,

The problem is discovered when I am trying to test ppc64 kaslr
(developed by Yan, ref: https://lwn.net/Articles/811686/) on QEMU. On
QEMU it seems that the size of interrupt vectors is way larger than
0x8000, resulting in the interrupt vectors code overriding memory
allocated for PACAs during do_final_fixups().
> 
>>
>> Signed-off-by: GUO Zihua <guozihua@huawei.com>
>> ---
>>   arch/powerpc/kernel/prom.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/powerpc/kernel/prom.c b/arch/powerpc/kernel/prom.c
>> index 0b5878c3125b..f374487513b3 100644
>> --- a/arch/powerpc/kernel/prom.c
>> +++ b/arch/powerpc/kernel/prom.c
>> @@ -758,6 +758,7 @@ static inline void save_fscr_to_task(void) {}
>>   void __init early_init_devtree(void *params)
>>   {
>>          phys_addr_t limit;
>> +       size_t int_vector_size;
> 
> Why size_t ?
> 
> memblock_reserve() takes a phys_addr_t

Will fix that.
> 
>>
>>          DBG(" -> early_init_devtree(%px)\n", params);
>>
>> @@ -810,9 +811,17 @@ void __init early_init_devtree(void *params)
>>          setup_initial_memory_limit(memstart_addr, first_memblock_size);
>>          /* Reserve MEMBLOCK regions used by kernel, initrd, dt, etc... */
>>          memblock_reserve(PHYSICAL_START, __pa(_end) - PHYSICAL_START);
>> +#ifdef CONFIG_PPC64
>> +       /* If relocatable, reserve at least 32k for interrupt vectors etc. */
>> +       int_vector_size = (size_t)((uintptr_t)__end_interrupts -
>> +                                  (uintptr_t)_stext);
> 
> Why do you need so many casts ? When I look into function 
> overlaps_interrupt_vector_text() it seems to work well without cast at all.

I'll look into it.
> 
>> +       int_vector_size = max_t(size_t, 0x8000, int_vector_size);
> 
> Use SZ_32K instead of 0x8000
> 
>> +#else
>>          /* If relocatable, reserve first 32k for interrupt vectors etc. */
>> +       int_vector_size = 0x8000;
> 
> Use SZ_32K

Sure.
> 
>> +#endif
>>          if (PHYSICAL_START > MEMORY_START)
>> -               memblock_reserve(MEMORY_START, 0x8000);
>> +               memblock_reserve(MEMORY_START, int_vector_size);
>>          reserve_kdump_trampoline();
>>   #if defined(CONFIG_FA_DUMP) || defined(CONFIG_PRESERVE_FA_DUMP)
>>          /*
>> --
>> 2.34.1
>>

-- 
Best
GUO Zihua

