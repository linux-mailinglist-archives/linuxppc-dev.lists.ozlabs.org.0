Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E3C65F641E
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 12:07:19 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MjnDM09JSz3bqn
	for <lists+linuxppc-dev@lfdr.de>; Thu,  6 Oct 2022 21:07:15 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yv4+94qm;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Received: from gandalf.ozlabs.org (mail.ozlabs.org [IPv6:2404:9400:2221:ea00::3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MjnCP43rtz3bjL
	for <linuxppc-dev@lists.ozlabs.org>; Thu,  6 Oct 2022 21:06:25 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=ellerman.id.au header.i=@ellerman.id.au header.a=rsa-sha256 header.s=201909 header.b=Yv4+94qm;
	dkim-atps=neutral
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.ozlabs.org (Postfix) with ESMTPSA id 4MjnCL1nxlz4x1R;
	Thu,  6 Oct 2022 21:06:22 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ellerman.id.au;
	s=201909; t=1665050782;
	bh=2hc+K3RFpsKfU73znPc6xlTTAZY3ol8CRtf9InB4Qyw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yv4+94qmSFYgYqYzyka1HkbfK5Q9C0OzYhar303eK2mhGAm+brCBDlst/ve7WIjrT
	 KHZj/tg9yyW97qYtWM7Jxu3GFEXL87FdfatsDshHa/HfJrc6Z7f+TSQCzgM3sXYaOc
	 ZV28rWj0hnuXXbeHMzQBrIi2KPhQZihbFxDV7InMyFYjcrGzdpHpP/iCP7rUchrtkg
	 tpTs10mRXw6FWTj2r4z/cduTs5EwNzuJ/g1MeXb93csdP3vYBBG5HcND9tkVjCBN8r
	 9HzLBTLlEWryEzmQyv8ii2jEgVsXXymQDVqD+tl//UZ7fik4oKJam/rHaL5t3veVRT
	 WvBTYgsv7pzHg==
From: Michael Ellerman <mpe@ellerman.id.au>
To: Nicholas Piggin <npiggin@gmail.com>, linuxppc-dev@lists.ozlabs.org
Subject: Re: [RFC PATCH 2/3] powerpc: remove the last remnants of cputime_t
In-Reply-To: <20221004063306.511154-3-npiggin@gmail.com>
References: <20221004063306.511154-1-npiggin@gmail.com>
 <20221004063306.511154-3-npiggin@gmail.com>
Date: Thu, 06 Oct 2022 21:06:20 +1100
Message-ID: <871qrlp8pv.fsf@mpe.ellerman.id.au>
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
Cc: Nicholas Piggin <npiggin@gmail.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Nicholas Piggin <npiggin@gmail.com> writes:
> cputime_t is no longer, converted to u64.

Would be good to have some explanation of why we had it and why we don't
need it anymore.

cheers

> diff --git a/arch/powerpc/include/asm/cputime.h b/arch/powerpc/include/asm/cputime.h
> index 431ae2343022..4961fb38e438 100644
> --- a/arch/powerpc/include/asm/cputime.h
> +++ b/arch/powerpc/include/asm/cputime.h
> @@ -21,23 +21,8 @@
>  #include <asm/param.h>
>  #include <asm/firmware.h>
>  
> -typedef u64 __nocast cputime_t;
> -typedef u64 __nocast cputime64_t;
> -
> -#define cmpxchg_cputime(ptr, old, new) cmpxchg(ptr, old, new)
> -
>  #ifdef __KERNEL__
> -/*
> - * Convert cputime <-> microseconds
> - */
> -extern u64 __cputime_usec_factor;
> -
> -static inline unsigned long cputime_to_usecs(const cputime_t ct)
> -{
> -	return mulhdu((__force u64) ct, __cputime_usec_factor);
> -}
> -
> -#define cputime_to_nsecs(cputime) tb_to_ns((__force u64)cputime)
> +#define cputime_to_nsecs(cputime) tb_to_ns(cputime)
>  
>  /*
>   * PPC64 uses PACA which is task independent for storing accounting data while
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index a2ab397065c6..d68de3618741 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -130,7 +130,7 @@ unsigned long tb_ticks_per_jiffy;
>  unsigned long tb_ticks_per_usec = 100; /* sane default */
>  EXPORT_SYMBOL(tb_ticks_per_usec);
>  unsigned long tb_ticks_per_sec;
> -EXPORT_SYMBOL(tb_ticks_per_sec);	/* for cputime_t conversions */
> +EXPORT_SYMBOL(tb_ticks_per_sec);	/* for cputime conversions */
>  
>  DEFINE_SPINLOCK(rtc_lock);
>  EXPORT_SYMBOL_GPL(rtc_lock);
> @@ -150,21 +150,6 @@ EXPORT_SYMBOL_GPL(ppc_tb_freq);
>  bool tb_invalid;
>  
>  #ifdef CONFIG_VIRT_CPU_ACCOUNTING_NATIVE
> -/*
> - * Factor for converting from cputime_t (timebase ticks) to
> - * microseconds. This is stored as 0.64 fixed-point binary fraction.
> - */
> -u64 __cputime_usec_factor;
> -EXPORT_SYMBOL(__cputime_usec_factor);
> -
> -static void calc_cputime_factors(void)
> -{
> -	struct div_result res;
> -
> -	div128_by_32(1000000, 0, tb_ticks_per_sec, &res);
> -	__cputime_usec_factor = res.result_low;
> -}
> -
>  /*
>   * Read the SPURR on systems that have it, otherwise the PURR,
>   * or if that doesn't exist return the timebase value passed in.
> @@ -369,10 +354,7 @@ void vtime_flush(struct task_struct *tsk)
>  	acct->hardirq_time = 0;
>  	acct->softirq_time = 0;
>  }
> -
> -#else /* ! CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
> -#define calc_cputime_factors()
> -#endif
> +#endif /* CONFIG_VIRT_CPU_ACCOUNTING_NATIVE */
>  
>  void __delay(unsigned long loops)
>  {
> @@ -914,7 +896,6 @@ void __init time_init(void)
>  	tb_ticks_per_jiffy = ppc_tb_freq / HZ;
>  	tb_ticks_per_sec = ppc_tb_freq;
>  	tb_ticks_per_usec = ppc_tb_freq / 1000000;
> -	calc_cputime_factors();
>  
>  	/*
>  	 * Compute scale factor for sched_clock.
> -- 
> 2.37.2
