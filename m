Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id AFA3B78CFB
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 15:38:53 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y14B2rfrzDqML
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 23:38:50 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y10P2YZ2zDqJq
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 23:35:33 +1000 (AEST)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 55120CB76ABAB4BC196D;
 Mon, 29 Jul 2019 21:35:30 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 21:35:19 +0800
Subject: Re: [RFC PATCH 05/10] powerpc/fsl_booke/32: introduce
 reloc_kernel_entry() helper
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-6-yanaijie@huawei.com>
 <e4ccd015-a9c4-b0a6-e3ca-d37a04e29ec6@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <60238fe3-a6ec-3537-d56d-29ebeb38f5fd@huawei.com>
Date: Mon, 29 Jul 2019 21:35:18 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <e4ccd015-a9c4-b0a6-e3ca-d37a04e29ec6@c-s.fr>
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


On 2019/7/29 19:08, Christophe Leroy wrote:
> 
> 
> Le 17/07/2019 à 10:06, Jason Yan a écrit :
>> Add a new helper reloc_kernel_entry() to jump back to the start of the
>> new kernel. After we put the new kernel in a randomized place we can use
>> this new helper to enter the kernel and begin to relocate again.
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
>>   arch/powerpc/kernel/head_fsl_booke.S | 16 ++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h           |  1 +
>>   2 files changed, 17 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S 
>> b/arch/powerpc/kernel/head_fsl_booke.S
>> index a57d44638031..ce40f96dae20 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -1144,6 +1144,22 @@ _GLOBAL(create_tlb_entry)
>>       sync
>>       blr
>> +/*
>> + * Return to the start of the relocated kernel and run again
>> + * r3 - virtual address of fdt
>> + * r4 - entry of the kernel
>> + */
>> +_GLOBAL(reloc_kernel_entry)
>> +    mfmsr    r7
>> +    li    r8,(MSR_IS | MSR_DS)
>> +    andc    r7,r7,r8
> 
> Instead of the li/andc, what about the following:
> 
> rlwinm r7, r7, 0, ~(MSR_IS | MSR_DS)
> 

Good idea.

>> +
>> +    mtspr    SPRN_SRR0,r4
>> +    mtspr    SPRN_SRR1,r7
>> +    isync
>> +    sync
>> +    rfi
> 
> Are the isync/sync really necessary ? AFAIK, rfi is context synchronising.
> 

I see some code with sync before rfi so I'm not sure. I will check this
and drop the isync/sync if it's true.

Thanks.

>> +
>>   /*
>>    * Create a tlb entry with the same effective and physical address as
>>    * the tlb entry used by the current running code. But set the TS to 1.
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index d7737cf97cee..dae8e9177574 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> @@ -143,6 +143,7 @@ extern void adjust_total_lowmem(void);
>>   extern int switch_to_as1(void);
>>   extern void restore_to_as0(int esel, int offset, void *dt_ptr, int 
>> bootcpu);
>>   extern void create_tlb_entry(phys_addr_t phys, unsigned long virt, 
>> int entry);
>> +extern void reloc_kernel_entry(void *fdt, int addr);
> 
> No new 'extern' please, see 
> https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/8125//artifact/linux/checkpatch.log 
> 
> 
> 
>>   #endif
>>   extern void loadcam_entry(unsigned int index);
>>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>>
> 
> Christophe
> 
> .
> 

