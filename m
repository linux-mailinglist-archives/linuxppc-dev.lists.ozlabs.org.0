Return-Path: <linuxppc-dev+bounces-196-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97FA5957B8F
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:43:25 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Wnv0W1ZgKz2xWt;
	Tue, 20 Aug 2024 12:43:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.32
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.32; helo=szxga06-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Wnv0T6njDz2xTl
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:43:17 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Wnty50Fljz1xvWx;
	Tue, 20 Aug 2024 10:41:17 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id E88B7180044;
	Tue, 20 Aug 2024 10:43:10 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:43:09 +0800
Message-ID: <1e5036b9-9e3f-e68d-ef09-6fa693a9c42c@huawei.com>
Date: Tue, 20 Aug 2024 10:43:08 +0800
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
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
CC: Mark Rutland <mark.rutland@arm.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Andrew Morton
	<akpm@linux-foundation.org>, James Morse <james.morse@arm.com>, Robin Murphy
	<robin.murphy@arm.com>, Andrey Konovalov <andreyknvl@gmail.com>, Dmitry
 Vyukov <dvyukov@google.com>, Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Alexander Potapenko
	<glider@google.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, Aneesh
 Kumar K.V <aneesh.kumar@kernel.org>, "Naveen N. Rao"
	<naveen.n.rao@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo
 Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, Dave Hansen
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, "H. Peter Anvin"
	<hpa@zytor.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mm@kvack.org>, <linuxppc-dev@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, <wangkefeng.wang@huawei.com>, Guohanjun
	<guohanjun@huawei.com>
References: <20240528085915.1955987-1-tongtiangen@huawei.com>
 <20240528085915.1955987-3-tongtiangen@huawei.com>
 <20240819113032.000042af@Huawei.com>
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <20240819113032.000042af@Huawei.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemm600017.china.huawei.com (7.193.23.234)



