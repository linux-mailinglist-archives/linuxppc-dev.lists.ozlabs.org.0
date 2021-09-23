Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id ED6344157B9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 07:05:38 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFNQm5Ydmz3bXS
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 15:05:36 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFNQL2VZnz2yJv
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 15:05:11 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HFNQB46S7z9sSs;
 Thu, 23 Sep 2021 07:05:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kX4FfphMJBx7; Thu, 23 Sep 2021 07:05:06 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HFNQB30Dpz9sSd;
 Thu, 23 Sep 2021 07:05:06 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 454388B775;
 Thu, 23 Sep 2021 07:05:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 4VPyUceGHvhY; Thu, 23 Sep 2021 07:05:06 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E3ABC8B763;
 Thu, 23 Sep 2021 07:05:05 +0200 (CEST)
Subject: Re: [PATCH v3 1/6] powerpc/64/interrupt: make normal synchronous
 interrupts enable MSR[EE] if possible
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210922145452.352571-1-npiggin@gmail.com>
 <20210922145452.352571-2-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <c36ee3f1-64de-e215-23d2-8685a672b16d@csgroup.eu>
Date: Thu, 23 Sep 2021 07:05:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922145452.352571-2-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr-FR
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



Le 22/09/2021 à 16:54, Nicholas Piggin a écrit :
> Make synchronous interrupt handler entry wrappers enable MSR[EE] if
> MSR[EE] was enabled in the interrupted context. IRQs are soft-disabled
> at this point so there is no change to high level code, but it's a
> masked interrupt could fire.
> 
> This is a performance disadvantage for interrupts which do not later
> call interrupt_cond_local_irq_enable(), because an an additional mtmsrd
> or wrtee instruction is executed. However the important synchronous
> interrupts (e.g., page fault) do enable interrupts, so the performance
> disadvantage is mostly avoided.
> 
> In the next patch, MSR[RI] enabling can be combined with MSR[EE]
> enabling, which mitigates the performance drop for the former and gives
> a performance advanage for the latter interrupts, on 64s machines. 64e
> is coming along for the ride for now to avoid divergences with 64s in
> this tricky code.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 19 ++++++++++++++++++-
>   1 file changed, 18 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index b76ab848aa0d..3802390d8eea 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -150,7 +150,20 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   #ifdef CONFIG_PPC64
>   	if (irq_soft_mask_set_return(IRQS_ALL_DISABLED) == IRQS_ENABLED)
>   		trace_hardirqs_off();
> -	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +
> +	/*
> +	 * If the interrupt was taken with HARD_DIS clear, then enable MSR[EE].
> +	 * Asynchronous interrupts get here with HARD_DIS set (see below), so
> +	 * this enables MSR[EE] for synchronous interrupts. IRQs remain
> +	 * soft-masked. The interrupt handler may later call
> +	 * interrupt_cond_local_irq_enable() to achieve a regular process
> +	 * context.
> +	 */
> +	if (!(local_paca->irq_happened & PACA_IRQ_HARD_DIS)) {
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +			BUG_ON(!(regs->msr & MSR_EE));

Could be:
	BUG_ON(IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && !(regs->msr & 
MSR_EE));

> +		__hard_irq_enable();
> +	}
>   
>   	if (user_mode(regs)) {
>   		CT_WARN_ON(ct_state() != CONTEXT_USER);
> @@ -200,6 +213,10 @@ static inline void interrupt_exit_prepare(struct pt_regs *regs, struct interrupt
>   
>   static inline void interrupt_async_enter_prepare(struct pt_regs *regs, struct interrupt_state *state)
>   {
> +#ifdef CONFIG_PPC64
> +	/* Ensure interrupt_enter_prepare does not enable MSR[EE] */
> +	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
> +#endif
>   #ifdef CONFIG_PPC_BOOK3S_64
>   	if (cpu_has_feature(CPU_FTR_CTRL) &&
>   	    !test_thread_local_flags(_TLF_RUNLATCH))
> 
