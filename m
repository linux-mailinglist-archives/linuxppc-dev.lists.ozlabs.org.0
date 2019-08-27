Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B6BFD9DD7C
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 08:17:22 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46HdvM4VWkzDqF5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 27 Aug 2019 16:17:19 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="M3TPyS1k"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46HdrL008XzDqft
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 27 Aug 2019 16:14:41 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46HdrF3TF9z9ty3x;
 Tue, 27 Aug 2019 08:14:37 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=M3TPyS1k; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id jDh0Innae-QX; Tue, 27 Aug 2019 08:14:37 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46HdrF2DFmz9ty3l;
 Tue, 27 Aug 2019 08:14:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566886477; bh=tU2ZQbP9hJaX/GbmjNnXjFPIxJbvvQnAJNlh0E15Vd0=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=M3TPyS1kg/M4Ue75ZmfAFNGr3t+ZaMNc0oFbjnLFWNTrGzrUtLQ7pBX9US9wmPRdE
 HjV61Zev6KFkYWbvr19TWs0H9600094D9273JSIdnBBI+/lBJpcSvMwkeIxvLe2Bbd
 Q0BV5LU1gOmsrEBtnh0Sxujh27pyoBnwIQ8vFtj8=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 39BC38B793;
 Tue, 27 Aug 2019 08:14:38 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id pbvmdsRKVqzP; Tue, 27 Aug 2019 08:14:38 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E1C7E8B74C;
 Tue, 27 Aug 2019 08:14:37 +0200 (CEST)
Subject: Re: [PATCH 2/4] powerpc/64s: remove support for kernel-mode syscalls
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827033010.28090-1-npiggin@gmail.com>
 <20190827033010.28090-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <b6f8ab88-75ec-560d-6d35-9ee7bfdf5e65@c-s.fr>
Date: Tue, 27 Aug 2019 08:14:37 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827033010.28090-4-npiggin@gmail.com>
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

Euh ... That's a duplicate of [PATCH 2/4] "powerpc/64: remove support 
for kernel-mode syscalls" ?

Le 27/08/2019 à 05:30, Nicholas Piggin a écrit :
> There is support for the kernel to execute the 'sc 0' instruction and
> make a system call to itself. This is a relic that is unused in the
> tree, therefore untested. It's also highly questionable for modules to
> be doing this.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/entry_64.S       | 21 ++++++---------------
>   arch/powerpc/kernel/exceptions-64s.S |  2 --
>   2 files changed, 6 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 0a0b5310f54a..6467bdab8d40 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -69,24 +69,20 @@ BEGIN_FTR_SECTION
>   	bne	.Ltabort_syscall
>   END_FTR_SECTION_IFSET(CPU_FTR_TM)
>   #endif
> -	andi.	r10,r12,MSR_PR
>   	mr	r10,r1
> -	addi	r1,r1,-INT_FRAME_SIZE
> -	beq-	1f
>   	ld	r1,PACAKSAVE(r13)
> -1:	std	r10,0(r1)
> +	std	r10,0(r1)
>   	std	r11,_NIP(r1)
>   	std	r12,_MSR(r1)
>   	std	r0,GPR0(r1)
>   	std	r10,GPR1(r1)
> -	beq	2f			/* if from kernel mode */
>   #ifdef CONFIG_PPC_FSL_BOOK3E
>   START_BTB_FLUSH_SECTION
>   	BTB_FLUSH(r10)
>   END_BTB_FLUSH_SECTION
>   #endif
>   	ACCOUNT_CPU_USER_ENTRY(r13, r10, r11)
> -2:	std	r2,GPR2(r1)
> +	std	r2,GPR2(r1)
>   	std	r3,GPR3(r1)
>   	mfcr	r2
>   	std	r4,GPR4(r1)
> @@ -122,14 +118,13 @@ END_BTB_FLUSH_SECTION
>   
>   #if defined(CONFIG_VIRT_CPU_ACCOUNTING_NATIVE) && defined(CONFIG_PPC_SPLPAR)
>   BEGIN_FW_FTR_SECTION
> -	beq	33f
> -	/* if from user, see if there are any DTL entries to process */
> +	/* see if there are any DTL entries to process */
>   	ld	r10,PACALPPACAPTR(r13)	/* get ptr to VPA */
>   	ld	r11,PACA_DTL_RIDX(r13)	/* get log read index */
>   	addi	r10,r10,LPPACA_DTLIDX
>   	LDX_BE	r10,0,r10		/* get log write index */
> -	cmpd	cr1,r11,r10
> -	beq+	cr1,33f
> +	cmpd	r11,r10
> +	beq+	33f
>   	bl	accumulate_stolen_time
>   	REST_GPR(0,r1)
>   	REST_4GPRS(3,r1)
> @@ -203,6 +198,7 @@ system_call:			/* label this so stack traces look sane */
>   	mtctr   r12
>   	bctrl			/* Call handler */
>   
> +	/* syscall_exit can exit to kernel mode, via ret_from_kernel_thread */
>   .Lsyscall_exit:
>   	std	r3,RESULT(r1)
>   
> @@ -216,11 +212,6 @@ system_call:			/* label this so stack traces look sane */
>   	ld	r12, PACA_THREAD_INFO(r13)
>   
>   	ld	r8,_MSR(r1)
> -#ifdef CONFIG_PPC_BOOK3S
> -	/* No MSR:RI on BookE */
> -	andi.	r10,r8,MSR_RI
> -	beq-	.Lunrecov_restore
> -#endif
>   
>   /*
>    * This is a few instructions into the actual syscall exit path (which actually
> diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
> index 6ba3cc2ef8ab..768f133de4f1 100644
> --- a/arch/powerpc/kernel/exceptions-64s.S
> +++ b/arch/powerpc/kernel/exceptions-64s.S
> @@ -1521,8 +1521,6 @@ EXC_COMMON(trap_0b_common, 0xb00, unknown_exception)
>    * system call / hypercall (0xc00, 0x4c00)
>    *
>    * The system call exception is invoked with "sc 0" and does not alter HV bit.
> - * There is support for kernel code to invoke system calls but there are no
> - * in-tree users.
>    *
>    * The hypercall is invoked with "sc 1" and sets HV=1.
>    *
> 
