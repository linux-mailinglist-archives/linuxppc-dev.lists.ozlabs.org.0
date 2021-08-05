Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 10E5B3E0F0C
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 09:22:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4GgKnQ6pfpz3d7S
	for <lists+linuxppc-dev@lfdr.de>; Thu,  5 Aug 2021 17:22:34 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=csgroup.eu (client-ip=93.17.235.10; helo=pegase2.c-s.fr;
 envelope-from=christophe.leroy@csgroup.eu; receiver=<UNKNOWN>)
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4GgKn26Xzrz307B
 for <linuxppc-dev@lists.ozlabs.org>; Thu,  5 Aug 2021 17:22:10 +1000 (AEST)
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
 by localhost (Postfix) with ESMTP id 4GgKmv1Qd7z9sTQ;
 Thu,  5 Aug 2021 09:22:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
 by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vVLALSTpUWcO; Thu,  5 Aug 2021 09:22:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
 by pegase2.c-s.fr (Postfix) with ESMTP id 4GgKmv0RKCz9sVh;
 Thu,  5 Aug 2021 09:22:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id E87E88B7B9;
 Thu,  5 Aug 2021 09:22:06 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
 by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
 with ESMTP id LT6tMK24Gv07; Thu,  5 Aug 2021 09:22:06 +0200 (CEST)
Received: from [192.168.4.90] (unknown [192.168.4.90])
 by messagerie.si.c-s.fr (Postfix) with ESMTP id 90DBE8B7BB;
 Thu,  5 Aug 2021 09:22:06 +0200 (CEST)
Subject: Re: [PATCH v1 11/55] powerpc/time: add API for KVM to re-arm the host
 timer/decrementer
To: Nicholas Piggin <npiggin@gmail.com>, kvm-ppc@vger.kernel.org
References: <20210726035036.739609-1-npiggin@gmail.com>
 <20210726035036.739609-12-npiggin@gmail.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Message-ID: <370398a9-4429-285e-4a0f-33759f39b2fc@csgroup.eu>
