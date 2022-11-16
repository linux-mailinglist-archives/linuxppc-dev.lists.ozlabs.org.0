Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B2C662D761
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 10:46:39 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4NCZn90QJqz3f8D
	for <lists+linuxppc-dev@lfdr.de>; Thu, 17 Nov 2022 20:46:37 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ojmz8ZQZ;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4NC6Rq3zqgz3c71
	for <linuxppc-dev@lists.ozlabs.org>; Thu, 17 Nov 2022 02:29:54 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=4XDB6ZbR3Awa7mOslon9xFqMWj0psrdiARhozQeRyJA=; b=ojmz8ZQZRjWLwoZ+ZS6FE8f3wJ
	CK/Bfmqct5VYOUjRLjwRUWfkj35XZefJ6rca1+nPPtygcRUJXw3oJxKETAjWhIaiftafRsk0CMEh/
	J5wMjH2Yp5CEFUqc/1mDEFzmv3Mdc0yTnj+SwdQ0sRpQuWbK4I02ssc+mSnaitRZ9Z5Pb/uIPVtsU
	st8GbHUXc6nOUdEUbfkWcYSrzPEq8tBNp8Q5TCrMo7R2Ryh6BF7TlrqxiIkBjw+Pw8cZuNB/6D6gn
	mTk80fyh/EA5plmymKut6SRYIZtv3PlZQv81WS10aMHXoX+xNjxLwlZaIoKttXuf1J3/ppa8RmuTu
	XBGgqr+w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovKLd-001NF8-IY; Wed, 16 Nov 2022 15:29:09 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CE5513006A4;
	Wed, 16 Nov 2022 16:29:05 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A500120832696; Wed, 16 Nov 2022 16:29:05 +0100 (CET)
Date: Wed, 16 Nov 2022 16:29:05 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH v2 12/44] cpuidle,dt: Push RCU-idle into driver
Message-ID: <Y3UBwYNY15ETUKy9@hirez.programming.kicks-ass.net>
References: <20220919095939.761690562@infradead.org>
 <20220919101521.139727471@infradead.org>
 <CAPDyKFqTWd4W5Ofk76CtC4X43dxBTNHtmY9YzN355-vpviLsPw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPDyKFqTWd4W5Ofk76CtC4X43dxBTNHtmY9YzN355-vpviLsPw@mail.gmail.com>
X-Mailman-Approved-At: Thu, 17 Nov 2022 20:44:04 +1100
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, catalin.marinas@arm.com, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, linux-clk@vger.kernel.org, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, linux-sh@vger.kernel.org, kasan-dev@googlegroups.com, linux-acpi@vger.kernel.org, mingo@redhat.com, geert@linux-m68k.org, linux-imx@nxp.com, vgupta@kernel.org, mattst88@gmail.com, lpieralisi@kernel.org, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, npiggin@gmail.com, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, andreyknvl@gmail.com, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, kernel@pengutronix.de, tj@kernel.org, Andrew Morton <akpm@linux-foundation.org>, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel
 .com, virtualization@lists.linux-foundation.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, cl@linux.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, dennis@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, jolsa@kernel.org, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, sudeep.holla@arm.com, linux-m68k@lists.linux-m68k.org, loongarch@lists.linux.dev, shorne@gmail.com, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, chenhuacai@kernel.org, alexander.shishkin@linux.intel.com, fweisbec@gmail.com, mturquette@baylibre.com, paul.walmsley@sifive.com, linux@rasmusvillemoes.dk, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.
 pan@linux.intel.com, Arnd Bergmann <arnd@arndb.de>, ulli.kroll@googlemail.com, rostedt@goodmis.org, ink@jurassic.park.msu.ru, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, anup@brainfault.org, ryabinin.a.a@gmail.com, linux-alpha@vger.kernel.org, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, pv-drivers@vmware.com, hpa@zytor.com, konrad.dybcio@somainline.org, bjorn.andersson@linaro.org, glider@google.com, amakhalov@vmware.com, sparclinux@vger.kernel.org, linux-riscv@lists.infradead.org, vincenzo.frascino@arm.com, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, agross@kernel.org, aou@eecs.berkeley.edu, hca@linux.ibm.com, richard.henderson@linaro.org, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, acme@kernel.org, atishp@atishpatra.org, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, dvyu
 kov@google.com, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, linux-hexagon@vger.kernel.org, bp@alien8.de, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>


