Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B6A554D799
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 03:56:33 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNldq1J47z3dvH
	for <lists+linuxppc-dev@lfdr.de>; Thu, 16 Jun 2022 11:56:31 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=atomide.com (client-ip=72.249.23.125; helo=muru.com; envelope-from=tony@atomide.com; receiver=<UNKNOWN>)
Received: from muru.com (muru.com [72.249.23.125])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LNDYD3nMvz2yWr
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 15:35:44 +1000 (AEST)
Received: from localhost (localhost [127.0.0.1])
	by muru.com (Postfix) with ESMTPS id 6EE2B80AE;
	Wed, 15 Jun 2022 05:30:54 +0000 (UTC)
Date: Wed, 15 Jun 2022 08:35:38 +0300
From: Tony Lindgren <tony@atomide.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 34.5/36] cpuidle,omap4: Push RCU-idle into
 omap4_enter_lowpower()
Message-ID: <YqlvqhdlFsNvUBeG@atomide.com>
References: <20220608142723.103523089@infradead.org>
 <20220608144518.073801916@infradead.org>
 <Yqcv6crSNKuSWoTu@atomide.com>
 <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqkHto+zgAPs4kQI@worktop.programming.kicks-ass.net>
X-Mailman-Approved-At: Thu, 16 Jun 2022 11:54:30 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, Aaro Koskinen <aaro.koskinen@iki.fi>, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave
 .hansen@linux.intel.com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, linux-snps-arc
 @lists.infradead.org, mgorman@suse.de, jacob.jun.pan@

linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, Peter Vasil <petervasil@gmail.com>, dalias@libc.org, pv-drivers@vmware.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, 
 monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

Hi,

Adding Aaro Koskinen and Peter Vasil for pm24xx for n800 and n810 related
idle.

* Peter Zijlstra <peterz@infradead.org> [220614 22:07]:
> On Mon, Jun 13, 2022 at 03:39:05PM +0300, Tony Lindgren wrote:
> > OMAP4 uses full SoC suspend modes as idle states, as such it needs the
> > whole power-domain and clock-domain code from the idle path.
> > 
> > All that code is not suitable to run with RCU disabled, as such push
> > RCU-idle deeper still.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> > 
> > Peter here's one more for your series, looks like this is needed to avoid
> > warnings similar to what you did for omap3.
> 
> Thanks Tony!
> 
> I've had a brief look at omap2_pm_idle() and do I understand it right
> that something like the below patch would reduce it to a simple 'WFI'?

Yes that should do for omap2_do_wfi().

> What do I do with the rest of that code, because I don't think this
> thing has a cpuidle driver to take over, effectively turning it into
> dead code.

As we are establishing a policy where deeper idle states must be
handled by cpuidle, and for most part that has been the case for at least
10 years, I'd just drop the unused functions with an explanation in the
patch why we're doing it. Or the functions could be tagged with
__maybe_unused if folks prefer that.

In the pm24xx case we are not really causing a regression for users as
there are still pending patches to make n800 and n810 truly usable with
the mainline kernel. At least the PMIC and LCD related patches need some
work [0]. The deeper idle states can be added back later using cpuidle
as needed so we have a clear path.

Aaro & Peter V, do you have any better suggestions here as this will
mostly affect you guys currently?

Regards,

Tony

[0] https://lore.kernel.org/linux-omap/20211224214512.1583430-1-peter.vasil@gmail.com/


> --- a/arch/arm/mach-omap2/pm24xx.c
> +++ b/arch/arm/mach-omap2/pm24xx.c
> @@ -126,10 +126,20 @@ static int omap2_allow_mpu_retention(voi
>  	return 1;
>  }
>  
> -static void omap2_enter_mpu_retention(void)
> +static void omap2_do_wfi(void)
>  {
>  	const int zero = 0;
>  
> +	/* WFI */
> +	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
> +}
> +
> +#if 0
> +/*
> + * possible cpuidle implementation between WFI and full_retention above
> + */
> +static void omap2_enter_mpu_retention(void)
> +{
>  	/* The peripherals seem not to be able to wake up the MPU when
>  	 * it is in retention mode. */
>  	if (omap2_allow_mpu_retention()) {
> @@ -146,8 +157,7 @@ static void omap2_enter_mpu_retention(vo
>  		pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
>  	}
>  
> -	/* WFI */
> -	asm("mcr p15, 0, %0, c7, c0, 4" : : "r" (zero) : "memory", "cc");
> +	omap2_do_wfi();
>  
>  	pwrdm_set_next_pwrst(mpu_pwrdm, PWRDM_POWER_ON);
>  }
> @@ -161,6 +171,7 @@ static int omap2_can_sleep(void)
>  
>  	return 1;
>  }
> +#endif
>  
>  static void omap2_pm_idle(void)
>  {
> @@ -169,6 +180,7 @@ static void omap2_pm_idle(void)
>  	if (omap_irq_pending())
>  		return;
>  
> +#if 0
>  	error = cpu_cluster_pm_enter();
>  	if (error || !omap2_can_sleep()) {
>  		omap2_enter_mpu_retention();
> @@ -179,6 +191,9 @@ static void omap2_pm_idle(void)
>  
>  out_cpu_cluster_pm:
>  	cpu_cluster_pm_exit();
> +#else
> +	omap2_do_wfi();
> +#endif
>  }
>  
>  static void __init prcm_setup_regs(void)
