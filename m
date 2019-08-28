Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F08EC9FDDB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 11:07:26 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JKd76vLMzDr6f
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 19:07:23 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="wN1YuG8s"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JKX55bfBzDqN7
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 19:03:00 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46JKWv1brfz9tyhj;
 Wed, 28 Aug 2019 11:02:51 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=wN1YuG8s; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id u5dsNTY73UfT; Wed, 28 Aug 2019 11:02:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46JKWv0Rjsz9tyhc;
 Wed, 28 Aug 2019 11:02:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566982971; bh=japZNXUXijb+/L6RjGTAO9kiWJVY+MqWjZntNP2L0VI=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=wN1YuG8s/+zIDCMcfG5yF48xpww91bDd54Pa3mBrjD4z+11I8p/XrTbXMuXPeJ6dm
 rD0hsopY9wvm8p1fmPHf8Iu2rWsn4929gi/f9ewXbuBsGxUnwI48cLs/wneC4TPQBF
 eVaAxKd/w04AP9vDc6BUZgyDIdOODDJ5xAriuCPs=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2F1B28B856;
 Wed, 28 Aug 2019 11:02:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id unzhHBicQNrx; Wed, 28 Aug 2019 11:02:52 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA8188B877;
 Wed, 28 Aug 2019 11:02:51 +0200 (CEST)
Subject: Re: [PATCH v2 3/4] powerpc/64: system call remove non-volatile GPR
 save optimisation
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <3f91c62a-6d77-d34c-9477-3077afa5f4e8@c-s.fr>
Date: Wed, 28 Aug 2019 11:02:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827135548.21457-4-npiggin@gmail.com>
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



Le 27/08/2019 à 15:55, Nicholas Piggin a écrit :
> powerpc has an optimisation where interrupts avoid saving the
> non-volatile (or callee saved) registers to the interrupt stack frame if
> they are not required.
> 
> Two problems with this are that an interrupt does not always know
> whether it will need non-volatiles; and if it does need them, they can
> only be saved from the entry-scoped asm code (because we don't control
> what the C compiler does with these registers).
> 
> system calls are the most difficult: some system calls always require
> all registers (e.g., fork, to copy regs into the child).  Sometimes
> registers are only required under certain conditions (e.g., tracing,
> signal delivery). These cases require ugly logic in the call chains
> (e.g., ppc_fork), and require a lot of logic to be implemented in asm.

Do you really find it ugly to just call function nvgprs() before calling 
sys_fork() ? I guess there are things a lot uglier.

> 
> So remove the optimisation for system calls, and always save NVGPRs on
> entry. Modern high performance CPUs are not so sensitive, because the
> stores are dense in cache and can be hidden by other expensive work in
> the syscall path -- the null syscall selftests benchmark on POWER9 is
> not slowed (124.40ns before and 123.64ns after, i.e., within the noise).

I did the test on PPC32:

On an 885, null_syscall reports 2227ns (132MHz)
If saving non-volatile regs, it goes to 2419, ie +8.6%

On an 8321, null_syscall reports 1021ns (333MHz)
If saving non-volatile regs, it goes to 1100, ie +7.7%

So unless going to C compensates this degradation, I guess it is not 
worth it on PPC32.

