Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D55D54F2C9
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:25:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXCd0Qm9z3cfy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:25:01 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXC83FNbz3bkP
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:24:34 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A3DD12FC;
	Fri, 17 Jun 2022 01:24:02 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.39.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 78B383F792;
	Fri, 17 Jun 2022 01:23:58 -0700 (PDT)
Date: Fri, 17 Jun 2022 09:23:50 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 1/8] arm64: extable: add new extable type
 EX_TYPE_KACCESS_ERR_ZERO support
Message-ID: <Yqw6Fh+b9hBx9VbB@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-2-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528065056.1034168-2-tongtiangen@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org, Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>, Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>, Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>, Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org, Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org, James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, May 28, 2022 at 06:50:49AM +0000, Tong Tiangen wrote:
> Currently, The extable type EX_TYPE_UACCESS_ERR_ZERO is used by
> __get/put_kernel_nofault(), but those helpers are not uaccess type, so we
> add a new extable type EX_TYPE_KACCESS_ERR_ZERO which can be used by
> __get/put_kernel_no_fault().
> 
> This is also to prepare for distinguishing the two types in machine check
> safe process.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

This looks good to me, so modulo one nit below:

Acked-by: Mark Rutland <mark.rutland@arm.com>

> ---
>  arch/arm64/include/asm/asm-extable.h | 13 ++++
>  arch/arm64/include/asm/uaccess.h     | 94 ++++++++++++++--------------
>  arch/arm64/mm/extable.c              |  1 +
>  3 files changed, 61 insertions(+), 47 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index c39f2437e08e..56ebe183e78b 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -7,6 +7,7 @@
>  #define EX_TYPE_BPF			2
>  #define EX_TYPE_UACCESS_ERR_ZERO	3
>  #define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	4
> +#define EX_TYPE_KACCESS_ERR_ZERO	5

Could we please renumber this so the UACCESS and KACCESS definitions are next
to one another, i.e.

#define EX_TYPE_BPF			2
#define EX_TYPE_UACCESS_ERR_ZERO	3
#define EX_TYPE_KACCESS_ERR_ZERO	4
#define EX_TYPE_LOAD_UNALIGNED_ZEROPAD	5

Thanks,
Mark.

