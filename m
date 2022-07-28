Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id A26275847BA
	for <lists+linuxppc-dev@lfdr.de>; Thu, 28 Jul 2022 23:33:21 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Lv3mH4Hylz3cD8
	for <lists+linuxppc-dev@lfdr.de>; Fri, 29 Jul 2022 07:33:19 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ajcg/8L4;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized) smtp.mailfrom=kernel.org (client-ip=139.178.84.217; helo=dfw.source.kernel.org; envelope-from=srs0=egn+=yb=paulmck-thinkpad-p17-gen-1.home=paulmck@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20201202 header.b=Ajcg/8L4;
	dkim-atps=neutral
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Lty963jSYz2xHr
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 29 Jul 2022 03:20:58 +1000 (AEST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9441F612B2;
	Thu, 28 Jul 2022 17:20:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED372C43140;
	Thu, 28 Jul 2022 17:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659028854;
	bh=3juGR+P+/PoNu1lEhZFgztJ6A9LmEO7Lb+rh9Y4NDdw=;
	h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
	b=Ajcg/8L4izAZKa2mPe4A6mwD2xhNPSF6zD8jqYYYRNqfhpnanJCwPLkeDTtzMAAXY
	 M7oUXZ6CZuH31IjVxAqM2gRnsWZITNKb55wlZ5JnD/DUCRDg3UdeAIrzeX0lNHjHAR
	 wzgi3C8wJdIpBMqt7sc3STjd7C0uykM6U86/xrKMdBkv3A6gpbtO4hXjJ5l+TjHaLy
	 e4DKSoCgdb1tzebEFm0O9AJWb9AqCOKWaWW3sVozalRIPGLkf5E1tw9aRE4zu/+akq
	 X3FcajNE+AfhyfG4rrsgNdfZt/xVPEzBnwFe9tFjDbwwql6CH8YXjM30w46DcxQYCb
	 8dZ4kaIUmww0Q==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
	id 9739D5C0B3E; Thu, 28 Jul 2022 10:20:53 -0700 (PDT)
Date: Thu, 28 Jul 2022 10:20:53 -0700
From: "Paul E. McKenney" <paulmck@kernel.org>
To: Michel Lespinasse <michel@lespinasse.org>
Subject: Re: [PATCH 04/36] cpuidle,intel_idle: Fix CPUIDLE_FLAG_IRQ_ENABLE
Message-ID: <20220728172053.GA3607379@paulmck-ThinkPad-P17-Gen-1>
References: <20220608142723.103523089@infradead.org>
 <20220608144516.172460444@infradead.org>
 <20220725194306.GA14746@lespinasse.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725194306.GA14746@lespinasse.org>
X-Mailman-Approved-At: Fri, 29 Jul 2022 07:32:08 +1000
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
Cc: juri.lelli@redhat.com, rafael@kernel.org, linus.walleij@linaro.org, bsegall@google.com, guoren@kernel.org, pavel@ucw.cz, agordeev@linux.ibm.com, srivatsa@csail.mit.edu, linux-arch@vger.kernel.org, vincent.guittot@linaro.org, chenhuacai@kernel.org, linux-acpi@vger.kernel.org, agross@kernel.org, geert@linux-m68k.org, linux-imx@nxp.com, catalin.marinas@arm.com, xen-devel@lists.xenproject.org, mattst88@gmail.com, borntraeger@linux.ibm.com, mturquette@baylibre.com, sammy@sammy.net, pmladek@suse.com, linux-pm@vger.kernel.org, jiangshanlai@gmail.com, Sascha Hauer <s.hauer@pengutronix.de>, linux-um@lists.infradead.org, acme@kernel.org, tglx@linutronix.de, linux-omap@vger.kernel.org, dietmar.eggemann@arm.com, rth@twiddle.net, gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, senozhatsky@chromium.org, svens@linux.ibm.com, jolsa@kernel.org, paulus@samba.org, mark.rutland@arm.com, linux-ia64@vger.kernel.org, dave.hansen@linux.intel.com, virtualizatio
 n@lists.linux-foundation.org, James.Bottomley@HansenPartnership.com, jcmvbkbc@gmail.com, thierry.reding@gmail.com, kernel@xen0n.name, quic_neeraju@quicinc.com, linux-s390@vger.kernel.org, vschneid@redhat.com, john.ogness@linutronix.de, ysato@users.sourceforge.jp, linux-sh@vger.kernel.org, festevam@gmail.com, deller@gmx.de, daniel.lezcano@linaro.org, jonathanh@nvidia.com, mathieu.desnoyers@efficios.com, frederic@kernel.org, lenb@kernel.org, linux-xtensa@linux-xtensa.org, kernel@pengutronix.de, gor@linux.ibm.com, linux-arm-msm@vger.kernel.org, linux-alpha@vger.kernel.org, linux-m68k@lists.linux-m68k.org, shorne@gmail.com, linux-arm-kernel@lists.infradead.org, chris@zankel.net, sboyd@kernel.org, rh0@fb.com, dinguyen@kernel.org, bristot@redhat.com, alexander.shishkin@linux.intel.com, lpieralisi@kernel.org, linux@rasmusvillemoes.dk, joel@joelfernandes.org, will@kernel.org, boris.ostrovsky@oracle.com, josh@joshtriplett.org, khilman@kernel.org, linux-csky@vger.kernel.org, tony@atomide.com,
  linux-snps-arc@lists.infradead.org, mgorman@suse.de, jacob.jun.pan@linux.intel.com, yury.norov@gmail.com, ulli.kroll@googlemail.com, vgupta@kernel.org, linux-clk@vger.kernel.org, monstr@monstr.eu, rostedt@goodmis.org, rcu@vger.kernel.org, bp@alien8.de, bcain@quicinc.com, tsbogend@alpha.franken.de, linux-parisc@vger.kernel.org, sudeep.holla@arm.com, shawnguo@kernel.org, davem@davemloft.net, dalias@libc.org, Peter Zijlstra <peterz@infradead.org>, amakhalov@vmware.com, bjorn.andersson@linaro.org, hpa@zytor.com, sparclinux@vger.kernel.org, linux-hexagon@vger.kernel.org, linux-riscv@lists.infradead.org, anton.ivanov@cambridgegreys.com, jonas@southpole.se, Arnd Bergmann <arnd@arndb.de>, richard@nod.at, x86@kernel.org, linux@armlinux.org.uk, mingo@redhat.com, aou@eecs.berkeley.edu, hca@linux.ibm.com, stefan.kristiansson@saunalahti.fi, openrisc@lists.librecores.org, paul.walmsley@sifive.com, linux-tegra@vger.kernel.org, namhyung@kernel.org, andriy.shevchenko@linux.intel.com, jpoimboe@kerne
 l.org, jgross@suse.com, pv-drivers@vmware.com, linux-mips@vger.kernel.org, palmer@dabbelt.com, anup@brainfault.org, ink@jurassic.park.msu.ru, johannes@sipsolutions.net, linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 25, 2022 at 12:43:06PM -0700, Michel Lespinasse wrote:
> On Wed, Jun 08, 2022 at 04:27:27PM +0200, Peter Zijlstra wrote:
> > Commit c227233ad64c ("intel_idle: enable interrupts before C1 on
> > Xeons") wrecked intel_idle in two ways:
> > 
> >  - must not have tracing in idle functions
> >  - must return with IRQs disabled
> > 
> > Additionally, it added a branch for no good reason.
> > 
> > Fixes: c227233ad64c ("intel_idle: enable interrupts before C1 on Xeons")
> > Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> 
> After this change was introduced, I am seeing "WARNING: suspicious RCU
> usage" when booting a kernel with debug options compiled in. Please
> see the attached dmesg output. The issue starts with commit 32d4fd5751ea
> and is still present in v5.19-rc8.
> 
> I'm not sure, is this too late to fix or revert in v5.19 final ?

I finally got a chance to take a quick look at this.

The rcu_eqs_exit() function is making a lockdep complaint about
being invoked with interrupts enabled.  This function is called from
rcu_idle_exit(), which is an expected code path from cpuidle_enter_state()
via its call to rcu_idle_exit().  Except that rcu_idle_exit() disables
interrupts before invoking rcu_eqs_exit().

The only other call to rcu_idle_exit() does not disable interrupts,
but it is via rcu_user_exit(), which would be a very odd choice for
cpuidle_enter_state().

It seems unlikely, but it might be that it is the use of local_irq_save()
instead of raw_local_irq_save() within rcu_idle_exit() that is causing
the trouble.  If this is the case, then the commit shown below would
help.  Note that this commit removes the warning from lockdep, so it
is necessary to build the kernel with CONFIG_RCU_EQS_DEBUG=y to enable
equivalent debugging.

Could you please try your test with the -rce commit shown below applied?

							Thanx, Paul

------------------------------------------------------------------------

commit ed4ae5eff4b38797607cbdd80da394149110fb37
Author: Paul E. McKenney <paulmck@kernel.org>
Date:   Tue May 17 21:00:04 2022 -0700

    rcu: Apply noinstr to rcu_idle_enter() and rcu_idle_exit()
    
    This commit applies the "noinstr" tag to the rcu_idle_enter() and
    rcu_idle_exit() functions, which are invoked from portions of the idle
    loop that cannot be instrumented.  These tags require reworking the
    rcu_eqs_enter() and rcu_eqs_exit() functions that these two functions
    invoke in order to cause them to use normal assertions rather than
    lockdep.  In addition, within rcu_idle_exit(), the raw versions of
    local_irq_save() and local_irq_restore() are used, again to avoid issues
    with lockdep in uninstrumented code.
    
    This patch is based in part on an earlier patch by Jiri Olsa, discussions
    with Peter Zijlstra and Frederic Weisbecker, earlier changes by Thomas
    Gleixner, and off-list discussions with Yonghong Song.
    
    Link: https://lore.kernel.org/lkml/20220515203653.4039075-1-jolsa@kernel.org/
    Reported-by: Jiri Olsa <jolsa@kernel.org>
    Reported-by: Alexei Starovoitov <ast@kernel.org>
    Reported-by: Andrii Nakryiko <andrii@kernel.org>
    Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
    Reviewed-by: Yonghong Song <yhs@fb.com>

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index c25ba442044a6..9a5edab5558c9 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -631,8 +631,8 @@ static noinstr void rcu_eqs_enter(bool user)
 		return;
 	}
 
-	lockdep_assert_irqs_disabled();
 	instrumentation_begin();
+	lockdep_assert_irqs_disabled();
 	trace_rcu_dyntick(TPS("Start"), rdp->dynticks_nesting, 0, atomic_read(&rdp->dynticks));
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
 	rcu_preempt_deferred_qs(current);
@@ -659,9 +659,9 @@ static noinstr void rcu_eqs_enter(bool user)
  * If you add or remove a call to rcu_idle_enter(), be sure to test with
  * CONFIG_RCU_EQS_DEBUG=y.
  */
-void rcu_idle_enter(void)
+void noinstr rcu_idle_enter(void)
 {
-	lockdep_assert_irqs_disabled();
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
 	rcu_eqs_enter(false);
 }
 EXPORT_SYMBOL_GPL(rcu_idle_enter);
@@ -861,7 +861,7 @@ static void noinstr rcu_eqs_exit(bool user)
 	struct rcu_data *rdp;
 	long oldval;
 
-	lockdep_assert_irqs_disabled();
+	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !raw_irqs_disabled());
 	rdp = this_cpu_ptr(&rcu_data);
 	oldval = rdp->dynticks_nesting;
 	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && oldval < 0);
@@ -896,13 +896,13 @@ static void noinstr rcu_eqs_exit(bool user)
  * If you add or remove a call to rcu_idle_exit(), be sure to test with
  * CONFIG_RCU_EQS_DEBUG=y.
  */
-void rcu_idle_exit(void)
+void noinstr rcu_idle_exit(void)
 {
 	unsigned long flags;
 
-	local_irq_save(flags);
+	raw_local_irq_save(flags);
 	rcu_eqs_exit(false);
-	local_irq_restore(flags);
+	raw_local_irq_restore(flags);
 }
 EXPORT_SYMBOL_GPL(rcu_idle_exit);
 
