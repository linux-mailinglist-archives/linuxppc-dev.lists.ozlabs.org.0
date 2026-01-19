Return-Path: <linuxppc-dev+bounces-15986-lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2404:9400:21b9:f100::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00F2DD3A989
	for <lists+linuxppc-dev@lfdr.de>; Mon, 19 Jan 2026 13:54:23 +0100 (CET)
Received: from boromir.ozlabs.org (localhost [127.0.0.1])
	by lists.ozlabs.org (Postfix) with ESMTP id 4dvr4p4Q66z2xjb;
	Mon, 19 Jan 2026 23:54:18 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; arc=none smtp.remote-ip="2001:8b0:10b:1236::1"
ARC-Seal: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707; t=1768827258;
	cv=none; b=ctryMbgSC7kKvQ/gSZpi4ITBUE6OFIN4/BZS6qXkXhA7K5GbDomllf9FY9WRoVe5xWf6kgs6M0Dc2snddJnPtBj1Lk9g+35gzkraUchAnWjJpAKLppfH6v+caPQ0T9X8vtYp47P1QDq11N/jLnkrlQgMaMH6ytMf2LPKpmUx4siAlquYg5ONvV0VsrO3HoHD+7gCzv2T6ofWgbG8Hf/nFLrwjXoDM2yzeTeyvdq8wZp7GA/zOcfPRxdePt7mdYWnhahm6QCyiNikKnJh7CrvNz9FpHHyzvZ5A4H4o/p5OZJeFL0HjQoTQYJfsHh991XLmxWKC92Hwqwwpw4wYYBASg==
ARC-Message-Signature: i=1; a=rsa-sha256; d=lists.ozlabs.org; s=201707;
	t=1768827258; c=relaxed/relaxed;
	bh=kMRIv+5PhMX2w16KgQw853ivOAJWaId7zAyJ1dkF8Fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPn/X6zLGwx8/GbWbM1EFmicKW3y36v1DKOfEY7pi8o0tnRC/lOdRXqDhOYgex90lQJCIFiLljztjSF38wMtqc3HAs763X54fHLPUCg+m35NOGvbrmPCObxJs/8RW058ujSHJg/ButKBKv7LCa2b899s9VMzFmCCBHTCNrnWj0mF11xAehQl5MUjHdboBztJfRuGZAeZoDQvuiZVPkG0poT64LryKgQzbML0+JpMqukdWGK0qG8VgYnRC3QslQI2+ZJ/Ho5zNqD/5tcmIQVhWp2cbp7HEUjrdJtQHM4B9kdFDoypcwGxeS1RVaU8bsK2h/4RuFGOL0115H68mJV4bQ==
ARC-Authentication-Results: i=1; lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org; dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vJqhYbqP; dkim-atps=neutral; spf=none (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org) smtp.mailfrom=infradead.org
Authentication-Results: lists.ozlabs.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org;
	dkim=pass (2048-bit key; secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=vJqhYbqP;
	dkim-atps=neutral
Authentication-Results: lists.ozlabs.org; spf=none (no SPF record) smtp.mailfrom=infradead.org (client-ip=2001:8b0:10b:1236::1; helo=casper.infradead.org; envelope-from=peterz@infradead.org; receiver=lists.ozlabs.org)
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lists.ozlabs.org (Postfix) with ESMTPS id 4dvr4j0m2Nz2xHW
	for <linuxppc-dev@lists.ozlabs.org>; Mon, 19 Jan 2026 23:54:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=kMRIv+5PhMX2w16KgQw853ivOAJWaId7zAyJ1dkF8Fs=; b=vJqhYbqP6wfcMsUoLbLcFpjsau
	pI7huCZ4tlxvsg+DVviYeVT2rAjpCdlgMX0xhW6Apw02NRK/rB2eg/iW4NnwEOO0kAErfvYFSPWk9
	734l0Za/d9cxaeQK2uT1eINH9rhHpbR9GKb152FQimp1T2wZb+GGvuUYykgCLszN3VtJW8Lzk4A5U
	I7HWRPBi6JP+TQUFwkIhfciFA57j87zbbzYyjAm85/XKFLKNDHEaIovIzqXa5vwraVeJilH+RIe5m
	eHQCATVnjsYDQz4I6tW/xtza4HMqyNN3M3/QWvIp7iiSqaDuctm2odTrkTJ0rdobU+uL9iBncrkK9
	qn/+5T6Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vholQ-0000000DJVY-0Yog;
	Mon, 19 Jan 2026 12:53:48 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id A58743006CD; Mon, 19 Jan 2026 13:53:47 +0100 (CET)
Date: Mon, 19 Jan 2026 13:53:47 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Ben Segall <bsegall@google.com>, Boqun Feng <boqun.feng@gmail.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Heiko Carstens <hca@linux.ibm.com>, Ingo Molnar <mingo@redhat.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Kieran Bingham <kbingham@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mel Gorman <mgorman@suse.de>, Michael Ellerman <mpe@ellerman.id.au>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Uladzislau Rezki <urezki@gmail.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Xin Zhao <jackzxcui1989@163.com>, linux-pm@vger.kernel.org,
	linux-s390@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH 01/15] sched/idle: Handle offlining first in idle loop
Message-ID: <20260119125347.GT830755@noisy.programming.kicks-ass.net>
References: <20260116145208.87445-1-frederic@kernel.org>
 <20260116145208.87445-2-frederic@kernel.org>
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
In-Reply-To: <20260116145208.87445-2-frederic@kernel.org>
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE
	autolearn=disabled version=4.0.1 OzLabs 8
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on lists.ozlabs.org

On Fri, Jan 16, 2026 at 03:51:54PM +0100, Frederic Weisbecker wrote:

>  kernel/sched/idle.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
> 
> diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
> index c174afe1dd17..35d79af3286d 100644
> --- a/kernel/sched/idle.c
> +++ b/kernel/sched/idle.c
> @@ -260,6 +260,12 @@ static void do_idle(void)
>  {
>  	int cpu = smp_processor_id();
>  
> +	if (cpu_is_offline(cpu)) {

Does it make sense to make that: if (unlikely(cpu_is_offline(cpu))) ?

> +		local_irq_disable();

Also, do we want something like:

		WARN_ON_ONCE(need_resched());

?

> +		cpuhp_report_idle_dead();
> +		arch_cpu_idle_dead();
> +	}
> +
>  	/*
>  	 * Check if we need to update blocked load
>  	 */
> @@ -311,11 +317,6 @@ static void do_idle(void)
>  		 */
>  		local_irq_disable();
>  
> -		if (cpu_is_offline(cpu)) {
> -			cpuhp_report_idle_dead();
> -			arch_cpu_idle_dead();
> -		}
> -
>  		arch_cpu_idle_enter();
>  		rcu_nocb_flush_deferred_wakeup();
>  
> -- 
> 2.51.1
> 

