Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B0D25550388
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 10:43:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LQ8ZB6SFYz3cgy
	for <lists+linuxppc-dev@lfdr.de>; Sat, 18 Jun 2022 18:43:14 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LQ8Yh695Fz30Qc
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 18 Jun 2022 18:42:44 +1000 (AEST)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LQ8Wd01gMzYXPC;
	Sat, 18 Jun 2022 16:41:01 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 18 Jun 2022 16:42:09 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Sat, 18 Jun 2022 16:42:07 +0800
Message-ID: <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
Date: Sat, 18 Jun 2022 16:42:06 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
From: Tong Tiangen <tongtiangen@huawei.com>
To: Mark Rutland <mark.rutland@arm.com>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
 <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
 <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
In-Reply-To: <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo
 Molnar <mingo@redhat.com>, Catalin
 Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander
 Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2022/6/18 11:26, Tong Tiangen 写道:
> 
> 
> 在 2022/6/17 16:24, Mark Rutland 写道:
>> On Sat, May 28, 2022 at 06:50:50AM +0000, Tong Tiangen wrote:
>>> Currnetly, the extable type used by __arch_copy_from/to_user() is
>>> EX_TYPE_FIXUP. In fact, It is more clearly to use meaningful
>>> EX_TYPE_UACCESS_*.
>>>
>>> Suggested-by: Mark Rutland <mark.rutland@arm.com>
>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>>> ---
>>>   arch/arm64/include/asm/asm-extable.h |  8 ++++++++
>>>   arch/arm64/include/asm/asm-uaccess.h | 12 ++++++------
>>>   2 files changed, 14 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/arch/arm64/include/asm/asm-extable.h 
>>> b/arch/arm64/include/asm/asm-extable.h
>>> index 56ebe183e78b..9c94ac1f082c 100644
>>> --- a/arch/arm64/include/asm/asm-extable.h
>>> +++ b/arch/arm64/include/asm/asm-extable.h
>>> @@ -28,6 +28,14 @@
>>>       __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>>>       .endm
>>> +/*
>>> + * Create an exception table entry for uaccess `insn`, which will 
>>> branch to `fixup`
>>> + * when an unhandled fault is taken.
>>> + * ex->data = ~0 means both reg_err and reg_zero is set to wzr(x31).
>>> + */
>>> +    .macro          _asm_extable_uaccess, insn, fixup
>>> +    __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_ERR_ZERO, ~0)
>>> +    .endm
>>
>> I'm not too keen on using `~0` here, since that also sets other bits 
>> in the
>> data field, and its somewhat opaque.
>>
>> How painful is it to generate the data fields as with the C version of 
>> this
>> macro, so that we can pass in wzr explciitly for the two sub-fields?
>>
>> Other than that, this looks good to me.
>>
>> Thanks,
>> Mark.
> 
> ok, will fix next version.
> 
> Thanks,
> Tong.

I tried to using data filelds as with C version, but here assembly code 
we can not using operator such as << and |, if we use lsl and orr 
instructions, the gpr will be occupied.

So how about using 0x3ff directly here? it means err register and zero 
register both set to x31.

Thanks,
Tong.

> 
>>
>>>   /*
>>>    * Create an exception table entry for `insn` if `fixup` is 
>>> provided. Otherwise
>>>    * do nothing.
>>> diff --git a/arch/arm64/include/asm/asm-uaccess.h 
>>> b/arch/arm64/include/asm/asm-uaccess.h
>>> index 0557af834e03..75b211c98dea 100644
>>> --- a/arch/arm64/include/asm/asm-uaccess.h
>>> +++ b/arch/arm64/include/asm/asm-uaccess.h
>>> @@ -61,7 +61,7 @@ alternative_else_nop_endif
>>>   #define USER(l, x...)                \
>>>   9999:    x;                    \
>>> -    _asm_extable    9999b, l
>>> +    _asm_extable_uaccess    9999b, l
>>>   /*
>>>    * Generate the assembly for LDTR/STTR with exception table entries.
>>> @@ -73,8 +73,8 @@ alternative_else_nop_endif
>>>   8889:        ldtr    \reg2, [\addr, #8];
>>>           add    \addr, \addr, \post_inc;
>>> -        _asm_extable    8888b,\l;
>>> -        _asm_extable    8889b,\l;
>>> +        _asm_extable_uaccess    8888b, \l;
>>> +        _asm_extable_uaccess    8889b, \l;
>>>       .endm
>>>       .macro user_stp l, reg1, reg2, addr, post_inc
>>> @@ -82,14 +82,14 @@ alternative_else_nop_endif
>>>   8889:        sttr    \reg2, [\addr, #8];
>>>           add    \addr, \addr, \post_inc;
>>> -        _asm_extable    8888b,\l;
>>> -        _asm_extable    8889b,\l;
>>> +        _asm_extable_uaccess    8888b,\l;
>>> +        _asm_extable_uaccess    8889b,\l;
>>>       .endm
>>>       .macro user_ldst l, inst, reg, addr, post_inc
>>>   8888:        \inst        \reg, [\addr];
>>>           add        \addr, \addr, \post_inc;
>>> -        _asm_extable    8888b,\l;
>>> +        _asm_extable_uaccess    8888b, \l;
>>>       .endm
>>>   #endif
>>> -- 
>>> 2.25.1
>>>
>> .
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
