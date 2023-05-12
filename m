Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F1E2870074C
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 13:56:16 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QHnKV6Nk9z3fQ2
	for <lists+linuxppc-dev@lfdr.de>; Fri, 12 May 2023 21:56:14 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lEQ0yjMI;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=195.135.220.28; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=lEQ0yjMI;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QHnJg4Q3zz3bjW
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 12 May 2023 21:55:29 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id D7F82221B0;
	Fri, 12 May 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1683892526; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xyID2nrfRFvnCmCCEoDqrRJb/SLL4bOOzyPEcVWhIcg=;
	b=lEQ0yjMIPHRMyl9VsYuE8tD7yo0iFTwLUXaORxnhA7t8728sX0q4aRdF3iN6dqy1aC3q8/
	YPm1Tcs8DZ1wYKRHJ8/JPaw9/W3ekjR2+D3gmP9Tk3pQE/UABRQW6NVwrkr0j2R28omH/o
	DCRZdesZpFrDMAZ/mT4KGYDe+egXfWo=
Received: from suse.cz (unknown [10.100.208.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 6A61A2C152;
	Fri, 12 May 2023 11:55:25 +0000 (UTC)
Date: Fri, 12 May 2023 13:55:24 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v4 12/17] watchdog/hardlockup: Have the perf hardlockup
 use __weak functions more cleanly
Message-ID: <ZF4pLJUpvec7vvXT@alley>
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.12.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504151100.v4.12.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
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

On Thu 2023-05-04 15:13:44, Douglas Anderson wrote:
> The fact that there watchdog_hardlockup_enable(),
> watchdog_hardlockup_disable(), and watchdog_hardlockup_probe() are
> declared __weak means that the configured hardlockup detector can
> define non-weak versions of those functions if it needs to. Instead of
> doing this, the perf hardlockup detector hooked itself into the
> default __weak implementation, which was a bit awkward. Clean this up.
> 
> >From comments, it looks as if the original design was done because the
> __weak function were expected to implemented by the architecture and
> not by the configured hardlockup detector. This got awkward when we
> tried to add the buddy lockup detector which was not arch-specific but
> wanted to hook into those same functions.
> 
> This is not expected to have any functional impact.
> 
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

I like this change:

Reviewed-by: Petr Mladek <pmladek@suse.com>

See a comment below.

> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -147,12 +151,16 @@ void hardlockup_detector_perf_enable(void)
>  }
>  
>  /**
> - * hardlockup_detector_perf_disable - Disable the local event
> + * watchdog_hardlockup_disable - Disable the local event
> + *
> + * @cpu: The CPU to enable hard lockup on.
>   */
> -void hardlockup_detector_perf_disable(void)
> +void watchdog_hardlockup_disable(unsigned int cpu)
>  {
>  	struct perf_event *event = this_cpu_read(watchdog_ev);
>  
> +	WARN_ON_ONCE(cpu != smp_processor_id());
> +

It makes sense. But it just shows how the code is weird.
@cpu is passed as a parameter and the code expects that it is
running on the given CPU.

It seems that @cpu is passed as a parameter because this is
called from:

  + [CPUHP_AP_WATCHDOG_ONLINE].teardown.single()
    + lockup_detector_offline_cpu()
      + watchdog_disable()

and the CPU hotplug API passes @cpu parameter.

IMHO, the clean solution would be to use per_cpu*() instead
of this_cpu*() API everywhere in this code path.

But it is yet another cleanup. It seems to be out-of-scope of
this patchset.

>  	if (event) {
>  		perf_event_disable(event);
>  		this_cpu_write(watchdog_ev, NULL);

Best Regards,
Petr
