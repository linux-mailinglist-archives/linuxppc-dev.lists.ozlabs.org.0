Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D6863323D
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 02:38:53 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NGRk34NMXz3cK5
	for <lists+linuxppc-dev@lfdr.de>; Tue, 22 Nov 2022 12:38:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iooDK4IB;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=srs0=hi7z=3w=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=iooDK4IB;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NGRj40Prbz2yyZ
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 22 Nov 2022 12:37:59 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id F0587B80B2F;
	Tue, 22 Nov 2022 01:37:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49E3C433C1;
	Tue, 22 Nov 2022 01:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669081074;
	bh=QcONz78rL0Sk+f9V0abznXKrHZ2DoMdZuXQELbeKy4A=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=iooDK4IBUeRwKAN/9vC+xPpwR+SCQ88Cbf4UYRDhNWFqJMe/W8RY3wYdidBBWBL6a
	 Rxw4IZTlwYJos4i4Q5y/dtUWlm9FvusqNf3F+/hNqspeQNSWUk6CGV7cjbbHlFgc1z
	 1KUkKENH/g5ZpK23jaMUlqH5wJ4Kj/xkQpre1ft7+lleVFA6KrsZuQAYQamonAZr0/
	 /I3pd1plrVjPtJVCWbatStdIz65msSoTNPGGoyZfgqut0+Xcbf08yFQpua27sFQEoj
	 y/1WGq00HPY16Kvm8MXEDbgEe97iPq8qpbp2KEUf6iQe1xF8POKHWP1cvAdBn36IuX
	 kouHFTFN32u9Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 36CF05C0641; Mon, 21 Nov 2022 17:37:54 -0800 (PST)
Date: Mon, 21 Nov 2022 17:37:54 -0800
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Zhouyi Zhou <zhouzhouyi@gmail.com>
Subject: Re: [PATCH linux-next][RFC]torture: avoid offline tick_do_timer_cpu
Message-ID: <20221122013754.GY4001@paulmck-ThinkPad-P17-Gen-1>
References: <20221121035140.118651-1-zhouzhouyi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221121035140.118651-1-zhouzhouyi@gmail.com>
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
Reply-To: paulmck@kernel.org
Cc: dave@stgolabs.net, josh@joshtriplett.org, linux-kernel@vger.kernel.org, fweisbec@gmail.com, tglx@linutronix.de, linuxppc-dev@lists.ozlabs.org, mingo@kernel.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Nov 21, 2022 at 11:51:40AM +0800, Zhouyi Zhou wrote:
> During CPU-hotplug torture (CONFIG_NO_HZ_FULL=y), if we try to
> offline tick_do_timer_cpu, the operation will fail because in
> function tick_nohz_cpu_down:
> ```
> if (tick_nohz_full_running && tick_do_timer_cpu == cpu)
>       return -EBUSY;
> ```
> Above bug was first discovered in torture tests performed in PPC VM
> of Open Source Lab of Oregon State University, and reproducable in RISC-V
> and X86-64 (with additional kernel commandline cpu0_hotplug).
> 
> In this patch, we avoid offline tick_do_timer_cpu by distribute
> the offlining cpu among remaining cpus.
> 
> Signed-off-by: Zhouyi Zhou <zhouzhouyi@gmail.com>

Good show chasing this down!

A couple of questions below.

> ---
>  include/linux/tick.h        |  1 +
>  kernel/time/tick-common.c   |  1 +
>  kernel/time/tick-internal.h |  1 -
>  kernel/torture.c            | 10 ++++++++++
>  4 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/tick.h b/include/linux/tick.h
> index bfd571f18cfd..23cc0b205853 100644
> --- a/include/linux/tick.h
> +++ b/include/linux/tick.h
> @@ -14,6 +14,7 @@
>  #include <linux/rcupdate.h>
>  
>  #ifdef CONFIG_GENERIC_CLOCKEVENTS
> +extern int tick_do_timer_cpu __read_mostly;
>  extern void __init tick_init(void);
>  /* Should be core only, but ARM BL switcher requires it */
>  extern void tick_suspend_local(void);
> diff --git a/kernel/time/tick-common.c b/kernel/time/tick-common.c
> index 46789356f856..87b9b9afa320 100644
> --- a/kernel/time/tick-common.c
> +++ b/kernel/time/tick-common.c
> @@ -48,6 +48,7 @@ ktime_t tick_next_period;
>   *    procedure also covers cpu hotplug.
>   */
>  int tick_do_timer_cpu __read_mostly = TICK_DO_TIMER_BOOT;
> +EXPORT_SYMBOL_GPL(tick_do_timer_cpu);
>  #ifdef CONFIG_NO_HZ_FULL
>  /*
>   * tick_do_timer_boot_cpu indicates the boot CPU temporarily owns
> diff --git a/kernel/time/tick-internal.h b/kernel/time/tick-internal.h
> index 649f2b48e8f0..8953dca10fdd 100644
> --- a/kernel/time/tick-internal.h
> +++ b/kernel/time/tick-internal.h
> @@ -15,7 +15,6 @@
>  
>  DECLARE_PER_CPU(struct tick_device, tick_cpu_device);
>  extern ktime_t tick_next_period;
> -extern int tick_do_timer_cpu __read_mostly;
>  
>  extern void tick_setup_periodic(struct clock_event_device *dev, int broadcast);
>  extern void tick_handle_periodic(struct clock_event_device *dev);
> diff --git a/kernel/torture.c b/kernel/torture.c
> index 789aeb0e1159..bccbdd33dda2 100644
> --- a/kernel/torture.c
> +++ b/kernel/torture.c
> @@ -33,6 +33,7 @@
>  #include <linux/delay.h>
>  #include <linux/stat.h>
>  #include <linux/slab.h>
> +#include <linux/tick.h>
>  #include <linux/trace_clock.h>
>  #include <linux/ktime.h>
>  #include <asm/byteorder.h>
> @@ -358,7 +359,16 @@ torture_onoff(void *arg)
>  			schedule_timeout_interruptible(HZ / 10);
>  			continue;
>  		}
> +#ifdef CONFIG_NO_HZ_FULL
> +		/* do not offline tick do timer cpu */
> +		if (tick_nohz_full_running) {
> +			cpu = (torture_random(&rand) >> 4) % maxcpu;
> +			if (cpu >= tick_do_timer_cpu)

Why is this ">=" instead of "=="?

> +				cpu = (cpu + 1) % (maxcpu + 1);
> +		} else
> +#else
>  		cpu = (torture_random(&rand) >> 4) % (maxcpu + 1);
> +#endif

What happens if the value of tick_do_timer_cpu changes between the time of
the check above and the call to torture_offline() below?  Alternatively,
how is such a change in value prevented?

							Thanx, Paul

>  		if (!torture_offline(cpu,
>  				     &n_offline_attempts, &n_offline_successes,
>  				     &sum_offline, &min_offline, &max_offline))
> -- 
> 2.34.1
> 
