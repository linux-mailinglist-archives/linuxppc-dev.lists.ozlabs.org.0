Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C37066D56E
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 05:44:11 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NwxB10Jgfz3cBk
	for <lists+linuxppc-dev@lfdr.de>; Tue, 17 Jan 2023 15:44:09 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rvDfVQk7;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=145.40.68.75; helo=ams.source.kernel.org; envelope-from=mhiramat@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=rvDfVQk7;
	dkim-atps=neutral
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NwwmD6XB6z3bWT
	for <linuxppc-dev@lists.ozlabs.org>; Tue, 17 Jan 2023 15:25:16 +1100 (AEDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4844EB81060;
	Tue, 17 Jan 2023 04:25:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0701C433EF;
	Tue, 17 Jan 2023 04:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673929510;
	bh=LKPfAbcdavLMCpifQk05Aqw+1tD2xg5qsuB6VorVVnI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=rvDfVQk7Tsas4+LZFK04iCV/SqfYXmqYXLFi42JOngYW1dOP0QSo6CLiBkpjYosKx
	 nKUcD4fx6Lu1RT5hJ5yblHd47Jqpvv59kmEAKtriWUWkTZ7hmC4Za3q3BgpEtr891G
	 Uhe5azCk4FahsTTDCEc3lE2+MzsUQWKU5CAcTO6IYBsGKCz8NivYw+lk7qeBhykDxt
	 x23XNA0A5LxituWhIHyg6sCe7NTSUKsY2ON6C3g6I/nFT8i/VEH7jmIvKLWoo8AYZN
	 JlOlRfIFLAGKs5+FVWy9q/WwqqbuzK/Mvbqfsgyxm4gYqDdXx2B1Vx+ckQBMj8vEfk
	 ICBnmkeUNpdwg==
Date: Tue, 17 Jan 2023 13:24:46 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v3 35/51] trace,hardirq: No moar _rcuidle() tracing
Message-Id: <20230117132446.02ec12e4c10718de27790900@kernel.org>
In-Reply-To: <20230112195541.477416709@infradead.org>
References: <20230112194314.845371875@infradead.org>
	<20230112195541.477416709@infradead.org>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 17 Jan 2023 15:43:23 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, nsekhar@ti.com, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, linux-samsung-soc@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-trace-kernel@vger.kernel.
 org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, alim.akhtar@samsung.com, dave.hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, will@kernel.org, brgl@bgdev.pl, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, festevam@gmail.com, boris.ostrovsky
 @oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, konrad.dybcio@linaro.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, linux-mm@kvack.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, mhiramat@kernel.org, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristians
 son@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, andersson@kernel.org, linux-mips@vger.kernel.org, krzysztof.kozlowski@linaro.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org, deller@gmx.de
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi Peter,

On Thu, 12 Jan 2023 20:43:49 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> Robot reported that trace_hardirqs_{on,off}() tickle the forbidden
> _rcuidle() tracepoint through local_irq_{en,dis}able().
> 
> For 'sane' configs, these calls will only happen with RCU enabled and
> as such can use the regular tracepoint. This also means it's possible
> to trace them from NMI context again.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>

The code looks good to me. I just have a question about comment.

> ---
>  kernel/trace/trace_preemptirq.c |   21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> --- a/kernel/trace/trace_preemptirq.c
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -20,6 +20,15 @@
>  static DEFINE_PER_CPU(int, tracing_irq_cpu);
>  
>  /*
> + * ...

Is this intended? Wouldn't you leave any comment here?

Thank you,

> + */
> +#ifdef CONFIG_ARCH_WANTS_NO_INSTR
> +#define trace(point)	trace_##point
> +#else
> +#define trace(point)	if (!in_nmi()) trace_##point##_rcuidle
> +#endif
> +
> +/*
>   * Like trace_hardirqs_on() but without the lockdep invocation. This is
>   * used in the low level entry code where the ordering vs. RCU is important
>   * and lockdep uses a staged approach which splits the lockdep hardirq
> @@ -28,8 +37,7 @@ static DEFINE_PER_CPU(int, tracing_irq_c
>  void trace_hardirqs_on_prepare(void)
>  {
>  	if (this_cpu_read(tracing_irq_cpu)) {
> -		if (!in_nmi())
> -			trace_irq_enable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable)(CALLER_ADDR0, CALLER_ADDR1);
>  		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>  		this_cpu_write(tracing_irq_cpu, 0);
>  	}
> @@ -40,8 +48,7 @@ NOKPROBE_SYMBOL(trace_hardirqs_on_prepar
>  void trace_hardirqs_on(void)
>  {
>  	if (this_cpu_read(tracing_irq_cpu)) {
> -		if (!in_nmi())
> -			trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_enable)(CALLER_ADDR0, CALLER_ADDR1);
>  		tracer_hardirqs_on(CALLER_ADDR0, CALLER_ADDR1);
>  		this_cpu_write(tracing_irq_cpu, 0);
>  	}
> @@ -63,8 +70,7 @@ void trace_hardirqs_off_finish(void)
>  	if (!this_cpu_read(tracing_irq_cpu)) {
>  		this_cpu_write(tracing_irq_cpu, 1);
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		if (!in_nmi())
> -			trace_irq_disable(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable)(CALLER_ADDR0, CALLER_ADDR1);
>  	}
>  
>  }
> @@ -78,8 +84,7 @@ void trace_hardirqs_off(void)
>  	if (!this_cpu_read(tracing_irq_cpu)) {
>  		this_cpu_write(tracing_irq_cpu, 1);
>  		tracer_hardirqs_off(CALLER_ADDR0, CALLER_ADDR1);
> -		if (!in_nmi())
> -			trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> +		trace(irq_disable)(CALLER_ADDR0, CALLER_ADDR1);
>  	}
>  }
>  EXPORT_SYMBOL(trace_hardirqs_off);
> 
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>
