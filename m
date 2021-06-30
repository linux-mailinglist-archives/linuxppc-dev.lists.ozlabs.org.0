Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E1093B7E65
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 09:57:12 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GFDFy33Kfz3bYN
	for <lists+linuxppc-dev@lfdr.de>; Wed, 30 Jun 2021 17:57:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GFDFc41rNz2xKK
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 30 Jun 2021 17:56:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4GFDFT3LYqzB9rf;
 Wed, 30 Jun 2021 09:56:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qdU6d56qWNVB; Wed, 30 Jun 2021 09:56:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4GFDFT2LtSzB9qp;
 Wed, 30 Jun 2021 09:56:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 207E58B7E6;
 Wed, 30 Jun 2021 09:56:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id QHxXaprryrZn; Wed, 30 Jun 2021 09:56:45 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 8C9F98B764;
 Wed, 30 Jun 2021 09:56:44 +0200 (CEST)
Subject: Re: [PATCH v3 3/9] powerpc/64e: remove implicit soft-masking and
 interrupt exit restart logic
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210630074621.2109197-1-npiggin@gmail.com>
 <20210630074621.2109197-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a7eef3ac-7ea8-8bf8-f656-c88aa876f5f6@csgroup.eu>
Date: Wed, 30 Jun 2021 09:56:45 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210630074621.2109197-4-npiggin@gmail.com>
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
Cc: Sachin Sant <sachinp@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 30/06/2021 à 09:46, Nicholas Piggin a écrit :
> The implicit soft-masking to speed up interrupt return was going to be
> used by 64e as well, but it has not been extensively tested on that
> platform and is not considered ready. It was intended to be disabled
> before merge. Disable it for now.
> 
> Most of the restart code is common with 64s, so with more correctness
> and performance testing this could be re-enabled again by adding the
> extra soft-mask checks to interrupt handlers and flipping
> exit_must_hard_disable().
> 
> Fixes: 9d1988ca87dd ("powerpc/64: treat low kernel text as irqs soft-masked")
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 33 ++++++++++++++++++++--------
>   arch/powerpc/kernel/exceptions-64e.S | 12 +---------
>   arch/powerpc/kernel/interrupt.c      |  2 +-
>   arch/powerpc/kernel/interrupt_64.S   | 16 ++++++++++++--
>   4 files changed, 40 insertions(+), 23 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 8b4b1e84e110..f13c93b033c7 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -73,20 +73,34 @@
>   #include <asm/kprobes.h>
>   #include <asm/runlatch.h>
>   
> -#ifdef CONFIG_PPC64
> +#ifdef CONFIG_PPC_BOOK3S_64

Can we avoid that ifdef and use IS_ENABLED(CONFIG_PPC_BOOK3S_64) below ?

>   extern char __end_soft_masked[];
>   unsigned long search_kernel_restart_table(unsigned long addr);
> -#endif
>   
> -#ifdef CONFIG_PPC_BOOK3S_64
>   DECLARE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>   
> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
> +{
> +	if (regs->msr & MSR_PR)
> +		return false;
> +
> +	if (regs->nip >= (unsigned long)__end_soft_masked)
> +		return false;
> +
> +	return true;
> +}
> +
>   static inline void srr_regs_clobbered(void)
>   {
>   	local_paca->srr_valid = 0;
>   	local_paca->hsrr_valid = 0;
>   }
>   #else
> +static inline bool is_implicit_soft_masked(struct pt_regs *regs)
> +{
> +	return false;
> +}
> +
>   static inline void srr_regs_clobbered(void)
>   {
>   }
> @@ -150,11 +164,13 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   		 */
>   		if (TRAP(regs) != INTERRUPT_PROGRAM) {
>   			CT_WARN_ON(ct_state() != CONTEXT_KERNEL);
> -			BUG_ON(regs->nip < (unsigned long)__end_soft_masked);
> +			BUG_ON(is_implicit_soft_masked(regs));
>   		}
> +#ifdef CONFIG_PPC_BOOK3S

Allthough we are already in a PPC64 section, wouldn't it be better to use CONFIG_PPC_BOOK3S_64 ?

Can we use IS_ENABLED(CONFIG_PPC_BOOK3S_64) instead ?

