Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E1646F7B50
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 05:02:47 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4QCFq874Wfz3fHR
	for <lists+linuxppc-dev@lfdr.de>; Fri,  5 May 2023 13:02:44 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=l8NOWx+J;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=gmail.com (client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com; envelope-from=npiggin@gmail.com; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20221208 header.b=l8NOWx+J;
	dkim-atps=neutral
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4QCFpJ1dtvz3bZv
	for <linuxppc-dev@lists.ozlabs.org>; Fri,  5 May 2023 13:02:00 +1000 (AEST)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1aaef97652fso8594345ad.0
        for <linuxppc-dev@lists.ozlabs.org>; Thu, 04 May 2023 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683255717; x=1685847717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=;
        b=l8NOWx+JbMx094FOTHTTAYeieKLG6l+RoxKooetFCoRg01JgRpRgmVK4EEnqQGp5Rv
         Wo7jd5ZE+BhoTQ83yfVxkRWDV8+8fYgzKrUQG+mG2SKoUwQzV4PiqCThKZNktLEkx80D
         dbZRbHCpWflzRiQ+5dUIKlwArRroFaTk4Ds/n3538KW17NDJa0a+h/l5niHUznruDebe
         bM/9WMTgDrGpzcJNg2dEdXkiWqJTXpKVuu+xjnqek1SKKSYnqTk3zeH62sRwe7eJhyjM
         UEdL7abKjXNavxqB2b/VypuWuDH+efkVGB6cwaNtCumipgGM0sxe7eY6ZqTznd4UjVkh
         DJMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683255717; x=1685847717;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=4PZDk7grPMVm0G4plF1AOyfal6UfKUjeqMY34ZW+ZAQ=;
        b=Ta5E5rz626gvsy8+Z1SvyNPBIq2IPkD7gh0OPXDCF46qx+k4t5iNrsNJdkKkHLuJMM
         yR/StnFfGOb7x5dVeLKL87EpB6ckXTuLI4MLbxeaTZhMtMUvLeSeBKREaASvHdlLbzM/
         q9v4ZzQpBCsVfW11QYn66m/a1OHRJiL6t1Ft8tOc5oCwfANbtL2ExzfqemobKjnq21CZ
         jAjB1bU0DREIN6NI6gH6upKRHzj7+razcjXVSZufbUmgONZaGeAXxW4c7jLohH1vMNDP
         NRrADUCpf6fD5Se0xAqZY86UC3e1m3p/dmKgLOhYoP7/OrjPDDcmPCZcz13zpGzfL8s0
         GwUw==
X-Gm-Message-State: AC+VfDxKjj5vLXSAkr07s4n6hAP71d3CyJXwi0MlS7N5L9jqJQBCz2Xf
	9SkztL8dU3cp5Y+PdMc3Z9c=
X-Google-Smtp-Source: ACHHUZ5Ox+yCPXhRH+Zo/Bf0YWlPnoiHwxarQldt5h1nNQM5kPEVVWcuprv1MbKY8J2RKwbHQwgMKQ==
X-Received: by 2002:a17:903:187:b0:1a2:8c7e:f301 with SMTP id z7-20020a170903018700b001a28c7ef301mr6214939plg.45.1683255717124;
        Thu, 04 May 2023 20:01:57 -0700 (PDT)
Received: from localhost ([203.59.190.92])
        by smtp.gmail.com with ESMTPSA id jj22-20020a170903049600b0019fea4d61c9sm354034plb.198.2023.05.04.20.01.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 20:01:56 -0700 (PDT)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 05 May 2023 13:01:41 +1000
Message-Id: <CSE0CI3TFK72.2I4E5TJIRHDGM@wheely>
Subject: Re: [PATCH v4 08/17] watchdog/hardlockup: Style changes to
 watchdog_hardlockup_check() / ..._is_lockedup()
From: "Nicholas Piggin" <npiggin@gmail.com>
To: "Douglas Anderson" <dianders@chromium.org>, "Petr Mladek"
 <pmladek@suse.com>, "Andrew Morton" <akpm@linux-foundation.org>
X-Mailer: aerc 0.14.0
References: <20230504221349.1535669-1-dianders@chromium.org>
 <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
In-Reply-To: <20230504151100.v4.8.I818492c326b632560b09f20d2608455ecf9d3650@changeid>
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
Cc: Mark Rutland <mark.rutland@arm.com>, Ian Rogers <irogers@google.com>, Randy Dunlap <rdunlap@infradead.org>, Lecopzer
 Chen <lecopzer.chen@mediatek.com>, kgdb-bugreport@lists.sourceforge.net, ricardo.neri@intel.com, Stephane
 Eranian <eranian@google.com>, Guenter Roeck <groeck@chromium.org>, sparclinux@vger.kernel.org, Will Deacon <will@kernel.org>, Daniel Thompson <daniel.thompson@linaro.org>, Andi Kleen <ak@linux.intel.com>, Chen-Yu
 Tsai <wens@csie.org>, Matthias Kaehlcke <mka@chromium.org>, Catalin
 Marinas <catalin.marinas@arm.com>, Masayoshi Mizuma <msys.mizuma@gmail.com>, ravi.v.shankar@intel.com, Tzung-Bi Shih <tzungbi@chromium.org>, Stephen Boyd <swboyd@chromium.org>, Pingfan Liu <kernelfans@gmail.com>, linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, ito-yuichi@fujitsu.com, linux-perf-users@vger.kernel.org, Marc Zyngier <maz@kernel.org>, linuxppc-dev@lists.ozlabs.org, davem@davemloft.net
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri May 5, 2023 at 8:13 AM AEST, Douglas Anderson wrote:
> These are tiny style changes:
> - Add a blank line before a "return".
> - Renames two globals to use the "watchdog_hld" prefix.

Particularly static ones don't really need the namespace prefixes.

Not sure if processed is better than warn. allcpu_dumped is better
than dumped_stacks though because the all-CPUs-dump is a particular
thing.

Other style bits seem fine.

Thanks,
Nick

> - Store processor id in "unsigned int" rather than "int".
> - Minor comment rewording.
> - Use "else" rather than extra returns since it seemed more symmetric.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
> Changes in v4:
> - ("Style changes to watchdog_hardlockup_check ...") new for v4.
>
>  kernel/watchdog.c | 32 +++++++++++++++-----------------
>  1 file changed, 15 insertions(+), 17 deletions(-)
>
> diff --git a/kernel/watchdog.c b/kernel/watchdog.c
> index 2d319cdf64b9..f46669c1671d 100644
> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -89,8 +89,8 @@ __setup("nmi_watchdog=3D", hardlockup_panic_setup);
> =20
>  static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts);
>  static DEFINE_PER_CPU(unsigned long, hrtimer_interrupts_saved);
> -static DEFINE_PER_CPU(bool, hard_watchdog_warn);
> -static unsigned long hardlockup_allcpu_dumped;
> +static DEFINE_PER_CPU(bool, watchdog_hardlockup_processed);
> +static unsigned long watchdog_hardlockup_dumped_stacks;
> =20
>  static bool watchdog_hardlockup_is_lockedup(void)
>  {
> @@ -100,6 +100,7 @@ static bool watchdog_hardlockup_is_lockedup(void)
>  		return true;
> =20
>  	__this_cpu_write(hrtimer_interrupts_saved, hrint);
> +
>  	return false;
>  }
> =20
> @@ -110,21 +111,20 @@ static void watchdog_hardlockup_interrupt_count(voi=
d)
> =20
>  void watchdog_hardlockup_check(struct pt_regs *regs)
>  {
> -	/* check for a hardlockup
> -	 * This is done by making sure our timer interrupt
> -	 * is incrementing.  The timer interrupt should have
> -	 * fired multiple times before we overflow'd.  If it hasn't
> +	/*
> +	 * Check for a hardlockup by making sure the CPU's timer
> +	 * interrupt is incrementing. The timer interrupt should have
> +	 * fired multiple times before we overflow'd. If it hasn't
>  	 * then this is a good indication the cpu is stuck
>  	 */
>  	if (watchdog_hardlockup_is_lockedup()) {
> -		int this_cpu =3D smp_processor_id();
> +		unsigned int this_cpu =3D smp_processor_id();
> =20
> -		/* only print hardlockups once */
> -		if (__this_cpu_read(hard_watchdog_warn) =3D=3D true)
> +		/* Only handle hardlockups once. */
> +		if (__this_cpu_read(watchdog_hardlockup_processed))
>  			return;
> =20
> -		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n",
> -			 this_cpu);
> +		pr_emerg("Watchdog detected hard LOCKUP on cpu %d\n", this_cpu);
>  		print_modules();
>  		print_irqtrace_events(current);
>  		if (regs)
> @@ -137,18 +137,16 @@ void watchdog_hardlockup_check(struct pt_regs *regs=
)
>  		 * generating interleaving traces
>  		 */
>  		if (sysctl_hardlockup_all_cpu_backtrace &&
> -				!test_and_set_bit(0, &hardlockup_allcpu_dumped))
> +		    !test_and_set_bit(0, &watchdog_hardlockup_dumped_stacks))
>  			trigger_allbutself_cpu_backtrace();
> =20
>  		if (hardlockup_panic)
>  			nmi_panic(regs, "Hard LOCKUP");
> =20
> -		__this_cpu_write(hard_watchdog_warn, true);
> -		return;
> +		__this_cpu_write(watchdog_hardlockup_processed, true);
> +	} else {
> +		__this_cpu_write(watchdog_hardlockup_processed, false);
>  	}
> -
> -	__this_cpu_write(hard_watchdog_warn, false);
> -	return;
>  }
> =20
>  #else /* CONFIG_HARDLOCKUP_DETECTOR_PERF */
> --=20
> 2.40.1.521.gf1e218fcd8-goog

