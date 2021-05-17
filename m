Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 643AF382EDC
	for <lists+linuxppc-dev@lfdr.de>; Mon, 17 May 2021 16:10:22 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4FkLcq6Qhzz3001
	for <lists+linuxppc-dev@lfdr.de>; Tue, 18 May 2021 00:10:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4FkLcN1pjXz2yYS
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 18 May 2021 00:09:53 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4FkLcG4NFtz9sY7;
 Mon, 17 May 2021 16:09:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yeU8oeeig71C; Mon, 17 May 2021 16:09:50 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4FkLcG2y7jz9sY0;
 Mon, 17 May 2021 16:09:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 49DC08B7A2;
 Mon, 17 May 2021 16:09:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id GCTAC_V-S1iY; Mon, 17 May 2021 16:09:50 +0200 (CEST)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id F09A18B7A1;
 Mon, 17 May 2021 16:09:49 +0200 (CEST)
Subject: Re: [PATCH 14/14] powerpc/64s: use the same default PPR for user and
 kernel
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315220402.260594-1-npiggin@gmail.com>
 <20210315220402.260594-15-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <91c4dbff-87ed-aab7-4907-506937c6eaaf@csgroup.eu>
Date: Mon, 17 May 2021 16:09:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210315220402.260594-15-npiggin@gmail.com>
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



Le 15/03/2021 à 23:04, Nicholas Piggin a écrit :
> Change the default PPR to userspace to 4 (medium), matching the
> normal kernel PPR.
> 
> This allows system calls and user interrupts to avoid setting PPR on
> entry and exit, providing a significant speedup.
> 
> This is a change to the user environment. The problem with changing
> the kernel to match userspace at 3 (medium-low), is that userspace
> can then boost priority above the kernel which is also undesirable.
> 
> glibc does not seem to change PPR anywhere, so the decision is to
> go with this.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h |  2 ++
>   arch/powerpc/include/asm/processor.h |  4 ++--
>   arch/powerpc/kernel/exceptions-64s.S |  3 ---
>   arch/powerpc/kernel/interrupt.c      | 33 ++++++++++++++++++++++++++++
>   arch/powerpc/kernel/interrupt_64.S   | 17 --------------
>   5 files changed, 37 insertions(+), 22 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index d6d54bbcba2f..293e6be9fd71 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -57,6 +57,8 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   #ifdef CONFIG_PPC64
>   	bool trace_enable = false;
>   
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, DEFAULT_PPR);
>   	if (IS_ENABLED(CONFIG_TRACE_IRQFLAGS)) {
>   		if (irq_soft_mask_set_return(IRQS_DISABLED) == IRQS_ENABLED)
>   			trace_enable = true;
> diff --git a/arch/powerpc/include/asm/processor.h b/arch/powerpc/include/asm/processor.h
> index cb1edf21a82e..5ff589042103 100644
> --- a/arch/powerpc/include/asm/processor.h
> +++ b/arch/powerpc/include/asm/processor.h
> @@ -27,8 +27,8 @@
>   #endif
>   
>   #ifdef CONFIG_PPC64
> -/* Default SMT priority is set to 3. Use 11- 13bits to save priority. */
> -#define PPR_PRIORITY 3
> +/* Default SMT priority is set to 4. Use 11- 13bits to save priority. */
> +#define PPR_PRIORITY 4
>   #ifdef __ASSEMBLY__
>   #define DEFAULT_PPR (PPR_PRIORITY << 50)
>   #else
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 75cee7cdf887..0d40614d13e0 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -367,7 +367,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   BEGIN_FTR_SECTION
>   	mfspr	r9,SPRN_PPR
>   END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -	HMT_MEDIUM
>   	std	r10,IAREA+EX_R10(r13)		/* save r10 - r12 */
>   BEGIN_FTR_SECTION
>   	mfspr	r10,SPRN_CFAR
> @@ -1962,8 +1961,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_REAL_LE)
>   	mfspr	r11,SPRN_SRR0
>   	mfspr	r12,SPRN_SRR1
>   
> -	HMT_MEDIUM
> -
>   	.if ! \virt
>   	__LOAD_HANDLER(r10, system_call_common_real)
>   	mtctr	r10
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 09cf699d0e2e..a6e0595da0dd 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -40,6 +40,11 @@ notrace long system_call_exception(long r3, long r4, long r5,
>   
>   	regs->orig_gpr3 = r3;
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, DEFAULT_PPR);
> +#endif