> 
> Other interrupts retain the NVGPR optimisation for now.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
> Changes since v1:
> - Improve changelog
> - Fix clone3 spu table entry (Segher)
> 
>   arch/powerpc/kernel/entry_64.S           | 72 +++++-------------------
>   arch/powerpc/kernel/syscalls/syscall.tbl | 22 +++++---
>   2 files changed, 28 insertions(+), 66 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/entry_64.S b/arch/powerpc/kernel/entry_64.S
> index 6467bdab8d40..5a3e0b5c9ad1 100644
> --- a/arch/powerpc/kernel/entry_64.S
> +++ b/arch/powerpc/kernel/entry_64.S
> @@ -98,13 +98,14 @@ END_BTB_FLUSH_SECTION
>   	std	r11,_XER(r1)
>   	std	r11,_CTR(r1)
>   	std	r9,GPR13(r1)
> +	SAVE_NVGPRS(r1)
>   	mflr	r10
>   	/*
>   	 * This clears CR0.SO (bit 28), which is the error indication on
>   	 * return from this system call.
>   	 */
>   	rldimi	r2,r11,28,(63-28)
> -	li	r11,0xc01
> +	li	r11,0xc00
>   	std	r10,_LINK(r1)
>   	std	r11,_TRAP(r1)
>   	std	r3,ORIG_GPR3(r1)
> @@ -323,7 +324,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   
>   /* Traced system call support */
>   .Lsyscall_dotrace:
> -	bl	save_nvgprs
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_syscall_trace_enter
>   
> @@ -408,7 +408,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   	mtmsrd	r10,1
>   #endif /* CONFIG_PPC_BOOK3E */
>   
> -	bl	save_nvgprs
>   	addi	r3,r1,STACK_FRAME_OVERHEAD
>   	bl	do_syscall_trace_leave
>   	b	ret_from_except
> @@ -442,62 +441,6 @@ END_FTR_SECTION_IFSET(CPU_FTR_HAS_PPR)
>   _ASM_NOKPROBE_SYMBOL(system_call_common);
>   _ASM_NOKPROBE_SYMBOL(system_call_exit);
>   
> -/* Save non-volatile GPRs, if not already saved. */
> -_GLOBAL(save_nvgprs)
> -	ld	r11,_TRAP(r1)
> -	andi.	r0,r11,1
> -	beqlr-
> -	SAVE_NVGPRS(r1)
> -	clrrdi	r0,r11,1
> -	std	r0,_TRAP(r1)
> -	blr
> -_ASM_NOKPROBE_SYMBOL(save_nvgprs);

I see it is added back somewhere below. Why don't you leave it where it is ?

> -
> -	
> -/*
> - * The sigsuspend and rt_sigsuspend system calls can call do_signal
> - * and thus put the process into the stopped state where we might
> - * want to examine its user state with ptrace.  Therefore we need
> - * to save all the nonvolatile registers (r14 - r31) before calling
> - * the C code.  Similarly, fork, vfork and clone need the full
> - * register state on the stack so that it can be copied to the child.
> - */
> -
> -_GLOBAL(ppc_fork)
> -	bl	save_nvgprs
> -	bl	sys_fork
> -	b	.Lsyscall_exit
> -
> -_GLOBAL(ppc_vfork)
> -	bl	save_nvgprs
> -	bl	sys_vfork
> -	b	.Lsyscall_exit
> -
> -_GLOBAL(ppc_clone)
> -	bl	save_nvgprs
> -	bl	sys_clone
> -	b	.Lsyscall_exit
> -
> -_GLOBAL(ppc_clone3)
> -       bl      save_nvgprs
> -       bl      sys_clone3
> -       b       .Lsyscall_exit
> -
> -_GLOBAL(ppc32_swapcontext)
> -	bl	save_nvgprs
> -	bl	compat_sys_swapcontext
> -	b	.Lsyscall_exit
> -
> -_GLOBAL(ppc64_swapcontext)
> -	bl	save_nvgprs
> -	bl	sys_swapcontext
> -	b	.Lsyscall_exit
> -
> -_GLOBAL(ppc_switch_endian)
> -	bl	save_nvgprs
> -	bl	sys_switch_endian
> -	b	.Lsyscall_exit
> -
>   _GLOBAL(ret_from_fork)
>   	bl	schedule_tail
>   	REST_NVGPRS(r1)
> @@ -516,6 +459,17 @@ _GLOBAL(ret_from_kernel_thread)
>   	li	r3,0
>   	b	.Lsyscall_exit
>   
> +/* Save non-volatile GPRs, if not already saved. */
> +_GLOBAL(save_nvgprs)
> +	ld	r11,_TRAP(r1)
> +	andi.	r0,r11,1
> +	beqlr-
> +	SAVE_NVGPRS(r1)
> +	clrrdi	r0,r11,1
> +	std	r0,_TRAP(r1)
> +	blr
> +_ASM_NOKPROBE_SYMBOL(save_nvgprs);
> +

Moved here.

>   #ifdef CONFIG_PPC_BOOK3S_64
>   
>   #define FLUSH_COUNT_CACHE	\

Christophe

