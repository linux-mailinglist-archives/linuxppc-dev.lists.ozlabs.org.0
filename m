Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C58B2E0BF2
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Dec 2020 15:44:30 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4D0fHb2CNqzDqW7
	for <lists+linuxppc-dev@lfdr.de>; Wed, 23 Dec 2020 01:44:27 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4D0fFk1YqBzDqPm
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 23 Dec 2020 01:42:40 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4D0fFR3nTHz9v1bp;
 Tue, 22 Dec 2020 15:42:35 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id ws-PC5PuYsr1; Tue, 22 Dec 2020 15:42:35 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4D0fFR1Fk2z9v1bV;
 Tue, 22 Dec 2020 15:42:35 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 86F728B81B;
 Tue, 22 Dec 2020 15:42:36 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id h_2IunUBmVL4; Tue, 22 Dec 2020 15:42:36 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2A8578B812;
 Tue, 22 Dec 2020 15:42:36 +0100 (CET)
Subject: Re: [PATCH v3 03/19] powerpc: bad_page_fault, do_break get registers
 from regs
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20201128144114.944000-1-npiggin@gmail.com>
 <20201128144114.944000-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <312d3d14-329c-a0c9-89c4-e21d1f9e616d@csgroup.eu>
Date: Tue, 22 Dec 2020 15:42:26 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20201128144114.944000-4-npiggin@gmail.com>
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



Le 28/11/2020 à 15:40, Nicholas Piggin a écrit :
> Similar to the previous patch this makes interrupt handler function
> types more regular so they can be wrapped with the next patch.
> 
> bad_page_fault and do_break are not performance critical.

I partly took your changes into one of my series, in different order though.

Please have a look at https://patchwork.ozlabs.org/project/linuxppc-dev/list/?series=221656 patches 
4 to 7

I think some of the changes are missing in your series, especially the changes in entry_32.S from 
patch 7.

Will see how our two series make their way into mainline, yours needs rebase anyway.

Christophe

