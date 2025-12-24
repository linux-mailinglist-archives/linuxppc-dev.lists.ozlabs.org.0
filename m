Return-Path: <linuxppc-dev+bounces-14987-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3803CCDBA25
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 Dec 2025 08:57:37 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dbkkQ6l1Hz2yFd;
	Wed, 24 Dec 2025 18:57:34 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=115.124.30.130
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1766562574;
	cv=none; b=VVPmi47RYwvRWRX1wsUBS4esawsX2mGiI695qAWqgr83kLH0k1Or/6OOAMsBp4Nptb8fsBjMi35q3AOqgHkxMvEpFzd4mjY6FbaJ5n3Qes72e16c8DiSzMbjW12mnTI/ZT3eL0oJKC0reKjKfWEMt3OkE0of2ZWpb9viCbvM/iyOOgrZ8dKhrjfeKGL6bmIWk9fM+L6Gp4WGTbVmsbjoNkyIbS8A7OAhhQ6Kj42I85gfOYF3cFoPVtF+7XKFDQ1Z6ooY1CmiH/Wfuv2tscsQo0dxDLgBANU/QvDfk9nN+eqE88n05+DbLVwm/JBkHwQHip5U9Iyxiy1G80aBqfZtzg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1766562574; c=relaxed/relaxed;
	bh=h0/Sg9vEcVPykAL4iwpmTNn0DtmSkFDaeo8PJsZs1/M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ohVBzpmjC3ARqLi3BCclNI84PWv5mUslqKjcvTv+ycnAFpy4yYt8ysh6yaYxk4OKjr+d+ey2xgihDO+8T8UPLmHR4hTn+XMejka+2rlqtl37Y85hcRLV494qCyixlPJ2FtqRiUDHlk1oftbEM+Rx/wwu4pwYOSlMpUp95LdJsXaWcycM0pK6ZceTn2aB72aEDvODE7QAh5i6cDiKtkazbBZ6H4XJPXU0jAc0qTfFuwZET4IvrT8/IWOeCm2iUiMpqRXNqxpaHeO+W88Ob7V4zdNrJZzZqvlhOuOSO3YRZLyA9KuO5rpKGU4aQNFoXu1uW7MuhJkb61DjwMgiTFXYsQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uDPAUgRK; dkim-atps=neutral; spf=pass (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=tianruidong@linux.alibaba.com; receiver=lists.ozlabs.org) smtp.mailfrom=linux.alibaba.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.a=rsa-sha256 header.s=default header.b=uDPAUgRK;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linux.alibaba.com (client-ip=115.124.30.130; helo=out30-130.freemail.mail.aliyun.com; envelope-from=tianruidong@linux.alibaba.com; receiver=lists.ozlabs.org)
Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dbkY73jbNz2xlM
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 Dec 2025 18:49:29 +1100 (AEDT)
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766562565; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=h0/Sg9vEcVPykAL4iwpmTNn0DtmSkFDaeo8PJsZs1/M=;
	b=uDPAUgRKwsQw2bYt8RL6wcKnBkPEmEIZnBvTtfJmrxkmCZIAwd8qLc5Nkkh197URW5wteqFBj4aD6nBPcYu2UnyNOtr/5LXu0qok17ktvjEGD/IWyWIeAGq1efjZgZ9OpaYmxuknR5Lw9bwqxQLUY7tQGV9KhehwCgAuKR3aUdE=
Received: from 30.221.132.102(mailfrom:tianruidong@linux.alibaba.com fp:SMTPD_---0WvaN3qJ_1766562562 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 24 Dec 2025 15:49:23 +0800
Message-ID: <db72933f-cda7-4196-8e54-73cbefbf1a26@linux.alibaba.com>
Date: Wed, 24 Dec 2025 15:49:21 +0800
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 2/5] arm64: add support for ARCH_HAS_COPY_MC
To: Tong Tiangen <tongtiangen@huawei.com>, Mark Rutland
 <mark.rutland@arm.com>, Jonathan Cameron <Jonathan.Cameron@Huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, James Morse
 <james.morse@arm.com>, Robin Murphy <robin.murphy@arm.com>,
 Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>,
 Vincenzo Frascino <vincenzo.frascino@arm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Alexander Potapenko <glider@google.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
 linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, wangkefeng.wang@huawei.com,
 Guohanjun <guohanjun@huawei.com>
References: <20241209024257.3618492-1-tongtiangen@huawei.com>
 <20241209024257.3618492-3-tongtiangen@huawei.com>
From: Ruidong Tian <tianruidong@linux.alibaba.com>
In-Reply-To: <20241209024257.3618492-3-tongtiangen@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-15.7 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_IN_DEF_DKIM_WL,
	USER_IN_DEF_SPF_WL autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

Hi Tong:

I applied this path on 6.18 and tested on Kunpeng920, system still alive 
when i inject a error in copy from user context, but I found that user 
application receive a SIGBUS, this action is different with x86 machine 
which return -EFAULT rather than send SIGBUS.

