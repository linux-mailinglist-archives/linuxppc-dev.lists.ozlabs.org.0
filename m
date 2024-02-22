Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 418A5860511
	for <lists+linuxppc-dev@lfdr.de>; Thu, 22 Feb 2024 22:46:47 +0100 (CET)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mrBXcDKo;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Tgmts1MCbz3ckj
	for <lists+linuxppc-dev@lfdr.de>; Fri, 23 Feb 2024 08:46:45 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=mrBXcDKo;
	dkim-atps=neutral
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Tgmt62K7Rz3bsw
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 23 Feb 2024 08:46:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1708638366;
	bh=0ZmYCz+SCJ0BgfLpkAxVCmJACnVsDgEoO+/yVn8yWFo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=mrBXcDKoRMVzrXITn1EEU+aj01MFFwaaItfCmGPweSRFKwRzLcFrm08tgcOcLlWJA
	 l2eyNdSEkpR2DlS+x9UTf3fBjeLznOezB2H2sPmWkxoHYsvum78te77NTYVGQ72b5Z
	 CVEEgBK1uLKYtUlWWFHG2X+4hMR3FaWFEKu8p5tfBQBb7WWEHLOLS2NGgBhUWVKimk
	 LR3hdv5kPUSRvtIZVCVTtelIO8HVofEcPEBj3IMCZwosQgrLhs/uITZSlXENkDNi/v
	 B6hn+dozf5ysqZeRXb3fVcwulhUZtxq0GTR9KnCjP6wC0bD1Qf5JUl1N3uoA4Wt8Mi
	 jW8vPcRVGIGrA==
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4Tgmt55rTGz4wcC;
	Fri, 23 Feb 2024 08:46:05 +1100 (AEDT)
From: Michael Ellerman <mpe@ellerman.id.au>
To: Alexander Gordeev <agordeev@linux.ibm.com>, Ingo Molnar
 <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, Juri Lelli
 <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 RESEND 2/5] sched/vtime: get rid of generic
 vtime_task_switch() implementation
In-Reply-To: <5e8f7cfc5b405b892d55c51023e8149dfd83b253.1708612016.git.agordeev@linux.ibm.com>
References: <cover.1708612016.git.agordeev@linux.ibm.com>
 <5e8f7cfc5b405b892d55c51023e8149dfd83b253.1708612016.git.agordeev@linux.ibm.com>
Date: Fri, 23 Feb 2024 08:46:03 +1100
Message-ID: <87zfvs9nqc.fsf@mail.lhotse>
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
Cc: linux-s390@vger.kernel.org, Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>, linux-kernel@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org, Frederic Weisbecker <frederic@kernel.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Alexander Gordeev <agordeev@linux.ibm.com> writes:
> The generic vtime_task_switch() implementation gets built only
> if __ARCH_HAS_VTIME_TASK_SWITCH is not defined, but requires an
> architecture to implement arch_vtime_task_switch() callback at
> the same time, which is confusing.
>
> Further, arch_vtime_task_switch() is implemented for 32-bit PowerPC
> architecture only and vtime_task_switch() generic variant is rather
> superfluous.
>
> Simplify the whole vtime_task_switch() wiring by moving the existing
> generic implementation to PowerPC.
>
> Reviewed-by: Frederic Weisbecker <frederic@kernel.org>
> Reviewed-by: Nicholas Piggin <npiggin@gmail.com>
> Signed-off-by: Alexander Gordeev <agordeev@linux.ibm.com>
> ---
>  arch/powerpc/include/asm/cputime.h | 13 -------------
>  arch/powerpc/kernel/time.c         | 22 ++++++++++++++++++++++
>  kernel/sched/cputime.c             | 13 -------------
>  3 files changed, 22 insertions(+), 26 deletions(-)

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)

cheers

> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index 4961fb38e438..aff858ca99c0 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -32,23 +32,10 @@
>  #ifdef CONFIG_PPC64
>  #define get_accounting(tsk)	(&get_paca()->accounting)
>  #define raw_get_accounting(tsk)	(&local_paca->accounting)
> -static inline void arch_vtime_task_switch(struct task_struct *tsk) { }
>  
>  #else
>  #define get_accounting(tsk)	(&task_thread_info(tsk)->accounting)
>  #define raw_get_accounting(tsk)	get_accounting(tsk)
> -/*
> - * Called from the context switch with interrupts disabled, to charge all
> - * accumulated times to the current process, and to prepare accounting on
> - * the next process.
> - */
> -static inline void arch_vtime_task_switch(struct task_struct *prev)
> -{
> -	struct cpu_accounting_data *acct = get_accounting(current);
> -	struct cpu_accounting_data *acct0 = get_accounting(prev);
> -
> -	acct->starttime = acct0->starttime;
> -}
>  #endif
>  
>  /*
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index df20cf201f74..c0fdc6d94fee 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -354,6 +354,28 @@ void vtime_flush(struct task_struct *tsk)
>  	acct->hardirq_time = 0;
>  	acct->softirq_time = 0;
>  }
> +
> +/*
> + * Called from the context switch with interrupts disabled, to charge all
> + * accumulated times to the current process, and to prepare accounting on
> + * the next process.
> + */
> +void vtime_task_switch(struct task_struct *prev)
> +{
> +	if (is_idle_task(prev))
> +		vtime_account_idle(prev);
> +	else
> +		vtime_account_kernel(prev);
> +
> +	vtime_flush(prev);
> +
> +	if (!IS_ENABLED(CONFIG_PPC64)) {
> +		struct cpu_accounting_data *acct = get_accounting(current);
> +		struct cpu_accounting_data *acct0 = get_accounting(prev);
> +
> +		acct->starttime = acct0->starttime;
> +	}
> +}
>  #endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>  
>  void __no_kcsan __delay(unsigned long loops)
> diff --git a/kernel/sched/cputime.c b/kernel/sched/cputime.c
> index af7952f12e6c..aa48b2ec879d 100644
> --- a/kernel/sched/cputime.c
> +++ b/kernel/sched/cputime.c
> @@ -424,19 +424,6 @@ static inline void irqtime_account_process_tick(struct task_struct *p, int user_
>   */
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
>  
> -# ifndef __ARCH_HAS_VTIME_TASK_SWITCH
> -void vtime_task_switch(struct task_struct *prev)
> -{
> -	if (is_idle_task(prev))
> -		vtime_account_idle(prev);
> -	else
> -		vtime_account_kernel(prev);
> -
> -	vtime_flush(prev);
> -	arch_vtime_task_switch(prev);
> -}
> -# endif
> -
>  void vtime_account_irq(struct task_struct *tsk, unsigned int offset)
>  {
>  	unsigned int pc = irq_count() - offset;
> -- 
> 2.40.1
