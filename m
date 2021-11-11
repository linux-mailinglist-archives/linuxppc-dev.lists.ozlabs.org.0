Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id E20C644D111
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 05:56:09 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4HqTvC5yCHz2yb5
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 Nov 2021 15:56:07 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=qCM/P8yF;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4HqTtY0hvgz2yLd
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 11 Nov 2021 15:55:33 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au
 header.a=rsa-sha256 header.s=201909 header.b=qCM/P8yF; 
 dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4HqTtS41wYz4xbs;
 Thu, 11 Nov 2021 15:55:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
 s=201909; t=1636606530;
 bh=GCVMUlmIvsbs8ofijos/QMPB8fyrPXIzfNWltTIec0g=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=qCM/P8yF3p0irn0/dtMmMfI4uHveOGQ7sKdYMeoJlHGC+sdX0SFPl62PUHPn9j0SI
 ZeMkNjKtdrSCztYOPnsyKYRXWVKeFrbJfAAjy/vPI041IpnfL4sckQWiUQnh6usAE6
 8asvi/faiow9Hp5v1LHlZ5ypCQXvaoMC3pL1IXS7dZFbja0g6QGpd5tiqlm3nFjmYv
 RqSoIkIE7GocK03amwDHrCBn/C6gtLIclVwHYImcfNhqGNffJQn8I4TUN09I6fgPU7
 T+Mr3pthkmMKgPX1W7PTOo2yGb2pFppAbTtgUBckS8uUZ4fPawjUYKcF6MFZnddv9J
 yYHCHuxVNMvVA==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Valentin Schneider <valentin.schneider@arm.com>,
 linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com,
 linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org
Subject: Re: [PATCH v2 3/5] powerpc: Use preemption model accessors
In-Reply-To: <20211110202448.4054153-4-valentin.schneider@arm.com>
References: <20211110202448.4054153-1-valentin.schneider@arm.com>
 <20211110202448.4054153-4-valentin.schneider@arm.com>
Date: Thu, 11 Nov 2021 15:55:27 +1100
Message-ID: <87o86rmgu8.fsf@mpe.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
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
 Steven Rostedt <rostedt@goodmis.org>, Paul Mackerras <paulus@samba.org>,
 Masahiro Yamada <masahiroy@kernel.org>, Ingo Molnar <mingo@kernel.org>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Valentin Schneider <valentin.schneider@arm.com> writes:
> Per PREEMPT_DYNAMIC, checking CONFIG_PREEMPT doesn't tell you the actual
> preemption model of the live kernel. Use the newly-introduced accessors
> instead.
>
> sched_init() -> preempt_dynamic_init() happens way before IRQs are set up,
> so this should be fine.

Despite the name interrupt_exit_kernel_prepare() is called before IRQs
are setup, traps and page faults are "interrupts" here.

So I'm not sure about adding that call there, because it will trigger a
WARN if called early in boot, which will trigger a trap and depending on
the context we may not survive.

I'd be happier if we can make it a build-time check.

cheers

> diff --git a/arch/powerpc/kernel/interrupt.c b/arch/powerpc/kernel/interrupt.c
> index de10a2697258..c56c10b59be3 100644
> --- a/arch/powerpc/kernel/interrupt.c
> +++ b/arch/powerpc/kernel/interrupt.c
> @@ -552,7 +552,7 @@ notrace unsigned long interrupt_exit_kernel_prepare(struct pt_regs *regs)
>  		/* Returning to a kernel context with local irqs enabled. */
>  		WARN_ON_ONCE(!(regs->msr & MSR_EE));
>  again:
> -		if (IS_ENABLED(CONFIG_PREEMPT)) {
> +		if (is_preempt_full()) {
>  			/* Return to preemptible kernel context */
>  			if (unlikely(current_thread_info()->flags & _TIF_NEED_RESCHED)) {
>  				if (preempt_count() == 0)
> diff --git a/arch/powerpc/kernel/traps.c b/arch/powerpc/kernel/traps.c
> index aac8c0412ff9..1cb31bbdc925 100644
> --- a/arch/powerpc/kernel/traps.c
> +++ b/arch/powerpc/kernel/traps.c
> @@ -265,7 +265,7 @@ static int __die(const char *str, struct pt_regs *regs, long err)
>  	printk("%s PAGE_SIZE=%luK%s%s%s%s%s%s %s\n",
>  	       IS_ENABLED(CONFIG_CPU_LITTLE_ENDIAN) ? "LE" : "BE",
>  	       PAGE_SIZE / 1024, get_mmu_str(),
> -	       IS_ENABLED(CONFIG_PREEMPT) ? " PREEMPT" : "",
> +	       is_preempt_full() ? " PREEMPT" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? " SMP" : "",
>  	       IS_ENABLED(CONFIG_SMP) ? (" NR_CPUS=" __stringify(NR_CPUS)) : "",
>  	       debug_pagealloc_enabled() ? " DEBUG_PAGEALLOC" : "",
> -- 
> 2.25.1
