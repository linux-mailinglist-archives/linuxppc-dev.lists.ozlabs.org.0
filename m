Return-Path: <linuxppc-dev+bounces-3565-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C83719D95CE
	for <lists+linuxppc-dev@lfdr.de>; Tue, 26 Nov 2024 11:49:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4XyK7k3clhz2yR3;
	Tue, 26 Nov 2024 21:49:06 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=93.17.235.10
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1732618146;
	cv=none; b=liDvZ3v4VjqNP9sJuqt0EapLG5lwkNNGCZrspbR6F4cBQUFWblQAOzS0gWeT5cW0p+vZ0+89wkcWSBGEX2xPoKVtYdwRDuEDljLBpBPxRXsNr9ofz4SHEU6pA8EFYGTFzWE+JDU7jxY02jv65ryPf10TtVECm0qbLyZcLTXsXjOmYgnn9XLeGTun5+APzrTSXKd7YDraW/PAerbw36F0w7FWefHQxwQwrMmKThgiSWM08EiND3WmrsujH9Azk8ZxYZ3EMjnzvqN6ijTLkt7N17wiYcLqNbKoHBLGJA/CtgL9kU7e/q5pwkZj2aM6qaKqxQrTHNeCx01y2e2ZuAC3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1732618146; c=relaxed/relaxed;
	bh=+7v82xUzdvYnHcIvKL8dYaTE80yGHcoa4VGSbnCss94=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EoqJm7d6qWINii+WsJ/I+TNiqXAC6Y6+sVuRWkbb+2CUfBvyke+7nkpgiQmKDpGu+i/ADL+HDduj6JW13c+chj2Cdok4X88l4P1rHdtkZri09Pc9CUzuUur0K4FWnNm2BeS+rxS9ZrIJpyFVLKvHgAR0j9CJDYpSAF01xVlWlmj6G2RRWPfy4ZvLOd4Z8bzPlVpBKrqYCNMmnnV27CFlZEdjDHd9L52jTN0+KgBL8wGBJVzStzqiOMESOqQFNXLM822rcohNWlbt04kIKKtWRTquOkGCNBiUkRdJqVriPp6l3qIh5J++peyb+n6u9uL0ob+IbvpiJ1x+sapZONOFbQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org) smtp.mailfrom=csgroup.eu
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr; envelope-from=christophe.leroy@csgroup.eu; receiver=lists.ozlabs.org)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4XyK7h6FkPz2yD6
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 26 Nov 2024 21:49:03 +1100 (AEDT)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4XyK7Y4qw4z9sPd;
	Tue, 26 Nov 2024 11:48:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YOztfx2qWO3B; Tue, 26 Nov 2024 11:48:57 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4XyK7Y3tcbz9rvV;
	Tue, 26 Nov 2024 11:48:57 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 1E7D58B776;
	Tue, 26 Nov 2024 11:48:57 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id qDRZvgTGw4rj; Tue, 26 Nov 2024 11:48:57 +0100 (CET)
Received: from [192.168.232.206] (unknown [192.168.232.206])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 888E28B763;
	Tue, 26 Nov 2024 11:48:55 +0100 (CET)
Message-ID: <d169e57d-d0a8-4fe8-a44e-2f7a967b5121@csgroup.eu>
Date: Tue, 26 Nov 2024 11:48:54 +0100
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] powerpc: support dynamic preemption
To: Shrikanth Hegde <sshegde@linux.ibm.com>, mpe@ellerman.id.au,
 linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, maddy@linux.ibm.com, bigeasy@linutronix.de,
 ankur.a.arora@oracle.com, linux-kernel@vger.kernel.org,
 mark.rutland@arm.com, vschneid@redhat.com, peterz@infradead.org
References: <20241125042212.1522315-1-sshegde@linux.ibm.com>
 <20241125042212.1522315-3-sshegde@linux.ibm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <20241125042212.1522315-3-sshegde@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org



