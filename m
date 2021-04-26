Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7085E36B963
	for <lists+linuxppc-dev@lfdr.de>; Mon, 26 Apr 2021 20:50:59 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FTYrK3K3yz30GN
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Apr 2021 04:50:57 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=WAxgPwen;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=WAxgPwen; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FTYqt0tFwz2yx4
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Apr 2021 04:50:34 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 225D36103E;
 Mon, 26 Apr 2021 18:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619463031;
 bh=67YQP+YJX5WYLyI5yzALdZrvKq+wBnhXpG37k4FJDM0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAxgPweny/MbsKOkrJ3btl083n/qK/EZREsAOqwQQgPcYid1hiieHlziAY1M/twEs
 9IyeAcpRzazKKeWfuC9FbVqrsAd8mQM4wKGohM5LQO20ZWSEEd8s846oMCzg1aryWD
 pdPe5fOkL98vhMXjM+uQkWNcn6woneRmzJcNVdhLP1a6pvBwNiV6cOjyjxNDy5ubEb
 PCQq5n223V0ew3EIgXMo3b9Gkywv07DwrYtz8uo6Q3UW/rpiwphJZcmrGeqM4T+9tS
 4QO4/uSw11eiOiYz53KzN4jcCVFqD2AJqZnS0IKxmyoBtZA4fhl6bziQ4IilNbNZ1h
 LJAYIEs7+us2Q==