I added a patch to fix this behavior[0]. Feel free to incorporate it 
into your series, or I can send it as a formal follow-up patch, 
whichever you prefer.

[0]: https://github.com/winterddd/linux/tree/arm-copyin

Best regards,
Ruidong

在 2024/12/9 10:42, Tong Tiangen 写道:
> For the arm64 kernel, when it processes hardware memory errors for
> synchronize notifications(do_sea()), if the errors is consumed within the
> kernel, the current processing is panic. However, it is not optimal.
> 
> Take copy_from/to_user for example, If ld* triggers a memory error, even in
> kernel mode, only the associated process is affected. Killing the user
> process and isolating the corrupt page is a better choice.
> 
> Add new fixup type EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR to identify insn
> that can recover from memory errors triggered by access to kernel memory,
> and this fixup type is used in __arch_copy_to_user(), This make the regular
> copy_to_user() will handle kernel memory errors.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>   arch/arm64/Kconfig                   |  1 +
>   arch/arm64/include/asm/asm-extable.h | 31 +++++++++++++++++++++++-----
>   arch/arm64/include/asm/asm-uaccess.h |  4 ++++
>   arch/arm64/include/asm/extable.h     |  1 +
>   arch/arm64/lib/copy_to_user.S        | 10 ++++-----
>   arch/arm64/mm/extable.c              | 19 +++++++++++++++++
>   arch/arm64/mm/fault.c                | 30 ++++++++++++++++++++-------
>   7 files changed, 78 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 100570a048c5..5fa54d31162c 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -21,6 +21,7 @@ config ARM64
>   	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
>   	select ARCH_HAS_CACHE_LINE_SIZE
>   	select ARCH_HAS_CC_PLATFORM
> +	select ARCH_HAS_COPY_MC if ACPI_APEI_GHES
>   	select ARCH_HAS_CURRENT_STACK_POINTER
>   	select ARCH_HAS_DEBUG_VIRTUAL
>   	select ARCH_HAS_DEBUG_VM_PGTABLE
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index b8a5861dc7b7..0f9123efca0a 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -5,11 +5,13 @@
>   #include <linux/bits.h>
>   #include <asm/gpr-num.h>
>   
> -#define EX_TYPE_NONE			0
> -#define EX_TYPE_BPF			1
> -#define EX_TYPE_UACCESS_ERR_ZERO	2
> -#define EX_TYPE_KACCESS_ERR_ZERO	3
> -#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> +#define EX_TYPE_NONE				0
> +#define EX_TYPE_BPF				1
> +#define EX_TYPE_UACCESS_ERR_ZERO		2
> +#define EX_TYPE_KACCESS_ERR_ZERO		3
> +#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD		4
> +/* kernel access memory error safe */
> +#define EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR	5
>   
>   /* Data fields for EX_TYPE_UACCESS_ERR_ZERO */
>   #define EX_DATA_REG_ERR_SHIFT	0
> @@ -51,6 +53,17 @@
>   #define _ASM_EXTABLE_UACCESS(insn, fixup)				\
>   	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, wzr, wzr)
>   
> +#define _ASM_EXTABLE_KACCESS_ERR_ZERO_MEM_ERR(insn, fixup, err, zero)	\
> +	__ASM_EXTABLE_RAW(insn, fixup, 					\
> +			  EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR,		\
> +			  (						\
> +			    EX_DATA_REG(ERR, err) |			\
> +			    EX_DATA_REG(ZERO, zero)			\
> +			  ))
> +
> +#define _ASM_EXTABLE_KACCESS_MEM_ERR(insn, fixup)			\
> +	_ASM_EXTABLE_KACCESS_ERR_ZERO_MEM_ERR(insn, fixup, wzr, wzr)
> +
>   /*
>    * Create an exception table entry for uaccess `insn`, which will branch to `fixup`
>    * when an unhandled fault is taken.
> @@ -69,6 +82,14 @@
>   	.endif
>   	.endm
>   
> +/*
> + * Create an exception table entry for kaccess `insn`, which will branch to
> + * `fixup` when an unhandled fault is taken.
> + */
> +	.macro          _asm_extable_kaccess_mem_err, insn, fixup
> +	_ASM_EXTABLE_KACCESS_MEM_ERR(\insn, \fixup)
> +	.endm
> +
>   #else /* __ASSEMBLY__ */
>   
>   #include <linux/stringify.h>
> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
> index 5b6efe8abeeb..19aa0180f645 100644
> --- a/arch/arm64/include/asm/asm-uaccess.h
> +++ b/arch/arm64/include/asm/asm-uaccess.h
> @@ -57,6 +57,10 @@ alternative_else_nop_endif
>   	.endm
>   #endif
>   
> +#define KERNEL_MEM_ERR(l, x...)			\
> +9999:	x;					\
> +	_asm_extable_kaccess_mem_err	9999b, l
> +
>   #define USER(l, x...)				\
>   9999:	x;					\
>   	_asm_extable_uaccess	9999b, l
> diff --git a/arch/arm64/include/asm/extable.h b/arch/arm64/include/asm/extable.h
> index 72b0e71cc3de..bc49443bc502 100644
> --- a/arch/arm64/include/asm/extable.h
> +++ b/arch/arm64/include/asm/extable.h
> @@ -46,4 +46,5 @@ bool ex_handler_bpf(const struct exception_table_entry *ex,
>   #endif /* !CONFIG_BPF_JIT */
>   
>   bool fixup_exception(struct pt_regs *regs);
> +bool fixup_exception_me(struct pt_regs *regs);
>   #endif
> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 802231772608..bedab1678431 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -20,7 +20,7 @@
>    *	x0 - bytes not copied
>    */
>   	.macro ldrb1 reg, ptr, val
> -	ldrb  \reg, [\ptr], \val
> +	KERNEL_MEM_ERR(9998f, ldrb  \reg, [\ptr], \val)
>   	.endm
>   
>   	.macro strb1 reg, ptr, val
> @@ -28,7 +28,7 @@
>   	.endm
>   
>   	.macro ldrh1 reg, ptr, val
> -	ldrh  \reg, [\ptr], \val
> +	KERNEL_MEM_ERR(9998f, ldrh  \reg, [\ptr], \val)
>   	.endm
>   
>   	.macro strh1 reg, ptr, val
> @@ -36,7 +36,7 @@
>   	.endm
>   
>   	.macro ldr1 reg, ptr, val
> -	ldr \reg, [\ptr], \val
> +	KERNEL_MEM_ERR(9998f, ldr \reg, [\ptr], \val)
>   	.endm
>   
>   	.macro str1 reg, ptr, val
> @@ -44,7 +44,7 @@
>   	.endm
>   
>   	.macro ldp1 reg1, reg2, ptr, val
> -	ldp \reg1, \reg2, [\ptr], \val
> +	KERNEL_MEM_ERR(9998f, ldp \reg1, \reg2, [\ptr], \val)
>   	.endm
>   
>   	.macro stp1 reg1, reg2, ptr, val
> @@ -64,7 +64,7 @@ SYM_FUNC_START(__arch_copy_to_user)
>   9997:	cmp	dst, dstin
>   	b.ne	9998f
>   	// Before being absolutely sure we couldn't copy anything, try harder
> -	ldrb	tmp1w, [srcin]
> +KERNEL_MEM_ERR(9998f, ldrb	tmp1w, [srcin])
>   USER(9998f, sttrb tmp1w, [dst])
>   	add	dst, dst, #1
>   9998:	sub	x0, end, dst			// bytes not copied
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 228d681a8715..9ad2b6473b60 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -72,7 +72,26 @@ bool fixup_exception(struct pt_regs *regs)
>   		return ex_handler_uaccess_err_zero(ex, regs);
>   	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
>   		return ex_handler_load_unaligned_zeropad(ex, regs);
> +	case EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR:
> +		return false;
>   	}
>   
>   	BUG();
>   }
> +
> +bool fixup_exception_me(struct pt_regs *regs)
> +{
> +	const struct exception_table_entry *ex;
> +
> +	ex = search_exception_tables(instruction_pointer(regs));
> +	if (!ex)
> +		return false;
> +
> +	switch (ex->type) {
> +	case EX_TYPE_UACCESS_ERR_ZERO:
> +	case EX_TYPE_KACCESS_ERR_ZERO_MEM_ERR:
> +		return ex_handler_uaccess_err_zero(ex, regs);
> +	}
> +
> +	return false;
> +}
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index ef63651099a9..278e67357f49 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -801,21 +801,35 @@ static int do_bad(unsigned long far, unsigned long esr, struct pt_regs *regs)
>   	return 1; /* "fault" */
>   }
>   
> +/*
> + * APEI claimed this as a firmware-first notification.
> + * Some processing deferred to task_work before ret_to_user().
> + */
> +static int do_apei_claim_sea(struct pt_regs *regs)
> +{
> +	int ret;
> +
> +	ret = apei_claim_sea(regs);
> +	if (ret)
> +		return ret;
> +
> +	if (!user_mode(regs) && IS_ENABLED(CONFIG_ARCH_HAS_COPY_MC)) {
> +		if (!fixup_exception_me(regs))
> +			return -ENOENT;
> +	}
> +
> +	return ret;
> +}
> +
>   static int do_sea(unsigned long far, unsigned long esr, struct pt_regs *regs)
>   {
>   	const struct fault_info *inf;
>   	unsigned long siaddr;
>   
> -	inf = esr_to_fault_info(esr);
> -
> -	if (user_mode(regs) && apei_claim_sea(regs) == 0) {
> -		/*
> -		 * APEI claimed this as a firmware-first notification.
> -		 * Some processing deferred to task_work before ret_to_user().
> -		 */
> +	if (do_apei_claim_sea(regs) == 0)
>   		return 0;
> -	}
>   
> +	inf = esr_to_fault_info(esr);
>   	if (esr & ESR_ELx_FnV) {
>   		siaddr = 0;
>   	} else {


