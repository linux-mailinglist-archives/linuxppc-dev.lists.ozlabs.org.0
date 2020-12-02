Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [203.11.71.2])
	by mail.lfdr.de (Postfix) with ESMTPS id DCA972CBD45
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 13:49:03 +0100 (CET)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 4CmJgb6DThzDqSY
	for <lists+linuxppc-dev@lfdr.de>; Wed,  2 Dec 2020 23:48:59 +1100 (AEDT)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org;
 spf=none (no SPF record) smtp.mailfrom=infradead.org
 (client-ip=2001:8b0:10b:1231::1; helo=merlin.infradead.org;
 envelope-from=peterz@infradead.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: lists.ozlabs.org; dkim=pass (2048-bit key;
 secure) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256
 header.s=merlin.20170209 header.b=holGE3HH; 
 dkim-atps=neutral
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 4CmJbf1C1TzDqgj
 for <linuxppc-dev@lists.ozlabs.org>; Wed,  2 Dec 2020 23:45:33 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=h8OFn1f4rN5V534vygyf7uXjyFm0rtIR0TiLL9ElMpE=; b=holGE3HHKSUGIf0MMwr+/aM+qs
 FTNKPPXCxqVAY1s9pQKziuNBFrbP70W8+ZvdIMJroEiNwmrXozoIpAUZR/GV1yh3VESZ2MpDeAJRI
 RLkV3mo+oOqWE6hc7LgRr1jwJdcjnLfXpa9cty+bXSyzGJ3d9ruZPbDKSSPB2dFPb4sKj/dSDdB3d
 mvQJh7CkL1vepEOPZt2GA0Ly300hbL9J8oFFMGEk5GGrV202e3qSNXweEzPECETXURfWxBcGNFMi9
 UNg2132ny9LyyXy8sG4nBgpRx6mYDp4i31b+pPxpPKfj+Ux54teqDFT81lWSGBsDsM/IQpdYzVv52
 o8k/PYAQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=noisy.programming.kicks-ass.net)
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkRVa-000141-5Z; Wed, 02 Dec 2020 12:45:22 +0000
Received: from hirez.programming.kicks-ass.net
 (hirez.programming.kicks-ass.net [192.168.1.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client did not present a certificate)
 by noisy.programming.kicks-ass.net (Postfix) with ESMTPS id A93A23035D4;
 Wed,  2 Dec 2020 13:45:19 +0100 (CET)
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
 id 82E5B2143477D; Wed,  2 Dec 2020 13:45:19 +0100 (CET)
Date: Wed, 2 Dec 2020 13:45:19 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 6/8] lazy tlb: shoot lazies, a non-refcounting lazy tlb
 option
Message-ID: <20201202124519.GP3092@hirez.programming.kicks-ass.net>
References: <20201128160141.1003903-1-npiggin@gmail.com>
 <20201128160141.1003903-7-npiggin@gmail.com>
 <20201202111731.GA2414@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201202111731.GA2414@hirez.programming.kicks-ass.net>
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
Cc: linux-arch@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 linuxppc-dev@lists.ozlabs.org
Errors-To: linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org
Sender: "Linuxppc-dev"
 <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>

On Wed, Dec 02, 2020 at 12:17:31PM +0100, Peter Zijlstra wrote:

> So the obvious 'improvement' here would be something like:
> 
> 	for_each_online_cpu(cpu) {
> 		p = rcu_dereference(cpu_rq(cpu)->curr;
> 		if (p->active_mm != mm)
> 			continue;
> 		__cpumask_set_cpu(cpu, tmpmask);
> 	}
> 	on_each_cpu_mask(tmpmask, ...);
> 
> The remote CPU will never switch _to_ @mm, on account of it being quite
> dead, but it is quite prone to false negatives.
> 
> Consider that __schedule() sets rq->curr *before* context_switch(), this
> means we'll see next->active_mm, even though prev->active_mm might still
> be our @mm.
> 
> Now, because we'll be removing the atomic ops from context_switch()'s
> active_mm swizzling, I think we can change this to something like the
> below. The hope being that the cost of the new barrier can be offset by
> the loss of the atomics.
> 
> Hmm ?
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 41404afb7f4c..2597c5c0ccb0 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -4509,7 +4509,6 @@ context_switch(struct rq *rq, struct task_struct *prev,
>  	if (!next->mm) {                                // to kernel
>  		enter_lazy_tlb(prev->active_mm, next);
>  
> -		next->active_mm = prev->active_mm;
>  		if (prev->mm)                           // from user
>  			mmgrab(prev->active_mm);
>  		else
> @@ -4524,6 +4523,7 @@ context_switch(struct rq *rq, struct task_struct *prev,
>  		 * case 'prev->active_mm == next->mm' through
>  		 * finish_task_switch()'s mmdrop().
>  		 */
> +		next->active_mm = next->mm;
>  		switch_mm_irqs_off(prev->active_mm, next->mm, next);

I think that next->active_mm store should be after switch_mm(),
otherwise we still race.

>  
>  		if (!prev->mm) {                        // from kernel
> @@ -5713,11 +5713,9 @@ static void __sched notrace __schedule(bool preempt)
>  
>  	if (likely(prev != next)) {
>  		rq->nr_switches++;
> -		/*
> -		 * RCU users of rcu_dereference(rq->curr) may not see
> -		 * changes to task_struct made by pick_next_task().
> -		 */
> -		RCU_INIT_POINTER(rq->curr, next);
> +
> +		next->active_mm = prev->active_mm;
> +		rcu_assign_pointer(rq->curr, next);
>  		/*
>  		 * The membarrier system call requires each architecture
>  		 * to have a full memory barrier after updating