Date: Mon, 26 Apr 2021 11:50:26 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v7] powerpc/irq: Inline call_do_irq() and call_do_softirq()
Message-ID: <YIcLcujmoK6Yet9d@archlinux-ax161>
References: <20210320122227.345427-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210320122227.345427-1-mpe@ellerman.id.au>
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
Cc: clang-built-linux@googlegroups.com, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Sat, Mar 20, 2021 at 11:22:27PM +1100, Michael Ellerman wrote:
> From: Christophe Leroy <christophe.leroy@csgroup.eu>
> 
> call_do_irq() and call_do_softirq() are simple enough to be
> worth inlining.
> 
> Inlining them avoids an mflr/mtlr pair plus a save/reload on stack. It
> also allows GCC to keep the saved ksp_limit in an nonvolatile reg.
> 
> This is inspired from S390 arch. Several other arches do more or
> less the same. The way sparc arch does seems odd thought.
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>
> ---
> 
> v2: no change.
> v3: no change.
> v4:
> - comment reminding the purpose of the inline asm block.
> - added r2 as clobbered reg
> v5:
> - Limiting the change to PPC32 for now.
> - removed r2 from the clobbered regs list (on PPC32 r2 points to current all the time)
> - Removed patch 1 and merged ksp_limit handling in here.
> v6:
> - Rebase on top of merge-test (ca6e327fefb2).
> - Remove the ksp_limit stuff as it's doesn't exist anymore.
> 
> v7:
> mpe:
> - Enable for 64-bit too. This all in-kernel code calling in-kernel
>   code, and must use the kernel TOC.
> - Use named parameters for the inline asm.
> - Reformat inline asm.
> - Mark as always_inline.
> - Drop unused ret from call_do_softirq(), add r3 as clobbered.
> ---
>  arch/powerpc/include/asm/irq.h |  2 --
>  arch/powerpc/kernel/irq.c      | 41 ++++++++++++++++++++++++++++++++++
>  arch/powerpc/kernel/misc_32.S  | 25 ---------------------
>  arch/powerpc/kernel/misc_64.S  | 22 ------------------
>  4 files changed, 41 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/irq.h b/arch/powerpc/include/asm/irq.h
> index f3f264e441a7..b2bd58830430 100644
> --- a/arch/powerpc/include/asm/irq.h
> +++ b/arch/powerpc/include/asm/irq.h
> @@ -53,8 +53,6 @@ extern void *mcheckirq_ctx[NR_CPUS];
>  extern void *hardirq_ctx[NR_CPUS];
>  extern void *softirq_ctx[NR_CPUS];
>  
> -void call_do_softirq(void *sp);
> -void call_do_irq(struct pt_regs *regs, void *sp);
>  extern void do_IRQ(struct pt_regs *regs);
>  extern void __init init_IRQ(void);
>  extern void __do_irq(struct pt_regs *regs);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 5b72abbff96c..260effc0a435 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -667,6 +667,47 @@ static inline void check_stack_overflow(void)
>  	}
>  }
>  
> +static __always_inline void call_do_softirq(const void *sp)
> +{
> +	/* Temporarily switch r1 to sp, call __do_softirq() then restore r1. */
> +	asm volatile (
> +		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
> +		"mr		%%r1, %[sp]		;"
> +		"bl		%[callee]		;"
> +		 PPC_LL "	%%r1, 0(%%r1)		;"
> +		 : // Outputs
> +		 : // Inputs
> +		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
> +		   [callee] "i" (__do_softirq)
> +		 : // Clobbers
> +		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
> +		   "cr7", "r0", "r3", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +		   "r11", "r12"
> +	);
> +}
> +
> +static __always_inline void call_do_irq(struct pt_regs *regs, void *sp)
> +{
> +	register unsigned long r3 asm("r3") = (unsigned long)regs;
> +
> +	/* Temporarily switch r1 to sp, call __do_irq() then restore r1. */
> +	asm volatile (
> +		 PPC_STLU "	%%r1, %[offset](%[sp])	;"
> +		"mr		%%r1, %[sp]		;"
> +		"bl		%[callee]		;"
> +		 PPC_LL "	%%r1, 0(%%r1)		;"
> +		 : // Outputs
> +		   "+r" (r3)
> +		 : // Inputs
> +		   [sp] "b" (sp), [offset] "i" (THREAD_SIZE - STACK_FRAME_OVERHEAD),
> +		   [callee] "i" (__do_irq)
> +		 : // Clobbers
> +		   "lr", "xer", "ctr", "memory", "cr0", "cr1", "cr5", "cr6",
> +		   "cr7", "r0", "r4", "r5", "r6", "r7", "r8", "r9", "r10",
> +		   "r11", "r12"
> +	);
> +}
> +
>  void __do_irq(struct pt_regs *regs)
>  {
>  	unsigned int irq;
> diff --git a/arch/powerpc/kernel/misc_32.S b/arch/powerpc/kernel/misc_32.S
> index acc410043b96..6a076bef2932 100644
> --- a/arch/powerpc/kernel/misc_32.S
> +++ b/arch/powerpc/kernel/misc_32.S
> @@ -27,31 +27,6 @@
>  
>  	.text
>  
> -_GLOBAL(call_do_softirq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
> -	mr	r1,r3
> -	bl	__do_softirq
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	mtlr	r0
> -	blr
> -
> -/*
> - * void call_do_irq(struct pt_regs *regs, void *sp);
> - */
> -_GLOBAL(call_do_irq)
> -	mflr	r0
> -	stw	r0,4(r1)
> -	stwu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
> -	mr	r1,r4
> -	bl	__do_irq
> -	lwz	r1,0(r1)
> -	lwz	r0,4(r1)
> -	mtlr	r0
> -	blr
> -
>  /*
>   * This returns the high 64 bits of the product of two 64-bit numbers.
>   */
> diff --git a/arch/powerpc/kernel/misc_64.S b/arch/powerpc/kernel/misc_64.S
> index 070465825c21..4b761a18a74d 100644
> --- a/arch/powerpc/kernel/misc_64.S
> +++ b/arch/powerpc/kernel/misc_64.S
> @@ -27,28 +27,6 @@
>  
>  	.text
>  
> -_GLOBAL(call_do_softirq)
> -	mflr	r0
> -	std	r0,16(r1)
> -	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r3)
> -	mr	r1,r3
> -	bl	__do_softirq
> -	ld	r1,0(r1)
> -	ld	r0,16(r1)
> -	mtlr	r0
> -	blr
> -
> -_GLOBAL(call_do_irq)
> -	mflr	r0
> -	std	r0,16(r1)
> -	stdu	r1,THREAD_SIZE-STACK_FRAME_OVERHEAD(r4)
> -	mr	r1,r4
> -	bl	__do_irq
> -	ld	r1,0(r1)
> -	ld	r0,16(r1)
> -	mtlr	r0
> -	blr
> -
>  _GLOBAL(__bswapdi2)
>  EXPORT_SYMBOL(__bswapdi2)
>  	srdi	r8,r3,32
> -- 
> 2.25.1
> 

This change caused our ppc44x_defconfig builds to hang when powering
down in QEMU:

https://github.com/ClangBuiltLinux/continuous-integration2/runs/2304364629?check_suite_focus=true#logs

This is probably something with clang given that GCC 10.3.0 works fine
but due to the nature of the change, I have no idea how to tell what is
going wrong. I tried to do some rudimentary debugging with gdb but that
did not really get me anywhere.

The kernel was built with just 'CC=clang' and it is reproducible with
all versions of clang that the kernel supports.

The QEMU invocation is visible at the link above, it is done with our
boot-qemu.sh in this repo, which also houses the rootfs:

https://github.com/ClangBuiltLinux/boot-utils

Happy to provide any other information or debug/test as directed!

Cheers,
Nathan