Sorry; things keep getting in the way of finishing this :/

As such, I need a bit of time to get on-track again..

On Tue, Oct 04, 2022 at 01:03:57PM +0200, Ulf Hansson wrote:

> > --- a/drivers/acpi/processor_idle.c
> > +++ b/drivers/acpi/processor_idle.c
> > @@ -1200,6 +1200,8 @@ static int acpi_processor_setup_lpi_stat
> >                 state->target_residency = lpi->min_residency;
> >                 if (lpi->arch_flags)
> >                         state->flags |= CPUIDLE_FLAG_TIMER_STOP;
> > +               if (lpi->entry_method == ACPI_CSTATE_FFH)
> > +                       state->flags |= CPUIDLE_FLAG_RCU_IDLE;
> 
> I assume the state index here will never be 0?
> 
> If not, it may lead to that acpi_processor_ffh_lpi_enter() may trigger
> CPU_PM_CPU_IDLE_ENTER_PARAM() to call ct_cpuidle_enter|exit() for an
> idle-state that doesn't have the CPUIDLE_FLAG_RCU_IDLE bit set.

I'm not quite sure I see how. AFAICT this condition above implies
acpi_processor_ffh_lpi_enter() gets called, no?

Which in turn is an unconditional __CPU_PM_CPU_IDLE_ENTER() user, so
even if idx==0, it ends up in ct_idle_{enter,exit}().

