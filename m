Return-Path: <linuxppc-dev+bounces-228-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B2B9587E1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 15:27:09 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wp9HG3pR8z2y2B;
	Tue, 20 Aug 2024 23:27:06 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wp9HF1n6rz2xJ5
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 23:26:59 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Wp9Dg0B6HzhXpt;
	Tue, 20 Aug 2024 21:24:51 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 25398140138;
	Tue, 20 Aug 2024 21:26:51 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 21:26:49 +0800
Message-ID: <269ec0b0-3385-fe11-a2c2-81ecfde6bf76@huawei.com>
Date: Tue, 20 Aug 2024 21:26:48 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v12 2/6] arm64: add support for ARCH_HAS_COPY_MC
To: Mark Rutland <mark.rutland@arm.com>, <dan.j.williams@intel.com>
CC: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>, James Morse <james.morse@arm.com>,
	Robin Murphy <robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>, Vincenzo Frascino
	<vincenzo.frascino@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Alexander Potapenko <glider@google.com>, Christophe Leroy
	<christophe.leroy@csgroup.eu>, Aneesh Kumar K.V <aneesh.kumar@kernel.org>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Thomas Gleixner
	<tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov
	<bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, <x86@kernel.org>,
	"H. Peter Anvin" <hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
 <20240528085915.1955987-3-tongtiangen@huawei.com>
 <ZsOA8WD_5Sp0DJhS@J2N7QTR9R3.cambridge.arm.com>
 <4436d172-c474-8ecd-b5e4-4c21088baf49@huawei.com>
 <ZsReD722byCipuNm@J2N7QTR9R3>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <ZsReD722byCipuNm@J2N7QTR9R3>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600017.china.huawei.com (7.193.23.234)



在 2024/8/20 17:12, Mark Rutland 写道:
> On Tue, Aug 20, 2024 at 10:11:45AM +0800, Tong Tiangen wrote:
>> 在 2024/8/20 1:29, Mark Rutland 写道:
>>> Hi Tong,
>>>
>>> On Tue, May 28, 2024 at 04:59:11PM +0800, Tong Tiangen wrote:
>>>> For the arm64 kernel, when it processes hardware memory errors for
>>>> synchronize notifications(do_sea()), if the errors is consumed within the
>>>> kernel, the current processing is panic. However, it is not optimal.
>>>>
>>>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>>>> kernel mode, only the associated process is affected. Killing the user
>>>> process and isolating the corrupt page is a better choice.
>>>>
>>>> New fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE is added to identify insn
>>>> that can recover from memory errors triggered by access to kernel memory.
>>>>
>>>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> 
> [...]
> 
>>>> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
>>>> index 980d1dd8e1a3..9c0664fe1eb1 100644
>>>> --- a/arch/arm64/include/asm/asm-extable.h
>>>> +++ b/arch/arm64/include/asm/asm-extable.h
>>>> @@ -5,11 +5,13 @@
>>>>    #include <linux/bits.h>
>>>>    #include <asm/gpr-num.h>
>>>> -#define EX_TYPE_NONE			0
>>>> -#define EX_TYPE_BPF			1
>>>> -#define EX_TYPE_UACCESS_ERR_ZERO	2
>>>> -#define EX_TYPE_KACCESS_ERR_ZERO	3
>>>> -#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
>>>> +#define EX_TYPE_NONE				0
>>>> +#define EX_TYPE_BPF				1
>>>> +#define EX_TYPE_UACCESS_ERR_ZERO		2
>>>> +#define EX_TYPE_KACCESS_ERR_ZERO		3
>>>> +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD		4
>>>> +/* kernel access memory error safe */
>>>> +#define EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE	5
>>>
>>> Could we please use 'MEM_ERR', and likewise for the macros below? That's
>>> more obvious than 'ME_SAFE', and we wouldn't need the comment here.
>>> Likewise elsewhere in this patch and the series.
>>>
>>> To Jonathan's comment, I do prefer these numbers are aligned, so aside
>>> from the naming, the diff above looks good.
>>
>> OK, I also modified other locations to use 'MEM_ERR'.
> 
> Thanks!
> 
> [...]
> 
>>>> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
>>>> index 802231772608..2ac716c0d6d8 100644
>>>> --- a/arch/arm64/lib/copy_to_user.S
>>>> +++ b/arch/arm64/lib/copy_to_user.S
>>>> @@ -20,7 +20,7 @@
>>>>     *	x0 - bytes not copied
>>>>     */
>>>>    	.macro ldrb1 reg, ptr, val
>>>> -	ldrb  \reg, [\ptr], \val
>>>> +	KERNEL_ME_SAFE(9998f, ldrb  \reg, [\ptr], \val)
>>>>    	.endm
>>>>    	.macro strb1 reg, ptr, val
>>>> @@ -28,7 +28,7 @@
>>>>    	.endm
>>>>    	.macro ldrh1 reg, ptr, val
>>>> -	ldrh  \reg, [\ptr], \val
>>>> +	KERNEL_ME_SAFE(9998f, ldrh  \reg, [\ptr], \val)
>>>>    	.endm
>>>>    	.macro strh1 reg, ptr, val
>>>> @@ -36,7 +36,7 @@
>>>>    	.endm
>>>>    	.macro ldr1 reg, ptr, val
>>>> -	ldr \reg, [\ptr], \val
>>>> +	KERNEL_ME_SAFE(9998f, ldr \reg, [\ptr], \val)
>>>>    	.endm
>>>>    	.macro str1 reg, ptr, val
>>>> @@ -44,7 +44,7 @@
>>>>    	.endm
>>>>    	.macro ldp1 reg1, reg2, ptr, val
>>>> -	ldp \reg1, \reg2, [\ptr], \val
>>>> +	KERNEL_ME_SAFE(9998f, ldp \reg1, \reg2, [\ptr], \val)
>>>>    	.endm
>>>>    	.macro stp1 reg1, reg2, ptr, val
>>>
>>> These changes mean that regular copy_to_user() will handle kernel memory
>>> errors, rather than only doing that in copy_mc_to_user(). If that's
>>> intentional, please call that out explicitly in the commit message.
>>
>> Yes. This is the purpose of the modification. If the copy_to_user()
>> function encounters a memory error, this uaccess affects only the
>> current process. and only need to kill the current process instead of
>> the entire kernel panic. Do not add copy_mc_to_user() so that
>> copy_to_user() can process memory errors.
>>
>> I'll add a description in the commit msg next version.
> 
> Ok; why do powerpc and x86 have separate copy_mc_to_user()
> implementations, then?

