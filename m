Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 706B5165ED2
	for <lists+linuxppc-dev@lfdr.de>; Thu, 20 Feb 2020 14:31:05 +0100 (CET)
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 48Nb856X7VzDqPc
	for <lists+linuxppc-dev@lfdr.de>; Fri, 21 Feb 2020 00:31:01 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 48Nb3D49SSzDqSf
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 00:26:48 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=u83umY/3; dkim-atps=neutral
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by bilbo.ozlabs.org (Postfix) with ESMTP id 48Nb3C5jp2z8syC
 for <linuxppc-dev@lists.ozlabs.org>; Fri, 21 Feb 2020 00:26:47 +1100 (AEDT)
Received: by ozlabs.org (Postfix)
 id 48Nb3C5HDrz9sR4; Fri, 21 Feb 2020 00:26:47 +1100 (AEDT)
Delivered-To: linuxppc-dev@ozlabs.org
Authentication-Results: ozlabs.org;
 spf=pass (sender SPF authorized) smtp.mailfrom=c-s.fr
 (client-ip=93.17.236.30; helo=pegase1.c-s.fr;
 envelope-from=christophe.leroy@c-s.fr; receiver=<UNKNOWN>)
Authentication-Results: ozlabs.org;
 dmarc=none (p=none dis=none) header.from=c-s.fr
Authentication-Results: ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=c-s.fr header.i=@c-s.fr header.a=rsa-sha256
 header.s=mail header.b=u83umY/3; dkim-atps=neutral
Received: from pegase1.c-s.fr (pegase1.c-s.fr [93.17.236.30])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ozlabs.org (Postfix) with ESMTPS id 48Nb390X4mz9sPK
 for <linuxppc-dev@ozlabs.org>; Fri, 21 Feb 2020 00:26:44 +1100 (AEDT)
Received: from localhost (mailhub1-int [192.168.12.234])
 by localhost (Postfix) with ESMTP id 48Nb322vZFz9v2gT;
 Thu, 20 Feb 2020 14:26:38 +0100 (CET)
Authentication-Results: localhost; dkim=pass
 reason="1024-bit key; insecure key"
 header.d=c-s.fr header.i=@c-s.fr header.b=u83umY/3; dkim-adsp=pass;
 dkim-atps=neutral
X-Virus-Scanned: Debian amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
 by localhost (pegase1.c-s.fr [192.168.12.234]) (amavisd-new, port 10024)
 with ESMTP id SkmpFZ_Jqhh4; Thu, 20 Feb 2020 14:26:38 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase1.c-s.fr (Postfix) with ESMTP id 48Nb321fdrz9v2gS;
 Thu, 20 Feb 2020 14:26:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=c-s.fr; s=mail;
 t=1582205198; bh=7OgKyxknybmK36D5QLn80zS0bUfUu7xmfEwFz5Swmmw=;
 h=Subject:To:References:From:Date:In-Reply-To:From;
 b=u83umY/3yvzi8N+KF5Xd0fyRRbaP2bxJSSz6/GsvrTNpys/i9+BHl2IHUnh+fmf6Q
 LI3a8cCRG4bzx5+HjPcL/B3wsYJ3jbs3ihrbSPB3dWMU55/EwgQgdh8Rze7Hy4feOX
 Rzmi0KCRM+Sfk7s7b78e9cE+IXw0MfoPTWeNhMXo=
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 9E48F8B86C;
 Thu, 20 Feb 2020 14:26:39 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Cb4v381TsA-q; Thu, 20 Feb 2020 14:26:39 +0100 (CET)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 055CD8B866;
 Thu, 20 Feb 2020 14:26:38 +0100 (CET)
Subject: Re: [PATCH v3 1/5] powerpc: Rename current_stack_pointer() to
 current_stack_frame()
To: Michael Ellerman <mpe@ellerman.id.au>, linuxppc-dev@ozlabs.org
References: <20200220115141.2707-1-mpe@ellerman.id.au>
From: Christophe Leroy <christophe.leroy@c-s.fr>
Message-ID: <54645797-053f-c970-1bfb-ba3e6c639996@c-s.fr>
Date: Thu, 20 Feb 2020 14:26:38 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200220115141.2707-1-mpe@ellerman.id.au>
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