Le 25/11/2024 à 05:22, Shrikanth Hegde a écrit :
> Once the lazy preemption is supported, it would be desirable to change
> the preemption models at runtime. So this change adds support for dynamic
> preemption using DYNAMIC_KEY.
> 
> In irq-exit to kernel path, use preempt_model_preemptible for decision.
> Other way would be using static key based decision. Keeping it
> simpler since key based change didn't show performance improvement.
> 
> Tested lightly on Power10 LPAR. Performance numbers indicate that,
> preempt=none(no dynamic) and preempt=none(dynamic) are similar.
> Only hackbench pipe shows a regression. There is slight overhead of code
> check if it is preemptible kernel. hackbench pipe is prone to such
> patterns[1]
> 
> cat /sys/kernel/debug/sched/preempt
> (none) voluntary full lazy
> perf stat -e probe:__cond_resched -a sleep 1
>   Performance counter stats for 'system wide':
>               1,253      probe:__cond_resched
> 
> echo full > /sys/kernel/debug/sched/preempt
> cat /sys/kernel/debug/sched/preempt
> none voluntary (full) lazy
> perf stat -e probe:__cond_resched -a sleep 1
>   Performance counter stats for 'system wide':
>                   0      probe:__cond_resched
> 
> echo lazy > /sys/kernel/debug/sched/preempt
> cat /sys/kernel/debug/sched/preempt
> none voluntary full (lazy)
> perf stat -e probe:__cond_resched -a sleep 1
>   Performance counter stats for 'system wide':
>                   0      probe:__cond_resched
> 
> [1]: https://lore.kernel.org/all/1a973dda-c79e-4d95-935b-e4b93eb077b8@linux.ibm.com/
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>   arch/powerpc/Kconfig               | 1 +
>   arch/powerpc/include/asm/preempt.h | 1 +
>   arch/powerpc/kernel/interrupt.c    | 6 +++++-
>   arch/powerpc/lib/vmx-helper.c      | 2 +-
>   4 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
> index 6d6bbd93abab..01c58f5258c9 100644
> --- a/arch/powerpc/Kconfig
> +++ b/arch/powerpc/Kconfig
> @@ -270,6 +270,7 @@ config PPC
>   	select HAVE_PERF_EVENTS_NMI		if PPC64
>   	select HAVE_PERF_REGS
>   	select HAVE_PERF_USER_STACK_DUMP
> +	select HAVE_PREEMPT_DYNAMIC_KEY
>   	select HAVE_RETHOOK			if KPROBES
>   	select HAVE_REGS_AND_STACK_ACCESS_API
>   	select HAVE_RELIABLE_STACKTRACE
> diff --git a/arch/powerpc/include/asm/preempt.h b/arch/powerpc/include/asm/preempt.h
> index 51f8f3881523..c0a19ff3f78c 100644
> --- a/arch/powerpc/include/asm/preempt.h
> +++ b/arch/powerpc/include/asm/preempt.h
> @@ -84,6 +84,7 @@ extern asmlinkage void preempt_schedule_notrace(void);
>   
>   #if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
>   
> +DECLARE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
>   void dynamic_preempt_schedule(void);
>   void dynamic_preempt_schedule_notrace(void);
>   #define __preempt_schedule()		dynamic_preempt_schedule()
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index 8f4acc55407b..0fb01019d7e0 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -38,6 +38,10 @@ static inline bool exit_must_hard_disable(void)
>   }
>   #endif
>   
> +#ifdef CONFIG_PREEMPT_DYNAMIC
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#endif

Why is that needed at all ? It isn't used.

> +
>   /*
>    * local irqs must be disabled. Returns false if the caller must re-enable
>    * them, check for new work, and try again.
> @@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>   		/* Returning to a kernel context with local irqs enabled. */
>   		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>   again:
> -		if (IS_ENABLED(CONFIG_PREEMPTION)) {
> +		if (preempt_model_preemptible()) {
>   			/* Return to preemptible kernel context */
>   			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>   				if (preempt_count() == 0)
> diff --git a/arch/powerpc/lib/vmx-helper.c b/arch/powerpc/lib/vmx-helper.c
> index 58ed6bd613a6..7b069c832ce2 100644
> --- a/arch/powerpc/lib/vmx-helper.c
> +++ b/arch/powerpc/lib/vmx-helper.c
> @@ -45,7 +45,7 @@ int exit_vmx_usercopy(void)
>   	 * set and we are preemptible. The hack here is to schedule a
>   	 * decrementer to fire here and reschedule for us if necessary.
>   	 */
> -	if (IS_ENABLED(CONFIG_PREEMPTION) && need_resched())
> +	if (preempt_model_preemptible() && need_resched())
>   		set_dec(1);
>   	return 0;
>   }

