Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id BA89678D2B
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 15:47:54 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y1Gc0ntbzDqMm
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 23:47:52 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.35; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y19w4SsrzDqJj
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 23:43:47 +1000 (AEST)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AC2E8B87C8480C7DA8F3;
 Mon, 29 Jul 2019 21:43:42 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 21:43:36 +0800
Subject: Re: [RFC PATCH 08/10] powerpc/fsl_booke/kaslr: clear the original
 kernel if randomized
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-9-yanaijie@huawei.com>
 <a09b4f53-2ccd-e675-4385-b53fd91fbafc@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <704624a1-36b7-50d7-cf8d-2923b2a97367@huawei.com>
Date: Mon, 29 Jul 2019 21:43:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <a09b4f53-2ccd-e675-4385-b53fd91fbafc@c-s.fr>
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


On 2019/7/29 19:19, Christophe Leroy wrote:
> 
> 
> Le 17/07/2019 à 10:06, Jason Yan a écrit :
>> The original kernel still exists in the memory, clear it now.
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
>>   arch/powerpc/kernel/kaslr_booke.c  | 11 +++++++++++
>>   arch/powerpc/mm/mmu_decl.h         |  2 ++
>>   arch/powerpc/mm/nohash/fsl_booke.c |  1 +
>>   3 files changed, 14 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/kaslr_booke.c 
>> b/arch/powerpc/kernel/kaslr_booke.c
>> index 90357f4bd313..00339c05879f 100644
>> --- a/arch/powerpc/kernel/kaslr_booke.c
>> +++ b/arch/powerpc/kernel/kaslr_booke.c
>> @@ -412,3 +412,14 @@ notrace void __init kaslr_early_init(void 
>> *dt_ptr, phys_addr_t size)
>>       reloc_kernel_entry(dt_ptr, kimage_vaddr);
>>   }
>> +
>> +void __init kaslr_second_init(void)
>> +{
>> +    /* If randomized, clear the original kernel */
>> +    if (kimage_vaddr != KERNELBASE) {
>> +        unsigned long kernel_sz;
>> +
>> +        kernel_sz = (unsigned long)_end - kimage_vaddr;
>> +        memset((void *)KERNELBASE, 0, kernel_sz);
> 
> Why are we clearing ? Is that just to tidy up or is it of security 
> importance ?
> 

If we leave it there, attackers can still find the kernel object very
easy, it's still dangerous especially if without 
CONFIG_STRICT_KERNEL_RWX enabled.

> If so, maybe memzero_explicit() should be used instead ?
> 

OK

>> +    }
>> +}
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index 754ae1e69f92..9912ee598f9b 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> @@ -150,8 +150,10 @@ extern void loadcam_multi(int first_idx, int num, 
>> int tmp_idx);
>>   #ifdef CONFIG_RANDOMIZE_BASE
>>   extern void kaslr_early_init(void *dt_ptr, phys_addr_t size);
>> +extern void kaslr_second_init(void);
> 
> No new 'extern' please.
> 
>>   #else
>>   static inline void kaslr_early_init(void *dt_ptr, phys_addr_t size) {}
>> +static inline void kaslr_second_init(void) {}
>>   #endif
>>   struct tlbcam {
>> diff --git a/arch/powerpc/mm/nohash/fsl_booke.c 
>> b/arch/powerpc/mm/nohash/fsl_booke.c
>> index 8d25a8dc965f..fa5a87f5c08e 100644
>> --- a/arch/powerpc/mm/nohash/fsl_booke.c
>> +++ b/arch/powerpc/mm/nohash/fsl_booke.c
>> @@ -269,6 +269,7 @@ notrace void __init relocate_init(u64 dt_ptr, 
>> phys_addr_t start)
>>       kernstart_addr = start;
>>       if (is_second_reloc) {
>>           virt_phys_offset = PAGE_OFFSET - memstart_addr;
>> +        kaslr_second_init();
>>           return;
>>       }
>>
> 
> Christophe
> 
> .
> 

