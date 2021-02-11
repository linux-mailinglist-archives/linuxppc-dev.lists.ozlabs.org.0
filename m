Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D68C3185D8
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 08:49:23 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dbpg45z5xzDwmY
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Feb 2021 18:49:20 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=iram.es
 (client-ip=130.206.19.145; helo=mx01.puc.rediris.es;
 envelope-from=paubert@iram.es; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=iram.es header.i=@iram.es header.a=rsa-sha256
 header.s=DKIM header.b=DZcgZrhH; dkim-atps=neutral
Received: from mx01.puc.rediris.es (outbound4mad.lav.puc.rediris.es
 [130.206.19.145])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DbpdT2DzCzDwlV
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Feb 2021 18:47:56 +1100 (AEDT)
Received: from mta-out01.sim.rediris.es (mta-out01.sim.rediris.es
 [130.206.24.43])
 by mx01.puc.rediris.es  with ESMTP id 11B7lT6B003872-11B7lT6D003872
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 11 Feb 2021 08:47:33 +0100
Received: from mta-out01.sim.rediris.es (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPS id 40A923254FBB;
 Thu, 11 Feb 2021 08:47:29 +0100 (CET)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mta-out01.sim.rediris.es (Postfix) with ESMTP id 31CDD3254FBA;
 Thu, 11 Feb 2021 08:47:29 +0100 (CET)
X-Amavis-Modified: Mail body modified (using disclaimer) -
 mta-out01.sim.rediris.es
Received: from mta-out01.sim.rediris.es ([127.0.0.1])
 by localhost (mta-out01.sim.rediris.es [127.0.0.1]) (amavisd-new, port 10026)
 with ESMTP id rXaFOftgOWwa; Thu, 11 Feb 2021 08:47:29 +0100 (CET)
Received: from lt-gp.iram.es (75.red-88-27-245.staticip.rima-tde.net
 [88.27.245.75])
 by mta-out01.sim.rediris.es (Postfix) with ESMTPA id 8A47C3036A81;
 Thu, 11 Feb 2021 08:47:28 +0100 (CET)
Date: Thu, 11 Feb 2021 08:47:23 +0100
From: Gabriel Paubert <paubert@iram.es>
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Subject: Re: [PATCH] powerpc/traps: Declare unrecoverable_exception() as
 __noreturn
Message-ID: <20210211074723.GA16987@lt-gp.iram.es>
References: <f46a01750b1a00c9c43725899c9cf8eb6c6a0587.1613025208.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f46a01750b1a00c9c43725899c9cf8eb6c6a0587.1613025208.git.christophe.leroy@csgroup.eu>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-FE-Policy-ID: 2:8:0:SYSTEM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; d=iram.es; s=DKIM;
 c=relaxed/relaxed; 
 h=date:from:to:cc:subject:message-id:references:mime-version:content-type;
 bh=62bKwosBXY6XmYVjgzD+LnZH4mNcQ/c/3yeRBNQKXKA=;
 b=DZcgZrhHNpyppb7xOAZjzKLK7nMmaIMY2g8VWNKyY6t/u1Xgg2U3LIJlOy80NnWRXif97qsU1kR/
 CrDwLnDAJ/sdg5gOpYffupYGYQLyMkUo9RnZgnitkDakPXqwMrdnp6YusSVRYNVHGoOqktRbLyZD
 36m5FzzfCvgbZbv9Jdr9rldNCs9EUThfxGsdR0DUpiQYCokzC788T4q9oNLxkfQj51l4L1QFm0BW
 hge2m8Bp/TRlT618gNkqa63Mx9Sv+UbswTEdNqSG/m/Y76lSaQJegp5VMmDwp2QFNZQrVTOLKsOg
 FXdlMMp15lhE9Rsb8xtHE5kZxp6oEX2XvBCh/w==
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
Cc: linux-kernel@vger.kernel.org, npiggin@gmail.com,
 Paul Mackerras <paulus@samba.org>, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Feb 11, 2021 at 06:34:43AM +0000, Christophe Leroy wrote:
> unrecoverable_exception() is never expected to return, most callers
> have an infiniteloop in case it returns.
> 
> Ensure it really never returns by terminating it with a BUG(), and
> declare it __no_return.
> 
> It always GCC to really simplify functions calling it. In the exemple below,

s/always/allows ?

(Otherwise I can't parse it.)

> it avoids the stack frame in the likely fast path and avoids code duplication
> for the exit.

Indeed, nice code generation improvement.

> 
> With this patch:
> 
> 	00000348 <interrupt_exit_kernel_prepare>:
> 	 348:	81 43 00 84 	lwz     r10,132(r3)
> 	 34c:	71 48 00 02 	andi.   r8,r10,2
> 	 350:	41 82 00 2c 	beq     37c <interrupt_exit_kernel_prepare+0x34>
> 	 354:	71 4a 40 00 	andi.   r10,r10,16384
> 	 358:	40 82 00 20 	bne     378 <interrupt_exit_kernel_prepare+0x30>
> 	 35c:	80 62 00 70 	lwz     r3,112(r2)
> 	 360:	74 63 00 01 	andis.  r3,r3,1
> 	 364:	40 82 00 28 	bne     38c <interrupt_exit_kernel_prepare+0x44>
> 	 368:	7d 40 00 a6 	mfmsr   r10
> 	 36c:	7c 11 13 a6 	mtspr   81,r0
> 	 370:	7c 12 13 a6 	mtspr   82,r0
> 	 374:	4e 80 00 20 	blr
> 	 378:	48 00 00 00 	b       378 <interrupt_exit_kernel_prepare+0x30>

Infinite loop (seems to be on test of MSR_PR)?

	Gabriel

> 	 37c:	94 21 ff f0 	stwu    r1,-16(r1)
> 	 380:	7c 08 02 a6 	mflr    r0
> 	 384:	90 01 00 14 	stw     r0,20(r1)
> 	 388:	48 00 00 01 	bl      388 <interrupt_exit_kernel_prepare+0x40>
> 				388: R_PPC_REL24	unrecoverable_exception
> 	 38c:	38 e2 00 70 	addi    r7,r2,112
> 	 390:	3d 00 00 01 	lis     r8,1
> 	 394:	7c c0 38 28 	lwarx   r6,0,r7
> 	 398:	7c c6 40 78 	andc    r6,r6,r8
> 	 39c:	7c c0 39 2d 	stwcx.  r6,0,r7
> 	 3a0:	40 a2 ff f4 	bne     394 <interrupt_exit_kernel_prepare+0x4c>
> 	 3a4:	38 60 00 01 	li      r3,1
> 	 3a8:	4b ff ff c0 	b       368 <interrupt_exit_kernel_prepare+0x20>
> 
> Without this patch:
> 
> 	00000348 <interrupt_exit_kernel_prepare>:
> 	 348:	94 21 ff f0 	stwu    r1,-16(r1)
> 	 34c:	93 e1 00 0c 	stw     r31,12(r1)
> 	 350:	7c 7f 1b 78 	mr      r31,r3
> 	 354:	81 23 00 84 	lwz     r9,132(r3)
> 	 358:	71 2a 00 02 	andi.   r10,r9,2
> 	 35c:	41 82 00 34 	beq     390 <interrupt_exit_kernel_prepare+0x48>
> 	 360:	71 29 40 00 	andi.   r9,r9,16384
> 	 364:	40 82 00 28 	bne     38c <interrupt_exit_kernel_prepare+0x44>
> 	 368:	80 62 00 70 	lwz     r3,112(r2)
> 	 36c:	74 63 00 01 	andis.  r3,r3,1
> 	 370:	40 82 00 3c 	bne     3ac <interrupt_exit_kernel_prepare+0x64>
> 	 374:	7d 20 00 a6 	mfmsr   r9
> 	 378:	7c 11 13 a6 	mtspr   81,r0
> 	 37c:	7c 12 13 a6 	mtspr   82,r0
> 	 380:	83 e1 00 0c 	lwz     r31,12(r1)
> 	 384:	38 21 00 10 	addi    r1,r1,16
> 	 388:	4e 80 00 20 	blr
> 	 38c:	48 00 00 00 	b       38c <interrupt_exit_kernel_prepare+0x44>
> 	 390:	7c 08 02 a6 	mflr    r0
> 	 394:	90 01 00 14 	stw     r0,20(r1)
> 	 398:	48 00 00 01 	bl      398 <interrupt_exit_kernel_prepare+0x50>
> 				398: R_PPC_REL24	unrecoverable_exception
> 	 39c:	80 01 00 14 	lwz     r0,20(r1)
> 	 3a0:	81 3f 00 84 	lwz     r9,132(r31)
> 	 3a4:	7c 08 03 a6 	mtlr    r0
> 	 3a8:	4b ff ff b8 	b       360 <interrupt_exit_kernel_prepare+0x18>
> 	 3ac:	39 02 00 70 	addi    r8,r2,112
> 	 3b0:	3d 40 00 01 	lis     r10,1
> 	 3b4:	7c e0 40 28 	lwarx   r7,0,r8
> 	 3b8:	7c e7 50 78 	andc    r7,r7,r10
> 	 3bc:	7c e0 41 2d 	stwcx.  r7,0,r8
> 	 3c0:	40 a2 ff f4 	bne     3b4 <interrupt_exit_kernel_prepare+0x6c>
> 	 3c4:	38 60 00 01 	li      r3,1
> 	 3c8:	4b ff ff ac 	b       374 <interrupt_exit_kernel_prepare+0x2c>
> 
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  arch/powerpc/include/asm/interrupt.h | 2 +-
>  arch/powerpc/kernel/interrupt.c      | 1 -
>  arch/powerpc/kernel/traps.c          | 2 ++
>  3 files changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index dcff30e3919b..fa8bfb91f8df 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -411,7 +411,7 @@ DECLARE_INTERRUPT_HANDLER(altivec_assist_exception);
>  DECLARE_INTERRUPT_HANDLER(CacheLockingException);
>  DECLARE_INTERRUPT_HANDLER(SPEFloatingPointException);
>  DECLARE_INTERRUPT_HANDLER(SPEFloatingPointRoundException);
> -DECLARE_INTERRUPT_HANDLER(unrecoverable_exception);
> +DECLARE_INTERRUPT_HANDLER(unrecoverable_exception) __noreturn;
>  DECLARE_INTERRUPT_HANDLER(WatchdogException);
>  DECLARE_INTERRUPT_HANDLER(kernel_bad_stack);
>  
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index eca3be36c18c..7e7106641ca9 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -440,7 +440,6 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>  	return ret;
>  }
>  
> -void unrecoverable_exception(struct pt_regs *regs);
>  void preempt_schedule_irq(void);
>  
>  notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 2afa05ad21c8..1ff776e9e8e3 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -2173,6 +2173,8 @@ DEFINE_INTERRUPT_HANDLER(unrecoverable_exception)
>  	pr_emerg("Unrecoverable exception %lx at %lx (msr=%lx)\n",
>  		 regs->trap, regs->nip, regs->msr);
>  	die("Unrecoverable exception", regs, SIGABRT);
> +	/* die() should not return */
> +	BUG();
>  }
>  NOKPROBE_SYMBOL(unrecoverable_exception);
>  
> -- 
> 2.25.0
> 
 