>   		/* Move this under a debugging check */
>   		if (arch_irq_disabled_regs(regs))
>   			BUG_ON(search_kernel_restart_table(regs->nip));
> +#endif
>   	}
>   #endif
>   
> @@ -244,10 +260,9 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>   	local_paca->irq_soft_mask = IRQS_ALL_DISABLED;
>   	local_paca->irq_happened |= PACA_IRQ_HARD_DIS;
>   
> -	if (IS_ENABLED(CONFIG_PPC_BOOK3S_64) && !(regs->msr & MSR_PR) &&
> -				regs->nip < (unsigned long)__end_soft_masked) {
> -		// Kernel code running below __end_soft_masked is
> -		// implicitly soft-masked.
> +	if (is_implicit_soft_masked(regs)) {
> +		// Adjust regs->softe soft implicit soft-mask, so
> +		// arch_irq_disabled_regs(regs) behaves as expected.
>   		regs->softe = IRQS_ALL_DISABLED;
>   	}
>   
> @@ -282,6 +297,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>   	 */
>   
>   #ifdef CONFIG_PPC64
> +#ifdef CONFIG_PPC_BOOK3S

IS_ENABLED(CONFIG_PPC_BOOK3S_64) instead ?

>   	if (arch_irq_disabled_regs(regs)) {
>   		unsigned long rst = search_kernel_restart_table(regs->nip);
>   		if (rst)
> @@ -289,7 +305,6 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>   	}
>   #endif
>   
> -#ifdef CONFIG_PPC64
>   	if (nmi_disables_ftrace(regs))
>   		this_cpu_set_ftrace_enabled(state->ftrace_enabled);
>   
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index d634bfceed2c..1401787b0b93 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -342,17 +342,7 @@ ret_from_mc_except:
>   #define PROLOG_ADDITION_MASKABLE_GEN(n)					    \
>   	lbz	r10,PACAIRQSOFTMASK(r13);	/* are irqs soft-masked? */ \
>   	andi.	r10,r10,IRQS_DISABLED;	/* yes -> go out of line */ \
> -	bne	masked_interrupt_book3e_##n;				    \
> -	/* Kernel code below __end_soft_masked is implicitly masked */	    \
> -	andi.	r10,r11,MSR_PR;						    \
> -	bne	1f;			/* user -> not masked */	    \
> -	std	r14,PACA_EXGEN+EX_R14(r13);				    \
> -	LOAD_REG_IMMEDIATE_SYM(r14, r10, __end_soft_masked);		    \
> -	mfspr	r10,SPRN_SRR0;						    \
> -	cmpld	r10,r14;						    \
> -	ld	r14,PACA_EXGEN+EX_R14(r13);				    \
> -	blt	masked_interrupt_book3e_##n;				    \
> -1:
> +	bne	masked_interrupt_book3e_##n
>   
>   /*
>    * Additional regs must be re-loaded from paca before EXCEPTION_COMMON* is
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 0052702ee5ac..21bbd615ca41 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -36,7 +36,7 @@ static inline bool exit_must_hard_disable(void)
>   #else
>   static inline bool exit_must_hard_disable(void)
>   {
> -	return IS_ENABLED(CONFIG_PPC32);
> +	return true;
>   }
>   #endif
>   
> diff --git a/arch/powerpc/kernel/interrupt_64.S b/arch/powerpc/kernel/interrupt_64.S
> index e7a50613a570..09b8d8846c67 100644
> --- a/arch/powerpc/kernel/interrupt_64.S
> +++ b/arch/powerpc/kernel/interrupt_64.S
> @@ -231,7 +231,7 @@ _ASM_NOKPROBE_SYMBOL(system_call_vectored_emulate)
>   	li	r10,IRQS_ALL_DISABLED
>   	stb	r10,PACAIRQSOFTMASK(r13)
>   	b	system_call_vectored_common
> -#endif
> +#endif /* CONFIG_PPC_BOOK3S */
>   
>   	.balign IFETCH_ALIGN_BYTES
>   	.globl system_call_common_real
> @@ -320,10 +320,12 @@ END_BTB_FLUSH_SECTION
>   	li	r5,0 /* !scv */
>   	bl	syscall_exit_prepare
>   	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
> +#ifdef CONFIG_PPC_BOOK3S
>   .Lsyscall_rst_start:
>   	lbz	r11,PACAIRQHAPPENED(r13)
>   	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
>   	bne-	syscall_restart
> +#endif
>   	li	r11,IRQS_ENABLED
>   	stb	r11,PACAIRQSOFTMASK(r13)
>   	li	r11,0
> @@ -396,6 +398,7 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   	b	.Lsyscall_restore_regs_cont
>   .Lsyscall_rst_end:
>   
> +#ifdef CONFIG_PPC_BOOK3S
>   syscall_restart:
>   	GET_PACA(r13)
>   	ld	r1,PACA_EXIT_SAVE_R1(r13)
> @@ -409,6 +412,7 @@ syscall_restart:
>   	b	.Lsyscall_rst_start
>   
>   RESTART_TABLE(.Lsyscall_rst_start, .Lsyscall_rst_end, syscall_restart)
> +#endif
>   
>   #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>   tabort_syscall:
> @@ -504,10 +508,12 @@ _ASM_NOKPROBE_SYMBOL(interrupt_return_\srr\())
>   	bne-	.Lrestore_nvgprs_\srr
>   .Lrestore_nvgprs_\srr\()_cont:
>   	std	r1,PACA_EXIT_SAVE_R1(r13) /* save r1 for restart */
> +#ifdef CONFIG_PPC_BOOK3S
>   .Linterrupt_return_\srr\()_user_rst_start:
>   	lbz	r11,PACAIRQHAPPENED(r13)
>   	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
>   	bne-	interrupt_return_\srr\()_user_restart
> +#endif
>   	li	r11,IRQS_ENABLED
>   	stb	r11,PACAIRQSOFTMASK(r13)
>   	li	r11,0
> @@ -590,6 +596,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>   	REST_NVGPRS(r1)
>   	b	.Lrestore_nvgprs_\srr\()_cont
>   
> +#ifdef CONFIG_PPC_BOOK3S
>   interrupt_return_\srr\()_user_restart:
>   	GET_PACA(r13)
>   	ld	r1,PACA_EXIT_SAVE_R1(r13)
> @@ -602,6 +609,7 @@ interrupt_return_\srr\()_user_restart:
>   	b	.Linterrupt_return_\srr\()_user_rst_start
>   
>   RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr\()_user_rst_end, interrupt_return_\srr\()_user_restart)
> +#endif
>   
>   	.balign IFETCH_ALIGN_BYTES
>   .Lkernel_interrupt_return_\srr\():
> @@ -615,9 +623,11 @@ RESTART_TABLE(.Linterrupt_return_\srr\()_user_rst_start, .Linterrupt_return_\srr
>   	cmpwi	r11,IRQS_ENABLED
>   	stb	r11,PACAIRQSOFTMASK(r13)
>   	bne	1f
> +#ifdef CONFIG_PPC_BOOK3S
>   	lbz	r11,PACAIRQHAPPENED(r13)
>   	andi.	r11,r11,(~PACA_IRQ_HARD_DIS)@l
>   	bne-	interrupt_return_\srr\()_kernel_restart
> +#endif
>   	li	r11,0
>   	stb	r11,PACAIRQHAPPENED(r13) # clear out possible HARD_DIS
>   1:
> @@ -717,6 +727,7 @@ ALT_FTR_SECTION_END_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
>   	b	.	/* prevent speculative execution */
>   .Linterrupt_return_\srr\()_kernel_rst_end:
>   
> +#ifdef CONFIG_PPC_BOOK3S
>   interrupt_return_\srr\()_kernel_restart:
>   	GET_PACA(r13)
>   	ld	r1,PACA_EXIT_SAVE_R1(r13)
> @@ -729,14 +740,15 @@ interrupt_return_\srr\()_kernel_restart:
>   	b	.Linterrupt_return_\srr\()_kernel_rst_start
>   
>   RESTART_TABLE(.Linterrupt_return_\srr\()_kernel_rst_start, .Linterrupt_return_\srr\()_kernel_rst_end, interrupt_return_\srr\()_kernel_restart)
> +#endif
>   
>   .endm
>   
>   interrupt_return_macro srr
>   #ifdef CONFIG_PPC_BOOK3S
>   interrupt_return_macro hsrr
> -#endif /* CONFIG_PPC_BOOK3S */
>   
>   	.globl __end_soft_masked
>   __end_soft_masked:
>   DEFINE_FIXED_SYMBOL(__end_soft_masked)
> +#endif /* CONFIG_PPC_BOOK3S */
> 
