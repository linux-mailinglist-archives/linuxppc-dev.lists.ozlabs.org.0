Return-Path: <linuxppc-dev-bounces+lists+linuxppc-dev=lfdr.de@lists.ozlabs.org>
X-Original-To: lists+linuxppc-dev@lfdr.de
Delivered-To: lists+linuxppc-dev@lfdr.de
Received: from lists.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 611251DCD25
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 14:43:31 +0200 (CEST)
Received: from bilbo.ozlabs.org (lists.ozlabs.org [IPv6:2401:3900:2:1::3])
	by lists.ozlabs.org (Postfix) with ESMTP id 49STnC2bsXzDqb9
	for <lists+linuxppc-dev@lfdr.de>; Thu, 21 May 2020 22:43:27 +1000 (AEST)
X-Original-To: linuxppc-dev@lists.ozlabs.org
Delivered-To: linuxppc-dev@lists.ozlabs.org
Authentication-Results: lists.ozlabs.org; spf=pass (sender SPF authorized)
 smtp.mailfrom=kernel.org (client-ip=198.145.29.99; helo=mail.kernel.org;
 envelope-from=frederic@kernel.org; receiver=<UNKNOWN>)
Authentication-Results: lists.ozlabs.org;
 dmarc=pass (p=none dis=none) header.from=kernel.org
