Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C30354BD84
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 00:16:34 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LN2pS2y2Cz3gpC
	for <lists+linuxppc-dev@lfdr.de>; Wed, 15 Jun 2022 08:16:32 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=arm.com (client-ip=217.140.110.172; helo=foss.arm.com; envelope-from=mark.rutland@arm.com; receiver=<UNKNOWN>)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by lists.ozlabs.org (Postfix) with ESMTP id 4LMwXS1YdNz3bnP
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 15 Jun 2022 03:33:56 +1000 (AEST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3DE175A;
	Tue, 14 Jun 2022 10:33:22 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.41.154])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3C0913F66F;
	Tue, 14 Jun 2022 10:33:04 -0700 (PDT)
Date: Tue, 14 Jun 2022 18:33:00 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: [PATCH 00/36] cpuidle,rcu: Cleanup the mess
Message-ID: <YqjGTFEWSJGGOjNA@FVFF77S0Q05N>
References: <20220608142723.103523089@infradead.org>
 <YqhuwQjmZyOVSiLI@FVFF77S0Q05N>
 <Yqi+Nqz1J8wI5GcX@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Yqi+Nqz1J8wI5GcX@hirez.programming.kicks-ass.net>
X-Mailman-Approved-At: Wed, 15 Jun 2022 08:01:46 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualization@lists.linux-foundati
 on.org, James.Bottomley@hansenpartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, khilman@kernel.org, linux-csky@vger.kernel.org, pv-drivers@vmware.com, linux-snps-arc@lists.infradead.org, mgorman@suse.de
 , jacob.jun.pan@linux.intel.com, Arnd Bergmann <arnd@

arndb.de>, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, josh@joshtriplett.org, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, tony@atomide.com, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, yury.norov@gmail.com, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, paulmck@kernel.org, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kernel.org, jgross@suse.com, monstr@monstr.eu, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfa
 ult.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Jun 14, 2022 at 06:58:30PM +0200, Peter Zijlstra wrote:
> On Tue, Jun 14, 2022 at 12:19:29PM +0100, Mark Rutland wrote:
> > On Wed, Jun 08, 2022 at 04:27:23PM +0200, Peter Zijlstra wrote:
> > > Hi All! (omg so many)
> > 
> > Hi Peter,
> > 
> > Sorry for the delay; my plate has also been rather full recently. I'm beginning
> > to page this in now.
> 
> No worries; we all have too much to do ;-)
> 
> > > These here few patches mostly clear out the utter mess that is cpuidle vs rcuidle.
> > > 
> > > At the end of the ride there's only 2 real RCU_NONIDLE() users left
> > > 
> > >   arch/arm64/kernel/suspend.c:            RCU_NONIDLE(__cpu_suspend_exit());
> > >   drivers/perf/arm_pmu.c:                 RCU_NONIDLE(armpmu_start(event, PERF_EF_RELOAD));
> > 
> > The latter of these is necessary because apparently PM notifiers are called
> > with RCU not watching. Is that still the case today (or at the end of this
> > series)? If so, that feels like fertile land for more issues (yaey...). If not,
> > we should be able to drop this.
> 
> That should be fixed; fingers crossed :-)

Cool; I'll try to give that a spin when I'm sat next to some relevant hardware. :)

> > >   kernel/cfi.c:   RCU_NONIDLE({
> > > 
> > > (the CFI one is likely dead in the kCFI rewrite) and there's only a hand full
> > > of trace_.*_rcuidle() left:
> > > 
> > >   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> > >   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, CALLER_ADDR1);
> > >   kernel/trace/trace_preemptirq.c:                        trace_irq_enable_rcuidle(CALLER_ADDR0, caller_addr);
> > >   kernel/trace/trace_preemptirq.c:                        trace_irq_disable_rcuidle(CALLER_ADDR0, caller_addr);
> > >   kernel/trace/trace_preemptirq.c:                trace_preempt_enable_rcuidle(a0, a1);
> > >   kernel/trace/trace_preemptirq.c:                trace_preempt_disable_rcuidle(a0, a1);
> > > 
> > > All of them are in 'deprecated' code that is unused for GENERIC_ENTRY.
> > I think those are also unused on arm64 too?
> > 
> > If not, I can go attack that.
> 
> My grep spots:
> 
> arch/arm64/kernel/entry-common.c:               trace_hardirqs_on();
> arch/arm64/include/asm/daifflags.h:     trace_hardirqs_off();
> arch/arm64/include/asm/daifflags.h:             trace_hardirqs_off();

Ah; I hadn't realised those used trace_.*_rcuidle() behind the scenes.

That affects local_irq_{enable,disable,restore}() too (which is what the
daifflags.h bits are emulating), and also the generic entry code's
irqentry_exit().

So it feels to me like we should be fixing those more generally? e.g. say that
with a new STRICT_ENTRY[_RCU], we can only call trace_hardirqs_{on,off}() with
RCU watching, and alter the definition of those?

> The _on thing should be replaced with something like:
> 
> 	trace_hardirqs_on_prepare();
> 	lockdep_hardirqs_on_prepare();
> 	instrumentation_end();
> 	rcu_irq_exit();
> 	lockdep_hardirqs_on(CALLER_ADDR0);
> 
> (as I think you know, since you have some of that already). And
> something similar for the _off thing, but with _off_finish().

Sure; I knew that was necessary for the outermost parts of entry (and I think
that's all handled), I just hadn't realised that trace_hardirqs_{on,off} did
the rcuidle thing in the middle.

It'd be nice to not have to open-code the whole sequence everywhere for the
portions which run after entry and are instrumentable, so (as above) I reckon
we want to make trace_hardirqs_{on,off}() not do the rcuidle part
unnecessarily (which IIUC is an end-goal anyway)?

> > > I've touched a _lot_ of code that I can't test and likely broken some of it :/
> > > In particular, the whole ARM cpuidle stuff was quite involved with OMAP being
> > > the absolute 'winner'.
> > > 
> > > I'm hoping Mark can help me sort the remaining ARM64 bits as he moves that to
> > > GENERIC_ENTRY.
> > 
> > Moving to GENERIC_ENTRY as a whole is going to take a tonne of work
> > (refactoring both arm64 and the generic portion to be more amenable to each
> > other), but we can certainly move closer to that for the bits that matter here.
> 
> I know ... been there etc.. :-)
> 
> > Maybe we want a STRICT_ENTRY option to get rid of all the deprecated stuff that
> > we can select regardless of GENERIC_ENTRY to make that easier.
> 
> Possible yeah.
> 
> > > I've also got a note that says ARM64 can probably do a WFE based
> > > idle state and employ TIF_POLLING_NRFLAG to avoid some IPIs.
> > 
> > Possibly; I'm not sure how much of a win that'll be given that by default we'll
> > have a ~10KHz WFE wakeup from the timer, but we could take a peek.
> 
> Ohh.. I didn't know it woke up *that* often. I just know Will made use
> of it in things like smp_cond_load_relaxed() which would be somewhat
> similar to a very shallow idle state that looks at the TIF word.

We'll get some saving, I'm just not sure where that falls on the curve of idle
states. FWIW the wakeup *can* be disabled (and it'd be nice to when we have
WFxT instructions which take a timeout), it jsut happens to be on by default
for reasons.

Thanks,
Mark.
