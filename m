Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF4B1E0F67
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 15:24:38 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49VyVp002kzDqNZ
	for <lists+linuxppc-dev@lfdr.de>; Mon, 25 May 2020 23:24:33 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2607:7c80:54:e::133; helo=bombadil.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49VyR26NJxzDqGb
 for <linuxppc-dev@lists.ozlabs.org>; Mon, 25 May 2020 23:21:18 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=KXafGMI0016LaAdXkM6ecwx4s5fmwYBS7iuHwl2pdQQ=; b=sPV/VarQ0Bv/np6SED4MNCPCsN
 /iCB/llU5luzXwK+O74kL/zA13hLfRLLsp6f/qfAn54bsudvxA8Izu5g8+WiX9+4PV60f/NZIbt0K
 SPpTbaUT41S86gFeLI9C5Wrx+hA6uOwqrXOB/RVTUfK5qfuMbxk+TXGZsFkIKsVqNf0Pwq56eltP+
 eCmFcbgEDHp9HhpItQ9MMlnACt+GYEBsPUo+LCVmzJ9nxAPok9xSsqjN08b/tNHd1/1l/Fv0wfCKs
 FjVizXX6dYfJ8JxBqpGGMSp8tlmmCrAxO491f7BDKW479VInVltz/3ggax049wIbJoqftIZ8Bprdf
 eRKqJdxw==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdD2S-0003So-0H; Mon, 25 May 2020 13:21:08 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 73B4E30018B;
 Mon, 25 May 2020 15:21:05 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 60FA52B0BA0F2; Mon, 25 May 2020 15:21:05 +0200 (CEST)
Date: Mon, 25 May 2020 15:21:05 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200525132105.GW325280@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
 <20200521110027.GC325303@hirez.programming.kicks-ass.net>
 <20200521124113.GC15455@lenoir>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521124113.GC15455@lenoir>
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
Cc: "Paul E. McKenney" <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Qian Cai <cai@lca.pw>, Borislav Petkov <bp@alien8.de>,
 Thomas Gleixner <tglx@linutronix.de>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Thu, May 21, 2020 at 02:41:14PM +0200, Frederic Weisbecker wrote:
> On Thu, May 21, 2020 at 01:00:27PM +0200, Peter Zijlstra wrote:

> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index 01f94cf52783..b6d8a7b991f0 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -10033,7 +10033,7 @@ static void kick_ilb(unsigned int flags)
> >  	 * is idle. And the softirq performing nohz idle load balance
> >  	 * will be run before returning from the IPI.
> >  	 */
> > -	smp_call_function_single_async(ilb_cpu, &cpu_rq(ilb_cpu)->nohz_csd);
> > +	smp_call_function_single_async(ilb_cpu, &this_rq()->nohz_csd);
> 
> My fear here is that if a previous call from the the same CPU but to another
> target is still pending, the new one will be spuriously ignored.
> 

Urgh, indeed!

> But I believe we can still keep the remote csd if nohz_flags() are
> strictly only set before the IPI and strictly only cleared from it.
> 
> And I still don't understand why trigger_load_balance() raise the
> softirq without setting the current CPU as ilb. run_rebalance_domains()
> thus ignores it most of the time in the end or it spuriously clear the
> nohz_flags set by an IPI sender. Or there is something I misunderstood
> there.

That is because it is simple and didn't matter before. Whoever got there
first go to run the ilb whenever the flag was set.

But now we have this race due to having to serialize access to the csd.

We want the IPI to clear the flag, but then the softirq no longer knows
it was supposed to do ILB.

How's this then?

---
 include/linux/sched.h |  4 ++++
 kernel/sched/core.c   | 41 +++++++++++++----------------------------
 kernel/sched/fair.c   | 15 +++++++--------
 kernel/sched/sched.h  |  2 +-
 4 files changed, 25 insertions(+), 37 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f38d62c4632c..136ee400b568 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -696,6 +696,10 @@ struct task_struct {
 	struct uclamp_se		uclamp[UCLAMP_CNT];
 #endif
 
+#ifdef CONFIG_SMP
+	call_single_data_t		wake_csd;
+#endif
+
 #ifdef CONFIG_PREEMPT_NOTIFIERS
 	/* List of struct preempt_notifier: */
 	struct hlist_head		preempt_notifiers;
diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index 5b286469e26e..90484b988b65 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -637,41 +637,25 @@ void wake_up_nohz_cpu(int cpu)
 		wake_up_idle_cpu(cpu);
 }
 