Authentication-Results: lists.ozlabs.org; dkim=pass (1024-bit key;
 unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256
 header.s=default header.b=dTw9ChoU; dkim-atps=neutral
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by lists.ozlabs.org (Postfix) with ESMTPS id 49STkl26jGzDqXY
 for <linuxppc-dev@lists.ozlabs.org>; Thu, 21 May 2020 22:41:18 +1000 (AEST)
Received: from localhost (lfbn-ncy-1-985-231.w90-101.abo.wanadoo.fr
 [90.101.63.231])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 12EAA2070A;
 Thu, 21 May 2020 12:41:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1590064876;
 bh=igxjKFnhcuPmlFKYMli0yfykVd0eALHpcuoJKGGL0xg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dTw9ChoUj1HRmO17CmilmiPewiK4u2GM1zvZ5VH2Ttspv8+c75/gOAQ+BwEs+zH0v
 KGAwtvW5j3uPGp+f3zObwtDktr9w3RBkW8K/HeVpEyiW6dTi7MEq6u/M+uDWuj4yQ3
 aKUdBlgX2q61gCSMhHLXgRjQlawM73EgnAMR0gQ8=
Date: Thu, 21 May 2020 14:41:14 +0200
From: Frederic Weisbecker <frederic@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Subject: Re: Endless soft-lockups for compiling workload since next-20200519
Message-ID: <20200521124113.GC15455@lenoir>
References: <CAG=TAF6jUsQrW-fjbS3vpjkMfn8=MUDsuQxjk3NMfvQa250RHA@mail.gmail.com>
 <20200520125056.GC325280@hirez.programming.kicks-ass.net>
 <20200521004035.GA15455@lenoir>
 <20200521093938.GG325280@hirez.programming.kicks-ass.net>
 <20200521104937.GB325303@hirez.programming.kicks-ass.net>
 <20200521110027.GC325303@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200521110027.GC325303@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
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

On Thu, May 21, 2020 at 01:00:27PM +0200, Peter Zijlstra wrote:
> On Thu, May 21, 2020 at 12:49:37PM +0200, Peter Zijlstra wrote:
> > On Thu, May 21, 2020 at 11:39:39AM +0200, Peter Zijlstra wrote:
> > > On Thu, May 21, 2020 at 02:40:36AM +0200, Frederic Weisbecker wrote:
> > 
> > > This:
> > > 
> > > >         smp_call_function_single_async() {             smp_call_function_single_async() {
> > > >             // verified csd->flags != CSD_LOCK             // verified csd->flags != CSD_LOCK
> > > >             csd->flags = CSD_LOCK                          csd->flags = CSD_LOCK
> > > 
> > > concurrent smp_call_function_single_async() using the same csd is what
> > > I'm looking at as well.
> > 
> > So something like this ought to cure the fundamental problem and make
> > smp_call_function_single_async() more user friendly, but also more
> > expensive.
> > 
> > The problem is that while the ILB case is easy to fix, I can't seem to
> > find an equally nice solution for the ttwu_remote_queue() case; that
> > would basically require sticking the wake_csd in task_struct, I'll also
> > post that.
> > 
> > So it's either this:
> 
> Or this:
> 
> ---
>  include/linux/sched.h | 4 ++++
>  kernel/sched/core.c   | 7 ++++---
>  kernel/sched/fair.c   | 2 +-
>  kernel/sched/sched.h  | 1 -
>  4 files changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index f38d62c4632c..136ee400b568 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -696,6 +696,10 @@ struct task_struct {
>  	struct uclamp_se		uclamp[UCLAMP_CNT];
>  #endif
>  
> +#ifdef CONFIG_SMP
> +	call_single_data_t		wake_csd;
> +#endif
> +
>  #ifdef CONFIG_PREEMPT_NOTIFIERS
>  	/* List of struct preempt_notifier: */
>  	struct hlist_head		preempt_notifiers;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 5b286469e26e..a7129652e89b 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2320,7 +2320,7 @@ static void ttwu_queue_remote(struct task_struct *p, int cpu, int wake_flags)
>  
>  	if (llist_add(&p->wake_entry, &rq->wake_list)) {
>  		if (!set_nr_if_polling(rq->idle))
> -			smp_call_function_single_async(cpu, &rq->wake_csd);
> +			smp_call_function_single_async(cpu, &p->wake_csd);
>  		else
>  			trace_sched_wake_idle_without_ipi(cpu);
>  	}
> @@ -2921,6 +2921,9 @@ int sched_fork(unsigned long clone_flags, struct task_struct *p)
>  #endif
>  #if defined(CONFIG_SMP)
>  	p->on_cpu = 0;
> +	p->wake_csd = (struct __call_single_data) {
> +		.func = wake_csd_func,
> +	};
>  #endif
>  	init_task_preempt_count(p);
>  #ifdef CONFIG_SMP
> @@ -6723,8 +6726,6 @@ void __init sched_init(void)
>  		rq->avg_idle = 2*sysctl_sched_migration_cost;
>  		rq->max_idle_balance_cost = sysctl_sched_migration_cost;
>  
> -		rq_csd_init(rq, &rq->wake_csd, wake_csd_func);
> -
>  		INIT_LIST_HEAD(&rq->cfs_tasks);
>  
>  		rq_attach_root(rq, &def_root_domain);
> diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> index 01f94cf52783..b6d8a7b991f0 100644
> --- a/kernel/sched/fair.c
> +++ b/kernel/sched/fair.c
> @@ -10033,7 +10033,7 @@ static void kick_ilb(unsigned int flags)
>  	 * is idle. And the softirq performing nohz idle load balance
>  	 * will be run before returning from the IPI.
>  	 */
> -	smp_call_function_single_async(ilb_cpu, &cpu_rq(ilb_cpu)->nohz_csd);
> +	smp_call_function_single_async(ilb_cpu, &this_rq()->nohz_csd);

My fear here is that if a previous call from the the same CPU but to another
target is still pending, the new one will be spuriously ignored.

Namely this could happen:

CPU 0                                      CPU 1
-----                                      -----
                                           local_irq_disable() or VMEXIT
kick_ilb() {
    smp_call_function_single_async(CPU 1,      
                 &this_rq()->nohz_csd);
}

kick_ilb() {
    smp_call_function_single_async(CPU 2,      
                 &this_rq()->nohz_csd) {
        // IPI to CPU 2 ignored
        if (csd->flags == CSD_LOCK)
            return -EBUSY;
    }
}

                                            local_irq_enable();




But I believe we can still keep the remote csd if nohz_flags() are
strictly only set before the IPI and strictly only cleared from it.

And I still don't understand why trigger_load_balance() raise the
softirq without setting the current CPU as ilb. run_rebalance_domains()
thus ignores it most of the time in the end or it spuriously clear the
nohz_flags set by an IPI sender. Or there is something I misunderstood
there.

(Haven't checked the wake up case yet).
