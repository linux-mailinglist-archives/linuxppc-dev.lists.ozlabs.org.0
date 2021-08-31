Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F79C3FCDC1
	for <lists+linuxppc-dev@lfdr.de>; Tue, 31 Aug 2021 21:47:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Gzd4S3G3Jz2ymZ
	for <lists+linuxppc-dev@lfdr.de>; Wed,  1 Sep 2021 05:47:04 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=KPnVgyVh;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=nathan@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=k20201202 header.b=KPnVgyVh; 
 dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4Gzd3l094Nz2xXL
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  1 Sep 2021 05:46:27 +1000 (AEST)
Received: by mail.kernel.org (Postfix) with ESMTPSA id CAD9960FC3;
 Tue, 31 Aug 2021 19:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1630439184;
 bh=PyNkkVj1FtkBNKwq/0/RnvD7p0sFQxysf+dr6PUIhjU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KPnVgyVhBg07g5BBa6mdR2FJKIsnW2sUVhDbSyPNe6ImDQSIcKabi30wMNewGs6C7
 GlA0oDffBlXwwnHafeG2REY/1rSQalrych2kgIZnmJnuEF9Cny3NbN5jSD21PneThZ
 OAQNNs8iaPGEVC5eQ9aL4QkBIsESzIw90jqsJxK1j9EOmVyUuAbPKAHhIV7zGL+JrV
 SOkTIAQp7EZm9BEtVBp6L3+OXxX8IYTGwZnZJqJJbC48VHIfdJE8uD92iGJMzff38x
 REhXSZ8NAipV9DrR1DXJPQldLlPGauNgZFrDxbfbItqZYWNRjE/5az9YKauRSohDDv
 rlEp1877oLYPw==
Date: Tue, 31 Aug 2021 12:46:21 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH] powerpc/bug: Cast to unsigned long before passing to
 inline asm
