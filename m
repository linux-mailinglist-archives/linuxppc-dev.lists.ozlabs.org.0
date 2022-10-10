Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:2:0:216:3eff:fee1:b9f1])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C905F9CB8
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 12:24:36 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmFQQ1Z2Tz3dqF
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 21:24:30 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UePuHnVs;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=UePuHnVs;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmFPS0cHmz2xjj
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 21:23:39 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=PwC8Ko8ExloPOXLLOvDYQPBx8XQllNZ4yCha6ElpxdQ=; b=UePuHnVsJtFRhZgctGBQoYPgOV
	RciNxCEgZnd32TL1YJC6DBwI9vKLnBA9U8XGrOYLaNbuzIYNqCIYh3AYV4/wnxActoxvXS3cLhK0P
	QNSYgKSNtsIu9wh0M64ol6REId3RcuPGLj1QDka1ndjJgDTncRLv5uz8S7eXR+QJEC0WfSYP1Rvbf
	RQldgMUm0NucL9j4hwmgQvHWoDWjAGHvADY/3MYGQtKOBufGM/YgurPKans6xIMamHhCQ4XluXZ80
	4sYWVooCiNyi6vHJH4m5YpnqFFclbdlB28wSbrzou5cHNwvJ8QxmWL7HC2ZyAfKnLUixH+sFKg/fB
	U3qXJSWA==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpwH-002GBJ-Uc; Mon, 10 Oct 2022 10:23:14 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id B50AB30045D;
	Mon, 10 Oct 2022 12:23:12 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9E4C12022F86C; Mon, 10 Oct 2022 12:23:12 +0200 (CEST)
Date: Mon, 10 Oct 2022 12:23:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH] perf: Rewrite core context handling
Message-ID: <Y0PykAbq/SLjUqhO@hirez.programming.kicks-ass.net>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <9d7a9f37-f037-00b8-afd3-72bb840a90df@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d7a9f37-f037-00b8-afd3-72bb840a90df@amd.com>
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
Cc: mark.rutland@arm.com, irogers@google.com, songliubraving@fb.com, sandipan.das@amd.com, alexander.shishkin@linux.intel.com, catalin.marinas@arm.com, eranian@google.com, kim.phillips@amd.com, will@kernel.org, robh@kernel.org, ak@linux.intel.com, jolsa@redhat.com, mingo@redhat.com, linux-s390@vger.kernel.org, frederic@kernel.org, acme@kernel.org, maddy@linux.ibm.com, namhyung@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, ananth.narayan@amd.com, linuxppc-dev@lists.ozlabs.org, santosh.shukla@amd.com
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Tue, Sep 06, 2022 at 11:20:53AM +0530, Ravi Bangoria wrote:

> This one was simple enough so I prepared a patch for this. Let
> me know if you see any issues with below diff.

I've extraed this as a separate patch since it's not strictly required
for correctness and the patch is a quite large enough.

