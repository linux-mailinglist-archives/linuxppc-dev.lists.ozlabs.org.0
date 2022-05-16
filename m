Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id EADAF528AAF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 16 May 2022 18:37:26 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4L24fX6MYzz3cFr
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 May 2022 02:37:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4L24f33W4wz3bwg
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 May 2022 02:36:57 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4L24dx0k9Qz9svg;
 Mon, 16 May 2022 18:36:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SrXr4dwcnYjQ; Mon, 16 May 2022 18:36:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4L24dw6xFWz9svP;
 Mon, 16 May 2022 18:36:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DFD2C8B76E;
 Mon, 16 May 2022 18:36:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 8tSj-nkQeaNZ; Mon, 16 May 2022 18:36:52 +0200 (CEST)
Received: from [172.25.230.108] (unknown [172.25.230.108])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9DBD08B763;
 Mon, 16 May 2022 18:36:52 +0200 (CEST)
Message-ID: <b807b7ab-8268-728d-6b3a-6b5c0334aaab@csgroup.eu>
Date: Mon, 16 May 2022 18:36:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v4 10/17] powerpc/64: interrupt soft-enable race fix
Content-Language: fr-FR
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210617155116.2167984-1-npiggin@gmail.com>
 <20210617155116.2167984-11-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20210617155116.2167984-11-npiggin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Nick.

Le 17/06/2021 à 17:51, Nicholas Piggin a écrit :
> Prevent interrupt restore from allowing racing hard interrupts going
> ahead of previous soft-pending ones, by using the soft-masked restart
> handler to allow a store to clear the soft-mask while knowing nothing
> is soft-pending.
> 
> This probably doesn't matter much in practice, but it's a simple
> demonstrator / test case to exercise the restart table logic.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/irq.c | 95 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 95 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 72cb45393ef2..8428caf3194e 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -217,6 +217,100 @@ static inline void replay_soft_interrupts_irqrestore(void)
>   #define replay_soft_interrupts_irqrestore() replay_soft_interrupts()
>   #endif
>   
> +#ifdef CONFIG_CC_HAS_ASM_GOTO

Wondering why you added that #ifdef CONFIG_CC_HAS_ASM_GOTO ? In 2021 the 
minimum GCC version was already supporting asm goto and we were already 
using asm goto unconditionnaly in uaccess.


I just sent a patch to remove it.

> +notrace void arch_local_irq_restore(unsigned long mask)
> +{
> +	unsigned char irq_happened;
> +
> +	/* Write the new soft-enabled value if it is a disable */
> +	if (mask) {
> +		irq_soft_mask_set(mask);
> +		return;
> +	}
> +
> +	/*
> +	 * After the stb, interrupts are unmasked and there are no interrupts
> +	 * pending replay. The restart sequence makes this atomic with
> +	 * respect to soft-masked interrupts. If this was just a simple code
> +	 * sequence, a soft-masked interrupt could become pending right after
> +	 * the comparison and before the stb.
> +	 *
> +	 * This allows interrupts to be unmasked without hard disabling, and
> +	 * also without new hard interrupts coming in ahead of pending ones.
> +	 */
> +	asm_volatile_goto(
> +"1:					\n"
> +"		lbz	9,%0(13)	\n"
> +"		cmpwi	9,0		\n"
> +"		bne	%l[happened]	\n"
> +"		stb	9,%1(13)	\n"
> +"2:					\n"
> +		RESTART_TABLE(1b, 2b, 1b)
> +	: : "i" (offsetof(struct paca_struct, irq_happened)),
> +	    "i" (offsetof(struct paca_struct, irq_soft_mask))
> +	: "cr0", "r9"
> +	: happened);
> +
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		WARN_ON_ONCE(!(mfmsr() & MSR_EE));
> +
> +	return;
> +
> +happened:
> +	irq_happened = get_irq_happened();
> +	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +		WARN_ON_ONCE(!irq_happened);
> +
> +	if (irq_happened == PACA_IRQ_HARD_DIS) {
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +			WARN_ON_ONCE(mfmsr() & MSR_EE);
> +		irq_soft_mask_set(IRQS_ENABLED);
> +		local_paca->irq_happened = 0;
> +		__hard_irq_enable();
> +		return;
> +	}
> +
> +	/* Have interrupts to replay, need to hard disable first */
> +	if (!(irq_happened & PACA_IRQ_HARD_DIS)) {
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
> +			if (!(mfmsr() & MSR_EE)) {
> +				/*
> +				 * An interrupt could have come in and cleared
> +				 * MSR[EE] and set IRQ_HARD_DIS, so check
> +				 * IRQ_HARD_DIS again and warn if it is still
> +				 * clear.
> +				 */
> +				irq_happened = get_irq_happened();
> +				WARN_ON_ONCE(!(irq_happened & PACA_IRQ_HARD_DIS));
> +			}
> +		}
> +		__hard_irq_disable();
> +		local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +	} else {
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG)) {
> +			if (WARN_ON_ONCE(mfmsr() & MSR_EE))
> +				__hard_irq_disable();
> +		}
> +	}
> +
> +	/*
> +	 * Disable preempt here, so that the below preempt_enable will
> +	 * perform resched if required (a replayed interrupt may set
> +	 * need_resched).
> +	 */
> +	preempt_disable();
> +	irq_soft_mask_set(IRQS_ALL_DISABLED);
> +	trace_hardirqs_off();
> +
> +	replay_soft_interrupts_irqrestore();
> +	local_paca->irq_happened = 0;
> +
> +	trace_hardirqs_on();
> +	irq_soft_mask_set(IRQS_ENABLED);
> +	__hard_irq_enable();
> +	preempt_enable();
> +}
> +#else
>   notrace void arch_local_irq_restore(unsigned long mask)
>   {
>   	unsigned char irq_happened;
> @@ -288,6 +382,7 @@ notrace void arch_local_irq_restore(unsigned long mask)
>   	__hard_irq_enable();
>   	preempt_enable();
>   }
> +#endif
>   EXPORT_SYMBOL(arch_local_irq_restore);
>   
>   /*