Date: Thu, 5 Aug 2021 09:22:05 +0200
User-Agent: Mozilla/5.0 (Windows NT 6.1; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210726035036.739609-12-npiggin@gmail.com>
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
Cc: linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>



Le 26/07/2021 à 05:49, Nicholas Piggin a écrit :
> Rather than have KVM look up the host timer and fiddle with the
> irq-work internal details, have the powerpc/time.c code provide a
> function for KVM to re-arm the Linux timer code when exiting a
> guest.
> 
> This is implementation has an improvement over existing code of
> marking a decrementer interrupt as soft-pending if a timer has
> expired, rather than setting DEC to a -ve value, which tended to
> cause host timers to take two interrupts (first hdec to exit the
> guest, then the immediate dec).
> 
> Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> ---
>   arch/powerpc/include/asm/time.h | 16 +++-------
>   arch/powerpc/kernel/time.c      | 52 +++++++++++++++++++++++++++------
>   arch/powerpc/kvm/book3s_hv.c    |  7 ++---
>   3 files changed, 49 insertions(+), 26 deletions(-)
> 
> diff --git a/arch/powerpc/include/asm/time.h b/arch/powerpc/include/asm/time.h
> index 69b6be617772..924b2157882f 100644
> --- a/arch/powerpc/include/asm/time.h
> +++ b/arch/powerpc/include/asm/time.h
> @@ -99,18 +99,6 @@ extern void div128_by_32(u64 dividend_high, u64 dividend_low,
>   extern void secondary_cpu_time_init(void);
>   extern void __init time_init(void);
>   
> -#ifdef CONFIG_PPC64
> -static inline unsigned long test_irq_work_pending(void)
> -{
> -	unsigned long x;
> -
> -	asm volatile("lbz %0,%1(13)"
> -		: "=r" (x)
> -		: "i" (offsetof(struct paca_struct, irq_work_pending)));
> -	return x;
> -}
> -#endif
> -
>   DECLARE_PER_CPU(u64, decrementers_next_tb);
>   
>   static inline u64 timer_get_next_tb(void)
> @@ -118,6 +106,10 @@ static inline u64 timer_get_next_tb(void)
>   	return __this_cpu_read(decrementers_next_tb);
>   }
>   
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +void timer_rearm_host_dec(u64 now);
> +#endif
> +
>   /* Convert timebase ticks to nanoseconds */
>   unsigned long long tb_to_ns(unsigned long long tb_ticks);
>   
> diff --git a/arch/powerpc/kernel/time.c b/arch/powerpc/kernel/time.c
> index 72d872b49167..016828b7401b 100644
> --- a/arch/powerpc/kernel/time.c
> +++ b/arch/powerpc/kernel/time.c
> @@ -499,6 +499,16 @@ EXPORT_SYMBOL(profile_pc);
>    * 64-bit uses a byte in the PACA, 32-bit uses a per-cpu variable...
>    */
>   #ifdef CONFIG_PPC64
> +static inline unsigned long test_irq_work_pending(void)
> +{
> +	unsigned long x;
> +
> +	asm volatile("lbz %0,%1(13)"
> +		: "=r" (x)
> +		: "i" (offsetof(struct paca_struct, irq_work_pending)));

Can we just use READ_ONCE() instead of hard coding the read ?


> +	return x;
> +}
> +
>   static inline void set_irq_work_pending_flag(void)
>   {
>   	asm volatile("stb %0,%1(13)" : :
> @@ -542,13 +552,44 @@ void arch_irq_work_raise(void)
>   	preempt_enable();
>   }
>   
> +static void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +	/* We may have raced with new irq work */
> +	if (unlikely(test_irq_work_pending()))
> +		set_dec(1);
> +}
> +
>   #else  /* CONFIG_IRQ_WORK */
>   
>   #define test_irq_work_pending()	0
>   #define clear_irq_work_pending()
>   
> +static void set_dec_or_work(u64 val)
> +{
> +	set_dec(val);
> +}
>   #endif /* CONFIG_IRQ_WORK */
>   
> +#ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
> +void timer_rearm_host_dec(u64 now)
> +{
> +	u64 *next_tb = this_cpu_ptr(&decrementers_next_tb);
> +
> +	WARN_ON_ONCE(!arch_irqs_disabled());
> +	WARN_ON_ONCE(mfmsr() & MSR_EE);
> +
> +	if (now >= *next_tb) {
> +		local_paca->irq_happened |= PACA_IRQ_DEC;
> +	} else {
> +		now = *next_tb - now;
> +		if (now <= decrementer_max)
> +			set_dec_or_work(now);
> +	}
> +}
> +EXPORT_SYMBOL_GPL(timer_rearm_host_dec);
> +#endif
> +
>   /*
>    * timer_interrupt - gets called when the decrementer overflows,
>    * with interrupts disabled.
> @@ -609,10 +650,7 @@ DEFINE_INTERRUPT_HANDLER_ASYNC(timer_interrupt)
>   	} else {
>   		now = *next_tb - now;
>   		if (now <= decrementer_max)
> -			set_dec(now);
> -		/* We may have raced with new irq work */
> -		if (test_irq_work_pending())
> -			set_dec(1);
> +			set_dec_or_work(now);
>   		__this_cpu_inc(irq_stat.timer_irqs_others);
>   	}
>   
> @@ -854,11 +892,7 @@ static int decrementer_set_next_event(unsigned long evt,
>   				      struct clock_event_device *dev)
>   {
>   	__this_cpu_write(decrementers_next_tb, get_tb() + evt);
> -	set_dec(evt);
> -
> -	/* We may have raced with new irq work */
> -	if (test_irq_work_pending())
> -		set_dec(1);
> +	set_dec_or_work(evt);
>   
>   	return 0;
>   }
> diff --git a/arch/powerpc/kvm/book3s_hv.c b/arch/powerpc/kvm/book3s_hv.c
> index 6e6cfb10e9bb..0cef578930f9 100644
> --- a/arch/powerpc/kvm/book3s_hv.c
> +++ b/arch/powerpc/kvm/book3s_hv.c
> @@ -4018,11 +4018,8 @@ static int kvmhv_p9_guest_entry(struct kvm_vcpu *vcpu, u64 time_limit,
>   	vc->entry_exit_map = 0x101;
>   	vc->in_guest = 0;
>   
> -	next_timer = timer_get_next_tb();
> -	set_dec(next_timer - tb);
> -	/* We may have raced with new irq work */
> -	if (test_irq_work_pending())
> -		set_dec(1);
> +	timer_rearm_host_dec(tb);
> +
>   	mtspr(SPRN_SPRG_VDSO_WRITE, local_paca->sprg_vdso);
>   
>   	kvmhv_load_host_pmu();
> 
