Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFA76FF3CE
	for <lists+linuxppc-dev@lfdr.de>; Thu, 11 May 2023 16:15:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHDSh4nJFz3fNy
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 00:15:32 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=pOJqJS5i;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=pOJqJS5i;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHDRm2gxxz3fMk
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 00:14:43 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 75A5A21D09;
	Thu, 11 May 2023 14:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683814480; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=RsbmH7Uqop/nnM3vjIRjHRqffBOelcetDOasqeW6Jho=;
	b=pOJqJS5iXtgLyWgNrYikAH8lcP9VErhN6vam0bviIGKv5MIKfAJuXwdEnozUAl1mFiB4qM
	Td/bamTw2bqEgQNfkm93ZRlv/TH+VmTSwCohSr4w9x5dduYiCKpI5GaFu6jyUYqF9cD6Qa
	q9wqaGcZN1O3kEmspF38GXvD5Hh7KCE=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 5B4622C141;
	Thu, 11 May 2023 14:14:37 +0000 (UTC)
Date: Thu, 11 May 2023 16:14:37 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 09/17] watchdog/hardlockup: Add a "cpu" param to
 watchdog_hardlockup_check()
Message-ID: <ZFz4TVOyEU51b898@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.9.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu 2023-05-04 15:13:41, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector where the CPU
> checking for lockup might not be the currently running CPU, add a
> "cpu" parameter to watchdog_hardlockup_check().
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -92,14 +92,14 @@ static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
>  static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
>  static unsigned long watchdog_hardlockup_dumped_stacks;
>  
> -static bool watchdog_hardlockup_is_lockedup(void)
> +static bool watchdog_hardlockup_is_lockedup(unsigned int cpu)
>  {
> -	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
> +	unsigned long hrint = per_cpu(hrtimer_interrupts, cpu);

My radar tells me that this should be
READ_ONCE(per_cpu(hrtimer_interrupts, cpu)) when the value might
be modified on another CPU. Otherwise, the compiler is allowed
to split the read into more instructions.

It will be needed for the buddy detector. And it will require
also incrementing the value in watchdog_hardlockup_interrupt_count()
an atomic way.

Note that __this_cpu_inc_return() does not guarantee atomicity
according to my understanding. In theory, the following should
work because counter will never be incremented in parallel:

static unsigned long watchdog_hardlockup_interrupt_count(void)
{
	unsigned long count;

	count = __this_cpu_read(hrtimer_interrupts);
	count++;
	WRITE_ONCE(*raw_cpu_ptr(hrtimer_interrupts), count);
}

but it is nasty. A more elegant solution might be using atomic_t
for hrtimer_interrupts counter.

> -	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
> +	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
>  		return true;
>  
> -	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;

IMHO, hrtimer_interrupts_saved might be handled this way.
The value is read/written only by this function.

The buddy watchdog should see consistent values even when
the buddy CPU goes offline. This check should never race
because this CPU should get touched when another buddy
gets assigned.

Well, it would deserve a comment.

>  
>  	return false;
>  }
> @@ -117,35 +117,50 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
>  	 * fired multiple times before we overflow'd. If it hasn't
>  	 * then this is a good indication the cpu is stuck
>  	 */
> -	if (watchdog_hardlockup_is_lockedup()) {
> +	if (watchdog_hardlockup_is_lockedup(cpu)) {
>  		unsigned int this_cpu = smp_processor_id();
> +		struct cpumask backtrace_mask = *cpu_online_mask;
>  
>  		/* Only handle hardlockups once. */
> -		if (__this_cpu_read(watchdog_hardlockup_processed))
> +		if (per_cpu(watchdog_hardlockup_processed, cpu))

This should not need READ_ONCE()/WRITE_ONCE() because it is just bool.
Also it is read/modified only in this function on the same CPU.

>  			return;
>  
> -		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
> +		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", cpu);
>  		print_modules();
>  		print_irqtrace_events(current);
> -		if (regs)
> +		if (regs) {
>  			show_regs(regs);
> -		else
> -			dump_stack();
> +			cpumask_clear_cpu(cpu, &backtrace_mask);
> +		} else {
> +			/*
> +			 * If the locked up CPU is different than the CPU we're
> +			 * running on then we'll try to backtrace the CPU that
> +			 * locked up and then exclude it from later backtraces.
> +			 * If that fails or if we're running on the locked up
> +			 * CPU, just do a normal backtrace.
> +			 */
> +			if (cpu != this_cpu && trigger_single_cpu_backtrace(cpu)) {
> +				cpumask_clear_cpu(cpu, &backtrace_mask);
> +			} else {
> +				dump_stack();
> +				cpumask_clear_cpu(this_cpu, &backtrace_mask);

This will dump the stack on the current CPU when
trigger_single_cpu_backtrace(cpu) is not supported.
It would be confusing because the buddy watchdog
could be here only when this_cpu is not hardlocked.

It should be:

	if (cpu == this_cpu) {
		if (regs)
			show_regs(regs);
		else
			dump_stack();
		cpumask_clear_cpu(cpu, &backtrace_mask);
	} else {
		if (trigger_single_cpu_backtrace(cpu)
			cpumask_clear_cpu(cpu, &backtrace_mask);
	}

> +			}
> +		}
>  
>  		/*
> -		 * Perform all-CPU dump only once to avoid multiple hardlockups
> -		 * generating interleaving traces
> +		 * Perform multi-CPU dump only once to avoid multiple
> +		 * hardlockups generating interleaving traces
>  		 */
>  		if (sysctl_hardlockup_all_cpu_backtrace &&
>  		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
> -			trigger_allbutself_cpu_backtrace();
> +			trigger_cpumask_backtrace(&backtrace_mask);
>  
>  		if (hardlockup_panic)
>  			nmi_panic(regs, "Hard LOCKUP");
>  
> -		__this_cpu_write(watchdog_hardlockup_processed, true);
> +		per_cpu(watchdog_hardlockup_processed, cpu) = true;
>  	} else {
> -		__this_cpu_write(watchdog_hardlockup_processed, false);
> +		per_cpu(watchdog_hardlockup_processed, cpu) = false;
>  	}
>  }
>  

Best Regards,
Petr
