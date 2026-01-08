Return-Path: <linuxppc-dev+bounces-15407-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F355ED01A02
	for <lists+linuxppc-dev@lfdr.de>; Thu, 08 Jan 2026 09:49:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dmz9F3HzGz2yG7;
	Thu, 08 Jan 2026 19:49:21 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip=45.249.212.187
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1767862161;
	cv=none; b=mtFrFn1YfJyiKgOu12KUWSb35UtO1KWDwpseatuLbnjpaMtZ8fpIG/1uFUaDVTKg740S5tS4uhI5AZeyHPKvCpdNxmqkZHAcZLp0Wa/do/lUquDVqFP389DF34yiH7bpTOkybrRKzWkkt08LqDL4pHXU2ay/8aajRG6YyPfbjBjkn0lYIeOv/2yW8xPtMCchoG+f6wxLV4uqAtXRTS+pJ6kCbDSxbUuCD/wghJdtaJhynBzvlUMTLY+rzXGWtXY1hvA9tscw1DoHYRtnFs3h3nMWo5OIoLk2QjHVAHxC32q3knuyghv61KIeUsYfz0kEg5T7TsvuT++dxwWy3zw+Vg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1767862161; c=relaxed/relaxed;
	bh=qV54H0G4ZmCM7AZXX+pxayX6mbCwghAJSYuD+KvzN3M=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ETfaeacahdaPod9DvKaUJql5uD5nlkP/xkQHuwNMLAubNaXaGAn7pW8qOZwao0ee70WvkJnlCPULSdxp56D2ZrJSZI941At+gvMU32D10+JF3SBosh1H3JPHY5geJQqeDCuE03Lx+zsPhrwdq36ewI4ykLQTjmRvf452h0gKMqw5W0oBJUCt47w645VhWbR5ll5OH8km8VEWgIP2n2bovg5XURDjb2bTtsh8UZX6mcmCXgGmFR3nIw5C60gPZj9vcMw8Q2ZnI9e7MUEVCk43IKq39JPlG7tDXgjAX1ja5XDYYtf4r1WLNJFcMBeldNFqBaJd6nJ5F5MoxCdnAYU3Qw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0W0gCYIS; dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0W0gCYIS; dkim-atps=neutral; spf=pass (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org) smtp.mailfrom=huawei.com
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0W0gCYIS;
	dkim=pass (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=0W0gCYIS;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=huawei.com (client-ip=45.249.212.187; helo=szxga01-in.huawei.com; envelope-from=ruanjinjie@huawei.com; receiver=lists.ozlabs.org)
X-Greylist: delayed 1130 seconds by postgrey-1.37 at boromir; Thu, 08 Jan 2026 19:49:18 AEDT
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dmz9B25R4z2xZK
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 08 Jan 2026 19:49:15 +1100 (AEDT)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qV54H0G4ZmCM7AZXX+pxayX6mbCwghAJSYuD+KvzN3M=;
	b=0W0gCYIS1FtH5QEvXVClCaotd2mC9Am9vWJCMGDJjGncU6N1xowo2BSnF8dR1xsJxh6jSrcgv
	vUWPJmhMe5RF4Hfb/Oow87JdZFGLKVX+/gZ3hu2Lr+bnKDZo11Qyjz0jiR1VwEGPZ5mBYsUy1tJ
	Civ/6FD1PkcA5/SsJ4b1zWU=
Received: from canpmsgout04.his.huawei.com (unknown [172.19.92.133])
	by szxga01-in.huawei.com (SkyGuard) with ESMTPS id 4dmykF4rF6z1BFPP
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  8 Jan 2026 16:29:25 +0800 (CST)
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=qV54H0G4ZmCM7AZXX+pxayX6mbCwghAJSYuD+KvzN3M=;
	b=0W0gCYIS1FtH5QEvXVClCaotd2mC9Am9vWJCMGDJjGncU6N1xowo2BSnF8dR1xsJxh6jSrcgv
	vUWPJmhMe5RF4Hfb/Oow87JdZFGLKVX+/gZ3hu2Lr+bnKDZo11Qyjz0jiR1VwEGPZ5mBYsUy1tJ
	Civ/6FD1PkcA5/SsJ4b1zWU=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dmygR67ktz1prm6;
	Thu,  8 Jan 2026 16:26:59 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id C9A682012A;
	Thu,  8 Jan 2026 16:30:17 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 16:30:16 +0800
Message-ID: <272dc19f-7e6b-9fd7-22c0-de3a4a81dc8f@huawei.com>
Date: Thu, 8 Jan 2026 16:30:15 +0800
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
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 1/8] powerpc: rename arch_irq_disabled_regs
Content-Language: en-US
To: Mukesh Kumar Chaurasiya <mkchauras@linux.ibm.com>, <maddy@linux.ibm.com>,
	<mpe@ellerman.id.au>, <npiggin@gmail.com>, <chleroy@kernel.org>,
	<oleg@redhat.com>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <mchauras@linux.ibm.com>, <thuth@redhat.com>,
	<sshegde@linux.ibm.com>, <akpm@linux-foundation.org>, <macro@orcam.me.uk>,
	<deller@gmx.de>, <ldv@strace.io>, <charlie@rivosinc.com>,
	<segher@kernel.crashing.org>, <bigeasy@linutronix.de>,
	<peterz@infradead.org>, <namcao@linutronix.de>, <tglx@linutronix.de>,
	<kan.liang@linux.intel.com>, <mark.barnett@arm.com>,
	<linuxppc-dev@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>
