Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 432F7909725
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 10:58:14 +0200 (CEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Zfb4+JMM;
	dkim-atps=neutral
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4W1VRQ0kjDz3cVY
	for <lists+linuxppc-dev@lfdr.de>; Sat, 15 Jun 2024 18:58:10 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=Zfb4+JMM;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4W1JT94yjkz2yvm
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 15 Jun 2024 11:28:59 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Y0phalDzwYFs8lOrqhipjQWwNuUXcfzj94wo5TNk17A=; b=Zfb4+JMMG4D+etrof/kza4LxWP
	6Vqs4Y21vrkY1vNxX/Ko0XMqaoDawSgt7oYaHj0jv9WXsvxwmVY0x5OROFDxRwUKa3s9IU4RzkRRp
	7IGJULBLVz+q5MrwWv5qmCvtWTMoGJM8lfgXarwqHHUh1P19/yW7ChIVczNc6hSJiA7lRI4D4xvlc
	uLBpS4KzFIfkEnoQ3ITxVvgX54lzk7B7XNdp+jTcMX3G/hqvAvzFCCS0RLEIdTTm4b/9HgcpYjhLc
	TL5KiQCsYPe8VPRXX53QQ5MGBkGLivCHaKKkE/TzGMrnMCjRCxs7i+Qr32R1swE9h9K88ezTJr6mO
	NNHqaSHw==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sIIDH-0000000HTdh-2msh;
	Sat, 15 Jun 2024 01:28:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D1279300886; Sat, 15 Jun 2024 03:28:14 +0200 (CEST)
Date: Sat, 15 Jun 2024 03:28:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Vincent Guittot <vincent.guittot@linaro.org>
Subject: Re: [PATCH v2 00/14] Introducing TIF_NOTIFY_IPI flag
Message-ID: <20240615012814.GP8774@noisy.programming.kicks-ass.net>
References: <20240613181613.4329-1-kprateek.nayak@amd.com>
 <20240614092801.GL8774@noisy.programming.kicks-ass.net>
 <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKfTPtBTxhbmh=605TJ9sRw-nFu6w-KY7QpAxRUh5AjhQWa2ig@mail.gmail.com>
X-Mailman-Approved-At: Sat, 15 Jun 2024 18:57:30 +1000
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
Cc: Juri Lelli <juri.lelli@redhat.com>, Rich Felker <dalias@libc.org>, Andreas Larsson <andreas@gaisler.com>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, linux-openrisc@vger.kernel.org, Guo Ren <guoren@kernel.org>, linux-csky@vger.kernel.org, David Vernet <void@manifault.com>, "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>, Thomas Gleixner <tglx@linutronix.de>, Kees Cook <keescook@chromium.org>, Jonas Bonn <jonas@southpole.se>, Valentin Schneider <vschneid@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>, linux-sh@vger.kernel.org, Helge Deller <deller@gmx.de>, "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <linux@armlinux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, Tony Battersby <tonyb@cybernetics.com>, Ingo Molnar <mingo@redhat.com>, sparclinux@vger.kernel.org, Mel Gorman <mgorman@suse.de>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, Matt Turner <mattst88@gmail.com>, Benjamin Gray <bgray@linux.ibm.com>, Andrew Donnellan <ajd@linux.ibm.com>, "Paul E. McKenney" <paulmck@kernel.org>, Rik van Riel <riel@surriel.com>, Brian Gerst <brgerst@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, Xin Li <xin3.li@intel.com>, Richard Henderson <richard.henderson@linaro.org>, linuxppc-dev@lists.ozlabs.org, Nicholas Piggin <npiggin@gmail.com>, Stefan Kristiansson <stefan.kristiansson@saunalahti.fi>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Steven Rostedt <rostedt@goodmis.org>, John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>, Bjorn Helgaas <bhelgaas@google.com>, Stafford Horne <shorne@gmail.com>, Dietmar Eggemann <dietmar.eggemann@arm.com>, linux-arm-kernel@lists.infradead.org, Ben Segall <bsegall@google.com>, Michal Simek <monstr@monstr.eu>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-parisc@vger.kernel.org, Tim Chen <tim.c.chen@linux.intel.com>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, Julia Lawall <julia.lawall@inria.fr>, Dinh Nguyen <dinguyen@kernel.org>, Leonardo Bras <leobras@redhat.com>, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, linux-alpha@vger.kernel.org, Imran Khan <imran.f.khan@oracle.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, Daniel Bristot de Oliveira <bristot@redhat.com>, "David S. Miller" <davem@davemloft.net>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Fri, Jun 14, 2024 at 12:48:37PM +0200, Vincent Guittot wrote:
> On Fri, 14 Jun 2024 at 11:28, Peter Zijlstra <peterz@infradead.org> wrote:

> > > Vincent [5] pointed out a case where the idle load kick will fail to
> > > run on an idle CPU since the IPI handler launching the ILB will check
> > > for need_resched(). In such cases, the idle CPU relies on
> > > newidle_balance() to pull tasks towards itself.
> >
> > Is this the need_resched() in _nohz_idle_balance() ? Should we change
> > this to 'need_resched() && (rq->nr_running || rq->ttwu_pending)' or
> > something long those lines?
> 
> It's not only this but also in do_idle() as well which exits the loop
> to look for tasks to schedule

Is that really a problem? Reading the initial email the problem seems to
be newidle balance, not hitting schedule. Schedule should be fairly
quick if there's nothing to do, no?

> > I mean, it's fairly trivial to figure out if there really is going to be
> > work there.
> >
> > > Using an alternate flag instead of NEED_RESCHED to indicate a pending
> > > IPI was suggested as the correct approach to solve this problem on the
> > > same thread.
> >
> > So adding per-arch changes for this seems like something we shouldn't
> > unless there really is no other sane options.
> >
> > That is, I really think we should start with something like the below
> > and then fix any fallout from that.
> 
> The main problem is that need_resched becomes somewhat meaningless
> because it doesn't  only mean "I need to resched a task" and we have
> to add more tests around even for those not using polling

True, however we already had some of that by having the wakeup list,
that made nr_running less 'reliable'.

The thing is, most architectures seem to have the TIF_POLLING_NRFLAG
bit, even if their main idle routine isn't actually using it, much of
the idle loop until it hits the arch idle will be having it set and will
thus tickle these cases *sometimes*.

> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 0935f9d4bb7b..cfa45338ae97 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -5799,7 +5800,7 @@ static inline struct task_struct *
> >  __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> >  {
> >         const struct sched_class *class;
> > -       struct task_struct *p;
> > +       struct task_struct *p = NULL;
> >
> >         /*
> >          * Optimization: we know that if all tasks are in the fair class we can
> > @@ -5810,9 +5811,11 @@ __pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
> >         if (likely(!sched_class_above(prev->sched_class, &fair_sched_class) &&
> >                    rq->nr_running == rq->cfs.h_nr_running)) {
> >
> > -               p = pick_next_task_fair(rq, prev, rf);
> > -               if (unlikely(p == RETRY_TASK))
> > -                       goto restart;
> > +               if (rq->nr_running) {
> 
> How do you make the diff between a spurious need_resched() because of
> polling and a cpu becoming idle ? isn't rq->nr_running null in both
> cases ?

Bah, true. It should also check current being idle, which then makes a
mess of things again. Still, we shouldn't be calling newidle from idle,
that's daft.

I should probably not write code at 3am, but the below horror is what
I came up with.

---

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 0935f9d4bb7b..cfe8d3350819 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6343,19 +6344,12 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  * Constants for the sched_mode argument of __schedule().
  *
  * The mode argument allows RT enabled kernels to differentiate a
- * preemption from blocking on an 'sleeping' spin/rwlock. Note that
- * SM_MASK_PREEMPT for !RT has all bits set, which allows the compiler to
- * optimize the AND operation out and just check for zero.
+ * preemption from blocking on an 'sleeping' spin/rwlock.
  */
-#define SM_NONE			0x0
-#define SM_PREEMPT		0x1
-#define SM_RTLOCK_WAIT		0x2
-
-#ifndef CONFIG_PREEMPT_RT
-# define SM_MASK_PREEMPT	(~0U)
-#else
-# define SM_MASK_PREEMPT	SM_PREEMPT
-#endif
+#define SM_IDLE			(-1)
+#define SM_NONE			0
+#define SM_PREEMPT		1
+#define SM_RTLOCK_WAIT		2
 
 /*
  * __schedule() is the main scheduler function.
@@ -6396,11 +6390,12 @@ pick_next_task(struct rq *rq, struct task_struct *prev, struct rq_flags *rf)
  *
  * WARNING: must be called with preemption disabled!
  */
-static void __sched notrace __schedule(unsigned int sched_mode)
+static void __sched notrace __schedule(int sched_mode)
 {
 	struct task_struct *prev, *next;
 	unsigned long *switch_count;
 	unsigned long prev_state;
+	bool preempt = sched_mode > 0;
 	struct rq_flags rf;
 	struct rq *rq;
 	int cpu;
@@ -6409,13 +6404,13 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 	rq = cpu_rq(cpu);
 	prev = rq->curr;
 
-	schedule_debug(prev, !!sched_mode);
+	schedule_debug(prev, preempt);
 
 	if (sched_feat(HRTICK) || sched_feat(HRTICK_DL))
 		hrtick_clear(rq);
 
 	local_irq_disable();
-	rcu_note_context_switch(!!sched_mode);
+	rcu_note_context_switch(preempt);
 
 	/*
 	 * Make sure that signal_pending_state()->signal_pending() below
@@ -6449,7 +6444,12 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 	 * that we form a control dependency vs deactivate_task() below.
 	 */
 	prev_state = READ_ONCE(prev->__state);
-	if (!(sched_mode & SM_MASK_PREEMPT) && prev_state) {
+	if (sched_mode == SM_IDLE) {
+		if (!rq->nr_running) {
+			next = prev;
+			goto picked;
+		}
+	} else if (!preempt && prev_state) {
 		if (signal_pending_state(prev_state, prev)) {
 			WRITE_ONCE(prev->__state, TASK_RUNNING);
 		} else {
@@ -6483,6 +6483,7 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 	}
 
 	next = pick_next_task(rq, prev, &rf);
+picked:
 	clear_tsk_need_resched(prev);
 	clear_preempt_need_resched();
 #ifdef CONFIG_SCHED_DEBUG
@@ -6521,9 +6522,9 @@ static void __sched notrace __schedule(unsigned int sched_mode)
 		++*switch_count;
 
 		migrate_disable_switch(rq, prev);
 		psi_sched_switch(prev, next, !task_on_rq_queued(prev));
 
-		trace_sched_switch(sched_mode & SM_MASK_PREEMPT, prev, next, prev_state);
+		trace_sched_switch(preempt, prev, next, prev_state);
 
 		/* Also unlocks the rq: */
 		rq = context_switch(rq, prev, next, &rf);
@@ -6599,7 +6601,7 @@ static void sched_update_worker(struct task_struct *tsk)
 	}
 }
 
-static __always_inline void __schedule_loop(unsigned int sched_mode)
+static __always_inline void __schedule_loop(int sched_mode)
 {
 	do {
 		preempt_disable();
@@ -6644,7 +6646,7 @@ void __sched schedule_idle(void)
 	 */
 	WARN_ON_ONCE(current->__state);
 	do {
-		__schedule(SM_NONE);
+		__schedule(SM_IDLE);
 	} while (need_resched());
 }
 
