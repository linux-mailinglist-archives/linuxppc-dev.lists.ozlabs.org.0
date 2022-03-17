Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 346AA4DC7D6
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Mar 2022 14:46:55 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KK7jT09lmz3bWb
	for <lists+linuxppc-dev@lfdr.de>; Fri, 18 Mar 2022 00:46:53 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=L9RXvHDW;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KK7hp0SNvz2yK2
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 18 Mar 2022 00:46:18 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=L9RXvHDW; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KK7hj3qgrz4xwC;
 Fri, 18 Mar 2022 00:46:13 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1647524773;
 bh=/QiNyRBH3wfsDma+tXagRhUEVBPzSttunbcsipVe+q0=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=L9RXvHDWz3JSNzSzdBmIKueq6F2USH5OCveWKw+/cra6Qt6Pnn67LNteL8Ywf1TdF
 nkCP3HKLyQ1PFXyaFf5v3rmoroe5bVGgRnk0x4NSkizI5n/Gw2I9m6i6TYBrXa2U9H
 FFbJCvoLkRde9y+qdU5pxQJ2SgNWI3TDdadY+UjdVWlxg8Gzp2MHHe+GYf49YY9XbR
 JVu0YZYs7vUVvY5Q6QiYZI/k7VJkButs3kkA+THW5fFUT8G+ozpLxehMfgJs4uXrxS
 dLaz56oE6ilqkz1x5xd3zHrkRXCVbEojrqYJ/eVlJoz9SNms/a9y+ERAPLhveIllzN
 tsWstndbUwXHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH] powerpc/64/interrupt: Temporarily save PPR on stack
 to fix register corruption due to SLB miss
In-Reply-To: <20220316033235.903657-1-npiggin@gmail.com>
References: <20220316033235.903657-1-npiggin@gmail.com>
Date: Fri, 18 Mar 2022 00:46:08 +1100
Message-ID: <87o8243d5r.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: "Aneesh Kumar K
 . V" <aneesh.kumar@linux.ibm.com>, Michael Neuling <mikey@neuling.org>,
 Michal Suchanek <msuchanek@suse.de>, Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> This is a minimal stable kernel fix for the problem solved by
> 4c2de74cc869 ("powerpc/64: Interrupts save PPR on stack rather than
> thread_struct"). Instead of changing the interrupt stack frame (which
> causes a lot of churn), it moves the PPR value from the PACA save area
> to an unused slot in the stack frame temporarily, and defers saving it
> to thread_struct to later on when it is safe to take SLB misses.

The change log for 4c2de74cc869 doesn't really describe the problem that
well, because it was written as a pre-emptive fix for the SLB-in-C
rewrite.

Here's an attempt:

In commit f384796c4 ("powerpc/mm: Add support for handling > 512TB
address in SLB miss") we added support for using multiple context ids
per process. Previously accessing past the first context id was a fatal
error for the process. With the new support it became non-fatal, and so
the previous "bad_addr_slb" handler was changed to be the
"large_addr_slb" handler.

That handler uses the EXCEPTION_PROLOG_COMMON() macro, which in-turn
calls the SAVE_PPR() macro. At the point where SAVE_PPR() is used, the
r9-13 register values from the original user fault are saved in
paca->exslb. It's not until later in EXCEPTION_PROLOG_COMMON_2() that
they are saved from paca->exslb onto the kernel stack.

The PPR is saved into current->thread.ppr, which is notably not on the
kernel stack the way pt_regs are. This means we can take an SLB miss on
current->thread.ppr. If that happens in the "large_addr_slb" case we
will clobber the saved user r9-r13 in paca->exslb with kernel values.
Later we will save those clobbered values into the pt_regs on the stack,
and when we return to userspace those kernel values will be restored.

Typically this appears as some sort of segfault in userspace, with an
address that looks like a kernel address. In dmesg it can appear as:

  [19117.440331] some_program[1869625]: unhandled signal 11 at c00000000f6bda10 nip 00007fff780d559c lr 00007fff781ae56c code 30001

The upstream fix for this issue was to move PPR into pt_regs, on the
kernel stack, avoiding the possibility of an SLB fault when saving it.

However changing the size of pt_regs is an intrusive change, and has
side effects in other parts of the kernel. A minimal fix is to
temporarily save the PPR in an unused part of pt_regs, then save the
user register values from paca->exslb into pt_regs, and then move the
saved PPR into thread.ppr.

cheers

> Upstream kernels between 4.17-4.20 have this bug, so I propose this
> patch for 4.19 stable.
>
> Fixes: f384796c4 ("powerpc/mm: Add support for handling > 512TB address in SLB miss")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>  arch/powerpc/include/asm/exception-64s.h | 22 ++++++++++++++++++----
>  1 file changed, 18 insertions(+), 4 deletions(-)
>
> diff --git a/arch/powerpc/include/asm/exception-64s.h b/arch/powerpc/include/asm/exception-64s.h
> index 35fb5b11955a..f0424c6fdeca 100644
> --- a/arch/powerpc/include/asm/exception-64s.h
> +++ b/arch/powerpc/include/asm/exception-64s.h
> @@ -243,10 +243,22 @@
>   * PPR save/restore macros used in exceptions_64s.S
>   * Used for P7 or later processors
>   */
> -#define SAVE_PPR(area, ra, rb)						\
> +#define SAVE_PPR(area, ra)						\
> +BEGIN_FTR_SECTION_NESTED(940)						\
> +	ld	ra,area+EX_PPR(r13);	/* Read PPR from paca */	\
> +	std	ra,RESULT(r1);		/* Store PPR in RESULT for now */ \
> +END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
> +
> +/*
> + * This is called after we are finished accessing 'area', so we can now take
> + * SLB faults accessing the thread struct, which will use PACA_EXSLB area.
> + * This is required because the large_addr_slb handler uses EXSLB and it also
> + * uses the common exception macros including this PPR saving.
> + */
> +#define MOVE_PPR_TO_THREAD(ra, rb)					\
>  BEGIN_FTR_SECTION_NESTED(940)						\
>  	ld	ra,PACACURRENT(r13);					\
> -	ld	rb,area+EX_PPR(r13);	/* Read PPR from paca */	\
> +	ld	rb,RESULT(r1);		/* Read PPR from stack */	\
>  	std	rb,TASKTHREADPPR(ra);					\
>  END_FTR_SECTION_NESTED(CPU_FTR_HAS_PPR,CPU_FTR_HAS_PPR,940)
>
> @@ -515,9 +527,11 @@ END_FTR_SECTION_NESTED(ftr,ftr,943)
>  3:	EXCEPTION_PROLOG_COMMON_1();					   \
>  	beq	4f;			/* if from kernel mode		*/ \
>  	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10);				   \
> -	SAVE_PPR(area, r9, r10);					   \
> +	SAVE_PPR(area, r9);						   \
>  4:	EXCEPTION_PROLOG_COMMON_2(area)					   \
> -	EXCEPTION_PROLOG_COMMON_3(n)					   \
> +	beq	5f;			/* if from kernel mode		*/ \
> +	MOVE_PPR_TO_THREAD(r9, r10);					   \
> +5:	EXCEPTION_PROLOG_COMMON_3(n)					   \
>  	ACCOUNT_STOLEN_TIME
>
>  /* Save original regs values from save area to stack frame. */
> --
> 2.23.0
