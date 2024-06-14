Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 49025908777
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 11:31:42 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=u/iXU3Cu;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W0vDW1SVRz3cSN
	for <lists+linuxppc-dev@lfdr.de>; Fri, 14 Jun 2024 19:31:39 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=90.155.50.34; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W0v9f4kBYz2yvp
	for <linuxppc-dev@lists.ozlabs.org>; Fri, 14 Jun 2024 19:29:10 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=k5Jozg+gaCeSQ8tXyXAfQ8zvUH35mGnejlLYGUNU73c=; b=u/iXU3CuapkrBpGgNpXL7oKWw2
	akDjIAg46tPSfA09potIFN7iNNRLBOcOWOruqnNqrpF1A3vztyYK1CNKi+YApQjX3TSGtWpbWvyjk
	2QqPlMXSDtQKcOldgtX8kcSD5J30dKJYqKq6+Uz9Dpx2rr4E2LSxU/hTB06ppUtiMhmkFRH1tWGFL
	SfzhC+xbBy+GIFrMIMF6R5HPq1V6egCAlbsXOj1XPxLUL9MBd97xrATfvTJKkPgIW/99fc5N3cCoO
	8Ohm27l1SS86ljlIsb/2oqUYH2Fu/E6Ki2TnRAQh7OggP52Coo4MDKT6lhmrwNRr9/Jrmz4YKJWVc
	W386n8dQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sI3E1-0000000GowR-3iYH;
	Fri, 14 Jun 2024 09:28:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 2A6ED300886; Fri, 14 Jun 2024 11:28:01 +0200 (CEST)
Date: Fri, 14 Jun 2024 11:28:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Message-ID: <20240614092801.GL8774@noisy.programming.kicks-ass.net>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613181613.4329-1-kprateek.nayak@amd.com>
X-Mailman-Approved-At: Fri, 14 Jun 2024 19:31:04 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, Borislav Petkov <bp@alien8.de>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, Jun 13, 2024 at 06:15:59PM +0000, K Prateek Nayak wrote:
> Effects of call_function_single_prep_ipi()
> ==========================================
> 
> To pull a TIF_POLLING thread out of idle to process an IPI, the sender
> sets the TIF_NEED_RESCHED bit in the idle task's thread info in
> call_function_single_prep_ipi() and avoids sending an actual IPI to the
> target. As a result, the scheduler expects a task to be enqueued when
> exiting the idle path. This is not the case with non-polling idle states
> where the idle CPU exits the non-polling idle state to process the
> interrupt, and since need_resched() returns false, soon goes back to
> idle again.
> 
> When TIF_NEED_RESCHED flag is set, do_idle() will call schedule_idle(),
> a large part of which runs with local IRQ disabled. In case of ipistorm,
> when measuring IPI throughput, this large IRQ disabled section delays
> processing of IPIs. Further auditing revealed that in absence of any
> runnable tasks, pick_next_task_fair(), which is called from the
> pick_next_task() fast path, will always call newidle_balance() in this
> scenario, further increasing the time spent in the IRQ disabled section.
> 
> Following is the crude visualization of the problem with relevant
> functions expanded:
> --
> CPU0							CPU1
> ====							====
> 							do_idle() {
> 								__current_set_polling();
> 								...
> 								monitor(addr);
> 								if (!need_resched())
> 									mwait() {
> 									/* Waiting */
> smp_call_function_single(CPU1, func, wait = 1) {				...
> 	...									...
> 	set_nr_if_polling(CPU1) {						...
> 		/* Realizes CPU1 is polling */					...
> 		try_cmpxchg(addr,						...
> 			    &val,						...
> 			    val | _TIF_NEED_RESCHED);				...
> 	} /* Does not send an IPI */						...
> 	...								} /* mwait exit due to write at addr */
> 	csd_lock_wait() {					} 
> 	/* Waiting */						preempt_set_need_resched();
> 		...						__current_clr_polling();
> 		...						flush_smp_call_function_queue() {
> 		...							func();
> 	} /* End of wait */					}
> }								schedule_idle() {
> 									...
> 									local_irq_disable();
> smp_call_function_single(CPU1, func, wait = 1) {			...
> 	...								...
> 	arch_send_call_function_single_ipi(CPU1);			...
> 						\			...
> 						 \			newidle_balance() {
> 						  \				...
> 					      /* Delay */			...
> 						    \			}
> 					     	     \			...
> 						      \-------------->	local_irq_enable();
> 									/* Processes the IPI */
> --
> 
> 
> Skipping newidle_balance()
> ==========================
> 
> In an earlier attempt to solve the challenge of the long IRQ disabled
> section, newidle_balance() was skipped when a CPU waking up from idle
> was found to have no runnable tasks, and was transitioning back to
> idle [2]. Tim [3] and David [4] had pointed out that newidle_balance()
> may be viable for CPUs that are idling with tick enabled, where the
> newidle_balance() has the opportunity to pull tasks onto the idle CPU.

I don't think we should be relying on this in any way shape or form.
NOHZ can kill that tick at any time.

Also, semantically, calling newidle from the idle thread is just daft.
You're really not newly idle in that case.

> Vincent [5] pointed out a case where the idle load kick will fail to
> run on an idle CPU since the IPI handler launching the ILB will check
> for need_resched(). In such cases, the idle CPU relies on
> newidle_balance() to pull tasks towards itself.

Is this the need_resched() in _nohz_idle_balance() ? Should we change
this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
something long those lines?

I mean, it's fairly trivial to figure out if there really is going to be
work there.

> Using an alternate flag instead of NEED_RESCHED to indicate a pending
> IPI was suggested as the correct approach to solve this problem on the
> same thread.

So adding per-arch changes for this seems like something we shouldn't
unless there really is no other sane options.

That is, I really think we should start with something like the below
and then fix any fallout from that.

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0935f9d4bb7b..cfa45338ae97 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -5799,7 +5800,7 @@ static inline struct task_struct *
 __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 {
 	const struct sched_class *class;
-	struct task_struct *p;
+	struct task_struct *p = NULL;
 
 	/*
 	 * Optimization: we know that if all tasks are in the fair class we can
@@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
 	if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
 		   rq->nr_running == rq->cfs.h_nr_running)) {
 
-		p = pick_next_task_fair(rq, prev, rf);
-		if (unlikely(p == RETRY_TASK))
-			goto restart;
+		if (rq->nr_running) {
+			p = pick_next_task_fair(rq, prev, rf);
+			if (unlikely(p == RETRY_TASK))
+				goto restart;
+		}
 
 		/* Assume the next prioritized class is idle_sched_class */
 		if (!p) {