>  
>  #ifdef __ASSEMBLY__
>  
> @@ -73,9 +74,21 @@
>  			    EX_DATA_REG(ZERO, zero)			\
>  			  ")")
>  
> +#define _ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, zero)		\
> +	__DEFINE_ASM_GPR_NUMS						\
> +	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
> +			  __stringify(EX_TYPE_KACCESS_ERR_ZERO),	\
> +			  "("						\
> +			    EX_DATA_REG(ERR, err) " | "			\
> +			    EX_DATA_REG(ZERO, zero)			\
> +			  ")")
> +
>  #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
>  	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, wzr)
>  
> +#define _ASM_EXTABLE_KACCESS_ERR(insn, fixup, err)			\
> +	_ASM_EXTABLE_KACCESS_ERR_ZERO(insn, fixup, err, wzr)
> +
>  #define EX_DATA_REG_DATA_SHIFT	0
>  #define EX_DATA_REG_DATA	GENMASK(4, 0)
>  #define EX_DATA_REG_ADDR_SHIFT	5
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index 63f9c828f1a7..2fc9f0861769 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -232,34 +232,34 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>   * The "__xxx_error" versions set the third argument to -EFAULT if an error
>   * occurs, and leave it unchanged on success.
>   */
> -#define __get_mem_asm(load, reg, x, addr, err)				\
> +#define __get_mem_asm(load, reg, x, addr, err, type)			\
>  	asm volatile(							\
>  	"1:	" load "	" reg "1, [%2]\n"			\
>  	"2:\n"								\
> -	_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %w0, %w1)			\
> +	_ASM_EXTABLE_##type##ACCESS_ERR_ZERO(1b, 2b, %w0, %w1)		\
>  	: "+r" (err), "=&r" (x)						\
>  	: "r" (addr))
>  
> -#define __raw_get_mem(ldr, x, ptr, err)					\
> -do {									\
> -	unsigned long __gu_val;						\
> -	switch (sizeof(*(ptr))) {					\
> -	case 1:								\
> -		__get_mem_asm(ldr "b", "%w", __gu_val, (ptr), (err));	\
> -		break;							\
> -	case 2:								\
> -		__get_mem_asm(ldr "h", "%w", __gu_val, (ptr), (err));	\
> -		break;							\
> -	case 4:								\
> -		__get_mem_asm(ldr, "%w", __gu_val, (ptr), (err));	\
> -		break;							\
> -	case 8:								\
> -		__get_mem_asm(ldr, "%x",  __gu_val, (ptr), (err));	\
> -		break;							\
> -	default:							\
> -		BUILD_BUG();						\
> -	}								\
> -	(x) = (__force __typeof__(*(ptr)))__gu_val;			\
> +#define __raw_get_mem(ldr, x, ptr, err, type)					\
> +do {										\
> +	unsigned long __gu_val;							\
> +	switch (sizeof(*(ptr))) {						\
> +	case 1:									\
> +		__get_mem_asm(ldr "b", "%w", __gu_val, (ptr), (err), type);	\
> +		break;								\
> +	case 2:									\
> +		__get_mem_asm(ldr "h", "%w", __gu_val, (ptr), (err), type);	\
> +		break;								\
> +	case 4:									\
> +		__get_mem_asm(ldr, "%w", __gu_val, (ptr), (err), type);		\
> +		break;								\
> +	case 8:									\
> +		__get_mem_asm(ldr, "%x",  __gu_val, (ptr), (err), type);	\
> +		break;								\
> +	default:								\
> +		BUILD_BUG();							\
> +	}									\
> +	(x) = (__force __typeof__(*(ptr)))__gu_val;				\
>  } while (0)
>  
>  /*
> @@ -274,7 +274,7 @@ do {									\
>  	__chk_user_ptr(ptr);						\
>  									\
>  	uaccess_ttbr0_enable();						\
> -	__raw_get_mem("ldtr", __rgu_val, __rgu_ptr, err);		\
> +	__raw_get_mem("ldtr", __rgu_val, __rgu_ptr, err, U);		\
>  	uaccess_ttbr0_disable();					\
>  									\
>  	(x) = __rgu_val;						\
> @@ -314,40 +314,40 @@ do {									\
>  									\
>  	__uaccess_enable_tco_async();					\
>  	__raw_get_mem("ldr", *((type *)(__gkn_dst)),			\
> -		      (__force type *)(__gkn_src), __gkn_err);		\
> +		      (__force type *)(__gkn_src), __gkn_err, K);	\
>  	__uaccess_disable_tco_async();					\
>  									\
>  	if (unlikely(__gkn_err))					\
>  		goto err_label;						\
>  } while (0)
>  
> -#define __put_mem_asm(store, reg, x, addr, err)				\
> +#define __put_mem_asm(store, reg, x, addr, err, type)			\
>  	asm volatile(							\
>  	"1:	" store "	" reg "1, [%2]\n"			\
>  	"2:\n"								\
> -	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
> +	_ASM_EXTABLE_##type##ACCESS_ERR(1b, 2b, %w0)			\
>  	: "+r" (err)							\
>  	: "r" (x), "r" (addr))
>  
> -#define __raw_put_mem(str, x, ptr, err)					\
> -do {									\
> -	__typeof__(*(ptr)) __pu_val = (x);				\
> -	switch (sizeof(*(ptr))) {					\
> -	case 1:								\
> -		__put_mem_asm(str "b", "%w", __pu_val, (ptr), (err));	\
> -		break;							\
> -	case 2:								\
> -		__put_mem_asm(str "h", "%w", __pu_val, (ptr), (err));	\
> -		break;							\
> -	case 4:								\
> -		__put_mem_asm(str, "%w", __pu_val, (ptr), (err));	\
> -		break;							\
> -	case 8:								\
> -		__put_mem_asm(str, "%x", __pu_val, (ptr), (err));	\
> -		break;							\
> -	default:							\
> -		BUILD_BUG();						\
> -	}								\
> +#define __raw_put_mem(str, x, ptr, err, type)					\
> +do {										\
> +	__typeof__(*(ptr)) __pu_val = (x);					\
> +	switch (sizeof(*(ptr))) {						\
> +	case 1:									\
> +		__put_mem_asm(str "b", "%w", __pu_val, (ptr), (err), type);	\
> +		break;								\
> +	case 2:									\
> +		__put_mem_asm(str "h", "%w", __pu_val, (ptr), (err), type);	\
> +		break;								\
> +	case 4:									\
> +		__put_mem_asm(str, "%w", __pu_val, (ptr), (err), type);		\
> +		break;								\
> +	case 8:									\
> +		__put_mem_asm(str, "%x", __pu_val, (ptr), (err), type);		\
> +		break;								\
> +	default:								\
> +		BUILD_BUG();							\
> +	}									\
>  } while (0)
>  
>  /*
> @@ -362,7 +362,7 @@ do {									\
>  	__chk_user_ptr(__rpu_ptr);					\
>  									\
>  	uaccess_ttbr0_enable();						\
> -	__raw_put_mem("sttr", __rpu_val, __rpu_ptr, err);		\
> +	__raw_put_mem("sttr", __rpu_val, __rpu_ptr, err, U);		\
>  	uaccess_ttbr0_disable();					\
>  } while (0)
>  
> @@ -400,7 +400,7 @@ do {									\
>  									\
>  	__uaccess_enable_tco_async();					\
>  	__raw_put_mem("str", *((type *)(__pkn_src)),			\
> -		      (__force type *)(__pkn_dst), __pkn_err);		\
> +		      (__force type *)(__pkn_dst), __pkn_err, K);	\
>  	__uaccess_disable_tco_async();					\
>  									\
>  	if (unlikely(__pkn_err))					\
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 489455309695..056591e5ca80 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -77,6 +77,7 @@ bool fixup_exception(struct pt_regs *regs)
>  	case EX_TYPE_BPF:
>  		return ex_handler_bpf(ex, regs);
>  	case EX_TYPE_UACCESS_ERR_ZERO:
> +	case EX_TYPE_KACCESS_ERR_ZERO:
>  		return ex_handler_uaccess_err_zero(ex, regs);
>  	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
>  		return ex_handler_load_unaligned_zeropad(ex, regs);
> -- 
> 2.25.1
> 
