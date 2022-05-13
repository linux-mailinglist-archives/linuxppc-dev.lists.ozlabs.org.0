Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED882526656
	for <lists+linuxppc-dev@lfdr.de>; Fri, 13 May 2022 17:40:28 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L0CXB5sTnz3cLZ
	for <lists+linuxppc-dev@lfdr.de>; Sat, 14 May 2022 01:40:26 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=arm.com
 (client-ip=217.140.110.172; helo=foss.arm.com;
 envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by lists.ozlabs.org (Postfix) with ESMTP id 4L0CWn4sjnz3bqR
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 14 May 2022 01:40:04 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9CF5B113E;
 Fri, 13 May 2022 08:39:33 -0700 (PDT)
Received: from lakrids (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CC80A3F73D;
 Fri, 13 May 2022 08:39:30 -0700 (PDT)
Date: Fri, 13 May 2022 16:39:28 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v4 6/7] arm64: add {get, put}_user to machine check
 safe
Message-ID: <Yn57sGpZPo90EXkE@lakrids>
References: <20220420030418.3189040-1-tongtiangen@huawei.com>
 <20220420030418.3189040-7-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220420030418.3189040-7-tongtiangen@huawei.com>
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
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Guohanjun <guohanjun@huawei.com>,
 Will Deacon <will@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Xie XiuQi <xiexiuqi@huawei.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org,
 James Morse <james.morse@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Apr 20, 2022 at 03:04:17AM +0000, Tong Tiangen wrote:
> Add {get, put}_user() to machine check safe.
> 
> If get/put fail due to hardware memory error, only the relevant processes
> are affected, so killing the user process and isolate the user page with
> hardware memory errors is a more reasonable choice than kernel panic.
> 
> Add new extable type EX_TYPE_UACCESS_MC_ERR_ZERO which can be used for
> uaccess that can be recovered from hardware memory errors. The difference
> from EX_TYPE_UACCESS_MC is that this type also sets additional two target
> register which save error code and value needs to be set zero.

Why does this need to be in any way distinct from the existing
EX_TYPE_UACCESS_ERR_ZERO ?

Other than the case where we currently (ab)use that for
copy_{to,from}_kernel_nofault(), where do we *not* want to use
EX_TYPE_UACCESS_ERR_ZERO and *not* recover from a memory error?

Thanks,
Mark.

> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/include/asm/asm-extable.h | 14 ++++++++++++++
>  arch/arm64/include/asm/uaccess.h     |  4 ++--
>  arch/arm64/mm/extable.c              |  4 ++++
>  3 files changed, 20 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index 75b2c00e9523..80410899a9ad 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -13,6 +13,7 @@
>  
>  /* _MC indicates that can fixup from machine check errors */
>  #define EX_TYPE_UACCESS_MC		5
> +#define EX_TYPE_UACCESS_MC_ERR_ZERO	6
>  
>  #ifdef __ASSEMBLY__
>  
> @@ -78,6 +79,15 @@
>  #define EX_DATA_REG(reg, gpr)						\
>  	"((.L__gpr_num_" #gpr ") << " __stringify(EX_DATA_REG_##reg##_SHIFT) ")"
>  
> +#define _ASM_EXTABLE_UACCESS_MC_ERR_ZERO(insn, fixup, err, zero)		\
> +	__DEFINE_ASM_GPR_NUMS							\
> +	__ASM_EXTABLE_RAW(#insn, #fixup,					\
> +			  __stringify(EX_TYPE_UACCESS_MC_ERR_ZERO),		\
> +			  "("							\
> +			    EX_DATA_REG(ERR, err) " | "				\
> +			    EX_DATA_REG(ZERO, zero)				\
> +			  ")")
> +
>  #define _ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, zero)		\
>  	__DEFINE_ASM_GPR_NUMS						\
>  	__ASM_EXTABLE_RAW(#insn, #fixup, 				\
> @@ -90,6 +100,10 @@
>  #define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)			\
>  	_ASM_EXTABLE_UACCESS_ERR_ZERO(insn, fixup, err, wzr)
>  
> +
> +#define _ASM_EXTABLE_UACCESS_MC_ERR(insn, fixup, err)			\
> +	_ASM_EXTABLE_UACCESS_MC_ERR_ZERO(insn, fixup, err, wzr)
> +
>  #define EX_DATA_REG_DATA_SHIFT	0
>  #define EX_DATA_REG_DATA	GENMASK(4, 0)
>  #define EX_DATA_REG_ADDR_SHIFT	5
> diff --git a/arch/arm64/include/asm/uaccess.h b/arch/arm64/include/asm/uaccess.h
> index e8dce0cc5eaa..e41b47df48b0 100644
> --- a/arch/arm64/include/asm/uaccess.h
> +++ b/arch/arm64/include/asm/uaccess.h
> @@ -236,7 +236,7 @@ static inline void __user *__uaccess_mask_ptr(const void __user *ptr)
>  	asm volatile(							\
>  	"1:	" load "	" reg "1, [%2]\n"			\
>  	"2:\n"								\
> -	_ASM_EXTABLE_UACCESS_ERR_ZERO(1b, 2b, %w0, %w1)			\
> +	_ASM_EXTABLE_UACCESS_MC_ERR_ZERO(1b, 2b, %w0, %w1)		\
>  	: "+r" (err), "=&r" (x)						\
>  	: "r" (addr))
>  
> @@ -325,7 +325,7 @@ do {									\
>  	asm volatile(							\
>  	"1:	" store "	" reg "1, [%2]\n"			\
>  	"2:\n"								\
> -	_ASM_EXTABLE_UACCESS_ERR(1b, 2b, %w0)				\
> +	_ASM_EXTABLE_UACCESS_MC_ERR(1b, 2b, %w0)			\
>  	: "+r" (err)							\
>  	: "r" (x), "r" (addr))
>  
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 525876c3ebf4..1023ccdb2f89 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -88,6 +88,7 @@ bool fixup_exception(struct pt_regs *regs)
>  	case EX_TYPE_BPF:
>  		return ex_handler_bpf(ex, regs);
>  	case EX_TYPE_UACCESS_ERR_ZERO:
> +	case EX_TYPE_UACCESS_MC_ERR_ZERO:
>  		return ex_handler_uaccess_err_zero(ex, regs);
>  	case EX_TYPE_LOAD_UNALIGNED_ZEROPAD:
>  		return ex_handler_load_unaligned_zeropad(ex, regs);
> @@ -107,6 +108,9 @@ bool fixup_exception_mc(struct pt_regs *regs)
>  	switch (ex->type) {
>  	case EX_TYPE_UACCESS_MC:
>  		return ex_handler_uaccess_type(ex, regs, FIXUP_TYPE_MC);
> +	case EX_TYPE_UACCESS_MC_ERR_ZERO:
> +		return ex_handler_uaccess_err_zero(ex, regs);
> +
>  	}
>  
>  	return false;
> -- 
> 2.25.1
> 
