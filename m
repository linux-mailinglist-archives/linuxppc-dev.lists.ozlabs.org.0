Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AFD33CE6C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 08:16:54 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4F04NN24dxz30Kn
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 18:16:52 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4F04N140blz2y0N
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 18:16:33 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4F04My0khXz9v01x;
 Tue, 16 Mar 2021 08:16:30 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id lX-DG0j1SLSr; Tue, 16 Mar 2021 08:16:30 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4F04Mx6FXTz9v01w;
 Tue, 16 Mar 2021 08:16:29 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8F5768B77F;
 Tue, 16 Mar 2021 08:16:30 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id EHzDybjSgk6N; Tue, 16 Mar 2021 08:16:30 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 4A03F8B766;
 Tue, 16 Mar 2021 08:16:30 +0100 (CET)
Subject: Re: [PATCH] powerpc/64s: power4 nap fixup in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210312012044.3660743-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <6ab2073b-dd10-ef2c-375d-1300f071ae1a@csgroup.eu>
Date: Tue, 16 Mar 2021 08:16:27 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210312012044.3660743-1-npiggin@gmail.com>
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
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 12/03/2021 à 02:20, Nicholas Piggin a écrit :
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Hopefully this works on a real G5 now, but I couldn't reproduce the
> problem with QEMU.
> 
> Thanks,
> Nick
> 
>   arch/powerpc/include/asm/interrupt.h   | 19 +++++++++++
>   arch/powerpc/include/asm/processor.h   |  1 +
>   arch/powerpc/include/asm/thread_info.h |  6 ++++
>   arch/powerpc/kernel/exceptions-64s.S   | 45 --------------------------
>   arch/powerpc/kernel/idle_book3s.S      |  4 +++
>   5 files changed, 30 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index aedfba29e43a..ef015d3b5e39 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -9,6 +9,17 @@
>   #include <asm/kprobes.h>
>   #include <asm/runlatch.h>
>   
> +static inline void nap_adjust_return(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC_970_NAP
> +	if (unlikely(test_thread_local_flags(_TLF_NAPPING))) {
> +		/* Can avoid a test-and-clear because NMIs do not call this */
> +		clear_thread_local_flags(_TLF_NAPPING);
> +		regs->nip = (unsigned long)power4_idle_nap_return;

Why don't you do regs->nip = regs->link like PPC32 instead of going via an intermediate symbol that 
does nothing else than branching to LR ?

> +	}
> +#endif
> +}
> +
>   struct interrupt_state {
>   #ifdef CONFIG_PPC_BOOK3E_64
>   	enum ctx_state ctx_state;
> @@ -111,6 +122,9 @@ static inline void interrupt_async_exit_prepare(struct pt_regs *regs, struct int
>   {
>   	irq_exit();
>   	interrupt_exit_prepare(regs, state);
> +
> +	/* Adjust at exit so the main handler sees the true NIA */
> +	nap_adjust_return(regs);
>   }
>   
>   struct interrupt_nmi_state {
> @@ -164,6 +178,11 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>   			radix_enabled() || (mfmsr() & MSR_DR))
>   		nmi_exit();
>   
> +	/*
> +	 * nmi does not call nap_adjust_return because nmi should not create
> +	 * new work to do (must use irq_work for that).
> +	 */
> +
>   #ifdef CONFIG_PPC64
>   	if (TRAP(regs) != 0x900 && TRAP(regs) != 0xf00 && TRAP(regs) != 0x260)
>   		this_cpu_set_ftrace_enabled(state->ftrace_enabled);

...

> diff --git a/arch/powerpc/kernel/idle_book3s.S b/arch/powerpc/kernel/idle_book3s.S
> index f9e6d83e6720..abb719b21cae 100644
> --- a/arch/powerpc/kernel/idle_book3s.S
> +++ b/arch/powerpc/kernel/idle_book3s.S
> @@ -209,4 +209,8 @@ _GLOBAL(power4_idle_nap)
>   	mtmsrd	r7
>   	isync
>   	b	1b
> +
> +	.globl power4_idle_nap_return
> +power4_idle_nap_return:
> +	blr
>   #endif
> 
