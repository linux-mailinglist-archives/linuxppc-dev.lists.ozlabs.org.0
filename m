Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C470E168
	for <lists+linuxppc-dev@lfdr.de>; Tue, 23 May 2023 18:03:29 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QQfHg2YYHz3f8b
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 02:03:27 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CFqzXOj3;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.29; helo=smtp-out2.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=CFqzXOj3;
	dkim-atps=neutral
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QQfGs6GQHz3c6v
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 02:02:44 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id E976D1FDE4;
	Tue, 23 May 2023 16:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684857761; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cqLxfbe6m1nrIclFjUzmkz44DpKUbRwlhs98Py3OTY8=;
	b=CFqzXOj3bL7rPcBsBdnQq+i5O/CDOiB4nyZNA73SNAgWKZudQnAShHS3hyPjZMeVbo3Zg8
	JKxZ6KhMqP5e4g1LT0ZE4QYnnNKcDTQP5B5H4Eu5ag6gT1SFuEVSJvWaaLv8xs0RsmZ5Yd
	hNDc6rCkMBwtEvwv3PlapHOL2Tv73vk=
Received: from suse.cz (pmladek.udp.ovpn2.prg.suse.de [10.100.201.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 921102C141;
	Tue, 23 May 2023 16:02:38 +0000 (UTC)
Date: Tue, 23 May 2023 18:02:35 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 10/18] watchdog/hardlockup: Add a "cpu" param to
 watchdog_hardlockup_check()
Message-ID: <ZGzjm9h85fpYZJMc@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.10.I3a7d4dd8c23ac30ee0b607d77feb6646b64825c0@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, ito-yuichi@fujitsu.com, Lecopzer Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane Eranian <eranian@google.com>, sparclinux@vger.kernel.org, Guenter Roeck <groeck@chromium.org>, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Marc Zyngier <maz@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, npiggin@gmail.com, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, linuxppc-dev@lists.ozl
 abs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri 2023-05-19 10:18:34, Douglas Anderson wrote:
> In preparation for the buddy hardlockup detector where the CPU
> checking for lockup might not be the currently running CPU, add a
> "cpu" parameter to watchdog_hardlockup_check().
> 
> As part of this change, make hrtimer_interrupts an atomic_t since now
> the CPU incrementing the value and the CPU reading the value might be
> different. Technially this could also be done with just READ_ONCE and
> WRITE_ONCE, but atomic_t feels a little cleaner in this case.
> 
> While hrtimer_interrupts is made atomic_t, we change
> hrtimer_interrupts_saved from "unsigned long" to "int". The "int" is
> needed to match the data type backing atomic_t for hrtimer_interrupts.
> Even if this changes us from 64-bits to 32-bits (which I don't think
> is true for most compilers), it doesn't really matter. All we ever do
> is increment it every few seconds and compare it to an old value so
> 32-bits is fine (even 16-bits would be). The "signed" vs "unsigned"
> also doesn't matter for simple equality comparisons.
> 
> hrtimer_interrupts_saved is _not_ switched to atomic_t nor even
> accessed with READ_ONCE / WRITE_ONCE. The hrtimer_interrupts_saved is
> always consistently accessed with the same CPU. NOTE: with the
> upcoming "buddy" detector there is one special case. When a CPU goes
> offline/online then we can change which CPU is the one to consistently
> access a given instance of hrtimer_interrupts_saved. We still can't
> end up with a partially updated hrtimer_interrupts_saved, however,
> because we end up petting all affected CPUs to make sure the new and
> old CPU can't end up somehow read/write hrtimer_interrupts_saved at
> the same time.
> 
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -87,29 +87,34 @@ __setup("nmi_watchdog=", hardlockup_panic_setup);
>  
>  #if defined(CONFIG_HARDLOCKUP_DETECTOR_PERF)
>  
> -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
> -static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
> +static DEFINE_PER_CPU(atomic_t, hrtimer_interrupts);
> +static DEFINE_PER_CPU(int, hrtimer_interrupts_saved);
>  static DEFINE_PER_CPU(bool, watchdog_hardlockup_warned);
>  static unsigned long watchdog_hardlockup_all_cpu_dumped;
>  
> -static bool is_hardlockup(void)
> +static bool is_hardlockup(unsigned int cpu)
>  {
> -	unsigned long hrint = __this_cpu_read(hrtimer_interrupts);
> +	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
>  
> -	if (__this_cpu_read(hrtimer_interrupts_saved) == hrint)
> +	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)
>  		return true;
>  
> -	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +	/*
> +	 * NOTE: we don't need any fancy atomic_t or READ_ONCE/WRITE_ONCE
> +	 * for hrtimer_interrupts_saved. hrtimer_interrupts_saved is
> +	 * written/read by a single CPU.
> +	 */
> +	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
>  
>  	return false;
>  }
>  
>  static void watchdog_hardlockup_kick(void)
>  {
> -	__this_cpu_inc(hrtimer_interrupts);
> +	atomic_inc(raw_cpu_ptr(&hrtimer_interrupts));

Is there any particular reason why raw_*() is needed, please?

My expectation is that the raw_ API should be used only when
there is a good reason for it. Where a good reason might be
when the checks might fail but the consistency is guaranteed
another way.

IMHO, we should use:

	atomic_inc(this_cpu_ptr(&hrtimer_interrupts));

To be honest, I am a bit lost in the per_cpu API definitions.

But this_cpu_ptr() seems to be implemented the same way as
per_cpu_ptr() when CONFIG_DEBUG_PREEMPT is enabled.
And we use per_cpu_ptr() in is_hardlockup().

Also this_cpu_ptr() is used more commonly:

$> git grep this_cpu_ptr | wc -l
1385
$> git grep raw_cpu_ptr | wc -l
114

>  }
>  
> -void watchdog_hardlockup_check(struct pt_regs *regs)
> +void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  {
>  	/*
>  	 * Check for a hardlockup by making sure the CPU's timer
> @@ -117,35 +122,42 @@ void watchdog_hardlockup_check(struct pt_regs *regs)
>  	 * fired multiple times before we overflow'd. If it hasn't
>  	 * then this is a good indication the cpu is stuck
>  	 */
> -	if (is_hardlockup()) {
> +	if (is_hardlockup(cpu)) {
>  		unsigned int this_cpu = smp_processor_id();
> +		struct cpumask backtrace_mask = *cpu_online_mask;

Does this work, please?

IMHO, we should use cpumask_copy().

>  
>  		/* Only print hardlockups once. */
> -		if (__this_cpu_read(watchdog_hardlockup_warned))
> +		if (per_cpu(watchdog_hardlockup_warned, cpu))
>  			return;
>  

Otherwise, it looks good to me.

Best Regards,
Petr
