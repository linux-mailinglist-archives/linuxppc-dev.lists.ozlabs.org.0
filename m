Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F9C33B47C
	for <lists+linuxppc-dev@lfdr.de>; Mon, 15 Mar 2021 14:31:24 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Dzcky6bMbz309s
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Mar 2021 00:31:22 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4DzckZ4jwnz2xxn
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 16 Mar 2021 00:30:59 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4DzckL6NQJz9tyRv;
 Mon, 15 Mar 2021 14:30:50 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id m8eqvnVRQOMs; Mon, 15 Mar 2021 14:30:50 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4DzckL5WTWz9tyRs;
 Mon, 15 Mar 2021 14:30:50 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 04AED8B776;
 Mon, 15 Mar 2021 14:30:56 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id 9RJe7BqbhXbz; Mon, 15 Mar 2021 14:30:55 +0100 (CET)
Received: from [172.25.230.100] (po15451.idsi0.si.c-s.fr [172.25.230.100])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id B3A958B779;
 Mon, 15 Mar 2021 14:30:55 +0100 (CET)
Subject: Re: [PATCH 03/10] powerpc/64e/interrupt: use new interrupt return
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210315031716.3940350-1-npiggin@gmail.com>
 <20210315031716.3940350-4-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a2c192a2-ebdb-d18a-6e21-b27d8890fe06@csgroup.eu>
Date: Mon, 15 Mar 2021 14:30:53 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210315031716.3940350-4-npiggin@gmail.com>
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
Cc: Scott Wood <oss@buserror.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 15/03/2021 à 04:17, Nicholas Piggin a écrit :
> Update the new C and asm interrupt return code to account for 64e
> specifics, switch over to use it.
> 
> The now-unused old ret_from_except code, that was moved to 64e after the
> 64s conversion, is removed.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/asm-prototypes.h |   2 -
>   arch/powerpc/kernel/entry_64.S            |   9 +-
>   arch/powerpc/kernel/exceptions-64e.S      | 321 ++--------------------
>   arch/powerpc/kernel/interrupt.c           |  27 +-
>   arch/powerpc/kernel/irq.c                 |  76 -----
>   5 files changed, 56 insertions(+), 379 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index fbabb49888d3..ae7b058b2970 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -235,6 +235,10 @@ static notrace void booke_load_dbcr0(void)
>   #endif
>   }
>   
> +/* temporary hack for context tracking, removed in later patch */
> +#include <linux/sched/debug.h>
> +asmlinkage __visible void __sched schedule_user(void);
> +
>   /*
>    * This should be called after a syscall returns, with r3 the return value
>    * from the syscall. If this function returns non-zero, the system call
> @@ -292,7 +296,11 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	while (unlikely(ti_flags & (_TIF_USER_WORK_MASK & ~_TIF_RESTORE_TM))) {
>   		local_irq_enable();
>   		if (ti_flags & _TIF_NEED_RESCHED) {
> +#ifdef CONFIG_PPC_BOOK3E_64
> +			schedule_user();
> +#else
>   			schedule();
> +#endif
>   		} else {
>   			/*
>   			 * SIGPENDING must restore signal handler function
> @@ -360,7 +368,6 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   	return ret;
>   }
>   
> -#ifndef CONFIG_PPC_BOOK3E_64 /* BOOK3E not yet using this */
>   notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned long msr)
>   {
>   	unsigned long ti_flags;
> @@ -372,7 +379,9 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs, unsigned
>   	BUG_ON(!(regs->msr & MSR_PR));
>   	BUG_ON(!FULL_REGS(regs));
>   	BUG_ON(arch_irq_disabled_regs(regs));
> +#ifdef CONFIG_PPC_BOOK3S_64

Shouldn't this go away in patch 6 as well ?
Or is that needed at all ? In syscall_exit_prepare() it is not ifdefed .

>   	CT_WARN_ON(ct_state() == CONTEXT_USER);
> +#endif
>   
>   	/*
>   	 * We don't need to restore AMR on the way back to userspace for KUAP.