-static inline bool got_nohz_idle_kick(void)
+static void nohz_csd_func(void *info)
 {
-	int cpu = smp_processor_id();
-
-	if (!(atomic_read(nohz_flags(cpu)) & NOHZ_KICK_MASK))
-		return false;
-
-	if (idle_cpu(cpu) && !need_resched())
-		return true;
+	struct rq *rq = info;
+	int cpu = cpu_of(rq);
 
+	WARN_ON(!(atomic_read(nohz_flags(cpu)) & NOHZ_KICK_MASK));
 	/*
-	 * We can't run Idle Load Balance on this CPU for this time so we
-	 * cancel it and clear NOHZ_BALANCE_KICK
+	 * Release the rq::nohz_csd.
 	 */
+	smp_mb__before_atomic();
 	atomic_andnot(NOHZ_KICK_MASK, nohz_flags(cpu));
-	return false;
-}
-
-static void nohz_csd_func(void *info)
-{
-	struct rq *rq = info;
 
-	if (got_nohz_idle_kick()) {
-		rq->idle_balance = 1;
+	rq->idle_balance = idle_cpu(cpu);
+	if (rq->idle_balance && !need_resched()) {
+		rq->nohz_idle_balance = 1;
 		raise_softirq_irqoff(SCHED_SOFTIRQ);
 	}
 }
 
-#else /* CONFIG_NO_HZ_COMMON */
-
-static inline bool got_nohz_idle_kick(void)
-{
-	return false;
-}
-
 #endif /* CONFIG_NO_HZ_COMMON */
 
 #ifdef CONFIG_NO_HZ_FULL
@@ -2320,7 +2304,7 @@ static void ttwu_queue_remote(struct task_struct *p, int cpu, int wake_flags)
 
 	if (llist_add(&p->wake_entry, &rq->wake_list)) {
 		if (!set_nr_if_polling(rq->idle))
-			smp_call_function_single_async(cpu, &rq->wake_csd);
+			smp_call_function_single_async(cpu, &p->wake_csd);
 		else
 			trace_sched_wake_idle_without_ipi(cpu);
 	}
@@ -2921,6 +2905,9 @@ int sched_fork(unsigned long clone_flags, struct task_struct *p)
 #endif
 #if defined(CONFIG_SMP)
 	p->on_cpu = 0;
+	p->wake_csd = (struct __call_single_data) {
+		.func = wake_csd_func,
+	};
 #endif
 	init_task_preempt_count(p);
 #ifdef CONFIG_SMP
@@ -6723,8 +6710,6 @@ void __init sched_init(void)
 		rq->avg_idle = 2*sysctl_sched_migration_cost;
 		rq->max_idle_balance_cost = sysctl_sched_migration_cost;
 
-		rq_csd_init(rq, &rq->wake_csd, wake_csd_func);
-
 		INIT_LIST_HEAD(&rq->cfs_tasks);
 
 		rq_attach_root(rq, &def_root_domain);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 01f94cf52783..93525549a023 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10024,6 +10024,10 @@ static void kick_ilb(unsigned int flags)
 	if (ilb_cpu >= nr_cpu_ids)
 		return;
 
+	/*
+	 * Access to rq::nohz_csd is serialized by NOHZ_KICK_MASK; he who sets
+	 * the first flag owns it; cleared by nohz_csd_func().
+	 */
 	flags = atomic_fetch_or(flags, nohz_flags(ilb_cpu));
 	if (flags & NOHZ_KICK_MASK)
 		return;
@@ -10374,17 +10378,12 @@ static bool nohz_idle_balance(struct rq *this_rq, enum cpu_idle_type idle)
 	int this_cpu = this_rq->cpu;
 	unsigned int flags;
 
-	if (!(atomic_read(nohz_flags(this_cpu)) & NOHZ_KICK_MASK))
+	if (!this_rq->nohz_idle_balance)
 		return false;
 
-	if (idle != CPU_IDLE) {
-		atomic_andnot(NOHZ_KICK_MASK, nohz_flags(this_cpu));
-		return false;
-	}
+	this_rq->nohz_idle_balance = 0;
 
-	/* could be _relaxed() */
-	flags = atomic_fetch_andnot(NOHZ_KICK_MASK, nohz_flags(this_cpu));
-	if (!(flags & NOHZ_KICK_MASK))
+	if (idle != CPU_IDLE)
 		return false;
 
 	_nohz_idle_balance(this_rq, flags, idle);
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f7ab6334e992..6418f6af15c1 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -951,6 +951,7 @@ struct rq {
 
 	struct callback_head	*balance_callback;
 
+	unsigned char		nohz_idle_balance;
 	unsigned char		idle_balance;
 
 	unsigned long		misfit_task_load;
@@ -1021,7 +1022,6 @@ struct rq {
 #endif
 
 #ifdef CONFIG_SMP
-	call_single_data_t	wake_csd;
 	struct llist_head	wake_list;
 #endif
 