> 
> >                 state->enter = acpi_idle_lpi_enter;
> >                 drv->safe_state_index = i;
> >         }
> > --- a/drivers/cpuidle/cpuidle-arm.c
> > +++ b/drivers/cpuidle/cpuidle-arm.c
> > @@ -53,6 +53,7 @@ static struct cpuidle_driver arm_idle_dr
> >          * handler for idle state index 0.
> >          */
> >         .states[0] = {
> > +               .flags                  = CPUIDLE_FLAG_RCU_IDLE,
> 
> Comparing arm64 and arm32 idle-states/idle-drivers, the $subject
> series ends up setting the CPUIDLE_FLAG_RCU_IDLE for the ARM WFI idle
> state (state zero), but only for the arm64 and psci cases (mostly
> arm64). For arm32 we would need to update the ARM_CPUIDLE_WFI_STATE
> too, as that is what most arm32 idle-drivers are using. My point is,
> the code becomes a bit inconsistent.

True.

> Perhaps it's easier to avoid setting the CPUIDLE_FLAG_RCU_IDLE bit for
> all of the ARM WFI idle states, for both arm64 and arm32?

As per the below?

> 
> >                 .enter                  = arm_enter_idle_state,
> >                 .exit_latency           = 1,
> >                 .target_residency       = 1,

> > --- a/include/linux/cpuidle.h
> > +++ b/include/linux/cpuidle.h
> > @@ -282,14 +282,18 @@ extern s64 cpuidle_governor_latency_req(
> >         int __ret = 0;                                                  \
> >                                                                         \
> >         if (!idx) {                                                     \
> > +               ct_idle_enter();                                        \
> 
> According to my comment above, we should then drop these calls to
> ct_idle_enter and ct_idle_exit() here. Right?

Yes, if we ensure idx==0 never has RCU_IDLE set then these must be
removed.

> >                 cpu_do_idle();                                          \
> > +               ct_idle_exit();                                         \
> >                 return idx;                                             \
> >         }                                                               \
> >                                                                         \
> >         if (!is_retention)                                              \
> >                 __ret =  cpu_pm_enter();                                \
> >         if (!__ret) {                                                   \
> > +               ct_idle_enter();                                        \
> >                 __ret = low_level_idle_enter(state);                    \
> > +               ct_idle_exit();                                         \
> >                 if (!is_retention)                                      \
> >                         cpu_pm_exit();                                  \
> >         }                                                               \
> >

So the basic premise is that everything that needs RCU inside the idle
callback must set CPUIDLE_FLAG_RCU_IDLE and by doing that promise to
call ct_idle_{enter,exit}() themselves.

Setting RCU_IDLE is required when there is RCU usage, however even if
there is no RCU usage, setting RCU_IDLE is fine, as long as
ct_idle_{enter,exit}() then get called.


So does the below (delta) look better to you?

--- a/drivers/acpi/processor_idle.c
+++ b/drivers/acpi/processor_idle.c
@@ -1218,7 +1218,7 @@ static int acpi_processor_setup_lpi_stat
 		state->target_residency = lpi->min_residency;
 		if (lpi->arch_flags)
 			state->flags |= CPUIDLE_FLAG_TIMER_STOP;
-		if (lpi->entry_method == ACPI_CSTATE_FFH)
+		if (i != 0 && lpi->entry_method == ACPI_CSTATE_FFH)
 			state->flags |= CPUIDLE_FLAG_RCU_IDLE;
 		state->enter = acpi_idle_lpi_enter;
 		drv->safe_state_index = i;
--- a/drivers/cpuidle/cpuidle-arm.c
+++ b/drivers/cpuidle/cpuidle-arm.c
@@ -53,7 +53,7 @@ static struct cpuidle_driver arm_idle_dr
 	 * handler for idle state index 0.
 	 */
 	.states[0] = {
-		.flags			= CPUIDLE_FLAG_RCU_IDLE,
+		.flags			= 0,
 		.enter                  = arm_enter_idle_state,
 		.exit_latency           = 1,
 		.target_residency       = 1,
--- a/drivers/cpuidle/cpuidle-psci.c
+++ b/drivers/cpuidle/cpuidle-psci.c
@@ -357,7 +357,7 @@ static int psci_idle_init_cpu(struct dev
 	 * PSCI idle states relies on architectural WFI to be represented as
 	 * state index 0.
 	 */
-	drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
+	drv->states[0].flags = 0;
 	drv->states[0].enter = psci_enter_idle_state;
 	drv->states[0].exit_latency = 1;
 	drv->states[0].target_residency = 1;
--- a/drivers/cpuidle/cpuidle-qcom-spm.c
+++ b/drivers/cpuidle/cpuidle-qcom-spm.c
@@ -72,7 +72,7 @@ static struct cpuidle_driver qcom_spm_id
 	.owner = THIS_MODULE,
 	.states[0] = {
 		.enter			= spm_enter_idle_state,
-		.flags			= CPUIDLE_FLAG_RCU_IDLE,
+		.flags			= 0,
 		.exit_latency		= 1,
 		.target_residency	= 1,
 		.power_usage		= UINT_MAX,
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -337,7 +337,7 @@ static int sbi_cpuidle_init_cpu(struct d
 	drv->cpumask = (struct cpumask *)cpumask_of(cpu);
 
 	/* RISC-V architectural WFI to be represented as state index 0. */
-	drv->states[0].flags = CPUIDLE_FLAG_RCU_IDLE;
+	drv->states[0].flags = 0;
 	drv->states[0].enter = sbi_cpuidle_enter_state;
 	drv->states[0].exit_latency = 1;
 	drv->states[0].target_residency = 1;
--- a/include/linux/cpuidle.h
+++ b/include/linux/cpuidle.h
@@ -282,9 +282,7 @@ extern s64 cpuidle_governor_latency_req(
 	int __ret = 0;							\
 									\
 	if (!idx) {							\
-		ct_idle_enter();					\
 		cpu_do_idle();						\
-		ct_idle_exit();						\
 		return idx;						\
 	}								\
 									\
