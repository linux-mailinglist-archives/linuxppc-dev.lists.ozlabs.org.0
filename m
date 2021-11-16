Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF37453309
	for <lists+linuxppc-dev@lfdr.de>; Tue, 16 Nov 2021 14:41:34 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HtnK823dZz3c6m
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Nov 2021 00:41:32 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HtnJj4zlfz2xtc
 for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Nov 2021 00:41:08 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4HtnJf0bH4z9sSJ;
 Tue, 16 Nov 2021 14:41:06 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u7mAiaYI_xFI; Tue, 16 Nov 2021 14:41:05 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4HtnJd6N0tz9sSH;
 Tue, 16 Nov 2021 14:41:05 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id C51128B77A;
 Tue, 16 Nov 2021 14:41:05 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id Nh3y__qSDvzK; Tue, 16 Nov 2021 14:41:05 +0100 (CET)
Received: from [192.168.234.8] (unknown [192.168.234.8])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 036078B763;
 Tue, 16 Nov 2021 14:41:04 +0100 (CET)
Message-ID: <431fb6da-fe21-c5a6-bfb3-4e26bdc153b4@csgroup.eu>
Date: Tue, 16 Nov 2021 14:41:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 3/5] powerpc: Use preemption model accessors
Content-Language: fr-FR
To: Valentin Schneider <valentin.schneider@arm.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-4-valentin.schneider@arm.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20211110202448.4054153-4-valentin.schneider@arm.com>
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
Cc: Marco Elver <elver@google.com>, Michal Marek <michal.lkml@markovi.net>,
 Peter Zijlstra <peterz@infradead.org>,
 Frederic Weisbecker <frederic@kernel.org>, Mike Galbraith <efault@gmx.de>,
 Nick Desaulniers <ndesaulniers@google.com>,
 Steven Rostedt <rostedt@goodmis.org>, Ingo Molnar <mingo@kernel.org>,
 Paul Mackerras <paulus@samba.org>, Masahiro Yamada <masahiroy@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 10/11/2021 à 21:24, Valentin Schneider a écrit :
> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> preemption model of the live kernel. Use the newly-introduced accessors
> instead.

Is that change worth it for now ? As far as I can see powerpc doesn't 
have DYNAMIC PREEMPT, a lot of work needs to be done before being able 
to use it:
- Implement GENERIC_ENTRY
- Implement STATIC_CALLS (already done on PPC32, to be done on PPC64)

> 
> sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
> so this should be fine.

It looks like you are mixing up interrupts and IRQs (also known as 
"external interrupts").

ISI (Instruction Storage Interrupt) and DSI (Data Storage Interrupt) for 
instance are also interrupts. They happen everytime there is a page 
fault so may happen pretty early.

Traps generated by WARN_ON() are also interrupts that may happen at any 
time.

> 
> Signed-off-by: Valentin Schneider <valentin.schneider@arm.com>
> ---
>   arch/powerpc/kernel/interrupt.c | 2 +-
>   arch/powerpc/kernel/traps.c     | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index de10a2697258..c56c10b59be3 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -552,7 +552,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   		/* Returning to a kernel context with local irqs enabled. */
>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>   again:
> -		if (IS_ENABLED(CONFIG_PREEMPT)) {
> +		if (is_preempt_full()) {

I think the cost of that additionnal test should be analysed. Maybe it's 
worth not doing the test at all and check _TIF_NEED_RESCHED everytime, 
unless that recurrent test is changed into a jump label as suggested in 
patch 2.


>   			/* Return to preemptible kernel context */
>   			if (unlikely(current_thread_info()->flags & _TIF_NEED_RESCHED)) {
>   				if (preempt_count() == 0)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index aac8c0412ff9..1cb31bbdc925 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -265,7 +265,7 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>   	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>   	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>   	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       is_preempt_full() ? " PREEMPT" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>   	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>   	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
> 

Would it be interesting as well to know that we are indeed in a DYNAMIC 
PREEMPT context when dying ?

Christophe
