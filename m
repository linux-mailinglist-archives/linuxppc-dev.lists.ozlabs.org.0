Return-Path: <linuxppc-dev+bounces-14652-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [112.213.38.117])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA53CA84E6
	for <lists+linuxppc-dev@lfdr.de>; Fri, 05 Dec 2025 17:04:13 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dNGQf1pmpz2y7b;
	Sat, 06 Dec 2025 03:04:10 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1764950650;
	cv=none; b=W0JAHTJZu6dmLnwvmpcwjcjbJqGqf5mRD6BdCaIggzqlAMimyGJ+n9zCSWrcYyrWfuuvDisMzcA6BE8NlaA/jUM8wx+Ofye60tR451os7buPtHupeJfYW8kP5kFXxr0wxlVhIQvJ+DW1c8GzF0WHSXv6r5Ad5KZUTMk2E96fFcpLhwVODXaLq5tuA8vb7q/KzufpDitCC3lPfsXp8+izZd0qM86Bssf2Fa+y1yPJJ3XFAZSmz6yp5TGlCnplkqMXaEBi30endaWinWp9Laxn/HN2RedCqU6ejokuQIpLhUNcIish339gHMWMWRZglPaldditRYd6GKHso7GTSHdgKw==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1764950650; c=relaxed/relaxed;
	bh=O2XwwJOH6ID2KTGfUPig7IAOjY7ik8syIuFJLCrFZsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=btyu5e8IHqV5CZEZJ+x93B4Qa3QyNmnl9uh2++MY9oG9G1PQZfGNvjixBX/oAruJmySEedJLr5CcMjZcjiti7pSVYU3hevmpKUmmF4hJYVDO3sw9pl2srToHxNpJU42g0gNn4vKrl9zkONO8TAuhKRWUed1QhZm6SsMHXBOQhbY9XUa6+NezgVC3wmPw/fk671W/gSFcMjPbAgnEZIzzbRfyAoo+yN3B9xSJ46YtN63SH7x7JAhbD3LHLl0MJoxgAq0zuuKZGskTQ4WwNUNBNwhMansTN8ieSpBFAuWhlHwKpE8Rv/nr1jWq68XJYcP9mcOwsNUmt1AEORnnaTne2A==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XZT8TMJL; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=XZT8TMJL;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dNGQW1Nqnz2xrk
	for <linuxppc-dev@lists.ozlabs.org>; Sat, 06 Dec 2025 03:03:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=O2XwwJOH6ID2KTGfUPig7IAOjY7ik8syIuFJLCrFZsM=; b=XZT8TMJLJlodKVHuJqbR8fDWBb
	wmDBIUFBCQLzqfbfdnqTkJIuhgpGH2enuLja4p45aH+xSleZBwjjTePR3hejPKpQacwaZS37DzG3P
	VLyWXI6bgG2FY2KRybG6Z4IWQslyQX0CSGLlqdY3c9mXk6raOpsEuAL1v59tglQ2OKAt4ABe7iSlO
	oc5k1e5mjcY1lcYct/OOu9/oI3M8cuTqciEC1E3tXfK2dC65okBPjd8TU7u885fj6l4+I0z+6l/KM
	iv1UiZJyKvzLtm5RSGBkg2Jh3HJAneUjCuTaPMharkDFNrCNcvycNr3mIhO7ngMlkAbSEnjbR2xSd
	GiDVtexg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRYHH-00000005uqU-34rg;
	Fri, 05 Dec 2025 16:03:27 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9CE533003C4; Fri, 05 Dec 2025 17:03:26 +0100 (CET)
Date: Fri, 5 Dec 2025 17:03:26 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	Ben Segall <bsegall@google.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@kernel.org>, Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Swapnil Sapkal <swapnil.sapkal@amd.com>,
	Thomas Huth <thuth@redhat.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	virtualization@lists.linux.dev,
	Yicong Yang <yangyicong@hisilicon.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>
Subject: Re: [PATCH 08/17] sched/core: Implement CPU soft offline/online
Message-ID: <20251205160326.GF2528459@noisy.programming.kicks-ass.net>
References: <20251204175405.1511340-1-srikar@linux.ibm.com>
 <20251204175405.1511340-9-srikar@linux.ibm.com>
X-Mailing-List: linuxppc-dev@lists.ozlabs.org
List-Id: <linuxppc-dev.lists.ozlabs.org>
List-Help: <mailto:linuxppc-dev+help@lists.ozlabs.org>
List-Owner: <mailto:linuxppc-dev+owner@lists.ozlabs.org>
List-Post: <mailto:linuxppc-dev@lists.ozlabs.org>
List-Archive: <https://lore.kernel.org/linuxppc-dev/>,
  <https://lists.ozlabs.org/pipermail/linuxppc-dev/>
