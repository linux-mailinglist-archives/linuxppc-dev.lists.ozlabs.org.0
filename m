Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 88CF925F524
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 10:27:54 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4BlLxx6f9KzDqR2
	for <lists+linuxppc-dev@lfdr.de>; Mon,  7 Sep 2020 18:27:49 +1000 (AEST)
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
 by lists.ozlabs.org (Postfix) with ESMTPS id 4BlLw80h33zDqGt
 for <linuxppc-dev@lists.ozlabs.org>; Mon,  7 Sep 2020 18:26:09 +1000 (AEST)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 4BlLvp06CMz9v0xg;
 Mon,  7 Sep 2020 10:25:58 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id Sb-ueZbJO-_y; Mon,  7 Sep 2020 10:25:57 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 4BlLvn6Hktz9v0xf;
 Mon,  7 Sep 2020 10:25:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E57CC8B786;
 Mon,  7 Sep 2020 10:26:02 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id VGhMJG2UveUj; Mon,  7 Sep 2020 10:26:02 +0200 (CEST)
Received: from po17688vm.idsi0.si.c-s.fr (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E0CD8B77F;
 Mon,  7 Sep 2020 10:26:02 +0200 (CEST)
Subject: Re: [RFC PATCH 09/12] powerpc: move NMI entry/exit code into wrapper
To: Nicholas Piggin <npiggin@gmail.com>
References: <20200905174335.3161229-1-npiggin@gmail.com>
 <20200905174335.3161229-10-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <a5a80cfe-db37-897b-6894-81d2aa55f9da@csgroup.eu>
Date: Mon, 7 Sep 2020 08:25:50 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200905174335.3161229-10-npiggin@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



On 9/5/20 5:43 PM, Nicholas Piggin wrote:
> This moves the common NMI entry and exit code into the interrupt handler
> wrappers.
> 
> This changes the behaviour of soft-NMI (watchdog) and HMI interrupts, and
> also MCE interrupts on 64e, by adding missing parts of the NMI entry to
> them.
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/interrupt.h | 26 +++++++++++++++++++
>   arch/powerpc/kernel/mce.c            | 12 ---------
>   arch/powerpc/kernel/traps.c          | 38 +++++-----------------------
>   arch/powerpc/kernel/watchdog.c       | 10 +++-----
>   4 files changed, 37 insertions(+), 49 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index 83fe1d64cf23..69eb8a432984 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -31,6 +31,27 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
>   }
>   #endif /* CONFIG_PPC_BOOK3S_64 */
>   
> +struct interrupt_nmi_state {
> +#ifdef CONFIG_PPC64
> +	u8 ftrace_enabled;
> +#endif
> +};
> +
> +static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
> +{
> +	this_cpu_set_ftrace_enabled(0);
> +
> +	nmi_enter();
> +}
> +
> +static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct interrupt_nmi_state *state)
> +{
> +	nmi_exit();
> +
> +	this_cpu_set_ftrace_enabled(state->ftrace_enabled);

PPC32 build:

In file included from arch/powerpc/kernel/irq.c:57:0:
./arch/powerpc/include/asm/interrupt.h: In function 
‘interrupt_nmi_exit_prepare’:
./arch/powerpc/include/asm/interrupt.h:96:35: error: ‘struct 
interrupt_nmi_state’ has no member named ‘ftrace_enabled’
   this_cpu_set_ftrace_enabled(state->ftrace_enabled);
                                    ^

> +}
> +
> +
>   /**
>    * DECLARE_INTERRUPT_HANDLER_RAW - Declare raw interrupt handler function
>    * @func:	Function name of the entry point
> @@ -177,10 +198,15 @@ static __always_inline long ___##func(struct pt_regs *regs);		\
>   									\
>   __visible noinstr long func(struct pt_regs *regs)			\
>   {									\
> +	struct interrupt_nmi_state state;				\
>   	long ret;							\
>   									\
> +	interrupt_nmi_enter_prepare(regs, &state);			\
> +									\
>   	ret = ___##func (regs);						\
>   									\
> +	interrupt_nmi_exit_prepare(regs, &state);			\
> +									\
>   	return ret;							\
>   }									\
>   									\

Christophe
