Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C03A7A0691
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 15:56:12 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VaujRNU3;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Rmf492DPFz3cBN
	for <lists+linuxppc-dev@lfdr.de>; Thu, 14 Sep 2023 23:56:09 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=VaujRNU3;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Rmf3H23bRz3c2D
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 14 Sep 2023 23:55:23 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1694699721;
	bh=o8o8jDofRoRgnbHKjb0mJYlD6JP64jWv24MHd3G+E18=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=VaujRNU3E1mvPJuHTcqi+E9b6y79P1bwqG1kLKW6Z/63d6I/cu5i/xfCT2uoKOyIp
	 zwZKbxDg7hOweWhfBcnX5v6eBw4OT5y0BfGUYQJu7vMz55GzyV3Onwl166xAD8nls+
	 tUtZ3xJoL9sGJEFl7aN+E+T0vQLEgfg0UxPQvlxXxYzk80Fkh9CkzHflMK6SqziP8e
	 Eug+BJtKs7+oyAXbFTv8yrDe7L6SGRxvM1oIuatUcwsd+Ch1oOueolt0prVt7wY9xq
	 GSvfJZWSOd2uSeUeKCZ16TOWVWjacQvygU/a4y30qoJbBaH51BNTWwdnaFTT4nGTgA
	 YJRb2lgJfsEkA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Rmf3D6xLrz4wxf;
	Thu, 14 Sep 2023 23:55:20 +1000 (AEST)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Benjamin Gray <bgray@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH] powerpc/dexcr: Move HASHCHK trap handler
In-Reply-To: <20230825014910.488822-1-bgray@linux.ibm.com>
References: <20230825014910.488822-1-bgray@linux.ibm.com>
Date: Thu, 14 Sep 2023 23:55:18 +1000
Message-ID: <87o7i47tbt.fsf@mail.lhotse>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Benjamin Gray <bgray@linux.ibm.com>, ruscur@russell.cc
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Benjamin Gray <bgray@linux.ibm.com> writes:
> To determine if a trap was caused by a HASHCHK instruction, we inspect
> the user instruction that triggered the trap. However this may sleep
> if the page needs to be faulted in.

It would be good to include the output from the might_sleep() check that
failed.

And I think this was found by syzkaller? If so we should say so.

cheers

> Move the HASHCHK handler logic to after we allow IRQs, which is fine
> because we are only interested in HASHCHK if it's a user space trap.
>
> Fixes: 5bcba4e6c13f ("powerpc/dexcr: Handle hashchk exception")
> Signed-off-by: Benjamin Gray <bgray@linux.ibm.com>
> ---
>  arch/powerpc/kernel/traps.c | 56 ++++++++++++++++++++++++-------------
>  1 file changed, 36 insertions(+), 20 deletions(-)
>
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index f5ce282dc4b8..32b5e841ea97 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1512,23 +1512,11 @@ static void do_program_check(struct pt_regs *regs)
>  			return;
>  		}
>  
> -		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE) && user_mode(regs)) {
> -			ppc_inst_t insn;
> -
> -			if (get_user_instr(insn, (void __user *)regs->nip)) {
> -				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
> -				return;
> -			}
> -
> -			if (ppc_inst_primary_opcode(insn) == 31 &&
> -			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
> -				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
> -				return;
> -			}
> +		/* User mode considers other cases after enabling IRQs */
> +		if (!user_mode(regs)) {
> +			_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
> +			return;
>  		}
> -
> -		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
> -		return;
>  	}
>  #ifdef CONFIG_PPC_TRANSACTIONAL_MEM
>  	if (reason & REASON_TM) {
> @@ -1561,16 +1549,44 @@ static void do_program_check(struct pt_regs *regs)
>  
>  	/*
>  	 * If we took the program check in the kernel skip down to sending a
> -	 * SIGILL. The subsequent cases all relate to emulating instructions
> -	 * which we should only do for userspace. We also do not want to enable
> -	 * interrupts for kernel faults because that might lead to further
> -	 * faults, and loose the context of the original exception.
> +	 * SIGILL. The subsequent cases all relate to user space, such as
> +	 * emulating instructions which we should only do for user space. We
> +	 * also do not want to enable interrupts for kernel faults because that
> +	 * might lead to further faults, and loose the context of the original
> +	 * exception.
>  	 */
>  	if (!user_mode(regs))
>  		goto sigill;
>  
>  	interrupt_cond_local_irq_enable(regs);
>  
> +	/*
> +	 * (reason & REASON_TRAP) is mostly handled before enabling IRQs,
> +	 * except get_user_instr() can sleep so we cannot reliably inspect the
> +	 * current instruction in that context. Now that we know we are
> +	 * handling a user space trap and can sleep, we can check if the trap
> +	 * was a hashchk failure.
> +	 */
> +	if (reason & REASON_TRAP) {
> +		if (cpu_has_feature(CPU_FTR_DEXCR_NPHIE)) {
> +			ppc_inst_t insn;
> +
> +			if (get_user_instr(insn, (void __user *)regs->nip)) {
> +				_exception(SIGSEGV, regs, SEGV_MAPERR, regs->nip);
> +				return;
> +			}
> +
> +			if (ppc_inst_primary_opcode(insn) == 31 &&
> +			    get_xop(ppc_inst_val(insn)) == OP_31_XOP_HASHCHK) {
> +				_exception(SIGILL, regs, ILL_ILLOPN, regs->nip);
> +				return;
> +			}
> +		}
> +
> +		_exception(SIGTRAP, regs, TRAP_BRKPT, regs->nip);
> +		return;
> +	}
> +
>  	/* (reason & REASON_ILLEGAL) would be the obvious thing here,
>  	 * but there seems to be a hardware bug on the 405GP (RevD)
>  	 * that means ESR is sometimes set incorrectly - either to
> -- 
> 2.41.0
