Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AB2842650
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 14:42:07 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPRDF5m8pz3bw2
	for <lists+linuxppc-dev@lfdr.de>; Wed, 31 Jan 2024 00:42:05 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.189; helo=szxga03-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPRCm4K8Zz3bpp
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 31 Jan 2024 00:41:37 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4TPRBS0vRFzJpQM;
	Tue, 30 Jan 2024 21:40:32 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 8B07B1400FF;
	Tue, 30 Jan 2024 21:41:31 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 21:41:29 +0800
Message-ID: <d8cb8cec-5530-c0e7-3bd3-bcd47e9bf4e1@huawei.com>
Date: Tue, 30 Jan 2024 21:41:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v10 3/6] arm64: add uaccess to machine check safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-4-tongtiangen@huawei.com>
 <ZbfjvD1_yKK6IVVY@FVFF77S0Q05N>
 <23795738-b86e-7709-bc2b-5abba2e77b68@huawei.com>
 <ZbjlFXVC_ZPYbKhR@FVFF77S0Q05N>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <ZbjlFXVC_ZPYbKhR@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)
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
Cc: wangkefeng.wang@huawei.com, Catalin Marinas <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko <glider@google.com>, kasan-dev@googlegroups.com, "H. Peter Anvin" <hpa@zytor.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>, Will Deacon <will@kernel.org>, x86@kernel.org, "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, Ingo Molnar <mingo@redhat.com>, linux-arm-kernel@lists.infradead.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Nicholas Piggin <npiggin@gmail.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, linuxppc-dev@lists.ozlabs.org, Guohanjun <guohanjun@huawei.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, Robin Murphy <robin.murphy@arm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



在 2024/1/30 20:01, Mark Rutland 写道:
> On Tue, Jan 30, 2024 at 07:14:35PM +0800, Tong Tiangen wrote:
>> 在 2024/1/30 1:43, Mark Rutland 写道:
>>> On Mon, Jan 29, 2024 at 09:46:49PM +0800, Tong Tiangen wrote:
>>> Further, this change will also silently fixup unexpected kernel faults if we
>>> pass bad kernel pointers to copy_{to,from}_user, which will hide real bugs.
>>
>> I think this is better than the panic kernel, because the real bugs
>> belongs to the user process. Even if the wrong pointer is
>> transferred, the page corresponding to the wrong pointer has a memroy
>> error.
> 
> I think you have misunderstood my point; I'm talking about the case of a bad
> kernel pointer *without* a memory error.
> 
> For example, consider some buggy code such as:
> 
> 	void __user *uptr = some_valid_user_pointer;
> 	void *kptr = NULL; // or any other bad pointer
> 
> 	ret = copy_to_user(uptr, kptr, size);
> 	if (ret)
> 		return -EFAULT;
> 
> Before this patch, when copy_to_user() attempted to load from NULL it would
> fault, there would be no fixup handler for the LDR, and the kernel would die(),
> reporting the bad kernel access.
> 
> After this patch (which adds fixup handlers to all the LDR*s in
> copy_to_user()), the fault (which is *not* a memory error) would be handled by
> the fixup handler, and copy_to_user() would return an error without *any*
> indication of the horrible kernel bug.
> 
> This will hide kernel bugs, which will make those harder to identify and fix,
> and will also potentially make it easier to exploit the kernel: if the user
> somehow gains control of the kernel pointer, they can rely on the fixup handler
> returning an error, and can scan through memory rather than dying as soon as
> they pas a bad pointer.

I should understand what you mean. I'll think about this and reply.

Many thanks.
Tong.

> 
>> In addition, the panic information contains necessary information
>> for users to check.
> 
> There is no panic() in the case I am describing.
> 
>>> So NAK to this change as-is; likewise for the addition of USER() to other ldr*
>>> macros in copy_from_user.S and the addition of USER() str* macros in
>>> copy_to_user.S.
>>>
>>> If we want to handle memory errors on some kaccesses, we need a new EX_TYPE_*
>>> separate from the usual EX_TYPE_KACESS_ERR_ZERO that means "handle memory
>>> errors, but treat other faults as fatal". That should come with a rationale and
>>> explanation of why it's actually useful.
>>
>> This makes sense. Add kaccess types that can be processed properly.
>>
>>>
>>> [...]
>>>
>>>> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
>>>> index 478e639f8680..28ec35e3d210 100644
>>>> --- a/arch/arm64/mm/extable.c
>>>> +++ b/arch/arm64/mm/extable.c
>>>> @@ -85,10 +85,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
>>>>    	if (!ex)
>>>>    		return false;
>>>> -	/*
>>>> -	 * This is not complete, More Machine check safe extable type can
>>>> -	 * be processed here.
>>>> -	 */
>>>> +	switch (ex->type) {
>>>> +	case EX_TYPE_UACCESS_ERR_ZERO:
>>>> +		return ex_handler_uaccess_err_zero(ex, regs);
>>>> +	}
>>>
>>> Please fold this part into the prior patch, and start ogf with *only* handling
>>> errors on accesses already marked with EX_TYPE_UACCESS_ERR_ZERO. I think that
>>> change would be relatively uncontroversial, and it would be much easier to
>>> build atop that.
>>
>> OK, the two patches will be merged in the next release.
> 
> Thanks.
> 
> Mark.
> .
