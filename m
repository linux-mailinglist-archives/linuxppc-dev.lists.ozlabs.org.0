Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D555FC522
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 14:18:03 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MnWrH2NDpz3c9B
	for <lists+linuxppc-dev@lfdr.de>; Wed, 12 Oct 2022 23:17:51 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E1drx2e5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=E1drx2e5;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MnWqG1YHkz2xGB
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 12 Oct 2022 23:16:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=771q3x4hOnkGzc78SSiuR2Kc8F2eZjEEOxi50XFCd14=; b=E1drx2e5ov2RYK9oK5Zx5/KeJi
	euNoevVzCIAtLYs/LZRRj1ulRyX2D/g1DoT/h6nJ8WHN4wg8v9l8zMHApB0wkPYhVKPO75VrWjbuZ
	6MezWJMrWmFs+QNaXuL1ijf3KmKfIZqg2nux/9HZGvrJjKNQB4C3JgNYbiafLXR01Q7K+kpVkjcxl
	yA/QkyrirVfJz1SUdljE2HM4DMFlxizmQa9C0Gij2voz7Mv8EFIszLrDBUY4ZHMnXzldcVLvtj55A
	qfhTY8b4HbKz14NvEk9HXzGkBgibBW6NpB/P9lmwrLP9E63vjpm2kMHSQU/7f0TdNQivVL5jIjQlp
	UsjTPjFA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiaf1-002rHx-8r; Wed, 12 Oct 2022 12:16:32 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id CCA95300023;
	Wed, 12 Oct 2022 14:16:29 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id A982F20E06FFE; Wed, 12 Oct 2022 14:16:29 +0200 (CEST)
Date: Wed, 12 Oct 2022 14:16:29 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH v2] perf: Rewrite core context handling
Message-ID: <Y0awHa8oS5yal5M9@hirez.programming.kicks-ass.net>
References: <20221008062424.313-1-ravi.bangoria@amd.com>
 <Y0VTn0qLWd925etP@hirez.programming.kicks-ass.net>
 <ba47d079-6d97-0412-69a0-fa15999b5024@amd.com>
 <Y0V3kOWInrvCvVtk@hirez.programming.kicks-ass.net>
 <Y0WsRItHmfI5uaq3@hirez.programming.kicks-ass.net>
 <174fb540-ec18-eeca-191d-c02e1f1005d2@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <174fb540-ec18-eeca-191d-c02e1f1005d2@amd.com>
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

On Wed, Oct 12, 2022 at 02:09:00PM +0530, Ravi Bangoria wrote:

> > @@ -3366,6 +3370,14 @@ static void perf_event_sync_stat(struct
> >  	}
> >  }
> >  
> > +#define list_for_each_entry_double(pos1, pos2, head1, head2, member)	\
> > +	for (pos1 = list_first_entry(head1, typeof(*pos1), member),	\
> > +	     pos2 = list_first_entry(head2, typeof(*pos2), member);	\
> > +	     !list_entry_is_head(pos1, head1, member) &&		\
> > +	     !list_entry_is_head(pos2, head2, member);			\
> > +	     pos1 = list_next_entry(pos1, member),			\
> > +	     pos2 = list_next_entry(pos2, member))
> > +
> >  static void perf_event_swap_task_ctx_data(struct perf_event_context *prev_ctx,
> >  					  struct perf_event_context *next_ctx)
> >  {
> > @@ -3374,16 +3386,9 @@ static void perf_event_swap_task_ctx_dat
> >  	if (!prev_ctx->nr_task_data)
> >  		return;
> >  
> > -	prev_epc = list_first_entry(&prev_ctx->pmu_ctx_list,
> > -				    struct perf_event_pmu_context,
> > -				    pmu_ctx_entry);
> > -	next_epc = list_first_entry(&next_ctx->pmu_ctx_list,
> > -				    struct perf_event_pmu_context,
> > -				    pmu_ctx_entry);
> > -
> > -	while (&prev_epc->pmu_ctx_entry != &prev_ctx->pmu_ctx_list &&
> > -	       &next_epc->pmu_ctx_entry != &next_ctx->pmu_ctx_list) {
> > -
> > +	list_for_each_entry_double(prev_epc, next_epc,
> > +				   &prev_ctx->pmu_ctx_list, &next_ctx->pmu_ctx_list,
> > +				   pmu_ctx_entry) {
> 
> There are more places which can use list_for_each_entry_double().
> I'll fix those.

I've gone and renamed it: double_list_for_each_entry(), but yeah, didn't
look too hard for other users.

> > @@ -4859,7 +4879,14 @@ static void put_pmu_ctx(struct perf_even
> >  	if (epc->ctx) {
> >  		struct perf_event_context *ctx = epc->ctx;
> >  
> > -		// XXX ctx->mutex
> > +		/*
> > +		 * XXX
> > +		 *
> > +		 * lockdep_assert_held(&ctx->mutex);
> > +		 *
> > +		 * can't because of the call-site in _free_event()/put_event()
> > +		 * which isn't always called under ctx->mutex.
> > +		 */
> 
> Yes. I came across the same and could not figure out how to solve
> this. So Just kept XXX as is.

Yeah, I can sorta fix it, but it's ugly so there we are.

> >  
> >  		WARN_ON_ONCE(list_empty(&epc->pmu_ctx_entry));
> >  		raw_spin_lock_irqsave(&ctx->lock, flags);

> > @@ -12657,6 +12675,13 @@ perf_event_create_kernel_counter(struct
> >  		goto err_unlock;
> >  	}
> >  
> > +	pmu_ctx = find_get_pmu_context(pmu, ctx, event);
> > +	if (IS_ERR(pmu_ctx)) {
> > +		err = PTR_ERR(pmu_ctx);
> > +		goto err_unlock;
> > +	}
> > +	event->pmu_ctx = pmu_ctx;
> 
> We should call find_get_pmu_context() with ctx->mutex held and thus
> above perf_event_create_kernel_counter() change. Is my understanding
> correct?

That's the intent yeah. But due to not always holding ctx->mutex over
put_pmu_ctx() this might be moot. I'm almost through auditing epc usage
and I think ctx->lock is sufficient, fingers crossed.

> > +
> >  	if (!task) {
> >  		/*
> >  		 * Check if the @cpu we're creating an event for is online.

> > @@ -12998,7 +13022,7 @@ void perf_event_free_task(struct task_st
> >  	struct perf_event_context *ctx;
> >  	struct perf_event *event, *tmp;
> >  
> > -	ctx = rcu_dereference(task->perf_event_ctxp);
> > +	ctx = rcu_access_pointer(task->perf_event_ctxp);
> 
> We dereference ctx pointer but with mutex and lock held. And thus
> rcu_access_pointer() is sufficient. Is my understanding correct?

We do not in fact hold ctx->lock here IIRC; but this is a NULL test, if
it is !NULL we know we have a reference on it and are good.
