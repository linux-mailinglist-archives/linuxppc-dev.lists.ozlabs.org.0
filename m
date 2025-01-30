Return-Path: <linuxppc-dev+bounces-5716-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D8FA230A9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 30 Jan 2025 15:54:21 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4YkMVf74Zwz30Tp;
	Fri, 31 Jan 2025 01:54:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2a0a:51c0:0:12e:550::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1738248858;
	cv=none; b=CeSlODtSlPN3VAUSNA0z6DdMhkg2/tINIlE41O8DyQwZpwbFFPIr5EH1rJdzpcVqjzRpQrRZ1+nbWLb8fsFkf7K2KCgUUl2mq8Q7VRJX6QTh9OTNiKfVW/gBbJrx0TIjV/uu4KZppTwC397+xMkcjy5vEXyJhtaspc31xij40TK2rAPt23FUp0EN4i7ftj3bkumYwhAoz+MzajIGZiH4xWvroMH6UcCKSWGi0UhQFJ5aVQ08PXYEW4cMxiTqPbXHmjlkRMrF3tgapTKoOoyfJ9yCq/fSwwEaEXO4hAax7kucpynhsA1BTmAwlTle0XKxTDh6rDck82fRhcLnQcRgow==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1738248858; c=relaxed/relaxed;
	bh=QWMw4aDNMt361EsCHVNvPU7UiHMTHVWLVcti5oKqreE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nzJbCV2bF0mg3yE8/nx/LOrV0bHiWYuGeaZCQVt1wkwXolVhAIUMUQ4wqMfJLJXwSHS2W2qo7hB38UdXpwJnBHDJUop9AZm7YMMBhkxqPXW+pA5wN43C1lyZLt2hlKCuziwiMhgxijn5dGP8ZISGOiZb9j8qbaz5kmWoeqQEn+T8Wnh+cCJ+XswIwlOq6RUyMe2vBED2oUSjlCpoxRXFKiYkEHpJ9PxY/XK7GiS6lPGEzUoxb7VaOgMhM1Vv+wFByy4LfStz0thPyfeP8dV/Tw3PX4jqWt12sqA7tT08foCnPgVtgW34iSsAL+YxrCYUBSplDTaoNFVStmTDyuMjMw==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CCHH87qT; dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r/Dszy6a; dkim-atps=neutral; spf=pass (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org) smtp.mailfrom=linutronix.de
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=CCHH87qT;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=r/Dszy6a;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=linutronix.de (client-ip=2a0a:51c0:0:12e:550::1; helo=galois.linutronix.de; envelope-from=bigeasy@linutronix.de; receiver=lists.ozlabs.org)
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4YkMVd2mjRz2xtK
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 31 Jan 2025 01:54:17 +1100 (AEDT)
Date: Thu, 30 Jan 2025 15:54:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738248850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWMw4aDNMt361EsCHVNvPU7UiHMTHVWLVcti5oKqreE=;
	b=CCHH87qT5uCIW/N0OxMeFKBSmGr8veG9wkdBtfe21MGlFEiUA2HWAQlDDBWgUEPl8urxNE
	xIQVO+cwUDhUIBrUDjYCiphdDwjKTEKezbSftd94ot2UXGTefU4+UlNO43FuvBQArVo7W3
	GbjLvhnccAwcMnoFP+yRtfEqW/XjzE9ORstzTjVppYaaz8xQXz8+vWMyHEKWAagy0krijo
	GMf9UH3HbkyTGf+HjBBncec9xngiXlkxIjSPhXksjfXFUfeazn1MeFAMKp6vl++H0R0VKl
	tkFy3X8gK8UHppNiyUzQnKDi8UnzC586B6XL9wsPOovn54c7JzCrnFCvbQmf6g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738248850;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QWMw4aDNMt361EsCHVNvPU7UiHMTHVWLVcti5oKqreE=;
	b=r/Dszy6agS6EyceeKfZ9vueiKkyHGnMG5SYufs7wflS1KMOqNHMttXFFWzpNwdE3qiYW+v
	A+tLzwyFgbbSmPBg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: mpe@ellerman.id.au, maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
	npiggin@gmail.com, christophe.leroy@csgroup.eu,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/1] powerpc: Enable dynamic preemption
Message-ID: <20250130145409.D_so_mR1@linutronix.de>
References: <20250106051919.55020-1-sshegde@linux.ibm.com>
 <20250106051919.55020-2-sshegde@linux.ibm.com>
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
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250106051919.55020-2-sshegde@linux.ibm.com>
X-Spam-Status: No, score=-2.5 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS
	autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on lists.ozlabs.org

On 2025-01-06 10:49:19 [+0530], Shrikanth Hegde wrote:
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -25,6 +25,10 @@
>  unsigned long global_dbcr0[NR_CPUS];
>  #endif
>  
> +#if defined(CONFIG_PREEMPT_DYNAMIC) && defined(CONFIG_HAVE_PREEMPT_DYNAMIC_KEY)
> +DEFINE_STATIC_KEY_TRUE(sk_dynamic_irqentry_exit_cond_resched);
> +#endif

I am uncertain here: Do you need to DEFINE it? It is set by the sched
core which also defines it. It should be same thing after all, right?

> +
>  #ifdef CONFIG_PPC_BOOK3S_64
>  DEFINE_STATIC_KEY_FALSE(interrupt_exit_not_reentrant);
>  static inline bool exit_must_hard_disable(void)
> @@ -396,7 +400,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>  		/* Returning to a kernel context with local irqs enabled. */
>  		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>  again:
> -		if (IS_ENABLED(CONFIG_PREEMPTION)) {
> +		if (preempt_model_preemptible()) {

CONFIG_HAVE_PREEMPT_DYNAMIC_KEY is the only option, right? Wouldn't

| #DEFINE need_irq_preemption() \
|          (static_branch_unlikely(&sk_dynamic_irqentry_exit_cond_resched))
| 
| 	if (need_irq_preemption()) {

be a bit smaller/ quicker? This could be a fast path ;)

>  			/* Return to preemptible kernel context */
>  			if (unlikely(read_thread_flags() & _TIF_NEED_RESCHED)) {
>  				if (preempt_count() == 0)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index edf5cabe5dfd..2556fa8ec019 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -266,7 +266,11 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>  	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>  	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>  	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       preempt_model_none()      ? "none" :
> +	       preempt_model_voluntary() ? "voluntary" :
> +	       preempt_model_full()      ? "full" :
> +	       preempt_model_lazy()      ? "lazy" :
> +	       "",

So intend to rework this part. I have patches stashed at
	https://git.kernel.org/pub/scm/linux/kernel/git/bigeasy/staging.git/log/?h=preemption_string

which I didn't sent yet due to the merge window. Just a heads up ;)

>  	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>  	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",

Sebastian

