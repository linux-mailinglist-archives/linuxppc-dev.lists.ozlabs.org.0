Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id F40555F9C7E
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 12:15:51 +0200 (CEST)
Received: from boromir.ozlabs.org (localhost [IPv6:::1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4MmFDP6hsgz3drx
	for <lists+linuxppc-dev@lfdr.de>; Mon, 10 Oct 2022 21:15:49 +1100 (AEDT)
Authentication-Results: lists.ozlabs.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=gZPg5tHv;
	dkim-atps=neutral
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4MmFCM6K0Hz2yxw
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 10 Oct 2022 21:14:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=HPidJK9k0wDj5SKTPSWA/1fb2xWJmy1rprDVNz5gd7I=; b=gZPg5tHvpsY0bShNV9wsEEgKzL
	JRcE92EijJ+834KzNf4yHcapJ0hmZIzBsOs1iJJf2o8DPH+7tLJl7xpUpC4ILJ0EgFxvypPoxwPQS
	Ui0s3kNXhjHb5xf3YtykfLjUFUuIE3oI2vRyAWAGkmtMp/rUR9JlTu5XKrCj5lcXrvl1T/FTb9kF4
	XpNxRKqVTksqhCKqSRBJ2I7jQLs42ALK7yx950VZ6Bno7tlRTEb6tCQLnZ8V2850A4JBeYzGwdxmz
	cB7sVWx5zACwknyQTBTKjYT01aJ58pvGMpg5bHg6113Xy0JDD9W6pchvv8I35x+bvrpMOAwIiJO9v
	9GwnBM2w==;
Received: from j130084.upc-j.chello.nl ([24.132.130.84] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ohpnq-0048Q4-3g; Mon, 10 Oct 2022 10:14:30 +0000
Received: from hirez.programming.kicks-ass.net (hirez.programming.kicks-ass.net [192.168.1.225])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id 8F80E300465;
	Mon, 10 Oct 2022 12:14:24 +0200 (CEST)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
	id 5EB4F2022F86C; Mon, 10 Oct 2022 12:14:24 +0200 (CEST)
Date: Mon, 10 Oct 2022 12:14:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ravi Bangoria <ravi.bangoria@amd.com>
Subject: Re: [PATCH] perf: Rewrite core context handling
Message-ID: <Y0PwgBz6asJOHSan@hirez.programming.kicks-ass.net>
References: <20220829113347.295-1-ravi.bangoria@amd.com>
 <e1d933d1-4772-1357-9cf1-6e5b842508c8@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1d933d1-4772-1357-9cf1-6e5b842508c8@amd.com>
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

On Wed, Sep 07, 2022 at 04:58:49PM +0530, Ravi Bangoria wrote:
> > -static void
> > -ctx_flexible_sched_in(struct perf_event_context *ctx,
> > -		      struct perf_cpu_context *cpuctx)
> > +/* XXX .busy thingy from Peter's patch */
> > +static void ctx_flexible_sched_in(struct perf_event_context *ctx, struct pmu *pmu)
> 
> This one turned out to be very easy. Given that, we iterate over each
> pmu, we can just return error if we fail to schedule any flexible event.
> (It wouldn't be straight forward like this if we needed to implement
> pmu=NULL optimization.)
> 
> ---
> diff --git a/kernel/events/core.c b/kernel/events/core.c
> index e0232e0bb74e..923656af73fe 100644
> --- a/kernel/events/core.c
> +++ b/kernel/events/core.c
> @@ -3751,6 +3751,7 @@ static int merge_sched_in(struct perf_event *event, void *data)
>  			cpc = this_cpu_ptr(event->pmu_ctx->pmu->cpu_pmu_context);
>  			perf_mux_hrtimer_restart(cpc);
>  			group_update_userpage(event);
> +			return -EBUSY;
>  		}
>  	}
>  

I'm afraid this breaks things; consider:

  f79256532682 ("perf/core: fix userpage->time_enabled of inactive events")

I totally hate this -- because it means we *HAVE* to iterate the
inactive events, but alas.
