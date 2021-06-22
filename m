Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3D73AFD3B
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 08:48:14 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4G8H653dz9z305q
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Jun 2021 16:48:13 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4G8H5h1px7z303j
 for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Jun 2021 16:47:48 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
 by localhost (Postfix) with ESMTP id 4G8H5X1XqNzB9Zf;
 Tue, 22 Jun 2021 08:47:44 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iN_cbZV3U1nE; Tue, 22 Jun 2021 08:47:44 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4G8H5X04NxzB9Yg;
 Tue, 22 Jun 2021 08:47:44 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id EA5048B7B1;
 Tue, 22 Jun 2021 08:47:43 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id BWQtaI2M_BzM; Tue, 22 Jun 2021 08:47:43 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9A7A98B773;
 Tue, 22 Jun 2021 08:47:43 +0200 (CEST)
Subject: Re: [PATCH 2/2] powerpc/64s/interrupt: Check and fix srr_valid
 without crashing
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
References: <20210622060416.548187-1-npiggin@gmail.com>
 <20210622060416.548187-3-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <21088c39-77fb-97d5-6fe9-76ae4ef4b439@csgroup.eu>
Date: Tue, 22 Jun 2021 08:47:43 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210622060416.548187-3-npiggin@gmail.com>
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



Le 22/06/2021 à 08:04, Nicholas Piggin a écrit :
> The PPC_RFI_SRR_DEBUG check added by patch "powerpc/64s: avoid reloading
> (H)SRR registers if they are still valid" has a few deficiencies. It
> does not fix the actual problem, it's not enabled by default, and it
> causes a program check interrupt which can cause more difficulties.
> 
> However there are a lot of paths which may clobber SRRs or change return
> regs, and difficult to have a high confidence that all paths are covered
> without wider testing.
> 
> Add a relatively low overhead always-enabled check that catches most
> such cases, reports once, and fixes it so the kernel can continue.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/kernel/interrupt.c | 58 +++++++++++++++++++++++++++++++++
>   1 file changed, 58 insertions(+)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 05fa3ae56e25..5920a3e8d1d5 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -231,6 +231,56 @@ static notrace void booke_load_dbcr0(void)
>   #endif
>   }
>   
> +#include <linux/sched/debug.h> /* for show_regs */
> +static void check_return_regs_valid(struct pt_regs *regs)
> +{
> +#ifdef CONFIG_PPC_BOOK3S_64
> +	static bool warned = false;
> +
> +	if (regs->trap == 0x980 || regs->trap == 0xe00 || regs->trap == 0xe20 ||
> +	    regs->trap == 0xe40 || regs->trap == 0xe60 || regs->trap == 0xe80 ||
> +	    regs->trap == 0xea0 || regs->trap == 0xf80 || regs->trap == 0x1200 ||
> +	    regs->trap == 0x1500 || regs->trap == 0x1600 || regs->trap == 0x1800) {

Can you use names defined in asm/interrupt.h instead of raw values ?
Some are already there, others can be added.


> +		if (local_paca->hsrr_valid) {
> +			unsigned long hsrr0 = mfspr(SPRN_HSRR0);
> +			unsigned long hsrr1 = mfspr(SPRN_HSRR1);
> +
> +			if (hsrr0 == regs->nip && hsrr1 == regs->msr)
> +				return;
> +
> +			if (!warned) {
> +				warned = true;
> +				printk("HSRR0 was: %lx should be: %lx\n",
> +					hsrr0, regs->nip);
> +				printk("HSRR1 was: %lx should be: %lx\n",
> +					hsrr1, regs->msr);
> +				show_regs(regs);
> +			}
> +			local_paca->hsrr_valid = 0; /* fixup */
> +		}
> +
> +	} else if (regs->trap != 0x3000) {
> +		if (local_paca->srr_valid) {
> +			unsigned long srr0 = mfspr(SPRN_SRR0);
> +			unsigned long srr1 = mfspr(SPRN_SRR1);
> +
> +			if (srr0 == regs->nip && srr1 == regs->msr)
> +				return;
> +
> +			if (!warned) {
> +				warned = true;
> +				printk("SRR0 was: %lx should be: %lx\n",
> +					srr0, regs->nip);
> +				printk("SRR1 was: %lx should be: %lx\n",
> +					srr1, regs->msr);
> +				show_regs(regs);
> +			}
> +			local_paca->srr_valid = 0; /* fixup */
> +		}
> +	}
> +#endif
> +}
> +
>   /*
>    * This should be called after a syscall returns, with r3 the return value
>    * from the syscall. If this function returns non-zero, the system call
> @@ -327,6 +377,8 @@ notrace unsigned long syscall_exit_prepare(unsigned long r3,
>   		}
>   	}
>   
> +	check_return_regs_valid(regs);
> +
>   	user_enter_irqoff();
>   
>   	/* scv need not set RI=0 because SRRs are not used */
> @@ -405,6 +457,8 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>   		}
>   	}
>   
> +	check_return_regs_valid(regs);
> +
>   	user_enter_irqoff();
>   
>   	if (unlikely(!__prep_irq_for_enabled_exit(true))) {
> @@ -469,9 +523,13 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   			}
>   		}
>   
> +		check_return_regs_valid(regs);
> +
>   		if (unlikely(!prep_irq_for_enabled_exit(true, !irqs_disabled_flags(flags))))
>   			goto again;
>   	} else {
> +		check_return_regs_valid(regs);
> +
>   		/* Returning to a kernel context with local irqs disabled. */
>   		__hard_EE_RI_disable();
>   #ifdef CONFIG_PPC64
> 
