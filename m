Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7024D66CD
	for <lists+linuxppc-dev@lfdr.de>; Fri, 11 Mar 2022 17:49:46 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4KFX3D5Hzdz3bbq
	for <lists+linuxppc-dev@lfdr.de>; Sat, 12 Mar 2022 03:49:44 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4KFX2q0Ph0z2xsc
 for <linuxppc-dev@lists.ozlabs.org>; Sat, 12 Mar 2022 03:49:21 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4KFX2k3VJyz9sSG;
 Fri, 11 Mar 2022 17:49:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tO3okPtGnVnf; Fri, 11 Mar 2022 17:49:18 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4KFX2k2ZgMz9sSF;
 Fri, 11 Mar 2022 17:49:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 1D8D08B78F;
 Fri, 11 Mar 2022 17:49:18 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id WSTA2FP2t2T1; Fri, 11 Mar 2022 17:49:18 +0100 (CET)
Received: from [192.168.202.87] (unknown [192.168.202.87])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 2660D8B763;
 Fri, 11 Mar 2022 17:49:17 +0100 (CET)
Message-ID: <dea75a93-55a0-adfa-4f4f-7670b19c515d@csgroup.eu>
Date: Fri, 11 Mar 2022 17:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH] powerpc/uprobes: Fixup si_addr if we took an
 exception while single stepping
Content-Language: fr-FR
To: "Naveen N. Rao" <naveen.n.rao@linux.vnet.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Anton Blanchard <anton@samba.org>
References: <20170913200330.15606-1-naveen.n.rao@linux.vnet.ibm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20170913200330.15606-1-naveen.n.rao@linux.vnet.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: linuxppc-dev@lists.ozlabs.org,
 Srikar Dronamraju <srikar@linux.vnet.ibm.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 13/09/2017 à 22:03, Naveen N. Rao a écrit :
> If the single-stepped instruction causes an exception, we may end up
> setting siginfo.si_addr to the address of the uprobe xol area. This is
> not desirable since the address won't make sense for the process if it
> wants to handle the exception. Fixup the si_addr field in such cases.
> 
> Reported-by: Anton Blanchard <anton@samba.org>
> Signed-off-by: Naveen N. Rao <naveen.n.rao@linux.vnet.ibm.com>


Nowadays _exception() calls force_sig_fault_to_task() so if the change 
is still required I guess it must be done there ?

Christophe


> ---
>   arch/powerpc/include/asm/uprobes.h |  7 +++++++
>   arch/powerpc/kernel/traps.c        |  4 ++++
>   arch/powerpc/kernel/uprobes.c      | 17 +++++++++++++++++
>   3 files changed, 28 insertions(+)
> 
> diff --git a/arch/powerpc/include/asm/uprobes.h b/arch/powerpc/include/asm/uprobes.h
> index 7422a999a39a..13fc6af3c1fd 100644
> --- a/arch/powerpc/include/asm/uprobes.h
> +++ b/arch/powerpc/include/asm/uprobes.h
> @@ -23,6 +23,7 @@
>    */
>   
>   #include <linux/notifier.h>
> +#include <asm/siginfo.h>
>   #include <asm/probes.h>
>   
>   typedef ppc_opcode_t uprobe_opcode_t;
> @@ -45,4 +46,10 @@ struct arch_uprobe_task {
>   	unsigned long	saved_trap_nr;
>   };
>   
> +#ifdef CONFIG_UPROBES
> +extern void uprobe_fixup_exception(struct pt_regs *regs, siginfo_t *info);
> +#else
> +static inline void uprobe_fixup_exception(struct pt_regs *regs, siginfo_t *info) { }
> +#endif
> +
>   #endif	/* _ASM_UPROBES_H */
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index ec74e203ee04..1bb858a37029 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -66,6 +66,7 @@
>   #include <asm/hmi.h>
>   #include <sysdev/fsl_pci.h>
>   #include <asm/kprobes.h>
> +#include <asm/uprobes.h>
>   
>   #if defined(CONFIG_DEBUGGER) || defined(CONFIG_KEXEC_CORE)
>   int (*__debugger)(struct pt_regs *regs) __read_mostly;
> @@ -292,6 +293,9 @@ void _exception(int signr, struct pt_regs *regs, int code, unsigned long addr)
>   	info.si_signo = signr;
>   	info.si_code = code;
>   	info.si_addr = (void __user *) addr;
> +
> +	uprobe_fixup_exception(regs, &info);
> +
>   	force_sig_info(signr, &info, current);
>   }
>   
> diff --git a/arch/powerpc/kernel/uprobes.c b/arch/powerpc/kernel/uprobes.c
> index 5d105b8eeece..a361a56e6210 100644
> --- a/arch/powerpc/kernel/uprobes.c
> +++ b/arch/powerpc/kernel/uprobes.c
> @@ -25,6 +25,7 @@
>   #include <linux/uprobes.h>
>   #include <linux/uaccess.h>
>   #include <linux/kdebug.h>
> +#include <linux/signal.h>
>   
>   #include <asm/sstep.h>
>   
> @@ -214,3 +215,19 @@ bool arch_uretprobe_is_alive(struct return_instance *ret, enum rp_check ctx,
>   	else
>   		return regs->gpr[1] < ret->stack;
>   }
> +
> +void uprobe_fixup_exception(struct pt_regs *regs, siginfo_t *info)
> +{
> +	struct task_struct *t = current;
> +	struct uprobe_task *utask = t->utask;
> +
> +	if (likely(!utask || !utask->active_uprobe))
> +		return;
> +
> +	/*
> +	 * We reset si_addr here.
> +	 * regs->nip is reset during our way back through uprobe_deny_signal()
> +	 */
> +	if (info->si_addr == (void __user *) utask->xol_vaddr)
> +		info->si_addr = (void __user *) utask->vaddr;
> +}
