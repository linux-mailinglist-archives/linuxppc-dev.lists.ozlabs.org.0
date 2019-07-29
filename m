Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id D0A0A78CDF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 15:29:57 +0200 (CEST)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 45y0sq6YS2zDqK5
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jul 2019 23:29:51 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 45y0ny5L6YzDqJm
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 29 Jul 2019 23:26:28 +1000 (AEST)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 6FFE4A76CB5ED39761D5;
 Mon, 29 Jul 2019 21:26:22 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 21:26:14 +0800
Subject: Re: [RFC PATCH 04/10] powerpc/fsl_booke/32: introduce
 create_tlb_entry() helper
To: Christophe Leroy <christophe.leroy@c-s.fr>, <mpe@ellerman.id.au>,
 <linuxppc-dev@lists.ozlabs.org>, <diana.craciun@nxp.com>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <npiggin@gmail.com>,
 <keescook@chromium.org>, <kernel-hardening@lists.openwall.com>
References: <20190717080621.40424-1-yanaijie@huawei.com>
 <20190717080621.40424-5-yanaijie@huawei.com>
 <4e6c468d-287b-4bba-675c-8b3f73456500@c-s.fr>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <bf63f6e1-c74f-8494-5f1f-f4c5a1a671fe@huawei.com>
Date: Mon, 29 Jul 2019 21:26:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <4e6c468d-287b-4bba-675c-8b3f73456500@c-s.fr>
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


On 2019/7/29 19:05, Christophe Leroy wrote:
> 
> 
> Le 17/07/2019 à 10:06, Jason Yan a écrit :
>> Add a new helper create_tlb_entry() to create a tlb entry by the virtual
>> and physical address. This is a preparation to support boot kernel at a
>> randomized address.
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
>>   arch/powerpc/kernel/head_fsl_booke.S | 30 ++++++++++++++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h           |  1 +
>>   2 files changed, 31 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S 
>> b/arch/powerpc/kernel/head_fsl_booke.S
>> index adf0505dbe02..a57d44638031 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -1114,6 +1114,36 @@ __secondary_hold_acknowledge:
>>       .long    -1
>>   #endif
>> +/*
>> + * Create a 64M tlb by address and entry
>> + * r3/r4 - physical address
>> + * r5 - virtual address
>> + * r6 - entry
>> + */
>> +_GLOBAL(create_tlb_entry)
>> +    lis     r7,0x1000               /* Set MAS0(TLBSEL) = 1 */
>> +    rlwimi  r7,r6,16,4,15           /* Setup MAS0 = TLBSEL | ESEL(r6) */
>> +    mtspr   SPRN_MAS0,r7            /* Write MAS0 */
>> +
>> +    lis     r6,(MAS1_VALID|MAS1_IPROT)@h
>> +    ori     r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
>> +    mtspr   SPRN_MAS1,r6            /* Write MAS1 */
>> +
>> +    lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
>> +    ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
>> +    and     r6,r6,r5
>> +    ori    r6,r6,MAS2_M@l
>> +    mtspr   SPRN_MAS2,r6            /* Write MAS2(EPN) */
>> +
>> +    mr      r8,r4
>> +    ori     r8,r8,(MAS3_SW|MAS3_SR|MAS3_SX)
> 
> Could drop the mr r8, r4 and do:
> 
> ori     r8,r4,(MAS3_SW|MAS3_SR|MAS3_SX)
> 

OK, thanks for the suggestion.

>> +    mtspr   SPRN_MAS3,r8            /* Write MAS3(RPN) */
>> +
>> +    tlbwe                           /* Write TLB */
>> +    isync
>> +    sync
>> +    blr
>> +
>>   /*
>>    * Create a tlb entry with the same effective and physical address as
>>    * the tlb entry used by the current running code. But set the TS to 1.
>> diff --git a/arch/powerpc/mm/mmu_decl.h b/arch/powerpc/mm/mmu_decl.h
>> index 32c1a191c28a..d7737cf97cee 100644
>> --- a/arch/powerpc/mm/mmu_decl.h
>> +++ b/arch/powerpc/mm/mmu_decl.h
>> @@ -142,6 +142,7 @@ extern unsigned long calc_cam_sz(unsigned long 
>> ram, unsigned long virt,
>>   extern void adjust_total_lowmem(void);
>>   extern int switch_to_as1(void);
>>   extern void restore_to_as0(int esel, int offset, void *dt_ptr, int 
>> bootcpu);
>> +extern void create_tlb_entry(phys_addr_t phys, unsigned long virt, 
>> int entry);
> 
> Please please do not add new declarations with the useless 'extern' 
> keyword. See checkpatch report: 
> https://openpower.xyz/job/snowpatch/job/snowpatch-linux-checkpatch/8124//artifact/linux/checkpatch.log 
> 

Will drop all useless 'extern' in this and other patches, thanks.

> 
>>   #endif
>>   extern void loadcam_entry(unsigned int index);
>>   extern void loadcam_multi(int first_idx, int num, int tmp_idx);
>>
> 
> .
> 

