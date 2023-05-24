Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E9C70F82A
	for <lists+linuxppc-dev@lfdr.de>; Wed, 24 May 2023 16:00:11 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QRCVx3N1lz3fC4
	for <lists+linuxppc-dev@lfdr.de>; Thu, 25 May 2023 00:00:09 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RHX2g085;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=suse.com (client-ip=2001:67c:2178:6::1c; helo=smtp-out1.suse.de; envelope-from=pmladek@suse.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (1024-bit key; unprotected) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=susede1 header.b=RHX2g085;
	dkim-atps=neutral
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QRCV42BYcz3c9V
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 24 May 2023 23:59:22 +1000 (AEST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out1.suse.de (Postfix) with ESMTP id BDD9021D3D;
	Wed, 24 May 2023 13:59:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1684936756; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dBvtScxG64js1V2WtJGSat2wyTIF8r92U3UegFL2rYQ=;
	b=RHX2g085w5u88X+4Z6mGRE58L0b4uuVjnoB5ile5yyEku/n0vK3Ga3gzxfL7+dqOWR8qzS
	Enh+hAYTwRSzigqBWe8ELlR+JBHmK0H4bMUVMJEQc98zMr5VIBl3JapUXhy5gy6G8xv9gW
	1Vyj+Mx19rJDf489l0WBgZnOiWR+PkQ=
Received: from suse.cz (dhcp129.suse.cz [10.100.51.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by relay2.suse.de (Postfix) with ESMTPS id 944262C141;
	Wed, 24 May 2023 13:59:15 +0000 (UTC)
Date: Wed, 24 May 2023 15:59:15 +0200
From: Petr Mladek <pmladek@suse.com>
To: Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v5 13/18] watchdog/hardlockup: Have the perf hardlockup
 use __weak functions more cleanly
Message-ID: <ZG4YMyifGLOBJxLo@alley>
References: <20230519101840.v5.18.Ia44852044cdcb074f387e80df6b45e892965d4a1@changeid>
 <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230519101840.v5.13.I847d9ec852449350997ba00401d2462a9cb4302b@changeid>
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

On Fri 2023-05-19 10:18:37, Douglas Anderson wrote:
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
> @@ -187,27 +187,33 @@ static inline void watchdog_hardlockup_kick(void) { }
>  #endif /* !CONFIG_HARDLOCKUP_DETECTOR_PERF */
>  
>  /*
> - * These functions can be overridden if an architecture implements its
> - * own hardlockup detector.
> + * These functions can be overridden based on the configured hardlockdup detector.
>   *
>   * watchdog_hardlockup_enable/disable can be implemented to start and stop when
> - * softlockup watchdog start and stop. The arch must select the
> + * softlockup watchdog start and stop. The detector must select the
>   * SOFTLOCKUP_DETECTOR Kconfig.
>   */
> -void __weak watchdog_hardlockup_enable(unsigned int cpu)
> -{
> -	hardlockup_detector_perf_enable();
> -}
> +void __weak watchdog_hardlockup_enable(unsigned int cpu) { }
>  
> -void __weak watchdog_hardlockup_disable(unsigned int cpu)
> -{
> -	hardlockup_detector_perf_disable();
> -}
> +void __weak watchdog_hardlockup_disable(unsigned int cpu) { }
>  
>  /* Return 0, if a hardlockup watchdog is available. Error code otherwise */
>  int __weak __init watchdog_hardlockup_probe(void)
>  {
> -	return hardlockup_detector_perf_init();
> +	/*
> +	 * If CONFIG_HAVE_NMI_WATCHDOG is defined then an architecture
> +	 * is assumed to have the hard watchdog available and we return 0.
> +	 */
> +	if (IS_ENABLED(CONFIG_HAVE_NMI_WATCHDOG))
> +		return 0;
> +
> +	/*
> +	 * Hardlockup detectors other than those using CONFIG_HAVE_NMI_WATCHDOG
> +	 * are required to implement a non-weak version of this probe function
> +	 * to tell whether they are available. If they don't override then
> +	 * we'll return -ENODEV.
> +	 */
> +	return -ENODEV;
>  }

When thinking more about it. It is weird that we need to handle
CONFIG_HAVE_NMI_WATCHDOG in this default week function.

It should be handled in watchdog_hardlockup_probe() implemented
in kernel/watchdog_perf.c.

IMHO, the default __weak function could always return -ENODEV;

Would it make sense, please?

Best Regards,
Petr
