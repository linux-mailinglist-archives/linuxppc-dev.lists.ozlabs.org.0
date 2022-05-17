Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CD3C52A1F3
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 14:49:07 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L2bXd37BJz3c9v
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 22:49:05 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=QiiFptg0;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L2bX31WkFz3bhK
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 22:48:35 +1000 (AEST)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=QiiFptg0; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4L2bX221Lwz4xZ2;
 Tue, 17 May 2022 22:48:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1652791714;
 bh=TDeqjo10z/lPZ0BTlKdpVqFzl6dlu8tIpR5fp3YJtjE=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=QiiFptg0D+ihDZM7seo2f+wYINfaOQNzMLR2VUHUpdeOE9fgLMzgZG8P6+JxAZ/EZ
 s9p7+wdZZVWhxWP+MfhjuHYudBMb/UAx8dzeYhWd0diY2cArjEdh5wsZzEkYcX3cmb
 9tJUCVSHBHPpqLwbQMheLzEZzX3kcPFW+b2JIDzYWKapSFKpzGd+wnGbLMsx7cEGCO
 Hu1/l2PeemupH2wtS6DrVtVfhQwkPHPgYNkC5ukyXdHX2iahKgUglygE2HH9PgOKVL
 WNDGK6AT5tNxuDYULhkA/m1akdKYydLpFO1S65TSHdqOjwwz4zeVE6uLGr9aq/XGTC
 R4Ly3ybYFX18Q==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Christophe Leroy <christophe.leroy@csgroup.eu>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>
Subject: Re: [PATCH] powerpc/irq: Remove arch_local_irq_restore() for
 !CONFIG_CC_HAS_ASM_GOTO
In-Reply-To: <58df50c9e77e2ed945bacdead30412770578886b.1652715336.git.christophe.leroy@csgroup.eu>
References: <58df50c9e77e2ed945bacdead30412770578886b.1652715336.git.christophe.leroy@csgroup.eu>
Date: Tue, 17 May 2022 22:48:32 +1000
Message-ID: <871qwspbof.fsf@mpe.ellerman.id.au>
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
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Christophe Leroy <christophe.leroy@csgroup.eu> writes:
> All supported versions of GCC support asm goto.

I thought clang was the one that only recently added support for asm
goto.

<looks>

Apparently clang added support in 2019, in clang 9. The earliest clang
we claim to support is 11.

So this patch is good, I'll just adjust the change log to say GCC/clang.

cheers

> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index c768cde03e36..dd09919c3c66 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -216,7 +216,6 @@ static inline void replay_soft_interrupts_irqrestore(void)
>  #define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
>  #endif
>  
> -#ifdef CONFIG_CC_HAS_ASM_GOTO
>  notrace void arch_local_irq_restore(unsigned long mask)
>  {
>  	unsigned char irq_happened;
> @@ -312,82 +311,6 @@ notrace void arch_local_irq_restore(unsigned long mask)
>  	__hard_irq_enable();
>  	preempt_enable();
>  }
> -#else
> -notrace void arch_local_irq_restore(unsigned long mask)
> -{
> -	unsigned char irq_happened;
> -
> -	/* Write the new soft-enabled value */
> -	irq_soft_mask_set(mask);
> -	if (mask)
> -		return;
> -
> -	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> -		WARN_ON_ONCE(in_nmi() || in_hardirq());
> -
> -	/*
> -	 * From this point onward, we can take interrupts, preempt,
> -	 * etc... unless we got hard-disabled. We check if an event
> -	 * happened. If none happened, we know we can just return.
> -	 *
> -	 * We may have preempted before the check below, in which case
> -	 * we are checking the "new" CPU instead of the old one. This
> -	 * is only a problem if an event happened on the "old" CPU.
> -	 *
> -	 * External interrupt events will have caused interrupts to
> -	 * be hard-disabled, so there is no problem, we
> -	 * cannot have preempted.
> -	 */
> -	irq_happened = get_irq_happened();
> -	if (!irq_happened) {
> -		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> -			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
> -		return;
> -	}
> -
> -	/* We need to hard disable to replay. */
> -	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
> -		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> -			WARN_ON_ONCE(!(mfmsr() & MSR_EE));
> -		__hard_irq_disable();
> -		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> -	} else {
> -		/*
> -		 * We should already be hard disabled here. We had bugs
> -		 * where that wasn't the case so let's dbl check it and
> -		 * warn if we are wrong. Only do that when IRQ tracing
> -		 * is enabled as mfmsr() can be costly.
> -		 */
> -		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
> -			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
> -				__hard_irq_disable();
> -		}
> -
> -		if (irq_happened == PACA_IRQ_HARD_DIS) {
> -			local_paca->irq_happened = 0;
> -			__hard_irq_enable();
> -			return;
> -		}
> -	}
> -
> -	/*
> -	 * Disable preempt here, so that the below preempt_enable will
> -	 * perform resched if required (a replayed interrupt may set
> -	 * need_resched).
> -	 */
> -	preempt_disable();
> -	irq_soft_mask_set(IRQS_ALL_DISABLED);
> -	trace_hardirqs_off();
> -
> -	replay_soft_interrupts_irqrestore();
> -	local_paca->irq_happened = 0;
> -
> -	trace_hardirqs_on();
> -	irq_soft_mask_set(IRQS_ENABLED);
> -	__hard_irq_enable();
> -	preempt_enable();
> -}
> -#endif
>  EXPORT_SYMBOL(arch_local_irq_restore);
>  
>  /*
> -- 
> 2.35.1