> ---
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index 820c56c66b26..e0232e0bb74e 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -9807,6 +9807,44 @@ static struct pmu perf_swevent = {
>  
>  #ifdef CONFIG_EVENT_TRACING
>  
> +static void tp_perf_event_destroy(struct perf_event *event)
> +{
> +	perf_trace_destroy(event);
> +}
> +
> +static int perf_tp_event_init(struct perf_event *event)
> +{
> +	int err;
> +
> +	if (event->attr.type != PERF_TYPE_TRACEPOINT)
> +		return -ENOENT;
> +
> +	/*
> +	 * no branch sampling for tracepoint events
> +	 */
> +	if (has_branch_stack(event))
> +		return -EOPNOTSUPP;
> +
> +	err = perf_trace_init(event);
> +	if (err)
> +		return err;
> +
> +	event->destroy = tp_perf_event_destroy;
> +
> +	return 0;
> +}
> +
> +static struct pmu perf_tracepoint = {
> +	.task_ctx_nr	= perf_sw_context,
> +
> +	.event_init	= perf_tp_event_init,
> +	.add		= perf_trace_add,
> +	.del		= perf_trace_del,
> +	.start		= perf_swevent_start,
> +	.stop		= perf_swevent_stop,
> +	.read		= perf_swevent_read,
> +};
> +
>  static int perf_tp_filter_match(struct perf_event *event,
>  				struct perf_sample_data *data)
>  {
> @@ -9856,6 +9894,49 @@ void perf_trace_run_bpf_submit(void *raw_data, int size, int rctx,
>  }
>  EXPORT_SYMBOL_GPL(perf_trace_run_bpf_submit);
>  
> +
> +static void __perf_tp_event_target_task(u64 count, void *record,
> +					struct pt_regs *regs,
> +					struct perf_sample_data *data,
> +					struct perf_event *event)
> +{
> +	struct trace_entry *entry = record;
> +
> +	if (event->attr.config != entry->type)
> +		return;
> +	/* Cannot deliver synchronous signal to other task. */
> +	if (event->attr.sigtrap)
> +		return;
> +	if (perf_tp_event_match(event, data, regs))
> +		perf_swevent_event(event, count, data, regs);
> +}
> +
> +static void perf_tp_event_target_task(u64 count, void *record,
> +				      struct pt_regs *regs,
> +				      struct perf_sample_data *data,
> +				      struct perf_event_context *ctx)
> +{
> +	struct perf_event *event, *sibling;
> +
> +	event = perf_event_groups_first(&ctx->pinned_groups, smp_processor_id(),
> +					&perf_tracepoint, NULL);
> +	for (; event; event = perf_event_groups_next(event, &perf_tracepoint)) {
> +		__perf_tp_event_target_task(count, record, regs, data, event);
> +		for_each_sibling_event(sibling, event) {
> +			__perf_tp_event_target_task(count, record, regs, data, sibling);
> +		}
> +	}
> +
> +	event = perf_event_groups_first(&ctx->flexible_groups, smp_processor_id(),
> +					&perf_tracepoint, NULL);
> +	for (; event; event = perf_event_groups_next(event, &perf_tracepoint)) {
> +		__perf_tp_event_target_task(count, record, regs, data, event);
> +		for_each_sibling_event(sibling, event) {
> +			__perf_tp_event_target_task(count, record, regs, data, sibling);
> +		}
> +	}
> +}
> +
>  void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
>  		   struct pt_regs *regs, struct hlist_head *head, int rctx,
>  		   struct task_struct *task)
> @@ -9886,29 +9967,15 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
>  	 */
>  	if (task && task != current) {
>  		struct perf_event_context *ctx;
> -		struct trace_entry *entry = record;
>  
>  		rcu_read_lock();
>  		ctx = rcu_dereference(task->perf_event_ctxp);
>  		if (!ctx)
>  			goto unlock;
>  
> -		// XXX iterate groups instead, we should be able to
> -		// find the subtree for the perf_tracepoint pmu and CPU.
> -
> -		list_for_each_entry_rcu(event, &ctx->event_list, event_entry) {
> -			if (event->cpu != smp_processor_id())
> -				continue;
> -			if (event->attr.type != PERF_TYPE_TRACEPOINT)
> -				continue;
> -			if (event->attr.config != entry->type)
> -				continue;
> -			/* Cannot deliver synchronous signal to other task. */
> -			if (event->attr.sigtrap)
> -				continue;
> -			if (perf_tp_event_match(event, &data, regs))
> -				perf_swevent_event(event, count, &data, regs);
> -		}
> +		raw_spin_lock(&ctx->lock);
> +		perf_tp_event_target_task(count, record, regs, &data, ctx);
> +		raw_spin_unlock(&ctx->lock);
>  unlock:
>  		rcu_read_unlock();
>  	}
> @@ -9917,44 +9984,6 @@ void perf_tp_event(u16 event_type, u64 count, void *record, int entry_size,
>  }
>  EXPORT_SYMBOL_GPL(perf_tp_event);
>  
> -static void tp_perf_event_destroy(struct perf_event *event)
> -{
> -	perf_trace_destroy(event);
> -}
> -
> -static int perf_tp_event_init(struct perf_event *event)
> -{
> -	int err;
> -
> -	if (event->attr.type != PERF_TYPE_TRACEPOINT)
> -		return -ENOENT;
> -
> -	/*
> -	 * no branch sampling for tracepoint events
> -	 */
> -	if (has_branch_stack(event))
> -		return -EOPNOTSUPP;
> -
> -	err = perf_trace_init(event);
> -	if (err)
> -		return err;
> -
> -	event->destroy = tp_perf_event_destroy;
> -
> -	return 0;
> -}
> -
> -static struct pmu perf_tracepoint = {
> -	.task_ctx_nr	= perf_sw_context,
> -
> -	.event_init	= perf_tp_event_init,
> -	.add		= perf_trace_add,
> -	.del		= perf_trace_del,
> -	.start		= perf_swevent_start,
> -	.stop		= perf_swevent_stop,
> -	.read		= perf_swevent_read,
> -};
> -
>  #if defined(CONFIG_KPROBE_EVENTS) || defined(CONFIG_UPROBE_EVENTS)
>  /*
>   * Flags in config, used by dynamic PMU kprobe and uprobe
> 
> ---
