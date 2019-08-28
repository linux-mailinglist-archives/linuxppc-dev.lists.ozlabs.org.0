Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A449F9DA
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 07:36:04 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JDxD4bB8zDqtp
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 15:36:00 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=huawei.com
 (client-ip=45.249.212.190; helo=huawei.com; envelope-from=yanaijie@huawei.com;
 receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=huawei.com
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JDv92Gr4zDqnk
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 15:34:11 +1000 (AEST)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 85AFD5E3BC0852EBDBAF;
 Wed, 28 Aug 2019 13:34:06 +0800 (CST)
Received: from [127.0.0.1] (10.177.96.203) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Wed, 28 Aug 2019
 13:33:59 +0800
Subject: Re: [PATCH v6 04/12] powerpc/fsl_booke/32: introduce
 create_tlb_entry() helper
To: Scott Wood <oss@buserror.net>
References: <20190809100800.5426-1-yanaijie@huawei.com>
 <20190809100800.5426-5-yanaijie@huawei.com>
 <20190827220752.GA17757@home.buserror.net>
From: Jason Yan <yanaijie@huawei.com>
Message-ID: <1bfdc7c4-e615-0df2-1c0d-4358edcdb43b@huawei.com>
Date: Wed, 28 Aug 2019 13:33:58 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.5.0
MIME-Version: 1.0
In-Reply-To: <20190827220752.GA17757@home.buserror.net>
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
Cc: wangkefeng.wang@huawei.com, keescook@chromium.org,
 kernel-hardening@lists.openwall.com, linux-kernel@vger.kernel.org,
 npiggin@gmail.com, jingxiangfeng@huawei.com, diana.craciun@nxp.com,
 paulus@samba.org, zhaohongjiang@huawei.com, thunder.leizhen@huawei.com,
 fanchengyang@huawei.com, linuxppc-dev@lists.ozlabs.org, yebin10@huawei.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Scott,

Thanks for your reply.

On 2019/8/28 6:07, Scott Wood wrote:
> On Fri, Aug 09, 2019 at 06:07:52PM +0800, Jason Yan wrote:
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
>> Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>
>> Reviewed-by: Diana Craciun <diana.craciun@nxp.com>
>> Tested-by: Diana Craciun <diana.craciun@nxp.com>
>> ---
>>   arch/powerpc/kernel/head_fsl_booke.S | 29 ++++++++++++++++++++++++++++
>>   arch/powerpc/mm/mmu_decl.h           |  1 +
>>   2 files changed, 30 insertions(+)
>>
>> diff --git a/arch/powerpc/kernel/head_fsl_booke.S b/arch/powerpc/kernel/head_fsl_booke.S
>> index adf0505dbe02..04d124fee17d 100644
>> --- a/arch/powerpc/kernel/head_fsl_booke.S
>> +++ b/arch/powerpc/kernel/head_fsl_booke.S
>> @@ -1114,6 +1114,35 @@ __secondary_hold_acknowledge:
>>   	.long	-1
>>   #endif
>>   
>> +/*
>> + * Create a 64M tlb by address and entry
>> + * r3/r4 - physical address
>> + * r5 - virtual address
>> + * r6 - entry
>> + */
>> +_GLOBAL(create_tlb_entry)
> 
> This function is broadly named but contains various assumptions about the
> entry being created.  I'd just call it create_kaslr_tlb_entry.
> 

OK.

>> +	lis     r7,0x1000               /* Set MAS0(TLBSEL) = 1 */
>> +	rlwimi  r7,r6,16,4,15           /* Setup MAS0 = TLBSEL | ESEL(r6) */
>> +	mtspr   SPRN_MAS0,r7            /* Write MAS0 */
>> +
>> +	lis     r6,(MAS1_VALID|MAS1_IPROT)@h
>> +	ori     r6,r6,(MAS1_TSIZE(BOOK3E_PAGESZ_64M))@l
>> +	mtspr   SPRN_MAS1,r6            /* Write MAS1 */
>> +
>> +	lis     r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@h
>> +	ori     r6,r6,MAS2_EPN_MASK(BOOK3E_PAGESZ_64M)@l
>> +	and     r6,r6,r5
>> +	ori	r6,r6,MAS2_M@l
>> +	mtspr   SPRN_MAS2,r6            /* Write MAS2(EPN) */
>> +
>> +	ori     r8,r4,(MAS3_SW|MAS3_SR|MAS3_SX)
>> +	mtspr   SPRN_MAS3,r8            /* Write MAS3(RPN) */
>> +
>> +	tlbwe                           /* Write TLB */
>> +	isync
>> +	sync
>> +	blr
> 
> Should set MAS7 under MMU_FTR_BIG_PHYS (or CONFIG_PHYS_64BIT if it's
> too early for features) -- even if relocatable kernels over 4GiB aren't
> supported (I don't remember if they work or not), MAS7 might be non-zero
> on entry.  And the function claims to take a 64-bit phys addr as input...
> 

Good catch. And I should consider 32-bit phys addr as input too. I will 
fix this in next version. Thanks.

> MAS2_M should be MAS2_M_IF_NEEDED to match other kmem tlb entries.
> 

OK

> -Scott
> 
> .
> 