Message-ID: <YS6HDZ/XMY6HT4It@Ryzen-9-3900X.localdomain>
References: <20210831132720.881643-1-mpe@ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210831132720.881643-1-mpe@ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Aug 31, 2021 at 11:27:20PM +1000, Michael Ellerman wrote:
> In commit 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to
> WARN_ON/__WARN_FLAGS() with asm goto") we changed WARN_ON(). Previously
> it would take the warning condition, x, and double negate it before
> converting the result to int, and passing that int to the underlying
> inline asm. ie:
> 
>   #define WARN_ON(x) ({
>   	int __ret_warn_on = !!(x);
>   	if (__builtin_constant_p(__ret_warn_on)) {
>   	...
>   	} else {
>   		BUG_ENTRY(PPC_TLNEI " %4, 0",
>   			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
>   			  "r" (__ret_warn_on));
> 
> The asm then does a full register width comparison with zero and traps
> if it is non-zero (PPC_TLNEI).
> 
> The new code instead passes the full expression, x, with some unknown
> type, to the inline asm:
> 
>   #define WARN_ON(x) ({
> 	...
> 	do {
> 		if (__builtin_constant_p((x))) {
> 		...
> 		} else {
> 			...
> 			WARN_ENTRY(PPC_TLNEI " %4, 0",
> 				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),
> 				   __label_warn_on, "r" (x));
> 
> This was not seen to cause any issues with GCC, however with clang in at
> least one case it leads to a WARN_ON() that fires incorrectly and
> repeatedly at boot, as reported[1] by Nathan:
> 
>   WARNING: CPU: 0 PID: 1 at lib/klist.c:62 .klist_add_tail+0x3c/0x110
>   Modules linked in:
>   CPU: 0 PID: 1 Comm: swapper/0 Tainted: G        W         5.14.0-rc7-next-20210825 #1
>   NIP:  c0000000007ff81c LR: c00000000090a038 CTR: 0000000000000000
>   REGS: c0000000073c32a0 TRAP: 0700   Tainted: G        W          (5.14.0-rc7-next-20210825)
>   MSR:  8000000002029032 <SF,VEC,EE,ME,IR,DR,RI>  CR: 22000a40  XER: 00000000
>   CFAR: c00000000090a034 IRQMASK: 0
>   GPR00: c00000000090a038 c0000000073c3540 c000000001be3200 0000000000000001
>   GPR04: c0000000072d65c0 0000000000000000 c0000000091ba798 c0000000091bb0a0
>   GPR08: 0000000000000001 0000000000000000 c000000008581918 fffffffffffffc00
>   GPR12: 0000000044000240 c000000001dd0000 c000000000012300 0000000000000000
>   GPR16: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR20: 0000000000000000 0000000000000000 0000000000000000 0000000000000000
>   GPR24: 0000000000000000 c0000000017e3200 0000000000000000 c000000001a0e778
>   GPR28: c0000000072d65b0 c0000000072d65a8 c000000007de72c8 c0000000073c35d0
>   NIP .klist_add_tail+0x3c/0x110
>   LR  .bus_add_driver+0x148/0x290
>   Call Trace:
>     0xc0000000073c35d0 (unreliable)
>     .bus_add_driver+0x148/0x290
>     .driver_register+0xb8/0x190
>     .__hid_register_driver+0x70/0xd0
>     .redragon_driver_init+0x34/0x58
>     .do_one_initcall+0x130/0x3b0
>     .do_initcall_level+0xd8/0x188
>     .do_initcalls+0x7c/0xdc
>     .kernel_init_freeable+0x178/0x21c
>     .kernel_init+0x34/0x220
>     .ret_from_kernel_thread+0x58/0x60
>   Instruction dump:
>   fba10078 7c7d1b78 38600001 fb810070 3b9d0008 fbc10080 7c9e2378 389d0018
>   fb9d0008 fb9d0010 90640000 fbdd0000 <0b1e0000> e87e0018 28230000 41820024
> 
> The instruction dump shows that we are trapping because r30 is not zero:
>   tdnei   r30,0
> 
> Where r30 = c000000007de72c8
> 
> The WARN_ON() comes from:
> 
>   static void knode_set_klist(struct klist_node *knode, struct klist *klist)
>   {
>   	knode->n_klist = klist;
>   	/* no knode deserves to start its life dead */
>   	WARN_ON(knode_dead(knode));
>   		^^^^^^^^^^^^^^^^^
> 
> Where:
> 
>   #define KNODE_DEAD		1LU
> 
>   static bool knode_dead(struct klist_node *knode)
>   {
>   	return (unsigned long)knode->n_klist & KNODE_DEAD;
>   }
> 
> The full disassembly shows that the compiler has not generated any code
> to apply the "& KNODE_DEAD" to the n_klist pointer, which is surprising.
> 
> Nathan filed an LLVM bug [2], in which Eli Friedman explained that "if
> you pass a value of a type that's narrower than a register to an inline
> asm, the high bits are undefined". In this case we are passing a bool
> to the inline asm, which is a single bit value, and so the compiler
> thinks it can leave the high bits of r30 unmasked, because only the
> value of bit 0 matters.
> 
> Because the inline asm compares the full width of the register (32 or
> 64-bit) we need to ensure the value passed to the inline asm has all
> bits defined. So fix it by casting to long.
> 
> We also already cast to long for the similar case in BUG_ENTRY(), which
> it turns out was added to fix a similar bug in 2005 in commit
> 32818c2eb6b8 ("[PATCH] ppc64: Fix issue with gcc 4.0 compiled kernels").
> 
> [1]: http://lore.kernel.org/r/YSa1O4fcX1nNKqN/@Ryzen-9-3900X.localdomain
> [2]: https://bugs.llvm.org/show_bug.cgi?id=51634
> 
> Fixes: 1e688dd2a3d6 ("powerpc/bug: Provide better flexibility to WARN_ON/__WARN_FLAGS() with asm goto")
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Tested-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  arch/powerpc/include/asm/bug.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 1ee0f22313ee..02c08d1492f8 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -119,7 +119,8 @@ __label_warn_on:						\
>  								\
>  			WARN_ENTRY(PPC_TLNEI " %4, 0",		\
>  				   BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
> -				   __label_warn_on, "r" (x));	\
> +				   __label_warn_on,		\
> +				   "r" ((__force long)(x)));	\
>  			break;					\
>  __label_warn_on:						\
>  			__ret_warn_on = true;			\
> 
> -- 
> 2.25.1
