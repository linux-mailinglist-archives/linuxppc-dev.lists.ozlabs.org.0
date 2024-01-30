Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA3A842284
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 12:15:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TPMyl0zbXz3cT7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 22:15:11 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.35; helo=szxga07-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4TPMyG2PvQz3by2
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 22:14:43 +1100 (AEDT)
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4TPMvz6zx9z1Q89B;
	Tue, 30 Jan 2024 19:12:47 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id D80601A016C;
	Tue, 30 Jan 2024 19:14:37 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 30 Jan 2024 19:14:35 +0800
Message-ID: <23795738-b86e-7709-bc2b-5abba2e77b68@huawei.com>
Date: Tue, 30 Jan 2024 19:14:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
From: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 3/6] arm64: add uaccess to machine check safe
To: Mark Rutland <mark.rutland@arm.com>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-4-tongtiangen@huawei.com>
 <ZbfjvD1_yKK6IVVY@FVFF77S0Q05N>
In-Reply-To: <ZbfjvD1_yKK6IVVY@FVFF77S0Q05N>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
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



在 2024/1/30 1:43, Mark Rutland 写道:
> On Mon, Jan 29, 2024 at 09:46:49PM +0800, Tong Tiangen wrote:
>> If user process access memory fails due to hardware memory error, only the
>> relevant processes are affected, so it is more reasonable to kill the user
>> process and isolate the corrupt page than to panic the kernel.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
>> ---
>>   arch/arm64/lib/copy_from_user.S | 10 +++++-----
>>   arch/arm64/lib/copy_to_user.S   | 10 +++++-----
>>   arch/arm64/mm/extable.c         |  8 ++++----
>>   3 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
>> index 34e317907524..1bf676e9201d 100644
>> --- a/arch/arm64/lib/copy_from_user.S
>> +++ b/arch/arm64/lib/copy_from_user.S
>> @@ -25,7 +25,7 @@
>>   	.endm
>>   
>>   	.macro strb1 reg, ptr, val
>> -	strb \reg, [\ptr], \val
>> +	USER(9998f, strb \reg, [\ptr], \val)
>>   	.endm
> 
> This is a store to *kernel* memory, not user memory. It should not be marked
> with USER().

This does cause some misconceptions, and my original idea was to reuse 
the fixup capability of USER().

> 
> I understand that you *might* want to handle memory errors on these stores, but
> the commit message doesn't describe that and the associated trade-off. For
> example, consider that when a copy_form_user fails we'll try to zero the
> remaining buffer via memset(); so if a STR* instruction in copy_to_user
> faulted, upon handling the fault we'll immediately try to fix that up with some
> more stores which will also fault, but won't get fixed up, leading to a panic()
> anyway...

When copy_from_user() triggers a memory error, there are two cases: ld
user memory error and st kernel memory error. The former can clear the
remaining kernel memory, and the latter cannot be cleared because the
page is poison.

The purpose of memset() is to keep the data consistency of the kernel
memory (or multiple subsequent pages) (the data that is not copied
should be set to 0). My consideration here is that since our ultimate
goal is to kill the owner thread of the kernel memory data, the
"consistency" of the kernel memory data is not so important, but
increases the processing complexity.

The trade-offs do need to be added to commit message after agreement
is reached :)
> 
> Further, this change will also silently fixup unexpected kernel faults if we
> pass bad kernel pointers to copy_{to,from}_user, which will hide real bugs.

I think this is better than the panic kernel, because the real bugs
belongs to the user process. Even if the wrong pointer is
transferred, the page corresponding to the wrong pointer has a memroy
error. In addition, the panic information contains necessary information
for users to check.

> 
> So NAK to this change as-is; likewise for the addition of USER() to other ldr*
> macros in copy_from_user.S and the addition of USER() str* macros in
> copy_to_user.S.
> 
> If we want to handle memory errors on some kaccesses, we need a new EX_TYPE_*
> separate from the usual EX_TYPE_KACESS_ERR_ZERO that means "handle memory
> errors, but treat other faults as fatal". That should come with a rationale and
> explanation of why it's actually useful.

This makes sense. Add kaccess types that can be processed properly.

> 
> [...]
> 
>> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
>> index 478e639f8680..28ec35e3d210 100644
>> --- a/arch/arm64/mm/extable.c
>> +++ b/arch/arm64/mm/extable.c
>> @@ -85,10 +85,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
>>   	if (!ex)
>>   		return false;
>>   
>> -	/*
>> -	 * This is not complete, More Machine check safe extable type can
>> -	 * be processed here.
>> -	 */
>> +	switch (ex->type) {
>> +	case EX_TYPE_UACCESS_ERR_ZERO:
>> +		return ex_handler_uaccess_err_zero(ex, regs);
>> +	}
> 
> Please fold this part into the prior patch, and start ogf with *only* handling
> errors on accesses already marked with EX_TYPE_UACCESS_ERR_ZERO. I think that
> change would be relatively uncontroversial, and it would be much easier to
> build atop that.

OK, the two patches will be merged in the next release.

Many thanks.
Tong.

> 
> Thanks,
> Mark.
> .