Le 20/02/2020 à 12:51, Michael Ellerman a écrit :
> current_stack_pointer(), which was called __get_SP(), used to just
> return the value in r1.
> 
> But that caused problems in some cases, so it was turned into a
> function in commit bfe9a2cfe91a ("powerpc: Reimplement __get_SP() as a
> function not a define").
> 
> Because it's a function in a separate compilation unit to all its
> callers, it has the effect of causing a stack frame to be created, and
> then returns the address of that frame. This is good in some cases
> like those described in the above commit, but in other cases it's
> overkill, we just need to know what stack page we're on.
> 
> On some other arches current_stack_pointer is just a register global
> giving the stack pointer, and we'd like to do that too. So rename our
> current_stack_pointer() to current_stack_frame() to make that
> possible.
> 
> Signed-off-by: Michael Ellerman <mpe@ellerman.id.au>

LGTM

I was afraid to do that and risk invisible conflicts hence bugs by 
reusing the same name for different purpose, but that's the best 
solution for sure.

Reviewed-by: Christophe Leroy <christophe.leroy@c-s.fr>

> ---
>   arch/powerpc/include/asm/perf_event.h | 2 +-
>   arch/powerpc/include/asm/reg.h        | 2 +-
>   arch/powerpc/kernel/irq.c             | 4 ++--
>   arch/powerpc/kernel/misc.S            | 4 ++--
>   arch/powerpc/kernel/process.c         | 2 +-
>   arch/powerpc/kernel/stacktrace.c      | 6 +++---
>   6 files changed, 10 insertions(+), 10 deletions(-)
> 
> v3: New.
> 
> diff --git a/arch/powerpc/include/asm/perf_event.h b/arch/powerpc/include/asm/perf_event.h
> index 7426d7a90e1e..eed3954082fa 100644
> --- a/arch/powerpc/include/asm/perf_event.h
> +++ b/arch/powerpc/include/asm/perf_event.h
> @@ -32,7 +32,7 @@
>   	do {							\
>   		(regs)->result = 0;				\
>   		(regs)->nip = __ip;				\
> -		(regs)->gpr[1] = current_stack_pointer();	\
> +		(regs)->gpr[1] = current_stack_frame();		\
>   		asm volatile("mfmsr %0" : "=r" ((regs)->msr));	\
>   	} while (0)
>   
> diff --git a/arch/powerpc/include/asm/reg.h b/arch/powerpc/include/asm/reg.h
> index 1aa46dff0957..1b1ffdba6097 100644
> --- a/arch/powerpc/include/asm/reg.h
> +++ b/arch/powerpc/include/asm/reg.h
> @@ -1448,7 +1448,7 @@ static inline void mtsrin(u32 val, u32 idx)
>   
>   #define proc_trap()	asm volatile("trap")
>   
> -extern unsigned long current_stack_pointer(void);
> +extern unsigned long current_stack_frame(void);
>   
>   extern unsigned long scom970_read(unsigned int address);
>   extern void scom970_write(unsigned int address, unsigned long value);
> diff --git a/arch/powerpc/kernel/irq.c b/arch/powerpc/kernel/irq.c
> index 5c9b11878555..02118c18434d 100644
> --- a/arch/powerpc/kernel/irq.c
> +++ b/arch/powerpc/kernel/irq.c
> @@ -602,7 +602,7 @@ static inline void check_stack_overflow(void)
>   #ifdef CONFIG_DEBUG_STACKOVERFLOW
>   	long sp;
>   
> -	sp = current_stack_pointer() & (THREAD_SIZE-1);
> +	sp = current_stack_frame() & (THREAD_SIZE-1);
>   
>   	/* check for stack overflow: is there less than 2KB free? */
>   	if (unlikely(sp < 2048)) {
> @@ -647,7 +647,7 @@ void do_IRQ(struct pt_regs *regs)
>   	void *cursp, *irqsp, *sirqsp;
>   
>   	/* Switch to the irq stack to handle this */
> -	cursp = (void *)(current_stack_pointer() & ~(THREAD_SIZE - 1));
> +	cursp = (void *)(current_stack_frame() & ~(THREAD_SIZE - 1));
>   	irqsp = hardirq_ctx[raw_smp_processor_id()];
>   	sirqsp = softirq_ctx[raw_smp_processor_id()];
>   
> diff --git a/arch/powerpc/kernel/misc.S b/arch/powerpc/kernel/misc.S
> index 974f65f79a8e..65f9f731c229 100644
> --- a/arch/powerpc/kernel/misc.S
> +++ b/arch/powerpc/kernel/misc.S
> @@ -110,7 +110,7 @@ _GLOBAL(longjmp)
>   	li	r3, 1
>   	blr
>   
> -_GLOBAL(current_stack_pointer)
> +_GLOBAL(current_stack_frame)
>   	PPC_LL	r3,0(r1)
>   	blr
> -EXPORT_SYMBOL(current_stack_pointer)
> +EXPORT_SYMBOL(current_stack_frame)
> diff --git a/arch/powerpc/kernel/process.c b/arch/powerpc/kernel/process.c
> index e730b8e522b0..110db94cdf3c 100644
> --- a/arch/powerpc/kernel/process.c
> +++ b/arch/powerpc/kernel/process.c
> @@ -2051,7 +2051,7 @@ void show_stack(struct task_struct *tsk, unsigned long *stack)
>   	sp = (unsigned long) stack;
>   	if (sp == 0) {
>   		if (tsk == current)
> -			sp = current_stack_pointer();
> +			sp = current_stack_frame();
>   		else
>   			sp = tsk->thread.ksp;
>   	}
> diff --git a/arch/powerpc/kernel/stacktrace.c b/arch/powerpc/kernel/stacktrace.c
> index e2a46cfed5fd..c477b8585a29 100644
> --- a/arch/powerpc/kernel/stacktrace.c
> +++ b/arch/powerpc/kernel/stacktrace.c
> @@ -57,7 +57,7 @@ void save_stack_trace(struct stack_trace *trace)
>   {
>   	unsigned long sp;
>   
> -	sp = current_stack_pointer();
> +	sp = current_stack_frame();
>   
>   	save_context_stack(trace, sp, current, 1);
>   }
> @@ -71,7 +71,7 @@ void save_stack_trace_tsk(struct task_struct *tsk, struct stack_trace *trace)
>   		return;
>   
>   	if (tsk == current)
> -		sp = current_stack_pointer();
> +		sp = current_stack_frame();
>   	else
>   		sp = tsk->thread.ksp;
>   
> @@ -131,7 +131,7 @@ static int __save_stack_trace_tsk_reliable(struct task_struct *tsk,
>   	}
>   
>   	if (tsk == current)
> -		sp = current_stack_pointer();
> +		sp = current_stack_frame();
>   	else
>   		sp = tsk->thread.ksp;
>   
> 
