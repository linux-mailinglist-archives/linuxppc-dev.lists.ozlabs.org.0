Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A092F4D14
	for <lists+linuxppc-dev@lfdr.de>; Wed, 13 Jan 2021 15:27:45 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4DG8t652RNzDrdX
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Jan 2021 01:27:42 +1100 (AEDT)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DG8qk1gDszDrWy
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Jan 2021 01:25:29 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DG8qR4kk0zB09ZQ;
 Wed, 13 Jan 2021 15:25:23 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id DzZmyfvc238d; Wed, 13 Jan 2021 15:25:23 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DG8qR3jj8zB09ZN;
 Wed, 13 Jan 2021 15:25:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01D798B7DF;
 Wed, 13 Jan 2021 15:25:25 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id tgWD2szvCYLl; Wed, 13 Jan 2021 15:25:24 +0100 (CET)
Received: from [172.25.230.103] (po15451.idsi0.si.c-s.fr [172.25.230.103])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id A1C128B7DD;
 Wed, 13 Jan 2021 15:25:24 +0100 (CET)
Subject: Re: [PATCH v5 04/21] powerpc: bad_page_fault, do_break get registers
 from regs
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210113073215.516986-1-npiggin@gmail.com>
 <20210113073215.516986-5-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <27997243-fbec-acb5-6399-f0ee4cccfa27@csgroup.eu>
Date: Wed, 13 Jan 2021 15:25:24 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <20210113073215.516986-5-npiggin@gmail.com>
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



Le 13/01/2021 à 08:31, Nicholas Piggin a écrit :
> Similar to the previous patch this makes interrupt handler function
> types more regular so they can be wrapped with the next patch.
> 
> bad_page_fault and do_break are not performance critical.

It's a bit different between do_break() and bad_page_fault():
- do_break() is not performance critical for sure
- bad_page_fault(), it doesn't matter, because bad_page_fault() was not using the address param so 
it doesn't get anything from regs at the end.

Maybe it would be worth splitting in two patches, one for bad_page_fault() and one for do_break()

Christophe

> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/bug.h             |  4 ++--
>   arch/powerpc/include/asm/debug.h           |  3 +--
>   arch/powerpc/kernel/entry_32.S             |  3 +--
>   arch/powerpc/kernel/exceptions-64e.S       |  3 +--
>   arch/powerpc/kernel/exceptions-64s.S       |  3 +--
>   arch/powerpc/kernel/head_8xx.S             |  5 ++---
>   arch/powerpc/kernel/process.c              |  7 +++----
>   arch/powerpc/kernel/traps.c                |  2 +-
>   arch/powerpc/mm/book3s64/hash_utils.c      |  4 ++--
>   arch/powerpc/mm/book3s64/slb.c             |  2 +-
>   arch/powerpc/mm/fault.c                    | 10 +++++-----
>   arch/powerpc/platforms/8xx/machine_check.c |  2 +-
>   12 files changed, 21 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
> index f7827e993196..4220789b9a97 100644
> --- a/arch/powerpc/include/asm/bug.h
> +++ b/arch/powerpc/include/asm/bug.h
> @@ -112,8 +112,8 @@
>   
>   struct pt_regs;
>   long do_page_fault(struct pt_regs *);
> -extern void bad_page_fault(struct pt_regs *, unsigned long, int);
> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig);
> +void bad_page_fault(struct pt_regs *, int);
> +void __bad_page_fault(struct pt_regs *regs, int sig);
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
> index a32157ce0551..a94127eed56b 100644
> --- a/arch/powerpc/kernel/entry_32.S
> +++ b/arch/powerpc/kernel/entry_32.S
> @@ -673,9 +673,8 @@ handle_page_fault:
>   	lwz	r0,_TRAP(r1)
>   	clrrwi	r0,r0,1
>   	stw	r0,_TRAP(r1)
> -	mr	r5,r3
> +	mr	r4,r3		/* err arg for bad_page_fault */
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
> -	lwz	r4,_DAR(r1)
>   	bl	__bad_page_fault
>   	b	ret_from_except_full
>   
> diff --git a/arch/powerpc/kernel/exceptions-64e.S b/arch/powerpc/kernel/exceptions-64e.S
> index 43e71d86dcbf..52421042a020 100644
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
>   	bl	__bad_page_fault
>   	b	ret_from_except
>   
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 814cff2c649e..36dea2020ec5 100644
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
> index 0b2c247cfdff..7869db974185 100644
> --- a/arch/powerpc/kernel/head_8xx.S
> +++ b/arch/powerpc/kernel/head_8xx.S
> @@ -364,10 +364,9 @@ do_databreakpoint:
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
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index a66f435dabbf..4f0f81e9420b 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -659,11 +659,10 @@ static void do_break_handler(struct pt_regs *regs)
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
> @@ -681,7 +680,7 @@ void do_break (struct pt_regs *regs, unsigned long address,
>   		do_break_handler(regs);
>   
>   	/* Deliver the signal to userspace */
> -	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)address);
> +	force_sig_fault(SIGTRAP, TRAP_HWBKPT, (void __user *)regs->dar);
>   }
>   #endif	/* CONFIG_PPC_ADV_DEBUG_REGS */
>   
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index 3ec7b443fe6b..f3f6af3141ee 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1612,7 +1612,7 @@ void alignment_exception(struct pt_regs *regs)
>   	if (user_mode(regs))
>   		_exception(sig, regs, code, regs->dar);
>   	else
> -		bad_page_fault(regs, regs->dar, sig);
> +		bad_page_fault(regs, sig);
>   
>   bail:
>   	exception_exit(prev_state);
> diff --git a/arch/powerpc/mm/book3s64/hash_utils.c b/arch/powerpc/mm/book3s64/hash_utils.c
> index 8d014924ee0d..77073a256cff 100644
> --- a/arch/powerpc/mm/book3s64/hash_utils.c
> +++ b/arch/powerpc/mm/book3s64/hash_utils.c
> @@ -1539,7 +1539,7 @@ long do_hash_fault(struct pt_regs *regs)
>   	 * the access, or panic if there isn't a handler.
>   	 */
>   	if (unlikely(in_nmi())) {
> -		bad_page_fault(regs, ea, SIGSEGV);
> +		bad_page_fault(regs, SIGSEGV);
>   		return 0;
>   	}
>   
> @@ -1578,7 +1578,7 @@ long do_hash_fault(struct pt_regs *regs)
>   			else
>   				_exception(SIGBUS, regs, BUS_ADRERR, ea);
>   		} else {
> -			bad_page_fault(regs, ea, SIGBUS);
> +			bad_page_fault(regs, SIGBUS);
>   		}
>   		err = 0;
>   
> diff --git a/arch/powerpc/mm/book3s64/slb.c b/arch/powerpc/mm/book3s64/slb.c
> index 985902ce0272..c581548b533f 100644
> --- a/arch/powerpc/mm/book3s64/slb.c
> +++ b/arch/powerpc/mm/book3s64/slb.c
> @@ -874,7 +874,7 @@ void do_bad_slb_fault(struct pt_regs *regs)
>   		if (user_mode(regs))
>   			_exception(SIGSEGV, regs, SEGV_BNDERR, regs->dar);
>   		else
> -			bad_page_fault(regs, regs->dar, SIGSEGV);
> +			bad_page_fault(regs, SIGSEGV);
>   	} else if (err == -EINVAL) {
>   		unrecoverable_exception(regs);
>   	} else {
> diff --git a/arch/powerpc/mm/fault.c b/arch/powerpc/mm/fault.c
> index e170501081a7..36604ff8b3ec 100644
> --- a/arch/powerpc/mm/fault.c
> +++ b/arch/powerpc/mm/fault.c
> @@ -569,14 +569,14 @@ long do_page_fault(struct pt_regs *regs)
>   	/* 32 and 64e handle these errors in asm */
>   	if (unlikely(err)) {
>   		if (err > 0) {
> -			__bad_page_fault(regs, address, err);
> +			__bad_page_fault(regs, err);
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
> @@ -592,7 +592,7 @@ NOKPROBE_SYMBOL(do_page_fault);
>    * It is called from the DSI and ISI handlers in head.S and from some
>    * of the procedures in traps.c.
>    */
> -void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void __bad_page_fault(struct pt_regs *regs, int sig)
>   {
>   	int is_write = page_fault_is_write(regs->dsisr);
>   
> @@ -630,7 +630,7 @@ void __bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>   	die("Kernel access of bad area", regs, sig);
>   }
>   
> -void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
> +void bad_page_fault(struct pt_regs *regs, int sig)
>   {
>   	const struct exception_table_entry *entry;
>   
> @@ -639,5 +639,5 @@ void bad_page_fault(struct pt_regs *regs, unsigned long address, int sig)
>   	if (entry)
>   		instruction_pointer_set(regs, extable_fixup(entry));
>   	else
> -		__bad_page_fault(regs, address, sig);
> +		__bad_page_fault(regs, sig);
>   }
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
