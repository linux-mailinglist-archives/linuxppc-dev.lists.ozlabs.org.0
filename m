Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F2FD61DCB98
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 13:02:27 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49SRXc5gtmzDqk9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 21:02:24 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=205.233.59.134; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 unprotected) header.d=infradead.org header.i=@infradead.org
 header.a=rsa-sha256 header.s=merlin.20170209 header.b=0RXKPPF/; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49SRVW0KGCzDqhK
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 21:00:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=CZmUG7dBgwdfcd4tZquEzQk9e0BjnN8HVH0P/AP0xAQ=; b=0RXKPPF/qH45a9Uvz0d9Q0bWKZ
 0WAtXxt0m6432jYuZzuOwbeqGBH64mVBlpJFaCu0G0uFDelyIMjRL9RFXmEA7+GnBfUT/RRDarl3v
 YYh3Fd5GXjj/yvu/a6FSnpiqX0z35LmskqH9KArF+CnRtfhcfteIqBpwAL/Ly992IflTg4gC6pQcW
 dAYLa/EiLlPpqqgX+Hue6ulRPO+e0XYPG5Jl2JT4u1G8PFS3keKvJvhDGlxHNfXOv8kP4FDnuzw60
 v/K6OZKOtWrizC1RNu3IoeBvYNMoDyfUj5IW1oyzUeNqmMsbVA9MFZKN3JbScS/WTNhaDpSIwcnk4
 ZgK8AveA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbiw8-0002or-Ld; Thu, 21 May 2020 11:00:28 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 74EAC3011C6;
 Thu, 21 May 2020 13:00:27 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 59E96212820EE; Thu, 21 May 2020 13:00:27 +0200 (CEST)
Date: Thu, 21 May 2020 13:00:27 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200521110027.GC325303@hirez.programming.kicks-ass.net>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521104937.GB325303@hirez.programming.kicks-ass.net>
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

On Thu, May 21, 2020 at 12:49:37PM +0200, Peter Zijlstra wrote:
> On Thu, May 21, 2020 at 11:39:39AM +0200, Peter Zijlstra wrote:
> > On Thu, May 21, 2020 at 02:40:36AM +0200, Frederic Weisbecker wrote:
> 
> > This:
> > 
> > >         smp_call_function_single_async() {             smp_call_function_single_async() {
> > >             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
> > >             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK
> > 
> > concurrent smp_call_function_single_async() using the same csd is what
> > I'm looking at as well.
> 
> So something like this ought to cure the fundamental problem and make
> smp_call_function_single_async() more user friendly, but also more
> expensive.
> 
> The problem is that while the ILB case is easy to fix, I can't seem to
> find an equally nice solution for the ttwu_remote_queue() case; that
> would basically require sticking the wake_csd in task_struct, I'll also
> post that.
> 
> So it's either this:

Or this:

---
 include/linux/sched.h | 4 ++++
 kernel/sched/core.c   | 7 ++++---
 kernel/sched/fair.c   | 2 +-
 kernel/sched/sched.h  | 1 -
 4 files changed, 9 insertions(+), 5 deletions(-)

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
index 5b286469e26e..a7129652e89b 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -2320,7 +2320,7 @@ static void ttwu_queue_remote(struct task_struct *p, int cpu, int wake_flags)
 
 	if (llist_add(&p->wake_entry, &rq->wake_list)) {
 		if (!set_nr_if_polling(rq->idle))
-			smp_call_function_single_async(cpu, &rq->wake_csd);
+			smp_call_function_single_async(cpu, &p->wake_csd);
 		else
 			trace_sched_wake_idle_without_ipi(cpu);
 	}
@@ -2921,6 +2921,9 @@ int sched_fork(unsigned long clone_flags, struct task_struct *p)
 #endif
 #if defined(CONFIG_SMP)
 	p->on_cpu = 0;
+	p->wake_csd = (struct __call_single_data) {
+		.func = wake_csd_func,
+	};
 #endif
 	init_task_preempt_count(p);
 #ifdef CONFIG_SMP
@@ -6723,8 +6726,6 @@ void __init sched_init(void)
 		rq->avg_idle = 2*sysctl_sched_migration_cost;
 		rq->max_idle_balance_cost = sysctl_sched_migration_cost;
 
-		rq_csd_init(rq, &rq->wake_csd, wake_csd_func);
-
 		INIT_LIST_HEAD(&rq->cfs_tasks);
 
 		rq_attach_root(rq, &def_root_domain);
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 01f94cf52783..b6d8a7b991f0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -10033,7 +10033,7 @@ static void kick_ilb(unsigned int flags)
 	 * is idle. And the softirq performing nohz idle load balance
 	 * will be run before returning from the IPI.
 	 */
-	smp_call_function_single_async(ilb_cpu, &cpu_rq(ilb_cpu)->nohz_csd);
+	smp_call_function_single_async(ilb_cpu, &this_rq()->nohz_csd);
 }
 
 /*
diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index f7ab6334e992..c35f0ef43ab0 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1021,7 +1021,6 @@ struct rq {
 #endif
 
 #ifdef CONFIG_SMP
-	call_single_data_t	wake_csd;
 	struct llist_head	wake_list;
 #endif
 
