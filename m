Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BB654F2CE
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:25:45 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXDR4MMlz3dQK
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:25:43 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXD26d14z3bfH
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:25:22 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA8681474;
	Fri, 17 Jun 2022 01:24:50 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.39.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A6193F792;
	Fri, 17 Jun 2022 01:24:47 -0700 (PDT)
Date: Fri, 17 Jun 2022 09:24:44 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 2/8] arm64: extable: make uaaccess helper use
 extable type EX_TYPE_UACCESS_ERR_ZERO
Message-ID: <Yqw6TP3MhEqnQ+2o@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-3-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528065056.1034168-3-tongtiangen@huawei.com>
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

On Sat, May 28, 2022 at 06:50:50AM +0000, Tong Tiangen wrote:
> Currnetly, the extable type used by __arch_copy_from/to_user() is
> EX_TYPE_FIXUP. In fact, It is more clearly to use meaningful
> EX_TYPE_UACCESS_*.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/include/asm/asm-extable.h |  8 ++++++++
>  arch/arm64/include/asm/asm-uaccess.h | 12 ++++++------
>  2 files changed, 14 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index 56ebe183e78b..9c94ac1f082c 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -28,6 +28,14 @@
>  	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_FIXUP, 0)
>  	.endm
>  
> +/*
> + * Create an exception table entry for uaccess `insn`, which will branch to `fixup`
> + * when an unhandled fault is taken.
> + * ex->data = ~0 means both reg_err and reg_zero is set to wzr(x31).
> + */
> +	.macro          _asm_extable_uaccess, insn, fixup
> +	__ASM_EXTABLE_RAW(\insn, \fixup, EX_TYPE_UACCESS_ERR_ZERO, ~0)
> +	.endm

I'm not too keen on using `~0` here, since that also sets other bits in the
data field, and its somewhat opaque.

How painful is it to generate the data fields as with the C version of this
macro, so that we can pass in wzr explciitly for the two sub-fields?

Other than that, this looks good to me.

Thanks,
Mark.

>  /*
>   * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
>   * do nothing.
> diff --git a/arch/arm64/include/asm/asm-uaccess.h b/arch/arm64/include/asm/asm-uaccess.h
> index 0557af834e03..75b211c98dea 100644
> --- a/arch/arm64/include/asm/asm-uaccess.h
> +++ b/arch/arm64/include/asm/asm-uaccess.h
> @@ -61,7 +61,7 @@ alternative_else_nop_endif
>  
>  #define USER(l, x...)				\
>  9999:	x;					\
> -	_asm_extable	9999b, l
> +	_asm_extable_uaccess	9999b, l
>  
>  /*
>   * Generate the assembly for LDTR/STTR with exception table entries.
> @@ -73,8 +73,8 @@ alternative_else_nop_endif
>  8889:		ldtr	\reg2, [\addr, #8];
>  		add	\addr, \addr, \post_inc;
>  
> -		_asm_extable	8888b,\l;
> -		_asm_extable	8889b,\l;
> +		_asm_extable_uaccess	8888b, \l;
> +		_asm_extable_uaccess	8889b, \l;
>  	.endm
>  
>  	.macro user_stp l, reg1, reg2, addr, post_inc
> @@ -82,14 +82,14 @@ alternative_else_nop_endif
>  8889:		sttr	\reg2, [\addr, #8];
>  		add	\addr, \addr, \post_inc;
>  
> -		_asm_extable	8888b,\l;
> -		_asm_extable	8889b,\l;
> +		_asm_extable_uaccess	8888b,\l;
> +		_asm_extable_uaccess	8889b,\l;
>  	.endm
>  
>  	.macro user_ldst l, inst, reg, addr, post_inc
>  8888:		\inst		\reg, [\addr];
>  		add		\addr, \addr, \post_inc;
>  
> -		_asm_extable	8888b,\l;
> +		_asm_extable_uaccess	8888b, \l;
>  	.endm
>  #endif
> -- 
> 2.25.1
> 
