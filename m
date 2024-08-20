Return-Path: <linuxppc-dev+bounces-193-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F046B957B59
	for <lists+linuxppc-dev@lfdr.de>; Tue, 20 Aug 2024 04:12:06 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4WntJM562bz2xwD;
	Tue, 20 Aug 2024 12:12:03 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.188
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.188; helo=szxga02-in.huawei.com; envelope-from=tongtiangen@huawei.com; receiver=lists.ozlabs.org)
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4WntJK3c10z2xtp
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 20 Aug 2024 12:11:56 +1000 (AEST)
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4WntGL6b8rzpTPR;
	Tue, 20 Aug 2024 10:10:18 +0800 (CST)
Received: from kwepemm600017.china.huawei.com (unknown [7.193.23.234])
	by mail.maildlp.com (Postfix) with ESMTPS id 38859140133;
	Tue, 20 Aug 2024 10:11:48 +0800 (CST)
Received: from [10.174.179.234] (10.174.179.234) by
 kwepemm600017.china.huawei.com (7.193.23.234) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 20 Aug 2024 10:11:46 +0800
Message-ID: <4436d172-c474-8ecd-b5e4-4c21088baf49@huawei.com>
Date: Tue, 20 Aug 2024 10:11:45 +0800
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
To: Mark Rutland <mark.rutland@arm.com>
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
From: Tong Tiangen <tongtiangen@huawei.com>
In-Reply-To: <ZsOA8WD_5Sp0DJhS@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.179.234]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemm600017.china.huawei.com (7.193.23.234)



在 2024/8/20 1:29, Mark Rutland 写道:
> Hi Tong,
> 
> On Tue, May 28, 2024 at 04:59:11PM +0800, Tong Tiangen wrote:
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
> Generally this looks ok, but I have a couple of comments below.
> 
>> ---
>>   arch/arm64/Kconfig                   |  1 +
>>   arch/arm64/include/asm/asm-extable.h | 31 +++++++++++++++++++++++-----
>>   arch/arm64/include/asm/asm-uaccess.h |  4 ++++
>>   arch/arm64/include/asm/extable.h     |  1 +
>>   arch/arm64/lib/copy_to_user.S        | 10 ++++-----
>>   arch/arm64/mm/extable.c              | 19 +++++++++++++++++
>>   arch/arm64/mm/fault.c                | 27 +++++++++++++++++-------
>>   7 files changed, 75 insertions(+), 18 deletions(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 5d91259ee7b5..13ca06ddf3dd 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -20,6 +20,7 @@ config ARM64
>>   	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
>>   	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>>   	select ARCH_HAS_CACHE_LINE_SIZE
>> +	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES
>>   	select ARCH_HAS_CURRENT_STACK_POINTER
>>   	select ARCH_HAS_DEBUG_VIRTUAL
>>   	select ARCH_HAS_DEBUG_VM_PGTABLE
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
> Could we please use 'MEM_ERR', and likewise for the macros below? That's
> more obvious than 'ME_SAFE', and we wouldn't need the comment here.
> Likewise elsewhere in this patch and the series.
> 
> To Jonathan's comment, I do prefer these numbers are aligned, so aside
> from the naming, the diff above looks good.

OK, I also modified other locations to use 'MEM_ERR'.

> 
>>   
>>   /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
>>   #define EX_DATA_REG_ERR_SHIFT	0
>> @@ -51,6 +53,17 @@
>>   #define _ASM_EXTABLE_UACCESS(insn, fixup)				\
>>   	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, wzr, wzr)
>>   
>> +#define _ASM_EXTABLE_KACCESS_ERR_ZERO_ME_SAFE(insn, fixup, err, zero)	\
>> +	__ASM_EXTABLE_RAW(insn, fixup, 					\
>> +			  EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE,		\
>> +			  (						\
>> +			    EX_DATA_REG(ERR, err) |			\
>> +			    EX_DATA_REG(ZERO, zero)			\
>> +			  ))
>> +
>> +#define _ASM_EXTABLE_KACCESS_ME_SAFE(insn, fixup)			\
>> +	_ASM_EXTABLE_KACCESS_ERR_ZERO_ME_SAFE(insn, fixup, wzr, wzr)
>> +
>>   /*
>>    * Create an exception table entry for uaccess `insn`, which will branch to `fixup`
>>    * when an unhandled fault is taken.
>> @@ -69,6 +82,14 @@
>>   	.endif
>>   	.endm
>>   
>> +/*
>> + * Create an exception table entry for kaccess me(memory error) safe `insn`, which
>> + * will branch to `fixup` when an unhandled fault is taken.
>> + */
>> +	.macro          _asm_extable_kaccess_me_safe, insn, fixup
>> +	_ASM_EXTABLE_KACCESS_ME_SAFE(\insn, \fixup)
>> +	.endm
>> +
> 
> With the naming above, I think this can be:
> 
> | /*
> |  * Create an exception table entry for kaccess `insn`, which will branch to
> |  * `fixup` when a memory error is taken
> |  */
> | 	.macro		_asm_extable_kaccess_mem_err, insn, fixup
> | 	_ASM_EXTABLE_KACCESS_MEM_ERR(\insn, \fixup)
> | 	.endm
> 

