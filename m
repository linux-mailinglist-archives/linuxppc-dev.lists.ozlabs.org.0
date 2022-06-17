Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id B441C54F3EA
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 11:08:02 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPY986ynRz3cKB
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 19:07:56 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPY8l10w4z30DC
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 19:07:33 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3D6D612FC;
	Fri, 17 Jun 2022 02:07:02 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.39.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27AD3F792;
	Fri, 17 Jun 2022 02:06:58 -0700 (PDT)
Date: Fri, 17 Jun 2022 10:06:54 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 7/8] arm64: add uaccess to machine check safe
Message-ID: <YqxELtYkqQNibHaX@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-8-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528065056.1034168-8-tongtiangen@huawei.com>
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

On Sat, May 28, 2022 at 06:50:55AM +0000, Tong Tiangen wrote:
> If user access fail due to hardware memory error, only the relevant
> processes are affected, so killing the user process and isolate the
> error page with hardware memory errors is a more reasonable choice
> than kernel panic.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

> ---
>  arch/arm64/lib/copy_from_user.S | 8 ++++----
>  arch/arm64/lib/copy_to_user.S   | 8 ++++----

All of these changes are to the *kernel* accesses performed as part of copy
to/from user, and have nothing to do with userspace, so it does not make sense
to mark these as UACCESS.

Do we *actually* need to recover from failues on these accesses? Looking at
_copy_from_user(), the kernel will immediately follow this up with a memset()
to the same address which will be fatal anyway, so this is only punting the
failure for a few instructions.

If we really need to recover from certain accesses to kernel memory we should
add a new EX_TYPE_KACCESS_ERR_ZERO_MC or similar, but we need a strong
rationale as to why that's useful. As things stand I do not beleive it makes
sense for copy to/from user specifically.

>  arch/arm64/mm/extable.c         | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> index 34e317907524..402dd48a4f93 100644
> --- a/arch/arm64/lib/copy_from_user.S
> +++ b/arch/arm64/lib/copy_from_user.S
> @@ -25,7 +25,7 @@
>  	.endm
>  
>  	.macro strb1 reg, ptr, val
> -	strb \reg, [\ptr], \val
> +	USER(9998f, strb \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro ldrh1 reg, ptr, val
> @@ -33,7 +33,7 @@
>  	.endm
>  
>  	.macro strh1 reg, ptr, val
> -	strh \reg, [\ptr], \val
> +	USER(9998f, strh \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro ldr1 reg, ptr, val
> @@ -41,7 +41,7 @@
>  	.endm
>  
>  	.macro str1 reg, ptr, val
> -	str \reg, [\ptr], \val
> +	USER(9998f, str \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro ldp1 reg1, reg2, ptr, val
> @@ -49,7 +49,7 @@
>  	.endm
>  
>  	.macro stp1 reg1, reg2, ptr, val
> -	stp \reg1, \reg2, [\ptr], \val
> +	USER(9998f, stp \reg1, \reg2, [\ptr], \val)
>  	.endm
>  
>  end	.req	x5
> diff --git a/arch/arm64/lib/copy_to_user.S b/arch/arm64/lib/copy_to_user.S
> index 802231772608..4134bdb3a8b0 100644
> --- a/arch/arm64/lib/copy_to_user.S
> +++ b/arch/arm64/lib/copy_to_user.S
> @@ -20,7 +20,7 @@
>   *	x0 - bytes not copied
>   */
>  	.macro ldrb1 reg, ptr, val
> -	ldrb  \reg, [\ptr], \val
> +	USER(9998f, ldrb  \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro strb1 reg, ptr, val
> @@ -28,7 +28,7 @@
>  	.endm
>  
>  	.macro ldrh1 reg, ptr, val
> -	ldrh  \reg, [\ptr], \val
> +	USER(9998f, ldrh  \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro strh1 reg, ptr, val
> @@ -36,7 +36,7 @@
>  	.endm
>  
>  	.macro ldr1 reg, ptr, val
> -	ldr \reg, [\ptr], \val
> +	USER(9998f, ldr \reg, [\ptr], \val)
>  	.endm
>  
>  	.macro str1 reg, ptr, val
> @@ -44,7 +44,7 @@
>  	.endm
>  
>  	.macro ldp1 reg1, reg2, ptr, val
> -	ldp \reg1, \reg2, [\ptr], \val
> +	USER(9998f, ldp \reg1, \reg2, [\ptr], \val)
>  	.endm
>  
>  	.macro stp1 reg1, reg2, ptr, val
> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index c301dcf6335f..8ca8d9639f9f 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -86,10 +86,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
>  	if (!ex)
>  		return false;
>  
> -	/*
> -	 * This is not complete, More Machine check safe extable type can
> -	 * be processed here.
> -	 */
> +	switch (ex->type) {
> +	case EX_TYPE_UACCESS_ERR_ZERO:
> +		return ex_handler_uaccess_err_zero(ex, regs);
> +	}

This addition specifically makes sense to me, so can you split this into a separate patch?

Thanks,
Mark.
