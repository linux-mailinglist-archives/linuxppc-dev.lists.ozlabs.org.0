Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id D190D5FB9E7
	for <lists+linuxppc-dev@lfdr.de>; Tue, 11 Oct 2022 19:49:05 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4Mn3Dv5GC6z3drs
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 04:49:03 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AdLJrb9Y;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=AdLJrb9Y;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4Mn3Cw4NXwz30Mn
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 04:48:10 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=QbyueNdz5ktWQYiaJAogjVJuk6d8QvogUuT/OZRZF9s=; b=AdLJrb9YQoNNqypB1pE3YR8rtD
	9iS0hNVGDPx3KjuabbQSU51og2f+tO/fzvGiuBqhItXPE8o/qgGJs6LxK8xI7VftAelUcsNqAYIiw
	aJ3flIKx9pbK1Oj9nwWxzU9qrhDUvi3lNxAAQ0Z6RqJ1jt3jH4hZGcKxzCqbGK51s0EVqowKZB0eH
	aTpJZHDK/66lByhl+c2doIpJSMlL/vNbichcV9oF5I6PyjmcmBYhnQJqgRXf9qyGWuZo0Ai7y5QJ2
	5cewfu0+17fSYzqlfx8Rnf5k9n6qp0qgk8zTVhExZHjKy3TF0KhwXYT9rpQlwkQfeb3RXMHgUEcj/
	wNZBm4uQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiJM6-002dEO-R7; Tue, 11 Oct 2022 17:47:51 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 0188E30015F;
	Tue, 11 Oct 2022 19:47:48 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id D94412B123E21; Tue, 11 Oct 2022 19:47:48 +0200 (CEST)
Date: Tue, 11 Oct 2022 19:47:48 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Message-ID: <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
 <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
 <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, srw@sladewatkins.net, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, ndesaulniers@google.com, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Oct 11, 2022 at 04:02:56PM +0200, Peter Zijlstra wrote:
> On Tue, Oct 11, 2022 at 06:49:55PM +0530, Ravi Bangoria wrote:
> > On 11-Oct-22 4:59 PM, Peter Zijlstra wrote:
> > > On Sat, Oct 08, 2022 at 11:54:24AM +0530, Ravi Bangoria wrote:
> > > 
> > >> +static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
> > >> +					  struct perf_event_context *next_ctx)
> > >> +{
> > >> +	struct perf_event_pmu_context *prev_epc, *next_epc;
> > >> +
> > >> +	if (!prev_ctx->nr_task_data)
> > >> +		return;
> > >> +
> > >> +	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
> > >> +				    struct perf_event_pmu_context,
> > >> +				    pmu_ctx_entry);
> > >> +	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
> > >> +				    struct perf_event_pmu_context,
> > >> +				    pmu_ctx_entry);
> > >> +
> > >> +	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
> > >> +	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
> > >> +
> > >> +		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
> > >> +
> > >> +		/*
> > >> +		 * PMU specific parts of task perf context can require
> > >> +		 * additional synchronization. As an example of such
> > >> +		 * synchronization see implementation details of Intel
> > >> +		 * LBR call stack data profiling;
> > >> +		 */
> > >> +		if (prev_epc->pmu->swap_task_ctx)
> > >> +			prev_epc->pmu->swap_task_ctx(prev_epc, next_epc);
> > >> +		else
> > >> +			swap(prev_epc->task_ctx_data, next_epc->task_ctx_data);
> > > 
> > > Did I forget to advance the iterators here?
> > 
> > Yeah. Seems so. I overlooked it too.
> 
> OK; so I'm not slowly going crazy staring at this code ;-) Let me go add
> it now then. :-)
> 
> But first I gotta taxi the kids around for a bit, bbl.

OK, so I've been going over the perf_event_pmu_context life-time thing
as well, there were a bunch of XXXs there and I'm not sure Im happy with
things, but I'd also forgotten most of it.

Ideally epc works like it's a regular member of ctx -- locking wise that
is, but I'm not sure we can make that stick -- see the ctx->mutex issues
we have with put_ctx().

As such, I'm going to have to re-audit all the epc usage to see if
pure ctx->lock is sufficient.

I did do make epc RCU freed, because pretty much everything is and that
was easy enough to make happen -- it means we don't need to worry about
that.

But I'm going cross-eyes from staring at this all day, so more tomorrow.
The below is what I currently have.

