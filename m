Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E449FAE5
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 08:53:06 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 46JGf83Bl3zDr4F
	for <lists+linuxppc-dev@lfdr.de>; Wed, 28 Aug 2019 16:53:04 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=pass (mailfrom) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.b="jHagoNax"; 
 dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 46JGc84T3fzDr3R
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 28 Aug 2019 16:51:19 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 46JGc33WYJz9tvVy;
 Wed, 28 Aug 2019 08:51:15 +0200 (CEST)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=jHagoNax; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id K7Ya44oKM8Nw; Wed, 28 Aug 2019 08:51:15 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 46JGc32TZDz9tvVx;
 Wed, 28 Aug 2019 08:51:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1566975075; bh=S85iCLk/pOQUjNSVCr2YFKlFNIWYn+ctGjqGFkX3AVM=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=jHagoNax4PhRXqOYkSmEzCsXGSdJZ0DZvjCXsTEnYmUKBkvqreS3fSFWZTeiu6V4t
 X8H7TcP3vCqkFYmTlP996lsgXbNSil/82onEshr57B+lQYTZEjmYFZ8Cgyr/p2Z1M/
 3ARnT2qX4A55EyCBxCgzxAZtLVUoB4iSOQ3A8gos=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 487188B868;
 Wed, 28 Aug 2019 08:51:16 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id sD9TbJLonKgp; Wed, 28 Aug 2019 08:51:16 +0200 (CEST)
Received: from [172.25.230.105] (po15451.idsi0.si.c-s.fr [172.25.230.105])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 01D6C8B856;
 Wed, 28 Aug 2019 08:51:15 +0200 (CEST)
Subject: Re: [PATCH v2 4/4] powerpc/64: system call implement the bulk of the
 logic in C
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20190827135548.21457-1-npiggin@gmail.com>
 <20190827135548.21457-5-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <1015bea4-8b51-ea3b-7e45-8825635261bb@c-s.fr>
Date: Wed, 28 Aug 2019 08:51:14 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827135548.21457-5-npiggin@gmail.com>
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
> ---
> Changes since v1:
> - Improve changelog
> - Lot of code cleanups, moving helpers out to proper header locations,
>    etc (Christophe).
> - Split unnecessary change that affected ppc32 out. I will submit it
>    independently (Christophe).
> 
>   arch/powerpc/include/asm/asm-prototypes.h     |  11 -
>   .../powerpc/include/asm/book3s/64/kup-radix.h |  12 +-
>   arch/powerpc/include/asm/cputime.h            |  22 ++
>   arch/powerpc/include/asm/ptrace.h             |   3 +
>   arch/powerpc/include/asm/signal.h             |   2 +
>   arch/powerpc/include/asm/switch_to.h          |   5 +
>   arch/powerpc/include/asm/time.h               |   3 +
>   arch/powerpc/kernel/Makefile                  |   3 +-
>   arch/powerpc/kernel/entry_64.S                | 340 +++---------------
>   arch/powerpc/kernel/signal.h                  |   2 -
>   arch/powerpc/kernel/syscall_64.c              | 177 +++++++++
>   11 files changed, 273 insertions(+), 307 deletions(-)
>   create mode 100644 arch/powerpc/kernel/syscall_64.c
> 
> diff --git a/arch/powerpc/include/asm/asm-prototypes.h b/arch/powerpc/include/asm/asm-prototypes.h
> index ec1c97a8e8cb..f00ef8924a99 100644
> --- a/arch/powerpc/include/asm/asm-prototypes.h
> +++ b/arch/powerpc/include/asm/asm-prototypes.h
> @@ -92,14 +92,6 @@ long sys_switch_endian(void);
>   notrace unsigned int __check_irq_replay(void);
>   void notrace restore_interrupts(void);
>   
> -/* ptrace */
> -long do_syscall_trace_enter(struct pt_regs *regs);
> -void do_syscall_trace_leave(struct pt_regs *regs);
> -
> -/* process */
> -void restore_math(struct pt_regs *regs);
> -void restore_tm_state(struct pt_regs *regs);
> -
>   /* prom_init (OpenFirmware) */
>   unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>   			       unsigned long pp,
> @@ -110,9 +102,6 @@ unsigned long __init prom_init(unsigned long r3, unsigned long r4,
>   void __init early_setup(unsigned long dt_ptr);
>   void early_setup_secondary(void);
>   
> -/* time */
> -void accumulate_stolen_time(void);
> -
>   /* misc runtime */
>   extern u64 __bswapdi2(u64);
>   extern s64 __lshrdi3(s64, int);
> diff --git a/arch/powerpc/include/asm/book3s/64/kup-radix.h b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> index f254de956d6a..ef2e65ea8a73 100644
> --- a/arch/powerpc/include/asm/book3s/64/kup-radix.h
> +++ b/arch/powerpc/include/asm/book3s/64/kup-radix.h
> @@ -3,6 +3,7 @@
>   #define _ASM_POWERPC_BOOK3S_64_KUP_RADIX_H
>   
>   #include <linux/const.h>
> +#include <asm/reg.h>
>   
>   #define AMR_KUAP_BLOCK_READ	UL(0x4000000000000000)
>   #define AMR_KUAP_BLOCK_WRITE	UL(0x8000000000000000)
> @@ -56,7 +57,16 @@
>   
>   #ifdef CONFIG_PPC_KUAP
>   
> -#include <asm/reg.h>
> +#include <asm/mmu.h>
> +#include <asm/ptrace.h>
> +
> +static inline void kuap_check_amr(void)
> +{
> +#ifdef CONFIG_PPC_KUAP_DEBUG
> +	if (mmu_has_feature(MMU_FTR_RADIX_KUAP))

Better:

	if (IS_ENABLED(CONFIG_PPC_KUAP_DEBUG) && 
mmu_has_feature(MMU_FTR_RADIX_KUAP))

> +		WARN_ON_ONCE(mfspr(SPRN_AMR) != AMR_KUAP_BLOCKED);
> +#endif
> +}
>   
>   /*
>    * We support individually allowing read or write, but we don't support nesting
> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index 2431b4ada2fa..f3aa9db1a3cc 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -60,6 +60,28 @@ static inline void arch_vtime_task_switch(struct task_struct *prev)
>   }
>   #endif
>   
> +static inline void account_cpu_user_entry(void)
> +{
> +	unsigned long tb = mftb();
> +
> +	get_accounting(current)->utime += (tb - get_accounting(current)->starttime_user);
> +	get_accounting(current)->starttime = tb;
> +}

Can you check the generated assembly ? I remember having bad result with 
get_accouting() being used several times in a arch_vtime_task_switch() 
before commit 	60f1d2893ee6 ("powerpc/time: inline 
arch_vtime_task_switch()")

Regardless, I think it would look better as:

static inline void account_cpu_user_entry(void)
{
	unsigned long tb = mftb();
	struct cpu_accounting_data *acct = get_accounting(current);

	acct->utime += (tb - acct->starttime_user);
	acct->starttime = tb;
}

> +static inline void account_cpu_user_exit(void)
> +{
> +	unsigned long tb = mftb();
> +
> +	get_accounting(current)->stime += (tb - get_accounting(current)->starttime);
> +	get_accounting(current)->starttime_user = tb;
> +}

Same here.

Christophe
