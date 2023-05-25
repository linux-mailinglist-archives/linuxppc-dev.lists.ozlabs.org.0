Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6277110F3
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 18:27:57 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRtkz3bj6z3bTf
	for <lists+linuxppc-dev@lfdr.de>; Fri, 26 May 2023 02:27:55 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=C4s+hdIy;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=C4s+hdIy;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRtk60Vtkz3f8l
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 26 May 2023 02:27:08 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id 34E5221C65;
	Thu, 25 May 2023 16:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1685032018; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=qBSf8dQvqenvM4XuaXqBfFlxjVrL5fPe+CB4lmnXjuk=;
	b=C4s+hdIyCnXmGRzN2XmAwfRTIB+9xRT+DvPlRO3vRcui7FbrbO1JQDWFx0rfTnZPSjX5i1
	rRTvdTF0fGM/eRmPRJQYStRfQXRzvjlNo/ZL8IUHR6kuT7x8QzWCoJZmsiqU3ukACJ1fan
	DauIAYjaJf8QRWaSlI7nNnrfcF7cPGY=
Received: from suse.cz (unknown [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id A2C412C141;
	Thu, 25 May 2023 16:26:55 +0000 (UTC)
Date: Thu, 25 May 2023 18:26:52 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 14/18] watchdog/hardlockup: detect hard lockups using
 secondary (buddy) CPUs
Message-ID: <ZG-MTPSZakRDl2CP@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.14.I6bf789d21d0c3d75d382e7e51a804a7a51315f2c@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Colin Cross <ccross@android.com>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-found
 ation.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-19 10:18:38, Douglas Anderson wrote:
> Implement a hardlockup detector that doesn't doesn't need any extra
> arch-specific support code to detect lockups. Instead of using
> something arch-specific we will use the buddy system, where each CPU
> watches out for another one. Specifically, each CPU will use its
> softlockup hrtimer to check that the next CPU is processing hrtimer
> interrupts by verifying that a counter is increasing.
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -85,7 +85,7 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>  
>  #endif /* CONFIG_HARDLOCKUP_DETECTOR */
>  
> -#if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
> +#if defined(CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER)
>  
>  static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
>  static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
> @@ -106,6 +106,14 @@ notrace void arch_touch_nmi_watchdog(void)
>  }
>  EXPORT_SYMBOL(arch_touch_nmi_watchdog);
>  
> +void watchdog_hardlockup_touch_cpu(unsigned int cpu)
> +{
> +	per_cpu(watchdog_hardlockup_touched, cpu) = true;
> +
> +	/* Match with smp_rmb() in watchdog_hardlockup_check() */
> +	smp_wmb();

It is great that you described where the related barrier is.

Another important information is what exactly is synchronized.
And I am actually not sure what we are synchronizing here.

My understanding is that a write barrier should synchronize
related writes, for example:

	X = ...;
	/* Make sure that X is modified before Y */
	smp_wmb();
	Y = ...;

And the related read barrier should synchronize the related reads,
for example:

	if (test(Y)) {
		/*
		 * Make sure that we use the updated X when
		 * we saw the updated Y.
		 */
		 smp_rmb();
		 do_something(X);
	 }

IMHO, we do not need any barrier here because we have only
one variable "watchdog_hardlockup_touched" here.
watchdog_hardlockup_check() will either see the updated value
or not. But it does not synchronize it against any other
variables or values.

> +}
> +
>  static bool is_hardlockup(unsigned int cpu)
>  {
>  	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
> @@ -443,11 +454,15 @@ static enum hrtimer_restart watchdog_timer_fn(struct hrtimer *hrtimer)
>  	struct pt_regs *regs = get_irq_regs();
>  	int duration;
>  	int softlockup_all_cpu_backtrace = sysctl_softlockup_all_cpu_backtrace;
> +	unsigned long hrtimer_interrupts;
>  
>  	if (!watchdog_enabled)
>  		return HRTIMER_NORESTART;
>  
> -	watchdog_hardlockup_kick();
> +	hrtimer_interrupts = watchdog_hardlockup_kick();
> +
> +	/* test for hardlockups */

I would omit the comment. It is not valid when perf detector is used.
And checking the buddy is clear from the function name.

> +	watchdog_buddy_check_hardlockup(hrtimer_interrupts);

I would personally move this into watchdog_hardlockup_kick().
watchdog_timer_fn() is already complex enough. And checking
the buddy when kicking a CPU makes sense.

Also I would not pass "hrtimer_interrupts". I guess that it is
just an optimization. It is an extra churn in the code. IMHO,
is is not wort it. This code does not need to be super optimized.

> +

>  
>  	/* kick the softlockup detector */
>  	if (completion_done(this_cpu_ptr(&softlockup_completion))) {
> diff --git a/kernel/watchdog_buddy.c b/kernel/watchdog_buddy.c
> new file mode 100644
> index 000000000000..fee45af2e5bd
> --- /dev/null
> +++ b/kernel/watchdog_buddy.c
> @@ -0,0 +1,93 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +#include <linux/cpu.h>
> +#include <linux/cpumask.h>
> +#include <linux/kernel.h>
> +#include <linux/nmi.h>
> +#include <linux/percpu-defs.h>
> +
> +static cpumask_t __read_mostly watchdog_cpus;
> +
> +static unsigned int watchdog_next_cpu(unsigned int cpu)
> +{
> +	cpumask_t cpus = watchdog_cpus;

A copy should be done by cpumask_copy().

But the question is why a copy would be needed. When called from
watchdog_buddy_check_hardlockup(), this function is not sychronized
against the CPU hotplug. And even the copying would be racy.

IMHO, the copy does not help much and we do not need it.

The only important this is that this function would return
a valid CPU. And I think that it is guarantted because
CPU0 could not be disabled.

> +	unsigned int next_cpu;
> +
> +	next_cpu = cpumask_next(cpu, &cpus);
> +	if (next_cpu >= nr_cpu_ids)
> +		next_cpu = cpumask_first(&cpus);
> +
> +	if (next_cpu == cpu)
> +		return nr_cpu_ids;
>> +	return next_cpu;
> +}
> +
> +int __init watchdog_hardlockup_probe(void)
> +{
> +	return 0;
> +}
> +
> +void watchdog_hardlockup_enable(unsigned int cpu)
> +{
> +	unsigned int next_cpu;
> +
> +	/*
> +	 * The new CPU will be marked online before the hrtimer interrupt
> +	 * gets a chance to run on it. If another CPU tests for a
> +	 * hardlockup on the new CPU before it has run its the hrtimer
> +	 * interrupt, it will get a false positive. Touch the watchdog on
> +	 * the new CPU to delay the check for at least 3 sampling periods
> +	 * to guarantee one hrtimer has run on the new CPU.
> +	 */
> +	watchdog_hardlockup_touch_cpu(cpu);
> +
> +	/*
> +	 * We are going to check the next CPU. Our watchdog_hrtimer
> +	 * need not be zero if the CPU has already been online earlier.
> +	 * Touch the watchdog on the next CPU to avoid false positive
> +	 * if we try to check it in less then 3 interrupts.
> +	 */
> +	next_cpu = watchdog_next_cpu(cpu);
> +	if (next_cpu < nr_cpu_ids)
> +		watchdog_hardlockup_touch_cpu(next_cpu);

Thinking loudly:

This feels racy when many CPUs are enabled/disabled in parallel.
I am not 100% sure it it can happen though.

My understanding is that it can't happen because the CPU hotplug
is serialized by cpu_add_remove_lock.

So, this seems to work after all.

> +
> +	cpumask_set_cpu(cpu, &watchdog_cpus);
> +}
> +
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -1035,10 +1035,55 @@ config BOOTPARAM_SOFTLOCKUP_PANIC
>  
>  	  Say N if unsure.
>  
> -config HARDLOCKUP_DETECTOR_PERF
> +# Both the "perf" and "buddy" hardlockup detectors count hrtimer
> +# interrupts. This config enables functions managing this common code.
> +config HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
>  	bool
>  	select SOFTLOCKUP_DETECTOR
>  
> +config HARDLOCKUP_DETECTOR_PERF
> +	bool
> +	depends on HAVE_HARDLOCKUP_DETECTOR_PERF
> +	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +
> +config HARDLOCKUP_DETECTOR_BUDDY
> +	bool
> +	depends on SMP
> +	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
> +
> +# For hardlockup detectors you can have one directly provided by the arch
> +# or use a "non-arch" one. If you're using a "non-arch" one that is
> +# further divided the perf hardlockup detector (which, confusingly, needs
> +# arch-provided perf support) and the buddy hardlockup detector (which just
> +# needs SMP). In either case, using the "non-arch" code conflicts with
> +# the NMI watchdog code (which is sometimes used directly and sometimes used
> +# by the arch-provided hardlockup detector).
> +config HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	bool
> +	depends on (HAVE_HARDLOCKUP_DETECTOR_PERF || SMP) && !HAVE_NMI_WATCHDOG
> +	default y
> +
> +config HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +	bool "Prefer the buddy CPU hardlockup detector"
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH && HAVE_HARDLOCKUP_DETECTOR_PERF && SMP

Huh, I have big troubles to scratch my head around this check:

       HAVE_HARDLOCKUP_DETECTOR_NON_ARCH depends on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP

       and this depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH and again
	       on HAVE_HARDLOCKUP_DETECTOR_PERF and SMP.

> +	help
> +	  Say Y here to prefer the buddy hardlockup detector over the perf one.
> +
> +	  With the buddy detector, each CPU uses its softlockup hrtimer
> +	  to check that the next CPU is processing hrtimer interrupts by
> +	  verifying that a counter is increasing.
> +
> +	  This hardlockup detector is useful on systems that don't have
> +	  an arch-specific hardlockup detector or if resources needed
> +	  for the hardlockup detector are better used for other things.
> +
> +# This will select the appropriate non-arch hardlockdup detector
> +config HARDLOCKUP_DETECTOR_NON_ARCH
> +	bool
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH
> +	select HARDLOCKUP_DETECTOR_BUDDY if !HAVE_HARDLOCKUP_DETECTOR_PERF || HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF && !HARDLOCKUP_DETECTOR_PREFER_BUDDY
> +
>  #
>  # Enables a timestamp based low pass filter to compensate for perf based
>  # hard lockup detection which runs too fast due to turbo modes.
> @@ -1053,9 +1098,10 @@ config HARDLOCKUP_CHECK_TIMESTAMP
>  config HARDLOCKUP_DETECTOR
>  	bool "Detect Hard Lockups"
>  	depends on DEBUG_KERNEL && !S390

Is there any reason why S390 could not or do not want to use the buddy
hardlockup detector.

> -	depends on HAVE_HARDLOCKUP_DETECTOR_PERF || HAVE_HARDLOCKUP_DETECTOR_ARCH
> +	depends on HAVE_HARDLOCKUP_DETECTOR_NON_ARCH || HAVE_HARDLOCKUP_DETECTOR_ARCH
>  	select LOCKUP_DETECTOR
> -	select HARDLOCKUP_DETECTOR_PERF if HAVE_HARDLOCKUP_DETECTOR_PERF
> +	select HARDLOCKUP_DETECTOR_NON_ARCH if HAVE_HARDLOCKUP_DETECTOR_NON_ARCH

Anyway, the configuration of the hard lockup detectors is insane and
this patchset makes it even worse, especially the new
HARDLOCKUP_DETECTOR_NON_ARCH stuff.

It seems that sparc, powerpc and s390 are somehow special. Do you
still have in mind how they are distinguished using the Kconfig
variables?

For example, I am pretty confused by the meaning of HAVE_NMI_WATCHDOG.

And sparc has its own variant of
watchdog_hardlockup_enable()/disable(). It means that it is
arch-specific. Does it work with the 13th patch which made
watchdog_hardlockup_enable()/disable() to be watchdog-hardlockup-type
specific? Is is somehow related to HAVE_NMI_WATCHDOG?
Does this replace the entire watchdog only only the enable part?

I think that we need to make this more straightforward. But I first
need to understand the existing maze of config variables.

Best Regards,
Petr