> 
> [32s DABR code from Christophe Leroy <christophe.leroy@csgroup.eu>]
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/bug.h             |  2 +-
>   arch/powerpc/include/asm/debug.h           |  3 +--
>   arch/powerpc/kernel/entry_32.S             | 18 +-----------------
>   arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>   arch/powerpc/kernel/exceptions-64s.S       |  3 +--
>   arch/powerpc/kernel/head_8xx.S             |  5 ++---
>   arch/powerpc/kernel/head_book3s_32.S       |  3 +++
>   arch/powerpc/kernel/process.c              |  7 +++----
>   arch/powerpc/kernel/traps.c                |  2 +-
>   arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>   arch/powerpc/mm/book3s64/slb.c             |  2 +-
>   arch/powerpc/mm/fault.c                    | 10 +++++-----
>   arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>   13 files changed, 23 insertions(+), 41 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index 897bad6b6bbb..49162faba33f 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -113,7 +113,7 @@
>   struct pt_regs;
>   long do_page_fault(struct pt_regs *);
>   long hash__do_page_fault(struct pt_regs *);
> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
> +void bad_page_fault(struct pt_regs *, int);
>   extern void _exception(int, struct pt_regs *, int, unsigned long);
>   extern void _exception_pkey(struct pt_regs *, unsigned long, int);
>   extern void die(const char *, struct pt_regs *, long);
> diff --git a/arch/powerpc/include/asm/debug.h b/arch/powerpc/include/asm/debug.h
> index ec57daf87f40..0550eceab3ca 100644
> --- a/arch/powerpc/include/asm/debug.h
> +++ b/arch/powerpc/include/asm/debug.h
> @@ -52,8 +52,7 @@ extern void do_send_trap(struct pt_regs *regs, unsigned long address,
>   			 unsigned long error_code, int brkpt);
>   #else
>   
> -extern void do_break(struct pt_regs *regs, unsigned long address,
> -		     unsigned long error_code);
> +void do_break(struct pt_regs *regs);
>   #endif
>   
>   #endif /* _ASM_POWERPC_DEBUG_H */
> diff --git a/arch/powerpc/kernel/entry_32.S b/arch/powerpc/kernel/entry_32.S
> index 8cdc8bcde703..57b8e95ea2a0 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -657,10 +657,6 @@ ppc_swapcontext:
>   	.globl	handle_page_fault
>   handle_page_fault:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	andis.  r0,r5,DSISR_DABRMATCH@h
> -	bne-    handle_dabr_fault
> -#endif
>   	bl	do_page_fault
>   	cmpwi	r3,0
>   	beq+	ret_from_except
> @@ -668,23 +664,11 @@ handle_page_fault:
>   	lwz	r0,_TRAP(r1)
>   	clrrwi	r0,r0,1
>   	stw	r0,_TRAP(r1)
> -	mr	r5,r3
> +	mr	r4,r3		/* err arg for bad_page_fault */
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	lwz	r4,_DAR(r1)
>   	bl	bad_page_fault
>   	b	ret_from_except_full
>   
> -#ifdef CONFIG_PPC_BOOK3S_32
> -	/* We have a data breakpoint exception - handle it */
> -handle_dabr_fault:
> -	SAVE_NVGPRS(r1)
> -	lwz	r0,_TRAP(r1)
> -	clrrwi	r0,r0,1
> -	stw	r0,_TRAP(r1)
> -	bl      do_break
> -	b	ret_from_except_full
> -#endif
> -
>   /*
>    * This routine switches between two different tasks.  The process
>    * state of one is saved on its kernel stack.  Then the state
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 25fa7d5a643c..dc728bb1c89a 100644
> --- a/arch/powerpc/kernel/exceptions-64e.S
> +++ b/arch/powerpc/kernel/exceptions-64e.S
> @@ -1018,9 +1018,8 @@ storage_fault_common:
>   	bne-	1f
>   	b	ret_from_except_lite
>   1:	bl	save_nvgprs
> -	mr	r5,r3
> +	mr	r4,r3
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	ld	r4,_DAR(r1)
>   	bl	bad_page_fault
>   	b	ret_from_except
>   
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 690058043b17..77b730f515c4 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -2136,8 +2136,7 @@ EXC_COMMON_BEGIN(h_data_storage_common)
>   	GEN_COMMON h_data_storage
>   	addi    r3,r1,STACK_FRAME_OVERHEAD
>   BEGIN_MMU_FTR_SECTION
> -	ld	r4,_DAR(r1)
> -	li	r5,SIGSEGV
> +	li	r4,SIGSEGV
>   	bl      bad_page_fault
>   MMU_FTR_SECTION_ELSE
>   	bl      unknown_exception
> diff --git a/arch/powerpc/kernel/head_8xx.S b/arch/powerpc/kernel/head_8xx.S
> index 8acd365a2be6..71ad7ce28469 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -376,10 +376,9 @@ do_databreakpoint:
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	mfspr	r4,SPRN_BAR
>   	stw	r4,_DAR(r11)
> -#ifdef CONFIG_VMAP_STACK
> -	lwz	r5,_DSISR(r11)
> -#else
> +#ifndef CONFIG_VMAP_STACK
>   	mfspr	r5,SPRN_DSISR
> +	stw	r5,_DSISR(r11)
>   #endif
>   	EXC_XFER_STD(0x1c00, do_break)
>   
> diff --git a/arch/powerpc/kernel/head_book3s_32.S b/arch/powerpc/kernel/head_book3s_32.S
> index 7addf67832f9..5875f8795d5b 100644
> --- a/arch/powerpc/kernel/head_book3s_32.S
> +++ b/arch/powerpc/kernel/head_book3s_32.S
> @@ -689,7 +689,10 @@ handle_page_fault_tramp_1:
>   #endif
>   	/* fall through */
>   handle_page_fault_tramp_2:
> +	andis.	r0, r5, DSISR_DABRMATCH@h
> +	bne-	1f
>   	EXC_XFER_LITE(0x300, handle_page_fault)
> +1:	EXC_XFER_STD(0x300, do_break)
>   
>   #ifdef CONFIG_VMAP_STACK
>   .macro save_regs_thread		thread
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index d421a2c7f822..0bdd3ed653df 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -660,11 +660,10 @@ static void do_break_handler(struct pt_regs *regs)
>   	}
>   }
>   
> -void do_break (struct pt_regs *regs, unsigned long address,
> -		    unsigned long error_code)
> +void do_break(struct pt_regs *regs)
>   {
>   	current->thread.trap_nr = TRAP_HWBKPT;
> -	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, error_code,
> +	if (notify_die(DIE_DABR_MATCH, "dabr_match", regs, regs->dsisr,
>   			11, SIGSEGV) == NOTIFY_STOP)
>   		return;
>   
> @@ -682,7 +681,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
>   		do_break_handler(regs);
>   
>   	/* Deliver the signal to userspace */
> -	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
> +	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
>   }
>   #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 5006dcbe1d9f..902fcbd1a778 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1641,7 +1641,7 @@ void alignment_exception(struct pt_regs *regs)
>   	if (user_mode(regs))
>   		_exception(sig, regs, code, regs->dar);
>   	else
> -		bad_page_fault(regs, regs->dar, sig);
> +		bad_page_fault(regs, sig);
>   
>   bail:
>   	exception_exit(prev_state);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 0f0bd4af4b2d..731518e7d56f 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1537,7 +1537,7 @@ long do_hash_fault(struct pt_regs *regs)
>   	 * the access, or panic if there isn't a handler.
>   	 */
>   	if (unlikely(in_nmi())) {
> -		bad_page_fault(regs, ea, SIGSEGV);
> +		bad_page_fault(regs, SIGSEGV);
>   		return 0;
>   	}
>   
> @@ -1576,7 +1576,7 @@ long do_hash_fault(struct pt_regs *regs)
>   			else
>   				_exception(SIGBUS, regs, BUS_ADRERR, ea);
>   		} else {
> -			bad_page_fault(regs, ea, SIGBUS);
> +			bad_page_fault(regs, SIGBUS);
>   		}
>   		err = 0;
>   
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index cc34d50874c1..ae89ad516247 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -898,7 +898,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
>   		if (user_mode(regs))
>   			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>   		else
> -			bad_page_fault(regs, regs->dar, SIGSEGV);
> +			bad_page_fault(regs, SIGSEGV);
>   	} else if (err == -EINVAL) {
>   		unrecoverable_exception(regs);
>   	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index 390a296b16a3..e11989be8f1c 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -562,14 +562,14 @@ long do_page_fault(struct pt_regs *regs)
>   	/* 32 and 64e handle errors in their asm code */
>   	if (unlikely(err)) {
>   		if (err > 0) {
> -			bad_page_fault(regs, address, err);
> +			bad_page_fault(regs, err);
>   			err = 0;
>   		} else {
>   			/*
>   			 * do_break() may change NV GPRS while handling the
>   			 * breakpoint. Return -ve to caller to do that.
>   			 */
> -			do_break(regs, address, error_code);
> +			do_break(regs);
>   		}
>   	}
>   #endif
> @@ -591,14 +591,14 @@ long hash__do_page_fault(struct pt_regs *regs)
>   	err = __do_page_fault(regs, address, error_code);
>   	if (unlikely(err)) {
>   		if (err > 0) {
> -			bad_page_fault(regs, address, err);
> +			bad_page_fault(regs, err);
>   			err = 0;
>   		} else {
>   			/*
>   			 * do_break() may change NV GPRS while handling the
>   			 * breakpoint. Return -ve to caller to do that.
>   			 */
> -			do_break(regs, address, error_code);
> +			do_break(regs);
>   		}
>   	}
>   
> @@ -612,7 +612,7 @@ NOKPROBE_SYMBOL(hash__do_page_fault);
>    * It is called from the DSI and ISI handlers in head.S and from some
>    * of the procedures in traps.c.
>    */
> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void bad_page_fault(struct pt_regs *regs, int sig)
>   {
>   	const struct exception_table_entry *entry;
>   	int is_write = page_fault_is_write(regs->dsisr);
> diff --git a/arch/powerpc/platforms/8xx/machine_check.c b/arch/powerpc/platforms/8xx/machine_check.c
> index 88dedf38eccd..656365975895 100644
> --- a/arch/powerpc/platforms/8xx/machine_check.c
> +++ b/arch/powerpc/platforms/8xx/machine_check.c
> @@ -26,7 +26,7 @@ int machine_check_8xx(struct pt_regs *regs)
>   	 * to deal with that than having a wart in the mcheck handler.
>   	 * -- BenH
>   	 */
> -	bad_page_fault(regs, regs->dar, SIGBUS);
> +	bad_page_fault(regs, SIGBUS);
>   	return 1;
>   #else
>   	return 0;
> 