在 2024/8/19 18:30, Jonathan Cameron 写道:
> On Tue, 28 May 2024 16:59:11 +0800
> Tong Tiangen <tongtiangen@huawei.com> wrote:
> 
>> For the arm64 kernel, when it processes hardware memory errors for
>> synchronize notifications(do_sea()), if the errors is consumed within the
>> kernel, the current processing is panic. However, it is not optimal.
>>
>> Take copy_from/to_user for example, If ld* triggers a memory error, even in
>> kernel mode, only the associated process is affected. Killing the user
>> process and isolating the corrupt page is a better choice.
>>
>> New fixup type EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE is added to identify insn
>> that can recover from memory errors triggered by access to kernel memory.
>>
>> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> 
> Hi - this is going slow :(
> 
> A few comments inline in the meantime but this really needs ARM maintainers
> to take a (hopefully final) look.
> 
> Jonathan
> 
> 
>> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
>> index 980d1dd8e1a3..9c0664fe1eb1 100644
>> --- a/arch/arm64/include/asm/asm-extable.h
>> +++ b/arch/arm64/include/asm/asm-extable.h
>> @@ -5,11 +5,13 @@
>>   #include <linux/bits.h>
>>   #include <asm/gpr-num.h>
>>   
>> -#define EX_TYPE_NONE			0
>> -#define EX_TYPE_BPF			1
>> -#define EX_TYPE_UACCESS_ERR_ZERO	2
>> -#define EX_TYPE_KACCESS_ERR_ZERO	3
>> -#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
>> +#define EX_TYPE_NONE				0
>> +#define EX_TYPE_BPF				1
>> +#define EX_TYPE_UACCESS_ERR_ZERO		2
>> +#define EX_TYPE_KACCESS_ERR_ZERO		3
>> +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD		4
>> +/* kernel access memory error safe */
>> +#define EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE	5
> 
> Does anyone care enough about the alignment to bother realigning for one
> long line? I'd be tempted not to bother, but up to maintainers.
> 
> 
>> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
>> index 802231772608..2ac716c0d6d8 100644
>> --- a/arch/arm64/lib/copy_to_user.S
>> +++ b/arch/arm64/lib/copy_to_user.S
>> @@ -20,7 +20,7 @@
>>    *	x0 - bytes not copied
>>    */
>>   	.macro ldrb1 reg, ptr, val
>> -	ldrb  \reg, [\ptr], \val
>> +	KERNEL_ME_SAFE(9998f, ldrb  \reg, [\ptr], \val)
>>   	.endm
>>   
>>   	.macro strb1 reg, ptr, val
>> @@ -28,7 +28,7 @@
>>   	.endm
>>   
>>   	.macro ldrh1 reg, ptr, val
>> -	ldrh  \reg, [\ptr], \val
>> +	KERNEL_ME_SAFE(9998f, ldrh  \reg, [\ptr], \val)
>>   	.endm
>>   
>>   	.macro strh1 reg, ptr, val
>> @@ -36,7 +36,7 @@
>>   	.endm
>>   
>>   	.macro ldr1 reg, ptr, val
>> -	ldr \reg, [\ptr], \val
>> +	KERNEL_ME_SAFE(9998f, ldr \reg, [\ptr], \val)
>>   	.endm
>>   
>>   	.macro str1 reg, ptr, val
>> @@ -44,7 +44,7 @@
>>   	.endm
>>   
>>   	.macro ldp1 reg1, reg2, ptr, val
>> -	ldp \reg1, \reg2, [\ptr], \val
>> +	KERNEL_ME_SAFE(9998f, ldp \reg1, \reg2, [\ptr], \val)
>>   	.endm
>>   
>>   	.macro stp1 reg1, reg2, ptr, val
>> @@ -64,7 +64,7 @@ SYM_FUNC_START(__arch_copy_to_user)
>>   9997:	cmp	dst, dstin
>>   	b.ne	9998f
>>   	// Before being absolutely sure we couldn't copy anything, try harder
>> -	ldrb	tmp1w, [srcin]
>> +KERNEL_ME_SAFE(9998f, ldrb	tmp1w, [srcin])
> 
> Alignment looks off?

Hi, Jonathan:

How about we change this in conjunction with mark's suggestion? :)

> 
>>   USER(9998f, sttrb tmp1w, [dst])
>>   	add	dst, dst, #1
>>   9998:	sub	x0, end, dst			// bytes not copied
> 
> 
> 
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 451ba7cbd5ad..2dc65f99d389 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -708,21 +708,32 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>   	return 1; /* "fault" */
>>   }
>>   
>> +/*
>> + * APEI claimed this as a firmware-first notification.
>> + * Some processing deferred to task_work before ret_to_user().
>> + */
>> +static bool do_apei_claim_sea(struct pt_regs *regs)
>> +{
>> +	if (user_mode(regs)) {
>> +		if (!apei_claim_sea(regs))
> 
> I'd keep to the the (apei_claim_sea(regs) == 0)
> used in the original code. That hints to the reader that we are
> interested here in an 'error' code rather than apei_claim_sea() returning
> a bool.   I initially wondered why we return true when the code
> fails to claim it.
> 
> Also, perhaps if you return 0 for success and an error code if not
> you could just make this
> 
> 	if (user_mode(regs))
> 		return apei_claim_sea(regs);
> 
> 	if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
> 		if (fixup_exception_me(regs)) {
> 			return apei_claim_sea(regs);
> 		}
> 	}
> 
> 	return false;
> 
> or maybe even (I may have messed this up, but I think this logic
> works).
> 
> 	if (!user_mode(regs) && IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
> 		if (!fixup_exception_me(regs))
> 			return false;
> 	}
> 	return apei_claim_sea(regs);
> 
> 
>> +			return true;
>> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
>> +		if (fixup_exception_me(regs) && !apei_claim_sea(regs))
> 
> Same here with using apei_claim_sea(regs) == 0 so it's obvious we
> are checking for an error, not a boolean.
> 
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>>   static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>>   {
>>   	const struct fault_info *inf;
>>   	unsigned long siaddr;
>>   
>> -	inf = esr_to_fault_info(esr);
>> -
>> -	if (user_mode(regs) && apei_claim_sea(regs) == 0) {
>> -		/*
>> -		 * APEI claimed this as a firmware-first notification.
>> -		 * Some processing deferred to task_work before ret_to_user().
>> -		 */
>> +	if (do_apei_claim_sea(regs))
> 
> It might be made sense to factor this out first, then could be reviewed
> as a noop before the new stuff is added.  Still it's not much code, so doesn't
> really matter.
> Might be worth keeping to returning 0 for success, error code
> otherwise as per apei_claim_sea(regs)
> 
> The bool returning functions in the nearby code tend to be is_xxxx
> not things that succeed or not.
> 
> If you change it to return int make this
> 	if (do_apei_claim_sea(regs) == 0)
> so it's obvious this is the no error case.
> 

My fault, treating the return value of apei_claim_sea() as bool has
caused some confusion. Perhaps using "== 0" can reduce this confuse.

Here's the change:

	static int do_apei_claim_sea(struct pt_regs *regs)
	{
		if (!user_mode(regs) && IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
			if (!fixup_exception_me(regs)))
				return -ENOENT;
		}
		
		return apei_claim_sea(regs);
	}
	
	static int do_sea(...)
	{
		[...]
		if (do_apei_claim_sea(regs) == 0)
			return 0;
		[...]
	}

I'll modify it later with the comments of mark.

Thanks,
Tong.


>>   		return 0;
>> -	}
>>   
>> +	inf = esr_to_fault_info(esr);
>>   	if (esr & ESR_ELx_FnV) {
>>   		siaddr = 0;
>>   	} else {
> 
> .

