Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C9DAE550EBA
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 05:00:15 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LRDsT5TT1z3cgl
	for <lists+linuxppc-dev@lfdr.de>; Mon, 20 Jun 2022 13:00:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=<UNKNOWN>)
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4LRDs55LHtz307C
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 20 Jun 2022 12:59:50 +1000 (AEST)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.56])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LRDq03r7NzkWYp;
	Mon, 20 Jun 2022 10:58:04 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (7.193.23.234) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 10:59:14 +0800
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Mon, 20 Jun 2022 10:59:12 +0800
Message-ID: <684f0362-6e58-753d-32e1-112c6ffe6d12@huawei.com>
Date: Mon, 20 Jun 2022 10:59:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
To: Mark Rutland <mark.rutland@arm.com>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
 <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
 <4371a7c9-8766-9fee-2558-e6f43f06ad19@huawei.com>
 <0da734f3-5743-3df3-3f90-d92e5bd585ce@huawei.com>
 <Yq3HoUyEcnKKk1AY@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <Yq3HoUyEcnKKk1AY@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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



在 2022/6/18 20:40, Mark Rutland 写道:
> On Sat, Jun 18, 2022 at 04:42:06PM +0800, Tong Tiangen wrote:
>>>>> diff --git a/arch/arm64/include/asm/asm-extable.h
>>>>> b/arch/arm64/include/asm/asm-extable.h
>>>>> index 56ebe183e78b..9c94ac1f082c 100644
>>>>> --- a/arch/arm64/include/asm/asm-extable.h
>>>>> +++ b/arch/arm64/include/asm/asm-extable.h
>>>>> @@ -28,6 +28,14 @@
>>>>>        __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>>>>>        .endm
>>>>> +/*
>>>>> + * Create an exception table entry for uaccess `insn`, which
>>>>> will branch to `fixup`
>>>>> + * when an unhandled fault is taken.
>>>>> + * ex->data = ~0 means both reg_err and reg_zero is set to wzr(x31).
>>>>> + */
>>>>> +    .macro          _asm_extable_uaccess, insn, fixup
>>>>> +    __ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_ERR_ZERO, ~0)
>>>>> +    .endm
>>>>
>>>> I'm not too keen on using `~0` here, since that also sets other bits
>>>> in the
>>>> data field, and its somewhat opaque.
>>>>
>>>> How painful is it to generate the data fields as with the C version
>>>> of this
>>>> macro, so that we can pass in wzr explciitly for the two sub-fields?
>>>>
>>>> Other than that, this looks good to me.
>>>>
>>>> Thanks,
>>>> Mark.
>>>
>>> ok, will fix next version.
>>>
>>> Thanks,
>>> Tong.
>>
>> I tried to using data filelds as with C version, but here assembly code we
>> can not using operator such as << and |, if we use lsl and orr instructions,
>> the gpr will be occupied.
>>
>> So how about using 0x3ff directly here? it means err register and zero
>> register both set to x31.
> 
> I had a go at implementing this, and it seems simple enough. Please see:
> 
>    https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/log/?h=arm64/extable/asm-uaccess
> 

I made the following modifications, and the other parts are based on 
your implementation:

arch/arm64/include/asm/asm-extable.h
[...]
.macro          _asm_extable_uaccess, insn, fixup
_ASM_EXTABLE_UACCESS(\insn, \fixup)
.endm
[...]


The following errors are reported during compilation:
[...]
arch/arm64/lib/clear_user.S:45: Error: invalid operands (*ABS* and *UND* 
sections) for `<<'
[...]

"<<" is invalid operands in assembly, is there something wrong with me?

Thanks,
Tong.
> Mark.
> 
> .