List-Subscribe: <mailto:linuxppc-dev+subscribe@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-digest@lists.ozlabs.org>,
  <mailto:linuxppc-dev+subscribe-nomail@lists.ozlabs.org>
List-Unsubscribe: <mailto:linuxppc-dev+unsubscribe@lists.ozlabs.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204175405.1511340-9-srikar@linux.ibm.com>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Thu, Dec 04, 2025 at 11:23:56PM +0530, Srikar Dronamraju wrote:

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 89efff1e1ead..f66fd1e925b0 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8177,13 +8177,16 @@ static void balance_push(struct rq *rq)
>  	 * Only active while going offline and when invoked on the outgoing
>  	 * CPU.
>  	 */
> -	if (!cpu_dying(rq->cpu) || rq != this_rq())
> +	if (cpu_active(rq->cpu) || rq != this_rq())
>  		return;
>  
>  	/*
> -	 * Ensure the thing is persistent until balance_push_set(.on = false);
> +	 * Unless soft-offline, Ensure the thing is persistent until
> +	 * balance_push_set(.on = false); In case of soft-offline, just
> +	 * enough to push current non-pinned tasks out.
>  	 */
> -	rq->balance_callback = &balance_push_callback;
> +	if (cpu_dying(rq->cpu) || rq->nr_running)
> +		rq->balance_callback = &balance_push_callback;
>  
>  	/*
>  	 * Both the cpu-hotplug and stop task are in this case and are
> @@ -8392,6 +8395,8 @@ static inline void sched_smt_present_dec(int cpu)
>  #endif
>  }
>  
> +static struct cpumask cpu_softoffline_mask;
> +
>  int sched_cpu_activate(unsigned int cpu)
>  {
>  	struct rq *rq = cpu_rq(cpu);
> @@ -8411,7 +8416,10 @@ int sched_cpu_activate(unsigned int cpu)
>  	if (sched_smp_initialized) {
>  		sched_update_numa(cpu, true);
>  		sched_domains_numa_masks_set(cpu);
> -		cpuset_cpu_active();
> +
> +		/* For CPU soft-offline, dont need to rebuild sched-domains */
> +		if (!cpumask_test_cpu(cpu, &cpu_softoffline_mask))
> +			cpuset_cpu_active();
>  	}
>  
>  	scx_rq_activate(rq);
> @@ -8485,7 +8493,11 @@ int sched_cpu_deactivate(unsigned int cpu)
>  		return 0;
>  
>  	sched_update_numa(cpu, false);
> -	cpuset_cpu_inactive(cpu);
> +
> +	/* For CPU soft-offline, dont need to rebuild sched-domains */
> +	if (!cpumask_test_cpu(cpu, &cpu_softoffline_mask))
> +		cpuset_cpu_inactive(cpu);
> +
>  	sched_domains_numa_masks_clear(cpu);
>  	return 0;
>  }
> @@ -10928,3 +10940,25 @@ void sched_enq_and_set_task(struct sched_enq_and_set_ctx *ctx)
>  		set_next_task(rq, ctx->p);
>  }
>  #endif /* CONFIG_SCHED_CLASS_EXT */
> +
> +void set_cpu_softoffline(int cpu, bool soft_offline)
> +{
> +	struct sched_domain *sd;
> +
> +	if (!cpu_online(cpu))
> +		return;
> +
> +	cpumask_set_cpu(cpu, &cpu_softoffline_mask);
> +
> +	rcu_read_lock();
> +	for_each_domain(cpu, sd)
> +		update_group_capacity(sd, cpu);
> +	rcu_read_unlock();
> +
> +	if (soft_offline)
> +		sched_cpu_deactivate(cpu);
> +	else
> +		sched_cpu_activate(cpu);
> +
> +	cpumask_clear_cpu(cpu, &cpu_softoffline_mask);
> +}

What happens if you then offline one of these softoffline CPUs? Doesn't
that do sched_cpu_deactivate() again?

Also, the way this seems to use softoffline_mask is as a hidden argument
to sched_cpu_{de,}activate() instead of as an actual mask.

Moreover, there does not seem to be any sort of serialization vs
concurrent set_cpu_softoffline() callers. At the very least
update_group_capacity() would end up with indeterminate results.

This all doesn't look 'robust'.

