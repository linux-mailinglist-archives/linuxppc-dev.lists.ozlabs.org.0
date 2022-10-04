Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1A25F4ACC
	for <lists+linuxppc-dev@lfdr.de>; Tue,  4 Oct 2022 23:16:39 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhr9c4Pssz3dy1
	for <lists+linuxppc-dev@lfdr.de>; Wed,  5 Oct 2022 08:16:36 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
X-Greylist: delayed 554 seconds by postgrey-1.36 at boromir; Wed, 05 Oct 2022 04:29:45 AEDT
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mhl7s3LfXz2xGk
	for <linuxppc-dev@lists.ozlabs.org>; Wed,  5 Oct 2022 04:29:44 +1100 (AEDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B6F111FB;
	Tue,  4 Oct 2022 10:20:00 -0700 (PDT)
Received: from FVFF77S0Q05N.cambridge.arm.com (FVFF77S0Q05N.cambridge.arm.com [10.1.38.139])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2E7683F792;
	Tue,  4 Oct 2022 10:19:38 -0700 (PDT)
Date: Tue, 4 Oct 2022 18:19:33 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH v2 33/44] ftrace: WARN on rcuidle
Message-ID: <YzxrJYjKxy/vUc5n@FVFF77S0Q05N.cambridge.arm.com>
References: <20220919095939.761690562@infradead.org>
 <20220919101522.573936213@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220919101522.573936213@infradead.org>
X-Mailman-Approved-At: Wed, 05 Oct 2022 08:14:24 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualization@lists.linu
 x-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, lpieralisi@kernel.org, atishp@atishpatra.org, linux@rasmusvillemoes.dk, kasan-dev@googlegroups.com, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de
 , jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, linux-clk@vger.kernel.org, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, ryabinin.a.a@gmail.com, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@lin
 ux.intel.com, jpoimboe@kernel.org, dvyukov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Sep 19, 2022 at 12:00:12PM +0200, Peter Zijlstra wrote:
> CONFIG_GENERIC_ENTRY disallows any and all tracing when RCU isn't
> enabled.
> 
> XXX if s390 (the only other GENERIC_ENTRY user as of this writing)
> isn't comfortable with this, we could switch to
> HAVE_NOINSTR_VALIDATION which is x86_64 only atm.
> 
> Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> ---
>  include/linux/tracepoint.h |   13 ++++++++++++-
>  kernel/trace/trace.c       |    3 +++
>  2 files changed, 15 insertions(+), 1 deletion(-)
> 
> --- a/include/linux/tracepoint.h
> +++ b/include/linux/tracepoint.h
> @@ -178,6 +178,16 @@ static inline struct tracepoint *tracepo
>  #endif /* CONFIG_HAVE_STATIC_CALL */
>  
>  /*
> + * CONFIG_GENERIC_ENTRY archs are expected to have sanitized entry and idle
> + * code that disallow any/all tracing/instrumentation when RCU isn't watching.
> + */
> +#ifdef CONFIG_GENERIC_ENTRY
> +#define RCUIDLE_COND(rcuidle)	(rcuidle)
> +#else
> +#define RCUIDLE_COND(rcuidle)	(rcuidle && in_nmi())
> +#endif

Could we make this depend on ARCH_WANTS_NO_INSTR instead?

That'll allow arm64 to check this even though we're not using the generic entry
code (and there's lots of work necessary to make that possible...).

Thanks,
Mark.

> +
> +/*
>   * it_func[0] is never NULL because there is at least one element in the array
>   * when the array itself is non NULL.
>   */
> @@ -189,7 +199,8 @@ static inline struct tracepoint *tracepo
>  			return;						\
>  									\
>  		/* srcu can't be used from NMI */			\
> -		WARN_ON_ONCE(rcuidle && in_nmi());			\
> +		if (WARN_ON_ONCE(RCUIDLE_COND(rcuidle)))		\
> +			return;						\
>  									\
>  		/* keep srcu and sched-rcu usage consistent */		\
>  		preempt_disable_notrace();				\
> --- a/kernel/trace/trace.c
> +++ b/kernel/trace/trace.c
> @@ -3104,6 +3104,9 @@ void __trace_stack(struct trace_array *t
>  		return;
>  	}
>  
> +	if (WARN_ON_ONCE(IS_ENABLED(CONFIG_GENERIC_ENTRY)))
> +		return;
> +
>  	/*
>  	 * When an NMI triggers, RCU is enabled via ct_nmi_enter(),
>  	 * but if the above rcu_is_watching() failed, then the NMI
> 
> 
