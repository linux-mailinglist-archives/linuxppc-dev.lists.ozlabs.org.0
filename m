Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6877F4157C4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 07:13:42 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HFNc42lgNz306K
	for <lists+linuxppc-dev@lfdr.de>; Thu, 23 Sep 2021 15:13:40 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HFNbf1pdjz2yLg
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 23 Sep 2021 15:13:16 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HFNbZ0t45z9sSs;
 Thu, 23 Sep 2021 07:13:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2hshIqDDmBvR; Thu, 23 Sep 2021 07:13:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HFNbY6w0Zz9sSd;
 Thu, 23 Sep 2021 07:13:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id D513B8B775;
 Thu, 23 Sep 2021 07:13:13 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id xVY0dQQSorLd; Thu, 23 Sep 2021 07:13:13 +0200 (CEST)
Received: from PO20335.IDSI0.si.c-s.fr (unknown [192.168.202.200])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 87B308B763;
 Thu, 23 Sep 2021 07:13:13 +0200 (CEST)
Subject: Re: [PATCH v3 5/6] powerpc/64/interrupt: reduce expensive debug tests
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210922145452.352571-1-npiggin@gmail.com>
 <20210922145452.352571-6-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <e6ddaaea-4ed5-30cb-c325-856fe745808d@csgroup.eu>
Date: Thu, 23 Sep 2021 07:13:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210922145452.352571-6-npiggin@gmail.com>
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
> Move the assertions requiring restart table searches under
> CONFIG_PPC_IRQ_SOFT_MASK_DEBUG.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 14 ++++++++++----
>   1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index e178d143671a..0e84e99af37b 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -97,6 +97,11 @@ static inline void srr_regs_clobbered(void)
>   	local_paca->hsrr_valid = 0;
>   }
>   #else
> +static inline unsigned long search_kernel_restart_table(unsigned long addr)
> +{
> +	return 0;
> +}
> +

Not sure you need that. Moving the 64s prototype out of the #ifdef would 
do it as well.


>   static inline bool is_implicit_soft_masked(struct pt_regs *regs)
>   {
>   	return false;
> @@ -190,13 +195,14 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   		 */
>   		if (TRAP(regs) != INTERRUPT_PROGRAM) {
>   			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
> -			BUG_ON(is_implicit_soft_masked(regs));
> +			if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
> +				BUG_ON(is_implicit_soft_masked(regs));
>   		}
> -#ifdef CONFIG_PPC_BOOK3S
> +
>   		/* Move this under a debugging check */
> -		if (arch_irq_disabled_regs(regs))
> +		if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) &&
> +				arch_irq_disabled_regs(regs))
>   			BUG_ON(search_kernel_restart_table(regs->nip));
> -#endif
>   	}
>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>   		BUG_ON(!arch_irq_disabled_regs(regs) && !(regs->msr & MSR_EE));
> 
