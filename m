Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D8C596EEB
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 15:04:24 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4M77Wp0FnJz3cPl
	for <lists+linuxppc-dev@lfdr.de>; Wed, 17 Aug 2022 23:04:22 +1000 (AEST)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TUYGDjo5;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1:d65d:64ff:fe57:4e05; helo=desiato.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=TUYGDjo5;
	dkim-atps=neutral
Received: from desiato.infradead.org (desiato.infradead.org [IPv6:2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4M77WD3VQJz2yMk
	for <linuxppc-dev@lists.ozlabs.org>; Wed, 17 Aug 2022 23:03:52 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8tSVbs/LntHCfdjrxtk7ceXw6TPtMo4nIYUkIIRtVa4=; b=TUYGDjo5Eb2C+vokB8lSzbnHTV
	FxOXCuCCTso8IKA26Dds1MHiVap25aWsBqDfMrSAfdetz5F38Njwrq7LSinw80hTP1RQ8VwP8qy0v
	7nRsJ9iJd9DpyBqYujIGvKYSJahc/HW6bsUkkcTOydv1t4XrhRac50TnUR6TepqFHAZfx1WHAPaz2
	9T/QLjxx2nykjKy9HbBQ8OibboBOKmwBLlH4IsSqotH1UU7wt5BZ0CstHJkqDCeYkuT+Ac1jQq+vt
	MlxLdvXedqGnarZIbn+D2o5PGLGOEVupFFTe7erGNcfxZ4C6okDm8ETszLbb9v3vt4+VyxJftLprh
	59bIzbvQ==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=worktop.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOIht-003I0R-UD; Wed, 17 Aug 2022 13:03:41 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
	id 84568980256; Wed, 17 Aug 2022 15:03:37 +0200 (CEST)
Date: Wed, 17 Aug 2022 15:03:37 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Marco Elver <elver@google.com>
Subject: Re: [PATCH v3 11/14] perf/hw_breakpoint: Reduce contention with
 large number of tasks
Message-ID: <YvznKYgRKjDRSMkT@worktop.programming.kicks-ass.net>
References: <20220704150514.48816-1-elver@google.com>
 <20220704150514.48816-12-elver@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704150514.48816-12-elver@google.com>
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
Cc: Mark Rutland <mark.rutland@arm.com>, linux-sh@vger.kernel.org, Alexander Shishkin <alexander.shishkin@linux.intel.com>, Frederic Weisbecker <frederic@kernel.org>, x86@kernel.org, linuxppc-dev@lists.ozlabs.org, Arnaldo Carvalho de Melo <acme@kernel.org>, linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, kasan-dev@googlegroups.com, Namhyung Kim <namhyung@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Jiri Olsa <jolsa@redhat.com>, Ingo Molnar <mingo@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev" <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Mon, Jul 04, 2022 at 05:05:11PM +0200, Marco Elver wrote:
> +static bool bp_constraints_is_locked(struct perf_event *bp)
> +{
> +	struct mutex *tsk_mtx = get_task_bps_mutex(bp);
> +
> +	return percpu_is_write_locked(&bp_cpuinfo_sem) ||
> +	       (tsk_mtx ? mutex_is_locked(tsk_mtx) :
> +			  percpu_is_read_locked(&bp_cpuinfo_sem));
> +}

> @@ -426,18 +521,28 @@ static int modify_bp_slot(struct perf_event *bp, u64 old_type, u64 new_type)
>   */
>  int dbg_reserve_bp_slot(struct perf_event *bp)
>  {
> -	if (mutex_is_locked(&nr_bp_mutex))
> +	int ret;
> +
> +	if (bp_constraints_is_locked(bp))
>  		return -1;
>  
> -	return __reserve_bp_slot(bp, bp->attr.bp_type);
> +	/* Locks aren't held; disable lockdep assert checking. */
> +	lockdep_off();
> +	ret = __reserve_bp_slot(bp, bp->attr.bp_type);
> +	lockdep_on();
> +
> +	return ret;
>  }
>  
>  int dbg_release_bp_slot(struct perf_event *bp)
>  {
> -	if (mutex_is_locked(&nr_bp_mutex))
> +	if (bp_constraints_is_locked(bp))
>  		return -1;
>  
> +	/* Locks aren't held; disable lockdep assert checking. */
> +	lockdep_off();
>  	__release_bp_slot(bp, bp->attr.bp_type);
> +	lockdep_on();
>  
>  	return 0;
>  }

Urggghhhh... this is horrible crap. That is, the current code is that
and this makes it worse :/

