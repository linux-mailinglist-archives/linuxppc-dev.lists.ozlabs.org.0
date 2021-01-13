Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7340D2F4E20
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 16:07:40 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG9m949kwzDrgF
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 02:07:37 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=csgroup.eu
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG9kK61cSzDrBh
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 02:05:57 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG9k86cChz9twtZ;
 Wed, 13 Jan 2021 16:05:52 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id 8OE07lY1XRGq; Wed, 13 Jan 2021 16:05:52 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG9k85l3yz9twtb;
 Wed, 13 Jan 2021 16:05:52 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 641668B7E2;
 Wed, 13 Jan 2021 16:05:54 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id nh6_74ywS3SD; Wed, 13 Jan 2021 16:05:54 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 374E48B772;
 Wed, 13 Jan 2021 16:05:54 +0100 (CET)
Subject: Re: [PATCH v5 17/21] powerpc/64: entry cpu time accounting in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-18-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <3304762a-d6d6-df70-5546-e7e4dc2d3380@csgroup.eu>
Date: Wed, 13 Jan 2021 16:05:54 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-18-npiggin@gmail.com>
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



Le 13/01/2021 à 08:32, Nicholas Piggin a écrit :
> There is no need for this to be in asm, use the new intrrupt entry wrapper.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h |  7 +++++++
>   arch/powerpc/include/asm/ppc_asm.h   | 24 ------------------------
>   arch/powerpc/kernel/exceptions-64e.S |  1 -
>   arch/powerpc/kernel/exceptions-64s.S |  5 -----
>   4 files changed, 7 insertions(+), 30 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 6eba7c489753..e278dffe7657 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -4,6 +4,7 @@
>   
>   #include <linux/context_tracking.h>
>   #include <linux/hardirq.h>
> +#include <asm/cputime.h>
>   #include <asm/ftrace.h>
>   
>   struct interrupt_state {
> @@ -25,6 +26,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   	if (user_mode(regs)) {
>   		CT_WARN_ON(ct_state() != CONTEXT_USER);
>   		user_exit_irqoff();
> +
> +		account_cpu_user_entry();

Are interrupts still disabled here ? Otherwise you risk getting IRQ time accounted on user.

> +		account_stolen_time();
>   	} else {
>   		/*
>   		 * CT_WARN_ON comes here via program_check_exception,
> @@ -38,6 +42,9 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs, struct interrup
>   #ifdef CONFIG_PPC_BOOK3E_64
>   	state->ctx_state = exception_enter();
>   #endif
> +
> +	if (!IS_ENABLED(CONFIG_PPC_BOOK3S_64) && user_mode(regs))
> +		account_cpu_user_entry();

Isn't this interrupt_enter_prepare() function called also on PPC32 ?
Have you removed the ACCOUNT_CPU_USER_ENTRY() from entry_32.S ?

>   }
>   
>   /*
> diff --git a/arch/powerpc/include/asm/ppc_asm.h b/arch/powerpc/include/asm/ppc_asm.h
> index cc1bca571332..3dceb64fc9af 100644
> --- a/arch/powerpc/include/asm/ppc_asm.h
> +++ b/arch/powerpc/include/asm/ppc_asm.h
> @@ -25,7 +25,6 @@
>   #ifndef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
>   #define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)
>   #define ACCOUNT_CPU_USER_EXIT(ptr, ra, rb)
> -#define ACCOUNT_STOLEN_TIME
>   #else
>   #define ACCOUNT_CPU_USER_ENTRY(ptr, ra, rb)				\
>   	MFTB(ra);			/* get timebase */		\
> @@ -44,29 +43,6 @@
>   	PPC_LL	ra, ACCOUNT_SYSTEM_TIME(ptr);				\
>   	add	ra,ra,rb;		/* add on to system time */	\
>   	PPC_STL	ra, ACCOUNT_SYSTEM_TIME(ptr)
> -
> -#ifdef CONFIG_PPC_SPLPAR
> -#define ACCOUNT_STOLEN_TIME						\
> -BEGIN_FW_FTR_SECTION;							\
> -	beq	33f;							\
> -	/* from user - see if there are any DTL entries to process */	\
> -	ld	r10,PACALPPACAPTR(r13);	/* get ptr to VPA */		\
> -	ld	r11,PACA_DTL_RIDX(r13);	/* get log read index */	\
> -	addi	r10,r10,LPPACA_DTLIDX;					\
> -	LDX_BE	r10,0,r10;		/* get log write index */	\
> -	cmpd	cr1,r11,r10;						\
> -	beq+	cr1,33f;						\
> -	bl	accumulate_stolen_time;				\
> -	ld	r12,_MSR(r1);						\
> -	andi.	r10,r12,MSR_PR;		/* Restore cr0 (coming from user) */ \
> -33:									\
> -END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
> -
> -#else  /* CONFIG_PPC_SPLPAR */
> -#define ACCOUNT_STOLEN_TIME
> -
> -#endif /* CONFIG_PPC_SPLPAR */
> -
>   #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>   
>   /*
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 52421042a020..87b3e74ded41 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -398,7 +398,6 @@ exc_##n##_common:							    \
>   	std	r10,_NIP(r1);		/* save SRR0 to stackframe */	    \
>   	std	r11,_MSR(r1);		/* save SRR1 to stackframe */	    \
>   	beq	2f;			/* if from kernel mode */	    \
> -	ACCOUNT_CPU_USER_ENTRY(r13,r10,r11);/* accounting (uses cr0+eq) */  \
>   2:	ld	r3,excf+EX_R10(r13);	/* get back r10 */		    \
>   	ld	r4,excf+EX_R11(r13);	/* get back r11 */		    \
>   	mfspr	r5,scratch;		/* get back r13 */		    \
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index df4ee073386b..68505e35bcf7 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -577,7 +577,6 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real)
>   	kuap_save_amr_and_lock r9, r10, cr1, cr0
>   	.endif
>   	beq	101f			/* if from kernel mode		*/
> -	ACCOUNT_CPU_USER_ENTRY(r13, r9, r10)
>   BEGIN_FTR_SECTION
>   	ld	r9,IAREA+EX_PPR(r13)	/* Read PPR from paca		*/
>   	std	r9,_PPR(r1)
> @@ -645,10 +644,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_CFAR)
>   	ld	r11,exception_marker@toc(r2)
>   	std	r10,RESULT(r1)		/* clear regs->result		*/
>   	std	r11,STACK_FRAME_OVERHEAD-16(r1) /* mark the frame	*/
> -
> -	.if ISTACK
> -	ACCOUNT_STOLEN_TIME
> -	.endif
>   .endm
>   
>   /*
> 