Can you have some helper functions to do this instead of those 4 lines #ifdefed blocks all over the 
place ?

Something like

#ifdef CONFIG_PPC_BOOK3S_64
static inline void set_ppr_regs(struct pt_regs *regs)
{
	if (unlikely(regs->ppr != DEFAULT_PPR))
		mtspr(SPRN_PPR, regs->ppr);
}

static inline void set_ppr_default(struct pt_regs *regs)
{
	if (unlikely(regs->ppr != DEFAULT_PPR))
		mtspr(SPRN_PPR, DEFAULT_PPR);
}
#else
static inline void set_ppr_regs(struct pt_regs *regs) { }
static inline void set_ppr_default(struct pt_regs *regs) { }
#endif

> +
>   	if (IS_ENABLED(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG))
>   		BUG_ON(irq_soft_mask_return() != IRQS_ALL_DISABLED);
>   
> @@ -237,6 +242,11 @@ notrace unsigned long syscall_exit_prepare_main(unsigned long r3,
>   
>   	account_cpu_user_exit();
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, regs->ppr);
> +#endif
> +
>   #ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not using this */
>   	/*
>   	 * We do this at the end so that we do context switch with KERNEL AMR
> @@ -315,6 +325,11 @@ notrace unsigned long syscall_exit_restart(unsigned long r3, struct pt_regs *reg
>   	 */
>   	hard_irq_disable();
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, DEFAULT_PPR);
> +#endif
> +
>   	trace_hardirqs_off();
>   	user_exit_irqoff();
>   	account_cpu_user_entry();
> @@ -398,6 +413,11 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>   
>   	account_cpu_user_exit();
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, regs->ppr);
> +#endif
> +
>   	/*
>   	 * We do this at the end so that we do context switch with KERNEL AMR
>   	 */
> @@ -489,6 +509,11 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   	local_paca->tm_scratch = regs->msr;
>   #endif
>   
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, regs->ppr);
> +#endif
> +
>   	/*
>   	 * Don't want to mfspr(SPRN_AMR) here, because this comes after mtmsr,
>   	 * which would cause Read-After-Write stalls. Hence, we take the AMR
> @@ -505,6 +530,10 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
>   {
>   	hard_irq_disable();
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, DEFAULT_PPR);
> +#endif
>   
>   	trace_hardirqs_off();
>   	user_exit_irqoff();
> @@ -523,6 +552,10 @@ notrace unsigned long interrupt_exit_user_restart(struct pt_regs *regs)
>   notrace unsigned long interrupt_exit_kernel_restart(struct pt_regs *regs)
>   {
>   	hard_irq_disable();
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	if (unlikely(regs->ppr != DEFAULT_PPR))
> +		mtspr(SPRN_PPR, DEFAULT_PPR);
> +#endif
>   
>   #ifndef CONFIG_PPC_BOOK3E_64
>   	set_kuap(AMR_KUAP_BLOCKED);
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index eef61800f734..53fc446dcbeb 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -99,10 +99,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>   	ld	r11,exception_marker@toc(r2)
>   	std	r11,-16(r10)		/* "regshere" marker */
>   
> -BEGIN_FTR_SECTION
> -	HMT_MEDIUM
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -
>   	ENTER_KERNEL_SECURITY_FALLBACK
>   
>   	/*
> @@ -142,10 +138,6 @@ BEGIN_FTR_SECTION
>   	stdcx.	r0,0,r1			/* to clear the reservation */
>   END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>   
> -BEGIN_FTR_SECTION
> -	HMT_MEDIUM_LOW
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -
>   	cmpdi	r3,0
>   	bne	.Lsyscall_vectored_\name\()_restore_regs
>   
> @@ -377,10 +369,6 @@ END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>   	mtspr	SPRN_XER,r0
>   .Lsyscall_restore_regs_cont:
>   
> -BEGIN_FTR_SECTION
> -	HMT_MEDIUM_LOW
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -
>   	/*
>   	 * We don't need to restore AMR on the way back to userspace for KUAP.
>   	 * The value of AMR only matters while we're in the kernel.
> @@ -533,11 +521,6 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
>   	tdnei	r4,IRQS_ENABLED
>   
>   #ifdef CONFIG_PPC_BOOK3S
> -BEGIN_FTR_SECTION
> -	ld	r10,_PPR(r1)
> -	mtspr	SPRN_PPR,r10
> -END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
> -
>   	.ifc \srr,srr
>   	lbz	r4,PACASRR_VALID(r13)
>   	.else
> 