Taking x86 as an example:

unsigned long __must_check copy_mc_to_user(...)
{
	unsigned long ret;

	if (copy_mc_fragile_enabled) {
		instrument_copy_to_user(dst, src, len);
		__uaccess_begin();
		ret = copy_mc_fragile((__force void *)dst, src, len);
		__uaccess_end();
		return ret;
	}

	if (static_cpu_has(X86_FEATURE_ERMS)) {
		instrument_copy_to_user(dst, src, len);
		__uaccess_begin();
		ret = copy_mc_enhanced_fast_string((__force void *)dst, src, len);
		__uaccess_end();
		return ret;
	}

	return copy_user_generic((__force void *)dst, src, len);
}

Through checking the source code, I found that "copy_mc_fragile_enabled"
and "X86_FEATURE_ERMS" both rely on the hardware features of x86. I
cannot explain the reasons for the details, but I feel that these are
related to the hardware implementation.


Dan Williams should be able to explain the reason.

Hi Dan:

We need your help:)

Compared to copy_to_user(), copy_mc_to_user() added memory error
handling. My question is why the error handling is not directly
implemented on copy_to_user(), but instead the copy_mc_to_user()
function is added?  Related to hardware features or performance
considerations ?


Thanks,
Tong.

> 
> [...]
> 
>>>> +/*
>>>> + * APEI claimed this as a firmware-first notification.
>>>> + * Some processing deferred to task_work before ret_to_user().
>>>> + */
>>>> +static bool do_apei_claim_sea(struct pt_regs *regs)
>>>> +{
>>>> +	if (user_mode(regs)) {
>>>> +		if (!apei_claim_sea(regs))
>>>> +			return true;
>>>> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
>>>> +		if (fixup_exception_me(regs) && !apei_claim_sea(regs))
>>>> +			return true;
>>>> +	}
>>>> +
>>>> +	return false;
>>>> +}
>>>
>>> Hmm... that'll fixup the exception even if we don't manage to claim a
>>> the SEA. I suspect this should probably be:
>>>
>>> static bool do_apei_claim_sea(struct pt_regs *regs)
>>> {
>>> 	if (apei_claim_sea(regs))
>>> 		return false;
>>> 	if (user_mode(regs))
>>> 		return true;
>>> 	if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
>>> 		return !fixup_excepton_mem_err(regs);
>>> 	
>>> 	return false;
>>> }
>>>
>>> ... unless we *don't* want to claim the SEA in the case we don't have a
>>> fixup?
>>>
>>> Mark.
>>>
>>
>> Yes. My original meaning here is that if not have fixup, panic is
>> performed in do_sea() according to the original logic, and claim sea is
>> not required.
> 
> AFAICT my suggestion doesn't change that; if we don't have a fixup the
> proprosed do_apei_claim_sea() would return false, and so do_sea() would
> caryy on to arm64_notify_die(...).
> 
> I'm specifically asking if we need to avoid calling apei_claim_sea()
> when we don't have a fixup handler, or if calling that would be fine.
> 
> One important thing is that if apei_claim_sea() fails to claim the SEA,
> we'd like to panic(), and in that case it'd be good to have not applied
> the fixup handler, so that the pt_regs::pc shows where the fault was
> taken from.
> 
> Mark.

I roughly understand what you mean. The prerequisite of fixup is sea 
claimed succeed. But the fixup here actually just set the regs->pc, and 
not applied the fixup handler here. If claim sea fails, it will directly 
panic() here without applying the fixup handler.

Thanks,
Tong.

> 
> .

