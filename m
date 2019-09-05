Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 75FC1AA903
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Sep 2019 18:31:51 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46PR6D043dzDr2q
	for <lists+linuxppc-dev@lfdr.de>; Fri,  6 Sep 2019 02:31:48 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="vwkhfuva"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46PR3L6D3KzDqT9
 for <linuxppc-dev@lists.ozlabs.org>; Fri,  6 Sep 2019 02:29:16 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46PR3C2vsHz9ty61;
 Thu,  5 Sep 2019 18:29:11 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=vwkhfuva; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id sU-jrLmXNOVj; Thu,  5 Sep 2019 18:29:11 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46PR3C1dGwz9ty60;
 Thu,  5 Sep 2019 18:29:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1567700951; bh=ggSp87TUYVfzbyvWLz6Ro9MaTjqD26FCZ/9QeXY4lXY=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=vwkhfuvaT/f+ABFXLs2gvR/9A9IHRbAMUQJbkSNKlIeKz4C+KLOxZg9uCVF6I6U2P
 xP3MwB/ccXm1ZyaYprRBmrMlm79PjpDpFq8hXCEhskmCvbFcgdXu2TKhyL3u4mG7eD
 HwVdJboGGWP2zrbw+r+3XUiDApNyFOg9ENCAhCTI=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id DF9DD8B911;
 Thu,  5 Sep 2019 18:29:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id B11xxlsNWHLW; Thu,  5 Sep 2019 18:29:12 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 80AD68B91C;
 Thu,  5 Sep 2019 18:29:12 +0200 (CEST)
Subject: Re: [PATCH v3] powerpc/64: system call implement the bulk of the
 logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190905123512.24311-1-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <5407d893-5d04-5363-906b-32607479c925@c-s.fr>
Date: Thu, 5 Sep 2019 18:29:12 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190905123512.24311-1-npiggin@gmail.com>
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



Le 05/09/2019 à 14:35, Nicholas Piggin a écrit :
> System call entry and particularly exit code is beyond the limit of what
> is reasonable to implement in asm.
> 
> This conversion moves all conditional branches out of the asm code,
> except for the case that all GPRs should be restored at exit.
> 
> Null syscall test is about 5% faster after this patch, because the exit
> work is handled under local_irq_disable, and the hard mask and pending
> interrupt replay is handled after that, which avoids games with MSR.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> v3:
> - Fix !KUAP build [mpe]
> - Fix BookE build/boot [mpe]
> - Don't trace irqs with MSR[RI]=0
> - Don't allow syscall_exit_prepare to be ftraced, because function
>    graph tracing which traces exits barfs after the IRQ state is
>    prepared for kernel exit.
> - Fix BE syscall table to use normal function descriptors now that they
>    are called from C.
> - Comment syscall_exit_prepare.
> ---
>   arch/powerpc/include/asm/asm-prototypes.h     |  11 -
>   .../powerpc/include/asm/book3s/64/kup-radix.h |  14 +-
>   arch/powerpc/include/asm/cputime.h            |  24 ++
>   arch/powerpc/include/asm/hw_irq.h             |   4 +
>   arch/powerpc/include/asm/ptrace.h             |   3 +
>   arch/powerpc/include/asm/signal.h             |   3 +
>   arch/powerpc/include/asm/switch_to.h          |   5 +
>   arch/powerpc/include/asm/time.h               |   3 +
>   arch/powerpc/kernel/Makefile                  |   3 +-
>   arch/powerpc/kernel/entry_64.S                | 337 +++---------------
>   arch/powerpc/kernel/signal.h                  |   2 -
>   arch/powerpc/kernel/syscall_64.c              | 195 ++++++++++
>   arch/powerpc/kernel/systbl.S                  |   9 +-
>   13 files changed, 300 insertions(+), 313 deletions(-)
>   create mode 100644 arch/powerpc/kernel/syscall_64.c
> 

[...]

> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 5a3e0b5c9ad1..15bc2a872a76 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -63,12 +63,6 @@ exception_marker:
>   
>   	.globl system_call_common
>   system_call_common:
> -#ifdef CONFIG_PPC_TRANSACTIONAL_MEM
> -BEGIN_FTR_SECTION
> -	extrdi.	r10, r12, 1, (63-MSR_TS_T_LG) /* transaction active? */
> -	bne	.Ltabort_syscall
> -END_FTR_SECTION_IFSET(CPU_FTR_TM)
> -#endif
>   	mr	r10,r1
>   	ld	r1,PACAKSAVE(r13)
>   	std	r10,0(r1)
> @@ -76,350 +70,111 @@ END_FTR_SECTION_IFSET(CPU_FTR_TM)
>   	std	r12,_MSR(r1)
>   	std	r0,GPR0(r1)
>   	std	r10,GPR1(r1)
> +	std	r2,GPR2(r1)
>   #ifdef CONFIG_PPC_FSL_BOOK3E
>   START_BTB_FLUSH_SECTION
>   	BTB_FLUSH(r10)
>   END_BTB_FLUSH_SECTION
>   #endif
> -	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
> -	std	r2,GPR2(r1)
> +	ld	r2,PACATOC(r13)
> +	mfcr	r12
> +	li	r11,0
> +	/* Can we avoid saving r3-r8 in common case? */
>   	std	r3,GPR3(r1)
> -	mfcr	r2
>   	std	r4,GPR4(r1)
>   	std	r5,GPR5(r1)
>   	std	r6,GPR6(r1)
>   	std	r7,GPR7(r1)
>   	std	r8,GPR8(r1)
> -	li	r11,0
> +	/* Zero r9-r12, this should only be required when restoring all GPRs */
>   	std	r11,GPR9(r1)
>   	std	r11,GPR10(r1)
>   	std	r11,GPR11(r1)
>   	std	r11,GPR12(r1)
> -	std	r11,_XER(r1)
> -	std	r11,_CTR(r1)
>   	std	r9,GPR13(r1)
>   	SAVE_NVGPRS(r1)
> +	std	r11,_XER(r1)
> +	std	r11,_CTR(r1)
>   	mflr	r10
> +
>   	/*
>   	 * This clears CR0.SO (bit 28), which is the error indication on
>   	 * return from this system call.
>   	 */
> -	rldimi	r2,r11,28,(63-28)
> +	rldimi	r12,r11,28,(63-28)
>   	li	r11,0xc00
>   	std	r10,_LINK(r1)
>   	std	r11,_TRAP(r1)
> +	std	r12,_CCR(r1)
>   	std	r3,ORIG_GPR3(r1)
> -	std	r2,_CCR(r1)
> -	ld	r2,PACATOC(r13)
> -	addi	r9,r1,STACK_FRAME_OVERHEAD
> +	addi	r10,r1,STACK_FRAME_OVERHEAD
>   	ld	r11,exception_marker@toc(r2)
> -	std	r11,-16(r9)		/* "regshere" marker */
> -
> -	kuap_check_amr r10, r11
> -
> -#if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
> -BEGIN_FW_FTR_SECTION
> -	/* see if there are any DTL entries to process */
> -	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
> -	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
> -	addi	r10,r10,LPPACA_DTLIDX
> -	LDX_BE	r10,0,r10		/* get log write index */
> -	cmpd	r11,r10
> -	beq+	33f
> -	bl	accumulate_stolen_time
> -	REST_GPR(0,r1)
> -	REST_4GPRS(3,r1)
> -	REST_2GPRS(7,r1)
> -	addi	r9,r1,STACK_FRAME_OVERHEAD
> -33:
> -END_FW_FTR_SECTION_IFSET(FW_FEATURE_SPLPAR)
> -#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE && CONFIG_PPC_SPLPAR */
> -
> -	/*
> -	 * A syscall should always be called with interrupts enabled
> -	 * so we just unconditionally hard-enable here. When some kind
> -	 * of irq tracing is used, we additionally check that condition
> -	 * is correct
> -	 */
> -#if defined(CONFIG_PPC_IRQ_SOFT_MASK_DEBUG) && defined(CONFIG_BUG)
> -	lbz	r10,PACAIRQSOFTMASK(r13)
> -1:	tdnei	r10,IRQS_ENABLED
> -	EMIT_BUG_ENTRY 1b,__FILE__,__LINE__,BUGFLAG_WARNING
> -#endif
> -
> -#ifdef CONFIG_PPC_BOOK3E
> -	wrteei	1
> -#else
> -	li	r11,MSR_RI
> -	ori	r11,r11,MSR_EE
> -	mtmsrd	r11,1
> -#endif /* CONFIG_PPC_BOOK3E */
> -
> -system_call:			/* label this so stack traces look sane */
> -	/* We do need to set SOFTE in the stack frame or the return
> -	 * from interrupt will be painful
> -	 */
> -	li	r10,IRQS_ENABLED
> -	std	r10,SOFTE(r1)
> +	std	r11,-16(r10)		/* "regshere" marker */
>   
> -	ld	r11, PACA_THREAD_INFO(r13)
> -	ld	r10,TI_FLAGS(r11)
> -	andi.	r11,r10,_TIF_SYSCALL_DOTRACE
> -	bne	.Lsyscall_dotrace		/* does not return */
> -	cmpldi	0,r0,NR_syscalls
> -	bge-	.Lsyscall_enosys
> +	/* Calling convention has r9 = orig r0, r10 = regs */
> +	mr	r9,r0
> +	bl	system_call_exception
>   
> -.Lsyscall:
> -/*
> - * Need to vector to 32 Bit or default sys_call_table here,
> - * based on caller's run-mode / personality.
> - */
> -	ld	r11,SYS_CALL_TABLE@toc(2)
> -	andis.	r10,r10,_TIF_32BIT@h
> -	beq	15f
> -	ld	r11,COMPAT_SYS_CALL_TABLE@toc(2)
> -	clrldi	r3,r3,32
> -	clrldi	r4,r4,32
> -	clrldi	r5,r5,32
> -	clrldi	r6,r6,32
> -	clrldi	r7,r7,32
> -	clrldi	r8,r8,32
> -15:
> -	slwi	r0,r0,3
> -
> -	barrier_nospec_asm
> -	/*
> -	 * Prevent the load of the handler below (based on the user-passed
> -	 * system call number) being speculatively executed until the test
> -	 * against NR_syscalls and branch to .Lsyscall_enosys above has
> -	 * committed.
> -	 */
> -
> -	ldx	r12,r11,r0	/* Fetch system call handler [ptr] */
> -	mtctr   r12
> -	bctrl			/* Call handler */
> -
> -	/* syscall_exit can exit to kernel mode, via ret_from_kernel_thread */
>   .Lsyscall_exit:
> -	std	r3,RESULT(r1)
> +	addi    r4,r1,STACK_FRAME_OVERHEAD
> +	bl	syscall_exit_prepare
>   
> -#ifdef CONFIG_DEBUG_RSEQ
> -	/* Check whether the syscall is issued inside a restartable sequence */
> -	addi    r3,r1,STACK_FRAME_OVERHEAD
> -	bl      rseq_syscall
> -	ld	r3,RESULT(r1)
> -#endif
> -
> -	ld	r12, PACA_THREAD_INFO(r13)
> -
> -	ld	r8,_MSR(r1)
> -
> -/*
> - * This is a few instructions into the actual syscall exit path (which actually
> - * starts at .Lsyscall_exit) to cater to kprobe blacklisting and to reduce the
> - * number of visible symbols for profiling purposes.
> - *
> - * We can probe from system_call until this point as MSR_RI is set. But once it
> - * is cleared below, we won't be able to take a trap.
> - *
> - * This is blacklisted from kprobes further below with _ASM_NOKPROBE_SYMBOL().
> - */
> -system_call_exit:
> -	/*
> -	 * Disable interrupts so current_thread_info()->flags can't change,
> -	 * and so that we don't get interrupted after loading SRR0/1.
> -	 *
> -	 * Leave MSR_RI enabled for now, because with THREAD_INFO_IN_TASK we
> -	 * could fault on the load of the TI_FLAGS below.
> -	 */
> -#ifdef CONFIG_PPC_BOOK3E
> -	wrteei	0
> -#else
> -	li	r11,MSR_RI
> -	mtmsrd	r11,1
> -#endif /* CONFIG_PPC_BOOK3E */
> -
> -	ld	r9,TI_FLAGS(r12)
> -	li	r11,-MAX_ERRNO
> -	andi.	r0,r9,(_TIF_SYSCALL_DOTRACE|_TIF_SINGLESTEP|_TIF_USER_WORK_MASK|_TIF_PERSYSCALL_MASK)
> -	bne-	.Lsyscall_exit_work
> +	ld	r2,_CCR(r1)
> +	ld	r4,_NIP(r1)
> +	ld	r5,_MSR(r1)
> +	ld	r6,_LINK(r1)
>   
> -	andi.	r0,r8,MSR_FP
> -	beq 2f
> -#ifdef CONFIG_ALTIVEC
> -	andis.	r0,r8,MSR_VEC@h
> -	bne	3f
> -#endif
> -2:	addi    r3,r1,STACK_FRAME_OVERHEAD
> -	bl	restore_math
> -	ld	r8,_MSR(r1)
> -	ld	r3,RESULT(r1)
> -	li	r11,-MAX_ERRNO
> -
> -3:	cmpld	r3,r11
> -	ld	r5,_CCR(r1)
> -	bge-	.Lsyscall_error
> -.Lsyscall_error_cont:
> -	ld	r7,_NIP(r1)
>   BEGIN_FTR_SECTION
>   	stdcx.	r0,0,r1			/* to clear the reservation */
>   END_FTR_SECTION_IFCLR(CPU_FTR_STCX_CHECKS_ADDRESS)
> -	andi.	r6,r8,MSR_PR
> -	ld	r4,_LINK(r1)
>   
> -	kuap_check_amr r10, r11
> +	mtspr	SPRN_SRR0,r4
> +	mtspr	SPRN_SRR1,r5

That looks dangerous. Once you have modified SRR0 and SRR1, your 
exception becomes unrecoverable, so this should be done as close as 
possible to the rfi. Here you seem to do many thinks inbetween, 
including restoring some registers from the stack.

Christophe