References: <20251229045416.3193779-1-mkchauras@linux.ibm.com>
 <20251229045416.3193779-2-mkchauras@linux.ibm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20251229045416.3193779-2-mkchauras@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-Spam-Status: No, score=-3.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	SPF_HELO_NONE,SPF_PASS autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org



On 2025/12/29 12:54, Mukesh Kumar Chaurasiya wrote:
> From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> 
> Rename arch_irq_disabled_regs() to regs_irqs_disabled() to align with the
> naming used in the generic irqentry framework. This makes the function
> available for use both in the PowerPC architecture code and in the
> common entry/exit paths shared with other architectures.
> 
> This is a preparatory change for enabling the generic irqentry framework
> on PowerPC.
> 
> Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
> Reviewed-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/hw_irq.h    |  4 ++--
>  arch/powerpc/include/asm/interrupt.h | 16 ++++++++--------
>  arch/powerpc/kernel/interrupt.c      |  4 ++--
>  arch/powerpc/kernel/syscall.c        |  2 +-
>  arch/powerpc/kernel/traps.c          |  2 +-
>  arch/powerpc/kernel/watchdog.c       |  2 +-
>  arch/powerpc/perf/core-book3s.c      |  2 +-
>  7 files changed, 16 insertions(+), 16 deletions(-)

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/arch/powerpc/include/asm/hw_irq.h b/arch/powerpc/include/asm/hw_irq.h
> index 1078ba88efaf..8dfe36b442a5 100644
> --- a/arch/powerpc/include/asm/hw_irq.h
> +++ b/arch/powerpc/include/asm/hw_irq.h
> @@ -393,7 +393,7 @@ static inline void do_hard_irq_enable(void)
>  	__hard_irq_enable();
>  }
>  
> -static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
> +static inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
>  	return (regs->softe & IRQS_DISABLED);
>  }
> @@ -466,7 +466,7 @@ static inline bool arch_irqs_disabled(void)
>  
>  #define hard_irq_disable()		arch_local_irq_disable()
>  
> -static inline bool arch_irq_disabled_regs(struct pt_regs *regs)
> +static inline bool regs_irqs_disabled(struct pt_regs *regs)
>  {
>  	return !(regs->msr & MSR_EE);
>  }
> diff --git a/arch/powerpc/include/asm/interrupt.h b/arch/powerpc/include/asm/interrupt.h
> index eb0e4a20b818..0e2cddf8bd21 100644
> --- a/arch/powerpc/include/asm/interrupt.h
> +++ b/arch/powerpc/include/asm/interrupt.h
> @@ -172,7 +172,7 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
>  	/* Enable MSR[RI] early, to support kernel SLB and hash faults */
>  #endif
>  
> -	if (!arch_irq_disabled_regs(regs))
> +	if (!regs_irqs_disabled(regs))
>  		trace_hardirqs_off();
>  
>  	if (user_mode(regs)) {
> @@ -192,11 +192,11 @@ static inline void interrupt_enter_prepare(struct pt_regs *regs)
>  			CT_WARN_ON(ct_state() != CT_STATE_KERNEL &&
>  				   ct_state() != CT_STATE_IDLE);
>  		INT_SOFT_MASK_BUG_ON(regs, is_implicit_soft_masked(regs));
> -		INT_SOFT_MASK_BUG_ON(regs, arch_irq_disabled_regs(regs) &&
> -					   search_kernel_restart_table(regs->nip));
> +		INT_SOFT_MASK_BUG_ON(regs, regs_irqs_disabled(regs) &&
> +				     search_kernel_restart_table(regs->nip));
>  	}
> -	INT_SOFT_MASK_BUG_ON(regs, !arch_irq_disabled_regs(regs) &&
> -				   !(regs->msr & MSR_EE));
> +	INT_SOFT_MASK_BUG_ON(regs, !regs_irqs_disabled(regs) &&
> +			     !(regs->msr & MSR_EE));
>  
>  	booke_restore_dbcr0();
>  }
> @@ -298,7 +298,7 @@ static inline void interrupt_nmi_enter_prepare(struct pt_regs *regs, struct inte
>  		 * Adjust regs->softe to be soft-masked if it had not been
>  		 * reconcied (e.g., interrupt entry with MSR[EE]=0 but softe
>  		 * not yet set disabled), or if it was in an implicit soft
> -		 * masked state. This makes arch_irq_disabled_regs(regs)
> +		 * masked state. This makes regs_irqs_disabled(regs)
>  		 * behave as expected.
>  		 */
>  		regs->softe = IRQS_ALL_DISABLED;
> @@ -372,7 +372,7 @@ static inline void interrupt_nmi_exit_prepare(struct pt_regs *regs, struct inter
>  
>  #ifdef CONFIG_PPC64
>  #ifdef CONFIG_PPC_BOOK3S
> -	if (arch_irq_disabled_regs(regs)) {
> +	if (regs_irqs_disabled(regs)) {
>  		unsigned long rst = search_kernel_restart_table(regs->nip);
>  		if (rst)
>  			regs_set_return_ip(regs, rst);
> @@ -661,7 +661,7 @@ void replay_soft_interrupts(void);
>  
>  static inline void interrupt_cond_local_irq_enable(struct pt_regs *regs)
>  {
> -	if (!arch_irq_disabled_regs(regs))
> +	if (!regs_irqs_disabled(regs))
>  		local_irq_enable();
>  }
>  
> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index aea6f7e8e9c6..9ce2013e70ae 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -347,7 +347,7 @@ notrace unsigned long interrupt_exit_user_prepare(struct pt_regs *regs)
>  	unsigned long ret;
>  
>  	BUG_ON(regs_is_unrecoverable(regs));
> -	BUG_ON(arch_irq_disabled_regs(regs));
> +	BUG_ON(regs_irqs_disabled(regs));
>  	CT_WARN_ON(ct_state() == CT_STATE_USER);
>  
>  	/*
> @@ -396,7 +396,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>  
>  	local_irq_disable();
>  
> -	if (!arch_irq_disabled_regs(regs)) {
> +	if (!regs_irqs_disabled(regs)) {
>  		/* Returning to a kernel context with local irqs enabled. */
>  		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>  again:
> diff --git a/arch/powerpc/kernel/syscall.c b/arch/powerpc/kernel/syscall.c
> index be159ad4b77b..9f03a6263fb4 100644
> --- a/arch/powerpc/kernel/syscall.c
> +++ b/arch/powerpc/kernel/syscall.c
> @@ -32,7 +32,7 @@ notrace long system_call_exception(struct pt_regs *regs, unsigned long r0)
>  
>  	BUG_ON(regs_is_unrecoverable(regs));
>  	BUG_ON(!user_mode(regs));
> -	BUG_ON(arch_irq_disabled_regs(regs));
> +	BUG_ON(regs_irqs_disabled(regs));
>  
>  #ifdef CONFIG_PPC_PKEY
>  	if (mmu_has_feature(MMU_FTR_PKEY)) {
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index cb8e9357383e..629f2a2d4780 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -1956,7 +1956,7 @@ DEFINE_INTERRUPT_HANDLER_RAW(performance_monitor_exception)
>  	 * prevent hash faults on user addresses when reading callchains (and
>  	 * looks better from an irq tracing perspective).
>  	 */
> -	if (IS_ENABLED(CONFIG_PPC64) && unlikely(arch_irq_disabled_regs(regs)))
> +	if (IS_ENABLED(CONFIG_PPC64) && unlikely(regs_irqs_disabled(regs)))
>  		performance_monitor_exception_nmi(regs);
>  	else
>  		performance_monitor_exception_async(regs);
> diff --git a/arch/powerpc/kernel/watchdog.c b/arch/powerpc/kernel/watchdog.c
> index 2429cb1c7baa..6111cbbde069 100644
> --- a/arch/powerpc/kernel/watchdog.c
> +++ b/arch/powerpc/kernel/watchdog.c
> @@ -373,7 +373,7 @@ DEFINE_INTERRUPT_HANDLER_NMI(soft_nmi_interrupt)
>  	u64 tb;
>  
>  	/* should only arrive from kernel, with irqs disabled */
> -	WARN_ON_ONCE(!arch_irq_disabled_regs(regs));
> +	WARN_ON_ONCE(!regs_irqs_disabled(regs));
>  
>  	if (!cpumask_test_cpu(cpu, &wd_cpus_enabled))
>  		return 0;
> diff --git a/arch/powerpc/perf/core-book3s.c b/arch/powerpc/perf/core-book3s.c
> index 8b0081441f85..f7518b7e3055 100644
> --- a/arch/powerpc/perf/core-book3s.c
> +++ b/arch/powerpc/perf/core-book3s.c
> @@ -2482,7 +2482,7 @@ static void __perf_event_interrupt(struct pt_regs *regs)
>  	 * will trigger a PMI after waking up from idle. Since counter values are _not_
>  	 * saved/restored in idle path, can lead to below "Can't find PMC" message.
>  	 */
> -	if (unlikely(!found) && !arch_irq_disabled_regs(regs))
> +	if (unlikely(!found) && !regs_irqs_disabled(regs))
>  		printk_ratelimited(KERN_WARNING "Can't find PMC that caused IRQ\n");
>  
>  	/*

