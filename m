Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FF5730EDEE
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 09:05:51 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DWWMJ5RJ9zDwnN
	for <lists+linuxppc-dev@lfdr.de>; Thu,  4 Feb 2021 19:05:48 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DWWKC4LRRzDqDB
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  4 Feb 2021 19:03:55 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DWWJz5Kb8z9tyRH;
 Thu,  4 Feb 2021 09:03:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id QX687jp2ul1G; Thu,  4 Feb 2021 09:03:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DWWJz39sRz9tyRG;
 Thu,  4 Feb 2021 09:03:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 7BD768B7F2;
 Thu,  4 Feb 2021 09:03:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WYrWt5M1cTnW; Thu,  4 Feb 2021 09:03:48 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 233D78B764;
 Thu,  4 Feb 2021 09:03:48 +0100 (CET)
Subject: Re: [PATCH v3 28/32] powerpc/64s: interrupt implement exit logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20200225173541.1549955-1-npiggin@gmail.com>
 <20200225173541.1549955-29-npiggin@gmail.com>
 <37c2a8e1-2c4b-2e55-6753-0a804ce00cac@csgroup.eu>
 <1612409077.fadt3kvld9.astroid@bobo.none>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <65686b53-feb4-2788-88e1-76c3714d3e97@csgroup.eu>
Date: Thu, 4 Feb 2021 09:03:42 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1612409077.fadt3kvld9.astroid@bobo.none>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: fr
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
Cc: Michal Suchanek <msuchanek@suse.de>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 04/02/2021 à 04:27, Nicholas Piggin a écrit :
> Excerpts from Christophe Leroy's message of February 4, 2021 2:25 am:
>>
>>
>> Le 25/02/2020 à 18:35, Nicholas Piggin a écrit :
>>> Implement the bulk of interrupt return logic in C. The asm return code
>>> must handle a few cases: restoring full GPRs, and emulating stack store.
>>>
>>
>>
>>> +notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs, unsigned long msr)
>>> +{
>>> +	unsigned long *ti_flagsp = &current_thread_info()->flags;
>>> +	unsigned long flags;
>>> +
>>> +	if (IS_ENABLED(CONFIG_PPC_BOOK3S) && unlikely(!(regs->msr & MSR_RI)))
>>> +		unrecoverable_exception(regs);
>>> +	BUG_ON(regs->msr & MSR_PR);
>>> +	BUG_ON(!FULL_REGS(regs));
>>> +
>>> +	local_irq_save(flags);
>>> +
>>> +	if (regs->softe == IRQS_ENABLED) {
>>> +		/* Returning to a kernel context with local irqs enabled. */
>>> +		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>>> +again:
>>> +		if (IS_ENABLED(CONFIG_PREEMPT)) {
>>> +			/* Return to preemptible kernel context */
>>> +			if (unlikely(*ti_flagsp & _TIF_NEED_RESCHED)) {
>>> +				if (preempt_count() == 0)
>>> +					preempt_schedule_irq();
>>> +			}
>>> +		}
>>> +
>>> +		trace_hardirqs_on();
>>> +		__hard_EE_RI_disable();
>>> +		if (unlikely(lazy_irq_pending())) {
>>> +			__hard_RI_enable();
>>> +			irq_soft_mask_set(IRQS_ALL_DISABLED);
>>> +			trace_hardirqs_off();
>>> +			local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
>>> +			/*
>>> +			 * Can't local_irq_enable in case we are in interrupt
>>> +			 * context. Must replay directly.
>>> +			 */
>>> +			replay_soft_interrupts();
>>> +			irq_soft_mask_set(flags);
>>> +			/* Took an interrupt, may have more exit work to do. */
>>> +			goto again;
>>> +		}
>>> +		local_paca->irq_happened = 0;
>>> +		irq_soft_mask_set(IRQS_ENABLED);
>>> +	} else {
>>> +		/* Returning to a kernel context with local irqs disabled. */
>>> +		trace_hardirqs_on();
>>> +		__hard_EE_RI_disable();
>>> +		if (regs->msr & MSR_EE)
>>> +			local_paca->irq_happened &= ~PACA_IRQ_HARD_DIS;
>>> +	}
>>> +
>>> +
>>> +#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>>> +	local_paca->tm_scratch = regs->msr;
>>> +#endif
>>> +
>>> +	/*
>>> +	 * We don't need to restore AMR on the way back to userspace for KUAP.
>>> +	 * The value of AMR only matters while we're in the kernel.
>>> +	 */
>>> +	kuap_restore_amr(regs);
>>
>> Is that correct to restore KUAP state here ? Shouldn't we have it at lower level in assembly ?
>>
>> Isn't there a risk that someone manages to call interrupt_exit_kernel_prepare() or the end of it in
>> a way or another, and get the previous KUAP state restored by this way ?
> 
> I'm not sure if there much more risk if it's here rather than the
> instruction being in another place in the code.
> 
> There's a lot of user access around the kernel too if you want to find a
> gadget to unlock KUAP then I suppose there is a pretty large attack
> surface.

My understanding is that user access scope is strictly limited, for instance we enforce the 
begin/end of user access to be in the same function, and we refrain from calling any other function 
inside the user access window. x86 even have 'objtool' to enforce it at build time. So in theory 
there is no way to get out of the function while user access is open.

Here with the interrupt exit function it is free beer. You have a place where you re-open user 
access and return with a simple blr. So that's open bar. If someone manages to just call the 
interrupt exit function, then user access remains open

> 
>> Also, it looks a bit strange to have kuap_save_amr_and_lock() done at lowest level in assembly, and
>> kuap_restore_amr() done in upper level. That looks unbalanced.
> 
> I'd like to bring the entry assembly into C.
> 

I really think it's not a good idea. We'll get better control and readability by keeping it at the 
lowest possible level in assembly.

x86 only save and restore SMAC state in assembly.

Christophe
