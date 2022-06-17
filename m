Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5FD154F303
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 10:32:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXNJ5BzDz3c2B
	for <lists+linuxppc-dev@lfdr.de>; Fri, 17 Jun 2022 18:32:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LPXMv6nG1z3bnS
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 17 Jun 2022 18:32:10 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 537851570;
	Fri, 17 Jun 2022 01:31:39 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.39.168])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D02323F792;
	Fri, 17 Jun 2022 01:31:35 -0700 (PDT)
Date: Fri, 17 Jun 2022 09:31:32 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH -next v5 3/8] arm64: extable: move _cond_extable to
 _cond_uaccess_extable
Message-ID: <Yqw75OjpUHb1eYBR@FVFF77S0Q05N>
References: <20220528065056.1034168-1-tongtiangen@huawei.com>
 <20220528065056.1034168-4-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220528065056.1034168-4-tongtiangen@huawei.com>
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

On Sat, May 28, 2022 at 06:50:51AM +0000, Tong Tiangen wrote:
> Currently, We use _cond_extable for cache maintenance uaccess helper
> caches_clean_inval_user_pou(), so this should be moved over to
> EX_TYPE_UACCESS_ERR_ZERO and rename _cond_extable to _cond_uaccess_extable
> for clarity.
> 
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/include/asm/asm-extable.h | 6 +++---
>  arch/arm64/include/asm/assembler.h   | 4 ++--
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/asm-extable.h b/arch/arm64/include/asm/asm-extable.h
> index 9c94ac1f082c..d01bd94cc4c2 100644
> --- a/arch/arm64/include/asm/asm-extable.h
> +++ b/arch/arm64/include/asm/asm-extable.h
> @@ -40,9 +40,9 @@
>   * Create an exception table entry for `insn` if `fixup` is provided. Otherwise
>   * do nothing.
>   */
> -	.macro		_cond_extable, insn, fixup
> -	.ifnc		\fixup,
> -	_asm_extable	\insn, \fixup
> +	.macro		_cond_uaccess_extable, insn, fixup
> +	.ifnc			\fixup,
> +	_asm_extable_uaccess	\insn, \fixup
>  	.endif
>  	.endm
>  
> diff --git a/arch/arm64/include/asm/assembler.h b/arch/arm64/include/asm/assembler.h
> index 8c5a61aeaf8e..dc422fa437c2 100644
> --- a/arch/arm64/include/asm/assembler.h
> +++ b/arch/arm64/include/asm/assembler.h
> @@ -423,7 +423,7 @@ alternative_endif
>  	b.lo	.Ldcache_op\@
>  	dsb	\domain
>  
> -	_cond_extable .Ldcache_op\@, \fixup
> +	_cond_uaccess_extable .Ldcache_op\@, \fixup
>  	.endm
>  
>  /*
> @@ -462,7 +462,7 @@ alternative_endif
>  	dsb	ish
>  	isb
>  
> -	_cond_extable .Licache_op\@, \fixup
> +	_cond_uaccess_extable .Licache_op\@, \fixup
>  	.endm
>  
>  /*
> -- 
> 2.25.1
> 