OK, will be fixed next version.

>>   #else /* __ASSEMBLY__ */
>>   
>>   #include <linux/stringify.h>
>> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
>> index 5b6efe8abeeb..7bbebfa5b710 100644
>> --- a/arch/arm64/include/asm/asm-uaccess.h
>> +++ b/arch/arm64/include/asm/asm-uaccess.h
>> @@ -57,6 +57,10 @@ alternative_else_nop_endif
>>   	.endm
>>   #endif
>>   
>> +#define KERNEL_ME_SAFE(l, x...)			\
>> +9999:	x;					\
>> +	_asm_extable_kaccess_me_safe	9999b, l
>> +
>>   #define USER(l, x...)				\
>>   9999:	x;					\
>>   	_asm_extable_uaccess	9999b, l
>> diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
>> index 72b0e71cc3de..bc49443bc502 100644
>> --- a/arch/arm64/include/asm/extable.h
>> +++ b/arch/arm64/include/asm/extable.h
>> @@ -46,4 +46,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
>>   #endif /* !CONFIG_BPF_JIT */
>>   
>>   bool fixup_exception(struct pt_regs *regs);
>> +bool fixup_exception_me(struct pt_regs *regs);
>>   #endif
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
> 
> These changes mean that regular copy_to_user() will handle kernel memory
> errors, rather than only doing that in copy_mc_to_user(). If that's
> intentional, please call that out explicitly in the commit message.

Yes. This is the purpose of the modification. If the copy_to_user()
function encounters a memory error, this uaccess affects only the
current process. and only need to kill the current process instead of
the entire kernel panic. Do not add copy_mc_to_user() so that
copy_to_user() can process memory errors.

I'll add a description in the commit msg next version.


> 
>> @@ -64,7 +64,7 @@ SYM_FUNC_START(__arch_copy_to_user)
>>   9997:	cmp	dst, dstin
>>   	b.ne	9998f
>>   	// Before being absolutely sure we couldn't copy anything, try harder
>> -	ldrb	tmp1w, [srcin]
>> +KERNEL_ME_SAFE(9998f, ldrb	tmp1w, [srcin])
>>   USER(9998f, sttrb tmp1w, [dst])
>>   	add	dst, dst, #1
>>   9998:	sub	x0, end, dst			// bytes not copied
> 
> Same comment as above.
> 
>> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
>> index 228d681a8715..8c690ae61944 100644
>> --- a/arch/arm64/mm/extable.c
>> +++ b/arch/arm64/mm/extable.c
>> @@ -72,7 +72,26 @@ bool fixup_exception(struct pt_regs *regs)
>>   		return ex_handler_uaccess_err_zero(ex, regs);
>>   	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
>>   		return ex_handler_load_unaligned_zeropad(ex, regs);
>> +	case EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE:
>> +		return false;
>>   	}
>>   
>>   	BUG();
>>   }
>> +
>> +bool fixup_exception_me(struct pt_regs *regs)
>> +{
>> +	const struct exception_table_entry *ex;
>> +
>> +	ex = search_exception_tables(instruction_pointer(regs));
>> +	if (!ex)
>> +		return false;
>> +
>> +	switch (ex->type) {
>> +	case EX_TYPE_UACCESS_ERR_ZERO:
>> +	case EX_TYPE_KACCESS_ERR_ZERO_ME_SAFE:
>> +		return ex_handler_uaccess_err_zero(ex, regs);
>> +	}
>> +
>> +	return false;
>> +}
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
>> +			return true;
>> +	} else if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
>> +		if (fixup_exception_me(regs) && !apei_claim_sea(regs))
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
> 
> Hmm... that'll fixup the exception even if we don't manage to claim a
> the SEA. I suspect this should probably be:
> 
> static bool do_apei_claim_sea(struct pt_regs *regs)
> {
> 	if (apei_claim_sea(regs))
> 		return false;
> 	if (user_mode(regs))
> 		return true;
> 	if (IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC))
> 		return !fixup_excepton_mem_err(regs);
> 	
> 	return false;
> }
> 
> ... unless we *don't* want to claim the SEA in the case we don't have a
> fixup?
> 
> Mark.
> 

Yes. My original meaning here is that if not have fixup, panic is
performed in do_sea() according to the original logic, and claim sea is
not required.

Thanks,
Tong.

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
>>   		return 0;
>> -	}
>>   
>> +	inf = esr_to_fault_info(esr);
>>   	if (esr & ESR_ELx_FnV) {
>>   		siaddr = 0;
>>   	} else {
>> -- 
>> 2.25.1
>>
>>
> 
> .