---
--- a/include/linux/perf_event.h
+++ b/include/linux/perf_event.h
@@ -833,13 +833,13 @@ struct perf_event {
  *           `--------[1:n]---------'     `-[n:1]-> pmu <-[1:n]-'
  *
  *
- * XXX destroy epc when empty
- *   refcount, !rcu
+ * epc lifetime is refcount based and RCU freed (similar to perf_event_context).
+ * epc locking is as if it were a member of perf_event_context; specifically:
  *
- * XXX epc locking
+ *   modification, both: ctx->mutex && ctx->lock
+ *   reading, either: ctx->mutex || ctx->lock
  *
- *   event->pmu_ctx            ctx->mutex && inactive
- *   ctx->pmu_ctx_list         ctx->mutex && ctx->lock
+ * XXX except this isn't true ... see put_pmu_ctx().
  *
  */
 struct perf_event_pmu_context {
@@ -857,6 +857,7 @@ struct perf_event_pmu_context {
 	unsigned int			nr_events;
 
 	atomic_t			refcount; /* event <-> epc */
+	struct rcu_head			rcu_head;
 
 	void				*task_ctx_data; /* pmu specific data */
 	/*
--- a/kernel/events/core.c
+++ b/kernel/events/core.c
@@ -1727,6 +1727,10 @@ perf_event_groups_next(struct perf_event
 	return NULL;
 }
 
+#define perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu)		\
+	for (event = perf_event_groups_first(groups, cpu, pmu, NULL);	\
+	     event; event = perf_event_groups_next(event, pmu))
+
 /*
  * Iterate through the whole groups tree.
  */
@@ -3366,6 +3370,14 @@ static void perf_event_sync_stat(struct
 	}
 }
 
+#define list_for_each_entry_double(pos1, pos2, head1, head2, member)	\
+	for (pos1 = list_first_entry(head1, typeof(*pos1), member),	\
+	     pos2 = list_first_entry(head2, typeof(*pos2), member);	\
+	     !list_entry_is_head(pos1, head1, member) &&		\
+	     !list_entry_is_head(pos2, head2, member);			\
+	     pos1 = list_next_entry(pos1, member),			\
+	     pos2 = list_next_entry(pos2, member))
+
 static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
 					  struct perf_event_context *next_ctx)
 {
@@ -3374,16 +3386,9 @@ static void perf_event_swap_task_ctx_dat
 	if (!prev_ctx->nr_task_data)
 		return;
 
-	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
-				    struct perf_event_pmu_context,
-				    pmu_ctx_entry);
-	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
-				    struct perf_event_pmu_context,
-				    pmu_ctx_entry);
-
-	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
-	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
-
+	list_for_each_entry_double(prev_epc, next_epc,
+				   &prev_ctx->pmu_ctx_list, &next_ctx->pmu_ctx_list,
+				   pmu_ctx_entry) {
 		WARN_ON_ONCE(prev_epc->pmu != next_epc->pmu);
 
 		/*
@@ -3706,7 +3711,6 @@ static noinline int visit_groups_merge(s
 		perf_assert_pmu_disabled((*evt)->pmu_ctx->pmu);
 	}
 
-
 	min_heapify_all(&event_heap, &perf_min_heap);
 
 	while (event_heap.nr) {
@@ -3845,7 +3849,6 @@ ctx_sched_in(struct perf_event_context *
 		/* start ctx time */
 		__update_context_time(ctx, false);
 		perf_cgroup_set_timestamp(cpuctx);
-		// XXX ctx->task =? task
 		/*
 		 * CPU-release for the below ->is_active store,
 		 * see __load_acquire() in perf_event_time_now()
@@ -4815,6 +4818,15 @@ find_get_pmu_context(struct pmu *pmu, st
 
 	__perf_init_event_pmu_context(new, pmu);
 
+	/*
+	 * XXX
+	 *
+	 * lockdep_assert_held(&ctx->mutex);
+	 *
+	 * can't because perf_event_init_task() doesn't actually hold the
+	 * child_ctx->mutex.
+	 */
+
 	raw_spin_lock_irq(&ctx->lock);
 	list_for_each_entry(epc, &ctx->pmu_ctx_list, pmu_ctx_entry) {
 		if (epc->pmu == pmu) {
@@ -4849,6 +4861,14 @@ static void get_pmu_ctx(struct perf_even
 	WARN_ON_ONCE(!atomic_inc_not_zero(&epc->refcount));
 }
 
+static void free_epc_rcu(struct rcu_head *head)
+{
+	struct perf_event_pmu_context *epc = container_of(head, typeof(*epc), rcu_head);
+
+	kfree(epc->task_ctx_data);
+	kfree(epc);
+}
+
 static void put_pmu_ctx(struct perf_event_pmu_context *epc)
 {
 	unsigned long flags;
@@ -4859,7 +4879,14 @@ static void put_pmu_ctx(struct perf_even
 	if (epc->ctx) {
 		struct perf_event_context *ctx = epc->ctx;
 
-		// XXX ctx->mutex
+		/*
+		 * XXX
+		 *
+		 * lockdep_assert_held(&ctx->mutex);
+		 *
+		 * can't because of the call-site in _free_event()/put_event()
+		 * which isn't always called under ctx->mutex.
+		 */
 
 		WARN_ON_ONCE(list_empty(&epc->pmu_ctx_entry));
 		raw_spin_lock_irqsave(&ctx->lock, flags);
@@ -4874,17 +4901,15 @@ static void put_pmu_ctx(struct perf_even
 	if (epc->embedded)
 		return;
 
-	kfree(epc->task_ctx_data);
-	kfree(epc);
+	call_rcu(&epc->rcu_head, free_epc_rcu);
 }
 
 static void perf_event_free_filter(struct perf_event *event);
 
 static void free_event_rcu(struct rcu_head *head)
 {
-	struct perf_event *event;
+	struct perf_event *event = container_of(head, typeof(*event), rcu_head);
 
-	event = container_of(head, struct perf_event, rcu_head);
 	if (event->ns)
 		put_pid_ns(event->ns);
 	perf_event_free_filter(event);
@@ -12643,13 +12668,6 @@ perf_event_create_kernel_counter(struct
 		goto err_alloc;
 	}
 
-	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
-	if (IS_ERR(pmu_ctx)) {
-		err = PTR_ERR(pmu_ctx);
-		goto err_ctx;
-	}
-	event->pmu_ctx = pmu_ctx;
-
 	WARN_ON_ONCE(ctx->parent_ctx);
 	mutex_lock(&ctx->mutex);
 	if (ctx->task == TASK_TOMBSTONE) {
@@ -12657,6 +12675,13 @@ perf_event_create_kernel_counter(struct
 		goto err_unlock;
 	}
 
+	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
+	if (IS_ERR(pmu_ctx)) {
+		err = PTR_ERR(pmu_ctx);
+		goto err_unlock;
+	}
+	event->pmu_ctx = pmu_ctx;
+
 	if (!task) {
 		/*
 		 * Check if the @cpu we're creating an event for is online.
@@ -12668,13 +12693,13 @@ perf_event_create_kernel_counter(struct
 			container_of(ctx, struct perf_cpu_context, ctx);
 		if (!cpuctx->online) {
 			err = -ENODEV;
-			goto err_unlock;
+			goto err_pmu_ctx;
 		}
 	}
 
 	if (!exclusive_event_installable(event, ctx)) {
 		err = -EBUSY;
-		goto err_unlock;
+		goto err_pmu_ctx;
 	}
 
 	perf_install_in_context(ctx, event, event->cpu);
@@ -12683,9 +12708,10 @@ perf_event_create_kernel_counter(struct
 
 	return event;
 
+err_pmu_ctx:
+	put_pmu_ctx(pmu_ctx);
 err_unlock:
 	mutex_unlock(&ctx->mutex);
-err_ctx:
 	perf_unpin_context(ctx);
 	put_ctx(ctx);
 err_alloc:
@@ -12702,9 +12728,7 @@ static void __perf_pmu_remove(struct per
 {
 	struct perf_event *event, *sibling;
 
-	for (event = perf_event_groups_first(groups, cpu, pmu, NULL);
-	     event; event = perf_event_groups_next(event, pmu)) {
-
+	perf_event_groups_for_cpu_pmu(event, groups, cpu, pmu) {
 		perf_remove_from_context(event, 0);
 		unaccount_event_cpu(event, cpu);
 		put_pmu_ctx(event->pmu_ctx);
@@ -12998,7 +13022,7 @@ void perf_event_free_task(struct task_st
 	struct perf_event_context *ctx;
 	struct perf_event *event, *tmp;
 
-	ctx = rcu_dereference(task->perf_event_ctxp);
+	ctx = rcu_access_pointer(task->perf_event_ctxp);
 	if (!ctx)
 		return;
 
