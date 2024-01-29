Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C978841152
	for <lists+linuxppc-dev@lfdr.de>; Mon, 29 Jan 2024 18:54:04 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNwsQ4TfNz3cYH
	for <lists+linuxppc-dev@lfdr.de>; Tue, 30 Jan 2024 04:54:02 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=lists.ozlabs.org)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4TNws10cLhz3byP
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 30 Jan 2024 04:53:40 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 719E5DA7;
	Mon, 29 Jan 2024 09:44:36 -0800 (PST)
Received: from FVFF77S0Q05N (unknown [10.57.48.128])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A2B13F738;
	Mon, 29 Jan 2024 09:43:48 -0800 (PST)
Date: Mon, 29 Jan 2024 17:43:24 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Tong Tiangen <tongtiangen@huawei.com>
Subject: Re: [PATCH v10 3/6] arm64: add uaccess to machine check safe
Message-ID: <ZbfjvD1_yKK6IVVY@FVFF77S0Q05N>
References: <20240129134652.4004931-1-tongtiangen@huawei.com>
 <20240129134652.4004931-4-tongtiangen@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240129134652.4004931-4-tongtiangen@huawei.com>
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

On Mon, Jan 29, 2024 at 09:46:49PM +0800, Tong Tiangen wrote:
> If user process access memory fails due to hardware memory error, only the
> relevant processes are affected, so it is more reasonable to kill the user
> process and isolate the corrupt page than to panic the kernel.
> 
> Signed-off-by: Tong Tiangen <tongtiangen@huawei.com>
> ---
>  arch/arm64/lib/copy_from_user.S | 10 +++++-----
>  arch/arm64/lib/copy_to_user.S   | 10 +++++-----
>  arch/arm64/mm/extable.c         |  8 ++++----
>  3 files changed, 14 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm64/lib/copy_from_user.S b/arch/arm64/lib/copy_from_user.S
> index 34e317907524..1bf676e9201d 100644
> --- a/arch/arm64/lib/copy_from_user.S
> +++ b/arch/arm64/lib/copy_from_user.S
> @@ -25,7 +25,7 @@
>  	.endm
>  
>  	.macro strb1 reg, ptr, val
> -	strb \reg, [\ptr], \val
> +	USER(9998f, strb \reg, [\ptr], \val)
>  	.endm

This is a store to *kernel* memory, not user memory. It should not be marked
with USER().

I understand that you *might* want to handle memory errors on these stores, but
the commit message doesn't describe that and the associated trade-off. For
example, consider that when a copy_form_user fails we'll try to zero the
remaining buffer via memset(); so if a STR* instruction in copy_to_user
faulted, upon handling the fault we'll immediately try to fix that up with some
more stores which will also fault, but won't get fixed up, leading to a panic()
anyway...

Further, this change will also silently fixup unexpected kernel faults if we
pass bad kernel pointers to copy_{to,from}_user, which will hide real bugs.

So NAK to this change as-is; likewise for the addition of USER() to other ldr*
macros in copy_from_user.S and the addition of USER() str* macros in
copy_to_user.S.

If we want to handle memory errors on some kaccesses, we need a new EX_TYPE_*
separate from the usual EX_TYPE_KACESS_ERR_ZERO that means "handle memory
errors, but treat other faults as fatal". That should come with a rationale and
explanation of why it's actually useful.

[...]

> diff --git a/arch/arm64/mm/extable.c b/arch/arm64/mm/extable.c
> index 478e639f8680..28ec35e3d210 100644
> --- a/arch/arm64/mm/extable.c
> +++ b/arch/arm64/mm/extable.c
> @@ -85,10 +85,10 @@ bool fixup_exception_mc(struct pt_regs *regs)
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

Please fold this part into the prior patch, and start ogf with *only* handling
errors on accesses already marked with EX_TYPE_UACCESS_ERR_ZERO. I think that
change would be relatively uncontroversial, and it would be much easier to
build atop that.

Thanks,
Mark.
